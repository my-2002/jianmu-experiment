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
	addi.d $sp, $sp, -48
	fst.s $fa0, $fp, -20
.my_fabs_label_entry:
# %op1 = sitofp i32 0 to float
	addi.w $t0, $zero, 0
	movgr2fr.w $ft0, $t0
	ffint.s.w $ft1, $ft0
	fst.s $ft1, $fp, -24
# %op2 = fcmp ugt float %arg0, %op1
	fld.s $ft0, $fp, -20
	fld.s $ft1, $fp, -24
	fcmp.slt.s $fcc0, $ft1, $ft0
	bcnez $fcc0, .my_fabs_fcmp0_true
	b .my_fabs_fcmp0_false
.my_fabs_fcmp0_true:
	addi.w $t0, $zero, 1
	b .my_fabs_fcmp0_exit
.my_fabs_fcmp0_false:
	addi.w $t0, $zero, 0
	b .my_fabs_fcmp0_exit
.my_fabs_fcmp0_exit:
	st.b $t0, $fp, -25
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -25
	andi $t1, $t0, 1
	st.w $t1, $fp, -32
# %op4 = icmp sgt i32 %op3, zeroinitializer
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -33
# br i1 %op4, label %label_true0, label %label_ret1
# gen_phi
	ld.b $t0, $fp, -33
	bnez $t0, .my_fabs_label_true0
	b .my_fabs_label_ret1
.my_fabs_label_true0:
# ret float %arg0
# gen_phi
	fld.s $fa0, $fp, -20
	b .my_fabs_exit
.my_fabs_label_ret1:
# %op5 = fsub float zeroinitializer, %arg0
	movgr2fr.w $ft0, $zero
	fld.s $ft1, $fp, -20
	fsub.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -40
# ret float %op5
# gen_phi
	fld.s $fa0, $fp, -40
	b .my_fabs_exit
.my_fabs_exit:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl p
	.type p, @function
p:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	fst.s $fa0, $fp, -20
.p_label_entry:
# %op1 = sitofp i32 3 to float
	addi.w $t0, $zero, 3
	movgr2fr.w $ft0, $t0
	ffint.s.w $ft1, $ft0
	fst.s $ft1, $fp, -24
# %op2 = fmul float %op1, %arg0
	fld.s $ft0, $fp, -24
	fld.s $ft1, $fp, -20
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -28
# %op3 = sitofp i32 4 to float
	addi.w $t0, $zero, 4
	movgr2fr.w $ft0, $t0
	ffint.s.w $ft1, $ft0
	fst.s $ft1, $fp, -32
# %op4 = fmul float %op3, %arg0
	fld.s $ft0, $fp, -32
	fld.s $ft1, $fp, -20
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -36
# %op5 = fmul float %op4, %arg0
	fld.s $ft0, $fp, -36
	fld.s $ft1, $fp, -20
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -40
# %op6 = fmul float %op5, %arg0
	fld.s $ft0, $fp, -40
	fld.s $ft1, $fp, -20
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -44
# %op7 = fsub float %op2, %op6
	fld.s $ft0, $fp, -28
	fld.s $ft1, $fp, -44
	fsub.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -48
# ret float %op7
# gen_phi
	fld.s $fa0, $fp, -48
	b .p_exit
.p_exit:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl my_sin_impl
	.type my_sin_impl, @function
my_sin_impl:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	fst.s $fa0, $fp, -20
.my_sin_impl_label_entry:
# %op1 = call float @my_fabs(float %arg0)
	fld.s $fa0, $fp, -20
	bl my_fabs
	fst.s $fa0, $fp, -24
# %op2 = fcmp ule float %op1, 0x3eb0c6f7a0000000
	fld.s $ft0, $fp, -24
	lu12i.w $t8, 219235
	ori $t8, $t8, 1981
	movgr2fr.w $ft1, $t8
	fcmp.sle.s $fcc0, $ft0, $ft1
	bcnez $fcc0, .my_sin_impl_fcmp0_true
	b .my_sin_impl_fcmp0_false
.my_sin_impl_fcmp0_true:
	addi.w $t0, $zero, 1
	b .my_sin_impl_fcmp0_exit
.my_sin_impl_fcmp0_false:
	addi.w $t0, $zero, 0
	b .my_sin_impl_fcmp0_exit
.my_sin_impl_fcmp0_exit:
	st.b $t0, $fp, -25
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -25
	andi $t1, $t0, 1
	st.w $t1, $fp, -32
# %op4 = icmp sgt i32 %op3, zeroinitializer
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -33
# br i1 %op4, label %label_true2, label %label_ret3
# gen_phi
	ld.b $t0, $fp, -33
	bnez $t0, .my_sin_impl_label_true2
	b .my_sin_impl_label_ret3
.my_sin_impl_label_true2:
# ret float %arg0
# gen_phi
	fld.s $fa0, $fp, -20
	b .my_sin_impl_exit
.my_sin_impl_label_ret3:
# %op5 = fdiv float %arg0, 0x4008000000000000
	fld.s $ft0, $fp, -20
	lu12i.w $t8, 263168
	ori $t8, $t8, 0
	movgr2fr.w $ft1, $t8
	fdiv.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -40
# %op6 = call float @my_sin_impl(float %op5)
	fld.s $fa0, $fp, -40
	bl my_sin_impl
	fst.s $fa0, $fp, -44
# %op7 = call float @p(float %op6)
	fld.s $fa0, $fp, -44
	bl p
	fst.s $fa0, $fp, -48
# ret float %op7
# gen_phi
	fld.s $fa0, $fp, -48
	b .my_sin_impl_exit
.my_sin_impl_exit:
	addi.d $sp, $sp, 48
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
# %op1 = fcmp ugt float %arg0, 0x401921fb60000000
	fld.s $ft0, $fp, -20
	lu12i.w $t8, 265360
	ori $t8, $t8, 4059
	movgr2fr.w $ft1, $t8
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
	st.b $t0, $fp, -21
# %op2 = zext i1 %op1 to i32
	ld.b $t0, $fp, -21
	andi $t1, $t0, 1
	st.w $t1, $fp, -28
# %op3 = icmp sgt i32 %op2, zeroinitializer
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -29
# br i1 %op3, label %label_true4, label %label_false5
# gen_phi
	ld.b $t0, $fp, -29
	bnez $t0, .my_sin_label_true4
	b .my_sin_label_false5
.my_sin_label_true4:
# %op4 = icmp sgt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -30
# br label %label_ret6
# gen_phi
	ld.b $t0, $fp, -30
	st.b $t0, $fp, -38
	b .my_sin_label_ret6
.my_sin_label_false5:
# %op5 = fcmp ult float %arg0, 0xc01921fb60000000
	fld.s $ft0, $fp, -20
	lu12i.w $t8, -258928
	ori $t8, $t8, 4059
	movgr2fr.w $ft1, $t8
	fcmp.slt.s $fcc0, $ft0, $ft1
	bcnez $fcc0, .my_sin_fcmp1_true
	b .my_sin_fcmp1_false
.my_sin_fcmp1_true:
	addi.w $t0, $zero, 1
	b .my_sin_fcmp1_exit
.my_sin_fcmp1_false:
	addi.w $t0, $zero, 0
	b .my_sin_fcmp1_exit
.my_sin_fcmp1_exit:
	st.b $t0, $fp, -31
# %op6 = zext i1 %op5 to i32
	ld.b $t0, $fp, -31
	andi $t1, $t0, 1
	st.w $t1, $fp, -36
# %op7 = icmp sgt i32 %op6, zeroinitializer
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -37
# br label %label_ret6
# gen_phi
	ld.b $t0, $fp, -37
	st.b $t0, $fp, -38
	b .my_sin_label_ret6
.my_sin_label_ret6:
# %op8 = phi i1 [ %op4, %label_true4 ], [ %op7, %label_false5 ]
# %op9 = zext i1 %op8 to i32
	ld.b $t0, $fp, -38
	andi $t1, $t0, 1
	st.w $t1, $fp, -44
# %op10 = icmp sgt i32 %op9, zeroinitializer
	ld.w $t0, $fp, -44
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -45
# br i1 %op10, label %label_true7, label %label_ret8
# gen_phi
	fld.s $ft0, $fp, -20
	fst.s $ft0, $fp, -72
	ld.b $t0, $fp, -45
	bnez $t0, .my_sin_label_true7
	b .my_sin_label_ret8
.my_sin_label_true7:
# %op11 = fdiv float %arg0, 0x401921fb60000000
	fld.s $ft0, $fp, -20
	lu12i.w $t8, 265360
	ori $t8, $t8, 4059
	movgr2fr.w $ft1, $t8
	fdiv.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -52
# %op12 = fptosi float %op11 to i32
	fld.s $ft0, $fp, -52
	ftintrz.w.s $ft1, $ft0
	movfr2gr.s $t0, $ft1
	st.w $t0, $fp, -56
# %op13 = sitofp i32 %op12 to float
	ld.w $t0, $fp, -56
	movgr2fr.w $ft0, $t0
	ffint.s.w $ft1, $ft0
	fst.s $ft1, $fp, -60
# %op14 = fmul float %op13, 0x401921fb60000000
	fld.s $ft0, $fp, -60
	lu12i.w $t8, 265360
	ori $t8, $t8, 4059
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -64
# %op15 = fsub float %arg0, %op14
	fld.s $ft0, $fp, -20
	fld.s $ft1, $fp, -64
	fsub.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -68
# br label %label_ret8
# gen_phi
	fld.s $ft0, $fp, -68
	fst.s $ft0, $fp, -72
	b .my_sin_label_ret8
.my_sin_label_ret8:
# %op16 = phi float [ %arg0, %label_ret6 ], [ %op15, %label_true7 ]
# %op17 = fcmp ugt float %op16, 0x400921fb60000000
	fld.s $ft0, $fp, -72
	lu12i.w $t8, 263312
	ori $t8, $t8, 4059
	movgr2fr.w $ft1, $t8
	fcmp.slt.s $fcc0, $ft1, $ft0
	bcnez $fcc0, .my_sin_fcmp2_true
	b .my_sin_fcmp2_false
.my_sin_fcmp2_true:
	addi.w $t0, $zero, 1
	b .my_sin_fcmp2_exit
.my_sin_fcmp2_false:
	addi.w $t0, $zero, 0
	b .my_sin_fcmp2_exit
.my_sin_fcmp2_exit:
	st.b $t0, $fp, -73
# %op18 = zext i1 %op17 to i32
	ld.b $t0, $fp, -73
	andi $t1, $t0, 1
	st.w $t1, $fp, -80
# %op19 = icmp sgt i32 %op18, zeroinitializer
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -81
# br i1 %op19, label %label_true9, label %label_ret10
# gen_phi
	fld.s $ft0, $fp, -72
	fst.s $ft0, $fp, -92
	ld.b $t0, $fp, -81
	bnez $t0, .my_sin_label_true9
	b .my_sin_label_ret10
.my_sin_label_true9:
# %op20 = fsub float %op16, 0x401921fb60000000
	fld.s $ft0, $fp, -72
	lu12i.w $t8, 265360
	ori $t8, $t8, 4059
	movgr2fr.w $ft1, $t8
	fsub.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -88
# br label %label_ret10
# gen_phi
	fld.s $ft0, $fp, -88
	fst.s $ft0, $fp, -92
	b .my_sin_label_ret10
.my_sin_label_ret10:
# %op21 = phi float [ %op16, %label_ret8 ], [ %op20, %label_true9 ]
# %op22 = fcmp ult float %op21, 0xc00921fb60000000
	fld.s $ft0, $fp, -92
	lu12i.w $t8, -260976
	ori $t8, $t8, 4059
	movgr2fr.w $ft1, $t8
	fcmp.slt.s $fcc0, $ft0, $ft1
	bcnez $fcc0, .my_sin_fcmp3_true
	b .my_sin_fcmp3_false
.my_sin_fcmp3_true:
	addi.w $t0, $zero, 1
	b .my_sin_fcmp3_exit
.my_sin_fcmp3_false:
	addi.w $t0, $zero, 0
	b .my_sin_fcmp3_exit
.my_sin_fcmp3_exit:
	st.b $t0, $fp, -93
# %op23 = zext i1 %op22 to i32
	ld.b $t0, $fp, -93
	andi $t1, $t0, 1
	st.w $t1, $fp, -100
# %op24 = icmp sgt i32 %op23, zeroinitializer
	ld.w $t0, $fp, -100
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -101
# br i1 %op24, label %label_true11, label %label_ret12
# gen_phi
	fld.s $ft0, $fp, -92
	fst.s $ft0, $fp, -112
	ld.b $t0, $fp, -101
	bnez $t0, .my_sin_label_true11
	b .my_sin_label_ret12
.my_sin_label_true11:
# %op25 = fadd float %op21, 0x401921fb60000000
	fld.s $ft0, $fp, -92
	lu12i.w $t8, 265360
	ori $t8, $t8, 4059
	movgr2fr.w $ft1, $t8
	fadd.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -108
# br label %label_ret12
# gen_phi
	fld.s $ft0, $fp, -108
	fst.s $ft0, $fp, -112
	b .my_sin_label_ret12
.my_sin_label_ret12:
# %op26 = phi float [ %op21, %label_ret10 ], [ %op25, %label_true11 ]
# %op27 = call float @my_sin_impl(float %op26)
	fld.s $fa0, $fp, -112
	bl my_sin_impl
	fst.s $fa0, $fp, -116
# ret float %op27
# gen_phi
	fld.s $fa0, $fp, -116
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
	addi.d $sp, $sp, -32
	fst.s $fa0, $fp, -20
.my_cos_label_entry:
# %op1 = fadd float %arg0, 0x3ff921fb60000000
	fld.s $ft0, $fp, -20
	lu12i.w $t8, 261264
	ori $t8, $t8, 4059
	movgr2fr.w $ft1, $t8
	fadd.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -24
# %op2 = call float @my_sin(float %op1)
	fld.s $fa0, $fp, -24
	bl my_sin
	fst.s $fa0, $fp, -28
# ret float %op2
# gen_phi
	fld.s $fa0, $fp, -28
	b .my_cos_exit
.my_cos_exit:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl read_image
	.type read_image, @function
read_image:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -224
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
# %op3 = icmp sgt i32 %op2, zeroinitializer
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -29
# br i1 %op3, label %label_true13, label %label_false14
# gen_phi
	ld.b $t0, $fp, -29
	bnez $t0, .read_image_label_true13
	b .read_image_label_false14
.read_image_label_true13:
# %op4 = icmp sgt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -30
# br label %label_ret15
# gen_phi
	ld.b $t0, $fp, -30
	st.b $t0, $fp, -46
	b .read_image_label_ret15
.read_image_label_false14:
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
# br label %label_ret15
# gen_phi
	ld.b $t0, $fp, -45
	st.b $t0, $fp, -46
	b .read_image_label_ret15
.read_image_label_ret15:
# %op9 = phi i1 [ %op4, %label_true13 ], [ %op8, %label_false14 ]
# %op10 = zext i1 %op9 to i32
	ld.b $t0, $fp, -46
	andi $t1, $t0, 1
	st.w $t1, $fp, -52
# %op11 = icmp sgt i32 %op10, zeroinitializer
	ld.w $t0, $fp, -52
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -53
# br i1 %op11, label %label_true16, label %label_ret17
# gen_phi
	ld.b $t0, $fp, -53
	bnez $t0, .read_image_label_true16
	b .read_image_label_ret17
.read_image_label_true16:
# ret i32 -1
# gen_phi
	addi.w $a0, $zero, -1
	b .read_image_exit
.read_image_label_ret17:
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
# %op14 = load i32, i32* @width
	la.local $t0, width
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -68
# %op15 = icmp sgt i32 %op14, 1024
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 1024
	slt $t2, $t1, $t0
	st.b $t2, $fp, -69
# %op16 = zext i1 %op15 to i32
	ld.b $t0, $fp, -69
	andi $t1, $t0, 1
	st.w $t1, $fp, -76
# %op17 = icmp sgt i32 %op16, zeroinitializer
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -77
# br i1 %op17, label %label_true18, label %label_false19
# gen_phi
	ld.b $t0, $fp, -77
	bnez $t0, .read_image_label_true18
	b .read_image_label_false19
.read_image_label_true18:
# %op18 = icmp sgt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -78
# br label %label_ret20
# gen_phi
	ld.b $t0, $fp, -78
	st.b $t0, $fp, -94
	b .read_image_label_ret20
.read_image_label_false19:
# %op19 = load i32, i32* @height
	la.local $t0, height
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -84
# %op20 = icmp sgt i32 %op19, 1024
	ld.w $t0, $fp, -84
	addi.w $t1, $zero, 1024
	slt $t2, $t1, $t0
	st.b $t2, $fp, -85
# %op21 = zext i1 %op20 to i32
	ld.b $t0, $fp, -85
	andi $t1, $t0, 1
	st.w $t1, $fp, -92
# %op22 = icmp sgt i32 %op21, zeroinitializer
	ld.w $t0, $fp, -92
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -93
# br label %label_ret20
# gen_phi
	ld.b $t0, $fp, -93
	st.b $t0, $fp, -94
	b .read_image_label_ret20
.read_image_label_ret20:
# %op23 = phi i1 [ %op18, %label_true18 ], [ %op22, %label_false19 ], [ %op9, %label_true18 ], [ %op9, %label_false19 ]
# %op24 = zext i1 %op23 to i32
	ld.b $t0, $fp, -94
	andi $t1, $t0, 1
	st.w $t1, $fp, -100
# %op25 = icmp sgt i32 %op24, zeroinitializer
	ld.w $t0, $fp, -100
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -101
# br i1 %op25, label %label_true21, label %label_false22
# gen_phi
	ld.b $t0, $fp, -101
	bnez $t0, .read_image_label_true21
	b .read_image_label_false22
.read_image_label_true21:
# %op26 = icmp sgt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -102
# br label %label_ret23
# gen_phi
	ld.b $t0, $fp, -102
	st.b $t0, $fp, -118
	b .read_image_label_ret23
.read_image_label_false22:
# %op27 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -108
# %op28 = icmp ne i32 %op27, 255
	ld.w $t0, $fp, -108
	addi.w $t1, $zero, 255
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -109
# %op29 = zext i1 %op28 to i32
	ld.b $t0, $fp, -109
	andi $t1, $t0, 1
	st.w $t1, $fp, -116
# %op30 = icmp sgt i32 %op29, zeroinitializer
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -117
# br label %label_ret23
# gen_phi
	ld.b $t0, $fp, -117
	st.b $t0, $fp, -118
	b .read_image_label_ret23
.read_image_label_ret23:
# %op31 = phi i1 [ %op26, %label_true21 ], [ %op30, %label_false22 ], [ %op23, %label_true21 ], [ %op23, %label_false22 ]
# %op32 = zext i1 %op31 to i32
	ld.b $t0, $fp, -118
	andi $t1, $t0, 1
	st.w $t1, $fp, -124
# %op33 = icmp sgt i32 %op32, zeroinitializer
	ld.w $t0, $fp, -124
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -125
# br i1 %op33, label %label_true24, label %label_ret25
# gen_phi
	ld.b $t0, $fp, -125
	bnez $t0, .read_image_label_true24
	b .read_image_label_ret25
.read_image_label_true24:
# ret i32 -1
# gen_phi
	addi.w $a0, $zero, -1
	b .read_image_exit
.read_image_label_ret25:
# br label %label_condition26
# gen_phi
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -132
	b .read_image_label_condition26
.read_image_label_condition26:
# %op34 = phi i32 [ 0, %label_ret25 ], [ %op51, %label_ret31 ]
# %op35 = load i32, i32* @height
	la.local $t0, height
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -136
# %op36 = icmp slt i32 %op34, %op35
	ld.w $t0, $fp, -132
	ld.w $t1, $fp, -136
	slt $t2, $t0, $t1
	st.b $t2, $fp, -137
# %op37 = zext i1 %op36 to i32
	ld.b $t0, $fp, -137
	andi $t1, $t0, 1
	st.w $t1, $fp, -144
# %op38 = icmp sgt i32 %op37, zeroinitializer
	ld.w $t0, $fp, -144
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -145
# br i1 %op38, label %label_loop27, label %label_ret28
# gen_phi
	ld.b $t0, $fp, -145
	bnez $t0, .read_image_label_loop27
	b .read_image_label_ret28
.read_image_label_loop27:
# br label %label_condition29
# gen_phi
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -152
	b .read_image_label_condition29
.read_image_label_ret28:
# ret i32 0
# gen_phi
	addi.w $a0, $zero, 0
	b .read_image_exit
.read_image_label_condition29:
# %op39 = phi i32 [ 0, %label_loop27 ], [ %op54, %label_image_gtz33 ]
# %op40 = load i32, i32* @width
	la.local $t0, width
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -156
# %op41 = icmp slt i32 %op39, %op40
	ld.w $t0, $fp, -152
	ld.w $t1, $fp, -156
	slt $t2, $t0, $t1
	st.b $t2, $fp, -157
# %op42 = zext i1 %op41 to i32
	ld.b $t0, $fp, -157
	andi $t1, $t0, 1
	st.w $t1, $fp, -164
# %op43 = icmp sgt i32 %op42, zeroinitializer
	ld.w $t0, $fp, -164
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -165
# br i1 %op43, label %label_loop30, label %label_ret31
# gen_phi
	ld.b $t0, $fp, -165
	bnez $t0, .read_image_label_loop30
	b .read_image_label_ret31
.read_image_label_loop30:
# %op44 = load i32, i32* @width
	la.local $t0, width
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -172
# %op45 = mul i32 %op34, %op44
	ld.w $t0, $fp, -132
	ld.w $t1, $fp, -172
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -176
# %op46 = add i32 %op45, %op39
	ld.w $t0, $fp, -176
	ld.w $t1, $fp, -152
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -180
# %op47 = icmp slt i32 %op46, zeroinitializer
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -181
# %op48 = zext i1 %op47 to i32
	ld.b $t0, $fp, -181
	andi $t1, $t0, 1
	st.w $t1, $fp, -188
# %op49 = add i32 %op48, zeroinitializer
	ld.w $t0, $fp, -188
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -192
# %op50 = icmp ne i32 %op49, zeroinitializer
	ld.w $t0, $fp, -192
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -193
# br i1 %op50, label %label_image_ltz32, label %label_image_gtz33
# gen_phi
	ld.b $t0, $fp, -193
	bnez $t0, .read_image_label_image_ltz32
	b .read_image_label_image_gtz33
.read_image_label_ret31:
# %op51 = add i32 %op34, 1
	ld.w $t0, $fp, -132
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -200
# br label %label_condition26
# gen_phi
	ld.w $t0, $fp, -200
	st.w $t0, $fp, -132
	b .read_image_label_condition26
.read_image_label_image_ltz32:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_image_gtz33
# gen_phi
	b .read_image_label_image_gtz33
.read_image_label_image_gtz33:
# %op52 = getelementptr [1048576 x i32], [1048576 x i32]* @image, i32 0, i32 %op46
	la.local $t0, image
	lu12i.w $t2, 1024
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -180
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -208
# %op53 = call i32 @getint()
	bl getint
	st.w $a0, $fp, -212
# store i32 %op53, i32* %op52
	ld.d $t0, $fp, -208
	ld.w $t1, $fp, -212
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op54 = add i32 %op39, 1
	ld.w $t0, $fp, -152
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -216
# br label %label_condition29
# gen_phi
	ld.w $t0, $fp, -216
	st.w $t0, $fp, -152
	b .read_image_label_condition29
.read_image_exit:
	addi.d $sp, $sp, 224
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl rotate
	.type rotate, @function
rotate:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -256
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
	fst.s $fa0, $fp, -28
.rotate_label_entry:
# %op3 = call float @my_sin(float %arg2)
	fld.s $fa0, $fp, -28
	bl my_sin
	fst.s $fa0, $fp, -32
# %op4 = call float @my_cos(float %arg2)
	fld.s $fa0, $fp, -28
	bl my_cos
	fst.s $fa0, $fp, -36
# %op5 = load i32, i32* @width
	la.local $t0, width
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -40
# %op6 = sdiv i32 %op5, 2
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -44
# %op7 = load i32, i32* @height
	la.local $t0, height
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -48
# %op8 = sdiv i32 %op7, 2
	ld.w $t0, $fp, -48
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# %op9 = sub i32 %arg0, %op6
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -44
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -56
# %op10 = sub i32 %arg1, %op8
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -52
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# %op11 = sitofp i32 %op9 to float
	ld.w $t0, $fp, -56
	movgr2fr.w $ft0, $t0
	ffint.s.w $ft1, $ft0
	fst.s $ft1, $fp, -64
# %op12 = fmul float %op11, %op4
	fld.s $ft0, $fp, -64
	fld.s $ft1, $fp, -36
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -68
# %op13 = sitofp i32 %op10 to float
	ld.w $t0, $fp, -60
	movgr2fr.w $ft0, $t0
	ffint.s.w $ft1, $ft0
	fst.s $ft1, $fp, -72
# %op14 = fmul float %op13, %op3
	fld.s $ft0, $fp, -72
	fld.s $ft1, $fp, -32
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -76
# %op15 = fsub float %op12, %op14
	fld.s $ft0, $fp, -68
	fld.s $ft1, $fp, -76
	fsub.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -80
# %op16 = sitofp i32 %op6 to float
	ld.w $t0, $fp, -44
	movgr2fr.w $ft0, $t0
	ffint.s.w $ft1, $ft0
	fst.s $ft1, $fp, -84
# %op17 = fadd float %op15, %op16
	fld.s $ft0, $fp, -80
	fld.s $ft1, $fp, -84
	fadd.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -88
# %op18 = fptosi float %op17 to i32
	fld.s $ft0, $fp, -88
	ftintrz.w.s $ft1, $ft0
	movfr2gr.s $t0, $ft1
	st.w $t0, $fp, -92
# %op19 = sitofp i32 %op9 to float
	ld.w $t0, $fp, -56
	movgr2fr.w $ft0, $t0
	ffint.s.w $ft1, $ft0
	fst.s $ft1, $fp, -96
# %op20 = fmul float %op19, %op3
	fld.s $ft0, $fp, -96
	fld.s $ft1, $fp, -32
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -100
# %op21 = sitofp i32 %op10 to float
	ld.w $t0, $fp, -60
	movgr2fr.w $ft0, $t0
	ffint.s.w $ft1, $ft0
	fst.s $ft1, $fp, -104
# %op22 = fmul float %op21, %op4
	fld.s $ft0, $fp, -104
	fld.s $ft1, $fp, -36
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -108
# %op23 = fadd float %op20, %op22
	fld.s $ft0, $fp, -100
	fld.s $ft1, $fp, -108
	fadd.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -112
# %op24 = sitofp i32 %op8 to float
	ld.w $t0, $fp, -52
	movgr2fr.w $ft0, $t0
	ffint.s.w $ft1, $ft0
	fst.s $ft1, $fp, -116
# %op25 = fadd float %op23, %op24
	fld.s $ft0, $fp, -112
	fld.s $ft1, $fp, -116
	fadd.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -120
# %op26 = fptosi float %op25 to i32
	fld.s $ft0, $fp, -120
	ftintrz.w.s $ft1, $ft0
	movfr2gr.s $t0, $ft1
	st.w $t0, $fp, -124
# %op27 = icmp slt i32 %op18, 0
	ld.w $t0, $fp, -92
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -125
# %op28 = zext i1 %op27 to i32
	ld.b $t0, $fp, -125
	andi $t1, $t0, 1
	st.w $t1, $fp, -132
# %op29 = icmp sgt i32 %op28, zeroinitializer
	ld.w $t0, $fp, -132
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -133
# br i1 %op29, label %label_true34, label %label_false35
# gen_phi
	ld.b $t0, $fp, -133
	bnez $t0, .rotate_label_true34
	b .rotate_label_false35
.rotate_label_true34:
# %op30 = icmp sgt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -134
# br label %label_ret36
# gen_phi
	ld.b $t0, $fp, -134
	st.b $t0, $fp, -150
	b .rotate_label_ret36
.rotate_label_false35:
# %op31 = load i32, i32* @width
	la.local $t0, width
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -140
# %op32 = icmp sge i32 %op18, %op31
	ld.w $t0, $fp, -92
	ld.w $t1, $fp, -140
	slt $t2, $t0, $t1
	xori $t2, $t2, 1
	st.b $t2, $fp, -141
# %op33 = zext i1 %op32 to i32
	ld.b $t0, $fp, -141
	andi $t1, $t0, 1
	st.w $t1, $fp, -148
# %op34 = icmp sgt i32 %op33, zeroinitializer
	ld.w $t0, $fp, -148
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -149
# br label %label_ret36
# gen_phi
	ld.b $t0, $fp, -149
	st.b $t0, $fp, -150
	b .rotate_label_ret36
.rotate_label_ret36:
# %op35 = phi i1 [ %op30, %label_true34 ], [ %op34, %label_false35 ]
# %op36 = zext i1 %op35 to i32
	ld.b $t0, $fp, -150
	andi $t1, $t0, 1
	st.w $t1, $fp, -156
# %op37 = icmp sgt i32 %op36, zeroinitializer
	ld.w $t0, $fp, -156
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -157
# br i1 %op37, label %label_true37, label %label_false38
# gen_phi
	ld.b $t0, $fp, -157
	bnez $t0, .rotate_label_true37
	b .rotate_label_false38
.rotate_label_true37:
# %op38 = icmp sgt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -158
# br label %label_ret39
# gen_phi
	ld.b $t0, $fp, -158
	st.b $t0, $fp, -166
	b .rotate_label_ret39
.rotate_label_false38:
# %op39 = icmp slt i32 %op26, 0
	ld.w $t0, $fp, -124
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -159
# %op40 = zext i1 %op39 to i32
	ld.b $t0, $fp, -159
	andi $t1, $t0, 1
	st.w $t1, $fp, -164
# %op41 = icmp sgt i32 %op40, zeroinitializer
	ld.w $t0, $fp, -164
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -165
# br label %label_ret39
# gen_phi
	ld.b $t0, $fp, -165
	st.b $t0, $fp, -166
	b .rotate_label_ret39
.rotate_label_ret39:
# %op42 = phi i1 [ %op38, %label_true37 ], [ %op41, %label_false38 ], [ %op35, %label_true37 ], [ %op35, %label_false38 ]
# %op43 = zext i1 %op42 to i32
	ld.b $t0, $fp, -166
	andi $t1, $t0, 1
	st.w $t1, $fp, -172
# %op44 = icmp sgt i32 %op43, zeroinitializer
	ld.w $t0, $fp, -172
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -173
# br i1 %op44, label %label_true40, label %label_false41
# gen_phi
	ld.b $t0, $fp, -173
	bnez $t0, .rotate_label_true40
	b .rotate_label_false41
.rotate_label_true40:
# %op45 = icmp sgt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -174
# br label %label_ret42
# gen_phi
	ld.b $t0, $fp, -174
	st.b $t0, $fp, -190
	b .rotate_label_ret42
.rotate_label_false41:
# %op46 = load i32, i32* @height
	la.local $t0, height
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -180
# %op47 = icmp sge i32 %op26, %op46
	ld.w $t0, $fp, -124
	ld.w $t1, $fp, -180
	slt $t2, $t0, $t1
	xori $t2, $t2, 1
	st.b $t2, $fp, -181
# %op48 = zext i1 %op47 to i32
	ld.b $t0, $fp, -181
	andi $t1, $t0, 1
	st.w $t1, $fp, -188
# %op49 = icmp sgt i32 %op48, zeroinitializer
	ld.w $t0, $fp, -188
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -189
# br label %label_ret42
# gen_phi
	ld.b $t0, $fp, -189
	st.b $t0, $fp, -190
	b .rotate_label_ret42
.rotate_label_ret42:
# %op50 = phi i1 [ %op45, %label_true40 ], [ %op49, %label_false41 ], [ %op42, %label_true40 ], [ %op42, %label_false41 ]
# %op51 = zext i1 %op50 to i32
	ld.b $t0, $fp, -190
	andi $t1, $t0, 1
	st.w $t1, $fp, -196
# %op52 = icmp sgt i32 %op51, zeroinitializer
	ld.w $t0, $fp, -196
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -197
# br i1 %op52, label %label_true43, label %label_ret44
# gen_phi
	ld.b $t0, $fp, -197
	bnez $t0, .rotate_label_true43
	b .rotate_label_ret44
.rotate_label_true43:
# ret i32 0
# gen_phi
	addi.w $a0, $zero, 0
	b .rotate_exit
.rotate_label_ret44:
# %op53 = load i32, i32* @width
	la.local $t0, width
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -204
# %op54 = mul i32 %op26, %op53
	ld.w $t0, $fp, -124
	ld.w $t1, $fp, -204
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -208
# %op55 = add i32 %op54, %op18
	ld.w $t0, $fp, -208
	ld.w $t1, $fp, -92
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -212
# %op56 = icmp slt i32 %op55, zeroinitializer
	ld.w $t0, $fp, -212
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -213
# %op57 = zext i1 %op56 to i32
	ld.b $t0, $fp, -213
	andi $t1, $t0, 1
	st.w $t1, $fp, -220
# %op58 = add i32 %op57, zeroinitializer
	ld.w $t0, $fp, -220
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -224
# %op59 = icmp ne i32 %op58, zeroinitializer
	ld.w $t0, $fp, -224
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -225
# br i1 %op59, label %label_image_ltz45, label %label_image_gtz46
# gen_phi
	ld.b $t0, $fp, -225
	bnez $t0, .rotate_label_image_ltz45
	b .rotate_label_image_gtz46
.rotate_label_image_ltz45:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_image_gtz46
# gen_phi
	b .rotate_label_image_gtz46
.rotate_label_image_gtz46:
# %op60 = getelementptr [1048576 x i32], [1048576 x i32]* @image, i32 0, i32 %op55
	la.local $t0, image
	lu12i.w $t2, 1024
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -212
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -240
# %op61 = load i32, i32* %op60
	ld.d $t0, $fp, -240
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -244
# ret i32 %op61
# gen_phi
	ld.w $a0, $fp, -244
	b .rotate_exit
.rotate_exit:
	addi.d $sp, $sp, 256
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl write_pgm
	.type write_pgm, @function
write_pgm:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
	fst.s $fa0, $fp, -20
.write_pgm_label_entry:
# call void @putch(i32 80)
	addi.w $a0, $zero, 80
	bl putch
# call void @putch(i32 50)
	addi.w $a0, $zero, 50
	bl putch
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# %op1 = load i32, i32* @width
	la.local $t0, width
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -24
# call void @putint(i32 %op1)
	ld.w $a0, $fp, -24
	bl putint
# call void @putch(i32 32)
	addi.w $a0, $zero, 32
	bl putch
# %op2 = load i32, i32* @height
	la.local $t0, height
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -28
# call void @putint(i32 %op2)
	ld.w $a0, $fp, -28
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
# br label %label_condition47
# gen_phi
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -32
	b .write_pgm_label_condition47
.write_pgm_label_condition47:
# %op3 = phi i32 [ 0, %label_entry ], [ %op15, %label_ret52 ]
# %op4 = load i32, i32* @height
	la.local $t0, height
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -36
# %op5 = icmp slt i32 %op3, %op4
	ld.w $t0, $fp, -32
	ld.w $t1, $fp, -36
	slt $t2, $t0, $t1
	st.b $t2, $fp, -37
# %op6 = zext i1 %op5 to i32
	ld.b $t0, $fp, -37
	andi $t1, $t0, 1
	st.w $t1, $fp, -44
# %op7 = icmp sgt i32 %op6, zeroinitializer
	ld.w $t0, $fp, -44
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -45
# br i1 %op7, label %label_loop48, label %label_ret49
# gen_phi
	ld.b $t0, $fp, -45
	bnez $t0, .write_pgm_label_loop48
	b .write_pgm_label_ret49
.write_pgm_label_loop48:
# br label %label_condition50
# gen_phi
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -52
	b .write_pgm_label_condition50
.write_pgm_label_ret49:
# ret void
# gen_phi
	addi.w $a0, $zero, 0
	b .write_pgm_exit
.write_pgm_label_condition50:
# %op8 = phi i32 [ 0, %label_loop48 ], [ %op14, %label_loop51 ]
# %op9 = load i32, i32* @width
	la.local $t0, width
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -56
# %op10 = icmp slt i32 %op8, %op9
	ld.w $t0, $fp, -52
	ld.w $t1, $fp, -56
	slt $t2, $t0, $t1
	st.b $t2, $fp, -57
# %op11 = zext i1 %op10 to i32
	ld.b $t0, $fp, -57
	andi $t1, $t0, 1
	st.w $t1, $fp, -64
# %op12 = icmp sgt i32 %op11, zeroinitializer
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -65
# br i1 %op12, label %label_loop51, label %label_ret52
# gen_phi
	ld.b $t0, $fp, -65
	bnez $t0, .write_pgm_label_loop51
	b .write_pgm_label_ret52
.write_pgm_label_loop51:
# %op13 = call i32 @rotate(i32 %op8, i32 %op3, float %arg0)
	ld.w $a0, $fp, -52
	ld.w $a1, $fp, -32
	fld.s $fa0, $fp, -20
	bl rotate
	st.w $a0, $fp, -72
# call void @putint(i32 %op13)
	ld.w $a0, $fp, -72
	bl putint
# call void @putch(i32 32)
	addi.w $a0, $zero, 32
	bl putch
# %op14 = add i32 %op8, 1
	ld.w $t0, $fp, -52
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# br label %label_condition50
# gen_phi
	ld.w $t0, $fp, -76
	st.w $t0, $fp, -52
	b .write_pgm_label_condition50
.write_pgm_label_ret52:
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# %op15 = add i32 %op3, 1
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -80
# br label %label_condition47
# gen_phi
	ld.w $t0, $fp, -80
	st.w $t0, $fp, -32
	b .write_pgm_label_condition47
.write_pgm_exit:
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.main_label_entry:
# %op0 = call float @getfloat()
	bl getfloat
	fst.s $fa0, $fp, -20
# %op1 = call i32 @getch()
	bl getch
	st.w $a0, $fp, -24
# %op2 = call i32 @read_image()
	bl read_image
	st.w $a0, $fp, -28
# %op3 = icmp slt i32 %op2, 0
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -29
# %op4 = zext i1 %op3 to i32
	ld.b $t0, $fp, -29
	andi $t1, $t0, 1
	st.w $t1, $fp, -36
# %op5 = icmp sgt i32 %op4, zeroinitializer
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -37
# br i1 %op5, label %label_true53, label %label_ret54
# gen_phi
	ld.b $t0, $fp, -37
	bnez $t0, .main_label_true53
	b .main_label_ret54
.main_label_true53:
# ret i32 -1
# gen_phi
	addi.w $a0, $zero, -1
	b .main_exit
.main_label_ret54:
# call void @write_pgm(float %op0)
	fld.s $fa0, $fp, -20
	bl write_pgm
# ret i32 0
# gen_phi
	addi.w $a0, $zero, 0
	b .main_exit
.main_exit:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
