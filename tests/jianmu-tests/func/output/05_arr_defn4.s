	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -528
.main_label_entry:
# %op0 = alloca [4 x [2 x i32]]
	lu12i.w $t0, -1
	ori $t0, $t0, 4072
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -32
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -24
# store [4 x [2 x i32]] [[2 x i32] zeroinitializer, [2 x i32] zeroinitializer, [2 x i32] zeroinitializer, [2 x i32] zeroinitializer], [4 x [2 x i32]]* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 2
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 2
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 2
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 2
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
# %op1 = alloca [4 x [2 x i32]]
	lu12i.w $t0, -1
	ori $t0, $t0, 4032
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -32
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -64
# store [4 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 4], [2 x i32] [i32 5, i32 6], [2 x i32] [i32 7, i32 8]], [4 x [2 x i32]]* %op1
	ld.d $t0, $fp, -64
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 7
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 8
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op2 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -97
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -97
	andi $t1, $t0, 1
	st.w $t1, $fp, -104
# %op4 = add i32 %op3, zeroinitializer
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -108
# %op5 = icmp slt i32 3, zeroinitializer
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -109
# %op6 = zext i1 %op5 to i32
	ld.b $t0, $fp, -109
	andi $t1, $t0, 1
	st.w $t1, $fp, -116
# %op7 = add i32 %op6, %op4
	ld.w $t0, $fp, -116
	ld.w $t1, $fp, -108
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -120
# %op8 = icmp ne i32 %op7, zeroinitializer
	ld.w $t0, $fp, -120
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -121
# br i1 %op8, label %label_a_ltz0, label %label_a_gtz1
# gen_phi
	ld.b $t0, $fp, -121
	bnez $t0, .main_label_a_ltz0
	b .main_label_a_gtz1
.main_label_a_ltz0:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a_gtz1
# gen_phi
	b .main_label_a_gtz1
.main_label_a_gtz1:
# %op9 = alloca [4 x [2 x i32]]
	lu12i.w $t0, -1
	ori $t0, $t0, 3960
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -32
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -136
# store [4 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 zeroinitializer], [2 x i32] [i32 5, i32 zeroinitializer], [2 x i32] [i32 7, i32 8]], [4 x [2 x i32]]* %op9
	ld.d $t0, $fp, -136
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 7
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 8
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op10 = icmp slt i32 2, zeroinitializer
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -169
# %op11 = zext i1 %op10 to i32
	ld.b $t0, $fp, -169
	andi $t1, $t0, 1
	st.w $t1, $fp, -176
# %op12 = add i32 %op11, zeroinitializer
	ld.w $t0, $fp, -176
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -180
# %op13 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -181
# %op14 = zext i1 %op13 to i32
	ld.b $t0, $fp, -181
	andi $t1, $t0, 1
	st.w $t1, $fp, -188
# %op15 = add i32 %op14, %op12
	ld.w $t0, $fp, -188
	ld.w $t1, $fp, -180
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -192
# %op16 = icmp ne i32 %op15, zeroinitializer
	ld.w $t0, $fp, -192
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -193
# br i1 %op16, label %label_d_ltz2, label %label_d_gtz3
# gen_phi
	ld.b $t0, $fp, -193
	bnez $t0, .main_label_d_ltz2
	b .main_label_d_gtz3
.main_label_d_ltz2:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_d_gtz3
# gen_phi
	b .main_label_d_gtz3
.main_label_d_gtz3:
# %op17 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op9, i32 0, i32 2, i32 1
	ld.d $t0, $fp, -136
	addi.w $t2, $zero, 32
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 2
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -208
# %op18 = load i32, i32* %op17
	ld.d $t0, $fp, -208
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -212
# %op19 = icmp slt i32 2, zeroinitializer
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -213
# %op20 = zext i1 %op19 to i32
	ld.b $t0, $fp, -213
	andi $t1, $t0, 1
	st.w $t1, $fp, -220
# %op21 = add i32 %op20, zeroinitializer
	ld.w $t0, $fp, -220
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -224
# %op22 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -225
# %op23 = zext i1 %op22 to i32
	ld.b $t0, $fp, -225
	andi $t1, $t0, 1
	st.w $t1, $fp, -232
# %op24 = add i32 %op23, %op21
	ld.w $t0, $fp, -232
	ld.w $t1, $fp, -224
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -236
# %op25 = icmp ne i32 %op24, zeroinitializer
	ld.w $t0, $fp, -236
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -237
# br i1 %op25, label %label_c_ltz4, label %label_c_gtz5
# gen_phi
	ld.b $t0, $fp, -237
	bnez $t0, .main_label_c_ltz4
	b .main_label_c_gtz5
.main_label_c_ltz4:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_c_gtz5
# gen_phi
	b .main_label_c_gtz5
.main_label_c_gtz5:
# %op26 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op1, i32 0, i32 2, i32 1
	ld.d $t0, $fp, -64
	addi.w $t2, $zero, 32
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 2
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -248
# %op27 = load i32, i32* %op26
	ld.d $t0, $fp, -248
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -252
# %op28 = alloca [4 x [2 x [1 x i32]]]
	lu12i.w $t0, -1
	ori $t0, $t0, 3832
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -32
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -264
# store [4 x [2 x [1 x i32]]] [[2 x [1 x i32]] [[1 x i32] [i32 zeroinitializer], [1 x i32] [i32 zeroinitializer]], [2 x [1 x i32]] [[1 x i32] [i32 3], [1 x i32] [i32 4]], [2 x [1 x i32]] [[1 x i32] [i32 5], [1 x i32] [i32 6]], [2 x [1 x i32]] [[1 x i32] [i32 7], [1 x i32] [i32 8]]], [4 x [2 x [1 x i32]]]* %op28
	ld.d $t0, $fp, -264
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 7
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 8
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op29 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op28, i32 0, i32 0, i32 1, i32 0
	ld.d $t0, $fp, -264
	addi.w $t2, $zero, 32
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -304
# store i32 %op27, i32* %op29
	ld.d $t0, $fp, -304
	ld.w $t1, $fp, -252
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op30 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op28, i32 0, i32 0, i32 2, i32 0
	ld.d $t0, $fp, -264
	addi.w $t2, $zero, 32
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 2
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -312
# store i32 %op18, i32* %op30
	ld.d $t0, $fp, -312
	ld.w $t1, $fp, -212
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op31 = icmp slt i32 3, zeroinitializer
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -313
# %op32 = zext i1 %op31 to i32
	ld.b $t0, $fp, -313
	andi $t1, $t0, 1
	st.w $t1, $fp, -320
# %op33 = add i32 %op32, zeroinitializer
	ld.w $t0, $fp, -320
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -324
# %op34 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -325
# %op35 = zext i1 %op34 to i32
	ld.b $t0, $fp, -325
	andi $t1, $t0, 1
	st.w $t1, $fp, -332
# %op36 = add i32 %op35, %op33
	ld.w $t0, $fp, -332
	ld.w $t1, $fp, -324
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -336
# %op37 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -337
# %op38 = zext i1 %op37 to i32
	ld.b $t0, $fp, -337
	andi $t1, $t0, 1
	st.w $t1, $fp, -344
# %op39 = add i32 %op38, %op36
	ld.w $t0, $fp, -344
	ld.w $t1, $fp, -336
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -348
# %op40 = icmp ne i32 %op39, zeroinitializer
	ld.w $t0, $fp, -348
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -349
# br i1 %op40, label %label_e_ltz6, label %label_e_gtz7
# gen_phi
	ld.b $t0, $fp, -349
	bnez $t0, .main_label_e_ltz6
	b .main_label_e_gtz7
.main_label_e_ltz6:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_e_gtz7
# gen_phi
	b .main_label_e_gtz7
.main_label_e_gtz7:
# %op41 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op28, i32 0, i32 3, i32 1, i32 0
	ld.d $t0, $fp, -264
	addi.w $t2, $zero, 32
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 3
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -360
# %op42 = load i32, i32* %op41
	ld.d $t0, $fp, -360
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -364
# %op43 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -365
# %op44 = zext i1 %op43 to i32
	ld.b $t0, $fp, -365
	andi $t1, $t0, 1
	st.w $t1, $fp, -372
# %op45 = add i32 %op44, zeroinitializer
	ld.w $t0, $fp, -372
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -376
# %op46 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -377
# %op47 = zext i1 %op46 to i32
	ld.b $t0, $fp, -377
	andi $t1, $t0, 1
	st.w $t1, $fp, -384
# %op48 = add i32 %op47, %op45
	ld.w $t0, $fp, -384
	ld.w $t1, $fp, -376
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -388
# %op49 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -389
# %op50 = zext i1 %op49 to i32
	ld.b $t0, $fp, -389
	andi $t1, $t0, 1
	st.w $t1, $fp, -396
# %op51 = add i32 %op50, %op48
	ld.w $t0, $fp, -396
	ld.w $t1, $fp, -388
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -400
# %op52 = icmp ne i32 %op51, zeroinitializer
	ld.w $t0, $fp, -400
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -401
# br i1 %op52, label %label_e_ltz8, label %label_e_gtz9
# gen_phi
	ld.b $t0, $fp, -401
	bnez $t0, .main_label_e_ltz8
	b .main_label_e_gtz9
.main_label_e_ltz8:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_e_gtz9
# gen_phi
	b .main_label_e_gtz9
.main_label_e_gtz9:
# %op53 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op28, i32 0, i32 0, i32 0, i32 0
	ld.d $t0, $fp, -264
	addi.w $t2, $zero, 32
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
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -416
# %op54 = load i32, i32* %op53
	ld.d $t0, $fp, -416
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -420
# %op55 = add i32 %op42, %op54
	ld.w $t0, $fp, -364
	ld.w $t1, $fp, -420
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -424
# %op56 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -425
# %op57 = zext i1 %op56 to i32
	ld.b $t0, $fp, -425
	andi $t1, $t0, 1
	st.w $t1, $fp, -432
# %op58 = add i32 %op57, zeroinitializer
	ld.w $t0, $fp, -432
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -436
# %op59 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -437
# %op60 = zext i1 %op59 to i32
	ld.b $t0, $fp, -437
	andi $t1, $t0, 1
	st.w $t1, $fp, -444
# %op61 = add i32 %op60, %op58
	ld.w $t0, $fp, -444
	ld.w $t1, $fp, -436
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -448
# %op62 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -449
# %op63 = zext i1 %op62 to i32
	ld.b $t0, $fp, -449
	andi $t1, $t0, 1
	st.w $t1, $fp, -456
# %op64 = add i32 %op63, %op61
	ld.w $t0, $fp, -456
	ld.w $t1, $fp, -448
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -460
# %op65 = icmp ne i32 %op64, zeroinitializer
	ld.w $t0, $fp, -460
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -461
# br i1 %op65, label %label_e_ltz10, label %label_e_gtz11
# gen_phi
	ld.b $t0, $fp, -461
	bnez $t0, .main_label_e_ltz10
	b .main_label_e_gtz11
.main_label_e_ltz10:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_e_gtz11
# gen_phi
	b .main_label_e_gtz11
.main_label_e_gtz11:
# %op66 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op28, i32 0, i32 0, i32 1, i32 0
	ld.d $t0, $fp, -264
	addi.w $t2, $zero, 32
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -472
# %op67 = load i32, i32* %op66
	ld.d $t0, $fp, -472
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -476
# %op68 = add i32 %op55, %op67
	ld.w $t0, $fp, -424
	ld.w $t1, $fp, -476
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -480
# %op69 = icmp slt i32 3, zeroinitializer
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -481
# %op70 = zext i1 %op69 to i32
	ld.b $t0, $fp, -481
	andi $t1, $t0, 1
	st.w $t1, $fp, -488
# %op71 = add i32 %op70, zeroinitializer
	ld.w $t0, $fp, -488
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -492
# %op72 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -493
# %op73 = zext i1 %op72 to i32
	ld.b $t0, $fp, -493
	andi $t1, $t0, 1
	st.w $t1, $fp, -500
# %op74 = add i32 %op73, %op71
	ld.w $t0, $fp, -500
	ld.w $t1, $fp, -492
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -504
# %op75 = icmp ne i32 %op74, zeroinitializer
	ld.w $t0, $fp, -504
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -505
# br i1 %op75, label %label_d_ltz12, label %label_d_gtz13
# gen_phi
	ld.b $t0, $fp, -505
	bnez $t0, .main_label_d_ltz12
	b .main_label_d_gtz13
.main_label_d_ltz12:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_d_gtz13
# gen_phi
	b .main_label_d_gtz13
.main_label_d_gtz13:
# %op76 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op9, i32 0, i32 3, i32 0
	ld.d $t0, $fp, -136
	addi.w $t2, $zero, 32
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 3
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -520
# %op77 = load i32, i32* %op76
	ld.d $t0, $fp, -520
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -524
# %op78 = add i32 %op68, %op77
	ld.w $t0, $fp, -480
	ld.w $t1, $fp, -524
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -528
# ret i32 %op78
# gen_phi
	ld.w $a0, $fp, -528
	b .main_exit
.main_exit:
	addi.d $sp, $sp, 528
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
