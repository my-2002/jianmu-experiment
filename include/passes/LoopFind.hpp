#pragma once

#include "BasicBlock.hpp"
#include "Dominators.hpp"
#include <optional>
#include <unordered_map>
#include <vector>

class LoopFind final : public Pass {
  public:

    LoopFind(Module *m) : Pass(m) {}
    ~LoopFind() = default;
    struct ResultType {
        struct LoopInfo {
            std::vector<BasicBlock *> latches;
            std::set<BasicBlock *> bbs;
            BasicBlock *preheader;
            std::map<BasicBlock *, BasicBlock *> exits;
            std::set<BasicBlock *> sub_loops;
            struct IndVarInfo {
                Value *ind_var, *initial, *step, *bound;
                ICmpInst::OpID icmp_op;
            };
            std::optional<IndVarInfo> ind_var_info{std::nullopt};
        };
        struct FuncLoopInfo {
            std::unordered_map<BasicBlock *, LoopInfo> loops;
            std::vector<BasicBlock *> get_topo_order() const;
        };
        // ((func, ((header, loop_info)...))...)
        std::unordered_map<Function *, FuncLoopInfo> loop_info;
    };

    void run() override;

    const ResultType* get_result() const { return &_result; }

  private:
    using LoopInfo = ResultType::LoopInfo;

    std::set<BasicBlock *> find_bbs_by_latch(BasicBlock *header,
                                                BasicBlock *latch);
    auto parse_ind_var(BasicBlock *header, const LoopInfo &loop)
        -> std::optional<LoopInfo::IndVarInfo>;

    ResultType _result;
    std::unique_ptr<Dominators> dominators_;
};
