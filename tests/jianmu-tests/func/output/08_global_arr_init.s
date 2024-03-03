# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl i
	.type i, @object
	.size i, 96
i:
	.space 96
	la.local $t0, i
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
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 12
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -16
.main_label_entry:
# ret i32 5
# gen_phi
	addi.w $a0, $zero, 5
	b .main_exit
.main_exit:
	addi.d $sp, $sp, 16
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
