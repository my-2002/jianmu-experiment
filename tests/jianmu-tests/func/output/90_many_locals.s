	.text
	.globl foo
	.type foo, @function
foo:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -192
.foo_label_entry:
# %op0 = alloca [16 x i32]
	addi.d $t0, $zero, -24
	addi.d $t0, $t0, -64
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -24
# %op1 = add i32 3, 7
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 7
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -92
# %op2 = add i32 %op1, 5
	ld.w $t0, $fp, -92
	addi.w $t1, $zero, 5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -96
# %op3 = add i32 %op2, 6
	ld.w $t0, $fp, -96
	addi.w $t1, $zero, 6
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -100
# %op4 = add i32 %op3, 1
	ld.w $t0, $fp, -100
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -104
# %op5 = add i32 %op4, 0
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -108
# %op6 = add i32 %op5, 3
	ld.w $t0, $fp, -108
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -112
# %op7 = add i32 %op6, 5
	ld.w $t0, $fp, -112
	addi.w $t1, $zero, 5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# %op8 = add i32 4, 2
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -120
# %op9 = add i32 %op8, 7
	ld.w $t0, $fp, -120
	addi.w $t1, $zero, 7
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -124
# %op10 = add i32 %op9, 9
	ld.w $t0, $fp, -124
	addi.w $t1, $zero, 9
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -128
# %op11 = add i32 %op10, 8
	ld.w $t0, $fp, -128
	addi.w $t1, $zero, 8
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -132
# %op12 = add i32 %op11, 1
	ld.w $t0, $fp, -132
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -136
# %op13 = add i32 %op12, 4
	ld.w $t0, $fp, -136
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -140
# %op14 = add i32 %op13, 6
	ld.w $t0, $fp, -140
	addi.w $t1, $zero, 6
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -144
# %op15 = add i32 %op7, %op14
	ld.w $t0, $fp, -116
	ld.w $t1, $fp, -144
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -148
# %op16 = icmp slt i32 3, zeroinitializer
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -149
# %op17 = zext i1 %op16 to i32
	ld.b $t0, $fp, -149
	andi $t1, $t0, 1
	st.w $t1, $fp, -156
# %op18 = add i32 %op17, zeroinitializer
	ld.w $t0, $fp, -156
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -160
# %op19 = icmp ne i32 %op18, zeroinitializer
	ld.w $t0, $fp, -160
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -161
# br i1 %op19, label %label_arr_ltz0, label %label_arr_gtz1
# gen_phi
	ld.b $t0, $fp, -161
	bnez $t0, .foo_label_arr_ltz0
	b .foo_label_arr_gtz1
.foo_label_arr_ltz0:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz1
# gen_phi
	b .foo_label_arr_gtz1
.foo_label_arr_gtz1:
# %op20 = getelementptr [16 x i32], [16 x i32]* %op0, i32 0, i32 3
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 3
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -176
# %op21 = load i32, i32* %op20
	ld.d $t0, $fp, -176
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -180
# %op22 = add i32 %op15, %op21
	ld.w $t0, $fp, -148
	ld.w $t1, $fp, -180
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -184
# ret i32 %op22
# gen_phi
	ld.w $a0, $fp, -184
	b .foo_exit
.foo_exit:
	addi.d $sp, $sp, 192
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -128
.main_label_entry:
# %op0 = add i32 3, 7
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 7
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -20
# %op1 = add i32 %op0, 5
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -24
# %op2 = add i32 %op1, 6
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 6
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -28
# %op3 = add i32 %op2, 1
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -32
# %op4 = add i32 %op3, 0
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -36
# %op5 = add i32 %op4, 3
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -40
# %op6 = add i32 %op5, 5
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -44
# %op7 = add i32 4, 2
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -48
# %op8 = add i32 %op7, 7
	ld.w $t0, $fp, -48
	addi.w $t1, $zero, 7
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# %op9 = add i32 %op8, 9
	ld.w $t0, $fp, -52
	addi.w $t1, $zero, 9
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -56
# %op10 = add i32 %op9, 8
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 8
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# %op11 = add i32 %op10, 1
	ld.w $t0, $fp, -60
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -64
# %op12 = add i32 %op11, 4
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -68
# %op13 = add i32 %op12, 6
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 6
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -72
# %op14 = call i32 @foo()
	bl foo
	st.w $a0, $fp, -76
# %op15 = add i32 %op6, %op14
	ld.w $t0, $fp, -44
	ld.w $t1, $fp, -76
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -80
# %op16 = call i32 @foo()
	bl foo
	st.w $a0, $fp, -84
# %op17 = add i32 %op13, %op16
	ld.w $t0, $fp, -72
	ld.w $t1, $fp, -84
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -88
# %op18 = add i32 4, 7
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 7
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -92
# %op19 = add i32 %op18, 2
	ld.w $t0, $fp, -92
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -96
# %op20 = add i32 %op19, 5
	ld.w $t0, $fp, -96
	addi.w $t1, $zero, 5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -100
# %op21 = add i32 %op20, 8
	ld.w $t0, $fp, -100
	addi.w $t1, $zero, 8
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -104
# %op22 = add i32 %op21, 0
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -108
# %op23 = add i32 %op22, 6
	ld.w $t0, $fp, -108
	addi.w $t1, $zero, 6
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -112
# %op24 = add i32 %op23, 3
	ld.w $t0, $fp, -112
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# %op25 = add i32 %op15, %op17
	ld.w $t0, $fp, -80
	ld.w $t1, $fp, -88
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -120
# %op26 = add i32 %op25, %op24
	ld.w $t0, $fp, -120
	ld.w $t1, $fp, -116
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -124
# call void @putint(i32 %op26)
	ld.w $a0, $fp, -124
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# ret i32 0
# gen_phi
	addi.w $a0, $zero, 0
	b .main_exit
.main_exit:
	addi.d $sp, $sp, 128
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
