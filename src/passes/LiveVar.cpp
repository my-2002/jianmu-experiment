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
        //开始精细化区间划分
        //指令编号
        int cur_num = 0;
        for (auto it = plo_blocks.begin(); it != plo_blocks.end(); ++it) {
            BasicBlock* bb = *it;
            bb_start_end[bb].first = cur_num;
            for(auto &inst1 : bb->get_instructions())
            {
                auto inst = &inst1;
                insts.push_back(inst);
                cur_num+=2;
            }
            bb_start_end[bb].second = cur_num-1;
            //出口变量初始化为BB开始到结束
            for(auto val:liveOut[bb])
            {
                if(var_start_end.find(val)==var_start_end.end())
                    var_start_end[val]=make_pair(bb_start_end[bb].first,bb_start_end[bb].second);
                else
                {//合并同一变量的区间
                    var_start_end[val].first = var_start_end[val].first<bb_start_end[bb].first?var_start_end[val].first:bb_start_end[bb].first;
                    var_start_end[val].second = var_start_end[val].second>bb_start_end[bb].second?var_start_end[val].second:bb_start_end[bb].second;
                }
            }
        }
        //逆序遍历
        cur_num -=2; //指向最后一条指令
        for (auto it = insts.rbegin(); it != insts.rend(); ++it) {
            Instruction* inst = *it;
            auto bb=inst->get_parent();
            for(auto op : inst->get_operands())
            {
                if(!is_global_variable(op) && !is_constant(op))
                {
                    if(var_start_end.find(op)==var_start_end.end())  //最后一次使用该变量
                        var_start_end[op].second=cur_num;
                }
            }
            if(!inst->is_void())
            {
                if(!is_global_variable(inst) and !is_constant(inst))
                {
                    if(inst->is_phi())
                    {
                        var_start_end[inst].first=bb_start_end[bb].first;
                    }
                    else
                    {
                       var_start_end[inst].first=cur_num+1;
                    }
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