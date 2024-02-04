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

        std::stack<syntax_tree_node *> s;
        if(n->children_num == 1)
        {
            auto child_node = static_cast<ASTAdditiveExpression *>(transform_node_iter(n->childen[0]));
            node->expression = std::shared_ptr<ASTAdditiveExpression>(child_node);
        }
        else if(n->children_num <= 3)
        {
            node->expression = NULL;
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

        }
    } else if (_STR_EQ(n->name, "expression-stmt")) {
        auto node = new ASTExpressionStmt();
        if (n->children_num == 2) {
            auto expr_node = static_cast<ASTExpression *>(
                transform_node_iter(n->children[0]));

            auto expr_node_ptr = std::shared_ptr<ASTExpression>(expr_node);
            node->expression = expr_node_ptr;
        }
        return node;
    } else if (_STR_EQ(n->name, "selection-stmt")) {
        auto node = new ASTSelectionStmt();

        auto expr_node =
            static_cast<ASTExpression *>(transform_node_iter(n->children[2]));
        auto expr_node_ptr = std::shared_ptr<ASTExpression>(expr_node);
        node->expression = expr_node_ptr;

        auto if_stmt_node =
            static_cast<ASTStatement *>(transform_node_iter(n->children[4]));
        auto if_stmt_node_ptr = std::shared_ptr<ASTStatement>(if_stmt_node);
        node->if_statement = if_stmt_node_ptr;

        // check whether this selection statement contains
        // else structure
        if (n->children_num == 7) {
            auto else_stmt_node = static_cast<ASTStatement *>(
                transform_node_iter(n->children[6]));
            auto else_stmt_node_ptr =
                std::shared_ptr<ASTStatement>(else_stmt_node);
            node->else_statement = else_stmt_node_ptr;
        }

        return node;
    } else if (_STR_EQ(n->name, "iteration-stmt")) {
        auto node = new ASTIterationStmt();

        auto expr_node =
            static_cast<ASTExpression *>(transform_node_iter(n->children[2]));
        auto expr_node_ptr = std::shared_ptr<ASTExpression>(expr_node);
        node->expression = expr_node_ptr;

        auto stmt_node =
            static_cast<ASTStatement *>(transform_node_iter(n->children[4]));
        auto stmt_node_ptr = std::shared_ptr<ASTStatement>(stmt_node);
        node->statement = stmt_node_ptr;

        return node;
    } else if (_STR_EQ(n->name, "return-stmt")) {
        auto node = new ASTReturnStmt();
        if (n->children_num == 3) {
            auto expr_node = static_cast<ASTExpression *>(
                transform_node_iter(n->children[1]));
            node->expression = std::shared_ptr<ASTExpression>(expr_node);
        }
        return node;
    } else if (_STR_EQ(n->name, "expression")) {
        // simple-expression
        if (n->children_num == 1) {
            return transform_node_iter(n->children[0]);
        }
        auto node = new ASTAssignExpression();

        auto var_node =
            static_cast<ASTVar *>(transform_node_iter(n->children[0]));
        node->var = std::shared_ptr<ASTVar>(var_node);

        auto expr_node =
            static_cast<ASTExpression *>(transform_node_iter(n->children[2]));
        node->expression = std::shared_ptr<ASTExpression>(expr_node);

        return node;
    } else if (_STR_EQ(n->name, "var")) {
        auto node = new ASTVar();
        node->id = n->children[0]->name;
        if (n->children_num == 4) {
            auto expr_node = static_cast<ASTExpression *>(
                transform_node_iter(n->children[2]));
            node->expression = std::shared_ptr<ASTExpression>(expr_node);
        }
        return node;
    } else if (_STR_EQ(n->name, "simple-expression")) {
        auto node = new ASTSimpleExpression();
        auto expr_node_1 = static_cast<ASTAdditiveExpression *>(
            transform_node_iter(n->children[0]));
        node->additive_expression_l =
            std::shared_ptr<ASTAdditiveExpression>(expr_node_1);

        if (n->children_num == 3) {
            auto op_name = n->children[1]->children[0]->name;
            if (_STR_EQ(op_name, "<="))
                node->op = OP_LE;
            else if (_STR_EQ(op_name, "<"))
                node->op = OP_LT;
            else if (_STR_EQ(op_name, ">"))
                node->op = OP_GT;
            else if (_STR_EQ(op_name, ">="))
                node->op = OP_GE;
            else if (_STR_EQ(op_name, "=="))
                node->op = OP_EQ;
            else if (_STR_EQ(op_name, "!="))
                node->op = OP_NEQ;

            auto expr_node_2 = static_cast<ASTAdditiveExpression *>(
                transform_node_iter(n->children[2]));
            node->additive_expression_r =
                std::shared_ptr<ASTAdditiveExpression>(expr_node_2);
        }
        return node;
    } else if (_STR_EQ(n->name, "additive-expression")) {
        auto node = new ASTAdditiveExpression();
        if (n->children_num == 3) {
            auto add_expr_node = static_cast<ASTAdditiveExpression *>(
                transform_node_iter(n->children[0]));
            node->additive_expression =
                std::shared_ptr<ASTAdditiveExpression>(add_expr_node);

            auto op_name = n->children[1]->children[0]->name;
            if (_STR_EQ(op_name, "+"))
                node->op = OP_PLUS;
            else if (_STR_EQ(op_name, "-"))
                node->op = OP_MINUS;

            auto term_node =
                static_cast<ASTTerm *>(transform_node_iter(n->children[2]));
            node->term = std::shared_ptr<ASTTerm>(term_node);
        } else {
            auto term_node =
                static_cast<ASTTerm *>(transform_node_iter(n->children[0]));
            node->term = std::shared_ptr<ASTTerm>(term_node);
        }
        return node;
    } else if (_STR_EQ(n->name, "term")) {
        auto node = new ASTTerm();
        if (n->children_num == 3) {
            auto term_node =
                static_cast<ASTTerm *>(transform_node_iter(n->children[0]));
            node->term = std::shared_ptr<ASTTerm>(term_node);

            auto op_name = n->children[1]->children[0]->name;
            if (_STR_EQ(op_name, "*"))
                node->op = OP_MUL;
            else if (_STR_EQ(op_name, "/"))
                node->op = OP_DIV;

            auto factor_node =
                static_cast<ASTFactor *>(transform_node_iter(n->children[2]));
            node->factor = std::shared_ptr<ASTFactor>(factor_node);
        } else {
            auto factor_node =
                static_cast<ASTFactor *>(transform_node_iter(n->children[0]));
            node->factor = std::shared_ptr<ASTFactor>(factor_node);
        }
        return node;
    } else if (_STR_EQ(n->name, "factor")) {
        int i = 0;
        if (n->children_num == 3)
            i = 1;
        auto name = n->children[i]->name;
        if (_STR_EQ(name, "expression") || _STR_EQ(name, "var") ||
            _STR_EQ(name, "call"))
            return transform_node_iter(n->children[i]);
        else {
            auto num_node = new ASTNum();
            if (_STR_EQ(name, "integer")) {
                num_node->type = TYPE_INT;
                num_node->i_val = std::stoi(n->children[i]->children[0]->name);
            } else if (_STR_EQ(name, "float")) {
                num_node->type = TYPE_FLOAT;
                num_node->f_val = std::stof(n->children[i]->children[0]->name);
            } else {
                _AST_NODE_ERROR_
            }
            return num_node;
        }
    } else if (_STR_EQ(n->name, "call")) {
        auto node = new ASTCall();
        node->id = n->children[0]->name;
        // flatten args
        if (_STR_EQ(n->children[2]->children[0]->name, "arg-list")) {
            auto list_ptr = n->children[2]->children[0];
            auto s = std::stack<syntax_tree_node *>();
            while (list_ptr->children_num == 3) {
                s.push(list_ptr->children[2]);
                list_ptr = list_ptr->children[0];
            }
            s.push(list_ptr->children[0]);

            while (!s.empty()) {
                auto expr_node =
                    static_cast<ASTExpression *>(transform_node_iter(s.top()));
                auto expr_node_ptr = std::shared_ptr<ASTExpression>(expr_node);
                node->args.push_back(expr_node_ptr);
                s.pop();
            }
        }
        return node;
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
