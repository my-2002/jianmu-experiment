# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl a
	.type a, @object
	.size a, 4
a:
	.space 4
	.globl b
	.type b, @object
	.size b, 4
b:
	.space 4
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
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -48
# store i32 %op4, i32* @a
	la.local $t0, a
	ld.w $t1, $fp, -48
	st.w $t1, $t0, 0
# %op5 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -52
# ret i32 %op5
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
	addi.d $sp, $sp, -208
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
# br label %label_condition0
	b .main_label_condition0
.main_label_condition0:
# %op1 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -32
# %op2 = add i32 %op1, 0
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -36
# %op3 = icmp sge i32 %op1, 0
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	xori $t2, $t2, 1
	st.b $t2, $fp, -37
# %op4 = zext i1 %op3 to i32
	ld.b $t0, $fp, -37
	andi $t1, $t0, 1
	st.w $t1, $fp, -44
# %op5 = icmp sgt i32 %op4, zeroinitializer
	ld.w $t0, $fp, -44
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -45
# br i1 %op5, label %label_loop1, label %label_ret2
	ld.b $t0, $fp, -45
	bnez $t0, .main_label_loop1
	b .main_label_ret2
.main_label_loop1:
# %op6 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -52
# %op7 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -56
# %op8 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -60
# %op9 = add i32 %op8, %op7
	ld.w $t0, $fp, -60
	ld.w $t1, $fp, -56
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -64
# %op10 = icmp eq i32 %op9, 2
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 2
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -65
# %op11 = zext i1 %op10 to i32
	ld.b $t0, $fp, -65
	andi $t1, $t0, 1
	st.w $t1, $fp, -72
# %op12 = add i32 %op11, %op6
	ld.w $t0, $fp, -72
	ld.w $t1, $fp, -52
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# %op13 = icmp eq i32 %op12, 2
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 2
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -77
# %op14 = zext i1 %op13 to i32
	ld.b $t0, $fp, -77
	andi $t1, $t0, 1
	st.w $t1, $fp, -84
# %op15 = icmp sgt i32 %op14, zeroinitializer
	ld.w $t0, $fp, -84
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -85
# br i1 %op15, label %label_true3, label %label_ret4
	ld.b $t0, $fp, -85
	bnez $t0, .main_label_true3
	b .main_label_ret4
.main_label_ret2:
# %op16 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -92
# call void @putint(i32 %op16)
	ld.w $a0, $fp, -92
	bl putint
# call void @putch(i32 32)
	addi.w $a0, $zero, 32
	bl putch
# %op17 = load i32, i32* @b
	la.local $t0, b
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -96
# call void @putint(i32 %op17)
	ld.w $a0, $fp, -96
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# %op18 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -100
# ret i32 %op18
	ld.w $a0, $fp, -100
	b .main_exit
.main_label_true3:
# %op19 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -104
# call void @putint(i32 %op19)
	ld.w $a0, $fp, -104
	bl putint
# call void @putch(i32 32)
	addi.w $a0, $zero, 32
	bl putch
# %op20 = load i32, i32* @b
	la.local $t0, b
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -108
# call void @putint(i32 %op20)
	ld.w $a0, $fp, -108
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# call void @putint(i32 111)
	addi.w $a0, $zero, 111
	bl putint
# br label %label_ret4
	b .main_label_ret4
.main_label_ret4:
# %op21 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -112
# %op22 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -116
# %op23 = sub i32 %op21, %op22
	ld.w $t0, $fp, -112
	ld.w $t1, $fp, -116
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -120
# %op24 = add i32 %op23, 1
	ld.w $t0, $fp, -120
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -124
# %op25 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -128
# %op26 = add i32 %op25, %op24
	ld.w $t0, $fp, -128
	ld.w $t1, $fp, -124
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -132
# %op27 = icmp eq i32 %op26, 2
	ld.w $t0, $fp, -132
	addi.w $t1, $zero, 2
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -133
# %op28 = zext i1 %op27 to i32
	ld.b $t0, $fp, -133
	andi $t1, $t0, 1
	st.w $t1, $fp, -140
# %op29 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -144
# %op30 = add i32 %op29, 14
	ld.w $t0, $fp, -144
	addi.w $t1, $zero, 14
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -148
# %op31 = icmp slt i32 %op29, 14
	ld.w $t0, $fp, -144
	addi.w $t1, $zero, 14
	slt $t2, $t0, $t1
	st.b $t2, $fp, -149
# %op32 = zext i1 %op31 to i32
	ld.b $t0, $fp, -149
	andi $t1, $t0, 1
	st.w $t1, $fp, -156
# %op33 = add i32 %op32, %op28
	ld.w $t0, $fp, -156
	ld.w $t1, $fp, -140
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -160
# %op34 = icmp sge i32 %op33, 1
	ld.w $t0, $fp, -160
	addi.w $t1, $zero, 1
	slt $t2, $t0, $t1
	xori $t2, $t2, 1
	st.b $t2, $fp, -161
# %op35 = zext i1 %op34 to i32
	ld.b $t0, $fp, -161
	andi $t1, $t0, 1
	st.w $t1, $fp, -168
# %op36 = icmp sgt i32 %op35, zeroinitializer
	ld.w $t0, $fp, -168
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -169
# br i1 %op36, label %label_true5, label %label_false6
	ld.b $t0, $fp, -169
	bnez $t0, .main_label_true5
	b .main_label_false6
.main_label_true5:
# %op37 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -176
# call void @putint(i32 %op37)
	ld.w $a0, $fp, -176
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# %op38 = load i32, i32* @b
	la.local $t0, b
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -180
# %op39 = mul i32 %op38, 2
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -184
# store i32 %op39, i32* @b
	la.local $t0, b
	ld.w $t1, $fp, -184
	st.w $t1, $t0, 0
# call void @putint(i32 222)
	addi.w $a0, $zero, 222
	bl putint
# br label %label_ret7
	b .main_label_ret7
.main_label_false6:
# %op40 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -188
# call void @putint(i32 333)
	addi.w $a0, $zero, 333
	bl putint
# br label %label_ret7
	b .main_label_ret7
.main_label_ret7:
# %op41 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -192
# %op42 = sub i32 %op41, 1
	ld.w $t0, $fp, -192
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -196
# store i32 %op42, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -196
	st.w $t1, $t0, 0
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# call void @putch(i32 97)
	addi.w $a0, $zero, 97
	bl putch
# %op43 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -200
# call void @putint(i32 %op43)
	ld.w $a0, $fp, -200
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# br label %label_condition0
	b .main_label_condition0
.main_exit:
	addi.d $sp, $sp, 208
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
