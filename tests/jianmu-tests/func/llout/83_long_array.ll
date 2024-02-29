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
  %op7 = add i32 %op6, 10000
  %op8 = icmp slt i32 %op6, 10000
  %op9 = zext i1 %op8 to i32
  %op10 = icmp sgt i32 %op9, zeroinitializer
  br i1 %op10, label %label_loop1, label %label_ret2
label_loop1:                                                ; preds = %label_condition0
  %op11 = load i32, i32* %op5
  %op12 = icmp slt i32 %op11, zeroinitializer
  %op13 = zext i1 %op12 to i32
  %op14 = add i32 %op13, zeroinitializer
  %op15 = icmp ne i32 %op14, zeroinitializer
  br i1 %op15, label %label_a1_ltz3, label %label_a1_gtz4
label_ret2:                                                ; preds = %label_condition0
  store i32 0, i32* %op5
  br label %label_condition5
label_a1_ltz3:                                                ; preds = %label_loop1
  call void @neg_idx_except()
  br label %label_a1_gtz4
label_a1_gtz4:                                                ; preds = %label_loop1, %label_a1_ltz3
  %op16 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op11
  %op17 = load i32, i32* %op5
  %op18 = load i32, i32* %op5
  %op19 = mul i32 %op17, %op18
  %op20 = sdiv i32 %op19, 10
  %op21 = mul i32 %op20, 10
  %op22 = sub i32 %op19, %op21
  store i32 %op22, i32* %op16
  %op23 = load i32, i32* %op5
  %op24 = add i32 %op23, 1
  store i32 %op24, i32* %op5
  br label %label_condition0
label_condition5:                                                ; preds = %label_ret2, %label_a1_gtz13
  %op25 = load i32, i32* %op5
  %op26 = add i32 %op25, 10000
  %op27 = icmp slt i32 %op25, 10000
  %op28 = zext i1 %op27 to i32
  %op29 = icmp sgt i32 %op28, zeroinitializer
  br i1 %op29, label %label_loop6, label %label_ret7
label_loop6:                                                ; preds = %label_condition5
  %op30 = load i32, i32* %op5
  %op31 = icmp slt i32 %op30, zeroinitializer
  %op32 = zext i1 %op31 to i32
  %op33 = add i32 %op32, zeroinitializer
  %op34 = icmp ne i32 %op33, zeroinitializer
  br i1 %op34, label %label_a2_ltz8, label %label_a2_gtz9
label_ret7:                                                ; preds = %label_condition5
  store i32 0, i32* %op5
  br label %label_condition14
label_a2_ltz8:                                                ; preds = %label_loop6
  call void @neg_idx_except()
  br label %label_a2_gtz9
label_a2_gtz9:                                                ; preds = %label_loop6, %label_a2_ltz8
  %op35 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op30
  %op36 = load i32, i32* %op5
  %op37 = icmp slt i32 %op36, zeroinitializer
  %op38 = zext i1 %op37 to i32
  %op39 = add i32 %op38, zeroinitializer
  %op40 = icmp ne i32 %op39, zeroinitializer
  br i1 %op40, label %label_a1_ltz10, label %label_a1_gtz11
label_a1_ltz10:                                                ; preds = %label_a2_gtz9
  call void @neg_idx_except()
  br label %label_a1_gtz11
label_a1_gtz11:                                                ; preds = %label_a2_gtz9, %label_a1_ltz10
  %op41 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op36
  %op42 = load i32, i32* %op41
  %op43 = load i32, i32* %op5
  %op44 = icmp slt i32 %op43, zeroinitializer
  %op45 = zext i1 %op44 to i32
  %op46 = add i32 %op45, zeroinitializer
  %op47 = icmp ne i32 %op46, zeroinitializer
  br i1 %op47, label %label_a1_ltz12, label %label_a1_gtz13
label_a1_ltz12:                                                ; preds = %label_a1_gtz11
  call void @neg_idx_except()
  br label %label_a1_gtz13
label_a1_gtz13:                                                ; preds = %label_a1_gtz11, %label_a1_ltz12
  %op48 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op43
  %op49 = load i32, i32* %op48
  %op50 = mul i32 %op42, %op49
  %op51 = sdiv i32 %op50, 10
  %op52 = mul i32 %op51, 10
  %op53 = sub i32 %op50, %op52
  store i32 %op53, i32* %op35
  %op54 = load i32, i32* %op5
  %op55 = add i32 %op54, 1
  store i32 %op55, i32* %op5
  br label %label_condition5
label_condition14:                                                ; preds = %label_ret7, %label_a1_gtz24
  %op56 = load i32, i32* %op5
  %op57 = add i32 %op56, 10000
  %op58 = icmp slt i32 %op56, 10000
  %op59 = zext i1 %op58 to i32
  %op60 = icmp sgt i32 %op59, zeroinitializer
  br i1 %op60, label %label_loop15, label %label_ret16
label_loop15:                                                ; preds = %label_condition14
  %op61 = load i32, i32* %op5
  %op62 = icmp slt i32 %op61, zeroinitializer
  %op63 = zext i1 %op62 to i32
  %op64 = add i32 %op63, zeroinitializer
  %op65 = icmp ne i32 %op64, zeroinitializer
  br i1 %op65, label %label_a3_ltz17, label %label_a3_gtz18
label_ret16:                                                ; preds = %label_condition14
  %op66 = alloca i32
  store i32 0, i32* %op66
  store i32 0, i32* %op5
  br label %label_condition25
label_a3_ltz17:                                                ; preds = %label_loop15
  call void @neg_idx_except()
  br label %label_a3_gtz18
label_a3_gtz18:                                                ; preds = %label_loop15, %label_a3_ltz17
  %op67 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op61
  %op68 = load i32, i32* %op5
  %op69 = icmp slt i32 %op68, zeroinitializer
  %op70 = zext i1 %op69 to i32
  %op71 = add i32 %op70, zeroinitializer
  %op72 = icmp ne i32 %op71, zeroinitializer
  br i1 %op72, label %label_a2_ltz19, label %label_a2_gtz20
label_a2_ltz19:                                                ; preds = %label_a3_gtz18
  call void @neg_idx_except()
  br label %label_a2_gtz20
label_a2_gtz20:                                                ; preds = %label_a3_gtz18, %label_a2_ltz19
  %op73 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op68
  %op74 = load i32, i32* %op73
  %op75 = load i32, i32* %op5
  %op76 = icmp slt i32 %op75, zeroinitializer
  %op77 = zext i1 %op76 to i32
  %op78 = add i32 %op77, zeroinitializer
  %op79 = icmp ne i32 %op78, zeroinitializer
  br i1 %op79, label %label_a2_ltz21, label %label_a2_gtz22
label_a2_ltz21:                                                ; preds = %label_a2_gtz20
  call void @neg_idx_except()
  br label %label_a2_gtz22
label_a2_gtz22:                                                ; preds = %label_a2_gtz20, %label_a2_ltz21
  %op80 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op75
  %op81 = load i32, i32* %op80
  %op82 = mul i32 %op74, %op81
  %op83 = sdiv i32 %op82, 100
  %op84 = mul i32 %op83, 100
  %op85 = sub i32 %op82, %op84
  %op86 = load i32, i32* %op5
  %op87 = icmp slt i32 %op86, zeroinitializer
  %op88 = zext i1 %op87 to i32
  %op89 = add i32 %op88, zeroinitializer
  %op90 = icmp ne i32 %op89, zeroinitializer
  br i1 %op90, label %label_a1_ltz23, label %label_a1_gtz24
label_a1_ltz23:                                                ; preds = %label_a2_gtz22
  call void @neg_idx_except()
  br label %label_a1_gtz24
label_a1_gtz24:                                                ; preds = %label_a2_gtz22, %label_a1_ltz23
  %op91 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op86
  %op92 = load i32, i32* %op91
  %op93 = add i32 %op85, %op92
  store i32 %op93, i32* %op67
  %op94 = load i32, i32* %op5
  %op95 = add i32 %op94, 1
  store i32 %op95, i32* %op5
  br label %label_condition14
label_condition25:                                                ; preds = %label_ret16, %label_ret61
  %op96 = load i32, i32* %op5
  %op97 = add i32 %op96, 10000
  %op98 = icmp slt i32 %op96, 10000
  %op99 = zext i1 %op98 to i32
  %op100 = icmp sgt i32 %op99, zeroinitializer
  br i1 %op100, label %label_loop26, label %label_ret27
label_loop26:                                                ; preds = %label_condition25
  %op101 = load i32, i32* %op5
  %op102 = add i32 %op101, 10
  %op103 = icmp slt i32 %op101, 10
  %op104 = zext i1 %op103 to i32
  %op105 = icmp sgt i32 %op104, zeroinitializer
  br i1 %op105, label %label_true28, label %label_false29
label_ret27:                                                ; preds = %label_condition25
  %op106 = load i32, i32* %op66
  ret i32 %op106
label_true28:                                                ; preds = %label_loop26
  %op107 = load i32, i32* %op66
  %op108 = load i32, i32* %op5
  %op109 = icmp slt i32 %op108, zeroinitializer
  %op110 = zext i1 %op109 to i32
  %op111 = add i32 %op110, zeroinitializer
  %op112 = icmp ne i32 %op111, zeroinitializer
  br i1 %op112, label %label_a3_ltz30, label %label_a3_gtz31
label_false29:                                                ; preds = %label_loop26
  %op113 = load i32, i32* %op5
  %op114 = add i32 %op113, 20
  %op115 = icmp slt i32 %op113, 20
  %op116 = zext i1 %op115 to i32
  %op117 = icmp sgt i32 %op116, zeroinitializer
  br i1 %op117, label %label_true32, label %label_false33
label_a3_ltz30:                                                ; preds = %label_true28
  call void @neg_idx_except()
  br label %label_a3_gtz31
label_a3_gtz31:                                                ; preds = %label_true28, %label_a3_ltz30
  %op118 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op108
  %op119 = load i32, i32* %op118
  %op120 = add i32 %op107, %op119
  %op121 = sdiv i32 %op120, 1333
  %op122 = mul i32 %op121, 1333
  %op123 = sub i32 %op120, %op122
  store i32 %op123, i32* %op66
  %op124 = load i32, i32* %op66
  call void @putint(i32 %op124)
  br label %label_ret61
label_true32:                                                ; preds = %label_false29
  %op125 = alloca i32
  store i32 5000, i32* %op125
  br label %label_condition34
label_false33:                                                ; preds = %label_false29
  %op126 = load i32, i32* %op5
  %op127 = add i32 %op126, 30
  %op128 = icmp slt i32 %op126, 30
  %op129 = zext i1 %op128 to i32
  %op130 = icmp sgt i32 %op129, zeroinitializer
  br i1 %op130, label %label_true41, label %label_false42
label_condition34:                                                ; preds = %label_true32, %label_a1_gtz40
  %op131 = load i32, i32* %op125
  %op132 = add i32 %op131, 10000
  %op133 = icmp slt i32 %op131, 10000
  %op134 = zext i1 %op133 to i32
  %op135 = icmp sgt i32 %op134, zeroinitializer
  br i1 %op135, label %label_loop35, label %label_ret36
label_loop35:                                                ; preds = %label_condition34
  %op136 = load i32, i32* %op66
  %op137 = load i32, i32* %op5
  %op138 = icmp slt i32 %op137, zeroinitializer
  %op139 = zext i1 %op138 to i32
  %op140 = add i32 %op139, zeroinitializer
  %op141 = icmp ne i32 %op140, zeroinitializer
  br i1 %op141, label %label_a3_ltz37, label %label_a3_gtz38
label_ret36:                                                ; preds = %label_condition34
  %op142 = load i32, i32* %op66
  call void @putint(i32 %op142)
  br label %label_ret60
label_a3_ltz37:                                                ; preds = %label_loop35
  call void @neg_idx_except()
  br label %label_a3_gtz38
label_a3_gtz38:                                                ; preds = %label_loop35, %label_a3_ltz37
  %op143 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op137
  %op144 = load i32, i32* %op143
  %op145 = add i32 %op136, %op144
  %op146 = load i32, i32* %op125
  %op147 = icmp slt i32 %op146, zeroinitializer
  %op148 = zext i1 %op147 to i32
  %op149 = add i32 %op148, zeroinitializer
  %op150 = icmp ne i32 %op149, zeroinitializer
  br i1 %op150, label %label_a1_ltz39, label %label_a1_gtz40
label_a1_ltz39:                                                ; preds = %label_a3_gtz38
  call void @neg_idx_except()
  br label %label_a1_gtz40
label_a1_gtz40:                                                ; preds = %label_a3_gtz38, %label_a1_ltz39
  %op151 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op146
  %op152 = load i32, i32* %op151
  %op153 = sub i32 %op145, %op152
  store i32 %op153, i32* %op66
  %op154 = load i32, i32* %op125
  %op155 = add i32 %op154, 1
  store i32 %op155, i32* %op125
  br label %label_condition34
label_true41:                                                ; preds = %label_false33
  %op156 = alloca i32
  store i32 5000, i32* %op156
  br label %label_condition43
label_false42:                                                ; preds = %label_false33
  %op157 = load i32, i32* %op66
  %op158 = load i32, i32* %op5
  %op159 = icmp slt i32 %op158, zeroinitializer
  %op160 = zext i1 %op159 to i32
  %op161 = add i32 %op160, zeroinitializer
  %op162 = icmp ne i32 %op161, zeroinitializer
  br i1 %op162, label %label_a3_ltz57, label %label_a3_gtz58
label_condition43:                                                ; preds = %label_true41, %label_ret56
  %op163 = load i32, i32* %op156
  %op164 = add i32 %op163, 10000
  %op165 = icmp slt i32 %op163, 10000
  %op166 = zext i1 %op165 to i32
  %op167 = icmp sgt i32 %op166, zeroinitializer
  br i1 %op167, label %label_loop44, label %label_ret45
label_loop44:                                                ; preds = %label_condition43
  %op168 = load i32, i32* %op156
  %op169 = add i32 %op168, 2233
  %op170 = icmp sgt i32 %op168, 2233
  %op171 = zext i1 %op170 to i32
  %op172 = icmp sgt i32 %op171, zeroinitializer
  br i1 %op172, label %label_true46, label %label_false47
label_ret45:                                                ; preds = %label_condition43
  %op173 = load i32, i32* %op66
  call void @putint(i32 %op173)
  br label %label_ret59
label_true46:                                                ; preds = %label_loop44
  %op174 = load i32, i32* %op66
  %op175 = load i32, i32* %op5
  %op176 = icmp slt i32 %op175, zeroinitializer
  %op177 = zext i1 %op176 to i32
  %op178 = add i32 %op177, zeroinitializer
  %op179 = icmp ne i32 %op178, zeroinitializer
  br i1 %op179, label %label_a2_ltz48, label %label_a2_gtz49
label_false47:                                                ; preds = %label_loop44
  %op180 = load i32, i32* %op66
  %op181 = load i32, i32* %op5
  %op182 = icmp slt i32 %op181, zeroinitializer
  %op183 = zext i1 %op182 to i32
  %op184 = add i32 %op183, zeroinitializer
  %op185 = icmp ne i32 %op184, zeroinitializer
  br i1 %op185, label %label_a1_ltz52, label %label_a1_gtz53
label_a2_ltz48:                                                ; preds = %label_true46
  call void @neg_idx_except()
  br label %label_a2_gtz49
label_a2_gtz49:                                                ; preds = %label_true46, %label_a2_ltz48
  %op186 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op175
  %op187 = load i32, i32* %op186
  %op188 = add i32 %op174, %op187
  %op189 = load i32, i32* %op156
  %op190 = icmp slt i32 %op189, zeroinitializer
  %op191 = zext i1 %op190 to i32
  %op192 = add i32 %op191, zeroinitializer
  %op193 = icmp ne i32 %op192, zeroinitializer
  br i1 %op193, label %label_a1_ltz50, label %label_a1_gtz51
label_a1_ltz50:                                                ; preds = %label_a2_gtz49
  call void @neg_idx_except()
  br label %label_a1_gtz51
label_a1_gtz51:                                                ; preds = %label_a2_gtz49, %label_a1_ltz50
  %op194 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op189
  %op195 = load i32, i32* %op194
  %op196 = sub i32 %op188, %op195
  store i32 %op196, i32* %op66
  %op197 = load i32, i32* %op156
  %op198 = add i32 %op197, 1
  store i32 %op198, i32* %op156
  br label %label_ret56
label_a1_ltz52:                                                ; preds = %label_false47
  call void @neg_idx_except()
  br label %label_a1_gtz53
label_a1_gtz53:                                                ; preds = %label_false47, %label_a1_ltz52
  %op199 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op181
  %op200 = load i32, i32* %op199
  %op201 = add i32 %op180, %op200
  %op202 = load i32, i32* %op156
  %op203 = icmp slt i32 %op202, zeroinitializer
  %op204 = zext i1 %op203 to i32
  %op205 = add i32 %op204, zeroinitializer
  %op206 = icmp ne i32 %op205, zeroinitializer
  br i1 %op206, label %label_a3_ltz54, label %label_a3_gtz55
label_a3_ltz54:                                                ; preds = %label_a1_gtz53
  call void @neg_idx_except()
  br label %label_a3_gtz55
label_a3_gtz55:                                                ; preds = %label_a1_gtz53, %label_a3_ltz54
  %op207 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op202
  %op208 = load i32, i32* %op207
  %op209 = add i32 %op201, %op208
  %op210 = sdiv i32 %op209, 13333
  %op211 = mul i32 %op210, 13333
  %op212 = sub i32 %op209, %op211
  store i32 %op212, i32* %op66
  %op213 = load i32, i32* %op156
  %op214 = add i32 %op213, 2
  store i32 %op214, i32* %op156
  br label %label_ret56
label_ret56:                                                ; preds = %label_a1_gtz51, %label_a3_gtz55
  br label %label_condition43
label_a3_ltz57:                                                ; preds = %label_false42
  call void @neg_idx_except()
  br label %label_a3_gtz58
label_a3_gtz58:                                                ; preds = %label_false42, %label_a3_ltz57
  %op215 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op158
  %op216 = load i32, i32* %op215
  %op217 = load i32, i32* %op1
  %op218 = mul i32 %op216, %op217
  %op219 = add i32 %op157, %op218
  %op220 = sdiv i32 %op219, 99988
  %op221 = mul i32 %op220, 99988
  %op222 = sub i32 %op219, %op221
  store i32 %op222, i32* %op66
  br label %label_ret59
label_ret59:                                                ; preds = %label_ret45, %label_a3_gtz58
  br label %label_ret60
label_ret60:                                                ; preds = %label_ret36, %label_ret59
  br label %label_ret61
label_ret61:                                                ; preds = %label_a3_gtz31, %label_ret60
  %op223 = load i32, i32* %op5
  %op224 = add i32 %op223, 1
  store i32 %op224, i32* %op5
  br label %label_condition25
}
define i32 @main() {
label_entry:
  %op0 = call i32 @long_array(i32 9)
  ret i32 %op0
}
