# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl a
	.type a, @object
	.size a, 4
a:
	.space 4
	la.local $t0, a
	addi.w $t1, $zero, 2
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
	.globl test
	.type test, @function
test:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.test_label_entry:
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
	b .test_exit
.test_exit:
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
	addi.d $sp, $sp, -32
.main_label_entry:
# %op0 = call i32 @test()
	bl test
	st.w $a0, $fp, -20
# %op1 = icmp sgt i32 %op0, zeroinitializer
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -21
# br i1 %op1, label %label_true0, label %label_ret1
# gen_phi
	ld.b $t0, $fp, -21
	bnez $t0, .main_label_true0
	b .main_label_ret1
.main_label_true0:
# call void @putint(i32 666)
	addi.w $a0, $zero, 666
	bl putint
# br label %label_ret1
# gen_phi
	b .main_label_ret1
.main_label_ret1:
# %op2 = load i32, i32* @a
	la.local $t0, a
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -28
# call void @putint(i32 %op2)
	ld.w $a0, $fp, -28
	bl putint
# ret i32 0
# gen_phi
	addi.w $a0, $zero, 0
	b .main_exit
.main_exit:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
