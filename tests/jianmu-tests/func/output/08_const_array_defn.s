	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.main_label_entry:
# %op0 = icmp slt i32 4, zeroinitializer
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -17
# %op1 = zext i1 %op0 to i32
	ld.b $t0, $fp, -17
	andi $t1, $t0, 1
	st.w $t1, $fp, -24
# %op2 = add i32 %op1, zeroinitializer
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -28
# %op3 = icmp ne i32 %op2, zeroinitializer
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -29
# br i1 %op3, label %label_a_ltz0, label %label_a_gtz1
	ld.b $t0, $fp, -29
	bnez $t0, .main_label_a_ltz0
	b .main_label_a_gtz1
.main_label_a_ltz0:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a_gtz1
	b .main_label_a_gtz1
.main_label_a_gtz1:
# ret i32 4
	addi.w $a0, $zero, 4
	b .main_exit
.main_exit:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
