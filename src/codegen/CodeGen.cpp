#include "CodeGen.hpp"

#include "CodeGenUtil.hpp"
#include <string>

void CodeGen::allocate() {
    // 备份 $ra $fp
    unsigned offset = context.func->stack_offset_;
    context.offset_map = context.func->stackmap_;

    // 为指令结果分配栈空间
    for (auto &bb : context.func->get_basic_blocks())
        for (auto &instr : bb.get_instructions()) 
            // alloca 的副作用：分配额外空间
            if (instr.is_alloca()) {
                auto *alloca_inst = static_cast<AllocaInst *>(&instr);
                auto alloc_size = alloca_inst->get_alloca_type()->get_size();
                offset = ALIGN(offset + alloc_size, 4);
                context.alloc_map[&instr] = -static_cast<int>(offset);  //建立一个额外空间偏移量和alloc值的映射
            }

    // 分配栈空间，需要是 16 的整数倍
    context.frame_size = ALIGN(offset, PROLOGUE_ALIGN);
}

void CodeGen::load_to_greg(Value *val, const Reg &reg) {
    assert(val->get_type()->is_integer_type() ||
           val->get_type()->is_pointer_type());

    if (auto *constant = dynamic_cast<ConstantInt *>(val)) {
        int32_t val = constant->get_value();
        if (IS_IMM_12(val)) {
            append_inst(ADDI WORD, {reg.print(), "$zero", std::to_string(val)});
        } else {
            load_large_int32(val, reg);
        }
    }
    else if(dynamic_cast<ConstantZero *>(val)) {
        append_inst(ADDI WORD, {reg.print(), "$zero", "0"});
    } else if (auto *global = dynamic_cast<GlobalVariable *>(val)) {
        append_inst(LOAD_ADDR, {reg.print(), global->get_name()});
    } else if (context.func->gregmap_.find(val) != context.func->gregmap_.end()) {
        move_from_greg_to_greg(Reg::r((unsigned)context.func->gregmap_.find(val)->second), reg);
    } else {
        load_from_stack_to_greg(val, reg);
    }
}

void CodeGen::load_large_int32(int32_t val, const Reg &reg) {
    int32_t high_20 = val >> 12; // si20
    uint32_t low_12 = val & LOW_12_MASK;
    append_inst(LU12I_W, {reg.print(), std::to_string(high_20)});
    append_inst(ORI, {reg.print(), reg.print(), std::to_string(low_12)});
}

void CodeGen::load_large_int64(int64_t val, const Reg &reg) {
    auto low_32 = static_cast<int32_t>(val & LOW_32_MASK);
    load_large_int32(low_32, reg);

    auto high_32 = static_cast<int32_t>(val >> 32);
    int32_t high_32_low_20 = (high_32 << 12) >> 12; // si20
    int32_t high_32_high_12 = high_32 >> 20;        // si12
    append_inst(LU32I_D, {reg.print(), std::to_string(high_32_low_20)});
    append_inst(LU52I_D,
                {reg.print(), reg.print(), std::to_string(high_32_high_12)});
}

void CodeGen::load_from_stack_to_greg(Value *val, const Reg &reg) {
    auto offset = context.offset_map.at(val);
    auto offset_str = std::to_string(offset);
    auto *type = val->get_type();
    if (IS_IMM_12(offset)) {
        if (type->is_int1_type()) {
            append_inst(LOAD BYTE, {reg.print(), "$fp", offset_str});
        } else if (type->is_int32_type()) {
            append_inst(LOAD WORD, {reg.print(), "$fp", offset_str});
        } else { // Pointer
            append_inst(LOAD DOUBLE, {reg.print(), "$fp", offset_str});
        }
    } else {
        load_large_int64(offset, reg);
        append_inst(ADD DOUBLE, {reg.print(), "$fp", reg.print()});
        if (type->is_int1_type()) {
            append_inst(LOAD BYTE, {reg.print(), reg.print(), "0"});
        } else if (type->is_int32_type()) {
            append_inst(LOAD WORD, {reg.print(), reg.print(), "0"});
        } else { // Pointer
            append_inst(LOAD DOUBLE, {reg.print(), reg.print(), "0"});
        }
    }
}

void CodeGen::store_from_greg(Value *val, const Reg &reg) {
    if(context.func->gregmap_.find(val) == context.func->gregmap_.end())
    {
        auto offset = context.offset_map.at(val);
        auto offset_str = std::to_string(offset);
        auto *type = val->get_type();
        if (IS_IMM_12(offset)) {
            if (type->is_int1_type()) {
                append_inst(STORE BYTE, {reg.print(), "$fp", offset_str});
            } else if (type->is_int32_type()) {
                append_inst(STORE WORD, {reg.print(), "$fp", offset_str});
            } else { // Pointer
                append_inst(STORE DOUBLE, {reg.print(), "$fp", offset_str});
            }
        } else {
            auto addr = Reg::t(2);
            load_large_int64(offset, addr);
            append_inst(ADD DOUBLE, {addr.print(), "$fp", addr.print()});
            if (type->is_int1_type()) {
                append_inst(STORE BYTE, {reg.print(), addr.print(), "0"});
            } else if (type->is_int32_type()) {
                append_inst(STORE WORD, {reg.print(), addr.print(), "0"});
            } else { // Pointer
                append_inst(STORE DOUBLE, {reg.print(), addr.print(), "0"});
            }
        }
    }
    else
        move_from_greg_to_greg(reg, Reg::r((unsigned)context.func->gregmap_.find(val)->second));
}

void CodeGen::load_to_freg(Value *val, const FReg &freg) {
    assert(val->get_type()->is_float_type());
    if (auto *constant = dynamic_cast<ConstantFP *>(val)) {
        float val = constant->get_value();
        load_float_imm(val, freg);
    } else if(dynamic_cast<ConstantZero *>(val)) {
        append_inst("movgr2fr" WORD, {freg.print(),"$zero"});    
    } else if(context.func->fregmap_.find(val) != context.func->fregmap_.end()){
        move_from_freg_to_freg(FReg::f((unsigned)context.func->fregmap_.find(val)->second), freg);
    } else {
        auto offset = context.offset_map.at(val);
        auto offset_str = std::to_string(offset);
        if (IS_IMM_12(offset)) {
            append_inst(FLOAD SINGLE, {freg.print(), "$fp", offset_str});
        } else {
            auto addr = Reg::t(2);
            load_large_int64(offset, addr);
            append_inst(ADD DOUBLE, {addr.print(), "$fp", addr.print()});
            append_inst(FLOAD SINGLE, {freg.print(), addr.print(), "0"});
        }
    }
}

void CodeGen::load_float_imm(float val, const FReg &r) {
    int32_t bytes = *reinterpret_cast<int32_t *>(&val);
    load_large_int32(bytes, Reg::t(2));
    append_inst(GR2FR WORD, {r.print(), Reg::t(2).print()});
}

void CodeGen::store_from_freg(Value *val, const FReg &r) {
    if(context.func->fregmap_.find(val) != context.func->fregmap_.end())
        move_from_freg_to_freg(r, FReg::f((unsigned)context.func->fregmap_.find(val)->second));
    else {
        auto offset = context.offset_map.at(val);
        if (IS_IMM_12(offset)) {
            auto offset_str = std::to_string(offset);
            append_inst(FSTORE SINGLE, {r.print(), "$fp", offset_str});
        } else {
            auto addr = Reg::t(2);
            load_large_int64(offset, addr);
            append_inst(ADD DOUBLE, {addr.print(), "$fp", addr.print()});
            append_inst(FSTORE SINGLE, {r.print(), addr.print(), "0"});
        }
    }
    
}

void CodeGen::move_from_greg_to_greg(const Reg &sreg, const Reg &dreg) {
    if(sreg.id!=dreg.id)
        append_inst(MOV DOUBLE, {dreg.print(), sreg.print(), "63", "0"});
}

void CodeGen::move_from_freg_to_freg(const FReg &sreg, const FReg &dreg) {
    if(sreg.id!=dreg.id)
        append_inst(FMOV SINGLE, {dreg.print(), sreg.print()});
}

void CodeGen::store_context_regs(){
    append_inst(ADDI WORD, {"$t0", "$fp", "-16"});
    for(int i = 4;i <= 11; i++)
    {
        append_inst(ADDI WORD, {"$t0", "$t0", "-8"});
        append_inst(STORE DOUBLE, {Reg::r(i).print(), "$t0", "0"});
    }
    for(int i = 15;i <= 20; i++)
    {
        append_inst(ADDI WORD, {"$t0", "$t0", "-8"});
        append_inst(STORE DOUBLE, {Reg::r(i).print(), "$t0", "0"});
    }
    for(int i = 0;i <= 7; i++)
    {
        append_inst(ADDI WORD, {"$t0", "$t0", "-4"});
        append_inst(FSTORE SINGLE, {FReg::f(i).print(), "$t0", "0"});
    }
    for(int i = 11;i <= 23; i++)
    {
        append_inst(ADDI WORD, {"$t0", "$t0", "-4"});
        append_inst(FSTORE SINGLE, {FReg::f(i).print(), "$t0", "0"});
    }
}

void CodeGen::load_context_regs(){
    append_inst(ADDI WORD, {"$t0", "$fp", "-16"});
    for(int i = 4;i <= 11; i++)
    {
        append_inst(ADDI WORD, {"$t0", "$t0", "-8"});
        append_inst(LOAD DOUBLE, {Reg::r(i).print(), "$t0", "0"});
    }
    for(int i = 15;i <= 20; i++)
    {
        append_inst(ADDI WORD, {"$t0", "$t0", "-8"});
        append_inst(LOAD DOUBLE, {Reg::r(i).print(), "$t0", "0"});
    }
    for(int i = 0;i <= 7; i++)
    {
        append_inst(ADDI WORD, {"$t0", "$t0", "-4"});
        append_inst(FLOAD SINGLE, {FReg::f(i).print(), "$t0", "0"});
    }
    for(int i = 11;i <= 23; i++)
    {
        append_inst(ADDI WORD, {"$t0", "$t0", "-4"});
        append_inst(FLOAD SINGLE, {FReg::f(i).print(), "$t0", "0"});
    }
}

void CodeGen::gen_prologue() {
    // 寄存器备份及栈帧设置
    if (IS_IMM_12(-static_cast<int>(context.frame_size))) {
        append_inst("st.d $ra, $sp, -8");
        append_inst("st.d $fp, $sp, -16");
        append_inst("addi.d $fp, $sp, 0");
        append_inst("addi.d $sp, $sp, " +
                    std::to_string(-static_cast<int>(context.frame_size)));
    } else {
        load_large_int64(context.frame_size, Reg::t(0));
        append_inst("st.d $ra, $sp, -8");
        append_inst("st.d $fp, $sp, -16");
        append_inst("sub.d $sp, $sp, $t0");
        append_inst("add.d $fp, $sp, $t0");
    }
    //传参已经处理好
}

void CodeGen::gen_epilogue() {
    append_inst("." + context.func->get_name() + "_exit", ASMInstruction::Label);
    if (IS_IMM_12(-static_cast<int>(context.frame_size)))
        append_inst("addi.d $sp, $sp, " + std::to_string(static_cast<int>(context.frame_size)));
    else
    {
        load_large_int64(context.frame_size, Reg::t(0));
        append_inst("add.d $sp, $sp, $t0");
    }
    append_inst("ld.d $ra, $sp, -8");
    append_inst("ld.d $fp, $sp, -16");
    append_inst("jr $ra");
    // 根据你的理解设定函数的 epilogue
    // throw not_implemented_error{__FUNCTION__};
}

void CodeGen::gen_ret() {
    auto *returnInst = static_cast<ReturnInst *>(context.inst);
    if(not returnInst->is_void_ret())
    {
        auto ret_type = context.func->get_return_type();
        if(ret_type->is_integer_type())
            load_to_greg(context.inst->get_operand(0), Reg::a(0));
        else
            load_to_freg(context.inst->get_operand(0), FReg::fa(0));
    }
    else
        append_inst("addi.w $a0, $zero, 0");
    append_inst("b ." + context.func->get_name() + "_exit");
    // 函数返回，思考如何处理返回值、寄存器备份，如何返回调用者地址
    // throw not_implemented_error{__FUNCTION__};
}

void CodeGen::gen_br() {
    auto *branchInst = static_cast<BranchInst *>(context.inst);
    if (branchInst->is_cond_br()) {
        load_to_greg(context.inst->get_operand(0), Reg::t(0));
        auto *truebb = static_cast<BasicBlock *>(branchInst->get_operand(1));
        auto *falsebb = static_cast<BasicBlock *>(branchInst->get_operand(2));
        append_inst("bnez $t0, " + label_name(truebb));
        append_inst("b " + label_name(falsebb));
        // 补全条件跳转的情况
        // throw not_implemented_error{__FUNCTION__};
    } else {
        auto *branchbb = static_cast<BasicBlock *>(branchInst->get_operand(0));
        append_inst("b " + label_name(branchbb));
    }
}

void CodeGen::gen_binary() {
    // 分别将左右操作数加载到 $t0 $t1
    load_to_greg(context.inst->get_operand(0), Reg::t(0));
    load_to_greg(context.inst->get_operand(1), Reg::t(1));
    // 根据指令类型生成汇编
    switch (context.inst->get_instr_type()) {
    case Instruction::add:
        output.emplace_back("add.w $t1, $t0, $t1");
        break;
    case Instruction::sub:
        output.emplace_back("sub.w $t1, $t0, $t1");
        break;
    case Instruction::mul:
        output.emplace_back("mul.w $t1, $t0, $t1");
        break;
    case Instruction::sdiv:
        output.emplace_back("div.w $t1, $t0, $t1");
        break;
    default:
        assert(false);
    }
    // 将结果填入栈帧中
    store_from_greg(context.inst, Reg::t(1));
}

void CodeGen::gen_float_binary() {
    load_to_freg(context.inst->get_operand(0), FReg::ft(0));
    load_to_freg(context.inst->get_operand(1), FReg::ft(1));
    // 根据指令类型生成汇编
    switch (context.inst->get_instr_type()) {
    case Instruction::fadd:
        output.emplace_back("fadd.s $ft1, $ft0, $ft1");
        break;
    case Instruction::fsub:
        output.emplace_back("fsub.s $ft1, $ft0, $ft1");
        break;
    case Instruction::fmul:
        output.emplace_back("fmul.s $ft1, $ft0, $ft1");
        break;
    case Instruction::fdiv:
        output.emplace_back("fdiv.s $ft1, $ft0, $ft1");
        break;
    default:
        assert(false);
    }
    // 将结果填入栈帧中
    store_from_freg(context.inst, FReg::ft(1));
    // 浮点类型的二元指令
    // throw not_implemented_error{__FUNCTION__};
}

void CodeGen::gen_alloca() {
    //auto *alloca_inst = static_cast<AllocaInst *>(context.inst);
    auto alloc_offset = (int)context.alloc_map.at(context.inst);
    if(alloc_offset>-2048)
        append_inst("addi.d $t0, $zero, " + std::to_string(alloc_offset));
    else
        load_large_int64(alloc_offset, Reg::t(0));
    append_inst("add.d $t0, $fp, $t0");
    store_from_greg(context.inst, Reg::t(0));
    /* 我们已经为 alloca 的内容分配空间，在此我们还需保存 alloca
     * 指令自身产生的定值，即指向 alloca 空间起始地址的指针
     */
    // 将 alloca 出空间的起始地址保存在栈帧上
    // throw not_implemented_error{__FUNCTION__};
}

void CodeGen::gen_load() {
    auto *ptr = context.inst->get_operand(0);
    auto *type = context.inst->get_type();
    load_to_greg(ptr, Reg::t(0));

    if (type->is_float_type()) {
        append_inst("fld.s $ft0, $t0, 0");
        store_from_freg(context.inst, FReg::ft(0));
    } else {
        if(type->is_pointer_type())
            append_inst("ld.d $t1, $t0, 0");
        else
            append_inst("ld.w $t1, $t0, 0");
        store_from_greg(context.inst, Reg::t(1));
        // load 整数类型的数据
        // throw not_implemented_error{__FUNCTION__};
    }
}

void CodeGen::gen_store(Value* val) {
    auto val_type = val->get_type();
    
    if(val_type->is_array_type())
    {
        auto array_val = dynamic_cast<ConstantArray*>(val);
        if (array_val!=nullptr)
        {
            for(int i=0; i<(int)array_val->get_size_of_array(); i++)
            {
                auto sub_val = array_val->get_element_value(i);
                gen_store(sub_val);
            }
        }
        else //说明是zeroinit
        {
            int num = (int)val_type->get_size()/4;
            if(num<2048)
                append_inst("addi.w $t1, $zero, "+std::to_string(num));
            else
                load_large_int32(num,Reg::t(1));
            append_inst("st.w $zero, $t0, 0");
            append_inst("addi.d $t0, $t0, 4");
            append_inst("addi.w $t1, $t1, -1");
            append_inst("bne $zero, $t1, -12");
            
        }
    }
    else if(val->get_type()->is_float_type())
    {
        load_to_freg(val, FReg::ft(0));
        append_inst("fst.s $ft0, $t0, 0");
        append_inst("addi.d $t0, $t0, 4");
    }
    else
    {
        load_to_greg(val, Reg::t(1));
        if(val->get_type()->is_pointer_type())
        {
            append_inst("st.d $t1, $t0, 0");
            append_inst("addi.d $t0, $t0, 8");
        }
        else
        {
            append_inst("st.w $t1, $t0, 0");
            append_inst("addi.d $t0, $t0, 4");
        } 
    }
    // 翻译 store 指令
    // throw not_implemented_error{__FUNCTION__};
}

void CodeGen::gen_icmp() {
    load_to_greg(context.inst->get_operand(0), Reg::t(0));
    load_to_greg(context.inst->get_operand(1), Reg::t(1));
        
    switch (context.inst->get_instr_type()) {
    case Instruction::ge:
    {
        output.emplace_back("slt $t1, $t0, $t1");
        append_inst("xori $t1, $t1, 1");
        break;
    }
    case Instruction::gt:
        output.emplace_back("slt $t1, $t1, $t0");
        break;
    case Instruction::le:
    {
        output.emplace_back("slt $t1, $t1, $t0");
        append_inst("xori $t1, $t1, 1");
        break;
    }
    case Instruction::lt:
        output.emplace_back("slt $t1, $t0, $t1");
        break;
    case Instruction::eq:
    {
        output.emplace_back("slt $t2, $t0, $t1");
        output.emplace_back("slt $t1, $t1, $t0");
        append_inst("or $t1, $t1, $t2");
        append_inst("xori $t1, $t1, 1");
        break;
    }
    case Instruction::ne:
    {
        output.emplace_back("slt $t2, $t0, $t1");
        output.emplace_back("slt $t1, $t1, $t0");
        append_inst("or $t1, $t1, $t2");
        break;
    }
    default:
        assert(false);
    }
    store_from_greg(context.inst, Reg::t(1));
    // 处理各种整数比较的情况
    // throw not_implemented_error{__FUNCTION__};
}

void CodeGen::gen_fcmp() {
    load_to_freg(context.inst->get_operand(0), FReg::ft(0));
    load_to_freg(context.inst->get_operand(1), FReg::ft(1));
    switch (context.inst->get_instr_type()) {
    case Instruction::fge:
        output.emplace_back("fcmp.sle.s $fcc0, $ft1, $ft0");
        break;
    case Instruction::fgt:
        output.emplace_back("fcmp.slt.s $fcc0, $ft1, $ft0");
        break;
    case Instruction::fle:
        output.emplace_back("fcmp.sle.s $fcc0, $ft0, $ft1");
        break;
    case Instruction::flt:
        output.emplace_back("fcmp.slt.s $fcc0, $ft0, $ft1");
        break;
    case Instruction::feq:
        output.emplace_back("fcmp.seq.s $fcc0, $ft0, $ft1");
        break;
    case Instruction::fne:
        output.emplace_back("fcmp.sne.s $fcc0, $ft0, $ft1");
        break;
    default:
        assert(false);
    }
    append_inst("bcnez $fcc0, ." + context.func->get_name() + "_fcmp" + std::to_string(context.fcmp_cnt) + "_true");
    append_inst("b ." + context.func->get_name() + "_fcmp" + std::to_string(context.fcmp_cnt) + "_false");

    append_inst("." + context.func->get_name() + "_fcmp" + std::to_string(context.fcmp_cnt) + "_true", ASMInstruction::Label);
    append_inst("addi.w $t0, $zero, 1");
    append_inst("b ." + context.func->get_name() + "_fcmp" + std::to_string(context.fcmp_cnt) + "_exit");

    append_inst("." + context.func->get_name() + "_fcmp" + std::to_string(context.fcmp_cnt) + "_false", ASMInstruction::Label);
    append_inst("addi.w $t0, $zero, 0");
    append_inst("b ." + context.func->get_name() + "_fcmp" + std::to_string(context.fcmp_cnt) + "_exit");

    append_inst("." + context.func->get_name() + "_fcmp" + std::to_string(context.fcmp_cnt) + "_exit", ASMInstruction::Label);
    store_from_greg(context.inst, Reg::t(0));
    context.fcmp_cnt++;
    // 处理各种浮点数比较的情况
    // throw not_implemented_error{__FUNCTION__};
}

void CodeGen::gen_zext() {
    load_to_greg(context.inst->get_operand(0), Reg::t(0));
    append_inst("andi $t1, $t0, 1");
    store_from_greg(context.inst, Reg::t(1));
    // 将窄位宽的整数数据进行零扩展
    // throw not_implemented_error{__FUNCTION__};
}

void CodeGen::gen_call() {
    store_context_regs();// 保存寄存器状态
    auto Func = static_cast<Function* >(context.inst->get_operand(0));
    auto Func_name = Func->get_name();
    unsigned i = 1;
    if(Func->get_basic_blocks().size() == 0) { //判断是否为外部函数
        unsigned a_i, fa_i;
        a_i = fa_i = 0;
        for(auto &arg : Func->get_args())
        {
            auto arg_type = arg.get_type();
            if(arg_type->is_float_type())
                load_to_freg(context.inst->get_operand(i++), FReg::fa(fa_i++));
            else
                load_to_greg(context.inst->get_operand(i++), Reg::a(a_i++));
        }
    }
    else {
        for(auto &arg : Func->get_args())
        {
            auto arg_type = arg.get_type();
            if(arg_type->is_float_type())
            {
                load_to_freg(context.inst->get_operand(i++), FReg::ft(0));
                if(Func->fregmap_.find(&arg) != Func->fregmap_.end())//arg被分配到寄存器中
                    move_from_freg_to_freg(FReg::ft(0), FReg::f((unsigned)Func->fregmap_.find(&arg)->second));
                else//arg被分配到栈上
                {
                    auto offset = Func->stackmap_.at(&arg);
                    if (IS_IMM_12(offset)) {
                        auto offset_str = std::to_string(offset);
                        append_inst(FSTORE SINGLE, {"$ft0", "$sp", offset_str});
                    } else {
                        auto addr = Reg::t(2);
                        load_large_int64(offset, addr);
                        append_inst(ADD DOUBLE, {addr.print(), "$sp", addr.print()});
                        append_inst(FSTORE SINGLE, {"$ft0", addr.print(), "0"});
                    }
                }
            }
            else
            {
                load_to_greg(context.inst->get_operand(i++), Reg::t(0));
                if(Func->gregmap_.find(&arg) != Func->gregmap_.end())//arg被分配到寄存器中
                    move_from_greg_to_greg(Reg::t(0), Reg::r((unsigned)Func->gregmap_.find(&arg)->second));
                else//arg被分配到栈上
                {
                    auto offset = Func->stackmap_.at(&arg);
                    auto offset_str = std::to_string(offset);
                    if (IS_IMM_12(offset)) {
                        if (arg_type->is_int1_type()) {
                            append_inst(STORE BYTE, {"$t0", "$sp", offset_str});
                        } else if (arg_type->is_int32_type()) {
                            append_inst(STORE WORD, {"$t0", "$sp", offset_str});
                        } else { // Pointer
                            append_inst(STORE DOUBLE, {"$t0", "$sp", offset_str});
                        }
                    } else {
                        auto addr = Reg::t(2);
                        load_large_int64(offset, addr);
                        append_inst(ADD DOUBLE, {addr.print(), "$sp", addr.print()});
                        if (arg_type->is_int1_type()) {
                            append_inst(STORE BYTE, {"$t0", addr.print(), "0"});
                        } else if (arg_type->is_int32_type()) {
                            append_inst(STORE WORD, {"$t0", addr.print(), "0"});
                        } else { // Pointer
                            append_inst(STORE DOUBLE, {"$t0", addr.print(), "0"});
                        }
                    }
                }
            }
        }
    }
    append_inst("bl "+Func_name);
    if(not Func->get_return_type()->is_void_type())
    {
        if(Func->get_return_type()->is_float_type())
            store_from_freg(context.inst, FReg::fa(0));
        else
            store_from_greg(context.inst, Reg::a(0));
    }
    load_context_regs();// 恢复寄存器状态
    // throw not_implemented_error{__FUNCTION__};
}

void CodeGen::gen_gep() {
    auto *gepInst = static_cast<GetElementPtrInst *>(context.inst);
    load_to_greg(gepInst->get_operand(0), Reg::t(0));
    auto tmp_type = gepInst->get_operand(0)->get_type()->get_pointer_element_type();
    for(int i=1; i<(int)(gepInst->get_num_operand()); i++)
    {
        auto size = tmp_type->get_size();
        if(size<2048)
            append_inst("addi.w $t2, $zero, " + std::to_string(size));
        else
            load_large_int32(size,Reg::t(2));       //大数组情况
        load_to_greg(gepInst->get_operand(i), Reg::t(1));
        append_inst("mul.w $t1, $t1, $t2" );
        append_inst("add.d $t0, $t0, $t1");
        if(tmp_type->is_array_type())
            tmp_type = tmp_type->get_array_element_type();
    }
    store_from_greg(context.inst, Reg::t(0));
    // 计算内存地址
    // throw not_implemented_error{__FUNCTION__};
}

void CodeGen::gen_sitofp() {
    load_to_greg(context.inst->get_operand(0), Reg::t(0));
    append_inst("movgr2fr.w $ft0, $t0");
    append_inst("ffint.s.w $ft1, $ft0");
    store_from_freg(context.inst, FReg::ft(1));
    // 整数转向浮点数
    // throw not_implemented_error{__FUNCTION__};
}

void CodeGen::gen_fptosi() {
    load_to_freg(context.inst->get_operand(0), FReg::ft(0));
    append_inst("ftintrz.w.s $ft1, $ft0");
    append_inst("movfr2gr.s $t0, $ft1");
    store_from_greg(context.inst, Reg::t(0));
    // 浮点数转向整数，注意向下取整(round to zero)
    // throw not_implemented_error{__FUNCTION__};
}

void CodeGen::gen_phi(BasicBlock* bb) {
    append_inst("gen_phi", ASMInstruction::Comment);
    for (auto &s1 : bb->get_succ_basic_blocks())
        for (auto &instr1 : s1->get_instructions())
        {
            auto instr = &instr1;
            if(!instr->is_phi()) break;
            for(unsigned int i=1; i<=(instr->get_num_operand())/2; i++)
            {   
                BasicBlock* bb1 = dynamic_cast<BasicBlock*>(instr->get_operand(i*2-1));
                if(bb1 == bb)
                {
                    /*if(instr->get_function()->stackmap_.find(instr)!=instr->get_function()->stackmap_.end())
                    {
                        //phi指令的结果是栈上的变量
                        auto offset = instr->get_function()->stackmap_.at(instr); 
                        if(offset<2048)
                            append_inst("addi.d $t0, $fp, " + std::to_string(offset));
                        else
                        {
                            load_large_int64(offset, Reg::t(0));
                            append_inst("add.d $t0, $fp, $t0");
                        }
                        //TODO 将栈式的变量值传递修改为通过寄存器映射表传递,注意判断是否是常数全局变量
                        if(dynamic_cast<ConstantInt*>(instr->get_operand(i*2-2)))
                        {
                            append_inst("addi.w $t1, $zero, " + std::to_string(dynamic_cast<ConstantInt*>(instr->get_operand(i*2-2))->get_value())); 
                            append_inst("st.w $t1, $t0, 0");
                        }
                        else if(dynamic_cast<ConstantFP*>(instr->get_operand(i*2-2)))
                        {
                            load_float_imm(dynamic_cast<ConstantFP*>(instr->get_operand(i*2-2))->get_value(), FReg::ft(0));
                            append_inst("fst.s $ft0, $t0, 0");
                        }
                        else
                        {
                            //move_from 非常量
                            if(instr->get_type()->is_float_type())
                            {
                                if(instr->get_function()->stackmap_.find(instr->get_operand(i*2-2)) != instr->get_function()->stackmap_.end())
                                {
                                    int offset1 = instr->get_function()->stackmap_.at(instr->get_operand(i*2-2));
                                    if(offset1<2048)
                                        append_inst("addi.d $t1, $fp, " + std::to_string(offset1));
                                    else
                                    {
                                        load_large_int64(offset1, Reg::t(1));
                                        append_inst("add.d $t1, $fp, $t1");
                                    }
                                    append_inst("fld.s $ft0, $t1, 0");
                                    append_inst("fst.s $ft0, $t0, 0");
                                }
                                else
                                {
                                    int reg = instr->get_function()->fregmap_.at(instr->get_operand(i*2-2));
                                    move_from_freg_to_freg(FReg::f(reg), FReg::ft(0));
                                    append_inst("fst.s $ft0, $t0, 0");
                                }
                            }
                            else
                            {
                                if(instr->get_function()->stackmap_.find(instr->get_operand(i*2-2)) != instr->get_function()->stackmap_.end())
                                {
                                    int offset1 = instr->get_function()->stackmap_.at(instr->get_operand(i*2-2));
                                    if(offset1<2048)
                                        append_inst("addi.d $t1, $fp, " + std::to_string(offset1));
                                    else
                                    {
                                        load_large_int64(offset1, Reg::t(1));
                                        append_inst("add.d $t1, $fp, $t1");
                                    }
                                    append_inst("ld.w $t0, $t1, 0");
                                }
                                else
                                {
                                    int reg = instr->get_function()->gregmap_.at(instr->get_operand(i*2-2));
                                    move_from_greg_to_greg(Reg::r(reg), Reg::t(0));
                                }
                            }
                        } 
                    }
                    else
                    {
                        if(dynamic_cast<ConstantFP*>(instr->get_operand(i*2-2)))
                        {
                            int reg=instr->get_function()->fregmap_.at(instr);
                            load_float_imm(dynamic_cast<ConstantFP*>(instr->get_operand(i*2-2))->get_value(), FReg::ft(reg));
                        }
                        else if(dynamic_cast<ConstantInt*>(instr->get_operand(i*2-2)))
                        {
                            append_inst("addi.w $t0, $zero, " + std::to_string(dynamic_cast<ConstantInt*>(instr->get_operand(i*2-2))->get_value()));
                            int reg=instr->get_function()->gregmap_.at(instr);
                            move_from_greg_to_greg(Reg::t(0), Reg::r(reg));
                        }
                        else if(instr->get_function()->fregmap_.find(instr->get_operand(i*2-2)) != instr->get_function()->fregmap_.end())
                        {
                            int m_f = instr->get_function()->fregmap_.at(instr->get_operand(i*2-2));
                            int m_t = instr->get_function()->fregmap_.at(instr);
                            if(m_f!=m_t)
                                move_from_freg_to_freg(FReg::f(m_f), FReg::ft(m_t));
                        }
                        else if(instr->get_function()->gregmap_.find(instr->get_operand(i*2-2)) != instr->get_function()->gregmap_.end())
                        {
                            int m_f = instr->get_function()->gregmap_.at(instr->get_operand(i*2-2));
                            int m_t = instr->get_function()->gregmap_.at(instr);
                            if(m_f!=m_t)
                                move_from_greg_to_greg(Reg::r(m_f), Reg::t(m_t));
                        }
                        else 
                        {   //move from stack
                            auto offset = instr->get_function()->stackmap_.at(instr->get_operand(i*2-2));
                            if(offset<2048)
                                append_inst("addi.d $t0, $fp, " + std::to_string(offset));
                            else
                            {
                                load_large_int64(offset, Reg::t(0));
                                append_inst("add.d $t0, $fp, $t0");
                            }
                            if(instr->get_type()->is_float_type())
                            {
                                append_inst("fld.s $ft0, $t0, 0");
                                int reg=instr->get_function()->fregmap_.at(instr);
                                move_from_freg_to_freg(FReg::ft(0), FReg::f(reg));
                            }
                            else
                            {
                                append_inst("ld.w $t0, $t0, 0");
                                int reg=instr->get_function()->gregmap_.at(instr);
                                move_from_greg_to_greg(Reg::t(0), Reg::r(reg));
                            }
                        }
                    }*/
                    if(dynamic_cast<BranchInst*>(context.inst)->is_cond_br())
                    {
                        context.is_cond=true;
                        if(s1->get_name()[0]!='t')
                            break;
                    }
                    else if(context.is_cond)
                    {   //有条件跳转的br
                        if(s1->get_name()[0]!='f')
                            break;
                        context.is_cond=false;
                        append_inst("br tempbb"+ std::to_string(++context.seq));
                        append_inst("tempbb"+std::to_string(context.seq),ASMInstruction::Label);
                    }
                    if(instr->get_type()->is_float_type())
                    {
                        if(instr->get_function()->fregmap_.find(instr->get_operand(i*2-2))!=instr->get_function()->fregmap_.end() and context.floop.find(instr->get_function()->fregmap_.at(instr->get_operand(i*2-2)))!=context.floop.end())
                            move_from_freg_to_freg(FReg::ft(context.floop[instr->get_function()->fregmap_.at(instr->get_operand(i*2-2))]), FReg::ft(0));
                        else
                            load_to_freg(instr->get_operand(i*2-2), FReg::ft(0));
                        if(instr->get_function()->stackmap_.find(instr)==instr->get_function()->stackmap_.end())
                        {
                            context.floop[instr->get_function()->fregmap_.at(instr)]=context.floop.size()+1;     //暂时只将1,2号寄存器做暂存,不考虑大于2个到栈上的情况
                            load_to_freg(instr, FReg::ft(context.floop.size()+1));
                        }
                        store_from_freg(instr, FReg::ft(0));
                    }
                    else
                    {
                        if(instr->get_function()->gregmap_.find(instr->get_operand(i*2-2))!=instr->get_function()->gregmap_.end() and context.gloop.find(instr->get_function()->gregmap_.at(instr->get_operand(i*2-2)))!=context.gloop.end())
                            move_from_greg_to_greg(Reg::t(context.gloop[instr->get_function()->gregmap_.at(instr->get_operand(i*2-2))]), Reg::t(0));
                        else
                            load_to_greg(instr->get_operand(i*2-2), Reg::t(0));
                        load_to_greg(instr->get_operand(i*2-2), Reg::t(0));
                        if(instr->get_function()->stackmap_.find(instr)==instr->get_function()->stackmap_.end())
                            context.gloop[instr->get_function()->gregmap_.at(instr)]=context.gloop.size()+1;
                        store_from_greg(instr, Reg::t(0));
                    }
                    break;
                } 
            }
        }
}

std::string CodeGen::print_init(Constant* init){
    std::string str;
    if(auto init_array = dynamic_cast<ConstantArray*>(init))
    {
        for(int i=0; i<(int)(init_array->get_size_of_array()); i++)
        {
            str += print_init(init_array->get_element_value(i));
            if(i<(int)(init_array->get_size_of_array())-1)
                str += ", ";
        }
            
    }
    else if (auto init_int = dynamic_cast<ConstantInt*>(init))
        return init_int->print();
    else if (auto init_zero = dynamic_cast<ConstantZero*>(init))
        return "0";
    else
        return dynamic_cast<ConstantFP*>(init)->print();
    return str;
}

void CodeGen::run() {
    // 确保每个函数中基本块的名字都被设置好
    // 想一想：为什么？
    m->set_print_name();

    /* 使用 GNU 伪指令为全局变量分配空间
     * 你可以使用 `la.local` 指令将标签 (全局变量) 的地址载入寄存器中, 比如
     * 要将 `a` 的地址载入 $t0, 只需要 `la.local $t0, a`
     */
    if (!m->get_global_variable().empty()) {
        append_inst("Global variables", ASMInstruction::Comment);
        /* 虽然下面两条伪指令可以简化为一条 `.bss` 伪指令, 但是我们还是选择使用
         * `.section` 将全局变量放到可执行文件的 BSS 段, 原因如下:
         * - 尽可能对齐交叉编译器 loongarch64-unknown-linux-gnu-gcc 的行为
         * - 支持更旧版本的 GNU 汇编器, 因为 `.bss` 伪指令是应该相对较新的指令,
         *   GNU 汇编器在 2023 年 2 月的 2.37 版本才将其引入
         */
        append_inst(".text", ASMInstruction::Atrribute);
        append_inst(".section", {".bss", "\"aw\"", "@nobits"},
                    ASMInstruction::Atrribute);
        for (auto &global : m->get_global_variable()) {
            auto size =
                global.get_type()->get_pointer_element_type()->get_size();
            append_inst(".globl", {global.get_name()},
                        ASMInstruction::Atrribute);
            if(!dynamic_cast<ConstantZero*>(global.get_init()))
                append_inst(".data", ASMInstruction::Atrribute);
            append_inst(".type", {global.get_name(), "@object"},
                        ASMInstruction::Atrribute);
            append_inst(".size", {global.get_name(), std::to_string(size)},
                        ASMInstruction::Atrribute);
            append_inst(global.get_name(), ASMInstruction::Label);
            if(!dynamic_cast<ConstantZero*>(global.get_init()))
                append_inst(".word", {print_init(global.get_init())}, ASMInstruction::Atrribute);
            else
                append_inst(".space", {std::to_string(size)},
                        ASMInstruction::Atrribute);
        }
    }

    // 函数代码段
    output.emplace_back(".text", ASMInstruction::Atrribute);
    for (auto &func : m->get_functions()) {
        if (not func.is_declaration()) {
            // 更新 context
            context.clear();
            context.func = &func;

            // 函数信息
            append_inst(".globl", {func.get_name()}, ASMInstruction::Atrribute);
            append_inst(".type", {func.get_name(), "@function"},
                        ASMInstruction::Atrribute);
            append_inst(func.get_name(), ASMInstruction::Label);

            // 分配函数栈帧
            allocate();
            // 生成 prologue
            gen_prologue();

            for (auto &bb : func.get_basic_blocks()) {
                append_inst(label_name(&bb), ASMInstruction::Label);
                for (auto &instr : bb.get_instructions()) {
                    // For debug
                    append_inst(instr.print(), ASMInstruction::Comment);
                    context.inst = &instr; // 更新 context
                    switch (instr.get_instr_type()) {
                    case Instruction::ret:
                        gen_phi(&bb);
                        gen_ret();
                        break;
                    case Instruction::br:
                        gen_phi(&bb);
                        gen_br();
                        break;
                    case Instruction::add:
                    case Instruction::sub:
                    case Instruction::mul:
                    case Instruction::sdiv:
                        gen_binary();
                        break;
                    case Instruction::fadd:
                    case Instruction::fsub:
                    case Instruction::fmul:
                    case Instruction::fdiv:
                        gen_float_binary();
                        break;
                    case Instruction::alloca:
                        gen_alloca();
                        break;
                    case Instruction::load:
                        gen_load();
                        break;
                    case Instruction::store:
                        load_to_greg(context.inst->get_operand(1), Reg::t(0));
                        gen_store(context.inst->get_operand(0));
                        break;
                    case Instruction::ge:
                    case Instruction::gt:
                    case Instruction::le:
                    case Instruction::lt:
                    case Instruction::eq:
                    case Instruction::ne:
                        gen_icmp();
                        break;
                    case Instruction::fge:
                    case Instruction::fgt:
                    case Instruction::fle:
                    case Instruction::flt:
                    case Instruction::feq:
                    case Instruction::fne:
                        gen_fcmp();
                        break;
                    case Instruction::phi:
                        break;
                    case Instruction::call:
                        gen_call();
                        break;
                    case Instruction::getelementptr:
                        gen_gep();
                        break;
                    case Instruction::zext:
                        gen_zext();
                        break;
                    case Instruction::fptosi:
                        gen_fptosi();
                        break;
                    case Instruction::sitofp:
                        gen_sitofp();
                        break;
                    }
                }
            }
            // 生成 epilogue
            gen_epilogue();
        }
    }
}

std::string CodeGen::print() const {
    std::string result;
    for (const auto &inst : output) {
        result += inst.format();
    }
    return result;
}
