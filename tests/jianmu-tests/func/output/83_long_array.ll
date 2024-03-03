; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/jianmu-tests/func/83_long_array.sy"

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

define i32 @long_array(i32 %arg0) {
label_entry:
  %op1 = alloca i32
  store i32 %arg0, i32* %op1
  %op2 = alloca [10000 x i32]
  %op3 = alloca [10000 x i32]
  %op4 = alloca [10000 x i32]
  %op5 = alloca i32
  store i32 0, i32* %op5
  br label %label_condition0
label_condition0:                                                ; preds = %label_entry, %label_a1_gtz4
  %op6 = icmp sgt i32 10000, zeroinitializer
  br i1 %op6, label %label_loop1, label %label_ret2
label_loop1:                                                ; preds = %label_condition0
  %op7 = load i32, i32* %op5
  %op8 = icmp slt i32 %op7, zeroinitializer
  %op9 = zext i1 %op8 to i32
  %op10 = add i32 %op9, zeroinitializer
  %op11 = icmp ne i32 %op10, zeroinitializer
  br i1 %op11, label %label_a1_ltz3, label %label_a1_gtz4
label_ret2:                                                ; preds = %label_condition0
  store i32 0, i32* %op5
  br label %label_condition5
label_a1_ltz3:                                                ; preds = %label_loop1
  call void @neg_idx_except()
  br label %label_a1_gtz4
label_a1_gtz4:                                                ; preds = %label_loop1, %label_a1_ltz3
  %op12 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op7
  %op13 = load i32, i32* %op5
  %op14 = load i32, i32* %op5
  %op15 = mul i32 %op13, %op14
  %op16 = sdiv i32 %op15, 10
  %op17 = mul i32 %op16, 10
  %op18 = sub i32 %op15, %op17
  store i32 %op18, i32* %op12
  %op19 = load i32, i32* %op5
  %op20 = add i32 %op19, 1
  store i32 %op20, i32* %op5
  br label %label_condition0
label_condition5:                                                ; preds = %label_ret2, %label_a1_gtz13
  %op21 = icmp sgt i32 10000, zeroinitializer
  br i1 %op21, label %label_loop6, label %label_ret7
label_loop6:                                                ; preds = %label_condition5
  %op22 = load i32, i32* %op5
  %op23 = icmp slt i32 %op22, zeroinitializer
  %op24 = zext i1 %op23 to i32
  %op25 = add i32 %op24, zeroinitializer
  %op26 = icmp ne i32 %op25, zeroinitializer
  br i1 %op26, label %label_a2_ltz8, label %label_a2_gtz9
label_ret7:                                                ; preds = %label_condition5
  store i32 0, i32* %op5
  br label %label_condition14
label_a2_ltz8:                                                ; preds = %label_loop6
  call void @neg_idx_except()
  br label %label_a2_gtz9
label_a2_gtz9:                                                ; preds = %label_loop6, %label_a2_ltz8
  %op27 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op22
  %op28 = load i32, i32* %op5
  %op29 = icmp slt i32 %op28, zeroinitializer
  %op30 = zext i1 %op29 to i32
  %op31 = add i32 %op30, zeroinitializer
  %op32 = icmp ne i32 %op31, zeroinitializer
  br i1 %op32, label %label_a1_ltz10, label %label_a1_gtz11
label_a1_ltz10:                                                ; preds = %label_a2_gtz9
  call void @neg_idx_except()
  br label %label_a1_gtz11
label_a1_gtz11:                                                ; preds = %label_a2_gtz9, %label_a1_ltz10
  %op33 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op28
  %op34 = load i32, i32* %op33
  %op35 = load i32, i32* %op5
  %op36 = icmp slt i32 %op35, zeroinitializer
  %op37 = zext i1 %op36 to i32
  %op38 = add i32 %op37, zeroinitializer
  %op39 = icmp ne i32 %op38, zeroinitializer
  br i1 %op39, label %label_a1_ltz12, label %label_a1_gtz13
label_a1_ltz12:                                                ; preds = %label_a1_gtz11
  call void @neg_idx_except()
  br label %label_a1_gtz13
label_a1_gtz13:                                                ; preds = %label_a1_gtz11, %label_a1_ltz12
  %op40 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op35
  %op41 = load i32, i32* %op40
  %op42 = mul i32 %op34, %op41
  %op43 = sdiv i32 %op42, 10
  %op44 = mul i32 %op43, 10
  %op45 = sub i32 %op42, %op44
  store i32 %op45, i32* %op27
  %op46 = load i32, i32* %op5
  %op47 = add i32 %op46, 1
  store i32 %op47, i32* %op5
  br label %label_condition5
label_condition14:                                                ; preds = %label_ret7, %label_a1_gtz24
  %op48 = icmp sgt i32 10000, zeroinitializer
  br i1 %op48, label %label_loop15, label %label_ret16
label_loop15:                                                ; preds = %label_condition14
  %op49 = load i32, i32* %op5
  %op50 = icmp slt i32 %op49, zeroinitializer
  %op51 = zext i1 %op50 to i32
  %op52 = add i32 %op51, zeroinitializer
  %op53 = icmp ne i32 %op52, zeroinitializer
  br i1 %op53, label %label_a3_ltz17, label %label_a3_gtz18
label_ret16:                                                ; preds = %label_condition14
  %op54 = alloca i32
  store i32 0, i32* %op54
  store i32 0, i32* %op5
  br label %label_condition25
label_a3_ltz17:                                                ; preds = %label_loop15
  call void @neg_idx_except()
  br label %label_a3_gtz18
label_a3_gtz18:                                                ; preds = %label_loop15, %label_a3_ltz17
  %op55 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op49
  %op56 = load i32, i32* %op5
  %op57 = icmp slt i32 %op56, zeroinitializer
  %op58 = zext i1 %op57 to i32
  %op59 = add i32 %op58, zeroinitializer
  %op60 = icmp ne i32 %op59, zeroinitializer
  br i1 %op60, label %label_a2_ltz19, label %label_a2_gtz20
label_a2_ltz19:                                                ; preds = %label_a3_gtz18
  call void @neg_idx_except()
  br label %label_a2_gtz20
label_a2_gtz20:                                                ; preds = %label_a3_gtz18, %label_a2_ltz19
  %op61 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op56
  %op62 = load i32, i32* %op61
  %op63 = load i32, i32* %op5
  %op64 = icmp slt i32 %op63, zeroinitializer
  %op65 = zext i1 %op64 to i32
  %op66 = add i32 %op65, zeroinitializer
  %op67 = icmp ne i32 %op66, zeroinitializer
  br i1 %op67, label %label_a2_ltz21, label %label_a2_gtz22
label_a2_ltz21:                                                ; preds = %label_a2_gtz20
  call void @neg_idx_except()
  br label %label_a2_gtz22
label_a2_gtz22:                                                ; preds = %label_a2_gtz20, %label_a2_ltz21
  %op68 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op63
  %op69 = load i32, i32* %op68
  %op70 = mul i32 %op62, %op69
  %op71 = sdiv i32 %op70, 100
  %op72 = mul i32 %op71, 100
  %op73 = sub i32 %op70, %op72
  %op74 = load i32, i32* %op5
  %op75 = icmp slt i32 %op74, zeroinitializer
  %op76 = zext i1 %op75 to i32
  %op77 = add i32 %op76, zeroinitializer
  %op78 = icmp ne i32 %op77, zeroinitializer
  br i1 %op78, label %label_a1_ltz23, label %label_a1_gtz24
label_a1_ltz23:                                                ; preds = %label_a2_gtz22
  call void @neg_idx_except()
  br label %label_a1_gtz24
label_a1_gtz24:                                                ; preds = %label_a2_gtz22, %label_a1_ltz23
  %op79 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op74
  %op80 = load i32, i32* %op79
  %op81 = add i32 %op73, %op80
  store i32 %op81, i32* %op55
  %op82 = load i32, i32* %op5
  %op83 = add i32 %op82, 1
  store i32 %op83, i32* %op5
  br label %label_condition14
label_condition25:                                                ; preds = %label_ret16, %label_ret61
  %op84 = icmp sgt i32 10000, zeroinitializer
  br i1 %op84, label %label_loop26, label %label_ret27
label_loop26:                                                ; preds = %label_condition25
  %op85 = icmp sgt i32 10, zeroinitializer
  br i1 %op85, label %label_true28, label %label_false29
label_ret27:                                                ; preds = %label_condition25
  %op86 = load i32, i32* %op54
  ret i32 %op86
label_true28:                                                ; preds = %label_loop26
  %op87 = load i32, i32* %op54
  %op88 = load i32, i32* %op5
  %op89 = icmp slt i32 %op88, zeroinitializer
  %op90 = zext i1 %op89 to i32
  %op91 = add i32 %op90, zeroinitializer
  %op92 = icmp ne i32 %op91, zeroinitializer
  br i1 %op92, label %label_a3_ltz30, label %label_a3_gtz31
label_false29:                                                ; preds = %label_loop26
  %op93 = icmp sgt i32 20, zeroinitializer
  br i1 %op93, label %label_true32, label %label_false33
label_a3_ltz30:                                                ; preds = %label_true28
  call void @neg_idx_except()
  br label %label_a3_gtz31
label_a3_gtz31:                                                ; preds = %label_true28, %label_a3_ltz30
  %op94 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op88
  %op95 = load i32, i32* %op94
  %op96 = add i32 %op87, %op95
  %op97 = sdiv i32 %op96, 1333
  %op98 = mul i32 %op97, 1333
  %op99 = sub i32 %op96, %op98
  store i32 %op99, i32* %op54
  %op100 = load i32, i32* %op54
  call void @putint(i32 %op100)
  br label %label_ret61
label_true32:                                                ; preds = %label_false29
  %op101 = alloca i32
  store i32 5000, i32* %op101
  br label %label_condition34
label_false33:                                                ; preds = %label_false29
  %op102 = icmp sgt i32 30, zeroinitializer
  br i1 %op102, label %label_true41, label %label_false42
label_condition34:                                                ; preds = %label_true32, %label_a1_gtz40
  %op103 = icmp sgt i32 10000, zeroinitializer
  br i1 %op103, label %label_loop35, label %label_ret36
label_loop35:                                                ; preds = %label_condition34
  %op104 = load i32, i32* %op54
  %op105 = load i32, i32* %op5
  %op106 = icmp slt i32 %op105, zeroinitializer
  %op107 = zext i1 %op106 to i32
  %op108 = add i32 %op107, zeroinitializer
  %op109 = icmp ne i32 %op108, zeroinitializer
  br i1 %op109, label %label_a3_ltz37, label %label_a3_gtz38
label_ret36:                                                ; preds = %label_condition34
  %op110 = load i32, i32* %op54
  call void @putint(i32 %op110)
  br label %label_ret60
label_a3_ltz37:                                                ; preds = %label_loop35
  call void @neg_idx_except()
  br label %label_a3_gtz38
label_a3_gtz38:                                                ; preds = %label_loop35, %label_a3_ltz37
  %op111 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op105
  %op112 = load i32, i32* %op111
  %op113 = add i32 %op104, %op112
  %op114 = load i32, i32* %op101
  %op115 = icmp slt i32 %op114, zeroinitializer
  %op116 = zext i1 %op115 to i32
  %op117 = add i32 %op116, zeroinitializer
  %op118 = icmp ne i32 %op117, zeroinitializer
  br i1 %op118, label %label_a1_ltz39, label %label_a1_gtz40
label_a1_ltz39:                                                ; preds = %label_a3_gtz38
  call void @neg_idx_except()
  br label %label_a1_gtz40
label_a1_gtz40:                                                ; preds = %label_a3_gtz38, %label_a1_ltz39
  %op119 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op114
  %op120 = load i32, i32* %op119
  %op121 = sub i32 %op113, %op120
  store i32 %op121, i32* %op54
  %op122 = load i32, i32* %op101
  %op123 = add i32 %op122, 1
  store i32 %op123, i32* %op101
  br label %label_condition34
label_true41:                                                ; preds = %label_false33
  %op124 = alloca i32
  store i32 5000, i32* %op124
  br label %label_condition43
label_false42:                                                ; preds = %label_false33
  %op125 = load i32, i32* %op54
  %op126 = load i32, i32* %op5
  %op127 = icmp slt i32 %op126, zeroinitializer
  %op128 = zext i1 %op127 to i32
  %op129 = add i32 %op128, zeroinitializer
  %op130 = icmp ne i32 %op129, zeroinitializer
  br i1 %op130, label %label_a3_ltz57, label %label_a3_gtz58
label_condition43:                                                ; preds = %label_true41, %label_ret56
  %op131 = icmp sgt i32 10000, zeroinitializer
  br i1 %op131, label %label_loop44, label %label_ret45
label_loop44:                                                ; preds = %label_condition43
  %op132 = icmp sgt i32 2233, zeroinitializer
  br i1 %op132, label %label_true46, label %label_false47
label_ret45:                                                ; preds = %label_condition43
  %op133 = load i32, i32* %op54
  call void @putint(i32 %op133)
  br label %label_ret59
label_true46:                                                ; preds = %label_loop44
  %op134 = load i32, i32* %op54
  %op135 = load i32, i32* %op5
  %op136 = icmp slt i32 %op135, zeroinitializer
  %op137 = zext i1 %op136 to i32
  %op138 = add i32 %op137, zeroinitializer
  %op139 = icmp ne i32 %op138, zeroinitializer
  br i1 %op139, label %label_a2_ltz48, label %label_a2_gtz49
label_false47:                                                ; preds = %label_loop44
  %op140 = load i32, i32* %op54
  %op141 = load i32, i32* %op5
  %op142 = icmp slt i32 %op141, zeroinitializer
  %op143 = zext i1 %op142 to i32
  %op144 = add i32 %op143, zeroinitializer
  %op145 = icmp ne i32 %op144, zeroinitializer
  br i1 %op145, label %label_a1_ltz52, label %label_a1_gtz53
label_a2_ltz48:                                                ; preds = %label_true46
  call void @neg_idx_except()
  br label %label_a2_gtz49
label_a2_gtz49:                                                ; preds = %label_true46, %label_a2_ltz48
  %op146 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op135
  %op147 = load i32, i32* %op146
  %op148 = add i32 %op134, %op147
  %op149 = load i32, i32* %op124
  %op150 = icmp slt i32 %op149, zeroinitializer
  %op151 = zext i1 %op150 to i32
  %op152 = add i32 %op151, zeroinitializer
  %op153 = icmp ne i32 %op152, zeroinitializer
  br i1 %op153, label %label_a1_ltz50, label %label_a1_gtz51
label_a1_ltz50:                                                ; preds = %label_a2_gtz49
  call void @neg_idx_except()
  br label %label_a1_gtz51
label_a1_gtz51:                                                ; preds = %label_a2_gtz49, %label_a1_ltz50
  %op154 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op149
  %op155 = load i32, i32* %op154
  %op156 = sub i32 %op148, %op155
  store i32 %op156, i32* %op54
  %op157 = load i32, i32* %op124
  %op158 = add i32 %op157, 1
  store i32 %op158, i32* %op124
  br label %label_ret56
label_a1_ltz52:                                                ; preds = %label_false47
  call void @neg_idx_except()
  br label %label_a1_gtz53
label_a1_gtz53:                                                ; preds = %label_false47, %label_a1_ltz52
  %op159 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op141
  %op160 = load i32, i32* %op159
  %op161 = add i32 %op140, %op160
  %op162 = load i32, i32* %op124
  %op163 = icmp slt i32 %op162, zeroinitializer
  %op164 = zext i1 %op163 to i32
  %op165 = add i32 %op164, zeroinitializer
  %op166 = icmp ne i32 %op165, zeroinitializer
  br i1 %op166, label %label_a3_ltz54, label %label_a3_gtz55
label_a3_ltz54:                                                ; preds = %label_a1_gtz53
  call void @neg_idx_except()
  br label %label_a3_gtz55
label_a3_gtz55:                                                ; preds = %label_a1_gtz53, %label_a3_ltz54
  %op167 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op162
  %op168 = load i32, i32* %op167
  %op169 = add i32 %op161, %op168
  %op170 = sdiv i32 %op169, 13333
  %op171 = mul i32 %op170, 13333
  %op172 = sub i32 %op169, %op171
  store i32 %op172, i32* %op54
  %op173 = load i32, i32* %op124
  %op174 = add i32 %op173, 2
  store i32 %op174, i32* %op124
  br label %label_ret56
label_ret56:                                                ; preds = %label_a1_gtz51, %label_a3_gtz55
  br label %label_condition43
label_a3_ltz57:                                                ; preds = %label_false42
  call void @neg_idx_except()
  br label %label_a3_gtz58
label_a3_gtz58:                                                ; preds = %label_false42, %label_a3_ltz57
  %op175 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op126
  %op176 = load i32, i32* %op175
  %op177 = load i32, i32* %op1
  %op178 = mul i32 %op176, %op177
  %op179 = add i32 %op125, %op178
  %op180 = sdiv i32 %op179, 99988
  %op181 = mul i32 %op180, 99988
  %op182 = sub i32 %op179, %op181
  store i32 %op182, i32* %op54
  br label %label_ret59
label_ret59:                                                ; preds = %label_ret45, %label_a3_gtz58
  br label %label_ret60
label_ret60:                                                ; preds = %label_ret36, %label_ret59
  br label %label_ret61
label_ret61:                                                ; preds = %label_a3_gtz31, %label_ret60
  %op183 = load i32, i32* %op5
  %op184 = add i32 %op183, 1
  store i32 %op184, i32* %op5
  br label %label_condition25
}
define i32 @main() {
label_entry:
  %op0 = call i32 @long_array(i32 9)
  ret i32 %op0
}
