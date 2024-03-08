; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/all_test_cases/hidden_functional/18_prim.sy"

@maxm = constant i32 1005
@maxn = constant i32 105
@n = global i32 zeroinitializer
@m = global i32 zeroinitializer
@u = global [1005 x i32] zeroinitializer
@v = global [1005 x i32] zeroinitializer
@c = global [1005 x i32] zeroinitializer
@fa = global [1005 x i32] zeroinitializer
declare void @neg_idx_except()

declare i32 @getint()

declare i32 @getch()

declare float @getfloat()

declare i32 @getarray(i32*)

declare i32 @getfarray(float*)

declare void @putint(i32)

declare void @putch(i32)

declare void @putarray(i32, i32*)

declare void @putfloat(float)

declare void @putfarray(i32, float*)

declare void @putf(i32*)

declare void @starttime()

declare void @stoptime()

define i32 @quick_read() {
label_entry:
  %op0 = call i32 @getch()
  %op1 = alloca i32
  store i32 %op0, i32* %op1
  %op2 = alloca i32
  store i32 0, i32* %op2
  %op3 = alloca i32
  store i32 0, i32* %op3
  br label %label_condition0
label_condition0:                                                ; preds = %label_entry, %label_ret7
  %op4 = load i32, i32* %op1
  %op5 = icmp slt i32 %op4, 48
  %op6 = zext i1 %op5 to i32
  %op7 = icmp sgt i32 %op6, zeroinitializer
  br i1 %op7, label %label_true3, label %label_false4
label_loop1:                                                ; preds = %label_ret5
  %op8 = load i32, i32* %op1
  %op9 = icmp eq i32 %op8, 45
  %op10 = zext i1 %op9 to i32
  %op11 = icmp sgt i32 %op10, zeroinitializer
  br i1 %op11, label %label_true6, label %label_ret7
label_ret2:                                                ; preds = %label_ret5
  br label %label_condition8
label_true3:                                                ; preds = %label_condition0
  %op12 = icmp sgt i32 1, zeroinitializer
  br label %label_ret5
label_false4:                                                ; preds = %label_condition0
  %op13 = load i32, i32* %op1
  %op14 = icmp sgt i32 %op13, 57
  %op15 = zext i1 %op14 to i32
  %op16 = icmp sgt i32 %op15, zeroinitializer
  br label %label_ret5
label_ret5:                                                ; preds = %label_false4, %label_true3
  %op17 = phi i1 [ %op12, %label_true3 ], [ %op16, %label_false4 ]
  %op18 = zext i1 %op17 to i32
  %op19 = icmp sgt i32 %op18, zeroinitializer
  br i1 %op19, label %label_loop1, label %label_ret2
label_true6:                                                ; preds = %label_loop1
  store i32 1, i32* %op3
  br label %label_ret7
label_ret7:                                                ; preds = %label_loop1, %label_true6
  %op20 = call i32 @getch()
  store i32 %op20, i32* %op1
  br label %label_condition0
label_condition8:                                                ; preds = %label_ret2, %label_loop9
  %op21 = load i32, i32* %op1
  %op22 = icmp sge i32 %op21, 48
  %op23 = zext i1 %op22 to i32
  %op24 = icmp sgt i32 %op23, zeroinitializer
  br i1 %op24, label %label_true11, label %label_false12
label_loop9:                                                ; preds = %label_ret13
  %op25 = load i32, i32* %op2
  %op26 = mul i32 %op25, 10
  %op27 = load i32, i32* %op1
  %op28 = add i32 %op26, %op27
  %op29 = sub i32 %op28, 48
  store i32 %op29, i32* %op2
  %op30 = call i32 @getch()
  store i32 %op30, i32* %op1
  br label %label_condition8
label_ret10:                                                ; preds = %label_ret13
  %op31 = load i32, i32* %op3
  %op32 = icmp sgt i32 %op31, zeroinitializer
  br i1 %op32, label %label_true14, label %label_false15
label_true11:                                                ; preds = %label_condition8
  %op33 = load i32, i32* %op1
  %op34 = icmp sle i32 %op33, 57
  %op35 = zext i1 %op34 to i32
  %op36 = icmp sgt i32 %op35, zeroinitializer
  br label %label_ret13
label_false12:                                                ; preds = %label_condition8
  %op37 = icmp sgt i32 zeroinitializer, zeroinitializer
  br label %label_ret13
label_ret13:                                                ; preds = %label_true11, %label_false12
  %op38 = phi i1 [ %op36, %label_true11 ], [ %op37, %label_false12 ]
  %op39 = zext i1 %op38 to i32
  %op40 = icmp sgt i32 %op39, zeroinitializer
  br i1 %op40, label %label_loop9, label %label_ret10
label_true14:                                                ; preds = %label_ret10
  %op41 = load i32, i32* %op2
  %op42 = sub i32 zeroinitializer, %op41
  ret i32 %op42
label_false15:                                                ; preds = %label_ret10
  %op43 = load i32, i32* %op2
  ret i32 %op43
}
define i32 @find(i32 %arg0) {
label_entry:
  %op1 = alloca i32
  store i32 %arg0, i32* %op1
  %op2 = load i32, i32* %op1
  %op3 = load i32, i32* %op1
  %op4 = icmp slt i32 %op3, zeroinitializer
  %op5 = zext i1 %op4 to i32
  %op6 = add i32 %op5, zeroinitializer
  %op7 = icmp ne i32 %op6, zeroinitializer
  br i1 %op7, label %label_fa_ltz16, label %label_fa_gtz17
label_fa_ltz16:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_fa_gtz17
label_fa_gtz17:                                                ; preds = %label_entry, %label_fa_ltz16
  %op8 = getelementptr [1005 x i32], [1005 x i32]* @fa, i32 0, i32 %op3
  %op9 = load i32, i32* %op8
  %op10 = icmp eq i32 %op2, %op9
  %op11 = zext i1 %op10 to i32
  %op12 = icmp sgt i32 %op11, zeroinitializer
  br i1 %op12, label %label_true18, label %label_ret19
label_true18:                                                ; preds = %label_fa_gtz17
  %op13 = load i32, i32* %op1
  ret i32 %op13
label_ret19:                                                ; preds = %label_fa_gtz17
  %op14 = load i32, i32* %op1
  %op15 = icmp slt i32 %op14, zeroinitializer
  %op16 = zext i1 %op15 to i32
  %op17 = add i32 %op16, zeroinitializer
  %op18 = icmp ne i32 %op17, zeroinitializer
  br i1 %op18, label %label_fa_ltz20, label %label_fa_gtz21
label_fa_ltz20:                                                ; preds = %label_ret19
  call void @neg_idx_except()
  br label %label_fa_gtz21
label_fa_gtz21:                                                ; preds = %label_ret19, %label_fa_ltz20
  %op19 = getelementptr [1005 x i32], [1005 x i32]* @fa, i32 0, i32 %op14
  %op20 = load i32, i32* %op19
  %op21 = call i32 @find(i32 %op20)
  %op22 = alloca i32
  store i32 %op21, i32* %op22
  %op23 = load i32, i32* %op1
  %op24 = icmp slt i32 %op23, zeroinitializer
  %op25 = zext i1 %op24 to i32
  %op26 = add i32 %op25, zeroinitializer
  %op27 = icmp ne i32 %op26, zeroinitializer
  br i1 %op27, label %label_fa_ltz22, label %label_fa_gtz23
label_fa_ltz22:                                                ; preds = %label_fa_gtz21
  call void @neg_idx_except()
  br label %label_fa_gtz23
label_fa_gtz23:                                                ; preds = %label_fa_gtz21, %label_fa_ltz22
  %op28 = getelementptr [1005 x i32], [1005 x i32]* @fa, i32 0, i32 %op23
  %op29 = load i32, i32* %op22
  store i32 %op29, i32* %op28
  %op30 = load i32, i32* %op22
  ret i32 %op30
}
define i32 @same(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = alloca i32
  store i32 %arg0, i32* %op2
  %op3 = alloca i32
  store i32 %arg1, i32* %op3
  %op4 = load i32, i32* %op2
  %op5 = call i32 @find(i32 %op4)
  store i32 %op5, i32* %op2
  %op6 = load i32, i32* %op3
  %op7 = call i32 @find(i32 %op6)
  store i32 %op7, i32* %op3
  %op8 = load i32, i32* %op2
  %op9 = load i32, i32* %op3
  %op10 = icmp eq i32 %op8, %op9
  %op11 = zext i1 %op10 to i32
  %op12 = icmp sgt i32 %op11, zeroinitializer
  br i1 %op12, label %label_true24, label %label_ret25
label_true24:                                                ; preds = %label_entry
  ret i32 1
label_ret25:                                                ; preds = %label_entry
  ret i32 0
}
define i32 @prim() {
label_entry:
  %op0 = alloca i32
  store i32 0, i32* %op0
  br label %label_condition26
label_condition26:                                                ; preds = %label_entry, %label_ret31
  %op1 = load i32, i32* %op0
  %op2 = load i32, i32* @m
  %op3 = icmp slt i32 %op1, %op2
  %op4 = zext i1 %op3 to i32
  %op5 = icmp sgt i32 %op4, zeroinitializer
  br i1 %op5, label %label_loop27, label %label_ret28
label_loop27:                                                ; preds = %label_condition26
  %op6 = load i32, i32* %op0
  %op7 = add i32 %op6, 1
  %op8 = alloca i32
  store i32 %op7, i32* %op8
  br label %label_condition29
label_ret28:                                                ; preds = %label_condition26
  store i32 1, i32* %op0
  br label %label_condition62
label_condition29:                                                ; preds = %label_loop27, %label_ret37
  %op9 = load i32, i32* %op8
  %op10 = load i32, i32* @m
  %op11 = icmp slt i32 %op9, %op10
  %op12 = zext i1 %op11 to i32
  %op13 = icmp sgt i32 %op12, zeroinitializer
  br i1 %op13, label %label_loop30, label %label_ret31
label_loop30:                                                ; preds = %label_condition29
  %op14 = load i32, i32* %op0
  %op15 = icmp slt i32 %op14, zeroinitializer
  %op16 = zext i1 %op15 to i32
  %op17 = add i32 %op16, zeroinitializer
  %op18 = icmp ne i32 %op17, zeroinitializer
  br i1 %op18, label %label_c_ltz32, label %label_c_gtz33
label_ret31:                                                ; preds = %label_condition29
  %op19 = load i32, i32* %op0
  %op20 = add i32 %op19, 1
  store i32 %op20, i32* %op0
  br label %label_condition26
label_c_ltz32:                                                ; preds = %label_loop30
  call void @neg_idx_except()
  br label %label_c_gtz33
label_c_gtz33:                                                ; preds = %label_loop30, %label_c_ltz32
  %op21 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %op14
  %op22 = load i32, i32* %op21
  %op23 = load i32, i32* %op8
  %op24 = icmp slt i32 %op23, zeroinitializer
  %op25 = zext i1 %op24 to i32
  %op26 = add i32 %op25, zeroinitializer
  %op27 = icmp ne i32 %op26, zeroinitializer
  br i1 %op27, label %label_c_ltz34, label %label_c_gtz35
label_c_ltz34:                                                ; preds = %label_c_gtz33
  call void @neg_idx_except()
  br label %label_c_gtz35
label_c_gtz35:                                                ; preds = %label_c_gtz33, %label_c_ltz34
  %op28 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %op23
  %op29 = load i32, i32* %op28
  %op30 = icmp sgt i32 %op22, %op29
  %op31 = zext i1 %op30 to i32
  %op32 = icmp sgt i32 %op31, zeroinitializer
  br i1 %op32, label %label_true36, label %label_ret37
label_true36:                                                ; preds = %label_c_gtz35
  %op33 = load i32, i32* %op0
  %op34 = icmp slt i32 %op33, zeroinitializer
  %op35 = zext i1 %op34 to i32
  %op36 = add i32 %op35, zeroinitializer
  %op37 = icmp ne i32 %op36, zeroinitializer
  br i1 %op37, label %label_u_ltz38, label %label_u_gtz39
label_ret37:                                                ; preds = %label_c_gtz35, %label_c_gtz61
  %op38 = load i32, i32* %op8
  %op39 = add i32 %op38, 1
  store i32 %op39, i32* %op8
  br label %label_condition29
label_u_ltz38:                                                ; preds = %label_true36
  call void @neg_idx_except()
  br label %label_u_gtz39
label_u_gtz39:                                                ; preds = %label_true36, %label_u_ltz38
  %op40 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %op33
  %op41 = load i32, i32* %op40
  %op42 = alloca i32
  store i32 %op41, i32* %op42
  %op43 = load i32, i32* %op0
  %op44 = icmp slt i32 %op43, zeroinitializer
  %op45 = zext i1 %op44 to i32
  %op46 = add i32 %op45, zeroinitializer
  %op47 = icmp ne i32 %op46, zeroinitializer
  br i1 %op47, label %label_u_ltz40, label %label_u_gtz41
label_u_ltz40:                                                ; preds = %label_u_gtz39
  call void @neg_idx_except()
  br label %label_u_gtz41
label_u_gtz41:                                                ; preds = %label_u_gtz39, %label_u_ltz40
  %op48 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %op43
  %op49 = load i32, i32* %op8
  %op50 = icmp slt i32 %op49, zeroinitializer
  %op51 = zext i1 %op50 to i32
  %op52 = add i32 %op51, zeroinitializer
  %op53 = icmp ne i32 %op52, zeroinitializer
  br i1 %op53, label %label_u_ltz42, label %label_u_gtz43
label_u_ltz42:                                                ; preds = %label_u_gtz41
  call void @neg_idx_except()
  br label %label_u_gtz43
label_u_gtz43:                                                ; preds = %label_u_gtz41, %label_u_ltz42
  %op54 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %op49
  %op55 = load i32, i32* %op54
  store i32 %op55, i32* %op48
  %op56 = load i32, i32* %op8
  %op57 = icmp slt i32 %op56, zeroinitializer
  %op58 = zext i1 %op57 to i32
  %op59 = add i32 %op58, zeroinitializer
  %op60 = icmp ne i32 %op59, zeroinitializer
  br i1 %op60, label %label_u_ltz44, label %label_u_gtz45
label_u_ltz44:                                                ; preds = %label_u_gtz43
  call void @neg_idx_except()
  br label %label_u_gtz45
label_u_gtz45:                                                ; preds = %label_u_gtz43, %label_u_ltz44
  %op61 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %op56
  %op62 = load i32, i32* %op42
  store i32 %op62, i32* %op61
  %op63 = load i32, i32* %op0
  %op64 = icmp slt i32 %op63, zeroinitializer
  %op65 = zext i1 %op64 to i32
  %op66 = add i32 %op65, zeroinitializer
  %op67 = icmp ne i32 %op66, zeroinitializer
  br i1 %op67, label %label_v_ltz46, label %label_v_gtz47
label_v_ltz46:                                                ; preds = %label_u_gtz45
  call void @neg_idx_except()
  br label %label_v_gtz47
label_v_gtz47:                                                ; preds = %label_u_gtz45, %label_v_ltz46
  %op68 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %op63
  %op69 = load i32, i32* %op68
  store i32 %op69, i32* %op42
  %op70 = load i32, i32* %op0
  %op71 = icmp slt i32 %op70, zeroinitializer
  %op72 = zext i1 %op71 to i32
  %op73 = add i32 %op72, zeroinitializer
  %op74 = icmp ne i32 %op73, zeroinitializer
  br i1 %op74, label %label_v_ltz48, label %label_v_gtz49
label_v_ltz48:                                                ; preds = %label_v_gtz47
  call void @neg_idx_except()
  br label %label_v_gtz49
label_v_gtz49:                                                ; preds = %label_v_gtz47, %label_v_ltz48
  %op75 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %op70
  %op76 = load i32, i32* %op8
  %op77 = icmp slt i32 %op76, zeroinitializer
  %op78 = zext i1 %op77 to i32
  %op79 = add i32 %op78, zeroinitializer
  %op80 = icmp ne i32 %op79, zeroinitializer
  br i1 %op80, label %label_v_ltz50, label %label_v_gtz51
label_v_ltz50:                                                ; preds = %label_v_gtz49
  call void @neg_idx_except()
  br label %label_v_gtz51
label_v_gtz51:                                                ; preds = %label_v_gtz49, %label_v_ltz50
  %op81 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %op76
  %op82 = load i32, i32* %op81
  store i32 %op82, i32* %op75
  %op83 = load i32, i32* %op8
  %op84 = icmp slt i32 %op83, zeroinitializer
  %op85 = zext i1 %op84 to i32
  %op86 = add i32 %op85, zeroinitializer
  %op87 = icmp ne i32 %op86, zeroinitializer
  br i1 %op87, label %label_v_ltz52, label %label_v_gtz53
label_v_ltz52:                                                ; preds = %label_v_gtz51
  call void @neg_idx_except()
  br label %label_v_gtz53
label_v_gtz53:                                                ; preds = %label_v_gtz51, %label_v_ltz52
  %op88 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %op83
  %op89 = load i32, i32* %op42
  store i32 %op89, i32* %op88
  %op90 = load i32, i32* %op0
  %op91 = icmp slt i32 %op90, zeroinitializer
  %op92 = zext i1 %op91 to i32
  %op93 = add i32 %op92, zeroinitializer
  %op94 = icmp ne i32 %op93, zeroinitializer
  br i1 %op94, label %label_c_ltz54, label %label_c_gtz55
label_c_ltz54:                                                ; preds = %label_v_gtz53
  call void @neg_idx_except()
  br label %label_c_gtz55
label_c_gtz55:                                                ; preds = %label_v_gtz53, %label_c_ltz54
  %op95 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %op90
  %op96 = load i32, i32* %op95
  store i32 %op96, i32* %op42
  %op97 = load i32, i32* %op0
  %op98 = icmp slt i32 %op97, zeroinitializer
  %op99 = zext i1 %op98 to i32
  %op100 = add i32 %op99, zeroinitializer
  %op101 = icmp ne i32 %op100, zeroinitializer
  br i1 %op101, label %label_c_ltz56, label %label_c_gtz57
label_c_ltz56:                                                ; preds = %label_c_gtz55
  call void @neg_idx_except()
  br label %label_c_gtz57
label_c_gtz57:                                                ; preds = %label_c_gtz55, %label_c_ltz56
  %op102 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %op97
  %op103 = load i32, i32* %op8
  %op104 = icmp slt i32 %op103, zeroinitializer
  %op105 = zext i1 %op104 to i32
  %op106 = add i32 %op105, zeroinitializer
  %op107 = icmp ne i32 %op106, zeroinitializer
  br i1 %op107, label %label_c_ltz58, label %label_c_gtz59
label_c_ltz58:                                                ; preds = %label_c_gtz57
  call void @neg_idx_except()
  br label %label_c_gtz59
label_c_gtz59:                                                ; preds = %label_c_gtz57, %label_c_ltz58
  %op108 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %op103
  %op109 = load i32, i32* %op108
  store i32 %op109, i32* %op102
  %op110 = load i32, i32* %op8
  %op111 = icmp slt i32 %op110, zeroinitializer
  %op112 = zext i1 %op111 to i32
  %op113 = add i32 %op112, zeroinitializer
  %op114 = icmp ne i32 %op113, zeroinitializer
  br i1 %op114, label %label_c_ltz60, label %label_c_gtz61
label_c_ltz60:                                                ; preds = %label_c_gtz59
  call void @neg_idx_except()
  br label %label_c_gtz61
label_c_gtz61:                                                ; preds = %label_c_gtz59, %label_c_ltz60
  %op115 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %op110
  %op116 = load i32, i32* %op42
  store i32 %op116, i32* %op115
  br label %label_ret37
label_condition62:                                                ; preds = %label_ret28, %label_fa_gtz66
  %op117 = load i32, i32* %op0
  %op118 = load i32, i32* @n
  %op119 = icmp sle i32 %op117, %op118
  %op120 = zext i1 %op119 to i32
  %op121 = icmp sgt i32 %op120, zeroinitializer
  br i1 %op121, label %label_loop63, label %label_ret64
label_loop63:                                                ; preds = %label_condition62
  %op122 = load i32, i32* %op0
  %op123 = icmp slt i32 %op122, zeroinitializer
  %op124 = zext i1 %op123 to i32
  %op125 = add i32 %op124, zeroinitializer
  %op126 = icmp ne i32 %op125, zeroinitializer
  br i1 %op126, label %label_fa_ltz65, label %label_fa_gtz66
label_ret64:                                                ; preds = %label_condition62
  store i32 0, i32* %op0
  %op127 = alloca i32
  store i32 0, i32* %op127
  br label %label_condition67
label_fa_ltz65:                                                ; preds = %label_loop63
  call void @neg_idx_except()
  br label %label_fa_gtz66
label_fa_gtz66:                                                ; preds = %label_loop63, %label_fa_ltz65
  %op128 = getelementptr [1005 x i32], [1005 x i32]* @fa, i32 0, i32 %op122
  %op129 = load i32, i32* %op0
  store i32 %op129, i32* %op128
  %op130 = load i32, i32* %op0
  %op131 = add i32 %op130, 1
  store i32 %op131, i32* %op0
  br label %label_condition62
label_condition67:                                                ; preds = %label_ret64, %label_true74, %label_v_gtz83
  %op132 = load i32, i32* %op0
  %op133 = load i32, i32* @m
  %op134 = icmp slt i32 %op132, %op133
  %op135 = zext i1 %op134 to i32
  %op136 = icmp sgt i32 %op135, zeroinitializer
  br i1 %op136, label %label_loop68, label %label_ret69
label_loop68:                                                ; preds = %label_condition67
  %op137 = load i32, i32* %op0
  %op138 = icmp slt i32 %op137, zeroinitializer
  %op139 = zext i1 %op138 to i32
  %op140 = add i32 %op139, zeroinitializer
  %op141 = icmp ne i32 %op140, zeroinitializer
  br i1 %op141, label %label_u_ltz70, label %label_u_gtz71
label_ret69:                                                ; preds = %label_condition67
  %op142 = load i32, i32* %op127
  ret i32 %op142
label_u_ltz70:                                                ; preds = %label_loop68
  call void @neg_idx_except()
  br label %label_u_gtz71
label_u_gtz71:                                                ; preds = %label_loop68, %label_u_ltz70
  %op143 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %op137
  %op144 = load i32, i32* %op143
  %op145 = load i32, i32* %op0
  %op146 = icmp slt i32 %op145, zeroinitializer
  %op147 = zext i1 %op146 to i32
  %op148 = add i32 %op147, zeroinitializer
  %op149 = icmp ne i32 %op148, zeroinitializer
  br i1 %op149, label %label_v_ltz72, label %label_v_gtz73
label_v_ltz72:                                                ; preds = %label_u_gtz71
  call void @neg_idx_except()
  br label %label_v_gtz73
label_v_gtz73:                                                ; preds = %label_u_gtz71, %label_v_ltz72
  %op150 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %op145
  %op151 = load i32, i32* %op150
  %op152 = call i32 @same(i32 %op144, i32 %op151)
  %op153 = icmp sgt i32 %op152, zeroinitializer
  br i1 %op153, label %label_true74, label %label_ret75
label_true74:                                                ; preds = %label_v_gtz73
  br label %label_condition67
label_ret75:                                                ; preds = %label_v_gtz73
  %op154 = load i32, i32* %op127
  %op155 = load i32, i32* %op0
  %op156 = icmp slt i32 %op155, zeroinitializer
  %op157 = zext i1 %op156 to i32
  %op158 = add i32 %op157, zeroinitializer
  %op159 = icmp ne i32 %op158, zeroinitializer
  br i1 %op159, label %label_c_ltz76, label %label_c_gtz77
label_c_ltz76:                                                ; preds = %label_ret75
  call void @neg_idx_except()
  br label %label_c_gtz77
label_c_gtz77:                                                ; preds = %label_ret75, %label_c_ltz76
  %op160 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %op155
  %op161 = load i32, i32* %op160
  %op162 = add i32 %op154, %op161
  store i32 %op162, i32* %op127
  %op163 = load i32, i32* %op0
  %op164 = icmp slt i32 %op163, zeroinitializer
  %op165 = zext i1 %op164 to i32
  %op166 = add i32 %op165, zeroinitializer
  %op167 = icmp ne i32 %op166, zeroinitializer
  br i1 %op167, label %label_u_ltz78, label %label_u_gtz79
label_u_ltz78:                                                ; preds = %label_c_gtz77
  call void @neg_idx_except()
  br label %label_u_gtz79
label_u_gtz79:                                                ; preds = %label_c_gtz77, %label_u_ltz78
  %op168 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %op163
  %op169 = load i32, i32* %op168
  %op170 = call i32 @find(i32 %op169)
  %op171 = icmp slt i32 %op170, zeroinitializer
  %op172 = zext i1 %op171 to i32
  %op173 = add i32 %op172, zeroinitializer
  %op174 = icmp ne i32 %op173, zeroinitializer
  br i1 %op174, label %label_fa_ltz80, label %label_fa_gtz81
label_fa_ltz80:                                                ; preds = %label_u_gtz79
  call void @neg_idx_except()
  br label %label_fa_gtz81
label_fa_gtz81:                                                ; preds = %label_u_gtz79, %label_fa_ltz80
  %op175 = getelementptr [1005 x i32], [1005 x i32]* @fa, i32 0, i32 %op170
  %op176 = load i32, i32* %op0
  %op177 = icmp slt i32 %op176, zeroinitializer
  %op178 = zext i1 %op177 to i32
  %op179 = add i32 %op178, zeroinitializer
  %op180 = icmp ne i32 %op179, zeroinitializer
  br i1 %op180, label %label_v_ltz82, label %label_v_gtz83
label_v_ltz82:                                                ; preds = %label_fa_gtz81
  call void @neg_idx_except()
  br label %label_v_gtz83
label_v_gtz83:                                                ; preds = %label_fa_gtz81, %label_v_ltz82
  %op181 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %op176
  %op182 = load i32, i32* %op181
  store i32 %op182, i32* %op175
  %op183 = load i32, i32* %op0
  %op184 = add i32 %op183, 1
  store i32 %op184, i32* %op0
  br label %label_condition67
}
define i32 @main() {
label_entry:
  %op0 = call i32 @quick_read()
  %op1 = alloca i32
  store i32 %op0, i32* %op1
  %op2 = call i32 @quick_read()
  %op3 = alloca i32
  store i32 %op2, i32* %op3
  %op4 = alloca i32
  store i32 0, i32* %op4
  br label %label_condition84
label_condition84:                                                ; preds = %label_entry, %label_c_gtz92
  %op5 = load i32, i32* %op4
  %op6 = load i32, i32* %op3
  %op7 = icmp slt i32 %op5, %op6
  %op8 = zext i1 %op7 to i32
  %op9 = icmp sgt i32 %op8, zeroinitializer
  br i1 %op9, label %label_loop85, label %label_ret86
label_loop85:                                                ; preds = %label_condition84
  %op10 = load i32, i32* %op4
  %op11 = icmp slt i32 %op10, zeroinitializer
  %op12 = zext i1 %op11 to i32
  %op13 = add i32 %op12, zeroinitializer
  %op14 = icmp ne i32 %op13, zeroinitializer
  br i1 %op14, label %label_u_ltz87, label %label_u_gtz88
label_ret86:                                                ; preds = %label_condition84
  %op15 = call i32 @prim()
  ret i32 %op15
label_u_ltz87:                                                ; preds = %label_loop85
  call void @neg_idx_except()
  br label %label_u_gtz88
label_u_gtz88:                                                ; preds = %label_loop85, %label_u_ltz87
  %op16 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %op10
  %op17 = call i32 @quick_read()
  store i32 %op17, i32* %op16
  %op18 = load i32, i32* %op4
  %op19 = icmp slt i32 %op18, zeroinitializer
  %op20 = zext i1 %op19 to i32
  %op21 = add i32 %op20, zeroinitializer
  %op22 = icmp ne i32 %op21, zeroinitializer
  br i1 %op22, label %label_v_ltz89, label %label_v_gtz90
label_v_ltz89:                                                ; preds = %label_u_gtz88
  call void @neg_idx_except()
  br label %label_v_gtz90
label_v_gtz90:                                                ; preds = %label_u_gtz88, %label_v_ltz89
  %op23 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %op18
  %op24 = call i32 @quick_read()
  store i32 %op24, i32* %op23
  %op25 = load i32, i32* %op4
  %op26 = icmp slt i32 %op25, zeroinitializer
  %op27 = zext i1 %op26 to i32
  %op28 = add i32 %op27, zeroinitializer
  %op29 = icmp ne i32 %op28, zeroinitializer
  br i1 %op29, label %label_c_ltz91, label %label_c_gtz92
label_c_ltz91:                                                ; preds = %label_v_gtz90
  call void @neg_idx_except()
  br label %label_c_gtz92
label_c_gtz92:                                                ; preds = %label_v_gtz90, %label_c_ltz91
  %op30 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %op25
  %op31 = call i32 @quick_read()
  store i32 %op31, i32* %op30
  %op32 = load i32, i32* %op4
  %op33 = add i32 %op32, 1
  store i32 %op33, i32* %op4
  br label %label_condition84
}
