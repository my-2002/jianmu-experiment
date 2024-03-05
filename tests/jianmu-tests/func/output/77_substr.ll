; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/jianmu-tests/func/77_substr.sy"

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

define i32 @MAX(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = icmp eq i32 %arg0, %arg1
  %op3 = zext i1 %op2 to i32
  %op4 = icmp sgt i32 %op3, zeroinitializer
  br i1 %op4, label %label_true0, label %label_false1
label_true0:                                                ; preds = %label_entry
  ret i32 %arg0
label_false1:                                                ; preds = %label_entry
  %op5 = icmp sgt i32 %arg0, %arg1
  %op6 = zext i1 %op5 to i32
  %op7 = icmp sgt i32 %op6, zeroinitializer
  br i1 %op7, label %label_true2, label %label_false3
label_true2:                                                ; preds = %label_false1
  ret i32 %arg0
label_false3:                                                ; preds = %label_false1
  ret i32 %arg1
}
define i32 @max_sum_nonadjacent(i32* %arg0, i32 %arg1) {
label_entry:
  %op2 = alloca [16 x i32]
  %op3 = icmp slt i32 0, zeroinitializer
  %op4 = zext i1 %op3 to i32
  %op5 = add i32 %op4, zeroinitializer
  %op6 = icmp ne i32 %op5, zeroinitializer
  br i1 %op6, label %label_temp_ltz4, label %label_temp_gtz5
label_temp_ltz4:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_temp_gtz5
label_temp_gtz5:                                                ; preds = %label_entry, %label_temp_ltz4
  %op7 = getelementptr [16 x i32], [16 x i32]* %op2, i32 0, i32 0
  %op8 = icmp slt i32 0, zeroinitializer
  %op9 = zext i1 %op8 to i32
  %op10 = add i32 %op9, zeroinitializer
  %op11 = icmp ne i32 %op10, zeroinitializer
  br i1 %op11, label %label_arr_ltz6, label %label_arr_gtz7
label_arr_ltz6:                                                ; preds = %label_temp_gtz5
  call void @neg_idx_except()
  br label %label_arr_gtz7
label_arr_gtz7:                                                ; preds = %label_temp_gtz5, %label_arr_ltz6
  %op12 = getelementptr i32, i32* %arg0, i32 0
  %op13 = load i32, i32* %op12
  store i32 %op13, i32* %op7
  %op14 = icmp slt i32 1, zeroinitializer
  %op15 = zext i1 %op14 to i32
  %op16 = add i32 %op15, zeroinitializer
  %op17 = icmp ne i32 %op16, zeroinitializer
  br i1 %op17, label %label_temp_ltz8, label %label_temp_gtz9
label_temp_ltz8:                                                ; preds = %label_arr_gtz7
  call void @neg_idx_except()
  br label %label_temp_gtz9
label_temp_gtz9:                                                ; preds = %label_arr_gtz7, %label_temp_ltz8
  %op18 = getelementptr [16 x i32], [16 x i32]* %op2, i32 0, i32 1
  %op19 = icmp slt i32 0, zeroinitializer
  %op20 = zext i1 %op19 to i32
  %op21 = add i32 %op20, zeroinitializer
  %op22 = icmp ne i32 %op21, zeroinitializer
  br i1 %op22, label %label_arr_ltz10, label %label_arr_gtz11
label_arr_ltz10:                                                ; preds = %label_temp_gtz9
  call void @neg_idx_except()
  br label %label_arr_gtz11
label_arr_gtz11:                                                ; preds = %label_temp_gtz9, %label_arr_ltz10
  %op23 = getelementptr i32, i32* %arg0, i32 0
  %op24 = load i32, i32* %op23
  %op25 = icmp slt i32 1, zeroinitializer
  %op26 = zext i1 %op25 to i32
  %op27 = add i32 %op26, zeroinitializer
  %op28 = icmp ne i32 %op27, zeroinitializer
  br i1 %op28, label %label_arr_ltz12, label %label_arr_gtz13
label_arr_ltz12:                                                ; preds = %label_arr_gtz11
  call void @neg_idx_except()
  br label %label_arr_gtz13
label_arr_gtz13:                                                ; preds = %label_arr_gtz11, %label_arr_ltz12
  %op29 = getelementptr i32, i32* %arg0, i32 1
  %op30 = load i32, i32* %op29
  %op31 = call i32 @MAX(i32 %op24, i32 %op30)
  store i32 %op31, i32* %op18
  br label %label_condition14
label_condition14:                                                ; preds = %label_arr_gtz13, %label_temp_gtz24
  %op32 = phi i32 [ 2, %label_arr_gtz13 ], [ %op68, %label_temp_gtz24 ]
  %op33 = icmp slt i32 %op32, %arg1
  %op34 = zext i1 %op33 to i32
  %op35 = icmp sgt i32 %op34, zeroinitializer
  br i1 %op35, label %label_loop15, label %label_ret16
label_loop15:                                                ; preds = %label_condition14
  %op36 = icmp slt i32 %op32, zeroinitializer
  %op37 = zext i1 %op36 to i32
  %op38 = add i32 %op37, zeroinitializer
  %op39 = icmp ne i32 %op38, zeroinitializer
  br i1 %op39, label %label_temp_ltz17, label %label_temp_gtz18
label_ret16:                                                ; preds = %label_condition14
  %op40 = sub i32 %arg1, 1
  %op41 = icmp slt i32 %op40, zeroinitializer
  %op42 = zext i1 %op41 to i32
  %op43 = add i32 %op42, zeroinitializer
  %op44 = icmp ne i32 %op43, zeroinitializer
  br i1 %op44, label %label_temp_ltz25, label %label_temp_gtz26
label_temp_ltz17:                                                ; preds = %label_loop15
  call void @neg_idx_except()
  br label %label_temp_gtz18
label_temp_gtz18:                                                ; preds = %label_loop15, %label_temp_ltz17
  %op45 = getelementptr [16 x i32], [16 x i32]* %op2, i32 0, i32 %op32
  %op46 = sub i32 %op32, 2
  %op47 = icmp slt i32 %op46, zeroinitializer
  %op48 = zext i1 %op47 to i32
  %op49 = add i32 %op48, zeroinitializer
  %op50 = icmp ne i32 %op49, zeroinitializer
  br i1 %op50, label %label_temp_ltz19, label %label_temp_gtz20
label_temp_ltz19:                                                ; preds = %label_temp_gtz18
  call void @neg_idx_except()
  br label %label_temp_gtz20
label_temp_gtz20:                                                ; preds = %label_temp_gtz18, %label_temp_ltz19
  %op51 = getelementptr [16 x i32], [16 x i32]* %op2, i32 0, i32 %op46
  %op52 = load i32, i32* %op51
  %op53 = icmp slt i32 %op32, zeroinitializer
  %op54 = zext i1 %op53 to i32
  %op55 = add i32 %op54, zeroinitializer
  %op56 = icmp ne i32 %op55, zeroinitializer
  br i1 %op56, label %label_arr_ltz21, label %label_arr_gtz22
label_arr_ltz21:                                                ; preds = %label_temp_gtz20
  call void @neg_idx_except()
  br label %label_arr_gtz22
label_arr_gtz22:                                                ; preds = %label_temp_gtz20, %label_arr_ltz21
  %op57 = getelementptr i32, i32* %arg0, i32 %op32
  %op58 = load i32, i32* %op57
  %op59 = add i32 %op52, %op58
  %op60 = sub i32 %op32, 1
  %op61 = icmp slt i32 %op60, zeroinitializer
  %op62 = zext i1 %op61 to i32
  %op63 = add i32 %op62, zeroinitializer
  %op64 = icmp ne i32 %op63, zeroinitializer
  br i1 %op64, label %label_temp_ltz23, label %label_temp_gtz24
label_temp_ltz23:                                                ; preds = %label_arr_gtz22
  call void @neg_idx_except()
  br label %label_temp_gtz24
label_temp_gtz24:                                                ; preds = %label_arr_gtz22, %label_temp_ltz23
  %op65 = getelementptr [16 x i32], [16 x i32]* %op2, i32 0, i32 %op60
  %op66 = load i32, i32* %op65
  %op67 = call i32 @MAX(i32 %op59, i32 %op66)
  store i32 %op67, i32* %op45
  %op68 = add i32 %op32, 1
  br label %label_condition14
label_temp_ltz25:                                                ; preds = %label_ret16
  call void @neg_idx_except()
  br label %label_temp_gtz26
label_temp_gtz26:                                                ; preds = %label_ret16, %label_temp_ltz25
  %op69 = getelementptr [16 x i32], [16 x i32]* %op2, i32 0, i32 %op40
  %op70 = load i32, i32* %op69
  ret i32 %op70
}
define i32 @longest_common_subseq(i32* %arg0, i32 %arg1, i32* %arg2, i32 %arg3) {
label_entry:
  %op4 = alloca [16 x [16 x i32]]
  br label %label_condition27
label_condition27:                                                ; preds = %label_entry, %label_ret32
  %op5 = phi i32 [ 1, %label_entry ], [ %op25, %label_ret32 ]
  %op6 = icmp sle i32 %op5, %arg1
  %op7 = zext i1 %op6 to i32
  %op8 = icmp sgt i32 %op7, zeroinitializer
  br i1 %op8, label %label_loop28, label %label_ret29
label_loop28:                                                ; preds = %label_condition27
  br label %label_condition30
label_ret29:                                                ; preds = %label_condition27
  %op9 = icmp slt i32 %arg1, zeroinitializer
  %op10 = zext i1 %op9 to i32
  %op11 = add i32 %op10, zeroinitializer
  %op12 = icmp slt i32 %arg3, zeroinitializer
  %op13 = zext i1 %op12 to i32
  %op14 = add i32 %op13, %op11
  %op15 = icmp ne i32 %op14, zeroinitializer
  br i1 %op15, label %label_p_ltz50, label %label_p_gtz51
label_condition30:                                                ; preds = %label_loop28, %label_ret49
  %op16 = phi i32 [ 1, %label_loop28 ], [ %op87, %label_ret49 ]
  %op17 = icmp sle i32 %op16, %arg3
  %op18 = zext i1 %op17 to i32
  %op19 = icmp sgt i32 %op18, zeroinitializer
  br i1 %op19, label %label_loop31, label %label_ret32
label_loop31:                                                ; preds = %label_condition30
  %op20 = sub i32 %op5, 1
  %op21 = icmp slt i32 %op20, zeroinitializer
  %op22 = zext i1 %op21 to i32
  %op23 = add i32 %op22, zeroinitializer
  %op24 = icmp ne i32 %op23, zeroinitializer
  br i1 %op24, label %label_arr1_ltz33, label %label_arr1_gtz34
label_ret32:                                                ; preds = %label_condition30
  %op25 = add i32 %op5, 1
  br label %label_condition27
label_arr1_ltz33:                                                ; preds = %label_loop31
  call void @neg_idx_except()
  br label %label_arr1_gtz34
label_arr1_gtz34:                                                ; preds = %label_loop31, %label_arr1_ltz33
  %op26 = getelementptr i32, i32* %arg0, i32 %op20
  %op27 = load i32, i32* %op26
  %op28 = sub i32 %op16, 1
  %op29 = icmp slt i32 %op28, zeroinitializer
  %op30 = zext i1 %op29 to i32
  %op31 = add i32 %op30, zeroinitializer
  %op32 = icmp ne i32 %op31, zeroinitializer
  br i1 %op32, label %label_arr2_ltz35, label %label_arr2_gtz36
label_arr2_ltz35:                                                ; preds = %label_arr1_gtz34
  call void @neg_idx_except()
  br label %label_arr2_gtz36
label_arr2_gtz36:                                                ; preds = %label_arr1_gtz34, %label_arr2_ltz35
  %op33 = getelementptr i32, i32* %arg2, i32 %op28
  %op34 = load i32, i32* %op33
  %op35 = icmp eq i32 %op27, %op34
  %op36 = zext i1 %op35 to i32
  %op37 = icmp sgt i32 %op36, zeroinitializer
  br i1 %op37, label %label_true37, label %label_false38
label_true37:                                                ; preds = %label_arr2_gtz36
  %op38 = icmp slt i32 %op5, zeroinitializer
  %op39 = zext i1 %op38 to i32
  %op40 = add i32 %op39, zeroinitializer
  %op41 = icmp slt i32 %op16, zeroinitializer
  %op42 = zext i1 %op41 to i32
  %op43 = add i32 %op42, %op40
  %op44 = icmp ne i32 %op43, zeroinitializer
  br i1 %op44, label %label_p_ltz39, label %label_p_gtz40
label_false38:                                                ; preds = %label_arr2_gtz36
  %op45 = icmp slt i32 %op5, zeroinitializer
  %op46 = zext i1 %op45 to i32
  %op47 = add i32 %op46, zeroinitializer
  %op48 = icmp slt i32 %op16, zeroinitializer
  %op49 = zext i1 %op48 to i32
  %op50 = add i32 %op49, %op47
  %op51 = icmp ne i32 %op50, zeroinitializer
  br i1 %op51, label %label_p_ltz43, label %label_p_gtz44
label_p_ltz39:                                                ; preds = %label_true37
  call void @neg_idx_except()
  br label %label_p_gtz40
label_p_gtz40:                                                ; preds = %label_true37, %label_p_ltz39
  %op52 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op4, i32 0, i32 %op5, i32 %op16
  %op53 = sub i32 %op16, 1
  %op54 = sub i32 %op5, 1
  %op55 = icmp slt i32 %op54, zeroinitializer
  %op56 = zext i1 %op55 to i32
  %op57 = add i32 %op56, zeroinitializer
  %op58 = icmp slt i32 %op53, zeroinitializer
  %op59 = zext i1 %op58 to i32
  %op60 = add i32 %op59, %op57
  %op61 = icmp ne i32 %op60, zeroinitializer
  br i1 %op61, label %label_p_ltz41, label %label_p_gtz42
label_p_ltz41:                                                ; preds = %label_p_gtz40
  call void @neg_idx_except()
  br label %label_p_gtz42
label_p_gtz42:                                                ; preds = %label_p_gtz40, %label_p_ltz41
  %op62 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op4, i32 0, i32 %op54, i32 %op53
  %op63 = load i32, i32* %op62
  %op64 = add i32 %op63, 1
  store i32 %op64, i32* %op52
  br label %label_ret49
label_p_ltz43:                                                ; preds = %label_false38
  call void @neg_idx_except()
  br label %label_p_gtz44
label_p_gtz44:                                                ; preds = %label_false38, %label_p_ltz43
  %op65 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op4, i32 0, i32 %op5, i32 %op16
  %op66 = sub i32 %op5, 1
  %op67 = icmp slt i32 %op66, zeroinitializer
  %op68 = zext i1 %op67 to i32
  %op69 = add i32 %op68, zeroinitializer
  %op70 = icmp slt i32 %op16, zeroinitializer
  %op71 = zext i1 %op70 to i32
  %op72 = add i32 %op71, %op69
  %op73 = icmp ne i32 %op72, zeroinitializer
  br i1 %op73, label %label_p_ltz45, label %label_p_gtz46
label_p_ltz45:                                                ; preds = %label_p_gtz44
  call void @neg_idx_except()
  br label %label_p_gtz46
label_p_gtz46:                                                ; preds = %label_p_gtz44, %label_p_ltz45
  %op74 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op4, i32 0, i32 %op66, i32 %op16
  %op75 = load i32, i32* %op74
  %op76 = sub i32 %op16, 1
  %op77 = icmp slt i32 %op5, zeroinitializer
  %op78 = zext i1 %op77 to i32
  %op79 = add i32 %op78, zeroinitializer
  %op80 = icmp slt i32 %op76, zeroinitializer
  %op81 = zext i1 %op80 to i32
  %op82 = add i32 %op81, %op79
  %op83 = icmp ne i32 %op82, zeroinitializer
  br i1 %op83, label %label_p_ltz47, label %label_p_gtz48
label_p_ltz47:                                                ; preds = %label_p_gtz46
  call void @neg_idx_except()
  br label %label_p_gtz48
label_p_gtz48:                                                ; preds = %label_p_gtz46, %label_p_ltz47
  %op84 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op4, i32 0, i32 %op5, i32 %op76
  %op85 = load i32, i32* %op84
  %op86 = call i32 @MAX(i32 %op75, i32 %op85)
  store i32 %op86, i32* %op65
  br label %label_ret49
label_ret49:                                                ; preds = %label_p_gtz42, %label_p_gtz48
  %op87 = add i32 %op16, 1
  br label %label_condition30
label_p_ltz50:                                                ; preds = %label_ret29
  call void @neg_idx_except()
  br label %label_p_gtz51
label_p_gtz51:                                                ; preds = %label_ret29, %label_p_ltz50
  %op88 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op4, i32 0, i32 %arg1, i32 %arg3
  %op89 = load i32, i32* %op88
  ret i32 %op89
}
define i32 @main() {
label_entry:
  %op0 = alloca [15 x i32]
  %op1 = alloca [13 x i32]
  %op2 = getelementptr [15 x i32], [15 x i32]* %op0, i32 0, i32 0
  %op3 = call i32 @max_sum_nonadjacent(i32* %op2, i32 15)
  call void @putint(i32 %op3)
  call void @putch(i32 10)
  %op4 = getelementptr [15 x i32], [15 x i32]* %op0, i32 0, i32 0
  %op5 = getelementptr [13 x i32], [13 x i32]* %op1, i32 0, i32 0
  %op6 = call i32 @longest_common_subseq(i32* %op4, i32 15, i32* %op5, i32 13)
  call void @putint(i32 %op6)
  call void @putch(i32 10)
  ret i32 0
}
