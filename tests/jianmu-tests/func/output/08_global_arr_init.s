# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl i
	.type i, @object
	.size i, 96
i:
	.space 96
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
	addi.w $a0, $zero, 5
	b .main_exit
.main_exit:
	addi.d $sp, $sp, 16
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
