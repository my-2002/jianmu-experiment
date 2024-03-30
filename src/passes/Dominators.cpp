#include "Dominators.hpp"
#include <list>
#include <map>
#include <vector>

void Dominators::run() {
    for (auto &f1 : m_->get_functions()) {
        auto f = &f1;
        if (f->get_basic_blocks().size() == 0)
            continue;
        for (auto &bb1 : f->get_basic_blocks()) {
            auto bb = &bb1;
            idom_.insert({bb, {}});
            dom_frontier_.insert({bb, {}});
            dom_tree_succ_blocks_.insert({bb, {}});
        }

        create_idom(f);
        create_dominance_frontier(f);
        create_dom_tree_succ(f);
    }
}

void Dominators::DFS(BasicBlock* b)
{
    bb_vis_.at(b) = true;
    for (auto &bb1 : b->get_succ_basic_blocks())
        if(!bb_vis_[bb1])
            DFS(bb1);
    bb_vector_.push_back(b);
    bb_postorder_.insert({b, bb_vector_.size()});
}

BasicBlock* Dominators::intersect(BasicBlock* b1, BasicBlock *b2)
{
    int f1 = bb_postorder_.at(b1);
    int f2 = bb_postorder_.at(b2);
    while(f1 != f2)
    {
        while(f1 < f2)
        {
            b1 = idom_.at(b1);
            f1 = bb_postorder_.at(b1);
        }
        while(f1 > f2)
        {
            b2 = idom_.at(b2);
            f2 = bb_postorder_.at(b2);
        }
    }
    return bb_vector_[f1-1];
}

void Dominators::create_idom(Function *f) {
    bb_vis_.clear();bb_postorder_.clear();bb_vector_.clear();
    for (auto &bb1 : f->get_basic_blocks())
    {
        auto bb = &bb1;
        bb_vis_.insert({bb, false});
    }
    DFS(f->get_entry_block());//DFS进行后序遍历
    idom_.at(f->get_entry_block()) = f->get_entry_block();
    bool changed = true;
    while(changed)
    {
        changed = false;
        for (int i = bb_vector_.size() - 2; i >=0 ; i--)
        {
            std::list<BasicBlock*> bb_pre = bb_vector_[i]->get_pre_basic_blocks();
            BasicBlock* new_idom = bb_pre.front();
            for(auto &iter : bb_pre)
            {
                if(iter == new_idom) continue;
                if(idom_.at(iter))
                    new_idom = intersect(iter, new_idom);
            }
            if(new_idom != idom_[bb_vector_[i]])
            {
                idom_[bb_vector_[i]] = new_idom;
                changed = true;
            }
        }
    }
    //  分析得到 f 中各个基本块的 idom
}

void Dominators::create_dominance_frontier(Function *f) {
    for (auto &bb1 : f->get_basic_blocks()) 
    {
        auto bb = &bb1;
        std::list<BasicBlock*> bb_pre = bb -> get_pre_basic_blocks();
        if(bb_pre.size() >= 2)
            for(auto &runner : bb_pre)
                while(runner != idom_.at(bb))
                {
                    (dom_frontier_.at(runner)).insert(bb);
                    runner = idom_.at(runner);
                }
    }
    //  分析得到 f 中各个基本块的支配边界集合
}

void Dominators::create_dom_tree_succ(Function *f) {
    for (auto &bb1 : f->get_basic_blocks())
    {
        auto bb = &bb1;
        if(idom_.at(bb) && idom_.at(bb) != bb)
            (dom_tree_succ_blocks_.at(idom_.at(bb))).insert(bb);
    }
    //  分析得到 f 中各个基本块的支配树后继
}
