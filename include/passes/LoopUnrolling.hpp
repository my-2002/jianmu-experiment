#pragma once
#include "LoopFind.hpp"
#include <optional>
#include "Value.hpp"
#include "PassManager.hpp"

class LoopUnrolling final : public Pass {
  public:
    explicit LoopUnrolling(Module *m) : Pass(m) {}
    ~LoopUnrolling() noexcept override = default;
    void run() override;

  private:
    static constexpr int UNROLL_MAX = 10000;

    using LoopInfo = LoopFind::ResultType::LoopInfo;
    using FuncLoopInfo = LoopFind::ResultType::FuncLoopInfo;

    // the loop that has 1 header, 1 body, 1 latch and 1 exit
    struct SimpleLoopInfo {
        std::set<BasicBlock *> bbs, bodies;
        BasicBlock *header{nullptr}, *exit{nullptr}, *preheader{nullptr};
        Value *ind_var{nullptr};
        ConstantInt *initial{nullptr}, *bound{nullptr}, *step{nullptr};
        ICmpInst::OpID icmp_op;
    };

    static std::optional <SimpleLoopInfo>
    parse_simple_loop(BasicBlock *header, const LoopInfo &loop);

    static bool should_unroll(const SimpleLoopInfo &simple_loop);

    static void unroll_simple_loop(const SimpleLoopInfo &simple_loop);

    static void handle_func(Function *func, const FuncLoopInfo &func_loop);
};

