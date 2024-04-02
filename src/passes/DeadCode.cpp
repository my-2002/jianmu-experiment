#include "DeadCode.hpp"
#include "BasicBlock.hpp"
#include "Constant.hpp"
#include "Instruction.hpp"
#include "logging.hpp"

// 处理流程：两趟处理，mark 标记有用变量，sweep 删除无用指令
void DeadCode::run() {
    bool changed{};
    func_info->run();
    do {
        changed = false;
        for (auto &F : m_->get_functions()) {
            auto func = &F;
            mark(func);
            changed |= sweep(func);
        }
    } while (changed);
    LOG_INFO << "dead code pass erased " << ins_count << " instructions";
    transfer_undef_phi();
}

void DeadCode::mark(Function *func) {
    work_list.clear();
    marked.clear();

    for (auto &bb : func->get_basic_blocks()) {
        for (auto &ins : bb.get_instructions()) {
            if (is_critical(&ins)) {
                marked[&ins] = true;
                work_list.push_back(&ins);
            }
        }
    }

    while (work_list.empty() == false) {
        auto now = work_list.front();
        work_list.pop_front();

        mark(now);
    }
}

void DeadCode::mark(Instruction *ins) {
    for (auto op : ins->get_operands()) {
        auto def = dynamic_cast<Instruction *>(op);
        if (def == nullptr)
            continue;
        if (marked[def])
            continue;
        if (def->get_function() != ins->get_function())
            continue;
        marked[def] = true;
        work_list.push_back(def);
    }
}

bool DeadCode::sweep(Function *func) {
    std::unordered_set<Instruction *> wait_del{};
    for (auto &bb : func->get_basic_blocks()) {
        for (auto it = bb.get_instructions().begin();
             it != bb.get_instructions().end();) {
            if (marked[&*it]) {
                ++it;
                continue;
            } else {
                auto tmp = &*it;
                wait_del.insert(tmp);
                it++;
            }
        }
    }
    for (auto inst : wait_del)
        inst->remove_all_operands();
    for (auto inst : wait_del)
        inst->get_parent()->get_instructions().erase(inst);
    ins_count += wait_del.size();
    return not wait_del.empty(); // changed
}

bool DeadCode::is_critical(Instruction *ins) {
    // 对纯函数的无用调用也可以在删除之列
    if (ins->is_call()) {
        auto call_inst = dynamic_cast<CallInst *>(ins);
        auto callee = dynamic_cast<Function *>(call_inst->get_operand(0));
        if (func_info->is_pure_function(callee))
            return false;
        return true;
    }
    if (ins->is_br() || ins->is_ret())
        return true;
    if (ins->is_store())
        return true;
    return false;
}

void DeadCode::transfer_undef_phi(){
    for(auto &F : m_->get_functions())
    {
        auto func = &F;
        std::map<std::pair<Value*, BasicBlock*>, Instruction *> rm_undef_phi;
        for(auto &bbs:func->get_basic_blocks())
        {
            auto bb = &bbs;
            for(auto &inst:bb->get_instructions())
            {
                auto instr = &inst;
                if(instr->is_phi())
                {
                    int cnt = 0;
                    std::pair<Value*, BasicBlock*> record;
                    for(unsigned i = 0; i < instr->get_num_operand(); i+=2)
                        if(instr->get_operand(i))
                        {
                            cnt++;
                            record = std::make_pair(instr->get_operand(i), dynamic_cast<BasicBlock*>(instr->get_operand(i+1)));
                        } 
                    if(cnt==1)
                        rm_undef_phi.insert({record, instr});
                }
                else if(not instr->is_phi())
                    break;  
            }
            for(auto &rm:rm_undef_phi)
            {
                Instruction* new_inst;
                auto insert_place = rm.first.second->get_instructions().end();
                insert_place--;
                while((*insert_place).is_br() || (*insert_place).is_ret())
                    insert_place--;
                if(rm.first.first->get_type()->is_int32_type())
                    new_inst = IBinaryInst::create_add(rm.first.first,ConstantZero::get(rm.first.first->get_type(),m_),bb);
                else if (rm.first.first->get_type()->is_float_type())
                    new_inst = FBinaryInst::create_fadd(rm.first.first,ConstantZero::get(rm.first.first->get_type(),m_),bb);
                else 
                {
                    auto temp = ZextInst::create_zext_to_i32(rm.first.first, bb);
                    rm.first.second->get_instructions().insert(insert_place, temp);
                    insert_place++;
                    new_inst = ICmpInst::create_ne(temp, ConstantInt::get(0, m_), bb);
                }
                rm.first.second->get_instructions().insert(insert_place, new_inst);
                rm.second->replace_all_use_with(new_inst);
            }
            for(auto &rm:rm_undef_phi)
                bb->get_instructions().erase(rm.second);
            rm_undef_phi.clear();
        }
    }
}