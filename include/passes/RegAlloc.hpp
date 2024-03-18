#pragma once

#include "PassManager.hpp"
#include "LiveVar.hpp"
#include "CodeGenUtil.hpp"

#include <unordered_map>

class RegAlloc : public Pass
{
private:
    std::unique_ptr<LiveVarAnalysis> livevaranalysis_;
    std::unordered_map<Value *, int> gregmap_;
    std::unordered_map<Value *, int> fregmap_;
    std::unordered_map<Value *, int> stackmap_;
    //可分配寄存器为a0-a7 t3-t8 fa0-fa7 ft3-ft15
    std::set<int> unusedgregs_={4,5,6,7,8,9,10,11,15,16,17,18,19,20};
    std::set<int> unusedfregs_={0,1,2,3,4,5,6,7,11,12,13,14,15,16,17,18,19,20,21,22,23};
    unsigned stack_offset_ = PROLOGUE_OFFSET_BASE;; //栈偏移,存储到栈上的变量的偏移
public:
    RegAlloc(Module *m) : Pass(m) {}
    ~RegAlloc() = default;
    void run() override;
    const std::unordered_map<Value *, int>& get_gregmap() const {
        return gregmap_;
    }
    const std::unordered_map<Value *, int>& get_fregmap() const {
        return fregmap_;
    }
    const std::unordered_map<Value *, int>& get_stackmap() const {
        return stackmap_;
    }
    const unsigned get_stack_offset(){
        return stack_offset_;
    }
};

