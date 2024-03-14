#pragma once

#include "PassManager.hpp"
#include "logging.hpp"
#include "Dominators.hpp"
#include "Value.hpp"

class LiveVarAnalysis : public Pass {
private:
    Dominators *domTree;
    std::map<BasicBlock*, std::set<Value*>> liveIn;
    std::map<BasicBlock*, std::set<Value*>> liveOut;
    std::map<BasicBlock*, std::set<Value*>> preliveIn;
    std::map<BasicBlock*, std::set<Value*>> preliveOut;
    std::map<BasicBlock*, std::set<Value*>> use;
    std::map<BasicBlock*, std::set<Value*>> def;

    //强连通分量算法相关
    std::map<BasicBlock*, int> dfn;
    std::map<BasicBlock*, int> low;
    std::map<BasicBlock*, bool> instack;
    std::stack<BasicBlock*> bbstack;
    std::map<BasicBlock*, int> scc_belong;
    int bb_cnt, scc_cnt;

    //伪线性序算法相关
    std::vector<BasicBlock*> plo_blocks;
    std::map<BasicBlock*, bool> visited;

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
            if (inst->is_store()) {
                auto storeInst = static_cast<StoreInst*>(inst);
                def[bb].insert(storeInst->get_operand(1));
                use[bb].insert(storeInst->get_operand(0));
            }
        }
    }

    void computeLiveInLiveOut(BasicBlock *bb) {
        std::set<Value*> liveInSet;
        std::set<Value*> liveOutSet;
        for (auto succ : domTree->get_dom_tree_succ_blocks(bb)) {
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
    void run() override;
    const std::map<BasicBlock*, std::set<Value*>>& getLiveIn() const {
        return liveIn;
    }

    const std::map<BasicBlock*, std::set<Value*>>& getLiveOut() const {
        return liveOut;
    }

    const std::map<BasicBlock*, std::set<Value*>>& getUse() const {
        return use;
    }

    const std::map<BasicBlock*, std::set<Value*>>& getDef() const {
        return def;
    }
};

