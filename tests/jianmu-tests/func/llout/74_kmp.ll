; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/jianmu-tests/func/74_kmp.sy"

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

define void @get_next(i32* %arg0, i32* %arg1) {
label_entry:
  %op2 = alloca i32*
  store i32* %arg0, i32** %op2
  %op3 = alloca i32*
  store i32* %arg1, i32** %op3
  %op4 = icmp slt i32 0, zeroinitializer
  %op5 = zext i1 %op4 to i32
  %op6 = add i32 %op5, zeroinitializer
  %op7 = icmp ne i32 %op6, zeroinitializer
  br i1 %op7, label %label_next_ltz0, label %label_next_gtz1
label_next_ltz0:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_next_gtz1
label_next_gtz1:                                                ; preds = %label_entry, %label_next_ltz0
  %op8 = load i32*, i32** %op3
  %op9 = getelementptr i32, i32* %op8, i32 0
  store i32 -1, i32* %op9
  %op10 = alloca i32
  store i32 0, i32* %op10
  %op11 = alloca i32
  store i32 -1, i32* %op11
  br label %label_condition2
label_condition2:                                                ; preds = %label_next_gtz1, %label_ret20
  %op12 = load i32, i32* %op10
  %op13 = icmp slt i32 %op12, zeroinitializer
  %op14 = zext i1 %op13 to i32
  %op15 = add i32 %op14, zeroinitializer
  %op16 = icmp ne i32 %op15, zeroinitializer
  br i1 %op16, label %label_str_ltz5, label %label_str_gtz6
label_loop3:                                                ; preds = %label_str_gtz6
  %op17 = load i32, i32* %op11
  %op18 = add i32 %op17, -1
  %op19 = icmp eq i32 %op17, -1
  %op20 = zext i1 %op19 to i32
  %op21 = icmp sge i32 %op20, zeroinitializer
  br i1 %op21, label %label_true7, label %label_false8
label_ret4:                                                ; preds = %label_str_gtz6
  ret void
label_str_ltz5:                                                ; preds = %label_condition2
  call void @neg_idx_except()
  br label %label_str_gtz6
label_str_gtz6:                                                ; preds = %label_condition2, %label_str_ltz5
  %op22 = load i32*, i32** %op2
  %op23 = getelementptr i32, i32* %op22, i32 %op12
  %op24 = load i32, i32* %op23
  %op25 = icmp sgt i32 %op24, zeroinitializer
  br i1 %op25, label %label_loop3, label %label_ret4
label_true7:                                                ; preds = %label_loop3
  %op26 = icmp sgt i32 1, zeroinitializer
  br label %label_ret9
label_false8:                                                ; preds = %label_loop3
  %op27 = load i32, i32* %op10
  %op28 = icmp slt i32 %op27, zeroinitializer
  %op29 = zext i1 %op28 to i32
  %op30 = add i32 %op29, zeroinitializer
  %op31 = icmp ne i32 %op30, zeroinitializer
  br i1 %op31, label %label_str_ltz10, label %label_str_gtz11
label_ret9:                                                ; preds = %label_str_gtz13, %label_true7
  %op32 = phi i1 [ %op26, %label_true7 ], [ %op49, %label_str_gtz13 ]
  %op33 = zext i1 %op32 to i32
  %op34 = icmp sgt i32 %op33, zeroinitializer
  br i1 %op34, label %label_true14, label %label_false15
label_str_ltz10:                                                ; preds = %label_false8
  call void @neg_idx_except()
  br label %label_str_gtz11
label_str_gtz11:                                                ; preds = %label_false8, %label_str_ltz10
  %op35 = load i32*, i32** %op2
  %op36 = getelementptr i32, i32* %op35, i32 %op27
  %op37 = load i32, i32* %op36
  %op38 = load i32, i32* %op11
  %op39 = icmp slt i32 %op38, zeroinitializer
  %op40 = zext i1 %op39 to i32
  %op41 = add i32 %op40, zeroinitializer
  %op42 = icmp ne i32 %op41, zeroinitializer
  br i1 %op42, label %label_str_ltz12, label %label_str_gtz13
label_str_ltz12:                                                ; preds = %label_str_gtz11
  call void @neg_idx_except()
  br label %label_str_gtz13
label_str_gtz13:                                                ; preds = %label_str_gtz11, %label_str_ltz12
  %op43 = load i32*, i32** %op2
  %op44 = getelementptr i32, i32* %op43, i32 %op38
  %op45 = load i32, i32* %op44
  %op46 = add i32 %op37, %op45
  %op47 = icmp eq i32 %op37, %op45
  %op48 = zext i1 %op47 to i32
  %op49 = icmp sgt i32 %op48, zeroinitializer
  br label %label_ret9
label_true14:                                                ; preds = %label_ret9
  %op50 = load i32, i32* %op11
  %op51 = add i32 %op50, 1
  store i32 %op51, i32* %op11
  %op52 = load i32, i32* %op10
  %op53 = add i32 %op52, 1
  store i32 %op53, i32* %op10
  %op54 = load i32, i32* %op10
  %op55 = icmp slt i32 %op54, zeroinitializer
  %op56 = zext i1 %op55 to i32
  %op57 = add i32 %op56, zeroinitializer
  %op58 = icmp ne i32 %op57, zeroinitializer
  br i1 %op58, label %label_next_ltz16, label %label_next_gtz17
label_false15:                                                ; preds = %label_ret9
  %op59 = load i32, i32* %op11
  %op60 = icmp slt i32 %op59, zeroinitializer
  %op61 = zext i1 %op60 to i32
  %op62 = add i32 %op61, zeroinitializer
  %op63 = icmp ne i32 %op62, zeroinitializer
  br i1 %op63, label %label_next_ltz18, label %label_next_gtz19
label_next_ltz16:                                                ; preds = %label_true14
  call void @neg_idx_except()
  br label %label_next_gtz17
label_next_gtz17:                                                ; preds = %label_true14, %label_next_ltz16
  %op64 = load i32*, i32** %op3
  %op65 = getelementptr i32, i32* %op64, i32 %op54
  %op66 = load i32, i32* %op11
  store i32 %op66, i32* %op65
  br label %label_ret20
label_next_ltz18:                                                ; preds = %label_false15
  call void @neg_idx_except()
  br label %label_next_gtz19
label_next_gtz19:                                                ; preds = %label_false15, %label_next_ltz18
  %op67 = load i32*, i32** %op3
  %op68 = getelementptr i32, i32* %op67, i32 %op59
  %op69 = load i32, i32* %op68
  store i32 %op69, i32* %op11
  br label %label_ret20
label_ret20:                                                ; preds = %label_next_gtz17, %label_next_gtz19
  br label %label_condition2
}
define i32 @KMP(i32* %arg0, i32* %arg1) {
label_entry:
  %op2 = alloca i32*
  store i32* %arg0, i32** %op2
  %op3 = alloca i32*
  store i32* %arg1, i32** %op3
  %op4 = alloca [4096 x i32]
  %op5 = load i32*, i32** %op2
  %op6 = getelementptr [4096 x i32], [4096 x i32]* %op4, i32 0, i32 0
  call void @get_next(i32* %op5, i32* %op6)
  %op7 = alloca i32
  store i32 0, i32* %op7
  %op8 = alloca i32
  store i32 0, i32* %op8
  br label %label_condition21
label_condition21:                                                ; preds = %label_entry, %label_ret40
  %op9 = load i32, i32* %op8
  %op10 = icmp slt i32 %op9, zeroinitializer
  %op11 = zext i1 %op10 to i32
  %op12 = add i32 %op11, zeroinitializer
  %op13 = icmp ne i32 %op12, zeroinitializer
  br i1 %op13, label %label_src_ltz24, label %label_src_gtz25
label_loop22:                                                ; preds = %label_src_gtz25
  %op14 = load i32, i32* %op7
  %op15 = icmp slt i32 %op14, zeroinitializer
  %op16 = zext i1 %op15 to i32
  %op17 = add i32 %op16, zeroinitializer
  %op18 = icmp ne i32 %op17, zeroinitializer
  br i1 %op18, label %label_dst_ltz26, label %label_dst_gtz27
label_ret23:                                                ; preds = %label_src_gtz25
  ret i32 -1
label_src_ltz24:                                                ; preds = %label_condition21
  call void @neg_idx_except()
  br label %label_src_gtz25
label_src_gtz25:                                                ; preds = %label_condition21, %label_src_ltz24
  %op19 = load i32*, i32** %op3
  %op20 = getelementptr i32, i32* %op19, i32 %op9
  %op21 = load i32, i32* %op20
  %op22 = icmp sgt i32 %op21, zeroinitializer
  br i1 %op22, label %label_loop22, label %label_ret23
label_dst_ltz26:                                                ; preds = %label_loop22
  call void @neg_idx_except()
  br label %label_dst_gtz27
label_dst_gtz27:                                                ; preds = %label_loop22, %label_dst_ltz26
  %op23 = load i32*, i32** %op2
  %op24 = getelementptr i32, i32* %op23, i32 %op14
  %op25 = load i32, i32* %op24
  %op26 = load i32, i32* %op8
  %op27 = icmp slt i32 %op26, zeroinitializer
  %op28 = zext i1 %op27 to i32
  %op29 = add i32 %op28, zeroinitializer
  %op30 = icmp ne i32 %op29, zeroinitializer
  br i1 %op30, label %label_src_ltz28, label %label_src_gtz29
label_src_ltz28:                                                ; preds = %label_dst_gtz27
  call void @neg_idx_except()
  br label %label_src_gtz29
label_src_gtz29:                                                ; preds = %label_dst_gtz27, %label_src_ltz28
  %op31 = load i32*, i32** %op3
  %op32 = getelementptr i32, i32* %op31, i32 %op26
  %op33 = load i32, i32* %op32
  %op34 = add i32 %op25, %op33
  %op35 = icmp eq i32 %op25, %op33
  %op36 = zext i1 %op35 to i32
  %op37 = icmp sgt i32 %op36, zeroinitializer
  br i1 %op37, label %label_true30, label %label_false31
label_true30:                                                ; preds = %label_src_gtz29
  %op38 = load i32, i32* %op7
  %op39 = add i32 %op38, 1
  store i32 %op39, i32* %op7
  %op40 = load i32, i32* %op8
  %op41 = add i32 %op40, 1
  store i32 %op41, i32* %op8
  %op42 = load i32, i32* %op7
  %op43 = icmp slt i32 %op42, zeroinitializer
  %op44 = zext i1 %op43 to i32
  %op45 = add i32 %op44, zeroinitializer
  %op46 = icmp ne i32 %op45, zeroinitializer
  br i1 %op46, label %label_dst_ltz32, label %label_dst_gtz33
label_false31:                                                ; preds = %label_src_gtz29
  %op47 = load i32, i32* %op7
  %op48 = icmp slt i32 %op47, zeroinitializer
  %op49 = zext i1 %op48 to i32
  %op50 = add i32 %op49, zeroinitializer
  %op51 = icmp ne i32 %op50, zeroinitializer
  br i1 %op51, label %label_next_ltz36, label %label_next_gtz37
label_dst_ltz32:                                                ; preds = %label_true30
  call void @neg_idx_except()
  br label %label_dst_gtz33
label_dst_gtz33:                                                ; preds = %label_true30, %label_dst_ltz32
  %op52 = load i32*, i32** %op2
  %op53 = getelementptr i32, i32* %op52, i32 %op42
  %op54 = load i32, i32* %op53
  %op55 = icmp sle i32 %op54, zeroinitializer
  %op56 = zext i1 %op55 to i32
  %op57 = icmp sgt i32 %op56, zeroinitializer
  br i1 %op57, label %label_true34, label %label_ret35
label_true34:                                                ; preds = %label_dst_gtz33
  %op58 = load i32, i32* %op8
  ret i32 %op58
label_ret35:                                                ; preds = %label_dst_gtz33
  br label %label_ret40
label_next_ltz36:                                                ; preds = %label_false31
  call void @neg_idx_except()
  br label %label_next_gtz37
label_next_gtz37:                                                ; preds = %label_false31, %label_next_ltz36
  %op59 = getelementptr [4096 x i32], [4096 x i32]* %op4, i32 0, i32 %op47
  %op60 = load i32, i32* %op59
  store i32 %op60, i32* %op7
  %op61 = load i32, i32* %op7
  %op62 = add i32 %op61, -1
  %op63 = icmp eq i32 %op61, -1
  %op64 = zext i1 %op63 to i32
  %op65 = icmp sgt i32 %op64, zeroinitializer
  br i1 %op65, label %label_true38, label %label_ret39
label_true38:                                                ; preds = %label_next_gtz37
  %op66 = load i32, i32* %op7
  %op67 = add i32 %op66, 1
  store i32 %op67, i32* %op7
  %op68 = load i32, i32* %op8
  %op69 = add i32 %op68, 1
  store i32 %op69, i32* %op8
  br label %label_ret39
label_ret39:                                                ; preds = %label_next_gtz37, %label_true38
  br label %label_ret40
label_ret40:                                                ; preds = %label_ret35, %label_ret39
  br label %label_condition21
}
define i32 @read_str(i32* %arg0) {
label_entry:
  %op1 = alloca i32*
  store i32* %arg0, i32** %op1
  %op2 = alloca i32
  store i32 0, i32* %op2
  br label %label_condition41
label_condition41:                                                ; preds = %label_entry, %label_ret49
  %op3 = icmp sgt i32 1, zeroinitializer
  br i1 %op3, label %label_loop42, label %label_ret43
label_loop42:                                                ; preds = %label_condition41
  %op4 = load i32, i32* %op2
  %op5 = icmp slt i32 %op4, zeroinitializer
  %op6 = zext i1 %op5 to i32
  %op7 = add i32 %op6, zeroinitializer
  %op8 = icmp ne i32 %op7, zeroinitializer
  br i1 %op8, label %label_buf_ltz44, label %label_buf_gtz45
label_ret43:                                                ; preds = %label_condition41, %label_true48
  %op9 = load i32, i32* %op2
  %op10 = icmp slt i32 %op9, zeroinitializer
  %op11 = zext i1 %op10 to i32
  %op12 = add i32 %op11, zeroinitializer
  %op13 = icmp ne i32 %op12, zeroinitializer
  br i1 %op13, label %label_buf_ltz50, label %label_buf_gtz51
label_buf_ltz44:                                                ; preds = %label_loop42
  call void @neg_idx_except()
  br label %label_buf_gtz45
label_buf_gtz45:                                                ; preds = %label_loop42, %label_buf_ltz44
  %op14 = load i32*, i32** %op1
  %op15 = getelementptr i32, i32* %op14, i32 %op4
  %op16 = call i32 @getch()
  store i32 %op16, i32* %op15
  %op17 = load i32, i32* %op2
  %op18 = icmp slt i32 %op17, zeroinitializer
  %op19 = zext i1 %op18 to i32
  %op20 = add i32 %op19, zeroinitializer
  %op21 = icmp ne i32 %op20, zeroinitializer
  br i1 %op21, label %label_buf_ltz46, label %label_buf_gtz47
label_buf_ltz46:                                                ; preds = %label_buf_gtz45
  call void @neg_idx_except()
  br label %label_buf_gtz47
label_buf_gtz47:                                                ; preds = %label_buf_gtz45, %label_buf_ltz46
  %op22 = load i32*, i32** %op1
  %op23 = getelementptr i32, i32* %op22, i32 %op17
  %op24 = load i32, i32* %op23
  %op25 = add i32 %op24, 10
  %op26 = icmp eq i32 %op24, 10
  %op27 = zext i1 %op26 to i32
  %op28 = icmp sgt i32 %op27, zeroinitializer
  br i1 %op28, label %label_true48, label %label_ret49
label_true48:                                                ; preds = %label_buf_gtz47
  br label %label_ret43
label_ret49:                                                ; preds = %label_buf_gtz47
  %op29 = load i32, i32* %op2
  %op30 = add i32 %op29, 1
  store i32 %op30, i32* %op2
  br label %label_condition41
label_buf_ltz50:                                                ; preds = %label_ret43
  call void @neg_idx_except()
  br label %label_buf_gtz51
label_buf_gtz51:                                                ; preds = %label_ret43, %label_buf_ltz50
  %op31 = load i32*, i32** %op1
  %op32 = getelementptr i32, i32* %op31, i32 %op9
  store i32 0, i32* %op32
  %op33 = load i32, i32* %op2
  ret i32 %op33
}
define i32 @main() {
label_entry:
  %op0 = alloca [4096 x i32]
  %op1 = alloca [4096 x i32]
  %op2 = getelementptr [4096 x i32], [4096 x i32]* %op0, i32 0, i32 0
  %op3 = call i32 @read_str(i32* %op2)
  %op4 = getelementptr [4096 x i32], [4096 x i32]* %op1, i32 0, i32 0
  %op5 = call i32 @read_str(i32* %op4)
  %op6 = getelementptr [4096 x i32], [4096 x i32]* %op0, i32 0, i32 0
  %op7 = getelementptr [4096 x i32], [4096 x i32]* %op1, i32 0, i32 0
  %op8 = call i32 @KMP(i32* %op6, i32* %op7)
  call void @putint(i32 %op8)
  call void @putch(i32 10)
  ret i32 0
}
