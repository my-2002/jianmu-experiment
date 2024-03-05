	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -496
.main_label_entry:
# %op0 = alloca [4 x [2 x i32]]
	addi.d $t0, $zero, -24
	addi.d $t0, $t0, -32
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -24
# %op1 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -57
# %op2 = zext i1 %op1 to i32
	ld.b $t0, $fp, -57
	andi $t1, $t0, 1
	st.w $t1, $fp, -64
# %op3 = add i32 %op2, zeroinitializer
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -68
# %op4 = icmp slt i32 3, zeroinitializer
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -69
# %op5 = zext i1 %op4 to i32
	ld.b $t0, $fp, -69
	andi $t1, $t0, 1
	st.w $t1, $fp, -76
# %op6 = add i32 %op5, %op3
	ld.w $t0, $fp, -76
	ld.w $t1, $fp, -68
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -80
# %op7 = icmp ne i32 %op6, zeroinitializer
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -81
# br i1 %op7, label %label_a_ltz0, label %label_a_gtz1
# gen_phi
	ld.b $t0, $fp, -81
	bnez $t0, .main_label_a_ltz0
	b .main_label_a_gtz1
.main_label_a_ltz0:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a_gtz1
# gen_phi
	b .main_label_a_gtz1
.main_label_a_gtz1:
# %op8 = alloca [4 x [2 x i32]]
	addi.d $t0, $zero, -96
	addi.d $t0, $t0, -32
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -96
# %op9 = icmp slt i32 2, zeroinitializer
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -129
# %op10 = zext i1 %op9 to i32
	ld.b $t0, $fp, -129
	andi $t1, $t0, 1
	st.w $t1, $fp, -136
# %op11 = add i32 %op10, zeroinitializer
	ld.w $t0, $fp, -136
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -140
# %op12 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -141
# %op13 = zext i1 %op12 to i32
	ld.b $t0, $fp, -141
	andi $t1, $t0, 1
	st.w $t1, $fp, -148
# %op14 = add i32 %op13, %op11
	ld.w $t0, $fp, -148
	ld.w $t1, $fp, -140
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -152
# %op15 = icmp ne i32 %op14, zeroinitializer
	ld.w $t0, $fp, -152
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -153
# br i1 %op15, label %label_d_ltz2, label %label_d_gtz3
# gen_phi
	ld.b $t0, $fp, -153
	bnez $t0, .main_label_d_ltz2
	b .main_label_d_gtz3
.main_label_d_ltz2:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_d_gtz3
# gen_phi
	b .main_label_d_gtz3
.main_label_d_gtz3:
# %op16 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op8, i32 0, i32 2, i32 1
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 32
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 2
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -168
# %op17 = load i32, i32* %op16
	ld.d $t0, $fp, -168
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -172
# %op18 = icmp slt i32 2, zeroinitializer
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -173
# %op19 = zext i1 %op18 to i32
	ld.b $t0, $fp, -173
	andi $t1, $t0, 1
	st.w $t1, $fp, -180
# %op20 = add i32 %op19, zeroinitializer
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -184
# %op21 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -185
# %op22 = zext i1 %op21 to i32
	ld.b $t0, $fp, -185
	andi $t1, $t0, 1
	st.w $t1, $fp, -192
# %op23 = add i32 %op22, %op20
	ld.w $t0, $fp, -192
	ld.w $t1, $fp, -184
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -196
# %op24 = icmp ne i32 %op23, zeroinitializer
	ld.w $t0, $fp, -196
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -197
# br i1 %op24, label %label_c_ltz4, label %label_c_gtz5
# gen_phi
	ld.b $t0, $fp, -197
	bnez $t0, .main_label_c_ltz4
	b .main_label_c_gtz5
.main_label_c_ltz4:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_c_gtz5
# gen_phi
	b .main_label_c_gtz5
.main_label_c_gtz5:
# %op25 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op0, i32 0, i32 2, i32 1
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 32
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 2
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -208
# %op26 = load i32, i32* %op25
	ld.d $t0, $fp, -208
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -212
# %op27 = alloca [4 x [2 x [1 x i32]]]
	addi.d $t0, $zero, -224
	addi.d $t0, $t0, -32
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -224
# %op28 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op27, i32 0, i32 0, i32 1, i32 0
	ld.d $t0, $fp, -224
	addi.w $t2, $zero, 32
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -264
# store i32 %op26, i32* %op28
	ld.d $t0, $fp, -264
	ld.w $t1, $fp, -212
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op29 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op27, i32 0, i32 0, i32 2, i32 0
	ld.d $t0, $fp, -224
	addi.w $t2, $zero, 32
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 2
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -272
# store i32 %op17, i32* %op29
	ld.d $t0, $fp, -272
	ld.w $t1, $fp, -172
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op30 = icmp slt i32 3, zeroinitializer
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -273
# %op31 = zext i1 %op30 to i32
	ld.b $t0, $fp, -273
	andi $t1, $t0, 1
	st.w $t1, $fp, -280
# %op32 = add i32 %op31, zeroinitializer
	ld.w $t0, $fp, -280
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -284
# %op33 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -285
# %op34 = zext i1 %op33 to i32
	ld.b $t0, $fp, -285
	andi $t1, $t0, 1
	st.w $t1, $fp, -292
# %op35 = add i32 %op34, %op32
	ld.w $t0, $fp, -292
	ld.w $t1, $fp, -284
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -296
# %op36 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -297
# %op37 = zext i1 %op36 to i32
	ld.b $t0, $fp, -297
	andi $t1, $t0, 1
	st.w $t1, $fp, -304
# %op38 = add i32 %op37, %op35
	ld.w $t0, $fp, -304
	ld.w $t1, $fp, -296
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -308
# %op39 = icmp ne i32 %op38, zeroinitializer
	ld.w $t0, $fp, -308
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -309
# br i1 %op39, label %label_e_ltz6, label %label_e_gtz7
# gen_phi
	ld.b $t0, $fp, -309
	bnez $t0, .main_label_e_ltz6
	b .main_label_e_gtz7
.main_label_e_ltz6:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_e_gtz7
# gen_phi
	b .main_label_e_gtz7
.main_label_e_gtz7:
# %op40 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op27, i32 0, i32 3, i32 1, i32 0
	ld.d $t0, $fp, -224
	addi.w $t2, $zero, 32
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 3
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -320
# %op41 = load i32, i32* %op40
	ld.d $t0, $fp, -320
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -324
# %op42 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -325
# %op43 = zext i1 %op42 to i32
	ld.b $t0, $fp, -325
	andi $t1, $t0, 1
	st.w $t1, $fp, -332
# %op44 = add i32 %op43, zeroinitializer
	ld.w $t0, $fp, -332
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -336
# %op45 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -337
# %op46 = zext i1 %op45 to i32
	ld.b $t0, $fp, -337
	andi $t1, $t0, 1
	st.w $t1, $fp, -344
# %op47 = add i32 %op46, %op44
	ld.w $t0, $fp, -344
	ld.w $t1, $fp, -336
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -348
# %op48 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -349
# %op49 = zext i1 %op48 to i32
	ld.b $t0, $fp, -349
	andi $t1, $t0, 1
	st.w $t1, $fp, -356
# %op50 = add i32 %op49, %op47
	ld.w $t0, $fp, -356
	ld.w $t1, $fp, -348
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -360
# %op51 = icmp ne i32 %op50, zeroinitializer
	ld.w $t0, $fp, -360
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -361
# br i1 %op51, label %label_e_ltz8, label %label_e_gtz9
# gen_phi
	ld.b $t0, $fp, -361
	bnez $t0, .main_label_e_ltz8
	b .main_label_e_gtz9
.main_label_e_ltz8:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_e_gtz9
# gen_phi
	b .main_label_e_gtz9
.main_label_e_gtz9:
# %op52 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op27, i32 0, i32 0, i32 0, i32 0
	ld.d $t0, $fp, -224
	addi.w $t2, $zero, 32
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -376
# %op53 = load i32, i32* %op52
	ld.d $t0, $fp, -376
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -380
# %op54 = add i32 %op41, %op53
	ld.w $t0, $fp, -324
	ld.w $t1, $fp, -380
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -384
# %op55 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -385
# %op56 = zext i1 %op55 to i32
	ld.b $t0, $fp, -385
	andi $t1, $t0, 1
	st.w $t1, $fp, -392
# %op57 = add i32 %op56, zeroinitializer
	ld.w $t0, $fp, -392
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -396
# %op58 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -397
# %op59 = zext i1 %op58 to i32
	ld.b $t0, $fp, -397
	andi $t1, $t0, 1
	st.w $t1, $fp, -404
# %op60 = add i32 %op59, %op57
	ld.w $t0, $fp, -404
	ld.w $t1, $fp, -396
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -408
# %op61 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -409
# %op62 = zext i1 %op61 to i32
	ld.b $t0, $fp, -409
	andi $t1, $t0, 1
	st.w $t1, $fp, -416
# %op63 = add i32 %op62, %op60
	ld.w $t0, $fp, -416
	ld.w $t1, $fp, -408
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -420
# %op64 = icmp ne i32 %op63, zeroinitializer
	ld.w $t0, $fp, -420
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -421
# br i1 %op64, label %label_e_ltz10, label %label_e_gtz11
# gen_phi
	ld.b $t0, $fp, -421
	bnez $t0, .main_label_e_ltz10
	b .main_label_e_gtz11
.main_label_e_ltz10:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_e_gtz11
# gen_phi
	b .main_label_e_gtz11
.main_label_e_gtz11:
# %op65 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op27, i32 0, i32 0, i32 1, i32 0
	ld.d $t0, $fp, -224
	addi.w $t2, $zero, 32
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -432
# %op66 = load i32, i32* %op65
	ld.d $t0, $fp, -432
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -436
# %op67 = add i32 %op54, %op66
	ld.w $t0, $fp, -384
	ld.w $t1, $fp, -436
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -440
# %op68 = icmp slt i32 3, zeroinitializer
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -441
# %op69 = zext i1 %op68 to i32
	ld.b $t0, $fp, -441
	andi $t1, $t0, 1
	st.w $t1, $fp, -448
# %op70 = add i32 %op69, zeroinitializer
	ld.w $t0, $fp, -448
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -452
# %op71 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -453
# %op72 = zext i1 %op71 to i32
	ld.b $t0, $fp, -453
	andi $t1, $t0, 1
	st.w $t1, $fp, -460
# %op73 = add i32 %op72, %op70
	ld.w $t0, $fp, -460
	ld.w $t1, $fp, -452
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -464
# %op74 = icmp ne i32 %op73, zeroinitializer
	ld.w $t0, $fp, -464
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -465
# br i1 %op74, label %label_d_ltz12, label %label_d_gtz13
# gen_phi
	ld.b $t0, $fp, -465
	bnez $t0, .main_label_d_ltz12
	b .main_label_d_gtz13
.main_label_d_ltz12:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_d_gtz13
# gen_phi
	b .main_label_d_gtz13
.main_label_d_gtz13:
# %op75 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op8, i32 0, i32 3, i32 0
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 32
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 8
	addi.w $t1, $zero, 3
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -480
# %op76 = load i32, i32* %op75
	ld.d $t0, $fp, -480
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -484
# %op77 = add i32 %op67, %op76
	ld.w $t0, $fp, -440
	ld.w $t1, $fp, -484
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -488
# ret i32 %op77
# gen_phi
	ld.w $a0, $fp, -488
	b .main_exit
.main_exit:
	addi.d $sp, $sp, 496
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
