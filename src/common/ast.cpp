#include "ast.hpp"

#include <cstring>
#include <iostream>
#include <stack>

#define _AST_NODE_ERROR_                                                       \
    std::cerr << "Abort due to node cast error."                               \
                 "Contact with TAs to solve your problem."                     \
              << std::endl;                                                    \
    std::abort();
#define _STR_EQ(a, b) (strcmp((a), (b)) == 0)

void AST::run_visitor(ASTVisitor &visitor) { root->accept(visitor); }

AST::AST(syntax_tree *s) {
    if (s == nullptr) {
        std::cerr << "empty input tree!" << std::endl;
        std::abort();
    }
    auto node = transform_node_iter(s->root);
    del_syntax_tree(s);
    root = std::shared_ptr<ASTCompUnit>(static_cast<ASTCompUnit *>(node));
}

ASTNode *AST::transform_node_iter(syntax_tree_node *n) {
    if (_STR_EQ(n->name, "CompUnit")) {
        auto node = new ASTCompUnit();

        // flatten declaration list
        std::stack<syntax_tree_node *> s;
        auto list_ptr = n;
        while (list_ptr->children_num == 2) {
            s.push(list_ptr->children[1]);
            list_ptr = list_ptr->children[0];
        }
        s.push(list_ptr->children[0]);

        while (!s.empty()) {
            auto child_node =
                static_cast<ASTDeclaration *>(transform_node_iter(s.top()));

            auto child_node_shared =
                std::shared_ptr<ASTDeclaration>(child_node);
            node->declarations.push_back(child_node_shared);
            s.pop();
        }
        return node;
    } else if (_STR_EQ(n->name, "Decl")) {
        return transform_node_iter(n->children[0]);
    } else if (_STR_EQ(n->name, "ConstDecl")){
        auto node = new ASTConstDecl();

        if(_STR_EQ(n->children[1]->children[0]->name, "INT"))
            node->type = TYPE_INT;
        else
            node->type = TYPE_FLOAT;

        std::stack<syntax_tree_node *> s;
        auto list_ptr = n->children[2];
        while (list_ptr->children_num == 3) {
            s.push(list_ptr->children[2]);
            list_ptr = list_ptr->children[0];
        }
        s.push(list_ptr->children[0]);

        while (!s.empty()) {
            auto child_node =
                static_cast<ASTConstDef *>(transform_node_iter(s.top()));
            auto child_node_shared =
                std::shared_ptr<ASTConstDef>(child_node);
            node->declarations.push_back(child_node_shared);
            s.pop();
        }
        return node;
    } else if (_STR_EQ(n->name, "ConstDef")){
        auto node = new ASTConstDef();

        node->id = n->children[0]->name;
        std::stack<syntax_tree_node *> s;
        if(n->children_num == 3)
        {
            auto child_node = static_cast<ASTInit *>(transform_node_iter(n->children[2]));
            node->initiation = std::shared_ptr<ASTInit>(child_node);
        }
        else if(n->chilren_num == 4)
        {
            auto list_ptr = n->children[1];
            while(list_ptr->children_num == 4)
            {
                s.push(list_ptr->children[3]);
                list_ptr = list_ptr->children[1];
            }
            s.push(list_ptr->children[1]);
            auto child_node = static_cast<ASTInit *>(transform_node_iter(n->children[3]));
            node->initiation = std::shared_ptr<ASTInit>(child_node);
        }

        while (!s.empty()) {
            auto child_node =
                static_cast<ASTAdditiveExpression *>(transform_node_iter(s.top()));
            auto child_node_shared =
                std::shared_ptr<ASTAdditiveExpression>(child_node);
            node->expression.push_back(child_node_shared);
            s.pop();
        }
        return node;
    } else if (_STR_EQ(n->name, "ConstInitVal") || _STR_EQ(n->name, "InitVal")){
        auto node = new ASTInit();

        if(_STR_EQ(n->name, "ConstInitVal"))
            node->isconst = 1;
        else
            node->isconst = 0;

        std::stack<syntax_tree_node *> s;
        if(n->children_num == 1)
        {
            auto child_node = static_cast<ASTAdditiveExpression *>(transform_node_iter(n->children[0]));
            node->expression = std::shared_ptr<ASTAdditiveExpression>(child_node);
        }
        else if(n->children_num <= 3)
        {
            node->expression = nullptr;
            if(n->children_num == 3)
            {
                auto list_ptr = n->children[1];
                while(list_ptr->children_num == 3)
                {
                    s.push(list_ptr->children[2]);
                    list_ptr = list_ptr->children[0];
                }
                s.push(list_ptr->children[0]);
            }
        }

        while (!s.empty()) {
            auto child_node =
                static_cast<ASTInit *>(transform_node_iter(s.top()));
            auto child_node_shared =
                std::shared_ptr<ASTInit>(child_node);
            node->sub_inits.push_back(child_node_shared);
            s.pop();
        }
        return node;
        
    } else if (_STR_EQ(n->name, "VarDecl")){
        auto node = new ASTVarDeclaration();

        if(_STR_EQ(n->children[0]->children[0]->name, "INT"))
            node->type = TYPE_INT;
        else
            node->type = TYPE_FLOAT;

        std::stack<syntax_tree_node *> s;
        auto list_ptr = n->children[1];
        while (list_ptr->children_num == 3) {
            s.push(list_ptr->children[2]);
            list_ptr = list_ptr->children[0];
        }
        s.push(list_ptr->children[0]);

        while (!s.empty()) {
            auto child_node =
                static_cast<ASTVarDef *>(transform_node_iter(s.top()));
            auto child_node_shared =
                std::shared_ptr<ASTVarDef>(child_node);
            node->declarations.push_back(child_node_shared);
            s.pop();
        }
        return node;
    } else if (_STR_EQ(n->name, "VarDef")){
        auto node = new ASTVarDef();

        node->id = n->children[0]->name;
        std::stack<syntax_tree_node *> s;
        if(n->children_num == 3)
        {
            auto child_node = static_cast<ASTInit *>(transform_node_iter(n->children[2]));
            node->initiation = std::shared_ptr<ASTInit>(child_node);
        }
        else if(n->children_num == 2 || n->children_num == 4)
        {
            auto list_ptr = n->children[1];
            while(list_ptr->children_num == 4)
            {
                s.push(list_ptr->children[3]);
                list_ptr = list_ptr->children[1];
            }
            s.push(list_ptr->children[1]);
            if(n->children_num == 4)
            {
                auto child_node = static_cast<ASTInit *>(transform_node_iter(n->children[3]));
                node->initiation = std::shared_ptr<ASTInit>(child_node);
            }
        }

        while (!s.empty()) {
            auto child_node =
                static_cast<ASTAdditiveExpression *>(transform_node_iter(s.top()));
            auto child_node_shared =
                std::shared_ptr<ASTAdditiveExpression>(child_node);
            node->expression.push_back(child_node_shared);
            s.pop();
        }
        return node;
    }  else if (_STR_EQ(n->name, "FuncDef")) {
        auto node = new ASTFunDeclaration();
        if (_STR_EQ(n->children[0]->children[0]->name, "INT")) {
            node->type = TYPE_INT;
        } else if (_STR_EQ(n->children[0]->children[0]->name, "FLOAT")) {
            node->type = TYPE_FLOAT;
        } else {
            node->type = TYPE_VOID;
        }

        node->id = n->children[1]->name;

        // flatten params
        std::stack<syntax_tree_node *> s;
        if (n->children_num == 6) {
            auto list_ptr = n->children[3];
            while (list_ptr->children_num == 3) {
                s.push(list_ptr->children[2]);
                list_ptr = list_ptr->children[0];
            }
            s.push(list_ptr->children[0]);

            while (!s.empty()) {
                auto child_node =
                    static_cast<ASTParam *>(transform_node_iter(s.top()));
                auto child_node_shared = std::shared_ptr<ASTParam>(child_node);
                node->params.push_back(child_node_shared);
                s.pop();
            }
            auto block_node = static_cast<ASTBlock *>(transform_node_iter(n->children[5]));
            node->block = std::shared_ptr<ASTBlock>(block_node);
        }
        else
        {
            auto block_node = static_cast<ASTBlock *>(transform_node_iter(n->children[4]));
            node->block = std::shared_ptr<ASTBlock>(block_node);
        }
        
        return node;
    } else if (_STR_EQ(n->name, "FuncFParam")) {
        auto node = new ASTParam();
        if (_STR_EQ(n->children[0]->children[0]->name, "int"))
            node->type = TYPE_INT;
        else
            node->type = TYPE_FLOAT;
        node->id = n->children[1]->name;
        if (n->children_num > 2)
            node->isarray = true;
        if (n->children_num == 5)
        {
            std::stack<syntax_tree_node *> s;
            auto list_ptr = n->children[4];
            while (list_ptr->children_num == 4) {
                s.push(list_ptr->children[1]);
                list_ptr = list_ptr->children[3];
            }
            s.push(list_ptr->children[1]);

            while (!s.empty()) {
                auto child_node =
                    static_cast<ASTAdditiveExpression *>(transform_node_iter(s.top()));
                auto child_node_shared = std::shared_ptr<ASTAdditiveExpression>(child_node);
                node->expression.push_back(child_node_shared);
                s.pop();
            }
        }
        return node;
    } else if (_STR_EQ(n->name, "Block")) {
        auto node = new ASTBlock();

        auto list_ptr = n->children[1];
        std::stack<syntax_tree_node *> s;
        if(n->children_num == 3)
        {
            while(list_ptr->children_num == 2)
            {
                s.push(list_ptr->children[0]);
                list_ptr = list_ptr->children[1];
            }
            s.push(list_ptr->children[0]);

            while (!s.empty()) {
                auto child_node = static_cast<ASTBlockItem *>(
                    transform_node_iter(s.top()));
                auto child_node_ptr =
                    std::shared_ptr<ASTBlockItem>(child_node);
                node->block_items.push_back(child_node_ptr);
                s.pop();
            }
        }
        return node;
    } else if (_STR_EQ(n->name, "BlockItem")) {
        auto node = new ASTBlockItem();

        if(_STR_EQ(n->children[0]->name, "Decl"))
        {
            auto child_node = static_cast<ASTDeclaration *>(transform_node_iter(n->children[0]));
            node->local_declaration = std::shared_ptr<ASTDeclaration>(child_node);
        }
        else
        {
            auto child_node = static_cast<ASTStatement *>(transform_node_iter(n->children[0]));
            node->statement = std::shared_ptr<ASTStatement>(child_node);
        }
        return node;
    } else if (_STR_EQ(n->name, "Stmt")) {
        if(_STR_EQ(n->children[0]->name, "LVal")){
            auto node = new ASTAssignStmt();
            auto lval_node = static_cast<ASTLVal *>(transform_node_iter(n->children[0]));
            node->lval = std::shared_ptr<ASTLVal>(lval_node);
            auto exp_node = static_cast<ASTAdditiveExpression *>(transform_node_iter(n->children[2]));
            node->expression = std::shared_ptr<ASTAdditiveExpression>(exp_node);
            return node;
        } else if (_STR_EQ(n->children[0]->name, "SEMICOLON")){
            return nullptr;
        } else if (_STR_EQ(n->children[0]->name, "Exp") || _STR_EQ(n->children[0]->name, "Block")){
            return transform_node_iter(n->children[0]);
        } else if (_STR_EQ(n->children[0]->name, "IF")){
            auto node = new ASTSelectionStmt();
            auto cond_node = static_cast<ASTRelExp *>(transform_node_iter(n->children[2]));
            node->conditinon = std::shared_ptr<ASTRelExp>(cond_node);
            auto if_node = static_cast<ASTStatement *>(transform_node_iter(n->children[4]));
            node->if_statement = std::shared_ptr<ASTStatement>(if_node);
            if(n->children_num == 7)
            {
                auto else_node = static_cast<ASTStatement *>(transform_node_iter(n->children[6]));
                node->else_statement = std::shared_ptr<ASTStatement>(else_node);
            }
            else
                node->else_statement = nullptr;
            return node;
        } else if (_STR_EQ(n->children[0]->name, "WHILE")){
            auto node = new ASTIterationStmt();
            auto cond_node = static_cast<ASTRelExp *>(transform_node_iter(n->children[2]));
            node->conditinon = std::shared_ptr<ASTRelExp>(cond_node);
            auto stmt_node = static_cast<ASTStatement *>(transform_node_iter(n->children[4]));
            node->statement = std::shared_ptr<ASTStatement>(stmt_node);
            return node;
        } else if (_STR_EQ(n->children[0]->name, "CONTINUE")){
            auto node = new ASTIterterminatorStmt();
            node->terminator = CONTINUE;
            return node;
        } else if (_STR_EQ(n->children[0]->name, "BREAK")){
            auto node = new ASTIterterminatorStmt();
            node->terminator = BREAK;
            return node;
        } else if (_STR_EQ(n->children[0]->name, "RETURN")){
            auto node = new ASTReturnStmt();
            if(n->children_num == 2)
                node->expression = nullptr;
            else
            {
                auto child_node = static_cast<ASTAdditiveExpression *>(transform_node_iter(n->children[1]));
                node->expression = std::shared_ptr<ASTAdditiveExpression>(child_node);
            }
            return node;
        }
    } else if (_STR_EQ(n->name, "Exp")) {
        auto node = static_cast<ASTAdditiveExpression *>(transform_node_iter(n->children[0]));
        node->isconst = 0;
        return node;
    } else if (_STR_EQ(n->name, "ConstExp")) {
        auto node = static_cast<ASTAdditiveExpression *>(transform_node_iter(n->children[0]));
        node->isconst = 1;
        return node;
    } else if (_STR_EQ(n->name, "Cond")) {
        return transform_node_iter(n->children[0]);
    } else if (_STR_EQ(n->name, "LVal")) {
        auto node = new ASTLVal();
        node->id = n->children[0]->name;
        if(node->children_num == 2)
        {
            std::stack<syntax_tree_node *> s;
            auto list_ptr = n->children[1];
            while (list_ptr->children_num == 4) {
                s.push(list_ptr->children[1]);
                list_ptr = list_ptr->children[3];
            }
            s.push(list_ptr->children[1]);

            while (!s.empty()) {
                auto child_node =
                    static_cast<ASTAdditiveExpression *>(transform_node_iter(s.top()));
                auto child_node_shared = std::shared_ptr<ASTAdditiveExpression>(child_node);
                node->expression.push_back(child_node_shared);
                s.pop();
            }
        }
        return node;
    } else if (_STR_EQ(n->name, "Number")) {
        auto node = new ASTNum();
        if (_STR_EQ(n->children[0]->name, "IntConst")) {
            node->type = TYPE_INT;
            node->i_val = std::stoi(n->children[0]->children[0]->name);
        } else if (_STR_EQ(n->children[0]->name, "floatConst")) {
            node->type = TYPE_FLOAT;
            node->f_val = std::stof(n->children[0]->children[0]->name);
        } else {
            _AST_NODE_ERROR_
        }
        return node;
    } else if (_STR_EQ(n->name, "UnaryExp")) {
        auto node = new ASTUnaryExp();

        if(n->children_num == 1)
        {
            if(n->children[0]->children_num == 3)
            {
                auto child_node = static_cast<ASTAdditiveExpression *>(transform_node_iter(n->children[0]->children[1]));
                node->expression = std::shared_ptr<ASTAdditiveExpression>(child_node);
            }
            else if (_STR_EQ(n->children[0]->children[0]->name, "LVal"))
            {
                auto child_node = static_cast<ASTLVal *>(transform_node_iter(n->children[0]->children[0]));
                node->lval = std::shared_ptr<ASTLVal>(child_node);
            }
            else
            {
                auto child_node = static_cast<ASTNum *>(transform_node_iter(n->children[0]->children[0]));
                node->num = std::shared_ptr<ASTNum>(child_node);
            }
        } 
        else if (n->children_num == 2)
        {
            if(_STR_EQ(n->children[0]->children[0]->name, "ADD"))
                node->op = OP_POS;
            else if (_STR_EQ(n->children[0]->children[0]->name, "SUB"))
                node->op = OP_NEG;
            else 
                node->op = OP_NOT;
            auto child_node = static_cast<ASTUnaryExp *>(transform_node_iter(n->children[1]));
            node->unaryexp = std::shared_ptr<ASTUnaryExp>(child_node);
        }
    } else if (_STR_EQ(n->name, "UnaryOp")) {
        
    } else if (_STR_EQ(n->name, "FuncRParams")) {
        
    } else if (_STR_EQ(n->name, "MulExp")) {
        
    } else if (_STR_EQ(n->name, "AddExp")) {
        
    } else if (_STR_EQ(n->name, "RelExp")) {
        
    } else if (_STR_EQ(n->name, "EqExp")) {
        
    } else if (_STR_EQ(n->name, "LAndExp")) {
        
    } else if (_STR_EQ(n->name, "LOrExp")) {
        
    } else {
        std::cerr << "[ast]: transform failure!" << std::endl;
        std::abort();
    }
}

Value* ASTProgram::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTNum::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTVarDeclaration::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTFunDeclaration::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTParam::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTCompoundStmt::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTExpressionStmt::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTSelectionStmt::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTIterationStmt::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTReturnStmt::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTAssignStmt::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTSimpleExpression::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTAdditiveExpression::accept(ASTVisitor &visitor) {
    return visitor.visit(*this);
}
Value* ASTVar::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTTerm::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTCall::accept(ASTVisitor &visitor) { return visitor.visit(*this); }

#define _DEBUG_PRINT_N_(N)                                                     \
    { std::cout << std::string(N, '-'); }

Value* ASTPrinter::visit(ASTProgram &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "program" << std::endl;
    add_depth();
    for (auto decl : node.declarations) {
        decl->accept(*this);
    }
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTNum &node) {
    _DEBUG_PRINT_N_(depth);
    if (node.type == TYPE_INT) {
        std::cout << "num (int): " << node.i_val << std::endl;
    } else if (node.type == TYPE_FLOAT) {
        std::cout << "num (float): " << node.f_val << std::endl;
    } else {
        _AST_NODE_ERROR_
    }
    return nullptr;
}

Value* ASTPrinter::visit(ASTVarDeclaration &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "var-declaration: " << node.id;
    if (node.num != nullptr) {
        std::cout << "[]" << std::endl;
        add_depth();
        node.num->accept(*this);
        remove_depth();
        return nullptr;
    }
    std::cout << std::endl;
    return nullptr;
}

Value* ASTPrinter::visit(ASTFunDeclaration &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "fun-declaration: " << node.id << std::endl;
    add_depth();
    for (auto param : node.params) {
        param->accept(*this);
    }

    node.compound_stmt->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTParam &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "param: " << node.id;
    if (node.isarray)
        std::cout << "[]";
    std::cout << std::endl;
    return nullptr;
}

Value* ASTPrinter::visit(ASTCompoundStmt &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "compound-stmt" << std::endl;
    add_depth();
    for (auto decl : node.local_declarations) {
        decl->accept(*this);
    }

    for (auto stmt : node.statement_list) {
        stmt->accept(*this);
    }
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTExpressionStmt &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "expression-stmt" << std::endl;
    add_depth();
    if (node.expression != nullptr)
        node.expression->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTSelectionStmt &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "selection-stmt" << std::endl;
    add_depth();
    node.expression->accept(*this);
    node.if_statement->accept(*this);
    if (node.else_statement != nullptr)
        node.else_statement->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTIterationStmt &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "iteration-stmt" << std::endl;
    add_depth();
    node.expression->accept(*this);
    node.statement->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTReturnStmt &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "return-stmt";
    if (node.expression == nullptr) {
        std::cout << ": void" << std::endl;
    } else {
        std::cout << std::endl;
        add_depth();
        node.expression->accept(*this);
        remove_depth();
    }
    return nullptr;
}

Value* ASTPrinter::visit(ASTAssignStmt &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "assign-stmt" << std::endl;
    add_depth();
    node.var->accept(*this);
    node.expression->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTSimpleExpression &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "simple-expression";
    if (node.additive_expression_r == nullptr) {
        std::cout << std::endl;
    } else {
        std::cout << ": ";
        if (node.op == OP_LT) {
            std::cout << "<";
        } else if (node.op == OP_LE) {
            std::cout << "<=";
        } else if (node.op == OP_GE) {
            std::cout << ">=";
        } else if (node.op == OP_GT) {
            std::cout << ">";
        } else if (node.op == OP_EQ) {
            std::cout << "==";
        } else if (node.op == OP_NEQ) {
            std::cout << "!=";
        } else {
            std::abort();
        }
        std::cout << std::endl;
    }
    add_depth();
    node.additive_expression_l->accept(*this);
    if (node.additive_expression_r != nullptr)
        node.additive_expression_r->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTAdditiveExpression &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "additive-expression";
    if (node.additive_expression == nullptr) {
        std::cout << std::endl;
    } else {
        std::cout << ": ";
        if (node.op == OP_PLUS) {
            std::cout << "+";
        } else if (node.op == OP_MINUS) {
            std::cout << "-";
        } else {
            std::abort();
        }
        std::cout << std::endl;
    }
    add_depth();
    if (node.additive_expression != nullptr)
        node.additive_expression->accept(*this);
    node.term->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTVar &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "var: " << node.id;
    if (node.expression != nullptr) {
        std::cout << "[]" << std::endl;
        add_depth();
        node.expression->accept(*this);
        remove_depth();
        return nullptr;
    }
    std::cout << std::endl;
    return nullptr;
}

Value* ASTPrinter::visit(ASTTerm &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "term";
    if (node.term == nullptr) {
        std::cout << std::endl;
    } else {
        std::cout << ": ";
        if (node.op == OP_MUL) {
            std::cout << "*";
        } else if (node.op == OP_DIV) {
            std::cout << "/";
        } else {
            std::abort();
        }
        std::cout << std::endl;
    }
    add_depth();
    if (node.term != nullptr)
        node.term->accept(*this);

    node.factor->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTCall &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "call: " << node.id << "()" << std::endl;
    add_depth();
    for (auto arg : node.args) {
        arg->accept(*this);
    }
    remove_depth();
    return nullptr;
}
