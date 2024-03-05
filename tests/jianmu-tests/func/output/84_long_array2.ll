; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/jianmu-tests/func/84_long_array2.sy"

@a = global [4096 x i32] zeroinitializer
declare void @neg_idx_except()

declare i32 @getint()

declare i32 @getch()

declare float @getfloat()

declare i32 @getarray(i32*)

declare i32 @getfarray(i32*)

declare void @putint(i32)

declare void @putch(i32)

declare void @putarray(i32, i32*)

declare void @putfloat(float)

declare void @putfarray(float*)

declare void @putf(i32*)

declare void @starttime()

declare void @stoptime()

define i32 @f1(i32* %arg0) {
label_entry:
  %op1 = icmp slt i32 5, zeroinitializer
  %op2 = zext i1 %op1 to i32
  %op3 = add i32 %op2, zeroinitializer
  %op4 = icmp ne i32 %op3, zeroinitializer
  br i1 %op4, label %label_a_ltz0, label %label_a_gtz1
label_a_ltz0:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_a_gtz1
label_a_gtz1:                                                ; preds = %label_entry, %label_a_ltz0
  %op5 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 5
  store i32 4000, i32* %op5
  %op6 = icmp slt i32 4000, zeroinitializer
  %op7 = zext i1 %op6 to i32
  %op8 = add i32 %op7, zeroinitializer
  %op9 = icmp ne i32 %op8, zeroinitializer
  br i1 %op9, label %label_a_ltz2, label %label_a_gtz3
label_a_ltz2:                                                ; preds = %label_a_gtz1
  call void @neg_idx_except()
  br label %label_a_gtz3
label_a_gtz3:                                                ; preds = %label_a_gtz1, %label_a_ltz2
  %op10 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 4000
  store i32 3, i32* %op10
  %op11 = icmp slt i32 4095, zeroinitializer
  %op12 = zext i1 %op11 to i32
  %op13 = add i32 %op12, zeroinitializer
  %op14 = icmp ne i32 %op13, zeroinitializer
  br i1 %op14, label %label_a_ltz4, label %label_a_gtz5
label_a_ltz4:                                                ; preds = %label_a_gtz3
  call void @neg_idx_except()
  br label %label_a_gtz5
label_a_gtz5:                                                ; preds = %label_a_gtz3, %label_a_ltz4
  %op15 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 4095
  store i32 7, i32* %op15
  %op16 = icmp slt i32 4095, zeroinitializer
  %op17 = zext i1 %op16 to i32
  %op18 = add i32 %op17, zeroinitializer
  %op19 = icmp ne i32 %op18, zeroinitializer
  br i1 %op19, label %label_a_ltz6, label %label_a_gtz7
label_a_ltz6:                                                ; preds = %label_a_gtz5
  call void @neg_idx_except()
  br label %label_a_gtz7
label_a_gtz7:                                                ; preds = %label_a_gtz5, %label_a_ltz6
  %op20 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 4095
  %op21 = load i32, i32* %op20
  %op22 = icmp slt i32 %op21, zeroinitializer
  %op23 = zext i1 %op22 to i32
  %op24 = add i32 %op23, zeroinitializer
  %op25 = icmp ne i32 %op24, zeroinitializer
  br i1 %op25, label %label_b_ltz8, label %label_b_gtz9
label_b_ltz8:                                                ; preds = %label_a_gtz7
  call void @neg_idx_except()
  br label %label_b_gtz9
label_b_gtz9:                                                ; preds = %label_a_gtz7, %label_b_ltz8
  %op26 = getelementptr i32, i32* %arg0, i32 %op21
  %op27 = icmp slt i32 2216, zeroinitializer
  %op28 = zext i1 %op27 to i32
  %op29 = add i32 %op28, zeroinitializer
  %op30 = icmp ne i32 %op29, zeroinitializer
  br i1 %op30, label %label_a_ltz10, label %label_a_gtz11
label_a_ltz10:                                                ; preds = %label_b_gtz9
  call void @neg_idx_except()
  br label %label_a_gtz11
label_a_gtz11:                                                ; preds = %label_b_gtz9, %label_a_ltz10
  %op31 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 2216
  %op32 = load i32, i32* %op31
  %op33 = add i32 %op32, 9
  store i32 %op33, i32* %op26
  %op34 = icmp slt i32 5, zeroinitializer
  %op35 = zext i1 %op34 to i32
  %op36 = add i32 %op35, zeroinitializer
  %op37 = icmp ne i32 %op36, zeroinitializer
  br i1 %op37, label %label_a_ltz12, label %label_a_gtz13
label_a_ltz12:                                                ; preds = %label_a_gtz11
  call void @neg_idx_except()
  br label %label_a_gtz13
label_a_gtz13:                                                ; preds = %label_a_gtz11, %label_a_ltz12
  %op38 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 5
  %op39 = load i32, i32* %op38
  %op40 = icmp slt i32 %op39, zeroinitializer
  %op41 = zext i1 %op40 to i32
  %op42 = add i32 %op41, zeroinitializer
  %op43 = icmp ne i32 %op42, zeroinitializer
  br i1 %op43, label %label_a_ltz14, label %label_a_gtz15
label_a_ltz14:                                                ; preds = %label_a_gtz13
  call void @neg_idx_except()
  br label %label_a_gtz15
label_a_gtz15:                                                ; preds = %label_a_gtz13, %label_a_ltz14
  %op44 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 %op39
  %op45 = load i32, i32* %op44
  ret i32 %op45
}
define i32 @main() {
label_entry:
  %op0 = alloca [1024 x [4 x i32]]
  %op1 = icmp slt i32 0, zeroinitializer
  %op2 = zext i1 %op1 to i32
  %op3 = add i32 %op2, zeroinitializer
  %op4 = icmp ne i32 %op3, zeroinitializer
  br i1 %op4, label %label_c_ltz16, label %label_c_gtz17
label_c_ltz16:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_c_gtz17
label_c_gtz17:                                                ; preds = %label_entry, %label_c_ltz16
  %op5 = getelementptr [1024 x [4 x i32]], [1024 x [4 x i32]]* %op0, i32 0, i32 0
  %op6 = getelementptr [4 x i32], [4 x i32]* %op5, i32 0, i32 0
  %op7 = call i32 @f1(i32* %op6)
  call void @putint(i32 %op7)
  call void @putch(i32 10)
  %op8 = icmp slt i32 2, zeroinitializer
  %op9 = zext i1 %op8 to i32
  %op10 = add i32 %op9, zeroinitializer
  %op11 = icmp slt i32 0, zeroinitializer
  %op12 = zext i1 %op11 to i32
  %op13 = add i32 %op12, %op10
  %op14 = icmp ne i32 %op13, zeroinitializer
  br i1 %op14, label %label_c_ltz18, label %label_c_gtz19
label_c_ltz18:                                                ; preds = %label_c_gtz17
  call void @neg_idx_except()
  br label %label_c_gtz19
label_c_gtz19:                                                ; preds = %label_c_gtz17, %label_c_ltz18
  %op15 = getelementptr [1024 x [4 x i32]], [1024 x [4 x i32]]* %op0, i32 0, i32 2, i32 0
  %op16 = load i32, i32* %op15
  ret i32 %op16
}
