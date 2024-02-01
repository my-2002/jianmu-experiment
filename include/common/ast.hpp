#pragma once

extern "C" {
#include "syntax_tree.h"
extern syntax_tree *parse(const char *input);
}

#include <memory>
#include <string>
#include <vector>
#include "../lightir/User.hpp"

enum SysYType { TYPE_INT, TYPE_FLOAT, TYPE_VOID};
enum Terminator { CONTINUE, BREAK};
enum RelOp {
    // <=
    OP_LE,
    // <
    OP_LT,
    // >
    OP_GT,
    // >=
    OP_GE,
    // ==
    OP_EQ,
    // !=
    OP_NEQ,
    // ！
    OP_NOT,
    // &&
    OP_AND,
    // ||
    OP_OR
};
enum UnaryOp
{
    // ！
    OP_NOT,
    // +
    OP_PLUS,
    // -
    OP_MINUS
};
enum AddOp {
    // +
    OP_PLUS,
    // -
    OP_MINUS
};

enum MulOp {
    // *
    OP_MUL,
    // /
    OP_DIV,
    // %
    OP_MOD
};

class AST;

struct ASTNode;
struct ASTCompUnit;
struct ASTDeclaration;
struct ASTNum;
struct ASTConstDecl;
struct ASTConstDef;
struct ASTVarDeclaration;
struct ASTVarDef;
struct ASTInit;
struct ASTLVal;
struct ASTFunDeclaration;
struct ASTParam;
struct ASTBlock;
struct ASTStatement;
struct ASTExpressionStmt;
struct ASTSelectionStmt;
struct ASTIterationStmt;
struct ASTReturnStmt;
//struct ASTFactor;
struct ASTExpression;
struct ASTCond;
//struct ASTVar;
struct ASTAssignExpression;
struct ASTMulExpression;
struct ASTUnaryExp;
struct ASTAdditiveExpression;
struct ASTRelExp;
//struct ASTTerm;
//struct ASTCall;

class ASTVisitor;

class AST {
  public:
    AST() = delete;
    AST(syntax_tree *);
    AST(AST &&tree) {
        root = tree.root;
        tree.root = nullptr;
    };
    ASTCompUnit *get_root() { return root.get(); }
    void run_visitor(ASTVisitor &visitor);

  private:
    ASTNode *transform_node_iter(syntax_tree_node *);
    std::shared_ptr<ASTCompUnit> root = nullptr;
};

struct ASTNode {
    virtual Value *accept(ASTVisitor &) = 0;
    virtual ~ASTNode() = default;
};

struct ASTCompUnit : ASTNode {
    virtual Value *accept(ASTVisitor &) override final;
    virtual ~ASTCompUnit() = default;
    std::vector<std::shared_ptr<ASTDeclaration>> declarations;
};

struct ASTDeclaration : ASTNode {
    virtual ~ASTDeclaration() = default;
    SysYType type;
    std::string id;
};

struct ASTNum : ASTNode {
    virtual Value *accept(ASTVisitor &) override final;
    SysYType type;
    union {
        int i_val;
        float f_val;
    };
};

struct ASTConstDecl : ASTDeclaration
{
    virtual Value *accept(ASTVisitor &) override final;
    std::vector<std::shared_ptr<ASTConstDef>> constdef;
};
struct ASTConstDef :ASTNode
{
    virtual Value *accept(ASTVisitor &) override final;
    std::shared_ptr<ASTAdditiveExpression> expression;
    std::shared_ptr<ASTInit> initiation;
};

struct ASTVarDeclaration : ASTDeclaration {
    virtual Value *accept(ASTVisitor &) override final;
    std::vector<std::shared_ptr<ASTVarDef>> vardef;
};

struct ASTVarDef :ASTDeclaration
{
    virtual Value *accept(ASTVisitor &) override final;
    std::vector<std::shared_ptr<ASTAdditiveExpression>> expression;
    std::shared_ptr<ASTInit> init;
};
struct ASTInit :ASTNode
{
    virtual Value *accept(ASTVisitor &) override final;
    std::vector<std::shared_ptr<ASTAdditiveExpression>> expression;
};

struct ASTFunDeclaration : ASTDeclaration {
    virtual Value *accept(ASTVisitor &) override final;
    std::vector<std::shared_ptr<ASTParam>> params;
    std::shared_ptr<ASTBlock> block;
};

struct ASTParam : ASTNode {
    virtual Value *accept(ASTVisitor &) override final;
    SysYType type;
    std::string id;
    std::vector<std::shared_ptr<ASTAdditiveExpression>> expression;
    // true if it is array param
    bool isarray;
};

struct ASTStatement : ASTNode {
    virtual ~ASTStatement() = default;
};

struct ASTBlock : ASTStatement {
    virtual Value *accept(ASTVisitor &) override final;
    std::vector<std::shared_ptr<ASTDeclaration>> local_declarations;
    std::vector<std::shared_ptr<ASTStatement>> statement_list;
};

struct ASTExpressionStmt : ASTStatement {
    virtual Value *accept(ASTVisitor &) override final;
    std::shared_ptr<ASTAdditiveExpression> expression;
};

struct ASTSelectionStmt : ASTStatement {
    virtual Value *accept(ASTVisitor &) override final;
    std::shared_ptr<ASTAdditiveExpression> expression;
    std::shared_ptr<ASTStatement> if_statement;
    // should be nullptr if no else structure exists
    std::shared_ptr<ASTStatement> else_statement;
};

struct ASTIterationStmt : ASTStatement {
    virtual Value *accept(ASTVisitor &) override final;
    std::shared_ptr<ASTRelExp> condition;
    std::shared_ptr<ASTStatement> statement;
};
struct ASTIterterminatorStmt :ASTStatement
{
    virtual Value *accept(ASTVisitor &) override final;
    Terminator terminator;
};
struct ASTReturnStmt : ASTStatement {
    virtual Value *accept(ASTVisitor &) override final;
    // should be nullptr if return void
    std::shared_ptr<ASTAdditiveExpression> expression;
};

struct ASTExpression : ASTNode {
    bool isconst;
};

struct ASTAssignExpression : ASTExpression {
    virtual Value *accept(ASTVisitor &) override final;
    std::shared_ptr<ASTLVal> lval;
    std::shared_ptr<ASTAdditiveExpression> expression;
};

struct ASTMulExpression:ASTExpression
{
    virtual Value *accept(ASTVisitor &) override final;
    std::shared_ptr<ASTUnaryExp> unaryexp;
    MulOp op;
    std::shared_ptr<ASTMulExpression> mul_expression;
};
struct ASTUnaryExp:ASTExpression
{
    virtual Value *accept(ASTVisitor &) override final;
    std::vector<std::shared_ptr<ASTAdditiveExpression>> expression;
    std::shared_ptr<ASTLVal> lval;
    std::shared_ptr<ASTNum> num;
    std::string ident;
    UnaryOp op;
    std::shared_ptr<ASTUnaryExp> unaryexp;
};

/*struct ASTVar : ASTFactor {
    virtual Value *accept(ASTVisitor &) override final;
    std::string id;
    // nullptr if var is of int type
    std::shared_ptr<ASTExpression> expression;
};*/

struct ASTAdditiveExpression : ASTNode {
    virtual Value *accept(ASTVisitor &) override final;
    std::shared_ptr<ASTAdditiveExpression> additive_expression;
    AddOp op;
    std::shared_ptr<ASTMulExpression> mul_expression;
};

/*struct ASTTerm : ASTNode {
    virtual Value *accept(ASTVisitor &) override final;
    std::shared_ptr<ASTTerm> term;
    MulOp op;
    std::shared_ptr<ASTFactor> factor;
};*/
struct ASTLVal : ASTNode
{
    virtual Value *accept(ASTVisitor &) override final;
    std::string idet;
    std::shared_ptr<ASTAdditiveExpression> expression;
};
struct ASTRelExp:ASTExpression
{   //相等和关系,逻辑运算应该可以合并到这里
    virtual Value *accept(ASTVisitor &) override final;
    std::shared_ptr<ASTAdditiveExpression> additive_expression;
    RelOp op;
    std::shared_ptr<ASTRelExp> relation_expression;
};
/*struct ASTCall : ASTFactor {
    virtual Value *accept(ASTVisitor &) override final;
    std::string id;
    std::vector<std::shared_ptr<ASTExpression>> args;
};*/



class ASTVisitor {
  public:
    virtual Value *visit(ASTCompUnit &) = 0;
    virtual Value *visit(ASTNum &) = 0;
    virtual Value *visit(ASTVarDeclaration &) = 0;
    virtual Value *visit(ASTFunDeclaration &) = 0;
    virtual Value *visit(ASTParam &) = 0;
    virtual Value *visit(ASTBlock &) = 0;
    virtual Value *visit(ASTExpressionStmt &) = 0;
    virtual Value *visit(ASTSelectionStmt &) = 0;
    virtual Value *visit(ASTIterationStmt &) = 0;
    virtual Value *visit(ASTReturnStmt &) = 0;
    virtual Value *visit(ASTAssignExpression &) = 0;
    virtual Value *visit(ASTMulExpression &) = 0;
    virtual Value *visit(ASTConstDecl &) = 0;
    virtual Value *visit(ASTConstDef &) = 0;
    virtual Value *visit(ASTVarDef &) = 0;
    virtual Value *visit(ASTInit &) = 0;
    virtual Value *visit(ASTLVal &) = 0;
    virtual Value *visit(ASTCond &) = 0;
    virtual Value *visit(ASTUnaryExp &) = 0;
    virtual Value *visit(ASTAdditiveExpression &) = 0;
    //virtual Value *visit(ASTVar &) = 0;
    virtual Value *visit(ASTRelExp &) = 0;
};

class ASTPrinter : public ASTVisitor {
  public:
    virtual Value *visit(ASTCompUnit &) override final;
    virtual Value *visit(ASTNum &) override final;
    virtual Value *visit(ASTVarDeclaration &) override final;
    virtual Value *visit(ASTFunDeclaration &) override final;
    virtual Value *visit(ASTParam &) override final;
    virtual Value *visit(ASTBlock &) override final;
    virtual Value *visit(ASTExpressionStmt &) override final;
    virtual Value *visit(ASTSelectionStmt &) override final;
    virtual Value *visit(ASTIterationStmt &) override final;
    virtual Value *visit(ASTReturnStmt &) override final;
    virtual Value *visit(ASTAssignExpression &) override final;
    virtual Value *visit(ASTMulExpression &) override final;
    virtual Value *visit(ASTConstDecl &) override final;
    virtual Value *visit(ASTConstDef &) override final;
    virtual Value *visit(ASTVarDef &) override final;
    virtual Value *visit(ASTInit &) override final;
    virtual Value *visit(ASTLVal &) override final;
    virtual Value *visit(ASTCond &) override final;
    virtual Value *visit(ASTUnaryExp &) override final;
    virtual Value *visit(ASTAdditiveExpression &) override final;
    //virtual Value *visit(ASTVar &) override final;
    void add_depth() { depth += 2; }
    void remove_depth() { depth -= 2; }

  private:
    int depth = 0;
};
