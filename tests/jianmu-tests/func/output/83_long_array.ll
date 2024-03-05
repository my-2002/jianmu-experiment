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
  %op1 = alloca [10000 x i32]
  %op2 = alloca [10000 x i32]
  %op3 = alloca [10000 x i32]
  br label %label_condition0
label_condition0:                                                ; preds = %label_entry, %label_a1_gtz4
  %op4 = phi i32 [ 0, %label_entry ], [ %op17, %label_a1_gtz4 ]
  %op5 = icmp slt i32 %op4, 10000
  %op6 = zext i1 %op5 to i32
  %op7 = icmp sgt i32 %op6, zeroinitializer
  br i1 %op7, label %label_loop1, label %label_ret2
label_loop1:                                                ; preds = %label_condition0
  %op8 = icmp slt i32 %op4, zeroinitializer
  %op9 = zext i1 %op8 to i32
  %op10 = add i32 %op9, zeroinitializer
  %op11 = icmp ne i32 %op10, zeroinitializer
  br i1 %op11, label %label_a1_ltz3, label %label_a1_gtz4
label_ret2:                                                ; preds = %label_condition0
  br label %label_condition5
label_a1_ltz3:                                                ; preds = %label_loop1
  call void @neg_idx_except()
  br label %label_a1_gtz4
label_a1_gtz4:                                                ; preds = %label_loop1, %label_a1_ltz3
  %op12 = getelementptr [10000 x i32], [10000 x i32]* %op1, i32 0, i32 %op4
  %op13 = mul i32 %op4, %op4
  %op14 = sdiv i32 %op13, 10
  %op15 = mul i32 %op14, 10
  %op16 = sub i32 %op13, %op15
  store i32 %op16, i32* %op12
  %op17 = add i32 %op4, 1
  br label %label_condition0
label_condition5:                                                ; preds = %label_ret2, %label_a1_gtz13
  %op18 = phi i32 [ 0, %label_ret2 ], [ %op43, %label_a1_gtz13 ]
  %op19 = icmp slt i32 %op18, 10000
  %op20 = zext i1 %op19 to i32
  %op21 = icmp sgt i32 %op20, zeroinitializer
  br i1 %op21, label %label_loop6, label %label_ret7
label_loop6:                                                ; preds = %label_condition5
  %op22 = icmp slt i32 %op18, zeroinitializer
  %op23 = zext i1 %op22 to i32
  %op24 = add i32 %op23, zeroinitializer
  %op25 = icmp ne i32 %op24, zeroinitializer
  br i1 %op25, label %label_a2_ltz8, label %label_a2_gtz9
label_ret7:                                                ; preds = %label_condition5
  br label %label_condition14
label_a2_ltz8:                                                ; preds = %label_loop6
  call void @neg_idx_except()
  br label %label_a2_gtz9
label_a2_gtz9:                                                ; preds = %label_loop6, %label_a2_ltz8
  %op26 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op18
  %op27 = icmp slt i32 %op18, zeroinitializer
  %op28 = zext i1 %op27 to i32
  %op29 = add i32 %op28, zeroinitializer
  %op30 = icmp ne i32 %op29, zeroinitializer
  br i1 %op30, label %label_a1_ltz10, label %label_a1_gtz11
label_a1_ltz10:                                                ; preds = %label_a2_gtz9
  call void @neg_idx_except()
  br label %label_a1_gtz11
label_a1_gtz11:                                                ; preds = %label_a2_gtz9, %label_a1_ltz10
  %op31 = getelementptr [10000 x i32], [10000 x i32]* %op1, i32 0, i32 %op18
  %op32 = load i32, i32* %op31
  %op33 = icmp slt i32 %op18, zeroinitializer
  %op34 = zext i1 %op33 to i32
  %op35 = add i32 %op34, zeroinitializer
  %op36 = icmp ne i32 %op35, zeroinitializer
  br i1 %op36, label %label_a1_ltz12, label %label_a1_gtz13
label_a1_ltz12:                                                ; preds = %label_a1_gtz11
  call void @neg_idx_except()
  br label %label_a1_gtz13
label_a1_gtz13:                                                ; preds = %label_a1_gtz11, %label_a1_ltz12
  %op37 = getelementptr [10000 x i32], [10000 x i32]* %op1, i32 0, i32 %op18
  %op38 = load i32, i32* %op37
  %op39 = mul i32 %op32, %op38
  %op40 = sdiv i32 %op39, 10
  %op41 = mul i32 %op40, 10
  %op42 = sub i32 %op39, %op41
  store i32 %op42, i32* %op26
  %op43 = add i32 %op18, 1
  br label %label_condition5
label_condition14:                                                ; preds = %label_ret7, %label_a1_gtz24
  %op44 = phi i32 [ 0, %label_ret7 ], [ %op76, %label_a1_gtz24 ]
  %op45 = icmp slt i32 %op44, 10000
  %op46 = zext i1 %op45 to i32
  %op47 = icmp sgt i32 %op46, zeroinitializer
  br i1 %op47, label %label_loop15, label %label_ret16
label_loop15:                                                ; preds = %label_condition14
  %op48 = icmp slt i32 %op44, zeroinitializer
  %op49 = zext i1 %op48 to i32
  %op50 = add i32 %op49, zeroinitializer
  %op51 = icmp ne i32 %op50, zeroinitializer
  br i1 %op51, label %label_a3_ltz17, label %label_a3_gtz18
label_ret16:                                                ; preds = %label_condition14
  br label %label_condition25
label_a3_ltz17:                                                ; preds = %label_loop15
  call void @neg_idx_except()
  br label %label_a3_gtz18
label_a3_gtz18:                                                ; preds = %label_loop15, %label_a3_ltz17
  %op52 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op44
  %op53 = icmp slt i32 %op44, zeroinitializer
  %op54 = zext i1 %op53 to i32
  %op55 = add i32 %op54, zeroinitializer
  %op56 = icmp ne i32 %op55, zeroinitializer
  br i1 %op56, label %label_a2_ltz19, label %label_a2_gtz20
label_a2_ltz19:                                                ; preds = %label_a3_gtz18
  call void @neg_idx_except()
  br label %label_a2_gtz20
label_a2_gtz20:                                                ; preds = %label_a3_gtz18, %label_a2_ltz19
  %op57 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op44
  %op58 = load i32, i32* %op57
  %op59 = icmp slt i32 %op44, zeroinitializer
  %op60 = zext i1 %op59 to i32
  %op61 = add i32 %op60, zeroinitializer
  %op62 = icmp ne i32 %op61, zeroinitializer
  br i1 %op62, label %label_a2_ltz21, label %label_a2_gtz22
label_a2_ltz21:                                                ; preds = %label_a2_gtz20
  call void @neg_idx_except()
  br label %label_a2_gtz22
label_a2_gtz22:                                                ; preds = %label_a2_gtz20, %label_a2_ltz21
  %op63 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op44
  %op64 = load i32, i32* %op63
  %op65 = mul i32 %op58, %op64
  %op66 = sdiv i32 %op65, 100
  %op67 = mul i32 %op66, 100
  %op68 = sub i32 %op65, %op67
  %op69 = icmp slt i32 %op44, zeroinitializer
  %op70 = zext i1 %op69 to i32
  %op71 = add i32 %op70, zeroinitializer
  %op72 = icmp ne i32 %op71, zeroinitializer
  br i1 %op72, label %label_a1_ltz23, label %label_a1_gtz24
label_a1_ltz23:                                                ; preds = %label_a2_gtz22
  call void @neg_idx_except()
  br label %label_a1_gtz24
label_a1_gtz24:                                                ; preds = %label_a2_gtz22, %label_a1_ltz23
  %op73 = getelementptr [10000 x i32], [10000 x i32]* %op1, i32 0, i32 %op44
  %op74 = load i32, i32* %op73
  %op75 = add i32 %op68, %op74
  store i32 %op75, i32* %op52
  %op76 = add i32 %op44, 1
  br label %label_condition14
label_condition25:                                                ; preds = %label_ret16, %label_ret61
  %op77 = phi i32 [ 0, %label_ret16 ], [ %op177, %label_ret61 ]
  %op78 = phi i32 [ 0, %label_ret16 ], [ %op178, %label_ret61 ]
  %op79 = icmp slt i32 %op78, 10000
  %op80 = zext i1 %op79 to i32
  %op81 = icmp sgt i32 %op80, zeroinitializer
  br i1 %op81, label %label_loop26, label %label_ret27
label_loop26:                                                ; preds = %label_condition25
  %op82 = icmp slt i32 %op78, 10
  %op83 = zext i1 %op82 to i32
  %op84 = icmp sgt i32 %op83, zeroinitializer
  br i1 %op84, label %label_true28, label %label_false29
label_ret27:                                                ; preds = %label_condition25
  ret i32 %op77
label_true28:                                                ; preds = %label_loop26
  %op85 = icmp slt i32 %op78, zeroinitializer
  %op86 = zext i1 %op85 to i32
  %op87 = add i32 %op86, zeroinitializer
  %op88 = icmp ne i32 %op87, zeroinitializer
  br i1 %op88, label %label_a3_ltz30, label %label_a3_gtz31
label_false29:                                                ; preds = %label_loop26
  %op89 = icmp slt i32 %op78, 20
  %op90 = zext i1 %op89 to i32
  %op91 = icmp sgt i32 %op90, zeroinitializer
  br i1 %op91, label %label_true32, label %label_false33
label_a3_ltz30:                                                ; preds = %label_true28
  call void @neg_idx_except()
  br label %label_a3_gtz31
label_a3_gtz31:                                                ; preds = %label_true28, %label_a3_ltz30
  %op92 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op78
  %op93 = load i32, i32* %op92
  %op94 = add i32 %op77, %op93
  %op95 = sdiv i32 %op94, 1333
  %op96 = mul i32 %op95, 1333
  %op97 = sub i32 %op94, %op96
  call void @putint(i32 %op97)
  br label %label_ret61
label_true32:                                                ; preds = %label_false29
  br label %label_condition34
label_false33:                                                ; preds = %label_false29
  %op98 = icmp slt i32 %op78, 30
  %op99 = zext i1 %op98 to i32
  %op100 = icmp sgt i32 %op99, zeroinitializer
  br i1 %op100, label %label_true41, label %label_false42
label_condition34:                                                ; preds = %label_true32, %label_a1_gtz40
  %op101 = phi i32 [ 5000, %label_true32 ], [ %op120, %label_a1_gtz40 ]
  %op102 = phi i32 [ %op77, %label_true32 ], [ %op119, %label_a1_gtz40 ]
  %op103 = icmp slt i32 %op101, 10000
  %op104 = zext i1 %op103 to i32
  %op105 = icmp sgt i32 %op104, zeroinitializer
  br i1 %op105, label %label_loop35, label %label_ret36
label_loop35:                                                ; preds = %label_condition34
  %op106 = icmp slt i32 %op78, zeroinitializer
  %op107 = zext i1 %op106 to i32
  %op108 = add i32 %op107, zeroinitializer
  %op109 = icmp ne i32 %op108, zeroinitializer
  br i1 %op109, label %label_a3_ltz37, label %label_a3_gtz38
label_ret36:                                                ; preds = %label_condition34
  call void @putint(i32 %op102)
  br label %label_ret60
label_a3_ltz37:                                                ; preds = %label_loop35
  call void @neg_idx_except()
  br label %label_a3_gtz38
label_a3_gtz38:                                                ; preds = %label_loop35, %label_a3_ltz37
  %op110 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op78
  %op111 = load i32, i32* %op110
  %op112 = add i32 %op102, %op111
  %op113 = icmp slt i32 %op101, zeroinitializer
  %op114 = zext i1 %op113 to i32
  %op115 = add i32 %op114, zeroinitializer
  %op116 = icmp ne i32 %op115, zeroinitializer
  br i1 %op116, label %label_a1_ltz39, label %label_a1_gtz40
label_a1_ltz39:                                                ; preds = %label_a3_gtz38
  call void @neg_idx_except()
  br label %label_a1_gtz40
label_a1_gtz40:                                                ; preds = %label_a3_gtz38, %label_a1_ltz39
  %op117 = getelementptr [10000 x i32], [10000 x i32]* %op1, i32 0, i32 %op101
  %op118 = load i32, i32* %op117
  %op119 = sub i32 %op112, %op118
  %op120 = add i32 %op101, 1
  br label %label_condition34
label_true41:                                                ; preds = %label_false33
  br label %label_condition43
label_false42:                                                ; preds = %label_false33
  %op121 = icmp slt i32 %op78, zeroinitializer
  %op122 = zext i1 %op121 to i32
  %op123 = add i32 %op122, zeroinitializer
  %op124 = icmp ne i32 %op123, zeroinitializer
  br i1 %op124, label %label_a3_ltz57, label %label_a3_gtz58
label_condition43:                                                ; preds = %label_true41, %label_ret56
  %op125 = phi i32 [ 5000, %label_true41 ], [ %op166, %label_ret56 ]
  %op126 = phi i32 [ %op77, %label_true41 ], [ %op167, %label_ret56 ]
  %op127 = icmp slt i32 %op125, 10000
  %op128 = zext i1 %op127 to i32
  %op129 = icmp sgt i32 %op128, zeroinitializer
  br i1 %op129, label %label_loop44, label %label_ret45
label_loop44:                                                ; preds = %label_condition43
  %op130 = icmp sgt i32 %op125, 2233
  %op131 = zext i1 %op130 to i32
  %op132 = icmp sgt i32 %op131, zeroinitializer
  br i1 %op132, label %label_true46, label %label_false47
label_ret45:                                                ; preds = %label_condition43
  call void @putint(i32 %op126)
  br label %label_ret59
label_true46:                                                ; preds = %label_loop44
  %op133 = icmp slt i32 %op78, zeroinitializer
  %op134 = zext i1 %op133 to i32
  %op135 = add i32 %op134, zeroinitializer
  %op136 = icmp ne i32 %op135, zeroinitializer
  br i1 %op136, label %label_a2_ltz48, label %label_a2_gtz49
label_false47:                                                ; preds = %label_loop44
  %op137 = icmp slt i32 %op78, zeroinitializer
  %op138 = zext i1 %op137 to i32
  %op139 = add i32 %op138, zeroinitializer
  %op140 = icmp ne i32 %op139, zeroinitializer
  br i1 %op140, label %label_a1_ltz52, label %label_a1_gtz53
label_a2_ltz48:                                                ; preds = %label_true46
  call void @neg_idx_except()
  br label %label_a2_gtz49
label_a2_gtz49:                                                ; preds = %label_true46, %label_a2_ltz48
  %op141 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op78
  %op142 = load i32, i32* %op141
  %op143 = add i32 %op126, %op142
  %op144 = icmp slt i32 %op125, zeroinitializer
  %op145 = zext i1 %op144 to i32
  %op146 = add i32 %op145, zeroinitializer
  %op147 = icmp ne i32 %op146, zeroinitializer
  br i1 %op147, label %label_a1_ltz50, label %label_a1_gtz51
label_a1_ltz50:                                                ; preds = %label_a2_gtz49
  call void @neg_idx_except()
  br label %label_a1_gtz51
label_a1_gtz51:                                                ; preds = %label_a2_gtz49, %label_a1_ltz50
  %op148 = getelementptr [10000 x i32], [10000 x i32]* %op1, i32 0, i32 %op125
  %op149 = load i32, i32* %op148
  %op150 = sub i32 %op143, %op149
  %op151 = add i32 %op125, 1
  br label %label_ret56
label_a1_ltz52:                                                ; preds = %label_false47
  call void @neg_idx_except()
  br label %label_a1_gtz53
label_a1_gtz53:                                                ; preds = %label_false47, %label_a1_ltz52
  %op152 = getelementptr [10000 x i32], [10000 x i32]* %op1, i32 0, i32 %op78
  %op153 = load i32, i32* %op152
  %op154 = add i32 %op126, %op153
  %op155 = icmp slt i32 %op125, zeroinitializer
  %op156 = zext i1 %op155 to i32
  %op157 = add i32 %op156, zeroinitializer
  %op158 = icmp ne i32 %op157, zeroinitializer
  br i1 %op158, label %label_a3_ltz54, label %label_a3_gtz55
label_a3_ltz54:                                                ; preds = %label_a1_gtz53
  call void @neg_idx_except()
  br label %label_a3_gtz55
label_a3_gtz55:                                                ; preds = %label_a1_gtz53, %label_a3_ltz54
  %op159 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op125
  %op160 = load i32, i32* %op159
  %op161 = add i32 %op154, %op160
  %op162 = sdiv i32 %op161, 13333
  %op163 = mul i32 %op162, 13333
  %op164 = sub i32 %op161, %op163
  %op165 = add i32 %op125, 2
  br label %label_ret56
label_ret56:                                                ; preds = %label_a1_gtz51, %label_a3_gtz55
  %op166 = phi i32 [ %op151, %label_a1_gtz51 ], [ %op165, %label_a3_gtz55 ]
  %op167 = phi i32 [ %op150, %label_a1_gtz51 ], [ %op164, %label_a3_gtz55 ]
  br label %label_condition43
label_a3_ltz57:                                                ; preds = %label_false42
  call void @neg_idx_except()
  br label %label_a3_gtz58
label_a3_gtz58:                                                ; preds = %label_false42, %label_a3_ltz57
  %op168 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op78
  %op169 = load i32, i32* %op168
  %op170 = mul i32 %op169, %arg0
  %op171 = add i32 %op77, %op170
  %op172 = sdiv i32 %op171, 99988
  %op173 = mul i32 %op172, 99988
  %op174 = sub i32 %op171, %op173
  br label %label_ret59
label_ret59:                                                ; preds = %label_ret45, %label_a3_gtz58
  %op175 = phi i32 [ %op126, %label_ret45 ], [ %op174, %label_a3_gtz58 ]
  br label %label_ret60
label_ret60:                                                ; preds = %label_ret36, %label_ret59
  %op176 = phi i32 [ %op102, %label_ret36 ], [ %op175, %label_ret59 ]
  br label %label_ret61
label_ret61:                                                ; preds = %label_a3_gtz31, %label_ret60
  %op177 = phi i32 [ %op97, %label_a3_gtz31 ], [ %op176, %label_ret60 ]
  %op178 = add i32 %op78, 1
  br label %label_condition25
}
define i32 @main() {
label_entry:
  %op0 = call i32 @long_array(i32 9)
  ret i32 %op0
}
