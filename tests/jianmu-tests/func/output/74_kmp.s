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
	addi.d $t0, $t0, 8
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
	addi.d $t0, $t0, 8
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
# gen_phi
	ld.b $t0, $fp, -77
	bnez $t0, .get_next_label_next_ltz0
	b .get_next_label_next_gtz1
.get_next_label_next_ltz0:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_next_gtz1
# gen_phi
	b .get_next_label_next_gtz1
.get_next_label_next_gtz1:
# %op8 = load i32*, i32** %op3
	ld.d $t0, $fp, -56
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -88
# %op9 = getelementptr i32, i32* %op8, i32 0
	ld.d $t0, $fp, -88
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -96
# store i32 -1, i32* %op9
	ld.d $t0, $fp, -96
	addi.w $t1, $zero, -1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
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
	addi.d $t0, $t0, 4
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
	addi.d $t0, $t0, 4
# br label %label_condition2
# gen_phi
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
# gen_phi
	ld.b $t0, $fp, -141
	bnez $t0, .get_next_label_str_ltz5
	b .get_next_label_str_gtz6
.get_next_label_loop3:
# %op17 = load i32, i32* %op11
	ld.d $t0, $fp, -120
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -148
# %op18 = icmp eq i32 %op17, -1
	ld.w $t0, $fp, -148
	addi.w $t1, $zero, -1
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -149
# %op19 = zext i1 %op18 to i32
	ld.b $t0, $fp, -149
	andi $t1, $t0, 1
	st.w $t1, $fp, -156
# %op20 = icmp sge i32 %op19, zeroinitializer
	ld.w $t0, $fp, -156
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	xori $t2, $t2, 1
	st.b $t2, $fp, -157
# br i1 %op20, label %label_true7, label %label_false8
# gen_phi
	ld.b $t0, $fp, -157
	bnez $t0, .get_next_label_true7
	b .get_next_label_false8
.get_next_label_ret4:
# ret void
# gen_phi
	addi.w $a0, $zero, 0
	b .get_next_exit
.get_next_label_str_ltz5:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_str_gtz6
# gen_phi
	b .get_next_label_str_gtz6
.get_next_label_str_gtz6:
# %op21 = load i32*, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -168
# %op22 = getelementptr i32, i32* %op21, i32 %op12
	ld.d $t0, $fp, -168
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -128
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -176
# %op23 = load i32, i32* %op22
	ld.d $t0, $fp, -176
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -180
# %op24 = icmp sgt i32 %op23, zeroinitializer
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -181
# br i1 %op24, label %label_loop3, label %label_ret4
# gen_phi
	ld.b $t0, $fp, -181
	bnez $t0, .get_next_label_loop3
	b .get_next_label_ret4
.get_next_label_true7:
# %op25 = icmp sgt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -182
# br label %label_ret9
# gen_phi
	ld.b $t0, $fp, -182
	st.b $t0, $fp, -202
	b .get_next_label_ret9
.get_next_label_false8:
# %op26 = load i32, i32* %op10
	ld.d $t0, $fp, -104
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -188
# %op27 = icmp slt i32 %op26, zeroinitializer
	ld.w $t0, $fp, -188
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -189
# %op28 = zext i1 %op27 to i32
	ld.b $t0, $fp, -189
	andi $t1, $t0, 1
	st.w $t1, $fp, -196
# %op29 = add i32 %op28, zeroinitializer
	ld.w $t0, $fp, -196
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -200
# %op30 = icmp ne i32 %op29, zeroinitializer
	ld.w $t0, $fp, -200
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -201
# br i1 %op30, label %label_str_ltz10, label %label_str_gtz11
# gen_phi
	ld.b $t0, $fp, -201
	bnez $t0, .get_next_label_str_ltz10
	b .get_next_label_str_gtz11
.get_next_label_ret9:
# %op31 = phi i1 [ %op25, %label_true7 ], [ %op47, %label_str_gtz13 ]
# %op32 = zext i1 %op31 to i32
	ld.b $t0, $fp, -202
	andi $t1, $t0, 1
	st.w $t1, $fp, -208
# %op33 = icmp sgt i32 %op32, zeroinitializer
	ld.w $t0, $fp, -208
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -209
# br i1 %op33, label %label_true14, label %label_false15
# gen_phi
	ld.b $t0, $fp, -209
	bnez $t0, .get_next_label_true14
	b .get_next_label_false15
.get_next_label_str_ltz10:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_str_gtz11
# gen_phi
	b .get_next_label_str_gtz11
.get_next_label_str_gtz11:
# %op34 = load i32*, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -224
# %op35 = getelementptr i32, i32* %op34, i32 %op26
	ld.d $t0, $fp, -224
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -188
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -232
# %op36 = load i32, i32* %op35
	ld.d $t0, $fp, -232
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -236
# %op37 = load i32, i32* %op11
	ld.d $t0, $fp, -120
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -240
# %op38 = icmp slt i32 %op37, zeroinitializer
	ld.w $t0, $fp, -240
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -241
# %op39 = zext i1 %op38 to i32
	ld.b $t0, $fp, -241
	andi $t1, $t0, 1
	st.w $t1, $fp, -248
# %op40 = add i32 %op39, zeroinitializer
	ld.w $t0, $fp, -248
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -252
# %op41 = icmp ne i32 %op40, zeroinitializer
	ld.w $t0, $fp, -252
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -253
# br i1 %op41, label %label_str_ltz12, label %label_str_gtz13
# gen_phi
	ld.b $t0, $fp, -253
	bnez $t0, .get_next_label_str_ltz12
	b .get_next_label_str_gtz13
.get_next_label_str_ltz12:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_str_gtz13
# gen_phi
	b .get_next_label_str_gtz13
.get_next_label_str_gtz13:
# %op42 = load i32*, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -264
# %op43 = getelementptr i32, i32* %op42, i32 %op37
	ld.d $t0, $fp, -264
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -240
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -272
# %op44 = load i32, i32* %op43
	ld.d $t0, $fp, -272
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -276
# %op45 = icmp eq i32 %op36, %op44
	ld.w $t0, $fp, -236
	ld.w $t1, $fp, -276
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -277
# %op46 = zext i1 %op45 to i32
	ld.b $t0, $fp, -277
	andi $t1, $t0, 1
	st.w $t1, $fp, -284
# %op47 = icmp sgt i32 %op46, zeroinitializer
	ld.w $t0, $fp, -284
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -285
# br label %label_ret9
# gen_phi
	ld.b $t0, $fp, -285
	st.b $t0, $fp, -202
	b .get_next_label_ret9
.get_next_label_true14:
# %op48 = load i32, i32* %op11
	ld.d $t0, $fp, -120
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -292
# %op49 = add i32 %op48, 1
	ld.w $t0, $fp, -292
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -296
# store i32 %op49, i32* %op11
	ld.d $t0, $fp, -120
	ld.w $t1, $fp, -296
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op50 = load i32, i32* %op10
	ld.d $t0, $fp, -104
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -300
# %op51 = add i32 %op50, 1
	ld.w $t0, $fp, -300
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -304
# store i32 %op51, i32* %op10
	ld.d $t0, $fp, -104
	ld.w $t1, $fp, -304
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op52 = load i32, i32* %op10
	ld.d $t0, $fp, -104
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -308
# %op53 = icmp slt i32 %op52, zeroinitializer
	ld.w $t0, $fp, -308
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -309
# %op54 = zext i1 %op53 to i32
	ld.b $t0, $fp, -309
	andi $t1, $t0, 1
	st.w $t1, $fp, -316
# %op55 = add i32 %op54, zeroinitializer
	ld.w $t0, $fp, -316
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -320
# %op56 = icmp ne i32 %op55, zeroinitializer
	ld.w $t0, $fp, -320
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -321
# br i1 %op56, label %label_next_ltz16, label %label_next_gtz17
# gen_phi
	ld.b $t0, $fp, -321
	bnez $t0, .get_next_label_next_ltz16
	b .get_next_label_next_gtz17
.get_next_label_false15:
# %op57 = load i32, i32* %op11
	ld.d $t0, $fp, -120
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -328
# %op58 = icmp slt i32 %op57, zeroinitializer
	ld.w $t0, $fp, -328
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -329
# %op59 = zext i1 %op58 to i32
	ld.b $t0, $fp, -329
	andi $t1, $t0, 1
	st.w $t1, $fp, -336
# %op60 = add i32 %op59, zeroinitializer
	ld.w $t0, $fp, -336
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -340
# %op61 = icmp ne i32 %op60, zeroinitializer
	ld.w $t0, $fp, -340
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -341
# br i1 %op61, label %label_next_ltz18, label %label_next_gtz19
# gen_phi
	ld.b $t0, $fp, -341
	bnez $t0, .get_next_label_next_ltz18
	b .get_next_label_next_gtz19
.get_next_label_next_ltz16:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_next_gtz17
# gen_phi
	b .get_next_label_next_gtz17
.get_next_label_next_gtz17:
# %op62 = load i32*, i32** %op3
	ld.d $t0, $fp, -56
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -352
# %op63 = getelementptr i32, i32* %op62, i32 %op52
	ld.d $t0, $fp, -352
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -308
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -360
# %op64 = load i32, i32* %op11
	ld.d $t0, $fp, -120
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -364
# store i32 %op64, i32* %op63
	ld.d $t0, $fp, -360
	ld.w $t1, $fp, -364
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_ret20
# gen_phi
	b .get_next_label_ret20
.get_next_label_next_ltz18:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_next_gtz19
# gen_phi
	b .get_next_label_next_gtz19
.get_next_label_next_gtz19:
# %op65 = load i32*, i32** %op3
	ld.d $t0, $fp, -56
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -376
# %op66 = getelementptr i32, i32* %op65, i32 %op57
	ld.d $t0, $fp, -376
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -328
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -384
# %op67 = load i32, i32* %op66
	ld.d $t0, $fp, -384
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -388
# store i32 %op67, i32* %op11
	ld.d $t0, $fp, -120
	ld.w $t1, $fp, -388
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_ret20
# gen_phi
	b .get_next_label_ret20
.get_next_label_ret20:
# br label %label_condition2
# gen_phi
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
	ori $t0, $t0, 400
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
	addi.d $t0, $t0, 8
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
	addi.d $t0, $t0, 8
# %op4 = alloca [4096 x i32]
	lu12i.w $t0, -1
	ori $t0, $t0, 4024
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	lu12i.w $t1, 4
	ori $t1, $t1, 0
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	sub.d $t0, $t0, $t1
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
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
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
	addi.d $t0, $t0, 4
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
	addi.d $t0, $t0, 4
# br label %label_condition21
# gen_phi
	b .KMP_label_condition21
.KMP_label_condition21:
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
# br i1 %op13, label %label_src_ltz24, label %label_src_gtz25
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 3963
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_src_ltz24
	b .KMP_label_src_gtz25
.KMP_label_loop22:
# %op14 = load i32, i32* %op7
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
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
# br i1 %op18, label %label_dst_ltz26, label %label_dst_gtz27
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 3943
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_dst_ltz26
	b .KMP_label_dst_gtz27
.KMP_label_ret23:
# ret i32 -1
# gen_phi
	addi.w $a0, $zero, -1
	b .KMP_exit
.KMP_label_src_ltz24:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_src_gtz25
# gen_phi
	b .KMP_label_src_gtz25
.KMP_label_src_gtz25:
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
	addi.w $t2, $zero, 4
	lu12i.w $t1, -5
	ori $t1, $t1, 3976
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
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
# br i1 %op22, label %label_loop22, label %label_ret23
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 3915
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_loop22
	b .KMP_label_ret23
.KMP_label_dst_ltz26:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_dst_gtz27
# gen_phi
	b .KMP_label_dst_gtz27
.KMP_label_dst_gtz27:
# %op23 = load i32*, i32** %op2
	ld.d $t0, $fp, -40
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
	addi.w $t2, $zero, 4
	lu12i.w $t1, -5
	ori $t1, $t1, 3956
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
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
# %op26 = load i32, i32* %op8
	lu12i.w $t0, -5
	ori $t0, $t0, 3984
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
# br i1 %op30, label %label_src_ltz28, label %label_src_gtz29
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 3875
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_src_ltz28
	b .KMP_label_src_gtz29
.KMP_label_src_ltz28:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_src_gtz29
# gen_phi
	b .KMP_label_src_gtz29
.KMP_label_src_gtz29:
# %op31 = load i32*, i32** %op3
	ld.d $t0, $fp, -56
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
	addi.w $t2, $zero, 4
	lu12i.w $t1, -5
	ori $t1, $t1, 3888
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
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
# %op34 = icmp eq i32 %op25, %op33
	lu12i.w $t0, -5
	ori $t0, $t0, 3892
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -5
	ori $t1, $t1, 3852
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3851
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op35 = zext i1 %op34 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3851
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3844
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op36 = icmp sgt i32 %op35, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3844
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -5
	ori $t8, $t8, 3843
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op36, label %label_true30, label %label_false31
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 3843
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_true30
	b .KMP_label_false31
.KMP_label_true30:
# %op37 = load i32, i32* %op7
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3836
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op38 = add i32 %op37, 1
	lu12i.w $t0, -5
	ori $t0, $t0, 3836
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3832
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op38, i32* %op7
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -5
	ori $t1, $t1, 3832
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op39 = load i32, i32* %op8
	lu12i.w $t0, -5
	ori $t0, $t0, 3984
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3828
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op40 = add i32 %op39, 1
	lu12i.w $t0, -5
	ori $t0, $t0, 3828
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3824
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op40, i32* %op8
	lu12i.w $t0, -5
	ori $t0, $t0, 3984
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -5
	ori $t1, $t1, 3824
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op41 = load i32, i32* %op7
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3820
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op42 = icmp slt i32 %op41, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3820
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3819
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op43 = zext i1 %op42 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3819
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3812
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op44 = add i32 %op43, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3812
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3808
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op45 = icmp ne i32 %op44, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -5
	ori $t8, $t8, 3807
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op45, label %label_dst_ltz32, label %label_dst_gtz33
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 3807
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_dst_ltz32
	b .KMP_label_dst_gtz33
.KMP_label_false31:
# %op46 = load i32, i32* %op7
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3800
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op47 = icmp slt i32 %op46, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3800
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3799
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op48 = zext i1 %op47 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3799
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3792
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op49 = add i32 %op48, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3792
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3788
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op50 = icmp ne i32 %op49, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3788
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -5
	ori $t8, $t8, 3787
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op50, label %label_next_ltz36, label %label_next_gtz37
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 3787
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_next_ltz36
	b .KMP_label_next_gtz37
.KMP_label_dst_ltz32:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_dst_gtz33
# gen_phi
	b .KMP_label_dst_gtz33
.KMP_label_dst_gtz33:
# %op51 = load i32*, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3776
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t1, $t8, 0
# %op52 = getelementptr i32, i32* %op51, i32 %op41
	lu12i.w $t0, -5
	ori $t0, $t0, 3776
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t2, $zero, 4
	lu12i.w $t1, -5
	ori $t1, $t1, 3820
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3768
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op53 = load i32, i32* %op52
	lu12i.w $t0, -5
	ori $t0, $t0, 3768
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3764
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op54 = icmp sle i32 %op53, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3764
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	xori $t2, $t2, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3763
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op55 = zext i1 %op54 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3763
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3756
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op56 = icmp sgt i32 %op55, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3756
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -5
	ori $t8, $t8, 3755
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op56, label %label_true34, label %label_ret35
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 3755
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_true34
	b .KMP_label_ret35
.KMP_label_true34:
# %op57 = load i32, i32* %op8
	lu12i.w $t0, -5
	ori $t0, $t0, 3984
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3748
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# ret i32 %op57
# gen_phi
	lu12i.w $a0, -5
	ori $a0, $a0, 3748
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.w $a0, $a0, 0
	b .KMP_exit
.KMP_label_ret35:
# br label %label_ret40
# gen_phi
	b .KMP_label_ret40
.KMP_label_next_ltz36:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_next_gtz37
# gen_phi
	b .KMP_label_next_gtz37
.KMP_label_next_gtz37:
# %op58 = getelementptr [4096 x i32], [4096 x i32]* %op4, i32 0, i32 %op46
	ld.d $t0, $fp, -72
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, -5
	ori $t1, $t1, 3800
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3736
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op59 = load i32, i32* %op58
	lu12i.w $t0, -5
	ori $t0, $t0, 3736
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3732
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# store i32 %op59, i32* %op7
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -5
	ori $t1, $t1, 3732
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op60 = load i32, i32* %op7
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3728
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op61 = icmp eq i32 %op60, -1
	lu12i.w $t0, -5
	ori $t0, $t0, 3728
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
	ori $t8, $t8, 3727
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op62 = zext i1 %op61 to i32
	lu12i.w $t0, -5
	ori $t0, $t0, 3727
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -5
	ori $t8, $t8, 3720
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op63 = icmp sgt i32 %op62, zeroinitializer
	lu12i.w $t0, -5
	ori $t0, $t0, 3720
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -5
	ori $t8, $t8, 3719
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op63, label %label_true38, label %label_ret39
# gen_phi
	lu12i.w $t0, -5
	ori $t0, $t0, 3719
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .KMP_label_true38
	b .KMP_label_ret39
.KMP_label_true38:
# %op64 = load i32, i32* %op7
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3712
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op65 = add i32 %op64, 1
	lu12i.w $t0, -5
	ori $t0, $t0, 3712
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3708
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op65, i32* %op7
	lu12i.w $t0, -5
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -5
	ori $t1, $t1, 3708
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op66 = load i32, i32* %op8
	lu12i.w $t0, -5
	ori $t0, $t0, 3984
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -5
	ori $t8, $t8, 3704
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op67 = add i32 %op66, 1
	lu12i.w $t0, -5
	ori $t0, $t0, 3704
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -5
	ori $t8, $t8, 3700
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op67, i32* %op8
	lu12i.w $t0, -5
	ori $t0, $t0, 3984
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -5
	ori $t1, $t1, 3700
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_ret39
# gen_phi
	b .KMP_label_ret39
.KMP_label_ret39:
# br label %label_ret40
# gen_phi
	b .KMP_label_ret40
.KMP_label_ret40:
# br label %label_condition21
# gen_phi
	b .KMP_label_condition21
.KMP_exit:
	lu12i.w $t0, 4
	ori $t0, $t0, 400
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
	addi.d $t0, $t0, 8
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
	addi.d $t0, $t0, 4
# br label %label_condition41
# gen_phi
	b .read_str_label_condition41
.read_str_label_condition41:
# %op3 = icmp sgt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -53
# br i1 %op3, label %label_loop42, label %label_ret43
# gen_phi
	ld.b $t0, $fp, -53
	bnez $t0, .read_str_label_loop42
	b .read_str_label_ret43
.read_str_label_loop42:
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
# br i1 %op8, label %label_buf_ltz44, label %label_buf_gtz45
# gen_phi
	ld.b $t0, $fp, -73
	bnez $t0, .read_str_label_buf_ltz44
	b .read_str_label_buf_gtz45
.read_str_label_ret43:
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
# br i1 %op13, label %label_buf_ltz50, label %label_buf_gtz51
# gen_phi
	ld.b $t0, $fp, -93
	bnez $t0, .read_str_label_buf_ltz50
	b .read_str_label_buf_gtz51
.read_str_label_buf_ltz44:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_buf_gtz45
# gen_phi
	b .read_str_label_buf_gtz45
.read_str_label_buf_gtz45:
# %op14 = load i32*, i32** %op1
	ld.d $t0, $fp, -32
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -104
# %op15 = getelementptr i32, i32* %op14, i32 %op4
	ld.d $t0, $fp, -104
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -60
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
	addi.d $t0, $t0, 4
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
# br i1 %op21, label %label_buf_ltz46, label %label_buf_gtz47
# gen_phi
	ld.b $t0, $fp, -133
	bnez $t0, .read_str_label_buf_ltz46
	b .read_str_label_buf_gtz47
.read_str_label_buf_ltz46:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_buf_gtz47
# gen_phi
	b .read_str_label_buf_gtz47
.read_str_label_buf_gtz47:
# %op22 = load i32*, i32** %op1
	ld.d $t0, $fp, -32
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -144
# %op23 = getelementptr i32, i32* %op22, i32 %op17
	ld.d $t0, $fp, -144
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -120
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -152
# %op24 = load i32, i32* %op23
	ld.d $t0, $fp, -152
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -156
# %op25 = icmp eq i32 %op24, 10
	ld.w $t0, $fp, -156
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -157
# %op26 = zext i1 %op25 to i32
	ld.b $t0, $fp, -157
	andi $t1, $t0, 1
	st.w $t1, $fp, -164
# %op27 = icmp sgt i32 %op26, zeroinitializer
	ld.w $t0, $fp, -164
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -165
# br i1 %op27, label %label_true48, label %label_ret49
# gen_phi
	ld.b $t0, $fp, -165
	bnez $t0, .read_str_label_true48
	b .read_str_label_ret49
.read_str_label_true48:
# br label %label_ret43
# gen_phi
	b .read_str_label_ret43
.read_str_label_ret49:
# %op28 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -172
# %op29 = add i32 %op28, 1
	ld.w $t0, $fp, -172
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -176
# store i32 %op29, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -176
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_condition41
# gen_phi
	b .read_str_label_condition41
.read_str_label_buf_ltz50:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_buf_gtz51
# gen_phi
	b .read_str_label_buf_gtz51
.read_str_label_buf_gtz51:
# %op30 = load i32*, i32** %op1
	ld.d $t0, $fp, -32
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -184
# %op31 = getelementptr i32, i32* %op30, i32 %op9
	ld.d $t0, $fp, -184
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -80
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -192
# store i32 0, i32* %op31
	ld.d $t0, $fp, -192
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op32 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -196
# ret i32 %op32
# gen_phi
	ld.w $a0, $fp, -196
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
	lu12i.w $t1, 4
	ori $t1, $t1, 0
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	sub.d $t0, $t0, $t1
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -24
# %op1 = alloca [4096 x i32]
	lu12i.w $t0, -5
	ori $t0, $t0, 4064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	lu12i.w $t1, 4
	ori $t1, $t1, 0
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	sub.d $t0, $t0, $t1
	add.d $t0, $fp, $t0
	lu12i.w $t8, -5
	ori $t8, $t8, 4064
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op2 = getelementptr [4096 x i32], [4096 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
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
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
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
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
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
	lu12i.w $t2, 4
	ori $t2, $t2, 0
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
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
# gen_phi
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
