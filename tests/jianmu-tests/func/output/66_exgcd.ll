; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/jianmu-tests/func/66_exgcd.sy"

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

define i32 @exgcd(i32 %arg0, i32 %arg1, i32* %arg2, i32* %arg3) {
label_entry:
  %op4 = icmp eq i32 %arg1, 0
  %op5 = zext i1 %op4 to i32
  %op6 = icmp sgt i32 %op5, zeroinitializer
  br i1 %op6, label %label_true0, label %label_false1
label_true0:                                                ; preds = %label_entry
  %op7 = icmp slt i32 0, zeroinitializer
  %op8 = zext i1 %op7 to i32
  %op9 = add i32 %op8, zeroinitializer
  %op10 = icmp ne i32 %op9, zeroinitializer
  br i1 %op10, label %label_x_ltz2, label %label_x_gtz3
label_false1:                                                ; preds = %label_entry
  %op11 = sdiv i32 %arg0, %arg1
  %op12 = mul i32 %op11, %arg1
  %op13 = sub i32 %arg0, %op12
  %op14 = call i32 @exgcd(i32 %arg1, i32 %op13, i32* %arg2, i32* %arg3)
  %op15 = icmp slt i32 0, zeroinitializer
  %op16 = zext i1 %op15 to i32
  %op17 = add i32 %op16, zeroinitializer
  %op18 = icmp ne i32 %op17, zeroinitializer
  br i1 %op18, label %label_x_ltz6, label %label_x_gtz7
label_x_ltz2:                                                ; preds = %label_true0
  call void @neg_idx_except()
  br label %label_x_gtz3
label_x_gtz3:                                                ; preds = %label_true0, %label_x_ltz2
  %op19 = getelementptr i32, i32* %arg2, i32 0
  store i32 1, i32* %op19
  %op20 = icmp slt i32 0, zeroinitializer
  %op21 = zext i1 %op20 to i32
  %op22 = add i32 %op21, zeroinitializer
  %op23 = icmp ne i32 %op22, zeroinitializer
  br i1 %op23, label %label_y_ltz4, label %label_y_gtz5
label_y_ltz4:                                                ; preds = %label_x_gtz3
  call void @neg_idx_except()
  br label %label_y_gtz5
label_y_gtz5:                                                ; preds = %label_x_gtz3, %label_y_ltz4
  %op24 = getelementptr i32, i32* %arg3, i32 0
  store i32 0, i32* %op24
  ret i32 %arg0
label_x_ltz6:                                                ; preds = %label_false1
  call void @neg_idx_except()
  br label %label_x_gtz7
label_x_gtz7:                                                ; preds = %label_false1, %label_x_ltz6
  %op25 = getelementptr i32, i32* %arg2, i32 0
  %op26 = load i32, i32* %op25
  %op27 = icmp slt i32 0, zeroinitializer
  %op28 = zext i1 %op27 to i32
  %op29 = add i32 %op28, zeroinitializer
  %op30 = icmp ne i32 %op29, zeroinitializer
  br i1 %op30, label %label_x_ltz8, label %label_x_gtz9
label_x_ltz8:                                                ; preds = %label_x_gtz7
  call void @neg_idx_except()
  br label %label_x_gtz9
label_x_gtz9:                                                ; preds = %label_x_gtz7, %label_x_ltz8
  %op31 = getelementptr i32, i32* %arg2, i32 0
  %op32 = icmp slt i32 0, zeroinitializer
  %op33 = zext i1 %op32 to i32
  %op34 = add i32 %op33, zeroinitializer
  %op35 = icmp ne i32 %op34, zeroinitializer
  br i1 %op35, label %label_y_ltz10, label %label_y_gtz11
label_y_ltz10:                                                ; preds = %label_x_gtz9
  call void @neg_idx_except()
  br label %label_y_gtz11
label_y_gtz11:                                                ; preds = %label_x_gtz9, %label_y_ltz10
  %op36 = getelementptr i32, i32* %arg3, i32 0
  %op37 = load i32, i32* %op36
  store i32 %op37, i32* %op31
  %op38 = icmp slt i32 0, zeroinitializer
  %op39 = zext i1 %op38 to i32
  %op40 = add i32 %op39, zeroinitializer
  %op41 = icmp ne i32 %op40, zeroinitializer
  br i1 %op41, label %label_y_ltz12, label %label_y_gtz13
label_y_ltz12:                                                ; preds = %label_y_gtz11
  call void @neg_idx_except()
  br label %label_y_gtz13
label_y_gtz13:                                                ; preds = %label_y_gtz11, %label_y_ltz12
  %op42 = getelementptr i32, i32* %arg3, i32 0
  %op43 = sdiv i32 %arg0, %arg1
  %op44 = icmp slt i32 0, zeroinitializer
  %op45 = zext i1 %op44 to i32
  %op46 = add i32 %op45, zeroinitializer
  %op47 = icmp ne i32 %op46, zeroinitializer
  br i1 %op47, label %label_y_ltz14, label %label_y_gtz15
label_y_ltz14:                                                ; preds = %label_y_gtz13
  call void @neg_idx_except()
  br label %label_y_gtz15
label_y_gtz15:                                                ; preds = %label_y_gtz13, %label_y_ltz14
  %op48 = getelementptr i32, i32* %arg3, i32 0
  %op49 = load i32, i32* %op48
  %op50 = mul i32 %op43, %op49
  %op51 = sub i32 %op26, %op50
  store i32 %op51, i32* %op42
  ret i32 %op14
}
define i32 @main() {
label_entry:
  %op0 = alloca [1 x i32]
  %op1 = alloca [1 x i32]
  %op2 = getelementptr [1 x i32], [1 x i32]* %op0, i32 0, i32 0
  %op3 = getelementptr [1 x i32], [1 x i32]* %op1, i32 0, i32 0
  %op4 = call i32 @exgcd(i32 7, i32 15, i32* %op2, i32* %op3)
  %op5 = icmp slt i32 0, zeroinitializer
  %op6 = zext i1 %op5 to i32
  %op7 = add i32 %op6, zeroinitializer
  %op8 = icmp ne i32 %op7, zeroinitializer
  br i1 %op8, label %label_x_ltz16, label %label_x_gtz17
label_x_ltz16:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_x_gtz17
label_x_gtz17:                                                ; preds = %label_entry, %label_x_ltz16
  %op9 = getelementptr [1 x i32], [1 x i32]* %op0, i32 0, i32 0
  %op10 = icmp slt i32 0, zeroinitializer
  %op11 = zext i1 %op10 to i32
  %op12 = add i32 %op11, zeroinitializer
  %op13 = icmp ne i32 %op12, zeroinitializer
  br i1 %op13, label %label_x_ltz18, label %label_x_gtz19
label_x_ltz18:                                                ; preds = %label_x_gtz17
  call void @neg_idx_except()
  br label %label_x_gtz19
label_x_gtz19:                                                ; preds = %label_x_gtz17, %label_x_ltz18
  %op14 = getelementptr [1 x i32], [1 x i32]* %op0, i32 0, i32 0
  %op15 = load i32, i32* %op14
  %op16 = sdiv i32 %op15, 15
  %op17 = mul i32 %op16, 15
  %op18 = sub i32 %op15, %op17
  %op19 = add i32 %op18, 15
  %op20 = sdiv i32 %op19, 15
  %op21 = mul i32 %op20, 15
  %op22 = sub i32 %op19, %op21
  store i32 %op22, i32* %op9
  %op23 = icmp slt i32 0, zeroinitializer
  %op24 = zext i1 %op23 to i32
  %op25 = add i32 %op24, zeroinitializer
  %op26 = icmp ne i32 %op25, zeroinitializer
  br i1 %op26, label %label_x_ltz20, label %label_x_gtz21
label_x_ltz20:                                                ; preds = %label_x_gtz19
  call void @neg_idx_except()
  br label %label_x_gtz21
label_x_gtz21:                                                ; preds = %label_x_gtz19, %label_x_ltz20
  %op27 = getelementptr [1 x i32], [1 x i32]* %op0, i32 0, i32 0
  %op28 = load i32, i32* %op27
  call void @putint(i32 %op28)
  ret i32 0
}
