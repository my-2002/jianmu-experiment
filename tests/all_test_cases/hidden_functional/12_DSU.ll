; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/all_test_cases/hidden_functional/12_DSU.sy"

@n = global i32 zeroinitializer
@m = global i32 zeroinitializer
@fa = global [100005 x i32] zeroinitializer
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
define void @init() {
label_entry:
  %op0 = alloca i32
  store i32 1, i32* %op0
  br label %label_condition16
label_condition16:                                                ; preds = %label_entry, %label_fa_gtz20
  %op1 = load i32, i32* %op0
  %op2 = load i32, i32* @n
  %op3 = icmp sle i32 %op1, %op2
  %op4 = zext i1 %op3 to i32
  %op5 = icmp sgt i32 %op4, zeroinitializer
  br i1 %op5, label %label_loop17, label %label_ret18
label_loop17:                                                ; preds = %label_condition16
  %op6 = load i32, i32* %op0
  %op7 = icmp slt i32 %op6, zeroinitializer
  %op8 = zext i1 %op7 to i32
  %op9 = add i32 %op8, zeroinitializer
  %op10 = icmp ne i32 %op9, zeroinitializer
  br i1 %op10, label %label_fa_ltz19, label %label_fa_gtz20
label_ret18:                                                ; preds = %label_condition16
  ret void
label_fa_ltz19:                                                ; preds = %label_loop17
  call void @neg_idx_except()
  br label %label_fa_gtz20
label_fa_gtz20:                                                ; preds = %label_loop17, %label_fa_ltz19
  %op11 = getelementptr [100005 x i32], [100005 x i32]* @fa, i32 0, i32 %op6
  %op12 = load i32, i32* %op0
  store i32 %op12, i32* %op11
  %op13 = load i32, i32* %op0
  %op14 = add i32 %op13, 1
  store i32 %op14, i32* %op0
  br label %label_condition16
}
define i32 @find(i32 %arg0) {
label_entry:
  %op1 = alloca i32
  store i32 %arg0, i32* %op1
  %op2 = load i32, i32* %op1
  %op3 = icmp slt i32 %op2, zeroinitializer
  %op4 = zext i1 %op3 to i32
  %op5 = add i32 %op4, zeroinitializer
  %op6 = icmp ne i32 %op5, zeroinitializer
  br i1 %op6, label %label_fa_ltz21, label %label_fa_gtz22
label_fa_ltz21:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_fa_gtz22
label_fa_gtz22:                                                ; preds = %label_entry, %label_fa_ltz21
  %op7 = getelementptr [100005 x i32], [100005 x i32]* @fa, i32 0, i32 %op2
  %op8 = load i32, i32* %op7
  %op9 = load i32, i32* %op1
  %op10 = icmp eq i32 %op8, %op9
  %op11 = zext i1 %op10 to i32
  %op12 = icmp sgt i32 %op11, zeroinitializer
  br i1 %op12, label %label_true23, label %label_false24
label_true23:                                                ; preds = %label_fa_gtz22
  %op13 = load i32, i32* %op1
  ret i32 %op13
label_false24:                                                ; preds = %label_fa_gtz22
  %op14 = load i32, i32* %op1
  %op15 = icmp slt i32 %op14, zeroinitializer
  %op16 = zext i1 %op15 to i32
  %op17 = add i32 %op16, zeroinitializer
  %op18 = icmp ne i32 %op17, zeroinitializer
  br i1 %op18, label %label_fa_ltz25, label %label_fa_gtz26
label_fa_ltz25:                                                ; preds = %label_false24
  call void @neg_idx_except()
  br label %label_fa_gtz26
label_fa_gtz26:                                                ; preds = %label_false24, %label_fa_ltz25
  %op19 = getelementptr [100005 x i32], [100005 x i32]* @fa, i32 0, i32 %op14
  %op20 = load i32, i32* %op19
  %op21 = call i32 @find(i32 %op20)
  %op22 = alloca i32
  store i32 %op21, i32* %op22
  %op23 = load i32, i32* %op1
  %op24 = icmp slt i32 %op23, zeroinitializer
  %op25 = zext i1 %op24 to i32
  %op26 = add i32 %op25, zeroinitializer
  %op27 = icmp ne i32 %op26, zeroinitializer
  br i1 %op27, label %label_fa_ltz27, label %label_fa_gtz28
label_fa_ltz27:                                                ; preds = %label_fa_gtz26
  call void @neg_idx_except()
  br label %label_fa_gtz28
label_fa_gtz28:                                                ; preds = %label_fa_gtz26, %label_fa_ltz27
  %op28 = getelementptr [100005 x i32], [100005 x i32]* @fa, i32 0, i32 %op23
  %op29 = load i32, i32* %op22
  store i32 %op29, i32* %op28
  %op30 = load i32, i32* %op22
  ret i32 %op30
}
define i32 @same(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = alloca i32
  store i32 %arg0, i32* %op2
  %op3 = alloca i32
  store i32 %arg1, i32* %op3
  %op4 = load i32, i32* %op2
  %op5 = call i32 @find(i32 %op4)
  %op6 = load i32, i32* %op3
  %op7 = call i32 @find(i32 %op6)
  %op8 = icmp eq i32 %op5, %op7
  %op9 = zext i1 %op8 to i32
  %op10 = icmp sgt i32 %op9, zeroinitializer
  br i1 %op10, label %label_true29, label %label_ret30
label_true29:                                                ; preds = %label_entry
  ret i32 1
label_ret30:                                                ; preds = %label_entry
  ret i32 0
}
define i32 @main() {
label_entry:
  %op0 = call i32 @quick_read()
  store i32 %op0, i32* @n
  %op1 = call i32 @quick_read()
  store i32 %op1, i32* @m
  call void @init()
  br label %label_condition31
label_condition31:                                                ; preds = %label_entry, %label_ret44
  %op2 = load i32, i32* @m
  %op3 = icmp sgt i32 %op2, zeroinitializer
  br i1 %op3, label %label_loop32, label %label_ret33
label_loop32:                                                ; preds = %label_condition31
  %op4 = call i32 @getch()
  %op5 = alloca i32
  store i32 %op4, i32* %op5
  br label %label_condition34
label_ret33:                                                ; preds = %label_condition31
  ret i32 0
label_condition34:                                                ; preds = %label_loop32, %label_loop35
  %op6 = load i32, i32* %op5
  %op7 = icmp ne i32 %op6, 81
  %op8 = zext i1 %op7 to i32
  %op9 = icmp sgt i32 %op8, zeroinitializer
  br i1 %op9, label %label_true37, label %label_false38
label_loop35:                                                ; preds = %label_ret39
  %op10 = call i32 @getch()
  store i32 %op10, i32* %op5
  br label %label_condition34
label_ret36:                                                ; preds = %label_ret39
  %op11 = load i32, i32* %op5
  %op12 = icmp eq i32 %op11, 81
  %op13 = zext i1 %op12 to i32
  %op14 = icmp sgt i32 %op13, zeroinitializer
  br i1 %op14, label %label_true40, label %label_false41
label_true37:                                                ; preds = %label_condition34
  %op15 = load i32, i32* %op5
  %op16 = icmp ne i32 %op15, 85
  %op17 = zext i1 %op16 to i32
  %op18 = icmp sgt i32 %op17, zeroinitializer
  br label %label_ret39
label_false38:                                                ; preds = %label_condition34
  %op19 = icmp sgt i32 zeroinitializer, zeroinitializer
  br label %label_ret39
label_ret39:                                                ; preds = %label_true37, %label_false38
  %op20 = phi i1 [ %op18, %label_true37 ], [ %op19, %label_false38 ]
  %op21 = zext i1 %op20 to i32
  %op22 = icmp sgt i32 %op21, zeroinitializer
  br i1 %op22, label %label_loop35, label %label_ret36
label_true40:                                                ; preds = %label_ret36
  %op23 = call i32 @quick_read()
  %op24 = alloca i32
  store i32 %op23, i32* %op24
  %op25 = call i32 @quick_read()
  %op26 = alloca i32
  store i32 %op25, i32* %op26
  %op27 = load i32, i32* %op24
  %op28 = load i32, i32* %op26
  %op29 = call i32 @same(i32 %op27, i32 %op28)
  call void @putint(i32 %op29)
  call void @putch(i32 10)
  br label %label_ret44
label_false41:                                                ; preds = %label_ret36
  %op30 = call i32 @quick_read()
  %op31 = call i32 @find(i32 %op30)
  %op32 = alloca i32
  store i32 %op31, i32* %op32
  %op33 = call i32 @quick_read()
  %op34 = call i32 @find(i32 %op33)
  %op35 = alloca i32
  store i32 %op34, i32* %op35
  %op36 = load i32, i32* %op32
  %op37 = icmp slt i32 %op36, zeroinitializer
  %op38 = zext i1 %op37 to i32
  %op39 = add i32 %op38, zeroinitializer
  %op40 = icmp ne i32 %op39, zeroinitializer
  br i1 %op40, label %label_fa_ltz42, label %label_fa_gtz43
label_fa_ltz42:                                                ; preds = %label_false41
  call void @neg_idx_except()
  br label %label_fa_gtz43
label_fa_gtz43:                                                ; preds = %label_false41, %label_fa_ltz42
  %op41 = getelementptr [100005 x i32], [100005 x i32]* @fa, i32 0, i32 %op36
  %op42 = load i32, i32* %op35
  store i32 %op42, i32* %op41
  br label %label_ret44
label_ret44:                                                ; preds = %label_true40, %label_fa_gtz43
  %op43 = load i32, i32* @m
  %op44 = sub i32 %op43, 1
  store i32 %op44, i32* @m
  br label %label_condition31
}
