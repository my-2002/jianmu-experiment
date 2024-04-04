#include "Gvn.hpp"
#include "BasicBlock.hpp"
#include "Constant.hpp"
#include "Dominators.hpp"
#include "Function.hpp"
#include "GlobalVariable.hpp"
#include "Instruction.hpp"

#include "Type.hpp"
#include "CodeGenUtil.hpp"
#include "Value.hpp"
#include <algorithm>
#include <cassert>
#include <iterator>
#include <memory>
#include <stdexcept>
#include <utility>
#include <vector>

using namespace std;

namespace std {
template <>
bool operator==(const shared_ptr<GVN::Expression> &lhs,
                const shared_ptr<GVN::Expression> &rhs) noexcept {
    if (lhs == nullptr || rhs == nullptr)
        return false;
    return *lhs == *rhs;
}
template <>
bool operator==(const shared_ptr<GVN::PhiExpr> &lhs,
                const shared_ptr<GVN::PhiExpr> &rhs) noexcept {
    if (lhs == nullptr || rhs == nullptr)
        return false;
    return dynamic_pointer_cast<GVN::Expression>(lhs) ==
           dynamic_pointer_cast<GVN::Expression>(rhs);
}
} // namespace std

bool operator==(const GVN::partitions &lhs, const GVN::partitions &rhs) {
    if (lhs.size() != rhs.size())
        return false;
    else {
        GVN::partitions::iterator i = lhs.begin();
        GVN::partitions::iterator j = rhs.begin();
        for (; i != lhs.end(); i++, j++) {
            if (**i == **j)
                continue;
            else if (**i == **j)
                return false;
            else
                return false;
        }
    }
    return true;
}

bool GVN::CongruenceClass::operator==(const CongruenceClass &other) const {
    if (this->members.size() != other.members.size())
        return false;
    if (!(this->leader == other.leader))
        return false;
    for (auto &mem : other.members) {
        if (this->members.find(mem)!=this->members.end())
            continue;
        else
            return false;
    }
    return true;
}

void GVN::run() {
    func_info->run();
    clear();
    for (auto &gv : m_->get_global_variable()) {
        _val2expr[&gv] = create_expr<UniqueExpr>(&gv);
    }
    for (auto &f : m_->get_functions()) {
        if (f.is_declaration())
            continue;
        _func = &f;
        // initialize the global variables
        {
            next_value_number = 1;
            _pin.clear();
            _pout.clear();
            bb_vis_.clear();
            bb_postorder_.clear();
            bb_vector_.clear();
            for (auto &bb1 : _func->get_basic_blocks())
            {
                auto bb = &bb1;
                bb_vis_.insert({bb, false});
            }
    
        }
        DFS(_func->get_entry_block());//DFS进行后序遍历
        reverse(bb_vector_.begin(), bb_vector_.end());
        detect_equivalences(&f);
        replace_cc_members();
    }
}

void GVN::DFS(BasicBlock* b)
{
    bb_vis_.at(b) = true;
    for (auto &bb1 : b->get_succ_basic_blocks())
        if(!bb_vis_[bb1])
            DFS(bb1);
    bb_postorder_.insert({b, bb_vector_.size()});
    bb_vector_.push_back(b);
}

GVN::partitions GVN::join(const partitions &p1, const partitions &p2) {
    if (p1 == TOP)
        return clone(p2);
    if (p2 == TOP)
        return clone(p1);
    partitions p{};
    for (auto &Ci : p1) {
        for (auto &Cj : p2) {
            auto Ck = intersect(Ci, Cj);
            if (!Ck->members.empty()) {
                p.insert(Ck);
            }
        }
    }
    return p;
}

shared_ptr<GVN::CongruenceClass>
GVN::intersect(shared_ptr<CongruenceClass> Ci, shared_ptr<CongruenceClass> Cj) {
    auto Ck = create_cc(0);
    if (Ci->index == Cj->index)
        Ck->index = Ci->index;
    if (Ci->val_expr == Cj->val_expr)
        Ck->val_expr = Ci->val_expr;
    if (Ci->phi_expr == Cj->phi_expr)
        Ck->phi_expr = Ci->phi_expr;
    set_intersection(Ci->members.begin(), Ci->members.end(),
                     Cj->members.begin(), Cj->members.end(),
                     inserter(Ck->members, Ck->members.begin()));
    if (Ci->leader == Cj->leader)
        Ck->leader = Ci->leader;
    else {
        unsigned order_id = 0;
        for (auto mem :
             Ck->members) { // when there is a non-phi inst in members,
                            // the phi must be equal to the inst.
            if (dynamic_cast<Constant*>(mem)) {
                Ck->leader = mem;
                break;
            } else if (dynamic_cast<Instruction*>(mem)) { // Select the first inst in depth_first_order
                auto bb = dynamic_cast<Instruction*>(mem)->get_parent();
                if (order_id <= bb_postorder_.at(bb)) {
                    order_id = bb_postorder_.at(bb);
                    Ck->leader = mem;
                }
            } else { // for globalvar and argument, it shouldn't be intersected
                     // after mem2reg
                throw logic_error{mem->get_type()->print() +
                                  "has been intersected"};
            }
        }
    }
    assert(Ck->leader || Ck->members.empty());
    if (!Ck->members.empty() and Ck->val_expr == nullptr) {
        if (dynamic_cast<PhiInst*>(Ck->leader)) {
            Ck->phi_expr = create_expr<PhiExpr>(_bb);
            assert(phi_construct_point);
            if (phi_construct_point == 1) {
                Ck->phi_expr->add_val(Ci->val_expr);
            } else {
                if (not is_a<PhiExpr>(Ci->val_expr) ||
                    as_a<PhiExpr>(Ci->val_expr)->get_ori_bb() != _bb ||
                    as_a<PhiExpr>(Ci->val_expr)->size() >
                        phi_construct_point) { // this case guarantee that
                                               // Ci->val_expr must be the same
                                               // data in previous predecessor
                    for (unsigned i = 0; i < phi_construct_point; i++) {
                        Ck->phi_expr->add_val(Ci->val_expr);
                    }
                } else {
                    Ck->phi_expr = Ci->phi_expr;
                }
            }
            Ck->phi_expr->add_val(Cj->val_expr);
            Ck->val_expr = Ck->phi_expr;
            assert(Ck->phi_expr->size() == (phi_construct_point + 1));
        } else {
            Ck->val_expr = Ci->index > Cj->index ? Ci->val_expr : Cj->val_expr;
        }
    }
    if (Ck->index == 0 && not Ck->members.empty())
        Ck->index = next_value_number++;
    return Ck;
}

void GVN::detect_equivalences(Function *func) {
    // initialize POUT of each bb
    for (auto &bb : func->get_basic_blocks()) {
        _pout[&bb] = TOP;
    }
    for (auto &arg : func->get_args()) {
        auto cc = create_cc(next_value_number++, &arg,
                            create_expr<UniqueExpr>(&arg), nullptr, &arg);
        _pin[func->get_entry_block()].insert(cc);
    }
    bool changed = false;
    unsigned times = 0;
    do {
        changed = false;
        for (auto &bb_r : bb_vector_) {
            _bb = bb_r;
            auto &pre_bbs = _bb->get_pre_basic_blocks();
            partitions origin_pout = _pout[_bb];
            partitions pin = TOP;
            phi_construct_point = 0;
            if (pre_bbs.size() > 1)
                for (auto pre_bb : pre_bbs) {
                    pin = join(pin, _pout[pre_bb]);
                    phi_construct_point++;
                }
            else // it can only produce phi_expr when pre_bb > 2
                pin = non_copy_pout[*pre_bbs.begin()];
            if (_bb == func->get_entry_block()) {
                _pout[_bb] = clone(_pin[_bb]);
            } else {
                _pin[_bb] = clone(pin);
                _pout[_bb] = clone(pin);
            }
            for (auto &inst_r : _bb->get_instructions()) {
                if (dynamic_cast<BranchInst*>(&inst_r) || dynamic_cast<PhiInst*>(&inst_r) ||
                    dynamic_cast<ReturnInst*>(&inst_r) ||
                    (dynamic_cast<CallInst*>(&inst_r) &&
                     inst_r.get_use_list()
                         .empty())) // For pure_func, if it isn't used, it
                                    // will be optimized by mem2reg
                                    // Thus, this case must be a non-pure_func
                                    // and if it isn't be used, it will not be
                                    // as a basic ValueExpression
                    continue;
                _pout[_bb] = transfer_function(&inst_r, _pout[_bb]);
                // special judgement to prevent from large number of CC
                if (_pout[_bb].size() > 200) {
                    non_copy_pout.clear();
                    return;
                }
            }
            non_copy_pout[_bb] = clone(_pout[_bb]);
            for (auto suc_bb : _bb->get_succ_basic_blocks()) {
                if (_pout[_bb] == TOP)
                    break;
                for (auto &inst_r : suc_bb->get_instructions()) {
                    if (dynamic_cast<PhiInst*>(&inst_r)) {
                        auto inst = dynamic_cast<PhiInst*>(&inst_r);
                        unsigned i = 1;
                        for (; i < inst->get_operands().size(); i += 2) {
                            if (inst->get_operands()[i] == _bb)
                                break;
                        }
                        //assert(i < inst->get_operands().size());
                        if(i >= inst->get_operands().size())
                        {
                            Value* oper = ConstantInt::get(-114514, m_);
                            shared_ptr<Expression> ve;
                            ve = valueExpr(oper, _pout[_bb]);
                            auto cc = create_cc(next_value_number++, oper, ve,
                                                nullptr, oper);
                            cc->members.insert(inst);
                            _pout[_bb].insert(cc);
                            continue;
                        }
                        auto oper = inst->get_operand(i - 1);
                        // transfer inst according to oper's CC to prevent from
                        // CC increasing unlimitedly
                        if (inst == oper) // if oper is inst itself, no transfer
                            continue;
                        for (auto &Ci : _pout[_bb]) {
                            if (Ci->members.find(static_cast<Value *>(inst))!=Ci->members.end()) {
                                Ci->members.erase(inst);
                                if (Ci->members.size() == 0)
                                    _pout[_bb].erase(Ci);
                                break;
                            }
                        }
                        bool flag = true;
                        for (auto &cc : _pout[_bb]) {
                            if (cc->members.find(oper)!=cc->members.end()) {
                                cc->members.insert(inst);
                                flag = false;
                                break;
                            }
                        }
                        assert(not flag || not dynamic_cast<Instruction*>(oper));
                        if (flag) {
                            assert(dynamic_cast<Constant*>(oper) ||
                                   dynamic_cast<GlobalVariable*>(oper));
                            shared_ptr<Expression> ve;
                            ve = valueExpr(oper, _pout[_bb]);
                            auto cc = create_cc(next_value_number++, oper, ve,
                                                nullptr, oper);
                            cc->members.insert(inst);
                            _pout[_bb].insert(cc);
                        }
                    } else
                        break;
                }
            }
            if (not(origin_pout == _pout[_bb])) {
                changed = true;
            }
        }
        assert(times++ < 100);
    } while (changed);
}

GVN::partitions GVN::transfer_function(Instruction *inst, partitions &pin) {
    partitions pout = clone(pin);
    for (auto cc : pout) {
        if (cc->members.find(static_cast<Value *>(inst))!=cc->members.end()) {
            cc->members.erase(inst);
            if (cc->members.size() == 0)
                pout.erase(cc);
        }
    }
    auto ve = valueExpr(inst, pin);
    auto vpf = valuePhiFunc(ve);
    bool exist_cc = false;
    if (pout == TOP)
        pout.clear();
    for (auto cc : pout) {
        if (cc->val_expr == ve || (vpf != nullptr && cc->phi_expr == vpf)) {
            cc->members.insert(inst);
            exist_cc = true;
            break;
        }
    }
    assert(ve);
    if (not exist_cc) {
        auto cc = create_cc(next_value_number++, inst, ve, vpf, inst);
        pout.insert(cc);
    }
    return pout;
}
shared_ptr<GVN::Expression> GVN::valueExpr(Value *val, partitions &pin) {
    assert(val);
    if (dynamic_cast<Constant*>(val)) {
        if (_val2expr[val])
            return _val2expr[val];
        return _val2expr[val] = create_expr<ConstExpr>(val);
    } else if (dynamic_cast<GlobalVariable*>(val)) {
        return _val2expr[val];
    }
    std::shared_ptr<Expression> ve = get_ve(val, pin);
    if (ve)
        return ve;
    else if (dynamic_cast<CallInst*>(val)) {
        auto call = dynamic_cast<CallInst*>(val);
        auto func = dynamic_cast<Function*>(call->get_operand(0));
        if (func_info->is_pure_function(func)) {
            vector<shared_ptr<Expression>> params;
            for (unsigned i = 1; i < call->get_operands().size(); i++) {
                params.push_back(valueExpr(call->get_operand(i), pin));
            }
            ve = create_expr<CallExpr>(func, std::move(params));
        } else {
            ve = create_expr<CallExpr>(call);
        }
    } else if (dynamic_cast<ZextInst*>(val) || dynamic_cast<FpToSiInst*>(val) ||
               dynamic_cast<SiToFpInst*>(val)) {
        auto oper = dynamic_cast<Instruction*>(val)->get_operand(0);
        ve = create_expr<UnitExpr>(valueExpr(oper, pin));
    } else if (dynamic_cast<IBinaryInst*>(val)) {
        auto op = dynamic_cast<IBinaryInst*>(val)->get_instr_type();
        ve = create_BinOperExpr<IBinExpr, IBinaryInst>(op, val, pin);
    } else if (dynamic_cast<FBinaryInst*>(val)) {
        auto op = dynamic_cast<FBinaryInst*>(val)->get_instr_type();
        ve = create_BinOperExpr<FBinExpr, FBinaryInst>(op, val, pin);
    } else if (dynamic_cast<ICmpInst*>(val)) {
        auto op = dynamic_cast<ICmpInst*>(val)->get_instr_type();
        ve = create_BinOperExpr<ICmpExpr, ICmpInst>(op, val, pin);
    } else if (dynamic_cast<FCmpInst*>(val)) {
        auto op = dynamic_cast<FCmpInst*>(val)->get_instr_type();
        ve = create_BinOperExpr<FCmpExpr, FCmpInst>(op, val, pin);
    } else if (dynamic_cast<GetElementPtrInst*>(val)) {
        auto gep = dynamic_cast<GetElementPtrInst*>(val);
        vector<shared_ptr<Expression>> idxs;
        for (unsigned i = 0; i < gep->get_operands().size(); i++) {
            idxs.push_back(valueExpr(gep->get_operand(i), pin));
        }
        ve = create_expr<GepExpr>(std::move(idxs));
    } else if (dynamic_cast<PhiInst*>(val)) {
        throw unreachable_error{};
    } else if (dynamic_cast<AllocaInst*>(val)) {
        ve = create_expr<UniqueExpr>(val);
    } else if (dynamic_cast<LoadInst*>(val)) {
        ve = create_expr<LoadExpr>(
            valueExpr(dynamic_cast<LoadInst*>(val)->get_operand(0), pin));
    } else if (dynamic_cast<StoreInst*>(val)) {
        ve = create_expr<StoreExpr>(
            valueExpr(dynamic_cast<StoreInst*>(val)->get_operand(0), pin),
            valueExpr(dynamic_cast<StoreInst*>(val)->get_operand(1), pin));
    } else {
        throw logic_error{"Can't create a temporary expression"};
    }
    assert(ve);
    return ve;
}
std::shared_ptr<GVN::PhiExpr> GVN::valuePhiFunc(shared_ptr<Expression> ve) {
    if (not is_a<BinExpr>(ve))
        return nullptr;
    auto lhs = as_a<BinExpr>(ve)->get_lhs();
    auto rhs = as_a<BinExpr>(ve)->get_rhs();
    if (not is_a<PhiExpr>(lhs) or not is_a<PhiExpr>(rhs))
        return nullptr;
    auto phi_lhs = as_a<PhiExpr>(lhs);
    auto phi_rhs = as_a<PhiExpr>(rhs);
    if (phi_lhs->size() != phi_rhs->size())
        return nullptr;
    auto bb = phi_lhs->get_ori_bb();
    auto res_phi = create_expr<PhiExpr>(bb);
    for (unsigned i = 0; i < phi_lhs->size(); i++) {
        shared_ptr<Expression> tmp;
        switch (ve->get_op()) {
        case Expression::expr_type::e_ibin:
            tmp =
                create_expr<IBinExpr>(as_a<IBinExpr>(ve)->get_ibin_op(),
                                      phi_lhs->get_val(i), phi_rhs->get_val(i));
            break;
        case Expression::expr_type::e_fbin:
            tmp =
                create_expr<FBinExpr>(as_a<FBinExpr>(ve)->get_fbin_op(),
                                      phi_lhs->get_val(i), phi_rhs->get_val(i));
            break;
        case Expression::expr_type::e_icmp:
            tmp =
                create_expr<ICmpExpr>(as_a<ICmpExpr>(ve)->get_icmp_op(),
                                      phi_lhs->get_val(i), phi_rhs->get_val(i));
            break;
        case Expression::expr_type::e_fcmp:
            tmp =
                create_expr<FCmpExpr>(as_a<FCmpExpr>(ve)->get_fcmp_op(),
                                      phi_lhs->get_val(i), phi_rhs->get_val(i));
            break;
        default:
            assert(false);
        }
        auto pout_i = _pout[phi_lhs->get_pre_bb(i)];
        auto vn = getVN(pout_i, tmp);
        if (vn == nullptr)
            vn = valuePhiFunc(tmp);
        if (vn == nullptr)
            return nullptr;
        else {
            res_phi->add_val(vn);
        }
    }
    return res_phi;
}

std::shared_ptr<GVN::Expression> GVN::get_ve(Value *val, partitions &pin) {
    for (auto cc : pin) {
        if (cc->members.find(val)!=cc->members.end())
            return cc->val_expr;
    }
    return nullptr;
}

std::shared_ptr<GVN::Expression> GVN::getVN(partitions &pin,
                                            shared_ptr<Expression> ve) {
    for (auto &cc : pin) {
        if (cc->val_expr == ve) {
            return cc->val_expr;
        }
    }
    return nullptr;
}
GVN::partitions GVN::clone(const GVN::partitions &p) {
    partitions clone_p;
    for (auto &cc : p) {
        clone_p.insert(std::make_shared<CongruenceClass>(*cc));
    }
    return clone_p;
}

void GVN::replace_cc_members() {
    for (auto &[bb_r, part] : non_copy_pout) { // if it is a copy statement, it
                                               // shouldn't replace any inst
        auto bb = bb_r;
        for (auto &cc : part) {
            if (cc->index == 0)
                continue;
            for (auto &member : cc->members) {
                if (member != cc->leader and not dynamic_cast<Constant*>(member)) {
                    assert(cc->leader);
                    if (dynamic_cast<PhiInst*>(cc->leader) &&
                        dynamic_cast<PhiInst*>(member) &&
                        dynamic_cast<PhiInst*>(member)->get_parent() !=
                            dynamic_cast<PhiInst*>(cc->leader)->get_parent()) {
                        continue;
                    }
                    member->replace_use_with_if(cc->leader, [bb](const Use &use) -> bool {
                            if (dynamic_cast<Instruction *>(use.val_)) {
                                auto inst = dynamic_cast<Instruction *>(use.val_);
                                auto parent = inst->get_parent();
                                if (dynamic_cast<PhiInst*>(inst))
                                    return inst->get_operand(use.arg_no_ + 1) ==
                                           bb; // only replace the
                                               // operand of the
                                               // user from current
                                               // bb for phi
                                else
                                    return parent == bb; // replace the members
                                                         // if users are in the
                                                         // same block as bb
                            }
                            return false;
                        });
                }
            }
        }
    }
    return;
}
