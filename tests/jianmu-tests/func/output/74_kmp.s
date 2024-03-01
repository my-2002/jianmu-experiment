	.text
	.globl get_next
	.type get_next, @function
get_next:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -400
	st.d $a0, $fp, -24
	st.d $a1, $fp, -32
.get_next_label_entry:
# %op2 = alloca i32*
	lu12i.w $t0, -1
	ori $t0, $t0, 4056
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -8
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -40
# store i32* %arg0, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $fp, -24
	st.d $t1, $t0, 0
# %op3 = alloca i32*
	lu12i.w $t0, -1
	ori $t0, $t0, 4040
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -8
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -56
# store i32* %arg1, i32** %op3
	ld.d $t0, $fp, -56
	ld.d $t1, $fp, -32
	st.d $t1, $t0, 0
# %op4 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -65
# %op5 = zext i1 %op4 to i32
	ld.b $t0, $fp, -65
	andi $t1, $t0, 1
	st.w $t1, $fp, -72
# %op6 = add i32 %op5, zeroinitializer
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# %op7 = icmp ne i32 %op6, zeroinitializer
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -77
# br i1 %op7, label %label_next_ltz0, label %label_next_gtz1
	ld.b $t0, $fp, -77
	bnez $t0, .get_next_label_next_ltz0
	b .get_next_label_next_gtz1
.get_next_label_next_ltz0:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_next_gtz1
	b .get_next_label_next_gtz1
.get_next_label_next_gtz1:
# %op8 = load i32*, i32** %op3
	ld.d $t0, $fp, -56
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -88
# %op9 = getelementptr i32, i32* %op8, i32 0
	ld.d $t0, $fp, -88
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -96
# store i32 -1, i32* %op9
	ld.d $t0, $fp, -96
	addi.w $t1, $zero, -1
	st.w $t1, $t0, 0
# %op10 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3992
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -104
# store i32 0, i32* %op10
	ld.d $t0, $fp, -104
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op11 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3976
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -120
# store i32 -1, i32* %op11
	ld.d $t0, $fp, -120
	addi.w $t1, $zero, -1
	st.w $t1, $t0, 0
# br label %label_condition2
	b .get_next_label_condition2
.get_next_label_condition2:
# %op12 = load i32, i32* %op10
	ld.d $t0, $fp, -104
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -128
# %op13 = icmp slt i32 %op12, zeroinitializer
	ld.w $t0, $fp, -128
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -129
# %op14 = zext i1 %op13 to i32
	ld.b $t0, $fp, -129
	andi $t1, $t0, 1
	st.w $t1, $fp, -136
# %op15 = add i32 %op14, zeroinitializer
	ld.w $t0, $fp, -136
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -140
# %op16 = icmp ne i32 %op15, zeroinitializer
	ld.w $t0, $fp, -140
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -141
# br i1 %op16, label %label_str_ltz5, label %label_str_gtz6
	ld.b $t0, $fp, -141
	bnez $t0, .get_next_label_str_ltz5
	b .get_next_label_str_gtz6
.get_next_label_loop3:
# %op17 = load i32, i32* %op11
	ld.d $t0, $fp, -120
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -148
# %op18 = icmp slt i32 %op17, zeroinitializer
	ld.w $t0, $fp, -148
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -149
# %op19 = zext i1 %op18 to i32
	ld.b $t0, $fp, -149
	andi $t1, $t0, 1
	st.w $t1, $fp, -156
# %op20 = add i32 %op19, zeroinitializer
	ld.w $t0, $fp, -156
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -160
# %op21 = icmp ne i32 %op20, zeroinitializer
	ld.w $t0, $fp, -160
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -161
# br i1 %op21, label %label_str_ltz7, label %label_str_gtz8
	ld.b $t0, $fp, -161
	bnez $t0, .get_next_label_str_ltz7
	b .get_next_label_str_gtz8
.get_next_label_ret4:
# ret void
	addi.w $a0, $zero, 0
	b .get_next_exit
.get_next_label_str_ltz5:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_str_gtz6
	b .get_next_label_str_gtz6
.get_next_label_str_gtz6:
# %op22 = load i32*, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -176
# %op23 = getelementptr i32, i32* %op22, i32 %op12
	ld.d $t0, $fp, -176
	ld.w $t1, $fp, -128
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -184
# %op24 = load i32, i32* %op23
	ld.d $t0, $fp, -184
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -188
# %op25 = icmp sgt i32 %op24, zeroinitializer
	ld.w $t0, $fp, -188
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -189
# br i1 %op25, label %label_loop3, label %label_ret4
	ld.b $t0, $fp, -189
	bnez $t0, .get_next_label_loop3
	b .get_next_label_ret4
.get_next_label_str_ltz7:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_str_gtz8
	b .get_next_label_str_gtz8
.get_next_label_str_gtz8:
# %op26 = load i32*, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -200
# %op27 = getelementptr i32, i32* %op26, i32 %op17
	ld.d $t0, $fp, -200
	ld.w $t1, $fp, -148
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -208
# %op28 = load i32, i32* %op27
	ld.d $t0, $fp, -208
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -212
# %op29 = load i32, i32* %op10
	ld.d $t0, $fp, -104
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -216
# %op30 = icmp slt i32 %op29, zeroinitializer
	ld.w $t0, $fp, -216
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -217
# %op31 = zext i1 %op30 to i32
	ld.b $t0, $fp, -217
	andi $t1, $t0, 1
	st.w $t1, $fp, -224
# %op32 = add i32 %op31, zeroinitializer
	ld.w $t0, $fp, -224
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -228
# %op33 = icmp ne i32 %op32, zeroinitializer
	ld.w $t0, $fp, -228
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -229
# br i1 %op33, label %label_str_ltz9, label %label_str_gtz10
	ld.b $t0, $fp, -229
	bnez $t0, .get_next_label_str_ltz9
	b .get_next_label_str_gtz10
.get_next_label_str_ltz9:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_str_gtz10
	b .get_next_label_str_gtz10
.get_next_label_str_gtz10:
# %op34 = load i32*, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -240
# %op35 = getelementptr i32, i32* %op34, i32 %op29
	ld.d $t0, $fp, -240
	ld.w $t1, $fp, -216
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -248
# %op36 = load i32, i32* %op35
	ld.d $t0, $fp, -248
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -252
# %op37 = add i32 %op36, %op28
	ld.w $t0, $fp, -252
	ld.w $t1, $fp, -212
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -256
# %op38 = icmp eq i32 %op36, %op28
	ld.w $t0, $fp, -252
	ld.w $t1, $fp, -212
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -257
# %op39 = zext i1 %op38 to i32
	ld.b $t0, $fp, -257
	andi $t1, $t0, 1
	st.w $t1, $fp, -264
# %op40 = load i32, i32* %op11
	ld.d $t0, $fp, -120
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -268
# %op41 = add i32 %op40, -1
	ld.w $t0, $fp, -268
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -272
# %op42 = icmp eq i32 %op40, -1
	ld.w $t0, $fp, -268
	addi.w $t1, $zero, -1
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -273
# %op43 = zext i1 %op42 to i32
	ld.b $t0, $fp, -273
	andi $t1, $t0, 1
	st.w $t1, $fp, -280
# %op44 = add i32 %op43, %op39
	ld.w $t0, $fp, -280
	ld.w $t1, $fp, -264
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -284
# %op45 = icmp sge i32 %op44, 1
	ld.w $t0, $fp, -284
	addi.w $t1, $zero, 1
	slt $t2, $t0, $t1
	xori $t2, $t2, 1
	st.b $t2, $fp, -285
# %op46 = zext i1 %op45 to i32
	ld.b $t0, $fp, -285
	andi $t1, $t0, 1
	st.w $t1, $fp, -292
# %op47 = icmp sgt i32 %op46, zeroinitializer
	ld.w $t0, $fp, -292
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -293
# br i1 %op47, label %label_true11, label %label_false12
	ld.b $t0, $fp, -293
	bnez $t0, .get_next_label_true11
	b .get_next_label_false12
.get_next_label_true11:
# %op48 = load i32, i32* %op11
	ld.d $t0, $fp, -120
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -300
# %op49 = add i32 %op48, 1
	ld.w $t0, $fp, -300
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -304
# store i32 %op49, i32* %op11
	ld.d $t0, $fp, -120
	ld.w $t1, $fp, -304
	st.w $t1, $t0, 0
# %op50 = load i32, i32* %op10
	ld.d $t0, $fp, -104
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -308
# %op51 = add i32 %op50, 1
	ld.w $t0, $fp, -308
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -312
# store i32 %op51, i32* %op10
	ld.d $t0, $fp, -104
	ld.w $t1, $fp, -312
	st.w $t1, $t0, 0
# %op52 = load i32, i32* %op10
	ld.d $t0, $fp, -104
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -316
# %op53 = icmp slt i32 %op52, zeroinitializer
	ld.w $t0, $fp, -316
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -317
# %op54 = zext i1 %op53 to i32
	ld.b $t0, $fp, -317
	andi $t1, $t0, 1
	st.w $t1, $fp, -324
# %op55 = add i32 %op54, zeroinitializer
	ld.w $t0, $fp, -324
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -328
# %op56 = icmp ne i32 %op55, zeroinitializer
	ld.w $t0, $fp, -328
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -329
# br i1 %op56, label %label_next_ltz13, label %label_next_gtz14
	ld.b $t0, $fp, -329
	bnez $t0, .get_next_label_next_ltz13
	b .get_next_label_next_gtz14
.get_next_label_false12:
# %op57 = load i32, i32* %op11
	ld.d $t0, $fp, -120
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -336
# %op58 = icmp slt i32 %op57, zeroinitializer
	ld.w $t0, $fp, -336
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -337
# %op59 = zext i1 %op58 to i32
	ld.b $t0, $fp, -337
	andi $t1, $t0, 1
	st.w $t1, $fp, -344
# %op60 = add i32 %op59, zeroinitializer
	ld.w $t0, $fp, -344
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -348
# %op61 = icmp ne i32 %op60, zeroinitializer
	ld.w $t0, $fp, -348
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -349
# br i1 %op61, label %label_next_ltz15, label %label_next_gtz16
	ld.b $t0, $fp, -349
	bnez $t0, .get_next_label_next_ltz15
	b .get_next_label_next_gtz16
.get_next_label_next_ltz13:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_next_gtz14
	b .get_next_label_next_gtz14
.get_next_label_next_gtz14:
# %op62 = load i32*, i32** %op3
	ld.d $t0, $fp, -56
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -360
# %op63 = getelementptr i32, i32* %op62, i32 %op52
	ld.d $t0, $fp, -360
	ld.w $t1, $fp, -316
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -368
# %op64 = load i32, i32* %op11
	ld.d $t0, $fp, -120
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -372
# store i32 %op64, i32* %op63
	ld.d $t0, $fp, -368
	ld.w $t1, $fp, -372
	st.w $t1, $t0, 0
# br label %label_ret17
	b .get_next_label_ret17
.get_next_label_next_ltz15:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_next_gtz16
	b .get_next_label_next_gtz16
.get_next_label_next_gtz16:
# %op65 = load i32*, i32** %op3
	ld.d $t0, $fp, -56
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -384
# %op66 = getelementptr i32, i32* %op65, i32 %op57
	ld.d $t0, $fp, -384
	ld.w $t1, $fp, -336
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -392
# %op67 = load i32, i32* %op66
	ld.d $t0, $fp, -392
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -396
# store i32 %op67, i32* %op11
	ld.d $t0, $fp, -120
	ld.w $t1, $fp, -396
	st.w $t1, $t0, 0
# br label %label_ret17
	b .get_next_label_ret17
.get_next_label_ret17:
# br label %label_condition2
	b .get_next_label_condition2
.get_next_exit:
	addi.d $sp, $sp, 400
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl KMP
	.type KMP, @function
KMP:
	lu12i.w $t0, 4
	ori $t0, $t0, 416
	lu32i.d $t0, 0
	lu52i.d $t0, $t0, 0
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	sub.d $sp, $sp, $t0
	add.d $fp, $sp, $t0
	st.d $a0, $fp, -24
	st.d $a1, $fp, -32
.KMP_label_entry:
# %op2 = alloca i32*
	lu12i.w $t0, -1
	ori $t0, $t0, 4056
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -8
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -40
# store i32* %arg0, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $fp, -24
	st.d $t1, $t0, 0
# %op3 = alloca i32*
	lu12i.w $t0, -1
	ori $t0, $t0, 4040
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -8
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -56
# store i32* %arg1, i32** %op3
	ld.d $t0, $fp, -56
	ld.d $t1, $fp, -32
	st.d $t1, $t0, 0
# %op4 = alloca [4096 x i32]
	lu12i.w $t0, -1
	ori $t0, $t0, 4024
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -16384
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -72
# %op5 = load i32*, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 4016
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t1, $t8, 0
# %op6 = getelementptr [4096 x i32], [4096 x i32]* %op4, i32 0, i32 0
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 4008
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# call void @get_next(i32* %op5, i32* %op6)
	lu12i.w $a0, -5
	ori $a0, $a0, 4016
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.d $a0, $a0, 0
	lu12i.w $a1, -5
	ori $a1, $a1, 4008
	lu32i.d $a1, -1
	lu52i.d $a1, $a1, -1
	add.d $a1, $fp, $a1
	ld.d $a1, $a1, 0
	bl get_next
# %op7 = alloca i32
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	lu12i.w $t8, -5
	ori $t8, $t8, 4000
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# store i32 0, i32* %op7
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op8 = alloca i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3984
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	lu12i.w $t8, -5
	ori $t8, $t8, 3984
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# store i32 0, i32* %op8
	lu12i.w $t0, -5
	ori $t0, $t0, 3984
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_condition18
	b .KMP_label_condition18
.KMP_label_condition18:
# %op9 = load i32, i32* %op8
	lu12i.w $t0, -5
	ori $t0, $t0, 3984
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3976
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op10 = icmp slt i32 %op9, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3976
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3975
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op11 = zext i1 %op10 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3975
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3968
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op12 = add i32 %op11, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3968
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3964
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op13 = icmp ne i32 %op12, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3964
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -5
	ori $t8, $t8, 3963
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op13, label %label_src_ltz21, label %label_src_gtz22
	lu12i.w $t0, -5
	ori $t0, $t0, 3963
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_src_ltz21
	b .KMP_label_src_gtz22
.KMP_label_loop19:
# %op14 = load i32, i32* %op8
	lu12i.w $t0, -5
	ori $t0, $t0, 3984
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3956
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op15 = icmp slt i32 %op14, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3956
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3955
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op16 = zext i1 %op15 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3955
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3948
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op17 = add i32 %op16, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3948
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3944
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op18 = icmp ne i32 %op17, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3944
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -5
	ori $t8, $t8, 3943
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op18, label %label_src_ltz23, label %label_src_gtz24
	lu12i.w $t0, -5
	ori $t0, $t0, 3943
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_src_ltz23
	b .KMP_label_src_gtz24
.KMP_label_ret20:
# ret i32 -1
	addi.w $a0, $zero, -1
	b .KMP_exit
.KMP_label_src_ltz21:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_src_gtz22
	b .KMP_label_src_gtz22
.KMP_label_src_gtz22:
# %op19 = load i32*, i32** %op3
	ld.d $t0, $fp, -56
	ld.d $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3928
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t1, $t8, 0
# %op20 = getelementptr i32, i32* %op19, i32 %op9
	lu12i.w $t0, -5
	ori $t0, $t0, 3928
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -5
	ori $t1, $t1, 3976
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3920
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op21 = load i32, i32* %op20
	lu12i.w $t0, -5
	ori $t0, $t0, 3920
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3916
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op22 = icmp sgt i32 %op21, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3916
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -5
	ori $t8, $t8, 3915
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op22, label %label_loop19, label %label_ret20
	lu12i.w $t0, -5
	ori $t0, $t0, 3915
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_loop19
	b .KMP_label_ret20
.KMP_label_src_ltz23:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_src_gtz24
	b .KMP_label_src_gtz24
.KMP_label_src_gtz24:
# %op23 = load i32*, i32** %op3
	ld.d $t0, $fp, -56
	ld.d $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3904
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t1, $t8, 0
# %op24 = getelementptr i32, i32* %op23, i32 %op14
	lu12i.w $t0, -5
	ori $t0, $t0, 3904
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -5
	ori $t1, $t1, 3956
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3896
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op25 = load i32, i32* %op24
	lu12i.w $t0, -5
	ori $t0, $t0, 3896
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3892
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op26 = load i32, i32* %op7
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3888
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op27 = icmp slt i32 %op26, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3888
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3887
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op28 = zext i1 %op27 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3887
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3880
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op29 = add i32 %op28, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3880
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3876
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op30 = icmp ne i32 %op29, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3876
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -5
	ori $t8, $t8, 3875
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op30, label %label_dst_ltz25, label %label_dst_gtz26
	lu12i.w $t0, -5
	ori $t0, $t0, 3875
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_dst_ltz25
	b .KMP_label_dst_gtz26
.KMP_label_dst_ltz25:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_dst_gtz26
	b .KMP_label_dst_gtz26
.KMP_label_dst_gtz26:
# %op31 = load i32*, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3864
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t1, $t8, 0
# %op32 = getelementptr i32, i32* %op31, i32 %op26
	lu12i.w $t0, -5
	ori $t0, $t0, 3864
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -5
	ori $t1, $t1, 3888
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3856
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op33 = load i32, i32* %op32
	lu12i.w $t0, -5
	ori $t0, $t0, 3856
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3852
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op34 = add i32 %op33, %op25
	lu12i.w $t0, -5
	ori $t0, $t0, 3852
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -5
	ori $t1, $t1, 3892
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3848
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op35 = icmp eq i32 %op33, %op25
	lu12i.w $t0, -5
	ori $t0, $t0, 3852
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -5
	ori $t1, $t1, 3892
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3847
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op36 = zext i1 %op35 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3847
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3840
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op37 = icmp sgt i32 %op36, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3840
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -5
	ori $t8, $t8, 3839
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op37, label %label_true27, label %label_false28
	lu12i.w $t0, -5
	ori $t0, $t0, 3839
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_true27
	b .KMP_label_false28
.KMP_label_true27:
# %op38 = load i32, i32* %op7
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3832
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op39 = add i32 %op38, 1
	lu12i.w $t0, -5
	ori $t0, $t0, 3832
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3828
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op39, i32* %op7
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -5
	ori $t1, $t1, 3828
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# %op40 = load i32, i32* %op8
	lu12i.w $t0, -5
	ori $t0, $t0, 3984
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3824
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op41 = add i32 %op40, 1
	lu12i.w $t0, -5
	ori $t0, $t0, 3824
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3820
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op41, i32* %op8
	lu12i.w $t0, -5
	ori $t0, $t0, 3984
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -5
	ori $t1, $t1, 3820
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# %op42 = load i32, i32* %op7
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3816
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op43 = icmp slt i32 %op42, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3816
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3815
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op44 = zext i1 %op43 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3815
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3808
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op45 = add i32 %op44, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3804
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op46 = icmp ne i32 %op45, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3804
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -5
	ori $t8, $t8, 3803
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op46, label %label_dst_ltz29, label %label_dst_gtz30
	lu12i.w $t0, -5
	ori $t0, $t0, 3803
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_dst_ltz29
	b .KMP_label_dst_gtz30
.KMP_label_false28:
# %op47 = load i32, i32* %op7
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3796
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op48 = icmp slt i32 %op47, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3796
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3795
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op49 = zext i1 %op48 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3795
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3788
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op50 = add i32 %op49, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3788
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3784
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op51 = icmp ne i32 %op50, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3784
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -5
	ori $t8, $t8, 3783
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op51, label %label_next_ltz33, label %label_next_gtz34
	lu12i.w $t0, -5
	ori $t0, $t0, 3783
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_next_ltz33
	b .KMP_label_next_gtz34
.KMP_label_dst_ltz29:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_dst_gtz30
	b .KMP_label_dst_gtz30
.KMP_label_dst_gtz30:
# %op52 = load i32*, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3768
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t1, $t8, 0
# %op53 = getelementptr i32, i32* %op52, i32 %op42
	lu12i.w $t0, -5
	ori $t0, $t0, 3768
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -5
	ori $t1, $t1, 3816
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3760
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op54 = load i32, i32* %op53
	lu12i.w $t0, -5
	ori $t0, $t0, 3760
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3756
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op55 = icmp sle i32 %op54, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3756
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	xori $t2, $t2, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3755
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op56 = zext i1 %op55 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3755
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3748
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op57 = icmp sgt i32 %op56, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3748
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -5
	ori $t8, $t8, 3747
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op57, label %label_true31, label %label_ret32
	lu12i.w $t0, -5
	ori $t0, $t0, 3747
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_true31
	b .KMP_label_ret32
.KMP_label_true31:
# %op58 = load i32, i32* %op8
	lu12i.w $t0, -5
	ori $t0, $t0, 3984
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3740
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# ret i32 %op58
	lu12i.w $a0, -5
	ori $a0, $a0, 3740
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.w $a0, $a0, 0
	b .KMP_exit
.KMP_label_ret32:
# br label %label_ret37
	b .KMP_label_ret37
.KMP_label_next_ltz33:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_next_gtz34
	b .KMP_label_next_gtz34
.KMP_label_next_gtz34:
# %op59 = getelementptr [4096 x i32], [4096 x i32]* %op4, i32 0, i32 %op47
	ld.d $t0, $fp, -72
	lu12i.w $t1, -5
	ori $t1, $t1, 3796
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3728
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op60 = load i32, i32* %op59
	lu12i.w $t0, -5
	ori $t0, $t0, 3728
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3724
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# store i32 %op60, i32* %op7
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -5
	ori $t1, $t1, 3724
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# %op61 = load i32, i32* %op7
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3720
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op62 = add i32 %op61, -1
	lu12i.w $t0, -5
	ori $t0, $t0, 3720
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3716
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op63 = icmp eq i32 %op61, -1
	lu12i.w $t0, -5
	ori $t0, $t0, 3720
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, -1
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3715
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op64 = zext i1 %op63 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3715
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3708
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op65 = icmp sgt i32 %op64, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3708
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -5
	ori $t8, $t8, 3707
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op65, label %label_true35, label %label_ret36
	lu12i.w $t0, -5
	ori $t0, $t0, 3707
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_true35
	b .KMP_label_ret36
.KMP_label_true35:
# %op66 = load i32, i32* %op7
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3700
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op67 = add i32 %op66, 1
	lu12i.w $t0, -5
	ori $t0, $t0, 3700
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3696
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op67, i32* %op7
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -5
	ori $t1, $t1, 3696
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# %op68 = load i32, i32* %op8
	lu12i.w $t0, -5
	ori $t0, $t0, 3984
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3692
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op69 = add i32 %op68, 1
	lu12i.w $t0, -5
	ori $t0, $t0, 3692
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3688
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op69, i32* %op8
	lu12i.w $t0, -5
	ori $t0, $t0, 3984
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -5
	ori $t1, $t1, 3688
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# br label %label_ret36
	b .KMP_label_ret36
.KMP_label_ret36:
# br label %label_ret37
	b .KMP_label_ret37
.KMP_label_ret37:
# br label %label_condition18
	b .KMP_label_condition18
.KMP_exit:
	lu12i.w $t0, 4
	ori $t0, $t0, 416
	lu32i.d $t0, 0
	lu52i.d $t0, $t0, 0
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl read_str
	.type read_str, @function
read_str:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -208
	st.d $a0, $fp, -24
.read_str_label_entry:
# %op1 = alloca i32*
	lu12i.w $t0, -1
	ori $t0, $t0, 4064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -8
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -32
# store i32* %arg0, i32** %op1
	ld.d $t0, $fp, -32
	ld.d $t1, $fp, -24
	st.d $t1, $t0, 0
# %op2 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4048
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -48
# store i32 0, i32* %op2
	ld.d $t0, $fp, -48
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_condition38
	b .read_str_label_condition38
.read_str_label_condition38:
# %op3 = icmp sgt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -53
# br i1 %op3, label %label_loop39, label %label_ret40
	ld.b $t0, $fp, -53
	bnez $t0, .read_str_label_loop39
	b .read_str_label_ret40
.read_str_label_loop39:
# %op4 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -60
# %op5 = icmp slt i32 %op4, zeroinitializer
	ld.w $t0, $fp, -60
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -61
# %op6 = zext i1 %op5 to i32
	ld.b $t0, $fp, -61
	andi $t1, $t0, 1
	st.w $t1, $fp, -68
# %op7 = add i32 %op6, zeroinitializer
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -72
# %op8 = icmp ne i32 %op7, zeroinitializer
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -73
# br i1 %op8, label %label_buf_ltz41, label %label_buf_gtz42
	ld.b $t0, $fp, -73
	bnez $t0, .read_str_label_buf_ltz41
	b .read_str_label_buf_gtz42
.read_str_label_ret40:
# %op9 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -80
# %op10 = icmp slt i32 %op9, zeroinitializer
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -81
# %op11 = zext i1 %op10 to i32
	ld.b $t0, $fp, -81
	andi $t1, $t0, 1
	st.w $t1, $fp, -88
# %op12 = add i32 %op11, zeroinitializer
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -92
# %op13 = icmp ne i32 %op12, zeroinitializer
	ld.w $t0, $fp, -92
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -93
# br i1 %op13, label %label_buf_ltz47, label %label_buf_gtz48
	ld.b $t0, $fp, -93
	bnez $t0, .read_str_label_buf_ltz47
	b .read_str_label_buf_gtz48
.read_str_label_buf_ltz41:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_buf_gtz42
	b .read_str_label_buf_gtz42
.read_str_label_buf_gtz42:
# %op14 = load i32*, i32** %op1
	ld.d $t0, $fp, -32
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -104
# %op15 = getelementptr i32, i32* %op14, i32 %op4
	ld.d $t0, $fp, -104
	ld.w $t1, $fp, -60
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -112
# %op16 = call i32 @getch()
	bl getch
	st.w $a0, $fp, -116
# store i32 %op16, i32* %op15
	ld.d $t0, $fp, -112
	ld.w $t1, $fp, -116
	st.w $t1, $t0, 0
# %op17 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -120
# %op18 = icmp slt i32 %op17, zeroinitializer
	ld.w $t0, $fp, -120
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -121
# %op19 = zext i1 %op18 to i32
	ld.b $t0, $fp, -121
	andi $t1, $t0, 1
	st.w $t1, $fp, -128
# %op20 = add i32 %op19, zeroinitializer
	ld.w $t0, $fp, -128
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -132
# %op21 = icmp ne i32 %op20, zeroinitializer
	ld.w $t0, $fp, -132
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -133
# br i1 %op21, label %label_buf_ltz43, label %label_buf_gtz44
	ld.b $t0, $fp, -133
	bnez $t0, .read_str_label_buf_ltz43
	b .read_str_label_buf_gtz44
.read_str_label_buf_ltz43:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_buf_gtz44
	b .read_str_label_buf_gtz44
.read_str_label_buf_gtz44:
# %op22 = load i32*, i32** %op1
	ld.d $t0, $fp, -32
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -144
# %op23 = getelementptr i32, i32* %op22, i32 %op17
	ld.d $t0, $fp, -144
	ld.w $t1, $fp, -120
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -152
# %op24 = load i32, i32* %op23
	ld.d $t0, $fp, -152
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -156
# %op25 = add i32 %op24, 10
	ld.w $t0, $fp, -156
	addi.w $t1, $zero, 10
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -160
# %op26 = icmp eq i32 %op24, 10
	ld.w $t0, $fp, -156
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -161
# %op27 = zext i1 %op26 to i32
	ld.b $t0, $fp, -161
	andi $t1, $t0, 1
	st.w $t1, $fp, -168
# %op28 = icmp sgt i32 %op27, zeroinitializer
	ld.w $t0, $fp, -168
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -169
# br i1 %op28, label %label_true45, label %label_ret46
	ld.b $t0, $fp, -169
	bnez $t0, .read_str_label_true45
	b .read_str_label_ret46
.read_str_label_true45:
# br label %label_ret40
	b .read_str_label_ret40
.read_str_label_ret46:
# %op29 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -176
# %op30 = add i32 %op29, 1
	ld.w $t0, $fp, -176
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -180
# store i32 %op30, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -180
	st.w $t1, $t0, 0
# br label %label_condition38
	b .read_str_label_condition38
.read_str_label_buf_ltz47:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_buf_gtz48
	b .read_str_label_buf_gtz48
.read_str_label_buf_gtz48:
# %op31 = load i32*, i32** %op1
	ld.d $t0, $fp, -32
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -192
# %op32 = getelementptr i32, i32* %op31, i32 %op9
	ld.d $t0, $fp, -192
	ld.w $t1, $fp, -80
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -200
# store i32 0, i32* %op32
	ld.d $t0, $fp, -200
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op33 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -204
# ret i32 %op33
	ld.w $a0, $fp, -204
	b .read_str_exit
.read_str_exit:
	addi.d $sp, $sp, 208
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	lu12i.w $t0, 8
	ori $t0, $t0, 96
	lu32i.d $t0, 0
	lu52i.d $t0, $t0, 0
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	sub.d $sp, $sp, $t0
	add.d $fp, $sp, $t0
.main_label_entry:
# %op0 = alloca [4096 x i32]
	lu12i.w $t0, -1
	ori $t0, $t0, 4072
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -16384
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -24
# %op1 = alloca [4096 x i32]
	lu12i.w $t0, -5
	ori $t0, $t0, 4064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -16384
	add.d $t0, $fp, $t0
	lu12i.w $t8, -5
	ori $t8, $t8, 4064
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op2 = getelementptr [4096 x i32], [4096 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -9
	ori $t8, $t8, 4056
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op3 = call i32 @read_str(i32* %op2)
	lu12i.w $a0, -9
	ori $a0, $a0, 4056
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.d $a0, $a0, 0
	bl read_str
	lu12i.w $t8, -9
	ori $t8, $t8, 4052
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $a0, $t8, 0
# %op4 = getelementptr [4096 x i32], [4096 x i32]* %op1, i32 0, i32 0
	lu12i.w $t0, -5
	ori $t0, $t0, 4064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -9
	ori $t8, $t8, 4040
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op5 = call i32 @read_str(i32* %op4)
	lu12i.w $a0, -9
	ori $a0, $a0, 4040
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.d $a0, $a0, 0
	bl read_str
	lu12i.w $t8, -9
	ori $t8, $t8, 4036
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $a0, $t8, 0
# %op6 = getelementptr [4096 x i32], [4096 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -9
	ori $t8, $t8, 4024
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op7 = getelementptr [4096 x i32], [4096 x i32]* %op1, i32 0, i32 0
	lu12i.w $t0, -5
	ori $t0, $t0, 4064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -9
	ori $t8, $t8, 4016
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op8 = call i32 @KMP(i32* %op6, i32* %op7)
	lu12i.w $a0, -9
	ori $a0, $a0, 4024
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.d $a0, $a0, 0
	lu12i.w $a1, -9
	ori $a1, $a1, 4016
	lu32i.d $a1, -1
	lu52i.d $a1, $a1, -1
	add.d $a1, $fp, $a1
	ld.d $a1, $a1, 0
	bl KMP
	lu12i.w $t8, -9
	ori $t8, $t8, 4012
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $a0, $t8, 0
# call void @putint(i32 %op8)
	lu12i.w $a0, -9
	ori $a0, $a0, 4012
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.w $a0, $a0, 0
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# ret i32 0
	addi.w $a0, $zero, 0
	b .main_exit
.main_exit:
	lu12i.w $t0, 8
	ori $t0, $t0, 96
	lu32i.d $t0, 0
	lu52i.d $t0, $t0, 0
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
