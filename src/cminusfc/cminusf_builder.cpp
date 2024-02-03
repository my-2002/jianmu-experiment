#include "cminusf_builder.hpp"

#define CONST_FP(num) ConstantFP::get((float)num, module.get())
#define CONST_INT(num) ConstantInt::get(num, module.get())
#define CONST_ZERO(type) ConstantZero::get(type, module.get())
// types
Type *VOID_T;
Type *INT1_T;
Type *INT32_T;
Type *INT32PTR_T;
Type *FLOAT_T;
Type *FLOATPTR_T;

/*
 * use CMinusfBuilder::Scope to construct scopes
 * scope.enter: enter a new scope
 * scope.exit: exit current scope
 * scope.push: add a new binding to current scope
 * scope.find: find and return the value bound to the name
 */

Value* CminusfBuilder::visit(ASTCompUnit &node) {
    VOID_T = module->get_void_type();
    INT1_T = module->get_int1_type();
    INT32_T = module->get_int32_type();
    INT32PTR_T = module->get_int32_ptr_type();
    FLOAT_T = module->get_float_type();
    FLOATPTR_T = module->get_float_ptr_type();

    Value *ret_val = nullptr;
    for (auto &decl : node.declarations) {
        ret_val = decl->accept(*this);
    }
    return ret_val;
}

Value* CminusfBuilder::visit(ASTNum &node) {
    // TODO: This function is empty now.
    // Add some code here.
    Value *ret_val = nullptr;
    if (node.type == TYPE_INT)                 
        ret_val = ConstantInt::get(node.i_val, module.get()); 
    else if (node.type == TYPE_FLOAT)        
        ret_val = ConstantFP::get(node.f_val, module.get());    
    return ret_val;
}

Value* CminusfBuilder::visit(ASTVarDeclaration &node) {
    // TODO: This function is empty now.
    // Add some code here.
    for(auto &def:node.vardef)
    {
        def->accept(*this);
    }
}
Value* CminusfBuilder::visit(ASTVarDef& node) {
    Type* tmpType;              
    if (node.type == TYPE_INT)     
        tmpType = INT32_T;       
    else if (node.type == TYPE_FLOAT)  
        tmpType = FLOAT_T;       
    if (!node.expression.empty()) {         
        //说明声明变量是数组
        auto* arrayType = ArrayType::get(tmpType, node.expression.size()); 
        Constant* initializer;
    if (node.init == nullptr) {
        initializer = dynamic_cast<Constant*>(CONST_ZERO(tmpType)) ;
    } else {
        std::vector<Value *> val;
        for(auto &exp:node.init->expression)
        {
            val.push_back(exp->accept(*this));
        }
        initializer = dynamic_cast<Constant*>(ConstantArray::get(arrayType, val));
    }           
    Value* arrayAlloca;             
    if (scope.in_global())          //若是全局
        arrayAlloca = GlobalVariable::create(node.id, module.get(), arrayType, false, initializer);
    else                         
        arrayAlloca = builder->create_alloca(arrayType);
    scope.push(node.id, arrayAlloca);// 将获得的数组变量加入域 
    return arrayAlloca;
    }
    else {                            
        auto initializer = CONST_ZERO(tmpType); 
        Value* varAlloca;          
        if (scope.in_global())         
            varAlloca = GlobalVariable::create(node.id, module.get(), tmpType, false, initializer);
        else                           
            varAlloca = builder->create_alloca(tmpType);
        scope.push(node.id, varAlloca); 
        return varAlloca;
    }
}
Value* CminusfBuilder::visit(ASTFunDeclaration &node) {
    FunctionType *fun_type;
    Type *ret_type;
    std::vector<Type *> param_types;
    if (node.type == TYPE_INT)
        ret_type = INT32_T;
    else if (node.type == TYPE_FLOAT)
        ret_type = FLOAT_T;
    else
        ret_type = VOID_T;

    for (auto &param : node.params) {
        // TODO: Please accomplish param_types.
    }

    fun_type = FunctionType::get(ret_type, param_types);
    auto func = Function::create(fun_type, node.id, module.get());
    scope.push(node.id, func);
    context.func = func;
    auto funBB = BasicBlock::create(module.get(), "entry", func);
    builder->set_insert_point(funBB);
    scope.enter();
    std::vector<Value *> args;
    for (auto &arg : func->get_args()) {
        args.push_back(&arg);
    }
    for (auto &param : node.params) {
        // TODO: Please accomplish param_types.
        if (param->isarray) {       //参数为数组
            if (param->type == TYPE_INT)        
                param_types.push_back(INT32PTR_T);
            else if(param->type == TYPE_FLOAT) 
                param_types.push_back(FLOATPTR_T);
        }
        else {                 
            if (param->type == TYPE_INT)       
                param_types.push_back(INT32_T);
            else if (param->type == TYPE_FLOAT) 
                param_types.push_back(FLOAT_T);
        }
    }

    node.block->accept(*this);
    if (not builder->get_insert_block()->is_terminated())
    {
        if (context.func->get_return_type()->is_void_type())
            builder->create_void_ret();
        else if (context.func->get_return_type()->is_float_type())
            builder->create_ret(CONST_FP(0.));
        else
            builder->create_ret(CONST_INT(0));
    }
    scope.exit();
    return nullptr;
}

Value* CminusfBuilder::visit(ASTParam &node) {
    // TODO: This function is empty now.
    // Add some code here.
    Value* paramAlloca;
    if (node.isarray) {            //如果是数组形式
        if (node.type == TYPE_INT)      
            paramAlloca = builder->create_alloca(INT32PTR_T);
        else if (node.type == TYPE_FLOAT) 
            paramAlloca = builder->create_alloca(FLOATPTR_T);
    }
    else {            
        if (node.type == TYPE_INT)      
            paramAlloca = builder->create_alloca(INT32_T);
        else if (node.type == TYPE_FLOAT) 
            paramAlloca = builder->create_alloca(FLOAT_T);
    }
    auto arg = context.arg;
    builder->create_store(arg, paramAlloca);    
    scope.push(node.id, paramAlloca);  

}

/*Value* CminusfBuilder::visit(ASTCompoundStmt &node) {
    // TODO: This function is not complete.
    // You may need to add some code here
    // to deal with complex statements.

    for (auto &decl : node.local_declarations) {
        decl->accept(*this);
    }

    for (auto &stmt : node.statement_list) {
        stmt->accept(*this);
        if (builder->get_insert_block()->is_terminated())
            break;
    }
    return nullptr;
}*/

Value* CminusfBuilder::visit(ASTExpressionStmt &node) {
    // TODO: This function is empty now.
    // Add some code here.
    return nullptr;
}

Value* CminusfBuilder::visit(ASTSelectionStmt &node) {
    // TODO: This function is empty now.
    // Add some code here.
    return nullptr;
}

Value* CminusfBuilder::visit(ASTIterationStmt &node) {
    // TODO: This function is empty now.
    // Add some code here.
    return nullptr;
}

Value* CminusfBuilder::visit(ASTReturnStmt &node) {
    if (node.expression == nullptr) {
        builder->create_void_ret();
        return nullptr;
    } else {
        // TODO: The given code is incomplete.
        // You need to solve other return cases (e.g. return an integer).
    }
    return nullptr;
}

Value* CminusfBuilder::visit(ASTAssignExpression &node) {
    // TODO: This function is empty now.
    // Add some code here.
    return nullptr;
}


Value* CminusfBuilder::visit(ASTAdditiveExpression &node) {
    // TODO: This function is empty now.
    // Add some code here.
    return nullptr;
}

Value* CminusfBuilder::visit(ASTBlock& node) {
    std::cout << "Visiting ASTBlock" << std::endl;
    // Add your code here
    return nullptr;
}
Value* CminusfBuilder::visit(ASTMulExpression& node) {
    std::cout << "Visiting ASTMulExpression" << std::endl;
    // Add your code here
    return nullptr;
}
Value* CminusfBuilder::visit(ASTConstDecl& node) {
    std::cout << "Visiting ASTConstDecl" << std::endl;
    // Add your code here
    return nullptr;
}
Value* CminusfBuilder::visit(ASTConstDef& node) {
    std::cout << "Visiting ASTConstDef" << std::endl;
    // Add your code here
    return nullptr;
}

Value* CminusfBuilder::visit(ASTInit& node) {
    std::cout << "Visiting ASTInit" << std::endl;
    // Add your code here
    return nullptr;
}
Value* CminusfBuilder::visit(ASTLVal& node) {
    std::cout << "Visiting ASTLVal" << std::endl;
    // Add your code here
    return nullptr;
}
Value* CminusfBuilder::visit(ASTCond& node) {
    std::cout << "Visiting ASTCond" << std::endl;
    // Add your code here
    return nullptr;
}
Value* CminusfBuilder::visit(ASTUnaryExp& node) {
    std::cout << "Visiting ASTUnaryExp" << std::endl;
    // Add your code here
    return nullptr;
}
