; ModuleID = 'sysy'
source_filename = "/home/my2002/compiler_principles/lab5/jianmu-experiment/tests/jianmu-tests/func/66_exgcd.sy"

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
  %op4 = alloca i32
  store i32 %arg0, i32* %op4
  %op5 = alloca i32
  store i32 %arg1, i32* %op5
  %op6 = alloca i32*
  store i32* %arg2, i32** %op6
  %op7 = alloca i32*
  store i32* %arg3, i32** %op7
  %op8 = load i32, i32* %op5
  %op9 = icmp eq i32 %op8, 0
  %op10 = zext i1 %op9 to i32
  %op11 = icmp sgt i32 %op10, zeroinitializer
  br i1 %op11, label %label_true0, label %label_false1
label_true0:                                                ; preds = %label_entry
  %op12 = icmp slt i32 0, zeroinitializer
  %op13 = zext i1 %op12 to i32
  %op14 = add i32 %op13, zeroinitializer
  %op15 = icmp ne i32 %op14, zeroinitializer
  br i1 %op15, label %label_x_ltz2, label %label_x_gtz3
label_false1:                                                ; preds = %label_entry
  %op16 = load i32, i32* %op5
  %op17 = load i32, i32* %op4
  %op18 = load i32, i32* %op5
  %op19 = sdiv i32 %op17, %op18
  %op20 = mul i32 %op19, %op18
  %op21 = sub i32 %op17, %op20
  %op22 = load i32*, i32** %op6
  %op23 = load i32*, i32** %op7
  %op24 = call i32 @exgcd(i32 %op16, i32 %op21, i32* %op22, i32* %op23)
  %op25 = alloca i32
  store i32 %op24, i32* %op25
  %op26 = icmp slt i32 0, zeroinitializer
  %op27 = zext i1 %op26 to i32
  %op28 = add i32 %op27, zeroinitializer
  %op29 = icmp ne i32 %op28, zeroinitializer
  br i1 %op29, label %label_x_ltz6, label %label_x_gtz7
label_x_ltz2:                                                ; preds = %label_true0
  call void @neg_idx_except()
  br label %label_x_gtz3
label_x_gtz3:                                                ; preds = %label_true0, %label_x_ltz2
  %op30 = load i32*, i32** %op6
  %op31 = getelementptr i32, i32* %op30, i32 0
  store i32 1, i32* %op31
  %op32 = icmp slt i32 0, zeroinitializer
  %op33 = zext i1 %op32 to i32
  %op34 = add i32 %op33, zeroinitializer
  %op35 = icmp ne i32 %op34, zeroinitializer
  br i1 %op35, label %label_y_ltz4, label %label_y_gtz5
label_y_ltz4:                                                ; preds = %label_x_gtz3
  call void @neg_idx_except()
  br label %label_y_gtz5
label_y_gtz5:                                                ; preds = %label_x_gtz3, %label_y_ltz4
  %op36 = load i32*, i32** %op7
  %op37 = getelementptr i32, i32* %op36, i32 0
  store i32 0, i32* %op37
  %op38 = load i32, i32* %op4
  ret i32 %op38
label_x_ltz6:                                                ; preds = %label_false1
  call void @neg_idx_except()
  br label %label_x_gtz7
label_x_gtz7:                                                ; preds = %label_false1, %label_x_ltz6
  %op39 = load i32*, i32** %op6
  %op40 = getelementptr i32, i32* %op39, i32 0
  %op41 = load i32, i32* %op40
  %op42 = alloca i32
  store i32 %op41, i32* %op42
  %op43 = icmp slt i32 0, zeroinitializer
  %op44 = zext i1 %op43 to i32
  %op45 = add i32 %op44, zeroinitializer
  %op46 = icmp ne i32 %op45, zeroinitializer
  br i1 %op46, label %label_x_ltz8, label %label_x_gtz9
label_x_ltz8:                                                ; preds = %label_x_gtz7
  call void @neg_idx_except()
  br label %label_x_gtz9
label_x_gtz9:                                                ; preds = %label_x_gtz7, %label_x_ltz8
  %op47 = load i32*, i32** %op6
  %op48 = getelementptr i32, i32* %op47, i32 0
  %op49 = icmp slt i32 0, zeroinitializer
  %op50 = zext i1 %op49 to i32
  %op51 = add i32 %op50, zeroinitializer
  %op52 = icmp ne i32 %op51, zeroinitializer
  br i1 %op52, label %label_y_ltz10, label %label_y_gtz11
label_y_ltz10:                                                ; preds = %label_x_gtz9
  call void @neg_idx_except()
  br label %label_y_gtz11
label_y_gtz11:                                                ; preds = %label_x_gtz9, %label_y_ltz10
  %op53 = load i32*, i32** %op7
  %op54 = getelementptr i32, i32* %op53, i32 0
  %op55 = load i32, i32* %op54
  store i32 %op55, i32* %op48
  %op56 = icmp slt i32 0, zeroinitializer
  %op57 = zext i1 %op56 to i32
  %op58 = add i32 %op57, zeroinitializer
  %op59 = icmp ne i32 %op58, zeroinitializer
  br i1 %op59, label %label_y_ltz12, label %label_y_gtz13
label_y_ltz12:                                                ; preds = %label_y_gtz11
  call void @neg_idx_except()
  br label %label_y_gtz13
label_y_gtz13:                                                ; preds = %label_y_gtz11, %label_y_ltz12
  %op60 = load i32*, i32** %op7
  %op61 = getelementptr i32, i32* %op60, i32 0
  %op62 = load i32, i32* %op42
  %op63 = load i32, i32* %op4
  %op64 = load i32, i32* %op5
  %op65 = sdiv i32 %op63, %op64
  %op66 = icmp slt i32 0, zeroinitializer
  %op67 = zext i1 %op66 to i32
  %op68 = add i32 %op67, zeroinitializer
  %op69 = icmp ne i32 %op68, zeroinitializer
  br i1 %op69, label %label_y_ltz14, label %label_y_gtz15
label_y_ltz14:                                                ; preds = %label_y_gtz13
  call void @neg_idx_except()
  br label %label_y_gtz15
label_y_gtz15:                                                ; preds = %label_y_gtz13, %label_y_ltz14
  %op70 = load i32*, i32** %op7
  %op71 = getelementptr i32, i32* %op70, i32 0
  %op72 = load i32, i32* %op71
  %op73 = mul i32 %op65, %op72
  %op74 = sub i32 %op62, %op73
  store i32 %op74, i32* %op61
  %op75 = load i32, i32* %op25
  ret i32 %op75
}
define i32 @main() {
label_entry:
  %op0 = alloca i32
  store i32 7, i32* %op0
  %op1 = alloca i32
  store i32 15, i32* %op1
  %op2 = alloca [1 x i32]
  store [1 x i32] [i32 1], [1 x i32]* %op2
  %op3 = alloca [1 x i32]
  store [1 x i32] [i32 1], [1 x i32]* %op3
  %op4 = load i32, i32* %op0
  %op5 = load i32, i32* %op1
  %op6 = getelementptr [1 x i32], [1 x i32]* %op2, i32 0, i32 0
  %op7 = getelementptr [1 x i32], [1 x i32]* %op3, i32 0, i32 0
  %op8 = call i32 @exgcd(i32 %op4, i32 %op5, i32* %op6, i32* %op7)
  %op9 = icmp slt i32 0, zeroinitializer
  %op10 = zext i1 %op9 to i32
  %op11 = add i32 %op10, zeroinitializer
  %op12 = icmp ne i32 %op11, zeroinitializer
  br i1 %op12, label %label_x_ltz16, label %label_x_gtz17
label_x_ltz16:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_x_gtz17
label_x_gtz17:                                                ; preds = %label_entry, %label_x_ltz16
  %op13 = getelementptr [1 x i32], [1 x i32]* %op2, i32 0, i32 0
  %op14 = icmp slt i32 0, zeroinitializer
  %op15 = zext i1 %op14 to i32
  %op16 = add i32 %op15, zeroinitializer
  %op17 = icmp ne i32 %op16, zeroinitializer
  br i1 %op17, label %label_x_ltz18, label %label_x_gtz19
label_x_ltz18:                                                ; preds = %label_x_gtz17
  call void @neg_idx_except()
  br label %label_x_gtz19
label_x_gtz19:                                                ; preds = %label_x_gtz17, %label_x_ltz18
  %op18 = getelementptr [1 x i32], [1 x i32]* %op2, i32 0, i32 0
  %op19 = load i32, i32* %op18
  %op20 = load i32, i32* %op1
  %op21 = sdiv i32 %op19, %op20
  %op22 = mul i32 %op21, %op20
  %op23 = sub i32 %op19, %op22
  %op24 = load i32, i32* %op1
  %op25 = add i32 %op23, %op24
  %op26 = load i32, i32* %op1
  %op27 = sdiv i32 %op25, %op26
  %op28 = mul i32 %op27, %op26
  %op29 = sub i32 %op25, %op28
  store i32 %op29, i32* %op13
  %op30 = icmp slt i32 0, zeroinitializer
  %op31 = zext i1 %op30 to i32
  %op32 = add i32 %op31, zeroinitializer
  %op33 = icmp ne i32 %op32, zeroinitializer
  br i1 %op33, label %label_x_ltz20, label %label_x_gtz21
label_x_ltz20:                                                ; preds = %label_x_gtz19
  call void @neg_idx_except()
  br label %label_x_gtz21
label_x_gtz21:                                                ; preds = %label_x_gtz19, %label_x_ltz20
  %op34 = getelementptr [1 x i32], [1 x i32]* %op2, i32 0, i32 0
  %op35 = load i32, i32* %op34
  call void @putint(i32 %op35)
  ret i32 0
}
