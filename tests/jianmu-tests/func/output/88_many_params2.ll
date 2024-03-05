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
  br label %label_condition0
label_condition0:                                                ; preds = %label_entry, %label_b_gtz4
  %op9 = phi i32 [ 0, %label_entry ], [ %op28, %label_b_gtz4 ]
  %op10 = icmp slt i32 %op9, 10
  %op11 = zext i1 %op10 to i32
  %op12 = icmp sgt i32 %op11, zeroinitializer
  br i1 %op12, label %label_loop1, label %label_ret2
label_loop1:                                                ; preds = %label_condition0
  %op13 = icmp slt i32 %arg0, zeroinitializer
  %op14 = zext i1 %op13 to i32
  %op15 = add i32 %op14, zeroinitializer
  %op16 = icmp slt i32 %op9, zeroinitializer
  %op17 = zext i1 %op16 to i32
  %op18 = add i32 %op17, %op15
  %op19 = icmp ne i32 %op18, zeroinitializer
  br i1 %op19, label %label_b_ltz3, label %label_b_gtz4
label_ret2:                                                ; preds = %label_condition0
  call void @putch(i32 10)
  %op20 = icmp slt i32 %arg2, zeroinitializer
  %op21 = zext i1 %op20 to i32
  %op22 = add i32 %op21, zeroinitializer
  %op23 = icmp ne i32 %op22, zeroinitializer
  br i1 %op23, label %label_d_ltz5, label %label_d_gtz6
label_b_ltz3:                                                ; preds = %label_loop1
  call void @neg_idx_except()
  br label %label_b_gtz4
label_b_gtz4:                                                ; preds = %label_loop1, %label_b_ltz3
  %op24 = mul i32 59, %arg0
  %op25 = add i32 %op24, %op9
  %op26 = getelementptr i32, i32* %arg1, i32 %op25
  %op27 = load i32, i32* %op26
  call void @putint(i32 %op27)
  %op28 = add i32 %op9, 1
  br label %label_condition0
label_d_ltz5:                                                ; preds = %label_ret2
  call void @neg_idx_except()
  br label %label_d_gtz6
label_d_gtz6:                                                ; preds = %label_ret2, %label_d_ltz5
  %op29 = getelementptr i32, i32* %arg3, i32 %arg2
  %op30 = load i32, i32* %op29
  call void @putint(i32 %op30)
  call void @putch(i32 10)
  br label %label_condition7
label_condition7:                                                ; preds = %label_d_gtz6, %label_g_gtz11
  %op31 = phi i32 [ %arg8, %label_d_gtz6 ], [ %op46, %label_g_gtz11 ]
  %op32 = phi i32 [ %arg7, %label_d_gtz6 ], [ %op47, %label_g_gtz11 ]
  %op33 = icmp slt i32 %op31, 10
  %op34 = zext i1 %op33 to i32
  %op35 = icmp sgt i32 %op34, zeroinitializer
  br i1 %op35, label %label_loop8, label %label_ret9
label_loop8:                                                ; preds = %label_condition7
  %op36 = icmp slt i32 %op31, zeroinitializer
  %op37 = zext i1 %op36 to i32
  %op38 = add i32 %op37, zeroinitializer
  %op39 = icmp ne i32 %op38, zeroinitializer
  br i1 %op39, label %label_g_ltz10, label %label_g_gtz11
label_ret9:                                                ; preds = %label_condition7
  %op40 = add i32 %arg4, %arg5
  ret i32 %op40
label_g_ltz10:                                                ; preds = %label_loop8
  call void @neg_idx_except()
  br label %label_g_gtz11
label_g_gtz11:                                                ; preds = %label_loop8, %label_g_ltz10
  %op41 = getelementptr i32, i32* %arg6, i32 %op31
  %op42 = mul i32 %op32, 128875
  %op43 = sdiv i32 %op42, 3724
  %op44 = mul i32 %op43, 3724
  %op45 = sub i32 %op42, %op44
  store i32 %op45, i32* %op41
  %op46 = add i32 %op31, 1
  %op47 = add i32 %op32, 7
  br label %label_condition7
}
define i32 @main() {
label_entry:
  %op0 = alloca [61 x [67 x i32]]
  %op1 = alloca [53 x [59 x i32]]
  %op2 = icmp slt i32 17, zeroinitializer
  %op3 = zext i1 %op2 to i32
  %op4 = add i32 %op3, zeroinitializer
  %op5 = icmp slt i32 1, zeroinitializer
  %op6 = zext i1 %op5 to i32
  %op7 = add i32 %op6, %op4
  %op8 = icmp ne i32 %op7, zeroinitializer
  br i1 %op8, label %label_a_ltz12, label %label_a_gtz13
label_a_ltz12:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_a_gtz13
label_a_gtz13:                                                ; preds = %label_entry, %label_a_ltz12
  %op9 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 17, i32 1
  store i32 6, i32* %op9
  %op10 = icmp slt i32 17, zeroinitializer
  %op11 = zext i1 %op10 to i32
  %op12 = add i32 %op11, zeroinitializer
  %op13 = icmp slt i32 3, zeroinitializer
  %op14 = zext i1 %op13 to i32
  %op15 = add i32 %op14, %op12
  %op16 = icmp ne i32 %op15, zeroinitializer
  br i1 %op16, label %label_a_ltz14, label %label_a_gtz15
label_a_ltz14:                                                ; preds = %label_a_gtz13
  call void @neg_idx_except()
  br label %label_a_gtz15
label_a_gtz15:                                                ; preds = %label_a_gtz13, %label_a_ltz14
  %op17 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 17, i32 3
  store i32 7, i32* %op17
  %op18 = icmp slt i32 17, zeroinitializer
  %op19 = zext i1 %op18 to i32
  %op20 = add i32 %op19, zeroinitializer
  %op21 = icmp slt i32 4, zeroinitializer
  %op22 = zext i1 %op21 to i32
  %op23 = add i32 %op22, %op20
  %op24 = icmp ne i32 %op23, zeroinitializer
  br i1 %op24, label %label_a_ltz16, label %label_a_gtz17
label_a_ltz16:                                                ; preds = %label_a_gtz15
  call void @neg_idx_except()
  br label %label_a_gtz17
label_a_gtz17:                                                ; preds = %label_a_gtz15, %label_a_ltz16
  %op25 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 17, i32 4
  store i32 4, i32* %op25
  %op26 = icmp slt i32 17, zeroinitializer
  %op27 = zext i1 %op26 to i32
  %op28 = add i32 %op27, zeroinitializer
  %op29 = icmp slt i32 7, zeroinitializer
  %op30 = zext i1 %op29 to i32
  %op31 = add i32 %op30, %op28
  %op32 = icmp ne i32 %op31, zeroinitializer
  br i1 %op32, label %label_a_ltz18, label %label_a_gtz19
label_a_ltz18:                                                ; preds = %label_a_gtz17
  call void @neg_idx_except()
  br label %label_a_gtz19
label_a_gtz19:                                                ; preds = %label_a_gtz17, %label_a_ltz18
  %op33 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 17, i32 7
  store i32 9, i32* %op33
  %op34 = icmp slt i32 17, zeroinitializer
  %op35 = zext i1 %op34 to i32
  %op36 = add i32 %op35, zeroinitializer
  %op37 = icmp slt i32 11, zeroinitializer
  %op38 = zext i1 %op37 to i32
  %op39 = add i32 %op38, %op36
  %op40 = icmp ne i32 %op39, zeroinitializer
  br i1 %op40, label %label_a_ltz20, label %label_a_gtz21
label_a_ltz20:                                                ; preds = %label_a_gtz19
  call void @neg_idx_except()
  br label %label_a_gtz21
label_a_gtz21:                                                ; preds = %label_a_gtz19, %label_a_ltz20
  %op41 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 17, i32 11
  store i32 11, i32* %op41
  %op42 = icmp slt i32 6, zeroinitializer
  %op43 = zext i1 %op42 to i32
  %op44 = add i32 %op43, zeroinitializer
  %op45 = icmp slt i32 1, zeroinitializer
  %op46 = zext i1 %op45 to i32
  %op47 = add i32 %op46, %op44
  %op48 = icmp ne i32 %op47, zeroinitializer
  br i1 %op48, label %label_b_ltz22, label %label_b_gtz23
label_b_ltz22:                                                ; preds = %label_a_gtz21
  call void @neg_idx_except()
  br label %label_b_gtz23
label_b_gtz23:                                                ; preds = %label_a_gtz21, %label_b_ltz22
  %op49 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 6, i32 1
  store i32 1, i32* %op49
  %op50 = icmp slt i32 6, zeroinitializer
  %op51 = zext i1 %op50 to i32
  %op52 = add i32 %op51, zeroinitializer
  %op53 = icmp slt i32 2, zeroinitializer
  %op54 = zext i1 %op53 to i32
  %op55 = add i32 %op54, %op52
  %op56 = icmp ne i32 %op55, zeroinitializer
  br i1 %op56, label %label_b_ltz24, label %label_b_gtz25
label_b_ltz24:                                                ; preds = %label_b_gtz23
  call void @neg_idx_except()
  br label %label_b_gtz25
label_b_gtz25:                                                ; preds = %label_b_gtz23, %label_b_ltz24
  %op57 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 6, i32 2
  store i32 2, i32* %op57
  %op58 = icmp slt i32 6, zeroinitializer
  %op59 = zext i1 %op58 to i32
  %op60 = add i32 %op59, zeroinitializer
  %op61 = icmp slt i32 3, zeroinitializer
  %op62 = zext i1 %op61 to i32
  %op63 = add i32 %op62, %op60
  %op64 = icmp ne i32 %op63, zeroinitializer
  br i1 %op64, label %label_b_ltz26, label %label_b_gtz27
label_b_ltz26:                                                ; preds = %label_b_gtz25
  call void @neg_idx_except()
  br label %label_b_gtz27
label_b_gtz27:                                                ; preds = %label_b_gtz25, %label_b_ltz26
  %op65 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 6, i32 3
  store i32 3, i32* %op65
  %op66 = icmp slt i32 6, zeroinitializer
  %op67 = zext i1 %op66 to i32
  %op68 = add i32 %op67, zeroinitializer
  %op69 = icmp slt i32 9, zeroinitializer
  %op70 = zext i1 %op69 to i32
  %op71 = add i32 %op70, %op68
  %op72 = icmp ne i32 %op71, zeroinitializer
  br i1 %op72, label %label_b_ltz28, label %label_b_gtz29
label_b_ltz28:                                                ; preds = %label_b_gtz27
  call void @neg_idx_except()
  br label %label_b_gtz29
label_b_gtz29:                                                ; preds = %label_b_gtz27, %label_b_ltz28
  %op73 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 6, i32 9
  store i32 9, i32* %op73
  %op74 = icmp slt i32 17, zeroinitializer
  %op75 = zext i1 %op74 to i32
  %op76 = add i32 %op75, zeroinitializer
  %op77 = icmp slt i32 1, zeroinitializer
  %op78 = zext i1 %op77 to i32
  %op79 = add i32 %op78, %op76
  %op80 = icmp ne i32 %op79, zeroinitializer
  br i1 %op80, label %label_a_ltz30, label %label_a_gtz31
label_a_ltz30:                                                ; preds = %label_b_gtz29
  call void @neg_idx_except()
  br label %label_a_gtz31
label_a_gtz31:                                                ; preds = %label_b_gtz29, %label_a_ltz30
  %op81 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 17, i32 1
  %op82 = load i32, i32* %op81
  %op83 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 0, i32 0
  %op84 = icmp slt i32 17, zeroinitializer
  %op85 = zext i1 %op84 to i32
  %op86 = add i32 %op85, zeroinitializer
  %op87 = icmp slt i32 3, zeroinitializer
  %op88 = zext i1 %op87 to i32
  %op89 = add i32 %op88, %op86
  %op90 = icmp ne i32 %op89, zeroinitializer
  br i1 %op90, label %label_a_ltz32, label %label_a_gtz33
label_a_ltz32:                                                ; preds = %label_a_gtz31
  call void @neg_idx_except()
  br label %label_a_gtz33
label_a_gtz33:                                                ; preds = %label_a_gtz31, %label_a_ltz32
  %op91 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 17, i32 3
  %op92 = load i32, i32* %op91
  %op93 = icmp slt i32 17, zeroinitializer
  %op94 = zext i1 %op93 to i32
  %op95 = add i32 %op94, zeroinitializer
  %op96 = icmp ne i32 %op95, zeroinitializer
  br i1 %op96, label %label_a_ltz34, label %label_a_gtz35
label_a_ltz34:                                                ; preds = %label_a_gtz33
  call void @neg_idx_except()
  br label %label_a_gtz35
label_a_gtz35:                                                ; preds = %label_a_gtz33, %label_a_ltz34
  %op97 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 17
  %op98 = getelementptr [67 x i32], [67 x i32]* %op97, i32 0, i32 0
  %op99 = icmp slt i32 6, zeroinitializer
  %op100 = zext i1 %op99 to i32
  %op101 = add i32 %op100, zeroinitializer
  %op102 = icmp slt i32 3, zeroinitializer
  %op103 = zext i1 %op102 to i32
  %op104 = add i32 %op103, %op101
  %op105 = icmp ne i32 %op104, zeroinitializer
  br i1 %op105, label %label_b_ltz36, label %label_b_gtz37
label_b_ltz36:                                                ; preds = %label_a_gtz35
  call void @neg_idx_except()
  br label %label_b_gtz37
label_b_gtz37:                                                ; preds = %label_a_gtz35, %label_b_ltz36
  %op106 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 6, i32 3
  %op107 = load i32, i32* %op106
  %op108 = icmp slt i32 6, zeroinitializer
  %op109 = zext i1 %op108 to i32
  %op110 = add i32 %op109, zeroinitializer
  %op111 = icmp slt i32 0, zeroinitializer
  %op112 = zext i1 %op111 to i32
  %op113 = add i32 %op112, %op110
  %op114 = icmp ne i32 %op113, zeroinitializer
  br i1 %op114, label %label_b_ltz38, label %label_b_gtz39
label_b_ltz38:                                                ; preds = %label_b_gtz37
  call void @neg_idx_except()
  br label %label_b_gtz39
label_b_gtz39:                                                ; preds = %label_b_gtz37, %label_b_ltz38
  %op115 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 6, i32 0
  %op116 = load i32, i32* %op115
  %op117 = icmp slt i32 6, zeroinitializer
  %op118 = zext i1 %op117 to i32
  %op119 = add i32 %op118, zeroinitializer
  %op120 = icmp ne i32 %op119, zeroinitializer
  br i1 %op120, label %label_b_ltz40, label %label_b_gtz41
label_b_ltz40:                                                ; preds = %label_b_gtz39
  call void @neg_idx_except()
  br label %label_b_gtz41
label_b_gtz41:                                                ; preds = %label_b_gtz39, %label_b_ltz40
  %op121 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 6
  %op122 = getelementptr [59 x i32], [59 x i32]* %op121, i32 0, i32 0
  %op123 = icmp slt i32 34, zeroinitializer
  %op124 = zext i1 %op123 to i32
  %op125 = add i32 %op124, zeroinitializer
  %op126 = icmp slt i32 4, zeroinitializer
  %op127 = zext i1 %op126 to i32
  %op128 = add i32 %op127, %op125
  %op129 = icmp ne i32 %op128, zeroinitializer
  br i1 %op129, label %label_b_ltz42, label %label_b_gtz43
label_b_ltz42:                                                ; preds = %label_b_gtz41
  call void @neg_idx_except()
  br label %label_b_gtz43
label_b_gtz43:                                                ; preds = %label_b_gtz41, %label_b_ltz42
  %op130 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 34, i32 4
  %op131 = load i32, i32* %op130
  %op132 = icmp slt i32 51, zeroinitializer
  %op133 = zext i1 %op132 to i32
  %op134 = add i32 %op133, zeroinitializer
  %op135 = icmp slt i32 18, zeroinitializer
  %op136 = zext i1 %op135 to i32
  %op137 = add i32 %op136, %op134
  %op138 = icmp ne i32 %op137, zeroinitializer
  br i1 %op138, label %label_b_ltz44, label %label_b_gtz45
label_b_ltz44:                                                ; preds = %label_b_gtz43
  call void @neg_idx_except()
  br label %label_b_gtz45
label_b_gtz45:                                                ; preds = %label_b_gtz43, %label_b_ltz44
  %op139 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 51, i32 18
  %op140 = load i32, i32* %op139
  %op141 = call i32 @func(i32 %op82, i32* %op83, i32 %op92, i32* %op98, i32 %op107, i32 %op116, i32* %op122, i32 %op131, i32 %op140)
  %op142 = mul i32 %op141, 3
  br label %label_condition46
label_condition46:                                                ; preds = %label_b_gtz45, %label_b_gtz50
  %op143 = phi i32 [ %op142, %label_b_gtz45 ], [ %op156, %label_b_gtz50 ]
  %op144 = icmp sge i32 %op143, 0
  %op145 = zext i1 %op144 to i32
  %op146 = icmp sgt i32 %op145, zeroinitializer
  br i1 %op146, label %label_loop47, label %label_ret48
label_loop47:                                                ; preds = %label_condition46
  %op147 = icmp slt i32 6, zeroinitializer
  %op148 = zext i1 %op147 to i32
  %op149 = add i32 %op148, zeroinitializer
  %op150 = icmp slt i32 %op143, zeroinitializer
  %op151 = zext i1 %op150 to i32
  %op152 = add i32 %op151, %op149
  %op153 = icmp ne i32 %op152, zeroinitializer
  br i1 %op153, label %label_b_ltz49, label %label_b_gtz50
label_ret48:                                                ; preds = %label_condition46
  call void @putch(i32 10)
  ret i32 0
label_b_ltz49:                                                ; preds = %label_loop47
  call void @neg_idx_except()
  br label %label_b_gtz50
label_b_gtz50:                                                ; preds = %label_loop47, %label_b_ltz49
  %op154 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 6, i32 %op143
  %op155 = load i32, i32* %op154
  call void @putint(i32 %op155)
  call void @putch(i32 32)
  %op156 = sub i32 %op143, 1
  br label %label_condition46
}
