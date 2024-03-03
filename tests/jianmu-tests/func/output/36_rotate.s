# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl image
	.type image, @object
	.size image, 4194304
image:
	.space 4194304
	la.local $t0, image
	lu12i.w $t1, 256
	ori $t1, $t1, 0
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	.globl width
	.type width, @object
	.size width, 4
width:
	.space 4
	la.local $t0, width
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	.globl height
	.type height, @object
	.size height, 4
height:
	.space 4
	la.local $t0, height
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	.text
	.globl my_fabs
	.type my_fabs, @function
my_fabs:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -64
	fst.s $fa0, $fp, -20
.my_fabs_label_entry:
# %op1 = alloca float
	lu12i.w $t0, -1
	ori $t0, $t0, 4064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -32
# store float %arg0, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $fp, -20
	fst.s $ft0, $t0, 0
	addi.d $t0, $t0, 4
# %op2 = icmp sgt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -37
# br i1 %op2, label %label_true0, label %label_ret1
# gen_phi
	ld.b $t0, $fp, -37
	bnez $t0, .my_fabs_label_true0
	b .my_fabs_label_ret1
.my_fabs_label_true0:
# %op3 = load float, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -44
# ret float %op3
# gen_phi
	fld.s $fa0, $fp, -44
	b .my_fabs_exit
.my_fabs_label_ret1:
# %op4 = load float, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -48
# %op5 = fsub float zeroinitializer, %op4
	movgr2fr.w $ft0, $zero
	fld.s $ft1, $fp, -48
	fsub.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -52
# ret float %op5
# gen_phi
	fld.s $fa0, $fp, -52
	b .my_fabs_exit
.my_fabs_exit:
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl p
	.type p, @function
p:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
	fst.s $fa0, $fp, -20
.p_label_entry:
# %op1 = alloca float
	lu12i.w $t0, -1
	ori $t0, $t0, 4064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -32
# store float %arg0, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $fp, -20
	fst.s $ft0, $t0, 0
	addi.d $t0, $t0, 4
# %op2 = load float, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -40
# %op3 = sitofp i32 3 to float
	addi.w $t0, $zero, 3
	movgr2fr.w $ft0, $t0
	ffint.s.w $ft1, $ft0
	fst.s $ft1, $fp, -44
# %op4 = fmul float %op3, %op2
	fld.s $ft0, $fp, -44
	fld.s $ft1, $fp, -40
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -48
# %op5 = load float, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -52
# %op6 = sitofp i32 4 to float
	addi.w $t0, $zero, 4
	movgr2fr.w $ft0, $t0
	ffint.s.w $ft1, $ft0
	fst.s $ft1, $fp, -56
# %op7 = fmul float %op6, %op5
	fld.s $ft0, $fp, -56
	fld.s $ft1, $fp, -52
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -60
# %op8 = load float, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -64
# %op9 = fmul float %op7, %op8
	fld.s $ft0, $fp, -60
	fld.s $ft1, $fp, -64
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -68
# %op10 = load float, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -72
# %op11 = fmul float %op9, %op10
	fld.s $ft0, $fp, -68
	fld.s $ft1, $fp, -72
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -76
# %op12 = fsub float %op4, %op11
	fld.s $ft0, $fp, -48
	fld.s $ft1, $fp, -76
	fsub.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -80
# ret float %op12
# gen_phi
	fld.s $fa0, $fp, -80
	b .p_exit
.p_exit:
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl my_sin_impl
	.type my_sin_impl, @function
my_sin_impl:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -64
	fst.s $fa0, $fp, -20
.my_sin_impl_label_entry:
# %op1 = alloca float
	lu12i.w $t0, -1
	ori $t0, $t0, 4064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -32
# store float %arg0, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $fp, -20
	fst.s $ft0, $t0, 0
	addi.d $t0, $t0, 4
# %op2 = fcmp ugt float 0x3eb0c6f7a0000000, zeroinitializer
	lu12i.w $t8, 219235
	ori $t8, $t8, 1981
	movgr2fr.w $ft0, $t8
	movgr2fr.w $ft1, $zero
	fcmp.slt.s $fcc0, $ft1, $ft0
	bcnez $fcc0, .my_sin_impl_fcmp0_true
	b .my_sin_impl_fcmp0_false
.my_sin_impl_fcmp0_true:
	addi.w $t0, $zero, 1
	b .my_sin_impl_fcmp0_exit
.my_sin_impl_fcmp0_false:
	addi.w $t0, $zero, 0
	b .my_sin_impl_fcmp0_exit
.my_sin_impl_fcmp0_exit:
	st.b $t0, $fp, -37
# br i1 %op2, label %label_true2, label %label_ret3
# gen_phi
	ld.b $t0, $fp, -37
	bnez $t0, .my_sin_impl_label_true2
	b .my_sin_impl_label_ret3
.my_sin_impl_label_true2:
# %op3 = load float, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -44
# ret float %op3
# gen_phi
	fld.s $fa0, $fp, -44
	b .my_sin_impl_exit
.my_sin_impl_label_ret3:
# %op4 = load float, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -48
# %op5 = fdiv float %op4, 0x4008000000000000
	fld.s $ft0, $fp, -48
	lu12i.w $t8, 263168
	ori $t8, $t8, 0
	movgr2fr.w $ft1, $t8
	fdiv.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -52
# %op6 = call float @my_sin_impl(float %op5)
	fld.s $fa0, $fp, -52
	bl my_sin_impl
	fst.s $fa0, $fp, -56
# %op7 = call float @p(float %op6)
	fld.s $fa0, $fp, -56
	bl p
	fst.s $fa0, $fp, -60
# ret float %op7
# gen_phi
	fld.s $fa0, $fp, -60
	b .my_sin_impl_exit
.my_sin_impl_exit:
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl my_sin
	.type my_sin, @function
my_sin:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -128
	fst.s $fa0, $fp, -20
.my_sin_label_entry:
# %op1 = alloca float
	lu12i.w $t0, -1
	ori $t0, $t0, 4064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -32
# store float %arg0, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $fp, -20
	fst.s $ft0, $t0, 0
	addi.d $t0, $t0, 4
# %op2 = icmp sgt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -37
# br i1 %op2, label %label_true4, label %label_ret5
# gen_phi
	ld.b $t0, $fp, -37
	bnez $t0, .my_sin_label_true4
	b .my_sin_label_ret5
.my_sin_label_true4:
# %op3 = load float, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -44
# %op4 = fdiv float %op3, 0x401921fb60000000
	fld.s $ft0, $fp, -44
	lu12i.w $t8, 265360
	ori $t8, $t8, 4059
	movgr2fr.w $ft1, $t8
	fdiv.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -48
# %op5 = fptosi float %op4 to i32
	fld.s $ft0, $fp, -48
	ftintrz.w.s $ft1, $ft0
	movfr2gr.s $t0, $ft1
	st.w $t0, $fp, -52
# %op6 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4032
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -64
# store i32 %op5, i32* %op6
	ld.d $t0, $fp, -64
	ld.w $t1, $fp, -52
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op7 = load float, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -72
# %op8 = load i32, i32* %op6
	ld.d $t0, $fp, -64
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -76
# %op9 = sitofp i32 %op8 to float
	ld.w $t0, $fp, -76
	movgr2fr.w $ft0, $t0
	ffint.s.w $ft1, $ft0
	fst.s $ft1, $fp, -80
# %op10 = fmul float %op9, 0x401921fb60000000
	fld.s $ft0, $fp, -80
	lu12i.w $t8, 265360
	ori $t8, $t8, 4059
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -84
# %op11 = fsub float %op7, %op10
	fld.s $ft0, $fp, -72
	fld.s $ft1, $fp, -84
	fsub.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -88
# store float %op11, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $fp, -88
	fst.s $ft0, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_ret5
# gen_phi
	b .my_sin_label_ret5
.my_sin_label_ret5:
# %op12 = fcmp ugt float 0x400921fb60000000, zeroinitializer
	lu12i.w $t8, 263312
	ori $t8, $t8, 4059
	movgr2fr.w $ft0, $t8
	movgr2fr.w $ft1, $zero
	fcmp.slt.s $fcc0, $ft1, $ft0
	bcnez $fcc0, .my_sin_fcmp0_true
	b .my_sin_fcmp0_false
.my_sin_fcmp0_true:
	addi.w $t0, $zero, 1
	b .my_sin_fcmp0_exit
.my_sin_fcmp0_false:
	addi.w $t0, $zero, 0
	b .my_sin_fcmp0_exit
.my_sin_fcmp0_exit:
	st.b $t0, $fp, -89
# br i1 %op12, label %label_true6, label %label_ret7
# gen_phi
	ld.b $t0, $fp, -89
	bnez $t0, .my_sin_label_true6
	b .my_sin_label_ret7
.my_sin_label_true6:
# %op13 = load float, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -96
# %op14 = fsub float %op13, 0x401921fb60000000
	fld.s $ft0, $fp, -96
	lu12i.w $t8, 265360
	ori $t8, $t8, 4059
	movgr2fr.w $ft1, $t8
	fsub.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -100
# store float %op14, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $fp, -100
	fst.s $ft0, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_ret7
# gen_phi
	b .my_sin_label_ret7
.my_sin_label_ret7:
# %op15 = fcmp ugt float 0xc00921fb60000000, zeroinitializer
	lu12i.w $t8, -260976
	ori $t8, $t8, 4059
	movgr2fr.w $ft0, $t8
	movgr2fr.w $ft1, $zero
	fcmp.slt.s $fcc0, $ft1, $ft0
	bcnez $fcc0, .my_sin_fcmp1_true
	b .my_sin_fcmp1_false
.my_sin_fcmp1_true:
	addi.w $t0, $zero, 1
	b .my_sin_fcmp1_exit
.my_sin_fcmp1_false:
	addi.w $t0, $zero, 0
	b .my_sin_fcmp1_exit
.my_sin_fcmp1_exit:
	st.b $t0, $fp, -101
# br i1 %op15, label %label_true8, label %label_ret9
# gen_phi
	ld.b $t0, $fp, -101
	bnez $t0, .my_sin_label_true8
	b .my_sin_label_ret9
.my_sin_label_true8:
# %op16 = load float, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -108
# %op17 = fadd float %op16, 0x401921fb60000000
	fld.s $ft0, $fp, -108
	lu12i.w $t8, 265360
	ori $t8, $t8, 4059
	movgr2fr.w $ft1, $t8
	fadd.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -112
# store float %op17, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $fp, -112
	fst.s $ft0, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_ret9
# gen_phi
	b .my_sin_label_ret9
.my_sin_label_ret9:
# %op18 = load float, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -116
# %op19 = call float @my_sin_impl(float %op18)
	fld.s $fa0, $fp, -116
	bl my_sin_impl
	fst.s $fa0, $fp, -120
# ret float %op19
# gen_phi
	fld.s $fa0, $fp, -120
	b .my_sin_exit
.my_sin_exit:
	addi.d $sp, $sp, 128
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl my_cos
	.type my_cos, @function
my_cos:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	fst.s $fa0, $fp, -20
.my_cos_label_entry:
# %op1 = alloca float
	lu12i.w $t0, -1
	ori $t0, $t0, 4064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -32
# store float %arg0, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $fp, -20
	fst.s $ft0, $t0, 0
	addi.d $t0, $t0, 4
# %op2 = load float, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -40
# %op3 = fadd float %op2, 0x3ff921fb60000000
	fld.s $ft0, $fp, -40
	lu12i.w $t8, 261264
	ori $t8, $t8, 4059
	movgr2fr.w $ft1, $t8
	fadd.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -44
# %op4 = call float @my_sin(float %op3)
	fld.s $fa0, $fp, -44
	bl my_sin
	fst.s $fa0, $fp, -48
# ret float %op4
# gen_phi
	fld.s $fa0, $fp, -48
	b .my_cos_exit
.my_cos_exit:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl read_image
	.type read_image, @function
read_image:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -192
.read_image_label_entry:
# %op0 = call i32 @getch()
	bl getch
	st.w $a0, $fp, -20
# %op1 = icmp ne i32 %op0, 80
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 80
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -21
# %op2 = zext i1 %op1 to i32
	ld.b $t0, $fp, -21
	andi $t1, $t0, 1
	st.w $t1, $fp, -28
# %op3 = icmp sge i32 %op2, zeroinitializer
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	xori $t2, $t2, 1
	st.b $t2, $fp, -29
# br i1 %op3, label %label_true10, label %label_false11
# gen_phi
	ld.b $t0, $fp, -29
	bnez $t0, .read_image_label_true10
	b .read_image_label_false11
.read_image_label_true10:
# %op4 = icmp sgt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -30
# br label %label_ret12
# gen_phi
	ld.b $t0, $fp, -30
	st.b $t0, $fp, -46
	b .read_image_label_ret12
.read_image_label_false11:
# %op5 = call i32 @getch()
	bl getch
	st.w $a0, $fp, -36
# %op6 = icmp ne i32 %op5, 50
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 50
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -37
# %op7 = zext i1 %op6 to i32
	ld.b $t0, $fp, -37
	andi $t1, $t0, 1
	st.w $t1, $fp, -44
# %op8 = icmp sgt i32 %op7, zeroinitializer
	ld.w $t0, $fp, -44
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -45
# br label %label_ret12
# gen_phi
	ld.b $t0, $fp, -45
	st.b $t0, $fp, -46
	b .read_image_label_ret12
.read_image_label_ret12:
# %op9 = phi i1 [ %op4, %label_true10 ], [ %op8, %label_false11 ]
# %op10 = zext i1 %op9 to i32
	ld.b $t0, $fp, -46
	andi $t1, $t0, 1
	st.w $t1, $fp, -52
# %op11 = icmp sgt i32 %op10, zeroinitializer
	ld.w $t0, $fp, -52
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -53
# br i1 %op11, label %label_true13, label %label_ret14
# gen_phi
	ld.b $t0, $fp, -53
	bnez $t0, .read_image_label_true13
	b .read_image_label_ret14
.read_image_label_true13:
# ret i32 -1
# gen_phi
	addi.w $a0, $zero, -1
	b .read_image_exit
.read_image_label_ret14:
# %op12 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -60
# store i32 %op12, i32* @width
	la.local $t0, width
	ld.w $t1, $fp, -60
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op13 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -64
# store i32 %op13, i32* @height
	la.local $t0, height
	ld.w $t1, $fp, -64
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op14 = icmp sgt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -65
# br i1 %op14, label %label_true15, label %label_ret16
# gen_phi
	ld.b $t0, $fp, -65
	bnez $t0, .read_image_label_true15
	b .read_image_label_ret16
.read_image_label_true15:
# ret i32 -1
# gen_phi
	addi.w $a0, $zero, -1
	b .read_image_exit
.read_image_label_ret16:
# %op15 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4016
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -80
# store i32 0, i32* %op15
	ld.d $t0, $fp, -80
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_condition17
# gen_phi
	b .read_image_label_condition17
.read_image_label_condition17:
# %op16 = load i32, i32* @height
	la.local $t0, height
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -88
# %op17 = icmp sgt i32 %op16, zeroinitializer
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -89
# br i1 %op17, label %label_loop18, label %label_ret19
# gen_phi
	ld.b $t0, $fp, -89
	bnez $t0, .read_image_label_loop18
	b .read_image_label_ret19
.read_image_label_loop18:
# %op18 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3992
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -104
# store i32 0, i32* %op18
	ld.d $t0, $fp, -104
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_condition20
# gen_phi
	b .read_image_label_condition20
.read_image_label_ret19:
# ret i32 0
# gen_phi
	addi.w $a0, $zero, 0
	b .read_image_exit
.read_image_label_condition20:
# %op19 = load i32, i32* @width
	la.local $t0, width
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -112
# %op20 = icmp sgt i32 %op19, zeroinitializer
	ld.w $t0, $fp, -112
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -113
# br i1 %op20, label %label_loop21, label %label_ret22
# gen_phi
	ld.b $t0, $fp, -113
	bnez $t0, .read_image_label_loop21
	b .read_image_label_ret22
.read_image_label_loop21:
# %op21 = load i32, i32* %op15
	ld.d $t0, $fp, -80
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -120
# %op22 = load i32, i32* @width
	la.local $t0, width
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -124
# %op23 = mul i32 %op21, %op22
	ld.w $t0, $fp, -120
	ld.w $t1, $fp, -124
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -128
# %op24 = load i32, i32* %op18
	ld.d $t0, $fp, -104
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -132
# %op25 = add i32 %op23, %op24
	ld.w $t0, $fp, -128
	ld.w $t1, $fp, -132
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -136
# %op26 = icmp slt i32 %op25, zeroinitializer
	ld.w $t0, $fp, -136
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -137
# %op27 = zext i1 %op26 to i32
	ld.b $t0, $fp, -137
	andi $t1, $t0, 1
	st.w $t1, $fp, -144
# %op28 = add i32 %op27, zeroinitializer
	ld.w $t0, $fp, -144
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -148
# %op29 = icmp ne i32 %op28, zeroinitializer
	ld.w $t0, $fp, -148
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -149
# br i1 %op29, label %label_image_ltz23, label %label_image_gtz24
# gen_phi
	ld.b $t0, $fp, -149
	bnez $t0, .read_image_label_image_ltz23
	b .read_image_label_image_gtz24
.read_image_label_ret22:
# %op30 = load i32, i32* %op15
	ld.d $t0, $fp, -80
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -156
# %op31 = add i32 %op30, 1
	ld.w $t0, $fp, -156
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -160
# store i32 %op31, i32* %op15
	ld.d $t0, $fp, -80
	ld.w $t1, $fp, -160
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_condition17
# gen_phi
	b .read_image_label_condition17
.read_image_label_image_ltz23:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_image_gtz24
# gen_phi
	b .read_image_label_image_gtz24
.read_image_label_image_gtz24:
# %op32 = getelementptr [1048576 x i32], [1048576 x i32]* @image, i32 0, i32 %op25
	la.local $t0, image
	lu12i.w $t2, 1024
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -136
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -168
# %op33 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -172
# store i32 %op33, i32* %op32
	ld.d $t0, $fp, -168
	ld.w $t1, $fp, -172
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op34 = load i32, i32* %op18
	ld.d $t0, $fp, -104
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -176
# %op35 = add i32 %op34, 1
	ld.w $t0, $fp, -176
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -180
# store i32 %op35, i32* %op18
	ld.d $t0, $fp, -104
	ld.w $t1, $fp, -180
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_condition20
# gen_phi
	b .read_image_label_condition20
.read_image_exit:
	addi.d $sp, $sp, 192
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl rotate
	.type rotate, @function
rotate:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -416
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
	fst.s $fa0, $fp, -28
.rotate_label_entry:
# %op3 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4056
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -40
# store i32 %arg0, i32* %op3
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op4 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4040
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -56
# store i32 %arg1, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op5 = alloca float
	lu12i.w $t0, -1
	ori $t0, $t0, 4024
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -72
# store float %arg2, float* %op5
	ld.d $t0, $fp, -72
	fld.s $ft0, $fp, -28
	fst.s $ft0, $t0, 0
	addi.d $t0, $t0, 4
# %op6 = load float, float* %op5
	ld.d $t0, $fp, -72
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -80
# %op7 = call float @my_sin(float %op6)
	fld.s $fa0, $fp, -80
	bl my_sin
	fst.s $fa0, $fp, -84
# %op8 = fptosi float %op7 to i32
	fld.s $ft0, $fp, -84
	ftintrz.w.s $ft1, $ft0
	movfr2gr.s $t0, $ft1
	st.w $t0, $fp, -88
# %op9 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -96
# store i32 %op8, i32* %op9
	ld.d $t0, $fp, -96
	ld.w $t1, $fp, -88
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op10 = load float, float* %op5
	ld.d $t0, $fp, -72
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -104
# %op11 = call float @my_cos(float %op10)
	fld.s $fa0, $fp, -104
	bl my_cos
	fst.s $fa0, $fp, -108
# %op12 = fptosi float %op11 to i32
	fld.s $ft0, $fp, -108
	ftintrz.w.s $ft1, $ft0
	movfr2gr.s $t0, $ft1
	st.w $t0, $fp, -112
# %op13 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3976
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -120
# store i32 %op12, i32* %op13
	ld.d $t0, $fp, -120
	ld.w $t1, $fp, -112
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op14 = load i32, i32* @width
	la.local $t0, width
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -128
# %op15 = sdiv i32 %op14, 2
	ld.w $t0, $fp, -128
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -132
# %op16 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3952
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -144
# store i32 %op15, i32* %op16
	ld.d $t0, $fp, -144
	ld.w $t1, $fp, -132
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op17 = load i32, i32* @height
	la.local $t0, height
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -152
# %op18 = sdiv i32 %op17, 2
	ld.w $t0, $fp, -152
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -156
# %op19 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3928
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -168
# store i32 %op18, i32* %op19
	ld.d $t0, $fp, -168
	ld.w $t1, $fp, -156
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op20 = load i32, i32* %op3
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -176
# %op21 = load i32, i32* %op16
	ld.d $t0, $fp, -144
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -180
# %op22 = sub i32 %op20, %op21
	ld.w $t0, $fp, -176
	ld.w $t1, $fp, -180
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -184
# %op23 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3904
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -192
# store i32 %op22, i32* %op23
	ld.d $t0, $fp, -192
	ld.w $t1, $fp, -184
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op24 = load i32, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -200
# %op25 = load i32, i32* %op19
	ld.d $t0, $fp, -168
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -204
# %op26 = sub i32 %op24, %op25
	ld.w $t0, $fp, -200
	ld.w $t1, $fp, -204
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -208
# %op27 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3880
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -216
# store i32 %op26, i32* %op27
	ld.d $t0, $fp, -216
	ld.w $t1, $fp, -208
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op28 = load i32, i32* %op23
	ld.d $t0, $fp, -192
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -224
# %op29 = load i32, i32* %op13
	ld.d $t0, $fp, -120
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -228
# %op30 = mul i32 %op28, %op29
	ld.w $t0, $fp, -224
	ld.w $t1, $fp, -228
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -232
# %op31 = load i32, i32* %op27
	ld.d $t0, $fp, -216
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -236
# %op32 = load i32, i32* %op9
	ld.d $t0, $fp, -96
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -240
# %op33 = mul i32 %op31, %op32
	ld.w $t0, $fp, -236
	ld.w $t1, $fp, -240
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -244
# %op34 = sub i32 %op30, %op33
	ld.w $t0, $fp, -232
	ld.w $t1, $fp, -244
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -248
# %op35 = load i32, i32* %op16
	ld.d $t0, $fp, -144
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -252
# %op36 = add i32 %op34, %op35
	ld.w $t0, $fp, -248
	ld.w $t1, $fp, -252
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -256
# %op37 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3832
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -264
# store i32 %op36, i32* %op37
	ld.d $t0, $fp, -264
	ld.w $t1, $fp, -256
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op38 = load i32, i32* %op23
	ld.d $t0, $fp, -192
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -272
# %op39 = load i32, i32* %op9
	ld.d $t0, $fp, -96
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -276
# %op40 = mul i32 %op38, %op39
	ld.w $t0, $fp, -272
	ld.w $t1, $fp, -276
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -280
# %op41 = load i32, i32* %op27
	ld.d $t0, $fp, -216
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -284
# %op42 = load i32, i32* %op13
	ld.d $t0, $fp, -120
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -288
# %op43 = mul i32 %op41, %op42
	ld.w $t0, $fp, -284
	ld.w $t1, $fp, -288
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -292
# %op44 = add i32 %op40, %op43
	ld.w $t0, $fp, -280
	ld.w $t1, $fp, -292
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -296
# %op45 = load i32, i32* %op19
	ld.d $t0, $fp, -168
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -300
# %op46 = add i32 %op44, %op45
	ld.w $t0, $fp, -296
	ld.w $t1, $fp, -300
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -304
# %op47 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3784
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -312
# store i32 %op46, i32* %op47
	ld.d $t0, $fp, -312
	ld.w $t1, $fp, -304
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op48 = load i32, i32* @width
	la.local $t0, width
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -320
# %op49 = icmp sgt i32 %op48, zeroinitializer
	ld.w $t0, $fp, -320
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -321
# %op50 = zext i1 %op49 to i32
	ld.b $t0, $fp, -321
	andi $t1, $t0, 1
	st.w $t1, $fp, -328
# %op51 = icmp sge i32 %op50, zeroinitializer
	ld.w $t0, $fp, -328
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	xori $t2, $t2, 1
	st.b $t2, $fp, -329
# br i1 %op51, label %label_true25, label %label_false26
# gen_phi
	ld.b $t0, $fp, -329
	bnez $t0, .rotate_label_true25
	b .rotate_label_false26
.rotate_label_true25:
# %op52 = icmp sgt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -330
# br label %label_ret27
# gen_phi
	ld.b $t0, $fp, -330
	st.b $t0, $fp, -332
	b .rotate_label_ret27
.rotate_label_false26:
# %op53 = icmp sgt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -331
# br label %label_ret27
# gen_phi
	ld.b $t0, $fp, -331
	st.b $t0, $fp, -332
	b .rotate_label_ret27
.rotate_label_ret27:
# %op54 = phi i1 [ %op52, %label_true25 ], [ %op53, %label_false26 ]
# %op55 = zext i1 %op54 to i32
	ld.b $t0, $fp, -332
	andi $t1, $t0, 1
	st.w $t1, $fp, -336
# %op56 = icmp sge i32 %op55, zeroinitializer
	ld.w $t0, $fp, -336
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	xori $t2, $t2, 1
	st.b $t2, $fp, -337
# br i1 %op56, label %label_true28, label %label_false29
# gen_phi
	ld.b $t0, $fp, -337
	bnez $t0, .rotate_label_true28
	b .rotate_label_false29
.rotate_label_true28:
# %op57 = icmp sgt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -338
# br label %label_ret30
# gen_phi
	ld.b $t0, $fp, -338
	st.b $t0, $fp, -346
	b .rotate_label_ret30
.rotate_label_false29:
# %op58 = load i32, i32* @height
	la.local $t0, height
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -344
# %op59 = icmp sgt i32 %op58, zeroinitializer
	ld.w $t0, $fp, -344
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -345
# br label %label_ret30
# gen_phi
	ld.b $t0, $fp, -345
	st.b $t0, $fp, -346
	b .rotate_label_ret30
.rotate_label_ret30:
# %op60 = phi i1 [ %op57, %label_true28 ], [ %op59, %label_false29 ]
# %op61 = zext i1 %op60 to i32
	ld.b $t0, $fp, -346
	andi $t1, $t0, 1
	st.w $t1, $fp, -352
# %op62 = icmp sgt i32 %op61, zeroinitializer
	ld.w $t0, $fp, -352
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -353
# br i1 %op62, label %label_true31, label %label_ret32
# gen_phi
	ld.b $t0, $fp, -353
	bnez $t0, .rotate_label_true31
	b .rotate_label_ret32
.rotate_label_true31:
# ret i32 0
# gen_phi
	addi.w $a0, $zero, 0
	b .rotate_exit
.rotate_label_ret32:
# %op63 = load i32, i32* %op47
	ld.d $t0, $fp, -312
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -360
# %op64 = load i32, i32* @width
	la.local $t0, width
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -364
# %op65 = mul i32 %op63, %op64
	ld.w $t0, $fp, -360
	ld.w $t1, $fp, -364
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -368
# %op66 = load i32, i32* %op37
	ld.d $t0, $fp, -264
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -372
# %op67 = add i32 %op65, %op66
	ld.w $t0, $fp, -368
	ld.w $t1, $fp, -372
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -376
# %op68 = icmp slt i32 %op67, zeroinitializer
	ld.w $t0, $fp, -376
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -377
# %op69 = zext i1 %op68 to i32
	ld.b $t0, $fp, -377
	andi $t1, $t0, 1
	st.w $t1, $fp, -384
# %op70 = add i32 %op69, zeroinitializer
	ld.w $t0, $fp, -384
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -388
# %op71 = icmp ne i32 %op70, zeroinitializer
	ld.w $t0, $fp, -388
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -389
# br i1 %op71, label %label_image_ltz33, label %label_image_gtz34
# gen_phi
	ld.b $t0, $fp, -389
	bnez $t0, .rotate_label_image_ltz33
	b .rotate_label_image_gtz34
.rotate_label_image_ltz33:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_image_gtz34
# gen_phi
	b .rotate_label_image_gtz34
.rotate_label_image_gtz34:
# %op72 = getelementptr [1048576 x i32], [1048576 x i32]* @image, i32 0, i32 %op67
	la.local $t0, image
	lu12i.w $t2, 1024
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -376
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -400
# %op73 = load i32, i32* %op72
	ld.d $t0, $fp, -400
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -404
# ret i32 %op73
# gen_phi
	ld.w $a0, $fp, -404
	b .rotate_exit
.rotate_exit:
	addi.d $sp, $sp, 416
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl write_pgm
	.type write_pgm, @function
write_pgm:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -128
	fst.s $fa0, $fp, -20
.write_pgm_label_entry:
# %op1 = alloca float
	lu12i.w $t0, -1
	ori $t0, $t0, 4064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -32
# store float %arg0, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $fp, -20
	fst.s $ft0, $t0, 0
	addi.d $t0, $t0, 4
# call void @putch(i32 80)
	addi.w $a0, $zero, 80
	bl putch
# call void @putch(i32 50)
	addi.w $a0, $zero, 50
	bl putch
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# %op2 = load i32, i32* @width
	la.local $t0, width
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -40
# call void @putint(i32 %op2)
	ld.w $a0, $fp, -40
	bl putint
# call void @putch(i32 32)
	addi.w $a0, $zero, 32
	bl putch
# %op3 = load i32, i32* @height
	la.local $t0, height
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -44
# call void @putint(i32 %op3)
	ld.w $a0, $fp, -44
	bl putint
# call void @putch(i32 32)
	addi.w $a0, $zero, 32
	bl putch
# call void @putint(i32 255)
	addi.w $a0, $zero, 255
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# %op4 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4040
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -56
# store i32 0, i32* %op4
	ld.d $t0, $fp, -56
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_condition35
# gen_phi
	b .write_pgm_label_condition35
.write_pgm_label_condition35:
# %op5 = load i32, i32* @height
	la.local $t0, height
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -64
# %op6 = icmp sgt i32 %op5, zeroinitializer
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -65
# br i1 %op6, label %label_loop36, label %label_ret37
# gen_phi
	ld.b $t0, $fp, -65
	bnez $t0, .write_pgm_label_loop36
	b .write_pgm_label_ret37
.write_pgm_label_loop36:
# %op7 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4016
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -80
# store i32 0, i32* %op7
	ld.d $t0, $fp, -80
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_condition38
# gen_phi
	b .write_pgm_label_condition38
.write_pgm_label_ret37:
# ret void
# gen_phi
	addi.w $a0, $zero, 0
	b .write_pgm_exit
.write_pgm_label_condition38:
# %op8 = load i32, i32* @width
	la.local $t0, width
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -88
# %op9 = icmp sgt i32 %op8, zeroinitializer
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -89
# br i1 %op9, label %label_loop39, label %label_ret40
# gen_phi
	ld.b $t0, $fp, -89
	bnez $t0, .write_pgm_label_loop39
	b .write_pgm_label_ret40
.write_pgm_label_loop39:
# %op10 = load i32, i32* %op7
	ld.d $t0, $fp, -80
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -96
# %op11 = load i32, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -100
# %op12 = load float, float* %op1
	ld.d $t0, $fp, -32
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -104
# %op13 = call i32 @rotate(i32 %op10, i32 %op11, float %op12)
	ld.w $a0, $fp, -96
	ld.w $a1, $fp, -100
	fld.s $fa0, $fp, -104
	bl rotate
	st.w $a0, $fp, -108
# call void @putint(i32 %op13)
	ld.w $a0, $fp, -108
	bl putint
# call void @putch(i32 32)
	addi.w $a0, $zero, 32
	bl putch
# %op14 = load i32, i32* %op7
	ld.d $t0, $fp, -80
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -112
# %op15 = add i32 %op14, 1
	ld.w $t0, $fp, -112
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# store i32 %op15, i32* %op7
	ld.d $t0, $fp, -80
	ld.w $t1, $fp, -116
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_condition38
# gen_phi
	b .write_pgm_label_condition38
.write_pgm_label_ret40:
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# %op16 = load i32, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -120
# %op17 = add i32 %op16, 1
	ld.w $t0, $fp, -120
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -124
# store i32 %op17, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -124
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_condition35
# gen_phi
	b .write_pgm_label_condition35
.write_pgm_exit:
	addi.d $sp, $sp, 128
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -64
.main_label_entry:
# %op0 = call float @getfloat()
	bl getfloat
	fst.s $fa0, $fp, -20
# %op1 = fptosi float %op0 to i32
	fld.s $ft0, $fp, -20
	ftintrz.w.s $ft1, $ft0
	movfr2gr.s $t0, $ft1
	st.w $t0, $fp, -24
# %op2 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -32
# store i32 %op1, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op3 = call i32 @getch()
	bl getch
	st.w $a0, $fp, -40
# %op4 = icmp sgt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -41
# br i1 %op4, label %label_true41, label %label_ret42
# gen_phi
	ld.b $t0, $fp, -41
	bnez $t0, .main_label_true41
	b .main_label_ret42
.main_label_true41:
# ret i32 -1
# gen_phi
	addi.w $a0, $zero, -1
	b .main_exit
.main_label_ret42:
# %op5 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -48
# %op6 = sitofp i32 %op5 to float
	ld.w $t0, $fp, -48
	movgr2fr.w $ft0, $t0
	ffint.s.w $ft1, $ft0
	fst.s $ft1, $fp, -52
# call void @write_pgm(float %op6)
	fld.s $fa0, $fp, -52
	bl write_pgm
# ret i32 0
# gen_phi
	addi.w $a0, $zero, 0
	b .main_exit
.main_exit:
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
