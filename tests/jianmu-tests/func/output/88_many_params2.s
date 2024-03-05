	.text
	.globl func
	.type func, @function
func:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -240
.func_label_entry:
# br label %label_condition0
# gen_phi
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -76
	b .func_label_condition0
.func_label_condition0:
# %op9 = phi i32 [ 0, %label_entry ], [ %op28, %label_b_gtz4 ]
# %op10 = icmp slt i32 %op9, 10
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	st.b $t2, $fp, -77
# %op11 = zext i1 %op10 to i32
	ld.b $t0, $fp, -77
	andi $t1, $t0, 1
	st.w $t1, $fp, -84
# %op12 = icmp sgt i32 %op11, zeroinitializer
	ld.w $t0, $fp, -84
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -85
# br i1 %op12, label %label_loop1, label %label_ret2
# gen_phi
	ld.b $t0, $fp, -85
	bnez $t0, .func_label_loop1
	b .func_label_ret2
.func_label_loop1:
# %op13 = icmp slt i32 %arg0, zeroinitializer
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -86
# %op14 = zext i1 %op13 to i32
	ld.b $t0, $fp, -86
	andi $t1, $t0, 1
	st.w $t1, $fp, -92
# %op15 = add i32 %op14, zeroinitializer
	ld.w $t0, $fp, -92
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -96
# %op16 = icmp slt i32 %op9, zeroinitializer
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -97
# %op17 = zext i1 %op16 to i32
	ld.b $t0, $fp, -97
	andi $t1, $t0, 1
	st.w $t1, $fp, -104
# %op18 = add i32 %op17, %op15
	ld.w $t0, $fp, -104
	ld.w $t1, $fp, -96
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -108
# %op19 = icmp ne i32 %op18, zeroinitializer
	ld.w $t0, $fp, -108
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -109
# br i1 %op19, label %label_b_ltz3, label %label_b_gtz4
# gen_phi
	ld.b $t0, $fp, -109
	bnez $t0, .func_label_b_ltz3
	b .func_label_b_gtz4
.func_label_ret2:
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# %op20 = icmp slt i32 %arg2, zeroinitializer
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -110
# %op21 = zext i1 %op20 to i32
	ld.b $t0, $fp, -110
	andi $t1, $t0, 1
	st.w $t1, $fp, -116
# %op22 = add i32 %op21, zeroinitializer
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -120
# %op23 = icmp ne i32 %op22, zeroinitializer
	ld.w $t0, $fp, -120
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -121
# br i1 %op23, label %label_d_ltz5, label %label_d_gtz6
# gen_phi
	ld.b $t0, $fp, -121
	bnez $t0, .func_label_d_ltz5
	b .func_label_d_gtz6
.func_label_b_ltz3:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_b_gtz4
# gen_phi
	b .func_label_b_gtz4
.func_label_b_gtz4:
# %op24 = mul i32 59, %arg0
	addi.w $t0, $zero, 59
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -128
# %op25 = add i32 %op24, %op9
	ld.w $t0, $fp, -128
	ld.w $t1, $fp, -76
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -132
# %op26 = getelementptr i32, i32* %arg1, i32 %op25
	ld.d $t0, $fp, -32
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -132
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -144
# %op27 = load i32, i32* %op26
	ld.d $t0, $fp, -144
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -148
# call void @putint(i32 %op27)
	ld.w $a0, $fp, -148
	bl putint
# %op28 = add i32 %op9, 1
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -152
# br label %label_condition0
# gen_phi
	ld.w $t0, $fp, -152
	st.w $t0, $fp, -76
	b .func_label_condition0
.func_label_d_ltz5:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_d_gtz6
# gen_phi
	b .func_label_d_gtz6
.func_label_d_gtz6:
# %op29 = getelementptr i32, i32* %arg3, i32 %arg2
	ld.d $t0, $fp, -48
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -36
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -160
# %op30 = load i32, i32* %op29
	ld.d $t0, $fp, -160
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -164
# call void @putint(i32 %op30)
	ld.w $a0, $fp, -164
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# br label %label_condition7
# gen_phi
	ld.w $t0, $fp, -72
	st.w $t0, $fp, -168
	ld.w $t0, $fp, -68
	st.w $t0, $fp, -172
	b .func_label_condition7
.func_label_condition7:
# %op31 = phi i32 [ %arg8, %label_d_gtz6 ], [ %op46, %label_g_gtz11 ]
# %op32 = phi i32 [ %arg7, %label_d_gtz6 ], [ %op47, %label_g_gtz11 ]
# %op33 = icmp slt i32 %op31, 10
	ld.w $t0, $fp, -168
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	st.b $t2, $fp, -173
# %op34 = zext i1 %op33 to i32
	ld.b $t0, $fp, -173
	andi $t1, $t0, 1
	st.w $t1, $fp, -180
# %op35 = icmp sgt i32 %op34, zeroinitializer
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -181
# br i1 %op35, label %label_loop8, label %label_ret9
# gen_phi
	ld.b $t0, $fp, -181
	bnez $t0, .func_label_loop8
	b .func_label_ret9
.func_label_loop8:
# %op36 = icmp slt i32 %op31, zeroinitializer
	ld.w $t0, $fp, -168
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -182
# %op37 = zext i1 %op36 to i32
	ld.b $t0, $fp, -182
	andi $t1, $t0, 1
	st.w $t1, $fp, -188
# %op38 = add i32 %op37, zeroinitializer
	ld.w $t0, $fp, -188
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -192
# %op39 = icmp ne i32 %op38, zeroinitializer
	ld.w $t0, $fp, -192
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -193
# br i1 %op39, label %label_g_ltz10, label %label_g_gtz11
# gen_phi
	ld.b $t0, $fp, -193
	bnez $t0, .func_label_g_ltz10
	b .func_label_g_gtz11
.func_label_ret9:
# %op40 = add i32 %arg4, %arg5
	ld.w $t0, $fp, -52
	ld.w $t1, $fp, -56
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -200
# ret i32 %op40
# gen_phi
	ld.w $a0, $fp, -200
	b .func_exit
.func_label_g_ltz10:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_g_gtz11
# gen_phi
	b .func_label_g_gtz11
.func_label_g_gtz11:
# %op41 = getelementptr i32, i32* %arg6, i32 %op31
	ld.d $t0, $fp, -64
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -168
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -208
# %op42 = mul i32 %op32, 128875
	ld.w $t0, $fp, -172
	lu12i.w $t1, 31
	ori $t1, $t1, 1899
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -212
# %op43 = sdiv i32 %op42, 3724
	ld.w $t0, $fp, -212
	lu12i.w $t1, 0
	ori $t1, $t1, 3724
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -216
# %op44 = mul i32 %op43, 3724
	ld.w $t0, $fp, -216
	lu12i.w $t1, 0
	ori $t1, $t1, 3724
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -220
# %op45 = sub i32 %op42, %op44
	ld.w $t0, $fp, -212
	ld.w $t1, $fp, -220
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -224
# store i32 %op45, i32* %op41
	ld.d $t0, $fp, -208
	ld.w $t1, $fp, -224
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op46 = add i32 %op31, 1
	ld.w $t0, $fp, -168
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -228
# %op47 = add i32 %op32, 7
	ld.w $t0, $fp, -172
	addi.w $t1, $zero, 7
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -232
# br label %label_condition7
# gen_phi
	ld.w $t0, $fp, -228
	st.w $t0, $fp, -168
	ld.w $t0, $fp, -232
	st.w $t0, $fp, -172
	b .func_label_condition7
.func_exit:
	addi.d $sp, $sp, 240
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	lu12i.w $t0, 7
	ori $t0, $t0, 992
	lu32i.d $t0, 0
	lu52i.d $t0, $t0, 0
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	sub.d $sp, $sp, $t0
	add.d $fp, $sp, $t0
.main_label_entry:
# %op0 = alloca [61 x [67 x i32]]
	addi.d $t0, $zero, -24
	lu12i.w $t1, 3
	ori $t1, $t1, 4060
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	sub.d $t0, $t0, $t1
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -24
# %op1 = alloca [53 x [59 x i32]]
	lu12i.w $t0, -4
	ori $t0, $t0, 0
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	lu12i.w $t1, 3
	ori $t1, $t1, 220
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	sub.d $t0, $t0, $t1
	add.d $t0, $fp, $t0
	lu12i.w $t8, -4
	ori $t8, $t8, 0
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op2 = icmp slt i32 17, zeroinitializer
	addi.w $t0, $zero, 17
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3875
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op3 = zext i1 %op2 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3875
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3868
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op4 = add i32 %op3, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3868
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3864
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op5 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3863
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op6 = zext i1 %op5 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3863
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3856
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op7 = add i32 %op6, %op4
	lu12i.w $t0, -8
	ori $t0, $t0, 3856
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -8
	ori $t1, $t1, 3864
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3852
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op8 = icmp ne i32 %op7, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3852
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -8
	ori $t8, $t8, 3851
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op8, label %label_a_ltz12, label %label_a_gtz13
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3851
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_a_ltz12
	b .main_label_a_gtz13
.main_label_a_ltz12:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a_gtz13
# gen_phi
	b .main_label_a_gtz13
.main_label_a_gtz13:
# %op9 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 17, i32 1
	ld.d $t0, $fp, -24
	lu12i.w $t2, 3
	ori $t2, $t2, 4060
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 268
	addi.w $t1, $zero, 17
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3840
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# store i32 6, i32* %op9
	lu12i.w $t0, -8
	ori $t0, $t0, 3840
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op10 = icmp slt i32 17, zeroinitializer
	addi.w $t0, $zero, 17
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3839
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op11 = zext i1 %op10 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3839
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3832
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op12 = add i32 %op11, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3832
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3828
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op13 = icmp slt i32 3, zeroinitializer
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3827
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op14 = zext i1 %op13 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3827
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3820
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op15 = add i32 %op14, %op12
	lu12i.w $t0, -8
	ori $t0, $t0, 3820
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -8
	ori $t1, $t1, 3828
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3816
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op16 = icmp ne i32 %op15, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3816
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -8
	ori $t8, $t8, 3815
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op16, label %label_a_ltz14, label %label_a_gtz15
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3815
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_a_ltz14
	b .main_label_a_gtz15
.main_label_a_ltz14:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a_gtz15
# gen_phi
	b .main_label_a_gtz15
.main_label_a_gtz15:
# %op17 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 17, i32 3
	ld.d $t0, $fp, -24
	lu12i.w $t2, 3
	ori $t2, $t2, 4060
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 268
	addi.w $t1, $zero, 17
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 3
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3800
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# store i32 7, i32* %op17
	lu12i.w $t0, -8
	ori $t0, $t0, 3800
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t1, $zero, 7
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op18 = icmp slt i32 17, zeroinitializer
	addi.w $t0, $zero, 17
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3799
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op19 = zext i1 %op18 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3799
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3792
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op20 = add i32 %op19, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3792
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3788
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op21 = icmp slt i32 4, zeroinitializer
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3787
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op22 = zext i1 %op21 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3787
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3780
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op23 = add i32 %op22, %op20
	lu12i.w $t0, -8
	ori $t0, $t0, 3780
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -8
	ori $t1, $t1, 3788
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3776
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op24 = icmp ne i32 %op23, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3776
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -8
	ori $t8, $t8, 3775
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op24, label %label_a_ltz16, label %label_a_gtz17
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3775
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_a_ltz16
	b .main_label_a_gtz17
.main_label_a_ltz16:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a_gtz17
# gen_phi
	b .main_label_a_gtz17
.main_label_a_gtz17:
# %op25 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 17, i32 4
	ld.d $t0, $fp, -24
	lu12i.w $t2, 3
	ori $t2, $t2, 4060
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 268
	addi.w $t1, $zero, 17
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3760
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# store i32 4, i32* %op25
	lu12i.w $t0, -8
	ori $t0, $t0, 3760
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op26 = icmp slt i32 17, zeroinitializer
	addi.w $t0, $zero, 17
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3759
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op27 = zext i1 %op26 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3759
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3752
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op28 = add i32 %op27, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3752
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3748
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op29 = icmp slt i32 7, zeroinitializer
	addi.w $t0, $zero, 7
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3747
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op30 = zext i1 %op29 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3747
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3740
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op31 = add i32 %op30, %op28
	lu12i.w $t0, -8
	ori $t0, $t0, 3740
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -8
	ori $t1, $t1, 3748
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3736
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op32 = icmp ne i32 %op31, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3736
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -8
	ori $t8, $t8, 3735
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op32, label %label_a_ltz18, label %label_a_gtz19
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3735
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_a_ltz18
	b .main_label_a_gtz19
.main_label_a_ltz18:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a_gtz19
# gen_phi
	b .main_label_a_gtz19
.main_label_a_gtz19:
# %op33 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 17, i32 7
	ld.d $t0, $fp, -24
	lu12i.w $t2, 3
	ori $t2, $t2, 4060
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 268
	addi.w $t1, $zero, 17
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 7
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3720
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# store i32 9, i32* %op33
	lu12i.w $t0, -8
	ori $t0, $t0, 3720
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t1, $zero, 9
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op34 = icmp slt i32 17, zeroinitializer
	addi.w $t0, $zero, 17
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3719
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op35 = zext i1 %op34 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3719
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3712
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op36 = add i32 %op35, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3712
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3708
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op37 = icmp slt i32 11, zeroinitializer
	addi.w $t0, $zero, 11
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3707
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op38 = zext i1 %op37 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3707
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3700
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op39 = add i32 %op38, %op36
	lu12i.w $t0, -8
	ori $t0, $t0, 3700
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -8
	ori $t1, $t1, 3708
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3696
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op40 = icmp ne i32 %op39, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3696
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -8
	ori $t8, $t8, 3695
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op40, label %label_a_ltz20, label %label_a_gtz21
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3695
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_a_ltz20
	b .main_label_a_gtz21
.main_label_a_ltz20:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a_gtz21
# gen_phi
	b .main_label_a_gtz21
.main_label_a_gtz21:
# %op41 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 17, i32 11
	ld.d $t0, $fp, -24
	lu12i.w $t2, 3
	ori $t2, $t2, 4060
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 268
	addi.w $t1, $zero, 17
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 11
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3680
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# store i32 11, i32* %op41
	lu12i.w $t0, -8
	ori $t0, $t0, 3680
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t1, $zero, 11
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op42 = icmp slt i32 6, zeroinitializer
	addi.w $t0, $zero, 6
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3679
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op43 = zext i1 %op42 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3679
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3672
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op44 = add i32 %op43, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3672
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3668
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op45 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3667
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op46 = zext i1 %op45 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3667
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3660
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op47 = add i32 %op46, %op44
	lu12i.w $t0, -8
	ori $t0, $t0, 3660
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -8
	ori $t1, $t1, 3668
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3656
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op48 = icmp ne i32 %op47, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3656
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -8
	ori $t8, $t8, 3655
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op48, label %label_b_ltz22, label %label_b_gtz23
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3655
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_b_ltz22
	b .main_label_b_gtz23
.main_label_b_ltz22:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_b_gtz23
# gen_phi
	b .main_label_b_gtz23
.main_label_b_gtz23:
# %op49 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 6, i32 1
	lu12i.w $t0, -4
	ori $t0, $t0, 0
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 3
	ori $t2, $t2, 220
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 236
	addi.w $t1, $zero, 6
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3640
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# store i32 1, i32* %op49
	lu12i.w $t0, -8
	ori $t0, $t0, 3640
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op50 = icmp slt i32 6, zeroinitializer
	addi.w $t0, $zero, 6
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3639
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op51 = zext i1 %op50 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3639
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3632
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op52 = add i32 %op51, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3632
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3628
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op53 = icmp slt i32 2, zeroinitializer
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3627
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op54 = zext i1 %op53 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3627
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3620
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op55 = add i32 %op54, %op52
	lu12i.w $t0, -8
	ori $t0, $t0, 3620
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -8
	ori $t1, $t1, 3628
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3616
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op56 = icmp ne i32 %op55, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3616
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -8
	ori $t8, $t8, 3615
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op56, label %label_b_ltz24, label %label_b_gtz25
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3615
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_b_ltz24
	b .main_label_b_gtz25
.main_label_b_ltz24:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_b_gtz25
# gen_phi
	b .main_label_b_gtz25
.main_label_b_gtz25:
# %op57 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 6, i32 2
	lu12i.w $t0, -4
	ori $t0, $t0, 0
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 3
	ori $t2, $t2, 220
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 236
	addi.w $t1, $zero, 6
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 2
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3600
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# store i32 2, i32* %op57
	lu12i.w $t0, -8
	ori $t0, $t0, 3600
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op58 = icmp slt i32 6, zeroinitializer
	addi.w $t0, $zero, 6
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3599
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op59 = zext i1 %op58 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3599
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3592
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op60 = add i32 %op59, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3592
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3588
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op61 = icmp slt i32 3, zeroinitializer
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3587
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op62 = zext i1 %op61 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3587
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3580
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op63 = add i32 %op62, %op60
	lu12i.w $t0, -8
	ori $t0, $t0, 3580
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -8
	ori $t1, $t1, 3588
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3576
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op64 = icmp ne i32 %op63, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3576
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -8
	ori $t8, $t8, 3575
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op64, label %label_b_ltz26, label %label_b_gtz27
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3575
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_b_ltz26
	b .main_label_b_gtz27
.main_label_b_ltz26:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_b_gtz27
# gen_phi
	b .main_label_b_gtz27
.main_label_b_gtz27:
# %op65 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 6, i32 3
	lu12i.w $t0, -4
	ori $t0, $t0, 0
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 3
	ori $t2, $t2, 220
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 236
	addi.w $t1, $zero, 6
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 3
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3560
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# store i32 3, i32* %op65
	lu12i.w $t0, -8
	ori $t0, $t0, 3560
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op66 = icmp slt i32 6, zeroinitializer
	addi.w $t0, $zero, 6
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3559
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op67 = zext i1 %op66 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3559
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3552
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op68 = add i32 %op67, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3552
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3548
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op69 = icmp slt i32 9, zeroinitializer
	addi.w $t0, $zero, 9
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3547
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op70 = zext i1 %op69 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3547
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3540
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op71 = add i32 %op70, %op68
	lu12i.w $t0, -8
	ori $t0, $t0, 3540
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -8
	ori $t1, $t1, 3548
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3536
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op72 = icmp ne i32 %op71, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3536
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -8
	ori $t8, $t8, 3535
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op72, label %label_b_ltz28, label %label_b_gtz29
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3535
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_b_ltz28
	b .main_label_b_gtz29
.main_label_b_ltz28:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_b_gtz29
# gen_phi
	b .main_label_b_gtz29
.main_label_b_gtz29:
# %op73 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 6, i32 9
	lu12i.w $t0, -4
	ori $t0, $t0, 0
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 3
	ori $t2, $t2, 220
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 236
	addi.w $t1, $zero, 6
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 9
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3520
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# store i32 9, i32* %op73
	lu12i.w $t0, -8
	ori $t0, $t0, 3520
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t1, $zero, 9
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op74 = icmp slt i32 17, zeroinitializer
	addi.w $t0, $zero, 17
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3519
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op75 = zext i1 %op74 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3519
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3512
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op76 = add i32 %op75, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3512
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3508
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op77 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3507
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op78 = zext i1 %op77 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3507
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3500
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op79 = add i32 %op78, %op76
	lu12i.w $t0, -8
	ori $t0, $t0, 3500
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -8
	ori $t1, $t1, 3508
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3496
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op80 = icmp ne i32 %op79, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3496
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -8
	ori $t8, $t8, 3495
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op80, label %label_a_ltz30, label %label_a_gtz31
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3495
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_a_ltz30
	b .main_label_a_gtz31
.main_label_a_ltz30:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a_gtz31
# gen_phi
	b .main_label_a_gtz31
.main_label_a_gtz31:
# %op81 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 17, i32 1
	ld.d $t0, $fp, -24
	lu12i.w $t2, 3
	ori $t2, $t2, 4060
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 268
	addi.w $t1, $zero, 17
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3480
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op82 = load i32, i32* %op81
	lu12i.w $t0, -8
	ori $t0, $t0, 3480
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -8
	ori $t8, $t8, 3476
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op83 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 0, i32 0
	lu12i.w $t0, -4
	ori $t0, $t0, 0
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 3
	ori $t2, $t2, 220
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 236
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3464
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op84 = icmp slt i32 17, zeroinitializer
	addi.w $t0, $zero, 17
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3463
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op85 = zext i1 %op84 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3463
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3456
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op86 = add i32 %op85, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3456
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3452
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op87 = icmp slt i32 3, zeroinitializer
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3451
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op88 = zext i1 %op87 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3451
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3444
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op89 = add i32 %op88, %op86
	lu12i.w $t0, -8
	ori $t0, $t0, 3444
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -8
	ori $t1, $t1, 3452
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3440
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op90 = icmp ne i32 %op89, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3440
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -8
	ori $t8, $t8, 3439
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op90, label %label_a_ltz32, label %label_a_gtz33
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3439
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_a_ltz32
	b .main_label_a_gtz33
.main_label_a_ltz32:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a_gtz33
# gen_phi
	b .main_label_a_gtz33
.main_label_a_gtz33:
# %op91 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 17, i32 3
	ld.d $t0, $fp, -24
	lu12i.w $t2, 3
	ori $t2, $t2, 4060
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 268
	addi.w $t1, $zero, 17
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 3
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3424
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op92 = load i32, i32* %op91
	lu12i.w $t0, -8
	ori $t0, $t0, 3424
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -8
	ori $t8, $t8, 3420
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op93 = icmp slt i32 17, zeroinitializer
	addi.w $t0, $zero, 17
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3419
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op94 = zext i1 %op93 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3419
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3412
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op95 = add i32 %op94, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3412
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3408
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op96 = icmp ne i32 %op95, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3408
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -8
	ori $t8, $t8, 3407
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op96, label %label_a_ltz34, label %label_a_gtz35
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3407
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_a_ltz34
	b .main_label_a_gtz35
.main_label_a_ltz34:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a_gtz35
# gen_phi
	b .main_label_a_gtz35
.main_label_a_gtz35:
# %op97 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %op0, i32 0, i32 17
	ld.d $t0, $fp, -24
	lu12i.w $t2, 3
	ori $t2, $t2, 4060
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 268
	addi.w $t1, $zero, 17
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3392
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op98 = getelementptr [67 x i32], [67 x i32]* %op97, i32 0, i32 0
	lu12i.w $t0, -8
	ori $t0, $t0, 3392
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t2, $zero, 268
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3384
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op99 = icmp slt i32 6, zeroinitializer
	addi.w $t0, $zero, 6
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3383
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op100 = zext i1 %op99 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3383
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3376
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op101 = add i32 %op100, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3376
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3372
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op102 = icmp slt i32 3, zeroinitializer
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3371
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op103 = zext i1 %op102 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3371
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3364
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op104 = add i32 %op103, %op101
	lu12i.w $t0, -8
	ori $t0, $t0, 3364
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -8
	ori $t1, $t1, 3372
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3360
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op105 = icmp ne i32 %op104, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3360
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -8
	ori $t8, $t8, 3359
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op105, label %label_b_ltz36, label %label_b_gtz37
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3359
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_b_ltz36
	b .main_label_b_gtz37
.main_label_b_ltz36:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_b_gtz37
# gen_phi
	b .main_label_b_gtz37
.main_label_b_gtz37:
# %op106 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 6, i32 3
	lu12i.w $t0, -4
	ori $t0, $t0, 0
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 3
	ori $t2, $t2, 220
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 236
	addi.w $t1, $zero, 6
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 3
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3344
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op107 = load i32, i32* %op106
	lu12i.w $t0, -8
	ori $t0, $t0, 3344
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -8
	ori $t8, $t8, 3340
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op108 = icmp slt i32 6, zeroinitializer
	addi.w $t0, $zero, 6
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3339
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op109 = zext i1 %op108 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3339
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3332
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op110 = add i32 %op109, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3332
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3328
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op111 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3327
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op112 = zext i1 %op111 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3327
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3320
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op113 = add i32 %op112, %op110
	lu12i.w $t0, -8
	ori $t0, $t0, 3320
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -8
	ori $t1, $t1, 3328
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3316
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op114 = icmp ne i32 %op113, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3316
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -8
	ori $t8, $t8, 3315
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op114, label %label_b_ltz38, label %label_b_gtz39
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3315
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_b_ltz38
	b .main_label_b_gtz39
.main_label_b_ltz38:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_b_gtz39
# gen_phi
	b .main_label_b_gtz39
.main_label_b_gtz39:
# %op115 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 6, i32 0
	lu12i.w $t0, -4
	ori $t0, $t0, 0
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 3
	ori $t2, $t2, 220
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 236
	addi.w $t1, $zero, 6
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3304
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op116 = load i32, i32* %op115
	lu12i.w $t0, -8
	ori $t0, $t0, 3304
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -8
	ori $t8, $t8, 3300
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op117 = icmp slt i32 6, zeroinitializer
	addi.w $t0, $zero, 6
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3299
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op118 = zext i1 %op117 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3299
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3292
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op119 = add i32 %op118, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3292
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3288
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op120 = icmp ne i32 %op119, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3288
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -8
	ori $t8, $t8, 3287
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op120, label %label_b_ltz40, label %label_b_gtz41
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3287
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_b_ltz40
	b .main_label_b_gtz41
.main_label_b_ltz40:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_b_gtz41
# gen_phi
	b .main_label_b_gtz41
.main_label_b_gtz41:
# %op121 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 6
	lu12i.w $t0, -4
	ori $t0, $t0, 0
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 3
	ori $t2, $t2, 220
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 236
	addi.w $t1, $zero, 6
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3272
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op122 = getelementptr [59 x i32], [59 x i32]* %op121, i32 0, i32 0
	lu12i.w $t0, -8
	ori $t0, $t0, 3272
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t2, $zero, 236
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3264
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op123 = icmp slt i32 34, zeroinitializer
	addi.w $t0, $zero, 34
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3263
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op124 = zext i1 %op123 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3263
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3256
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op125 = add i32 %op124, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3256
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3252
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op126 = icmp slt i32 4, zeroinitializer
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3251
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op127 = zext i1 %op126 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3251
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3244
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op128 = add i32 %op127, %op125
	lu12i.w $t0, -8
	ori $t0, $t0, 3244
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -8
	ori $t1, $t1, 3252
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3240
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op129 = icmp ne i32 %op128, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3240
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -8
	ori $t8, $t8, 3239
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op129, label %label_b_ltz42, label %label_b_gtz43
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3239
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_b_ltz42
	b .main_label_b_gtz43
.main_label_b_ltz42:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_b_gtz43
# gen_phi
	b .main_label_b_gtz43
.main_label_b_gtz43:
# %op130 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 34, i32 4
	lu12i.w $t0, -4
	ori $t0, $t0, 0
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 3
	ori $t2, $t2, 220
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 236
	addi.w $t1, $zero, 34
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3224
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op131 = load i32, i32* %op130
	lu12i.w $t0, -8
	ori $t0, $t0, 3224
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -8
	ori $t8, $t8, 3220
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op132 = icmp slt i32 51, zeroinitializer
	addi.w $t0, $zero, 51
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3219
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op133 = zext i1 %op132 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3219
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3212
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op134 = add i32 %op133, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3212
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3208
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op135 = icmp slt i32 18, zeroinitializer
	addi.w $t0, $zero, 18
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3207
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op136 = zext i1 %op135 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3207
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3200
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op137 = add i32 %op136, %op134
	lu12i.w $t0, -8
	ori $t0, $t0, 3200
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -8
	ori $t1, $t1, 3208
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3196
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op138 = icmp ne i32 %op137, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3196
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -8
	ori $t8, $t8, 3195
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op138, label %label_b_ltz44, label %label_b_gtz45
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3195
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_b_ltz44
	b .main_label_b_gtz45
.main_label_b_ltz44:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_b_gtz45
# gen_phi
	b .main_label_b_gtz45
.main_label_b_gtz45:
# %op139 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 51, i32 18
	lu12i.w $t0, -4
	ori $t0, $t0, 0
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 3
	ori $t2, $t2, 220
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 236
	addi.w $t1, $zero, 51
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 18
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3184
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op140 = load i32, i32* %op139
	lu12i.w $t0, -8
	ori $t0, $t0, 3184
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -8
	ori $t8, $t8, 3180
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op141 = call i32 @func(i32 %op82, i32* %op83, i32 %op92, i32* %op98, i32 %op107, i32 %op116, i32* %op122, i32 %op131, i32 %op140)
	lu12i.w $t0, -8
	ori $t0, $t0, 3476
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.d $t1, $sp, -20
	st.w $t0, $t1, 0
	lu12i.w $t0, -8
	ori $t0, $t0, 3464
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.d $t1, $sp, -32
	st.d $t0, $t1, 0
	lu12i.w $t0, -8
	ori $t0, $t0, 3420
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.d $t1, $sp, -36
	st.w $t0, $t1, 0
	lu12i.w $t0, -8
	ori $t0, $t0, 3384
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.d $t1, $sp, -48
	st.d $t0, $t1, 0
	lu12i.w $t0, -8
	ori $t0, $t0, 3340
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.d $t1, $sp, -52
	st.w $t0, $t1, 0
	lu12i.w $t0, -8
	ori $t0, $t0, 3300
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.d $t1, $sp, -56
	st.w $t0, $t1, 0
	lu12i.w $t0, -8
	ori $t0, $t0, 3264
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.d $t1, $sp, -64
	st.d $t0, $t1, 0
	lu12i.w $t0, -8
	ori $t0, $t0, 3220
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.d $t1, $sp, -68
	st.w $t0, $t1, 0
	lu12i.w $t0, -8
	ori $t0, $t0, 3180
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.d $t1, $sp, -72
	st.w $t0, $t1, 0
	bl func
	lu12i.w $t8, -8
	ori $t8, $t8, 3176
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $a0, $t8, 0
# %op142 = mul i32 %op141, 3
	lu12i.w $t0, -8
	ori $t0, $t0, 3176
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 3
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3172
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# br label %label_condition46
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3172
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -8
	ori $t8, $t8, 3168
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .main_label_condition46
.main_label_condition46:
# %op143 = phi i32 [ %op142, %label_b_gtz45 ], [ %op156, %label_b_gtz50 ]
# %op144 = icmp sge i32 %op143, 0
	lu12i.w $t0, -8
	ori $t0, $t0, 3168
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	xori $t2, $t2, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3167
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op145 = zext i1 %op144 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3167
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3160
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op146 = icmp sgt i32 %op145, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3160
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -8
	ori $t8, $t8, 3159
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op146, label %label_loop47, label %label_ret48
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3159
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_loop47
	b .main_label_ret48
.main_label_loop47:
# %op147 = icmp slt i32 6, zeroinitializer
	addi.w $t0, $zero, 6
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3158
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op148 = zext i1 %op147 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3158
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3152
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op149 = add i32 %op148, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3152
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3148
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op150 = icmp slt i32 %op143, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3168
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3147
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op151 = zext i1 %op150 to i32
	lu12i.w $t0, -8
	ori $t0, $t0, 3147
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -8
	ori $t8, $t8, 3140
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op152 = add i32 %op151, %op149
	lu12i.w $t0, -8
	ori $t0, $t0, 3140
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -8
	ori $t1, $t1, 3148
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3136
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op153 = icmp ne i32 %op152, zeroinitializer
	lu12i.w $t0, -8
	ori $t0, $t0, 3136
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -8
	ori $t8, $t8, 3135
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op153, label %label_b_ltz49, label %label_b_gtz50
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3135
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_b_ltz49
	b .main_label_b_gtz50
.main_label_ret48:
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# ret i32 0
# gen_phi
	addi.w $a0, $zero, 0
	b .main_exit
.main_label_b_ltz49:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_b_gtz50
# gen_phi
	b .main_label_b_gtz50
.main_label_b_gtz50:
# %op154 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %op1, i32 0, i32 6, i32 %op143
	lu12i.w $t0, -4
	ori $t0, $t0, 0
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 3
	ori $t2, $t2, 220
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 236
	addi.w $t1, $zero, 6
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, -8
	ori $t1, $t1, 3168
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3120
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op155 = load i32, i32* %op154
	lu12i.w $t0, -8
	ori $t0, $t0, 3120
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -8
	ori $t8, $t8, 3116
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# call void @putint(i32 %op155)
	lu12i.w $a0, -8
	ori $a0, $a0, 3116
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.w $a0, $a0, 0
	bl putint
# call void @putch(i32 32)
	addi.w $a0, $zero, 32
	bl putch
# %op156 = sub i32 %op143, 1
	lu12i.w $t0, -8
	ori $t0, $t0, 3168
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	lu12i.w $t8, -8
	ori $t8, $t8, 3112
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# br label %label_condition46
# gen_phi
	lu12i.w $t0, -8
	ori $t0, $t0, 3112
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -8
	ori $t8, $t8, 3168
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .main_label_condition46
.main_exit:
	lu12i.w $t0, 7
	ori $t0, $t0, 992
	lu32i.d $t0, 0
	lu52i.d $t0, $t0, 0
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
