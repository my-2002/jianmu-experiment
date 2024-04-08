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

    void get_analysis_usage(AnalysisUsage &AU) const final {
        using KillType = AnalysisUsage::KillType;
        AU.set_kill_type(KillType::None);
        AU.add_require<Dominator>();
    }

    std::any get_result() const final { return &_result; }

    void run() override;

    void clear() {
        _result.loop_info.clear();
        _dom = nullptr;
        _m = nullptr;
    }

  private:
    using LoopInfo = ResultType::LoopInfo;

    std::set<BasicBlock *> find_bbs_by_latch(BasicBlock *header,
                                                BasicBlock *latch);
    auto parse_ind_var(ir::BasicBlock *header, const LoopInfo &loop)
        -> std::optional<LoopInfo::IndVarInfo>;
    void log() const;

    ResultType _result;
    std::unique_ptr<Dominators> dominators_;
};
