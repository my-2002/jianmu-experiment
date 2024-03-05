# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl a0
	.type a0, @object
	.size a0, 12
a0:
	.space 12
	la.local $t0, a0
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	.globl b0
	.type b0, @object
	.size b0, 16
b0:
	.space 16
	la.local $t0, b0
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	.globl c0
	.type c0, @object
	.size c0, 28
c0:
	.space 28
	la.local $t0, c0
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 8
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 9
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	.globl d0
	.type d0, @object
	.size d0, 44
d0:
	.space 44
	la.local $t0, d0
	addi.w $t1, $zero, 11
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	.globl e0
	.type e0, @object
	.size e0, 8
e0:
	.space 8
	la.local $t0, e0
	addi.w $t1, $zero, 22
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 33
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	.globl f0
	.type f0, @object
	.size f0, 24
f0:
	.space 24
	la.local $t0, f0
	addi.w $t1, $zero, 6
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	.globl g0
	.type g0, @object
	.size g0, 36
g0:
	.space 36
	la.local $t0, g0
	addi.w $t1, $zero, 85
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 29
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
	.globl a
	.type a, @object
	.size a, 60
a:
	.space 60
	la.local $t0, a
	addi.w $t1, $zero, 15
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	.globl b
	.type b, @object
	.size b, 60
b:
	.space 60
	la.local $t0, b
	addi.w $t1, $zero, 3
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 3
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 3
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 3
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 3
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	.globl c
	.type c, @object
	.size c, 60
c:
	.space 60
	la.local $t0, c
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
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 7
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 8
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 9
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 11
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 12
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 13
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 14
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 15
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	.globl d
	.type d, @object
	.size d, 60
d:
	.space 60
	la.local $t0, d
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
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 7
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 8
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 9
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 11
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 12
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 13
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 14
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 15
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	.globl e
	.type e, @object
	.size e, 60
e:
	.space 60
	la.local $t0, e
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
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 7
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 8
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 9
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 11
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 12
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 13
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 14
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 15
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	.globl f
	.type f, @object
	.size f, 20
f:
	.space 20
	la.local $t0, f
	addi.w $t1, $zero, 5
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	.globl g
	.type g, @object
	.size g, 60
g:
	.space 60
	la.local $t0, g
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
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 7
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 11
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 12
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 3
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	.globl h
	.type h, @object
	.size h, 12
h:
	.space 12
	la.local $t0, h
	addi.w $t1, $zero, 3
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
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
