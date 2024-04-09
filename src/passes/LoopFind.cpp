#include "LoopFind.hpp"
#include "BasicBlock.hpp"
#include "Dominators.hpp"
#include "Instruction.hpp"
#include "CodeGenUtil.hpp"
#include <queue>
#include <sys/types.h>
#include <unordered_map>

using namespace std;

void LoopFind::run() {
    using LoopInfo = ResultType::LoopInfo;

    dominators_ = std::make_unique<Dominators>(m_);
    dominators_->run();

    for (auto &func : m_->get_functions()) {
        if (func.is_declaration())
            continue;
        // for each bb in func to find all loops in func
        unordered_map<BasicBlock *, LoopInfo> loops;
        for (auto &bb : func.get_basic_blocks()) {
            // try find a loop using bb as header
            for (auto &pre_bb : bb.get_pre_basic_blocks()) {
                if (dominators_->get_idom(&bb) == pre_bb) {
                    // found a latch pre_bb -> bb
                    if (loops.find(&bb) == loops.end()) {
                        // first time to find the header bb
                        loops.insert({&bb, LoopInfo{}});
                    }
                    LoopInfo loop = loops.find(&bb)->second;
                    loop.latches.push_back(pre_bb);
                    loop.bbs.insert(find_bbs_by_latch(&bb, pre_bb).begin(), find_bbs_by_latch(&bb, pre_bb).end());
                }
            }
            if (loops.find(&bb) != loops.end()) {
                auto loop = loops.find(&bb)->second;

                // set preheader if exists
                vector<BasicBlock *> outer_pre_bbs;
                for (auto pre : bb.get_pre_basic_blocks()) {
                    // prebb out of the loop that has only one
                    // sucbb (header)
                    if (loop.bbs.find(pre) == loop.bbs.end()) {
                        outer_pre_bbs.push_back(pre);
                    }
                }

                loop.preheader = nullptr;
                if (outer_pre_bbs.size() == 1 and
                    outer_pre_bbs.back()->get_succ_basic_blocks().size() == 1) {
                    loop.preheader = outer_pre_bbs.back();
                }

                // find all exiting bbs
                // set exit bb for each exiting bb if exists
                for (auto bb : loop.bbs) {
                    for (auto suc : bb->get_succ_basic_blocks()) {
                        if (loop.bbs.find(suc)==loop.bbs.end()) {
                            loop.exits.insert({bb, nullptr});
                            if (suc->get_pre_basic_blocks().size() == 1) {
                                loop.exits[bb] = suc;
                            }
                        }
                    }
                }

                // set sub loop
                for (auto &&[other_header, other_loop] : loops) {
                    if (other_header == &bb) {
                        continue;
                    }
                    if (other_loop.bbs.find(&bb) != other_loop.bbs.end()) {
                        other_loop.sub_loops.insert(&bb);
                    }
                }

                // parse ind var
                loop.ind_var_info = parse_ind_var(&bb, loop);
            }
        }
        _result->loop_info[&func].loops = std::move(loops);
    }
}

set<BasicBlock *> LoopFind::find_bbs_by_latch(BasicBlock *header,
                                              BasicBlock *latch) {
    set<BasicBlock *> ret;
    ret.insert(header);
    queue<BasicBlock *> bfs;
    bfs.push(latch);
    ret.insert(latch);
    while (not bfs.empty()) {
        auto bb = bfs.front();
        bfs.pop();
        if (bb == header) {
            continue;
        }
        for (auto &&pre_bb : bb->get_pre_basic_blocks()) {
            if (ret.find(pre_bb) == ret.end()) {
                bfs.push(pre_bb);
                ret.insert(pre_bb);
            }
        }
    }
    return ret;
}

auto LoopFind::parse_ind_var(BasicBlock *header, const LoopInfo &loop)
    -> optional<LoopInfo::IndVarInfo> {

    LoopInfo::IndVarInfo ind_var_info;

    if (loop.latches.size() > 1) {
        return nullopt;
    }

    // the loop has too many exiting edges
    if (loop.exits.size() > 1) {
        return nullopt;
    }

    // the exiting bb is not header
    auto exiting = loop.exits.begin()->first;
    if (exiting != header) {
        return nullopt;
    }

    // induction var
    auto br_inst = dynamic_cast<BranchInst*>(&(header->get_instructions().back()));
    assert(br_inst->get_num_operand() == 3);
    auto cond = br_inst->get_operand(0);
    // the induction variable should be of int type
    if (not dynamic_cast<ICmpInst*>(cond)) {
        return nullopt;
    }

    auto icmp_inst = dynamic_cast<ICmpInst*>(cond);
    auto icmp_op = icmp_inst->get_instr_type();
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
        if (loop.bbs.find(dynamic_cast<BasicBlock*>(br_inst->get_operand(2)))==loop.bbs.end()) {
            // exit if cond is true
            return op;
        } else if (loop.bbs.find(dynamic_cast<BasicBlock*>(br_inst->get_operand(1)))==loop.bbs.end()) {
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

    auto is_loop_invariant = [&](Value *v) {
        if (not dynamic_cast<Instruction*>(v)) {
            return true;
        }
        auto inst = dynamic_cast<Instruction*>(v);
        return loop.bbs.find(inst->get_parent())==loop.bbs.end();
    };

    if (is_loop_invariant(lhs)) {
        ind_var_info.ind_var = rhs;
        ind_var_info.icmp_op = exit_cond(true);
        ind_var_info.bound = lhs;
    } else if (is_loop_invariant(rhs)) {
        ind_var_info.ind_var = lhs;
        ind_var_info.icmp_op = exit_cond(false);
        ind_var_info.bound = rhs;
    } else {
        return nullopt;
    }

    // find initial and step
    ind_var_info.initial = nullptr;
    ind_var_info.step = nullptr;
    for (auto &inst1 : header->get_instructions()) {
        auto inst = &inst1;
        if (not dynamic_cast<PhiInst*>(inst)) {
            break;
        }
        if (inst != ind_var_info.ind_var) {
            continue;
        }
        // the phi for induction variable
        auto phi_inst = dynamic_cast<PhiInst*>(inst);
        // the phi should has two source, one from preheader and the other from
        // loop body
        if (phi_inst->to_pairs().size() != 2) {
            return nullopt;
        }
        for (auto [value, source] : phi_inst->to_pairs()) {
            if (loop.bbs.find(source)!=loop.bbs.end()) {
                // step
                if (not dynamic_cast<IBinaryInst*>(value)) {
                    continue;
                }
                auto ibinary_inst = dynamic_cast<IBinaryInst*>(value);
                auto ibin_op = ibinary_inst->get_instr_type();
                if (ibin_op != Instruction::OpID::add) {
                    continue;
                }
                if (ibinary_inst->get_operand(0) == ind_var_info.ind_var) {
                    ind_var_info.step = ibinary_inst->get_operand(1);
                } else if (ibinary_inst->get_operand(1) == ind_var_info.ind_var) {
                    ind_var_info.step = ibinary_inst->get_operand(0);
                }
            } else {
                // initial
                ind_var_info.initial = value;
            }
        }
    }
    if (ind_var_info.initial == nullptr or ind_var_info.step == nullptr) {
        return nullopt;
    }
    return ind_var_info;
}

vector<BasicBlock *>
LoopFind::ResultType::FuncLoopInfo::get_topo_order() const {
    vector<BasicBlock *> ret;
    map<BasicBlock *, size_t> parent_cnt;
    for (auto &&[header, _] : loops) {
        parent_cnt[header] = 0;
    }
    for (auto &&[_, loop] : loops) {
        for (auto sub_header : loop.sub_loops) {
            parent_cnt[sub_header]++;
        }
    }
    while (not parent_cnt.empty()) {
        bool changed{false};
        for (auto &&[header, cnt] : parent_cnt) {
            if (cnt == 0) {
                ret.push_back(header);
                for (auto sub_header : loops.at(header).sub_loops) {
                    parent_cnt[sub_header]--;
                }
                parent_cnt.erase(header);
                changed = true;
                break;
            }
        }
        assert(changed);
    }
    return ret;
}
