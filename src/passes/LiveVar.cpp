#include "LiveVar.hpp"

#include <iostream>
#include <set>

using namespace std;

void LiveVarAnalysis::run() {
    // Code goes here

    // Find the entry block
    for (auto &f1 : m_->get_functions()) {
        BasicBlock* entry;
        auto f = &f1;
        if (f->get_basic_blocks().size() == 0)
            continue;
        for (auto &bb1 : f->get_basic_blocks()) {
            auto bb = &bb1;
            if(bb->get_pre_basic_blocks().size() == 0)
                entry = bb;
        }
        // Tarjan
        tarjanInit();
        tarjan(entry);
        //pseudo_linear_order
        plo_blocks.clear();
        visited.clear();
        pseudo_linear_order(entry);
        std::reverse(plo_blocks.begin(),plo_blocks.end());
        // Initialize the live variable sets for each basic block
        initializeLiveVars();
        // Iterate until convergence
        bool changed = true;
        while (changed) {
            changed = false;

            // Traverse the basic blocks in reverse order
            for (auto it = plo_blocks.begin(); it != plo_blocks.end(); ++it) {
                BasicBlock* bb = *it;

                computeUseDef(bb);
                computeLiveInLiveOut(bb);
                // Update the live variable sets for the current basic block
                if (liveIn[bb] != preliveIn[bb]) {
                    changed = true;
                    preliveIn[bb] = liveIn[bb];
                }

                if (liveOut[bb] != preliveOut[bb]) {
                    changed = true;
                    preliveOut[bb] = liveOut[bb];
                }
            }
        }

        // Print the live variable sets for each basic block
        //printLiveVars();
    }
    
}

void LiveVarAnalysis::tarjanInit()
{
    dfn.clear();
    low.clear();
    instack.clear();
    bbstack.clear();
    scc_belong.clear();
    bb_cnt = scc_cnt = 0;
}

void LiveVarAnalysis::tarjan(BasicBlock* b)
{
    dfn[b] = low[b] = ++bb_cnt;
    instack[b] = true;
    bbstack.push(b);
    for(auto &bb1 : b->get_succ_basic_blocks())
    {
        auto bb = &bb1;
        if(dfn[bb] == 0)
        {
            tarjan(bb);
            low[b] = low[b]<low[bb] ? low[b] : low[bb];
        }
        else if(instack[bb])
            low[b] = low[b]<dfn[bb] ? low[b] : dfn[bb];
    }
    if(dfn[b] == low[b])
    {
        scc_belong[b] = ++scc_cnt;
        while(bbstack.top() != b)
        {
            scc_blong[bbstack.top()] = scc_cnt;
            bbstack.pop();
        }
        bbstack.pop();
    }
}

void LiveVarAnalysis::pseudo_linear_order(BasicBlock* b)
{
    plo_blocks.push_back(b);
    visited[b] = true;
    for(auto &bb1 : b->get_succ_basic_blocks())
    {
        auto bb = &bb1;
        if(scc_belong[bb] == scc_belong[b] && !visited[bb])
            pseudo_linear_order(bb);
    }
    for(auto &bb1 : b->get_succ_basic_blocks())
    {
        auto bb = &bb1;
        if(scc_belong[bb] != scc_belong[b] && !visited[bb])
            pseudo_linear_order(bb);
    }
}