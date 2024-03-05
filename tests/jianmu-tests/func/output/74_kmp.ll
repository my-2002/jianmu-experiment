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
  %op2 = icmp slt i32 0, zeroinitializer
  %op3 = zext i1 %op2 to i32
  %op4 = add i32 %op3, zeroinitializer
  %op5 = icmp ne i32 %op4, zeroinitializer
  br i1 %op5, label %label_next_ltz0, label %label_next_gtz1
label_next_ltz0:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_next_gtz1
label_next_gtz1:                                                ; preds = %label_entry, %label_next_ltz0
  %op6 = getelementptr i32, i32* %arg1, i32 0
  store i32 -1, i32* %op6
  br label %label_condition2
label_condition2:                                                ; preds = %label_next_gtz1, %label_ret20
  %op7 = phi i32 [ -1, %label_next_gtz1 ], [ %op51, %label_ret20 ]
  %op8 = phi i32 [ 0, %label_next_gtz1 ], [ %op52, %label_ret20 ]
  %op9 = icmp slt i32 %op8, zeroinitializer
  %op10 = zext i1 %op9 to i32
  %op11 = add i32 %op10, zeroinitializer
  %op12 = icmp ne i32 %op11, zeroinitializer
  br i1 %op12, label %label_str_ltz5, label %label_str_gtz6
label_loop3:                                                ; preds = %label_str_gtz6
  %op13 = icmp eq i32 %op7, -1
  %op14 = zext i1 %op13 to i32
  %op15 = icmp sgt i32 %op14, zeroinitializer
  br i1 %op15, label %label_true7, label %label_false8
label_ret4:                                                ; preds = %label_str_gtz6
  ret void
label_str_ltz5:                                                ; preds = %label_condition2
  call void @neg_idx_except()
  br label %label_str_gtz6
label_str_gtz6:                                                ; preds = %label_condition2, %label_str_ltz5
  %op16 = getelementptr i32, i32* %arg0, i32 %op8
  %op17 = load i32, i32* %op16
  %op18 = icmp sgt i32 %op17, zeroinitializer
  br i1 %op18, label %label_loop3, label %label_ret4
label_true7:                                                ; preds = %label_loop3
  %op19 = icmp sgt i32 1, zeroinitializer
  br label %label_ret9
label_false8:                                                ; preds = %label_loop3
  %op20 = icmp slt i32 %op8, zeroinitializer
  %op21 = zext i1 %op20 to i32
  %op22 = add i32 %op21, zeroinitializer
  %op23 = icmp ne i32 %op22, zeroinitializer
  br i1 %op23, label %label_str_ltz10, label %label_str_gtz11
label_ret9:                                                ; preds = %label_str_gtz13, %label_true7
  %op24 = phi i1 [ %op19, %label_true7 ], [ %op37, %label_str_gtz13 ]
  %op25 = zext i1 %op24 to i32
  %op26 = icmp sgt i32 %op25, zeroinitializer
  br i1 %op26, label %label_true14, label %label_false15
label_str_ltz10:                                                ; preds = %label_false8
  call void @neg_idx_except()
  br label %label_str_gtz11
label_str_gtz11:                                                ; preds = %label_false8, %label_str_ltz10
  %op27 = getelementptr i32, i32* %arg0, i32 %op8
  %op28 = load i32, i32* %op27
  %op29 = icmp slt i32 %op7, zeroinitializer
  %op30 = zext i1 %op29 to i32
  %op31 = add i32 %op30, zeroinitializer
  %op32 = icmp ne i32 %op31, zeroinitializer
  br i1 %op32, label %label_str_ltz12, label %label_str_gtz13
label_str_ltz12:                                                ; preds = %label_str_gtz11
  call void @neg_idx_except()
  br label %label_str_gtz13
label_str_gtz13:                                                ; preds = %label_str_gtz11, %label_str_ltz12
  %op33 = getelementptr i32, i32* %arg0, i32 %op7
  %op34 = load i32, i32* %op33
  %op35 = icmp eq i32 %op28, %op34
  %op36 = zext i1 %op35 to i32
  %op37 = icmp sgt i32 %op36, zeroinitializer
  br label %label_ret9
label_true14:                                                ; preds = %label_ret9
  %op38 = add i32 %op7, 1
  %op39 = add i32 %op8, 1
  %op40 = icmp slt i32 %op39, zeroinitializer
  %op41 = zext i1 %op40 to i32
  %op42 = add i32 %op41, zeroinitializer
  %op43 = icmp ne i32 %op42, zeroinitializer
  br i1 %op43, label %label_next_ltz16, label %label_next_gtz17
label_false15:                                                ; preds = %label_ret9
  %op44 = icmp slt i32 %op7, zeroinitializer
  %op45 = zext i1 %op44 to i32
  %op46 = add i32 %op45, zeroinitializer
  %op47 = icmp ne i32 %op46, zeroinitializer
  br i1 %op47, label %label_next_ltz18, label %label_next_gtz19
label_next_ltz16:                                                ; preds = %label_true14
  call void @neg_idx_except()
  br label %label_next_gtz17
label_next_gtz17:                                                ; preds = %label_true14, %label_next_ltz16
  %op48 = getelementptr i32, i32* %arg1, i32 %op39
  store i32 %op38, i32* %op48
  br label %label_ret20
label_next_ltz18:                                                ; preds = %label_false15
  call void @neg_idx_except()
  br label %label_next_gtz19
label_next_gtz19:                                                ; preds = %label_false15, %label_next_ltz18
  %op49 = getelementptr i32, i32* %arg1, i32 %op7
  %op50 = load i32, i32* %op49
  br label %label_ret20
label_ret20:                                                ; preds = %label_next_gtz17, %label_next_gtz19
  %op51 = phi i32 [ %op38, %label_next_gtz17 ], [ %op50, %label_next_gtz19 ]
  %op52 = phi i32 [ %op39, %label_next_gtz17 ], [ %op8, %label_next_gtz19 ]
  br label %label_condition2
}
define i32 @KMP(i32* %arg0, i32* %arg1) {
label_entry:
  %op2 = alloca [4096 x i32]
  %op3 = getelementptr [4096 x i32], [4096 x i32]* %op2, i32 0, i32 0
  call void @get_next(i32* %arg0, i32* %op3)
  br label %label_condition21
label_condition21:                                                ; preds = %label_entry, %label_ret40
  %op4 = phi i32 [ 0, %label_entry ], [ %op52, %label_ret40 ]
  %op5 = phi i32 [ 0, %label_entry ], [ %op53, %label_ret40 ]
  %op6 = icmp slt i32 %op4, zeroinitializer
  %op7 = zext i1 %op6 to i32
  %op8 = add i32 %op7, zeroinitializer
  %op9 = icmp ne i32 %op8, zeroinitializer
  br i1 %op9, label %label_src_ltz24, label %label_src_gtz25
label_loop22:                                                ; preds = %label_src_gtz25
  %op10 = icmp slt i32 %op5, zeroinitializer
  %op11 = zext i1 %op10 to i32
  %op12 = add i32 %op11, zeroinitializer
  %op13 = icmp ne i32 %op12, zeroinitializer
  br i1 %op13, label %label_dst_ltz26, label %label_dst_gtz27
label_ret23:                                                ; preds = %label_src_gtz25
  ret i32 -1
label_src_ltz24:                                                ; preds = %label_condition21
  call void @neg_idx_except()
  br label %label_src_gtz25
label_src_gtz25:                                                ; preds = %label_condition21, %label_src_ltz24
  %op14 = getelementptr i32, i32* %arg1, i32 %op4
  %op15 = load i32, i32* %op14
  %op16 = icmp sgt i32 %op15, zeroinitializer
  br i1 %op16, label %label_loop22, label %label_ret23
label_dst_ltz26:                                                ; preds = %label_loop22
  call void @neg_idx_except()
  br label %label_dst_gtz27
label_dst_gtz27:                                                ; preds = %label_loop22, %label_dst_ltz26
  %op17 = getelementptr i32, i32* %arg0, i32 %op5
  %op18 = load i32, i32* %op17
  %op19 = icmp slt i32 %op4, zeroinitializer
  %op20 = zext i1 %op19 to i32
  %op21 = add i32 %op20, zeroinitializer
  %op22 = icmp ne i32 %op21, zeroinitializer
  br i1 %op22, label %label_src_ltz28, label %label_src_gtz29
label_src_ltz28:                                                ; preds = %label_dst_gtz27
  call void @neg_idx_except()
  br label %label_src_gtz29
label_src_gtz29:                                                ; preds = %label_dst_gtz27, %label_src_ltz28
  %op23 = getelementptr i32, i32* %arg1, i32 %op4
  %op24 = load i32, i32* %op23
  %op25 = icmp eq i32 %op18, %op24
  %op26 = zext i1 %op25 to i32
  %op27 = icmp sgt i32 %op26, zeroinitializer
  br i1 %op27, label %label_true30, label %label_false31
label_true30:                                                ; preds = %label_src_gtz29
  %op28 = add i32 %op5, 1
  %op29 = add i32 %op4, 1
  %op30 = icmp slt i32 %op28, zeroinitializer
  %op31 = zext i1 %op30 to i32
  %op32 = add i32 %op31, zeroinitializer
  %op33 = icmp ne i32 %op32, zeroinitializer
  br i1 %op33, label %label_dst_ltz32, label %label_dst_gtz33
label_false31:                                                ; preds = %label_src_gtz29
  %op34 = icmp slt i32 %op5, zeroinitializer
  %op35 = zext i1 %op34 to i32
  %op36 = add i32 %op35, zeroinitializer
  %op37 = icmp ne i32 %op36, zeroinitializer
  br i1 %op37, label %label_next_ltz36, label %label_next_gtz37
label_dst_ltz32:                                                ; preds = %label_true30
  call void @neg_idx_except()
  br label %label_dst_gtz33
label_dst_gtz33:                                                ; preds = %label_true30, %label_dst_ltz32
  %op38 = getelementptr i32, i32* %arg0, i32 %op28
  %op39 = load i32, i32* %op38
  %op40 = icmp sle i32 %op39, zeroinitializer
  %op41 = zext i1 %op40 to i32
  %op42 = icmp sgt i32 %op41, zeroinitializer
  br i1 %op42, label %label_true34, label %label_ret35
label_true34:                                                ; preds = %label_dst_gtz33
  ret i32 %op29
label_ret35:                                                ; preds = %label_dst_gtz33
  br label %label_ret40
label_next_ltz36:                                                ; preds = %label_false31
  call void @neg_idx_except()
  br label %label_next_gtz37
label_next_gtz37:                                                ; preds = %label_false31, %label_next_ltz36
  %op43 = getelementptr [4096 x i32], [4096 x i32]* %op2, i32 0, i32 %op5
  %op44 = load i32, i32* %op43
  %op45 = icmp eq i32 %op44, -1
  %op46 = zext i1 %op45 to i32
  %op47 = icmp sgt i32 %op46, zeroinitializer
  br i1 %op47, label %label_true38, label %label_ret39
label_true38:                                                ; preds = %label_next_gtz37
  %op48 = add i32 %op44, 1
  %op49 = add i32 %op4, 1
  br label %label_ret39
label_ret39:                                                ; preds = %label_next_gtz37, %label_true38
  %op50 = phi i32 [ %op4, %label_next_gtz37 ], [ %op49, %label_true38 ]
  %op51 = phi i32 [ %op44, %label_next_gtz37 ], [ %op48, %label_true38 ]
  br label %label_ret40
label_ret40:                                                ; preds = %label_ret35, %label_ret39
  %op52 = phi i32 [ %op29, %label_ret35 ], [ %op50, %label_ret39 ]
  %op53 = phi i32 [ %op28, %label_ret35 ], [ %op51, %label_ret39 ]
  br label %label_condition21
}
define i32 @read_str(i32* %arg0) {
label_entry:
  br label %label_condition41
label_condition41:                                                ; preds = %label_entry, %label_ret49
  %op1 = phi i32 [ 0, %label_entry ], [ %op22, %label_ret49 ]
  %op2 = icmp sgt i32 1, zeroinitializer
  br i1 %op2, label %label_loop42, label %label_ret43
label_loop42:                                                ; preds = %label_condition41
  %op3 = icmp slt i32 %op1, zeroinitializer
  %op4 = zext i1 %op3 to i32
  %op5 = add i32 %op4, zeroinitializer
  %op6 = icmp ne i32 %op5, zeroinitializer
  br i1 %op6, label %label_buf_ltz44, label %label_buf_gtz45
label_ret43:                                                ; preds = %label_condition41, %label_true48
  %op7 = icmp slt i32 %op1, zeroinitializer
  %op8 = zext i1 %op7 to i32
  %op9 = add i32 %op8, zeroinitializer
  %op10 = icmp ne i32 %op9, zeroinitializer
  br i1 %op10, label %label_buf_ltz50, label %label_buf_gtz51
label_buf_ltz44:                                                ; preds = %label_loop42
  call void @neg_idx_except()
  br label %label_buf_gtz45
label_buf_gtz45:                                                ; preds = %label_loop42, %label_buf_ltz44
  %op11 = getelementptr i32, i32* %arg0, i32 %op1
  %op12 = call i32 @getch()
  store i32 %op12, i32* %op11
  %op13 = icmp slt i32 %op1, zeroinitializer
  %op14 = zext i1 %op13 to i32
  %op15 = add i32 %op14, zeroinitializer
  %op16 = icmp ne i32 %op15, zeroinitializer
  br i1 %op16, label %label_buf_ltz46, label %label_buf_gtz47
label_buf_ltz46:                                                ; preds = %label_buf_gtz45
  call void @neg_idx_except()
  br label %label_buf_gtz47
label_buf_gtz47:                                                ; preds = %label_buf_gtz45, %label_buf_ltz46
  %op17 = getelementptr i32, i32* %arg0, i32 %op1
  %op18 = load i32, i32* %op17
  %op19 = icmp eq i32 %op18, 10
  %op20 = zext i1 %op19 to i32
  %op21 = icmp sgt i32 %op20, zeroinitializer
  br i1 %op21, label %label_true48, label %label_ret49
label_true48:                                                ; preds = %label_buf_gtz47
  br label %label_ret43
label_ret49:                                                ; preds = %label_buf_gtz47
  %op22 = add i32 %op1, 1
  br label %label_condition41
label_buf_ltz50:                                                ; preds = %label_ret43
  call void @neg_idx_except()
  br label %label_buf_gtz51
label_buf_gtz51:                                                ; preds = %label_ret43, %label_buf_ltz50
  %op23 = getelementptr i32, i32* %arg0, i32 %op1
  store i32 0, i32* %op23
  ret i32 %op1
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
