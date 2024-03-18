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

