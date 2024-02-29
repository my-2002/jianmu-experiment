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
  %op9 = add i32 %op8, 0
  %op10 = icmp eq i32 %op8, 0
  %op11 = zext i1 %op10 to i32
  %op12 = icmp sgt i32 %op11, zeroinitializer
  br i1 %op12, label %label_true0, label %label_false1
label_true0:                                                ; preds = %label_entry
  %op13 = icmp slt i32 0, zeroinitializer
  %op14 = zext i1 %op13 to i32
  %op15 = add i32 %op14, zeroinitializer
  %op16 = icmp ne i32 %op15, zeroinitializer
  br i1 %op16, label %label_x_ltz2, label %label_x_gtz3
label_false1:                                                ; preds = %label_entry
  %op17 = load i32, i32* %op5
  %op18 = load i32, i32* %op4
  %op19 = load i32, i32* %op5
  %op20 = sdiv i32 %op18, %op19
  %op21 = mul i32 %op20, %op19
  %op22 = sub i32 %op18, %op21
  %op23 = load i32*, i32** %op6
  %op24 = load i32*, i32** %op7
  %op25 = call i32 @exgcd(i32 %op17, i32 %op22, i32* %op23, i32* %op24)
  %op26 = alloca i32
  store i32 %op25, i32* %op26
  %op27 = icmp slt i32 0, zeroinitializer
  %op28 = zext i1 %op27 to i32
  %op29 = add i32 %op28, zeroinitializer
  %op30 = icmp ne i32 %op29, zeroinitializer
  br i1 %op30, label %label_x_ltz6, label %label_x_gtz7
label_x_ltz2:                                                ; preds = %label_true0
  call void @neg_idx_except()
  br label %label_x_gtz3
label_x_gtz3:                                                ; preds = %label_true0, %label_x_ltz2
  %op31 = load i32*, i32** %op6
  %op32 = getelementptr i32, i32* %op31, i32 0
  store i32 1, i32* %op32
  %op33 = icmp slt i32 0, zeroinitializer
  %op34 = zext i1 %op33 to i32
  %op35 = add i32 %op34, zeroinitializer
  %op36 = icmp ne i32 %op35, zeroinitializer
  br i1 %op36, label %label_y_ltz4, label %label_y_gtz5
label_y_ltz4:                                                ; preds = %label_x_gtz3
  call void @neg_idx_except()
  br label %label_y_gtz5
label_y_gtz5:                                                ; preds = %label_x_gtz3, %label_y_ltz4
  %op37 = load i32*, i32** %op7
  %op38 = getelementptr i32, i32* %op37, i32 0
  store i32 0, i32* %op38
  %op39 = load i32, i32* %op4
  ret i32 %op39
label_x_ltz6:                                                ; preds = %label_false1
  call void @neg_idx_except()
  br label %label_x_gtz7
label_x_gtz7:                                                ; preds = %label_false1, %label_x_ltz6
  %op40 = load i32*, i32** %op6
  %op41 = getelementptr i32, i32* %op40, i32 0
  %op42 = load i32, i32* %op41
  %op43 = alloca i32
  store i32 %op42, i32* %op43
  %op44 = icmp slt i32 0, zeroinitializer
  %op45 = zext i1 %op44 to i32
  %op46 = add i32 %op45, zeroinitializer
  %op47 = icmp ne i32 %op46, zeroinitializer
  br i1 %op47, label %label_x_ltz8, label %label_x_gtz9
label_x_ltz8:                                                ; preds = %label_x_gtz7
  call void @neg_idx_except()
  br label %label_x_gtz9
label_x_gtz9:                                                ; preds = %label_x_gtz7, %label_x_ltz8
  %op48 = load i32*, i32** %op6
  %op49 = getelementptr i32, i32* %op48, i32 0
  %op50 = icmp slt i32 0, zeroinitializer
  %op51 = zext i1 %op50 to i32
  %op52 = add i32 %op51, zeroinitializer
  %op53 = icmp ne i32 %op52, zeroinitializer
  br i1 %op53, label %label_y_ltz10, label %label_y_gtz11
label_y_ltz10:                                                ; preds = %label_x_gtz9
  call void @neg_idx_except()
  br label %label_y_gtz11
label_y_gtz11:                                                ; preds = %label_x_gtz9, %label_y_ltz10
  %op54 = load i32*, i32** %op7
  %op55 = getelementptr i32, i32* %op54, i32 0
  %op56 = load i32, i32* %op55
  store i32 %op56, i32* %op49
  %op57 = icmp slt i32 0, zeroinitializer
  %op58 = zext i1 %op57 to i32
  %op59 = add i32 %op58, zeroinitializer
  %op60 = icmp ne i32 %op59, zeroinitializer
  br i1 %op60, label %label_y_ltz12, label %label_y_gtz13
label_y_ltz12:                                                ; preds = %label_y_gtz11
  call void @neg_idx_except()
  br label %label_y_gtz13
label_y_gtz13:                                                ; preds = %label_y_gtz11, %label_y_ltz12
  %op61 = load i32*, i32** %op7
  %op62 = getelementptr i32, i32* %op61, i32 0
  %op63 = load i32, i32* %op43
  %op64 = load i32, i32* %op4
  %op65 = load i32, i32* %op5
  %op66 = sdiv i32 %op64, %op65
  %op67 = icmp slt i32 0, zeroinitializer
  %op68 = zext i1 %op67 to i32
  %op69 = add i32 %op68, zeroinitializer
  %op70 = icmp ne i32 %op69, zeroinitializer
  br i1 %op70, label %label_y_ltz14, label %label_y_gtz15
label_y_ltz14:                                                ; preds = %label_y_gtz13
  call void @neg_idx_except()
  br label %label_y_gtz15
label_y_gtz15:                                                ; preds = %label_y_gtz13, %label_y_ltz14
  %op71 = load i32*, i32** %op7
  %op72 = getelementptr i32, i32* %op71, i32 0
  %op73 = load i32, i32* %op72
  %op74 = mul i32 %op66, %op73
  %op75 = sub i32 %op63, %op74
  store i32 %op75, i32* %op62
  %op76 = load i32, i32* %op26
  ret i32 %op76
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
