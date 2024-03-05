# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl a
	.type a, @object
	.size a, 16384
a:
	.space 16384
	la.local $t0, a
	lu12i.w $t1, 1
	ori $t1, $t1, 0
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	.text
	.globl f1
	.type f1, @function
f1:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -256
	st.d $a0, $fp, -24
.f1_label_entry:
# %op1 = icmp slt i32 5, zeroinitializer
	addi.w $t0, $zero, 5
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -25
# %op2 = zext i1 %op1 to i32
	ld.b $t0, $fp, -25
	andi $t1, $t0, 1
	st.w $t1, $fp, -32
# %op3 = add i32 %op2, zeroinitializer
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -36
# %op4 = icmp ne i32 %op3, zeroinitializer
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -37
# br i1 %op4, label %label_a_ltz0, label %label_a_gtz1
# gen_phi
	ld.b $t0, $fp, -37
	bnez $t0, .f1_label_a_ltz0
	b .f1_label_a_gtz1
.f1_label_a_ltz0:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a_gtz1
# gen_phi
	b .f1_label_a_gtz1
.f1_label_a_gtz1:
# %op5 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 5
	la.local $t0, a
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 5
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -48
# store i32 4000, i32* %op5
	ld.d $t0, $fp, -48
	lu12i.w $t1, 0
	ori $t1, $t1, 4000
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op6 = icmp slt i32 4000, zeroinitializer
	lu12i.w $t0, 0
	ori $t0, $t0, 4000
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -49
# %op7 = zext i1 %op6 to i32
	ld.b $t0, $fp, -49
	andi $t1, $t0, 1
	st.w $t1, $fp, -56
# %op8 = add i32 %op7, zeroinitializer
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# %op9 = icmp ne i32 %op8, zeroinitializer
	ld.w $t0, $fp, -60
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -61
# br i1 %op9, label %label_a_ltz2, label %label_a_gtz3
# gen_phi
	ld.b $t0, $fp, -61
	bnez $t0, .f1_label_a_ltz2
	b .f1_label_a_gtz3
.f1_label_a_ltz2:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a_gtz3
# gen_phi
	b .f1_label_a_gtz3
.f1_label_a_gtz3:
# %op10 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 4000
	la.local $t0, a
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, 0
	ori $t1, $t1, 4000
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -72
# store i32 3, i32* %op10
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op11 = icmp slt i32 4095, zeroinitializer
	lu12i.w $t0, 0
	ori $t0, $t0, 4095
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -73
# %op12 = zext i1 %op11 to i32
	ld.b $t0, $fp, -73
	andi $t1, $t0, 1
	st.w $t1, $fp, -80
# %op13 = add i32 %op12, zeroinitializer
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -84
# %op14 = icmp ne i32 %op13, zeroinitializer
	ld.w $t0, $fp, -84
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -85
# br i1 %op14, label %label_a_ltz4, label %label_a_gtz5
# gen_phi
	ld.b $t0, $fp, -85
	bnez $t0, .f1_label_a_ltz4
	b .f1_label_a_gtz5
.f1_label_a_ltz4:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a_gtz5
# gen_phi
	b .f1_label_a_gtz5
.f1_label_a_gtz5:
# %op15 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 4095
	la.local $t0, a
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, 0
	ori $t1, $t1, 4095
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -96
# store i32 7, i32* %op15
	ld.d $t0, $fp, -96
	addi.w $t1, $zero, 7
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op16 = icmp slt i32 4095, zeroinitializer
	lu12i.w $t0, 0
	ori $t0, $t0, 4095
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -97
# %op17 = zext i1 %op16 to i32
	ld.b $t0, $fp, -97
	andi $t1, $t0, 1
	st.w $t1, $fp, -104
# %op18 = add i32 %op17, zeroinitializer
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -108
# %op19 = icmp ne i32 %op18, zeroinitializer
	ld.w $t0, $fp, -108
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -109
# br i1 %op19, label %label_a_ltz6, label %label_a_gtz7
# gen_phi
	ld.b $t0, $fp, -109
	bnez $t0, .f1_label_a_ltz6
	b .f1_label_a_gtz7
.f1_label_a_ltz6:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a_gtz7
# gen_phi
	b .f1_label_a_gtz7
.f1_label_a_gtz7:
# %op20 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 4095
	la.local $t0, a
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, 0
	ori $t1, $t1, 4095
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -120
# %op21 = load i32, i32* %op20
	ld.d $t0, $fp, -120
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -124
# %op22 = icmp slt i32 %op21, zeroinitializer
	ld.w $t0, $fp, -124
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -125
# %op23 = zext i1 %op22 to i32
	ld.b $t0, $fp, -125
	andi $t1, $t0, 1
	st.w $t1, $fp, -132
# %op24 = add i32 %op23, zeroinitializer
	ld.w $t0, $fp, -132
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -136
# %op25 = icmp ne i32 %op24, zeroinitializer
	ld.w $t0, $fp, -136
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -137
# br i1 %op25, label %label_b_ltz8, label %label_b_gtz9
# gen_phi
	ld.b $t0, $fp, -137
	bnez $t0, .f1_label_b_ltz8
	b .f1_label_b_gtz9
.f1_label_b_ltz8:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_b_gtz9
# gen_phi
	b .f1_label_b_gtz9
.f1_label_b_gtz9:
# %op26 = getelementptr i32, i32* %arg0, i32 %op21
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -124
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -152
# %op27 = icmp slt i32 2216, zeroinitializer
	lu12i.w $t0, 0
	ori $t0, $t0, 2216
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -153
# %op28 = zext i1 %op27 to i32
	ld.b $t0, $fp, -153
	andi $t1, $t0, 1
	st.w $t1, $fp, -160
# %op29 = add i32 %op28, zeroinitializer
	ld.w $t0, $fp, -160
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -164
# %op30 = icmp ne i32 %op29, zeroinitializer
	ld.w $t0, $fp, -164
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -165
# br i1 %op30, label %label_a_ltz10, label %label_a_gtz11
# gen_phi
	ld.b $t0, $fp, -165
	bnez $t0, .f1_label_a_ltz10
	b .f1_label_a_gtz11
.f1_label_a_ltz10:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a_gtz11
# gen_phi
	b .f1_label_a_gtz11
.f1_label_a_gtz11:
# %op31 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 2216
	la.local $t0, a
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, 0
	ori $t1, $t1, 2216
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -176
# %op32 = load i32, i32* %op31
	ld.d $t0, $fp, -176
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -180
# %op33 = add i32 %op32, 9
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 9
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -184
# store i32 %op33, i32* %op26
	ld.d $t0, $fp, -152
	ld.w $t1, $fp, -184
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op34 = icmp slt i32 5, zeroinitializer
	addi.w $t0, $zero, 5
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -185
# %op35 = zext i1 %op34 to i32
	ld.b $t0, $fp, -185
	andi $t1, $t0, 1
	st.w $t1, $fp, -192
# %op36 = add i32 %op35, zeroinitializer
	ld.w $t0, $fp, -192
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -196
# %op37 = icmp ne i32 %op36, zeroinitializer
	ld.w $t0, $fp, -196
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -197
# br i1 %op37, label %label_a_ltz12, label %label_a_gtz13
# gen_phi
	ld.b $t0, $fp, -197
	bnez $t0, .f1_label_a_ltz12
	b .f1_label_a_gtz13
.f1_label_a_ltz12:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a_gtz13
# gen_phi
	b .f1_label_a_gtz13
.f1_label_a_gtz13:
# %op38 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 5
	la.local $t0, a
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 5
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -208
# %op39 = load i32, i32* %op38
	ld.d $t0, $fp, -208
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -212
# %op40 = icmp slt i32 %op39, zeroinitializer
	ld.w $t0, $fp, -212
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -213
# %op41 = zext i1 %op40 to i32
	ld.b $t0, $fp, -213
	andi $t1, $t0, 1
	st.w $t1, $fp, -220
# %op42 = add i32 %op41, zeroinitializer
	ld.w $t0, $fp, -220
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -224
# %op43 = icmp ne i32 %op42, zeroinitializer
	ld.w $t0, $fp, -224
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -225
# br i1 %op43, label %label_a_ltz14, label %label_a_gtz15
# gen_phi
	ld.b $t0, $fp, -225
	bnez $t0, .f1_label_a_ltz14
	b .f1_label_a_gtz15
.f1_label_a_ltz14:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a_gtz15
# gen_phi
	b .f1_label_a_gtz15
.f1_label_a_gtz15:
# %op44 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 %op39
	la.local $t0, a
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -212
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -240
# %op45 = load i32, i32* %op44
	ld.d $t0, $fp, -240
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -244
# ret i32 %op45
# gen_phi
	ld.w $a0, $fp, -244
	b .f1_exit
.f1_exit:
	addi.d $sp, $sp, 256
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	lu12i.w $t0, 4
	ori $t0, $t0, 112
	lu32i.d $t0, 0
	lu52i.d $t0, $t0, 0
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	sub.d $sp, $sp, $t0
	add.d $fp, $sp, $t0
.main_label_entry:
# %op0 = alloca [1024 x [4 x i32]]
	addi.d $t0, $zero, -24
	lu12i.w $t1, 4
	ori $t1, $t1, 0
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	sub.d $t0, $t0, $t1
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -24
# %op1 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 4071
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op2 = zext i1 %op1 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 4071
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 4064
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op3 = add i32 %op2, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 4064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 4060
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op4 = icmp ne i32 %op3, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 4060
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -5
	ori $t8, $t8, 4059
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op4, label %label_c_ltz16, label %label_c_gtz17
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 4059
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_c_ltz16
	b .main_label_c_gtz17
.main_label_c_ltz16:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_c_gtz17
# gen_phi
	b .main_label_c_gtz17
.main_label_c_gtz17:
# %op5 = getelementptr [1024 x [4 x i32]], [1024 x [4 x i32]]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 16
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 4048
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op6 = getelementptr [4 x i32], [4 x i32]* %op5, i32 0, i32 0
	lu12i.w $t0, -5
	ori $t0, $t0, 4048
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t2, $zero, 16
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 4040
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op7 = call i32 @f1(i32* %op6)
	lu12i.w $a0, -5
	ori $a0, $a0, 4040
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.d $a0, $a0, 0
	bl f1
	lu12i.w $t8, -5
	ori $t8, $t8, 4036
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $a0, $t8, 0
# call void @putint(i32 %op7)
	lu12i.w $a0, -5
	ori $a0, $a0, 4036
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.w $a0, $a0, 0
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# %op8 = icmp slt i32 2, zeroinitializer
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 4035
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op9 = zext i1 %op8 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 4035
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 4028
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op10 = add i32 %op9, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 4028
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 4024
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op11 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 4023
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op12 = zext i1 %op11 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 4023
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 4016
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op13 = add i32 %op12, %op10
	lu12i.w $t0, -5
	ori $t0, $t0, 4016
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -5
	ori $t1, $t1, 4024
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 4012
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op14 = icmp ne i32 %op13, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 4012
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -5
	ori $t8, $t8, 4011
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op14, label %label_c_ltz18, label %label_c_gtz19
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 4011
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .main_label_c_ltz18
	b .main_label_c_gtz19
.main_label_c_ltz18:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_c_gtz19
# gen_phi
	b .main_label_c_gtz19
.main_label_c_gtz19:
# %op15 = getelementptr [1024 x [4 x i32]], [1024 x [4 x i32]]* %op0, i32 0, i32 2, i32 0
	ld.d $t0, $fp, -24
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 16
	addi.w $t1, $zero, 2
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 4000
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op16 = load i32, i32* %op15
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
# ret i32 %op16
# gen_phi
	lu12i.w $a0, -5
	ori $a0, $a0, 3996
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.w $a0, $a0, 0
	b .main_exit
.main_exit:
	lu12i.w $t0, 4
	ori $t0, $t0, 112
	lu32i.d $t0, 0
	lu52i.d $t0, $t0, 0
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
