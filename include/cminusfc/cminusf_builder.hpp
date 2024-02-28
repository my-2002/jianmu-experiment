#pragma once

#include "BasicBlock.hpp"
#include "Constant.hpp"
#include "Function.hpp"
#include "IRBuilder.hpp"
#include "Module.hpp"
#include "Type.hpp"
#include "ast.hpp"
#include "Array.hpp"

#include <map>
#include <memory>

typedef struct Info{
    Value* val;
    bool is_const;
}Info;

class Scope {
  public:
    // enter a new scope
    void enter() { inner.emplace_back(); }

    // exit a scope
    void exit() { inner.pop_back(); }

    bool in_global() { return inner.size() == 1; }

    // push a name to scope
    // return true if successful
    // return false if this name already exits
    bool push(const std::string& name, Value *val, bool is_const) {
        Info* info = new Info();
        info->val = val;
        info->is_const = is_const;
        auto result = inner[inner.size() - 1].insert({name, info});
        return result.second;
    }

    Info* find(const std::string& name) {
        for (auto s = inner.rbegin(); s != inner.rend(); s++) {
            auto iter = s->find(name);
            if (iter != s->end()) {
                return iter->second;
            }
        }

        // Name not found: handled here?
        assert(false && "Name not found in scope");

        return nullptr;
    }

  private:
    std::vector<std::map<std::string, Info*>> inner;
};

class CminusfBuilder : public ASTVisitor {
  public:
    CminusfBuilder() {
        module = std::make_unique<Module>();
        builder = std::make_unique<IRBuilder>(nullptr, module.get());
        auto *TyVoid = module->get_void_type();
        auto *TyInt32 = module->get_int32_type();
        auto *TyFloat = module->get_float_type();
        auto *TyChar = module->get_char_type();

        auto *neg_idx_except_type = FunctionType::get(TyVoid, {});
        auto *neg_idx_except_fun = Function::create(
            neg_idx_except_type, "neg_idx_except", module.get());

        auto *getint_type = FunctionType::get(TyInt32, {});
        auto *getint = Function::create(getint_type, "getint", module.get());

        //需要修改对应的类型
        auto *getch_type = FunctionType::get(TyInt32, {});
        auto *getch = Function::create(getch_type, "getch", module.get());

        auto *getfloat_type = FunctionType::get(TyFloat, {});
        auto *getfloat = Function::create(getfloat_type, "getfloat", module.get());

        //int arrayint_num=10;
        auto *TyArrayint = module->get_int32_ptr_type();
        std::vector<Type*> getarray_params;
        getarray_params.push_back(TyArrayint);
        auto *getarray_type = FunctionType::get(TyInt32, getarray_params);
        auto *getarray = Function::create(getarray_type, "getarray", module.get());

        //int arrayfloat_num=10;
        auto *TyArrayfloat = module->get_float_ptr_type();
        std::vector<Type*> getfarray_params;
        getfarray_params.push_back(TyArrayint);
        auto *getfarray_type = FunctionType::get(TyInt32, getfarray_params);
        auto *getfarray = Function::create(getfarray_type, "getfarray", module.get());

        std::vector<Type*> putint_params;
        putint_params.push_back(TyInt32);
        auto *putint_type = FunctionType::get(TyVoid, putint_params);
        auto *putint = Function::create(putint_type, "putint", module.get());

        std::vector<Type*> putch_params;
        putch_params.push_back(TyInt32);
        auto *putch_type = FunctionType::get(TyVoid, putch_params);
        auto *putch = Function::create(putch_type, "putch", module.get());

        std::vector<Type*> putarray_params;
        putarray_params.push_back(TyInt32);
        putarray_params.push_back(TyArrayint);
        auto *putarray_type = FunctionType::get(TyVoid, putarray_params);
        auto *putarray = Function::create(putarray_type, "putarray", module.get());

        std::vector<Type*> putfloat_params;
        putfloat_params.push_back(TyFloat);
        auto *putfloat_type = FunctionType::get(TyVoid, putfloat_params);
        auto *putfloat = Function::create(putfloat_type, "putfloat", module.get());

        std::vector<Type*> putfarray_params;
        putfarray_params.push_back(TyArrayfloat);
        auto *putfarray_type = FunctionType::get(TyVoid, putfarray_params);
        auto *putfarray = Function::create(putfarray_type, "putfarray", module.get());

        std::vector<Type*> putf_params;
        putf_params.push_back(TyArrayint);
        auto *putf_type = FunctionType::get(TyVoid, putf_params);
        auto *putf = Function::create(putf_type, "putf", module.get());

        auto *starttime_type = FunctionType::get(TyVoid, {});
        auto *starttime = Function::create(starttime_type, "starttime", module.get());

        auto *stoptime_type = FunctionType::get(TyVoid, {});
        auto *stoptime = Function::create(stoptime_type, "stoptime", module.get());

        scope.enter();
        scope.push("neg_idx_except",neg_idx_except_fun,false);
        scope.push("getint", getint,false);
        scope.push("getch", getch,false);
        scope.push("getfloat", getfloat,false);
        scope.push("getarray", getarray,false);
        scope.push("getfarray",getfarray,false);
        scope.push("putint",putint,false);
        scope.push("putch",putch,false);
        scope.push("putarray",putarray,false);
        scope.push("putfloat",putfloat,false);
        scope.push("putfarray",putfarray,false);
        scope.push("putf",putf,false);
        scope.push("starttime",starttime,false);
        scope.push("stoptime",stoptime,false);
    }

    std::unique_ptr<Module> getModule() { return std::move(module); }

  private:
    virtual Value *visit(ASTCompUnit &) override final;
    virtual Value *visit(ASTNum &) override final;
    virtual Value *visit(ASTVarDeclaration &) override final;
    virtual Value *visit(ASTFunDeclaration &) override final;
    virtual Value *visit(ASTParam &) override final;
    virtual Value *visit(ASTBlock &) override final;
    virtual Value *visit(ASTBlockItem &) override final;
    virtual Value *visit(ASTSelectionStmt &) override final;
    virtual Value *visit(ASTIterationStmt &) override final;
    virtual Value *visit(ASTIterterminatorStmt &) override final;
    virtual Value *visit(ASTReturnStmt &) override final;
    virtual Value *visit(ASTAssignStmt &) override final;
    virtual Value *visit(ASTMulExpression &) override final;
    virtual Value *visit(ASTConstDecl &) override final;
    virtual Value *visit(ASTConstDef &) override final;
    virtual Value *visit(ASTVarDef &) override final;
    virtual Value *visit(ASTInit &) override final;
    virtual Value *visit(ASTLVal &) override final;
    virtual Value *visit(ASTUnaryExp &) override final;
    virtual Value *visit(ASTRelExp &) override final;
    virtual Value *visit(ASTAdditiveExpression &) override final;

    std::unique_ptr<IRBuilder> builder;
    Scope scope;
    std::unique_ptr<Module> module;

    struct {
        // function that is being built
        Function *func = nullptr;
        // TODO: you should add more fields to store state
        Value *arg = nullptr;
        int label_time=0;    //用于防止对于同一数组多次引用造成检查下标的bb的标签名重复问题
        bool assign = false; 
        BasicBlock* condbb;
        BasicBlock* retbb;

        //函数参数相关
        std::unordered_map<std::string, std::vector<Value*>> array_size;

        //init 相关
        std::vector<int> array_index; //储存当前赋值的变量的数组层次元素个数，如a[2][3][4],存储[4,3,2]
        Type* tmpType;//当前声明变量的BType
        int level; //init的当前层次，一维数组为0层
        //用于存储需要改传入的变量的位置 e.g a[2][1]处有变量b，存<b,<2,1>>
        std::unordered_map<Value* ,std::vector<Value*>> val_pos;
        std::vector<int> cur_pos; 
    } context;
};
