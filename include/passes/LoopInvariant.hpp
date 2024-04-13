#pragma once
#include "LoopFind.hpp"
#include "Value.hpp"
#include "PassManager.hpp"

class LoopInvariant final : public Pass {
    public:
        LoopInvariant(Module *m) : Pass(m) {}
        ~LoopInvariant() = default;
        void run() override;

    private:
        std::unique_ptr<LoopFind> loopfind_;

        using LoopInfo = LoopFind::ResultType::LoopInfo;
        using FuncLoopInfo = LoopFind::ResultType::FuncLoopInfo;

        bool is_inv(Value* inst, LoopInfo &loop); //判断循环不变式
        bool undefop_loop(Value* val, LoopInfo &loop); //判断操作数是否在循环中被定义
};