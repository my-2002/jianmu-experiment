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
label_condition2:                                                ; preds = %label_next_gtz1, %label_ret17
  %op12 = load i32, i32* %op10
  %op13 = icmp slt i32 %op12, zeroinitializer
  %op14 = zext i1 %op13 to i32
  %op15 = add i32 %op14, zeroinitializer
  %op16 = icmp ne i32 %op15, zeroinitializer
  br i1 %op16, label %label_str_ltz5, label %label_str_gtz6
label_loop3:                                                ; preds = %label_str_gtz6
  %op17 = load i32, i32* %op11
  %op18 = icmp slt i32 %op17, zeroinitializer
  %op19 = zext i1 %op18 to i32
  %op20 = add i32 %op19, zeroinitializer
  %op21 = icmp ne i32 %op20, zeroinitializer
  br i1 %op21, label %label_str_ltz7, label %label_str_gtz8
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
label_str_ltz7:                                                ; preds = %label_loop3
  call void @neg_idx_except()
  br label %label_str_gtz8
label_str_gtz8:                                                ; preds = %label_loop3, %label_str_ltz7
  %op26 = load i32*, i32** %op2
  %op27 = getelementptr i32, i32* %op26, i32 %op17
  %op28 = load i32, i32* %op27
  %op29 = load i32, i32* %op10
  %op30 = icmp slt i32 %op29, zeroinitializer
  %op31 = zext i1 %op30 to i32
  %op32 = add i32 %op31, zeroinitializer
  %op33 = icmp ne i32 %op32, zeroinitializer
  br i1 %op33, label %label_str_ltz9, label %label_str_gtz10
label_str_ltz9:                                                ; preds = %label_str_gtz8
  call void @neg_idx_except()
  br label %label_str_gtz10
label_str_gtz10:                                                ; preds = %label_str_gtz8, %label_str_ltz9
  %op34 = load i32*, i32** %op2
  %op35 = getelementptr i32, i32* %op34, i32 %op29
  %op36 = load i32, i32* %op35
  %op37 = add i32 %op36, %op28
  %op38 = icmp eq i32 %op36, %op28
  %op39 = zext i1 %op38 to i32
  %op40 = load i32, i32* %op11
  %op41 = add i32 %op40, -1
  %op42 = icmp eq i32 %op40, -1
  %op43 = zext i1 %op42 to i32
  %op44 = add i32 %op43, %op39
  %op45 = icmp sge i32 %op44, 1
  %op46 = zext i1 %op45 to i32
  %op47 = icmp sgt i32 %op46, zeroinitializer
  br i1 %op47, label %label_true11, label %label_false12
label_true11:                                                ; preds = %label_str_gtz10
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
  br i1 %op56, label %label_next_ltz13, label %label_next_gtz14
label_false12:                                                ; preds = %label_str_gtz10
  %op57 = load i32, i32* %op11
  %op58 = icmp slt i32 %op57, zeroinitializer
  %op59 = zext i1 %op58 to i32
  %op60 = add i32 %op59, zeroinitializer
  %op61 = icmp ne i32 %op60, zeroinitializer
  br i1 %op61, label %label_next_ltz15, label %label_next_gtz16
label_next_ltz13:                                                ; preds = %label_true11
  call void @neg_idx_except()
  br label %label_next_gtz14
label_next_gtz14:                                                ; preds = %label_true11, %label_next_ltz13
  %op62 = load i32*, i32** %op3
  %op63 = getelementptr i32, i32* %op62, i32 %op52
  %op64 = load i32, i32* %op11
  store i32 %op64, i32* %op63
  br label %label_ret17
label_next_ltz15:                                                ; preds = %label_false12
  call void @neg_idx_except()
  br label %label_next_gtz16
label_next_gtz16:                                                ; preds = %label_false12, %label_next_ltz15
  %op65 = load i32*, i32** %op3
  %op66 = getelementptr i32, i32* %op65, i32 %op57
  %op67 = load i32, i32* %op66
  store i32 %op67, i32* %op11
  br label %label_ret17
label_ret17:                                                ; preds = %label_next_gtz14, %label_next_gtz16
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
  br label %label_condition18
label_condition18:                                                ; preds = %label_entry, %label_ret37
  %op9 = load i32, i32* %op8
  %op10 = icmp slt i32 %op9, zeroinitializer
  %op11 = zext i1 %op10 to i32
  %op12 = add i32 %op11, zeroinitializer
  %op13 = icmp ne i32 %op12, zeroinitializer
  br i1 %op13, label %label_src_ltz21, label %label_src_gtz22
label_loop19:                                                ; preds = %label_src_gtz22
  %op14 = load i32, i32* %op8
  %op15 = icmp slt i32 %op14, zeroinitializer
  %op16 = zext i1 %op15 to i32
  %op17 = add i32 %op16, zeroinitializer
  %op18 = icmp ne i32 %op17, zeroinitializer
  br i1 %op18, label %label_src_ltz23, label %label_src_gtz24
label_ret20:                                                ; preds = %label_src_gtz22
  ret i32 -1
label_src_ltz21:                                                ; preds = %label_condition18
  call void @neg_idx_except()
  br label %label_src_gtz22
label_src_gtz22:                                                ; preds = %label_condition18, %label_src_ltz21
  %op19 = load i32*, i32** %op3
  %op20 = getelementptr i32, i32* %op19, i32 %op9
  %op21 = load i32, i32* %op20
  %op22 = icmp sgt i32 %op21, zeroinitializer
  br i1 %op22, label %label_loop19, label %label_ret20
label_src_ltz23:                                                ; preds = %label_loop19
  call void @neg_idx_except()
  br label %label_src_gtz24
label_src_gtz24:                                                ; preds = %label_loop19, %label_src_ltz23
  %op23 = load i32*, i32** %op3
  %op24 = getelementptr i32, i32* %op23, i32 %op14
  %op25 = load i32, i32* %op24
  %op26 = load i32, i32* %op7
  %op27 = icmp slt i32 %op26, zeroinitializer
  %op28 = zext i1 %op27 to i32
  %op29 = add i32 %op28, zeroinitializer
  %op30 = icmp ne i32 %op29, zeroinitializer
  br i1 %op30, label %label_dst_ltz25, label %label_dst_gtz26
label_dst_ltz25:                                                ; preds = %label_src_gtz24
  call void @neg_idx_except()
  br label %label_dst_gtz26
label_dst_gtz26:                                                ; preds = %label_src_gtz24, %label_dst_ltz25
  %op31 = load i32*, i32** %op2
  %op32 = getelementptr i32, i32* %op31, i32 %op26
  %op33 = load i32, i32* %op32
  %op34 = add i32 %op33, %op25
  %op35 = icmp eq i32 %op33, %op25
  %op36 = zext i1 %op35 to i32
  %op37 = icmp sgt i32 %op36, zeroinitializer
  br i1 %op37, label %label_true27, label %label_false28
label_true27:                                                ; preds = %label_dst_gtz26
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
  br i1 %op46, label %label_dst_ltz29, label %label_dst_gtz30
label_false28:                                                ; preds = %label_dst_gtz26
  %op47 = load i32, i32* %op7
  %op48 = icmp slt i32 %op47, zeroinitializer
  %op49 = zext i1 %op48 to i32
  %op50 = add i32 %op49, zeroinitializer
  %op51 = icmp ne i32 %op50, zeroinitializer
  br i1 %op51, label %label_next_ltz33, label %label_next_gtz34
label_dst_ltz29:                                                ; preds = %label_true27
  call void @neg_idx_except()
  br label %label_dst_gtz30
label_dst_gtz30:                                                ; preds = %label_true27, %label_dst_ltz29
  %op52 = load i32*, i32** %op2
  %op53 = getelementptr i32, i32* %op52, i32 %op42
  %op54 = load i32, i32* %op53
  %op55 = icmp sle i32 %op54, zeroinitializer
  %op56 = zext i1 %op55 to i32
  %op57 = icmp sgt i32 %op56, zeroinitializer
  br i1 %op57, label %label_true31, label %label_ret32
label_true31:                                                ; preds = %label_dst_gtz30
  %op58 = load i32, i32* %op8
  ret i32 %op58
label_ret32:                                                ; preds = %label_dst_gtz30
  br label %label_ret37
label_next_ltz33:                                                ; preds = %label_false28
  call void @neg_idx_except()
  br label %label_next_gtz34
label_next_gtz34:                                                ; preds = %label_false28, %label_next_ltz33
  %op59 = getelementptr [4096 x i32], [4096 x i32]* %op4, i32 0, i32 %op47
  %op60 = load i32, i32* %op59
  store i32 %op60, i32* %op7
  %op61 = load i32, i32* %op7
  %op62 = add i32 %op61, -1
  %op63 = icmp eq i32 %op61, -1
  %op64 = zext i1 %op63 to i32
  %op65 = icmp sgt i32 %op64, zeroinitializer
  br i1 %op65, label %label_true35, label %label_ret36
label_true35:                                                ; preds = %label_next_gtz34
  %op66 = load i32, i32* %op7
  %op67 = add i32 %op66, 1
  store i32 %op67, i32* %op7
  %op68 = load i32, i32* %op8
  %op69 = add i32 %op68, 1
  store i32 %op69, i32* %op8
  br label %label_ret36
label_ret36:                                                ; preds = %label_next_gtz34, %label_true35
  br label %label_ret37
label_ret37:                                                ; preds = %label_ret32, %label_ret36
  br label %label_condition18
}
define i32 @read_str(i32* %arg0) {
label_entry:
  %op1 = alloca i32*
  store i32* %arg0, i32** %op1
  %op2 = alloca i32
  store i32 0, i32* %op2
  br label %label_condition38
label_condition38:                                                ; preds = %label_entry, %label_ret46
  %op3 = icmp sgt i32 1, zeroinitializer
  br i1 %op3, label %label_loop39, label %label_ret40
label_loop39:                                                ; preds = %label_condition38
  %op4 = load i32, i32* %op2
  %op5 = icmp slt i32 %op4, zeroinitializer
  %op6 = zext i1 %op5 to i32
  %op7 = add i32 %op6, zeroinitializer
  %op8 = icmp ne i32 %op7, zeroinitializer
  br i1 %op8, label %label_buf_ltz41, label %label_buf_gtz42
label_ret40:                                                ; preds = %label_condition38, %label_true45
  %op9 = load i32, i32* %op2
  %op10 = icmp slt i32 %op9, zeroinitializer
  %op11 = zext i1 %op10 to i32
  %op12 = add i32 %op11, zeroinitializer
  %op13 = icmp ne i32 %op12, zeroinitializer
  br i1 %op13, label %label_buf_ltz47, label %label_buf_gtz48
label_buf_ltz41:                                                ; preds = %label_loop39
  call void @neg_idx_except()
  br label %label_buf_gtz42
label_buf_gtz42:                                                ; preds = %label_loop39, %label_buf_ltz41
  %op14 = load i32*, i32** %op1
  %op15 = getelementptr i32, i32* %op14, i32 %op4
  %op16 = call i32 @getch()
  store i32 %op16, i32* %op15
  %op17 = load i32, i32* %op2
  %op18 = icmp slt i32 %op17, zeroinitializer
  %op19 = zext i1 %op18 to i32
  %op20 = add i32 %op19, zeroinitializer
  %op21 = icmp ne i32 %op20, zeroinitializer
  br i1 %op21, label %label_buf_ltz43, label %label_buf_gtz44
label_buf_ltz43:                                                ; preds = %label_buf_gtz42
  call void @neg_idx_except()
  br label %label_buf_gtz44
label_buf_gtz44:                                                ; preds = %label_buf_gtz42, %label_buf_ltz43
  %op22 = load i32*, i32** %op1
  %op23 = getelementptr i32, i32* %op22, i32 %op17
  %op24 = load i32, i32* %op23
  %op25 = add i32 %op24, 10
  %op26 = icmp eq i32 %op24, 10
  %op27 = zext i1 %op26 to i32
  %op28 = icmp sgt i32 %op27, zeroinitializer
  br i1 %op28, label %label_true45, label %label_ret46
label_true45:                                                ; preds = %label_buf_gtz44
  br label %label_ret40
label_ret46:                                                ; preds = %label_buf_gtz44
  %op29 = load i32, i32* %op2
  %op30 = add i32 %op29, 1
  store i32 %op30, i32* %op2
  br label %label_condition38
label_buf_ltz47:                                                ; preds = %label_ret40
  call void @neg_idx_except()
  br label %label_buf_gtz48
label_buf_gtz48:                                                ; preds = %label_ret40, %label_buf_ltz47
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
