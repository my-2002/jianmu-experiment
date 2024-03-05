	.text
	.globl sort
	.type sort, @function
sort:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -256
	st.d $a0, $fp, -24
	st.w $a1, $fp, -28
.sort_label_entry:
# br label %label_condition0
# gen_phi
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -32
	b .sort_label_condition0
.sort_label_condition0:
# %op2 = phi i32 [ 0, %label_entry ], [ %op16, %label_ret5 ]
# %op3 = sub i32 %arg1, 1
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -36
# %op4 = icmp slt i32 %op2, %op3
	ld.w $t0, $fp, -32
	ld.w $t1, $fp, -36
	slt $t2, $t0, $t1
	st.b $t2, $fp, -37
# %op5 = zext i1 %op4 to i32
	ld.b $t0, $fp, -37
	andi $t1, $t0, 1
	st.w $t1, $fp, -44
# %op6 = icmp sgt i32 %op5, zeroinitializer
	ld.w $t0, $fp, -44
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -45
# br i1 %op6, label %label_loop1, label %label_ret2
# gen_phi
	ld.b $t0, $fp, -45
	bnez $t0, .sort_label_loop1
	b .sort_label_ret2
.sort_label_loop1:
# %op7 = add i32 %op2, 1
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# br label %label_condition3
# gen_phi
	ld.w $t0, $fp, -52
	st.w $t0, $fp, -56
	b .sort_label_condition3
.sort_label_ret2:
# ret void
# gen_phi
	addi.w $a0, $zero, 0
	b .sort_exit
.sort_label_condition3:
# %op8 = phi i32 [ %op7, %label_loop1 ], [ %op32, %label_ret11 ]
# %op9 = icmp slt i32 %op8, %arg1
	ld.w $t0, $fp, -56
	ld.w $t1, $fp, -28
	slt $t2, $t0, $t1
	st.b $t2, $fp, -57
# %op10 = zext i1 %op9 to i32
	ld.b $t0, $fp, -57
	andi $t1, $t0, 1
	st.w $t1, $fp, -64
# %op11 = icmp sgt i32 %op10, zeroinitializer
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -65
# br i1 %op11, label %label_loop4, label %label_ret5
# gen_phi
	ld.b $t0, $fp, -65
	bnez $t0, .sort_label_loop4
	b .sort_label_ret5
.sort_label_loop4:
# %op12 = icmp slt i32 %op2, zeroinitializer
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -66
# %op13 = zext i1 %op12 to i32
	ld.b $t0, $fp, -66
	andi $t1, $t0, 1
	st.w $t1, $fp, -72
# %op14 = add i32 %op13, zeroinitializer
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# %op15 = icmp ne i32 %op14, zeroinitializer
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -77
# br i1 %op15, label %label_arr_ltz6, label %label_arr_gtz7
# gen_phi
	ld.b $t0, $fp, -77
	bnez $t0, .sort_label_arr_ltz6
	b .sort_label_arr_gtz7
.sort_label_ret5:
# %op16 = add i32 %op2, 1
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -84
# br label %label_condition0
# gen_phi
	ld.w $t0, $fp, -84
	st.w $t0, $fp, -32
	b .sort_label_condition0
.sort_label_arr_ltz6:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz7
# gen_phi
	b .sort_label_arr_gtz7
.sort_label_arr_gtz7:
# %op17 = getelementptr i32, i32* %arg0, i32 %op2
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -32
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -96
# %op18 = load i32, i32* %op17
	ld.d $t0, $fp, -96
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -100
# %op19 = icmp slt i32 %op8, zeroinitializer
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -101
# %op20 = zext i1 %op19 to i32
	ld.b $t0, $fp, -101
	andi $t1, $t0, 1
	st.w $t1, $fp, -108
# %op21 = add i32 %op20, zeroinitializer
	ld.w $t0, $fp, -108
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -112
# %op22 = icmp ne i32 %op21, zeroinitializer
	ld.w $t0, $fp, -112
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -113
# br i1 %op22, label %label_arr_ltz8, label %label_arr_gtz9
# gen_phi
	ld.b $t0, $fp, -113
	bnez $t0, .sort_label_arr_ltz8
	b .sort_label_arr_gtz9
.sort_label_arr_ltz8:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz9
# gen_phi
	b .sort_label_arr_gtz9
.sort_label_arr_gtz9:
# %op23 = getelementptr i32, i32* %arg0, i32 %op8
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -56
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -128
# %op24 = load i32, i32* %op23
	ld.d $t0, $fp, -128
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -132
# %op25 = icmp slt i32 %op18, %op24
	ld.w $t0, $fp, -100
	ld.w $t1, $fp, -132
	slt $t2, $t0, $t1
	st.b $t2, $fp, -133
# %op26 = zext i1 %op25 to i32
	ld.b $t0, $fp, -133
	andi $t1, $t0, 1
	st.w $t1, $fp, -140
# %op27 = icmp sgt i32 %op26, zeroinitializer
	ld.w $t0, $fp, -140
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -141
# br i1 %op27, label %label_true10, label %label_ret11
# gen_phi
	ld.b $t0, $fp, -141
	bnez $t0, .sort_label_true10
	b .sort_label_ret11
.sort_label_true10:
# %op28 = icmp slt i32 %op2, zeroinitializer
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -142
# %op29 = zext i1 %op28 to i32
	ld.b $t0, $fp, -142
	andi $t1, $t0, 1
	st.w $t1, $fp, -148
# %op30 = add i32 %op29, zeroinitializer
	ld.w $t0, $fp, -148
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -152
# %op31 = icmp ne i32 %op30, zeroinitializer
	ld.w $t0, $fp, -152
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -153
# br i1 %op31, label %label_arr_ltz12, label %label_arr_gtz13
# gen_phi
	ld.b $t0, $fp, -153
	bnez $t0, .sort_label_arr_ltz12
	b .sort_label_arr_gtz13
.sort_label_ret11:
# %op32 = add i32 %op8, 1
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -160
# br label %label_condition3
# gen_phi
	ld.w $t0, $fp, -160
	st.w $t0, $fp, -56
	b .sort_label_condition3
.sort_label_arr_ltz12:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz13
# gen_phi
	b .sort_label_arr_gtz13
.sort_label_arr_gtz13:
# %op33 = getelementptr i32, i32* %arg0, i32 %op2
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -32
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -168
# %op34 = load i32, i32* %op33
	ld.d $t0, $fp, -168
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -172
# %op35 = icmp slt i32 %op2, zeroinitializer
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -173
# %op36 = zext i1 %op35 to i32
	ld.b $t0, $fp, -173
	andi $t1, $t0, 1
	st.w $t1, $fp, -180
# %op37 = add i32 %op36, zeroinitializer
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -184
# %op38 = icmp ne i32 %op37, zeroinitializer
	ld.w $t0, $fp, -184
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -185
# br i1 %op38, label %label_arr_ltz14, label %label_arr_gtz15
# gen_phi
	ld.b $t0, $fp, -185
	bnez $t0, .sort_label_arr_ltz14
	b .sort_label_arr_gtz15
.sort_label_arr_ltz14:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz15
# gen_phi
	b .sort_label_arr_gtz15
.sort_label_arr_gtz15:
# %op39 = getelementptr i32, i32* %arg0, i32 %op2
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -32
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -200
# %op40 = icmp slt i32 %op8, zeroinitializer
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -201
# %op41 = zext i1 %op40 to i32
	ld.b $t0, $fp, -201
	andi $t1, $t0, 1
	st.w $t1, $fp, -208
# %op42 = add i32 %op41, zeroinitializer
	ld.w $t0, $fp, -208
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -212
# %op43 = icmp ne i32 %op42, zeroinitializer
	ld.w $t0, $fp, -212
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -213
# br i1 %op43, label %label_arr_ltz16, label %label_arr_gtz17
# gen_phi
	ld.b $t0, $fp, -213
	bnez $t0, .sort_label_arr_ltz16
	b .sort_label_arr_gtz17
.sort_label_arr_ltz16:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz17
# gen_phi
	b .sort_label_arr_gtz17
.sort_label_arr_gtz17:
# %op44 = getelementptr i32, i32* %arg0, i32 %op8
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -56
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -224
# %op45 = load i32, i32* %op44
	ld.d $t0, $fp, -224
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -228
# store i32 %op45, i32* %op39
	ld.d $t0, $fp, -200
	ld.w $t1, $fp, -228
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op46 = icmp slt i32 %op8, zeroinitializer
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -229
# %op47 = zext i1 %op46 to i32
	ld.b $t0, $fp, -229
	andi $t1, $t0, 1
	st.w $t1, $fp, -236
# %op48 = add i32 %op47, zeroinitializer
	ld.w $t0, $fp, -236
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -240
# %op49 = icmp ne i32 %op48, zeroinitializer
	ld.w $t0, $fp, -240
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -241
# br i1 %op49, label %label_arr_ltz18, label %label_arr_gtz19
# gen_phi
	ld.b $t0, $fp, -241
	bnez $t0, .sort_label_arr_ltz18
	b .sort_label_arr_gtz19
.sort_label_arr_ltz18:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz19
# gen_phi
	b .sort_label_arr_gtz19
.sort_label_arr_gtz19:
# %op50 = getelementptr i32, i32* %arg0, i32 %op8
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -56
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -256
# store i32 %op34, i32* %op50
	ld.d $t0, $fp, -256
	ld.w $t1, $fp, -172
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_ret11
# gen_phi
	b .sort_label_ret11
.sort_exit:
	addi.d $sp, $sp, 256
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl param32_rec
	.type param32_rec, @function
param32_rec:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -192
.param32_rec_label_entry:
# %op32 = icmp eq i32 %arg0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -145
# %op33 = zext i1 %op32 to i32
	ld.b $t0, $fp, -145
	andi $t1, $t0, 1
	st.w $t1, $fp, -152
# %op34 = icmp sgt i32 %op33, zeroinitializer
	ld.w $t0, $fp, -152
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -153
# br i1 %op34, label %label_true20, label %label_false21
# gen_phi
	ld.b $t0, $fp, -153
	bnez $t0, .param32_rec_label_true20
	b .param32_rec_label_false21
.param32_rec_label_true20:
# ret i32 %arg1
# gen_phi
	ld.w $a0, $fp, -24
	b .param32_rec_exit
.param32_rec_label_false21:
# %op35 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -160
# %op36 = add i32 %arg1, %arg2
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -28
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -164
# %op37 = sdiv i32 %op36, 998244353
	ld.w $t0, $fp, -164
	lu12i.w $t1, 243712
	ori $t1, $t1, 1
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -168
# %op38 = mul i32 %op37, 998244353
	ld.w $t0, $fp, -168
	lu12i.w $t1, 243712
	ori $t1, $t1, 1
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -172
# %op39 = sub i32 %op36, %op38
	ld.w $t0, $fp, -164
	ld.w $t1, $fp, -172
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -176
# %op40 = call i32 @param32_rec(i32 %op35, i32 %op39, i32 %arg3, i32 %arg4, i32 %arg5, i32 %arg6, i32 %arg7, i32 %arg8, i32 %arg9, i32 %arg10, i32 %arg11, i32 %arg12, i32 %arg13, i32 %arg14, i32 %arg15, i32 %arg16, i32 %arg17, i32 %arg18, i32 %arg19, i32 %arg20, i32 %arg21, i32 %arg22, i32 %arg23, i32 %arg24, i32 %arg25, i32 %arg26, i32 %arg27, i32 %arg28, i32 %arg29, i32 %arg30, i32 %arg31, i32 0)
	ld.w $t0, $fp, -160
	addi.d $t1, $sp, -20
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -176
	addi.d $t1, $sp, -24
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -32
	addi.d $t1, $sp, -28
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -36
	addi.d $t1, $sp, -32
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -40
	addi.d $t1, $sp, -36
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -44
	addi.d $t1, $sp, -40
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -48
	addi.d $t1, $sp, -44
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -52
	addi.d $t1, $sp, -48
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -56
	addi.d $t1, $sp, -52
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -60
	addi.d $t1, $sp, -56
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -64
	addi.d $t1, $sp, -60
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -68
	addi.d $t1, $sp, -64
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -72
	addi.d $t1, $sp, -68
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -76
	addi.d $t1, $sp, -72
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -80
	addi.d $t1, $sp, -76
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -84
	addi.d $t1, $sp, -80
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -88
	addi.d $t1, $sp, -84
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -92
	addi.d $t1, $sp, -88
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -96
	addi.d $t1, $sp, -92
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -100
	addi.d $t1, $sp, -96
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -104
	addi.d $t1, $sp, -100
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -108
	addi.d $t1, $sp, -104
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -112
	addi.d $t1, $sp, -108
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -116
	addi.d $t1, $sp, -112
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -120
	addi.d $t1, $sp, -116
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -124
	addi.d $t1, $sp, -120
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -128
	addi.d $t1, $sp, -124
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -132
	addi.d $t1, $sp, -128
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -136
	addi.d $t1, $sp, -132
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -140
	addi.d $t1, $sp, -136
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -144
	addi.d $t1, $sp, -140
	st.w $t0, $t1, 0
	addi.w $t0, $zero, 0
	addi.d $t1, $sp, -144
	st.w $t0, $t1, 0
	bl param32_rec
	st.w $a0, $fp, -180
# ret i32 %op40
# gen_phi
	ld.w $a0, $fp, -180
	b .param32_rec_exit
.param32_rec_exit:
	addi.d $sp, $sp, 192
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl param32_arr
	.type param32_arr, @function
param32_arr:
	lu12i.w $t0, 0
	ori $t0, $t0, 2320
	lu32i.d $t0, 0
	lu52i.d $t0, $t0, 0
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	sub.d $sp, $sp, $t0
	add.d $fp, $sp, $t0
.param32_arr_label_entry:
# %op32 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -273
# %op33 = zext i1 %op32 to i32
	ld.b $t0, $fp, -273
	andi $t1, $t0, 1
	st.w $t1, $fp, -280
# %op34 = add i32 %op33, zeroinitializer
	ld.w $t0, $fp, -280
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -284
# %op35 = icmp ne i32 %op34, zeroinitializer
	ld.w $t0, $fp, -284
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -285
# br i1 %op35, label %label_a1_ltz22, label %label_a1_gtz23
# gen_phi
	ld.b $t0, $fp, -285
	bnez $t0, .param32_arr_label_a1_ltz22
	b .param32_arr_label_a1_gtz23
.param32_arr_label_a1_ltz22:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a1_gtz23
# gen_phi
	b .param32_arr_label_a1_gtz23
.param32_arr_label_a1_gtz23:
# %op36 = getelementptr i32, i32* %arg0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -296
# %op37 = load i32, i32* %op36
	ld.d $t0, $fp, -296
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -300
# %op38 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -301
# %op39 = zext i1 %op38 to i32
	ld.b $t0, $fp, -301
	andi $t1, $t0, 1
	st.w $t1, $fp, -308
# %op40 = add i32 %op39, zeroinitializer
	ld.w $t0, $fp, -308
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -312
# %op41 = icmp ne i32 %op40, zeroinitializer
	ld.w $t0, $fp, -312
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -313
# br i1 %op41, label %label_a1_ltz24, label %label_a1_gtz25
# gen_phi
	ld.b $t0, $fp, -313
	bnez $t0, .param32_arr_label_a1_ltz24
	b .param32_arr_label_a1_gtz25
.param32_arr_label_a1_ltz24:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a1_gtz25
# gen_phi
	b .param32_arr_label_a1_gtz25
.param32_arr_label_a1_gtz25:
# %op42 = getelementptr i32, i32* %arg0, i32 1
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -328
# %op43 = load i32, i32* %op42
	ld.d $t0, $fp, -328
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -332
# %op44 = add i32 %op37, %op43
	ld.w $t0, $fp, -300
	ld.w $t1, $fp, -332
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -336
# %op45 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -337
# %op46 = zext i1 %op45 to i32
	ld.b $t0, $fp, -337
	andi $t1, $t0, 1
	st.w $t1, $fp, -344
# %op47 = add i32 %op46, zeroinitializer
	ld.w $t0, $fp, -344
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -348
# %op48 = icmp ne i32 %op47, zeroinitializer
	ld.w $t0, $fp, -348
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -349
# br i1 %op48, label %label_a2_ltz26, label %label_a2_gtz27
# gen_phi
	ld.b $t0, $fp, -349
	bnez $t0, .param32_arr_label_a2_ltz26
	b .param32_arr_label_a2_gtz27
.param32_arr_label_a2_ltz26:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a2_gtz27
# gen_phi
	b .param32_arr_label_a2_gtz27
.param32_arr_label_a2_gtz27:
# %op49 = getelementptr i32, i32* %arg1, i32 0
	ld.d $t0, $fp, -32
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -360
# %op50 = load i32, i32* %op49
	ld.d $t0, $fp, -360
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -364
# %op51 = add i32 %op44, %op50
	ld.w $t0, $fp, -336
	ld.w $t1, $fp, -364
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -368
# %op52 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -369
# %op53 = zext i1 %op52 to i32
	ld.b $t0, $fp, -369
	andi $t1, $t0, 1
	st.w $t1, $fp, -376
# %op54 = add i32 %op53, zeroinitializer
	ld.w $t0, $fp, -376
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -380
# %op55 = icmp ne i32 %op54, zeroinitializer
	ld.w $t0, $fp, -380
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -381
# br i1 %op55, label %label_a2_ltz28, label %label_a2_gtz29
# gen_phi
	ld.b $t0, $fp, -381
	bnez $t0, .param32_arr_label_a2_ltz28
	b .param32_arr_label_a2_gtz29
.param32_arr_label_a2_ltz28:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a2_gtz29
# gen_phi
	b .param32_arr_label_a2_gtz29
.param32_arr_label_a2_gtz29:
# %op56 = getelementptr i32, i32* %arg1, i32 1
	ld.d $t0, $fp, -32
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -392
# %op57 = load i32, i32* %op56
	ld.d $t0, $fp, -392
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -396
# %op58 = add i32 %op51, %op57
	ld.w $t0, $fp, -368
	ld.w $t1, $fp, -396
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -400
# %op59 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -401
# %op60 = zext i1 %op59 to i32
	ld.b $t0, $fp, -401
	andi $t1, $t0, 1
	st.w $t1, $fp, -408
# %op61 = add i32 %op60, zeroinitializer
	ld.w $t0, $fp, -408
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -412
# %op62 = icmp ne i32 %op61, zeroinitializer
	ld.w $t0, $fp, -412
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -413
# br i1 %op62, label %label_a3_ltz30, label %label_a3_gtz31
# gen_phi
	ld.b $t0, $fp, -413
	bnez $t0, .param32_arr_label_a3_ltz30
	b .param32_arr_label_a3_gtz31
.param32_arr_label_a3_ltz30:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a3_gtz31
# gen_phi
	b .param32_arr_label_a3_gtz31
.param32_arr_label_a3_gtz31:
# %op63 = getelementptr i32, i32* %arg2, i32 0
	ld.d $t0, $fp, -40
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -424
# %op64 = load i32, i32* %op63
	ld.d $t0, $fp, -424
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -428
# %op65 = add i32 %op58, %op64
	ld.w $t0, $fp, -400
	ld.w $t1, $fp, -428
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -432
# %op66 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -433
# %op67 = zext i1 %op66 to i32
	ld.b $t0, $fp, -433
	andi $t1, $t0, 1
	st.w $t1, $fp, -440
# %op68 = add i32 %op67, zeroinitializer
	ld.w $t0, $fp, -440
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -444
# %op69 = icmp ne i32 %op68, zeroinitializer
	ld.w $t0, $fp, -444
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -445
# br i1 %op69, label %label_a3_ltz32, label %label_a3_gtz33
# gen_phi
	ld.b $t0, $fp, -445
	bnez $t0, .param32_arr_label_a3_ltz32
	b .param32_arr_label_a3_gtz33
.param32_arr_label_a3_ltz32:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a3_gtz33
# gen_phi
	b .param32_arr_label_a3_gtz33
.param32_arr_label_a3_gtz33:
# %op70 = getelementptr i32, i32* %arg2, i32 1
	ld.d $t0, $fp, -40
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -456
# %op71 = load i32, i32* %op70
	ld.d $t0, $fp, -456
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -460
# %op72 = add i32 %op65, %op71
	ld.w $t0, $fp, -432
	ld.w $t1, $fp, -460
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -464
# %op73 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -465
# %op74 = zext i1 %op73 to i32
	ld.b $t0, $fp, -465
	andi $t1, $t0, 1
	st.w $t1, $fp, -472
# %op75 = add i32 %op74, zeroinitializer
	ld.w $t0, $fp, -472
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -476
# %op76 = icmp ne i32 %op75, zeroinitializer
	ld.w $t0, $fp, -476
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -477
# br i1 %op76, label %label_a4_ltz34, label %label_a4_gtz35
# gen_phi
	ld.b $t0, $fp, -477
	bnez $t0, .param32_arr_label_a4_ltz34
	b .param32_arr_label_a4_gtz35
.param32_arr_label_a4_ltz34:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a4_gtz35
# gen_phi
	b .param32_arr_label_a4_gtz35
.param32_arr_label_a4_gtz35:
# %op77 = getelementptr i32, i32* %arg3, i32 0
	ld.d $t0, $fp, -48
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -488
# %op78 = load i32, i32* %op77
	ld.d $t0, $fp, -488
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -492
# %op79 = add i32 %op72, %op78
	ld.w $t0, $fp, -464
	ld.w $t1, $fp, -492
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -496
# %op80 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -497
# %op81 = zext i1 %op80 to i32
	ld.b $t0, $fp, -497
	andi $t1, $t0, 1
	st.w $t1, $fp, -504
# %op82 = add i32 %op81, zeroinitializer
	ld.w $t0, $fp, -504
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -508
# %op83 = icmp ne i32 %op82, zeroinitializer
	ld.w $t0, $fp, -508
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -509
# br i1 %op83, label %label_a4_ltz36, label %label_a4_gtz37
# gen_phi
	ld.b $t0, $fp, -509
	bnez $t0, .param32_arr_label_a4_ltz36
	b .param32_arr_label_a4_gtz37
.param32_arr_label_a4_ltz36:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a4_gtz37
# gen_phi
	b .param32_arr_label_a4_gtz37
.param32_arr_label_a4_gtz37:
# %op84 = getelementptr i32, i32* %arg3, i32 1
	ld.d $t0, $fp, -48
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -520
# %op85 = load i32, i32* %op84
	ld.d $t0, $fp, -520
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -524
# %op86 = add i32 %op79, %op85
	ld.w $t0, $fp, -496
	ld.w $t1, $fp, -524
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -528
# %op87 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -529
# %op88 = zext i1 %op87 to i32
	ld.b $t0, $fp, -529
	andi $t1, $t0, 1
	st.w $t1, $fp, -536
# %op89 = add i32 %op88, zeroinitializer
	ld.w $t0, $fp, -536
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -540
# %op90 = icmp ne i32 %op89, zeroinitializer
	ld.w $t0, $fp, -540
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -541
# br i1 %op90, label %label_a5_ltz38, label %label_a5_gtz39
# gen_phi
	ld.b $t0, $fp, -541
	bnez $t0, .param32_arr_label_a5_ltz38
	b .param32_arr_label_a5_gtz39
.param32_arr_label_a5_ltz38:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a5_gtz39
# gen_phi
	b .param32_arr_label_a5_gtz39
.param32_arr_label_a5_gtz39:
# %op91 = getelementptr i32, i32* %arg4, i32 0
	ld.d $t0, $fp, -56
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -552
# %op92 = load i32, i32* %op91
	ld.d $t0, $fp, -552
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -556
# %op93 = add i32 %op86, %op92
	ld.w $t0, $fp, -528
	ld.w $t1, $fp, -556
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -560
# %op94 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -561
# %op95 = zext i1 %op94 to i32
	ld.b $t0, $fp, -561
	andi $t1, $t0, 1
	st.w $t1, $fp, -568
# %op96 = add i32 %op95, zeroinitializer
	ld.w $t0, $fp, -568
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -572
# %op97 = icmp ne i32 %op96, zeroinitializer
	ld.w $t0, $fp, -572
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -573
# br i1 %op97, label %label_a5_ltz40, label %label_a5_gtz41
# gen_phi
	ld.b $t0, $fp, -573
	bnez $t0, .param32_arr_label_a5_ltz40
	b .param32_arr_label_a5_gtz41
.param32_arr_label_a5_ltz40:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a5_gtz41
# gen_phi
	b .param32_arr_label_a5_gtz41
.param32_arr_label_a5_gtz41:
# %op98 = getelementptr i32, i32* %arg4, i32 1
	ld.d $t0, $fp, -56
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -584
# %op99 = load i32, i32* %op98
	ld.d $t0, $fp, -584
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -588
# %op100 = add i32 %op93, %op99
	ld.w $t0, $fp, -560
	ld.w $t1, $fp, -588
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -592
# %op101 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -593
# %op102 = zext i1 %op101 to i32
	ld.b $t0, $fp, -593
	andi $t1, $t0, 1
	st.w $t1, $fp, -600
# %op103 = add i32 %op102, zeroinitializer
	ld.w $t0, $fp, -600
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -604
# %op104 = icmp ne i32 %op103, zeroinitializer
	ld.w $t0, $fp, -604
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -605
# br i1 %op104, label %label_a6_ltz42, label %label_a6_gtz43
# gen_phi
	ld.b $t0, $fp, -605
	bnez $t0, .param32_arr_label_a6_ltz42
	b .param32_arr_label_a6_gtz43
.param32_arr_label_a6_ltz42:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a6_gtz43
# gen_phi
	b .param32_arr_label_a6_gtz43
.param32_arr_label_a6_gtz43:
# %op105 = getelementptr i32, i32* %arg5, i32 0
	ld.d $t0, $fp, -64
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -616
# %op106 = load i32, i32* %op105
	ld.d $t0, $fp, -616
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -620
# %op107 = add i32 %op100, %op106
	ld.w $t0, $fp, -592
	ld.w $t1, $fp, -620
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -624
# %op108 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -625
# %op109 = zext i1 %op108 to i32
	ld.b $t0, $fp, -625
	andi $t1, $t0, 1
	st.w $t1, $fp, -632
# %op110 = add i32 %op109, zeroinitializer
	ld.w $t0, $fp, -632
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -636
# %op111 = icmp ne i32 %op110, zeroinitializer
	ld.w $t0, $fp, -636
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -637
# br i1 %op111, label %label_a6_ltz44, label %label_a6_gtz45
# gen_phi
	ld.b $t0, $fp, -637
	bnez $t0, .param32_arr_label_a6_ltz44
	b .param32_arr_label_a6_gtz45
.param32_arr_label_a6_ltz44:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a6_gtz45
# gen_phi
	b .param32_arr_label_a6_gtz45
.param32_arr_label_a6_gtz45:
# %op112 = getelementptr i32, i32* %arg5, i32 1
	ld.d $t0, $fp, -64
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -648
# %op113 = load i32, i32* %op112
	ld.d $t0, $fp, -648
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -652
# %op114 = add i32 %op107, %op113
	ld.w $t0, $fp, -624
	ld.w $t1, $fp, -652
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -656
# %op115 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -657
# %op116 = zext i1 %op115 to i32
	ld.b $t0, $fp, -657
	andi $t1, $t0, 1
	st.w $t1, $fp, -664
# %op117 = add i32 %op116, zeroinitializer
	ld.w $t0, $fp, -664
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -668
# %op118 = icmp ne i32 %op117, zeroinitializer
	ld.w $t0, $fp, -668
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -669
# br i1 %op118, label %label_a7_ltz46, label %label_a7_gtz47
# gen_phi
	ld.b $t0, $fp, -669
	bnez $t0, .param32_arr_label_a7_ltz46
	b .param32_arr_label_a7_gtz47
.param32_arr_label_a7_ltz46:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a7_gtz47
# gen_phi
	b .param32_arr_label_a7_gtz47
.param32_arr_label_a7_gtz47:
# %op119 = getelementptr i32, i32* %arg6, i32 0
	ld.d $t0, $fp, -72
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -680
# %op120 = load i32, i32* %op119
	ld.d $t0, $fp, -680
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -684
# %op121 = add i32 %op114, %op120
	ld.w $t0, $fp, -656
	ld.w $t1, $fp, -684
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -688
# %op122 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -689
# %op123 = zext i1 %op122 to i32
	ld.b $t0, $fp, -689
	andi $t1, $t0, 1
	st.w $t1, $fp, -696
# %op124 = add i32 %op123, zeroinitializer
	ld.w $t0, $fp, -696
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -700
# %op125 = icmp ne i32 %op124, zeroinitializer
	ld.w $t0, $fp, -700
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -701
# br i1 %op125, label %label_a7_ltz48, label %label_a7_gtz49
# gen_phi
	ld.b $t0, $fp, -701
	bnez $t0, .param32_arr_label_a7_ltz48
	b .param32_arr_label_a7_gtz49
.param32_arr_label_a7_ltz48:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a7_gtz49
# gen_phi
	b .param32_arr_label_a7_gtz49
.param32_arr_label_a7_gtz49:
# %op126 = getelementptr i32, i32* %arg6, i32 1
	ld.d $t0, $fp, -72
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -712
# %op127 = load i32, i32* %op126
	ld.d $t0, $fp, -712
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -716
# %op128 = add i32 %op121, %op127
	ld.w $t0, $fp, -688
	ld.w $t1, $fp, -716
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -720
# %op129 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -721
# %op130 = zext i1 %op129 to i32
	ld.b $t0, $fp, -721
	andi $t1, $t0, 1
	st.w $t1, $fp, -728
# %op131 = add i32 %op130, zeroinitializer
	ld.w $t0, $fp, -728
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -732
# %op132 = icmp ne i32 %op131, zeroinitializer
	ld.w $t0, $fp, -732
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -733
# br i1 %op132, label %label_a8_ltz50, label %label_a8_gtz51
# gen_phi
	ld.b $t0, $fp, -733
	bnez $t0, .param32_arr_label_a8_ltz50
	b .param32_arr_label_a8_gtz51
.param32_arr_label_a8_ltz50:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a8_gtz51
# gen_phi
	b .param32_arr_label_a8_gtz51
.param32_arr_label_a8_gtz51:
# %op133 = getelementptr i32, i32* %arg7, i32 0
	ld.d $t0, $fp, -80
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -744
# %op134 = load i32, i32* %op133
	ld.d $t0, $fp, -744
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -748
# %op135 = add i32 %op128, %op134
	ld.w $t0, $fp, -720
	ld.w $t1, $fp, -748
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -752
# %op136 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -753
# %op137 = zext i1 %op136 to i32
	ld.b $t0, $fp, -753
	andi $t1, $t0, 1
	st.w $t1, $fp, -760
# %op138 = add i32 %op137, zeroinitializer
	ld.w $t0, $fp, -760
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -764
# %op139 = icmp ne i32 %op138, zeroinitializer
	ld.w $t0, $fp, -764
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -765
# br i1 %op139, label %label_a8_ltz52, label %label_a8_gtz53
# gen_phi
	ld.b $t0, $fp, -765
	bnez $t0, .param32_arr_label_a8_ltz52
	b .param32_arr_label_a8_gtz53
.param32_arr_label_a8_ltz52:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a8_gtz53
# gen_phi
	b .param32_arr_label_a8_gtz53
.param32_arr_label_a8_gtz53:
# %op140 = getelementptr i32, i32* %arg7, i32 1
	ld.d $t0, $fp, -80
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -776
# %op141 = load i32, i32* %op140
	ld.d $t0, $fp, -776
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -780
# %op142 = add i32 %op135, %op141
	ld.w $t0, $fp, -752
	ld.w $t1, $fp, -780
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -784
# %op143 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -785
# %op144 = zext i1 %op143 to i32
	ld.b $t0, $fp, -785
	andi $t1, $t0, 1
	st.w $t1, $fp, -792
# %op145 = add i32 %op144, zeroinitializer
	ld.w $t0, $fp, -792
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -796
# %op146 = icmp ne i32 %op145, zeroinitializer
	ld.w $t0, $fp, -796
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -797
# br i1 %op146, label %label_a9_ltz54, label %label_a9_gtz55
# gen_phi
	ld.b $t0, $fp, -797
	bnez $t0, .param32_arr_label_a9_ltz54
	b .param32_arr_label_a9_gtz55
.param32_arr_label_a9_ltz54:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a9_gtz55
# gen_phi
	b .param32_arr_label_a9_gtz55
.param32_arr_label_a9_gtz55:
# %op147 = getelementptr i32, i32* %arg8, i32 0
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -808
# %op148 = load i32, i32* %op147
	ld.d $t0, $fp, -808
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -812
# %op149 = add i32 %op142, %op148
	ld.w $t0, $fp, -784
	ld.w $t1, $fp, -812
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -816
# %op150 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -817
# %op151 = zext i1 %op150 to i32
	ld.b $t0, $fp, -817
	andi $t1, $t0, 1
	st.w $t1, $fp, -824
# %op152 = add i32 %op151, zeroinitializer
	ld.w $t0, $fp, -824
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -828
# %op153 = icmp ne i32 %op152, zeroinitializer
	ld.w $t0, $fp, -828
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -829
# br i1 %op153, label %label_a9_ltz56, label %label_a9_gtz57
# gen_phi
	ld.b $t0, $fp, -829
	bnez $t0, .param32_arr_label_a9_ltz56
	b .param32_arr_label_a9_gtz57
.param32_arr_label_a9_ltz56:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a9_gtz57
# gen_phi
	b .param32_arr_label_a9_gtz57
.param32_arr_label_a9_gtz57:
# %op154 = getelementptr i32, i32* %arg8, i32 1
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -840
# %op155 = load i32, i32* %op154
	ld.d $t0, $fp, -840
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -844
# %op156 = add i32 %op149, %op155
	ld.w $t0, $fp, -816
	ld.w $t1, $fp, -844
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -848
# %op157 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -849
# %op158 = zext i1 %op157 to i32
	ld.b $t0, $fp, -849
	andi $t1, $t0, 1
	st.w $t1, $fp, -856
# %op159 = add i32 %op158, zeroinitializer
	ld.w $t0, $fp, -856
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -860
# %op160 = icmp ne i32 %op159, zeroinitializer
	ld.w $t0, $fp, -860
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -861
# br i1 %op160, label %label_a10_ltz58, label %label_a10_gtz59
# gen_phi
	ld.b $t0, $fp, -861
	bnez $t0, .param32_arr_label_a10_ltz58
	b .param32_arr_label_a10_gtz59
.param32_arr_label_a10_ltz58:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a10_gtz59
# gen_phi
	b .param32_arr_label_a10_gtz59
.param32_arr_label_a10_gtz59:
# %op161 = getelementptr i32, i32* %arg9, i32 0
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -872
# %op162 = load i32, i32* %op161
	ld.d $t0, $fp, -872
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -876
# %op163 = add i32 %op156, %op162
	ld.w $t0, $fp, -848
	ld.w $t1, $fp, -876
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -880
# %op164 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -881
# %op165 = zext i1 %op164 to i32
	ld.b $t0, $fp, -881
	andi $t1, $t0, 1
	st.w $t1, $fp, -888
# %op166 = add i32 %op165, zeroinitializer
	ld.w $t0, $fp, -888
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -892
# %op167 = icmp ne i32 %op166, zeroinitializer
	ld.w $t0, $fp, -892
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -893
# br i1 %op167, label %label_a10_ltz60, label %label_a10_gtz61
# gen_phi
	ld.b $t0, $fp, -893
	bnez $t0, .param32_arr_label_a10_ltz60
	b .param32_arr_label_a10_gtz61
.param32_arr_label_a10_ltz60:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a10_gtz61
# gen_phi
	b .param32_arr_label_a10_gtz61
.param32_arr_label_a10_gtz61:
# %op168 = getelementptr i32, i32* %arg9, i32 1
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -904
# %op169 = load i32, i32* %op168
	ld.d $t0, $fp, -904
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -908
# %op170 = add i32 %op163, %op169
	ld.w $t0, $fp, -880
	ld.w $t1, $fp, -908
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -912
# %op171 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -913
# %op172 = zext i1 %op171 to i32
	ld.b $t0, $fp, -913
	andi $t1, $t0, 1
	st.w $t1, $fp, -920
# %op173 = add i32 %op172, zeroinitializer
	ld.w $t0, $fp, -920
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -924
# %op174 = icmp ne i32 %op173, zeroinitializer
	ld.w $t0, $fp, -924
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -925
# br i1 %op174, label %label_a11_ltz62, label %label_a11_gtz63
# gen_phi
	ld.b $t0, $fp, -925
	bnez $t0, .param32_arr_label_a11_ltz62
	b .param32_arr_label_a11_gtz63
.param32_arr_label_a11_ltz62:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a11_gtz63
# gen_phi
	b .param32_arr_label_a11_gtz63
.param32_arr_label_a11_gtz63:
# %op175 = getelementptr i32, i32* %arg10, i32 0
	ld.d $t0, $fp, -104
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -936
# %op176 = load i32, i32* %op175
	ld.d $t0, $fp, -936
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -940
# %op177 = add i32 %op170, %op176
	ld.w $t0, $fp, -912
	ld.w $t1, $fp, -940
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -944
# %op178 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -945
# %op179 = zext i1 %op178 to i32
	ld.b $t0, $fp, -945
	andi $t1, $t0, 1
	st.w $t1, $fp, -952
# %op180 = add i32 %op179, zeroinitializer
	ld.w $t0, $fp, -952
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -956
# %op181 = icmp ne i32 %op180, zeroinitializer
	ld.w $t0, $fp, -956
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -957
# br i1 %op181, label %label_a11_ltz64, label %label_a11_gtz65
# gen_phi
	ld.b $t0, $fp, -957
	bnez $t0, .param32_arr_label_a11_ltz64
	b .param32_arr_label_a11_gtz65
.param32_arr_label_a11_ltz64:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a11_gtz65
# gen_phi
	b .param32_arr_label_a11_gtz65
.param32_arr_label_a11_gtz65:
# %op182 = getelementptr i32, i32* %arg10, i32 1
	ld.d $t0, $fp, -104
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -968
# %op183 = load i32, i32* %op182
	ld.d $t0, $fp, -968
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -972
# %op184 = add i32 %op177, %op183
	ld.w $t0, $fp, -944
	ld.w $t1, $fp, -972
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -976
# %op185 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -977
# %op186 = zext i1 %op185 to i32
	ld.b $t0, $fp, -977
	andi $t1, $t0, 1
	st.w $t1, $fp, -984
# %op187 = add i32 %op186, zeroinitializer
	ld.w $t0, $fp, -984
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -988
# %op188 = icmp ne i32 %op187, zeroinitializer
	ld.w $t0, $fp, -988
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -989
# br i1 %op188, label %label_a12_ltz66, label %label_a12_gtz67
# gen_phi
	ld.b $t0, $fp, -989
	bnez $t0, .param32_arr_label_a12_ltz66
	b .param32_arr_label_a12_gtz67
.param32_arr_label_a12_ltz66:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a12_gtz67
# gen_phi
	b .param32_arr_label_a12_gtz67
.param32_arr_label_a12_gtz67:
# %op189 = getelementptr i32, i32* %arg11, i32 0
	ld.d $t0, $fp, -112
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1000
# %op190 = load i32, i32* %op189
	ld.d $t0, $fp, -1000
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1004
# %op191 = add i32 %op184, %op190
	ld.w $t0, $fp, -976
	ld.w $t1, $fp, -1004
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1008
# %op192 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1009
# %op193 = zext i1 %op192 to i32
	ld.b $t0, $fp, -1009
	andi $t1, $t0, 1
	st.w $t1, $fp, -1016
# %op194 = add i32 %op193, zeroinitializer
	ld.w $t0, $fp, -1016
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1020
# %op195 = icmp ne i32 %op194, zeroinitializer
	ld.w $t0, $fp, -1020
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1021
# br i1 %op195, label %label_a12_ltz68, label %label_a12_gtz69
# gen_phi
	ld.b $t0, $fp, -1021
	bnez $t0, .param32_arr_label_a12_ltz68
	b .param32_arr_label_a12_gtz69
.param32_arr_label_a12_ltz68:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a12_gtz69
# gen_phi
	b .param32_arr_label_a12_gtz69
.param32_arr_label_a12_gtz69:
# %op196 = getelementptr i32, i32* %arg11, i32 1
	ld.d $t0, $fp, -112
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1032
# %op197 = load i32, i32* %op196
	ld.d $t0, $fp, -1032
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1036
# %op198 = add i32 %op191, %op197
	ld.w $t0, $fp, -1008
	ld.w $t1, $fp, -1036
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1040
# %op199 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1041
# %op200 = zext i1 %op199 to i32
	ld.b $t0, $fp, -1041
	andi $t1, $t0, 1
	st.w $t1, $fp, -1048
# %op201 = add i32 %op200, zeroinitializer
	ld.w $t0, $fp, -1048
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1052
# %op202 = icmp ne i32 %op201, zeroinitializer
	ld.w $t0, $fp, -1052
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1053
# br i1 %op202, label %label_a13_ltz70, label %label_a13_gtz71
# gen_phi
	ld.b $t0, $fp, -1053
	bnez $t0, .param32_arr_label_a13_ltz70
	b .param32_arr_label_a13_gtz71
.param32_arr_label_a13_ltz70:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a13_gtz71
# gen_phi
	b .param32_arr_label_a13_gtz71
.param32_arr_label_a13_gtz71:
# %op203 = getelementptr i32, i32* %arg12, i32 0
	ld.d $t0, $fp, -120
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1064
# %op204 = load i32, i32* %op203
	ld.d $t0, $fp, -1064
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1068
# %op205 = add i32 %op198, %op204
	ld.w $t0, $fp, -1040
	ld.w $t1, $fp, -1068
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1072
# %op206 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1073
# %op207 = zext i1 %op206 to i32
	ld.b $t0, $fp, -1073
	andi $t1, $t0, 1
	st.w $t1, $fp, -1080
# %op208 = add i32 %op207, zeroinitializer
	ld.w $t0, $fp, -1080
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1084
# %op209 = icmp ne i32 %op208, zeroinitializer
	ld.w $t0, $fp, -1084
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1085
# br i1 %op209, label %label_a13_ltz72, label %label_a13_gtz73
# gen_phi
	ld.b $t0, $fp, -1085
	bnez $t0, .param32_arr_label_a13_ltz72
	b .param32_arr_label_a13_gtz73
.param32_arr_label_a13_ltz72:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a13_gtz73
# gen_phi
	b .param32_arr_label_a13_gtz73
.param32_arr_label_a13_gtz73:
# %op210 = getelementptr i32, i32* %arg12, i32 1
	ld.d $t0, $fp, -120
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1096
# %op211 = load i32, i32* %op210
	ld.d $t0, $fp, -1096
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1100
# %op212 = add i32 %op205, %op211
	ld.w $t0, $fp, -1072
	ld.w $t1, $fp, -1100
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1104
# %op213 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1105
# %op214 = zext i1 %op213 to i32
	ld.b $t0, $fp, -1105
	andi $t1, $t0, 1
	st.w $t1, $fp, -1112
# %op215 = add i32 %op214, zeroinitializer
	ld.w $t0, $fp, -1112
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1116
# %op216 = icmp ne i32 %op215, zeroinitializer
	ld.w $t0, $fp, -1116
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1117
# br i1 %op216, label %label_a14_ltz74, label %label_a14_gtz75
# gen_phi
	ld.b $t0, $fp, -1117
	bnez $t0, .param32_arr_label_a14_ltz74
	b .param32_arr_label_a14_gtz75
.param32_arr_label_a14_ltz74:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a14_gtz75
# gen_phi
	b .param32_arr_label_a14_gtz75
.param32_arr_label_a14_gtz75:
# %op217 = getelementptr i32, i32* %arg13, i32 0
	ld.d $t0, $fp, -128
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1128
# %op218 = load i32, i32* %op217
	ld.d $t0, $fp, -1128
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1132
# %op219 = add i32 %op212, %op218
	ld.w $t0, $fp, -1104
	ld.w $t1, $fp, -1132
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1136
# %op220 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1137
# %op221 = zext i1 %op220 to i32
	ld.b $t0, $fp, -1137
	andi $t1, $t0, 1
	st.w $t1, $fp, -1144
# %op222 = add i32 %op221, zeroinitializer
	ld.w $t0, $fp, -1144
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1148
# %op223 = icmp ne i32 %op222, zeroinitializer
	ld.w $t0, $fp, -1148
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1149
# br i1 %op223, label %label_a14_ltz76, label %label_a14_gtz77
# gen_phi
	ld.b $t0, $fp, -1149
	bnez $t0, .param32_arr_label_a14_ltz76
	b .param32_arr_label_a14_gtz77
.param32_arr_label_a14_ltz76:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a14_gtz77
# gen_phi
	b .param32_arr_label_a14_gtz77
.param32_arr_label_a14_gtz77:
# %op224 = getelementptr i32, i32* %arg13, i32 1
	ld.d $t0, $fp, -128
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1160
# %op225 = load i32, i32* %op224
	ld.d $t0, $fp, -1160
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1164
# %op226 = add i32 %op219, %op225
	ld.w $t0, $fp, -1136
	ld.w $t1, $fp, -1164
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1168
# %op227 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1169
# %op228 = zext i1 %op227 to i32
	ld.b $t0, $fp, -1169
	andi $t1, $t0, 1
	st.w $t1, $fp, -1176
# %op229 = add i32 %op228, zeroinitializer
	ld.w $t0, $fp, -1176
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1180
# %op230 = icmp ne i32 %op229, zeroinitializer
	ld.w $t0, $fp, -1180
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1181
# br i1 %op230, label %label_a15_ltz78, label %label_a15_gtz79
# gen_phi
	ld.b $t0, $fp, -1181
	bnez $t0, .param32_arr_label_a15_ltz78
	b .param32_arr_label_a15_gtz79
.param32_arr_label_a15_ltz78:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a15_gtz79
# gen_phi
	b .param32_arr_label_a15_gtz79
.param32_arr_label_a15_gtz79:
# %op231 = getelementptr i32, i32* %arg14, i32 0
	ld.d $t0, $fp, -136
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1192
# %op232 = load i32, i32* %op231
	ld.d $t0, $fp, -1192
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1196
# %op233 = add i32 %op226, %op232
	ld.w $t0, $fp, -1168
	ld.w $t1, $fp, -1196
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1200
# %op234 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1201
# %op235 = zext i1 %op234 to i32
	ld.b $t0, $fp, -1201
	andi $t1, $t0, 1
	st.w $t1, $fp, -1208
# %op236 = add i32 %op235, zeroinitializer
	ld.w $t0, $fp, -1208
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1212
# %op237 = icmp ne i32 %op236, zeroinitializer
	ld.w $t0, $fp, -1212
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1213
# br i1 %op237, label %label_a15_ltz80, label %label_a15_gtz81
# gen_phi
	ld.b $t0, $fp, -1213
	bnez $t0, .param32_arr_label_a15_ltz80
	b .param32_arr_label_a15_gtz81
.param32_arr_label_a15_ltz80:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a15_gtz81
# gen_phi
	b .param32_arr_label_a15_gtz81
.param32_arr_label_a15_gtz81:
# %op238 = getelementptr i32, i32* %arg14, i32 1
	ld.d $t0, $fp, -136
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1224
# %op239 = load i32, i32* %op238
	ld.d $t0, $fp, -1224
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1228
# %op240 = add i32 %op233, %op239
	ld.w $t0, $fp, -1200
	ld.w $t1, $fp, -1228
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1232
# %op241 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1233
# %op242 = zext i1 %op241 to i32
	ld.b $t0, $fp, -1233
	andi $t1, $t0, 1
	st.w $t1, $fp, -1240
# %op243 = add i32 %op242, zeroinitializer
	ld.w $t0, $fp, -1240
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1244
# %op244 = icmp ne i32 %op243, zeroinitializer
	ld.w $t0, $fp, -1244
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1245
# br i1 %op244, label %label_a16_ltz82, label %label_a16_gtz83
# gen_phi
	ld.b $t0, $fp, -1245
	bnez $t0, .param32_arr_label_a16_ltz82
	b .param32_arr_label_a16_gtz83
.param32_arr_label_a16_ltz82:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a16_gtz83
# gen_phi
	b .param32_arr_label_a16_gtz83
.param32_arr_label_a16_gtz83:
# %op245 = getelementptr i32, i32* %arg15, i32 0
	ld.d $t0, $fp, -144
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1256
# %op246 = load i32, i32* %op245
	ld.d $t0, $fp, -1256
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1260
# %op247 = add i32 %op240, %op246
	ld.w $t0, $fp, -1232
	ld.w $t1, $fp, -1260
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1264
# %op248 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1265
# %op249 = zext i1 %op248 to i32
	ld.b $t0, $fp, -1265
	andi $t1, $t0, 1
	st.w $t1, $fp, -1272
# %op250 = add i32 %op249, zeroinitializer
	ld.w $t0, $fp, -1272
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1276
# %op251 = icmp ne i32 %op250, zeroinitializer
	ld.w $t0, $fp, -1276
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1277
# br i1 %op251, label %label_a16_ltz84, label %label_a16_gtz85
# gen_phi
	ld.b $t0, $fp, -1277
	bnez $t0, .param32_arr_label_a16_ltz84
	b .param32_arr_label_a16_gtz85
.param32_arr_label_a16_ltz84:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a16_gtz85
# gen_phi
	b .param32_arr_label_a16_gtz85
.param32_arr_label_a16_gtz85:
# %op252 = getelementptr i32, i32* %arg15, i32 1
	ld.d $t0, $fp, -144
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1288
# %op253 = load i32, i32* %op252
	ld.d $t0, $fp, -1288
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1292
# %op254 = add i32 %op247, %op253
	ld.w $t0, $fp, -1264
	ld.w $t1, $fp, -1292
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1296
# %op255 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1297
# %op256 = zext i1 %op255 to i32
	ld.b $t0, $fp, -1297
	andi $t1, $t0, 1
	st.w $t1, $fp, -1304
# %op257 = add i32 %op256, zeroinitializer
	ld.w $t0, $fp, -1304
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1308
# %op258 = icmp ne i32 %op257, zeroinitializer
	ld.w $t0, $fp, -1308
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1309
# br i1 %op258, label %label_a17_ltz86, label %label_a17_gtz87
# gen_phi
	ld.b $t0, $fp, -1309
	bnez $t0, .param32_arr_label_a17_ltz86
	b .param32_arr_label_a17_gtz87
.param32_arr_label_a17_ltz86:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a17_gtz87
# gen_phi
	b .param32_arr_label_a17_gtz87
.param32_arr_label_a17_gtz87:
# %op259 = getelementptr i32, i32* %arg16, i32 0
	ld.d $t0, $fp, -152
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1320
# %op260 = load i32, i32* %op259
	ld.d $t0, $fp, -1320
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1324
# %op261 = add i32 %op254, %op260
	ld.w $t0, $fp, -1296
	ld.w $t1, $fp, -1324
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1328
# %op262 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1329
# %op263 = zext i1 %op262 to i32
	ld.b $t0, $fp, -1329
	andi $t1, $t0, 1
	st.w $t1, $fp, -1336
# %op264 = add i32 %op263, zeroinitializer
	ld.w $t0, $fp, -1336
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1340
# %op265 = icmp ne i32 %op264, zeroinitializer
	ld.w $t0, $fp, -1340
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1341
# br i1 %op265, label %label_a17_ltz88, label %label_a17_gtz89
# gen_phi
	ld.b $t0, $fp, -1341
	bnez $t0, .param32_arr_label_a17_ltz88
	b .param32_arr_label_a17_gtz89
.param32_arr_label_a17_ltz88:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a17_gtz89
# gen_phi
	b .param32_arr_label_a17_gtz89
.param32_arr_label_a17_gtz89:
# %op266 = getelementptr i32, i32* %arg16, i32 1
	ld.d $t0, $fp, -152
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1352
# %op267 = load i32, i32* %op266
	ld.d $t0, $fp, -1352
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1356
# %op268 = add i32 %op261, %op267
	ld.w $t0, $fp, -1328
	ld.w $t1, $fp, -1356
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1360
# %op269 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1361
# %op270 = zext i1 %op269 to i32
	ld.b $t0, $fp, -1361
	andi $t1, $t0, 1
	st.w $t1, $fp, -1368
# %op271 = add i32 %op270, zeroinitializer
	ld.w $t0, $fp, -1368
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1372
# %op272 = icmp ne i32 %op271, zeroinitializer
	ld.w $t0, $fp, -1372
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1373
# br i1 %op272, label %label_a18_ltz90, label %label_a18_gtz91
# gen_phi
	ld.b $t0, $fp, -1373
	bnez $t0, .param32_arr_label_a18_ltz90
	b .param32_arr_label_a18_gtz91
.param32_arr_label_a18_ltz90:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a18_gtz91
# gen_phi
	b .param32_arr_label_a18_gtz91
.param32_arr_label_a18_gtz91:
# %op273 = getelementptr i32, i32* %arg17, i32 0
	ld.d $t0, $fp, -160
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1384
# %op274 = load i32, i32* %op273
	ld.d $t0, $fp, -1384
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1388
# %op275 = add i32 %op268, %op274
	ld.w $t0, $fp, -1360
	ld.w $t1, $fp, -1388
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1392
# %op276 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1393
# %op277 = zext i1 %op276 to i32
	ld.b $t0, $fp, -1393
	andi $t1, $t0, 1
	st.w $t1, $fp, -1400
# %op278 = add i32 %op277, zeroinitializer
	ld.w $t0, $fp, -1400
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1404
# %op279 = icmp ne i32 %op278, zeroinitializer
	ld.w $t0, $fp, -1404
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1405
# br i1 %op279, label %label_a18_ltz92, label %label_a18_gtz93
# gen_phi
	ld.b $t0, $fp, -1405
	bnez $t0, .param32_arr_label_a18_ltz92
	b .param32_arr_label_a18_gtz93
.param32_arr_label_a18_ltz92:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a18_gtz93
# gen_phi
	b .param32_arr_label_a18_gtz93
.param32_arr_label_a18_gtz93:
# %op280 = getelementptr i32, i32* %arg17, i32 1
	ld.d $t0, $fp, -160
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1416
# %op281 = load i32, i32* %op280
	ld.d $t0, $fp, -1416
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1420
# %op282 = add i32 %op275, %op281
	ld.w $t0, $fp, -1392
	ld.w $t1, $fp, -1420
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1424
# %op283 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1425
# %op284 = zext i1 %op283 to i32
	ld.b $t0, $fp, -1425
	andi $t1, $t0, 1
	st.w $t1, $fp, -1432
# %op285 = add i32 %op284, zeroinitializer
	ld.w $t0, $fp, -1432
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1436
# %op286 = icmp ne i32 %op285, zeroinitializer
	ld.w $t0, $fp, -1436
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1437
# br i1 %op286, label %label_a19_ltz94, label %label_a19_gtz95
# gen_phi
	ld.b $t0, $fp, -1437
	bnez $t0, .param32_arr_label_a19_ltz94
	b .param32_arr_label_a19_gtz95
.param32_arr_label_a19_ltz94:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a19_gtz95
# gen_phi
	b .param32_arr_label_a19_gtz95
.param32_arr_label_a19_gtz95:
# %op287 = getelementptr i32, i32* %arg18, i32 0
	ld.d $t0, $fp, -168
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1448
# %op288 = load i32, i32* %op287
	ld.d $t0, $fp, -1448
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1452
# %op289 = add i32 %op282, %op288
	ld.w $t0, $fp, -1424
	ld.w $t1, $fp, -1452
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1456
# %op290 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1457
# %op291 = zext i1 %op290 to i32
	ld.b $t0, $fp, -1457
	andi $t1, $t0, 1
	st.w $t1, $fp, -1464
# %op292 = add i32 %op291, zeroinitializer
	ld.w $t0, $fp, -1464
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1468
# %op293 = icmp ne i32 %op292, zeroinitializer
	ld.w $t0, $fp, -1468
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1469
# br i1 %op293, label %label_a19_ltz96, label %label_a19_gtz97
# gen_phi
	ld.b $t0, $fp, -1469
	bnez $t0, .param32_arr_label_a19_ltz96
	b .param32_arr_label_a19_gtz97
.param32_arr_label_a19_ltz96:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a19_gtz97
# gen_phi
	b .param32_arr_label_a19_gtz97
.param32_arr_label_a19_gtz97:
# %op294 = getelementptr i32, i32* %arg18, i32 1
	ld.d $t0, $fp, -168
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1480
# %op295 = load i32, i32* %op294
	ld.d $t0, $fp, -1480
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1484
# %op296 = add i32 %op289, %op295
	ld.w $t0, $fp, -1456
	ld.w $t1, $fp, -1484
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1488
# %op297 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1489
# %op298 = zext i1 %op297 to i32
	ld.b $t0, $fp, -1489
	andi $t1, $t0, 1
	st.w $t1, $fp, -1496
# %op299 = add i32 %op298, zeroinitializer
	ld.w $t0, $fp, -1496
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1500
# %op300 = icmp ne i32 %op299, zeroinitializer
	ld.w $t0, $fp, -1500
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1501
# br i1 %op300, label %label_a20_ltz98, label %label_a20_gtz99
# gen_phi
	ld.b $t0, $fp, -1501
	bnez $t0, .param32_arr_label_a20_ltz98
	b .param32_arr_label_a20_gtz99
.param32_arr_label_a20_ltz98:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a20_gtz99
# gen_phi
	b .param32_arr_label_a20_gtz99
.param32_arr_label_a20_gtz99:
# %op301 = getelementptr i32, i32* %arg19, i32 0
	ld.d $t0, $fp, -176
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1512
# %op302 = load i32, i32* %op301
	ld.d $t0, $fp, -1512
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1516
# %op303 = add i32 %op296, %op302
	ld.w $t0, $fp, -1488
	ld.w $t1, $fp, -1516
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1520
# %op304 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1521
# %op305 = zext i1 %op304 to i32
	ld.b $t0, $fp, -1521
	andi $t1, $t0, 1
	st.w $t1, $fp, -1528
# %op306 = add i32 %op305, zeroinitializer
	ld.w $t0, $fp, -1528
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1532
# %op307 = icmp ne i32 %op306, zeroinitializer
	ld.w $t0, $fp, -1532
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1533
# br i1 %op307, label %label_a20_ltz100, label %label_a20_gtz101
# gen_phi
	ld.b $t0, $fp, -1533
	bnez $t0, .param32_arr_label_a20_ltz100
	b .param32_arr_label_a20_gtz101
.param32_arr_label_a20_ltz100:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a20_gtz101
# gen_phi
	b .param32_arr_label_a20_gtz101
.param32_arr_label_a20_gtz101:
# %op308 = getelementptr i32, i32* %arg19, i32 1
	ld.d $t0, $fp, -176
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1544
# %op309 = load i32, i32* %op308
	ld.d $t0, $fp, -1544
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1548
# %op310 = add i32 %op303, %op309
	ld.w $t0, $fp, -1520
	ld.w $t1, $fp, -1548
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1552
# %op311 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1553
# %op312 = zext i1 %op311 to i32
	ld.b $t0, $fp, -1553
	andi $t1, $t0, 1
	st.w $t1, $fp, -1560
# %op313 = add i32 %op312, zeroinitializer
	ld.w $t0, $fp, -1560
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1564
# %op314 = icmp ne i32 %op313, zeroinitializer
	ld.w $t0, $fp, -1564
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1565
# br i1 %op314, label %label_a21_ltz102, label %label_a21_gtz103
# gen_phi
	ld.b $t0, $fp, -1565
	bnez $t0, .param32_arr_label_a21_ltz102
	b .param32_arr_label_a21_gtz103
.param32_arr_label_a21_ltz102:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a21_gtz103
# gen_phi
	b .param32_arr_label_a21_gtz103
.param32_arr_label_a21_gtz103:
# %op315 = getelementptr i32, i32* %arg20, i32 0
	ld.d $t0, $fp, -184
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1576
# %op316 = load i32, i32* %op315
	ld.d $t0, $fp, -1576
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1580
# %op317 = add i32 %op310, %op316
	ld.w $t0, $fp, -1552
	ld.w $t1, $fp, -1580
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1584
# %op318 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1585
# %op319 = zext i1 %op318 to i32
	ld.b $t0, $fp, -1585
	andi $t1, $t0, 1
	st.w $t1, $fp, -1592
# %op320 = add i32 %op319, zeroinitializer
	ld.w $t0, $fp, -1592
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1596
# %op321 = icmp ne i32 %op320, zeroinitializer
	ld.w $t0, $fp, -1596
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1597
# br i1 %op321, label %label_a21_ltz104, label %label_a21_gtz105
# gen_phi
	ld.b $t0, $fp, -1597
	bnez $t0, .param32_arr_label_a21_ltz104
	b .param32_arr_label_a21_gtz105
.param32_arr_label_a21_ltz104:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a21_gtz105
# gen_phi
	b .param32_arr_label_a21_gtz105
.param32_arr_label_a21_gtz105:
# %op322 = getelementptr i32, i32* %arg20, i32 1
	ld.d $t0, $fp, -184
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1608
# %op323 = load i32, i32* %op322
	ld.d $t0, $fp, -1608
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1612
# %op324 = add i32 %op317, %op323
	ld.w $t0, $fp, -1584
	ld.w $t1, $fp, -1612
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1616
# %op325 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1617
# %op326 = zext i1 %op325 to i32
	ld.b $t0, $fp, -1617
	andi $t1, $t0, 1
	st.w $t1, $fp, -1624
# %op327 = add i32 %op326, zeroinitializer
	ld.w $t0, $fp, -1624
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1628
# %op328 = icmp ne i32 %op327, zeroinitializer
	ld.w $t0, $fp, -1628
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1629
# br i1 %op328, label %label_a22_ltz106, label %label_a22_gtz107
# gen_phi
	ld.b $t0, $fp, -1629
	bnez $t0, .param32_arr_label_a22_ltz106
	b .param32_arr_label_a22_gtz107
.param32_arr_label_a22_ltz106:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a22_gtz107
# gen_phi
	b .param32_arr_label_a22_gtz107
.param32_arr_label_a22_gtz107:
# %op329 = getelementptr i32, i32* %arg21, i32 0
	ld.d $t0, $fp, -192
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1640
# %op330 = load i32, i32* %op329
	ld.d $t0, $fp, -1640
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1644
# %op331 = add i32 %op324, %op330
	ld.w $t0, $fp, -1616
	ld.w $t1, $fp, -1644
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1648
# %op332 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1649
# %op333 = zext i1 %op332 to i32
	ld.b $t0, $fp, -1649
	andi $t1, $t0, 1
	st.w $t1, $fp, -1656
# %op334 = add i32 %op333, zeroinitializer
	ld.w $t0, $fp, -1656
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1660
# %op335 = icmp ne i32 %op334, zeroinitializer
	ld.w $t0, $fp, -1660
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1661
# br i1 %op335, label %label_a22_ltz108, label %label_a22_gtz109
# gen_phi
	ld.b $t0, $fp, -1661
	bnez $t0, .param32_arr_label_a22_ltz108
	b .param32_arr_label_a22_gtz109
.param32_arr_label_a22_ltz108:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a22_gtz109
# gen_phi
	b .param32_arr_label_a22_gtz109
.param32_arr_label_a22_gtz109:
# %op336 = getelementptr i32, i32* %arg21, i32 1
	ld.d $t0, $fp, -192
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1672
# %op337 = load i32, i32* %op336
	ld.d $t0, $fp, -1672
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1676
# %op338 = add i32 %op331, %op337
	ld.w $t0, $fp, -1648
	ld.w $t1, $fp, -1676
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1680
# %op339 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1681
# %op340 = zext i1 %op339 to i32
	ld.b $t0, $fp, -1681
	andi $t1, $t0, 1
	st.w $t1, $fp, -1688
# %op341 = add i32 %op340, zeroinitializer
	ld.w $t0, $fp, -1688
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1692
# %op342 = icmp ne i32 %op341, zeroinitializer
	ld.w $t0, $fp, -1692
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1693
# br i1 %op342, label %label_a23_ltz110, label %label_a23_gtz111
# gen_phi
	ld.b $t0, $fp, -1693
	bnez $t0, .param32_arr_label_a23_ltz110
	b .param32_arr_label_a23_gtz111
.param32_arr_label_a23_ltz110:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a23_gtz111
# gen_phi
	b .param32_arr_label_a23_gtz111
.param32_arr_label_a23_gtz111:
# %op343 = getelementptr i32, i32* %arg22, i32 0
	ld.d $t0, $fp, -200
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1704
# %op344 = load i32, i32* %op343
	ld.d $t0, $fp, -1704
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1708
# %op345 = add i32 %op338, %op344
	ld.w $t0, $fp, -1680
	ld.w $t1, $fp, -1708
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1712
# %op346 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1713
# %op347 = zext i1 %op346 to i32
	ld.b $t0, $fp, -1713
	andi $t1, $t0, 1
	st.w $t1, $fp, -1720
# %op348 = add i32 %op347, zeroinitializer
	ld.w $t0, $fp, -1720
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1724
# %op349 = icmp ne i32 %op348, zeroinitializer
	ld.w $t0, $fp, -1724
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1725
# br i1 %op349, label %label_a23_ltz112, label %label_a23_gtz113
# gen_phi
	ld.b $t0, $fp, -1725
	bnez $t0, .param32_arr_label_a23_ltz112
	b .param32_arr_label_a23_gtz113
.param32_arr_label_a23_ltz112:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a23_gtz113
# gen_phi
	b .param32_arr_label_a23_gtz113
.param32_arr_label_a23_gtz113:
# %op350 = getelementptr i32, i32* %arg22, i32 1
	ld.d $t0, $fp, -200
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1736
# %op351 = load i32, i32* %op350
	ld.d $t0, $fp, -1736
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1740
# %op352 = add i32 %op345, %op351
	ld.w $t0, $fp, -1712
	ld.w $t1, $fp, -1740
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1744
# %op353 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1745
# %op354 = zext i1 %op353 to i32
	ld.b $t0, $fp, -1745
	andi $t1, $t0, 1
	st.w $t1, $fp, -1752
# %op355 = add i32 %op354, zeroinitializer
	ld.w $t0, $fp, -1752
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1756
# %op356 = icmp ne i32 %op355, zeroinitializer
	ld.w $t0, $fp, -1756
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1757
# br i1 %op356, label %label_a24_ltz114, label %label_a24_gtz115
# gen_phi
	ld.b $t0, $fp, -1757
	bnez $t0, .param32_arr_label_a24_ltz114
	b .param32_arr_label_a24_gtz115
.param32_arr_label_a24_ltz114:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a24_gtz115
# gen_phi
	b .param32_arr_label_a24_gtz115
.param32_arr_label_a24_gtz115:
# %op357 = getelementptr i32, i32* %arg23, i32 0
	ld.d $t0, $fp, -208
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1768
# %op358 = load i32, i32* %op357
	ld.d $t0, $fp, -1768
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1772
# %op359 = add i32 %op352, %op358
	ld.w $t0, $fp, -1744
	ld.w $t1, $fp, -1772
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1776
# %op360 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1777
# %op361 = zext i1 %op360 to i32
	ld.b $t0, $fp, -1777
	andi $t1, $t0, 1
	st.w $t1, $fp, -1784
# %op362 = add i32 %op361, zeroinitializer
	ld.w $t0, $fp, -1784
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1788
# %op363 = icmp ne i32 %op362, zeroinitializer
	ld.w $t0, $fp, -1788
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1789
# br i1 %op363, label %label_a24_ltz116, label %label_a24_gtz117
# gen_phi
	ld.b $t0, $fp, -1789
	bnez $t0, .param32_arr_label_a24_ltz116
	b .param32_arr_label_a24_gtz117
.param32_arr_label_a24_ltz116:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a24_gtz117
# gen_phi
	b .param32_arr_label_a24_gtz117
.param32_arr_label_a24_gtz117:
# %op364 = getelementptr i32, i32* %arg23, i32 1
	ld.d $t0, $fp, -208
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1800
# %op365 = load i32, i32* %op364
	ld.d $t0, $fp, -1800
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1804
# %op366 = add i32 %op359, %op365
	ld.w $t0, $fp, -1776
	ld.w $t1, $fp, -1804
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1808
# %op367 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1809
# %op368 = zext i1 %op367 to i32
	ld.b $t0, $fp, -1809
	andi $t1, $t0, 1
	st.w $t1, $fp, -1816
# %op369 = add i32 %op368, zeroinitializer
	ld.w $t0, $fp, -1816
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1820
# %op370 = icmp ne i32 %op369, zeroinitializer
	ld.w $t0, $fp, -1820
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1821
# br i1 %op370, label %label_a25_ltz118, label %label_a25_gtz119
# gen_phi
	ld.b $t0, $fp, -1821
	bnez $t0, .param32_arr_label_a25_ltz118
	b .param32_arr_label_a25_gtz119
.param32_arr_label_a25_ltz118:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a25_gtz119
# gen_phi
	b .param32_arr_label_a25_gtz119
.param32_arr_label_a25_gtz119:
# %op371 = getelementptr i32, i32* %arg24, i32 0
	ld.d $t0, $fp, -216
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1832
# %op372 = load i32, i32* %op371
	ld.d $t0, $fp, -1832
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1836
# %op373 = add i32 %op366, %op372
	ld.w $t0, $fp, -1808
	ld.w $t1, $fp, -1836
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1840
# %op374 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1841
# %op375 = zext i1 %op374 to i32
	ld.b $t0, $fp, -1841
	andi $t1, $t0, 1
	st.w $t1, $fp, -1848
# %op376 = add i32 %op375, zeroinitializer
	ld.w $t0, $fp, -1848
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1852
# %op377 = icmp ne i32 %op376, zeroinitializer
	ld.w $t0, $fp, -1852
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1853
# br i1 %op377, label %label_a25_ltz120, label %label_a25_gtz121
# gen_phi
	ld.b $t0, $fp, -1853
	bnez $t0, .param32_arr_label_a25_ltz120
	b .param32_arr_label_a25_gtz121
.param32_arr_label_a25_ltz120:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a25_gtz121
# gen_phi
	b .param32_arr_label_a25_gtz121
.param32_arr_label_a25_gtz121:
# %op378 = getelementptr i32, i32* %arg24, i32 1
	ld.d $t0, $fp, -216
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1864
# %op379 = load i32, i32* %op378
	ld.d $t0, $fp, -1864
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1868
# %op380 = add i32 %op373, %op379
	ld.w $t0, $fp, -1840
	ld.w $t1, $fp, -1868
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1872
# %op381 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1873
# %op382 = zext i1 %op381 to i32
	ld.b $t0, $fp, -1873
	andi $t1, $t0, 1
	st.w $t1, $fp, -1880
# %op383 = add i32 %op382, zeroinitializer
	ld.w $t0, $fp, -1880
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1884
# %op384 = icmp ne i32 %op383, zeroinitializer
	ld.w $t0, $fp, -1884
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1885
# br i1 %op384, label %label_a26_ltz122, label %label_a26_gtz123
# gen_phi
	ld.b $t0, $fp, -1885
	bnez $t0, .param32_arr_label_a26_ltz122
	b .param32_arr_label_a26_gtz123
.param32_arr_label_a26_ltz122:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a26_gtz123
# gen_phi
	b .param32_arr_label_a26_gtz123
.param32_arr_label_a26_gtz123:
# %op385 = getelementptr i32, i32* %arg25, i32 0
	ld.d $t0, $fp, -224
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1896
# %op386 = load i32, i32* %op385
	ld.d $t0, $fp, -1896
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1900
# %op387 = add i32 %op380, %op386
	ld.w $t0, $fp, -1872
	ld.w $t1, $fp, -1900
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1904
# %op388 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1905
# %op389 = zext i1 %op388 to i32
	ld.b $t0, $fp, -1905
	andi $t1, $t0, 1
	st.w $t1, $fp, -1912
# %op390 = add i32 %op389, zeroinitializer
	ld.w $t0, $fp, -1912
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1916
# %op391 = icmp ne i32 %op390, zeroinitializer
	ld.w $t0, $fp, -1916
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1917
# br i1 %op391, label %label_a26_ltz124, label %label_a26_gtz125
# gen_phi
	ld.b $t0, $fp, -1917
	bnez $t0, .param32_arr_label_a26_ltz124
	b .param32_arr_label_a26_gtz125
.param32_arr_label_a26_ltz124:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a26_gtz125
# gen_phi
	b .param32_arr_label_a26_gtz125
.param32_arr_label_a26_gtz125:
# %op392 = getelementptr i32, i32* %arg25, i32 1
	ld.d $t0, $fp, -224
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1928
# %op393 = load i32, i32* %op392
	ld.d $t0, $fp, -1928
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1932
# %op394 = add i32 %op387, %op393
	ld.w $t0, $fp, -1904
	ld.w $t1, $fp, -1932
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1936
# %op395 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1937
# %op396 = zext i1 %op395 to i32
	ld.b $t0, $fp, -1937
	andi $t1, $t0, 1
	st.w $t1, $fp, -1944
# %op397 = add i32 %op396, zeroinitializer
	ld.w $t0, $fp, -1944
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1948
# %op398 = icmp ne i32 %op397, zeroinitializer
	ld.w $t0, $fp, -1948
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1949
# br i1 %op398, label %label_a27_ltz126, label %label_a27_gtz127
# gen_phi
	ld.b $t0, $fp, -1949
	bnez $t0, .param32_arr_label_a27_ltz126
	b .param32_arr_label_a27_gtz127
.param32_arr_label_a27_ltz126:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a27_gtz127
# gen_phi
	b .param32_arr_label_a27_gtz127
.param32_arr_label_a27_gtz127:
# %op399 = getelementptr i32, i32* %arg26, i32 0
	ld.d $t0, $fp, -232
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1960
# %op400 = load i32, i32* %op399
	ld.d $t0, $fp, -1960
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1964
# %op401 = add i32 %op394, %op400
	ld.w $t0, $fp, -1936
	ld.w $t1, $fp, -1964
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1968
# %op402 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1969
# %op403 = zext i1 %op402 to i32
	ld.b $t0, $fp, -1969
	andi $t1, $t0, 1
	st.w $t1, $fp, -1976
# %op404 = add i32 %op403, zeroinitializer
	ld.w $t0, $fp, -1976
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1980
# %op405 = icmp ne i32 %op404, zeroinitializer
	ld.w $t0, $fp, -1980
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1981
# br i1 %op405, label %label_a27_ltz128, label %label_a27_gtz129
# gen_phi
	ld.b $t0, $fp, -1981
	bnez $t0, .param32_arr_label_a27_ltz128
	b .param32_arr_label_a27_gtz129
.param32_arr_label_a27_ltz128:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a27_gtz129
# gen_phi
	b .param32_arr_label_a27_gtz129
.param32_arr_label_a27_gtz129:
# %op406 = getelementptr i32, i32* %arg26, i32 1
	ld.d $t0, $fp, -232
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1992
# %op407 = load i32, i32* %op406
	ld.d $t0, $fp, -1992
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1996
# %op408 = add i32 %op401, %op407
	ld.w $t0, $fp, -1968
	ld.w $t1, $fp, -1996
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -2000
# %op409 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -2001
# %op410 = zext i1 %op409 to i32
	ld.b $t0, $fp, -2001
	andi $t1, $t0, 1
	st.w $t1, $fp, -2008
# %op411 = add i32 %op410, zeroinitializer
	ld.w $t0, $fp, -2008
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -2012
# %op412 = icmp ne i32 %op411, zeroinitializer
	ld.w $t0, $fp, -2012
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -2013
# br i1 %op412, label %label_a28_ltz130, label %label_a28_gtz131
# gen_phi
	ld.b $t0, $fp, -2013
	bnez $t0, .param32_arr_label_a28_ltz130
	b .param32_arr_label_a28_gtz131
.param32_arr_label_a28_ltz130:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a28_gtz131
# gen_phi
	b .param32_arr_label_a28_gtz131
.param32_arr_label_a28_gtz131:
# %op413 = getelementptr i32, i32* %arg27, i32 0
	ld.d $t0, $fp, -240
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -2024
# %op414 = load i32, i32* %op413
	ld.d $t0, $fp, -2024
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -2028
# %op415 = add i32 %op408, %op414
	ld.w $t0, $fp, -2000
	ld.w $t1, $fp, -2028
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -2032
# %op416 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -2033
# %op417 = zext i1 %op416 to i32
	ld.b $t0, $fp, -2033
	andi $t1, $t0, 1
	st.w $t1, $fp, -2040
# %op418 = add i32 %op417, zeroinitializer
	ld.w $t0, $fp, -2040
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -2044
# %op419 = icmp ne i32 %op418, zeroinitializer
	ld.w $t0, $fp, -2044
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -2045
# br i1 %op419, label %label_a28_ltz132, label %label_a28_gtz133
# gen_phi
	ld.b $t0, $fp, -2045
	bnez $t0, .param32_arr_label_a28_ltz132
	b .param32_arr_label_a28_gtz133
.param32_arr_label_a28_ltz132:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a28_gtz133
# gen_phi
	b .param32_arr_label_a28_gtz133
.param32_arr_label_a28_gtz133:
# %op420 = getelementptr i32, i32* %arg27, i32 1
	ld.d $t0, $fp, -240
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 2040
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op421 = load i32, i32* %op420
	lu12i.w $t0, -1
	ori $t0, $t0, 2040
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -1
	ori $t8, $t8, 2036
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op422 = add i32 %op415, %op421
	ld.w $t0, $fp, -2032
	lu12i.w $t1, -1
	ori $t1, $t1, 2036
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 2032
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op423 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 2031
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op424 = zext i1 %op423 to i32
	lu12i.w $t0, -1
	ori $t0, $t0, 2031
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -1
	ori $t8, $t8, 2024
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op425 = add i32 %op424, zeroinitializer
	lu12i.w $t0, -1
	ori $t0, $t0, 2024
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 2020
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op426 = icmp ne i32 %op425, zeroinitializer
	lu12i.w $t0, -1
	ori $t0, $t0, 2020
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -1
	ori $t8, $t8, 2019
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op426, label %label_a29_ltz134, label %label_a29_gtz135
# gen_phi
	lu12i.w $t0, -1
	ori $t0, $t0, 2019
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .param32_arr_label_a29_ltz134
	b .param32_arr_label_a29_gtz135
.param32_arr_label_a29_ltz134:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a29_gtz135
# gen_phi
	b .param32_arr_label_a29_gtz135
.param32_arr_label_a29_gtz135:
# %op427 = getelementptr i32, i32* %arg28, i32 0
	ld.d $t0, $fp, -248
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 2008
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op428 = load i32, i32* %op427
	lu12i.w $t0, -1
	ori $t0, $t0, 2008
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -1
	ori $t8, $t8, 2004
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op429 = add i32 %op422, %op428
	lu12i.w $t0, -1
	ori $t0, $t0, 2032
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 2004
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 2000
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op430 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1999
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op431 = zext i1 %op430 to i32
	lu12i.w $t0, -1
	ori $t0, $t0, 1999
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -1
	ori $t8, $t8, 1992
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op432 = add i32 %op431, zeroinitializer
	lu12i.w $t0, -1
	ori $t0, $t0, 1992
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1988
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op433 = icmp ne i32 %op432, zeroinitializer
	lu12i.w $t0, -1
	ori $t0, $t0, 1988
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -1
	ori $t8, $t8, 1987
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op433, label %label_a29_ltz136, label %label_a29_gtz137
# gen_phi
	lu12i.w $t0, -1
	ori $t0, $t0, 1987
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .param32_arr_label_a29_ltz136
	b .param32_arr_label_a29_gtz137
.param32_arr_label_a29_ltz136:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a29_gtz137
# gen_phi
	b .param32_arr_label_a29_gtz137
.param32_arr_label_a29_gtz137:
# %op434 = getelementptr i32, i32* %arg28, i32 1
	ld.d $t0, $fp, -248
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1976
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op435 = load i32, i32* %op434
	lu12i.w $t0, -1
	ori $t0, $t0, 1976
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -1
	ori $t8, $t8, 1972
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op436 = add i32 %op429, %op435
	lu12i.w $t0, -1
	ori $t0, $t0, 2000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1972
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1968
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op437 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1967
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op438 = zext i1 %op437 to i32
	lu12i.w $t0, -1
	ori $t0, $t0, 1967
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -1
	ori $t8, $t8, 1960
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op439 = add i32 %op438, zeroinitializer
	lu12i.w $t0, -1
	ori $t0, $t0, 1960
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1956
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op440 = icmp ne i32 %op439, zeroinitializer
	lu12i.w $t0, -1
	ori $t0, $t0, 1956
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -1
	ori $t8, $t8, 1955
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op440, label %label_a30_ltz138, label %label_a30_gtz139
# gen_phi
	lu12i.w $t0, -1
	ori $t0, $t0, 1955
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .param32_arr_label_a30_ltz138
	b .param32_arr_label_a30_gtz139
.param32_arr_label_a30_ltz138:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a30_gtz139
# gen_phi
	b .param32_arr_label_a30_gtz139
.param32_arr_label_a30_gtz139:
# %op441 = getelementptr i32, i32* %arg29, i32 0
	ld.d $t0, $fp, -256
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1944
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op442 = load i32, i32* %op441
	lu12i.w $t0, -1
	ori $t0, $t0, 1944
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -1
	ori $t8, $t8, 1940
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op443 = add i32 %op436, %op442
	lu12i.w $t0, -1
	ori $t0, $t0, 1968
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1940
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1936
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op444 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1935
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op445 = zext i1 %op444 to i32
	lu12i.w $t0, -1
	ori $t0, $t0, 1935
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -1
	ori $t8, $t8, 1928
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op446 = add i32 %op445, zeroinitializer
	lu12i.w $t0, -1
	ori $t0, $t0, 1928
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1924
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op447 = icmp ne i32 %op446, zeroinitializer
	lu12i.w $t0, -1
	ori $t0, $t0, 1924
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -1
	ori $t8, $t8, 1923
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op447, label %label_a30_ltz140, label %label_a30_gtz141
# gen_phi
	lu12i.w $t0, -1
	ori $t0, $t0, 1923
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .param32_arr_label_a30_ltz140
	b .param32_arr_label_a30_gtz141
.param32_arr_label_a30_ltz140:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a30_gtz141
# gen_phi
	b .param32_arr_label_a30_gtz141
.param32_arr_label_a30_gtz141:
# %op448 = getelementptr i32, i32* %arg29, i32 1
	ld.d $t0, $fp, -256
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1912
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op449 = load i32, i32* %op448
	lu12i.w $t0, -1
	ori $t0, $t0, 1912
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -1
	ori $t8, $t8, 1908
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op450 = add i32 %op443, %op449
	lu12i.w $t0, -1
	ori $t0, $t0, 1936
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1908
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1904
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op451 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1903
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op452 = zext i1 %op451 to i32
	lu12i.w $t0, -1
	ori $t0, $t0, 1903
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -1
	ori $t8, $t8, 1896
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op453 = add i32 %op452, zeroinitializer
	lu12i.w $t0, -1
	ori $t0, $t0, 1896
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1892
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op454 = icmp ne i32 %op453, zeroinitializer
	lu12i.w $t0, -1
	ori $t0, $t0, 1892
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -1
	ori $t8, $t8, 1891
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op454, label %label_a31_ltz142, label %label_a31_gtz143
# gen_phi
	lu12i.w $t0, -1
	ori $t0, $t0, 1891
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .param32_arr_label_a31_ltz142
	b .param32_arr_label_a31_gtz143
.param32_arr_label_a31_ltz142:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a31_gtz143
# gen_phi
	b .param32_arr_label_a31_gtz143
.param32_arr_label_a31_gtz143:
# %op455 = getelementptr i32, i32* %arg30, i32 0
	ld.d $t0, $fp, -264
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1880
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op456 = load i32, i32* %op455
	lu12i.w $t0, -1
	ori $t0, $t0, 1880
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -1
	ori $t8, $t8, 1876
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op457 = add i32 %op450, %op456
	lu12i.w $t0, -1
	ori $t0, $t0, 1904
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1876
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1872
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op458 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1871
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op459 = zext i1 %op458 to i32
	lu12i.w $t0, -1
	ori $t0, $t0, 1871
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -1
	ori $t8, $t8, 1864
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op460 = add i32 %op459, zeroinitializer
	lu12i.w $t0, -1
	ori $t0, $t0, 1864
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1860
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op461 = icmp ne i32 %op460, zeroinitializer
	lu12i.w $t0, -1
	ori $t0, $t0, 1860
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -1
	ori $t8, $t8, 1859
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op461, label %label_a31_ltz144, label %label_a31_gtz145
# gen_phi
	lu12i.w $t0, -1
	ori $t0, $t0, 1859
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .param32_arr_label_a31_ltz144
	b .param32_arr_label_a31_gtz145
.param32_arr_label_a31_ltz144:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a31_gtz145
# gen_phi
	b .param32_arr_label_a31_gtz145
.param32_arr_label_a31_gtz145:
# %op462 = getelementptr i32, i32* %arg30, i32 1
	ld.d $t0, $fp, -264
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1848
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op463 = load i32, i32* %op462
	lu12i.w $t0, -1
	ori $t0, $t0, 1848
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -1
	ori $t8, $t8, 1844
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op464 = add i32 %op457, %op463
	lu12i.w $t0, -1
	ori $t0, $t0, 1872
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1844
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1840
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op465 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1839
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op466 = zext i1 %op465 to i32
	lu12i.w $t0, -1
	ori $t0, $t0, 1839
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -1
	ori $t8, $t8, 1832
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op467 = add i32 %op466, zeroinitializer
	lu12i.w $t0, -1
	ori $t0, $t0, 1832
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1828
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op468 = icmp ne i32 %op467, zeroinitializer
	lu12i.w $t0, -1
	ori $t0, $t0, 1828
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -1
	ori $t8, $t8, 1827
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op468, label %label_a32_ltz146, label %label_a32_gtz147
# gen_phi
	lu12i.w $t0, -1
	ori $t0, $t0, 1827
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .param32_arr_label_a32_ltz146
	b .param32_arr_label_a32_gtz147
.param32_arr_label_a32_ltz146:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a32_gtz147
# gen_phi
	b .param32_arr_label_a32_gtz147
.param32_arr_label_a32_gtz147:
# %op469 = getelementptr i32, i32* %arg31, i32 0
	ld.d $t0, $fp, -272
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1816
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op470 = load i32, i32* %op469
	lu12i.w $t0, -1
	ori $t0, $t0, 1816
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -1
	ori $t8, $t8, 1812
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op471 = add i32 %op464, %op470
	lu12i.w $t0, -1
	ori $t0, $t0, 1840
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1812
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1808
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op472 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1807
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op473 = zext i1 %op472 to i32
	lu12i.w $t0, -1
	ori $t0, $t0, 1807
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -1
	ori $t8, $t8, 1800
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op474 = add i32 %op473, zeroinitializer
	lu12i.w $t0, -1
	ori $t0, $t0, 1800
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1796
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op475 = icmp ne i32 %op474, zeroinitializer
	lu12i.w $t0, -1
	ori $t0, $t0, 1796
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -1
	ori $t8, $t8, 1795
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op475, label %label_a32_ltz148, label %label_a32_gtz149
# gen_phi
	lu12i.w $t0, -1
	ori $t0, $t0, 1795
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .param32_arr_label_a32_ltz148
	b .param32_arr_label_a32_gtz149
.param32_arr_label_a32_ltz148:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a32_gtz149
# gen_phi
	b .param32_arr_label_a32_gtz149
.param32_arr_label_a32_gtz149:
# %op476 = getelementptr i32, i32* %arg31, i32 1
	ld.d $t0, $fp, -272
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1784
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op477 = load i32, i32* %op476
	lu12i.w $t0, -1
	ori $t0, $t0, 1784
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -1
	ori $t8, $t8, 1780
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op478 = add i32 %op471, %op477
	lu12i.w $t0, -1
	ori $t0, $t0, 1808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1780
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1776
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# ret i32 %op478
# gen_phi
	lu12i.w $a0, -1
	ori $a0, $a0, 1776
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.w $a0, $a0, 0
	b .param32_arr_exit
.param32_arr_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 2320
	lu32i.d $t0, 0
	lu52i.d $t0, $t0, 0
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl param16
	.type param16, @function
param16:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -800
.param16_label_entry:
# %op16 = alloca [16 x i32]
	addi.d $t0, $zero, -88
	addi.d $t0, $t0, -64
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -88
# %op17 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 15
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 15
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -160
# store i32 %arg15, i32* %op17
	ld.d $t0, $fp, -160
	ld.w $t1, $fp, -80
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op18 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 14
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 14
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -168
# store i32 %arg14, i32* %op18
	ld.d $t0, $fp, -168
	ld.w $t1, $fp, -76
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op19 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 13
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 13
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -176
# store i32 %arg13, i32* %op19
	ld.d $t0, $fp, -176
	ld.w $t1, $fp, -72
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op20 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 0
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -184
# store i32 %arg0, i32* %op20
	ld.d $t0, $fp, -184
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op21 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 9
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 9
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -192
# store i32 %arg9, i32* %op21
	ld.d $t0, $fp, -192
	ld.w $t1, $fp, -56
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op22 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 1
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -200
# store i32 %arg1, i32* %op22
	ld.d $t0, $fp, -200
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op23 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 2
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 2
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -208
# store i32 %arg2, i32* %op23
	ld.d $t0, $fp, -208
	ld.w $t1, $fp, -28
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op24 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 3
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 3
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -216
# store i32 %arg3, i32* %op24
	ld.d $t0, $fp, -216
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op25 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 4
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -224
# store i32 %arg4, i32* %op25
	ld.d $t0, $fp, -224
	ld.w $t1, $fp, -36
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op26 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 5
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 5
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -232
# store i32 %arg5, i32* %op26
	ld.d $t0, $fp, -232
	ld.w $t1, $fp, -40
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op27 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 6
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 6
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -240
# store i32 %arg6, i32* %op27
	ld.d $t0, $fp, -240
	ld.w $t1, $fp, -44
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op28 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 7
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 7
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -248
# store i32 %arg7, i32* %op28
	ld.d $t0, $fp, -248
	ld.w $t1, $fp, -48
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op29 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 8
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 8
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -256
# store i32 %arg8, i32* %op29
	ld.d $t0, $fp, -256
	ld.w $t1, $fp, -52
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op30 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 10
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 10
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -264
# store i32 %arg10, i32* %op30
	ld.d $t0, $fp, -264
	ld.w $t1, $fp, -60
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op31 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 11
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 11
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -272
# store i32 %arg11, i32* %op31
	ld.d $t0, $fp, -272
	ld.w $t1, $fp, -64
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op32 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 12
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 12
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -280
# store i32 %arg12, i32* %op32
	ld.d $t0, $fp, -280
	ld.w $t1, $fp, -68
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op33 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 0
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -288
# call void @sort(i32* %op33, i32 16)
	ld.d $a0, $fp, -288
	addi.w $a1, $zero, 16
	bl sort
# %op34 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -289
# %op35 = zext i1 %op34 to i32
	ld.b $t0, $fp, -289
	andi $t1, $t0, 1
	st.w $t1, $fp, -296
# %op36 = add i32 %op35, zeroinitializer
	ld.w $t0, $fp, -296
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -300
# %op37 = icmp ne i32 %op36, zeroinitializer
	ld.w $t0, $fp, -300
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -301
# br i1 %op37, label %label_arr_ltz150, label %label_arr_gtz151
# gen_phi
	ld.b $t0, $fp, -301
	bnez $t0, .param16_label_arr_ltz150
	b .param16_label_arr_gtz151
.param16_label_arr_ltz150:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz151
# gen_phi
	b .param16_label_arr_gtz151
.param16_label_arr_gtz151:
# %op38 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 0
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -312
# %op39 = load i32, i32* %op38
	ld.d $t0, $fp, -312
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -316
# %op40 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -317
# %op41 = zext i1 %op40 to i32
	ld.b $t0, $fp, -317
	andi $t1, $t0, 1
	st.w $t1, $fp, -324
# %op42 = add i32 %op41, zeroinitializer
	ld.w $t0, $fp, -324
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -328
# %op43 = icmp ne i32 %op42, zeroinitializer
	ld.w $t0, $fp, -328
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -329
# br i1 %op43, label %label_arr_ltz152, label %label_arr_gtz153
# gen_phi
	ld.b $t0, $fp, -329
	bnez $t0, .param16_label_arr_ltz152
	b .param16_label_arr_gtz153
.param16_label_arr_ltz152:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz153
# gen_phi
	b .param16_label_arr_gtz153
.param16_label_arr_gtz153:
# %op44 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 1
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -344
# %op45 = load i32, i32* %op44
	ld.d $t0, $fp, -344
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -348
# %op46 = icmp slt i32 2, zeroinitializer
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -349
# %op47 = zext i1 %op46 to i32
	ld.b $t0, $fp, -349
	andi $t1, $t0, 1
	st.w $t1, $fp, -356
# %op48 = add i32 %op47, zeroinitializer
	ld.w $t0, $fp, -356
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -360
# %op49 = icmp ne i32 %op48, zeroinitializer
	ld.w $t0, $fp, -360
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -361
# br i1 %op49, label %label_arr_ltz154, label %label_arr_gtz155
# gen_phi
	ld.b $t0, $fp, -361
	bnez $t0, .param16_label_arr_ltz154
	b .param16_label_arr_gtz155
.param16_label_arr_ltz154:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz155
# gen_phi
	b .param16_label_arr_gtz155
.param16_label_arr_gtz155:
# %op50 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 2
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 2
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -376
# %op51 = load i32, i32* %op50
	ld.d $t0, $fp, -376
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -380
# %op52 = icmp slt i32 3, zeroinitializer
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -381
# %op53 = zext i1 %op52 to i32
	ld.b $t0, $fp, -381
	andi $t1, $t0, 1
	st.w $t1, $fp, -388
# %op54 = add i32 %op53, zeroinitializer
	ld.w $t0, $fp, -388
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -392
# %op55 = icmp ne i32 %op54, zeroinitializer
	ld.w $t0, $fp, -392
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -393
# br i1 %op55, label %label_arr_ltz156, label %label_arr_gtz157
# gen_phi
	ld.b $t0, $fp, -393
	bnez $t0, .param16_label_arr_ltz156
	b .param16_label_arr_gtz157
.param16_label_arr_ltz156:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz157
# gen_phi
	b .param16_label_arr_gtz157
.param16_label_arr_gtz157:
# %op56 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 3
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 3
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -408
# %op57 = load i32, i32* %op56
	ld.d $t0, $fp, -408
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -412
# %op58 = icmp slt i32 4, zeroinitializer
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -413
# %op59 = zext i1 %op58 to i32
	ld.b $t0, $fp, -413
	andi $t1, $t0, 1
	st.w $t1, $fp, -420
# %op60 = add i32 %op59, zeroinitializer
	ld.w $t0, $fp, -420
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -424
# %op61 = icmp ne i32 %op60, zeroinitializer
	ld.w $t0, $fp, -424
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -425
# br i1 %op61, label %label_arr_ltz158, label %label_arr_gtz159
# gen_phi
	ld.b $t0, $fp, -425
	bnez $t0, .param16_label_arr_ltz158
	b .param16_label_arr_gtz159
.param16_label_arr_ltz158:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz159
# gen_phi
	b .param16_label_arr_gtz159
.param16_label_arr_gtz159:
# %op62 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 4
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -440
# %op63 = load i32, i32* %op62
	ld.d $t0, $fp, -440
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -444
# %op64 = icmp slt i32 5, zeroinitializer
	addi.w $t0, $zero, 5
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -445
# %op65 = zext i1 %op64 to i32
	ld.b $t0, $fp, -445
	andi $t1, $t0, 1
	st.w $t1, $fp, -452
# %op66 = add i32 %op65, zeroinitializer
	ld.w $t0, $fp, -452
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -456
# %op67 = icmp ne i32 %op66, zeroinitializer
	ld.w $t0, $fp, -456
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -457
# br i1 %op67, label %label_arr_ltz160, label %label_arr_gtz161
# gen_phi
	ld.b $t0, $fp, -457
	bnez $t0, .param16_label_arr_ltz160
	b .param16_label_arr_gtz161
.param16_label_arr_ltz160:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz161
# gen_phi
	b .param16_label_arr_gtz161
.param16_label_arr_gtz161:
# %op68 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 5
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 5
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -472
# %op69 = load i32, i32* %op68
	ld.d $t0, $fp, -472
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -476
# %op70 = icmp slt i32 6, zeroinitializer
	addi.w $t0, $zero, 6
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -477
# %op71 = zext i1 %op70 to i32
	ld.b $t0, $fp, -477
	andi $t1, $t0, 1
	st.w $t1, $fp, -484
# %op72 = add i32 %op71, zeroinitializer
	ld.w $t0, $fp, -484
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -488
# %op73 = icmp ne i32 %op72, zeroinitializer
	ld.w $t0, $fp, -488
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -489
# br i1 %op73, label %label_arr_ltz162, label %label_arr_gtz163
# gen_phi
	ld.b $t0, $fp, -489
	bnez $t0, .param16_label_arr_ltz162
	b .param16_label_arr_gtz163
.param16_label_arr_ltz162:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz163
# gen_phi
	b .param16_label_arr_gtz163
.param16_label_arr_gtz163:
# %op74 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 6
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 6
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -504
# %op75 = load i32, i32* %op74
	ld.d $t0, $fp, -504
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -508
# %op76 = icmp slt i32 7, zeroinitializer
	addi.w $t0, $zero, 7
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -509
# %op77 = zext i1 %op76 to i32
	ld.b $t0, $fp, -509
	andi $t1, $t0, 1
	st.w $t1, $fp, -516
# %op78 = add i32 %op77, zeroinitializer
	ld.w $t0, $fp, -516
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -520
# %op79 = icmp ne i32 %op78, zeroinitializer
	ld.w $t0, $fp, -520
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -521
# br i1 %op79, label %label_arr_ltz164, label %label_arr_gtz165
# gen_phi
	ld.b $t0, $fp, -521
	bnez $t0, .param16_label_arr_ltz164
	b .param16_label_arr_gtz165
.param16_label_arr_ltz164:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz165
# gen_phi
	b .param16_label_arr_gtz165
.param16_label_arr_gtz165:
# %op80 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 7
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 7
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -536
# %op81 = load i32, i32* %op80
	ld.d $t0, $fp, -536
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -540
# %op82 = icmp slt i32 8, zeroinitializer
	addi.w $t0, $zero, 8
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -541
# %op83 = zext i1 %op82 to i32
	ld.b $t0, $fp, -541
	andi $t1, $t0, 1
	st.w $t1, $fp, -548
# %op84 = add i32 %op83, zeroinitializer
	ld.w $t0, $fp, -548
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -552
# %op85 = icmp ne i32 %op84, zeroinitializer
	ld.w $t0, $fp, -552
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -553
# br i1 %op85, label %label_arr_ltz166, label %label_arr_gtz167
# gen_phi
	ld.b $t0, $fp, -553
	bnez $t0, .param16_label_arr_ltz166
	b .param16_label_arr_gtz167
.param16_label_arr_ltz166:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz167
# gen_phi
	b .param16_label_arr_gtz167
.param16_label_arr_gtz167:
# %op86 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 8
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 8
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -568
# %op87 = load i32, i32* %op86
	ld.d $t0, $fp, -568
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -572
# %op88 = icmp slt i32 9, zeroinitializer
	addi.w $t0, $zero, 9
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -573
# %op89 = zext i1 %op88 to i32
	ld.b $t0, $fp, -573
	andi $t1, $t0, 1
	st.w $t1, $fp, -580
# %op90 = add i32 %op89, zeroinitializer
	ld.w $t0, $fp, -580
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -584
# %op91 = icmp ne i32 %op90, zeroinitializer
	ld.w $t0, $fp, -584
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -585
# br i1 %op91, label %label_arr_ltz168, label %label_arr_gtz169
# gen_phi
	ld.b $t0, $fp, -585
	bnez $t0, .param16_label_arr_ltz168
	b .param16_label_arr_gtz169
.param16_label_arr_ltz168:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz169
# gen_phi
	b .param16_label_arr_gtz169
.param16_label_arr_gtz169:
# %op92 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 9
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 9
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -600
# %op93 = load i32, i32* %op92
	ld.d $t0, $fp, -600
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -604
# %op94 = icmp slt i32 10, zeroinitializer
	addi.w $t0, $zero, 10
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -605
# %op95 = zext i1 %op94 to i32
	ld.b $t0, $fp, -605
	andi $t1, $t0, 1
	st.w $t1, $fp, -612
# %op96 = add i32 %op95, zeroinitializer
	ld.w $t0, $fp, -612
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -616
# %op97 = icmp ne i32 %op96, zeroinitializer
	ld.w $t0, $fp, -616
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -617
# br i1 %op97, label %label_arr_ltz170, label %label_arr_gtz171
# gen_phi
	ld.b $t0, $fp, -617
	bnez $t0, .param16_label_arr_ltz170
	b .param16_label_arr_gtz171
.param16_label_arr_ltz170:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz171
# gen_phi
	b .param16_label_arr_gtz171
.param16_label_arr_gtz171:
# %op98 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 10
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 10
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -632
# %op99 = load i32, i32* %op98
	ld.d $t0, $fp, -632
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -636
# %op100 = icmp slt i32 11, zeroinitializer
	addi.w $t0, $zero, 11
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -637
# %op101 = zext i1 %op100 to i32
	ld.b $t0, $fp, -637
	andi $t1, $t0, 1
	st.w $t1, $fp, -644
# %op102 = add i32 %op101, zeroinitializer
	ld.w $t0, $fp, -644
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -648
# %op103 = icmp ne i32 %op102, zeroinitializer
	ld.w $t0, $fp, -648
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -649
# br i1 %op103, label %label_arr_ltz172, label %label_arr_gtz173
# gen_phi
	ld.b $t0, $fp, -649
	bnez $t0, .param16_label_arr_ltz172
	b .param16_label_arr_gtz173
.param16_label_arr_ltz172:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz173
# gen_phi
	b .param16_label_arr_gtz173
.param16_label_arr_gtz173:
# %op104 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 11
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 11
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -664
# %op105 = load i32, i32* %op104
	ld.d $t0, $fp, -664
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -668
# %op106 = icmp slt i32 12, zeroinitializer
	addi.w $t0, $zero, 12
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -669
# %op107 = zext i1 %op106 to i32
	ld.b $t0, $fp, -669
	andi $t1, $t0, 1
	st.w $t1, $fp, -676
# %op108 = add i32 %op107, zeroinitializer
	ld.w $t0, $fp, -676
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -680
# %op109 = icmp ne i32 %op108, zeroinitializer
	ld.w $t0, $fp, -680
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -681
# br i1 %op109, label %label_arr_ltz174, label %label_arr_gtz175
# gen_phi
	ld.b $t0, $fp, -681
	bnez $t0, .param16_label_arr_ltz174
	b .param16_label_arr_gtz175
.param16_label_arr_ltz174:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz175
# gen_phi
	b .param16_label_arr_gtz175
.param16_label_arr_gtz175:
# %op110 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 12
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 12
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -696
# %op111 = load i32, i32* %op110
	ld.d $t0, $fp, -696
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -700
# %op112 = icmp slt i32 13, zeroinitializer
	addi.w $t0, $zero, 13
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -701
# %op113 = zext i1 %op112 to i32
	ld.b $t0, $fp, -701
	andi $t1, $t0, 1
	st.w $t1, $fp, -708
# %op114 = add i32 %op113, zeroinitializer
	ld.w $t0, $fp, -708
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -712
# %op115 = icmp ne i32 %op114, zeroinitializer
	ld.w $t0, $fp, -712
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -713
# br i1 %op115, label %label_arr_ltz176, label %label_arr_gtz177
# gen_phi
	ld.b $t0, $fp, -713
	bnez $t0, .param16_label_arr_ltz176
	b .param16_label_arr_gtz177
.param16_label_arr_ltz176:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz177
# gen_phi
	b .param16_label_arr_gtz177
.param16_label_arr_gtz177:
# %op116 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 13
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 13
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -728
# %op117 = load i32, i32* %op116
	ld.d $t0, $fp, -728
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -732
# %op118 = icmp slt i32 14, zeroinitializer
	addi.w $t0, $zero, 14
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -733
# %op119 = zext i1 %op118 to i32
	ld.b $t0, $fp, -733
	andi $t1, $t0, 1
	st.w $t1, $fp, -740
# %op120 = add i32 %op119, zeroinitializer
	ld.w $t0, $fp, -740
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -744
# %op121 = icmp ne i32 %op120, zeroinitializer
	ld.w $t0, $fp, -744
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -745
# br i1 %op121, label %label_arr_ltz178, label %label_arr_gtz179
# gen_phi
	ld.b $t0, $fp, -745
	bnez $t0, .param16_label_arr_ltz178
	b .param16_label_arr_gtz179
.param16_label_arr_ltz178:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz179
# gen_phi
	b .param16_label_arr_gtz179
.param16_label_arr_gtz179:
# %op122 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 14
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 14
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -760
# %op123 = load i32, i32* %op122
	ld.d $t0, $fp, -760
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -764
# %op124 = icmp slt i32 15, zeroinitializer
	addi.w $t0, $zero, 15
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -765
# %op125 = zext i1 %op124 to i32
	ld.b $t0, $fp, -765
	andi $t1, $t0, 1
	st.w $t1, $fp, -772
# %op126 = add i32 %op125, zeroinitializer
	ld.w $t0, $fp, -772
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -776
# %op127 = icmp ne i32 %op126, zeroinitializer
	ld.w $t0, $fp, -776
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -777
# br i1 %op127, label %label_arr_ltz180, label %label_arr_gtz181
# gen_phi
	ld.b $t0, $fp, -777
	bnez $t0, .param16_label_arr_ltz180
	b .param16_label_arr_gtz181
.param16_label_arr_ltz180:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz181
# gen_phi
	b .param16_label_arr_gtz181
.param16_label_arr_gtz181:
# %op128 = getelementptr [16 x i32], [16 x i32]* %op16, i32 0, i32 15
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 15
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -792
# %op129 = load i32, i32* %op128
	ld.d $t0, $fp, -792
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -796
# %op130 = call i32 @param32_rec(i32 %op39, i32 %op45, i32 %op51, i32 %op57, i32 %op63, i32 %op69, i32 %op75, i32 %op81, i32 %op87, i32 %op93, i32 %op99, i32 %op105, i32 %op111, i32 %op117, i32 %op123, i32 %op129, i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3, i32 %arg4, i32 %arg5, i32 %arg6, i32 %arg7, i32 %arg8, i32 %arg9, i32 %arg10, i32 %arg11, i32 %arg12, i32 %arg13, i32 %arg14, i32 %arg15)
	ld.w $t0, $fp, -316
	addi.d $t1, $sp, -20
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -348
	addi.d $t1, $sp, -24
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -380
	addi.d $t1, $sp, -28
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -412
	addi.d $t1, $sp, -32
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -444
	addi.d $t1, $sp, -36
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -476
	addi.d $t1, $sp, -40
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -508
	addi.d $t1, $sp, -44
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -540
	addi.d $t1, $sp, -48
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -572
	addi.d $t1, $sp, -52
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -604
	addi.d $t1, $sp, -56
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -636
	addi.d $t1, $sp, -60
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -668
	addi.d $t1, $sp, -64
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -700
	addi.d $t1, $sp, -68
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -732
	addi.d $t1, $sp, -72
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -764
	addi.d $t1, $sp, -76
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -796
	addi.d $t1, $sp, -80
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -20
	addi.d $t1, $sp, -84
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -24
	addi.d $t1, $sp, -88
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -28
	addi.d $t1, $sp, -92
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -32
	addi.d $t1, $sp, -96
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -36
	addi.d $t1, $sp, -100
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -40
	addi.d $t1, $sp, -104
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -44
	addi.d $t1, $sp, -108
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -48
	addi.d $t1, $sp, -112
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -52
	addi.d $t1, $sp, -116
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -56
	addi.d $t1, $sp, -120
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -60
	addi.d $t1, $sp, -124
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -64
	addi.d $t1, $sp, -128
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -68
	addi.d $t1, $sp, -132
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -72
	addi.d $t1, $sp, -136
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -76
	addi.d $t1, $sp, -140
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -80
	addi.d $t1, $sp, -144
	st.w $t0, $t1, 0
	bl param32_rec
	st.w $a0, $fp, -800
# ret i32 %op130
# gen_phi
	ld.w $a0, $fp, -800
	b .param16_exit
.param16_exit:
	addi.d $sp, $sp, 800
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -1584
.main_label_entry:
# %op0 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -20
# %op1 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -24
# %op2 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -28
# %op3 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -32
# %op4 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -36
# %op5 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -40
# %op6 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -44
# %op7 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -48
# %op8 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -52
# %op9 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -56
# %op10 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -60
# %op11 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -64
# %op12 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -68
# %op13 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -72
# %op14 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -76
# %op15 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -80
# %op16 = call i32 @param16(i32 %op0, i32 %op1, i32 %op2, i32 %op3, i32 %op4, i32 %op5, i32 %op6, i32 %op7, i32 %op8, i32 %op9, i32 %op10, i32 %op11, i32 %op12, i32 %op13, i32 %op14, i32 %op15)
	ld.w $t0, $fp, -20
	addi.d $t1, $sp, -20
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -24
	addi.d $t1, $sp, -24
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -28
	addi.d $t1, $sp, -28
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -32
	addi.d $t1, $sp, -32
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -36
	addi.d $t1, $sp, -36
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -40
	addi.d $t1, $sp, -40
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -44
	addi.d $t1, $sp, -44
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -48
	addi.d $t1, $sp, -48
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -52
	addi.d $t1, $sp, -52
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -56
	addi.d $t1, $sp, -56
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -60
	addi.d $t1, $sp, -60
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -64
	addi.d $t1, $sp, -64
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -68
	addi.d $t1, $sp, -68
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -72
	addi.d $t1, $sp, -72
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -76
	addi.d $t1, $sp, -76
	st.w $t0, $t1, 0
	ld.w $t0, $fp, -80
	addi.d $t1, $sp, -80
	st.w $t0, $t1, 0
	bl param16
	st.w $a0, $fp, -84
# %op17 = alloca [32 x [2 x i32]]
	addi.d $t0, $zero, -96
	addi.d $t0, $t0, -256
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -96
# %op18 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 0, i32 0
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -360
# store i32 %op16, i32* %op18
	ld.d $t0, $fp, -360
	ld.w $t1, $fp, -84
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_condition182
# gen_phi
	addi.w $t0, $zero, 1
	st.w $t0, $fp, -364
	b .main_label_condition182
.main_label_condition182:
# %op19 = phi i32 [ 1, %label_entry ], [ %op65, %label_arr_gtz192 ]
# %op20 = icmp slt i32 %op19, 32
	ld.w $t0, $fp, -364
	addi.w $t1, $zero, 32
	slt $t2, $t0, $t1
	st.b $t2, $fp, -365
# %op21 = zext i1 %op20 to i32
	ld.b $t0, $fp, -365
	andi $t1, $t0, 1
	st.w $t1, $fp, -372
# %op22 = icmp sgt i32 %op21, zeroinitializer
	ld.w $t0, $fp, -372
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -373
# br i1 %op22, label %label_loop183, label %label_ret184
# gen_phi
	ld.b $t0, $fp, -373
	bnez $t0, .main_label_loop183
	b .main_label_ret184
.main_label_loop183:
# %op23 = icmp slt i32 %op19, zeroinitializer
	ld.w $t0, $fp, -364
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -374
# %op24 = zext i1 %op23 to i32
	ld.b $t0, $fp, -374
	andi $t1, $t0, 1
	st.w $t1, $fp, -380
# %op25 = add i32 %op24, zeroinitializer
	ld.w $t0, $fp, -380
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -384
# %op26 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -385
# %op27 = zext i1 %op26 to i32
	ld.b $t0, $fp, -385
	andi $t1, $t0, 1
	st.w $t1, $fp, -392
# %op28 = add i32 %op27, %op25
	ld.w $t0, $fp, -392
	ld.w $t1, $fp, -384
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -396
# %op29 = icmp ne i32 %op28, zeroinitializer
	ld.w $t0, $fp, -396
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -397
# br i1 %op29, label %label_arr_ltz185, label %label_arr_gtz186
# gen_phi
	ld.b $t0, $fp, -397
	bnez $t0, .main_label_arr_ltz185
	b .main_label_arr_gtz186
.main_label_ret184:
# %op30 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -398
# %op31 = zext i1 %op30 to i32
	ld.b $t0, $fp, -398
	andi $t1, $t0, 1
	st.w $t1, $fp, -404
# %op32 = add i32 %op31, zeroinitializer
	ld.w $t0, $fp, -404
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -408
# %op33 = icmp ne i32 %op32, zeroinitializer
	ld.w $t0, $fp, -408
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -409
# br i1 %op33, label %label_arr_ltz193, label %label_arr_gtz194
# gen_phi
	ld.b $t0, $fp, -409
	bnez $t0, .main_label_arr_ltz193
	b .main_label_arr_gtz194
.main_label_arr_ltz185:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz186
# gen_phi
	b .main_label_arr_gtz186
.main_label_arr_gtz186:
# %op34 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 %op19, i32 0
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	ld.w $t1, $fp, -364
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -424
# %op35 = sub i32 %op19, 1
	ld.w $t0, $fp, -364
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -428
# %op36 = icmp slt i32 %op35, zeroinitializer
	ld.w $t0, $fp, -428
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -429
# %op37 = zext i1 %op36 to i32
	ld.b $t0, $fp, -429
	andi $t1, $t0, 1
	st.w $t1, $fp, -436
# %op38 = add i32 %op37, zeroinitializer
	ld.w $t0, $fp, -436
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -440
# %op39 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -441
# %op40 = zext i1 %op39 to i32
	ld.b $t0, $fp, -441
	andi $t1, $t0, 1
	st.w $t1, $fp, -448
# %op41 = add i32 %op40, %op38
	ld.w $t0, $fp, -448
	ld.w $t1, $fp, -440
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -452
# %op42 = icmp ne i32 %op41, zeroinitializer
	ld.w $t0, $fp, -452
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -453
# br i1 %op42, label %label_arr_ltz187, label %label_arr_gtz188
# gen_phi
	ld.b $t0, $fp, -453
	bnez $t0, .main_label_arr_ltz187
	b .main_label_arr_gtz188
.main_label_arr_ltz187:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz188
# gen_phi
	b .main_label_arr_gtz188
.main_label_arr_gtz188:
# %op43 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 %op35, i32 1
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	ld.w $t1, $fp, -428
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -464
# %op44 = load i32, i32* %op43
	ld.d $t0, $fp, -464
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -468
# %op45 = sub i32 %op44, 1
	ld.w $t0, $fp, -468
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -472
# store i32 %op45, i32* %op34
	ld.d $t0, $fp, -424
	ld.w $t1, $fp, -472
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op46 = icmp slt i32 %op19, zeroinitializer
	ld.w $t0, $fp, -364
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -473
# %op47 = zext i1 %op46 to i32
	ld.b $t0, $fp, -473
	andi $t1, $t0, 1
	st.w $t1, $fp, -480
# %op48 = add i32 %op47, zeroinitializer
	ld.w $t0, $fp, -480
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -484
# %op49 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -485
# %op50 = zext i1 %op49 to i32
	ld.b $t0, $fp, -485
	andi $t1, $t0, 1
	st.w $t1, $fp, -492
# %op51 = add i32 %op50, %op48
	ld.w $t0, $fp, -492
	ld.w $t1, $fp, -484
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -496
# %op52 = icmp ne i32 %op51, zeroinitializer
	ld.w $t0, $fp, -496
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -497
# br i1 %op52, label %label_arr_ltz189, label %label_arr_gtz190
# gen_phi
	ld.b $t0, $fp, -497
	bnez $t0, .main_label_arr_ltz189
	b .main_label_arr_gtz190
.main_label_arr_ltz189:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz190
# gen_phi
	b .main_label_arr_gtz190
.main_label_arr_gtz190:
# %op53 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 %op19, i32 1
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	ld.w $t1, $fp, -364
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -512
# %op54 = sub i32 %op19, 1
	ld.w $t0, $fp, -364
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -516
# %op55 = icmp slt i32 %op54, zeroinitializer
	ld.w $t0, $fp, -516
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -517
# %op56 = zext i1 %op55 to i32
	ld.b $t0, $fp, -517
	andi $t1, $t0, 1
	st.w $t1, $fp, -524
# %op57 = add i32 %op56, zeroinitializer
	ld.w $t0, $fp, -524
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -528
# %op58 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -529
# %op59 = zext i1 %op58 to i32
	ld.b $t0, $fp, -529
	andi $t1, $t0, 1
	st.w $t1, $fp, -536
# %op60 = add i32 %op59, %op57
	ld.w $t0, $fp, -536
	ld.w $t1, $fp, -528
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -540
# %op61 = icmp ne i32 %op60, zeroinitializer
	ld.w $t0, $fp, -540
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -541
# br i1 %op61, label %label_arr_ltz191, label %label_arr_gtz192
# gen_phi
	ld.b $t0, $fp, -541
	bnez $t0, .main_label_arr_ltz191
	b .main_label_arr_gtz192
.main_label_arr_ltz191:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz192
# gen_phi
	b .main_label_arr_gtz192
.main_label_arr_gtz192:
# %op62 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 %op54, i32 0
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	ld.w $t1, $fp, -516
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -552
# %op63 = load i32, i32* %op62
	ld.d $t0, $fp, -552
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -556
# %op64 = sub i32 %op63, 2
	ld.w $t0, $fp, -556
	addi.w $t1, $zero, 2
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -560
# store i32 %op64, i32* %op53
	ld.d $t0, $fp, -512
	ld.w $t1, $fp, -560
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op65 = add i32 %op19, 1
	ld.w $t0, $fp, -364
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -564
# br label %label_condition182
# gen_phi
	ld.w $t0, $fp, -564
	st.w $t0, $fp, -364
	b .main_label_condition182
.main_label_arr_ltz193:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz194
# gen_phi
	b .main_label_arr_gtz194
.main_label_arr_gtz194:
# %op66 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 0
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -576
# %op67 = getelementptr [2 x i32], [2 x i32]* %op66, i32 0, i32 0
	ld.d $t0, $fp, -576
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -584
# %op68 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -585
# %op69 = zext i1 %op68 to i32
	ld.b $t0, $fp, -585
	andi $t1, $t0, 1
	st.w $t1, $fp, -592
# %op70 = add i32 %op69, zeroinitializer
	ld.w $t0, $fp, -592
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -596
# %op71 = icmp ne i32 %op70, zeroinitializer
	ld.w $t0, $fp, -596
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -597
# br i1 %op71, label %label_arr_ltz195, label %label_arr_gtz196
# gen_phi
	ld.b $t0, $fp, -597
	bnez $t0, .main_label_arr_ltz195
	b .main_label_arr_gtz196
.main_label_arr_ltz195:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz196
# gen_phi
	b .main_label_arr_gtz196
.main_label_arr_gtz196:
# %op72 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 1
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -608
# %op73 = getelementptr [2 x i32], [2 x i32]* %op72, i32 0, i32 0
	ld.d $t0, $fp, -608
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -616
# %op74 = icmp slt i32 2, zeroinitializer
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -617
# %op75 = zext i1 %op74 to i32
	ld.b $t0, $fp, -617
	andi $t1, $t0, 1
	st.w $t1, $fp, -624
# %op76 = add i32 %op75, zeroinitializer
	ld.w $t0, $fp, -624
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -628
# %op77 = icmp ne i32 %op76, zeroinitializer
	ld.w $t0, $fp, -628
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -629
# br i1 %op77, label %label_arr_ltz197, label %label_arr_gtz198
# gen_phi
	ld.b $t0, $fp, -629
	bnez $t0, .main_label_arr_ltz197
	b .main_label_arr_gtz198
.main_label_arr_ltz197:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz198
# gen_phi
	b .main_label_arr_gtz198
.main_label_arr_gtz198:
# %op78 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 2
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 2
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -640
# %op79 = getelementptr [2 x i32], [2 x i32]* %op78, i32 0, i32 0
	ld.d $t0, $fp, -640
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -648
# %op80 = icmp slt i32 3, zeroinitializer
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -649
# %op81 = zext i1 %op80 to i32
	ld.b $t0, $fp, -649
	andi $t1, $t0, 1
	st.w $t1, $fp, -656
# %op82 = add i32 %op81, zeroinitializer
	ld.w $t0, $fp, -656
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -660
# %op83 = icmp ne i32 %op82, zeroinitializer
	ld.w $t0, $fp, -660
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -661
# br i1 %op83, label %label_arr_ltz199, label %label_arr_gtz200
# gen_phi
	ld.b $t0, $fp, -661
	bnez $t0, .main_label_arr_ltz199
	b .main_label_arr_gtz200
.main_label_arr_ltz199:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz200
# gen_phi
	b .main_label_arr_gtz200
.main_label_arr_gtz200:
# %op84 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 3
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 3
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -672
# %op85 = getelementptr [2 x i32], [2 x i32]* %op84, i32 0, i32 0
	ld.d $t0, $fp, -672
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -680
# %op86 = icmp slt i32 4, zeroinitializer
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -681
# %op87 = zext i1 %op86 to i32
	ld.b $t0, $fp, -681
	andi $t1, $t0, 1
	st.w $t1, $fp, -688
# %op88 = add i32 %op87, zeroinitializer
	ld.w $t0, $fp, -688
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -692
# %op89 = icmp ne i32 %op88, zeroinitializer
	ld.w $t0, $fp, -692
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -693
# br i1 %op89, label %label_arr_ltz201, label %label_arr_gtz202
# gen_phi
	ld.b $t0, $fp, -693
	bnez $t0, .main_label_arr_ltz201
	b .main_label_arr_gtz202
.main_label_arr_ltz201:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz202
# gen_phi
	b .main_label_arr_gtz202
.main_label_arr_gtz202:
# %op90 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 4
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -704
# %op91 = getelementptr [2 x i32], [2 x i32]* %op90, i32 0, i32 0
	ld.d $t0, $fp, -704
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -712
# %op92 = icmp slt i32 5, zeroinitializer
	addi.w $t0, $zero, 5
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -713
# %op93 = zext i1 %op92 to i32
	ld.b $t0, $fp, -713
	andi $t1, $t0, 1
	st.w $t1, $fp, -720
# %op94 = add i32 %op93, zeroinitializer
	ld.w $t0, $fp, -720
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -724
# %op95 = icmp ne i32 %op94, zeroinitializer
	ld.w $t0, $fp, -724
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -725
# br i1 %op95, label %label_arr_ltz203, label %label_arr_gtz204
# gen_phi
	ld.b $t0, $fp, -725
	bnez $t0, .main_label_arr_ltz203
	b .main_label_arr_gtz204
.main_label_arr_ltz203:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz204
# gen_phi
	b .main_label_arr_gtz204
.main_label_arr_gtz204:
# %op96 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 5
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 5
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -736
# %op97 = getelementptr [2 x i32], [2 x i32]* %op96, i32 0, i32 0
	ld.d $t0, $fp, -736
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -744
# %op98 = icmp slt i32 6, zeroinitializer
	addi.w $t0, $zero, 6
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -745
# %op99 = zext i1 %op98 to i32
	ld.b $t0, $fp, -745
	andi $t1, $t0, 1
	st.w $t1, $fp, -752
# %op100 = add i32 %op99, zeroinitializer
	ld.w $t0, $fp, -752
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -756
# %op101 = icmp ne i32 %op100, zeroinitializer
	ld.w $t0, $fp, -756
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -757
# br i1 %op101, label %label_arr_ltz205, label %label_arr_gtz206
# gen_phi
	ld.b $t0, $fp, -757
	bnez $t0, .main_label_arr_ltz205
	b .main_label_arr_gtz206
.main_label_arr_ltz205:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz206
# gen_phi
	b .main_label_arr_gtz206
.main_label_arr_gtz206:
# %op102 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 6
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 6
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -768
# %op103 = getelementptr [2 x i32], [2 x i32]* %op102, i32 0, i32 0
	ld.d $t0, $fp, -768
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -776
# %op104 = icmp slt i32 7, zeroinitializer
	addi.w $t0, $zero, 7
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -777
# %op105 = zext i1 %op104 to i32
	ld.b $t0, $fp, -777
	andi $t1, $t0, 1
	st.w $t1, $fp, -784
# %op106 = add i32 %op105, zeroinitializer
	ld.w $t0, $fp, -784
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -788
# %op107 = icmp ne i32 %op106, zeroinitializer
	ld.w $t0, $fp, -788
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -789
# br i1 %op107, label %label_arr_ltz207, label %label_arr_gtz208
# gen_phi
	ld.b $t0, $fp, -789
	bnez $t0, .main_label_arr_ltz207
	b .main_label_arr_gtz208
.main_label_arr_ltz207:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz208
# gen_phi
	b .main_label_arr_gtz208
.main_label_arr_gtz208:
# %op108 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 7
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 7
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -800
# %op109 = getelementptr [2 x i32], [2 x i32]* %op108, i32 0, i32 0
	ld.d $t0, $fp, -800
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -808
# %op110 = icmp slt i32 8, zeroinitializer
	addi.w $t0, $zero, 8
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -809
# %op111 = zext i1 %op110 to i32
	ld.b $t0, $fp, -809
	andi $t1, $t0, 1
	st.w $t1, $fp, -816
# %op112 = add i32 %op111, zeroinitializer
	ld.w $t0, $fp, -816
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -820
# %op113 = icmp ne i32 %op112, zeroinitializer
	ld.w $t0, $fp, -820
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -821
# br i1 %op113, label %label_arr_ltz209, label %label_arr_gtz210
# gen_phi
	ld.b $t0, $fp, -821
	bnez $t0, .main_label_arr_ltz209
	b .main_label_arr_gtz210
.main_label_arr_ltz209:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz210
# gen_phi
	b .main_label_arr_gtz210
.main_label_arr_gtz210:
# %op114 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 8
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 8
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -832
# %op115 = getelementptr [2 x i32], [2 x i32]* %op114, i32 0, i32 0
	ld.d $t0, $fp, -832
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -840
# %op116 = icmp slt i32 9, zeroinitializer
	addi.w $t0, $zero, 9
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -841
# %op117 = zext i1 %op116 to i32
	ld.b $t0, $fp, -841
	andi $t1, $t0, 1
	st.w $t1, $fp, -848
# %op118 = add i32 %op117, zeroinitializer
	ld.w $t0, $fp, -848
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -852
# %op119 = icmp ne i32 %op118, zeroinitializer
	ld.w $t0, $fp, -852
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -853
# br i1 %op119, label %label_arr_ltz211, label %label_arr_gtz212
# gen_phi
	ld.b $t0, $fp, -853
	bnez $t0, .main_label_arr_ltz211
	b .main_label_arr_gtz212
.main_label_arr_ltz211:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz212
# gen_phi
	b .main_label_arr_gtz212
.main_label_arr_gtz212:
# %op120 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 9
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 9
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -864
# %op121 = getelementptr [2 x i32], [2 x i32]* %op120, i32 0, i32 0
	ld.d $t0, $fp, -864
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -872
# %op122 = icmp slt i32 10, zeroinitializer
	addi.w $t0, $zero, 10
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -873
# %op123 = zext i1 %op122 to i32
	ld.b $t0, $fp, -873
	andi $t1, $t0, 1
	st.w $t1, $fp, -880
# %op124 = add i32 %op123, zeroinitializer
	ld.w $t0, $fp, -880
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -884
# %op125 = icmp ne i32 %op124, zeroinitializer
	ld.w $t0, $fp, -884
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -885
# br i1 %op125, label %label_arr_ltz213, label %label_arr_gtz214
# gen_phi
	ld.b $t0, $fp, -885
	bnez $t0, .main_label_arr_ltz213
	b .main_label_arr_gtz214
.main_label_arr_ltz213:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz214
# gen_phi
	b .main_label_arr_gtz214
.main_label_arr_gtz214:
# %op126 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 10
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 10
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -896
# %op127 = getelementptr [2 x i32], [2 x i32]* %op126, i32 0, i32 0
	ld.d $t0, $fp, -896
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -904
# %op128 = icmp slt i32 11, zeroinitializer
	addi.w $t0, $zero, 11
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -905
# %op129 = zext i1 %op128 to i32
	ld.b $t0, $fp, -905
	andi $t1, $t0, 1
	st.w $t1, $fp, -912
# %op130 = add i32 %op129, zeroinitializer
	ld.w $t0, $fp, -912
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -916
# %op131 = icmp ne i32 %op130, zeroinitializer
	ld.w $t0, $fp, -916
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -917
# br i1 %op131, label %label_arr_ltz215, label %label_arr_gtz216
# gen_phi
	ld.b $t0, $fp, -917
	bnez $t0, .main_label_arr_ltz215
	b .main_label_arr_gtz216
.main_label_arr_ltz215:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz216
# gen_phi
	b .main_label_arr_gtz216
.main_label_arr_gtz216:
# %op132 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 11
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 11
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -928
# %op133 = getelementptr [2 x i32], [2 x i32]* %op132, i32 0, i32 0
	ld.d $t0, $fp, -928
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -936
# %op134 = icmp slt i32 12, zeroinitializer
	addi.w $t0, $zero, 12
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -937
# %op135 = zext i1 %op134 to i32
	ld.b $t0, $fp, -937
	andi $t1, $t0, 1
	st.w $t1, $fp, -944
# %op136 = add i32 %op135, zeroinitializer
	ld.w $t0, $fp, -944
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -948
# %op137 = icmp ne i32 %op136, zeroinitializer
	ld.w $t0, $fp, -948
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -949
# br i1 %op137, label %label_arr_ltz217, label %label_arr_gtz218
# gen_phi
	ld.b $t0, $fp, -949
	bnez $t0, .main_label_arr_ltz217
	b .main_label_arr_gtz218
.main_label_arr_ltz217:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz218
# gen_phi
	b .main_label_arr_gtz218
.main_label_arr_gtz218:
# %op138 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 12
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 12
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -960
# %op139 = getelementptr [2 x i32], [2 x i32]* %op138, i32 0, i32 0
	ld.d $t0, $fp, -960
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -968
# %op140 = icmp slt i32 13, zeroinitializer
	addi.w $t0, $zero, 13
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -969
# %op141 = zext i1 %op140 to i32
	ld.b $t0, $fp, -969
	andi $t1, $t0, 1
	st.w $t1, $fp, -976
# %op142 = add i32 %op141, zeroinitializer
	ld.w $t0, $fp, -976
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -980
# %op143 = icmp ne i32 %op142, zeroinitializer
	ld.w $t0, $fp, -980
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -981
# br i1 %op143, label %label_arr_ltz219, label %label_arr_gtz220
# gen_phi
	ld.b $t0, $fp, -981
	bnez $t0, .main_label_arr_ltz219
	b .main_label_arr_gtz220
.main_label_arr_ltz219:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz220
# gen_phi
	b .main_label_arr_gtz220
.main_label_arr_gtz220:
# %op144 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 13
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 13
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -992
# %op145 = getelementptr [2 x i32], [2 x i32]* %op144, i32 0, i32 0
	ld.d $t0, $fp, -992
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1000
# %op146 = icmp slt i32 14, zeroinitializer
	addi.w $t0, $zero, 14
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1001
# %op147 = zext i1 %op146 to i32
	ld.b $t0, $fp, -1001
	andi $t1, $t0, 1
	st.w $t1, $fp, -1008
# %op148 = add i32 %op147, zeroinitializer
	ld.w $t0, $fp, -1008
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1012
# %op149 = icmp ne i32 %op148, zeroinitializer
	ld.w $t0, $fp, -1012
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1013
# br i1 %op149, label %label_arr_ltz221, label %label_arr_gtz222
# gen_phi
	ld.b $t0, $fp, -1013
	bnez $t0, .main_label_arr_ltz221
	b .main_label_arr_gtz222
.main_label_arr_ltz221:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz222
# gen_phi
	b .main_label_arr_gtz222
.main_label_arr_gtz222:
# %op150 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 14
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 14
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1024
# %op151 = getelementptr [2 x i32], [2 x i32]* %op150, i32 0, i32 0
	ld.d $t0, $fp, -1024
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1032
# %op152 = icmp slt i32 15, zeroinitializer
	addi.w $t0, $zero, 15
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1033
# %op153 = zext i1 %op152 to i32
	ld.b $t0, $fp, -1033
	andi $t1, $t0, 1
	st.w $t1, $fp, -1040
# %op154 = add i32 %op153, zeroinitializer
	ld.w $t0, $fp, -1040
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1044
# %op155 = icmp ne i32 %op154, zeroinitializer
	ld.w $t0, $fp, -1044
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1045
# br i1 %op155, label %label_arr_ltz223, label %label_arr_gtz224
# gen_phi
	ld.b $t0, $fp, -1045
	bnez $t0, .main_label_arr_ltz223
	b .main_label_arr_gtz224
.main_label_arr_ltz223:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz224
# gen_phi
	b .main_label_arr_gtz224
.main_label_arr_gtz224:
# %op156 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 15
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 15
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1056
# %op157 = getelementptr [2 x i32], [2 x i32]* %op156, i32 0, i32 0
	ld.d $t0, $fp, -1056
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1064
# %op158 = icmp slt i32 16, zeroinitializer
	addi.w $t0, $zero, 16
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1065
# %op159 = zext i1 %op158 to i32
	ld.b $t0, $fp, -1065
	andi $t1, $t0, 1
	st.w $t1, $fp, -1072
# %op160 = add i32 %op159, zeroinitializer
	ld.w $t0, $fp, -1072
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1076
# %op161 = icmp ne i32 %op160, zeroinitializer
	ld.w $t0, $fp, -1076
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1077
# br i1 %op161, label %label_arr_ltz225, label %label_arr_gtz226
# gen_phi
	ld.b $t0, $fp, -1077
	bnez $t0, .main_label_arr_ltz225
	b .main_label_arr_gtz226
.main_label_arr_ltz225:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz226
# gen_phi
	b .main_label_arr_gtz226
.main_label_arr_gtz226:
# %op162 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 16
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 16
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1088
# %op163 = getelementptr [2 x i32], [2 x i32]* %op162, i32 0, i32 0
	ld.d $t0, $fp, -1088
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1096
# %op164 = icmp slt i32 17, zeroinitializer
	addi.w $t0, $zero, 17
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1097
# %op165 = zext i1 %op164 to i32
	ld.b $t0, $fp, -1097
	andi $t1, $t0, 1
	st.w $t1, $fp, -1104
# %op166 = add i32 %op165, zeroinitializer
	ld.w $t0, $fp, -1104
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1108
# %op167 = icmp ne i32 %op166, zeroinitializer
	ld.w $t0, $fp, -1108
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1109
# br i1 %op167, label %label_arr_ltz227, label %label_arr_gtz228
# gen_phi
	ld.b $t0, $fp, -1109
	bnez $t0, .main_label_arr_ltz227
	b .main_label_arr_gtz228
.main_label_arr_ltz227:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz228
# gen_phi
	b .main_label_arr_gtz228
.main_label_arr_gtz228:
# %op168 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 17
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 17
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1120
# %op169 = getelementptr [2 x i32], [2 x i32]* %op168, i32 0, i32 0
	ld.d $t0, $fp, -1120
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1128
# %op170 = icmp slt i32 18, zeroinitializer
	addi.w $t0, $zero, 18
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1129
# %op171 = zext i1 %op170 to i32
	ld.b $t0, $fp, -1129
	andi $t1, $t0, 1
	st.w $t1, $fp, -1136
# %op172 = add i32 %op171, zeroinitializer
	ld.w $t0, $fp, -1136
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1140
# %op173 = icmp ne i32 %op172, zeroinitializer
	ld.w $t0, $fp, -1140
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1141
# br i1 %op173, label %label_arr_ltz229, label %label_arr_gtz230
# gen_phi
	ld.b $t0, $fp, -1141
	bnez $t0, .main_label_arr_ltz229
	b .main_label_arr_gtz230
.main_label_arr_ltz229:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz230
# gen_phi
	b .main_label_arr_gtz230
.main_label_arr_gtz230:
# %op174 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 18
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 18
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1152
# %op175 = getelementptr [2 x i32], [2 x i32]* %op174, i32 0, i32 0
	ld.d $t0, $fp, -1152
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1160
# %op176 = icmp slt i32 19, zeroinitializer
	addi.w $t0, $zero, 19
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1161
# %op177 = zext i1 %op176 to i32
	ld.b $t0, $fp, -1161
	andi $t1, $t0, 1
	st.w $t1, $fp, -1168
# %op178 = add i32 %op177, zeroinitializer
	ld.w $t0, $fp, -1168
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1172
# %op179 = icmp ne i32 %op178, zeroinitializer
	ld.w $t0, $fp, -1172
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1173
# br i1 %op179, label %label_arr_ltz231, label %label_arr_gtz232
# gen_phi
	ld.b $t0, $fp, -1173
	bnez $t0, .main_label_arr_ltz231
	b .main_label_arr_gtz232
.main_label_arr_ltz231:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz232
# gen_phi
	b .main_label_arr_gtz232
.main_label_arr_gtz232:
# %op180 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 19
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 19
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1184
# %op181 = getelementptr [2 x i32], [2 x i32]* %op180, i32 0, i32 0
	ld.d $t0, $fp, -1184
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1192
# %op182 = icmp slt i32 20, zeroinitializer
	addi.w $t0, $zero, 20
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1193
# %op183 = zext i1 %op182 to i32
	ld.b $t0, $fp, -1193
	andi $t1, $t0, 1
	st.w $t1, $fp, -1200
# %op184 = add i32 %op183, zeroinitializer
	ld.w $t0, $fp, -1200
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1204
# %op185 = icmp ne i32 %op184, zeroinitializer
	ld.w $t0, $fp, -1204
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1205
# br i1 %op185, label %label_arr_ltz233, label %label_arr_gtz234
# gen_phi
	ld.b $t0, $fp, -1205
	bnez $t0, .main_label_arr_ltz233
	b .main_label_arr_gtz234
.main_label_arr_ltz233:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz234
# gen_phi
	b .main_label_arr_gtz234
.main_label_arr_gtz234:
# %op186 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 20
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 20
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1216
# %op187 = getelementptr [2 x i32], [2 x i32]* %op186, i32 0, i32 0
	ld.d $t0, $fp, -1216
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1224
# %op188 = icmp slt i32 21, zeroinitializer
	addi.w $t0, $zero, 21
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1225
# %op189 = zext i1 %op188 to i32
	ld.b $t0, $fp, -1225
	andi $t1, $t0, 1
	st.w $t1, $fp, -1232
# %op190 = add i32 %op189, zeroinitializer
	ld.w $t0, $fp, -1232
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1236
# %op191 = icmp ne i32 %op190, zeroinitializer
	ld.w $t0, $fp, -1236
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1237
# br i1 %op191, label %label_arr_ltz235, label %label_arr_gtz236
# gen_phi
	ld.b $t0, $fp, -1237
	bnez $t0, .main_label_arr_ltz235
	b .main_label_arr_gtz236
.main_label_arr_ltz235:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz236
# gen_phi
	b .main_label_arr_gtz236
.main_label_arr_gtz236:
# %op192 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 21
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 21
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1248
# %op193 = getelementptr [2 x i32], [2 x i32]* %op192, i32 0, i32 0
	ld.d $t0, $fp, -1248
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1256
# %op194 = icmp slt i32 22, zeroinitializer
	addi.w $t0, $zero, 22
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1257
# %op195 = zext i1 %op194 to i32
	ld.b $t0, $fp, -1257
	andi $t1, $t0, 1
	st.w $t1, $fp, -1264
# %op196 = add i32 %op195, zeroinitializer
	ld.w $t0, $fp, -1264
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1268
# %op197 = icmp ne i32 %op196, zeroinitializer
	ld.w $t0, $fp, -1268
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1269
# br i1 %op197, label %label_arr_ltz237, label %label_arr_gtz238
# gen_phi
	ld.b $t0, $fp, -1269
	bnez $t0, .main_label_arr_ltz237
	b .main_label_arr_gtz238
.main_label_arr_ltz237:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz238
# gen_phi
	b .main_label_arr_gtz238
.main_label_arr_gtz238:
# %op198 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 22
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 22
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1280
# %op199 = getelementptr [2 x i32], [2 x i32]* %op198, i32 0, i32 0
	ld.d $t0, $fp, -1280
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1288
# %op200 = icmp slt i32 23, zeroinitializer
	addi.w $t0, $zero, 23
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1289
# %op201 = zext i1 %op200 to i32
	ld.b $t0, $fp, -1289
	andi $t1, $t0, 1
	st.w $t1, $fp, -1296
# %op202 = add i32 %op201, zeroinitializer
	ld.w $t0, $fp, -1296
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1300
# %op203 = icmp ne i32 %op202, zeroinitializer
	ld.w $t0, $fp, -1300
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1301
# br i1 %op203, label %label_arr_ltz239, label %label_arr_gtz240
# gen_phi
	ld.b $t0, $fp, -1301
	bnez $t0, .main_label_arr_ltz239
	b .main_label_arr_gtz240
.main_label_arr_ltz239:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz240
# gen_phi
	b .main_label_arr_gtz240
.main_label_arr_gtz240:
# %op204 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 23
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 23
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1312
# %op205 = getelementptr [2 x i32], [2 x i32]* %op204, i32 0, i32 0
	ld.d $t0, $fp, -1312
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1320
# %op206 = icmp slt i32 24, zeroinitializer
	addi.w $t0, $zero, 24
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1321
# %op207 = zext i1 %op206 to i32
	ld.b $t0, $fp, -1321
	andi $t1, $t0, 1
	st.w $t1, $fp, -1328
# %op208 = add i32 %op207, zeroinitializer
	ld.w $t0, $fp, -1328
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1332
# %op209 = icmp ne i32 %op208, zeroinitializer
	ld.w $t0, $fp, -1332
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1333
# br i1 %op209, label %label_arr_ltz241, label %label_arr_gtz242
# gen_phi
	ld.b $t0, $fp, -1333
	bnez $t0, .main_label_arr_ltz241
	b .main_label_arr_gtz242
.main_label_arr_ltz241:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz242
# gen_phi
	b .main_label_arr_gtz242
.main_label_arr_gtz242:
# %op210 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 24
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 24
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1344
# %op211 = getelementptr [2 x i32], [2 x i32]* %op210, i32 0, i32 0
	ld.d $t0, $fp, -1344
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1352
# %op212 = icmp slt i32 25, zeroinitializer
	addi.w $t0, $zero, 25
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1353
# %op213 = zext i1 %op212 to i32
	ld.b $t0, $fp, -1353
	andi $t1, $t0, 1
	st.w $t1, $fp, -1360
# %op214 = add i32 %op213, zeroinitializer
	ld.w $t0, $fp, -1360
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1364
# %op215 = icmp ne i32 %op214, zeroinitializer
	ld.w $t0, $fp, -1364
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1365
# br i1 %op215, label %label_arr_ltz243, label %label_arr_gtz244
# gen_phi
	ld.b $t0, $fp, -1365
	bnez $t0, .main_label_arr_ltz243
	b .main_label_arr_gtz244
.main_label_arr_ltz243:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz244
# gen_phi
	b .main_label_arr_gtz244
.main_label_arr_gtz244:
# %op216 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 25
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 25
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1376
# %op217 = getelementptr [2 x i32], [2 x i32]* %op216, i32 0, i32 0
	ld.d $t0, $fp, -1376
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1384
# %op218 = icmp slt i32 26, zeroinitializer
	addi.w $t0, $zero, 26
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1385
# %op219 = zext i1 %op218 to i32
	ld.b $t0, $fp, -1385
	andi $t1, $t0, 1
	st.w $t1, $fp, -1392
# %op220 = add i32 %op219, zeroinitializer
	ld.w $t0, $fp, -1392
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1396
# %op221 = icmp ne i32 %op220, zeroinitializer
	ld.w $t0, $fp, -1396
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1397
# br i1 %op221, label %label_arr_ltz245, label %label_arr_gtz246
# gen_phi
	ld.b $t0, $fp, -1397
	bnez $t0, .main_label_arr_ltz245
	b .main_label_arr_gtz246
.main_label_arr_ltz245:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz246
# gen_phi
	b .main_label_arr_gtz246
.main_label_arr_gtz246:
# %op222 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 26
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 26
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1408
# %op223 = getelementptr [2 x i32], [2 x i32]* %op222, i32 0, i32 0
	ld.d $t0, $fp, -1408
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1416
# %op224 = icmp slt i32 27, zeroinitializer
	addi.w $t0, $zero, 27
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1417
# %op225 = zext i1 %op224 to i32
	ld.b $t0, $fp, -1417
	andi $t1, $t0, 1
	st.w $t1, $fp, -1424
# %op226 = add i32 %op225, zeroinitializer
	ld.w $t0, $fp, -1424
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1428
# %op227 = icmp ne i32 %op226, zeroinitializer
	ld.w $t0, $fp, -1428
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1429
# br i1 %op227, label %label_arr_ltz247, label %label_arr_gtz248
# gen_phi
	ld.b $t0, $fp, -1429
	bnez $t0, .main_label_arr_ltz247
	b .main_label_arr_gtz248
.main_label_arr_ltz247:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz248
# gen_phi
	b .main_label_arr_gtz248
.main_label_arr_gtz248:
# %op228 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 27
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 27
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1440
# %op229 = getelementptr [2 x i32], [2 x i32]* %op228, i32 0, i32 0
	ld.d $t0, $fp, -1440
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1448
# %op230 = icmp slt i32 28, zeroinitializer
	addi.w $t0, $zero, 28
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1449
# %op231 = zext i1 %op230 to i32
	ld.b $t0, $fp, -1449
	andi $t1, $t0, 1
	st.w $t1, $fp, -1456
# %op232 = add i32 %op231, zeroinitializer
	ld.w $t0, $fp, -1456
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1460
# %op233 = icmp ne i32 %op232, zeroinitializer
	ld.w $t0, $fp, -1460
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1461
# br i1 %op233, label %label_arr_ltz249, label %label_arr_gtz250
# gen_phi
	ld.b $t0, $fp, -1461
	bnez $t0, .main_label_arr_ltz249
	b .main_label_arr_gtz250
.main_label_arr_ltz249:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz250
# gen_phi
	b .main_label_arr_gtz250
.main_label_arr_gtz250:
# %op234 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 28
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 28
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1472
# %op235 = getelementptr [2 x i32], [2 x i32]* %op234, i32 0, i32 0
	ld.d $t0, $fp, -1472
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1480
# %op236 = icmp slt i32 29, zeroinitializer
	addi.w $t0, $zero, 29
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1481
# %op237 = zext i1 %op236 to i32
	ld.b $t0, $fp, -1481
	andi $t1, $t0, 1
	st.w $t1, $fp, -1488
# %op238 = add i32 %op237, zeroinitializer
	ld.w $t0, $fp, -1488
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1492
# %op239 = icmp ne i32 %op238, zeroinitializer
	ld.w $t0, $fp, -1492
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1493
# br i1 %op239, label %label_arr_ltz251, label %label_arr_gtz252
# gen_phi
	ld.b $t0, $fp, -1493
	bnez $t0, .main_label_arr_ltz251
	b .main_label_arr_gtz252
.main_label_arr_ltz251:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz252
# gen_phi
	b .main_label_arr_gtz252
.main_label_arr_gtz252:
# %op240 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 29
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 29
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1504
# %op241 = getelementptr [2 x i32], [2 x i32]* %op240, i32 0, i32 0
	ld.d $t0, $fp, -1504
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1512
# %op242 = icmp slt i32 30, zeroinitializer
	addi.w $t0, $zero, 30
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1513
# %op243 = zext i1 %op242 to i32
	ld.b $t0, $fp, -1513
	andi $t1, $t0, 1
	st.w $t1, $fp, -1520
# %op244 = add i32 %op243, zeroinitializer
	ld.w $t0, $fp, -1520
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1524
# %op245 = icmp ne i32 %op244, zeroinitializer
	ld.w $t0, $fp, -1524
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1525
# br i1 %op245, label %label_arr_ltz253, label %label_arr_gtz254
# gen_phi
	ld.b $t0, $fp, -1525
	bnez $t0, .main_label_arr_ltz253
	b .main_label_arr_gtz254
.main_label_arr_ltz253:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz254
# gen_phi
	b .main_label_arr_gtz254
.main_label_arr_gtz254:
# %op246 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 30
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 30
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1536
# %op247 = getelementptr [2 x i32], [2 x i32]* %op246, i32 0, i32 0
	ld.d $t0, $fp, -1536
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1544
# %op248 = icmp slt i32 31, zeroinitializer
	addi.w $t0, $zero, 31
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1545
# %op249 = zext i1 %op248 to i32
	ld.b $t0, $fp, -1545
	andi $t1, $t0, 1
	st.w $t1, $fp, -1552
# %op250 = add i32 %op249, zeroinitializer
	ld.w $t0, $fp, -1552
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1556
# %op251 = icmp ne i32 %op250, zeroinitializer
	ld.w $t0, $fp, -1556
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1557
# br i1 %op251, label %label_arr_ltz255, label %label_arr_gtz256
# gen_phi
	ld.b $t0, $fp, -1557
	bnez $t0, .main_label_arr_ltz255
	b .main_label_arr_gtz256
.main_label_arr_ltz255:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz256
# gen_phi
	b .main_label_arr_gtz256
.main_label_arr_gtz256:
# %op252 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op17, i32 0, i32 31
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 256
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 31
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1568
# %op253 = getelementptr [2 x i32], [2 x i32]* %op252, i32 0, i32 0
	ld.d $t0, $fp, -1568
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1576
# %op254 = call i32 @param32_arr(i32* %op67, i32* %op73, i32* %op79, i32* %op85, i32* %op91, i32* %op97, i32* %op103, i32* %op109, i32* %op115, i32* %op121, i32* %op127, i32* %op133, i32* %op139, i32* %op145, i32* %op151, i32* %op157, i32* %op163, i32* %op169, i32* %op175, i32* %op181, i32* %op187, i32* %op193, i32* %op199, i32* %op205, i32* %op211, i32* %op217, i32* %op223, i32* %op229, i32* %op235, i32* %op241, i32* %op247, i32* %op253)
	ld.d $t0, $fp, -584
	addi.d $t1, $sp, -24
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -616
	addi.d $t1, $sp, -32
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -648
	addi.d $t1, $sp, -40
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -680
	addi.d $t1, $sp, -48
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -712
	addi.d $t1, $sp, -56
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -744
	addi.d $t1, $sp, -64
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -776
	addi.d $t1, $sp, -72
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -808
	addi.d $t1, $sp, -80
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -840
	addi.d $t1, $sp, -88
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -872
	addi.d $t1, $sp, -96
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -904
	addi.d $t1, $sp, -104
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -936
	addi.d $t1, $sp, -112
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -968
	addi.d $t1, $sp, -120
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -1000
	addi.d $t1, $sp, -128
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -1032
	addi.d $t1, $sp, -136
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -1064
	addi.d $t1, $sp, -144
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -1096
	addi.d $t1, $sp, -152
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -1128
	addi.d $t1, $sp, -160
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -1160
	addi.d $t1, $sp, -168
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -1192
	addi.d $t1, $sp, -176
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -1224
	addi.d $t1, $sp, -184
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -1256
	addi.d $t1, $sp, -192
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -1288
	addi.d $t1, $sp, -200
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -1320
	addi.d $t1, $sp, -208
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -1352
	addi.d $t1, $sp, -216
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -1384
	addi.d $t1, $sp, -224
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -1416
	addi.d $t1, $sp, -232
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -1448
	addi.d $t1, $sp, -240
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -1480
	addi.d $t1, $sp, -248
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -1512
	addi.d $t1, $sp, -256
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -1544
	addi.d $t1, $sp, -264
	st.d $t0, $t1, 0
	ld.d $t0, $fp, -1576
	addi.d $t1, $sp, -272
	st.d $t0, $t1, 0
	bl param32_arr
	st.w $a0, $fp, -1580
# call void @putint(i32 %op254)
	ld.w $a0, $fp, -1580
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# ret i32 0
# gen_phi
	addi.w $a0, $zero, 0
	b .main_exit
.main_exit:
	addi.d $sp, $sp, 1584
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
