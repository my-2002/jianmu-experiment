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
    for (int i = 0; i < node.params.size(); ++i) {
        // TODO: You need to deal with params and store them in the scope.
        auto param = node.params[i];
        auto arg = args[i];   
        context.arg=arg;        //暂存实参，处理param时用                  
        param->accept(*this); 
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
    auto function = builder->get_insert_block()->get_parent();  //获得当前所对应的函数 
    auto val = node.expression->accept(*this);        
    auto resType = val->get_type();        
    Value* TrueFalse;                     
    if (resType->is_integer_type()) {       
        TrueFalse = builder->create_icmp_gt(val, CONST_ZERO(INT32_T));  // 大于0视为true 
    }
    else if (resType->is_float_type()) { 
        TrueFalse = builder->create_fcmp_gt(val, CONST_ZERO(FLOAT_T));
    }
    if (node.else_statement != nullptr) {   // 若存在else
        auto trueBB = BasicBlock::create(module.get(), "true"+std::to_string(context.label_time++), function);   
        auto falseBB = BasicBlock::create(module.get(), "false"+std::to_string(context.label_time++), function); 
        builder->create_cond_br(TrueFalse, trueBB, falseBB);    

        builder->set_insert_point(trueBB);  
        node.if_statement->accept(*this);   
        auto curTrueBB = builder->get_insert_block();  

        builder->set_insert_point(falseBB); 
        node.else_statement->accept(*this); 
        auto curFalseBB = builder->get_insert_block(); 
        //在TRUE，FALSE块处理完之后，需要统一跳转到结束的retbb块
        auto trueTerm = curTrueBB->is_terminated();    //判断在这一个块内是否结束或者跳转到别的块，要是没有需要处理
        auto falseTerm = curFalseBB->is_terminated();
        BasicBlock* retBB;
        if (not trueTerm || not falseTerm) {  
            retBB = BasicBlock::create(module.get(), "ret"+std::to_string(context.label_time++), function);  
            //builder->set_insert_point(retBB);              
        
        if (not trueTerm) {        
            builder->set_insert_point(curTrueBB);  
            builder->create_br(retBB);           
        }
        if (not falseTerm) {        
            builder->set_insert_point(curFalseBB); 
            builder->create_br(retBB);             
        }
        builder->set_insert_point(retBB);  }
    }
    else {             //没有else
        auto trueBB = BasicBlock::create(module.get(), "true"+std::to_string(context.label_time++), function); 
        auto retBB = BasicBlock::create(module.get(), "ret"+std::to_string(context.label_time++), function);    
        builder->create_cond_br(TrueFalse, trueBB, retBB); 
        builder->set_insert_point(trueBB); 
        node.if_statement->accept(*this);   
        if (not builder->get_insert_block()->is_terminated())  
            builder->create_br(retBB);    
        builder->set_insert_point(retBB);  //在后面继续加后续语句 
    }

}

Value* CminusfBuilder::visit(ASTIterationStmt &node) {
    // TODO: This function is empty now.
    // Add some code here.
    auto function = builder->get_insert_block()->get_parent();  
    auto conditionBB = BasicBlock::create(module.get(), "condition"+std::to_string(context.label_time++), function); //条件判断块
    auto loopBB = BasicBlock::create(module.get(), "loop"+std::to_string(context.label_time++), function);         //循环块
    auto retBB = BasicBlock::create(module.get(), "ret"+std::to_string(context.label_time++), function);            
    builder->create_br(conditionBB);     
    builder->set_insert_point(conditionBB); 
    auto res = node.condition->accept(*this);       
    auto resType = res->get_type();        
    Value* TrueFalse;                      
    if (resType->is_integer_type()) {      
        TrueFalse = builder->create_icmp_gt(res, CONST_ZERO(INT32_T));  
    }
    else if (resType->is_float_type()) {  
        TrueFalse = builder->create_fcmp_gt(res, CONST_ZERO(FLOAT_T));
    }
    builder->create_cond_br(TrueFalse, loopBB, retBB); 

    builder->set_insert_point(loopBB);     
    node.statement->accept(*this);        
    if (not builder->get_insert_block()->is_terminated())  
        builder->create_br(conditionBB);    

    builder->set_insert_point(retBB);     

    return nullptr;

}

Value* CminusfBuilder::visit(ASTReturnStmt &node) {
    if (node.expression == nullptr) {
        builder->create_void_ret();
        return nullptr;
    } else {
        // TODO: The given code is incomplete.
        // You need to solve other return cases (e.g. return an integer).
        auto function = builder->get_insert_block()->get_parent();  //获取当前函数好判断ret的类型
        auto retType = function->get_return_type();    
        auto res = node.expression->accept(*this);    //返回表达式值的类型
        auto resType = res->get_type();  
        if (retType->is_integer_type() && resType->is_float_type())   //类型冲突强制类型转换，转换成fun的
            res = builder->create_fptosi(res, INT32_T);
        if (retType->is_float_type() && resType->is_integer_type())
            res = builder->create_sitofp(res, INT32_T);
        builder->create_ret(res);

    }
    return nullptr;
}

Value* CminusfBuilder::visit(ASTAssignExpression &node) {
    // TODO: This function is empty now.
    // Add some code here.
    context.assign = true;        
    auto var = node.lval->accept(*this);                  
    auto res2 = node.expression->accept(*this);        
    auto varType = var->get_type()->get_pointer_element_type(); 
    if (varType == FLOAT_T && res2->get_type()->is_integer_type())
        res2 = builder->create_sitofp(res2, FLOAT_T);
    if (varType == INT32_T && res2->get_type()->is_float_type())
        res2 = builder->create_fptosi(res2, INT32_T);
    builder->create_store(res2, var);
    return res2;    //用于连等式

}


Value* CminusfBuilder::visit(ASTAdditiveExpression &node) {
    // TODO: This function is empty now.
    // Add some code here.
    // TODO: This function is empty now.
    // Add some code here.
    Value* ret_val;
    if (node.additive_expression == nullptr) {  //直接返回term
        ret_val=node.mul_expression->accept(*this);
        return ret_val;      
    }
    auto lres = node.additive_expression->accept(*this);                       
    auto rres = node.mul_expression->accept(*this);       
    if (lres->get_type()->is_integer_type() && rres->get_type()->is_integer_type()) {    
        switch (node.op) {
        case OP_PLUS:
            ret_val = builder->create_iadd(lres, rres);break;
        case OP_MINUS:
            ret_val = builder->create_isub(lres, rres);break;
        }
    }
    else { 
        if (lres->get_type()->is_integer_type()) 
            lres = builder->create_sitofp(lres, FLOAT_T);
        if (rres->get_type()->is_integer_type()) 
            rres = builder->create_sitofp(rres, FLOAT_T);
        switch (node.op) { 
        case OP_PLUS:
            ret_val = builder->create_fadd(lres, rres);break;
        case OP_MINUS:
            ret_val = builder->create_fsub(lres, rres);break;
        }
    }
    return ret_val;

}

Value* CminusfBuilder::visit(ASTBlock& node) {
    scope.enter();
    
    scope.exit();
    return nullptr;

}
Value* CminusfBuilder::visit(ASTMulExpression& node) {
    Value* ret_val;
    if (node.mul_expression == nullptr) {         
        ret_val = node.unaryexp->accept(*this);
        return ret_val;  
    }
    auto lres = node.mul_expression->accept(*this);   
    auto rres = node.unaryexp->accept(*this);   
    if (lres->get_type()->is_integer_type() && rres->get_type()->is_integer_type()) {
        switch (node.op) {
        case OP_MUL:
            ret_val = builder->create_imul(lres, rres);break;
        case OP_DIV:
            ret_val = builder->create_isdiv(lres, rres);break;
        }
    }
    else { 
        if (lres->get_type()->is_integer_type()) 
            lres = builder->create_sitofp(lres, FLOAT_T);
        if (rres->get_type()->is_integer_type()) 
            rres = builder->create_sitofp(rres, FLOAT_T);
        switch (node.op) {  
        case OP_MUL:
            ret_val = builder->create_fmul(lres, rres);break;
        case OP_DIV:
            ret_val = builder->create_fdiv(lres, rres);break;
        }
    }
    return ret_val;

}
Value* CminusfBuilder::visit(ASTConstDecl& node) {
    // Add your code here
    for(auto &cdef:node.constdef)
    {
        cdef->accept(*this);
    }
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
    Value* ret_value;
    auto var = scope.find(node.id);       
    bool assign = context.assign;    // 是否由赋值语句调用
    context.assign = false;          
    Value* index = CONST_INT(0);        
    if (node.expression != nullptr) {   //说明是数组
        auto res = node.expression->accept(*this); 
        if (res->get_type()->is_float_type())          
            res = builder->create_fptosi(res, INT32_T);     //转换数组下标值
        index = res;                  

        auto function = builder->get_insert_block()->get_parent(); 
        auto indexTest = builder->create_icmp_lt(index, CONST_ZERO(INT32_T)); 
        auto ltzBB = BasicBlock::create(module.get(), node.id + "_ltz" + std::to_string(context.label_time++), function);
        auto gtzBB = BasicBlock::create(module.get(), node.id + "_gtz" + std::to_string(context.label_time++), function);

        builder->create_cond_br(indexTest, ltzBB, gtzBB);

        builder->set_insert_point(ltzBB);       //终止程序
        auto fail = scope.find("neg_idx_except");             
        builder->create_call(static_cast<Function*>(fail), {});
        builder->create_br(gtzBB);    

        builder->set_insert_point(gtzBB);  
        if (var->get_type()->get_pointer_element_type()->is_array_type())  
            var = builder->create_gep(var, { CONST_INT(0), index });   
        else {
            if (var->get_type()->get_pointer_element_type()->is_pointer_type()) 
                var = builder->create_load(var);     
            var = builder->create_gep(var, { index }); 
        }
        if (assign) {       //赋值语句
            ret_value = var;                   
            context.assign = false;    
        }
        else 
            ret_value = builder->create_load(var);
        return ret_value;
    }

    if (assign) {    //赋值语句
        ret_value = var;           
        context.assign = false;
    }
    else {                
        if (var->get_type()->get_pointer_element_type()->is_array_type())  
            ret_value = builder->create_gep(var, { CONST_INT(0), CONST_INT(0) }); 
        else
            ret_value = builder->create_load(var);
    }
    return ret_value;

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
