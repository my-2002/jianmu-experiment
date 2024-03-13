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
    std::map<BasicBlock*, std::set<Value*>> gen;
    std::map<BasicBlock*, std::set<Value*>> kill;

    void initializeLiveVars()
    {
        liveIn.clear();
        liveOut.clear();
        gen.clear();
        kill.clear();
        preliveIn.clear();
        preliveOut.clear();
    }

    void computeGenKill(BasicBlock *bb) {
        for (auto &inst1 : bb->get_instructions()) {
            auto inst = &inst1;
            if (inst->is_store()) {
                auto storeInst = static_cast<StoreInst*>(inst);
                kill[bb].insert(storeInst->get_operand(1));
                gen[bb].insert(storeInst->get_operand(0));
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
        liveInSet = gen[bb];
        for (auto val : liveOutSet) {
            if (kill[bb].find(val) == kill[bb].end()) {
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

    const std::map<BasicBlock*, std::set<Value*>>& getGen() const {
        return gen;
    }

    const std::map<BasicBlock*, std::set<Value*>>& getKill() const {
        return kill;
    }
};

