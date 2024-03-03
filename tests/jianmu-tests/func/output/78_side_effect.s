# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl a
	.type a, @object
	.size a, 4
a:
	.space 4
	la.local $t0, a
	addi.w $t1, $zero, -1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	.globl b
	.type b, @object
	.size b, 4
b:
	.space 4
	la.local $t0, b
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	.text
	.globl inc_a
	.type inc_a, @function
inc_a:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -64
.inc_a_label_entry:
# %op0 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -20
# %op1 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -32
# store i32 %op0, i32* %op1
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op2 = load i32, i32* %op1
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -40
# %op3 = add i32 %op2, 1
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -44
# store i32 %op3, i32* %op1
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -44
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -48
# store i32 %op4, i32* @a
	la.local $t0, a
	ld.w $t1, $fp, -48
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op5 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -52
# ret i32 %op5
# gen_phi
	ld.w $a0, $fp, -52
	b .inc_a_exit
.inc_a_exit:
	addi.d $sp, $sp, 64
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
# %op0 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4072
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -24
# store i32 5, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_condition0
# gen_phi
	b .main_label_condition0
.main_label_condition0:
# %op1 = icmp sgt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -29
# br i1 %op1, label %label_loop1, label %label_ret2
# gen_phi
	ld.b $t0, $fp, -29
	bnez $t0, .main_label_loop1
	b .main_label_ret2
.main_label_loop1:
# %op2 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -36
# %op3 = icmp sge i32 %op2, zeroinitializer
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	xori $t2, $t2, 1
	st.b $t2, $fp, -37
# br i1 %op3, label %label_true3, label %label_false4
# gen_phi
	ld.b $t0, $fp, -37
	bnez $t0, .main_label_true3
	b .main_label_false4
.main_label_ret2:
# %op4 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -44
# call void @putint(i32 %op4)
	ld.w $a0, $fp, -44
	bl putint
# call void @putch(i32 32)
	addi.w $a0, $zero, 32
	bl putch
# %op5 = load i32, i32* @b
	la.local $t0, b
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -48
# call void @putint(i32 %op5)
	ld.w $a0, $fp, -48
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# %op6 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -52
# ret i32 %op6
# gen_phi
	ld.w $a0, $fp, -52
	b .main_exit
.main_label_true3:
# %op7 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -56
# %op8 = icmp sgt i32 %op7, zeroinitializer
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -57
# br label %label_ret5
# gen_phi
	ld.b $t0, $fp, -57
	st.b $t0, $fp, -59
	b .main_label_ret5
.main_label_false4:
# %op9 = icmp sgt i32 zeroinitializer, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -58
# br label %label_ret5
# gen_phi
	ld.b $t0, $fp, -58
	st.b $t0, $fp, -59
	b .main_label_ret5
.main_label_ret5:
# %op10 = phi i1 [ %op8, %label_true3 ], [ %op9, %label_false4 ]
# %op11 = zext i1 %op10 to i32
	ld.b $t0, $fp, -59
	andi $t1, $t0, 1
	st.w $t1, $fp, -64
# %op12 = icmp sge i32 %op11, zeroinitializer
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	xori $t2, $t2, 1
	st.b $t2, $fp, -65
# br i1 %op12, label %label_true6, label %label_false7
# gen_phi
	ld.b $t0, $fp, -65
	bnez $t0, .main_label_true6
	b .main_label_false7
.main_label_true6:
# %op13 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -72
# %op14 = icmp sgt i32 %op13, zeroinitializer
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -73
# br label %label_ret8
# gen_phi
	ld.b $t0, $fp, -73
	st.b $t0, $fp, -75
	b .main_label_ret8
.main_label_false7:
# %op15 = icmp sgt i32 zeroinitializer, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -74
# br label %label_ret8
# gen_phi
	ld.b $t0, $fp, -74
	st.b $t0, $fp, -75
	b .main_label_ret8
.main_label_ret8:
# %op16 = phi i1 [ %op14, %label_true6 ], [ %op15, %label_false7 ]
# %op17 = zext i1 %op16 to i32
	ld.b $t0, $fp, -75
	andi $t1, $t0, 1
	st.w $t1, $fp, -80
# %op18 = icmp sgt i32 %op17, zeroinitializer
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -81
# br i1 %op18, label %label_true9, label %label_ret10
# gen_phi
	ld.b $t0, $fp, -81
	bnez $t0, .main_label_true9
	b .main_label_ret10
.main_label_true9:
# %op19 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -88
# call void @putint(i32 %op19)
	ld.w $a0, $fp, -88
	bl putint
# call void @putch(i32 32)
	addi.w $a0, $zero, 32
	bl putch
# %op20 = load i32, i32* @b
	la.local $t0, b
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -92
# call void @putint(i32 %op20)
	ld.w $a0, $fp, -92
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# call void @putint(i32 111)
	addi.w $a0, $zero, 111
	bl putint
# br label %label_ret10
# gen_phi
	b .main_label_ret10
.main_label_ret10:
# %op21 = icmp sgt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -93
# br i1 %op21, label %label_true11, label %label_false12
# gen_phi
	ld.b $t0, $fp, -93
	bnez $t0, .main_label_true11
	b .main_label_false12
.main_label_true11:
# %op22 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -100
# call void @putint(i32 %op22)
	ld.w $a0, $fp, -100
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# %op23 = load i32, i32* @b
	la.local $t0, b
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -104
# %op24 = mul i32 %op23, 2
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -108
# store i32 %op24, i32* @b
	la.local $t0, b
	ld.w $t1, $fp, -108
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# call void @putint(i32 222)
	addi.w $a0, $zero, 222
	bl putint
# br label %label_ret13
# gen_phi
	b .main_label_ret13
.main_label_false12:
# %op25 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -112
# call void @putint(i32 333)
	addi.w $a0, $zero, 333
	bl putint
# br label %label_ret13
# gen_phi
	b .main_label_ret13
.main_label_ret13:
# %op26 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -116
# %op27 = sub i32 %op26, 1
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -120
# store i32 %op27, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -120
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# call void @putch(i32 97)
	addi.w $a0, $zero, 97
	bl putch
# %op28 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -124
# call void @putint(i32 %op28)
	ld.w $a0, $fp, -124
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# br label %label_condition0
# gen_phi
	b .main_label_condition0
.main_exit:
	addi.d $sp, $sp, 128
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
