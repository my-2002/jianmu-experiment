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
    if (node.type == TYPE_INT)
        context.tmpType = INT32_T;
    else if (node.type == TYPE_FLOAT)  
        context.tmpType = FLOAT_T;
    for(auto &def:node.vardef)
    {
        def->accept(*this);
    }
    return nullptr;
}
Value* CminusfBuilder::visit(ASTVarDef& node) {//记得加隐式转换
    if (!node.expression.empty()) {         
        //说明声明变量是数组
        auto* arrayType = context.tmpType;
        
        context.level=node.expression.size()-1;
        context.cur_pos.resize(node.expression.size(),0);
        
        for(auto&exp:node.expression)
        {
            context.is_const_exp = true;
            auto temp = exp->accept(*this);
            context.is_const_exp = false;
            int size = dynamic_cast<ConstantInt*>(temp)->get_value();
            arrayType = ArrayType::get(arrayType, size); 
            context.array_index.push_back(size);
        }
        Constant* initializer;
        Value* arrayAlloca; 
        if (node.init == nullptr) {//没有初始化，局部变量不初始化
            initializer = dynamic_cast<Constant*>(CONST_ZERO(arrayType));         
            if (scope.in_global())          //若是全局
                arrayAlloca = GlobalVariable::create(node.id, module.get(), arrayType, false, initializer);
            else                         
                arrayAlloca = builder->create_alloca(arrayType);
            }
        else {
            initializer=dynamic_cast<Constant*>(node.init->accept(*this));
            if (scope.in_global())
                arrayAlloca = GlobalVariable::create(node.id, module.get(), arrayType, false, initializer);
            else
            {
                arrayAlloca = builder->create_alloca(arrayType);
                builder->create_store(initializer,arrayAlloca);
                if(node.init->isconst==false)
                {
                    for(auto &var:context.val_pos)
                    {
                        //auto des_var=builder->create_load(var.first);
                        var.second.insert(var.second.begin(), CONST_INT(0));
                        auto des = builder->create_gep(arrayAlloca, var.second);
                        builder->create_store(var.first,des);
                    }
                }
            }                    
        }
        context.array_index.clear();
        context.val_pos.clear();
        context.cur_pos.clear();
        scope.push(node.id, arrayAlloca, false);// 将获得的数组变量加入域 
        return arrayAlloca;
    }
    else {  
        Value* varAlloca;     
        if (node.init == nullptr)
        {
            auto initializer = CONST_ZERO(context.tmpType);    
            if (scope.in_global())         
                varAlloca = GlobalVariable::create(node.id, module.get(), context.tmpType, false, initializer);
            else                           
                varAlloca = builder->create_alloca(context.tmpType);
        }                       
        else
        {
            auto initializer=node.init->accept(*this);
            auto const_init = dynamic_cast<Constant*>(initializer);
            if (const_init)
            {
                if(initializer->get_type()==FLOAT_T && context.tmpType==INT32_T)
                    initializer=dynamic_cast<Constant*>(builder->create_fptosi(const_init,context.tmpType));
                else if(initializer->get_type()==INT32_T && context.tmpType==FLOAT_T)
                    initializer=dynamic_cast<Constant*>(builder->create_sitofp(const_init,context.tmpType));
                if (scope.in_global())         
                    varAlloca = GlobalVariable::create(node.id, module.get(), context.tmpType, false, const_init);
                else   
                {
                    varAlloca = builder->create_alloca(context.tmpType);
                    builder->create_store(const_init,varAlloca);
                }  
            }
            else
            {
                if(initializer->get_type()==FLOAT_T && context.tmpType==INT32_T)
                    initializer=builder->create_fptosi(initializer,context.tmpType);
                else if(initializer->get_type()==INT32_T && context.tmpType==FLOAT_T)
                    initializer=builder->create_sitofp(initializer,context.tmpType);         
                assert(!scope.in_global() && "global initialization is not a constant");
                varAlloca = builder->create_alloca(context.tmpType);
                builder->create_store(initializer,varAlloca);
            }
        }
        scope.push(node.id, varAlloca, false); 
        return varAlloca;
    }
}
Value* CminusfBuilder::visit(ASTConstDecl& node) {
    // Add your code here
    if (node.type == TYPE_INT)
        context.tmpType = INT32_T;
    else if (node.type == TYPE_FLOAT)  
        context.tmpType = FLOAT_T;
    for(auto &cdef:node.constdef)
        cdef->accept(*this);
    return nullptr;
}

Value* CminusfBuilder::visit(ASTConstDef& node) {         
    if (!node.expression.empty()) {         
        //说明声明变量是数组
        auto* arrayType = context.tmpType;
        
        context.level=node.expression.size()-1;
        context.cur_pos.resize(node.expression.size(),0);
        
        for(auto&exp:node.expression)
        {
            context.is_const_exp = true;
            auto temp = exp->accept(*this);
            context.is_const_exp = false;
            int size = dynamic_cast<ConstantInt*>(temp)->get_value();
            arrayType = ArrayType::get(arrayType, size); 
            context.array_index.push_back(size);
        }
        Constant* initializer;
        Value* arrayAlloca; 
        context.is_const_exp = true;
        initializer=dynamic_cast<Constant*>(node.initiation->accept(*this));
        context.is_const_exp = false;
        if (scope.in_global())
            arrayAlloca = GlobalVariable::create(node.id, module.get(), arrayType, true, initializer);
        else
        {
            arrayAlloca = builder->create_alloca(arrayType);
            builder->create_store(initializer,arrayAlloca);
        }
        context.array_index.clear();
        context.val_pos.clear();
        context.cur_pos.clear();
        scope.push_const_val(node.id, initializer);
        scope.push(node.id, arrayAlloca, true);// 将获得的数组变量加入域 
        return arrayAlloca;
    }
    else {  
        Value* varAlloca;     
        context.is_const_exp = true;
        auto const_init = dynamic_cast<Constant*>(node.initiation->accept(*this));
        context.is_const_exp = false;
        if(dynamic_cast<ConstantFP*>(const_init) && context.tmpType==INT32_T)
            const_init=CONST_INT((int)(dynamic_cast<ConstantFP*>(const_init)->get_value()));
        else if(dynamic_cast<ConstantInt*>(const_init) && context.tmpType==FLOAT_T)
            const_init=CONST_FP((float)(dynamic_cast<ConstantInt*>(const_init)->get_value()));
        if (scope.in_global())         
            varAlloca = GlobalVariable::create(node.id, module.get(), context.tmpType, true, const_init);
        else   
        {
            varAlloca = builder->create_alloca(context.tmpType);
            builder->create_store(const_init,varAlloca);
        } 
        scope.push_const_val(node.id, const_init);
        scope.push(node.id, varAlloca, true); 
        return varAlloca;
    }
}

Value* CminusfBuilder::visit(ASTFunDeclaration &node) {
    FunctionType *fun_type;
    Type *ret_type;
    std::vector<Type *> param_types;
    context.array_size.clear();

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
    scope.push(node.id, func, false);
    context.func = func;
    auto funBB = BasicBlock::create(module.get(), "entry", func);
    builder->set_insert_point(funBB);
    scope.enter();
    std::vector<Value *> args;
    for (auto &arg : func->get_args()) {
        args.push_back(&arg);
    }
    for (int i = 0; i < (int)node.params.size(); ++i) {
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

        std::vector<Value*> sizes;    
        for (auto &exp : node.expression)
            sizes.insert(sizes.begin(), exp->accept(*this));
        context.array_size.insert({node.id, sizes});  
    }
    else {            
        if (node.type == TYPE_INT)      
            paramAlloca = builder->create_alloca(INT32_T);
        else if (node.type == TYPE_FLOAT) 
            paramAlloca = builder->create_alloca(FLOAT_T);
    }
    auto arg = context.arg;
    builder->create_store(arg, paramAlloca);    
    scope.push(node.id, paramAlloca, false);
    return nullptr;
}

Value* CminusfBuilder::visit(ASTSelectionStmt &node) {
    // TODO: This function is empty now.
    // Add some code here.
    auto function = builder->get_insert_block()->get_parent();  //获得当前所对应的函数 
    auto val = node.condition->accept(*this);        
    auto resType = val->get_type();        
    Value* TrueFalse;                     
    if (resType->is_integer_type()) {  
        if(val->get_type()!=INT32_T)
            val=builder->create_zext(val,INT32_T);     
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
        if(node.if_statement!=nullptr)
            node.if_statement->accept(*this);   
        if (not builder->get_insert_block()->is_terminated())  
            builder->create_br(retBB);    
        builder->set_insert_point(retBB);  //在后面继续加后续语句 
    }
    return nullptr;
}

Value* CminusfBuilder::visit(ASTIterationStmt &node) {
    // TODO: This function is empty now.
    // Add some code here.
    auto function = builder->get_insert_block()->get_parent();  
    auto conditionBB = BasicBlock::create(module.get(), "condition"+std::to_string(context.label_time++), function); //条件判断块
    auto loopBB = BasicBlock::create(module.get(), "loop"+std::to_string(context.label_time++), function);         //循环块
    auto retBB = BasicBlock::create(module.get(), "ret"+std::to_string(context.label_time++), function); 
    context.condbb.push_back(conditionBB);
    context.retbb.push_back(retBB);        
    context.loop_level++;   
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
    context.condbb.pop_back();
    context.retbb.pop_back();
    context.loop_level--;
    return nullptr;

}
Value* CminusfBuilder::visit(ASTIterterminatorStmt &node)
{
    if(node.terminator==BREAK)
        builder->create_br(context.retbb[context.loop_level]);
    else
        builder->create_br(context.condbb[context.loop_level]);
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

Value* CminusfBuilder::visit(ASTAssignStmt &node) {
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
    Value* ret_val;
    if (node.additive_expression == nullptr) {  //直接返回term
        ret_val=node.mul_expression->accept(*this);
        return ret_val;      
    }
    auto lres = node.additive_expression->accept(*this);                       
    auto rres = node.mul_expression->accept(*this);       
    if(dynamic_cast<Constant*>(lres) && dynamic_cast<Constant*>(rres))
    {
        if (lres->get_type()->is_integer_type() && rres->get_type()->is_integer_type()) {
            switch (node.op) {
            case OP_PLUS:
                ret_val = CONST_INT((dynamic_cast<ConstantInt*>(lres)->get_value())+(dynamic_cast<ConstantInt*>(rres)->get_value()));break;
            case OP_MINUS:
                ret_val = CONST_INT((dynamic_cast<ConstantInt*>(lres)->get_value())-(dynamic_cast<ConstantInt*>(rres)->get_value()));break;
            }
        } else if (lres->get_type()->is_integer_type()){ 
            switch (node.op) {  
            case OP_PLUS:
                ret_val = CONST_FP((dynamic_cast<ConstantInt*>(lres)->get_value())+(dynamic_cast<ConstantFP*>(rres)->get_value()));break;
            case OP_MINUS:
                ret_val = CONST_FP((dynamic_cast<ConstantInt*>(lres)->get_value())-(dynamic_cast<ConstantFP*>(rres)->get_value()));break;
            }
        } else if (rres->get_type()->is_integer_type()){
            switch (node.op) {  
            case OP_PLUS:
                ret_val = CONST_FP((dynamic_cast<ConstantFP*>(lres)->get_value())+(dynamic_cast<ConstantInt*>(rres)->get_value()));break;
            case OP_MINUS:
                ret_val = CONST_FP((dynamic_cast<ConstantFP*>(lres)->get_value())-(dynamic_cast<ConstantInt*>(rres)->get_value()));break;
            }
        } else {
            switch (node.op) {  
            case OP_PLUS:
                ret_val = CONST_FP((dynamic_cast<ConstantFP*>(lres)->get_value())+(dynamic_cast<ConstantFP*>(rres)->get_value()));break;
            case OP_MINUS:
                ret_val = CONST_FP((dynamic_cast<ConstantFP*>(lres)->get_value())-(dynamic_cast<ConstantFP*>(rres)->get_value()));break;
            }
        }
    }
    else
    {
        if (lres->get_type()->is_integer_type() && rres->get_type()->is_integer_type()) {    
            if(lres->get_type()->is_int1_type())
                lres=builder->create_zext(lres,INT32_T);
            if(rres->get_type()->is_int1_type())
                rres=builder->create_zext(rres,INT32_T);
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
    }   
    return ret_val;
}

Value* CminusfBuilder::visit(ASTBlock& node) {
    scope.enter();
    for(auto& item:node.block_items)
    {
        item->accept(*this);
    }
    scope.exit();
    return nullptr;

}
Value* CminusfBuilder::visit(ASTBlockItem& node)
{
    if (node.local_declaration!=nullptr)
        node.local_declaration->accept(*this);
    else if(node.statement!=nullptr)
        node.statement->accept(*this);
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
    if(dynamic_cast<Constant*>(lres) && dynamic_cast<Constant*>(rres))
    {
        if (lres->get_type()->is_integer_type() && rres->get_type()->is_integer_type()) {
            switch (node.op) {
            case OP_MUL:
                ret_val = CONST_INT((dynamic_cast<ConstantInt*>(lres)->get_value())*(dynamic_cast<ConstantInt*>(rres)->get_value()));break;
            case OP_DIV:
                ret_val = CONST_INT((dynamic_cast<ConstantInt*>(lres)->get_value())/(dynamic_cast<ConstantInt*>(rres)->get_value()));break;
            case OP_MOD:
                ret_val = CONST_INT((dynamic_cast<ConstantInt*>(lres)->get_value())%(dynamic_cast<ConstantInt*>(rres)->get_value()));break;
            }
        } else if (lres->get_type()->is_integer_type()){ 
            switch (node.op) {
            case OP_MUL:
                ret_val = CONST_FP((dynamic_cast<ConstantInt*>(lres)->get_value())*(dynamic_cast<ConstantFP*>(rres)->get_value()));break;
            case OP_DIV:
                ret_val = CONST_FP((dynamic_cast<ConstantInt*>(lres)->get_value())/(dynamic_cast<ConstantFP*>(rres)->get_value()));break;
            case OP_MOD:
                assert("MOD operands are not both i32");break;
            }
        } else if (rres->get_type()->is_integer_type()){
            switch (node.op) {
            case OP_MUL:
                ret_val = CONST_FP((dynamic_cast<ConstantFP*>(lres)->get_value())*(dynamic_cast<ConstantInt*>(rres)->get_value()));break;
            case OP_DIV:
                ret_val = CONST_FP((dynamic_cast<ConstantFP*>(lres)->get_value())/(dynamic_cast<ConstantInt*>(rres)->get_value()));break;
            case OP_MOD:
                assert("MOD operands are not both i32");break;
            }
        } else {
            switch (node.op) {
            case OP_MUL:
                ret_val = CONST_FP((dynamic_cast<ConstantFP*>(lres)->get_value())*(dynamic_cast<ConstantFP*>(rres)->get_value()));break;
            case OP_DIV:
                ret_val = CONST_FP((dynamic_cast<ConstantFP*>(lres)->get_value())/(dynamic_cast<ConstantFP*>(rres)->get_value()));break;
            case OP_MOD:
                assert("MOD operands are not both i32");break;
            }
        }
    }   
    else
    {
        if (lres->get_type()->is_integer_type() && rres->get_type()->is_integer_type()) {
            switch (node.op) {
            case OP_MUL:
                ret_val = builder->create_imul(lres, rres);break;
            case OP_DIV:
                ret_val = builder->create_isdiv(lres, rres);break;
            case OP_MOD:
                auto temp=builder->create_isdiv(lres, rres);
                temp=builder->create_imul(temp,rres);
                ret_val=builder->create_isub(lres,temp);
                break;
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
            case OP_MOD:
                assert("MOD operands are not both i32");
                //auto temp=builder->create_fdiv(lres, rres);
                //temp=builder->create_fmul(temp,rres);
                //ret_val=builder->create_fsub(lres,temp);
                break;
            }
        }
    }
    return ret_val;
}

void CminusfBuilder::cur_pos_add(int dim, int num)
{
    if(dim < (int)context.array_index.size()-1 && context.cur_pos[dim]+num >= context.array_index[dim])
        cur_pos_add(dim+1, (context.cur_pos[dim]+num)/context.array_index[dim]);
    context.cur_pos[dim] = (context.cur_pos[dim]+num)%context.array_index[dim];
}


Value* CminusfBuilder::visit(ASTInit& node) {
    Value* val;
    int flag=0;
    int temp_conlevel;
    if(node.expression!=nullptr)
    {
        auto exp=node.expression->accept(*this);
        if(dynamic_cast<ConstantFP*>(exp) && context.tmpType == INT32_T)
            exp = CONST_INT((int)(dynamic_cast<ConstantFP*>(exp)->get_value()));
        else if (dynamic_cast<ConstantInt*>(exp) && context.tmpType == FLOAT_T)
            exp = CONST_FP((float)(dynamic_cast<ConstantInt*>(exp)->get_value()));
        if(!dynamic_cast<Constant*>(exp) && !context.array_index.empty())
        {
            //说明该处是变量引用
            if(exp->get_type()->is_float_type() && context.tmpType == INT32_T)
                exp = builder->create_fptosi(exp, INT32_T);
            else if (exp->get_type()->is_integer_type() && context.tmpType == FLOAT_T)
                exp = builder->create_sitofp(exp, FLOAT_T);
            val=CONST_ZERO(context.tmpType);
            auto des_val=exp;
            for(auto pos_val:context.cur_pos)
                context.val_pos[des_val].push_back(ConstantInt::get(pos_val, module.get()));
            std::reverse(context.val_pos[des_val].begin(),context.val_pos[des_val].end());
        }
        else
            val=exp;
        if(not context.array_index.empty())
            cur_pos_add(0, 1);
    }
    else
    {  
        std::vector<Constant*> consts;
        std::vector<int> true_level;
        int max_true_level=0;
        //int is_zero=1;
        for (auto &init:node.sub_inits)
            if(max_true_level<init->level)
                max_true_level=init->level;
        if(context.level>max_true_level+1)
        {
            temp_conlevel=context.level;
            context.level=max_true_level+1;
            flag=1;
        }
        for(auto &init:node.sub_inits)
        {
            context.level--;
            consts.push_back(dynamic_cast<Constant*>(init->accept(*this)));
            true_level.push_back(init->level);
            context.level++;
        }
        //对于低于当前维度的进行合并
        Type* arrayType = context.tmpType;
        for(int i=-1;i<context.level-1;i++)
        {
            int capacity = context.array_index[i+1];
            int num=0; //连续可合并个数
            std::vector<Constant*> uplevel;
            for(int j=0;j<(int)true_level.size();j++)
            {
                if(true_level[j]==i)
                {
                    num++;
                    uplevel.push_back(consts[j]);
                    if(num==capacity)
                    {
                        consts.erase(consts.begin()+j-capacity+1,consts.begin()+j+1);  
                        consts.insert(consts.begin()+j-capacity+1,dynamic_cast<Constant*>(ConstantArray::get(ArrayType::get(arrayType,capacity),uplevel)));
                        uplevel.clear();
                        true_level.erase(true_level.begin()+j-capacity+1,true_level.begin()+j+1);
                        true_level.insert(true_level.begin()+j-capacity+1,i+1);
                        j=j-capacity+1;
                        num=0;
                    }
                    else if(j==(int)true_level.size()-1)
                    {
                        uplevel.insert(uplevel.end(),capacity-num,dynamic_cast<Constant*>(CONST_ZERO(arrayType)));
                        cur_pos_add(i+1, capacity-num);
                        consts.erase(consts.begin()+j-num+1,consts.begin()+j+1);  
                        consts.insert(consts.begin()+j-num+1,dynamic_cast<Constant*>(ConstantArray::get(ArrayType::get(arrayType,capacity),uplevel)));
                        uplevel.clear();
                        true_level.erase(true_level.begin()+j-num+1,true_level.begin()+j+1);
                        true_level.insert(true_level.begin()+j-num+1,i+1);
                        j=j-num+1;
                        num=0;
                    }
                }
                else if(num>0 )
                {
                    uplevel.insert(uplevel.end(),capacity-num,dynamic_cast<Constant*>(CONST_ZERO(arrayType)));
                    cur_pos_add(i+1, capacity-num);
                    consts.erase(consts.begin()+j-num+1,consts.begin()+j+1);  
                    consts.insert(consts.begin()+j-num+1,dynamic_cast<Constant*>(ConstantArray::get(ArrayType::get(arrayType,capacity),uplevel)));
                    uplevel.clear();
                    true_level.erase(true_level.begin()+j-num+1,true_level.begin()+j+1);
                    true_level.insert(true_level.begin()+j-num+1,i+1);
                    j=j-num+1;
                    num=0;
                }
            }
            arrayType = ArrayType::get(arrayType, capacity);
        }
        /*for(auto const_val:consts)
            if (!dynamic_cast<ConstantZero*>(const_val))
                if(!dynamic_cast<ConstantInt*>(const_val) || dynamic_cast<ConstantInt*>(const_val)->get_value()!=0)  
                    if(!dynamic_cast<ConstantFP*>(const_val) || dynamic_cast<ConstantFP*>(const_val)->get_value()!=0)
                        is_zero=0;*/
        //if(consts.size()==0 or is_zero==1)
        if(consts.size()==0)
            val=CONST_ZERO(ArrayType::get(arrayType,context.array_index[context.level]));
        else
        {
            for(int i=consts.size()+1;i<=context.array_index[context.level];i++)
            {
                consts.push_back(dynamic_cast<Constant*>(CONST_ZERO(arrayType)));
                cur_pos_add(context.level, 1);
            }
                
            val=ConstantArray::get(ArrayType::get(arrayType,consts.size()),consts);
        }
        node.level = context.level + 1;
        if(flag==1)
        {
            for(int i=context.level+1;i<=temp_conlevel;i++)
            {
                int capcity = context.array_index[i];
                std::vector<Constant*> uplevels;
                uplevels.push_back(dynamic_cast<Constant*>(val));
                uplevels.insert(uplevels.end(),capcity-1,dynamic_cast<Constant*>(CONST_ZERO(val->get_type())));
                cur_pos_add(i, capcity-1);
                //if(!dynamic_cast<ConstantZero*>(val))
                    val = ConstantArray::get(ArrayType::get(val->get_type(),capcity),uplevels);
                //else val = CONST_ZERO(ArrayType::get(val->get_type(),capcity)); 
            }
            context.level=temp_conlevel;
        }
    }
    
    return val;
}
Value* CminusfBuilder::visit(ASTLVal& node) {
    Value* ret_value;
    std::vector<Value*> index;
    if(!context.is_const_exp)//不在常量表达式中
    {
        auto var = scope.find(node.id)->val;       
        bool assign = context.assign;    // 是否由赋值语句调用
        context.assign = false;
        if (node.expression.size()!=0) {   //说明是数组
            for(auto& exp:node.expression)
            {
                auto res = exp->accept(*this); 
                if (res->get_type()->is_float_type())          
                    res = builder->create_fptosi(res, INT32_T);     //转换数组下标值
                index.insert(index.begin(), res);
            }             

            auto function = builder->get_insert_block()->get_parent(); 
            /*Value * cond= CONST_ZERO(INT32_T);
            for(auto& i:index)
            {
                auto indexTest = builder->create_icmp_lt(i, CONST_ZERO(INT32_T)); 
                auto _indexTest = builder->create_zext(indexTest, INT32_T);
                cond=builder->create_iadd(_indexTest,cond);
            }
            auto ltzBB = BasicBlock::create(module.get(), node.id + "_ltz" + std::to_string(context.label_time++), function);
            auto gtzBB = BasicBlock::create(module.get(), node.id + "_gtz" + std::to_string(context.label_time++), function);

            auto _cond = builder->create_icmp_ne(cond, CONST_ZERO(INT32_T));
            builder->create_cond_br(_cond, ltzBB, gtzBB);

            builder->set_insert_point(ltzBB);       //终止程序
            auto fail = scope.find("neg_idx_except")->val;             
            builder->create_call(static_cast<Function*>(fail), {});
            builder->create_br(gtzBB);    

            builder->set_insert_point(gtzBB);  */
            if(var->get_type()->get_pointer_element_type()->is_array_type())
                index.insert(index.begin(), CONST_INT(0));
            else if (var->get_type()->get_pointer_element_type()->is_pointer_type())
            {
                var = builder->create_load(var);
                auto tmp_val = index[0];
                for(int i=0; i<(int)index.size()-1; i++)
                {
                    tmp_val = builder->create_imul((context.array_size.find(node.id)->second[i]), tmp_val);
                    tmp_val = builder->create_iadd(tmp_val, index[i+1]);
                }
                index.clear();
                index.push_back(tmp_val);
            }
            var = builder->create_gep(var, index);
            index.clear();
        }
        if (assign) {       //赋值语句
            ret_value = var;                   
            context.assign = false;    
        }    
        else 
        {
            if(var->get_type()->get_pointer_element_type()->is_array_type())
            {
                auto tmp_type = var->get_type()->get_pointer_element_type();
                index.push_back(CONST_INT(0));
                index.push_back(CONST_INT(0));
                while(tmp_type->get_array_element_type()->is_array_type())
                {
                    index.push_back(CONST_INT(0));
                    tmp_type = tmp_type->get_array_element_type();
                }
                ret_value = builder->create_gep(var, index);
            }
            else
                ret_value = builder->create_load(var);
        }
    }
    else//在常量表达式中
    {
        auto var = scope.find(node.id)->val;
        auto const_val = scope.find_const_val(node.id);
        if(node.expression.size()!=0)//是数组
        {
            for(auto& exp:node.expression)
            {
                auto res = exp->accept(*this); 
                if (res->get_type()->is_float_type())          
                    res = builder->create_fptosi(res, INT32_T);     //转换数组下标值
                index.push_back(res);
            }             
            /*
            auto function = builder->get_insert_block()->get_parent(); 
            Value * cond= CONST_ZERO(INT32_T);
            for(auto& i:index)
            {
                auto indexTest = builder->create_icmp_lt(i, CONST_ZERO(INT32_T)); 
                auto _indexTest = builder->create_zext(indexTest, INT32_T);
                cond=builder->create_iadd(_indexTest,cond);
            }
            auto ltzBB = BasicBlock::create(module.get(), node.id + "_ltz" + std::to_string(context.label_time++), function);
            auto gtzBB = BasicBlock::create(module.get(), node.id + "_gtz" + std::to_string(context.label_time++), function);

            auto _cond = builder->create_icmp_ne(cond, CONST_ZERO(INT32_T));
            builder->create_cond_br(_cond, ltzBB, gtzBB);

            builder->set_insert_point(ltzBB);       //终止程序
            auto fail = scope.find("neg_idx_except")->val;             
            builder->create_call(static_cast<Function*>(fail), {});
            builder->create_br(gtzBB);    

            builder->set_insert_point(gtzBB);  
            */
            for(int i = index.size()-1; i>=0; i--)
            {
                int num = dynamic_cast<ConstantInt* >(index[i])->get_value();
                const_val = (dynamic_cast<ConstantArray*>(const_val))->get_element_value(num);
            } 
        }
        ret_value = const_val;
    }
    return ret_value;
}
Value* CminusfBuilder::visit(ASTRelExp& node) {                  
    if (node.relation_expression_l == nullptr)  //说明是单个加法式
        return node.additive_expression->accept(*this);  
    auto lres = node.relation_expression_l->accept(*this);     
    Value * ret_val; 
    Value * ret_val1;
    Value * ret_val2;
    if(node.op==OP_AND or node.op==OP_OR)   //需要进行短路运算
    {
        if(dynamic_cast<Constant*>(lres))
        {
            bool temp;
            if(dynamic_cast<ConstantInt*>(lres))
                temp=dynamic_cast<ConstantInt*>(lres)->get_value()>0;
            else
                temp=dynamic_cast<ConstantFP*>(lres)->get_value()>0;
            if(node.op==OP_AND)
            {
                if(temp)
                {
                    auto rres = node.relation_expression_r ? node.relation_expression_r->accept(*this) : node.additive_expression->accept(*this);  
                    if(dynamic_cast<ConstantInt*>(rres))
                        ret_val = CONST_INT(dynamic_cast<ConstantInt*>(rres)->get_value()>0?1:0);
                    else if(dynamic_cast<ConstantFP*>(rres))
                        ret_val = CONST_INT(dynamic_cast<ConstantFP*>(rres)->get_value()>0?1:0);
                    else //变量
                    {
                        if(rres->get_type()->is_integer_type())
                            ret_val = builder->create_icmp_gt(rres,CONST_ZERO(INT32_T));
                        else
                            ret_val = builder->create_fcmp_gt(rres,CONST_ZERO(FLOAT_T));
                    }
                }
                else
                    ret_val = CONST_INT(0);
            }
            else
            {
                auto rres = node.relation_expression_r ? node.relation_expression_r->accept(*this) : node.additive_expression->accept(*this);  
                if(!temp)
                {
                    if(dynamic_cast<ConstantInt*>(rres))
                        ret_val = CONST_INT(dynamic_cast<ConstantInt*>(rres)->get_value()>0?1:0);
                    else if(dynamic_cast<ConstantFP*>(rres))
                        ret_val = CONST_INT(dynamic_cast<ConstantFP*>(rres)->get_value()>0?1:0);
                    else //变量
                    {
                        if(rres->get_type()->is_integer_type())
                            ret_val = builder->create_icmp_gt(rres,CONST_ZERO(INT32_T));
                        else
                            ret_val = builder->create_fcmp_gt(rres,CONST_ZERO(FLOAT_T));
                    }
                }
                else
                    ret_val = CONST_INT(1);
            }
        }
        else  //lres 变量
        {
            Value* repval;
            if(lres->get_type()->is_integer_type())
            {
                if(lres->get_type()->is_int1_type())
                    lres=builder->create_zext(lres,INT32_T);
                repval=builder->create_icmp_gt(lres,CONST_ZERO(INT32_T));
            }
                
            else
                repval=builder->create_fcmp_gt(lres,CONST_ZERO(FLOAT_T));
            auto function = builder->get_insert_block()->get_parent();
            auto trueBB = BasicBlock::create(module.get(), "true"+std::to_string(context.label_time++), function);   
            auto falseBB = BasicBlock::create(module.get(), "false"+std::to_string(context.label_time++), function);
            auto retBB = BasicBlock::create(module.get(), "ret"+std::to_string(context.label_time++), function);
            builder->create_cond_br(repval,trueBB,falseBB);
            if(node.op==OP_AND)
            {
                builder->set_insert_point(trueBB);  
                auto rres = node.relation_expression_r ? node.relation_expression_r->accept(*this) : node.additive_expression->accept(*this);  
                //if(dynamic_cast<ConstantInt*>(rres))
                //    ret_val = builder->create_iadd(CONST_INT(dynamic_cast<ConstantInt*>(rres)->get_value()>0?1:0),CONST_ZERO(INT32_T));
                //else if(dynamic_cast<ConstantFP*>(rres))
                //    ret_val = builder->create_iadd(CONST_INT(dynamic_cast<ConstantFP*>(rres)->get_value()>0?1:0),CONST_ZERO(INT32_T));
                //else //变量
                //{
                if(rres->get_type()->is_integer_type())
                {
                    if(rres->get_type()->is_int1_type())
                        rres=builder->create_zext(rres,INT32_T);
                    ret_val1 = builder->create_icmp_gt(rres,CONST_ZERO(INT32_T));
                }
                else
                    ret_val1 = builder->create_fcmp_gt(rres,CONST_ZERO(FLOAT_T));
                //}
                trueBB=builder->get_insert_block();
                builder->create_br(retBB); 

                builder->set_insert_point(falseBB); 
                ret_val2=builder->create_icmp_gt(CONST_ZERO(INT32_T),CONST_ZERO(INT32_T));
                builder->create_br(retBB); 
                
                builder->set_insert_point(retBB);
                ret_val=builder->create_phi(INT1_T,retBB,{ret_val1,ret_val2},{trueBB,falseBB});
                retBB->add_instr_begin(dynamic_cast<Instruction*>(ret_val));
            }
            else
            {
                builder->set_insert_point(falseBB);  
                auto rres = node.relation_expression_r ? node.relation_expression_r->accept(*this) : node.additive_expression->accept(*this);  
                //if(dynamic_cast<ConstantInt*>(rres))
                //    ret_val = builder->create_iadd(CONST_INT(dynamic_cast<ConstantInt*>(rres)->get_value()>0?1:0),CONST_ZERO(INT32_T));
                //else if(dynamic_cast<ConstantFP*>(rres))
                //    ret_val = builder->create_iadd(CONST_INT(dynamic_cast<ConstantFP*>(rres)->get_value()>0?1:0),CONST_ZERO(INT32_T));
                //else //变量
                //{
                    if(rres->get_type()->is_integer_type())
                    {
                        if(rres->get_type()->is_int1_type())
                            rres=builder->create_zext(rres,INT32_T);
                        ret_val2 = builder->create_icmp_gt(rres,CONST_ZERO(INT32_T));
                    }     
                    else
                        ret_val2 = builder->create_fcmp_gt(rres,CONST_ZERO(FLOAT_T));
                //}
                falseBB=builder->get_insert_block();
                builder->create_br(retBB); 

                builder->set_insert_point(trueBB);  
                ret_val1=builder->create_icmp_gt(CONST_INT(1),CONST_ZERO(INT32_T));
                builder->create_br(retBB); 

                builder->set_insert_point(retBB);
                ret_val=builder->create_phi(INT1_T,retBB,{ret_val1,ret_val2},{trueBB,falseBB});
                retBB->add_instr_begin(dynamic_cast<Instruction*>(ret_val));
            }
        }
        if(!ret_val->get_type()->is_int32_type())
            ret_val = builder->create_zext(ret_val, INT32_T);
    }      
    else
    {
        auto rres = node.relation_expression_r ? node.relation_expression_r->accept(*this) : node.additive_expression->accept(*this);  
        if(dynamic_cast<Constant*>(lres) && dynamic_cast<Constant*>(rres))
        {
            if (lres->get_type()->is_integer_type() && rres->get_type()->is_integer_type()) {
                switch (node.op) {  
                case OP_LE:
                    ret_val = CONST_INT((dynamic_cast<ConstantInt*>(lres)->get_value())<=(dynamic_cast<ConstantInt*>(rres)->get_value()) ? 1 : 0);break;
                case OP_LT:
                    ret_val = CONST_INT((dynamic_cast<ConstantInt*>(lres)->get_value())<(dynamic_cast<ConstantInt*>(rres)->get_value()) ? 1 : 0);break;
                case OP_GT:
                    ret_val = CONST_INT((dynamic_cast<ConstantInt*>(lres)->get_value())>(dynamic_cast<ConstantInt*>(rres)->get_value()) ? 1 : 0);break;
                case OP_GE:
                    ret_val = CONST_INT((dynamic_cast<ConstantInt*>(lres)->get_value())>=(dynamic_cast<ConstantInt*>(rres)->get_value()) ? 1 : 0);break;
                case OP_EQ:
                    ret_val = CONST_INT((dynamic_cast<ConstantInt*>(lres)->get_value())==(dynamic_cast<ConstantInt*>(rres)->get_value()) ? 1 : 0);break;
                case OP_NEQ:
                    ret_val = CONST_INT((dynamic_cast<ConstantInt*>(lres)->get_value())!=(dynamic_cast<ConstantInt*>(rres)->get_value()) ? 1 : 0);break;
                }
            } else if (lres->get_type()->is_integer_type()){ 
                switch (node.op) {  
                case OP_LE:
                    ret_val = CONST_INT((dynamic_cast<ConstantInt*>(lres)->get_value())<=(dynamic_cast<ConstantFP*>(rres)->get_value()) ? 1 : 0);break;
                case OP_LT:
                    ret_val = CONST_INT((dynamic_cast<ConstantInt*>(lres)->get_value())<(dynamic_cast<ConstantFP*>(rres)->get_value()) ? 1 : 0);break;
                case OP_GT:
                    ret_val = CONST_INT((dynamic_cast<ConstantInt*>(lres)->get_value())>(dynamic_cast<ConstantFP*>(rres)->get_value()) ? 1 : 0);break;
                case OP_GE:
                    ret_val = CONST_INT((dynamic_cast<ConstantInt*>(lres)->get_value())>=(dynamic_cast<ConstantFP*>(rres)->get_value()) ? 1 : 0);break;
                case OP_EQ:
                    ret_val = CONST_INT((dynamic_cast<ConstantInt*>(lres)->get_value())==(dynamic_cast<ConstantFP*>(rres)->get_value()) ? 1 : 0);break;
                case OP_NEQ:
                    ret_val = CONST_INT((dynamic_cast<ConstantInt*>(lres)->get_value())!=(dynamic_cast<ConstantFP*>(rres)->get_value()) ? 1 : 0);break;
                }
            } else if (rres->get_type()->is_integer_type()){
                switch (node.op) {  
                case OP_LE:
                    ret_val = CONST_INT((dynamic_cast<ConstantFP*>(lres)->get_value())<=(dynamic_cast<ConstantInt*>(rres)->get_value()) ? 1 : 0);break;
                case OP_LT:
                    ret_val = CONST_INT((dynamic_cast<ConstantFP*>(lres)->get_value())<(dynamic_cast<ConstantInt*>(rres)->get_value()) ? 1 : 0);break;
                case OP_GT:
                    ret_val = CONST_INT((dynamic_cast<ConstantFP*>(lres)->get_value())>(dynamic_cast<ConstantInt*>(rres)->get_value()) ? 1 : 0);break;
                case OP_GE:
                    ret_val = CONST_INT((dynamic_cast<ConstantFP*>(lres)->get_value())>=(dynamic_cast<ConstantInt*>(rres)->get_value()) ? 1 : 0);break;
                case OP_EQ:
                    ret_val = CONST_INT((dynamic_cast<ConstantFP*>(lres)->get_value())==(dynamic_cast<ConstantInt*>(rres)->get_value()) ? 1 : 0);break;
                case OP_NEQ:
                    ret_val = CONST_INT((dynamic_cast<ConstantFP*>(lres)->get_value())!=(dynamic_cast<ConstantInt*>(rres)->get_value()) ? 1 : 0);break;
                }
            } else {
                switch (node.op) {  
                case OP_LE:
                    ret_val = CONST_INT((dynamic_cast<ConstantFP*>(lres)->get_value())<=(dynamic_cast<ConstantFP*>(rres)->get_value()) ? 1 : 0);break;
                case OP_LT:
                    ret_val = CONST_INT((dynamic_cast<ConstantFP*>(lres)->get_value())<(dynamic_cast<ConstantFP*>(rres)->get_value()) ? 1 : 0);break;
                case OP_GT:
                    ret_val = CONST_INT((dynamic_cast<ConstantFP*>(lres)->get_value())>(dynamic_cast<ConstantFP*>(rres)->get_value()) ? 1 : 0);break;
                case OP_GE:
                    ret_val = CONST_INT((dynamic_cast<ConstantFP*>(lres)->get_value())>=(dynamic_cast<ConstantFP*>(rres)->get_value()) ? 1 : 0);break;
                case OP_EQ:
                    ret_val = CONST_INT((dynamic_cast<ConstantFP*>(lres)->get_value())==(dynamic_cast<ConstantFP*>(rres)->get_value()) ? 1 : 0);break;
                case OP_NEQ:
                    ret_val = CONST_INT((dynamic_cast<ConstantFP*>(lres)->get_value())!=(dynamic_cast<ConstantFP*>(rres)->get_value()) ? 1 : 0);break;
                }
            }
        }
        else
        {
            if (lres->get_type()->is_integer_type() && rres->get_type()->is_integer_type()) {     //都为整数的情况
                if(lres->get_type()->is_int1_type())
                    lres=builder->create_zext(lres,INT32_T);
                if(rres->get_type()->is_int1_type())
                    rres=builder->create_zext(rres,INT32_T);
                switch (node.op) {  
                case OP_LE:
                    ret_val = builder->create_icmp_le(lres, rres);break;
                case OP_LT:
                    ret_val = builder->create_icmp_lt(lres, rres);break;
                case OP_GT:
                    ret_val = builder->create_icmp_gt(lres, rres);break;
                case OP_GE:
                    ret_val = builder->create_icmp_ge(lres, rres);break;
                case OP_EQ:
                    ret_val = builder->create_icmp_eq(lres, rres);break;
                case OP_NEQ:
                    ret_val = builder->create_icmp_ne(lres, rres);break;
                }
            }
            else
            {
                if (lres->get_type()->is_integer_type())         //若有整数，则先转换
                    lres = builder->create_sitofp(lres, FLOAT_T);
                if (rres->get_type()->is_integer_type()) 
                    rres = builder->create_sitofp(rres, FLOAT_T);
                switch (node.op) { 
                case OP_LE:
                    ret_val = builder->create_fcmp_le(lres, rres);break;
                case OP_LT:
                    ret_val = builder->create_fcmp_lt(lres, rres);break;
                case OP_GT:
                    ret_val = builder->create_fcmp_gt(lres, rres);break;
                case OP_GE:
                    ret_val = builder->create_fcmp_ge(lres, rres);break;
                case OP_EQ:
                    ret_val = builder->create_fcmp_eq(lres, rres);break;
                case OP_NEQ:
                    ret_val = builder->create_fcmp_ne(lres, rres);break;
                }
            }
            ret_val = builder->create_zext(ret_val, INT32_T);     //统一讲结果保存为整
        }
    }         
    
    return ret_val;

}
Value* CminusfBuilder::visit(ASTUnaryExp& node) {
    if(node.expression!=nullptr)
        return node.expression->accept(*this);
    else if(node.lval!=nullptr)
        return node.lval->accept(*this);
    else if (node.num!=nullptr)
        return node.num->accept(*this);
    else if(node.ident.length()!=0)
    {
        //call函数调用
        Value* ret_val;
        auto function = static_cast<Function*>(scope.find(node.ident)->val);   
        auto paramType = function->get_function_type()->param_begin();
        std::vector<Value*> args;      
        for (auto arg : node.params) {  
            auto res = arg->accept(*this);        
            if (res->get_type()->is_pointer_type()) {  
                args.push_back(res); 
            }
            else { 
                if (*paramType==FLOAT_T && res->get_type()->is_integer_type())
                    res = builder->create_sitofp(res, FLOAT_T);
                if (*paramType==INT32_T && res->get_type()->is_float_type())
                    res = builder->create_fptosi(res, INT32_T);
                args.push_back(res);
            }
            paramType++;              
        }
        ret_val = builder->create_call(static_cast<Function*>(function), args); 
        return ret_val;
    }
    else
    {
        Value* val=node.unaryexp->accept(*this);
        Type* temtype=val->get_type();
        if(dynamic_cast<Constant*>(val))
        {
            switch (node.op) { 
            case OP_NOT:
            {
                if(temtype == FLOAT_T)
                    val = CONST_INT((dynamic_cast<ConstantFP*>(val)->get_value() == 0 ? 1 : 0));
                else
                    val = CONST_INT((dynamic_cast<ConstantInt*>(val)->get_value() == 0 ? 1 : 0));
                break;
            }
            case OP_POS:
                break;
            case OP_NEG:
            {
                if(temtype == FLOAT_T)
                    val = CONST_FP(-(dynamic_cast<ConstantFP*>(val)->get_value()));
                else
                    val = CONST_INT(-(dynamic_cast<ConstantInt*>(val)->get_value()));
                break;
            }
            }
        }
        else
        {
            switch (node.op) { 
            case OP_NOT:
                if(val->get_type()==INT1_T)
                    val=builder->create_zext(val,INT32_T);
                if(val->get_type()->is_integer_type())
                    val=builder->create_icmp_le(val,CONST_ZERO(INT32_T));
                else 
                    val=builder->create_icmp_le(val,CONST_ZERO(FLOAT_T));
                break;
            case OP_POS:
                break;
            case OP_NEG:
                if (val->get_type()->is_float_type())
                {
                    val=builder->create_fsub(CONST_ZERO(FLOAT_T),val);
                }
                else
                {
                    if(val->get_type()->is_int1_type())
                        val=builder->create_zext(val,INT32_T);
                    val=builder->create_isub(CONST_ZERO(INT32_T),val);
                }
                    
                break;
            }
        }
        return val;
    }
}