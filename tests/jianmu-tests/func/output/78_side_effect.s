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
	addi.d $sp, $sp, -32
.inc_a_label_entry:
# %op0 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -20
# %op1 = add i32 %op0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -24
# store i32 %op1, i32* @a
	la.local $t0, a
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op2 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -28
# ret i32 %op2
# gen_phi
	ld.w $a0, $fp, -28
	b .inc_a_exit
.inc_a_exit:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -176
.main_label_entry:
# br label %label_condition0
# gen_phi
	addi.w $t0, $zero, 5
	st.w $t0, $fp, -20
	b .main_label_condition0
.main_label_condition0:
# %op0 = phi i32 [ 5, %label_entry ], [ %op46, %label_ret19 ]
# %op1 = icmp sge i32 %op0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	xori $t2, $t2, 1
	st.b $t2, $fp, -21
# %op2 = zext i1 %op1 to i32
	ld.b $t0, $fp, -21
	andi $t1, $t0, 1
	st.w $t1, $fp, -28
# %op3 = icmp sgt i32 %op2, zeroinitializer
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -29
# br i1 %op3, label %label_loop1, label %label_ret2
# gen_phi
	ld.b $t0, $fp, -29
	bnez $t0, .main_label_loop1
	b .main_label_ret2
.main_label_loop1:
# %op4 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -36
# %op5 = icmp sgt i32 %op4, zeroinitializer
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -37
# br i1 %op5, label %label_true3, label %label_false4
# gen_phi
	ld.b $t0, $fp, -37
	bnez $t0, .main_label_true3
	b .main_label_false4
.main_label_ret2:
# %op6 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -44
# call void @putint(i32 %op6)
	ld.w $a0, $fp, -44
	bl putint
# call void @putch(i32 32)
	addi.w $a0, $zero, 32
	bl putch
# %op7 = load i32, i32* @b
	la.local $t0, b
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -48
# call void @putint(i32 %op7)
	ld.w $a0, $fp, -48
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# %op8 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -52
# ret i32 %op8
# gen_phi
	ld.w $a0, $fp, -52
	b .main_exit
.main_label_true3:
# %op9 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -56
# %op10 = icmp sgt i32 %op9, zeroinitializer
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
# %op11 = icmp sgt i32 zeroinitializer, zeroinitializer
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
# %op12 = phi i1 [ %op10, %label_true3 ], [ %op11, %label_false4 ]
# %op13 = zext i1 %op12 to i32
	ld.b $t0, $fp, -59
	andi $t1, $t0, 1
	st.w $t1, $fp, -64
# %op14 = icmp sgt i32 %op13, zeroinitializer
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -65
# br i1 %op14, label %label_true6, label %label_false7
# gen_phi
	ld.b $t0, $fp, -65
	bnez $t0, .main_label_true6
	b .main_label_false7
.main_label_true6:
# %op15 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -72
# %op16 = icmp sgt i32 %op15, zeroinitializer
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
# %op17 = icmp sgt i32 zeroinitializer, zeroinitializer
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
# %op18 = phi i1 [ %op16, %label_true6 ], [ %op17, %label_false7 ], [ %op12, %label_true6 ], [ %op12, %label_false7 ]
# %op19 = zext i1 %op18 to i32
	ld.b $t0, $fp, -75
	andi $t1, $t0, 1
	st.w $t1, $fp, -80
# %op20 = icmp sgt i32 %op19, zeroinitializer
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -81
# br i1 %op20, label %label_true9, label %label_ret10
# gen_phi
	ld.b $t0, $fp, -81
	bnez $t0, .main_label_true9
	b .main_label_ret10
.main_label_true9:
# %op21 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -88
# call void @putint(i32 %op21)
	ld.w $a0, $fp, -88
	bl putint
# call void @putch(i32 32)
	addi.w $a0, $zero, 32
	bl putch
# %op22 = load i32, i32* @b
	la.local $t0, b
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -92
# call void @putint(i32 %op22)
	ld.w $a0, $fp, -92
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# br label %label_ret10
# gen_phi
	b .main_label_ret10
.main_label_ret10:
# %op23 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -96
# %op24 = icmp slt i32 %op23, 14
	ld.w $t0, $fp, -96
	addi.w $t1, $zero, 14
	slt $t2, $t0, $t1
	st.b $t2, $fp, -97
# %op25 = zext i1 %op24 to i32
	ld.b $t0, $fp, -97
	andi $t1, $t0, 1
	st.w $t1, $fp, -104
# %op26 = icmp sgt i32 %op25, zeroinitializer
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -105
# br i1 %op26, label %label_true11, label %label_false12
# gen_phi
	ld.b $t0, $fp, -105
	bnez $t0, .main_label_true11
	b .main_label_false12
.main_label_true11:
# %op27 = icmp sgt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -106
# br label %label_ret13
# gen_phi
	ld.b $t0, $fp, -106
	st.b $t0, $fp, -114
	b .main_label_ret13
.main_label_false12:
# %op28 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -112
# %op29 = icmp sgt i32 %op28, zeroinitializer
	ld.w $t0, $fp, -112
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -113
# br i1 %op29, label %label_true14, label %label_false15
# gen_phi
	ld.b $t0, $fp, -113
	bnez $t0, .main_label_true14
	b .main_label_false15
.main_label_ret13:
# %op30 = phi i1 [ %op27, %label_true11 ], [ %op41, %label_ret16 ], [ %op18, %label_true11 ], [ %op39, %label_ret16 ]
# %op31 = zext i1 %op30 to i32
	ld.b $t0, $fp, -114
	andi $t1, $t0, 1
	st.w $t1, $fp, -120
# %op32 = icmp sgt i32 %op31, zeroinitializer
	ld.w $t0, $fp, -120
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -121
# br i1 %op32, label %label_true17, label %label_false18
# gen_phi
	ld.b $t0, $fp, -121
	bnez $t0, .main_label_true17
	b .main_label_false18
.main_label_true14:
# %op33 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -128
# %op34 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -132
# %op35 = sub i32 %op33, %op34
	ld.w $t0, $fp, -128
	ld.w $t1, $fp, -132
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -136
# %op36 = add i32 %op35, 1
	ld.w $t0, $fp, -136
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -140
# %op37 = icmp sgt i32 %op36, zeroinitializer
	ld.w $t0, $fp, -140
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -141
# br label %label_ret16
# gen_phi
	ld.b $t0, $fp, -141
	st.b $t0, $fp, -143
	b .main_label_ret16
.main_label_false15:
# %op38 = icmp sgt i32 zeroinitializer, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -142
# br label %label_ret16
# gen_phi
	ld.b $t0, $fp, -142
	st.b $t0, $fp, -143
	b .main_label_ret16
.main_label_ret16:
# %op39 = phi i1 [ %op37, %label_true14 ], [ %op38, %label_false15 ], [ %op18, %label_true14 ], [ %op18, %label_false15 ]
# %op40 = zext i1 %op39 to i32
	ld.b $t0, $fp, -143
	andi $t1, $t0, 1
	st.w $t1, $fp, -148
# %op41 = icmp sgt i32 %op40, zeroinitializer
	ld.w $t0, $fp, -148
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -149
# br label %label_ret13
# gen_phi
	ld.b $t0, $fp, -149
	st.b $t0, $fp, -114
	b .main_label_ret13
.main_label_true17:
# %op42 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -156
# call void @putint(i32 %op42)
	ld.w $a0, $fp, -156
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# %op43 = load i32, i32* @b
	la.local $t0, b
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -160
# %op44 = mul i32 %op43, 2
	ld.w $t0, $fp, -160
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -164
# store i32 %op44, i32* @b
	la.local $t0, b
	ld.w $t1, $fp, -164
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_ret19
# gen_phi
	b .main_label_ret19
.main_label_false18:
# %op45 = call i32 @inc_a()
	bl inc_a
	st.w $a0, $fp, -168
# br label %label_ret19
# gen_phi
	b .main_label_ret19
.main_label_ret19:
# %op46 = sub i32 %op0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -172
# br label %label_condition0
# gen_phi
	ld.w $t0, $fp, -172
	st.w $t0, $fp, -20
	b .main_label_condition0
.main_exit:
	addi.d $sp, $sp, 176
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
