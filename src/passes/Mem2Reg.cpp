#include "Mem2Reg.hpp"
#include "IRBuilder.hpp"
#include "Value.hpp"
#include "Constant.hpp"
#include <memory>
#include <set>
#include <map>

void Mem2Reg::run() {
    // 创建支配树分析 Pass 的实例
    dominators_ = std::make_unique<Dominators>(m_);
    // 建立支配树
    dominators_->run();
    // 以函数为单元遍历实现 Mem2Reg 算法
    for (auto &f : m_->get_functions()) {
        std::map<Value*, Instruction *> rm_undef_phi;
        //unsigned int num=0;
        if (f.is_declaration())
            continue;
        func_ = &f;
        if (func_->get_basic_blocks().size() >= 1) {
            // 对应伪代码中 phi 指令插入的阶段
            generate_phi();
            // 对应伪代码中重命名阶段
            rename(func_->get_entry_block());
        }
    }
}

void Mem2Reg::generate_phi() {
    std::map<Value*, std::set<BasicBlock*>> global_name;
    std::map<Value*, std::set<BasicBlock*>> defs;
    for (auto &bb1 : func_->get_basic_blocks())
        for (auto &instr1 : bb1.get_instructions())
        {
            auto instr = &instr1;
            if(instr->is_alloca())
            {
                auto all = dynamic_cast<AllocaInst*>(instr);
                if(not all->get_alloca_type()->is_array_type())
                {
                    global_name.insert({instr, {}});
                    defs.insert({instr, {}});
                    value_stack_.insert({instr, {}});
                }
            }
        }
    for (auto &bb1 : func_->get_basic_blocks())
    {
        auto bb = &bb1;
        for (auto &instr1 : bb->get_instructions())
        {
            auto instr = &instr1;
            if(instr->is_load())
            {
                Value* val = instr->get_operand(0);
                (global_name[val]).insert(bb);
            }
            if(instr->is_store())
            {
                Value* val = instr->get_operand(1);
                (global_name[val]).insert(bb);
                (defs[val]).insert(bb);
            }
        }
    }
    for(auto &it : global_name)
    {
        if((it.second).size() <= 1)
            continue;//剪枝操作
        std::set<BasicBlock*> F;
        std::set<BasicBlock*> W = defs[it.first];
        while(!W.empty())
        {
            BasicBlock* X = *(W.begin());
            W.erase(W.begin());
            for (auto &Y : dominators_->get_dominance_frontier(X))
            {
                if(!F.count(Y))
                {
                    auto phi = PhiInst::create_phi(it.first->get_type()->get_pointer_element_type(), Y, {}, {});
                    phi_belong_.insert({phi, it.first});
                    Y->add_instr_begin(phi);
                    F.insert(Y);
                    if(!defs[it.first].count(Y))
                        W.insert(Y);
                }
            }
        }
    }
    // 
    // 步骤一：找到活跃在多个 block 的全局名字集合，以及它们所属的 bb 块
    // 步骤二：从支配树获取支配边界信息，并在对应位置插入 phi 指令
}

void Mem2Reg::rename(BasicBlock *bb) {
    std::set<Instruction*> st_inst_;
    for (auto &instr1 : bb->get_instructions())
    {
        auto instr = &instr1;
        if(instr->is_phi())
        {
            auto phi = dynamic_cast<PhiInst*>(instr);
            Value* i = phi_belong_[phi];
            value_stack_[i].push(instr);
        }
        if(instr->is_store() && is_valid_ptr(instr->get_operand(1)) && not instr->get_operand(0)->get_type()->is_array_type())
        {
            value_stack_[instr->get_operand(1)].push(instr->get_operand(0));
            st_inst_.insert(instr);
        }
        //对于store数组的情况, 不需要进行处理
        /*else if(instr->is_store() && instr->get_operand(1)->get_type()->is_array_type())
        {
            auto array_type = static_cast<ArrayType*>(instr->get_operand(1)->get_type());
            auto array_size = array_type->get_num_of_elements();
            for (size_t i = 0; i < array_size; ++i)
            {
                auto element = dynamic_cast<ConstantArray*>(instr->get_operand(0))->get_element_value(i);
                auto desptr = IRBuilder::create_gep(instr->get_operand(1), {ConstantInt::get(0, 32), ConstantInt::get(i, 32)});
                value_stack_[desptr].push(element);
            }
              st_inst_.insert(instr);
        }*/
        if(instr->is_load())
        {
            Value* i = instr->get_operand(0);
            if(is_valid_ptr(i) && value_stack_[i].top())
                instr->replace_all_use_with(value_stack_[i].top());
        }
    }
    for (auto &s1 : bb->get_succ_basic_blocks())
        for (auto &instr1 : s1->get_instructions())
        {
            auto instr = &instr1;
            if(!instr->is_phi()) break;
            auto phi = dynamic_cast<PhiInst*>(instr);
            if(!value_stack_[phi_belong_[phi]].empty() && value_stack_[phi_belong_[phi]].top())
                phi->add_phi_pair_operand(value_stack_[phi_belong_[phi]].top(), bb);
        }

    for (auto &s1 : dominators_->get_dom_tree_succ_blocks(bb))
        rename(s1);
    for (auto &instr1 : bb->get_instructions())
    {
        auto instr = &instr1;
        if(instr->is_store() && is_valid_ptr(instr->get_operand(1)))
            value_stack_[instr->get_operand(1)].pop();
        if(instr->is_phi())
        {
            auto phi = dynamic_cast<PhiInst*>(instr);
            value_stack_[phi_belong_[phi]].pop();
        }
    }
    for (auto &instr1 : st_inst_)
        bb->erase_instr(instr1);
        
    // 
    // 步骤三：将 phi 指令作为 lval 的最新定值，lval 即是为局部变量 alloca 出的地址空间
    // 步骤四：用 lval 最新的定值替代对应的load指令
    // 步骤五：将 store 指令的 rval，也即被存入内存的值，作为 lval 的最新定值
    // 步骤六：为 lval 对应的 phi 指令参数补充完整
    // 步骤七：对 bb 在支配树上的所有后继节点，递归执行 re_name 操作
    // 步骤八：pop出 lval 的最新定值
    // 步骤九：清除冗余的指令
}
