#include "Constant.hpp"
#include "Instruction.hpp"
#include "Value.hpp"
#include <codecvt>
#include <list>
#include <type_traits>
#include <optional>
#include "CodeGenUtil.hpp"
#include "../../include/passes/LoopUnrolling.hpp"

using namespace std;

std::optional <LoopUnrolling::SimpleLoopInfo>
LoopUnrolling::parse_simple_loop(BasicBlock *header, const LoopInfo &loop) {
    SimpleLoopInfo ret;

    // parse header
    ret.header = header;
    ret.bbs = loop.bbs;

    // parse body
    for (auto &&bb : loop.bbs) {
        if (bb != header) {
            ret.bodies.insert(bb);
        }
    }

    if (loop.sub_loops.size() > 0) {
        return nullopt;
    }

    if (loop.latches.size() > 1) {
        return nullopt;
    }

    // the loop has too many exiting edges
    if (loop.exits.size() > 1) {
        return nullopt;
    }

    // the exiting bb is not header
    auto [exiting, exit] = *loop.exits.begin();
    if (exiting != header) {
        return nullopt;
    }

    // parse exit
    ret.exit = exit;

    // parse preheader
    ret.preheader = loop.preheader;

    // induction var
    auto br_inst = dynamic_cast<BranchInst *>(&ret.header->get_instructions().back());
    assert(br_inst->get_num_operand() == 3);
    auto cond = br_inst->get_operand(0);
    // the induction variable should be of int type
    if (not dynamic_cast<Instruction*>(cond)->is_cmp()){
        return nullopt;
    }

    auto icmp_inst = dynamic_cast<ICmpInst*>(cond);
    Instruction::OpID icmp_op = icmp_inst->get_instr_type();
    auto lhs = icmp_inst->get_operand(0);
    auto rhs = icmp_inst->get_operand(1);

    auto exit_cond = [&](bool is_ind_rhs) {
        Instruction::OpID opposite;
        if(icmp_op == Instruction::OpID::eq) opposite = Instruction::OpID::ne;
        else if (icmp_op == Instruction::OpID::ne) opposite = Instruction::OpID::eq;
        else if (icmp_op == Instruction::OpID::gt) opposite = Instruction::OpID::lt;
        else if (icmp_op == Instruction::OpID::lt) opposite = Instruction::OpID::gt;
        else if (icmp_op == Instruction::OpID::ge) opposite = Instruction::OpID::le;
        else if (icmp_op == Instruction::OpID::le) opposite = Instruction::OpID::ge;
        else throw unreachable_error{};
        auto op = is_ind_rhs ? opposite : icmp_op;
        if (br_inst->get_operand(1) == ret.exit) {
            // exit if cond is true
            return op;
        } else if (br_inst->get_operand(2) == ret.exit) {
            // exit if cond is false
            Instruction::OpID ret_op;
            if(op == Instruction::OpID::eq) ret_op = Instruction::OpID::ne;
            else if (op == Instruction::OpID::ne) ret_op = Instruction::OpID::eq;
            else if (op == Instruction::OpID::gt) ret_op = Instruction::OpID::le;
            else if (op == Instruction::OpID::lt) ret_op = Instruction::OpID::ge;
            else if (op == Instruction::OpID::ge) ret_op = Instruction::OpID::lt;
            else if (op == Instruction::OpID::le) ret_op = Instruction::OpID::gt;
            else throw unreachable_error{};
            return ret_op;
        } else {
            throw unreachable_error{};
        }
    };

    // at least one op should be mutable after constant folding
    assert(dynamic_cast<ConstantInt*>(lhs)==nullptr or dynamic_cast<ConstantInt*>(rhs) == nullptr);
    if (dynamic_cast<ConstantInt*>(lhs) != nullptr){
        ret.ind_var = rhs;
        ret.icmp_op = exit_cond(true);
        ret.bound = dynamic_cast<ConstantInt*>(lhs);
    } else if (dynamic_cast<ConstantInt*>(rhs) != nullptr) {
        ret.ind_var = lhs;
        ret.icmp_op = exit_cond(false);
        ret.bound = dynamic_cast<ConstantInt*>(rhs);
    } else 
    {
        return nullopt;
    }

    // find initial and step
    for (auto &&inst : header->get_instructions()) {
        if (dynamic_cast<PhiInst *>(&inst)==nullptr) {
            break;
        }
        if (&inst != ret.ind_var) {
            continue;
        }
        // the phi for induction variable
        auto phi_inst = dynamic_cast<PhiInst *>(&inst);
        // the phi should has two source, one from preheader and the other from
        // loop body
        assert(phi_inst->to_pairs().size() == 2);
        for (auto [value, source] : phi_inst->to_pairs()) {
            if (loop.bbs.find(source)!=loop.bbs.end()) {
                // step
                if (dynamic_cast<IBinaryInst *>(value) == nullptr) {
                    continue;
                }
                auto ibinary_inst = dynamic_cast<IBinaryInst *>(value);
                auto ibin_op = ibinary_inst->get_instr_op_name();
                if (ibin_op != "add") {
                    continue;
                }
                if (dynamic_cast<ConstantInt*>(ibinary_inst->get_operand(0)) and
                    ibinary_inst->get_operand(1) == ret.ind_var) {
                    ret.step = dynamic_cast<ConstantInt*>(ibinary_inst->get_operand(0));
                } else if (dynamic_cast<ConstantInt*>(ibinary_inst->get_operand(1)) and
                           ibinary_inst->get_operand(0) == ret.ind_var) {
                    ret.step = dynamic_cast<ConstantInt*>(ibinary_inst->get_operand(1));
                }
            } else {
                // initial
                if (dynamic_cast<ConstantInt *>(value) == nullptr) {
                    continue;
                }
                ret.initial = dynamic_cast<ConstantInt *>(value);
            }
        }
    }
    if (ret.initial == nullptr or ret.step == nullptr) {
        return nullopt;
    }

    return ret;
}

bool LoopUnrolling::should_unroll(const SimpleLoopInfo &simple_loop) {
    int initial = simple_loop.initial->get_value();
    int step = simple_loop.step->get_value();
    int bound = simple_loop.bound->get_value();

    long long inst_cnt{0};
    for (auto bb : simple_loop.bbs) {
        inst_cnt += bb->get_instructions().size();
    }

    int estimate = (bound - initial) / step;

    return inst_cnt * estimate < UNROLL_MAX;
}

void LoopUnrolling::unroll_simple_loop(const SimpleLoopInfo &simple_loop, Module *m_) {
    auto header = simple_loop.header;

    // topological sort
    vector<BasicBlock *> bodies_order;
    map<BasicBlock *, size_t> pre_cnt;
    for (auto bb : simple_loop.bodies) {
        if (std::find(bb->get_pre_basic_blocks().begin(), bb->get_pre_basic_blocks().end(), header)!=bb->get_pre_basic_blocks().end()) {
            pre_cnt[bb] = 0;
        } else {
            pre_cnt[bb] = bb->get_pre_basic_blocks().size();
        }
    }
    while (not pre_cnt.empty()) {
        bool changed{false};
        for (auto [bb, cnt] : pre_cnt) {
            if (cnt == 0) {
                bodies_order.push_back(bb);
                for (auto suc : bb->get_succ_basic_blocks()) {
                    if (suc != header) {
                        pre_cnt[suc]--;
                    }
                }
                pre_cnt.erase(bb);
                changed = true;
                break;
            }
        }
        assert(changed);
    }

    assert(bodies_order.size() == simple_loop.bodies.size());

    map<Value *, Value *> old2new, phi_dst2src;
    // set phi_var_map to initial value
    for (auto &inst : header->get_instructions()) {
        if (not dynamic_cast<PhiInst*>(&inst)) {
            break;
        }
        // the phi for induction variable
        auto phi_inst = dynamic_cast<PhiInst*>(&inst);
        // the phi should has two source, one from preheader and the other from
        // loop body
        assert(phi_inst->to_pairs().size() == 2);
        for (auto [value, source] : phi_inst->to_pairs()) {
            if (simple_loop.bbs.find(source)!=simple_loop.bbs.end()) {
                phi_dst2src.emplace(phi_inst, value);
            }
        }
        for (auto [value, source] : phi_inst->to_pairs()) {
            if (simple_loop.bbs.find(source)==simple_loop.bbs.end()) {
                old2new.emplace(phi_dst2src[phi_inst], value);
            }
        }
    }

    auto should_exit = [&](int i) {
        int bound = simple_loop.bound->get_value();
        switch (simple_loop.icmp_op) {
        case ICmpInst::OpID::eq:
            return i == bound;
        case ICmpInst::OpID::ne:
            return i != bound;
        case ICmpInst::OpID::lt:
            return i < bound;
        case ICmpInst::OpID::le:
            return i <= bound;
        case ICmpInst::OpID::gt:
            return i > bound;
        case ICmpInst::OpID::ge:
            return i >= bound;
        default:
            throw unreachable_error{};
        }
    };

    auto func = header->get_parent();

    auto clone_bbs = [&]() {
        for (auto bb : bodies_order) {
            old2new[bb] = BasicBlock::create(m_, "old2new_"+bb->get_name(), func);
            func->add_basic_block(dynamic_cast<BasicBlock*>(old2new[bb]));
        }
        old2new[header] = BasicBlock::create(m_, "old2new_"+header->get_name(), func);
        func->add_basic_block(dynamic_cast<BasicBlock*>(old2new[header]));
    };

    auto clone2bb = [&](BasicBlock *old_bb) {
        auto new_bb = dynamic_cast<BasicBlock*>(old2new.at(old_bb));
        for (auto &inst : old_bb->get_instructions()) {
            if (old_bb == header) {
                if (dynamic_cast<PhiInst*>(&inst)) {
                    old2new[&inst] = old2new[phi_dst2src[&inst]];
                    continue;
                } else if (dynamic_cast<BranchInst*>(&inst)) {
                    continue;
                }
            }
            auto new_inst = Instruction::clone_inst(&inst, new_bb);

            new_inst->set_operand_for_each_if(
                [&](Value *op) -> pair<bool, Value *> {
                    if (old2new.find(op)!=old2new.end())
                        return {true, old2new[op]};
                    else
                        return {false, nullptr};
                });
            old2new[&inst] = new_inst;
        }
    };

    auto unroll_exit = [&]() { return dynamic_cast<BasicBlock*>(old2new[header]); };
    auto unroll_entry = [&]() {
        if (old2new.find(static_cast<Value *>(bodies_order.front()))!=old2new.end()) {
            return dynamic_cast<BasicBlock*>(old2new[bodies_order.front()]);
        } else {
            return dynamic_cast<BasicBlock*>(old2new[header]);
        }
    };

    old2new[header] = BasicBlock::create(m_, "old2new_"+header->get_name(), func);
    func->add_basic_block(dynamic_cast<BasicBlock*>(old2new[header]));
    clone2bb(header);
    auto bbs_entry = unroll_entry();

    for (int i = simple_loop.initial->get_value(); not should_exit(i);
         i += simple_loop.step->get_value()) {
        // connect last exit to current entry
        auto last_exit = unroll_exit();
        clone_bbs();
        auto entry = unroll_entry();
        BranchInst::create_br(entry, last_exit);

        // clone bbs and header
        for (auto bb : bodies_order) {
            clone2bb(bb);
        }
        clone2bb(header);
    }

    for (auto [old_inst, new_inst] : old2new) {
        if (not dynamic_cast<Instruction*>(old_inst)) {
            continue;
        }
        old_inst->replace_all_use_with(new_inst);
    }

    // connect exit
    header->erase_instr(dynamic_cast<BranchInst*>(&header->get_instructions().back()));
    BranchInst::create_br(simple_loop.exit, unroll_exit());

    // connect preheader
    simple_loop.preheader->get_instructions().back().replace_operand(header, bbs_entry);

    // remove old bbs
    for (auto it = func->get_basic_blocks().begin(); it != func->get_basic_blocks().end();) {
        if (simple_loop.bbs.find(&*it)!=simple_loop.bbs.end()) {
            it = func->get_basic_blocks().erase(it);
        } else {
            ++it;
        }
    }
}

void LoopUnrolling::handle_func(Function *func, const FuncLoopInfo &func_loop, Module *m_) {
    for (auto &&header : func_loop.get_topo_order()) {
        auto &&loop = func_loop.loops.at(header);
        assert(loop.preheader != nullptr);
        auto simple_loop = parse_simple_loop(header, loop);
        if (not simple_loop.has_value()) {
            continue;
        }
        if (not should_unroll(simple_loop.value())) {
            continue;
        }
        //debugs << "unrolling " + simple_loop->header->get_name() << '\n';
        unroll_simple_loop(simple_loop.value(),m_);
    }
}

void LoopUnrolling::run() {
    // 创建支配树分析 Pass 的实例
    loopfind_ = std::make_unique<LoopFind>(m_);
    // 建立支配树
    loopfind_->run();
    auto loop_info = loopfind_->get_result()->loop_info;
    for (auto &func : m_->get_functions()) {
        if (func.is_declaration()) {
            continue;
        }
        handle_func(&func, loop_info.at(&func),m_);
    }
}
