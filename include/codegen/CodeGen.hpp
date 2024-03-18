#pragma once

#include "ASMInstruction.hpp"
#include "Module.hpp"
#include "Register.hpp"
#include "RegAlloc.hpp"

#include <unordered_map>

class CodeGen {
  public:
    explicit CodeGen(Module *module) : m(module) {}

    std::string print() const;

    void run();

    template <class... Args> void append_inst(Args... arg) {
        output.emplace_back(arg...);
    }

    void
    append_inst(const char *inst, std::initializer_list<std::string> args,
                ASMInstruction::InstType ty = ASMInstruction::Instruction) {
        auto content = std::string(inst) + " ";
        for (const auto &arg : args) {
            content += arg + ", ";
        }
        content.pop_back();
        content.pop_back();
        output.emplace_back(content, ty);
    }

  private:
    void allocate();

    // 向寄存器中装载数据
    void load_to_greg(Value *, const Reg &);
    void load_to_freg(Value *, const FReg &);
    void load_from_stack_to_greg(Value *, const Reg &);

    // 向寄存器中加载立即数
    void load_large_int32(int32_t, const Reg &);
    void load_large_int64(int64_t, const Reg &);
    void load_float_imm(float, const FReg &);

    // 将寄存器中的数据保存回栈上
    void store_from_greg(Value *, const Reg &);
    void store_from_freg(Value *, const FReg &);

    // 转移寄存器之间的数据
    void move_from_greg_to_greg(const Reg &, const Reg &);
    void move_from_freg_to_freg(const FReg &, const FReg &);

    void gen_prologue();
    void gen_ret();
    void gen_br();
    void gen_binary();
    void gen_float_binary();
    void gen_alloca();
    void gen_load();
    void gen_store(Value *);
    void gen_icmp();
    void gen_fcmp();
    void gen_zext();
    void gen_call();
    void gen_gep();
    void gen_sitofp();
    void gen_fptosi();
    void gen_epilogue();
    void gen_phi(BasicBlock*);

    std::string print_init(Constant*);

    static std::string label_name(BasicBlock *bb) {
        return "." + bb->get_parent()->get_name() + "_" + bb->get_name();
    }

    struct {
        /* 随着ir遍历设置 */
        Function *func{nullptr};    // 当前函数
        Instruction *inst{nullptr}; // 当前指令
        /* 在allocate()中设置 */
        unsigned frame_size{0}; // 当前函数的栈帧大小
        int fcmp_cnt;
        std::unordered_map<Value *, int> offset_map{}; // 指针相对 fp 的偏移
        std::unordered_map<Value* ,int> alloc_map{};

        void clear() {
            func = nullptr;
            inst = nullptr;
            frame_size = 0;
            fcmp_cnt = 0;
            offset_map.clear();
            alloc_map.clear();
        }

    } context;

    Module *m;
    std::unique_ptr<RegAlloc> regalloc_;
    std::list<ASMInstruction> output;
};
