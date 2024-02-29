; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/jianmu-tests/func/88_many_params2.sy"

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

define i32 @func(i32 %arg0, i32* %arg1, i32 %arg2, i32* %arg3, i32 %arg4, i32 %arg5, i32* %arg6, i32 %arg7, i32 %arg8) {
label_entry:
  %op9 = alloca i32
  store i32 %arg0, i32* %op9
  %op10 = alloca i32*
  store i32* %arg1, i32** %op10
  %op11 = alloca i32
  store i32 %arg2, i32* %op11
  %op12 = alloca i32*
  store i32* %arg3, i32** %op12
  %op13 = alloca i32
  store i32 %arg4, i32* %op13
  %op14 = alloca i32
  store i32 %arg5, i32* %op14
  %op15 = alloca i32*
  store i32* %arg6, i32** %op15
  %op16 = alloca i32
  store i32 %arg7, i32* %op16
  %op17 = alloca i32
  store i32 %arg8, i32* %op17
  %op18 = alloca i32
  store i32 0, i32* %op18
  br label %label_condition0
label_condition0:                                                ; preds = %label_entry, %label_b_gtz4
  %op19 = load i32, i32* %op18
  %op20 = add i32 %op19, 10
  %op21 = icmp slt i32 %op19, 10
  %op22 = zext i1 %op21 to i32
  %op23 = icmp sgt i32 %op22, zeroinitializer
  br i1 %op23, label %label_loop1, label %label_ret2
label_loop1:                                                ; preds = %label_condition0
  %op24 = load i32, i32* %op18
  %op25 = load i32, i32* %op9
  %op26 = icmp slt i32 %op24, zeroinitializer
  %op27 = zext i1 %op26 to i32
  %op28 = add i32 %op27, zeroinitializer
  %op29 = icmp slt i32 %op25, zeroinitializer
  %op30 = zext i1 %op29 to i32
  %op31 = add i32 %op30, %op28
  %op32 = icmp ne i32 %op31, zeroinitializer
  br i1 %op32, label %label_b_ltz3, label %label_b_gtz4
label_ret2:                                                ; preds = %label_condition0
  call void @putch(i32 10)
  %op33 = load i32, i32* %op11
  %op34 = icmp slt i32 %op33, zeroinitializer
  %op35 = zext i1 %op34 to i32
  %op36 = add i32 %op35, zeroinitializer
  %op37 = icmp ne i32 %op36, zeroinitializer
  br i1 %op37, label %label_d_ltz5, label %label_d_gtz6
label_b_ltz3:                                                ; preds = %label_loop1
  call void @neg_idx_except()
  br label %label_b_gtz4
label_b_gtz4:                                                ; preds = %label_loop1, %label_b_ltz3
  %op38 = load i32*, i32** %op10
  %op39 = getelementptr i32, i32* %op38, i32 %op24, i32 %op25
  %op40 = load i32, i32* %op39
  call void @putint(i32 %op40)
  %op41 = load i32, i32* %op18
  %op42 = add i32 %op41, 1
  store i32 %op42, i32* %op18
  br label %label_condition0
label_d_ltz5:                                                ; preds = %label_ret2
  call void @neg_idx_except()
  br label %label_d_gtz6
label_d_gtz6:                                                ; preds = %label_ret2, %label_d_ltz5
  %op43 = load i32*, i32** %op12
  %op44 = getelementptr i32, i32* %op43, i32 %op33
  %op45 = load i32, i32* %op44
  call void @putint(i32 %op45)
  call void @putch(i32 10)
  br label %label_condition7
label_condition7:                                                ; preds = %label_d_gtz6, %label_g_gtz11
  %op46 = load i32, i32* %op17
  %op47 = add i32 %op46, 10
  %op48 = icmp slt i32 %op46, 10
  %op49 = zext i1 %op48 to i32
  %op50 = icmp sgt i32 %op49, zeroinitializer
  br i1 %op50, label %label_loop8, label %label_ret9
label_loop8:                                                ; preds = %label_condition7
  %op51 = load i32, i32* %op17
  %op52 = icmp slt i32 %op51, zeroinitializer
  %op53 = zext i1 %op52 to i32
  %op54 = add i32 %op53, zeroinitializer
  %op55 = icmp ne i32 %op54, zeroinitializer
  br i1 %op55, label %label_g_ltz10, label %label_g_gtz11
label_ret9:                                                ; preds = %label_condition7
  %op56 = load i32, i32* %op13
  %op57 = load i32, i32* %op14
  %op58 = add i32 %op56, %op57
  ret i32 %op58
label_g_ltz10:                                                ; preds = %label_loop8
  call void @neg_idx_except()
  br label %label_g_gtz11
label_g_gtz11:                                                ; preds = %label_loop8, %label_g_ltz10
  %op59 = load i32*, i32** %op15
  %op60 = getelementptr i32, i32* %op59, i32 %op51
  %op61 = load i32, i32* %op16
  %op62 = mul i32 %op61, 128875
  %op63 = sdiv i32 %op62, 3724
  %op64 = mul i32 %op63, 3724
  %op65 = sub i32 %op62, %op64
  store i32 %op65, i32* %op60
  %op66 = load i32, i32* %op17
  %op67 = add i32 %op66, 1
  store i32 %op67, i32* %op17
  %op68 = load i32, i32* %op16
  %op69 = add i32 %op68, 7
  store i32 %op69, i32* %op16
  br label %label_condition7
}
define i32 @main() {
label_entry:
  %op0 = alloca [61 x [67 x i32]]
  store [61 x [67 x i32]] [[67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer, [67 x i32] zeroinitializer], [61 x [67 x i32]]* %op0
  %op1 = alloca [53 x [59 x i32]]
  store [53 x [59 x i32]] [[59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer, [59 x i32] zeroinitializer], [53 x [59 x i32]]* %op1
  %op2 = icmp slt i32 1, zeroinitializer
  %op3 = zext i1 %op2 to i32
  %op4 = add i32 %op3, zeroinitializer
  %op5 = icmp slt i32 17, zeroinitializer
  %op6 = zext i1 %op5 to i32
  %op7 = add i32 %op6, %op4
  %op8 = icmp ne i32 %op7, zeroinitializer
  br i1 %op8, label %label_a_ltz12, label %label_a_gtz13
label_a_ltz12:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_a_gtz13
label_a_gtz13:                                                ; preds = %label_entry, %label_a_ltz12
  %op9 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 1, i32 17
  store i32 6, i32* %op9
  %op10 = icmp slt i32 3, zeroinitializer
  %op11 = zext i1 %op10 to i32
  %op12 = add i32 %op11, zeroinitializer
  %op13 = icmp slt i32 17, zeroinitializer
  %op14 = zext i1 %op13 to i32
  %op15 = add i32 %op14, %op12
  %op16 = icmp ne i32 %op15, zeroinitializer
  br i1 %op16, label %label_a_ltz14, label %label_a_gtz15
label_a_ltz14:                                                ; preds = %label_a_gtz13
  call void @neg_idx_except()
  br label %label_a_gtz15
label_a_gtz15:                                                ; preds = %label_a_gtz13, %label_a_ltz14
  %op17 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 3, i32 17
  store i32 7, i32* %op17
  %op18 = icmp slt i32 4, zeroinitializer
  %op19 = zext i1 %op18 to i32
  %op20 = add i32 %op19, zeroinitializer
  %op21 = icmp slt i32 17, zeroinitializer
  %op22 = zext i1 %op21 to i32
  %op23 = add i32 %op22, %op20
  %op24 = icmp ne i32 %op23, zeroinitializer
  br i1 %op24, label %label_a_ltz16, label %label_a_gtz17
label_a_ltz16:                                                ; preds = %label_a_gtz15
  call void @neg_idx_except()
  br label %label_a_gtz17
label_a_gtz17:                                                ; preds = %label_a_gtz15, %label_a_ltz16
  %op25 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 4, i32 17
  store i32 4, i32* %op25
  %op26 = icmp slt i32 7, zeroinitializer
  %op27 = zext i1 %op26 to i32
  %op28 = add i32 %op27, zeroinitializer
  %op29 = icmp slt i32 17, zeroinitializer
  %op30 = zext i1 %op29 to i32
  %op31 = add i32 %op30, %op28
  %op32 = icmp ne i32 %op31, zeroinitializer
  br i1 %op32, label %label_a_ltz18, label %label_a_gtz19
label_a_ltz18:                                                ; preds = %label_a_gtz17
  call void @neg_idx_except()
  br label %label_a_gtz19
label_a_gtz19:                                                ; preds = %label_a_gtz17, %label_a_ltz18
  %op33 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 7, i32 17
  store i32 9, i32* %op33
  %op34 = icmp slt i32 11, zeroinitializer
  %op35 = zext i1 %op34 to i32
  %op36 = add i32 %op35, zeroinitializer
  %op37 = icmp slt i32 17, zeroinitializer
  %op38 = zext i1 %op37 to i32
  %op39 = add i32 %op38, %op36
  %op40 = icmp ne i32 %op39, zeroinitializer
  br i1 %op40, label %label_a_ltz20, label %label_a_gtz21
label_a_ltz20:                                                ; preds = %label_a_gtz19
  call void @neg_idx_except()
  br label %label_a_gtz21
label_a_gtz21:                                                ; preds = %label_a_gtz19, %label_a_ltz20
  %op41 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 11, i32 17
  store i32 11, i32* %op41
  %op42 = icmp slt i32 1, zeroinitializer
  %op43 = zext i1 %op42 to i32
  %op44 = add i32 %op43, zeroinitializer
  %op45 = icmp slt i32 6, zeroinitializer
  %op46 = zext i1 %op45 to i32
  %op47 = add i32 %op46, %op44
  %op48 = icmp ne i32 %op47, zeroinitializer
  br i1 %op48, label %label_b_ltz22, label %label_b_gtz23
label_b_ltz22:                                                ; preds = %label_a_gtz21
  call void @neg_idx_except()
  br label %label_b_gtz23
label_b_gtz23:                                                ; preds = %label_a_gtz21, %label_b_ltz22
  %op49 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 1, i32 6
  store i32 1, i32* %op49
  %op50 = icmp slt i32 2, zeroinitializer
  %op51 = zext i1 %op50 to i32
  %op52 = add i32 %op51, zeroinitializer
  %op53 = icmp slt i32 6, zeroinitializer
  %op54 = zext i1 %op53 to i32
  %op55 = add i32 %op54, %op52
  %op56 = icmp ne i32 %op55, zeroinitializer
  br i1 %op56, label %label_b_ltz24, label %label_b_gtz25
label_b_ltz24:                                                ; preds = %label_b_gtz23
  call void @neg_idx_except()
  br label %label_b_gtz25
label_b_gtz25:                                                ; preds = %label_b_gtz23, %label_b_ltz24
  %op57 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 2, i32 6
  store i32 2, i32* %op57
  %op58 = icmp slt i32 3, zeroinitializer
  %op59 = zext i1 %op58 to i32
  %op60 = add i32 %op59, zeroinitializer
  %op61 = icmp slt i32 6, zeroinitializer
  %op62 = zext i1 %op61 to i32
  %op63 = add i32 %op62, %op60
  %op64 = icmp ne i32 %op63, zeroinitializer
  br i1 %op64, label %label_b_ltz26, label %label_b_gtz27
label_b_ltz26:                                                ; preds = %label_b_gtz25
  call void @neg_idx_except()
  br label %label_b_gtz27
label_b_gtz27:                                                ; preds = %label_b_gtz25, %label_b_ltz26
  %op65 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 3, i32 6
  store i32 3, i32* %op65
  %op66 = icmp slt i32 9, zeroinitializer
  %op67 = zext i1 %op66 to i32
  %op68 = add i32 %op67, zeroinitializer
  %op69 = icmp slt i32 6, zeroinitializer
  %op70 = zext i1 %op69 to i32
  %op71 = add i32 %op70, %op68
  %op72 = icmp ne i32 %op71, zeroinitializer
  br i1 %op72, label %label_b_ltz28, label %label_b_gtz29
label_b_ltz28:                                                ; preds = %label_b_gtz27
  call void @neg_idx_except()
  br label %label_b_gtz29
label_b_gtz29:                                                ; preds = %label_b_gtz27, %label_b_ltz28
  %op73 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 9, i32 6
  store i32 9, i32* %op73
  %op74 = alloca i32
  %op75 = icmp slt i32 1, zeroinitializer
  %op76 = zext i1 %op75 to i32
  %op77 = add i32 %op76, zeroinitializer
  %op78 = icmp slt i32 17, zeroinitializer
  %op79 = zext i1 %op78 to i32
  %op80 = add i32 %op79, %op77
  %op81 = icmp ne i32 %op80, zeroinitializer
  br i1 %op81, label %label_a_ltz30, label %label_a_gtz31
label_a_ltz30:                                                ; preds = %label_b_gtz29
  call void @neg_idx_except()
  br label %label_a_gtz31
label_a_gtz31:                                                ; preds = %label_b_gtz29, %label_a_ltz30
  %op82 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 1, i32 17
  %op83 = load i32, i32* %op82
  %op84 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 0, i32 0
  %op85 = icmp slt i32 3, zeroinitializer
  %op86 = zext i1 %op85 to i32
  %op87 = add i32 %op86, zeroinitializer
  %op88 = icmp slt i32 17, zeroinitializer
  %op89 = zext i1 %op88 to i32
  %op90 = add i32 %op89, %op87
  %op91 = icmp ne i32 %op90, zeroinitializer
  br i1 %op91, label %label_a_ltz32, label %label_a_gtz33
label_a_ltz32:                                                ; preds = %label_a_gtz31
  call void @neg_idx_except()
  br label %label_a_gtz33
label_a_gtz33:                                                ; preds = %label_a_gtz31, %label_a_ltz32
  %op92 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 3, i32 17
  %op93 = load i32, i32* %op92
  %op94 = icmp slt i32 17, zeroinitializer
  %op95 = zext i1 %op94 to i32
  %op96 = add i32 %op95, zeroinitializer
  %op97 = icmp ne i32 %op96, zeroinitializer
  br i1 %op97, label %label_a_ltz34, label %label_a_gtz35
label_a_ltz34:                                                ; preds = %label_a_gtz33
  call void @neg_idx_except()
  br label %label_a_gtz35
label_a_gtz35:                                                ; preds = %label_a_gtz33, %label_a_ltz34
  %op98 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 17
  %op99 = getelementptr [67 x i32], [67 x i32]* %op98, i32 0, i32 0
  %op100 = icmp slt i32 3, zeroinitializer
  %op101 = zext i1 %op100 to i32
  %op102 = add i32 %op101, zeroinitializer
  %op103 = icmp slt i32 6, zeroinitializer
  %op104 = zext i1 %op103 to i32
  %op105 = add i32 %op104, %op102
  %op106 = icmp ne i32 %op105, zeroinitializer
  br i1 %op106, label %label_b_ltz36, label %label_b_gtz37
label_b_ltz36:                                                ; preds = %label_a_gtz35
  call void @neg_idx_except()
  br label %label_b_gtz37
label_b_gtz37:                                                ; preds = %label_a_gtz35, %label_b_ltz36
  %op107 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 3, i32 6
  %op108 = load i32, i32* %op107
  %op109 = icmp slt i32 0, zeroinitializer
  %op110 = zext i1 %op109 to i32
  %op111 = add i32 %op110, zeroinitializer
  %op112 = icmp slt i32 6, zeroinitializer
  %op113 = zext i1 %op112 to i32
  %op114 = add i32 %op113, %op111
  %op115 = icmp ne i32 %op114, zeroinitializer
  br i1 %op115, label %label_b_ltz38, label %label_b_gtz39
label_b_ltz38:                                                ; preds = %label_b_gtz37
  call void @neg_idx_except()
  br label %label_b_gtz39
label_b_gtz39:                                                ; preds = %label_b_gtz37, %label_b_ltz38
  %op116 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 0, i32 6
  %op117 = load i32, i32* %op116
  %op118 = icmp slt i32 6, zeroinitializer
  %op119 = zext i1 %op118 to i32
  %op120 = add i32 %op119, zeroinitializer
  %op121 = icmp ne i32 %op120, zeroinitializer
  br i1 %op121, label %label_b_ltz40, label %label_b_gtz41
label_b_ltz40:                                                ; preds = %label_b_gtz39
  call void @neg_idx_except()
  br label %label_b_gtz41
label_b_gtz41:                                                ; preds = %label_b_gtz39, %label_b_ltz40
  %op122 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 6
  %op123 = getelementptr [59 x i32], [59 x i32]* %op122, i32 0, i32 0
  %op124 = icmp slt i32 4, zeroinitializer
  %op125 = zext i1 %op124 to i32
  %op126 = add i32 %op125, zeroinitializer
  %op127 = icmp slt i32 34, zeroinitializer
  %op128 = zext i1 %op127 to i32
  %op129 = add i32 %op128, %op126
  %op130 = icmp ne i32 %op129, zeroinitializer
  br i1 %op130, label %label_b_ltz42, label %label_b_gtz43
label_b_ltz42:                                                ; preds = %label_b_gtz41
  call void @neg_idx_except()
  br label %label_b_gtz43
label_b_gtz43:                                                ; preds = %label_b_gtz41, %label_b_ltz42
  %op131 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 4, i32 34
  %op132 = load i32, i32* %op131
  %op133 = icmp slt i32 18, zeroinitializer
  %op134 = zext i1 %op133 to i32
  %op135 = add i32 %op134, zeroinitializer
  %op136 = icmp slt i32 51, zeroinitializer
  %op137 = zext i1 %op136 to i32
  %op138 = add i32 %op137, %op135
  %op139 = icmp ne i32 %op138, zeroinitializer
  br i1 %op139, label %label_b_ltz44, label %label_b_gtz45
label_b_ltz44:                                                ; preds = %label_b_gtz43
  call void @neg_idx_except()
  br label %label_b_gtz45
label_b_gtz45:                                                ; preds = %label_b_gtz43, %label_b_ltz44
  %op140 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 18, i32 51
  %op141 = load i32, i32* %op140
  %op142 = call i32 @func(i32 %op83, i32* %op84, i32 %op93, i32* %op99, i32 %op108, i32 %op117, i32* %op123, i32 %op132, i32 %op141)
  %op143 = mul i32 %op142, 3
  store i32 %op143, i32* %op74
  br label %label_condition46
label_condition46:                                                ; preds = %label_b_gtz45, %label_b_gtz50
  %op144 = load i32, i32* %op74
  %op145 = add i32 %op144, 0
  %op146 = icmp sge i32 %op144, 0
  %op147 = zext i1 %op146 to i32
  %op148 = icmp sgt i32 %op147, zeroinitializer
  br i1 %op148, label %label_loop47, label %label_ret48
label_loop47:                                                ; preds = %label_condition46
  %op149 = load i32, i32* %op74
  %op150 = icmp slt i32 %op149, zeroinitializer
  %op151 = zext i1 %op150 to i32
  %op152 = add i32 %op151, zeroinitializer
  %op153 = icmp slt i32 6, zeroinitializer
  %op154 = zext i1 %op153 to i32
  %op155 = add i32 %op154, %op152
  %op156 = icmp ne i32 %op155, zeroinitializer
  br i1 %op156, label %label_b_ltz49, label %label_b_gtz50
label_ret48:                                                ; preds = %label_condition46
  call void @putch(i32 10)
  ret i32 0
label_b_ltz49:                                                ; preds = %label_loop47
  call void @neg_idx_except()
  br label %label_b_gtz50
label_b_gtz50:                                                ; preds = %label_loop47, %label_b_ltz49
  %op157 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 %op149, i32 6
  %op158 = load i32, i32* %op157
  call void @putint(i32 %op158)
  call void @putch(i32 32)
  %op159 = load i32, i32* %op74
  %op160 = sub i32 %op159, 1
  store i32 %op160, i32* %op74
  br label %label_condition46
}
