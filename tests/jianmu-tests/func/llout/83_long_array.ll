; ModuleID = 'sysy'
source_filename = "/home/my2002/compiler_principles/lab5/jianmu-experiment/tests/jianmu-tests/func/83_long_array.sy"

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
  %op6 = load i32, i32* %op5
  %op7 = icmp slt i32 %op6, 10000
  %op8 = zext i1 %op7 to i32
  %op9 = icmp sgt i32 %op8, zeroinitializer
  br i1 %op9, label %label_loop1, label %label_ret2
label_loop1:                                                ; preds = %label_condition0
  %op10 = load i32, i32* %op5
  %op11 = icmp slt i32 %op10, zeroinitializer
  %op12 = zext i1 %op11 to i32
  %op13 = add i32 %op12, zeroinitializer
  %op14 = icmp ne i32 %op13, zeroinitializer
  br i1 %op14, label %label_a1_ltz3, label %label_a1_gtz4
label_ret2:                                                ; preds = %label_condition0
  store i32 0, i32* %op5
  br label %label_condition5
label_a1_ltz3:                                                ; preds = %label_loop1
  call void @neg_idx_except()
  br label %label_a1_gtz4
label_a1_gtz4:                                                ; preds = %label_loop1, %label_a1_ltz3
  %op15 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op10
  %op16 = load i32, i32* %op5
  %op17 = load i32, i32* %op5
  %op18 = mul i32 %op16, %op17
  %op19 = sdiv i32 %op18, 10
  %op20 = mul i32 %op19, 10
  %op21 = sub i32 %op18, %op20
  store i32 %op21, i32* %op15
  %op22 = load i32, i32* %op5
  %op23 = add i32 %op22, 1
  store i32 %op23, i32* %op5
  br label %label_condition0
label_condition5:                                                ; preds = %label_ret2, %label_a1_gtz13
  %op24 = load i32, i32* %op5
  %op25 = icmp slt i32 %op24, 10000
  %op26 = zext i1 %op25 to i32
  %op27 = icmp sgt i32 %op26, zeroinitializer
  br i1 %op27, label %label_loop6, label %label_ret7
label_loop6:                                                ; preds = %label_condition5
  %op28 = load i32, i32* %op5
  %op29 = icmp slt i32 %op28, zeroinitializer
  %op30 = zext i1 %op29 to i32
  %op31 = add i32 %op30, zeroinitializer
  %op32 = icmp ne i32 %op31, zeroinitializer
  br i1 %op32, label %label_a2_ltz8, label %label_a2_gtz9
label_ret7:                                                ; preds = %label_condition5
  store i32 0, i32* %op5
  br label %label_condition14
label_a2_ltz8:                                                ; preds = %label_loop6
  call void @neg_idx_except()
  br label %label_a2_gtz9
label_a2_gtz9:                                                ; preds = %label_loop6, %label_a2_ltz8
  %op33 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op28
  %op34 = load i32, i32* %op5
  %op35 = icmp slt i32 %op34, zeroinitializer
  %op36 = zext i1 %op35 to i32
  %op37 = add i32 %op36, zeroinitializer
  %op38 = icmp ne i32 %op37, zeroinitializer
  br i1 %op38, label %label_a1_ltz10, label %label_a1_gtz11
label_a1_ltz10:                                                ; preds = %label_a2_gtz9
  call void @neg_idx_except()
  br label %label_a1_gtz11
label_a1_gtz11:                                                ; preds = %label_a2_gtz9, %label_a1_ltz10
  %op39 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op34
  %op40 = load i32, i32* %op39
  %op41 = load i32, i32* %op5
  %op42 = icmp slt i32 %op41, zeroinitializer
  %op43 = zext i1 %op42 to i32
  %op44 = add i32 %op43, zeroinitializer
  %op45 = icmp ne i32 %op44, zeroinitializer
  br i1 %op45, label %label_a1_ltz12, label %label_a1_gtz13
label_a1_ltz12:                                                ; preds = %label_a1_gtz11
  call void @neg_idx_except()
  br label %label_a1_gtz13
label_a1_gtz13:                                                ; preds = %label_a1_gtz11, %label_a1_ltz12
  %op46 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op41
  %op47 = load i32, i32* %op46
  %op48 = mul i32 %op40, %op47
  %op49 = sdiv i32 %op48, 10
  %op50 = mul i32 %op49, 10
  %op51 = sub i32 %op48, %op50
  store i32 %op51, i32* %op33
  %op52 = load i32, i32* %op5
  %op53 = add i32 %op52, 1
  store i32 %op53, i32* %op5
  br label %label_condition5
label_condition14:                                                ; preds = %label_ret7, %label_a1_gtz24
  %op54 = load i32, i32* %op5
  %op55 = icmp slt i32 %op54, 10000
  %op56 = zext i1 %op55 to i32
  %op57 = icmp sgt i32 %op56, zeroinitializer
  br i1 %op57, label %label_loop15, label %label_ret16
label_loop15:                                                ; preds = %label_condition14
  %op58 = load i32, i32* %op5
  %op59 = icmp slt i32 %op58, zeroinitializer
  %op60 = zext i1 %op59 to i32
  %op61 = add i32 %op60, zeroinitializer
  %op62 = icmp ne i32 %op61, zeroinitializer
  br i1 %op62, label %label_a3_ltz17, label %label_a3_gtz18
label_ret16:                                                ; preds = %label_condition14
  %op63 = alloca i32
  store i32 0, i32* %op63
  store i32 0, i32* %op5
  br label %label_condition25
label_a3_ltz17:                                                ; preds = %label_loop15
  call void @neg_idx_except()
  br label %label_a3_gtz18
label_a3_gtz18:                                                ; preds = %label_loop15, %label_a3_ltz17
  %op64 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op58
  %op65 = load i32, i32* %op5
  %op66 = icmp slt i32 %op65, zeroinitializer
  %op67 = zext i1 %op66 to i32
  %op68 = add i32 %op67, zeroinitializer
  %op69 = icmp ne i32 %op68, zeroinitializer
  br i1 %op69, label %label_a2_ltz19, label %label_a2_gtz20
label_a2_ltz19:                                                ; preds = %label_a3_gtz18
  call void @neg_idx_except()
  br label %label_a2_gtz20
label_a2_gtz20:                                                ; preds = %label_a3_gtz18, %label_a2_ltz19
  %op70 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op65
  %op71 = load i32, i32* %op70
  %op72 = load i32, i32* %op5
  %op73 = icmp slt i32 %op72, zeroinitializer
  %op74 = zext i1 %op73 to i32
  %op75 = add i32 %op74, zeroinitializer
  %op76 = icmp ne i32 %op75, zeroinitializer
  br i1 %op76, label %label_a2_ltz21, label %label_a2_gtz22
label_a2_ltz21:                                                ; preds = %label_a2_gtz20
  call void @neg_idx_except()
  br label %label_a2_gtz22
label_a2_gtz22:                                                ; preds = %label_a2_gtz20, %label_a2_ltz21
  %op77 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op72
  %op78 = load i32, i32* %op77
  %op79 = mul i32 %op71, %op78
  %op80 = sdiv i32 %op79, 100
  %op81 = mul i32 %op80, 100
  %op82 = sub i32 %op79, %op81
  %op83 = load i32, i32* %op5
  %op84 = icmp slt i32 %op83, zeroinitializer
  %op85 = zext i1 %op84 to i32
  %op86 = add i32 %op85, zeroinitializer
  %op87 = icmp ne i32 %op86, zeroinitializer
  br i1 %op87, label %label_a1_ltz23, label %label_a1_gtz24
label_a1_ltz23:                                                ; preds = %label_a2_gtz22
  call void @neg_idx_except()
  br label %label_a1_gtz24
label_a1_gtz24:                                                ; preds = %label_a2_gtz22, %label_a1_ltz23
  %op88 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op83
  %op89 = load i32, i32* %op88
  %op90 = add i32 %op82, %op89
  store i32 %op90, i32* %op64
  %op91 = load i32, i32* %op5
  %op92 = add i32 %op91, 1
  store i32 %op92, i32* %op5
  br label %label_condition14
label_condition25:                                                ; preds = %label_ret16, %label_ret61
  %op93 = load i32, i32* %op5
  %op94 = icmp slt i32 %op93, 10000
  %op95 = zext i1 %op94 to i32
  %op96 = icmp sgt i32 %op95, zeroinitializer
  br i1 %op96, label %label_loop26, label %label_ret27
label_loop26:                                                ; preds = %label_condition25
  %op97 = load i32, i32* %op5
  %op98 = icmp slt i32 %op97, 10
  %op99 = zext i1 %op98 to i32
  %op100 = icmp sgt i32 %op99, zeroinitializer
  br i1 %op100, label %label_true28, label %label_false29
label_ret27:                                                ; preds = %label_condition25
  %op101 = load i32, i32* %op63
  ret i32 %op101
label_true28:                                                ; preds = %label_loop26
  %op102 = load i32, i32* %op63
  %op103 = load i32, i32* %op5
  %op104 = icmp slt i32 %op103, zeroinitializer
  %op105 = zext i1 %op104 to i32
  %op106 = add i32 %op105, zeroinitializer
  %op107 = icmp ne i32 %op106, zeroinitializer
  br i1 %op107, label %label_a3_ltz30, label %label_a3_gtz31
label_false29:                                                ; preds = %label_loop26
  %op108 = load i32, i32* %op5
  %op109 = icmp slt i32 %op108, 20
  %op110 = zext i1 %op109 to i32
  %op111 = icmp sgt i32 %op110, zeroinitializer
  br i1 %op111, label %label_true32, label %label_false33
label_a3_ltz30:                                                ; preds = %label_true28
  call void @neg_idx_except()
  br label %label_a3_gtz31
label_a3_gtz31:                                                ; preds = %label_true28, %label_a3_ltz30
  %op112 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op103
  %op113 = load i32, i32* %op112
  %op114 = add i32 %op102, %op113
  %op115 = sdiv i32 %op114, 1333
  %op116 = mul i32 %op115, 1333
  %op117 = sub i32 %op114, %op116
  store i32 %op117, i32* %op63
  %op118 = load i32, i32* %op63
  call void @putint(i32 %op118)
  br label %label_ret61
label_true32:                                                ; preds = %label_false29
  %op119 = alloca i32
  store i32 5000, i32* %op119
  br label %label_condition34
label_false33:                                                ; preds = %label_false29
  %op120 = load i32, i32* %op5
  %op121 = icmp slt i32 %op120, 30
  %op122 = zext i1 %op121 to i32
  %op123 = icmp sgt i32 %op122, zeroinitializer
  br i1 %op123, label %label_true41, label %label_false42
label_condition34:                                                ; preds = %label_true32, %label_a1_gtz40
  %op124 = load i32, i32* %op119
  %op125 = icmp slt i32 %op124, 10000
  %op126 = zext i1 %op125 to i32
  %op127 = icmp sgt i32 %op126, zeroinitializer
  br i1 %op127, label %label_loop35, label %label_ret36
label_loop35:                                                ; preds = %label_condition34
  %op128 = load i32, i32* %op63
  %op129 = load i32, i32* %op5
  %op130 = icmp slt i32 %op129, zeroinitializer
  %op131 = zext i1 %op130 to i32
  %op132 = add i32 %op131, zeroinitializer
  %op133 = icmp ne i32 %op132, zeroinitializer
  br i1 %op133, label %label_a3_ltz37, label %label_a3_gtz38
label_ret36:                                                ; preds = %label_condition34
  %op134 = load i32, i32* %op63
  call void @putint(i32 %op134)
  br label %label_ret60
label_a3_ltz37:                                                ; preds = %label_loop35
  call void @neg_idx_except()
  br label %label_a3_gtz38
label_a3_gtz38:                                                ; preds = %label_loop35, %label_a3_ltz37
  %op135 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op129
  %op136 = load i32, i32* %op135
  %op137 = add i32 %op128, %op136
  %op138 = load i32, i32* %op119
  %op139 = icmp slt i32 %op138, zeroinitializer
  %op140 = zext i1 %op139 to i32
  %op141 = add i32 %op140, zeroinitializer
  %op142 = icmp ne i32 %op141, zeroinitializer
  br i1 %op142, label %label_a1_ltz39, label %label_a1_gtz40
label_a1_ltz39:                                                ; preds = %label_a3_gtz38
  call void @neg_idx_except()
  br label %label_a1_gtz40
label_a1_gtz40:                                                ; preds = %label_a3_gtz38, %label_a1_ltz39
  %op143 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op138
  %op144 = load i32, i32* %op143
  %op145 = sub i32 %op137, %op144
  store i32 %op145, i32* %op63
  %op146 = load i32, i32* %op119
  %op147 = add i32 %op146, 1
  store i32 %op147, i32* %op119
  br label %label_condition34
label_true41:                                                ; preds = %label_false33
  %op148 = alloca i32
  store i32 5000, i32* %op148
  br label %label_condition43
label_false42:                                                ; preds = %label_false33
  %op149 = load i32, i32* %op63
  %op150 = load i32, i32* %op5
  %op151 = icmp slt i32 %op150, zeroinitializer
  %op152 = zext i1 %op151 to i32
  %op153 = add i32 %op152, zeroinitializer
  %op154 = icmp ne i32 %op153, zeroinitializer
  br i1 %op154, label %label_a3_ltz57, label %label_a3_gtz58
label_condition43:                                                ; preds = %label_true41, %label_ret56
  %op155 = load i32, i32* %op148
  %op156 = icmp slt i32 %op155, 10000
  %op157 = zext i1 %op156 to i32
  %op158 = icmp sgt i32 %op157, zeroinitializer
  br i1 %op158, label %label_loop44, label %label_ret45
label_loop44:                                                ; preds = %label_condition43
  %op159 = load i32, i32* %op148
  %op160 = icmp sgt i32 %op159, 2233
  %op161 = zext i1 %op160 to i32
  %op162 = icmp sgt i32 %op161, zeroinitializer
  br i1 %op162, label %label_true46, label %label_false47
label_ret45:                                                ; preds = %label_condition43
  %op163 = load i32, i32* %op63
  call void @putint(i32 %op163)
  br label %label_ret59
label_true46:                                                ; preds = %label_loop44
  %op164 = load i32, i32* %op63
  %op165 = load i32, i32* %op5
  %op166 = icmp slt i32 %op165, zeroinitializer
  %op167 = zext i1 %op166 to i32
  %op168 = add i32 %op167, zeroinitializer
  %op169 = icmp ne i32 %op168, zeroinitializer
  br i1 %op169, label %label_a2_ltz48, label %label_a2_gtz49
label_false47:                                                ; preds = %label_loop44
  %op170 = load i32, i32* %op63
  %op171 = load i32, i32* %op5
  %op172 = icmp slt i32 %op171, zeroinitializer
  %op173 = zext i1 %op172 to i32
  %op174 = add i32 %op173, zeroinitializer
  %op175 = icmp ne i32 %op174, zeroinitializer
  br i1 %op175, label %label_a1_ltz52, label %label_a1_gtz53
label_a2_ltz48:                                                ; preds = %label_true46
  call void @neg_idx_except()
  br label %label_a2_gtz49
label_a2_gtz49:                                                ; preds = %label_true46, %label_a2_ltz48
  %op176 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op165
  %op177 = load i32, i32* %op176
  %op178 = add i32 %op164, %op177
  %op179 = load i32, i32* %op148
  %op180 = icmp slt i32 %op179, zeroinitializer
  %op181 = zext i1 %op180 to i32
  %op182 = add i32 %op181, zeroinitializer
  %op183 = icmp ne i32 %op182, zeroinitializer
  br i1 %op183, label %label_a1_ltz50, label %label_a1_gtz51
label_a1_ltz50:                                                ; preds = %label_a2_gtz49
  call void @neg_idx_except()
  br label %label_a1_gtz51
label_a1_gtz51:                                                ; preds = %label_a2_gtz49, %label_a1_ltz50
  %op184 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op179
  %op185 = load i32, i32* %op184
  %op186 = sub i32 %op178, %op185
  store i32 %op186, i32* %op63
  %op187 = load i32, i32* %op148
  %op188 = add i32 %op187, 1
  store i32 %op188, i32* %op148
  br label %label_ret56
label_a1_ltz52:                                                ; preds = %label_false47
  call void @neg_idx_except()
  br label %label_a1_gtz53
label_a1_gtz53:                                                ; preds = %label_false47, %label_a1_ltz52
  %op189 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op171
  %op190 = load i32, i32* %op189
  %op191 = add i32 %op170, %op190
  %op192 = load i32, i32* %op148
  %op193 = icmp slt i32 %op192, zeroinitializer
  %op194 = zext i1 %op193 to i32
  %op195 = add i32 %op194, zeroinitializer
  %op196 = icmp ne i32 %op195, zeroinitializer
  br i1 %op196, label %label_a3_ltz54, label %label_a3_gtz55
label_a3_ltz54:                                                ; preds = %label_a1_gtz53
  call void @neg_idx_except()
  br label %label_a3_gtz55
label_a3_gtz55:                                                ; preds = %label_a1_gtz53, %label_a3_ltz54
  %op197 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op192
  %op198 = load i32, i32* %op197
  %op199 = add i32 %op191, %op198
  %op200 = sdiv i32 %op199, 13333
  %op201 = mul i32 %op200, 13333
  %op202 = sub i32 %op199, %op201
  store i32 %op202, i32* %op63
  %op203 = load i32, i32* %op148
  %op204 = add i32 %op203, 2
  store i32 %op204, i32* %op148
  br label %label_ret56
label_ret56:                                                ; preds = %label_a1_gtz51, %label_a3_gtz55
  br label %label_condition43
label_a3_ltz57:                                                ; preds = %label_false42
  call void @neg_idx_except()
  br label %label_a3_gtz58
label_a3_gtz58:                                                ; preds = %label_false42, %label_a3_ltz57
  %op205 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op150
  %op206 = load i32, i32* %op205
  %op207 = load i32, i32* %op1
  %op208 = mul i32 %op206, %op207
  %op209 = add i32 %op149, %op208
  %op210 = sdiv i32 %op209, 99988
  %op211 = mul i32 %op210, 99988
  %op212 = sub i32 %op209, %op211
  store i32 %op212, i32* %op63
  br label %label_ret59
label_ret59:                                                ; preds = %label_ret45, %label_a3_gtz58
  br label %label_ret60
label_ret60:                                                ; preds = %label_ret36, %label_ret59
  br label %label_ret61
label_ret61:                                                ; preds = %label_a3_gtz31, %label_ret60
  %op213 = load i32, i32* %op5
  %op214 = add i32 %op213, 1
  store i32 %op214, i32* %op5
  br label %label_condition25
}
define i32 @main() {
label_entry:
  %op0 = call i32 @long_array(i32 9)
  ret i32 %op0
}
