; ModuleID = 'sysy'
source_filename = "/home/my2002/compiler_principles/lab5/jianmu-experiment/tests/jianmu-tests/func/77_substr.sy"

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
  %op2 = alloca i32
  store i32 %arg0, i32* %op2
  %op3 = alloca i32
  store i32 %arg1, i32* %op3
  %op4 = load i32, i32* %op2
  %op5 = load i32, i32* %op3
  %op6 = icmp eq i32 %op4, %op5
  %op7 = zext i1 %op6 to i32
  %op8 = icmp sgt i32 %op7, zeroinitializer
  br i1 %op8, label %label_true0, label %label_false1
label_true0:                                                ; preds = %label_entry
  %op9 = load i32, i32* %op2
  ret i32 %op9
label_false1:                                                ; preds = %label_entry
  %op10 = load i32, i32* %op2
  %op11 = load i32, i32* %op3
  %op12 = icmp sgt i32 %op10, %op11
  %op13 = zext i1 %op12 to i32
  %op14 = icmp sgt i32 %op13, zeroinitializer
  br i1 %op14, label %label_true2, label %label_false3
label_true2:                                                ; preds = %label_false1
  %op15 = load i32, i32* %op2
  ret i32 %op15
label_false3:                                                ; preds = %label_false1
  %op16 = load i32, i32* %op3
  ret i32 %op16
}
define i32 @max_sum_nonadjacent(i32* %arg0, i32 %arg1) {
label_entry:
  %op2 = alloca i32*
  store i32* %arg0, i32** %op2
  %op3 = alloca i32
  store i32 %arg1, i32* %op3
  %op4 = alloca [16 x i32]
  store [16 x i32] [i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer], [16 x i32]* %op4
  %op5 = icmp slt i32 0, zeroinitializer
  %op6 = zext i1 %op5 to i32
  %op7 = add i32 %op6, zeroinitializer
  %op8 = icmp ne i32 %op7, zeroinitializer
  br i1 %op8, label %label_temp_ltz4, label %label_temp_gtz5
label_temp_ltz4:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_temp_gtz5
label_temp_gtz5:                                                ; preds = %label_entry, %label_temp_ltz4
  %op9 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 0
  %op10 = icmp slt i32 0, zeroinitializer
  %op11 = zext i1 %op10 to i32
  %op12 = add i32 %op11, zeroinitializer
  %op13 = icmp ne i32 %op12, zeroinitializer
  br i1 %op13, label %label_arr_ltz6, label %label_arr_gtz7
label_arr_ltz6:                                                ; preds = %label_temp_gtz5
  call void @neg_idx_except()
  br label %label_arr_gtz7
label_arr_gtz7:                                                ; preds = %label_temp_gtz5, %label_arr_ltz6
  %op14 = load i32*, i32** %op2
  %op15 = getelementptr i32, i32* %op14, i32 0
  %op16 = load i32, i32* %op15
  store i32 %op16, i32* %op9
  %op17 = icmp slt i32 1, zeroinitializer
  %op18 = zext i1 %op17 to i32
  %op19 = add i32 %op18, zeroinitializer
  %op20 = icmp ne i32 %op19, zeroinitializer
  br i1 %op20, label %label_temp_ltz8, label %label_temp_gtz9
label_temp_ltz8:                                                ; preds = %label_arr_gtz7
  call void @neg_idx_except()
  br label %label_temp_gtz9
label_temp_gtz9:                                                ; preds = %label_arr_gtz7, %label_temp_ltz8
  %op21 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 1
  %op22 = icmp slt i32 0, zeroinitializer
  %op23 = zext i1 %op22 to i32
  %op24 = add i32 %op23, zeroinitializer
  %op25 = icmp ne i32 %op24, zeroinitializer
  br i1 %op25, label %label_arr_ltz10, label %label_arr_gtz11
label_arr_ltz10:                                                ; preds = %label_temp_gtz9
  call void @neg_idx_except()
  br label %label_arr_gtz11
label_arr_gtz11:                                                ; preds = %label_temp_gtz9, %label_arr_ltz10
  %op26 = load i32*, i32** %op2
  %op27 = getelementptr i32, i32* %op26, i32 0
  %op28 = load i32, i32* %op27
  %op29 = icmp slt i32 1, zeroinitializer
  %op30 = zext i1 %op29 to i32
  %op31 = add i32 %op30, zeroinitializer
  %op32 = icmp ne i32 %op31, zeroinitializer
  br i1 %op32, label %label_arr_ltz12, label %label_arr_gtz13
label_arr_ltz12:                                                ; preds = %label_arr_gtz11
  call void @neg_idx_except()
  br label %label_arr_gtz13
label_arr_gtz13:                                                ; preds = %label_arr_gtz11, %label_arr_ltz12
  %op33 = load i32*, i32** %op2
  %op34 = getelementptr i32, i32* %op33, i32 1
  %op35 = load i32, i32* %op34
  %op36 = call i32 @MAX(i32 %op28, i32 %op35)
  store i32 %op36, i32* %op21
  %op37 = alloca i32
  store i32 2, i32* %op37
  br label %label_condition14
label_condition14:                                                ; preds = %label_arr_gtz13, %label_temp_gtz24
  %op38 = load i32, i32* %op37
  %op39 = load i32, i32* %op3
  %op40 = icmp slt i32 %op38, %op39
  %op41 = zext i1 %op40 to i32
  %op42 = icmp sgt i32 %op41, zeroinitializer
  br i1 %op42, label %label_loop15, label %label_ret16
label_loop15:                                                ; preds = %label_condition14
  %op43 = load i32, i32* %op37
  %op44 = icmp slt i32 %op43, zeroinitializer
  %op45 = zext i1 %op44 to i32
  %op46 = add i32 %op45, zeroinitializer
  %op47 = icmp ne i32 %op46, zeroinitializer
  br i1 %op47, label %label_temp_ltz17, label %label_temp_gtz18
label_ret16:                                                ; preds = %label_condition14
  %op48 = load i32, i32* %op3
  %op49 = sub i32 %op48, 1
  %op50 = icmp slt i32 %op49, zeroinitializer
  %op51 = zext i1 %op50 to i32
  %op52 = add i32 %op51, zeroinitializer
  %op53 = icmp ne i32 %op52, zeroinitializer
  br i1 %op53, label %label_temp_ltz25, label %label_temp_gtz26
label_temp_ltz17:                                                ; preds = %label_loop15
  call void @neg_idx_except()
  br label %label_temp_gtz18
label_temp_gtz18:                                                ; preds = %label_loop15, %label_temp_ltz17
  %op54 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 %op43
  %op55 = load i32, i32* %op37
  %op56 = sub i32 %op55, 2
  %op57 = icmp slt i32 %op56, zeroinitializer
  %op58 = zext i1 %op57 to i32
  %op59 = add i32 %op58, zeroinitializer
  %op60 = icmp ne i32 %op59, zeroinitializer
  br i1 %op60, label %label_temp_ltz19, label %label_temp_gtz20
label_temp_ltz19:                                                ; preds = %label_temp_gtz18
  call void @neg_idx_except()
  br label %label_temp_gtz20
label_temp_gtz20:                                                ; preds = %label_temp_gtz18, %label_temp_ltz19
  %op61 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 %op56
  %op62 = load i32, i32* %op61
  %op63 = load i32, i32* %op37
  %op64 = icmp slt i32 %op63, zeroinitializer
  %op65 = zext i1 %op64 to i32
  %op66 = add i32 %op65, zeroinitializer
  %op67 = icmp ne i32 %op66, zeroinitializer
  br i1 %op67, label %label_arr_ltz21, label %label_arr_gtz22
label_arr_ltz21:                                                ; preds = %label_temp_gtz20
  call void @neg_idx_except()
  br label %label_arr_gtz22
label_arr_gtz22:                                                ; preds = %label_temp_gtz20, %label_arr_ltz21
  %op68 = load i32*, i32** %op2
  %op69 = getelementptr i32, i32* %op68, i32 %op63
  %op70 = load i32, i32* %op69
  %op71 = add i32 %op62, %op70
  %op72 = load i32, i32* %op37
  %op73 = sub i32 %op72, 1
  %op74 = icmp slt i32 %op73, zeroinitializer
  %op75 = zext i1 %op74 to i32
  %op76 = add i32 %op75, zeroinitializer
  %op77 = icmp ne i32 %op76, zeroinitializer
  br i1 %op77, label %label_temp_ltz23, label %label_temp_gtz24
label_temp_ltz23:                                                ; preds = %label_arr_gtz22
  call void @neg_idx_except()
  br label %label_temp_gtz24
label_temp_gtz24:                                                ; preds = %label_arr_gtz22, %label_temp_ltz23
  %op78 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 %op73
  %op79 = load i32, i32* %op78
  %op80 = call i32 @MAX(i32 %op71, i32 %op79)
  store i32 %op80, i32* %op54
  %op81 = load i32, i32* %op37
  %op82 = add i32 %op81, 1
  store i32 %op82, i32* %op37
  br label %label_condition14
label_temp_ltz25:                                                ; preds = %label_ret16
  call void @neg_idx_except()
  br label %label_temp_gtz26
label_temp_gtz26:                                                ; preds = %label_ret16, %label_temp_ltz25
  %op83 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 %op49
  %op84 = load i32, i32* %op83
  ret i32 %op84
}
define i32 @longest_common_subseq(i32* %arg0, i32 %arg1, i32* %arg2, i32 %arg3) {
label_entry:
  %op4 = alloca i32*
  store i32* %arg0, i32** %op4
  %op5 = alloca i32
  store i32 %arg1, i32* %op5
  %op6 = alloca i32*
  store i32* %arg2, i32** %op6
  %op7 = alloca i32
  store i32 %arg3, i32* %op7
  %op8 = alloca [16 x [16 x i32]]
  store [16 x [16 x i32]] [[16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer], [16 x [16 x i32]]* %op8
  %op9 = alloca i32
  %op10 = alloca i32
  store i32 1, i32* %op9
  br label %label_condition27
label_condition27:                                                ; preds = %label_entry, %label_ret32
  %op11 = load i32, i32* %op9
  %op12 = load i32, i32* %op5
  %op13 = icmp sle i32 %op11, %op12
  %op14 = zext i1 %op13 to i32
  %op15 = icmp sgt i32 %op14, zeroinitializer
  br i1 %op15, label %label_loop28, label %label_ret29
label_loop28:                                                ; preds = %label_condition27
  store i32 1, i32* %op10
  br label %label_condition30
label_ret29:                                                ; preds = %label_condition27
  %op16 = load i32, i32* %op7
  %op17 = load i32, i32* %op5
  %op18 = icmp slt i32 %op17, zeroinitializer
  %op19 = zext i1 %op18 to i32
  %op20 = add i32 %op19, zeroinitializer
  %op21 = icmp slt i32 %op16, zeroinitializer
  %op22 = zext i1 %op21 to i32
  %op23 = add i32 %op22, %op20
  %op24 = icmp ne i32 %op23, zeroinitializer
  br i1 %op24, label %label_p_ltz50, label %label_p_gtz51
label_condition30:                                                ; preds = %label_loop28, %label_ret49
  %op25 = load i32, i32* %op10
  %op26 = load i32, i32* %op7
  %op27 = icmp sle i32 %op25, %op26
  %op28 = zext i1 %op27 to i32
  %op29 = icmp sgt i32 %op28, zeroinitializer
  br i1 %op29, label %label_loop31, label %label_ret32
label_loop31:                                                ; preds = %label_condition30
  %op30 = load i32, i32* %op9
  %op31 = sub i32 %op30, 1
  %op32 = icmp slt i32 %op31, zeroinitializer
  %op33 = zext i1 %op32 to i32
  %op34 = add i32 %op33, zeroinitializer
  %op35 = icmp ne i32 %op34, zeroinitializer
  br i1 %op35, label %label_arr1_ltz33, label %label_arr1_gtz34
label_ret32:                                                ; preds = %label_condition30
  %op36 = load i32, i32* %op9
  %op37 = add i32 %op36, 1
  store i32 %op37, i32* %op9
  br label %label_condition27
label_arr1_ltz33:                                                ; preds = %label_loop31
  call void @neg_idx_except()
  br label %label_arr1_gtz34
label_arr1_gtz34:                                                ; preds = %label_loop31, %label_arr1_ltz33
  %op38 = load i32*, i32** %op4
  %op39 = getelementptr i32, i32* %op38, i32 %op31
  %op40 = load i32, i32* %op39
  %op41 = load i32, i32* %op10
  %op42 = sub i32 %op41, 1
  %op43 = icmp slt i32 %op42, zeroinitializer
  %op44 = zext i1 %op43 to i32
  %op45 = add i32 %op44, zeroinitializer
  %op46 = icmp ne i32 %op45, zeroinitializer
  br i1 %op46, label %label_arr2_ltz35, label %label_arr2_gtz36
label_arr2_ltz35:                                                ; preds = %label_arr1_gtz34
  call void @neg_idx_except()
  br label %label_arr2_gtz36
label_arr2_gtz36:                                                ; preds = %label_arr1_gtz34, %label_arr2_ltz35
  %op47 = load i32*, i32** %op6
  %op48 = getelementptr i32, i32* %op47, i32 %op42
  %op49 = load i32, i32* %op48
  %op50 = icmp eq i32 %op40, %op49
  %op51 = zext i1 %op50 to i32
  %op52 = icmp sgt i32 %op51, zeroinitializer
  br i1 %op52, label %label_true37, label %label_false38
label_true37:                                                ; preds = %label_arr2_gtz36
  %op53 = load i32, i32* %op10
  %op54 = load i32, i32* %op9
  %op55 = icmp slt i32 %op54, zeroinitializer
  %op56 = zext i1 %op55 to i32
  %op57 = add i32 %op56, zeroinitializer
  %op58 = icmp slt i32 %op53, zeroinitializer
  %op59 = zext i1 %op58 to i32
  %op60 = add i32 %op59, %op57
  %op61 = icmp ne i32 %op60, zeroinitializer
  br i1 %op61, label %label_p_ltz39, label %label_p_gtz40
label_false38:                                                ; preds = %label_arr2_gtz36
  %op62 = load i32, i32* %op10
  %op63 = load i32, i32* %op9
  %op64 = icmp slt i32 %op63, zeroinitializer
  %op65 = zext i1 %op64 to i32
  %op66 = add i32 %op65, zeroinitializer
  %op67 = icmp slt i32 %op62, zeroinitializer
  %op68 = zext i1 %op67 to i32
  %op69 = add i32 %op68, %op66
  %op70 = icmp ne i32 %op69, zeroinitializer
  br i1 %op70, label %label_p_ltz43, label %label_p_gtz44
label_p_ltz39:                                                ; preds = %label_true37
  call void @neg_idx_except()
  br label %label_p_gtz40
label_p_gtz40:                                                ; preds = %label_true37, %label_p_ltz39
  %op71 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op54, i32 %op53
  %op72 = load i32, i32* %op10
  %op73 = sub i32 %op72, 1
  %op74 = load i32, i32* %op9
  %op75 = sub i32 %op74, 1
  %op76 = icmp slt i32 %op75, zeroinitializer
  %op77 = zext i1 %op76 to i32
  %op78 = add i32 %op77, zeroinitializer
  %op79 = icmp slt i32 %op73, zeroinitializer
  %op80 = zext i1 %op79 to i32
  %op81 = add i32 %op80, %op78
  %op82 = icmp ne i32 %op81, zeroinitializer
  br i1 %op82, label %label_p_ltz41, label %label_p_gtz42
label_p_ltz41:                                                ; preds = %label_p_gtz40
  call void @neg_idx_except()
  br label %label_p_gtz42
label_p_gtz42:                                                ; preds = %label_p_gtz40, %label_p_ltz41
  %op83 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op75, i32 %op73
  %op84 = load i32, i32* %op83
  %op85 = add i32 %op84, 1
  store i32 %op85, i32* %op71
  br label %label_ret49
label_p_ltz43:                                                ; preds = %label_false38
  call void @neg_idx_except()
  br label %label_p_gtz44
label_p_gtz44:                                                ; preds = %label_false38, %label_p_ltz43
  %op86 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op63, i32 %op62
  %op87 = load i32, i32* %op10
  %op88 = load i32, i32* %op9
  %op89 = sub i32 %op88, 1
  %op90 = icmp slt i32 %op89, zeroinitializer
  %op91 = zext i1 %op90 to i32
  %op92 = add i32 %op91, zeroinitializer
  %op93 = icmp slt i32 %op87, zeroinitializer
  %op94 = zext i1 %op93 to i32
  %op95 = add i32 %op94, %op92
  %op96 = icmp ne i32 %op95, zeroinitializer
  br i1 %op96, label %label_p_ltz45, label %label_p_gtz46
label_p_ltz45:                                                ; preds = %label_p_gtz44
  call void @neg_idx_except()
  br label %label_p_gtz46
label_p_gtz46:                                                ; preds = %label_p_gtz44, %label_p_ltz45
  %op97 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op89, i32 %op87
  %op98 = load i32, i32* %op97
  %op99 = load i32, i32* %op10
  %op100 = sub i32 %op99, 1
  %op101 = load i32, i32* %op9
  %op102 = icmp slt i32 %op101, zeroinitializer
  %op103 = zext i1 %op102 to i32
  %op104 = add i32 %op103, zeroinitializer
  %op105 = icmp slt i32 %op100, zeroinitializer
  %op106 = zext i1 %op105 to i32
  %op107 = add i32 %op106, %op104
  %op108 = icmp ne i32 %op107, zeroinitializer
  br i1 %op108, label %label_p_ltz47, label %label_p_gtz48
label_p_ltz47:                                                ; preds = %label_p_gtz46
  call void @neg_idx_except()
  br label %label_p_gtz48
label_p_gtz48:                                                ; preds = %label_p_gtz46, %label_p_ltz47
  %op109 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op101, i32 %op100
  %op110 = load i32, i32* %op109
  %op111 = call i32 @MAX(i32 %op98, i32 %op110)
  store i32 %op111, i32* %op86
  br label %label_ret49
label_ret49:                                                ; preds = %label_p_gtz42, %label_p_gtz48
  %op112 = load i32, i32* %op10
  %op113 = add i32 %op112, 1
  store i32 %op113, i32* %op10
  br label %label_condition30
label_p_ltz50:                                                ; preds = %label_ret29
  call void @neg_idx_except()
  br label %label_p_gtz51
label_p_gtz51:                                                ; preds = %label_ret29, %label_p_ltz50
  %op114 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op17, i32 %op16
  %op115 = load i32, i32* %op114
  ret i32 %op115
}
define i32 @main() {
label_entry:
  %op0 = alloca [15 x i32]
  store [15 x i32] [i32 8, i32 7, i32 4, i32 1, i32 2, i32 7, i32 0, i32 1, i32 9, i32 3, i32 4, i32 8, i32 3, i32 7, i32 0], [15 x i32]* %op0
  %op1 = alloca [13 x i32]
  store [13 x i32] [i32 3, i32 9, i32 7, i32 1, i32 4, i32 2, i32 4, i32 3, i32 6, i32 8, i32 0, i32 1, i32 5], [13 x i32]* %op1
  %op2 = alloca i32
  %op3 = alloca i32
  %op4 = getelementptr [15 x i32], [15 x i32]* %op0, i32 0, i32 0
  %op5 = call i32 @max_sum_nonadjacent(i32* %op4, i32 15)
  call void @putint(i32 %op5)
  call void @putch(i32 10)
  %op6 = getelementptr [15 x i32], [15 x i32]* %op0, i32 0, i32 0
  %op7 = getelementptr [13 x i32], [13 x i32]* %op1, i32 0, i32 0
  %op8 = call i32 @longest_common_subseq(i32* %op6, i32 15, i32* %op7, i32 13)
  call void @putint(i32 %op8)
  call void @putch(i32 10)
  ret i32 0
}
