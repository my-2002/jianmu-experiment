#include "LoopInvariant.hpp"

bool LoopInvariant::is_inv(Value *inst, LoopInfo &loop) 
{  
    if(dynamic_cast<LoadInst*>(inst) ||dynamic_cast<StoreInst*>(inst) ||
    dynamic_cast<CallInst*>(inst) ||dynamic_cast<ReturnInst*>(inst) ||dynamic_cast<BranchInst*>(inst) ||
    dynamic_cast<PhiInst*>(inst) ||dynamic_cast<GetElementPtrInst*>(inst))
        return false;
    if(dynamic_cast<Constant*>(inst)!=nullptr or not undefop_loop(inst, loop))  //常数或循环外指令
        return true;
    auto inst1 = dynamic_cast<Instruction*>(inst);
    for (auto &op : inst1->get_operands()) {
        if (not is_inv(op, loop)) {
            return false;
        }
    }
    return true;
}
    
bool LoopInvariant::undefop_loop(Value* val, LoopInfo &loop)
{
    if (dynamic_cast<Instruction*>(val)==nullptr) {
        return true;
    }
    auto inst = dynamic_cast<Instruction*>(val);
    return loop.bbs.find(inst->get_parent())==loop.bbs.end();
}

void LoopInvariant::run() 
{
    loopfind_ = std::make_unique<LoopFind>(m_);
    loopfind_->run();
    auto loop_info = loopfind_->get_result()->loop_info;
    for (auto &&func : m_->get_functions()) {
        if (func.get_num_basic_blocks() == 0) {
            continue;
        }
        auto func_loop = loop_info.at(&func);
        for (auto &&header : func_loop.get_topo_order()) 
        {
            auto &&loop = func_loop.loops.at(header);
            assert(loop.preheader != nullptr);
            auto preheader = loop.preheader;
            bool changed{true};
            while (changed) {
                std::vector<Instruction *> insts;
                for (auto bb : loop.bbs) {
                    std::vector<Instruction *> bb_insts;
                    for(auto &inst1 : bb->get_instructions())
                    {
                        auto inst = &inst1;
                        if(is_inv(inst, loop))
                            bb_insts.push_back(inst);
                    }
                    insts.insert(insts.end(), bb_insts.begin(), bb_insts.end());
                }
                changed = insts.size() > 0;
                for (auto inst : insts) {
                    preheader->get_instructions().insert(preheader->get_instructions().end(), inst);
                    auto sbb = inst->get_parent();
                    sbb->erase_instr(inst);
                }
            }
        }

    }

}