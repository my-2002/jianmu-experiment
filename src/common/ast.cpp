#include "ast.hpp"

#include <cstring>
#include <iostream>
#include <stack>

#define _AST_NODE_ERROR_                                                       \
    do {                                                                       \
        std::cerr << "Abort due to node cast error."                           \
                     "Contact with TAs to solve your problem."                 \
                  << std::endl;                                                \
            std::abort();                                                      \
    } while (0);
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

        if(_STR_EQ(n->children[1]->children[0]->name, "int"))
            node->type = TYPE_INT;
        else if(_STR_EQ(n->children[1]->children[0]->name, "float"))
            node->type = TYPE_FLOAT;
        else _AST_NODE_ERROR_

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
            node->constdef.push_back(child_node_shared);
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
        else if(n->children_num == 4)
        {
            auto list_ptr = n->children[1];
            while(list_ptr->children_num == 4)
            {
                s.push(list_ptr->children[1]);
                list_ptr = list_ptr->children[3];
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

        if(_STR_EQ(n->children[0]->children[0]->name, "int"))
            node->type = TYPE_INT;
        else if(_STR_EQ(n->children[0]->children[0]->name, "float"))
            node->type = TYPE_FLOAT;
        else _AST_NODE_ERROR_

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
            node->vardef.push_back(child_node_shared);
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
            node->init = std::shared_ptr<ASTInit>(child_node);
        }
        else if(n->children_num == 2 || n->children_num == 4)
        {
            auto list_ptr = n->children[1];
            while(list_ptr->children_num == 4)
            {
                s.push(list_ptr->children[1]);
                list_ptr = list_ptr->children[3];
            }
            s.push(list_ptr->children[1]);
            if(n->children_num == 4)
            {
                auto child_node = static_cast<ASTInit *>(transform_node_iter(n->children[3]));
                node->init = std::shared_ptr<ASTInit>(child_node);
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
        if (_STR_EQ(n->children[0]->children[0]->name, "int")) {
            node->type = TYPE_INT;
        } else if (_STR_EQ(n->children[0]->children[0]->name, "float")) {
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
        if(_STR_EQ(n->children[0]->children[0]->name, "int"))
            node->type = TYPE_INT;
        else if(_STR_EQ(n->children[0]->children[0]->name, "float"))
            node->type = TYPE_FLOAT;
        else _AST_NODE_ERROR_
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
            node->statement = nullptr;
        }
        else
        {
            auto child_node = static_cast<ASTStatement *>(transform_node_iter(n->children[0]));
            node->statement = std::shared_ptr<ASTStatement>(child_node);
            node->local_declaration = nullptr;
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
        } else if (_STR_EQ(n->children[0]->name, ";")){
            return nullptr;
        } else if (_STR_EQ(n->children[0]->name, "Exp") || _STR_EQ(n->children[0]->name, "Block")){
            return transform_node_iter(n->children[0]);
        } else if (_STR_EQ(n->children[0]->name, "if")){
            auto node = new ASTSelectionStmt();
            auto cond_node = static_cast<ASTRelExp *>(transform_node_iter(n->children[2]));
            node->condition = std::shared_ptr<ASTRelExp>(cond_node);
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
        } else if (_STR_EQ(n->children[0]->name, "while")){
            auto node = new ASTIterationStmt();
            auto cond_node = static_cast<ASTRelExp *>(transform_node_iter(n->children[2]));
            node->condition = std::shared_ptr<ASTRelExp>(cond_node);
            auto stmt_node = static_cast<ASTStatement *>(transform_node_iter(n->children[4]));
            node->statement = std::shared_ptr<ASTStatement>(stmt_node);
            return node;
        } else if (_STR_EQ(n->children[0]->name, "continue")){
            auto node = new ASTIterterminatorStmt();
            node->terminator = CONTINUE;
            return node;
        } else if (_STR_EQ(n->children[0]->name, "break")){
            auto node = new ASTIterterminatorStmt();
            node->terminator = BREAK;
            return node;
        } else if (_STR_EQ(n->children[0]->name, "return")){
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
        if(n->children_num == 2)
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
            if(_STR_EQ(n->children[0]->children[0]->name, "+"))
                node->op = OP_POS;
            else if (_STR_EQ(n->children[0]->children[0]->name, "-"))
                node->op = OP_NEG;
            else 
                node->op = OP_NOT;
            auto child_node = static_cast<ASTUnaryExp *>(transform_node_iter(n->children[1]));
            node->unaryexp = std::shared_ptr<ASTUnaryExp>(child_node);
        }
        else
        {
            node->ident = n->children[0]->name;
            if(n->children_num == 4)
            {
                std::stack<syntax_tree_node *> s;
                auto list_ptr = n->children[2];
                while (list_ptr->children_num == 3) {
                    s.push(list_ptr->children[2]);
                    list_ptr = list_ptr->children[0];
                }
                s.push(list_ptr->children[0]);

                while (!s.empty()) {
                    auto child_node = static_cast<ASTAdditiveExpression *>(transform_node_iter(s.top()));
                    auto child_node_shared = std::shared_ptr<ASTAdditiveExpression>(child_node);
                    node->params.push_back(child_node_shared);
                    s.pop();
                }
            }
        }
        return node;
    } else if (_STR_EQ(n->name, "MulExp")) {
        auto node = new ASTMulExpression();

        if(n->children_num == 1)
        {
            auto una_node = static_cast<ASTUnaryExp *>(transform_node_iter(n->children[0]));
            node->unaryexp = std::shared_ptr<ASTUnaryExp>(una_node);
            node->mul_expression = nullptr;
        }
        else
        {
            auto mul_node = static_cast<ASTMulExpression *>(transform_node_iter(n->children[0]));
            node->mul_expression = std::shared_ptr<ASTMulExpression>(mul_node);

            if(_STR_EQ(n->children[1]->name, "*"))
                node->op = OP_MUL;
            else if (_STR_EQ(n->children[1]->name, "/"))
                node->op = OP_DIV;
            else if (_STR_EQ(n->children[1]->name, "%"))
                node->op = OP_MOD;
            else 
                _AST_NODE_ERROR_

            auto una_node = static_cast<ASTUnaryExp *>(transform_node_iter(n->children[2]));
            node->unaryexp = std::shared_ptr<ASTUnaryExp>(una_node);
        }
        return node;
        
    } else if (_STR_EQ(n->name, "AddExp")) {
        auto node = new ASTAdditiveExpression();

        if(n->children_num == 1)
        {
            auto mul_node = static_cast<ASTMulExpression *>(transform_node_iter(n->children[0]));
            node->mul_expression = std::shared_ptr<ASTMulExpression>(mul_node);
            node->additive_expression = nullptr;
        }
        else
        {
            auto add_node = static_cast<ASTAdditiveExpression *>(transform_node_iter(n->children[0]));
            node->additive_expression = std::shared_ptr<ASTAdditiveExpression>(add_node);

            if(_STR_EQ(n->children[1]->name, "+"))
                node->op = OP_PLUS;
            else if (_STR_EQ(n->children[1]->name, "-"))
                node->op = OP_MINUS;
            else 
                _AST_NODE_ERROR_

            auto mul_node = static_cast<ASTMulExpression *>(transform_node_iter(n->children[2]));
            node->mul_expression = std::shared_ptr<ASTMulExpression>(mul_node);
        }
        return node;
    } else if (_STR_EQ(n->name, "RelExp")) {
        auto node = new ASTRelExp();

        if(n->children_num == 1)
        {
            auto add_node = static_cast<ASTAdditiveExpression *>(transform_node_iter(n->children[0]));
            node->additive_expression = std::shared_ptr<ASTAdditiveExpression>(add_node);
            node->relation_expression_l = nullptr;
        }
        else
        {
            auto rel_node = static_cast<ASTRelExp *>(transform_node_iter(n->children[0]));
            node->relation_expression_l = std::shared_ptr<ASTRelExp>(rel_node);

            if(_STR_EQ(n->children[1]->name, "<"))
                node->op = OP_LT;
            else if (_STR_EQ(n->children[1]->name, "<="))
                node->op = OP_LE;
            else if (_STR_EQ(n->children[1]->name, ">"))
                node->op = OP_GT;
            else if (_STR_EQ(n->children[1]->name, ">="))
                node->op = OP_GE;
            else 
                _AST_NODE_ERROR_

            auto add_node = static_cast<ASTAdditiveExpression *>(transform_node_iter(n->children[2]));
            node->additive_expression = std::shared_ptr<ASTAdditiveExpression>(add_node);
        }
        node->relation_expression_r = nullptr;
        return node;
    } else if (_STR_EQ(n->name, "EqExp")) {
        if(n->children_num == 1)
            return transform_node_iter(n->children[0]);
        else
        {
            auto node = new ASTRelExp();

            auto rel_l_node = static_cast<ASTRelExp *>(transform_node_iter(n->children[0]));
            node->relation_expression_l = std::shared_ptr<ASTRelExp>(rel_l_node);

            if(_STR_EQ(n->children[1]->name, "=="))
                node->op = OP_EQ;
            else if (_STR_EQ(n->children[1]->name, "!="))
                node->op = OP_NEQ;
            else 
                _AST_NODE_ERROR_

            auto rel_r_node = static_cast<ASTRelExp *>(transform_node_iter(n->children[2]));
            node->relation_expression_r = std::shared_ptr<ASTRelExp>(rel_r_node);
            node->additive_expression = nullptr;
            return node;
        }
    } else if (_STR_EQ(n->name, "LAndExp")) {
        if(n->children_num == 1)
            return transform_node_iter(n->children[0]);
        else
        {
            auto node = new ASTRelExp();

            auto rel_l_node = static_cast<ASTRelExp *>(transform_node_iter(n->children[0]));
            node->relation_expression_l = std::shared_ptr<ASTRelExp>(rel_l_node);

            if(_STR_EQ(n->children[1]->name, "&&"))
                node->op = OP_AND;
            else 
                _AST_NODE_ERROR_

            auto rel_r_node = static_cast<ASTRelExp *>(transform_node_iter(n->children[2]));
            node->relation_expression_r = std::shared_ptr<ASTRelExp>(rel_r_node);
            node->additive_expression = nullptr;
            return node;
        }
    } else if (_STR_EQ(n->name, "LOrExp")) {
        if(n->children_num == 1)
            return transform_node_iter(n->children[0]);
        else
        {
            auto node = new ASTRelExp();

            auto rel_l_node = static_cast<ASTRelExp *>(transform_node_iter(n->children[0]));
            node->relation_expression_l = std::shared_ptr<ASTRelExp>(rel_l_node);

            if(_STR_EQ(n->children[1]->name, "||"))
                node->op = OP_OR;
            else 
                _AST_NODE_ERROR_

            auto rel_r_node = static_cast<ASTRelExp *>(transform_node_iter(n->children[2]));
            node->relation_expression_r = std::shared_ptr<ASTRelExp>(rel_r_node);
            node->additive_expression = nullptr;
            return node;
        }
    } else {
        std::cerr << "[ast]: transform failure!" << std::endl;
        std::abort();
    }
}

Value* ASTCompUnit::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTNum::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTConstDecl::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTConstDef::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTVarDeclaration::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTVarDef::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTInit::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTFunDeclaration::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTParam::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTBlock::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTBlockItem::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTSelectionStmt::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTIterationStmt::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTIterterminatorStmt::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTReturnStmt::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTAssignStmt::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTMulExpression::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTUnaryExp::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTAdditiveExpression::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTLVal::accept(ASTVisitor &visitor) { return visitor.visit(*this); }
Value* ASTRelExp::accept(ASTVisitor &visitor) { return visitor.visit(*this); }

#define _DEBUG_PRINT_N_(N)                                                     \
    { std::cout << std::string(N, '-'); }

Value* ASTPrinter::visit(ASTCompUnit &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "CompUnit" << std::endl;
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
        std::cout << "NUM(int): " << node.i_val << std::endl;
    } else if (node.type == TYPE_FLOAT) {
        std::cout << "NUM(float): " << node.f_val << std::endl;
    } else {
        _AST_NODE_ERROR_
    }
    return nullptr;
}

Value* ASTPrinter::visit(ASTConstDecl &node) {
    _DEBUG_PRINT_N_(depth);
    if (node.type == TYPE_INT) {
        std::cout << "ConstDeclaration(int)" << std::endl;
    } else if (node.type == TYPE_FLOAT) {
        std::cout << "ConstDeclaration(float)" << std::endl;
    } else {
        _AST_NODE_ERROR_
    }
    add_depth();
    for (auto def : node.constdef) {
        def->accept(*this);
    }
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTConstDef &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "ConstDef: " << node.id;
    for (auto exp : node.expression) 
        std::cout << "[]" ;
    std::cout << std::endl;
    add_depth();
    for (auto exp : node.expression) {
        exp->accept(*this);
    }
    node.initiation->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTVarDeclaration &node) {
    _DEBUG_PRINT_N_(depth);
    if (node.type == TYPE_INT) {
        std::cout << "VarDeclaration(int)" << std::endl;
    } else if (node.type == TYPE_FLOAT) {
        std::cout << "VarDeclaration(float)" << std::endl;
    } else {
        _AST_NODE_ERROR_
    }
    add_depth();
    for (auto def : node.vardef) {
        def->accept(*this);
    }
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTVarDef &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "VarDef: " << node.id;
    for (auto exp : node.expression) 
        std::cout << "[]" ;
    std::cout << std::endl;
    add_depth();
    for (auto exp : node.expression) {
        exp->accept(*this);
    }
    node.init->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTInit &node) {
    _DEBUG_PRINT_N_(depth);
    if (node.isconst)
        std::cout << "ConstInitVal:" << node.sub_inits.size() << "sub_inits" << std::endl;
    else
        std::cout << "InitVal:" << node.sub_inits.size() << "sub_inits" << std::endl;
    add_depth();
    if (node.expression == nullptr)
        for (auto init : node.sub_inits)
            init->accept(*this);
    else
        node.expression->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTFunDeclaration &node) {
    _DEBUG_PRINT_N_(depth);
    if (node.type == TYPE_INT) 
        std::cout << "FunDeclaration(int): " << node.id << std::endl;
    else if (node.type == TYPE_FLOAT) 
        std::cout << "FunDeclaration(float): " << node.id << std::endl;
    else if (node.type == TYPE_VOID) 
        std::cout << "FunDeclaration(void): " << node.id << std::endl;
    else
        _AST_NODE_ERROR_
    add_depth();
    for (auto param : node.params)
        param->accept(*this);
    node.block->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTParam &node) {
    _DEBUG_PRINT_N_(depth);
    if (node.type == TYPE_INT)
        std::cout << "Param(int): " << node.id;
    else if (node.type == TYPE_FLOAT)
        std::cout << "Param(float): " << node.id;
    else
        _AST_NODE_ERROR_
    for (auto exp : node.expression)
        std::cout << "[]";
    std::cout << std::endl;
    add_depth();
    for (auto exp : node.expression)
        exp->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTBlock &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "Block" << std::endl;
    add_depth();
    for (auto item : node.block_items)
        item->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTBlockItem &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "BlockItem" << std::endl;
    add_depth();
    if(node.local_declaration != nullptr)
        node.local_declaration->accept(*this);
    else
        node.statement->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTSelectionStmt &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "SelectionStmt" << std::endl;
    add_depth();
    node.condition->accept(*this);
    node.if_statement->accept(*this);
    if (node.else_statement != nullptr)
        node.else_statement->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTIterationStmt &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "IterationStmt" << std::endl;
    add_depth();
    node.condition->accept(*this);
    node.statement->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTIterterminatorStmt &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "IterterminatorStmt: ";
    if(node.terminator == CONTINUE)
        std::cout << "CONTINUE" << std::endl;
    else if (node.terminator == BREAK)
        std::cout << "BREAK" <<std::endl;
    else
        _AST_NODE_ERROR_
    return nullptr;
}

Value* ASTPrinter::visit(ASTReturnStmt &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "ReturnStmt";
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
    std::cout << "AssignStmt" << std::endl;
    add_depth();
    node.lval->accept(*this);
    node.expression->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTLVal &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "LVal: " << node.id;
    for (auto exp : node.expression)
        std::cout << "[]";
    std::cout << std::endl;
    add_depth();
    for (auto exp : node.expression)
        exp->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTRelExp &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "RelationExpression";
    if (node.relation_expression_l == nullptr)
        std::cout << std::endl;
    else 
    {
        std::cout << ": ";
        if (node.op == OP_LT)
            std::cout << "<";
        else if (node.op == OP_LE)
            std::cout << "<=";
        else if (node.op == OP_GE)
            std::cout << ">=";
        else if (node.op == OP_GT)
            std::cout << ">";
        else if (node.op == OP_EQ)
            std::cout << "==";
        else if (node.op == OP_NEQ)
            std::cout << "!=";
        else if (node.op == OP_AND)
            std::cout << "&&";
        else if (node.op == OP_OR)
            std::cout << "||";
        else    
            std::abort();
        std::cout << std::endl;
    }
    add_depth();
    if (node.relation_expression_l == nullptr)
        node.additive_expression->accept(*this);
    else
    {
        node.relation_expression_l->accept(*this);
        if(node.op == OP_LT || node.op == OP_LE || node.op == OP_GT || node.op == OP_GE)
            node.additive_expression->accept(*this);
        else
            node.relation_expression_r->accept(*this);
    }
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTAdditiveExpression &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "AdditiveExpression";
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
    node.mul_expression->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTMulExpression &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "MultipleExpression";
    if (node.mul_expression == nullptr) {
        std::cout << std::endl;
    } else {
        std::cout << ": ";
        if (node.op == OP_MUL) {
            std::cout << "*";
        } else if (node.op == OP_DIV) {
            std::cout << "/";
        } else if (node.op == OP_MOD) {
            std::cout << "%";
        } else {
            std::abort();
        }
        std::cout << std::endl;
    }
    add_depth();
    if (node.mul_expression != nullptr)
        node.mul_expression->accept(*this);
    node.unaryexp->accept(*this);
    remove_depth();
    return nullptr;
}

Value* ASTPrinter::visit(ASTUnaryExp &node) {
    _DEBUG_PRINT_N_(depth);
    std::cout << "UnaryExpression";
    add_depth();
    if (node.expression != nullptr){
        std::cout << std::endl;
        node.expression->accept(*this);
    } else if (node.lval != nullptr){
        std::cout << std::endl;
        node.lval->accept(*this);
    } else if (node.num != nullptr){
        std::cout << std::endl;
        node.num->accept(*this);
    } else if (node.unaryexp != nullptr){
        std::cout << ": ";
        if (node.op == OP_NOT) {
            std::cout << "!";
        } else if (node.op == OP_POS) {
            std::cout << "+";
        } else if (node.op == OP_NEG) {
            std::cout << "-";
        } else {
            std::abort();
        }
        std::cout << std::endl;
        node.unaryexp->accept(*this);
    } else {
        std::cout << node.ident << "()" << std::endl;
        for (auto param : node.params)
            param->accept(*this);
    }
    remove_depth();
    return nullptr;
}