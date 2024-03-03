	.text
	.globl MAX
	.type MAX, @function
MAX:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -96
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.MAX_label_entry:
# %op2 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -32
# store i32 %arg0, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op3 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4048
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -48
# store i32 %arg1, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op4 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -56
# %op5 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -60
# %op6 = icmp eq i32 %op4, %op5
	ld.w $t0, $fp, -56
	ld.w $t1, $fp, -60
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -61
# %op7 = zext i1 %op6 to i32
	ld.b $t0, $fp, -61
	andi $t1, $t0, 1
	st.w $t1, $fp, -68
# %op8 = icmp sgt i32 %op7, zeroinitializer
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -69
# br i1 %op8, label %label_true0, label %label_false1
# gen_phi
	ld.b $t0, $fp, -69
	bnez $t0, .MAX_label_true0
	b .MAX_label_false1
.MAX_label_true0:
# %op9 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -76
# ret i32 %op9
# gen_phi
	ld.w $a0, $fp, -76
	b .MAX_exit
.MAX_label_false1:
# %op10 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -80
# %op11 = icmp sgt i32 %op10, zeroinitializer
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -81
# br i1 %op11, label %label_true2, label %label_false3
# gen_phi
	ld.b $t0, $fp, -81
	bnez $t0, .MAX_label_true2
	b .MAX_label_false3
.MAX_label_true2:
# %op12 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -88
# ret i32 %op12
# gen_phi
	ld.w $a0, $fp, -88
	b .MAX_exit
.MAX_label_false3:
# %op13 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -92
# ret i32 %op13
# gen_phi
	ld.w $a0, $fp, -92
	b .MAX_exit
.MAX_exit:
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl max_sum_nonadjacent
	.type max_sum_nonadjacent, @function
max_sum_nonadjacent:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -528
	st.d $a0, $fp, -24
	st.w $a1, $fp, -28
.max_sum_nonadjacent_label_entry:
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
# %op3 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4040
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -56
# store i32 %arg1, i32* %op3
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -28
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op4 = alloca [16 x i32]
	lu12i.w $t0, -1
	ori $t0, $t0, 4024
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -64
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -72
# store [16 x i32] [i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer], [16 x i32]* %op4
	ld.d $t0, $fp, -72
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
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op5 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -137
# %op6 = zext i1 %op5 to i32
	ld.b $t0, $fp, -137
	andi $t1, $t0, 1
	st.w $t1, $fp, -144
# %op7 = add i32 %op6, zeroinitializer
	ld.w $t0, $fp, -144
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -148
# %op8 = icmp ne i32 %op7, zeroinitializer
	ld.w $t0, $fp, -148
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -149
# br i1 %op8, label %label_temp_ltz4, label %label_temp_gtz5
# gen_phi
	ld.b $t0, $fp, -149
	bnez $t0, .max_sum_nonadjacent_label_temp_ltz4
	b .max_sum_nonadjacent_label_temp_gtz5
.max_sum_nonadjacent_label_temp_ltz4:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_temp_gtz5
# gen_phi
	b .max_sum_nonadjacent_label_temp_gtz5
.max_sum_nonadjacent_label_temp_gtz5:
# %op9 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 0
	ld.d $t0, $fp, -72
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -160
# %op10 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -161
# %op11 = zext i1 %op10 to i32
	ld.b $t0, $fp, -161
	andi $t1, $t0, 1
	st.w $t1, $fp, -168
# %op12 = add i32 %op11, zeroinitializer
	ld.w $t0, $fp, -168
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -172
# %op13 = icmp ne i32 %op12, zeroinitializer
	ld.w $t0, $fp, -172
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -173
# br i1 %op13, label %label_arr_ltz6, label %label_arr_gtz7
# gen_phi
	ld.b $t0, $fp, -173
	bnez $t0, .max_sum_nonadjacent_label_arr_ltz6
	b .max_sum_nonadjacent_label_arr_gtz7
.max_sum_nonadjacent_label_arr_ltz6:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz7
# gen_phi
	b .max_sum_nonadjacent_label_arr_gtz7
.max_sum_nonadjacent_label_arr_gtz7:
# %op14 = load i32*, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -184
# %op15 = getelementptr i32, i32* %op14, i32 0
	ld.d $t0, $fp, -184
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -192
# %op16 = load i32, i32* %op15
	ld.d $t0, $fp, -192
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -196
# store i32 %op16, i32* %op9
	ld.d $t0, $fp, -160
	ld.w $t1, $fp, -196
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op17 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -197
# %op18 = zext i1 %op17 to i32
	ld.b $t0, $fp, -197
	andi $t1, $t0, 1
	st.w $t1, $fp, -204
# %op19 = add i32 %op18, zeroinitializer
	ld.w $t0, $fp, -204
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -208
# %op20 = icmp ne i32 %op19, zeroinitializer
	ld.w $t0, $fp, -208
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -209
# br i1 %op20, label %label_temp_ltz8, label %label_temp_gtz9
# gen_phi
	ld.b $t0, $fp, -209
	bnez $t0, .max_sum_nonadjacent_label_temp_ltz8
	b .max_sum_nonadjacent_label_temp_gtz9
.max_sum_nonadjacent_label_temp_ltz8:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_temp_gtz9
# gen_phi
	b .max_sum_nonadjacent_label_temp_gtz9
.max_sum_nonadjacent_label_temp_gtz9:
# %op21 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 1
	ld.d $t0, $fp, -72
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -224
# %op22 = icmp slt i32 0, zeroinitializer
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -225
# %op23 = zext i1 %op22 to i32
	ld.b $t0, $fp, -225
	andi $t1, $t0, 1
	st.w $t1, $fp, -232
# %op24 = add i32 %op23, zeroinitializer
	ld.w $t0, $fp, -232
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -236
# %op25 = icmp ne i32 %op24, zeroinitializer
	ld.w $t0, $fp, -236
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -237
# br i1 %op25, label %label_arr_ltz10, label %label_arr_gtz11
# gen_phi
	ld.b $t0, $fp, -237
	bnez $t0, .max_sum_nonadjacent_label_arr_ltz10
	b .max_sum_nonadjacent_label_arr_gtz11
.max_sum_nonadjacent_label_arr_ltz10:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz11
# gen_phi
	b .max_sum_nonadjacent_label_arr_gtz11
.max_sum_nonadjacent_label_arr_gtz11:
# %op26 = load i32*, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -248
# %op27 = getelementptr i32, i32* %op26, i32 0
	ld.d $t0, $fp, -248
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -256
# %op28 = load i32, i32* %op27
	ld.d $t0, $fp, -256
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -260
# %op29 = icmp slt i32 1, zeroinitializer
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -261
# %op30 = zext i1 %op29 to i32
	ld.b $t0, $fp, -261
	andi $t1, $t0, 1
	st.w $t1, $fp, -268
# %op31 = add i32 %op30, zeroinitializer
	ld.w $t0, $fp, -268
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -272
# %op32 = icmp ne i32 %op31, zeroinitializer
	ld.w $t0, $fp, -272
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -273
# br i1 %op32, label %label_arr_ltz12, label %label_arr_gtz13
# gen_phi
	ld.b $t0, $fp, -273
	bnez $t0, .max_sum_nonadjacent_label_arr_ltz12
	b .max_sum_nonadjacent_label_arr_gtz13
.max_sum_nonadjacent_label_arr_ltz12:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz13
# gen_phi
	b .max_sum_nonadjacent_label_arr_gtz13
.max_sum_nonadjacent_label_arr_gtz13:
# %op33 = load i32*, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -288
# %op34 = getelementptr i32, i32* %op33, i32 1
	ld.d $t0, $fp, -288
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 1
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -296
# %op35 = load i32, i32* %op34
	ld.d $t0, $fp, -296
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -300
# %op36 = call i32 @MAX(i32 %op28, i32 %op35)
	ld.w $a0, $fp, -260
	ld.w $a1, $fp, -300
	bl MAX
	st.w $a0, $fp, -304
# store i32 %op36, i32* %op21
	ld.d $t0, $fp, -224
	ld.w $t1, $fp, -304
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op37 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3784
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -312
# store i32 2, i32* %op37
	ld.d $t0, $fp, -312
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_condition14
# gen_phi
	b .max_sum_nonadjacent_label_condition14
.max_sum_nonadjacent_label_condition14:
# %op38 = load i32, i32* %op3
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -320
# %op39 = icmp sgt i32 %op38, zeroinitializer
	ld.w $t0, $fp, -320
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -321
# br i1 %op39, label %label_loop15, label %label_ret16
# gen_phi
	ld.b $t0, $fp, -321
	bnez $t0, .max_sum_nonadjacent_label_loop15
	b .max_sum_nonadjacent_label_ret16
.max_sum_nonadjacent_label_loop15:
# %op40 = load i32, i32* %op37
	ld.d $t0, $fp, -312
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -328
# %op41 = icmp slt i32 %op40, zeroinitializer
	ld.w $t0, $fp, -328
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -329
# %op42 = zext i1 %op41 to i32
	ld.b $t0, $fp, -329
	andi $t1, $t0, 1
	st.w $t1, $fp, -336
# %op43 = add i32 %op42, zeroinitializer
	ld.w $t0, $fp, -336
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -340
# %op44 = icmp ne i32 %op43, zeroinitializer
	ld.w $t0, $fp, -340
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -341
# br i1 %op44, label %label_temp_ltz17, label %label_temp_gtz18
# gen_phi
	ld.b $t0, $fp, -341
	bnez $t0, .max_sum_nonadjacent_label_temp_ltz17
	b .max_sum_nonadjacent_label_temp_gtz18
.max_sum_nonadjacent_label_ret16:
# %op45 = load i32, i32* %op3
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -348
# %op46 = sub i32 %op45, 1
	ld.w $t0, $fp, -348
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -352
# %op47 = icmp slt i32 %op46, zeroinitializer
	ld.w $t0, $fp, -352
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -353
# %op48 = zext i1 %op47 to i32
	ld.b $t0, $fp, -353
	andi $t1, $t0, 1
	st.w $t1, $fp, -360
# %op49 = add i32 %op48, zeroinitializer
	ld.w $t0, $fp, -360
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -364
# %op50 = icmp ne i32 %op49, zeroinitializer
	ld.w $t0, $fp, -364
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -365
# br i1 %op50, label %label_temp_ltz25, label %label_temp_gtz26
# gen_phi
	ld.b $t0, $fp, -365
	bnez $t0, .max_sum_nonadjacent_label_temp_ltz25
	b .max_sum_nonadjacent_label_temp_gtz26
.max_sum_nonadjacent_label_temp_ltz17:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_temp_gtz18
# gen_phi
	b .max_sum_nonadjacent_label_temp_gtz18
.max_sum_nonadjacent_label_temp_gtz18:
# %op51 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 %op40
	ld.d $t0, $fp, -72
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -328
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -376
# %op52 = load i32, i32* %op37
	ld.d $t0, $fp, -312
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -380
# %op53 = sub i32 %op52, 2
	ld.w $t0, $fp, -380
	addi.w $t1, $zero, 2
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -384
# %op54 = icmp slt i32 %op53, zeroinitializer
	ld.w $t0, $fp, -384
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -385
# %op55 = zext i1 %op54 to i32
	ld.b $t0, $fp, -385
	andi $t1, $t0, 1
	st.w $t1, $fp, -392
# %op56 = add i32 %op55, zeroinitializer
	ld.w $t0, $fp, -392
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -396
# %op57 = icmp ne i32 %op56, zeroinitializer
	ld.w $t0, $fp, -396
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -397
# br i1 %op57, label %label_temp_ltz19, label %label_temp_gtz20
# gen_phi
	ld.b $t0, $fp, -397
	bnez $t0, .max_sum_nonadjacent_label_temp_ltz19
	b .max_sum_nonadjacent_label_temp_gtz20
.max_sum_nonadjacent_label_temp_ltz19:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_temp_gtz20
# gen_phi
	b .max_sum_nonadjacent_label_temp_gtz20
.max_sum_nonadjacent_label_temp_gtz20:
# %op58 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 %op53
	ld.d $t0, $fp, -72
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -384
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -408
# %op59 = load i32, i32* %op58
	ld.d $t0, $fp, -408
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -412
# %op60 = load i32, i32* %op37
	ld.d $t0, $fp, -312
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -416
# %op61 = icmp slt i32 %op60, zeroinitializer
	ld.w $t0, $fp, -416
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -417
# %op62 = zext i1 %op61 to i32
	ld.b $t0, $fp, -417
	andi $t1, $t0, 1
	st.w $t1, $fp, -424
# %op63 = add i32 %op62, zeroinitializer
	ld.w $t0, $fp, -424
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -428
# %op64 = icmp ne i32 %op63, zeroinitializer
	ld.w $t0, $fp, -428
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -429
# br i1 %op64, label %label_arr_ltz21, label %label_arr_gtz22
# gen_phi
	ld.b $t0, $fp, -429
	bnez $t0, .max_sum_nonadjacent_label_arr_ltz21
	b .max_sum_nonadjacent_label_arr_gtz22
.max_sum_nonadjacent_label_arr_ltz21:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz22
# gen_phi
	b .max_sum_nonadjacent_label_arr_gtz22
.max_sum_nonadjacent_label_arr_gtz22:
# %op65 = load i32*, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -440
# %op66 = getelementptr i32, i32* %op65, i32 %op60
	ld.d $t0, $fp, -440
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -416
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -448
# %op67 = load i32, i32* %op66
	ld.d $t0, $fp, -448
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -452
# %op68 = add i32 %op59, %op67
	ld.w $t0, $fp, -412
	ld.w $t1, $fp, -452
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -456
# %op69 = load i32, i32* %op37
	ld.d $t0, $fp, -312
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -460
# %op70 = sub i32 %op69, 1
	ld.w $t0, $fp, -460
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -464
# %op71 = icmp slt i32 %op70, zeroinitializer
	ld.w $t0, $fp, -464
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -465
# %op72 = zext i1 %op71 to i32
	ld.b $t0, $fp, -465
	andi $t1, $t0, 1
	st.w $t1, $fp, -472
# %op73 = add i32 %op72, zeroinitializer
	ld.w $t0, $fp, -472
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -476
# %op74 = icmp ne i32 %op73, zeroinitializer
	ld.w $t0, $fp, -476
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -477
# br i1 %op74, label %label_temp_ltz23, label %label_temp_gtz24
# gen_phi
	ld.b $t0, $fp, -477
	bnez $t0, .max_sum_nonadjacent_label_temp_ltz23
	b .max_sum_nonadjacent_label_temp_gtz24
.max_sum_nonadjacent_label_temp_ltz23:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_temp_gtz24
# gen_phi
	b .max_sum_nonadjacent_label_temp_gtz24
.max_sum_nonadjacent_label_temp_gtz24:
# %op75 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 %op70
	ld.d $t0, $fp, -72
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -464
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -488
# %op76 = load i32, i32* %op75
	ld.d $t0, $fp, -488
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -492
# %op77 = call i32 @MAX(i32 %op68, i32 %op76)
	ld.w $a0, $fp, -456
	ld.w $a1, $fp, -492
	bl MAX
	st.w $a0, $fp, -496
# store i32 %op77, i32* %op51
	ld.d $t0, $fp, -376
	ld.w $t1, $fp, -496
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op78 = load i32, i32* %op37
	ld.d $t0, $fp, -312
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -500
# %op79 = add i32 %op78, 1
	ld.w $t0, $fp, -500
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -504
# store i32 %op79, i32* %op37
	ld.d $t0, $fp, -312
	ld.w $t1, $fp, -504
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_condition14
# gen_phi
	b .max_sum_nonadjacent_label_condition14
.max_sum_nonadjacent_label_temp_ltz25:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_temp_gtz26
# gen_phi
	b .max_sum_nonadjacent_label_temp_gtz26
.max_sum_nonadjacent_label_temp_gtz26:
# %op80 = getelementptr [16 x i32], [16 x i32]* %op4, i32 0, i32 %op46
	ld.d $t0, $fp, -72
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -352
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -512
# %op81 = load i32, i32* %op80
	ld.d $t0, $fp, -512
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -516
# ret i32 %op81
# gen_phi
	ld.w $a0, $fp, -516
	b .max_sum_nonadjacent_exit
.max_sum_nonadjacent_exit:
	addi.d $sp, $sp, 528
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl longest_common_subseq
	.type longest_common_subseq, @function
longest_common_subseq:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -1632
	st.d $a0, $fp, -24
	st.w $a1, $fp, -28
	st.d $a2, $fp, -40
	st.w $a3, $fp, -44
.longest_common_subseq_label_entry:
# %op4 = alloca i32*
	lu12i.w $t0, -1
	ori $t0, $t0, 4040
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -8
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -56
# store i32* %arg0, i32** %op4
	ld.d $t0, $fp, -56
	ld.d $t1, $fp, -24
	st.d $t1, $t0, 0
	addi.d $t0, $t0, 8
# %op5 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4024
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -72
# store i32 %arg1, i32* %op5
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -28
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op6 = alloca i32*
	lu12i.w $t0, -1
	ori $t0, $t0, 4008
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -8
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -88
# store i32* %arg2, i32** %op6
	ld.d $t0, $fp, -88
	ld.d $t1, $fp, -40
	st.d $t1, $t0, 0
	addi.d $t0, $t0, 8
# %op7 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3992
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -104
# store i32 %arg3, i32* %op7
	ld.d $t0, $fp, -104
	ld.w $t1, $fp, -44
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op8 = alloca [16 x [16 x i32]]
	lu12i.w $t0, -1
	ori $t0, $t0, 3976
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -1024
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -120
# store [16 x [16 x i32]] [[16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer, [16 x i32] zeroinitializer], [16 x [16 x i32]]* %op8
	ld.d $t0, $fp, -120
	addi.w $t1, $zero, 16
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 16
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 16
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 16
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 16
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 16
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 16
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 16
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 16
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 16
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 16
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 16
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 16
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 16
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 16
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
	addi.w $t1, $zero, 16
	st.w $zero, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $t1, -1
	bne $zero, $t1, -12
# %op9 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 2944
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -1152
# %op10 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 2928
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -1168
# store i32 1, i32* %op9
	ld.d $t0, $fp, -1152
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_condition27
# gen_phi
	b .longest_common_subseq_label_condition27
.longest_common_subseq_label_condition27:
# %op11 = load i32, i32* %op5
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1176
# %op12 = icmp sgt i32 %op11, zeroinitializer
	ld.w $t0, $fp, -1176
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -1177
# br i1 %op12, label %label_loop28, label %label_ret29
# gen_phi
	ld.b $t0, $fp, -1177
	bnez $t0, .longest_common_subseq_label_loop28
	b .longest_common_subseq_label_ret29
.longest_common_subseq_label_loop28:
# store i32 1, i32* %op10
	ld.d $t0, $fp, -1168
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_condition30
# gen_phi
	b .longest_common_subseq_label_condition30
.longest_common_subseq_label_ret29:
# %op13 = load i32, i32* %op7
	ld.d $t0, $fp, -104
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1184
# %op14 = load i32, i32* %op5
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1188
# %op15 = icmp slt i32 %op14, zeroinitializer
	ld.w $t0, $fp, -1188
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1189
# %op16 = zext i1 %op15 to i32
	ld.b $t0, $fp, -1189
	andi $t1, $t0, 1
	st.w $t1, $fp, -1196
# %op17 = add i32 %op16, zeroinitializer
	ld.w $t0, $fp, -1196
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1200
# %op18 = icmp slt i32 %op13, zeroinitializer
	ld.w $t0, $fp, -1184
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1201
# %op19 = zext i1 %op18 to i32
	ld.b $t0, $fp, -1201
	andi $t1, $t0, 1
	st.w $t1, $fp, -1208
# %op20 = add i32 %op19, %op17
	ld.w $t0, $fp, -1208
	ld.w $t1, $fp, -1200
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1212
# %op21 = icmp ne i32 %op20, zeroinitializer
	ld.w $t0, $fp, -1212
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1213
# br i1 %op21, label %label_p_ltz50, label %label_p_gtz51
# gen_phi
	ld.b $t0, $fp, -1213
	bnez $t0, .longest_common_subseq_label_p_ltz50
	b .longest_common_subseq_label_p_gtz51
.longest_common_subseq_label_condition30:
# %op22 = load i32, i32* %op7
	ld.d $t0, $fp, -104
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1220
# %op23 = icmp sgt i32 %op22, zeroinitializer
	ld.w $t0, $fp, -1220
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -1221
# br i1 %op23, label %label_loop31, label %label_ret32
# gen_phi
	ld.b $t0, $fp, -1221
	bnez $t0, .longest_common_subseq_label_loop31
	b .longest_common_subseq_label_ret32
.longest_common_subseq_label_loop31:
# %op24 = load i32, i32* %op9
	ld.d $t0, $fp, -1152
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1228
# %op25 = sub i32 %op24, 1
	ld.w $t0, $fp, -1228
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -1232
# %op26 = icmp slt i32 %op25, zeroinitializer
	ld.w $t0, $fp, -1232
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1233
# %op27 = zext i1 %op26 to i32
	ld.b $t0, $fp, -1233
	andi $t1, $t0, 1
	st.w $t1, $fp, -1240
# %op28 = add i32 %op27, zeroinitializer
	ld.w $t0, $fp, -1240
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1244
# %op29 = icmp ne i32 %op28, zeroinitializer
	ld.w $t0, $fp, -1244
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1245
# br i1 %op29, label %label_arr1_ltz33, label %label_arr1_gtz34
# gen_phi
	ld.b $t0, $fp, -1245
	bnez $t0, .longest_common_subseq_label_arr1_ltz33
	b .longest_common_subseq_label_arr1_gtz34
.longest_common_subseq_label_ret32:
# %op30 = load i32, i32* %op9
	ld.d $t0, $fp, -1152
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1252
# %op31 = add i32 %op30, 1
	ld.w $t0, $fp, -1252
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1256
# store i32 %op31, i32* %op9
	ld.d $t0, $fp, -1152
	ld.w $t1, $fp, -1256
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_condition27
# gen_phi
	b .longest_common_subseq_label_condition27
.longest_common_subseq_label_arr1_ltz33:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr1_gtz34
# gen_phi
	b .longest_common_subseq_label_arr1_gtz34
.longest_common_subseq_label_arr1_gtz34:
# %op32 = load i32*, i32** %op4
	ld.d $t0, $fp, -56
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -1264
# %op33 = getelementptr i32, i32* %op32, i32 %op25
	ld.d $t0, $fp, -1264
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -1232
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1272
# %op34 = load i32, i32* %op33
	ld.d $t0, $fp, -1272
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1276
# %op35 = load i32, i32* %op10
	ld.d $t0, $fp, -1168
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1280
# %op36 = sub i32 %op35, 1
	ld.w $t0, $fp, -1280
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -1284
# %op37 = icmp slt i32 %op36, zeroinitializer
	ld.w $t0, $fp, -1284
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1285
# %op38 = zext i1 %op37 to i32
	ld.b $t0, $fp, -1285
	andi $t1, $t0, 1
	st.w $t1, $fp, -1292
# %op39 = add i32 %op38, zeroinitializer
	ld.w $t0, $fp, -1292
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1296
# %op40 = icmp ne i32 %op39, zeroinitializer
	ld.w $t0, $fp, -1296
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1297
# br i1 %op40, label %label_arr2_ltz35, label %label_arr2_gtz36
# gen_phi
	ld.b $t0, $fp, -1297
	bnez $t0, .longest_common_subseq_label_arr2_ltz35
	b .longest_common_subseq_label_arr2_gtz36
.longest_common_subseq_label_arr2_ltz35:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr2_gtz36
# gen_phi
	b .longest_common_subseq_label_arr2_gtz36
.longest_common_subseq_label_arr2_gtz36:
# %op41 = load i32*, i32** %op6
	ld.d $t0, $fp, -88
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -1312
# %op42 = getelementptr i32, i32* %op41, i32 %op36
	ld.d $t0, $fp, -1312
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -1284
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1320
# %op43 = load i32, i32* %op42
	ld.d $t0, $fp, -1320
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1324
# %op44 = icmp eq i32 %op34, %op43
	ld.w $t0, $fp, -1276
	ld.w $t1, $fp, -1324
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -1325
# %op45 = zext i1 %op44 to i32
	ld.b $t0, $fp, -1325
	andi $t1, $t0, 1
	st.w $t1, $fp, -1332
# %op46 = icmp sgt i32 %op45, zeroinitializer
	ld.w $t0, $fp, -1332
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -1333
# br i1 %op46, label %label_true37, label %label_false38
# gen_phi
	ld.b $t0, $fp, -1333
	bnez $t0, .longest_common_subseq_label_true37
	b .longest_common_subseq_label_false38
.longest_common_subseq_label_true37:
# %op47 = load i32, i32* %op10
	ld.d $t0, $fp, -1168
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1340
# %op48 = load i32, i32* %op9
	ld.d $t0, $fp, -1152
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1344
# %op49 = icmp slt i32 %op48, zeroinitializer
	ld.w $t0, $fp, -1344
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1345
# %op50 = zext i1 %op49 to i32
	ld.b $t0, $fp, -1345
	andi $t1, $t0, 1
	st.w $t1, $fp, -1352
# %op51 = add i32 %op50, zeroinitializer
	ld.w $t0, $fp, -1352
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1356
# %op52 = icmp slt i32 %op47, zeroinitializer
	ld.w $t0, $fp, -1340
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1357
# %op53 = zext i1 %op52 to i32
	ld.b $t0, $fp, -1357
	andi $t1, $t0, 1
	st.w $t1, $fp, -1364
# %op54 = add i32 %op53, %op51
	ld.w $t0, $fp, -1364
	ld.w $t1, $fp, -1356
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1368
# %op55 = icmp ne i32 %op54, zeroinitializer
	ld.w $t0, $fp, -1368
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1369
# br i1 %op55, label %label_p_ltz39, label %label_p_gtz40
# gen_phi
	ld.b $t0, $fp, -1369
	bnez $t0, .longest_common_subseq_label_p_ltz39
	b .longest_common_subseq_label_p_gtz40
.longest_common_subseq_label_false38:
# %op56 = load i32, i32* %op10
	ld.d $t0, $fp, -1168
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1376
# %op57 = load i32, i32* %op9
	ld.d $t0, $fp, -1152
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1380
# %op58 = icmp slt i32 %op57, zeroinitializer
	ld.w $t0, $fp, -1380
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1381
# %op59 = zext i1 %op58 to i32
	ld.b $t0, $fp, -1381
	andi $t1, $t0, 1
	st.w $t1, $fp, -1388
# %op60 = add i32 %op59, zeroinitializer
	ld.w $t0, $fp, -1388
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1392
# %op61 = icmp slt i32 %op56, zeroinitializer
	ld.w $t0, $fp, -1376
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1393
# %op62 = zext i1 %op61 to i32
	ld.b $t0, $fp, -1393
	andi $t1, $t0, 1
	st.w $t1, $fp, -1400
# %op63 = add i32 %op62, %op60
	ld.w $t0, $fp, -1400
	ld.w $t1, $fp, -1392
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1404
# %op64 = icmp ne i32 %op63, zeroinitializer
	ld.w $t0, $fp, -1404
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1405
# br i1 %op64, label %label_p_ltz43, label %label_p_gtz44
# gen_phi
	ld.b $t0, $fp, -1405
	bnez $t0, .longest_common_subseq_label_p_ltz43
	b .longest_common_subseq_label_p_gtz44
.longest_common_subseq_label_p_ltz39:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_p_gtz40
# gen_phi
	b .longest_common_subseq_label_p_gtz40
.longest_common_subseq_label_p_gtz40:
# %op65 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op48, i32 %op47
	ld.d $t0, $fp, -120
	addi.w $t2, $zero, 1024
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 64
	ld.w $t1, $fp, -1344
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -1340
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1416
# %op66 = load i32, i32* %op10
	ld.d $t0, $fp, -1168
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1420
# %op67 = sub i32 %op66, 1
	ld.w $t0, $fp, -1420
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -1424
# %op68 = load i32, i32* %op9
	ld.d $t0, $fp, -1152
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1428
# %op69 = sub i32 %op68, 1
	ld.w $t0, $fp, -1428
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -1432
# %op70 = icmp slt i32 %op69, zeroinitializer
	ld.w $t0, $fp, -1432
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1433
# %op71 = zext i1 %op70 to i32
	ld.b $t0, $fp, -1433
	andi $t1, $t0, 1
	st.w $t1, $fp, -1440
# %op72 = add i32 %op71, zeroinitializer
	ld.w $t0, $fp, -1440
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1444
# %op73 = icmp slt i32 %op67, zeroinitializer
	ld.w $t0, $fp, -1424
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1445
# %op74 = zext i1 %op73 to i32
	ld.b $t0, $fp, -1445
	andi $t1, $t0, 1
	st.w $t1, $fp, -1452
# %op75 = add i32 %op74, %op72
	ld.w $t0, $fp, -1452
	ld.w $t1, $fp, -1444
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1456
# %op76 = icmp ne i32 %op75, zeroinitializer
	ld.w $t0, $fp, -1456
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1457
# br i1 %op76, label %label_p_ltz41, label %label_p_gtz42
# gen_phi
	ld.b $t0, $fp, -1457
	bnez $t0, .longest_common_subseq_label_p_ltz41
	b .longest_common_subseq_label_p_gtz42
.longest_common_subseq_label_p_ltz41:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_p_gtz42
# gen_phi
	b .longest_common_subseq_label_p_gtz42
.longest_common_subseq_label_p_gtz42:
# %op77 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op69, i32 %op67
	ld.d $t0, $fp, -120
	addi.w $t2, $zero, 1024
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 64
	ld.w $t1, $fp, -1432
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -1424
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1472
# %op78 = load i32, i32* %op77
	ld.d $t0, $fp, -1472
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1476
# %op79 = add i32 %op78, 1
	ld.w $t0, $fp, -1476
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1480
# store i32 %op79, i32* %op65
	ld.d $t0, $fp, -1416
	ld.w $t1, $fp, -1480
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
# %op80 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op57, i32 %op56
	ld.d $t0, $fp, -120
	addi.w $t2, $zero, 1024
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 64
	ld.w $t1, $fp, -1380
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -1376
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1488
# %op81 = load i32, i32* %op10
	ld.d $t0, $fp, -1168
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1492
# %op82 = load i32, i32* %op9
	ld.d $t0, $fp, -1152
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1496
# %op83 = sub i32 %op82, 1
	ld.w $t0, $fp, -1496
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -1500
# %op84 = icmp slt i32 %op83, zeroinitializer
	ld.w $t0, $fp, -1500
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1501
# %op85 = zext i1 %op84 to i32
	ld.b $t0, $fp, -1501
	andi $t1, $t0, 1
	st.w $t1, $fp, -1508
# %op86 = add i32 %op85, zeroinitializer
	ld.w $t0, $fp, -1508
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1512
# %op87 = icmp slt i32 %op81, zeroinitializer
	ld.w $t0, $fp, -1492
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1513
# %op88 = zext i1 %op87 to i32
	ld.b $t0, $fp, -1513
	andi $t1, $t0, 1
	st.w $t1, $fp, -1520
# %op89 = add i32 %op88, %op86
	ld.w $t0, $fp, -1520
	ld.w $t1, $fp, -1512
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1524
# %op90 = icmp ne i32 %op89, zeroinitializer
	ld.w $t0, $fp, -1524
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1525
# br i1 %op90, label %label_p_ltz45, label %label_p_gtz46
# gen_phi
	ld.b $t0, $fp, -1525
	bnez $t0, .longest_common_subseq_label_p_ltz45
	b .longest_common_subseq_label_p_gtz46
.longest_common_subseq_label_p_ltz45:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_p_gtz46
# gen_phi
	b .longest_common_subseq_label_p_gtz46
.longest_common_subseq_label_p_gtz46:
# %op91 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op83, i32 %op81
	ld.d $t0, $fp, -120
	addi.w $t2, $zero, 1024
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 64
	ld.w $t1, $fp, -1500
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -1492
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1536
# %op92 = load i32, i32* %op91
	ld.d $t0, $fp, -1536
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1540
# %op93 = load i32, i32* %op10
	ld.d $t0, $fp, -1168
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1544
# %op94 = sub i32 %op93, 1
	ld.w $t0, $fp, -1544
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -1548
# %op95 = load i32, i32* %op9
	ld.d $t0, $fp, -1152
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1552
# %op96 = icmp slt i32 %op95, zeroinitializer
	ld.w $t0, $fp, -1552
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1553
# %op97 = zext i1 %op96 to i32
	ld.b $t0, $fp, -1553
	andi $t1, $t0, 1
	st.w $t1, $fp, -1560
# %op98 = add i32 %op97, zeroinitializer
	ld.w $t0, $fp, -1560
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1564
# %op99 = icmp slt i32 %op94, zeroinitializer
	ld.w $t0, $fp, -1548
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -1565
# %op100 = zext i1 %op99 to i32
	ld.b $t0, $fp, -1565
	andi $t1, $t0, 1
	st.w $t1, $fp, -1572
# %op101 = add i32 %op100, %op98
	ld.w $t0, $fp, -1572
	ld.w $t1, $fp, -1564
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1576
# %op102 = icmp ne i32 %op101, zeroinitializer
	ld.w $t0, $fp, -1576
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -1577
# br i1 %op102, label %label_p_ltz47, label %label_p_gtz48
# gen_phi
	ld.b $t0, $fp, -1577
	bnez $t0, .longest_common_subseq_label_p_ltz47
	b .longest_common_subseq_label_p_gtz48
.longest_common_subseq_label_p_ltz47:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_p_gtz48
# gen_phi
	b .longest_common_subseq_label_p_gtz48
.longest_common_subseq_label_p_gtz48:
# %op103 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op95, i32 %op94
	ld.d $t0, $fp, -120
	addi.w $t2, $zero, 1024
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 64
	ld.w $t1, $fp, -1552
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -1548
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1592
# %op104 = load i32, i32* %op103
	ld.d $t0, $fp, -1592
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1596
# %op105 = call i32 @MAX(i32 %op92, i32 %op104)
	ld.w $a0, $fp, -1540
	ld.w $a1, $fp, -1596
	bl MAX
	st.w $a0, $fp, -1600
# store i32 %op105, i32* %op80
	ld.d $t0, $fp, -1488
	ld.w $t1, $fp, -1600
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_ret49
# gen_phi
	b .longest_common_subseq_label_ret49
.longest_common_subseq_label_ret49:
# %op106 = load i32, i32* %op10
	ld.d $t0, $fp, -1168
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1604
# %op107 = add i32 %op106, 1
	ld.w $t0, $fp, -1604
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1608
# store i32 %op107, i32* %op10
	ld.d $t0, $fp, -1168
	ld.w $t1, $fp, -1608
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# br label %label_condition30
# gen_phi
	b .longest_common_subseq_label_condition30
.longest_common_subseq_label_p_ltz50:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_p_gtz51
# gen_phi
	b .longest_common_subseq_label_p_gtz51
.longest_common_subseq_label_p_gtz51:
# %op108 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %op8, i32 0, i32 %op14, i32 %op13
	ld.d $t0, $fp, -120
	addi.w $t2, $zero, 1024
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 64
	ld.w $t1, $fp, -1188
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -1184
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -1616
# %op109 = load i32, i32* %op108
	ld.d $t0, $fp, -1616
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -1620
# ret i32 %op109
# gen_phi
	ld.w $a0, $fp, -1620
	b .longest_common_subseq_exit
.longest_common_subseq_exit:
	addi.d $sp, $sp, 1632
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -224
.main_label_entry:
# %op0 = alloca [15 x i32]
	lu12i.w $t0, -1
	ori $t0, $t0, 4072
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -60
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -24
# store [15 x i32] [i32 8, i32 7, i32 4, i32 1, i32 2, i32 7, i32 0, i32 1, i32 9, i32 3, i32 4, i32 8, i32 3, i32 7, i32 0], [15 x i32]* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 8
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 7
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 7
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 9
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 8
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 7
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op1 = alloca [13 x i32]
	lu12i.w $t0, -1
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -52
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -96
# store [13 x i32] [i32 3, i32 9, i32 7, i32 1, i32 4, i32 2, i32 4, i32 3, i32 6, i32 8, i32 0, i32 1, i32 5], [13 x i32]* %op1
	ld.d $t0, $fp, -96
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 9
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 7
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 8
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op2 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3936
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -160
# %op3 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3920
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -176
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
	st.d $t0, $fp, -192
# %op5 = call i32 @max_sum_nonadjacent(i32* %op4, i32 15)
	ld.d $a0, $fp, -192
	addi.w $a1, $zero, 15
	bl max_sum_nonadjacent
	st.w $a0, $fp, -196
# call void @putint(i32 %op5)
	ld.w $a0, $fp, -196
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# %op6 = getelementptr [15 x i32], [15 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 60
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -208
# %op7 = getelementptr [13 x i32], [13 x i32]* %op1, i32 0, i32 0
	ld.d $t0, $fp, -96
	addi.w $t2, $zero, 52
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -216
# %op8 = call i32 @longest_common_subseq(i32* %op6, i32 15, i32* %op7, i32 13)
	ld.d $a0, $fp, -208
	addi.w $a1, $zero, 15
	ld.d $a2, $fp, -216
	addi.w $a3, $zero, 13
	bl longest_common_subseq
	st.w $a0, $fp, -220
# call void @putint(i32 %op8)
	ld.w $a0, $fp, -220
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# ret i32 0
# gen_phi
	addi.w $a0, $zero, 0
	b .main_exit
.main_exit:
	addi.d $sp, $sp, 224
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
