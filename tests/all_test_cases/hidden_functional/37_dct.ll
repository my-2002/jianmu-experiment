; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/all_test_cases/hidden_functional/37_dct.sy"

@MAX_DIM_X = constant i32 8
@MAX_DIM_Y = constant i32 8
@test_block = global [8 x [8 x float]] zeroinitializer
@test_dct = global [8 x [8 x float]] zeroinitializer
@test_idct = global [8 x [8 x float]] zeroinitializer
@PI = constant i32 3
@TWO_PI = constant i32 6
@EPSILON = constant i32 0
declare void @neg_idx_except()

declare i32 @getint()

declare i32 @getch()

declare float @getfloat()

declare i32 @getarray(i32*)

declare i32 @getfarray(float*)

declare void @putint(i32)

declare void @putch(i32)

declare void @putarray(i32, i32*)

declare void @putfloat(float)

declare void @putfarray(i32, float*)

declare void @putf(i32*)

declare void @starttime()

declare void @stoptime()

define float @my_fabs(float %arg0) {
label_entry:
  %op1 = alloca float
  store float %arg0, float* %op1
  %op2 = load float, float* %op1
  %op3 = sitofp i32 0 to float
  %op4 = fcmp ugt float %op2, %op3
  %op5 = zext i1 %op4 to i32
  %op6 = icmp sgt i32 %op5, zeroinitializer
  br i1 %op6, label %label_true0, label %label_ret1
label_true0:                                                ; preds = %label_entry
  %op7 = load float, float* %op1
  ret float %op7
label_ret1:                                                ; preds = %label_entry
  %op8 = load float, float* %op1
  %op9 = fsub float zeroinitializer, %op8
  ret float %op9
}
define float @p(float %arg0) {
label_entry:
  %op1 = alloca float
  store float %arg0, float* %op1
  %op2 = load float, float* %op1
  %op3 = sitofp i32 3 to float
  %op4 = fmul float %op3, %op2
  %op5 = load float, float* %op1
  %op6 = sitofp i32 4 to float
  %op7 = fmul float %op6, %op5
  %op8 = load float, float* %op1
  %op9 = fmul float %op7, %op8
  %op10 = load float, float* %op1
  %op11 = fmul float %op9, %op10
  %op12 = fsub float %op4, %op11
  ret float %op12
}
define float @my_sin_impl(float %arg0) {
label_entry:
  %op1 = alloca float
  store float %arg0, float* %op1
  %op2 = load float, float* %op1
  %op3 = call float @my_fabs(float %op2)
  %op4 = load i32, i32* @EPSILON
  %op5 = sitofp i32 %op4 to float
  %op6 = fcmp ule float %op3, %op5
  %op7 = zext i1 %op6 to i32
  %op8 = icmp sgt i32 %op7, zeroinitializer
  br i1 %op8, label %label_true2, label %label_ret3
label_true2:                                                ; preds = %label_entry
  %op9 = load float, float* %op1
  ret float %op9
label_ret3:                                                ; preds = %label_entry
  %op10 = load float, float* %op1
  %op11 = fdiv float %op10, 0x4008000000000000
  %op12 = call float @my_sin_impl(float %op11)
  %op13 = call float @p(float %op12)
  ret float %op13
}
define float @my_sin(float %arg0) {
label_entry:
  %op1 = alloca float
  store float %arg0, float* %op1
  %op2 = load float, float* %op1
  %op3 = load i32, i32* @TWO_PI
  %op4 = sitofp i32 %op3 to float
  %op5 = fcmp ugt float %op2, %op4
  %op6 = zext i1 %op5 to i32
  %op7 = icmp sgt i32 %op6, zeroinitializer
  br i1 %op7, label %label_true4, label %label_false5
label_true4:                                                ; preds = %label_entry
  %op8 = icmp sgt i32 1, zeroinitializer
  br label %label_ret6
label_false5:                                                ; preds = %label_entry
  %op9 = load float, float* %op1
  %op10 = load i32, i32* @TWO_PI
  %op11 = sub i32 zeroinitializer, %op10
  %op12 = sitofp i32 %op11 to float
  %op13 = fcmp ult float %op9, %op12
  %op14 = zext i1 %op13 to i32
  %op15 = icmp sgt i32 %op14, zeroinitializer
  br label %label_ret6
label_ret6:                                                ; preds = %label_false5, %label_true4
  %op16 = phi i1 [ %op8, %label_true4 ], [ %op15, %label_false5 ]
  %op17 = zext i1 %op16 to i32
  %op18 = icmp sgt i32 %op17, zeroinitializer
  br i1 %op18, label %label_true7, label %label_ret8
label_true7:                                                ; preds = %label_ret6
  %op19 = load float, float* %op1
  %op20 = load i32, i32* @TWO_PI
  %op21 = sitofp i32 %op20 to float
  %op22 = fdiv float %op19, %op21
  %op23 = fptosi float %op22 to i32
  %op24 = alloca i32
  store i32 %op23, i32* %op24
  %op25 = load float, float* %op1
  %op26 = load i32, i32* %op24
  %op27 = load i32, i32* @TWO_PI
  %op28 = mul i32 %op26, %op27
  %op29 = sitofp i32 %op28 to float
  %op30 = fsub float %op25, %op29
  store float %op30, float* %op1
  br label %label_ret8
label_ret8:                                                ; preds = %label_ret6, %label_true7
  %op31 = load float, float* %op1
  %op32 = load i32, i32* @PI
  %op33 = sitofp i32 %op32 to float
  %op34 = fcmp ugt float %op31, %op33
  %op35 = zext i1 %op34 to i32
  %op36 = icmp sgt i32 %op35, zeroinitializer
  br i1 %op36, label %label_true9, label %label_ret10
label_true9:                                                ; preds = %label_ret8
  %op37 = load float, float* %op1
  %op38 = load i32, i32* @TWO_PI
  %op39 = sitofp i32 %op38 to float
  %op40 = fsub float %op37, %op39
  store float %op40, float* %op1
  br label %label_ret10
label_ret10:                                                ; preds = %label_ret8, %label_true9
  %op41 = load float, float* %op1
  %op42 = load i32, i32* @PI
  %op43 = sub i32 zeroinitializer, %op42
  %op44 = sitofp i32 %op43 to float
  %op45 = fcmp ult float %op41, %op44
  %op46 = zext i1 %op45 to i32
  %op47 = icmp sgt i32 %op46, zeroinitializer
  br i1 %op47, label %label_true11, label %label_ret12
label_true11:                                                ; preds = %label_ret10
  %op48 = load float, float* %op1
  %op49 = load i32, i32* @TWO_PI
  %op50 = sitofp i32 %op49 to float
  %op51 = fadd float %op48, %op50
  store float %op51, float* %op1
  br label %label_ret12
label_ret12:                                                ; preds = %label_ret10, %label_true11
  %op52 = load float, float* %op1
  %op53 = call float @my_sin_impl(float %op52)
  ret float %op53
}
define float @my_cos(float %arg0) {
label_entry:
  %op1 = alloca float
  store float %arg0, float* %op1
  %op2 = load float, float* %op1
  %op3 = load i32, i32* @PI
  %op4 = sdiv i32 %op3, 2
  %op5 = sitofp i32 %op4 to float
  %op6 = fadd float %op2, %op5
  %op7 = call float @my_sin(float %op6)
  ret float %op7
}
define void @write_mat(float* %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  %op3 = alloca float*
  %op4 = load i32, i32* @MAX_DIM_Y
  store float* %arg0, float** %op3
  %op5 = alloca i32
  store i32 %arg1, i32* %op5
  %op6 = alloca i32
  store i32 %arg2, i32* %op6
  %op7 = alloca i32
  store i32 0, i32* %op7
  br label %label_condition13
label_condition13:                                                ; preds = %label_entry, %label_ret20
  %op8 = load i32, i32* %op7
  %op9 = load i32, i32* %op5
  %op10 = icmp slt i32 %op8, %op9
  %op11 = zext i1 %op10 to i32
  %op12 = icmp sgt i32 %op11, zeroinitializer
  br i1 %op12, label %label_loop14, label %label_ret15
label_loop14:                                                ; preds = %label_condition13
  %op13 = load i32, i32* %op7
  %op14 = icmp slt i32 %op13, zeroinitializer
  %op15 = zext i1 %op14 to i32
  %op16 = add i32 %op15, zeroinitializer
  %op17 = icmp slt i32 0, zeroinitializer
  %op18 = zext i1 %op17 to i32
  %op19 = add i32 %op18, %op16
  %op20 = icmp ne i32 %op19, zeroinitializer
  br i1 %op20, label %label_mat_ltz16, label %label_mat_gtz17
label_ret15:                                                ; preds = %label_condition13
  call void @putch(i32 10)
  ret void
label_mat_ltz16:                                                ; preds = %label_loop14
  call void @neg_idx_except()
  br label %label_mat_gtz17
label_mat_gtz17:                                                ; preds = %label_loop14, %label_mat_ltz16
  %op21 = load float*, float** %op3
  %op22 = mul i32 %op4, %op13
  %op23 = add i32 %op22, 0
  %op24 = getelementptr float, float* %op21, i32 %op23
  %op25 = load float, float* %op24
  call void @putfloat(float %op25)
  %op26 = alloca i32
  store i32 1, i32* %op26
  br label %label_condition18
label_condition18:                                                ; preds = %label_mat_gtz17, %label_mat_gtz22
  %op27 = load i32, i32* %op26
  %op28 = load i32, i32* %op6
  %op29 = icmp slt i32 %op27, %op28
  %op30 = zext i1 %op29 to i32
  %op31 = icmp sgt i32 %op30, zeroinitializer
  br i1 %op31, label %label_loop19, label %label_ret20
label_loop19:                                                ; preds = %label_condition18
  call void @putch(i32 32)
  %op32 = load i32, i32* %op26
  %op33 = load i32, i32* %op7
  %op34 = icmp slt i32 %op33, zeroinitializer
  %op35 = zext i1 %op34 to i32
  %op36 = add i32 %op35, zeroinitializer
  %op37 = icmp slt i32 %op32, zeroinitializer
  %op38 = zext i1 %op37 to i32
  %op39 = add i32 %op38, %op36
  %op40 = icmp ne i32 %op39, zeroinitializer
  br i1 %op40, label %label_mat_ltz21, label %label_mat_gtz22
label_ret20:                                                ; preds = %label_condition18
  call void @putch(i32 10)
  %op41 = load i32, i32* %op7
  %op42 = add i32 %op41, 1
  store i32 %op42, i32* %op7
  br label %label_condition13
label_mat_ltz21:                                                ; preds = %label_loop19
  call void @neg_idx_except()
  br label %label_mat_gtz22
label_mat_gtz22:                                                ; preds = %label_loop19, %label_mat_ltz21
  %op43 = load float*, float** %op3
  %op44 = mul i32 %op4, %op33
  %op45 = add i32 %op44, %op32
  %op46 = getelementptr float, float* %op43, i32 %op45
  %op47 = load float, float* %op46
  call void @putfloat(float %op47)
  %op48 = load i32, i32* %op26
  %op49 = add i32 %op48, 1
  store i32 %op49, i32* %op26
  br label %label_condition18
}
define void @dct(float* %arg0, float* %arg1, i32 %arg2, i32 %arg3) {
label_entry:
  %op4 = alloca float*
  %op5 = load i32, i32* @MAX_DIM_Y
  store float* %arg0, float** %op4
  %op6 = alloca float*
  %op7 = load i32, i32* @MAX_DIM_Y
  store float* %arg1, float** %op6
  %op8 = alloca i32
  store i32 %arg2, i32* %op8
  %op9 = alloca i32
  store i32 %arg3, i32* %op9
  %op10 = alloca i32
  store i32 0, i32* %op10
  br label %label_condition23
label_condition23:                                                ; preds = %label_entry, %label_ret28
  %op11 = load i32, i32* %op10
  %op12 = load i32, i32* %op8
  %op13 = icmp slt i32 %op11, %op12
  %op14 = zext i1 %op13 to i32
  %op15 = icmp sgt i32 %op14, zeroinitializer
  br i1 %op15, label %label_loop24, label %label_ret25
label_loop24:                                                ; preds = %label_condition23
  %op16 = alloca i32
  store i32 0, i32* %op16
  br label %label_condition26
label_ret25:                                                ; preds = %label_condition23
  ret void
label_condition26:                                                ; preds = %label_loop24, %label_ret33
  %op17 = load i32, i32* %op16
  %op18 = load i32, i32* %op9
  %op19 = icmp slt i32 %op17, %op18
  %op20 = zext i1 %op19 to i32
  %op21 = icmp sgt i32 %op20, zeroinitializer
  br i1 %op21, label %label_loop27, label %label_ret28
label_loop27:                                                ; preds = %label_condition26
  %op22 = load i32, i32* %op16
  %op23 = load i32, i32* %op10
  %op24 = icmp slt i32 %op23, zeroinitializer
  %op25 = zext i1 %op24 to i32
  %op26 = add i32 %op25, zeroinitializer
  %op27 = icmp slt i32 %op22, zeroinitializer
  %op28 = zext i1 %op27 to i32
  %op29 = add i32 %op28, %op26
  %op30 = icmp ne i32 %op29, zeroinitializer
  br i1 %op30, label %label_dct_mat_ltz29, label %label_dct_mat_gtz30
label_ret28:                                                ; preds = %label_condition26
  %op31 = load i32, i32* %op10
  %op32 = add i32 %op31, 1
  store i32 %op32, i32* %op10
  br label %label_condition23
label_dct_mat_ltz29:                                                ; preds = %label_loop27
  call void @neg_idx_except()
  br label %label_dct_mat_gtz30
label_dct_mat_gtz30:                                                ; preds = %label_loop27, %label_dct_mat_ltz29
  %op33 = load float*, float** %op4
  %op34 = mul i32 %op5, %op23
  %op35 = add i32 %op34, %op22
  %op36 = getelementptr float, float* %op33, i32 %op35
  %op37 = sitofp i32 0 to float
  store float %op37, float* %op36
  %op38 = alloca i32
  store i32 0, i32* %op38
  br label %label_condition31
label_condition31:                                                ; preds = %label_dct_mat_gtz30, %label_ret36
  %op39 = load i32, i32* %op38
  %op40 = load i32, i32* %op8
  %op41 = icmp slt i32 %op39, %op40
  %op42 = zext i1 %op41 to i32
  %op43 = icmp sgt i32 %op42, zeroinitializer
  br i1 %op43, label %label_loop32, label %label_ret33
label_loop32:                                                ; preds = %label_condition31
  %op44 = alloca i32
  store i32 0, i32* %op44
  br label %label_condition34
label_ret33:                                                ; preds = %label_condition31
  %op45 = load i32, i32* %op16
  %op46 = add i32 %op45, 1
  store i32 %op46, i32* %op16
  br label %label_condition26
label_condition34:                                                ; preds = %label_loop32, %label_mat_gtz42
  %op47 = load i32, i32* %op44
  %op48 = load i32, i32* %op9
  %op49 = icmp slt i32 %op47, %op48
  %op50 = zext i1 %op49 to i32
  %op51 = icmp sgt i32 %op50, zeroinitializer
  br i1 %op51, label %label_loop35, label %label_ret36
label_loop35:                                                ; preds = %label_condition34
  %op52 = load i32, i32* %op16
  %op53 = load i32, i32* %op10
  %op54 = icmp slt i32 %op53, zeroinitializer
  %op55 = zext i1 %op54 to i32
  %op56 = add i32 %op55, zeroinitializer
  %op57 = icmp slt i32 %op52, zeroinitializer
  %op58 = zext i1 %op57 to i32
  %op59 = add i32 %op58, %op56
  %op60 = icmp ne i32 %op59, zeroinitializer
  br i1 %op60, label %label_dct_mat_ltz37, label %label_dct_mat_gtz38
label_ret36:                                                ; preds = %label_condition34
  %op61 = load i32, i32* %op38
  %op62 = add i32 %op61, 1
  store i32 %op62, i32* %op38
  br label %label_condition31
label_dct_mat_ltz37:                                                ; preds = %label_loop35
  call void @neg_idx_except()
  br label %label_dct_mat_gtz38
label_dct_mat_gtz38:                                                ; preds = %label_loop35, %label_dct_mat_ltz37
  %op63 = load float*, float** %op4
  %op64 = mul i32 %op5, %op53
  %op65 = add i32 %op64, %op52
  %op66 = getelementptr float, float* %op63, i32 %op65
  %op67 = load i32, i32* %op16
  %op68 = load i32, i32* %op10
  %op69 = icmp slt i32 %op68, zeroinitializer
  %op70 = zext i1 %op69 to i32
  %op71 = add i32 %op70, zeroinitializer
  %op72 = icmp slt i32 %op67, zeroinitializer
  %op73 = zext i1 %op72 to i32
  %op74 = add i32 %op73, %op71
  %op75 = icmp ne i32 %op74, zeroinitializer
  br i1 %op75, label %label_dct_mat_ltz39, label %label_dct_mat_gtz40
label_dct_mat_ltz39:                                                ; preds = %label_dct_mat_gtz38
  call void @neg_idx_except()
  br label %label_dct_mat_gtz40
label_dct_mat_gtz40:                                                ; preds = %label_dct_mat_gtz38, %label_dct_mat_ltz39
  %op76 = load float*, float** %op4
  %op77 = mul i32 %op5, %op68
  %op78 = add i32 %op77, %op67
  %op79 = getelementptr float, float* %op76, i32 %op78
  %op80 = load float, float* %op79
  %op81 = load i32, i32* %op44
  %op82 = load i32, i32* %op38
  %op83 = icmp slt i32 %op82, zeroinitializer
  %op84 = zext i1 %op83 to i32
  %op85 = add i32 %op84, zeroinitializer
  %op86 = icmp slt i32 %op81, zeroinitializer
  %op87 = zext i1 %op86 to i32
  %op88 = add i32 %op87, %op85
  %op89 = icmp ne i32 %op88, zeroinitializer
  br i1 %op89, label %label_mat_ltz41, label %label_mat_gtz42
label_mat_ltz41:                                                ; preds = %label_dct_mat_gtz40
  call void @neg_idx_except()
  br label %label_mat_gtz42
label_mat_gtz42:                                                ; preds = %label_dct_mat_gtz40, %label_mat_ltz41
  %op90 = load float*, float** %op6
  %op91 = mul i32 %op7, %op82
  %op92 = add i32 %op91, %op81
  %op93 = getelementptr float, float* %op90, i32 %op92
  %op94 = load float, float* %op93
  %op95 = load i32, i32* @PI
  %op96 = load i32, i32* %op8
  %op97 = sdiv i32 %op95, %op96
  %op98 = load i32, i32* %op38
  %op99 = sitofp i32 %op98 to float
  %op100 = fadd float %op99, 0x3fe0000000000000
  %op101 = sitofp i32 %op97 to float
  %op102 = fmul float %op101, %op100
  %op103 = load i32, i32* %op10
  %op104 = sitofp i32 %op103 to float
  %op105 = fmul float %op102, %op104
  %op106 = call float @my_cos(float %op105)
  %op107 = fmul float %op94, %op106
  %op108 = load i32, i32* @PI
  %op109 = load i32, i32* %op9
  %op110 = sdiv i32 %op108, %op109
  %op111 = load i32, i32* %op44
  %op112 = sitofp i32 %op111 to float
  %op113 = fadd float %op112, 0x3fe0000000000000
  %op114 = sitofp i32 %op110 to float
  %op115 = fmul float %op114, %op113
  %op116 = load i32, i32* %op16
  %op117 = sitofp i32 %op116 to float
  %op118 = fmul float %op115, %op117
  %op119 = call float @my_cos(float %op118)
  %op120 = fmul float %op107, %op119
  %op121 = fadd float %op80, %op120
  store float %op121, float* %op66
  %op122 = load i32, i32* %op44
  %op123 = add i32 %op122, 1
  store i32 %op123, i32* %op44
  br label %label_condition34
}
define void @idct(float* %arg0, float* %arg1, i32 %arg2, i32 %arg3) {
label_entry:
  %op4 = alloca float*
  %op5 = load i32, i32* @MAX_DIM_Y
  store float* %arg0, float** %op4
  %op6 = alloca float*
  %op7 = load i32, i32* @MAX_DIM_Y
  store float* %arg1, float** %op6
  %op8 = alloca i32
  store i32 %arg2, i32* %op8
  %op9 = alloca i32
  store i32 %arg3, i32* %op9
  %op10 = alloca i32
  store i32 0, i32* %op10
  br label %label_condition43
label_condition43:                                                ; preds = %label_entry, %label_ret48
  %op11 = load i32, i32* %op10
  %op12 = load i32, i32* %op8
  %op13 = icmp slt i32 %op11, %op12
  %op14 = zext i1 %op13 to i32
  %op15 = icmp sgt i32 %op14, zeroinitializer
  br i1 %op15, label %label_loop44, label %label_ret45
label_loop44:                                                ; preds = %label_condition43
  %op16 = alloca i32
  store i32 0, i32* %op16
  br label %label_condition46
label_ret45:                                                ; preds = %label_condition43
  ret void
label_condition46:                                                ; preds = %label_loop44, %label_mat_gtz86
  %op17 = load i32, i32* %op16
  %op18 = load i32, i32* %op9
  %op19 = icmp slt i32 %op17, %op18
  %op20 = zext i1 %op19 to i32
  %op21 = icmp sgt i32 %op20, zeroinitializer
  br i1 %op21, label %label_loop47, label %label_ret48
label_loop47:                                                ; preds = %label_condition46
  %op22 = load i32, i32* %op16
  %op23 = load i32, i32* %op10
  %op24 = icmp slt i32 %op23, zeroinitializer
  %op25 = zext i1 %op24 to i32
  %op26 = add i32 %op25, zeroinitializer
  %op27 = icmp slt i32 %op22, zeroinitializer
  %op28 = zext i1 %op27 to i32
  %op29 = add i32 %op28, %op26
  %op30 = icmp ne i32 %op29, zeroinitializer
  br i1 %op30, label %label_mat_ltz49, label %label_mat_gtz50
label_ret48:                                                ; preds = %label_condition46
  %op31 = load i32, i32* %op10
  %op32 = add i32 %op31, 1
  store i32 %op32, i32* %op10
  br label %label_condition43
label_mat_ltz49:                                                ; preds = %label_loop47
  call void @neg_idx_except()
  br label %label_mat_gtz50
label_mat_gtz50:                                                ; preds = %label_loop47, %label_mat_ltz49
  %op33 = load float*, float** %op4
  %op34 = mul i32 %op5, %op23
  %op35 = add i32 %op34, %op22
  %op36 = getelementptr float, float* %op33, i32 %op35
  %op37 = icmp slt i32 0, zeroinitializer
  %op38 = zext i1 %op37 to i32
  %op39 = add i32 %op38, zeroinitializer
  %op40 = icmp slt i32 0, zeroinitializer
  %op41 = zext i1 %op40 to i32
  %op42 = add i32 %op41, %op39
  %op43 = icmp ne i32 %op42, zeroinitializer
  br i1 %op43, label %label_dct_mat_ltz51, label %label_dct_mat_gtz52
label_dct_mat_ltz51:                                                ; preds = %label_mat_gtz50
  call void @neg_idx_except()
  br label %label_dct_mat_gtz52
label_dct_mat_gtz52:                                                ; preds = %label_mat_gtz50, %label_dct_mat_ltz51
  %op44 = load float*, float** %op6
  %op45 = mul i32 %op7, 0
  %op46 = add i32 %op45, 0
  %op47 = getelementptr float, float* %op44, i32 %op46
  %op48 = load float, float* %op47
  %op49 = fmul float 0x3fd0000000000000, %op48
  store float %op49, float* %op36
  %op50 = alloca i32
  %op51 = alloca i32
  store i32 1, i32* %op50
  br label %label_condition53
label_condition53:                                                ; preds = %label_dct_mat_gtz52, %label_dct_mat_gtz61
  %op52 = load i32, i32* %op50
  %op53 = load i32, i32* %op8
  %op54 = icmp slt i32 %op52, %op53
  %op55 = zext i1 %op54 to i32
  %op56 = icmp sgt i32 %op55, zeroinitializer
  br i1 %op56, label %label_loop54, label %label_ret55
label_loop54:                                                ; preds = %label_condition53
  %op57 = load i32, i32* %op16
  %op58 = load i32, i32* %op10
  %op59 = icmp slt i32 %op58, zeroinitializer
  %op60 = zext i1 %op59 to i32
  %op61 = add i32 %op60, zeroinitializer
  %op62 = icmp slt i32 %op57, zeroinitializer
  %op63 = zext i1 %op62 to i32
  %op64 = add i32 %op63, %op61
  %op65 = icmp ne i32 %op64, zeroinitializer
  br i1 %op65, label %label_mat_ltz56, label %label_mat_gtz57
label_ret55:                                                ; preds = %label_condition53
  store i32 1, i32* %op51
  br label %label_condition62
label_mat_ltz56:                                                ; preds = %label_loop54
  call void @neg_idx_except()
  br label %label_mat_gtz57
label_mat_gtz57:                                                ; preds = %label_loop54, %label_mat_ltz56
  %op66 = load float*, float** %op4
  %op67 = mul i32 %op5, %op58
  %op68 = add i32 %op67, %op57
  %op69 = getelementptr float, float* %op66, i32 %op68
  %op70 = load i32, i32* %op16
  %op71 = load i32, i32* %op10
  %op72 = icmp slt i32 %op71, zeroinitializer
  %op73 = zext i1 %op72 to i32
  %op74 = add i32 %op73, zeroinitializer
  %op75 = icmp slt i32 %op70, zeroinitializer
  %op76 = zext i1 %op75 to i32
  %op77 = add i32 %op76, %op74
  %op78 = icmp ne i32 %op77, zeroinitializer
  br i1 %op78, label %label_mat_ltz58, label %label_mat_gtz59
label_mat_ltz58:                                                ; preds = %label_mat_gtz57
  call void @neg_idx_except()
  br label %label_mat_gtz59
label_mat_gtz59:                                                ; preds = %label_mat_gtz57, %label_mat_ltz58
  %op79 = load float*, float** %op4
  %op80 = mul i32 %op5, %op71
  %op81 = add i32 %op80, %op70
  %op82 = getelementptr float, float* %op79, i32 %op81
  %op83 = load float, float* %op82
  %op84 = load i32, i32* %op50
  %op85 = icmp slt i32 %op84, zeroinitializer
  %op86 = zext i1 %op85 to i32
  %op87 = add i32 %op86, zeroinitializer
  %op88 = icmp slt i32 0, zeroinitializer
  %op89 = zext i1 %op88 to i32
  %op90 = add i32 %op89, %op87
  %op91 = icmp ne i32 %op90, zeroinitializer
  br i1 %op91, label %label_dct_mat_ltz60, label %label_dct_mat_gtz61
label_dct_mat_ltz60:                                                ; preds = %label_mat_gtz59
  call void @neg_idx_except()
  br label %label_dct_mat_gtz61
label_dct_mat_gtz61:                                                ; preds = %label_mat_gtz59, %label_dct_mat_ltz60
  %op92 = load float*, float** %op6
  %op93 = mul i32 %op7, %op84
  %op94 = add i32 %op93, 0
  %op95 = getelementptr float, float* %op92, i32 %op94
  %op96 = load float, float* %op95
  %op97 = fmul float 0x3fe0000000000000, %op96
  %op98 = fadd float %op83, %op97
  store float %op98, float* %op69
  %op99 = load i32, i32* %op50
  %op100 = add i32 %op99, 1
  store i32 %op100, i32* %op50
  br label %label_condition53
label_condition62:                                                ; preds = %label_ret55, %label_dct_mat_gtz70
  %op101 = load i32, i32* %op51
  %op102 = load i32, i32* %op9
  %op103 = icmp slt i32 %op101, %op102
  %op104 = zext i1 %op103 to i32
  %op105 = icmp sgt i32 %op104, zeroinitializer
  br i1 %op105, label %label_loop63, label %label_ret64
label_loop63:                                                ; preds = %label_condition62
  %op106 = load i32, i32* %op16
  %op107 = load i32, i32* %op10
  %op108 = icmp slt i32 %op107, zeroinitializer
  %op109 = zext i1 %op108 to i32
  %op110 = add i32 %op109, zeroinitializer
  %op111 = icmp slt i32 %op106, zeroinitializer
  %op112 = zext i1 %op111 to i32
  %op113 = add i32 %op112, %op110
  %op114 = icmp ne i32 %op113, zeroinitializer
  br i1 %op114, label %label_mat_ltz65, label %label_mat_gtz66
label_ret64:                                                ; preds = %label_condition62
  store i32 1, i32* %op50
  br label %label_condition71
label_mat_ltz65:                                                ; preds = %label_loop63
  call void @neg_idx_except()
  br label %label_mat_gtz66
label_mat_gtz66:                                                ; preds = %label_loop63, %label_mat_ltz65
  %op115 = load float*, float** %op4
  %op116 = mul i32 %op5, %op107
  %op117 = add i32 %op116, %op106
  %op118 = getelementptr float, float* %op115, i32 %op117
  %op119 = load i32, i32* %op16
  %op120 = load i32, i32* %op10
  %op121 = icmp slt i32 %op120, zeroinitializer
  %op122 = zext i1 %op121 to i32
  %op123 = add i32 %op122, zeroinitializer
  %op124 = icmp slt i32 %op119, zeroinitializer
  %op125 = zext i1 %op124 to i32
  %op126 = add i32 %op125, %op123
  %op127 = icmp ne i32 %op126, zeroinitializer
  br i1 %op127, label %label_mat_ltz67, label %label_mat_gtz68
label_mat_ltz67:                                                ; preds = %label_mat_gtz66
  call void @neg_idx_except()
  br label %label_mat_gtz68
label_mat_gtz68:                                                ; preds = %label_mat_gtz66, %label_mat_ltz67
  %op128 = load float*, float** %op4
  %op129 = mul i32 %op5, %op120
  %op130 = add i32 %op129, %op119
  %op131 = getelementptr float, float* %op128, i32 %op130
  %op132 = load float, float* %op131
  %op133 = load i32, i32* %op51
  %op134 = icmp slt i32 0, zeroinitializer
  %op135 = zext i1 %op134 to i32
  %op136 = add i32 %op135, zeroinitializer
  %op137 = icmp slt i32 %op133, zeroinitializer
  %op138 = zext i1 %op137 to i32
  %op139 = add i32 %op138, %op136
  %op140 = icmp ne i32 %op139, zeroinitializer
  br i1 %op140, label %label_dct_mat_ltz69, label %label_dct_mat_gtz70
label_dct_mat_ltz69:                                                ; preds = %label_mat_gtz68
  call void @neg_idx_except()
  br label %label_dct_mat_gtz70
label_dct_mat_gtz70:                                                ; preds = %label_mat_gtz68, %label_dct_mat_ltz69
  %op141 = load float*, float** %op6
  %op142 = mul i32 %op7, 0
  %op143 = add i32 %op142, %op133
  %op144 = getelementptr float, float* %op141, i32 %op143
  %op145 = load float, float* %op144
  %op146 = fmul float 0x3fe0000000000000, %op145
  %op147 = fadd float %op132, %op146
  store float %op147, float* %op118
  %op148 = load i32, i32* %op51
  %op149 = add i32 %op148, 1
  store i32 %op149, i32* %op51
  br label %label_condition62
label_condition71:                                                ; preds = %label_ret64, %label_ret76
  %op150 = load i32, i32* %op50
  %op151 = load i32, i32* %op8
  %op152 = icmp slt i32 %op150, %op151
  %op153 = zext i1 %op152 to i32
  %op154 = icmp sgt i32 %op153, zeroinitializer
  br i1 %op154, label %label_loop72, label %label_ret73
label_loop72:                                                ; preds = %label_condition71
  store i32 1, i32* %op51
  br label %label_condition74
label_ret73:                                                ; preds = %label_condition71
  %op155 = load i32, i32* %op16
  %op156 = load i32, i32* %op10
  %op157 = icmp slt i32 %op156, zeroinitializer
  %op158 = zext i1 %op157 to i32
  %op159 = add i32 %op158, zeroinitializer
  %op160 = icmp slt i32 %op155, zeroinitializer
  %op161 = zext i1 %op160 to i32
  %op162 = add i32 %op161, %op159
  %op163 = icmp ne i32 %op162, zeroinitializer
  br i1 %op163, label %label_mat_ltz83, label %label_mat_gtz84
label_condition74:                                                ; preds = %label_loop72, %label_dct_mat_gtz82
  %op164 = load i32, i32* %op51
  %op165 = load i32, i32* %op9
  %op166 = icmp slt i32 %op164, %op165
  %op167 = zext i1 %op166 to i32
  %op168 = icmp sgt i32 %op167, zeroinitializer
  br i1 %op168, label %label_loop75, label %label_ret76
label_loop75:                                                ; preds = %label_condition74
  %op169 = load i32, i32* %op16
  %op170 = load i32, i32* %op10
  %op171 = icmp slt i32 %op170, zeroinitializer
  %op172 = zext i1 %op171 to i32
  %op173 = add i32 %op172, zeroinitializer
  %op174 = icmp slt i32 %op169, zeroinitializer
  %op175 = zext i1 %op174 to i32
  %op176 = add i32 %op175, %op173
  %op177 = icmp ne i32 %op176, zeroinitializer
  br i1 %op177, label %label_mat_ltz77, label %label_mat_gtz78
label_ret76:                                                ; preds = %label_condition74
  %op178 = load i32, i32* %op50
  %op179 = add i32 %op178, 1
  store i32 %op179, i32* %op50
  br label %label_condition71
label_mat_ltz77:                                                ; preds = %label_loop75
  call void @neg_idx_except()
  br label %label_mat_gtz78
label_mat_gtz78:                                                ; preds = %label_loop75, %label_mat_ltz77
  %op180 = load float*, float** %op4
  %op181 = mul i32 %op5, %op170
  %op182 = add i32 %op181, %op169
  %op183 = getelementptr float, float* %op180, i32 %op182
  %op184 = load i32, i32* %op16
  %op185 = load i32, i32* %op10
  %op186 = icmp slt i32 %op185, zeroinitializer
  %op187 = zext i1 %op186 to i32
  %op188 = add i32 %op187, zeroinitializer
  %op189 = icmp slt i32 %op184, zeroinitializer
  %op190 = zext i1 %op189 to i32
  %op191 = add i32 %op190, %op188
  %op192 = icmp ne i32 %op191, zeroinitializer
  br i1 %op192, label %label_mat_ltz79, label %label_mat_gtz80
label_mat_ltz79:                                                ; preds = %label_mat_gtz78
  call void @neg_idx_except()
  br label %label_mat_gtz80
label_mat_gtz80:                                                ; preds = %label_mat_gtz78, %label_mat_ltz79
  %op193 = load float*, float** %op4
  %op194 = mul i32 %op5, %op185
  %op195 = add i32 %op194, %op184
  %op196 = getelementptr float, float* %op193, i32 %op195
  %op197 = load float, float* %op196
  %op198 = load i32, i32* %op51
  %op199 = load i32, i32* %op50
  %op200 = icmp slt i32 %op199, zeroinitializer
  %op201 = zext i1 %op200 to i32
  %op202 = add i32 %op201, zeroinitializer
  %op203 = icmp slt i32 %op198, zeroinitializer
  %op204 = zext i1 %op203 to i32
  %op205 = add i32 %op204, %op202
  %op206 = icmp ne i32 %op205, zeroinitializer
  br i1 %op206, label %label_dct_mat_ltz81, label %label_dct_mat_gtz82
label_dct_mat_ltz81:                                                ; preds = %label_mat_gtz80
  call void @neg_idx_except()
  br label %label_dct_mat_gtz82
label_dct_mat_gtz82:                                                ; preds = %label_mat_gtz80, %label_dct_mat_ltz81
  %op207 = load float*, float** %op6
  %op208 = mul i32 %op7, %op199
  %op209 = add i32 %op208, %op198
  %op210 = getelementptr float, float* %op207, i32 %op209
  %op211 = load float, float* %op210
  %op212 = load i32, i32* @PI
  %op213 = load i32, i32* %op8
  %op214 = sdiv i32 %op212, %op213
  %op215 = load i32, i32* %op10
  %op216 = sitofp i32 %op215 to float
  %op217 = fadd float %op216, 0x3fe0000000000000
  %op218 = sitofp i32 %op214 to float
  %op219 = fmul float %op218, %op217
  %op220 = load i32, i32* %op50
  %op221 = sitofp i32 %op220 to float
  %op222 = fmul float %op219, %op221
  %op223 = call float @my_cos(float %op222)
  %op224 = fmul float %op211, %op223
  %op225 = load i32, i32* @PI
  %op226 = load i32, i32* %op9
  %op227 = sdiv i32 %op225, %op226
  %op228 = load i32, i32* %op16
  %op229 = sitofp i32 %op228 to float
  %op230 = fadd float %op229, 0x3fe0000000000000
  %op231 = sitofp i32 %op227 to float
  %op232 = fmul float %op231, %op230
  %op233 = load i32, i32* %op51
  %op234 = sitofp i32 %op233 to float
  %op235 = fmul float %op232, %op234
  %op236 = call float @my_cos(float %op235)
  %op237 = fmul float %op224, %op236
  %op238 = fadd float %op197, %op237
  store float %op238, float* %op183
  %op239 = load i32, i32* %op51
  %op240 = add i32 %op239, 1
  store i32 %op240, i32* %op51
  br label %label_condition74
label_mat_ltz83:                                                ; preds = %label_ret73
  call void @neg_idx_except()
  br label %label_mat_gtz84
label_mat_gtz84:                                                ; preds = %label_ret73, %label_mat_ltz83
  %op241 = load float*, float** %op4
  %op242 = mul i32 %op5, %op156
  %op243 = add i32 %op242, %op155
  %op244 = getelementptr float, float* %op241, i32 %op243
  %op245 = load i32, i32* %op16
  %op246 = load i32, i32* %op10
  %op247 = icmp slt i32 %op246, zeroinitializer
  %op248 = zext i1 %op247 to i32
  %op249 = add i32 %op248, zeroinitializer
  %op250 = icmp slt i32 %op245, zeroinitializer
  %op251 = zext i1 %op250 to i32
  %op252 = add i32 %op251, %op249
  %op253 = icmp ne i32 %op252, zeroinitializer
  br i1 %op253, label %label_mat_ltz85, label %label_mat_gtz86
label_mat_ltz85:                                                ; preds = %label_mat_gtz84
  call void @neg_idx_except()
  br label %label_mat_gtz86
label_mat_gtz86:                                                ; preds = %label_mat_gtz84, %label_mat_ltz85
  %op254 = load float*, float** %op4
  %op255 = mul i32 %op5, %op246
  %op256 = add i32 %op255, %op245
  %op257 = getelementptr float, float* %op254, i32 %op256
  %op258 = load float, float* %op257
  %op259 = fmul float %op258, 0x4000000000000000
  %op260 = load i32, i32* %op8
  %op261 = sitofp i32 %op260 to float
  %op262 = fdiv float %op259, %op261
  %op263 = fmul float %op262, 0x4000000000000000
  %op264 = load i32, i32* %op9
  %op265 = sitofp i32 %op264 to float
  %op266 = fdiv float %op263, %op265
  store float %op266, float* %op244
  %op267 = load i32, i32* %op16
  %op268 = add i32 %op267, 1
  store i32 %op268, i32* %op16
  br label %label_condition46
}
define i32 @main() {
label_entry:
  %op0 = call i32 @getint()
  %op1 = alloca i32
  store i32 %op0, i32* %op1
  %op2 = call i32 @getint()
  %op3 = alloca i32
  store i32 %op2, i32* %op3
  %op4 = alloca i32
  store i32 0, i32* %op4
  br label %label_condition87
label_condition87:                                                ; preds = %label_entry, %label_ret92
  %op5 = load i32, i32* %op4
  %op6 = load i32, i32* %op1
  %op7 = icmp slt i32 %op5, %op6
  %op8 = zext i1 %op7 to i32
  %op9 = icmp sgt i32 %op8, zeroinitializer
  br i1 %op9, label %label_loop88, label %label_ret89
label_loop88:                                                ; preds = %label_condition87
  %op10 = alloca i32
  store i32 0, i32* %op10
  br label %label_condition90
label_ret89:                                                ; preds = %label_condition87
  %op11 = getelementptr [8 x [8 x float]], [8 x [8 x float]]* @test_dct, i32 0, i32 0, i32 0
  %op12 = getelementptr [8 x [8 x float]], [8 x [8 x float]]* @test_block, i32 0, i32 0, i32 0
  %op13 = load i32, i32* %op1
  %op14 = load i32, i32* %op3
  call void @dct(float* %op11, float* %op12, i32 %op13, i32 %op14)
  %op15 = getelementptr [8 x [8 x float]], [8 x [8 x float]]* @test_dct, i32 0, i32 0, i32 0
  %op16 = load i32, i32* %op1
  %op17 = load i32, i32* %op3
  call void @write_mat(float* %op15, i32 %op16, i32 %op17)
  %op18 = getelementptr [8 x [8 x float]], [8 x [8 x float]]* @test_idct, i32 0, i32 0, i32 0
  %op19 = getelementptr [8 x [8 x float]], [8 x [8 x float]]* @test_dct, i32 0, i32 0, i32 0
  %op20 = load i32, i32* %op1
  %op21 = load i32, i32* %op3
  call void @idct(float* %op18, float* %op19, i32 %op20, i32 %op21)
  %op22 = getelementptr [8 x [8 x float]], [8 x [8 x float]]* @test_idct, i32 0, i32 0, i32 0
  %op23 = load i32, i32* %op1
  %op24 = load i32, i32* %op3
  call void @write_mat(float* %op22, i32 %op23, i32 %op24)
  ret i32 0
label_condition90:                                                ; preds = %label_loop88, %label_test_block_gtz94
  %op25 = load i32, i32* %op10
  %op26 = load i32, i32* %op3
  %op27 = icmp slt i32 %op25, %op26
  %op28 = zext i1 %op27 to i32
  %op29 = icmp sgt i32 %op28, zeroinitializer
  br i1 %op29, label %label_loop91, label %label_ret92
label_loop91:                                                ; preds = %label_condition90
  %op30 = load i32, i32* %op10
  %op31 = load i32, i32* %op4
  %op32 = icmp slt i32 %op31, zeroinitializer
  %op33 = zext i1 %op32 to i32
  %op34 = add i32 %op33, zeroinitializer
  %op35 = icmp slt i32 %op30, zeroinitializer
  %op36 = zext i1 %op35 to i32
  %op37 = add i32 %op36, %op34
  %op38 = icmp ne i32 %op37, zeroinitializer
  br i1 %op38, label %label_test_block_ltz93, label %label_test_block_gtz94
label_ret92:                                                ; preds = %label_condition90
  %op39 = load i32, i32* %op4
  %op40 = add i32 %op39, 1
  store i32 %op40, i32* %op4
  br label %label_condition87
label_test_block_ltz93:                                                ; preds = %label_loop91
  call void @neg_idx_except()
  br label %label_test_block_gtz94
label_test_block_gtz94:                                                ; preds = %label_loop91, %label_test_block_ltz93
  %op41 = getelementptr [8 x [8 x float]], [8 x [8 x float]]* @test_block, i32 0, i32 %op31, i32 %op30
  %op42 = call float @getfloat()
  store float %op42, float* %op41
  %op43 = load i32, i32* %op10
  %op44 = add i32 %op43, 1
  store i32 %op44, i32* %op10
  br label %label_condition90
}
