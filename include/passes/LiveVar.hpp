#pragma once

#include "PassManager.hpp"
//#include "logging.hpp"
#include <stack>
#include "Dominators.hpp"
#include "Value.hpp"
struct CompareFirst {
    bool operator()(const std::pair<int, int>& left, const std::pair<int, int>& right) {
        return left.first < right.first;
    }
};
class LiveVarAnalysis : public Pass {
private:
    Dominators *domTree;
    std::map<BasicBlock*, std::set<Value*>> liveIn;
    std::map<BasicBlock*, std::set<Value*>> liveOut;
    std::map<BasicBlock*, std::set<Value*>> preliveIn;
    std::map<BasicBlock*, std::set<Value*>> preliveOut;
    std::map<BasicBlock*, std::set<Value*>> use;
    std::map<BasicBlock*, std::set<Value*>> def;
    std::map<Value*, std::pair<int, int>,CompareFirst> var_start_end;  //按照起始位置排序
    std::vector<Instruction*> insts;
    std::map<BasicBlock*, std::pair<int,int>> bb_start_end;

    //强连通分量算法相关
    std::map<BasicBlock*, int> dfn;
    std::map<BasicBlock*, int> low;
    std::map<BasicBlock*, bool> instack;
    std::stack<BasicBlock*> bbstack;
    std::map<BasicBlock*, int> scc_belong;
    int bb_cnt, scc_cnt;
    void tarjanInit();
    void tarjan(BasicBlock* );

    //伪线性序算法相关
    std::vector<BasicBlock*> plo_blocks;
    std::map<BasicBlock*, bool> visited;
    void pseudo_linear_order(BasicBlock*);

    static inline bool is_global_variable(Value *l_val) {
        return dynamic_cast<GlobalVariable *>(l_val) != nullptr;
    }
    static inline bool is_constant(Value *l_val) {
        return dynamic_cast<Constant *>(l_val) != nullptr;
    } //记得加常量判断
    void initializeLiveVars()
    {
        liveIn.clear();
        liveOut.clear();
        use.clear();
        def.clear();
        preliveIn.clear();
        preliveOut.clear();
    }

    void computeUseDef(BasicBlock *bb) {
        for (auto &inst1 : bb->get_instructions()) {
            auto inst = &inst1;
            for(auto op : inst->get_operands())
            {
                if(!is_global_variable(op) && !is_constant(op) && def[bb].count(op) == 0 && !dynamic_cast<BasicBlock*>(op))
                    use[bb].insert(op);
            }
            if(!inst->is_void())
            {
                if(!is_global_variable(inst) and !is_constant(inst) && use[bb].count(inst) == 0)
                    def[bb].insert(inst);
            }
            /*
            if (inst->is_store()) {
                auto storeInst = static_cast<StoreInst*>(inst);
                if(!is_global_variable(storeInst->get_operand(1)) and !is_constant(storeInst->get_operand(1)))
                    use[bb].insert(storeInst->get_operand(1));
                if(!is_global_variable(storeInst->get_operand(0)) and !is_constant(storeInst->get_operand(0)))
                    use[bb].insert(storeInst->get_operand(0));
            }
            if(inst->is_load()){
                auto loadInst = static_cast<LoadInst*>(inst);
                def[bb].insert(loadInst);
                if (!is_global_variable(loadInst->get_operand(1)) and !is_constant(loadInst->get_operand(1)))
                    use[bb].insert(loadInst->get_operand(0));
            }
            if(inst->is_call()){
                auto callInst = static_cast<CallInst*>(inst);
                if(!callInst->get_function_type()->is_void_type())
                {
                    if(!is_global_variable(callInst) and !is_constant(callInst))
                        def[bb].insert(callInst);
                }
                for(auto arg : callInst->get_operands()){
                    if(!is_global_variable(arg) and !is_constant(arg))
                            use[bb].insert(arg);
                }    
            }
            if(inst->is_ret())
            {
                auto retInst = static_cast<ReturnInst*>(inst);
                if(!retInst->is_void_ret())
                {
                    if(!is_global_variable(retInst->get_operand(0)) and !is_constant(retInst->get_operand(0)))
                        use[bb].insert(retInst->get_operand(0));
                } 
            }
            if(inst->isBinary()||inst->is_cmp() || inst->is_fcmp())
            {
                if(!is_global_variable(inst->get_operand(0)) and !is_constant(inst->get_operand(0)))
                    use[bb].insert(inst->get_operand(0));
                if(!is_global_variable(inst->get_operand(1)) and !is_constant(inst->get_operand(1)))
                    use[bb].insert(inst->get_operand(1));
                if(!is_global_variable(inst) and !is_constant(inst))
                    def[bb].insert(inst);
            }
            if(inst->is_br())
            {
                auto brInst = static_cast<BranchInst*>(inst);
                if(brInst->is_cond_br())
                {
                    if(!is_global_variable(brInst->get_operand(0)) and !is_constant(brInst->get_operand(0)))
                        use[bb].insert(brInst->get_operand(0));
                }
            }
            if(inst->is_zext() or inst->is_fp2si() or inst->is_si2fp())
            {
                if(!is_global_variable(inst->get_operand(0)) and !is_constant(inst->get_operand(0)))
                    use[bb].insert(inst->get_operand(0));
                if(!is_global_variable(inst) and !is_constant(inst))
                    def[bb].insert(inst);
            }
            if(inst->is_gep())
            {
                auto gepInst = static_cast<GetElementPtrInst*>(inst);
                if(!is_global_variable(inst) and !is_constant(inst))
                    def[bb].insert(inst);
                for(auto op : gepInst->get_operands())
                {
                    if(!is_global_variable(op) and !is_constant(op))
                        use[bb].insert(op);
                }
        }*/

        }
    }
    void computeLiveInLiveOut(BasicBlock *bb) {
        std::set<Value*> liveInSet;
        std::set<Value*> liveOutSet;
        for (auto succ : bb->get_succ_basic_blocks()) {
            liveOutSet.insert(liveIn[succ].begin(), liveIn[succ].end());
        }
        liveOut[bb] = liveOutSet;
        liveInSet = use[bb];
        for (auto val : liveOutSet) {
            if (def[bb].find(val) == def[bb].end()) {
                liveInSet.insert(val);
            }
        }
        liveIn[bb] = liveInSet;
    }

        void printLiveVarAnalysis();

    public:
        explicit LiveVarAnalysis(Module *m) : Pass(m) {}
        ~LiveVarAnalysis() noexcept override = default;
        void run() override;
        const std::map<Value*, std::pair<int, int>,CompareFirst>& getvar_start_end() const {
            return var_start_end;
        }
};

