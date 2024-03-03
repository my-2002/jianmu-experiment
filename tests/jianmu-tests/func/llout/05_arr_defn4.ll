; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/jianmu-tests/func/05_arr_defn4.sy"

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

define i32 @main() {
label_entry:
  %op0 = alloca [4 x [2 x i32]]
  store [4 x [2 x i32]] [[2 x i32] zeroinitializer, [2 x i32] zeroinitializer, [2 x i32] zeroinitializer, [2 x i32] zeroinitializer], [4 x [2 x i32]]* %op0
  %op1 = alloca [4 x [2 x i32]]
  store [4 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 4], [2 x i32] [i32 5, i32 6], [2 x i32] [i32 7, i32 8]], [4 x [2 x i32]]* %op1
  %op2 = icmp slt i32 0, zeroinitializer
  %op3 = zext i1 %op2 to i32
  %op4 = add i32 %op3, zeroinitializer
  %op5 = icmp slt i32 3, zeroinitializer
  %op6 = zext i1 %op5 to i32
  %op7 = add i32 %op6, %op4
  %op8 = icmp ne i32 %op7, zeroinitializer
  br i1 %op8, label %label_a_ltz0, label %label_a_gtz1
label_a_ltz0:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_a_gtz1
label_a_gtz1:                                                ; preds = %label_entry, %label_a_ltz0
  %op9 = alloca [4 x [2 x i32]]
  store [4 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 zeroinitializer], [2 x i32] [i32 5, i32 zeroinitializer], [2 x i32] [i32 7, i32 8]], [4 x [2 x i32]]* %op9
  %op10 = icmp slt i32 2, zeroinitializer
  %op11 = zext i1 %op10 to i32
  %op12 = add i32 %op11, zeroinitializer
  %op13 = icmp slt i32 1, zeroinitializer
  %op14 = zext i1 %op13 to i32
  %op15 = add i32 %op14, %op12
  %op16 = icmp ne i32 %op15, zeroinitializer
  br i1 %op16, label %label_d_ltz2, label %label_d_gtz3
label_d_ltz2:                                                ; preds = %label_a_gtz1
  call void @neg_idx_except()
  br label %label_d_gtz3
label_d_gtz3:                                                ; preds = %label_a_gtz1, %label_d_ltz2
  %op17 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op9, i32 0, i32 2, i32 1
  %op18 = load i32, i32* %op17
  %op19 = icmp slt i32 2, zeroinitializer
  %op20 = zext i1 %op19 to i32
  %op21 = add i32 %op20, zeroinitializer
  %op22 = icmp slt i32 1, zeroinitializer
  %op23 = zext i1 %op22 to i32
  %op24 = add i32 %op23, %op21
  %op25 = icmp ne i32 %op24, zeroinitializer
  br i1 %op25, label %label_c_ltz4, label %label_c_gtz5
label_c_ltz4:                                                ; preds = %label_d_gtz3
  call void @neg_idx_except()
  br label %label_c_gtz5
label_c_gtz5:                                                ; preds = %label_d_gtz3, %label_c_ltz4
  %op26 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op1, i32 0, i32 2, i32 1
  %op27 = load i32, i32* %op26
  %op28 = alloca [4 x [2 x [1 x i32]]]
  store [4 x [2 x [1 x i32]]] [[2 x [1 x i32]] [[1 x i32] [i32 zeroinitializer], [1 x i32] [i32 zeroinitializer]], [2 x [1 x i32]] [[1 x i32] [i32 3], [1 x i32] [i32 4]], [2 x [1 x i32]] [[1 x i32] [i32 5], [1 x i32] [i32 6]], [2 x [1 x i32]] [[1 x i32] [i32 7], [1 x i32] [i32 8]]], [4 x [2 x [1 x i32]]]* %op28
  %op29 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op28, i32 0, i32 0, i32 1, i32 0
  store i32 %op27, i32* %op29
  %op30 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op28, i32 0, i32 0, i32 2, i32 0
  store i32 %op18, i32* %op30
  %op31 = icmp slt i32 3, zeroinitializer
  %op32 = zext i1 %op31 to i32
  %op33 = add i32 %op32, zeroinitializer
  %op34 = icmp slt i32 1, zeroinitializer
  %op35 = zext i1 %op34 to i32
  %op36 = add i32 %op35, %op33
  %op37 = icmp slt i32 0, zeroinitializer
  %op38 = zext i1 %op37 to i32
  %op39 = add i32 %op38, %op36
  %op40 = icmp ne i32 %op39, zeroinitializer
  br i1 %op40, label %label_e_ltz6, label %label_e_gtz7
label_e_ltz6:                                                ; preds = %label_c_gtz5
  call void @neg_idx_except()
  br label %label_e_gtz7
label_e_gtz7:                                                ; preds = %label_c_gtz5, %label_e_ltz6
  %op41 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op28, i32 0, i32 3, i32 1, i32 0
  %op42 = load i32, i32* %op41
  %op43 = alloca i32
  store i32 %op42, i32* %op43
  %op44 = load i32, i32* %op43
  call void @putint(i32 %op44)
  %op45 = icmp slt i32 0, zeroinitializer
  %op46 = zext i1 %op45 to i32
  %op47 = add i32 %op46, zeroinitializer
  %op48 = icmp slt i32 0, zeroinitializer
  %op49 = zext i1 %op48 to i32
  %op50 = add i32 %op49, %op47
  %op51 = icmp slt i32 0, zeroinitializer
  %op52 = zext i1 %op51 to i32
  %op53 = add i32 %op52, %op50
  %op54 = icmp ne i32 %op53, zeroinitializer
  br i1 %op54, label %label_e_ltz8, label %label_e_gtz9
label_e_ltz8:                                                ; preds = %label_e_gtz7
  call void @neg_idx_except()
  br label %label_e_gtz9
label_e_gtz9:                                                ; preds = %label_e_gtz7, %label_e_ltz8
  %op55 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op28, i32 0, i32 0, i32 0, i32 0
  %op56 = load i32, i32* %op55
  %op57 = alloca i32
  store i32 %op56, i32* %op57
  %op58 = load i32, i32* %op57
  call void @putint(i32 %op58)
  %op59 = icmp slt i32 0, zeroinitializer
  %op60 = zext i1 %op59 to i32
  %op61 = add i32 %op60, zeroinitializer
  %op62 = icmp slt i32 1, zeroinitializer
  %op63 = zext i1 %op62 to i32
  %op64 = add i32 %op63, %op61
  %op65 = icmp slt i32 0, zeroinitializer
  %op66 = zext i1 %op65 to i32
  %op67 = add i32 %op66, %op64
  %op68 = icmp ne i32 %op67, zeroinitializer
  br i1 %op68, label %label_e_ltz10, label %label_e_gtz11
label_e_ltz10:                                                ; preds = %label_e_gtz9
  call void @neg_idx_except()
  br label %label_e_gtz11
label_e_gtz11:                                                ; preds = %label_e_gtz9, %label_e_ltz10
  %op69 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op28, i32 0, i32 0, i32 1, i32 0
  %op70 = load i32, i32* %op69
  %op71 = alloca i32
  store i32 %op70, i32* %op71
  %op72 = load i32, i32* %op71
  call void @putint(i32 %op72)
  %op73 = icmp slt i32 3, zeroinitializer
  %op74 = zext i1 %op73 to i32
  %op75 = add i32 %op74, zeroinitializer
  %op76 = icmp slt i32 0, zeroinitializer
  %op77 = zext i1 %op76 to i32
  %op78 = add i32 %op77, %op75
  %op79 = icmp ne i32 %op78, zeroinitializer
  br i1 %op79, label %label_d_ltz12, label %label_d_gtz13
label_d_ltz12:                                                ; preds = %label_e_gtz11
  call void @neg_idx_except()
  br label %label_d_gtz13
label_d_gtz13:                                                ; preds = %label_e_gtz11, %label_d_ltz12
  %op80 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op9, i32 0, i32 3, i32 0
  %op81 = load i32, i32* %op80
  %op82 = alloca i32
  store i32 %op81, i32* %op82
  %op83 = load i32, i32* %op82
  call void @putint(i32 %op83)
  %op84 = icmp slt i32 3, zeroinitializer
  %op85 = zext i1 %op84 to i32
  %op86 = add i32 %op85, zeroinitializer
  %op87 = icmp slt i32 1, zeroinitializer
  %op88 = zext i1 %op87 to i32
  %op89 = add i32 %op88, %op86
  %op90 = icmp slt i32 0, zeroinitializer
  %op91 = zext i1 %op90 to i32
  %op92 = add i32 %op91, %op89
  %op93 = icmp ne i32 %op92, zeroinitializer
  br i1 %op93, label %label_e_ltz14, label %label_e_gtz15
label_e_ltz14:                                                ; preds = %label_d_gtz13
  call void @neg_idx_except()
  br label %label_e_gtz15
label_e_gtz15:                                                ; preds = %label_d_gtz13, %label_e_ltz14
  %op94 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op28, i32 0, i32 3, i32 1, i32 0
  %op95 = load i32, i32* %op94
  %op96 = icmp slt i32 0, zeroinitializer
  %op97 = zext i1 %op96 to i32
  %op98 = add i32 %op97, zeroinitializer
  %op99 = icmp slt i32 0, zeroinitializer
  %op100 = zext i1 %op99 to i32
  %op101 = add i32 %op100, %op98
  %op102 = icmp slt i32 0, zeroinitializer
  %op103 = zext i1 %op102 to i32
  %op104 = add i32 %op103, %op101
  %op105 = icmp ne i32 %op104, zeroinitializer
  br i1 %op105, label %label_e_ltz16, label %label_e_gtz17
label_e_ltz16:                                                ; preds = %label_e_gtz15
  call void @neg_idx_except()
  br label %label_e_gtz17
label_e_gtz17:                                                ; preds = %label_e_gtz15, %label_e_ltz16
  %op106 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op28, i32 0, i32 0, i32 0, i32 0
  %op107 = load i32, i32* %op106
  %op108 = add i32 %op95, %op107
  %op109 = icmp slt i32 0, zeroinitializer
  %op110 = zext i1 %op109 to i32
  %op111 = add i32 %op110, zeroinitializer
  %op112 = icmp slt i32 1, zeroinitializer
  %op113 = zext i1 %op112 to i32
  %op114 = add i32 %op113, %op111
  %op115 = icmp slt i32 0, zeroinitializer
  %op116 = zext i1 %op115 to i32
  %op117 = add i32 %op116, %op114
  %op118 = icmp ne i32 %op117, zeroinitializer
  br i1 %op118, label %label_e_ltz18, label %label_e_gtz19
label_e_ltz18:                                                ; preds = %label_e_gtz17
  call void @neg_idx_except()
  br label %label_e_gtz19
label_e_gtz19:                                                ; preds = %label_e_gtz17, %label_e_ltz18
  %op119 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op28, i32 0, i32 0, i32 1, i32 0
  %op120 = load i32, i32* %op119
  %op121 = add i32 %op108, %op120
  %op122 = icmp slt i32 3, zeroinitializer
  %op123 = zext i1 %op122 to i32
  %op124 = add i32 %op123, zeroinitializer
  %op125 = icmp slt i32 0, zeroinitializer
  %op126 = zext i1 %op125 to i32
  %op127 = add i32 %op126, %op124
  %op128 = icmp ne i32 %op127, zeroinitializer
  br i1 %op128, label %label_d_ltz20, label %label_d_gtz21
label_d_ltz20:                                                ; preds = %label_e_gtz19
  call void @neg_idx_except()
  br label %label_d_gtz21
label_d_gtz21:                                                ; preds = %label_e_gtz19, %label_d_ltz20
  %op129 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op9, i32 0, i32 3, i32 0
  %op130 = load i32, i32* %op129
  %op131 = add i32 %op121, %op130
  ret i32 %op131
}
