#include "GepTrans.hpp"
#include "Instruction.hpp"
#include <stack>
void GepTrans::run() {
    for (auto &func1 : m_->get_functions()) {
        if(func1.is_declaration()) continue;
        auto func = &func1;
        for (auto &bb : func->get_basic_blocks()) {
            auto bb1 = &bb;
            auto num = 0;
            std::map<int , std::stack<Instruction *>> gep_insert;
            for (auto &inst : bb1->get_instructions()) {
                if (auto gep = dynamic_cast<GetElementPtrInst *>(&inst)) {
                    auto tmp_type = gep->get_operand(0)->get_type()->get_pointer_element_type();
                    int index = 0; 
                    IBinaryInst * inst2; 
                    for(int i=1; i<(int)(gep->get_num_operand()); i++)
                    {
                        auto size = tmp_type->get_size();
                        auto temp = gep->get_operand((unsigned)i);
                        auto inst1 = IBinaryInst::create_mul(temp,ConstantInt::get(int(size),m_),bb1);
                        if(i == 1)
                            inst2 = IBinaryInst::create_add(inst1,ConstantInt::get(int(index),m_),bb1);
                        else 
                            inst2 = IBinaryInst::create_add(inst1,inst2,bb1);
                        gep_insert[num].push(inst1);
                        gep_insert[num].push(inst2);
                        if(tmp_type->is_array_type())
                            tmp_type = tmp_type->get_array_element_type();
                    }
                    std::vector<Value*> idx;
                    idx.push_back(inst2);
                    auto inst3 = GetElementPtrInst::create_gep(gep->get_operand(0), idx, bb1);
                    gep_insert[num].push(inst3);
                    gep->replace_all_use_with(inst3);    //原gep指令死代码自动删除
                }
                num++;
            }
            for(auto it = gep_insert.rbegin(); it != gep_insert.rend(); it++)
            {
                auto temp = bb1->get_instructions().begin();
                std::advance(temp,it->first);
                while(!it->second.empty())
                {
                    bb1->get_instructions().insert(temp,it->second.top());
                    it->second.pop();
                    temp--;
                }
            }
        }
    }
}