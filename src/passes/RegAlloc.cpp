#include "RegAlloc.hpp"
struct CompareSecond {
    bool operator()(const std::pair<Value *, std::pair<int, int>>& a, 
                    const std::pair<Value *, std::pair<int, int>>& b) const {
        return a.second.second < b.second.second;
        }
};

void RegAlloc::run()
{
    //livevaranalysis_ = std::make_unique<LiveVarAnalysis>(m_);
    //livevaranalysis_->run();
    //auto var_start_end = livevaranalysis_->getvar_start_end();
    for(auto& func1:m_->get_functions())
    {
        auto func=&func1;
        auto var_start_end=func->var_start_end;
        std::set<std::pair<Value *, std::pair<int, int>>, CompareSecond> alloc_gvalues; //按照结束时间从小到大排序
        std::set<std::pair<Value *, std::pair<int, int>>, CompareSecond> alloc_fvalues; //按照结束时间从小到大排序
        for (auto &it : var_start_end) {
            //区分浮点与整数
            if(it.first->get_type()->is_float_type())
            {
                if(alloc_fvalues.size()>0)    //取出已经结束的活跃变量
                {
                    while(alloc_fvalues.begin()->second.second < it.second.first)
                    {
                        auto temp = *alloc_fvalues.begin();
                        alloc_fvalues.erase(alloc_fvalues.begin());
                        unusedfregs_.emplace(fregmap_[temp.first]);
                        if(alloc_fvalues.size() == 0)
                            break;         
                    }
                }
                if(unusedfregs_.size() > 0) //存在可用寄存器
                {
                    fregmap_.insert(std::make_pair(it.first, *unusedfregs_.begin()));
                    alloc_fvalues.insert(it);
                    unusedfregs_.erase(unusedfregs_.begin());
                }
                else  //溢出操作
                {
                    auto temp = *alloc_fvalues.end();
                    if(temp.second.second > it.second.second)
                    {
                        fregmap_.insert(std::make_pair(it.first, fregmap_[temp.first]));
                        alloc_fvalues.insert(it);
                        fregmap_.erase(temp.first);
                        alloc_fvalues.erase(temp);
                    }
                    else
                        temp=it;
                    stack_offset_ = ALIGN(stack_offset_ + temp.first->get_type()->get_size(), temp.first->get_type()->get_size());
                    stackmap_.insert(std::make_pair(temp.first, -static_cast<int>(stack_offset_)));
                }
            }
            else
            {
                if(alloc_gvalues.size()>0)    //取出已经结束的活跃变量
                {
                    while(alloc_gvalues.begin()->second.second < it.second.first)
                    {
                        auto temp = *alloc_gvalues.begin();
                        alloc_gvalues.erase(alloc_gvalues.begin());
                        unusedgregs_.emplace(gregmap_[temp.first]);
                        if(alloc_gvalues.size() == 0)
                            break;         
                    }
                }
                if(unusedgregs_.size() > 0) //存在可用寄存器
                {
                    gregmap_.insert(std::make_pair(it.first, *unusedgregs_.begin()));
                    alloc_gvalues.insert(it);
                    unusedgregs_.erase(unusedgregs_.begin());
                }
                else  //溢出操作
                {
                    auto temp = *alloc_gvalues.end();
                    if(temp.second.second > it.second.second)
                    {
                        gregmap_.insert(std::make_pair(it.first, gregmap_[temp.first]));
                        alloc_gvalues.insert(it);
                        gregmap_.erase(temp.first);
                        alloc_gvalues.erase(temp);
                    }
                    else
                        temp=it;
                    stack_offset_ = ALIGN(stack_offset_ + temp.first->get_type()->get_size(), temp.first->get_type()->get_size());
                    stackmap_.insert(std::make_pair(temp.first, -static_cast<int>(stack_offset_)));
                }
            }
        }
        func->gregmap_=gregmap_;
        func->fregmap_=fregmap_;
        func->stackmap_=stackmap_;
    }
    
    
}