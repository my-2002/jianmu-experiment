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
  %op2 = alloca i32
  store i32 %arg0, i32* %op2
  %op3 = alloca i32
  store i32 %arg1, i32* %op3
  %op4 = load i32, i32* %op2
  %op5 = load i32, i32* %op3
  %op6 = add i32 %op4, %op5
  %op7 = icmp eq i32 %op4, %op5
  %op8 = zext i1 %op7 to i32
  %op9 = icmp sgt i32 %op8, zeroinitializer
  br i1 %op9, label %label_true0, label %label_false1
label_true0:                                                ; preds = %label_entry
  %op10 = load i32, i32* %op2
  ret i32 %op10
label_false1:                                                ; preds = %label_entry
  %op11 = load i32, i32* %op3
  %op12 = icmp sgt i32 %op11, zeroinitializer
  br i1 %op12, label %label_true2, label %label_false3
label_true2:                                                ; preds = %label_false1
  %op13 = load i32, i32* %op2
  ret i32 %op13
label_false3:                                                ; preds = %label_false1
  %op14 = load i32, i32* %op3
  ret i32 %op14
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
  %op39 = icmp sgt i32 %op38, zeroinitializer
  br i1 %op39, label %label_loop15, label %label_ret16
label_loop15:                                                ; preds = %label_condition14
  %op40 = load i32, i32* %op37
  %op41 = icmp slt i32 %op40, zeroinitializer
  %op42 = zext i1 %op41 to i32
  %op43 = add i32 %op42, zeroinitializer
  %op44 = icmp ne i32 %op43, zeroinitializer
  br i1 %op44, label %label_temp_ltz17, label %label_temp_gtz18
label_ret16:                                                ; preds = %label_condition14
  %op45 = load i32, i32* %op3
  %op46 = sub i32 %op45, 1
  %op47 = icmp slt i32 %op46, zeroinitializer
  %op48 = zext i1 %op47 to i32
  %op49 = add i32 %op48, zeroinitializer
  %op50 = icmp ne i32 %op49, zeroinitializer
  br i1 %op50, label %label_temp_ltz25, label %label_temp_gtz26
label_temp_ltz17:                                                ; preds = %label_loop15
  call void @neg_idx_except()
  br label %label_temp_gtz18
label_temp_gtz18:                                                ; preds = %label_loop15, %label_temp_ltz17
  %op51 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 %op40
  %op52 = load i32, i32* %op37
  %op53 = sub i32 %op52, 2
  %op54 = icmp slt i32 %op53, zeroinitializer
  %op55 = zext i1 %op54 to i32
  %op56 = add i32 %op55, zeroinitializer
  %op57 = icmp ne i32 %op56, zeroinitializer
  br i1 %op57, label %label_temp_ltz19, label %label_temp_gtz20
label_temp_ltz19:                                                ; preds = %label_temp_gtz18
  call void @neg_idx_except()
  br label %label_temp_gtz20
label_temp_gtz20:                                                ; preds = %label_temp_gtz18, %label_temp_ltz19
  %op58 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 %op53
  %op59 = load i32, i32* %op58
  %op60 = load i32, i32* %op37
  %op61 = icmp slt i32 %op60, zeroinitializer
  %op62 = zext i1 %op61 to i32
  %op63 = add i32 %op62, zeroinitializer
  %op64 = icmp ne i32 %op63, zeroinitializer
  br i1 %op64, label %label_arr_ltz21, label %label_arr_gtz22
label_arr_ltz21:                                                ; preds = %label_temp_gtz20
  call void @neg_idx_except()
  br label %label_arr_gtz22
label_arr_gtz22:                                                ; preds = %label_temp_gtz20, %label_arr_ltz21
  %op65 = load i32*, i32** %op2
  %op66 = getelementptr i32, i32* %op65, i32 %op60
  %op67 = load i32, i32* %op66
  %op68 = add i32 %op59, %op67
  %op69 = load i32, i32* %op37
  %op70 = sub i32 %op69, 1
  %op71 = icmp slt i32 %op70, zeroinitializer
  %op72 = zext i1 %op71 to i32
  %op73 = add i32 %op72, zeroinitializer
  %op74 = icmp ne i32 %op73, zeroinitializer
  br i1 %op74, label %label_temp_ltz23, label %label_temp_gtz24
label_temp_ltz23:                                                ; preds = %label_arr_gtz22
  call void @neg_idx_except()
  br label %label_temp_gtz24
label_temp_gtz24:                                                ; preds = %label_arr_gtz22, %label_temp_ltz23
  %op75 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 %op70
  %op76 = load i32, i32* %op75
  %op77 = call i32 @MAX(i32 %op68, i32 %op76)
  store i32 %op77, i32* %op51
  %op78 = load i32, i32* %op37
  %op79 = add i32 %op78, 1
  store i32 %op79, i32* %op37
  br label %label_condition14
label_temp_ltz25:                                                ; preds = %label_ret16
  call void @neg_idx_except()
  br label %label_temp_gtz26
label_temp_gtz26:                                                ; preds = %label_ret16, %label_temp_ltz25
  %op80 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 %op46
  %op81 = load i32, i32* %op80
  ret i32 %op81
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
  %op12 = icmp sgt i32 %op11, zeroinitializer
  br i1 %op12, label %label_loop28, label %label_ret29
label_loop28:                                                ; preds = %label_condition27
  store i32 1, i32* %op10
  br label %label_condition30
label_ret29:                                                ; preds = %label_condition27
  %op13 = load i32, i32* %op7
  %op14 = load i32, i32* %op5
  %op15 = icmp slt i32 %op14, zeroinitializer
  %op16 = zext i1 %op15 to i32
  %op17 = add i32 %op16, zeroinitializer
  %op18 = icmp slt i32 %op13, zeroinitializer
  %op19 = zext i1 %op18 to i32
  %op20 = add i32 %op19, %op17
  %op21 = icmp ne i32 %op20, zeroinitializer
  br i1 %op21, label %label_p_ltz50, label %label_p_gtz51
label_condition30:                                                ; preds = %label_loop28, %label_ret49
  %op22 = load i32, i32* %op7
  %op23 = icmp sgt i32 %op22, zeroinitializer
  br i1 %op23, label %label_loop31, label %label_ret32
label_loop31:                                                ; preds = %label_condition30
  %op24 = load i32, i32* %op9
  %op25 = sub i32 %op24, 1
  %op26 = icmp slt i32 %op25, zeroinitializer
  %op27 = zext i1 %op26 to i32
  %op28 = add i32 %op27, zeroinitializer
  %op29 = icmp ne i32 %op28, zeroinitializer
  br i1 %op29, label %label_arr1_ltz33, label %label_arr1_gtz34
label_ret32:                                                ; preds = %label_condition30
  %op30 = load i32, i32* %op9
  %op31 = add i32 %op30, 1
  store i32 %op31, i32* %op9
  br label %label_condition27
label_arr1_ltz33:                                                ; preds = %label_loop31
  call void @neg_idx_except()
  br label %label_arr1_gtz34
label_arr1_gtz34:                                                ; preds = %label_loop31, %label_arr1_ltz33
  %op32 = load i32*, i32** %op4
  %op33 = getelementptr i32, i32* %op32, i32 %op25
  %op34 = load i32, i32* %op33
  %op35 = load i32, i32* %op10
  %op36 = sub i32 %op35, 1
  %op37 = icmp slt i32 %op36, zeroinitializer
  %op38 = zext i1 %op37 to i32
  %op39 = add i32 %op38, zeroinitializer
  %op40 = icmp ne i32 %op39, zeroinitializer
  br i1 %op40, label %label_arr2_ltz35, label %label_arr2_gtz36
label_arr2_ltz35:                                                ; preds = %label_arr1_gtz34
  call void @neg_idx_except()
  br label %label_arr2_gtz36
label_arr2_gtz36:                                                ; preds = %label_arr1_gtz34, %label_arr2_ltz35
  %op41 = load i32*, i32** %op6
  %op42 = getelementptr i32, i32* %op41, i32 %op36
  %op43 = load i32, i32* %op42
  %op44 = add i32 %op34, %op43
  %op45 = icmp eq i32 %op34, %op43
  %op46 = zext i1 %op45 to i32
  %op47 = icmp sgt i32 %op46, zeroinitializer
  br i1 %op47, label %label_true37, label %label_false38
label_true37:                                                ; preds = %label_arr2_gtz36
  %op48 = load i32, i32* %op10
  %op49 = load i32, i32* %op9
  %op50 = icmp slt i32 %op49, zeroinitializer
  %op51 = zext i1 %op50 to i32
  %op52 = add i32 %op51, zeroinitializer
  %op53 = icmp slt i32 %op48, zeroinitializer
  %op54 = zext i1 %op53 to i32
  %op55 = add i32 %op54, %op52
  %op56 = icmp ne i32 %op55, zeroinitializer
  br i1 %op56, label %label_p_ltz39, label %label_p_gtz40
label_false38:                                                ; preds = %label_arr2_gtz36
  %op57 = load i32, i32* %op10
  %op58 = load i32, i32* %op9
  %op59 = icmp slt i32 %op58, zeroinitializer
  %op60 = zext i1 %op59 to i32
  %op61 = add i32 %op60, zeroinitializer
  %op62 = icmp slt i32 %op57, zeroinitializer
  %op63 = zext i1 %op62 to i32
  %op64 = add i32 %op63, %op61
  %op65 = icmp ne i32 %op64, zeroinitializer
  br i1 %op65, label %label_p_ltz43, label %label_p_gtz44
label_p_ltz39:                                                ; preds = %label_true37
  call void @neg_idx_except()
  br label %label_p_gtz40
label_p_gtz40:                                                ; preds = %label_true37, %label_p_ltz39
  %op66 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op49, i32 %op48
  %op67 = load i32, i32* %op10
  %op68 = sub i32 %op67, 1
  %op69 = load i32, i32* %op9
  %op70 = sub i32 %op69, 1
  %op71 = icmp slt i32 %op70, zeroinitializer
  %op72 = zext i1 %op71 to i32
  %op73 = add i32 %op72, zeroinitializer
  %op74 = icmp slt i32 %op68, zeroinitializer
  %op75 = zext i1 %op74 to i32
  %op76 = add i32 %op75, %op73
  %op77 = icmp ne i32 %op76, zeroinitializer
  br i1 %op77, label %label_p_ltz41, label %label_p_gtz42
label_p_ltz41:                                                ; preds = %label_p_gtz40
  call void @neg_idx_except()
  br label %label_p_gtz42
label_p_gtz42:                                                ; preds = %label_p_gtz40, %label_p_ltz41
  %op78 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op70, i32 %op68
  %op79 = load i32, i32* %op78
  %op80 = add i32 %op79, 1
  store i32 %op80, i32* %op66
  br label %label_ret49
label_p_ltz43:                                                ; preds = %label_false38
  call void @neg_idx_except()
  br label %label_p_gtz44
label_p_gtz44:                                                ; preds = %label_false38, %label_p_ltz43
  %op81 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op58, i32 %op57
  %op82 = load i32, i32* %op10
  %op83 = load i32, i32* %op9
  %op84 = sub i32 %op83, 1
  %op85 = icmp slt i32 %op84, zeroinitializer
  %op86 = zext i1 %op85 to i32
  %op87 = add i32 %op86, zeroinitializer
  %op88 = icmp slt i32 %op82, zeroinitializer
  %op89 = zext i1 %op88 to i32
  %op90 = add i32 %op89, %op87
  %op91 = icmp ne i32 %op90, zeroinitializer
  br i1 %op91, label %label_p_ltz45, label %label_p_gtz46
label_p_ltz45:                                                ; preds = %label_p_gtz44
  call void @neg_idx_except()
  br label %label_p_gtz46
label_p_gtz46:                                                ; preds = %label_p_gtz44, %label_p_ltz45
  %op92 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op84, i32 %op82
  %op93 = load i32, i32* %op92
  %op94 = load i32, i32* %op10
  %op95 = sub i32 %op94, 1
  %op96 = load i32, i32* %op9
  %op97 = icmp slt i32 %op96, zeroinitializer
  %op98 = zext i1 %op97 to i32
  %op99 = add i32 %op98, zeroinitializer
  %op100 = icmp slt i32 %op95, zeroinitializer
  %op101 = zext i1 %op100 to i32
  %op102 = add i32 %op101, %op99
  %op103 = icmp ne i32 %op102, zeroinitializer
  br i1 %op103, label %label_p_ltz47, label %label_p_gtz48
label_p_ltz47:                                                ; preds = %label_p_gtz46
  call void @neg_idx_except()
  br label %label_p_gtz48
label_p_gtz48:                                                ; preds = %label_p_gtz46, %label_p_ltz47
  %op104 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op96, i32 %op95
  %op105 = load i32, i32* %op104
  %op106 = call i32 @MAX(i32 %op93, i32 %op105)
  store i32 %op106, i32* %op81
  br label %label_ret49
label_ret49:                                                ; preds = %label_p_gtz42, %label_p_gtz48
  %op107 = load i32, i32* %op10
  %op108 = add i32 %op107, 1
  store i32 %op108, i32* %op10
  br label %label_condition30
label_p_ltz50:                                                ; preds = %label_ret29
  call void @neg_idx_except()
  br label %label_p_gtz51
label_p_gtz51:                                                ; preds = %label_ret29, %label_p_ltz50
  %op109 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op14, i32 %op13
  %op110 = load i32, i32* %op109
  ret i32 %op110
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
