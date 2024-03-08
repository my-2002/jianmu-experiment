; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/all_test_cases/hidden_functional/13_LCA.sy"

@maxn = constant i32 10005
@n = global i32 zeroinitializer
@m = global i32 zeroinitializer
@f = global [10005 x [20 x i32]] zeroinitializer
@dep = global [10005 x i32] zeroinitializer
@to = global [10005 x i32] zeroinitializer
@next = global [10005 x i32] zeroinitializer
@head = global [10005 x i32] zeroinitializer
@cnt = global i32 0
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

define i32 @quick_read() {
label_entry:
  %op0 = call i32 @getch()
  %op1 = alloca i32
  store i32 %op0, i32* %op1
  %op2 = alloca i32
  store i32 0, i32* %op2
  %op3 = alloca i32
  store i32 0, i32* %op3
  br label %label_condition0
label_condition0:                                                ; preds = %label_entry, %label_ret7
  %op4 = load i32, i32* %op1
  %op5 = icmp slt i32 %op4, 48
  %op6 = zext i1 %op5 to i32
  %op7 = icmp sgt i32 %op6, zeroinitializer
  br i1 %op7, label %label_true3, label %label_false4
label_loop1:                                                ; preds = %label_ret5
  %op8 = load i32, i32* %op1
  %op9 = icmp eq i32 %op8, 45
  %op10 = zext i1 %op9 to i32
  %op11 = icmp sgt i32 %op10, zeroinitializer
  br i1 %op11, label %label_true6, label %label_ret7
label_ret2:                                                ; preds = %label_ret5
  br label %label_condition8
label_true3:                                                ; preds = %label_condition0
  %op12 = icmp sgt i32 1, zeroinitializer
  br label %label_ret5
label_false4:                                                ; preds = %label_condition0
  %op13 = load i32, i32* %op1
  %op14 = icmp sgt i32 %op13, 57
  %op15 = zext i1 %op14 to i32
  %op16 = icmp sgt i32 %op15, zeroinitializer
  br label %label_ret5
label_ret5:                                                ; preds = %label_false4, %label_true3
  %op17 = phi i1 [ %op12, %label_true3 ], [ %op16, %label_false4 ]
  %op18 = zext i1 %op17 to i32
  %op19 = icmp sgt i32 %op18, zeroinitializer
  br i1 %op19, label %label_loop1, label %label_ret2
label_true6:                                                ; preds = %label_loop1
  store i32 1, i32* %op3
  br label %label_ret7
label_ret7:                                                ; preds = %label_loop1, %label_true6
  %op20 = call i32 @getch()
  store i32 %op20, i32* %op1
  br label %label_condition0
label_condition8:                                                ; preds = %label_ret2, %label_loop9
  %op21 = load i32, i32* %op1
  %op22 = icmp sge i32 %op21, 48
  %op23 = zext i1 %op22 to i32
  %op24 = icmp sgt i32 %op23, zeroinitializer
  br i1 %op24, label %label_true11, label %label_false12
label_loop9:                                                ; preds = %label_ret13
  %op25 = load i32, i32* %op2
  %op26 = mul i32 %op25, 10
  %op27 = load i32, i32* %op1
  %op28 = add i32 %op26, %op27
  %op29 = sub i32 %op28, 48
  store i32 %op29, i32* %op2
  %op30 = call i32 @getch()
  store i32 %op30, i32* %op1
  br label %label_condition8
label_ret10:                                                ; preds = %label_ret13
  %op31 = load i32, i32* %op3
  %op32 = icmp sgt i32 %op31, zeroinitializer
  br i1 %op32, label %label_true14, label %label_false15
label_true11:                                                ; preds = %label_condition8
  %op33 = load i32, i32* %op1
  %op34 = icmp sle i32 %op33, 57
  %op35 = zext i1 %op34 to i32
  %op36 = icmp sgt i32 %op35, zeroinitializer
  br label %label_ret13
label_false12:                                                ; preds = %label_condition8
  %op37 = icmp sgt i32 zeroinitializer, zeroinitializer
  br label %label_ret13
label_ret13:                                                ; preds = %label_true11, %label_false12
  %op38 = phi i1 [ %op36, %label_true11 ], [ %op37, %label_false12 ]
  %op39 = zext i1 %op38 to i32
  %op40 = icmp sgt i32 %op39, zeroinitializer
  br i1 %op40, label %label_loop9, label %label_ret10
label_true14:                                                ; preds = %label_ret10
  %op41 = load i32, i32* %op2
  %op42 = sub i32 zeroinitializer, %op41
  ret i32 %op42
label_false15:                                                ; preds = %label_ret10
  %op43 = load i32, i32* %op2
  ret i32 %op43
}
define void @add_edge(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = alloca i32
  store i32 %arg0, i32* %op2
  %op3 = alloca i32
  store i32 %arg1, i32* %op3
  %op4 = load i32, i32* @cnt
  %op5 = icmp slt i32 %op4, zeroinitializer
  %op6 = zext i1 %op5 to i32
  %op7 = add i32 %op6, zeroinitializer
  %op8 = icmp ne i32 %op7, zeroinitializer
  br i1 %op8, label %label_to_ltz16, label %label_to_gtz17
label_to_ltz16:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_to_gtz17
label_to_gtz17:                                                ; preds = %label_entry, %label_to_ltz16
  %op9 = getelementptr [10005 x i32], [10005 x i32]* @to, i32 0, i32 %op4
  %op10 = load i32, i32* %op3
  store i32 %op10, i32* %op9
  %op11 = load i32, i32* @cnt
  %op12 = icmp slt i32 %op11, zeroinitializer
  %op13 = zext i1 %op12 to i32
  %op14 = add i32 %op13, zeroinitializer
  %op15 = icmp ne i32 %op14, zeroinitializer
  br i1 %op15, label %label_next_ltz18, label %label_next_gtz19
label_next_ltz18:                                                ; preds = %label_to_gtz17
  call void @neg_idx_except()
  br label %label_next_gtz19
label_next_gtz19:                                                ; preds = %label_to_gtz17, %label_next_ltz18
  %op16 = getelementptr [10005 x i32], [10005 x i32]* @next, i32 0, i32 %op11
  %op17 = load i32, i32* %op2
  %op18 = icmp slt i32 %op17, zeroinitializer
  %op19 = zext i1 %op18 to i32
  %op20 = add i32 %op19, zeroinitializer
  %op21 = icmp ne i32 %op20, zeroinitializer
  br i1 %op21, label %label_head_ltz20, label %label_head_gtz21
label_head_ltz20:                                                ; preds = %label_next_gtz19
  call void @neg_idx_except()
  br label %label_head_gtz21
label_head_gtz21:                                                ; preds = %label_next_gtz19, %label_head_ltz20
  %op22 = getelementptr [10005 x i32], [10005 x i32]* @head, i32 0, i32 %op17
  %op23 = load i32, i32* %op22
  store i32 %op23, i32* %op16
  %op24 = load i32, i32* %op2
  %op25 = icmp slt i32 %op24, zeroinitializer
  %op26 = zext i1 %op25 to i32
  %op27 = add i32 %op26, zeroinitializer
  %op28 = icmp ne i32 %op27, zeroinitializer
  br i1 %op28, label %label_head_ltz22, label %label_head_gtz23
label_head_ltz22:                                                ; preds = %label_head_gtz21
  call void @neg_idx_except()
  br label %label_head_gtz23
label_head_gtz23:                                                ; preds = %label_head_gtz21, %label_head_ltz22
  %op29 = getelementptr [10005 x i32], [10005 x i32]* @head, i32 0, i32 %op24
  %op30 = load i32, i32* @cnt
  store i32 %op30, i32* %op29
  %op31 = load i32, i32* @cnt
  %op32 = add i32 %op31, 1
  store i32 %op32, i32* @cnt
  %op33 = load i32, i32* %op3
  %op34 = icmp slt i32 %op33, zeroinitializer
  %op35 = zext i1 %op34 to i32
  %op36 = add i32 %op35, zeroinitializer
  %op37 = icmp slt i32 0, zeroinitializer
  %op38 = zext i1 %op37 to i32
  %op39 = add i32 %op38, %op36
  %op40 = icmp ne i32 %op39, zeroinitializer
  br i1 %op40, label %label_f_ltz24, label %label_f_gtz25
label_f_ltz24:                                                ; preds = %label_head_gtz23
  call void @neg_idx_except()
  br label %label_f_gtz25
label_f_gtz25:                                                ; preds = %label_head_gtz23, %label_f_ltz24
  %op41 = getelementptr [10005 x [20 x i32]], [10005 x [20 x i32]]* @f, i32 0, i32 %op33, i32 0
  %op42 = load i32, i32* %op2
  store i32 %op42, i32* %op41
  ret void
}
define void @init() {
label_entry:
  %op0 = icmp slt i32 0, zeroinitializer
  %op1 = zext i1 %op0 to i32
  %op2 = add i32 %op1, zeroinitializer
  %op3 = icmp ne i32 %op2, zeroinitializer
  br i1 %op3, label %label_dep_ltz26, label %label_dep_gtz27
label_dep_ltz26:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_dep_gtz27
label_dep_gtz27:                                                ; preds = %label_entry, %label_dep_ltz26
  %op4 = getelementptr [10005 x i32], [10005 x i32]* @dep, i32 0, i32 0
  store i32 0, i32* %op4
  %op5 = alloca i32
  store i32 1, i32* %op5
  br label %label_condition28
label_condition28:                                                ; preds = %label_dep_gtz27, %label_head_gtz32
  %op6 = load i32, i32* %op5
  %op7 = load i32, i32* @n
  %op8 = icmp sle i32 %op6, %op7
  %op9 = zext i1 %op8 to i32
  %op10 = icmp sgt i32 %op9, zeroinitializer
  br i1 %op10, label %label_loop29, label %label_ret30
label_loop29:                                                ; preds = %label_condition28
  %op11 = load i32, i32* %op5
  %op12 = icmp slt i32 %op11, zeroinitializer
  %op13 = zext i1 %op12 to i32
  %op14 = add i32 %op13, zeroinitializer
  %op15 = icmp ne i32 %op14, zeroinitializer
  br i1 %op15, label %label_head_ltz31, label %label_head_gtz32
label_ret30:                                                ; preds = %label_condition28
  ret void
label_head_ltz31:                                                ; preds = %label_loop29
  call void @neg_idx_except()
  br label %label_head_gtz32
label_head_gtz32:                                                ; preds = %label_loop29, %label_head_ltz31
  %op16 = getelementptr [10005 x i32], [10005 x i32]* @head, i32 0, i32 %op11
  store i32 -1, i32* %op16
  %op17 = load i32, i32* %op5
  %op18 = add i32 %op17, 1
  store i32 %op18, i32* %op5
  br label %label_condition28
}
define void @tree(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = alloca i32
  store i32 %arg0, i32* %op2
  %op3 = alloca i32
  store i32 %arg1, i32* %op3
  %op4 = load i32, i32* %op2
  %op5 = icmp slt i32 %op4, zeroinitializer
  %op6 = zext i1 %op5 to i32
  %op7 = add i32 %op6, zeroinitializer
  %op8 = icmp ne i32 %op7, zeroinitializer
  br i1 %op8, label %label_dep_ltz33, label %label_dep_gtz34
label_dep_ltz33:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_dep_gtz34
label_dep_gtz34:                                                ; preds = %label_entry, %label_dep_ltz33
  %op9 = getelementptr [10005 x i32], [10005 x i32]* @dep, i32 0, i32 %op4
  %op10 = load i32, i32* %op3
  store i32 %op10, i32* %op9
  %op11 = alloca i32
  store i32 0, i32* %op11
  br label %label_condition35
label_condition35:                                                ; preds = %label_dep_gtz34, %label_f_gtz45
  %op12 = load i32, i32* %op11
  %op13 = load i32, i32* %op2
  %op14 = icmp slt i32 %op13, zeroinitializer
  %op15 = zext i1 %op14 to i32
  %op16 = add i32 %op15, zeroinitializer
  %op17 = icmp slt i32 %op12, zeroinitializer
  %op18 = zext i1 %op17 to i32
  %op19 = add i32 %op18, %op16
  %op20 = icmp ne i32 %op19, zeroinitializer
  br i1 %op20, label %label_f_ltz38, label %label_f_gtz39
label_loop36:                                                ; preds = %label_f_gtz39
  %op21 = load i32, i32* %op11
  %op22 = add i32 %op21, 1
  %op23 = load i32, i32* %op2
  %op24 = icmp slt i32 %op23, zeroinitializer
  %op25 = zext i1 %op24 to i32
  %op26 = add i32 %op25, zeroinitializer
  %op27 = icmp slt i32 %op22, zeroinitializer
  %op28 = zext i1 %op27 to i32
  %op29 = add i32 %op28, %op26
  %op30 = icmp ne i32 %op29, zeroinitializer
  br i1 %op30, label %label_f_ltz40, label %label_f_gtz41
label_ret37:                                                ; preds = %label_f_gtz39
  %op31 = load i32, i32* %op2
  %op32 = icmp slt i32 %op31, zeroinitializer
  %op33 = zext i1 %op32 to i32
  %op34 = add i32 %op33, zeroinitializer
  %op35 = icmp ne i32 %op34, zeroinitializer
  br i1 %op35, label %label_head_ltz46, label %label_head_gtz47
label_f_ltz38:                                                ; preds = %label_condition35
  call void @neg_idx_except()
  br label %label_f_gtz39
label_f_gtz39:                                                ; preds = %label_condition35, %label_f_ltz38
  %op36 = getelementptr [10005 x [20 x i32]], [10005 x [20 x i32]]* @f, i32 0, i32 %op13, i32 %op12
  %op37 = load i32, i32* %op36
  %op38 = icmp sgt i32 %op37, zeroinitializer
  br i1 %op38, label %label_loop36, label %label_ret37
label_f_ltz40:                                                ; preds = %label_loop36
  call void @neg_idx_except()
  br label %label_f_gtz41
label_f_gtz41:                                                ; preds = %label_loop36, %label_f_ltz40
  %op39 = getelementptr [10005 x [20 x i32]], [10005 x [20 x i32]]* @f, i32 0, i32 %op23, i32 %op22
  %op40 = load i32, i32* %op11
  %op41 = load i32, i32* %op11
  %op42 = load i32, i32* %op2
  %op43 = icmp slt i32 %op42, zeroinitializer
  %op44 = zext i1 %op43 to i32
  %op45 = add i32 %op44, zeroinitializer
  %op46 = icmp slt i32 %op41, zeroinitializer
  %op47 = zext i1 %op46 to i32
  %op48 = add i32 %op47, %op45
  %op49 = icmp ne i32 %op48, zeroinitializer
  br i1 %op49, label %label_f_ltz42, label %label_f_gtz43
label_f_ltz42:                                                ; preds = %label_f_gtz41
  call void @neg_idx_except()
  br label %label_f_gtz43
label_f_gtz43:                                                ; preds = %label_f_gtz41, %label_f_ltz42
  %op50 = getelementptr [10005 x [20 x i32]], [10005 x [20 x i32]]* @f, i32 0, i32 %op42, i32 %op41
  %op51 = load i32, i32* %op50
  %op52 = icmp slt i32 %op51, zeroinitializer
  %op53 = zext i1 %op52 to i32
  %op54 = add i32 %op53, zeroinitializer
  %op55 = icmp slt i32 %op40, zeroinitializer
  %op56 = zext i1 %op55 to i32
  %op57 = add i32 %op56, %op54
  %op58 = icmp ne i32 %op57, zeroinitializer
  br i1 %op58, label %label_f_ltz44, label %label_f_gtz45
label_f_ltz44:                                                ; preds = %label_f_gtz43
  call void @neg_idx_except()
  br label %label_f_gtz45
label_f_gtz45:                                                ; preds = %label_f_gtz43, %label_f_ltz44
  %op59 = getelementptr [10005 x [20 x i32]], [10005 x [20 x i32]]* @f, i32 0, i32 %op51, i32 %op40
  %op60 = load i32, i32* %op59
  store i32 %op60, i32* %op39
  %op61 = load i32, i32* %op11
  %op62 = add i32 %op61, 1
  store i32 %op62, i32* %op11
  br label %label_condition35
label_head_ltz46:                                                ; preds = %label_ret37
  call void @neg_idx_except()
  br label %label_head_gtz47
label_head_gtz47:                                                ; preds = %label_ret37, %label_head_ltz46
  %op63 = getelementptr [10005 x i32], [10005 x i32]* @head, i32 0, i32 %op31
  %op64 = load i32, i32* %op63
  store i32 %op64, i32* %op11
  br label %label_condition48
label_condition48:                                                ; preds = %label_head_gtz47, %label_next_gtz54
  %op65 = load i32, i32* %op11
  %op66 = icmp ne i32 %op65, -1
  %op67 = zext i1 %op66 to i32
  %op68 = icmp sgt i32 %op67, zeroinitializer
  br i1 %op68, label %label_loop49, label %label_ret50
label_loop49:                                                ; preds = %label_condition48
  %op69 = load i32, i32* %op11
  %op70 = icmp slt i32 %op69, zeroinitializer
  %op71 = zext i1 %op70 to i32
  %op72 = add i32 %op71, zeroinitializer
  %op73 = icmp ne i32 %op72, zeroinitializer
  br i1 %op73, label %label_to_ltz51, label %label_to_gtz52
label_ret50:                                                ; preds = %label_condition48
  ret void
label_to_ltz51:                                                ; preds = %label_loop49
  call void @neg_idx_except()
  br label %label_to_gtz52
label_to_gtz52:                                                ; preds = %label_loop49, %label_to_ltz51
  %op74 = getelementptr [10005 x i32], [10005 x i32]* @to, i32 0, i32 %op69
  %op75 = load i32, i32* %op74
  %op76 = alloca i32
  store i32 %op75, i32* %op76
  %op77 = load i32, i32* %op76
  %op78 = load i32, i32* %op3
  %op79 = add i32 %op78, 1
  call void @tree(i32 %op77, i32 %op79)
  %op80 = load i32, i32* %op11
  %op81 = icmp slt i32 %op80, zeroinitializer
  %op82 = zext i1 %op81 to i32
  %op83 = add i32 %op82, zeroinitializer
  %op84 = icmp ne i32 %op83, zeroinitializer
  br i1 %op84, label %label_next_ltz53, label %label_next_gtz54
label_next_ltz53:                                                ; preds = %label_to_gtz52
  call void @neg_idx_except()
  br label %label_next_gtz54
label_next_gtz54:                                                ; preds = %label_to_gtz52, %label_next_ltz53
  %op85 = getelementptr [10005 x i32], [10005 x i32]* @next, i32 0, i32 %op80
  %op86 = load i32, i32* %op85
  store i32 %op86, i32* %op11
  br label %label_condition48
}
define i32 @LCA(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = alloca i32
  store i32 %arg0, i32* %op2
  %op3 = alloca i32
  store i32 %arg1, i32* %op3
  %op4 = load i32, i32* %op2
  %op5 = icmp slt i32 %op4, zeroinitializer
  %op6 = zext i1 %op5 to i32
  %op7 = add i32 %op6, zeroinitializer
  %op8 = icmp ne i32 %op7, zeroinitializer
  br i1 %op8, label %label_dep_ltz55, label %label_dep_gtz56
label_dep_ltz55:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_dep_gtz56
label_dep_gtz56:                                                ; preds = %label_entry, %label_dep_ltz55
  %op9 = getelementptr [10005 x i32], [10005 x i32]* @dep, i32 0, i32 %op4
  %op10 = load i32, i32* %op9
  %op11 = load i32, i32* %op3
  %op12 = icmp slt i32 %op11, zeroinitializer
  %op13 = zext i1 %op12 to i32
  %op14 = add i32 %op13, zeroinitializer
  %op15 = icmp ne i32 %op14, zeroinitializer
  br i1 %op15, label %label_dep_ltz57, label %label_dep_gtz58
label_dep_ltz57:                                                ; preds = %label_dep_gtz56
  call void @neg_idx_except()
  br label %label_dep_gtz58
label_dep_gtz58:                                                ; preds = %label_dep_gtz56, %label_dep_ltz57
  %op16 = getelementptr [10005 x i32], [10005 x i32]* @dep, i32 0, i32 %op11
  %op17 = load i32, i32* %op16
  %op18 = icmp slt i32 %op10, %op17
  %op19 = zext i1 %op18 to i32
  %op20 = icmp sgt i32 %op19, zeroinitializer
  br i1 %op20, label %label_true59, label %label_ret60
label_true59:                                                ; preds = %label_dep_gtz58
  %op21 = load i32, i32* %op2
  %op22 = alloca i32
  store i32 %op21, i32* %op22
  %op23 = load i32, i32* %op3
  store i32 %op23, i32* %op2
  %op24 = load i32, i32* %op22
  store i32 %op24, i32* %op3
  br label %label_ret60
label_ret60:                                                ; preds = %label_dep_gtz58, %label_true59
  %op25 = alloca i32
  store i32 19, i32* %op25
  br label %label_condition61
label_condition61:                                                ; preds = %label_ret60, %label_ret80
  %op26 = load i32, i32* %op2
  %op27 = icmp slt i32 %op26, zeroinitializer
  %op28 = zext i1 %op27 to i32
  %op29 = add i32 %op28, zeroinitializer
  %op30 = icmp ne i32 %op29, zeroinitializer
  br i1 %op30, label %label_dep_ltz64, label %label_dep_gtz65
label_loop62:                                                ; preds = %label_dep_gtz67
  %op31 = load i32, i32* %op25
  %op32 = load i32, i32* %op2
  %op33 = icmp slt i32 %op32, zeroinitializer
  %op34 = zext i1 %op33 to i32
  %op35 = add i32 %op34, zeroinitializer
  %op36 = icmp slt i32 %op31, zeroinitializer
  %op37 = zext i1 %op36 to i32
  %op38 = add i32 %op37, %op35
  %op39 = icmp ne i32 %op38, zeroinitializer
  br i1 %op39, label %label_f_ltz68, label %label_f_gtz69
label_ret63:                                                ; preds = %label_dep_gtz67
  %op40 = load i32, i32* %op2
  %op41 = load i32, i32* %op3
  %op42 = icmp eq i32 %op40, %op41
  %op43 = zext i1 %op42 to i32
  %op44 = icmp sgt i32 %op43, zeroinitializer
  br i1 %op44, label %label_true83, label %label_ret84
label_dep_ltz64:                                                ; preds = %label_condition61
  call void @neg_idx_except()
  br label %label_dep_gtz65
label_dep_gtz65:                                                ; preds = %label_condition61, %label_dep_ltz64
  %op45 = getelementptr [10005 x i32], [10005 x i32]* @dep, i32 0, i32 %op26
  %op46 = load i32, i32* %op45
  %op47 = load i32, i32* %op3
  %op48 = icmp slt i32 %op47, zeroinitializer
  %op49 = zext i1 %op48 to i32
  %op50 = add i32 %op49, zeroinitializer
  %op51 = icmp ne i32 %op50, zeroinitializer
  br i1 %op51, label %label_dep_ltz66, label %label_dep_gtz67
label_dep_ltz66:                                                ; preds = %label_dep_gtz65
  call void @neg_idx_except()
  br label %label_dep_gtz67
label_dep_gtz67:                                                ; preds = %label_dep_gtz65, %label_dep_ltz66
  %op52 = getelementptr [10005 x i32], [10005 x i32]* @dep, i32 0, i32 %op47
  %op53 = load i32, i32* %op52
  %op54 = icmp sgt i32 %op46, %op53
  %op55 = zext i1 %op54 to i32
  %op56 = icmp sgt i32 %op55, zeroinitializer
  br i1 %op56, label %label_loop62, label %label_ret63
label_f_ltz68:                                                ; preds = %label_loop62
  call void @neg_idx_except()
  br label %label_f_gtz69
label_f_gtz69:                                                ; preds = %label_loop62, %label_f_ltz68
  %op57 = getelementptr [10005 x [20 x i32]], [10005 x [20 x i32]]* @f, i32 0, i32 %op32, i32 %op31
  %op58 = load i32, i32* %op57
  %op59 = icmp sgt i32 %op58, zeroinitializer
  br i1 %op59, label %label_true70, label %label_false71
label_true70:                                                ; preds = %label_f_gtz69
  %op60 = load i32, i32* %op25
  %op61 = load i32, i32* %op2
  %op62 = icmp slt i32 %op61, zeroinitializer
  %op63 = zext i1 %op62 to i32
  %op64 = add i32 %op63, zeroinitializer
  %op65 = icmp slt i32 %op60, zeroinitializer
  %op66 = zext i1 %op65 to i32
  %op67 = add i32 %op66, %op64
  %op68 = icmp ne i32 %op67, zeroinitializer
  br i1 %op68, label %label_f_ltz73, label %label_f_gtz74
label_false71:                                                ; preds = %label_f_gtz69
  %op69 = icmp sgt i32 zeroinitializer, zeroinitializer
  br label %label_ret72
label_ret72:                                                ; preds = %label_dep_gtz78, %label_false71
  %op70 = phi i1 [ %op90, %label_dep_gtz78 ], [ %op69, %label_false71 ]
  %op71 = zext i1 %op70 to i32
  %op72 = icmp sgt i32 %op71, zeroinitializer
  br i1 %op72, label %label_true79, label %label_ret80
label_f_ltz73:                                                ; preds = %label_true70
  call void @neg_idx_except()
  br label %label_f_gtz74
label_f_gtz74:                                                ; preds = %label_true70, %label_f_ltz73
  %op73 = getelementptr [10005 x [20 x i32]], [10005 x [20 x i32]]* @f, i32 0, i32 %op61, i32 %op60
  %op74 = load i32, i32* %op73
  %op75 = icmp slt i32 %op74, zeroinitializer
  %op76 = zext i1 %op75 to i32
  %op77 = add i32 %op76, zeroinitializer
  %op78 = icmp ne i32 %op77, zeroinitializer
  br i1 %op78, label %label_dep_ltz75, label %label_dep_gtz76
label_dep_ltz75:                                                ; preds = %label_f_gtz74
  call void @neg_idx_except()
  br label %label_dep_gtz76
label_dep_gtz76:                                                ; preds = %label_f_gtz74, %label_dep_ltz75
  %op79 = getelementptr [10005 x i32], [10005 x i32]* @dep, i32 0, i32 %op74
  %op80 = load i32, i32* %op79
  %op81 = load i32, i32* %op3
  %op82 = icmp slt i32 %op81, zeroinitializer
  %op83 = zext i1 %op82 to i32
  %op84 = add i32 %op83, zeroinitializer
  %op85 = icmp ne i32 %op84, zeroinitializer
  br i1 %op85, label %label_dep_ltz77, label %label_dep_gtz78
label_dep_ltz77:                                                ; preds = %label_dep_gtz76
  call void @neg_idx_except()
  br label %label_dep_gtz78
label_dep_gtz78:                                                ; preds = %label_dep_gtz76, %label_dep_ltz77
  %op86 = getelementptr [10005 x i32], [10005 x i32]* @dep, i32 0, i32 %op81
  %op87 = load i32, i32* %op86
  %op88 = icmp sge i32 %op80, %op87
  %op89 = zext i1 %op88 to i32
  %op90 = icmp sgt i32 %op89, zeroinitializer
  br label %label_ret72
label_true79:                                                ; preds = %label_ret72
  %op91 = load i32, i32* %op25
  %op92 = load i32, i32* %op2
  %op93 = icmp slt i32 %op92, zeroinitializer
  %op94 = zext i1 %op93 to i32
  %op95 = add i32 %op94, zeroinitializer
  %op96 = icmp slt i32 %op91, zeroinitializer
  %op97 = zext i1 %op96 to i32
  %op98 = add i32 %op97, %op95
  %op99 = icmp ne i32 %op98, zeroinitializer
  br i1 %op99, label %label_f_ltz81, label %label_f_gtz82
label_ret80:                                                ; preds = %label_ret72, %label_f_gtz82
  %op100 = load i32, i32* %op25
  %op101 = sub i32 %op100, 1
  store i32 %op101, i32* %op25
  br label %label_condition61
label_f_ltz81:                                                ; preds = %label_true79
  call void @neg_idx_except()
  br label %label_f_gtz82
label_f_gtz82:                                                ; preds = %label_true79, %label_f_ltz81
  %op102 = getelementptr [10005 x [20 x i32]], [10005 x [20 x i32]]* @f, i32 0, i32 %op92, i32 %op91
  %op103 = load i32, i32* %op102
  store i32 %op103, i32* %op2
  br label %label_ret80
label_true83:                                                ; preds = %label_ret63
  %op104 = load i32, i32* %op2
  ret i32 %op104
label_ret84:                                                ; preds = %label_ret63
  store i32 19, i32* %op25
  br label %label_condition85
label_condition85:                                                ; preds = %label_ret84, %label_ret93
  %op105 = load i32, i32* %op25
  %op106 = icmp sge i32 %op105, 0
  %op107 = zext i1 %op106 to i32
  %op108 = icmp sgt i32 %op107, zeroinitializer
  br i1 %op108, label %label_loop86, label %label_ret87
label_loop86:                                                ; preds = %label_condition85
  %op109 = load i32, i32* %op25
  %op110 = load i32, i32* %op2
  %op111 = icmp slt i32 %op110, zeroinitializer
  %op112 = zext i1 %op111 to i32
  %op113 = add i32 %op112, zeroinitializer
  %op114 = icmp slt i32 %op109, zeroinitializer
  %op115 = zext i1 %op114 to i32
  %op116 = add i32 %op115, %op113
  %op117 = icmp ne i32 %op116, zeroinitializer
  br i1 %op117, label %label_f_ltz88, label %label_f_gtz89
label_ret87:                                                ; preds = %label_condition85
  %op118 = load i32, i32* %op2
  %op119 = icmp slt i32 %op118, zeroinitializer
  %op120 = zext i1 %op119 to i32
  %op121 = add i32 %op120, zeroinitializer
  %op122 = icmp slt i32 0, zeroinitializer
  %op123 = zext i1 %op122 to i32
  %op124 = add i32 %op123, %op121
  %op125 = icmp ne i32 %op124, zeroinitializer
  br i1 %op125, label %label_f_ltz98, label %label_f_gtz99
label_f_ltz88:                                                ; preds = %label_loop86
  call void @neg_idx_except()
  br label %label_f_gtz89
label_f_gtz89:                                                ; preds = %label_loop86, %label_f_ltz88
  %op126 = getelementptr [10005 x [20 x i32]], [10005 x [20 x i32]]* @f, i32 0, i32 %op110, i32 %op109
  %op127 = load i32, i32* %op126
  %op128 = load i32, i32* %op25
  %op129 = load i32, i32* %op3
  %op130 = icmp slt i32 %op129, zeroinitializer
  %op131 = zext i1 %op130 to i32
  %op132 = add i32 %op131, zeroinitializer
  %op133 = icmp slt i32 %op128, zeroinitializer
  %op134 = zext i1 %op133 to i32
  %op135 = add i32 %op134, %op132
  %op136 = icmp ne i32 %op135, zeroinitializer
  br i1 %op136, label %label_f_ltz90, label %label_f_gtz91
label_f_ltz90:                                                ; preds = %label_f_gtz89
  call void @neg_idx_except()
  br label %label_f_gtz91
label_f_gtz91:                                                ; preds = %label_f_gtz89, %label_f_ltz90
  %op137 = getelementptr [10005 x [20 x i32]], [10005 x [20 x i32]]* @f, i32 0, i32 %op129, i32 %op128
  %op138 = load i32, i32* %op137
  %op139 = icmp ne i32 %op127, %op138
  %op140 = zext i1 %op139 to i32
  %op141 = icmp sgt i32 %op140, zeroinitializer
  br i1 %op141, label %label_true92, label %label_ret93
label_true92:                                                ; preds = %label_f_gtz91
  %op142 = load i32, i32* %op25
  %op143 = load i32, i32* %op2
  %op144 = icmp slt i32 %op143, zeroinitializer
  %op145 = zext i1 %op144 to i32
  %op146 = add i32 %op145, zeroinitializer
  %op147 = icmp slt i32 %op142, zeroinitializer
  %op148 = zext i1 %op147 to i32
  %op149 = add i32 %op148, %op146
  %op150 = icmp ne i32 %op149, zeroinitializer
  br i1 %op150, label %label_f_ltz94, label %label_f_gtz95
label_ret93:                                                ; preds = %label_f_gtz91, %label_f_gtz97
  %op151 = load i32, i32* %op25
  %op152 = sub i32 %op151, 1
  store i32 %op152, i32* %op25
  br label %label_condition85
label_f_ltz94:                                                ; preds = %label_true92
  call void @neg_idx_except()
  br label %label_f_gtz95
label_f_gtz95:                                                ; preds = %label_true92, %label_f_ltz94
  %op153 = getelementptr [10005 x [20 x i32]], [10005 x [20 x i32]]* @f, i32 0, i32 %op143, i32 %op142
  %op154 = load i32, i32* %op153
  store i32 %op154, i32* %op2
  %op155 = load i32, i32* %op25
  %op156 = load i32, i32* %op3
  %op157 = icmp slt i32 %op156, zeroinitializer
  %op158 = zext i1 %op157 to i32
  %op159 = add i32 %op158, zeroinitializer
  %op160 = icmp slt i32 %op155, zeroinitializer
  %op161 = zext i1 %op160 to i32
  %op162 = add i32 %op161, %op159
  %op163 = icmp ne i32 %op162, zeroinitializer
  br i1 %op163, label %label_f_ltz96, label %label_f_gtz97
label_f_ltz96:                                                ; preds = %label_f_gtz95
  call void @neg_idx_except()
  br label %label_f_gtz97
label_f_gtz97:                                                ; preds = %label_f_gtz95, %label_f_ltz96
  %op164 = getelementptr [10005 x [20 x i32]], [10005 x [20 x i32]]* @f, i32 0, i32 %op156, i32 %op155
  %op165 = load i32, i32* %op164
  store i32 %op165, i32* %op3
  br label %label_ret93
label_f_ltz98:                                                ; preds = %label_ret87
  call void @neg_idx_except()
  br label %label_f_gtz99
label_f_gtz99:                                                ; preds = %label_ret87, %label_f_ltz98
  %op166 = getelementptr [10005 x [20 x i32]], [10005 x [20 x i32]]* @f, i32 0, i32 %op118, i32 0
  %op167 = load i32, i32* %op166
  ret i32 %op167
}
define i32 @main() {
label_entry:
  %op0 = call i32 @quick_read()
  store i32 %op0, i32* @n
  %op1 = call i32 @quick_read()
  store i32 %op1, i32* @m
  call void @init()
  %op2 = alloca i32
  store i32 1, i32* %op2
  br label %label_condition100
label_condition100:                                                ; preds = %label_entry, %label_loop101
  %op3 = load i32, i32* %op2
  %op4 = load i32, i32* @n
  %op5 = icmp ne i32 %op3, %op4
  %op6 = zext i1 %op5 to i32
  %op7 = icmp sgt i32 %op6, zeroinitializer
  br i1 %op7, label %label_loop101, label %label_ret102
label_loop101:                                                ; preds = %label_condition100
  %op8 = call i32 @quick_read()
  %op9 = alloca i32
  store i32 %op8, i32* %op9
  %op10 = call i32 @quick_read()
  %op11 = alloca i32
  store i32 %op10, i32* %op11
  %op12 = load i32, i32* %op9
  %op13 = load i32, i32* %op11
  call void @add_edge(i32 %op12, i32 %op13)
  %op14 = load i32, i32* %op2
  %op15 = add i32 %op14, 1
  store i32 %op15, i32* %op2
  br label %label_condition100
label_ret102:                                                ; preds = %label_condition100
  call void @tree(i32 1, i32 1)
  br label %label_condition103
label_condition103:                                                ; preds = %label_ret102, %label_loop104
  %op16 = load i32, i32* @m
  %op17 = icmp sgt i32 %op16, zeroinitializer
  br i1 %op17, label %label_loop104, label %label_ret105
label_loop104:                                                ; preds = %label_condition103
  %op18 = call i32 @quick_read()
  %op19 = alloca i32
  store i32 %op18, i32* %op19
  %op20 = call i32 @quick_read()
  %op21 = alloca i32
  store i32 %op20, i32* %op21
  %op22 = load i32, i32* %op19
  %op23 = load i32, i32* %op21
  %op24 = call i32 @LCA(i32 %op22, i32 %op23)
  call void @putint(i32 %op24)
  call void @putch(i32 10)
  %op25 = load i32, i32* @m
  %op26 = sub i32 %op25, 1
  store i32 %op26, i32* @m
  br label %label_condition103
label_ret105:                                                ; preds = %label_condition103
  ret i32 0
}
