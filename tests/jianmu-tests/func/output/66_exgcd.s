	.text
	.globl exgcd
	.type exgcd, @function
exgcd:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -480
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
	st.d $a2, $fp, -32
	st.d $a3, $fp, -40
.exgcd_label_entry:
# %op4 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4048
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -48
# store i32 %arg0, i32* %op4
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op5 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4032
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -64
# store i32 %arg1, i32* %op5
	ld.d $t0, $fp, -64
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op6 = alloca i32*
	lu12i.w $t0, -1
	ori $t0, $t0, 4016
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -8
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -80
# store i32* %arg2, i32** %op6
	ld.d $t0, $fp, -80
	ld.d $t1, $fp, -32
	st.d $t1, $t0, 0
	addi.d $t0, $t0, 8
# %op7 = alloca i32*
	lu12i.w $t0, -1
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -8
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -96
# store i32* %arg3, i32** %op7
	ld.d $t0, $fp, -96
	ld.d $t1, $fp, -40
	st.d $t1, $t0, 0
	addi.d $t0, $t0, 8
# %op8 = load i32, i32* %op5
	ld.d $t0, $fp, -64
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -108
# %op9 = icmp eq i32 %op8, 0
	ld.w $t0, $fp, -108
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -109
# %op10 = zext i1 %op9 to i32
	ld.b $t0, $fp, -109
	andi $t1, $t0, 1
	st.w $t1, $fp, -116
# %op11 = icmp sgt i32 %op10, zeroinitializer
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -117
# br i1 %op11, label %label_true0, label %label_false1
# gen_phi
	ld.b $t0, $fp, -117
	bnez $t0, .exgcd_label_true0
	b .exgcd_label_false1
.exgcd_label_true0:
# %op12 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -118
# %op13 = zext i1 %op12 to i32
	ld.b $t0, $fp, -118
	andi $t1, $t0, 1
	st.w $t1, $fp, -124
# %op14 = add i32 %op13, zeroinitializer
	ld.w $t0, $fp, -124
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -128
# %op15 = icmp ne i32 %op14, zeroinitializer
	ld.w $t0, $fp, -128
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -129
# br i1 %op15, label %label_x_ltz2, label %label_x_gtz3
# gen_phi
	ld.b $t0, $fp, -129
	bnez $t0, .exgcd_label_x_ltz2
	b .exgcd_label_x_gtz3
.exgcd_label_false1:
# %op16 = load i32, i32* %op5
	ld.d $t0, $fp, -64
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -136
# %op17 = load i32, i32* %op4
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -140
# %op18 = load i32, i32* %op5
	ld.d $t0, $fp, -64
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -144
# %op19 = sdiv i32 %op17, %op18
	ld.w $t0, $fp, -140
	ld.w $t1, $fp, -144
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -148
# %op20 = mul i32 %op19, %op18
	ld.w $t0, $fp, -148
	ld.w $t1, $fp, -144
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -152
# %op21 = sub i32 %op17, %op20
	ld.w $t0, $fp, -140
	ld.w $t1, $fp, -152
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -156
# %op22 = load i32*, i32** %op6
	ld.d $t0, $fp, -80
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -168
# %op23 = load i32*, i32** %op7
	ld.d $t0, $fp, -96
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -176
# %op24 = call i32 @exgcd(i32 %op16, i32 %op21, i32* %op22, i32* %op23)
	ld.w $a0, $fp, -136
	ld.w $a1, $fp, -156
	ld.d $a2, $fp, -168
	ld.d $a3, $fp, -176
	bl exgcd
	st.w $a0, $fp, -180
# %op25 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3904
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -192
# store i32 %op24, i32* %op25
	ld.d $t0, $fp, -192
	ld.w $t1, $fp, -180
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op26 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -197
# %op27 = zext i1 %op26 to i32
	ld.b $t0, $fp, -197
	andi $t1, $t0, 1
	st.w $t1, $fp, -204
# %op28 = add i32 %op27, zeroinitializer
	ld.w $t0, $fp, -204
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -208
# %op29 = icmp ne i32 %op28, zeroinitializer
	ld.w $t0, $fp, -208
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -209
# br i1 %op29, label %label_x_ltz6, label %label_x_gtz7
# gen_phi
	ld.b $t0, $fp, -209
	bnez $t0, .exgcd_label_x_ltz6
	b .exgcd_label_x_gtz7
.exgcd_label_x_ltz2:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_x_gtz3
# gen_phi
	b .exgcd_label_x_gtz3
.exgcd_label_x_gtz3:
# %op30 = load i32*, i32** %op6
	ld.d $t0, $fp, -80
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -224
# %op31 = getelementptr i32, i32* %op30, i32 0
	ld.d $t0, $fp, -224
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -232
# store i32 1, i32* %op31
	ld.d $t0, $fp, -232
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op32 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -233
# %op33 = zext i1 %op32 to i32
	ld.b $t0, $fp, -233
	andi $t1, $t0, 1
	st.w $t1, $fp, -240
# %op34 = add i32 %op33, zeroinitializer
	ld.w $t0, $fp, -240
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -244
# %op35 = icmp ne i32 %op34, zeroinitializer
	ld.w $t0, $fp, -244
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -245
# br i1 %op35, label %label_y_ltz4, label %label_y_gtz5
# gen_phi
	ld.b $t0, $fp, -245
	bnez $t0, .exgcd_label_y_ltz4
	b .exgcd_label_y_gtz5
.exgcd_label_y_ltz4:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_y_gtz5
# gen_phi
	b .exgcd_label_y_gtz5
.exgcd_label_y_gtz5:
# %op36 = load i32*, i32** %op7
	ld.d $t0, $fp, -96
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -256
# %op37 = getelementptr i32, i32* %op36, i32 0
	ld.d $t0, $fp, -256
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -264
# store i32 0, i32* %op37
	ld.d $t0, $fp, -264
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op38 = load i32, i32* %op4
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -268
# ret i32 %op38
# gen_phi
	ld.w $a0, $fp, -268
	b .exgcd_exit
.exgcd_label_x_ltz6:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_x_gtz7
# gen_phi
	b .exgcd_label_x_gtz7
.exgcd_label_x_gtz7:
# %op39 = load i32*, i32** %op6
	ld.d $t0, $fp, -80
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -280
# %op40 = getelementptr i32, i32* %op39, i32 0
	ld.d $t0, $fp, -280
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -288
# %op41 = load i32, i32* %op40
	ld.d $t0, $fp, -288
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -292
# %op42 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3792
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -304
# store i32 %op41, i32* %op42
	ld.d $t0, $fp, -304
	ld.w $t1, $fp, -292
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op43 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -309
# %op44 = zext i1 %op43 to i32
	ld.b $t0, $fp, -309
	andi $t1, $t0, 1
	st.w $t1, $fp, -316
# %op45 = add i32 %op44, zeroinitializer
	ld.w $t0, $fp, -316
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -320
# %op46 = icmp ne i32 %op45, zeroinitializer
	ld.w $t0, $fp, -320
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -321
# br i1 %op46, label %label_x_ltz8, label %label_x_gtz9
# gen_phi
	ld.b $t0, $fp, -321
	bnez $t0, .exgcd_label_x_ltz8
	b .exgcd_label_x_gtz9
.exgcd_label_x_ltz8:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_x_gtz9
# gen_phi
	b .exgcd_label_x_gtz9
.exgcd_label_x_gtz9:
# %op47 = load i32*, i32** %op6
	ld.d $t0, $fp, -80
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -336
# %op48 = getelementptr i32, i32* %op47, i32 0
	ld.d $t0, $fp, -336
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -344
# %op49 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -345
# %op50 = zext i1 %op49 to i32
	ld.b $t0, $fp, -345
	andi $t1, $t0, 1
	st.w $t1, $fp, -352
# %op51 = add i32 %op50, zeroinitializer
	ld.w $t0, $fp, -352
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -356
# %op52 = icmp ne i32 %op51, zeroinitializer
	ld.w $t0, $fp, -356
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -357
# br i1 %op52, label %label_y_ltz10, label %label_y_gtz11
# gen_phi
	ld.b $t0, $fp, -357
	bnez $t0, .exgcd_label_y_ltz10
	b .exgcd_label_y_gtz11
.exgcd_label_y_ltz10:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_y_gtz11
# gen_phi
	b .exgcd_label_y_gtz11
.exgcd_label_y_gtz11:
# %op53 = load i32*, i32** %op7
	ld.d $t0, $fp, -96
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -368
# %op54 = getelementptr i32, i32* %op53, i32 0
	ld.d $t0, $fp, -368
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -376
# %op55 = load i32, i32* %op54
	ld.d $t0, $fp, -376
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -380
# store i32 %op55, i32* %op48
	ld.d $t0, $fp, -344
	ld.w $t1, $fp, -380
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op56 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -381
# %op57 = zext i1 %op56 to i32
	ld.b $t0, $fp, -381
	andi $t1, $t0, 1
	st.w $t1, $fp, -388
# %op58 = add i32 %op57, zeroinitializer
	ld.w $t0, $fp, -388
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -392
# %op59 = icmp ne i32 %op58, zeroinitializer
	ld.w $t0, $fp, -392
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -393
# br i1 %op59, label %label_y_ltz12, label %label_y_gtz13
# gen_phi
	ld.b $t0, $fp, -393
	bnez $t0, .exgcd_label_y_ltz12
	b .exgcd_label_y_gtz13
.exgcd_label_y_ltz12:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_y_gtz13
# gen_phi
	b .exgcd_label_y_gtz13
.exgcd_label_y_gtz13:
# %op60 = load i32*, i32** %op7
	ld.d $t0, $fp, -96
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -408
# %op61 = getelementptr i32, i32* %op60, i32 0
	ld.d $t0, $fp, -408
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -416
# %op62 = load i32, i32* %op42
	ld.d $t0, $fp, -304
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -420
# %op63 = load i32, i32* %op4
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -424
# %op64 = load i32, i32* %op5
	ld.d $t0, $fp, -64
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -428
# %op65 = sdiv i32 %op63, %op64
	ld.w $t0, $fp, -424
	ld.w $t1, $fp, -428
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -432
# %op66 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -433
# %op67 = zext i1 %op66 to i32
	ld.b $t0, $fp, -433
	andi $t1, $t0, 1
	st.w $t1, $fp, -440
# %op68 = add i32 %op67, zeroinitializer
	ld.w $t0, $fp, -440
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -444
# %op69 = icmp ne i32 %op68, zeroinitializer
	ld.w $t0, $fp, -444
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -445
# br i1 %op69, label %label_y_ltz14, label %label_y_gtz15
# gen_phi
	ld.b $t0, $fp, -445
	bnez $t0, .exgcd_label_y_ltz14
	b .exgcd_label_y_gtz15
.exgcd_label_y_ltz14:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_y_gtz15
# gen_phi
	b .exgcd_label_y_gtz15
.exgcd_label_y_gtz15:
# %op70 = load i32*, i32** %op7
	ld.d $t0, $fp, -96
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -456
# %op71 = getelementptr i32, i32* %op70, i32 0
	ld.d $t0, $fp, -456
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -464
# %op72 = load i32, i32* %op71
	ld.d $t0, $fp, -464
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -468
# %op73 = mul i32 %op65, %op72
	ld.w $t0, $fp, -432
	ld.w $t1, $fp, -468
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -472
# %op74 = sub i32 %op62, %op73
	ld.w $t0, $fp, -420
	ld.w $t1, $fp, -472
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -476
# store i32 %op74, i32* %op61
	ld.d $t0, $fp, -416
	ld.w $t1, $fp, -476
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op75 = load i32, i32* %op25
	ld.d $t0, $fp, -192
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -480
# ret i32 %op75
# gen_phi
	ld.w $a0, $fp, -480
	b .exgcd_exit
.exgcd_exit:
	addi.d $sp, $sp, 480
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -240
.main_label_entry:
# %op0 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4072
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -24
# store i32 7, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 7
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op1 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4056
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -40
# store i32 15, i32* %op1
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 15
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op2 = alloca [1 x i32]
	lu12i.w $t0, -1
	ori $t0, $t0, 4040
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -56
# store [1 x i32] [i32 1], [1 x i32]* %op2
	ld.d $t0, $fp, -56
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op3 = alloca [1 x i32]
	lu12i.w $t0, -1
	ori $t0, $t0, 4024
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -72
# store [1 x i32] [i32 1], [1 x i32]* %op3
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op4 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -80
# %op5 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -84
# %op6 = getelementptr [1 x i32], [1 x i32]* %op2, i32 0, i32 0
	ld.d $t0, $fp, -56
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -96
# %op7 = getelementptr [1 x i32], [1 x i32]* %op3, i32 0, i32 0
	ld.d $t0, $fp, -72
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -104
# %op8 = call i32 @exgcd(i32 %op4, i32 %op5, i32* %op6, i32* %op7)
	ld.w $a0, $fp, -80
	ld.w $a1, $fp, -84
	ld.d $a2, $fp, -96
	ld.d $a3, $fp, -104
	bl exgcd
	st.w $a0, $fp, -108
# %op9 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -109
# %op10 = zext i1 %op9 to i32
	ld.b $t0, $fp, -109
	andi $t1, $t0, 1
	st.w $t1, $fp, -116
# %op11 = add i32 %op10, zeroinitializer
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -120
# %op12 = icmp ne i32 %op11, zeroinitializer
	ld.w $t0, $fp, -120
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -121
# br i1 %op12, label %label_x_ltz16, label %label_x_gtz17
# gen_phi
	ld.b $t0, $fp, -121
	bnez $t0, .main_label_x_ltz16
	b .main_label_x_gtz17
.main_label_x_ltz16:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_x_gtz17
# gen_phi
	b .main_label_x_gtz17
.main_label_x_gtz17:
# %op13 = getelementptr [1 x i32], [1 x i32]* %op2, i32 0, i32 0
	ld.d $t0, $fp, -56
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -136
# %op14 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -137
# %op15 = zext i1 %op14 to i32
	ld.b $t0, $fp, -137
	andi $t1, $t0, 1
	st.w $t1, $fp, -144
# %op16 = add i32 %op15, zeroinitializer
	ld.w $t0, $fp, -144
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -148
# %op17 = icmp ne i32 %op16, zeroinitializer
	ld.w $t0, $fp, -148
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -149
# br i1 %op17, label %label_x_ltz18, label %label_x_gtz19
# gen_phi
	ld.b $t0, $fp, -149
	bnez $t0, .main_label_x_ltz18
	b .main_label_x_gtz19
.main_label_x_ltz18:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_x_gtz19
# gen_phi
	b .main_label_x_gtz19
.main_label_x_gtz19:
# %op18 = getelementptr [1 x i32], [1 x i32]* %op2, i32 0, i32 0
	ld.d $t0, $fp, -56
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -160
# %op19 = load i32, i32* %op18
	ld.d $t0, $fp, -160
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -164
# %op20 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -168
# %op21 = sdiv i32 %op19, %op20
	ld.w $t0, $fp, -164
	ld.w $t1, $fp, -168
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -172
# %op22 = mul i32 %op21, %op20
	ld.w $t0, $fp, -172
	ld.w $t1, $fp, -168
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -176
# %op23 = sub i32 %op19, %op22
	ld.w $t0, $fp, -164
	ld.w $t1, $fp, -176
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -180
# %op24 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -184
# %op25 = add i32 %op23, %op24
	ld.w $t0, $fp, -180
	ld.w $t1, $fp, -184
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -188
# %op26 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -192
# %op27 = sdiv i32 %op25, %op26
	ld.w $t0, $fp, -188
	ld.w $t1, $fp, -192
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -196
# %op28 = mul i32 %op27, %op26
	ld.w $t0, $fp, -196
	ld.w $t1, $fp, -192
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -200
# %op29 = sub i32 %op25, %op28
	ld.w $t0, $fp, -188
	ld.w $t1, $fp, -200
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -204
# store i32 %op29, i32* %op13
	ld.d $t0, $fp, -136
	ld.w $t1, $fp, -204
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op30 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -205
# %op31 = zext i1 %op30 to i32
	ld.b $t0, $fp, -205
	andi $t1, $t0, 1
	st.w $t1, $fp, -212
# %op32 = add i32 %op31, zeroinitializer
	ld.w $t0, $fp, -212
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -216
# %op33 = icmp ne i32 %op32, zeroinitializer
	ld.w $t0, $fp, -216
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -217
# br i1 %op33, label %label_x_ltz20, label %label_x_gtz21
# gen_phi
	ld.b $t0, $fp, -217
	bnez $t0, .main_label_x_ltz20
	b .main_label_x_gtz21
.main_label_x_ltz20:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_x_gtz21
# gen_phi
	b .main_label_x_gtz21
.main_label_x_gtz21:
# %op34 = getelementptr [1 x i32], [1 x i32]* %op2, i32 0, i32 0
	ld.d $t0, $fp, -56
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -232
# %op35 = load i32, i32* %op34
	ld.d $t0, $fp, -232
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -236
# call void @putint(i32 %op35)
	ld.w $a0, $fp, -236
	bl putint
# ret i32 0
# gen_phi
	addi.w $a0, $zero, 0
	b .main_exit
.main_exit:
	addi.d $sp, $sp, 240
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
