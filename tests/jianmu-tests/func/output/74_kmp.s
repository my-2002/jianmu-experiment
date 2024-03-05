	.text
	.globl get_next
	.type get_next, @function
get_next:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -256
	st.d $a0, $fp, -24
	st.d $a1, $fp, -32
.get_next_label_entry:
# %op2 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -33
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -33
	andi $t1, $t0, 1
	st.w $t1, $fp, -40
# %op4 = add i32 %op3, zeroinitializer
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -44
# %op5 = icmp ne i32 %op4, zeroinitializer
	ld.w $t0, $fp, -44
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -45
# br i1 %op5, label %label_next_ltz0, label %label_next_gtz1
# gen_phi
	ld.b $t0, $fp, -45
	bnez $t0, .get_next_label_next_ltz0
	b .get_next_label_next_gtz1
.get_next_label_next_ltz0:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_next_gtz1
# gen_phi
	b .get_next_label_next_gtz1
.get_next_label_next_gtz1:
# %op6 = getelementptr i32, i32* %arg1, i32 0
	ld.d $t0, $fp, -32
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -56
# store i32 -1, i32* %op6
	ld.d $t0, $fp, -56
	addi.w $t1, $zero, -1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_condition2
# gen_phi
	addi.w $t0, $zero, -1
	st.w $t0, $fp, -60
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -64
	b .get_next_label_condition2
.get_next_label_condition2:
# %op7 = phi i32 [ -1, %label_next_gtz1 ], [ %op51, %label_ret20 ]
# %op8 = phi i32 [ 0, %label_next_gtz1 ], [ %op52, %label_ret20 ]
# %op9 = icmp slt i32 %op8, zeroinitializer
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -65
# %op10 = zext i1 %op9 to i32
	ld.b $t0, $fp, -65
	andi $t1, $t0, 1
	st.w $t1, $fp, -72
# %op11 = add i32 %op10, zeroinitializer
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# %op12 = icmp ne i32 %op11, zeroinitializer
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -77
# br i1 %op12, label %label_str_ltz5, label %label_str_gtz6
# gen_phi
	ld.b $t0, $fp, -77
	bnez $t0, .get_next_label_str_ltz5
	b .get_next_label_str_gtz6
.get_next_label_loop3:
# %op13 = icmp eq i32 %op7, -1
	ld.w $t0, $fp, -60
	addi.w $t1, $zero, -1
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -78
# %op14 = zext i1 %op13 to i32
	ld.b $t0, $fp, -78
	andi $t1, $t0, 1
	st.w $t1, $fp, -84
# %op15 = icmp sgt i32 %op14, zeroinitializer
	ld.w $t0, $fp, -84
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -85
# br i1 %op15, label %label_true7, label %label_false8
# gen_phi
	ld.b $t0, $fp, -85
	bnez $t0, .get_next_label_true7
	b .get_next_label_false8
.get_next_label_ret4:
# ret void
# gen_phi
	addi.w $a0, $zero, 0
	b .get_next_exit
.get_next_label_str_ltz5:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_str_gtz6
# gen_phi
	b .get_next_label_str_gtz6
.get_next_label_str_gtz6:
# %op16 = getelementptr i32, i32* %arg0, i32 %op8
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -64
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -96
# %op17 = load i32, i32* %op16
	ld.d $t0, $fp, -96
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -100
# %op18 = icmp sgt i32 %op17, zeroinitializer
	ld.w $t0, $fp, -100
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -101
# br i1 %op18, label %label_loop3, label %label_ret4
# gen_phi
	ld.b $t0, $fp, -101
	bnez $t0, .get_next_label_loop3
	b .get_next_label_ret4
.get_next_label_true7:
# %op19 = icmp sgt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -102
# br label %label_ret9
# gen_phi
	ld.b $t0, $fp, -102
	st.b $t0, $fp, -114
	b .get_next_label_ret9
.get_next_label_false8:
# %op20 = icmp slt i32 %op8, zeroinitializer
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -103
# %op21 = zext i1 %op20 to i32
	ld.b $t0, $fp, -103
	andi $t1, $t0, 1
	st.w $t1, $fp, -108
# %op22 = add i32 %op21, zeroinitializer
	ld.w $t0, $fp, -108
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -112
# %op23 = icmp ne i32 %op22, zeroinitializer
	ld.w $t0, $fp, -112
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -113
# br i1 %op23, label %label_str_ltz10, label %label_str_gtz11
# gen_phi
	ld.b $t0, $fp, -113
	bnez $t0, .get_next_label_str_ltz10
	b .get_next_label_str_gtz11
.get_next_label_ret9:
# %op24 = phi i1 [ %op19, %label_true7 ], [ %op37, %label_str_gtz13 ]
# %op25 = zext i1 %op24 to i32
	ld.b $t0, $fp, -114
	andi $t1, $t0, 1
	st.w $t1, $fp, -120
# %op26 = icmp sgt i32 %op25, zeroinitializer
	ld.w $t0, $fp, -120
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -121
# br i1 %op26, label %label_true14, label %label_false15
# gen_phi
	ld.b $t0, $fp, -121
	bnez $t0, .get_next_label_true14
	b .get_next_label_false15
.get_next_label_str_ltz10:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_str_gtz11
# gen_phi
	b .get_next_label_str_gtz11
.get_next_label_str_gtz11:
# %op27 = getelementptr i32, i32* %arg0, i32 %op8
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -64
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -136
# %op28 = load i32, i32* %op27
	ld.d $t0, $fp, -136
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -140
# %op29 = icmp slt i32 %op7, zeroinitializer
	ld.w $t0, $fp, -60
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -141
# %op30 = zext i1 %op29 to i32
	ld.b $t0, $fp, -141
	andi $t1, $t0, 1
	st.w $t1, $fp, -148
# %op31 = add i32 %op30, zeroinitializer
	ld.w $t0, $fp, -148
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -152
# %op32 = icmp ne i32 %op31, zeroinitializer
	ld.w $t0, $fp, -152
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -153
# br i1 %op32, label %label_str_ltz12, label %label_str_gtz13
# gen_phi
	ld.b $t0, $fp, -153
	bnez $t0, .get_next_label_str_ltz12
	b .get_next_label_str_gtz13
.get_next_label_str_ltz12:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_str_gtz13
# gen_phi
	b .get_next_label_str_gtz13
.get_next_label_str_gtz13:
# %op33 = getelementptr i32, i32* %arg0, i32 %op7
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -60
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -168
# %op34 = load i32, i32* %op33
	ld.d $t0, $fp, -168
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -172
# %op35 = icmp eq i32 %op28, %op34
	ld.w $t0, $fp, -140
	ld.w $t1, $fp, -172
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -173
# %op36 = zext i1 %op35 to i32
	ld.b $t0, $fp, -173
	andi $t1, $t0, 1
	st.w $t1, $fp, -180
# %op37 = icmp sgt i32 %op36, zeroinitializer
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -181
# br label %label_ret9
# gen_phi
	ld.b $t0, $fp, -181
	st.b $t0, $fp, -114
	b .get_next_label_ret9
.get_next_label_true14:
# %op38 = add i32 %op7, 1
	ld.w $t0, $fp, -60
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -188
# %op39 = add i32 %op8, 1
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -192
# %op40 = icmp slt i32 %op39, zeroinitializer
	ld.w $t0, $fp, -192
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -193
# %op41 = zext i1 %op40 to i32
	ld.b $t0, $fp, -193
	andi $t1, $t0, 1
	st.w $t1, $fp, -200
# %op42 = add i32 %op41, zeroinitializer
	ld.w $t0, $fp, -200
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -204
# %op43 = icmp ne i32 %op42, zeroinitializer
	ld.w $t0, $fp, -204
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -205
# br i1 %op43, label %label_next_ltz16, label %label_next_gtz17
# gen_phi
	ld.b $t0, $fp, -205
	bnez $t0, .get_next_label_next_ltz16
	b .get_next_label_next_gtz17
.get_next_label_false15:
# %op44 = icmp slt i32 %op7, zeroinitializer
	ld.w $t0, $fp, -60
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -206
# %op45 = zext i1 %op44 to i32
	ld.b $t0, $fp, -206
	andi $t1, $t0, 1
	st.w $t1, $fp, -212
# %op46 = add i32 %op45, zeroinitializer
	ld.w $t0, $fp, -212
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -216
# %op47 = icmp ne i32 %op46, zeroinitializer
	ld.w $t0, $fp, -216
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -217
# br i1 %op47, label %label_next_ltz18, label %label_next_gtz19
# gen_phi
	ld.b $t0, $fp, -217
	bnez $t0, .get_next_label_next_ltz18
	b .get_next_label_next_gtz19
.get_next_label_next_ltz16:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_next_gtz17
# gen_phi
	b .get_next_label_next_gtz17
.get_next_label_next_gtz17:
# %op48 = getelementptr i32, i32* %arg1, i32 %op39
	ld.d $t0, $fp, -32
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -192
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -232
# store i32 %op38, i32* %op48
	ld.d $t0, $fp, -232
	ld.w $t1, $fp, -188
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_ret20
# gen_phi
	ld.w $t0, $fp, -188
	st.w $t0, $fp, -248
	ld.w $t0, $fp, -192
	st.w $t0, $fp, -252
	b .get_next_label_ret20
.get_next_label_next_ltz18:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_next_gtz19
# gen_phi
	b .get_next_label_next_gtz19
.get_next_label_next_gtz19:
# %op49 = getelementptr i32, i32* %arg1, i32 %op7
	ld.d $t0, $fp, -32
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -60
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -240
# %op50 = load i32, i32* %op49
	ld.d $t0, $fp, -240
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -244
# br label %label_ret20
# gen_phi
	ld.w $t0, $fp, -244
	st.w $t0, $fp, -248
	ld.w $t0, $fp, -64
	st.w $t0, $fp, -252
	b .get_next_label_ret20
.get_next_label_ret20:
# %op51 = phi i32 [ %op38, %label_next_gtz17 ], [ %op50, %label_next_gtz19 ]
# %op52 = phi i32 [ %op39, %label_next_gtz17 ], [ %op8, %label_next_gtz19 ]
# br label %label_condition2
# gen_phi
	ld.w $t0, $fp, -248
	st.w $t0, $fp, -60
	ld.w $t0, $fp, -252
	st.w $t0, $fp, -64
	b .get_next_label_condition2
.get_next_exit:
	addi.d $sp, $sp, 256
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl KMP
	.type KMP, @function
KMP:
	lu12i.w $t0, 4
	ori $t0, $t0, 272
	lu32i.d $t0, 0
	lu52i.d $t0, $t0, 0
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	sub.d $sp, $sp, $t0
	add.d $fp, $sp, $t0
	st.d $a0, $fp, -24
	st.d $a1, $fp, -32
.KMP_label_entry:
# %op2 = alloca [4096 x i32]
	addi.d $t0, $zero, -40
	lu12i.w $t1, 4
	ori $t1, $t1, 0
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	sub.d $t0, $t0, $t1
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -40
# %op3 = getelementptr [4096 x i32], [4096 x i32]* %op2, i32 0, i32 0
	ld.d $t0, $fp, -40
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 4048
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# call void @get_next(i32* %arg0, i32* %op3)
	ld.d $a0, $fp, -24
	lu12i.w $a1, -5
	ori $a1, $a1, 4048
	lu32i.d $a1, -1
	lu52i.d $a1, $a1, -1
	add.d $a1, $fp, $a1
	ld.d $a1, $a1, 0
	bl get_next
# br label %label_condition21
# gen_phi
	addi.w $t0, $zero, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 4044
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	addi.w $t0, $zero, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 4040
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .KMP_label_condition21
.KMP_label_condition21:
# %op4 = phi i32 [ 0, %label_entry ], [ %op52, %label_ret40 ]
# %op5 = phi i32 [ 0, %label_entry ], [ %op53, %label_ret40 ]
# %op6 = icmp slt i32 %op4, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 4044
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 4039
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op7 = zext i1 %op6 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 4039
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 4032
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op8 = add i32 %op7, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 4032
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 4028
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op9 = icmp ne i32 %op8, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 4028
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -5
	ori $t8, $t8, 4027
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op9, label %label_src_ltz24, label %label_src_gtz25
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 4027
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_src_ltz24
	b .KMP_label_src_gtz25
.KMP_label_loop22:
# %op10 = icmp slt i32 %op5, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 4040
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 4026
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op11 = zext i1 %op10 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 4026
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 4020
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op12 = add i32 %op11, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 4020
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 4016
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op13 = icmp ne i32 %op12, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 4016
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -5
	ori $t8, $t8, 4015
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op13, label %label_dst_ltz26, label %label_dst_gtz27
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 4015
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_dst_ltz26
	b .KMP_label_dst_gtz27
.KMP_label_ret23:
# ret i32 -1
# gen_phi
	addi.w $a0, $zero, -1
	b .KMP_exit
.KMP_label_src_ltz24:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_src_gtz25
# gen_phi
	b .KMP_label_src_gtz25
.KMP_label_src_gtz25:
# %op14 = getelementptr i32, i32* %arg1, i32 %op4
	ld.d $t0, $fp, -32
	addi.w $t2, $zero, 4
	lu12i.w $t1, -5
	ori $t1, $t1, 4044
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 4000
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op15 = load i32, i32* %op14
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3996
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op16 = icmp sgt i32 %op15, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3996
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -5
	ori $t8, $t8, 3995
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op16, label %label_loop22, label %label_ret23
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 3995
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_loop22
	b .KMP_label_ret23
.KMP_label_dst_ltz26:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_dst_gtz27
# gen_phi
	b .KMP_label_dst_gtz27
.KMP_label_dst_gtz27:
# %op17 = getelementptr i32, i32* %arg0, i32 %op5
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	lu12i.w $t1, -5
	ori $t1, $t1, 4040
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3984
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op18 = load i32, i32* %op17
	lu12i.w $t0, -5
	ori $t0, $t0, 3984
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3980
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op19 = icmp slt i32 %op4, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 4044
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3979
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op20 = zext i1 %op19 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3979
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3972
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op21 = add i32 %op20, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3972
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3968
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op22 = icmp ne i32 %op21, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3968
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -5
	ori $t8, $t8, 3967
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op22, label %label_src_ltz28, label %label_src_gtz29
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 3967
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_src_ltz28
	b .KMP_label_src_gtz29
.KMP_label_src_ltz28:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_src_gtz29
# gen_phi
	b .KMP_label_src_gtz29
.KMP_label_src_gtz29:
# %op23 = getelementptr i32, i32* %arg1, i32 %op4
	ld.d $t0, $fp, -32
	addi.w $t2, $zero, 4
	lu12i.w $t1, -5
	ori $t1, $t1, 4044
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3952
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op24 = load i32, i32* %op23
	lu12i.w $t0, -5
	ori $t0, $t0, 3952
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3948
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op25 = icmp eq i32 %op18, %op24
	lu12i.w $t0, -5
	ori $t0, $t0, 3980
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -5
	ori $t1, $t1, 3948
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3947
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op26 = zext i1 %op25 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3947
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3940
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op27 = icmp sgt i32 %op26, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3940
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -5
	ori $t8, $t8, 3939
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op27, label %label_true30, label %label_false31
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 3939
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_true30
	b .KMP_label_false31
.KMP_label_true30:
# %op28 = add i32 %op5, 1
	lu12i.w $t0, -5
	ori $t0, $t0, 4040
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3932
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op29 = add i32 %op4, 1
	lu12i.w $t0, -5
	ori $t0, $t0, 4044
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3928
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op30 = icmp slt i32 %op28, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3932
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3927
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op31 = zext i1 %op30 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3927
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3920
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op32 = add i32 %op31, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3920
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3916
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op33 = icmp ne i32 %op32, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3916
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -5
	ori $t8, $t8, 3915
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op33, label %label_dst_ltz32, label %label_dst_gtz33
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 3915
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_dst_ltz32
	b .KMP_label_dst_gtz33
.KMP_label_false31:
# %op34 = icmp slt i32 %op5, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 4040
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3914
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op35 = zext i1 %op34 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3914
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3908
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op36 = add i32 %op35, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3908
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3904
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op37 = icmp ne i32 %op36, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3904
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -5
	ori $t8, $t8, 3903
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op37, label %label_next_ltz36, label %label_next_gtz37
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 3903
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_next_ltz36
	b .KMP_label_next_gtz37
.KMP_label_dst_ltz32:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_dst_gtz33
# gen_phi
	b .KMP_label_dst_gtz33
.KMP_label_dst_gtz33:
# %op38 = getelementptr i32, i32* %arg0, i32 %op28
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	lu12i.w $t1, -5
	ori $t1, $t1, 3932
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3888
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op39 = load i32, i32* %op38
	lu12i.w $t0, -5
	ori $t0, $t0, 3888
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3884
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op40 = icmp sle i32 %op39, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3884
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	xori $t2, $t2, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3883
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op41 = zext i1 %op40 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3883
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3876
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op42 = icmp sgt i32 %op41, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3876
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -5
	ori $t8, $t8, 3875
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op42, label %label_true34, label %label_ret35
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 3875
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_true34
	b .KMP_label_ret35
.KMP_label_true34:
# ret i32 %op29
# gen_phi
	lu12i.w $a0, -5
	ori $a0, $a0, 3928
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.w $a0, $a0, 0
	b .KMP_exit
.KMP_label_ret35:
# br label %label_ret40
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 3928
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3828
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	lu12i.w $t0, -5
	ori $t0, $t0, 3932
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3824
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .KMP_label_ret40
.KMP_label_next_ltz36:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_next_gtz37
# gen_phi
	b .KMP_label_next_gtz37
.KMP_label_next_gtz37:
# %op43 = getelementptr [4096 x i32], [4096 x i32]* %op2, i32 0, i32 %op5
	ld.d $t0, $fp, -40
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, -5
	ori $t1, $t1, 4040
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3864
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op44 = load i32, i32* %op43
	lu12i.w $t0, -5
	ori $t0, $t0, 3864
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3860
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op45 = icmp eq i32 %op44, -1
	lu12i.w $t0, -5
	ori $t0, $t0, 3860
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, -1
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3859
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op46 = zext i1 %op45 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3859
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3852
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op47 = icmp sgt i32 %op46, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3852
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -5
	ori $t8, $t8, 3851
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op47, label %label_true38, label %label_ret39
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 4044
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3836
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	lu12i.w $t0, -5
	ori $t0, $t0, 3860
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3832
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	lu12i.w $t0, -5
	ori $t0, $t0, 3851
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_true38
	b .KMP_label_ret39
.KMP_label_true38:
# %op48 = add i32 %op44, 1
	lu12i.w $t0, -5
	ori $t0, $t0, 3860
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3844
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op49 = add i32 %op4, 1
	lu12i.w $t0, -5
	ori $t0, $t0, 4044
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3840
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# br label %label_ret39
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 3840
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3836
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	lu12i.w $t0, -5
	ori $t0, $t0, 3844
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3832
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .KMP_label_ret39
.KMP_label_ret39:
# %op50 = phi i32 [ %op4, %label_next_gtz37 ], [ %op49, %label_true38 ]
# %op51 = phi i32 [ %op44, %label_next_gtz37 ], [ %op48, %label_true38 ]
# br label %label_ret40
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 3836
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3828
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	lu12i.w $t0, -5
	ori $t0, $t0, 3832
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3824
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .KMP_label_ret40
.KMP_label_ret40:
# %op52 = phi i32 [ %op29, %label_ret35 ], [ %op50, %label_ret39 ]
# %op53 = phi i32 [ %op28, %label_ret35 ], [ %op51, %label_ret39 ]
# br label %label_condition21
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 3828
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 4044
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	lu12i.w $t0, -5
	ori $t0, $t0, 3824
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 4040
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .KMP_label_condition21
.KMP_exit:
	lu12i.w $t0, 4
	ori $t0, $t0, 272
	lu32i.d $t0, 0
	lu52i.d $t0, $t0, 0
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl read_str
	.type read_str, @function
read_str:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -128
	st.d $a0, $fp, -24
.read_str_label_entry:
# br label %label_condition41
# gen_phi
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -28
	b .read_str_label_condition41
.read_str_label_condition41:
# %op1 = phi i32 [ 0, %label_entry ], [ %op22, %label_ret49 ]
# %op2 = icmp sgt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -29
# br i1 %op2, label %label_loop42, label %label_ret43
# gen_phi
	ld.b $t0, $fp, -29
	bnez $t0, .read_str_label_loop42
	b .read_str_label_ret43
.read_str_label_loop42:
# %op3 = icmp slt i32 %op1, zeroinitializer
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -30
# %op4 = zext i1 %op3 to i32
	ld.b $t0, $fp, -30
	andi $t1, $t0, 1
	st.w $t1, $fp, -36
# %op5 = add i32 %op4, zeroinitializer
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -40
# %op6 = icmp ne i32 %op5, zeroinitializer
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -41
# br i1 %op6, label %label_buf_ltz44, label %label_buf_gtz45
# gen_phi
	ld.b $t0, $fp, -41
	bnez $t0, .read_str_label_buf_ltz44
	b .read_str_label_buf_gtz45
.read_str_label_ret43:
# %op7 = icmp slt i32 %op1, zeroinitializer
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -42
# %op8 = zext i1 %op7 to i32
	ld.b $t0, $fp, -42
	andi $t1, $t0, 1
	st.w $t1, $fp, -48
# %op9 = add i32 %op8, zeroinitializer
	ld.w $t0, $fp, -48
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# %op10 = icmp ne i32 %op9, zeroinitializer
	ld.w $t0, $fp, -52
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -53
# br i1 %op10, label %label_buf_ltz50, label %label_buf_gtz51
# gen_phi
	ld.b $t0, $fp, -53
	bnez $t0, .read_str_label_buf_ltz50
	b .read_str_label_buf_gtz51
.read_str_label_buf_ltz44:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_buf_gtz45
# gen_phi
	b .read_str_label_buf_gtz45
.read_str_label_buf_gtz45:
# %op11 = getelementptr i32, i32* %arg0, i32 %op1
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -28
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -64
# %op12 = call i32 @getch()
	bl getch
	st.w $a0, $fp, -68
# store i32 %op12, i32* %op11
	ld.d $t0, $fp, -64
	ld.w $t1, $fp, -68
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op13 = icmp slt i32 %op1, zeroinitializer
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -69
# %op14 = zext i1 %op13 to i32
	ld.b $t0, $fp, -69
	andi $t1, $t0, 1
	st.w $t1, $fp, -76
# %op15 = add i32 %op14, zeroinitializer
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -80
# %op16 = icmp ne i32 %op15, zeroinitializer
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -81
# br i1 %op16, label %label_buf_ltz46, label %label_buf_gtz47
# gen_phi
	ld.b $t0, $fp, -81
	bnez $t0, .read_str_label_buf_ltz46
	b .read_str_label_buf_gtz47
.read_str_label_buf_ltz46:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_buf_gtz47
# gen_phi
	b .read_str_label_buf_gtz47
.read_str_label_buf_gtz47:
# %op17 = getelementptr i32, i32* %arg0, i32 %op1
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -28
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -96
# %op18 = load i32, i32* %op17
	ld.d $t0, $fp, -96
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -100
# %op19 = icmp eq i32 %op18, 10
	ld.w $t0, $fp, -100
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -101
# %op20 = zext i1 %op19 to i32
	ld.b $t0, $fp, -101
	andi $t1, $t0, 1
	st.w $t1, $fp, -108
# %op21 = icmp sgt i32 %op20, zeroinitializer
	ld.w $t0, $fp, -108
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -109
# br i1 %op21, label %label_true48, label %label_ret49
# gen_phi
	ld.b $t0, $fp, -109
	bnez $t0, .read_str_label_true48
	b .read_str_label_ret49
.read_str_label_true48:
# br label %label_ret43
# gen_phi
	b .read_str_label_ret43
.read_str_label_ret49:
# %op22 = add i32 %op1, 1
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# br label %label_condition41
# gen_phi
	ld.w $t0, $fp, -116
	st.w $t0, $fp, -28
	b .read_str_label_condition41
.read_str_label_buf_ltz50:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_buf_gtz51
# gen_phi
	b .read_str_label_buf_gtz51
.read_str_label_buf_gtz51:
# %op23 = getelementptr i32, i32* %arg0, i32 %op1
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -28
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -128
# store i32 0, i32* %op23
	ld.d $t0, $fp, -128
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# ret i32 %op1
# gen_phi
	ld.w $a0, $fp, -28
	b .read_str_exit
.read_str_exit:
	addi.d $sp, $sp, 128
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	lu12i.w $t0, 8
	ori $t0, $t0, 96
	lu32i.d $t0, 0
	lu52i.d $t0, $t0, 0
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	sub.d $sp, $sp, $t0
	add.d $fp, $sp, $t0
.main_label_entry:
# %op0 = alloca [4096 x i32]
	addi.d $t0, $zero, -24
	lu12i.w $t1, 4
	ori $t1, $t1, 0
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	sub.d $t0, $t0, $t1
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -24
# %op1 = alloca [4096 x i32]
	lu12i.w $t0, -5
	ori $t0, $t0, 4064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	lu12i.w $t1, 4
	ori $t1, $t1, 0
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	sub.d $t0, $t0, $t1
	add.d $t0, $fp, $t0
	lu12i.w $t8, -5
	ori $t8, $t8, 4064
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op2 = getelementptr [4096 x i32], [4096 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -9
	ori $t8, $t8, 4056
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op3 = call i32 @read_str(i32* %op2)
	lu12i.w $a0, -9
	ori $a0, $a0, 4056
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.d $a0, $a0, 0
	bl read_str
	lu12i.w $t8, -9
	ori $t8, $t8, 4052
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $a0, $t8, 0
# %op4 = getelementptr [4096 x i32], [4096 x i32]* %op1, i32 0, i32 0
	lu12i.w $t0, -5
	ori $t0, $t0, 4064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -9
	ori $t8, $t8, 4040
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op5 = call i32 @read_str(i32* %op4)
	lu12i.w $a0, -9
	ori $a0, $a0, 4040
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.d $a0, $a0, 0
	bl read_str
	lu12i.w $t8, -9
	ori $t8, $t8, 4036
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $a0, $t8, 0
# %op6 = getelementptr [4096 x i32], [4096 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -9
	ori $t8, $t8, 4024
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op7 = getelementptr [4096 x i32], [4096 x i32]* %op1, i32 0, i32 0
	lu12i.w $t0, -5
	ori $t0, $t0, 4064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -9
	ori $t8, $t8, 4016
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op8 = call i32 @KMP(i32* %op6, i32* %op7)
	lu12i.w $a0, -9
	ori $a0, $a0, 4024
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.d $a0, $a0, 0
	lu12i.w $a1, -9
	ori $a1, $a1, 4016
	lu32i.d $a1, -1
	lu52i.d $a1, $a1, -1
	add.d $a1, $fp, $a1
	ld.d $a1, $a1, 0
	bl KMP
	lu12i.w $t8, -9
	ori $t8, $t8, 4012
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $a0, $t8, 0
# call void @putint(i32 %op8)
	lu12i.w $a0, -9
	ori $a0, $a0, 4012
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.w $a0, $a0, 0
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# ret i32 0
# gen_phi
	addi.w $a0, $zero, 0
	b .main_exit
.main_exit:
	lu12i.w $t0, 8
	ori $t0, $t0, 96
	lu32i.d $t0, 0
	lu52i.d $t0, $t0, 0
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
