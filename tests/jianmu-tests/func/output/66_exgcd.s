	.text
	.globl exgcd
	.type exgcd, @function
exgcd:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -272
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
	st.d $a2, $fp, -32
	st.d $a3, $fp, -40
.exgcd_label_entry:
# %op4 = icmp eq i32 %arg1, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -41
# %op5 = zext i1 %op4 to i32
	ld.b $t0, $fp, -41
	andi $t1, $t0, 1
	st.w $t1, $fp, -48
# %op6 = icmp sgt i32 %op5, zeroinitializer
	ld.w $t0, $fp, -48
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -49
# br i1 %op6, label %label_true0, label %label_false1
# gen_phi
	ld.b $t0, $fp, -49
	bnez $t0, .exgcd_label_true0
	b .exgcd_label_false1
.exgcd_label_true0:
# %op7 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -50
# %op8 = zext i1 %op7 to i32
	ld.b $t0, $fp, -50
	andi $t1, $t0, 1
	st.w $t1, $fp, -56
# %op9 = add i32 %op8, zeroinitializer
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# %op10 = icmp ne i32 %op9, zeroinitializer
	ld.w $t0, $fp, -60
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -61
# br i1 %op10, label %label_x_ltz2, label %label_x_gtz3
# gen_phi
	ld.b $t0, $fp, -61
	bnez $t0, .exgcd_label_x_ltz2
	b .exgcd_label_x_gtz3
.exgcd_label_false1:
# %op11 = sdiv i32 %arg0, %arg1
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -68
# %op12 = mul i32 %op11, %arg1
	ld.w $t0, $fp, -68
	ld.w $t1, $fp, -24
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -72
# %op13 = sub i32 %arg0, %op12
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -72
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# %op14 = call i32 @exgcd(i32 %arg1, i32 %op13, i32* %arg2, i32* %arg3)
	ld.w $a0, $fp, -24
	ld.w $a1, $fp, -76
	ld.d $a2, $fp, -32
	ld.d $a3, $fp, -40
	bl exgcd
	st.w $a0, $fp, -80
# %op15 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -81
# %op16 = zext i1 %op15 to i32
	ld.b $t0, $fp, -81
	andi $t1, $t0, 1
	st.w $t1, $fp, -88
# %op17 = add i32 %op16, zeroinitializer
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -92
# %op18 = icmp ne i32 %op17, zeroinitializer
	ld.w $t0, $fp, -92
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -93
# br i1 %op18, label %label_x_ltz6, label %label_x_gtz7
# gen_phi
	ld.b $t0, $fp, -93
	bnez $t0, .exgcd_label_x_ltz6
	b .exgcd_label_x_gtz7
.exgcd_label_x_ltz2:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_x_gtz3
# gen_phi
	b .exgcd_label_x_gtz3
.exgcd_label_x_gtz3:
# %op19 = getelementptr i32, i32* %arg2, i32 0
	ld.d $t0, $fp, -32
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -104
# store i32 1, i32* %op19
	ld.d $t0, $fp, -104
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op20 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -105
# %op21 = zext i1 %op20 to i32
	ld.b $t0, $fp, -105
	andi $t1, $t0, 1
	st.w $t1, $fp, -112
# %op22 = add i32 %op21, zeroinitializer
	ld.w $t0, $fp, -112
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# %op23 = icmp ne i32 %op22, zeroinitializer
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -117
# br i1 %op23, label %label_y_ltz4, label %label_y_gtz5
# gen_phi
	ld.b $t0, $fp, -117
	bnez $t0, .exgcd_label_y_ltz4
	b .exgcd_label_y_gtz5
.exgcd_label_y_ltz4:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_y_gtz5
# gen_phi
	b .exgcd_label_y_gtz5
.exgcd_label_y_gtz5:
# %op24 = getelementptr i32, i32* %arg3, i32 0
	ld.d $t0, $fp, -40
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -128
# store i32 0, i32* %op24
	ld.d $t0, $fp, -128
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# ret i32 %arg0
# gen_phi
	ld.w $a0, $fp, -20
	b .exgcd_exit
.exgcd_label_x_ltz6:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_x_gtz7
# gen_phi
	b .exgcd_label_x_gtz7
.exgcd_label_x_gtz7:
# %op25 = getelementptr i32, i32* %arg2, i32 0
	ld.d $t0, $fp, -32
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -136
# %op26 = load i32, i32* %op25
	ld.d $t0, $fp, -136
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -140
# %op27 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -141
# %op28 = zext i1 %op27 to i32
	ld.b $t0, $fp, -141
	andi $t1, $t0, 1
	st.w $t1, $fp, -148
# %op29 = add i32 %op28, zeroinitializer
	ld.w $t0, $fp, -148
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -152
# %op30 = icmp ne i32 %op29, zeroinitializer
	ld.w $t0, $fp, -152
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -153
# br i1 %op30, label %label_x_ltz8, label %label_x_gtz9
# gen_phi
	ld.b $t0, $fp, -153
	bnez $t0, .exgcd_label_x_ltz8
	b .exgcd_label_x_gtz9
.exgcd_label_x_ltz8:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_x_gtz9
# gen_phi
	b .exgcd_label_x_gtz9
.exgcd_label_x_gtz9:
# %op31 = getelementptr i32, i32* %arg2, i32 0
	ld.d $t0, $fp, -32
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -168
# %op32 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -169
# %op33 = zext i1 %op32 to i32
	ld.b $t0, $fp, -169
	andi $t1, $t0, 1
	st.w $t1, $fp, -176
# %op34 = add i32 %op33, zeroinitializer
	ld.w $t0, $fp, -176
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -180
# %op35 = icmp ne i32 %op34, zeroinitializer
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -181
# br i1 %op35, label %label_y_ltz10, label %label_y_gtz11
# gen_phi
	ld.b $t0, $fp, -181
	bnez $t0, .exgcd_label_y_ltz10
	b .exgcd_label_y_gtz11
.exgcd_label_y_ltz10:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_y_gtz11
# gen_phi
	b .exgcd_label_y_gtz11
.exgcd_label_y_gtz11:
# %op36 = getelementptr i32, i32* %arg3, i32 0
	ld.d $t0, $fp, -40
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -192
# %op37 = load i32, i32* %op36
	ld.d $t0, $fp, -192
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -196
# store i32 %op37, i32* %op31
	ld.d $t0, $fp, -168
	ld.w $t1, $fp, -196
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op38 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -197
# %op39 = zext i1 %op38 to i32
	ld.b $t0, $fp, -197
	andi $t1, $t0, 1
	st.w $t1, $fp, -204
# %op40 = add i32 %op39, zeroinitializer
	ld.w $t0, $fp, -204
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -208
# %op41 = icmp ne i32 %op40, zeroinitializer
	ld.w $t0, $fp, -208
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -209
# br i1 %op41, label %label_y_ltz12, label %label_y_gtz13
# gen_phi
	ld.b $t0, $fp, -209
	bnez $t0, .exgcd_label_y_ltz12
	b .exgcd_label_y_gtz13
.exgcd_label_y_ltz12:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_y_gtz13
# gen_phi
	b .exgcd_label_y_gtz13
.exgcd_label_y_gtz13:
# %op42 = getelementptr i32, i32* %arg3, i32 0
	ld.d $t0, $fp, -40
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -224
# %op43 = sdiv i32 %arg0, %arg1
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -228
# %op44 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -229
# %op45 = zext i1 %op44 to i32
	ld.b $t0, $fp, -229
	andi $t1, $t0, 1
	st.w $t1, $fp, -236
# %op46 = add i32 %op45, zeroinitializer
	ld.w $t0, $fp, -236
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -240
# %op47 = icmp ne i32 %op46, zeroinitializer
	ld.w $t0, $fp, -240
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -241
# br i1 %op47, label %label_y_ltz14, label %label_y_gtz15
# gen_phi
	ld.b $t0, $fp, -241
	bnez $t0, .exgcd_label_y_ltz14
	b .exgcd_label_y_gtz15
.exgcd_label_y_ltz14:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_y_gtz15
# gen_phi
	b .exgcd_label_y_gtz15
.exgcd_label_y_gtz15:
# %op48 = getelementptr i32, i32* %arg3, i32 0
	ld.d $t0, $fp, -40
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -256
# %op49 = load i32, i32* %op48
	ld.d $t0, $fp, -256
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -260
# %op50 = mul i32 %op43, %op49
	ld.w $t0, $fp, -228
	ld.w $t1, $fp, -260
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -264
# %op51 = sub i32 %op26, %op50
	ld.w $t0, $fp, -140
	ld.w $t1, $fp, -264
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -268
# store i32 %op51, i32* %op42
	ld.d $t0, $fp, -224
	ld.w $t1, $fp, -268
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# ret i32 %op14
# gen_phi
	ld.w $a0, $fp, -80
	b .exgcd_exit
.exgcd_exit:
	addi.d $sp, $sp, 272
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -192
.main_label_entry:
# %op0 = alloca [1 x i32]
	addi.d $t0, $zero, -24
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -24
# %op1 = alloca [1 x i32]
	addi.d $t0, $zero, -40
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -40
# %op2 = getelementptr [1 x i32], [1 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -56
# %op3 = getelementptr [1 x i32], [1 x i32]* %op1, i32 0, i32 0
	ld.d $t0, $fp, -40
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -64
# %op4 = call i32 @exgcd(i32 7, i32 15, i32* %op2, i32* %op3)
	addi.w $a0, $zero, 7
	addi.w $a1, $zero, 15
	ld.d $a2, $fp, -56
	ld.d $a3, $fp, -64
	bl exgcd
	st.w $a0, $fp, -68
# %op5 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -69
# %op6 = zext i1 %op5 to i32
	ld.b $t0, $fp, -69
	andi $t1, $t0, 1
	st.w $t1, $fp, -76
# %op7 = add i32 %op6, zeroinitializer
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -80
# %op8 = icmp ne i32 %op7, zeroinitializer
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -81
# br i1 %op8, label %label_x_ltz16, label %label_x_gtz17
# gen_phi
	ld.b $t0, $fp, -81
	bnez $t0, .main_label_x_ltz16
	b .main_label_x_gtz17
.main_label_x_ltz16:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_x_gtz17
# gen_phi
	b .main_label_x_gtz17
.main_label_x_gtz17:
# %op9 = getelementptr [1 x i32], [1 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -96
# %op10 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -97
# %op11 = zext i1 %op10 to i32
	ld.b $t0, $fp, -97
	andi $t1, $t0, 1
	st.w $t1, $fp, -104
# %op12 = add i32 %op11, zeroinitializer
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -108
# %op13 = icmp ne i32 %op12, zeroinitializer
	ld.w $t0, $fp, -108
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -109
# br i1 %op13, label %label_x_ltz18, label %label_x_gtz19
# gen_phi
	ld.b $t0, $fp, -109
	bnez $t0, .main_label_x_ltz18
	b .main_label_x_gtz19
.main_label_x_ltz18:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_x_gtz19
# gen_phi
	b .main_label_x_gtz19
.main_label_x_gtz19:
# %op14 = getelementptr [1 x i32], [1 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -120
# %op15 = load i32, i32* %op14
	ld.d $t0, $fp, -120
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -124
# %op16 = sdiv i32 %op15, 15
	ld.w $t0, $fp, -124
	addi.w $t1, $zero, 15
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -128
# %op17 = mul i32 %op16, 15
	ld.w $t0, $fp, -128
	addi.w $t1, $zero, 15
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -132
# %op18 = sub i32 %op15, %op17
	ld.w $t0, $fp, -124
	ld.w $t1, $fp, -132
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -136
# %op19 = add i32 %op18, 15
	ld.w $t0, $fp, -136
	addi.w $t1, $zero, 15
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -140
# %op20 = sdiv i32 %op19, 15
	ld.w $t0, $fp, -140
	addi.w $t1, $zero, 15
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -144
# %op21 = mul i32 %op20, 15
	ld.w $t0, $fp, -144
	addi.w $t1, $zero, 15
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -148
# %op22 = sub i32 %op19, %op21
	ld.w $t0, $fp, -140
	ld.w $t1, $fp, -148
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -152
# store i32 %op22, i32* %op9
	ld.d $t0, $fp, -96
	ld.w $t1, $fp, -152
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op23 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -153
# %op24 = zext i1 %op23 to i32
	ld.b $t0, $fp, -153
	andi $t1, $t0, 1
	st.w $t1, $fp, -160
# %op25 = add i32 %op24, zeroinitializer
	ld.w $t0, $fp, -160
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -164
# %op26 = icmp ne i32 %op25, zeroinitializer
	ld.w $t0, $fp, -164
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -165
# br i1 %op26, label %label_x_ltz20, label %label_x_gtz21
# gen_phi
	ld.b $t0, $fp, -165
	bnez $t0, .main_label_x_ltz20
	b .main_label_x_gtz21
.main_label_x_ltz20:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_x_gtz21
# gen_phi
	b .main_label_x_gtz21
.main_label_x_gtz21:
# %op27 = getelementptr [1 x i32], [1 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -176
# %op28 = load i32, i32* %op27
	ld.d $t0, $fp, -176
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -180
# call void @putint(i32 %op28)
	ld.w $a0, $fp, -180
	bl putint
# ret i32 0
# gen_phi
	addi.w $a0, $zero, 0
	b .main_exit
.main_exit:
	addi.d $sp, $sp, 192
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
