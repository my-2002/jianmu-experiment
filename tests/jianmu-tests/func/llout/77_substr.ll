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
  %op4 = load i32, i32* %op3
  %op5 = load i32, i32* %op2
  %op6 = add i32 %op5, %op4
  %op7 = icmp eq i32 %op5, %op4
  %op8 = zext i1 %op7 to i32
  %op9 = icmp sgt i32 %op8, zeroinitializer
  br i1 %op9, label %label_true0, label %label_false1
label_true0:                                                ; preds = %label_entry
  %op10 = load i32, i32* %op2
  ret i32 %op10
label_false1:                                                ; preds = %label_entry
  %op11 = load i32, i32* %op3
  %op12 = load i32, i32* %op2
  %op13 = add i32 %op12, %op11
  %op14 = icmp sgt i32 %op12, %op11
  %op15 = zext i1 %op14 to i32
  %op16 = icmp sgt i32 %op15, zeroinitializer
  br i1 %op16, label %label_true2, label %label_false3
label_true2:                                                ; preds = %label_false1
  %op17 = load i32, i32* %op2
  ret i32 %op17
label_false3:                                                ; preds = %label_false1
  %op18 = load i32, i32* %op3
  ret i32 %op18
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
  %op38 = load i32, i32* %op3
  %op39 = load i32, i32* %op37
  %op40 = add i32 %op39, %op38
  %op41 = icmp slt i32 %op39, %op38
  %op42 = zext i1 %op41 to i32
  %op43 = icmp sgt i32 %op42, zeroinitializer
  br i1 %op43, label %label_loop15, label %label_ret16
label_loop15:                                                ; preds = %label_condition14
  %op44 = load i32, i32* %op37
  %op45 = icmp slt i32 %op44, zeroinitializer
  %op46 = zext i1 %op45 to i32
  %op47 = add i32 %op46, zeroinitializer
  %op48 = icmp ne i32 %op47, zeroinitializer
  br i1 %op48, label %label_temp_ltz17, label %label_temp_gtz18
label_ret16:                                                ; preds = %label_condition14
  %op49 = load i32, i32* %op3
  %op50 = sub i32 %op49, 1
  %op51 = icmp slt i32 %op50, zeroinitializer
  %op52 = zext i1 %op51 to i32
  %op53 = add i32 %op52, zeroinitializer
  %op54 = icmp ne i32 %op53, zeroinitializer
  br i1 %op54, label %label_temp_ltz25, label %label_temp_gtz26
label_temp_ltz17:                                                ; preds = %label_loop15
  call void @neg_idx_except()
  br label %label_temp_gtz18
label_temp_gtz18:                                                ; preds = %label_loop15, %label_temp_ltz17
  %op55 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 %op44
  %op56 = load i32, i32* %op37
  %op57 = sub i32 %op56, 2
  %op58 = icmp slt i32 %op57, zeroinitializer
  %op59 = zext i1 %op58 to i32
  %op60 = add i32 %op59, zeroinitializer
  %op61 = icmp ne i32 %op60, zeroinitializer
  br i1 %op61, label %label_temp_ltz19, label %label_temp_gtz20
label_temp_ltz19:                                                ; preds = %label_temp_gtz18
  call void @neg_idx_except()
  br label %label_temp_gtz20
label_temp_gtz20:                                                ; preds = %label_temp_gtz18, %label_temp_ltz19
  %op62 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 %op57
  %op63 = load i32, i32* %op62
  %op64 = load i32, i32* %op37
  %op65 = icmp slt i32 %op64, zeroinitializer
  %op66 = zext i1 %op65 to i32
  %op67 = add i32 %op66, zeroinitializer
  %op68 = icmp ne i32 %op67, zeroinitializer
  br i1 %op68, label %label_arr_ltz21, label %label_arr_gtz22
label_arr_ltz21:                                                ; preds = %label_temp_gtz20
  call void @neg_idx_except()
  br label %label_arr_gtz22
label_arr_gtz22:                                                ; preds = %label_temp_gtz20, %label_arr_ltz21
  %op69 = load i32*, i32** %op2
  %op70 = getelementptr i32, i32* %op69, i32 %op64
  %op71 = load i32, i32* %op70
  %op72 = add i32 %op63, %op71
  %op73 = load i32, i32* %op37
  %op74 = sub i32 %op73, 1
  %op75 = icmp slt i32 %op74, zeroinitializer
  %op76 = zext i1 %op75 to i32
  %op77 = add i32 %op76, zeroinitializer
  %op78 = icmp ne i32 %op77, zeroinitializer
  br i1 %op78, label %label_temp_ltz23, label %label_temp_gtz24
label_temp_ltz23:                                                ; preds = %label_arr_gtz22
  call void @neg_idx_except()
  br label %label_temp_gtz24
label_temp_gtz24:                                                ; preds = %label_arr_gtz22, %label_temp_ltz23
  %op79 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 %op74
  %op80 = load i32, i32* %op79
  %op81 = call i32 @MAX(i32 %op72, i32 %op80)
  store i32 %op81, i32* %op55
  %op82 = load i32, i32* %op37
  %op83 = add i32 %op82, 1
  store i32 %op83, i32* %op37
  br label %label_condition14
label_temp_ltz25:                                                ; preds = %label_ret16
  call void @neg_idx_except()
  br label %label_temp_gtz26
label_temp_gtz26:                                                ; preds = %label_ret16, %label_temp_ltz25
  %op84 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 %op50
  %op85 = load i32, i32* %op84
  ret i32 %op85
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
  %op11 = load i32, i32* %op5
  %op12 = load i32, i32* %op9
  %op13 = add i32 %op12, %op11
  %op14 = icmp sle i32 %op12, %op11
  %op15 = zext i1 %op14 to i32
  %op16 = icmp sgt i32 %op15, zeroinitializer
  br i1 %op16, label %label_loop28, label %label_ret29
label_loop28:                                                ; preds = %label_condition27
  store i32 1, i32* %op10
  br label %label_condition30
label_ret29:                                                ; preds = %label_condition27
  %op17 = load i32, i32* %op7
  %op18 = load i32, i32* %op5
  %op19 = icmp slt i32 %op18, zeroinitializer
  %op20 = zext i1 %op19 to i32
  %op21 = add i32 %op20, zeroinitializer
  %op22 = icmp slt i32 %op17, zeroinitializer
  %op23 = zext i1 %op22 to i32
  %op24 = add i32 %op23, %op21
  %op25 = icmp ne i32 %op24, zeroinitializer
  br i1 %op25, label %label_p_ltz50, label %label_p_gtz51
label_condition30:                                                ; preds = %label_loop28, %label_ret49
  %op26 = load i32, i32* %op7
  %op27 = load i32, i32* %op10
  %op28 = add i32 %op27, %op26
  %op29 = icmp sle i32 %op27, %op26
  %op30 = zext i1 %op29 to i32
  %op31 = icmp sgt i32 %op30, zeroinitializer
  br i1 %op31, label %label_loop31, label %label_ret32
label_loop31:                                                ; preds = %label_condition30
  %op32 = load i32, i32* %op10
  %op33 = sub i32 %op32, 1
  %op34 = icmp slt i32 %op33, zeroinitializer
  %op35 = zext i1 %op34 to i32
  %op36 = add i32 %op35, zeroinitializer
  %op37 = icmp ne i32 %op36, zeroinitializer
  br i1 %op37, label %label_arr2_ltz33, label %label_arr2_gtz34
label_ret32:                                                ; preds = %label_condition30
  %op38 = load i32, i32* %op9
  %op39 = add i32 %op38, 1
  store i32 %op39, i32* %op9
  br label %label_condition27
label_arr2_ltz33:                                                ; preds = %label_loop31
  call void @neg_idx_except()
  br label %label_arr2_gtz34
label_arr2_gtz34:                                                ; preds = %label_loop31, %label_arr2_ltz33
  %op40 = load i32*, i32** %op6
  %op41 = getelementptr i32, i32* %op40, i32 %op33
  %op42 = load i32, i32* %op41
  %op43 = load i32, i32* %op9
  %op44 = sub i32 %op43, 1
  %op45 = icmp slt i32 %op44, zeroinitializer
  %op46 = zext i1 %op45 to i32
  %op47 = add i32 %op46, zeroinitializer
  %op48 = icmp ne i32 %op47, zeroinitializer
  br i1 %op48, label %label_arr1_ltz35, label %label_arr1_gtz36
label_arr1_ltz35:                                                ; preds = %label_arr2_gtz34
  call void @neg_idx_except()
  br label %label_arr1_gtz36
label_arr1_gtz36:                                                ; preds = %label_arr2_gtz34, %label_arr1_ltz35
  %op49 = load i32*, i32** %op4
  %op50 = getelementptr i32, i32* %op49, i32 %op44
  %op51 = load i32, i32* %op50
  %op52 = add i32 %op51, %op42
  %op53 = icmp eq i32 %op51, %op42
  %op54 = zext i1 %op53 to i32
  %op55 = icmp sgt i32 %op54, zeroinitializer
  br i1 %op55, label %label_true37, label %label_false38
label_true37:                                                ; preds = %label_arr1_gtz36
  %op56 = load i32, i32* %op10
  %op57 = load i32, i32* %op9
  %op58 = icmp slt i32 %op57, zeroinitializer
  %op59 = zext i1 %op58 to i32
  %op60 = add i32 %op59, zeroinitializer
  %op61 = icmp slt i32 %op56, zeroinitializer
  %op62 = zext i1 %op61 to i32
  %op63 = add i32 %op62, %op60
  %op64 = icmp ne i32 %op63, zeroinitializer
  br i1 %op64, label %label_p_ltz39, label %label_p_gtz40
label_false38:                                                ; preds = %label_arr1_gtz36
  %op65 = load i32, i32* %op10
  %op66 = load i32, i32* %op9
  %op67 = icmp slt i32 %op66, zeroinitializer
  %op68 = zext i1 %op67 to i32
  %op69 = add i32 %op68, zeroinitializer
  %op70 = icmp slt i32 %op65, zeroinitializer
  %op71 = zext i1 %op70 to i32
  %op72 = add i32 %op71, %op69
  %op73 = icmp ne i32 %op72, zeroinitializer
  br i1 %op73, label %label_p_ltz43, label %label_p_gtz44
label_p_ltz39:                                                ; preds = %label_true37
  call void @neg_idx_except()
  br label %label_p_gtz40
label_p_gtz40:                                                ; preds = %label_true37, %label_p_ltz39
  %op74 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op57, i32 %op56
  %op75 = load i32, i32* %op10
  %op76 = sub i32 %op75, 1
  %op77 = load i32, i32* %op9
  %op78 = sub i32 %op77, 1
  %op79 = icmp slt i32 %op78, zeroinitializer
  %op80 = zext i1 %op79 to i32
  %op81 = add i32 %op80, zeroinitializer
  %op82 = icmp slt i32 %op76, zeroinitializer
  %op83 = zext i1 %op82 to i32
  %op84 = add i32 %op83, %op81
  %op85 = icmp ne i32 %op84, zeroinitializer
  br i1 %op85, label %label_p_ltz41, label %label_p_gtz42
label_p_ltz41:                                                ; preds = %label_p_gtz40
  call void @neg_idx_except()
  br label %label_p_gtz42
label_p_gtz42:                                                ; preds = %label_p_gtz40, %label_p_ltz41
  %op86 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op78, i32 %op76
  %op87 = load i32, i32* %op86
  %op88 = add i32 %op87, 1
  store i32 %op88, i32* %op74
  br label %label_ret49
label_p_ltz43:                                                ; preds = %label_false38
  call void @neg_idx_except()
  br label %label_p_gtz44
label_p_gtz44:                                                ; preds = %label_false38, %label_p_ltz43
  %op89 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op66, i32 %op65
  %op90 = load i32, i32* %op10
  %op91 = load i32, i32* %op9
  %op92 = sub i32 %op91, 1
  %op93 = icmp slt i32 %op92, zeroinitializer
  %op94 = zext i1 %op93 to i32
  %op95 = add i32 %op94, zeroinitializer
  %op96 = icmp slt i32 %op90, zeroinitializer
  %op97 = zext i1 %op96 to i32
  %op98 = add i32 %op97, %op95
  %op99 = icmp ne i32 %op98, zeroinitializer
  br i1 %op99, label %label_p_ltz45, label %label_p_gtz46
label_p_ltz45:                                                ; preds = %label_p_gtz44
  call void @neg_idx_except()
  br label %label_p_gtz46
label_p_gtz46:                                                ; preds = %label_p_gtz44, %label_p_ltz45
  %op100 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op92, i32 %op90
  %op101 = load i32, i32* %op100
  %op102 = load i32, i32* %op10
  %op103 = sub i32 %op102, 1
  %op104 = load i32, i32* %op9
  %op105 = icmp slt i32 %op104, zeroinitializer
  %op106 = zext i1 %op105 to i32
  %op107 = add i32 %op106, zeroinitializer
  %op108 = icmp slt i32 %op103, zeroinitializer
  %op109 = zext i1 %op108 to i32
  %op110 = add i32 %op109, %op107
  %op111 = icmp ne i32 %op110, zeroinitializer
  br i1 %op111, label %label_p_ltz47, label %label_p_gtz48
label_p_ltz47:                                                ; preds = %label_p_gtz46
  call void @neg_idx_except()
  br label %label_p_gtz48
label_p_gtz48:                                                ; preds = %label_p_gtz46, %label_p_ltz47
  %op112 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op104, i32 %op103
  %op113 = load i32, i32* %op112
  %op114 = call i32 @MAX(i32 %op101, i32 %op113)
  store i32 %op114, i32* %op89
  br label %label_ret49
label_ret49:                                                ; preds = %label_p_gtz42, %label_p_gtz48
  %op115 = load i32, i32* %op10
  %op116 = add i32 %op115, 1
  store i32 %op116, i32* %op10
  br label %label_condition30
label_p_ltz50:                                                ; preds = %label_ret29
  call void @neg_idx_except()
  br label %label_p_gtz51
label_p_gtz51:                                                ; preds = %label_ret29, %label_p_ltz50
  %op117 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op18, i32 %op17
  %op118 = load i32, i32* %op117
  ret i32 %op118
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
