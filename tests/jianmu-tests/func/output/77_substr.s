	.text
	.globl MAX
	.type MAX, @function
MAX:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.MAX_label_entry:
# %op2 = icmp eq i32 %arg0, %arg1
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -25
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -25
	andi $t1, $t0, 1
	st.w $t1, $fp, -32
# %op4 = icmp sgt i32 %op3, zeroinitializer
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -33
# br i1 %op4, label %label_true0, label %label_false1
# gen_phi
	ld.b $t0, $fp, -33
	bnez $t0, .MAX_label_true0
	b .MAX_label_false1
.MAX_label_true0:
# ret i32 %arg0
# gen_phi
	ld.w $a0, $fp, -20
	b .MAX_exit
.MAX_label_false1:
# %op5 = icmp sgt i32 %arg0, %arg1
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
	slt $t2, $t1, $t0
	st.b $t2, $fp, -34
# %op6 = zext i1 %op5 to i32
	ld.b $t0, $fp, -34
	andi $t1, $t0, 1
	st.w $t1, $fp, -40
# %op7 = icmp sgt i32 %op6, zeroinitializer
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -41
# br i1 %op7, label %label_true2, label %label_false3
# gen_phi
	ld.b $t0, $fp, -41
	bnez $t0, .MAX_label_true2
	b .MAX_label_false3
.MAX_label_true2:
# ret i32 %arg0
# gen_phi
	ld.w $a0, $fp, -20
	b .MAX_exit
.MAX_label_false3:
# ret i32 %arg1
# gen_phi
	ld.w $a0, $fp, -24
	b .MAX_exit
.MAX_exit:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl max_sum_nonadjacent
	.type max_sum_nonadjacent, @function
max_sum_nonadjacent:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -448
	st.d $a0, $fp, -24
	st.w $a1, $fp, -28
.max_sum_nonadjacent_label_entry:
# %op2 = alloca [16 x i32]
	addi.d $t0, $zero, -40
	addi.d $t0, $t0, -64
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -40
# %op3 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -105
# %op4 = zext i1 %op3 to i32
	ld.b $t0, $fp, -105
	andi $t1, $t0, 1
	st.w $t1, $fp, -112
# %op5 = add i32 %op4, zeroinitializer
	ld.w $t0, $fp, -112
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# %op6 = icmp ne i32 %op5, zeroinitializer
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -117
# br i1 %op6, label %label_temp_ltz4, label %label_temp_gtz5
# gen_phi
	ld.b $t0, $fp, -117
	bnez $t0, .max_sum_nonadjacent_label_temp_ltz4
	b .max_sum_nonadjacent_label_temp_gtz5
.max_sum_nonadjacent_label_temp_ltz4:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_temp_gtz5
# gen_phi
	b .max_sum_nonadjacent_label_temp_gtz5
.max_sum_nonadjacent_label_temp_gtz5:
# %op7 = getelementptr [16 x i32], [16 x i32]* %op2, i32 0, i32 0
	ld.d $t0, $fp, -40
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -128
# %op8 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -129
# %op9 = zext i1 %op8 to i32
	ld.b $t0, $fp, -129
	andi $t1, $t0, 1
	st.w $t1, $fp, -136
# %op10 = add i32 %op9, zeroinitializer
	ld.w $t0, $fp, -136
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -140
# %op11 = icmp ne i32 %op10, zeroinitializer
	ld.w $t0, $fp, -140
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -141
# br i1 %op11, label %label_arr_ltz6, label %label_arr_gtz7
# gen_phi
	ld.b $t0, $fp, -141
	bnez $t0, .max_sum_nonadjacent_label_arr_ltz6
	b .max_sum_nonadjacent_label_arr_gtz7
.max_sum_nonadjacent_label_arr_ltz6:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz7
# gen_phi
	b .max_sum_nonadjacent_label_arr_gtz7
.max_sum_nonadjacent_label_arr_gtz7:
# %op12 = getelementptr i32, i32* %arg0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -152
# %op13 = load i32, i32* %op12
	ld.d $t0, $fp, -152
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -156
# store i32 %op13, i32* %op7
	ld.d $t0, $fp, -128
	ld.w $t1, $fp, -156
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op14 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -157
# %op15 = zext i1 %op14 to i32
	ld.b $t0, $fp, -157
	andi $t1, $t0, 1
	st.w $t1, $fp, -164
# %op16 = add i32 %op15, zeroinitializer
	ld.w $t0, $fp, -164
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -168
# %op17 = icmp ne i32 %op16, zeroinitializer
	ld.w $t0, $fp, -168
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -169
# br i1 %op17, label %label_temp_ltz8, label %label_temp_gtz9
# gen_phi
	ld.b $t0, $fp, -169
	bnez $t0, .max_sum_nonadjacent_label_temp_ltz8
	b .max_sum_nonadjacent_label_temp_gtz9
.max_sum_nonadjacent_label_temp_ltz8:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_temp_gtz9
# gen_phi
	b .max_sum_nonadjacent_label_temp_gtz9
.max_sum_nonadjacent_label_temp_gtz9:
# %op18 = getelementptr [16 x i32], [16 x i32]* %op2, i32 0, i32 1
	ld.d $t0, $fp, -40
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -184
# %op19 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -185
# %op20 = zext i1 %op19 to i32
	ld.b $t0, $fp, -185
	andi $t1, $t0, 1
	st.w $t1, $fp, -192
# %op21 = add i32 %op20, zeroinitializer
	ld.w $t0, $fp, -192
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -196
# %op22 = icmp ne i32 %op21, zeroinitializer
	ld.w $t0, $fp, -196
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -197
# br i1 %op22, label %label_arr_ltz10, label %label_arr_gtz11
# gen_phi
	ld.b $t0, $fp, -197
	bnez $t0, .max_sum_nonadjacent_label_arr_ltz10
	b .max_sum_nonadjacent_label_arr_gtz11
.max_sum_nonadjacent_label_arr_ltz10:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz11
# gen_phi
	b .max_sum_nonadjacent_label_arr_gtz11
.max_sum_nonadjacent_label_arr_gtz11:
# %op23 = getelementptr i32, i32* %arg0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -208
# %op24 = load i32, i32* %op23
	ld.d $t0, $fp, -208
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -212
# %op25 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -213
# %op26 = zext i1 %op25 to i32
	ld.b $t0, $fp, -213
	andi $t1, $t0, 1
	st.w $t1, $fp, -220
# %op27 = add i32 %op26, zeroinitializer
	ld.w $t0, $fp, -220
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -224
# %op28 = icmp ne i32 %op27, zeroinitializer
	ld.w $t0, $fp, -224
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -225
# br i1 %op28, label %label_arr_ltz12, label %label_arr_gtz13
# gen_phi
	ld.b $t0, $fp, -225
	bnez $t0, .max_sum_nonadjacent_label_arr_ltz12
	b .max_sum_nonadjacent_label_arr_gtz13
.max_sum_nonadjacent_label_arr_ltz12:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz13
# gen_phi
	b .max_sum_nonadjacent_label_arr_gtz13
.max_sum_nonadjacent_label_arr_gtz13:
# %op29 = getelementptr i32, i32* %arg0, i32 1
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -240
# %op30 = load i32, i32* %op29
	ld.d $t0, $fp, -240
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -244
# %op31 = call i32 @MAX(i32 %op24, i32 %op30)
	ld.w $a0, $fp, -212
	ld.w $a1, $fp, -244
	bl MAX
	st.w $a0, $fp, -248
# store i32 %op31, i32* %op18
	ld.d $t0, $fp, -184
	ld.w $t1, $fp, -248
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_condition14
# gen_phi
	addi.w $t0, $zero, 2
	st.w $t0, $fp, -252
	b .max_sum_nonadjacent_label_condition14
.max_sum_nonadjacent_label_condition14:
# %op32 = phi i32 [ 2, %label_arr_gtz13 ], [ %op68, %label_temp_gtz24 ]
# %op33 = icmp slt i32 %op32, %arg1
	ld.w $t0, $fp, -252
	ld.w $t1, $fp, -28
	slt $t2, $t0, $t1
	st.b $t2, $fp, -253
# %op34 = zext i1 %op33 to i32
	ld.b $t0, $fp, -253
	andi $t1, $t0, 1
	st.w $t1, $fp, -260
# %op35 = icmp sgt i32 %op34, zeroinitializer
	ld.w $t0, $fp, -260
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -261
# br i1 %op35, label %label_loop15, label %label_ret16
# gen_phi
	ld.b $t0, $fp, -261
	bnez $t0, .max_sum_nonadjacent_label_loop15
	b .max_sum_nonadjacent_label_ret16
.max_sum_nonadjacent_label_loop15:
# %op36 = icmp slt i32 %op32, zeroinitializer
	ld.w $t0, $fp, -252
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -262
# %op37 = zext i1 %op36 to i32
	ld.b $t0, $fp, -262
	andi $t1, $t0, 1
	st.w $t1, $fp, -268
# %op38 = add i32 %op37, zeroinitializer
	ld.w $t0, $fp, -268
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -272
# %op39 = icmp ne i32 %op38, zeroinitializer
	ld.w $t0, $fp, -272
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -273
# br i1 %op39, label %label_temp_ltz17, label %label_temp_gtz18
# gen_phi
	ld.b $t0, $fp, -273
	bnez $t0, .max_sum_nonadjacent_label_temp_ltz17
	b .max_sum_nonadjacent_label_temp_gtz18
.max_sum_nonadjacent_label_ret16:
# %op40 = sub i32 %arg1, 1
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -280
# %op41 = icmp slt i32 %op40, zeroinitializer
	ld.w $t0, $fp, -280
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -281
# %op42 = zext i1 %op41 to i32
	ld.b $t0, $fp, -281
	andi $t1, $t0, 1
	st.w $t1, $fp, -288
# %op43 = add i32 %op42, zeroinitializer
	ld.w $t0, $fp, -288
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -292
# %op44 = icmp ne i32 %op43, zeroinitializer
	ld.w $t0, $fp, -292
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -293
# br i1 %op44, label %label_temp_ltz25, label %label_temp_gtz26
# gen_phi
	ld.b $t0, $fp, -293
	bnez $t0, .max_sum_nonadjacent_label_temp_ltz25
	b .max_sum_nonadjacent_label_temp_gtz26
.max_sum_nonadjacent_label_temp_ltz17:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_temp_gtz18
# gen_phi
	b .max_sum_nonadjacent_label_temp_gtz18
.max_sum_nonadjacent_label_temp_gtz18:
# %op45 = getelementptr [16 x i32], [16 x i32]* %op2, i32 0, i32 %op32
	ld.d $t0, $fp, -40
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -252
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -304
# %op46 = sub i32 %op32, 2
	ld.w $t0, $fp, -252
	addi.w $t1, $zero, 2
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -308
# %op47 = icmp slt i32 %op46, zeroinitializer
	ld.w $t0, $fp, -308
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -309
# %op48 = zext i1 %op47 to i32
	ld.b $t0, $fp, -309
	andi $t1, $t0, 1
	st.w $t1, $fp, -316
# %op49 = add i32 %op48, zeroinitializer
	ld.w $t0, $fp, -316
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -320
# %op50 = icmp ne i32 %op49, zeroinitializer
	ld.w $t0, $fp, -320
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -321
# br i1 %op50, label %label_temp_ltz19, label %label_temp_gtz20
# gen_phi
	ld.b $t0, $fp, -321
	bnez $t0, .max_sum_nonadjacent_label_temp_ltz19
	b .max_sum_nonadjacent_label_temp_gtz20
.max_sum_nonadjacent_label_temp_ltz19:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_temp_gtz20
# gen_phi
	b .max_sum_nonadjacent_label_temp_gtz20
.max_sum_nonadjacent_label_temp_gtz20:
# %op51 = getelementptr [16 x i32], [16 x i32]* %op2, i32 0, i32 %op46
	ld.d $t0, $fp, -40
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -308
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -336
# %op52 = load i32, i32* %op51
	ld.d $t0, $fp, -336
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -340
# %op53 = icmp slt i32 %op32, zeroinitializer
	ld.w $t0, $fp, -252
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -341
# %op54 = zext i1 %op53 to i32
	ld.b $t0, $fp, -341
	andi $t1, $t0, 1
	st.w $t1, $fp, -348
# %op55 = add i32 %op54, zeroinitializer
	ld.w $t0, $fp, -348
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -352
# %op56 = icmp ne i32 %op55, zeroinitializer
	ld.w $t0, $fp, -352
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -353
# br i1 %op56, label %label_arr_ltz21, label %label_arr_gtz22
# gen_phi
	ld.b $t0, $fp, -353
	bnez $t0, .max_sum_nonadjacent_label_arr_ltz21
	b .max_sum_nonadjacent_label_arr_gtz22
.max_sum_nonadjacent_label_arr_ltz21:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz22
# gen_phi
	b .max_sum_nonadjacent_label_arr_gtz22
.max_sum_nonadjacent_label_arr_gtz22:
# %op57 = getelementptr i32, i32* %arg0, i32 %op32
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -252
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -368
# %op58 = load i32, i32* %op57
	ld.d $t0, $fp, -368
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -372
# %op59 = add i32 %op52, %op58
	ld.w $t0, $fp, -340
	ld.w $t1, $fp, -372
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -376
# %op60 = sub i32 %op32, 1
	ld.w $t0, $fp, -252
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -380
# %op61 = icmp slt i32 %op60, zeroinitializer
	ld.w $t0, $fp, -380
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -381
# %op62 = zext i1 %op61 to i32
	ld.b $t0, $fp, -381
	andi $t1, $t0, 1
	st.w $t1, $fp, -388
# %op63 = add i32 %op62, zeroinitializer
	ld.w $t0, $fp, -388
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -392
# %op64 = icmp ne i32 %op63, zeroinitializer
	ld.w $t0, $fp, -392
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -393
# br i1 %op64, label %label_temp_ltz23, label %label_temp_gtz24
# gen_phi
	ld.b $t0, $fp, -393
	bnez $t0, .max_sum_nonadjacent_label_temp_ltz23
	b .max_sum_nonadjacent_label_temp_gtz24
.max_sum_nonadjacent_label_temp_ltz23:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_temp_gtz24
# gen_phi
	b .max_sum_nonadjacent_label_temp_gtz24
.max_sum_nonadjacent_label_temp_gtz24:
# %op65 = getelementptr [16 x i32], [16 x i32]* %op2, i32 0, i32 %op60
	ld.d $t0, $fp, -40
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -380
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -408
# %op66 = load i32, i32* %op65
	ld.d $t0, $fp, -408
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -412
# %op67 = call i32 @MAX(i32 %op59, i32 %op66)
	ld.w $a0, $fp, -376
	ld.w $a1, $fp, -412
	bl MAX
	st.w $a0, $fp, -416
# store i32 %op67, i32* %op45
	ld.d $t0, $fp, -304
	ld.w $t1, $fp, -416
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op68 = add i32 %op32, 1
	ld.w $t0, $fp, -252
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -420
# br label %label_condition14
# gen_phi
	ld.w $t0, $fp, -420
	st.w $t0, $fp, -252
	b .max_sum_nonadjacent_label_condition14
.max_sum_nonadjacent_label_temp_ltz25:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_temp_gtz26
# gen_phi
	b .max_sum_nonadjacent_label_temp_gtz26
.max_sum_nonadjacent_label_temp_gtz26:
# %op69 = getelementptr [16 x i32], [16 x i32]* %op2, i32 0, i32 %op40
	ld.d $t0, $fp, -40
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -280
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -432
# %op70 = load i32, i32* %op69
	ld.d $t0, $fp, -432
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -436
# ret i32 %op70
# gen_phi
	ld.w $a0, $fp, -436
	b .max_sum_nonadjacent_exit
.max_sum_nonadjacent_exit:
	addi.d $sp, $sp, 448
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl longest_common_subseq
	.type longest_common_subseq, @function
longest_common_subseq:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -1456
	st.d $a0, $fp, -24
	st.w $a1, $fp, -28
	st.d $a2, $fp, -40
	st.w $a3, $fp, -44
.longest_common_subseq_label_entry:
# %op4 = alloca [16 x [16 x i32]]
	addi.d $t0, $zero, -56
	addi.d $t0, $t0, -1024
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -56
# br label %label_condition27
# gen_phi
	addi.w $t0, $zero, 1
	st.w $t0, $fp, -1084
	b .longest_common_subseq_label_condition27
.longest_common_subseq_label_condition27:
# %op5 = phi i32 [ 1, %label_entry ], [ %op25, %label_ret32 ]
# %op6 = icmp sle i32 %op5, %arg1
	ld.w $t0, $fp, -1084
	ld.w $t1, $fp, -28
	slt $t2, $t1, $t0
	xori $t2, $t2, 1
	st.b $t2, $fp, -1085
# %op7 = zext i1 %op6 to i32
	ld.b $t0, $fp, -1085
	andi $t1, $t0, 1
	st.w $t1, $fp, -1092
# %op8 = icmp sgt i32 %op7, zeroinitializer
	ld.w $t0, $fp, -1092
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -1093
# br i1 %op8, label %label_loop28, label %label_ret29
# gen_phi
	ld.b $t0, $fp, -1093
	bnez $t0, .longest_common_subseq_label_loop28
	b .longest_common_subseq_label_ret29
.longest_common_subseq_label_loop28:
# br label %label_condition30
# gen_phi
	addi.w $t0, $zero, 1
	st.w $t0, $fp, -1124
	b .longest_common_subseq_label_condition30
.longest_common_subseq_label_ret29:
# %op9 = icmp slt i32 %arg1, zeroinitializer
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1094
# %op10 = zext i1 %op9 to i32
	ld.b $t0, $fp, -1094
	andi $t1, $t0, 1
	st.w $t1, $fp, -1100
# %op11 = add i32 %op10, zeroinitializer
	ld.w $t0, $fp, -1100
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1104
# %op12 = icmp slt i32 %arg3, zeroinitializer
	ld.w $t0, $fp, -44
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1105
# %op13 = zext i1 %op12 to i32
	ld.b $t0, $fp, -1105
	andi $t1, $t0, 1
	st.w $t1, $fp, -1112
# %op14 = add i32 %op13, %op11
	ld.w $t0, $fp, -1112
	ld.w $t1, $fp, -1104
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1116
# %op15 = icmp ne i32 %op14, zeroinitializer
	ld.w $t0, $fp, -1116
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1117
# br i1 %op15, label %label_p_ltz50, label %label_p_gtz51
# gen_phi
	ld.b $t0, $fp, -1117
	bnez $t0, .longest_common_subseq_label_p_ltz50
	b .longest_common_subseq_label_p_gtz51
.longest_common_subseq_label_condition30:
# %op16 = phi i32 [ 1, %label_loop28 ], [ %op87, %label_ret49 ]
# %op17 = icmp sle i32 %op16, %arg3
	ld.w $t0, $fp, -1124
	ld.w $t1, $fp, -44
	slt $t2, $t1, $t0
	xori $t2, $t2, 1
	st.b $t2, $fp, -1125
# %op18 = zext i1 %op17 to i32
	ld.b $t0, $fp, -1125
	andi $t1, $t0, 1
	st.w $t1, $fp, -1132
# %op19 = icmp sgt i32 %op18, zeroinitializer
	ld.w $t0, $fp, -1132
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -1133
# br i1 %op19, label %label_loop31, label %label_ret32
# gen_phi
	ld.b $t0, $fp, -1133
	bnez $t0, .longest_common_subseq_label_loop31
	b .longest_common_subseq_label_ret32
.longest_common_subseq_label_loop31:
# %op20 = sub i32 %op5, 1
	ld.w $t0, $fp, -1084
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -1140
# %op21 = icmp slt i32 %op20, zeroinitializer
	ld.w $t0, $fp, -1140
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1141
# %op22 = zext i1 %op21 to i32
	ld.b $t0, $fp, -1141
	andi $t1, $t0, 1
	st.w $t1, $fp, -1148
# %op23 = add i32 %op22, zeroinitializer
	ld.w $t0, $fp, -1148
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1152
# %op24 = icmp ne i32 %op23, zeroinitializer
	ld.w $t0, $fp, -1152
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1153
# br i1 %op24, label %label_arr1_ltz33, label %label_arr1_gtz34
# gen_phi
	ld.b $t0, $fp, -1153
	bnez $t0, .longest_common_subseq_label_arr1_ltz33
	b .longest_common_subseq_label_arr1_gtz34
.longest_common_subseq_label_ret32:
# %op25 = add i32 %op5, 1
	ld.w $t0, $fp, -1084
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1160
# br label %label_condition27
# gen_phi
	ld.w $t0, $fp, -1160
	st.w $t0, $fp, -1084
	b .longest_common_subseq_label_condition27
.longest_common_subseq_label_arr1_ltz33:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr1_gtz34
# gen_phi
	b .longest_common_subseq_label_arr1_gtz34
.longest_common_subseq_label_arr1_gtz34:
# %op26 = getelementptr i32, i32* %arg0, i32 %op20
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -1140
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1168
# %op27 = load i32, i32* %op26
	ld.d $t0, $fp, -1168
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1172
# %op28 = sub i32 %op16, 1
	ld.w $t0, $fp, -1124
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -1176
# %op29 = icmp slt i32 %op28, zeroinitializer
	ld.w $t0, $fp, -1176
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1177
# %op30 = zext i1 %op29 to i32
	ld.b $t0, $fp, -1177
	andi $t1, $t0, 1
	st.w $t1, $fp, -1184
# %op31 = add i32 %op30, zeroinitializer
	ld.w $t0, $fp, -1184
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1188
# %op32 = icmp ne i32 %op31, zeroinitializer
	ld.w $t0, $fp, -1188
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1189
# br i1 %op32, label %label_arr2_ltz35, label %label_arr2_gtz36
# gen_phi
	ld.b $t0, $fp, -1189
	bnez $t0, .longest_common_subseq_label_arr2_ltz35
	b .longest_common_subseq_label_arr2_gtz36
.longest_common_subseq_label_arr2_ltz35:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr2_gtz36
# gen_phi
	b .longest_common_subseq_label_arr2_gtz36
.longest_common_subseq_label_arr2_gtz36:
# %op33 = getelementptr i32, i32* %arg2, i32 %op28
	ld.d $t0, $fp, -40
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -1176
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1200
# %op34 = load i32, i32* %op33
	ld.d $t0, $fp, -1200
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1204
# %op35 = icmp eq i32 %op27, %op34
	ld.w $t0, $fp, -1172
	ld.w $t1, $fp, -1204
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -1205
# %op36 = zext i1 %op35 to i32
	ld.b $t0, $fp, -1205
	andi $t1, $t0, 1
	st.w $t1, $fp, -1212
# %op37 = icmp sgt i32 %op36, zeroinitializer
	ld.w $t0, $fp, -1212
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -1213
# br i1 %op37, label %label_true37, label %label_false38
# gen_phi
	ld.b $t0, $fp, -1213
	bnez $t0, .longest_common_subseq_label_true37
	b .longest_common_subseq_label_false38
.longest_common_subseq_label_true37:
# %op38 = icmp slt i32 %op5, zeroinitializer
	ld.w $t0, $fp, -1084
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1214
# %op39 = zext i1 %op38 to i32
	ld.b $t0, $fp, -1214
	andi $t1, $t0, 1
	st.w $t1, $fp, -1220
# %op40 = add i32 %op39, zeroinitializer
	ld.w $t0, $fp, -1220
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1224
# %op41 = icmp slt i32 %op16, zeroinitializer
	ld.w $t0, $fp, -1124
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1225
# %op42 = zext i1 %op41 to i32
	ld.b $t0, $fp, -1225
	andi $t1, $t0, 1
	st.w $t1, $fp, -1232
# %op43 = add i32 %op42, %op40
	ld.w $t0, $fp, -1232
	ld.w $t1, $fp, -1224
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1236
# %op44 = icmp ne i32 %op43, zeroinitializer
	ld.w $t0, $fp, -1236
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1237
# br i1 %op44, label %label_p_ltz39, label %label_p_gtz40
# gen_phi
	ld.b $t0, $fp, -1237
	bnez $t0, .longest_common_subseq_label_p_ltz39
	b .longest_common_subseq_label_p_gtz40
.longest_common_subseq_label_false38:
# %op45 = icmp slt i32 %op5, zeroinitializer
	ld.w $t0, $fp, -1084
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1238
# %op46 = zext i1 %op45 to i32
	ld.b $t0, $fp, -1238
	andi $t1, $t0, 1
	st.w $t1, $fp, -1244
# %op47 = add i32 %op46, zeroinitializer
	ld.w $t0, $fp, -1244
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1248
# %op48 = icmp slt i32 %op16, zeroinitializer
	ld.w $t0, $fp, -1124
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1249
# %op49 = zext i1 %op48 to i32
	ld.b $t0, $fp, -1249
	andi $t1, $t0, 1
	st.w $t1, $fp, -1256
# %op50 = add i32 %op49, %op47
	ld.w $t0, $fp, -1256
	ld.w $t1, $fp, -1248
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1260
# %op51 = icmp ne i32 %op50, zeroinitializer
	ld.w $t0, $fp, -1260
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1261
# br i1 %op51, label %label_p_ltz43, label %label_p_gtz44
# gen_phi
	ld.b $t0, $fp, -1261
	bnez $t0, .longest_common_subseq_label_p_ltz43
	b .longest_common_subseq_label_p_gtz44
.longest_common_subseq_label_p_ltz39:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_p_gtz40
# gen_phi
	b .longest_common_subseq_label_p_gtz40
.longest_common_subseq_label_p_gtz40:
# %op52 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op4, i32 0, i32 %op5, i32 %op16
	ld.d $t0, $fp, -56
	addi.w $t2, $zero, 1024
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 64
	ld.w $t1, $fp, -1084
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -1124
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1272
# %op53 = sub i32 %op16, 1
	ld.w $t0, $fp, -1124
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -1276
# %op54 = sub i32 %op5, 1
	ld.w $t0, $fp, -1084
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -1280
# %op55 = icmp slt i32 %op54, zeroinitializer
	ld.w $t0, $fp, -1280
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1281
# %op56 = zext i1 %op55 to i32
	ld.b $t0, $fp, -1281
	andi $t1, $t0, 1
	st.w $t1, $fp, -1288
# %op57 = add i32 %op56, zeroinitializer
	ld.w $t0, $fp, -1288
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1292
# %op58 = icmp slt i32 %op53, zeroinitializer
	ld.w $t0, $fp, -1276
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1293
# %op59 = zext i1 %op58 to i32
	ld.b $t0, $fp, -1293
	andi $t1, $t0, 1
	st.w $t1, $fp, -1300
# %op60 = add i32 %op59, %op57
	ld.w $t0, $fp, -1300
	ld.w $t1, $fp, -1292
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1304
# %op61 = icmp ne i32 %op60, zeroinitializer
	ld.w $t0, $fp, -1304
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1305
# br i1 %op61, label %label_p_ltz41, label %label_p_gtz42
# gen_phi
	ld.b $t0, $fp, -1305
	bnez $t0, .longest_common_subseq_label_p_ltz41
	b .longest_common_subseq_label_p_gtz42
.longest_common_subseq_label_p_ltz41:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_p_gtz42
# gen_phi
	b .longest_common_subseq_label_p_gtz42
.longest_common_subseq_label_p_gtz42:
# %op62 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op4, i32 0, i32 %op54, i32 %op53
	ld.d $t0, $fp, -56
	addi.w $t2, $zero, 1024
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 64
	ld.w $t1, $fp, -1280
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -1276
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1320
# %op63 = load i32, i32* %op62
	ld.d $t0, $fp, -1320
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1324
# %op64 = add i32 %op63, 1
	ld.w $t0, $fp, -1324
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1328
# store i32 %op64, i32* %op52
	ld.d $t0, $fp, -1272
	ld.w $t1, $fp, -1328
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_ret49
# gen_phi
	b .longest_common_subseq_label_ret49
.longest_common_subseq_label_p_ltz43:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_p_gtz44
# gen_phi
	b .longest_common_subseq_label_p_gtz44
.longest_common_subseq_label_p_gtz44:
# %op65 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op4, i32 0, i32 %op5, i32 %op16
	ld.d $t0, $fp, -56
	addi.w $t2, $zero, 1024
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 64
	ld.w $t1, $fp, -1084
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -1124
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1336
# %op66 = sub i32 %op5, 1
	ld.w $t0, $fp, -1084
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -1340
# %op67 = icmp slt i32 %op66, zeroinitializer
	ld.w $t0, $fp, -1340
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1341
# %op68 = zext i1 %op67 to i32
	ld.b $t0, $fp, -1341
	andi $t1, $t0, 1
	st.w $t1, $fp, -1348
# %op69 = add i32 %op68, zeroinitializer
	ld.w $t0, $fp, -1348
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1352
# %op70 = icmp slt i32 %op16, zeroinitializer
	ld.w $t0, $fp, -1124
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1353
# %op71 = zext i1 %op70 to i32
	ld.b $t0, $fp, -1353
	andi $t1, $t0, 1
	st.w $t1, $fp, -1360
# %op72 = add i32 %op71, %op69
	ld.w $t0, $fp, -1360
	ld.w $t1, $fp, -1352
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1364
# %op73 = icmp ne i32 %op72, zeroinitializer
	ld.w $t0, $fp, -1364
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1365
# br i1 %op73, label %label_p_ltz45, label %label_p_gtz46
# gen_phi
	ld.b $t0, $fp, -1365
	bnez $t0, .longest_common_subseq_label_p_ltz45
	b .longest_common_subseq_label_p_gtz46
.longest_common_subseq_label_p_ltz45:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_p_gtz46
# gen_phi
	b .longest_common_subseq_label_p_gtz46
.longest_common_subseq_label_p_gtz46:
# %op74 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op4, i32 0, i32 %op66, i32 %op16
	ld.d $t0, $fp, -56
	addi.w $t2, $zero, 1024
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 64
	ld.w $t1, $fp, -1340
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -1124
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1376
# %op75 = load i32, i32* %op74
	ld.d $t0, $fp, -1376
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1380
# %op76 = sub i32 %op16, 1
	ld.w $t0, $fp, -1124
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -1384
# %op77 = icmp slt i32 %op5, zeroinitializer
	ld.w $t0, $fp, -1084
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1385
# %op78 = zext i1 %op77 to i32
	ld.b $t0, $fp, -1385
	andi $t1, $t0, 1
	st.w $t1, $fp, -1392
# %op79 = add i32 %op78, zeroinitializer
	ld.w $t0, $fp, -1392
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1396
# %op80 = icmp slt i32 %op76, zeroinitializer
	ld.w $t0, $fp, -1384
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1397
# %op81 = zext i1 %op80 to i32
	ld.b $t0, $fp, -1397
	andi $t1, $t0, 1
	st.w $t1, $fp, -1404
# %op82 = add i32 %op81, %op79
	ld.w $t0, $fp, -1404
	ld.w $t1, $fp, -1396
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1408
# %op83 = icmp ne i32 %op82, zeroinitializer
	ld.w $t0, $fp, -1408
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1409
# br i1 %op83, label %label_p_ltz47, label %label_p_gtz48
# gen_phi
	ld.b $t0, $fp, -1409
	bnez $t0, .longest_common_subseq_label_p_ltz47
	b .longest_common_subseq_label_p_gtz48
.longest_common_subseq_label_p_ltz47:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_p_gtz48
# gen_phi
	b .longest_common_subseq_label_p_gtz48
.longest_common_subseq_label_p_gtz48:
# %op84 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op4, i32 0, i32 %op5, i32 %op76
	ld.d $t0, $fp, -56
	addi.w $t2, $zero, 1024
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 64
	ld.w $t1, $fp, -1084
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -1384
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1424
# %op85 = load i32, i32* %op84
	ld.d $t0, $fp, -1424
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1428
# %op86 = call i32 @MAX(i32 %op75, i32 %op85)
	ld.w $a0, $fp, -1380
	ld.w $a1, $fp, -1428
	bl MAX
	st.w $a0, $fp, -1432
# store i32 %op86, i32* %op65
	ld.d $t0, $fp, -1336
	ld.w $t1, $fp, -1432
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_ret49
# gen_phi
	b .longest_common_subseq_label_ret49
.longest_common_subseq_label_ret49:
# %op87 = add i32 %op16, 1
	ld.w $t0, $fp, -1124
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1436
# br label %label_condition30
# gen_phi
	ld.w $t0, $fp, -1436
	st.w $t0, $fp, -1124
	b .longest_common_subseq_label_condition30
.longest_common_subseq_label_p_ltz50:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_p_gtz51
# gen_phi
	b .longest_common_subseq_label_p_gtz51
.longest_common_subseq_label_p_gtz51:
# %op88 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op4, i32 0, i32 %arg1, i32 %arg3
	ld.d $t0, $fp, -56
	addi.w $t2, $zero, 1024
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 64
	ld.w $t1, $fp, -28
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -44
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1448
# %op89 = load i32, i32* %op88
	ld.d $t0, $fp, -1448
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1452
# ret i32 %op89
# gen_phi
	ld.w $a0, $fp, -1452
	b .longest_common_subseq_exit
.longest_common_subseq_exit:
	addi.d $sp, $sp, 1456
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
# %op0 = alloca [15 x i32]
	addi.d $t0, $zero, -24
	addi.d $t0, $t0, -60
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -24
# %op1 = alloca [13 x i32]
	addi.d $t0, $zero, -96
	addi.d $t0, $t0, -52
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -96
# %op2 = getelementptr [15 x i32], [15 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 60
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -160
# %op3 = call i32 @max_sum_nonadjacent(i32* %op2, i32 15)
	ld.d $a0, $fp, -160
	addi.w $a1, $zero, 15
	bl max_sum_nonadjacent
	st.w $a0, $fp, -164
# call void @putint(i32 %op3)
	ld.w $a0, $fp, -164
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# %op4 = getelementptr [15 x i32], [15 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 60
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -176
# %op5 = getelementptr [13 x i32], [13 x i32]* %op1, i32 0, i32 0
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 52
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -184
# %op6 = call i32 @longest_common_subseq(i32* %op4, i32 15, i32* %op5, i32 13)
	ld.d $a0, $fp, -176
	addi.w $a1, $zero, 15
	ld.d $a2, $fp, -184
	addi.w $a3, $zero, 13
	bl longest_common_subseq
	st.w $a0, $fp, -188
# call void @putint(i32 %op6)
	ld.w $a0, $fp, -188
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# ret i32 0
# gen_phi
	addi.w $a0, $zero, 0
	b .main_exit
.main_exit:
	addi.d $sp, $sp, 192
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
