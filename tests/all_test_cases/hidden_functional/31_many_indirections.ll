; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/all_test_cases/hidden_functional/31_many_indirections.sy"

@N = constant i32 100
@M = constant i32 20
@array = global [20 x [100 x i32]] zeroinitializer
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

define i32 @main() {
label_entry:
  %op0 = alloca i32
  store i32 0, i32* %op0
  %op1 = alloca i32
  store i32 0, i32* %op1
  br label %label_condition0
label_condition0:                                                ; preds = %label_entry, %label_ret5
  %op2 = load i32, i32* %op0
  %op3 = load i32, i32* @M
  %op4 = icmp slt i32 %op2, %op3
  %op5 = zext i1 %op4 to i32
  %op6 = icmp sgt i32 %op5, zeroinitializer
  br i1 %op6, label %label_loop1, label %label_ret2
label_loop1:                                                ; preds = %label_condition0
  %op7 = alloca i32
  store i32 0, i32* %op7
  br label %label_condition3
label_ret2:                                                ; preds = %label_condition0
  %op8 = icmp slt i32 19, zeroinitializer
  %op9 = zext i1 %op8 to i32
  %op10 = add i32 %op9, zeroinitializer
  %op11 = icmp slt i32 23, zeroinitializer
  %op12 = zext i1 %op11 to i32
  %op13 = add i32 %op12, %op10
  %op14 = icmp ne i32 %op13, zeroinitializer
  br i1 %op14, label %label_array_ltz8, label %label_array_gtz9
label_condition3:                                                ; preds = %label_loop1, %label_array_gtz7
  %op15 = load i32, i32* %op7
  %op16 = load i32, i32* @N
  %op17 = icmp slt i32 %op15, %op16
  %op18 = zext i1 %op17 to i32
  %op19 = icmp sgt i32 %op18, zeroinitializer
  br i1 %op19, label %label_loop4, label %label_ret5
label_loop4:                                                ; preds = %label_condition3
  %op20 = load i32, i32* %op7
  %op21 = load i32, i32* %op0
  %op22 = icmp slt i32 %op21, zeroinitializer
  %op23 = zext i1 %op22 to i32
  %op24 = add i32 %op23, zeroinitializer
  %op25 = icmp slt i32 %op20, zeroinitializer
  %op26 = zext i1 %op25 to i32
  %op27 = add i32 %op26, %op24
  %op28 = icmp ne i32 %op27, zeroinitializer
  br i1 %op28, label %label_array_ltz6, label %label_array_gtz7
label_ret5:                                                ; preds = %label_condition3
  %op29 = load i32, i32* %op0
  %op30 = add i32 %op29, 1
  store i32 %op30, i32* %op0
  br label %label_condition0
label_array_ltz6:                                                ; preds = %label_loop4
  call void @neg_idx_except()
  br label %label_array_gtz7
label_array_gtz7:                                                ; preds = %label_loop4, %label_array_ltz6
  %op31 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op21, i32 %op20
  %op32 = load i32, i32* %op7
  store i32 %op32, i32* %op31
  %op33 = load i32, i32* %op7
  %op34 = add i32 %op33, 1
  store i32 %op34, i32* %op7
  br label %label_condition3
label_array_ltz8:                                                ; preds = %label_ret2
  call void @neg_idx_except()
  br label %label_array_gtz9
label_array_gtz9:                                                ; preds = %label_ret2, %label_array_ltz8
  %op35 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 19, i32 23
  %op36 = load i32, i32* %op35
  %op37 = icmp slt i32 18, zeroinitializer
  %op38 = zext i1 %op37 to i32
  %op39 = add i32 %op38, zeroinitializer
  %op40 = icmp slt i32 %op36, zeroinitializer
  %op41 = zext i1 %op40 to i32
  %op42 = add i32 %op41, %op39
  %op43 = icmp ne i32 %op42, zeroinitializer
  br i1 %op43, label %label_array_ltz10, label %label_array_gtz11
label_array_ltz10:                                                ; preds = %label_array_gtz9
  call void @neg_idx_except()
  br label %label_array_gtz11
label_array_gtz11:                                                ; preds = %label_array_gtz9, %label_array_ltz10
  %op44 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 18, i32 %op36
  %op45 = load i32, i32* %op44
  %op46 = icmp slt i32 17, zeroinitializer
  %op47 = zext i1 %op46 to i32
  %op48 = add i32 %op47, zeroinitializer
  %op49 = icmp slt i32 %op45, zeroinitializer
  %op50 = zext i1 %op49 to i32
  %op51 = add i32 %op50, %op48
  %op52 = icmp ne i32 %op51, zeroinitializer
  br i1 %op52, label %label_array_ltz12, label %label_array_gtz13
label_array_ltz12:                                                ; preds = %label_array_gtz11
  call void @neg_idx_except()
  br label %label_array_gtz13
label_array_gtz13:                                                ; preds = %label_array_gtz11, %label_array_ltz12
  %op53 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 17, i32 %op45
  %op54 = load i32, i32* %op53
  %op55 = icmp slt i32 16, zeroinitializer
  %op56 = zext i1 %op55 to i32
  %op57 = add i32 %op56, zeroinitializer
  %op58 = icmp slt i32 %op54, zeroinitializer
  %op59 = zext i1 %op58 to i32
  %op60 = add i32 %op59, %op57
  %op61 = icmp ne i32 %op60, zeroinitializer
  br i1 %op61, label %label_array_ltz14, label %label_array_gtz15
label_array_ltz14:                                                ; preds = %label_array_gtz13
  call void @neg_idx_except()
  br label %label_array_gtz15
label_array_gtz15:                                                ; preds = %label_array_gtz13, %label_array_ltz14
  %op62 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 16, i32 %op54
  %op63 = load i32, i32* %op62
  %op64 = icmp slt i32 15, zeroinitializer
  %op65 = zext i1 %op64 to i32
  %op66 = add i32 %op65, zeroinitializer
  %op67 = icmp slt i32 %op63, zeroinitializer
  %op68 = zext i1 %op67 to i32
  %op69 = add i32 %op68, %op66
  %op70 = icmp ne i32 %op69, zeroinitializer
  br i1 %op70, label %label_array_ltz16, label %label_array_gtz17
label_array_ltz16:                                                ; preds = %label_array_gtz15
  call void @neg_idx_except()
  br label %label_array_gtz17
label_array_gtz17:                                                ; preds = %label_array_gtz15, %label_array_ltz16
  %op71 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 15, i32 %op63
  %op72 = load i32, i32* %op71
  %op73 = icmp slt i32 14, zeroinitializer
  %op74 = zext i1 %op73 to i32
  %op75 = add i32 %op74, zeroinitializer
  %op76 = icmp slt i32 %op72, zeroinitializer
  %op77 = zext i1 %op76 to i32
  %op78 = add i32 %op77, %op75
  %op79 = icmp ne i32 %op78, zeroinitializer
  br i1 %op79, label %label_array_ltz18, label %label_array_gtz19
label_array_ltz18:                                                ; preds = %label_array_gtz17
  call void @neg_idx_except()
  br label %label_array_gtz19
label_array_gtz19:                                                ; preds = %label_array_gtz17, %label_array_ltz18
  %op80 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 14, i32 %op72
  %op81 = load i32, i32* %op80
  %op82 = icmp slt i32 13, zeroinitializer
  %op83 = zext i1 %op82 to i32
  %op84 = add i32 %op83, zeroinitializer
  %op85 = icmp slt i32 %op81, zeroinitializer
  %op86 = zext i1 %op85 to i32
  %op87 = add i32 %op86, %op84
  %op88 = icmp ne i32 %op87, zeroinitializer
  br i1 %op88, label %label_array_ltz20, label %label_array_gtz21
label_array_ltz20:                                                ; preds = %label_array_gtz19
  call void @neg_idx_except()
  br label %label_array_gtz21
label_array_gtz21:                                                ; preds = %label_array_gtz19, %label_array_ltz20
  %op89 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 13, i32 %op81
  %op90 = load i32, i32* %op89
  %op91 = icmp slt i32 12, zeroinitializer
  %op92 = zext i1 %op91 to i32
  %op93 = add i32 %op92, zeroinitializer
  %op94 = icmp slt i32 %op90, zeroinitializer
  %op95 = zext i1 %op94 to i32
  %op96 = add i32 %op95, %op93
  %op97 = icmp ne i32 %op96, zeroinitializer
  br i1 %op97, label %label_array_ltz22, label %label_array_gtz23
label_array_ltz22:                                                ; preds = %label_array_gtz21
  call void @neg_idx_except()
  br label %label_array_gtz23
label_array_gtz23:                                                ; preds = %label_array_gtz21, %label_array_ltz22
  %op98 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 12, i32 %op90
  %op99 = load i32, i32* %op98
  %op100 = icmp slt i32 11, zeroinitializer
  %op101 = zext i1 %op100 to i32
  %op102 = add i32 %op101, zeroinitializer
  %op103 = icmp slt i32 %op99, zeroinitializer
  %op104 = zext i1 %op103 to i32
  %op105 = add i32 %op104, %op102
  %op106 = icmp ne i32 %op105, zeroinitializer
  br i1 %op106, label %label_array_ltz24, label %label_array_gtz25
label_array_ltz24:                                                ; preds = %label_array_gtz23
  call void @neg_idx_except()
  br label %label_array_gtz25
label_array_gtz25:                                                ; preds = %label_array_gtz23, %label_array_ltz24
  %op107 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 11, i32 %op99
  %op108 = load i32, i32* %op107
  %op109 = icmp slt i32 10, zeroinitializer
  %op110 = zext i1 %op109 to i32
  %op111 = add i32 %op110, zeroinitializer
  %op112 = icmp slt i32 %op108, zeroinitializer
  %op113 = zext i1 %op112 to i32
  %op114 = add i32 %op113, %op111
  %op115 = icmp ne i32 %op114, zeroinitializer
  br i1 %op115, label %label_array_ltz26, label %label_array_gtz27
label_array_ltz26:                                                ; preds = %label_array_gtz25
  call void @neg_idx_except()
  br label %label_array_gtz27
label_array_gtz27:                                                ; preds = %label_array_gtz25, %label_array_ltz26
  %op116 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 10, i32 %op108
  %op117 = load i32, i32* %op116
  %op118 = icmp slt i32 9, zeroinitializer
  %op119 = zext i1 %op118 to i32
  %op120 = add i32 %op119, zeroinitializer
  %op121 = icmp slt i32 %op117, zeroinitializer
  %op122 = zext i1 %op121 to i32
  %op123 = add i32 %op122, %op120
  %op124 = icmp ne i32 %op123, zeroinitializer
  br i1 %op124, label %label_array_ltz28, label %label_array_gtz29
label_array_ltz28:                                                ; preds = %label_array_gtz27
  call void @neg_idx_except()
  br label %label_array_gtz29
label_array_gtz29:                                                ; preds = %label_array_gtz27, %label_array_ltz28
  %op125 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 9, i32 %op117
  %op126 = load i32, i32* %op125
  %op127 = icmp slt i32 8, zeroinitializer
  %op128 = zext i1 %op127 to i32
  %op129 = add i32 %op128, zeroinitializer
  %op130 = icmp slt i32 %op126, zeroinitializer
  %op131 = zext i1 %op130 to i32
  %op132 = add i32 %op131, %op129
  %op133 = icmp ne i32 %op132, zeroinitializer
  br i1 %op133, label %label_array_ltz30, label %label_array_gtz31
label_array_ltz30:                                                ; preds = %label_array_gtz29
  call void @neg_idx_except()
  br label %label_array_gtz31
label_array_gtz31:                                                ; preds = %label_array_gtz29, %label_array_ltz30
  %op134 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 8, i32 %op126
  %op135 = load i32, i32* %op134
  %op136 = icmp slt i32 7, zeroinitializer
  %op137 = zext i1 %op136 to i32
  %op138 = add i32 %op137, zeroinitializer
  %op139 = icmp slt i32 %op135, zeroinitializer
  %op140 = zext i1 %op139 to i32
  %op141 = add i32 %op140, %op138
  %op142 = icmp ne i32 %op141, zeroinitializer
  br i1 %op142, label %label_array_ltz32, label %label_array_gtz33
label_array_ltz32:                                                ; preds = %label_array_gtz31
  call void @neg_idx_except()
  br label %label_array_gtz33
label_array_gtz33:                                                ; preds = %label_array_gtz31, %label_array_ltz32
  %op143 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 7, i32 %op135
  %op144 = load i32, i32* %op143
  %op145 = icmp slt i32 6, zeroinitializer
  %op146 = zext i1 %op145 to i32
  %op147 = add i32 %op146, zeroinitializer
  %op148 = icmp slt i32 %op144, zeroinitializer
  %op149 = zext i1 %op148 to i32
  %op150 = add i32 %op149, %op147
  %op151 = icmp ne i32 %op150, zeroinitializer
  br i1 %op151, label %label_array_ltz34, label %label_array_gtz35
label_array_ltz34:                                                ; preds = %label_array_gtz33
  call void @neg_idx_except()
  br label %label_array_gtz35
label_array_gtz35:                                                ; preds = %label_array_gtz33, %label_array_ltz34
  %op152 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 6, i32 %op144
  %op153 = load i32, i32* %op152
  %op154 = icmp slt i32 5, zeroinitializer
  %op155 = zext i1 %op154 to i32
  %op156 = add i32 %op155, zeroinitializer
  %op157 = icmp slt i32 %op153, zeroinitializer
  %op158 = zext i1 %op157 to i32
  %op159 = add i32 %op158, %op156
  %op160 = icmp ne i32 %op159, zeroinitializer
  br i1 %op160, label %label_array_ltz36, label %label_array_gtz37
label_array_ltz36:                                                ; preds = %label_array_gtz35
  call void @neg_idx_except()
  br label %label_array_gtz37
label_array_gtz37:                                                ; preds = %label_array_gtz35, %label_array_ltz36
  %op161 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 5, i32 %op153
  %op162 = load i32, i32* %op161
  %op163 = icmp slt i32 4, zeroinitializer
  %op164 = zext i1 %op163 to i32
  %op165 = add i32 %op164, zeroinitializer
  %op166 = icmp slt i32 %op162, zeroinitializer
  %op167 = zext i1 %op166 to i32
  %op168 = add i32 %op167, %op165
  %op169 = icmp ne i32 %op168, zeroinitializer
  br i1 %op169, label %label_array_ltz38, label %label_array_gtz39
label_array_ltz38:                                                ; preds = %label_array_gtz37
  call void @neg_idx_except()
  br label %label_array_gtz39
label_array_gtz39:                                                ; preds = %label_array_gtz37, %label_array_ltz38
  %op170 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 4, i32 %op162
  %op171 = load i32, i32* %op170
  %op172 = icmp slt i32 3, zeroinitializer
  %op173 = zext i1 %op172 to i32
  %op174 = add i32 %op173, zeroinitializer
  %op175 = icmp slt i32 %op171, zeroinitializer
  %op176 = zext i1 %op175 to i32
  %op177 = add i32 %op176, %op174
  %op178 = icmp ne i32 %op177, zeroinitializer
  br i1 %op178, label %label_array_ltz40, label %label_array_gtz41
label_array_ltz40:                                                ; preds = %label_array_gtz39
  call void @neg_idx_except()
  br label %label_array_gtz41
label_array_gtz41:                                                ; preds = %label_array_gtz39, %label_array_ltz40
  %op179 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 3, i32 %op171
  %op180 = load i32, i32* %op179
  %op181 = icmp slt i32 2, zeroinitializer
  %op182 = zext i1 %op181 to i32
  %op183 = add i32 %op182, zeroinitializer
  %op184 = icmp slt i32 %op180, zeroinitializer
  %op185 = zext i1 %op184 to i32
  %op186 = add i32 %op185, %op183
  %op187 = icmp ne i32 %op186, zeroinitializer
  br i1 %op187, label %label_array_ltz42, label %label_array_gtz43
label_array_ltz42:                                                ; preds = %label_array_gtz41
  call void @neg_idx_except()
  br label %label_array_gtz43
label_array_gtz43:                                                ; preds = %label_array_gtz41, %label_array_ltz42
  %op188 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 2, i32 %op180
  %op189 = load i32, i32* %op188
  %op190 = icmp slt i32 1, zeroinitializer
  %op191 = zext i1 %op190 to i32
  %op192 = add i32 %op191, zeroinitializer
  %op193 = icmp slt i32 %op189, zeroinitializer
  %op194 = zext i1 %op193 to i32
  %op195 = add i32 %op194, %op192
  %op196 = icmp ne i32 %op195, zeroinitializer
  br i1 %op196, label %label_array_ltz44, label %label_array_gtz45
label_array_ltz44:                                                ; preds = %label_array_gtz43
  call void @neg_idx_except()
  br label %label_array_gtz45
label_array_gtz45:                                                ; preds = %label_array_gtz43, %label_array_ltz44
  %op197 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 1, i32 %op189
  %op198 = load i32, i32* %op197
  %op199 = icmp slt i32 0, zeroinitializer
  %op200 = zext i1 %op199 to i32
  %op201 = add i32 %op200, zeroinitializer
  %op202 = icmp slt i32 %op198, zeroinitializer
  %op203 = zext i1 %op202 to i32
  %op204 = add i32 %op203, %op201
  %op205 = icmp ne i32 %op204, zeroinitializer
  br i1 %op205, label %label_array_ltz46, label %label_array_gtz47
label_array_ltz46:                                                ; preds = %label_array_gtz45
  call void @neg_idx_except()
  br label %label_array_gtz47
label_array_gtz47:                                                ; preds = %label_array_gtz45, %label_array_ltz46
  %op206 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 0, i32 %op198
  %op207 = load i32, i32* %op206
  %op208 = icmp slt i32 19, zeroinitializer
  %op209 = zext i1 %op208 to i32
  %op210 = add i32 %op209, zeroinitializer
  %op211 = icmp slt i32 18, zeroinitializer
  %op212 = zext i1 %op211 to i32
  %op213 = add i32 %op212, %op210
  %op214 = icmp ne i32 %op213, zeroinitializer
  br i1 %op214, label %label_array_ltz48, label %label_array_gtz49
label_array_ltz48:                                                ; preds = %label_array_gtz47
  call void @neg_idx_except()
  br label %label_array_gtz49
label_array_gtz49:                                                ; preds = %label_array_gtz47, %label_array_ltz48
  %op215 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 19, i32 18
  %op216 = load i32, i32* %op215
  %op217 = icmp slt i32 %op216, zeroinitializer
  %op218 = zext i1 %op217 to i32
  %op219 = add i32 %op218, zeroinitializer
  %op220 = icmp slt i32 17, zeroinitializer
  %op221 = zext i1 %op220 to i32
  %op222 = add i32 %op221, %op219
  %op223 = icmp ne i32 %op222, zeroinitializer
  br i1 %op223, label %label_array_ltz50, label %label_array_gtz51
label_array_ltz50:                                                ; preds = %label_array_gtz49
  call void @neg_idx_except()
  br label %label_array_gtz51
label_array_gtz51:                                                ; preds = %label_array_gtz49, %label_array_ltz50
  %op224 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op216, i32 17
  %op225 = load i32, i32* %op224
  %op226 = icmp slt i32 %op225, zeroinitializer
  %op227 = zext i1 %op226 to i32
  %op228 = add i32 %op227, zeroinitializer
  %op229 = icmp slt i32 16, zeroinitializer
  %op230 = zext i1 %op229 to i32
  %op231 = add i32 %op230, %op228
  %op232 = icmp ne i32 %op231, zeroinitializer
  br i1 %op232, label %label_array_ltz52, label %label_array_gtz53
label_array_ltz52:                                                ; preds = %label_array_gtz51
  call void @neg_idx_except()
  br label %label_array_gtz53
label_array_gtz53:                                                ; preds = %label_array_gtz51, %label_array_ltz52
  %op233 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op225, i32 16
  %op234 = load i32, i32* %op233
  %op235 = icmp slt i32 %op234, zeroinitializer
  %op236 = zext i1 %op235 to i32
  %op237 = add i32 %op236, zeroinitializer
  %op238 = icmp slt i32 15, zeroinitializer
  %op239 = zext i1 %op238 to i32
  %op240 = add i32 %op239, %op237
  %op241 = icmp ne i32 %op240, zeroinitializer
  br i1 %op241, label %label_array_ltz54, label %label_array_gtz55
label_array_ltz54:                                                ; preds = %label_array_gtz53
  call void @neg_idx_except()
  br label %label_array_gtz55
label_array_gtz55:                                                ; preds = %label_array_gtz53, %label_array_ltz54
  %op242 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op234, i32 15
  %op243 = load i32, i32* %op242
  %op244 = icmp slt i32 %op243, zeroinitializer
  %op245 = zext i1 %op244 to i32
  %op246 = add i32 %op245, zeroinitializer
  %op247 = icmp slt i32 14, zeroinitializer
  %op248 = zext i1 %op247 to i32
  %op249 = add i32 %op248, %op246
  %op250 = icmp ne i32 %op249, zeroinitializer
  br i1 %op250, label %label_array_ltz56, label %label_array_gtz57
label_array_ltz56:                                                ; preds = %label_array_gtz55
  call void @neg_idx_except()
  br label %label_array_gtz57
label_array_gtz57:                                                ; preds = %label_array_gtz55, %label_array_ltz56
  %op251 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op243, i32 14
  %op252 = load i32, i32* %op251
  %op253 = icmp slt i32 %op252, zeroinitializer
  %op254 = zext i1 %op253 to i32
  %op255 = add i32 %op254, zeroinitializer
  %op256 = icmp slt i32 13, zeroinitializer
  %op257 = zext i1 %op256 to i32
  %op258 = add i32 %op257, %op255
  %op259 = icmp ne i32 %op258, zeroinitializer
  br i1 %op259, label %label_array_ltz58, label %label_array_gtz59
label_array_ltz58:                                                ; preds = %label_array_gtz57
  call void @neg_idx_except()
  br label %label_array_gtz59
label_array_gtz59:                                                ; preds = %label_array_gtz57, %label_array_ltz58
  %op260 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op252, i32 13
  %op261 = load i32, i32* %op260
  %op262 = icmp slt i32 %op261, zeroinitializer
  %op263 = zext i1 %op262 to i32
  %op264 = add i32 %op263, zeroinitializer
  %op265 = icmp slt i32 12, zeroinitializer
  %op266 = zext i1 %op265 to i32
  %op267 = add i32 %op266, %op264
  %op268 = icmp ne i32 %op267, zeroinitializer
  br i1 %op268, label %label_array_ltz60, label %label_array_gtz61
label_array_ltz60:                                                ; preds = %label_array_gtz59
  call void @neg_idx_except()
  br label %label_array_gtz61
label_array_gtz61:                                                ; preds = %label_array_gtz59, %label_array_ltz60
  %op269 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op261, i32 12
  %op270 = load i32, i32* %op269
  %op271 = icmp slt i32 %op270, zeroinitializer
  %op272 = zext i1 %op271 to i32
  %op273 = add i32 %op272, zeroinitializer
  %op274 = icmp slt i32 11, zeroinitializer
  %op275 = zext i1 %op274 to i32
  %op276 = add i32 %op275, %op273
  %op277 = icmp ne i32 %op276, zeroinitializer
  br i1 %op277, label %label_array_ltz62, label %label_array_gtz63
label_array_ltz62:                                                ; preds = %label_array_gtz61
  call void @neg_idx_except()
  br label %label_array_gtz63
label_array_gtz63:                                                ; preds = %label_array_gtz61, %label_array_ltz62
  %op278 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op270, i32 11
  %op279 = load i32, i32* %op278
  %op280 = icmp slt i32 %op279, zeroinitializer
  %op281 = zext i1 %op280 to i32
  %op282 = add i32 %op281, zeroinitializer
  %op283 = icmp slt i32 10, zeroinitializer
  %op284 = zext i1 %op283 to i32
  %op285 = add i32 %op284, %op282
  %op286 = icmp ne i32 %op285, zeroinitializer
  br i1 %op286, label %label_array_ltz64, label %label_array_gtz65
label_array_ltz64:                                                ; preds = %label_array_gtz63
  call void @neg_idx_except()
  br label %label_array_gtz65
label_array_gtz65:                                                ; preds = %label_array_gtz63, %label_array_ltz64
  %op287 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op279, i32 10
  %op288 = load i32, i32* %op287
  %op289 = icmp slt i32 %op288, zeroinitializer
  %op290 = zext i1 %op289 to i32
  %op291 = add i32 %op290, zeroinitializer
  %op292 = icmp slt i32 9, zeroinitializer
  %op293 = zext i1 %op292 to i32
  %op294 = add i32 %op293, %op291
  %op295 = icmp ne i32 %op294, zeroinitializer
  br i1 %op295, label %label_array_ltz66, label %label_array_gtz67
label_array_ltz66:                                                ; preds = %label_array_gtz65
  call void @neg_idx_except()
  br label %label_array_gtz67
label_array_gtz67:                                                ; preds = %label_array_gtz65, %label_array_ltz66
  %op296 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op288, i32 9
  %op297 = load i32, i32* %op296
  %op298 = icmp slt i32 %op297, zeroinitializer
  %op299 = zext i1 %op298 to i32
  %op300 = add i32 %op299, zeroinitializer
  %op301 = icmp slt i32 8, zeroinitializer
  %op302 = zext i1 %op301 to i32
  %op303 = add i32 %op302, %op300
  %op304 = icmp ne i32 %op303, zeroinitializer
  br i1 %op304, label %label_array_ltz68, label %label_array_gtz69
label_array_ltz68:                                                ; preds = %label_array_gtz67
  call void @neg_idx_except()
  br label %label_array_gtz69
label_array_gtz69:                                                ; preds = %label_array_gtz67, %label_array_ltz68
  %op305 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op297, i32 8
  %op306 = load i32, i32* %op305
  %op307 = icmp slt i32 %op306, zeroinitializer
  %op308 = zext i1 %op307 to i32
  %op309 = add i32 %op308, zeroinitializer
  %op310 = icmp slt i32 7, zeroinitializer
  %op311 = zext i1 %op310 to i32
  %op312 = add i32 %op311, %op309
  %op313 = icmp ne i32 %op312, zeroinitializer
  br i1 %op313, label %label_array_ltz70, label %label_array_gtz71
label_array_ltz70:                                                ; preds = %label_array_gtz69
  call void @neg_idx_except()
  br label %label_array_gtz71
label_array_gtz71:                                                ; preds = %label_array_gtz69, %label_array_ltz70
  %op314 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op306, i32 7
  %op315 = load i32, i32* %op314
  %op316 = icmp slt i32 %op315, zeroinitializer
  %op317 = zext i1 %op316 to i32
  %op318 = add i32 %op317, zeroinitializer
  %op319 = icmp slt i32 6, zeroinitializer
  %op320 = zext i1 %op319 to i32
  %op321 = add i32 %op320, %op318
  %op322 = icmp ne i32 %op321, zeroinitializer
  br i1 %op322, label %label_array_ltz72, label %label_array_gtz73
label_array_ltz72:                                                ; preds = %label_array_gtz71
  call void @neg_idx_except()
  br label %label_array_gtz73
label_array_gtz73:                                                ; preds = %label_array_gtz71, %label_array_ltz72
  %op323 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op315, i32 6
  %op324 = load i32, i32* %op323
  %op325 = icmp slt i32 %op324, zeroinitializer
  %op326 = zext i1 %op325 to i32
  %op327 = add i32 %op326, zeroinitializer
  %op328 = icmp slt i32 5, zeroinitializer
  %op329 = zext i1 %op328 to i32
  %op330 = add i32 %op329, %op327
  %op331 = icmp ne i32 %op330, zeroinitializer
  br i1 %op331, label %label_array_ltz74, label %label_array_gtz75
label_array_ltz74:                                                ; preds = %label_array_gtz73
  call void @neg_idx_except()
  br label %label_array_gtz75
label_array_gtz75:                                                ; preds = %label_array_gtz73, %label_array_ltz74
  %op332 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op324, i32 5
  %op333 = load i32, i32* %op332
  %op334 = icmp slt i32 %op333, zeroinitializer
  %op335 = zext i1 %op334 to i32
  %op336 = add i32 %op335, zeroinitializer
  %op337 = icmp slt i32 4, zeroinitializer
  %op338 = zext i1 %op337 to i32
  %op339 = add i32 %op338, %op336
  %op340 = icmp ne i32 %op339, zeroinitializer
  br i1 %op340, label %label_array_ltz76, label %label_array_gtz77
label_array_ltz76:                                                ; preds = %label_array_gtz75
  call void @neg_idx_except()
  br label %label_array_gtz77
label_array_gtz77:                                                ; preds = %label_array_gtz75, %label_array_ltz76
  %op341 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op333, i32 4
  %op342 = load i32, i32* %op341
  %op343 = icmp slt i32 %op342, zeroinitializer
  %op344 = zext i1 %op343 to i32
  %op345 = add i32 %op344, zeroinitializer
  %op346 = icmp slt i32 3, zeroinitializer
  %op347 = zext i1 %op346 to i32
  %op348 = add i32 %op347, %op345
  %op349 = icmp ne i32 %op348, zeroinitializer
  br i1 %op349, label %label_array_ltz78, label %label_array_gtz79
label_array_ltz78:                                                ; preds = %label_array_gtz77
  call void @neg_idx_except()
  br label %label_array_gtz79
label_array_gtz79:                                                ; preds = %label_array_gtz77, %label_array_ltz78
  %op350 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op342, i32 3
  %op351 = load i32, i32* %op350
  %op352 = icmp slt i32 %op351, zeroinitializer
  %op353 = zext i1 %op352 to i32
  %op354 = add i32 %op353, zeroinitializer
  %op355 = icmp slt i32 2, zeroinitializer
  %op356 = zext i1 %op355 to i32
  %op357 = add i32 %op356, %op354
  %op358 = icmp ne i32 %op357, zeroinitializer
  br i1 %op358, label %label_array_ltz80, label %label_array_gtz81
label_array_ltz80:                                                ; preds = %label_array_gtz79
  call void @neg_idx_except()
  br label %label_array_gtz81
label_array_gtz81:                                                ; preds = %label_array_gtz79, %label_array_ltz80
  %op359 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op351, i32 2
  %op360 = load i32, i32* %op359
  %op361 = icmp slt i32 %op360, zeroinitializer
  %op362 = zext i1 %op361 to i32
  %op363 = add i32 %op362, zeroinitializer
  %op364 = icmp slt i32 1, zeroinitializer
  %op365 = zext i1 %op364 to i32
  %op366 = add i32 %op365, %op363
  %op367 = icmp ne i32 %op366, zeroinitializer
  br i1 %op367, label %label_array_ltz82, label %label_array_gtz83
label_array_ltz82:                                                ; preds = %label_array_gtz81
  call void @neg_idx_except()
  br label %label_array_gtz83
label_array_gtz83:                                                ; preds = %label_array_gtz81, %label_array_ltz82
  %op368 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op360, i32 1
  %op369 = load i32, i32* %op368
  %op370 = icmp slt i32 %op369, zeroinitializer
  %op371 = zext i1 %op370 to i32
  %op372 = add i32 %op371, zeroinitializer
  %op373 = icmp slt i32 0, zeroinitializer
  %op374 = zext i1 %op373 to i32
  %op375 = add i32 %op374, %op372
  %op376 = icmp ne i32 %op375, zeroinitializer
  br i1 %op376, label %label_array_ltz84, label %label_array_gtz85
label_array_ltz84:                                                ; preds = %label_array_gtz83
  call void @neg_idx_except()
  br label %label_array_gtz85
label_array_gtz85:                                                ; preds = %label_array_gtz83, %label_array_ltz84
  %op377 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op369, i32 0
  %op378 = load i32, i32* %op377
  %op379 = icmp slt i32 %op378, zeroinitializer
  %op380 = zext i1 %op379 to i32
  %op381 = add i32 %op380, zeroinitializer
  %op382 = icmp slt i32 56, zeroinitializer
  %op383 = zext i1 %op382 to i32
  %op384 = add i32 %op383, %op381
  %op385 = icmp ne i32 %op384, zeroinitializer
  br i1 %op385, label %label_array_ltz86, label %label_array_gtz87
label_array_ltz86:                                                ; preds = %label_array_gtz85
  call void @neg_idx_except()
  br label %label_array_gtz87
label_array_gtz87:                                                ; preds = %label_array_gtz85, %label_array_ltz86
  %op386 = getelementptr [20 x [100 x i32]], [20 x [100 x i32]]* @array, i32 0, i32 %op378, i32 56
  %op387 = load i32, i32* %op386
  %op388 = add i32 %op207, %op387
  store i32 %op388, i32* %op1
  %op389 = load i32, i32* %op1
  call void @putint(i32 %op389)
  ret i32 0
}
