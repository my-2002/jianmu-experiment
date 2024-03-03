; ModuleID = 'sysy'
source_filename = "/home/my2002/compiler_principles/lab5/jianmu-experiment/tests/jianmu-tests/func/74_kmp.sy"

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
  %op18 = icmp eq i32 %op17, -1
  %op19 = zext i1 %op18 to i32
  %op20 = icmp sgt i32 %op19, zeroinitializer
  br i1 %op20, label %label_true7, label %label_false8
label_ret4:                                                ; preds = %label_str_gtz6
  ret void
label_str_ltz5:                                                ; preds = %label_condition2
  call void @neg_idx_except()
  br label %label_str_gtz6
label_str_gtz6:                                                ; preds = %label_condition2, %label_str_ltz5
  %op21 = load i32*, i32** %op2
  %op22 = getelementptr i32, i32* %op21, i32 %op12
  %op23 = load i32, i32* %op22
  %op24 = icmp sgt i32 %op23, zeroinitializer
  br i1 %op24, label %label_loop3, label %label_ret4
label_true7:                                                ; preds = %label_loop3
  %op25 = icmp sgt i32 1, zeroinitializer
  br label %label_ret9
label_false8:                                                ; preds = %label_loop3
  %op26 = load i32, i32* %op10
  %op27 = icmp slt i32 %op26, zeroinitializer
  %op28 = zext i1 %op27 to i32
  %op29 = add i32 %op28, zeroinitializer
  %op30 = icmp ne i32 %op29, zeroinitializer
  br i1 %op30, label %label_str_ltz10, label %label_str_gtz11
label_ret9:                                                ; preds = %label_str_gtz13, %label_true7
  %op31 = phi i1 [ %op25, %label_true7 ], [ %op47, %label_str_gtz13 ]
  %op32 = zext i1 %op31 to i32
  %op33 = icmp sgt i32 %op32, zeroinitializer
  br i1 %op33, label %label_true14, label %label_false15
label_str_ltz10:                                                ; preds = %label_false8
  call void @neg_idx_except()
  br label %label_str_gtz11
label_str_gtz11:                                                ; preds = %label_false8, %label_str_ltz10
  %op34 = load i32*, i32** %op2
  %op35 = getelementptr i32, i32* %op34, i32 %op26
  %op36 = load i32, i32* %op35
  %op37 = load i32, i32* %op11
  %op38 = icmp slt i32 %op37, zeroinitializer
  %op39 = zext i1 %op38 to i32
  %op40 = add i32 %op39, zeroinitializer
  %op41 = icmp ne i32 %op40, zeroinitializer
  br i1 %op41, label %label_str_ltz12, label %label_str_gtz13
label_str_ltz12:                                                ; preds = %label_str_gtz11
  call void @neg_idx_except()
  br label %label_str_gtz13
label_str_gtz13:                                                ; preds = %label_str_gtz11, %label_str_ltz12
  %op42 = load i32*, i32** %op2
  %op43 = getelementptr i32, i32* %op42, i32 %op37
  %op44 = load i32, i32* %op43
  %op45 = icmp eq i32 %op36, %op44
  %op46 = zext i1 %op45 to i32
  %op47 = icmp sgt i32 %op46, zeroinitializer
  br label %label_ret9
label_true14:                                                ; preds = %label_ret9
  %op48 = load i32, i32* %op11
  %op49 = add i32 %op48, 1
  store i32 %op49, i32* %op11
  %op50 = load i32, i32* %op10
  %op51 = add i32 %op50, 1
  store i32 %op51, i32* %op10
  %op52 = load i32, i32* %op10
  %op53 = icmp slt i32 %op52, zeroinitializer
  %op54 = zext i1 %op53 to i32
  %op55 = add i32 %op54, zeroinitializer
  %op56 = icmp ne i32 %op55, zeroinitializer
  br i1 %op56, label %label_next_ltz16, label %label_next_gtz17
label_false15:                                                ; preds = %label_ret9
  %op57 = load i32, i32* %op11
  %op58 = icmp slt i32 %op57, zeroinitializer
  %op59 = zext i1 %op58 to i32
  %op60 = add i32 %op59, zeroinitializer
  %op61 = icmp ne i32 %op60, zeroinitializer
  br i1 %op61, label %label_next_ltz18, label %label_next_gtz19
label_next_ltz16:                                                ; preds = %label_true14
  call void @neg_idx_except()
  br label %label_next_gtz17
label_next_gtz17:                                                ; preds = %label_true14, %label_next_ltz16
  %op62 = load i32*, i32** %op3
  %op63 = getelementptr i32, i32* %op62, i32 %op52
  %op64 = load i32, i32* %op11
  store i32 %op64, i32* %op63
  br label %label_ret20
label_next_ltz18:                                                ; preds = %label_false15
  call void @neg_idx_except()
  br label %label_next_gtz19
label_next_gtz19:                                                ; preds = %label_false15, %label_next_ltz18
  %op65 = load i32*, i32** %op3
  %op66 = getelementptr i32, i32* %op65, i32 %op57
  %op67 = load i32, i32* %op66
  store i32 %op67, i32* %op11
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
  %op34 = icmp eq i32 %op25, %op33
  %op35 = zext i1 %op34 to i32
  %op36 = icmp sgt i32 %op35, zeroinitializer
  br i1 %op36, label %label_true30, label %label_false31
label_true30:                                                ; preds = %label_src_gtz29
  %op37 = load i32, i32* %op7
  %op38 = add i32 %op37, 1
  store i32 %op38, i32* %op7
  %op39 = load i32, i32* %op8
  %op40 = add i32 %op39, 1
  store i32 %op40, i32* %op8
  %op41 = load i32, i32* %op7
  %op42 = icmp slt i32 %op41, zeroinitializer
  %op43 = zext i1 %op42 to i32
  %op44 = add i32 %op43, zeroinitializer
  %op45 = icmp ne i32 %op44, zeroinitializer
  br i1 %op45, label %label_dst_ltz32, label %label_dst_gtz33
label_false31:                                                ; preds = %label_src_gtz29
  %op46 = load i32, i32* %op7
  %op47 = icmp slt i32 %op46, zeroinitializer
  %op48 = zext i1 %op47 to i32
  %op49 = add i32 %op48, zeroinitializer
  %op50 = icmp ne i32 %op49, zeroinitializer
  br i1 %op50, label %label_next_ltz36, label %label_next_gtz37
label_dst_ltz32:                                                ; preds = %label_true30
  call void @neg_idx_except()
  br label %label_dst_gtz33
label_dst_gtz33:                                                ; preds = %label_true30, %label_dst_ltz32
  %op51 = load i32*, i32** %op2
  %op52 = getelementptr i32, i32* %op51, i32 %op41
  %op53 = load i32, i32* %op52
  %op54 = icmp sle i32 %op53, zeroinitializer
  %op55 = zext i1 %op54 to i32
  %op56 = icmp sgt i32 %op55, zeroinitializer
  br i1 %op56, label %label_true34, label %label_ret35
label_true34:                                                ; preds = %label_dst_gtz33
  %op57 = load i32, i32* %op8
  ret i32 %op57
label_ret35:                                                ; preds = %label_dst_gtz33
  br label %label_ret40
label_next_ltz36:                                                ; preds = %label_false31
  call void @neg_idx_except()
  br label %label_next_gtz37
label_next_gtz37:                                                ; preds = %label_false31, %label_next_ltz36
  %op58 = getelementptr [4096 x i32], [4096 x i32]* %op4, i32 0, i32 %op46
  %op59 = load i32, i32* %op58
  store i32 %op59, i32* %op7
  %op60 = load i32, i32* %op7
  %op61 = icmp eq i32 %op60, -1
  %op62 = zext i1 %op61 to i32
  %op63 = icmp sgt i32 %op62, zeroinitializer
  br i1 %op63, label %label_true38, label %label_ret39
label_true38:                                                ; preds = %label_next_gtz37
  %op64 = load i32, i32* %op7
  %op65 = add i32 %op64, 1
  store i32 %op65, i32* %op7
  %op66 = load i32, i32* %op8
  %op67 = add i32 %op66, 1
  store i32 %op67, i32* %op8
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
  %op25 = icmp eq i32 %op24, 10
  %op26 = zext i1 %op25 to i32
  %op27 = icmp sgt i32 %op26, zeroinitializer
  br i1 %op27, label %label_true48, label %label_ret49
label_true48:                                                ; preds = %label_buf_gtz47
  br label %label_ret43
label_ret49:                                                ; preds = %label_buf_gtz47
  %op28 = load i32, i32* %op2
  %op29 = add i32 %op28, 1
  store i32 %op29, i32* %op2
  br label %label_condition41
label_buf_ltz50:                                                ; preds = %label_ret43
  call void @neg_idx_except()
  br label %label_buf_gtz51
label_buf_gtz51:                                                ; preds = %label_ret43, %label_buf_ltz50
  %op30 = load i32*, i32** %op1
  %op31 = getelementptr i32, i32* %op30, i32 %op9
  store i32 0, i32* %op31
  %op32 = load i32, i32* %op2
  ret i32 %op32
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
