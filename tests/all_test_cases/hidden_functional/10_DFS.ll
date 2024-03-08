; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/all_test_cases/hidden_functional/10_DFS.sy"

@n = global i32 zeroinitializer
@m = global i32 zeroinitializer
@maxn = constant i32 1005
@maxm = constant i32 5005
@to = global [5005 x i32] zeroinitializer
@next = global [5005 x i32] zeroinitializer
@head = global [1005 x i32] zeroinitializer
@cnt = global i32 0
@vis = global [1005 x i32] zeroinitializer
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
  %op9 = getelementptr [5005 x i32], [5005 x i32]* @to, i32 0, i32 %op4
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
  %op16 = getelementptr [5005 x i32], [5005 x i32]* @next, i32 0, i32 %op11
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
  %op22 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %op17
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
  %op29 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %op24
  %op30 = load i32, i32* @cnt
  store i32 %op30, i32* %op29
  %op31 = load i32, i32* @cnt
  %op32 = add i32 %op31, 1
  store i32 %op32, i32* @cnt
  %op33 = load i32, i32* @cnt
  %op34 = icmp slt i32 %op33, zeroinitializer
  %op35 = zext i1 %op34 to i32
  %op36 = add i32 %op35, zeroinitializer
  %op37 = icmp ne i32 %op36, zeroinitializer
  br i1 %op37, label %label_to_ltz24, label %label_to_gtz25
label_to_ltz24:                                                ; preds = %label_head_gtz23
  call void @neg_idx_except()
  br label %label_to_gtz25
label_to_gtz25:                                                ; preds = %label_head_gtz23, %label_to_ltz24
  %op38 = getelementptr [5005 x i32], [5005 x i32]* @to, i32 0, i32 %op33
  %op39 = load i32, i32* %op2
  store i32 %op39, i32* %op38
  %op40 = load i32, i32* @cnt
  %op41 = icmp slt i32 %op40, zeroinitializer
  %op42 = zext i1 %op41 to i32
  %op43 = add i32 %op42, zeroinitializer
  %op44 = icmp ne i32 %op43, zeroinitializer
  br i1 %op44, label %label_next_ltz26, label %label_next_gtz27
label_next_ltz26:                                                ; preds = %label_to_gtz25
  call void @neg_idx_except()
  br label %label_next_gtz27
label_next_gtz27:                                                ; preds = %label_to_gtz25, %label_next_ltz26
  %op45 = getelementptr [5005 x i32], [5005 x i32]* @next, i32 0, i32 %op40
  %op46 = load i32, i32* %op3
  %op47 = icmp slt i32 %op46, zeroinitializer
  %op48 = zext i1 %op47 to i32
  %op49 = add i32 %op48, zeroinitializer
  %op50 = icmp ne i32 %op49, zeroinitializer
  br i1 %op50, label %label_head_ltz28, label %label_head_gtz29
label_head_ltz28:                                                ; preds = %label_next_gtz27
  call void @neg_idx_except()
  br label %label_head_gtz29
label_head_gtz29:                                                ; preds = %label_next_gtz27, %label_head_ltz28
  %op51 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %op46
  %op52 = load i32, i32* %op51
  store i32 %op52, i32* %op45
  %op53 = load i32, i32* %op3
  %op54 = icmp slt i32 %op53, zeroinitializer
  %op55 = zext i1 %op54 to i32
  %op56 = add i32 %op55, zeroinitializer
  %op57 = icmp ne i32 %op56, zeroinitializer
  br i1 %op57, label %label_head_ltz30, label %label_head_gtz31
label_head_ltz30:                                                ; preds = %label_head_gtz29
  call void @neg_idx_except()
  br label %label_head_gtz31
label_head_gtz31:                                                ; preds = %label_head_gtz29, %label_head_ltz30
  %op58 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %op53
  %op59 = load i32, i32* @cnt
  store i32 %op59, i32* %op58
  %op60 = load i32, i32* @cnt
  %op61 = add i32 %op60, 1
  store i32 %op61, i32* @cnt
  ret void
}
define void @init() {
label_entry:
  %op0 = alloca i32
  store i32 0, i32* %op0
  br label %label_condition32
label_condition32:                                                ; preds = %label_entry, %label_head_gtz36
  %op1 = load i32, i32* %op0
  %op2 = load i32, i32* @maxn
  %op3 = icmp slt i32 %op1, %op2
  %op4 = zext i1 %op3 to i32
  %op5 = icmp sgt i32 %op4, zeroinitializer
  br i1 %op5, label %label_loop33, label %label_ret34
label_loop33:                                                ; preds = %label_condition32
  %op6 = load i32, i32* %op0
  %op7 = icmp slt i32 %op6, zeroinitializer
  %op8 = zext i1 %op7 to i32
  %op9 = add i32 %op8, zeroinitializer
  %op10 = icmp ne i32 %op9, zeroinitializer
  br i1 %op10, label %label_head_ltz35, label %label_head_gtz36
label_ret34:                                                ; preds = %label_condition32
  ret void
label_head_ltz35:                                                ; preds = %label_loop33
  call void @neg_idx_except()
  br label %label_head_gtz36
label_head_gtz36:                                                ; preds = %label_loop33, %label_head_ltz35
  %op11 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %op6
  store i32 -1, i32* %op11
  %op12 = load i32, i32* %op0
  %op13 = add i32 %op12, 1
  store i32 %op13, i32* %op0
  br label %label_condition32
}
define void @clear() {
label_entry:
  %op0 = alloca i32
  store i32 1, i32* %op0
  br label %label_condition37
label_condition37:                                                ; preds = %label_entry, %label_vis_gtz41
  %op1 = load i32, i32* %op0
  %op2 = load i32, i32* @n
  %op3 = icmp sle i32 %op1, %op2
  %op4 = zext i1 %op3 to i32
  %op5 = icmp sgt i32 %op4, zeroinitializer
  br i1 %op5, label %label_loop38, label %label_ret39
label_loop38:                                                ; preds = %label_condition37
  %op6 = load i32, i32* %op0
  %op7 = icmp slt i32 %op6, zeroinitializer
  %op8 = zext i1 %op7 to i32
  %op9 = add i32 %op8, zeroinitializer
  %op10 = icmp ne i32 %op9, zeroinitializer
  br i1 %op10, label %label_vis_ltz40, label %label_vis_gtz41
label_ret39:                                                ; preds = %label_condition37
  ret void
label_vis_ltz40:                                                ; preds = %label_loop38
  call void @neg_idx_except()
  br label %label_vis_gtz41
label_vis_gtz41:                                                ; preds = %label_loop38, %label_vis_ltz40
  %op11 = getelementptr [1005 x i32], [1005 x i32]* @vis, i32 0, i32 %op6
  store i32 0, i32* %op11
  %op12 = load i32, i32* %op0
  %op13 = add i32 %op12, 1
  store i32 %op13, i32* %op0
  br label %label_condition37
}
define i32 @same(i32 %arg0, i32 %arg1) {
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
  br i1 %op8, label %label_vis_ltz42, label %label_vis_gtz43
label_vis_ltz42:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_vis_gtz43
label_vis_gtz43:                                                ; preds = %label_entry, %label_vis_ltz42
  %op9 = getelementptr [1005 x i32], [1005 x i32]* @vis, i32 0, i32 %op4
  store i32 1, i32* %op9
  %op10 = load i32, i32* %op2
  %op11 = load i32, i32* %op3
  %op12 = icmp eq i32 %op10, %op11
  %op13 = zext i1 %op12 to i32
  %op14 = icmp sgt i32 %op13, zeroinitializer
  br i1 %op14, label %label_true44, label %label_ret45
label_true44:                                                ; preds = %label_vis_gtz43
  ret i32 1
label_ret45:                                                ; preds = %label_vis_gtz43
  %op15 = load i32, i32* %op2
  %op16 = icmp slt i32 %op15, zeroinitializer
  %op17 = zext i1 %op16 to i32
  %op18 = add i32 %op17, zeroinitializer
  %op19 = icmp ne i32 %op18, zeroinitializer
  br i1 %op19, label %label_head_ltz46, label %label_head_gtz47
label_head_ltz46:                                                ; preds = %label_ret45
  call void @neg_idx_except()
  br label %label_head_gtz47
label_head_gtz47:                                                ; preds = %label_ret45, %label_head_ltz46
  %op20 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %op15
  %op21 = load i32, i32* %op20
  %op22 = alloca i32
  store i32 %op21, i32* %op22
  br label %label_condition48
label_condition48:                                                ; preds = %label_head_gtz47, %label_next_gtz61
  %op23 = load i32, i32* %op22
  %op24 = icmp ne i32 %op23, -1
  %op25 = zext i1 %op24 to i32
  %op26 = icmp sgt i32 %op25, zeroinitializer
  br i1 %op26, label %label_loop49, label %label_ret50
label_loop49:                                                ; preds = %label_condition48
  %op27 = load i32, i32* %op22
  %op28 = icmp slt i32 %op27, zeroinitializer
  %op29 = zext i1 %op28 to i32
  %op30 = add i32 %op29, zeroinitializer
  %op31 = icmp ne i32 %op30, zeroinitializer
  br i1 %op31, label %label_to_ltz51, label %label_to_gtz52
label_ret50:                                                ; preds = %label_condition48
  ret i32 0
label_to_ltz51:                                                ; preds = %label_loop49
  call void @neg_idx_except()
  br label %label_to_gtz52
label_to_gtz52:                                                ; preds = %label_loop49, %label_to_ltz51
  %op32 = getelementptr [5005 x i32], [5005 x i32]* @to, i32 0, i32 %op27
  %op33 = load i32, i32* %op32
  %op34 = alloca i32
  store i32 %op33, i32* %op34
  %op35 = load i32, i32* %op34
  %op36 = icmp slt i32 %op35, zeroinitializer
  %op37 = zext i1 %op36 to i32
  %op38 = add i32 %op37, zeroinitializer
  %op39 = icmp ne i32 %op38, zeroinitializer
  br i1 %op39, label %label_vis_ltz53, label %label_vis_gtz54
label_vis_ltz53:                                                ; preds = %label_to_gtz52
  call void @neg_idx_except()
  br label %label_vis_gtz54
label_vis_gtz54:                                                ; preds = %label_to_gtz52, %label_vis_ltz53
  %op40 = getelementptr [1005 x i32], [1005 x i32]* @vis, i32 0, i32 %op35
  %op41 = load i32, i32* %op40
  %op42 = icmp sle i32 %op41, zeroinitializer
  %op43 = zext i1 %op42 to i32
  %op44 = icmp sgt i32 %op43, zeroinitializer
  br i1 %op44, label %label_true55, label %label_false56
label_true55:                                                ; preds = %label_vis_gtz54
  %op45 = load i32, i32* %op34
  %op46 = load i32, i32* %op3
  %op47 = call i32 @same(i32 %op45, i32 %op46)
  %op48 = icmp sgt i32 %op47, zeroinitializer
  br label %label_ret57
label_false56:                                                ; preds = %label_vis_gtz54
  %op49 = icmp sgt i32 zeroinitializer, zeroinitializer
  br label %label_ret57
label_ret57:                                                ; preds = %label_true55, %label_false56
  %op50 = phi i1 [ %op48, %label_true55 ], [ %op49, %label_false56 ]
  %op51 = zext i1 %op50 to i32
  %op52 = icmp sgt i32 %op51, zeroinitializer
  br i1 %op52, label %label_true58, label %label_ret59
label_true58:                                                ; preds = %label_ret57
  ret i32 1
label_ret59:                                                ; preds = %label_ret57
  %op53 = load i32, i32* %op22
  %op54 = icmp slt i32 %op53, zeroinitializer
  %op55 = zext i1 %op54 to i32
  %op56 = add i32 %op55, zeroinitializer
  %op57 = icmp ne i32 %op56, zeroinitializer
  br i1 %op57, label %label_next_ltz60, label %label_next_gtz61
label_next_ltz60:                                                ; preds = %label_ret59
  call void @neg_idx_except()
  br label %label_next_gtz61
label_next_gtz61:                                                ; preds = %label_ret59, %label_next_ltz60
  %op58 = getelementptr [5005 x i32], [5005 x i32]* @next, i32 0, i32 %op53
  %op59 = load i32, i32* %op58
  store i32 %op59, i32* %op22
  br label %label_condition48
}
define i32 @main() {
label_entry:
  %op0 = call i32 @quick_read()
  store i32 %op0, i32* @n
  %op1 = call i32 @quick_read()
  store i32 %op1, i32* @m
  call void @init()
  br label %label_condition62
label_condition62:                                                ; preds = %label_entry, %label_ret73
  %op2 = load i32, i32* @m
  %op3 = icmp sgt i32 %op2, zeroinitializer
  br i1 %op3, label %label_loop63, label %label_ret64
label_loop63:                                                ; preds = %label_condition62
  %op4 = call i32 @getch()
  %op5 = alloca i32
  store i32 %op4, i32* %op5
  br label %label_condition65
label_ret64:                                                ; preds = %label_condition62
  ret i32 0
label_condition65:                                                ; preds = %label_loop63, %label_loop66
  %op6 = load i32, i32* %op5
  %op7 = icmp ne i32 %op6, 81
  %op8 = zext i1 %op7 to i32
  %op9 = icmp sgt i32 %op8, zeroinitializer
  br i1 %op9, label %label_true68, label %label_false69
label_loop66:                                                ; preds = %label_ret70
  %op10 = call i32 @getch()
  store i32 %op10, i32* %op5
  br label %label_condition65
label_ret67:                                                ; preds = %label_ret70
  %op11 = load i32, i32* %op5
  %op12 = icmp eq i32 %op11, 81
  %op13 = zext i1 %op12 to i32
  %op14 = icmp sgt i32 %op13, zeroinitializer
  br i1 %op14, label %label_true71, label %label_false72
label_true68:                                                ; preds = %label_condition65
  %op15 = load i32, i32* %op5
  %op16 = icmp ne i32 %op15, 85
  %op17 = zext i1 %op16 to i32
  %op18 = icmp sgt i32 %op17, zeroinitializer
  br label %label_ret70
label_false69:                                                ; preds = %label_condition65
  %op19 = icmp sgt i32 zeroinitializer, zeroinitializer
  br label %label_ret70
label_ret70:                                                ; preds = %label_true68, %label_false69
  %op20 = phi i1 [ %op18, %label_true68 ], [ %op19, %label_false69 ]
  %op21 = zext i1 %op20 to i32
  %op22 = icmp sgt i32 %op21, zeroinitializer
  br i1 %op22, label %label_loop66, label %label_ret67
label_true71:                                                ; preds = %label_ret67
  %op23 = call i32 @quick_read()
  %op24 = alloca i32
  store i32 %op23, i32* %op24
  %op25 = call i32 @quick_read()
  %op26 = alloca i32
  store i32 %op25, i32* %op26
  call void @clear()
  %op27 = load i32, i32* %op24
  %op28 = load i32, i32* %op26
  %op29 = call i32 @same(i32 %op27, i32 %op28)
  call void @putint(i32 %op29)
  call void @putch(i32 10)
  br label %label_ret73
label_false72:                                                ; preds = %label_ret67
  %op30 = call i32 @quick_read()
  %op31 = alloca i32
  store i32 %op30, i32* %op31
  %op32 = call i32 @quick_read()
  %op33 = alloca i32
  store i32 %op32, i32* %op33
  %op34 = load i32, i32* %op31
  %op35 = load i32, i32* %op33
  call void @add_edge(i32 %op34, i32 %op35)
  br label %label_ret73
label_ret73:                                                ; preds = %label_true71, %label_false72
  %op36 = load i32, i32* @m
  %op37 = sub i32 %op36, 1
  store i32 %op37, i32* @m
  br label %label_condition62
}
