#include "Instruction.hpp"
#include "BasicBlock.hpp"
#include "Function.hpp"
#include "IRprinter.hpp"
#include "Module.hpp"
#include "Type.hpp"
#include "Value.hpp"

#include <algorithm>
#include <cassert>
#include <stdexcept>
#include <string>
#include <vector>

Instruction::Instruction(Type *ty, OpID id, BasicBlock *parent)
    : User(ty, ""), op_id_(id), parent_(parent) {
    if (parent)
        parent->add_instruction(this);
}

Instruction *Instruction::clone_inst(Instruction *inst, BasicBlock *bb){
    switch (inst->get_instr_type()) {
        // Terminator Instructions
        case ret: return ReturnInst::clone_ReturnInst(dynamic_cast<ReturnInst*>(inst), bb);break;
        case br: return BranchInst::clone_BranchInst(dynamic_cast<BranchInst *>(inst), bb);
        // Standard binary operators
        case add:
        case sub:
        case mul:
        case sdiv: return IBinaryInst::clone_IBinaryInst(dynamic_cast<IBinaryInst *>(inst), bb);break;
        // float binary operators
        case fadd:
        case fsub:
        case fmul:
        case fdiv: return FBinaryInst::clone_FBinaryInst(dynamic_cast<FBinaryInst *>(inst), bb);break;
        // Memory operators
        case alloca: return AllocaInst::clone_AllocaInst(dynamic_cast<AllocaInst *>(inst), bb);break;
        case load: return LoadInst::clone_LoadInst(dynamic_cast<LoadInst *>(inst), bb);break;
        case store: return StoreInst::clone_StoreInst(dynamic_cast<StoreInst *>(inst), bb);break;
        // Int compare operators
        case ge:
        case gt:
        case le:
        case lt:
        case eq:
        case ne: return ICmpInst::clone_ICmpInst(dynamic_cast<ICmpInst *>(inst), bb);break;
        // Float compare operators
        case fge:
        case fgt:
        case fle:
        case flt:
        case feq:
        case fne: return FCmpInst::clone_FCmpInst(dynamic_cast<FCmpInst *>(inst), bb);break;
        // Other operators
        case phi: return PhiInst::clone_PhiInst(dynamic_cast<PhiInst *>(inst), bb);break;
        case call: return CallInst::clone_CallInst(dynamic_cast<CallInst *>(inst), bb);break;
        case getelementptr: return GetElementPtrInst::clone_GetElementPtrInst(dynamic_cast<GetElementPtrInst *>(inst), bb);break;
        case zext: return ZextInst::clone_ZextInst(dynamic_cast<ZextInst *>(inst), bb);break; // zero extend
        case fptosi: return FpToSiInst::clone_FpToSiInst(dynamic_cast<FpToSiInst *>(inst), bb);break;
        case sitofp: return SiToFpInst::clone_SiToFpInst(dynamic_cast<SiToFpInst *>(inst), bb);break;
    }
    return nullptr;
}

Function *Instruction::get_function() { return parent_->get_parent(); }
Module *Instruction::get_module() { return parent_->get_module(); }

std::string Instruction::get_instr_op_name() const {
    return print_instr_op_name(op_id_);
}

IBinaryInst::IBinaryInst(OpID id, Value *v1, Value *v2, BasicBlock *bb)
    : BaseInst<IBinaryInst>(bb->get_module()->get_int32_type(), id, bb) {
    assert(v1->get_type()->is_int32_type() && v2->get_type()->is_int32_type() &&
           "IBinaryInst operands are not both i32");
    add_operand(v1);
    add_operand(v2);
}

IBinaryInst *IBinaryInst::create_add(Value *v1, Value *v2, BasicBlock *bb) {
    return create(add, v1, v2, bb);
}
IBinaryInst *IBinaryInst::create_sub(Value *v1, Value *v2, BasicBlock *bb) {
    return create(sub, v1, v2, bb);
}
IBinaryInst *IBinaryInst::create_mul(Value *v1, Value *v2, BasicBlock *bb) {
    return create(mul, v1, v2, bb);
}
IBinaryInst *IBinaryInst::create_sdiv(Value *v1, Value *v2, BasicBlock *bb) {
    return create(sdiv, v1, v2, bb);
}
IBinaryInst *IBinaryInst::clone_IBinaryInst(IBinaryInst *inst, BasicBlock *bb) {
    return create(inst->get_instr_type(), inst->get_operand(0), inst->get_operand(1), bb);
}

FBinaryInst::FBinaryInst(OpID id, Value *v1, Value *v2, BasicBlock *bb)
    : BaseInst<FBinaryInst>(bb->get_module()->get_float_type(), id, bb) {
    assert(v1->get_type()->is_float_type() && v2->get_type()->is_float_type() &&
           "FBinaryInst operands are not both float");
    add_operand(v1);
    add_operand(v2);
}

FBinaryInst *FBinaryInst::create_fadd(Value *v1, Value *v2, BasicBlock *bb) {
    return create(fadd, v1, v2, bb);
}
FBinaryInst *FBinaryInst::create_fsub(Value *v1, Value *v2, BasicBlock *bb) {
    return create(fsub, v1, v2, bb);
}
FBinaryInst *FBinaryInst::create_fmul(Value *v1, Value *v2, BasicBlock *bb) {
    return create(fmul, v1, v2, bb);
}
FBinaryInst *FBinaryInst::create_fdiv(Value *v1, Value *v2, BasicBlock *bb) {
    return create(fdiv, v1, v2, bb);
}
FBinaryInst *FBinaryInst::clone_FBinaryInst(FBinaryInst *inst, BasicBlock *bb) {
    return create(inst->get_instr_type(), inst->get_operand(0), inst->get_operand(1), bb);
}

ICmpInst::ICmpInst(OpID id, Value *lhs, Value *rhs, BasicBlock *bb)
    : BaseInst<ICmpInst>(bb->get_module()->get_int1_type(), id, bb) {
    assert(lhs->get_type()->is_int32_type() &&
           rhs->get_type()->is_int32_type() &&
           "CmpInst operands are not both i32");
    add_operand(lhs);
    add_operand(rhs);
}

ICmpInst *ICmpInst::create_ge(Value *v1, Value *v2, BasicBlock *bb) {
    return create(ge, v1, v2, bb);
}
ICmpInst *ICmpInst::create_gt(Value *v1, Value *v2, BasicBlock *bb) {
    return create(gt, v1, v2, bb);
}
ICmpInst *ICmpInst::create_le(Value *v1, Value *v2, BasicBlock *bb) {
    return create(le, v1, v2, bb);
}
ICmpInst *ICmpInst::create_lt(Value *v1, Value *v2, BasicBlock *bb) {
    return create(lt, v1, v2, bb);
}
ICmpInst *ICmpInst::create_eq(Value *v1, Value *v2, BasicBlock *bb) {
    return create(eq, v1, v2, bb);
}
ICmpInst *ICmpInst::create_ne(Value *v1, Value *v2, BasicBlock *bb) {
    return create(ne, v1, v2, bb);
}
ICmpInst *ICmpInst::clone_ICmpInst(ICmpInst *inst, BasicBlock *bb) {
    return create(inst->get_instr_type(), inst->get_operand(0), inst->get_operand(1), bb);
}

FCmpInst::FCmpInst(OpID id, Value *lhs, Value *rhs, BasicBlock *bb)
    : BaseInst<FCmpInst>(bb->get_module()->get_int1_type(), id, bb) {
    assert(lhs->get_type()->is_float_type() &&
           rhs->get_type()->is_float_type() &&
           "FCmpInst operands are not both float");
    add_operand(lhs);
    add_operand(rhs);
}

FCmpInst *FCmpInst::create_fge(Value *v1, Value *v2, BasicBlock *bb) {
    return create(fge, v1, v2, bb);
}
FCmpInst *FCmpInst::create_fgt(Value *v1, Value *v2, BasicBlock *bb) {
    return create(fgt, v1, v2, bb);
}
FCmpInst *FCmpInst::create_fle(Value *v1, Value *v2, BasicBlock *bb) {
    return create(fle, v1, v2, bb);
}
FCmpInst *FCmpInst::create_flt(Value *v1, Value *v2, BasicBlock *bb) {
    return create(flt, v1, v2, bb);
}
FCmpInst *FCmpInst::create_feq(Value *v1, Value *v2, BasicBlock *bb) {
    return create(feq, v1, v2, bb);
}
FCmpInst *FCmpInst::create_fne(Value *v1, Value *v2, BasicBlock *bb) {
    return create(fne, v1, v2, bb);
}
FCmpInst *FCmpInst::clone_FCmpInst(FCmpInst *inst, BasicBlock *bb) {
    return create(inst->get_instr_type(), inst->get_operand(0), inst->get_operand(1), bb);
}

CallInst::CallInst(Function *func, std::vector<Value *> args, BasicBlock *bb)
    : BaseInst<CallInst>(func->get_return_type(), call, bb) {
    assert(func->get_type()->is_function_type() && "Not a function");
    assert((func->get_num_of_args() == args.size()) && "Wrong number of args");
    add_operand(func);
    auto func_type = static_cast<FunctionType *>(func->get_type());
    for (unsigned i = 0; i < args.size(); i++) {
        assert(func_type->get_param_type(i) == args[i]->get_type() &&
               "CallInst: Wrong arg type");
        add_operand(args[i]);
    }
}

CallInst *CallInst::create_call(Function *func, std::vector<Value *> args,
                                BasicBlock *bb) {
    return create(func, args, bb);
}
CallInst *CallInst::clone_CallInst(CallInst *inst, BasicBlock *bb){
    std::vector<Value *> args;
    for(unsigned i = 1; i < inst->get_num_operand(); i++)
        args.push_back(inst->get_operand(i));
    return create(dynamic_cast<Function*>(inst->get_operand(0)), args, bb);
}

FunctionType *CallInst::get_function_type() const {
    return static_cast<FunctionType *>(get_operand(0)->get_type());
}

BranchInst::BranchInst(Value *cond, BasicBlock *if_true, BasicBlock *if_false,
                       BasicBlock *bb)
    : BaseInst<BranchInst>(bb->get_module()->get_void_type(), br, bb) {
    if (cond == nullptr) { // conditionless jump
        assert(if_false == nullptr && "Given false-bb on conditionless jump");
        add_operand(if_true);
        // prev/succ
        if_true->add_pre_basic_block(bb);
        bb->add_succ_basic_block(if_true);
    } else {
        assert(cond->get_type()->is_int1_type() &&
               "BranchInst condition is not i1");
        add_operand(cond);
        add_operand(if_true);
        add_operand(if_false);
        // prev/succ
        if_true->add_pre_basic_block(bb);
        if_false->add_pre_basic_block(bb);
        bb->add_succ_basic_block(if_true);
        bb->add_succ_basic_block(if_false);
    }
}

BranchInst::~BranchInst() {
    std::list<BasicBlock *> succs;
    if (is_cond_br()) {
        succs.push_back(static_cast<BasicBlock *>(get_operand(1)));
        succs.push_back(static_cast<BasicBlock *>(get_operand(2)));
    } else {
        succs.push_back(static_cast<BasicBlock *>(get_operand(0)));
    }
    for (auto succ_bb : succs) {
        if (succ_bb) {
            succ_bb->remove_pre_basic_block(get_parent());
            get_parent()->remove_succ_basic_block(succ_bb);
        }
    }
}

BranchInst *BranchInst::create_cond_br(Value *cond, BasicBlock *if_true,
                                       BasicBlock *if_false, BasicBlock *bb) {
    return create(cond, if_true, if_false, bb);
}

BranchInst *BranchInst::create_br(BasicBlock *if_true, BasicBlock *bb) {
    return create(nullptr, if_true, nullptr, bb);
}
BranchInst *BranchInst::clone_BranchInst(BranchInst *inst, BasicBlock *bb){
    if(inst->is_cond_br()) return create(inst->get_operand(0), dynamic_cast<BasicBlock*>(inst->get_operand(1)), dynamic_cast<BasicBlock*>(inst->get_operand(2)), bb);
    else return create(nullptr, dynamic_cast<BasicBlock*>(inst->get_operand(0)), nullptr, bb);
}

ReturnInst::ReturnInst(Value *val, BasicBlock *bb)
    : BaseInst<ReturnInst>(bb->get_module()->get_void_type(), ret, bb) {
    if (val == nullptr) {
        assert(bb->get_parent()->get_return_type()->is_void_type());
    } else {
        assert(!bb->get_parent()->get_return_type()->is_void_type() &&
               "Void function returning a value");
        assert(bb->get_parent()->get_return_type() == val->get_type() &&
               "ReturnInst type is different from function return type");
        add_operand(val);
    }
}

ReturnInst *ReturnInst::create_ret(Value *val, BasicBlock *bb) {
    return create(val, bb);
}
ReturnInst *ReturnInst::create_void_ret(BasicBlock *bb) {
    return create(nullptr, bb);
}
ReturnInst *ReturnInst::clone_ReturnInst(ReturnInst *inst, BasicBlock *bb){
    if(inst->is_void_ret()) return create(nullptr, bb);
    else return create(inst->get_operand(0), bb);
}

bool ReturnInst::is_void_ret() const { return get_num_operand() == 0; }

GetElementPtrInst::GetElementPtrInst(Value *ptr, std::vector<Value *> idxs,
                                     BasicBlock *bb)
    : BaseInst<GetElementPtrInst>(PointerType::get(get_element_type(ptr, idxs)),
                                  getelementptr, bb) {
    add_operand(ptr);
    for (unsigned i = 0; i < idxs.size(); i++) {
        Value *idx = idxs[i];
        assert(idx->get_type()->is_integer_type() && "Index is not integer");
        add_operand(idx);
    }
}

Type *GetElementPtrInst::get_element_type(Value *ptr,
                                          std::vector<Value *> idxs) {
    assert(ptr->get_type()->is_pointer_type() &&
           "GetElementPtrInst ptr is not a pointer");

    Type *ty = ptr->get_type()->get_pointer_element_type();
    assert(
        "GetElementPtrInst ptr is wrong type" &&
        (ty->is_array_type() || ty->is_integer_type() || ty->is_float_type()));
    if (ty->is_array_type()) {
        ArrayType *arr_ty = static_cast<ArrayType *>(ty);
        for (unsigned i = 1; i < idxs.size(); i++) {
            ty = arr_ty->get_element_type();
            if (i < idxs.size() - 1) {
                assert(ty->is_array_type() && "Index error!");
            }
            if (ty->is_array_type()) {
                arr_ty = static_cast<ArrayType *>(ty);
            }
        }
    }
    return ty;
}

Type *GetElementPtrInst::get_element_type() const {
    return get_type()->get_pointer_element_type();
}

GetElementPtrInst *GetElementPtrInst::create_gep(Value *ptr,
                                                 std::vector<Value *> idxs,
                                                 BasicBlock *bb) {
    return create(ptr, idxs, bb);
}
GetElementPtrInst *GetElementPtrInst::clone_GetElementPtrInst(GetElementPtrInst *inst, BasicBlock *bb){
    std::vector<Value*> idxs;
    for(unsigned i = 1; i < inst->get_num_operand(); i++)
        idxs.push_back(inst->get_operand(i));
    return create(inst->get_operand(0), idxs, bb);
}

StoreInst::StoreInst(Value *val, Value *ptr, BasicBlock *bb)
    : BaseInst<StoreInst>(bb->get_module()->get_void_type(), store, bb) {
    assert((ptr->get_type()->get_pointer_element_type() == val->get_type()) &&
           "StoreInst ptr is not a pointer to val type");
    add_operand(val);
    add_operand(ptr);
}

StoreInst *StoreInst::create_store(Value *val, Value *ptr, BasicBlock *bb) {
    return create(val, ptr, bb);
}
StoreInst *StoreInst::clone_StoreInst(StoreInst *inst, BasicBlock *bb) {
    return create(inst->get_operand(0), inst->get_operand(1), bb);
}

LoadInst::LoadInst(Value *ptr, BasicBlock *bb)
    : BaseInst<LoadInst>(ptr->get_type()->get_pointer_element_type(), load,
                         bb) {
    assert((get_type()->is_integer_type() or get_type()->is_float_type() or
            get_type()->is_pointer_type()) &&
           "Should not load value with type except int/float");
    add_operand(ptr);
}

LoadInst *LoadInst::create_load(Value *ptr, BasicBlock *bb) {
    return create(ptr, bb);
}
LoadInst *LoadInst::clone_LoadInst(LoadInst *inst, BasicBlock *bb){
    return create(inst->get_operand(0), bb);
}

AllocaInst::AllocaInst(Type *ty, BasicBlock *bb)
    : BaseInst<AllocaInst>(PointerType::get(ty), alloca, bb) {
    static const std::array allowed_alloc_type = {
        Type::IntegerTyID, Type::FloatTyID, Type::ArrayTyID, Type::PointerTyID};
    assert(std::find(allowed_alloc_type.begin(), allowed_alloc_type.end(),
                     ty->get_type_id()) != allowed_alloc_type.end() &&
           "Not allowed type for alloca");
}

AllocaInst *AllocaInst::create_alloca(Type *ty, BasicBlock *bb) {
    return create(ty, bb);
}
AllocaInst *AllocaInst::clone_AllocaInst(AllocaInst *inst, BasicBlock *bb) {
    return create(inst->get_alloca_type(), bb);
}

ZextInst::ZextInst(Value *val, Type *ty, BasicBlock *bb)
    : BaseInst<ZextInst>(ty, zext, bb) {
    assert(val->get_type()->is_integer_type() &&
           "ZextInst operand is not integer");
    assert(ty->is_integer_type() && "ZextInst destination type is not integer");
    assert((static_cast<IntegerType *>(val->get_type())->get_num_bits() <
            static_cast<IntegerType *>(ty)->get_num_bits()) &&
           "ZextInst operand bit size is not smaller than destination type bit "
           "size");
    add_operand(val);
}

ZextInst *ZextInst::create_zext(Value *val, Type *ty, BasicBlock *bb) {
    return create(val, ty, bb);
}
ZextInst *ZextInst::create_zext_to_i32(Value *val, BasicBlock *bb) {
    return create(val, bb->get_module()->get_int32_type(), bb);
}
ZextInst *ZextInst::clone_ZextInst(ZextInst *inst, BasicBlock *bb) {
    return create(inst->get_operand(0), inst->get_dest_type(), bb);
}

FpToSiInst::FpToSiInst(Value *val, Type *ty, BasicBlock *bb)
    : BaseInst<FpToSiInst>(ty, fptosi, bb) {
    assert(val->get_type()->is_float_type() &&
           "FpToSiInst operand is not float");
    assert(ty->is_integer_type() &&
           "FpToSiInst destination type is not integer");
    add_operand(val);
}

FpToSiInst *FpToSiInst::create_fptosi(Value *val, Type *ty, BasicBlock *bb) {
    return create(val, ty, bb);
}
FpToSiInst *FpToSiInst::create_fptosi_to_i32(Value *val, BasicBlock *bb) {
    return create(val, bb->get_module()->get_int32_type(), bb);
}
FpToSiInst *FpToSiInst::clone_FpToSiInst(FpToSiInst *inst, BasicBlock *bb) {
    return create(inst->get_operand(0), inst->get_dest_type(), bb);
}

SiToFpInst::SiToFpInst(Value *val, Type *ty, BasicBlock *bb)
    : BaseInst<SiToFpInst>(ty, sitofp, bb) {
    assert(val->get_type()->is_integer_type() &&
           "SiToFpInst operand is not integer");
    assert(ty->is_float_type() && "SiToFpInst destination type is not float");
    add_operand(val);
}

SiToFpInst *SiToFpInst::create_sitofp(Value *val, BasicBlock *bb) {
    return create(val, bb->get_module()->get_float_type(), bb);
}
SiToFpInst *SiToFpInst::clone_SiToFpInst(SiToFpInst *inst, BasicBlock *bb) {
    return create(inst->get_operand(0), inst->get_dest_type(), bb);
}

PhiInst::PhiInst(Type *ty, std::vector<Value *> vals,
                 std::vector<BasicBlock *> val_bbs, BasicBlock *bb)
    : BaseInst<PhiInst>(ty, phi) {
    assert(vals.size() == val_bbs.size() && "Unmatched vals and bbs");
    for (unsigned i = 0; i < vals.size(); i++) {
        assert(ty == vals[i]->get_type() && "Bad type for phi");
        add_operand(vals[i]);
        add_operand(val_bbs[i]);
    }
    this->set_parent(bb);
}

PhiInst *PhiInst::create_phi(Type *ty, BasicBlock *bb,
                             std::vector<Value *> vals,
                             std::vector<BasicBlock *> val_bbs) {
    return create(ty, vals, val_bbs, bb);
}
PhiInst *PhiInst::clone_PhiInst(PhiInst *inst, BasicBlock *bb){
    std::vector<Value*> vals;
    std::vector<BasicBlock*> val_bbs;
    for (unsigned i = 0; i < inst->get_num_operand(); i+=2){
        vals.push_back(inst->get_operand(i));
        val_bbs.push_back(dynamic_cast<BasicBlock*>(inst->get_operand(i+1)));
    }
    return create(inst->get_type(), vals, val_bbs, bb);
}

std::vector<std::pair<Value *, BasicBlock *>> PhiInst::to_pairs() const {
    std::vector<std::pair<Value *, BasicBlock *>> ret;
    for (auto it = get_operands().begin(); it != get_operands().end(); it += 2) {
        auto op = *it;
        auto bb = *(it + 1);
        ret.emplace_back(op, dynamic_cast<BasicBlock*>(bb));
    }
    return ret;
}
