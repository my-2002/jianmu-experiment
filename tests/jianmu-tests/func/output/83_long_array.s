	.text
	.globl long_array
	.type long_array, @function
long_array:
	lu12i.w $t0, 29
	ori $t0, $t0, 2016
	lu32i.d $t0, 0
	lu52i.d $t0, $t0, 0
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	sub.d $sp, $sp, $t0
	add.d $fp, $sp, $t0
	st.w $a0, $fp, -20
.long_array_label_entry:
# %op1 = alloca [10000 x i32]
	addi.d $t0, $zero, -32
	lu12i.w $t1, 9
	ori $t1, $t1, 3136
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	sub.d $t0, $t0, $t1
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -32
# %op2 = alloca [10000 x i32]
	lu12i.w $t0, -10
	ori $t0, $t0, 920
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	lu12i.w $t1, 9
	ori $t1, $t1, 3136
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	sub.d $t0, $t0, $t1
	add.d $t0, $fp, $t0
	lu12i.w $t8, -10
	ori $t8, $t8, 920
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op3 = alloca [10000 x i32]
	lu12i.w $t0, -20
	ori $t0, $t0, 1872
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	lu12i.w $t1, 9
	ori $t1, $t1, 3136
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	sub.d $t0, $t0, $t1
	add.d $t0, $fp, $t0
	lu12i.w $t8, -20
	ori $t8, $t8, 1872
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# br label %label_condition0
# gen_phi
	addi.w $t0, $zero, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2828
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_condition0
.long_array_label_condition0:
# %op4 = phi i32 [ 0, %label_entry ], [ %op17, %label_a1_gtz4 ]
# %op5 = icmp slt i32 %op4, 10000
	lu12i.w $t0, -30
	ori $t0, $t0, 2828
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2827
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op6 = zext i1 %op5 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2827
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2820
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op7 = icmp sgt i32 %op6, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2820
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2819
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op7, label %label_loop1, label %label_ret2
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2819
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_loop1
	b .long_array_label_ret2
.long_array_label_loop1:
# %op8 = icmp slt i32 %op4, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2828
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2818
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op9 = zext i1 %op8 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2818
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2812
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op10 = add i32 %op9, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2812
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2808
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op11 = icmp ne i32 %op10, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2807
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op11, label %label_a1_ltz3, label %label_a1_gtz4
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2807
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a1_ltz3
	b .long_array_label_a1_gtz4
.long_array_label_ret2:
# br label %label_condition5
# gen_phi
	addi.w $t0, $zero, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2768
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_condition5
.long_array_label_a1_ltz3:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a1_gtz4
# gen_phi
	b .long_array_label_a1_gtz4
.long_array_label_a1_gtz4:
# %op12 = getelementptr [10000 x i32], [10000 x i32]* %op1, i32 0, i32 %op4
	ld.d $t0, $fp, -32
	lu12i.w $t2, 9
	ori $t2, $t2, 3136
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, -30
	ori $t1, $t1, 2828
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2792
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op13 = mul i32 %op4, %op4
	lu12i.w $t0, -30
	ori $t0, $t0, 2828
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2828
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2788
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op14 = sdiv i32 %op13, 10
	lu12i.w $t0, -30
	ori $t0, $t0, 2788
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 10
	div.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2784
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op15 = mul i32 %op14, 10
	lu12i.w $t0, -30
	ori $t0, $t0, 2784
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 10
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2780
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op16 = sub i32 %op13, %op15
	lu12i.w $t0, -30
	ori $t0, $t0, 2788
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2780
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	sub.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2776
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op16, i32* %op12
	lu12i.w $t0, -30
	ori $t0, $t0, 2792
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2776
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op17 = add i32 %op4, 1
	lu12i.w $t0, -30
	ori $t0, $t0, 2828
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2772
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# br label %label_condition0
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2772
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2828
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_condition0
.long_array_label_condition5:
# %op18 = phi i32 [ 0, %label_ret2 ], [ %op43, %label_a1_gtz13 ]
# %op19 = icmp slt i32 %op18, 10000
	lu12i.w $t0, -30
	ori $t0, $t0, 2768
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2767
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op20 = zext i1 %op19 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2767
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2760
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op21 = icmp sgt i32 %op20, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2760
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2759
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op21, label %label_loop6, label %label_ret7
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2759
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_loop6
	b .long_array_label_ret7
.long_array_label_loop6:
# %op22 = icmp slt i32 %op18, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2768
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2758
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op23 = zext i1 %op22 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2758
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2752
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op24 = add i32 %op23, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2752
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2748
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op25 = icmp ne i32 %op24, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2748
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2747
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op25, label %label_a2_ltz8, label %label_a2_gtz9
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2747
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a2_ltz8
	b .long_array_label_a2_gtz9
.long_array_label_ret7:
# br label %label_condition14
# gen_phi
	addi.w $t0, $zero, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2652
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_condition14
.long_array_label_a2_ltz8:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a2_gtz9
# gen_phi
	b .long_array_label_a2_gtz9
.long_array_label_a2_gtz9:
# %op26 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op18
	lu12i.w $t0, -10
	ori $t0, $t0, 920
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 9
	ori $t2, $t2, 3136
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, -30
	ori $t1, $t1, 2768
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2736
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op27 = icmp slt i32 %op18, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2768
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2735
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op28 = zext i1 %op27 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2735
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2728
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op29 = add i32 %op28, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2728
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2724
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op30 = icmp ne i32 %op29, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2724
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2723
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op30, label %label_a1_ltz10, label %label_a1_gtz11
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2723
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a1_ltz10
	b .long_array_label_a1_gtz11
.long_array_label_a1_ltz10:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a1_gtz11
# gen_phi
	b .long_array_label_a1_gtz11
.long_array_label_a1_gtz11:
# %op31 = getelementptr [10000 x i32], [10000 x i32]* %op1, i32 0, i32 %op18
	ld.d $t0, $fp, -32
	lu12i.w $t2, 9
	ori $t2, $t2, 3136
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, -30
	ori $t1, $t1, 2768
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2712
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op32 = load i32, i32* %op31
	lu12i.w $t0, -30
	ori $t0, $t0, 2712
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2708
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op33 = icmp slt i32 %op18, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2768
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2707
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op34 = zext i1 %op33 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2707
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2700
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op35 = add i32 %op34, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2700
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2696
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op36 = icmp ne i32 %op35, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2696
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2695
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op36, label %label_a1_ltz12, label %label_a1_gtz13
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2695
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a1_ltz12
	b .long_array_label_a1_gtz13
.long_array_label_a1_ltz12:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a1_gtz13
# gen_phi
	b .long_array_label_a1_gtz13
.long_array_label_a1_gtz13:
# %op37 = getelementptr [10000 x i32], [10000 x i32]* %op1, i32 0, i32 %op18
	ld.d $t0, $fp, -32
	lu12i.w $t2, 9
	ori $t2, $t2, 3136
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, -30
	ori $t1, $t1, 2768
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2680
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op38 = load i32, i32* %op37
	lu12i.w $t0, -30
	ori $t0, $t0, 2680
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2676
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op39 = mul i32 %op32, %op38
	lu12i.w $t0, -30
	ori $t0, $t0, 2708
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2676
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2672
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op40 = sdiv i32 %op39, 10
	lu12i.w $t0, -30
	ori $t0, $t0, 2672
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 10
	div.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2668
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op41 = mul i32 %op40, 10
	lu12i.w $t0, -30
	ori $t0, $t0, 2668
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 10
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2664
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op42 = sub i32 %op39, %op41
	lu12i.w $t0, -30
	ori $t0, $t0, 2672
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2664
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	sub.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2660
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op42, i32* %op26
	lu12i.w $t0, -30
	ori $t0, $t0, 2736
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2660
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op43 = add i32 %op18, 1
	lu12i.w $t0, -30
	ori $t0, $t0, 2768
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2656
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# br label %label_condition5
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2656
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2768
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_condition5
.long_array_label_condition14:
# %op44 = phi i32 [ 0, %label_ret7 ], [ %op76, %label_a1_gtz24 ]
# %op45 = icmp slt i32 %op44, 10000
	lu12i.w $t0, -30
	ori $t0, $t0, 2652
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2651
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op46 = zext i1 %op45 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2651
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2644
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op47 = icmp sgt i32 %op46, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2644
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2643
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op47, label %label_loop15, label %label_ret16
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2643
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_loop15
	b .long_array_label_ret16
.long_array_label_loop15:
# %op48 = icmp slt i32 %op44, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2652
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2642
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op49 = zext i1 %op48 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2642
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2636
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op50 = add i32 %op49, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2636
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2632
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op51 = icmp ne i32 %op50, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2632
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2631
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op51, label %label_a3_ltz17, label %label_a3_gtz18
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2631
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a3_ltz17
	b .long_array_label_a3_gtz18
.long_array_label_ret16:
# br label %label_condition25
# gen_phi
	addi.w $t0, $zero, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2496
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	addi.w $t0, $zero, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2492
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_condition25
.long_array_label_a3_ltz17:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a3_gtz18
# gen_phi
	b .long_array_label_a3_gtz18
.long_array_label_a3_gtz18:
# %op52 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op44
	lu12i.w $t0, -20
	ori $t0, $t0, 1872
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 9
	ori $t2, $t2, 3136
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, -30
	ori $t1, $t1, 2652
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2616
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op53 = icmp slt i32 %op44, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2652
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2615
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op54 = zext i1 %op53 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2615
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2608
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op55 = add i32 %op54, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2608
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2604
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op56 = icmp ne i32 %op55, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2604
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2603
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op56, label %label_a2_ltz19, label %label_a2_gtz20
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2603
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a2_ltz19
	b .long_array_label_a2_gtz20
.long_array_label_a2_ltz19:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a2_gtz20
# gen_phi
	b .long_array_label_a2_gtz20
.long_array_label_a2_gtz20:
# %op57 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op44
	lu12i.w $t0, -10
	ori $t0, $t0, 920
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 9
	ori $t2, $t2, 3136
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, -30
	ori $t1, $t1, 2652
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2592
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op58 = load i32, i32* %op57
	lu12i.w $t0, -30
	ori $t0, $t0, 2592
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2588
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op59 = icmp slt i32 %op44, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2652
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2587
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op60 = zext i1 %op59 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2587
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2580
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op61 = add i32 %op60, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2580
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2576
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op62 = icmp ne i32 %op61, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2576
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2575
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op62, label %label_a2_ltz21, label %label_a2_gtz22
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2575
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a2_ltz21
	b .long_array_label_a2_gtz22
.long_array_label_a2_ltz21:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a2_gtz22
# gen_phi
	b .long_array_label_a2_gtz22
.long_array_label_a2_gtz22:
# %op63 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op44
	lu12i.w $t0, -10
	ori $t0, $t0, 920
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 9
	ori $t2, $t2, 3136
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, -30
	ori $t1, $t1, 2652
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2560
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op64 = load i32, i32* %op63
	lu12i.w $t0, -30
	ori $t0, $t0, 2560
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2556
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op65 = mul i32 %op58, %op64
	lu12i.w $t0, -30
	ori $t0, $t0, 2588
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2556
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2552
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op66 = sdiv i32 %op65, 100
	lu12i.w $t0, -30
	ori $t0, $t0, 2552
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 100
	div.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2548
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op67 = mul i32 %op66, 100
	lu12i.w $t0, -30
	ori $t0, $t0, 2548
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 100
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2544
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op68 = sub i32 %op65, %op67
	lu12i.w $t0, -30
	ori $t0, $t0, 2552
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2544
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	sub.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2540
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op69 = icmp slt i32 %op44, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2652
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2539
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op70 = zext i1 %op69 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2539
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2532
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op71 = add i32 %op70, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2532
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2528
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op72 = icmp ne i32 %op71, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2528
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2527
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op72, label %label_a1_ltz23, label %label_a1_gtz24
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2527
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a1_ltz23
	b .long_array_label_a1_gtz24
.long_array_label_a1_ltz23:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a1_gtz24
# gen_phi
	b .long_array_label_a1_gtz24
.long_array_label_a1_gtz24:
# %op73 = getelementptr [10000 x i32], [10000 x i32]* %op1, i32 0, i32 %op44
	ld.d $t0, $fp, -32
	lu12i.w $t2, 9
	ori $t2, $t2, 3136
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, -30
	ori $t1, $t1, 2652
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2512
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op74 = load i32, i32* %op73
	lu12i.w $t0, -30
	ori $t0, $t0, 2512
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2508
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op75 = add i32 %op68, %op74
	lu12i.w $t0, -30
	ori $t0, $t0, 2540
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2508
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2504
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op75, i32* %op52
	lu12i.w $t0, -30
	ori $t0, $t0, 2616
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2504
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op76 = add i32 %op44, 1
	lu12i.w $t0, -30
	ori $t0, $t0, 2652
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2500
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# br label %label_condition14
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2500
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2652
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_condition14
.long_array_label_condition25:
# %op77 = phi i32 [ 0, %label_ret16 ], [ %op177, %label_ret61 ]
# %op78 = phi i32 [ 0, %label_ret16 ], [ %op178, %label_ret61 ]
# %op79 = icmp slt i32 %op78, 10000
	lu12i.w $t0, -30
	ori $t0, $t0, 2492
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2491
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op80 = zext i1 %op79 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2491
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2484
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op81 = icmp sgt i32 %op80, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2484
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2483
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op81, label %label_loop26, label %label_ret27
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2483
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_loop26
	b .long_array_label_ret27
.long_array_label_loop26:
# %op82 = icmp slt i32 %op78, 10
	lu12i.w $t0, -30
	ori $t0, $t0, 2492
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2482
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op83 = zext i1 %op82 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2482
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2476
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op84 = icmp sgt i32 %op83, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2476
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2475
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op84, label %label_true28, label %label_false29
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2475
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_true28
	b .long_array_label_false29
.long_array_label_ret27:
# ret i32 %op77
# gen_phi
	lu12i.w $a0, -30
	ori $a0, $a0, 2496
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.w $a0, $a0, 0
	b .long_array_exit
.long_array_label_true28:
# %op85 = icmp slt i32 %op78, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2492
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2474
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op86 = zext i1 %op85 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2474
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2468
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op87 = add i32 %op86, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2468
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2464
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op88 = icmp ne i32 %op87, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2464
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2463
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op88, label %label_a3_ltz30, label %label_a3_gtz31
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2463
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a3_ltz30
	b .long_array_label_a3_gtz31
.long_array_label_false29:
# %op89 = icmp slt i32 %op78, 20
	lu12i.w $t0, -30
	ori $t0, $t0, 2492
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 20
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2462
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op90 = zext i1 %op89 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2462
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2456
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op91 = icmp sgt i32 %op90, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2456
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2455
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op91, label %label_true32, label %label_false33
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2455
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_true32
	b .long_array_label_false33
.long_array_label_a3_ltz30:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a3_gtz31
# gen_phi
	b .long_array_label_a3_gtz31
.long_array_label_a3_gtz31:
# %op92 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op78
	lu12i.w $t0, -20
	ori $t0, $t0, 1872
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 9
	ori $t2, $t2, 3136
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, -30
	ori $t1, $t1, 2492
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2440
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op93 = load i32, i32* %op92
	lu12i.w $t0, -30
	ori $t0, $t0, 2440
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2436
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op94 = add i32 %op77, %op93
	lu12i.w $t0, -30
	ori $t0, $t0, 2496
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2436
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2432
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op95 = sdiv i32 %op94, 1333
	lu12i.w $t0, -30
	ori $t0, $t0, 2432
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1333
	div.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2428
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op96 = mul i32 %op95, 1333
	lu12i.w $t0, -30
	ori $t0, $t0, 2428
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1333
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2424
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op97 = sub i32 %op94, %op96
	lu12i.w $t0, -30
	ori $t0, $t0, 2432
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2424
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	sub.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2420
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# call void @putint(i32 %op97)
	lu12i.w $a0, -30
	ori $a0, $a0, 2420
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.w $a0, $a0, 0
	bl putint
# br label %label_ret61
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2420
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2084
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_ret61
.long_array_label_true32:
# br label %label_condition34
# gen_phi
	lu12i.w $t0, 1
	ori $t0, $t0, 904
	lu12i.w $t8, -30
	ori $t8, $t8, 2404
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	lu12i.w $t0, -30
	ori $t0, $t0, 2496
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2400
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_condition34
.long_array_label_false33:
# %op98 = icmp slt i32 %op78, 30
	lu12i.w $t0, -30
	ori $t0, $t0, 2492
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 30
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2419
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op99 = zext i1 %op98 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2419
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2412
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op100 = icmp sgt i32 %op99, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2412
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2411
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op100, label %label_true41, label %label_false42
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2411
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_true41
	b .long_array_label_false42
.long_array_label_condition34:
# %op101 = phi i32 [ 5000, %label_true32 ], [ %op120, %label_a1_gtz40 ]
# %op102 = phi i32 [ %op77, %label_true32 ], [ %op119, %label_a1_gtz40 ]
# %op103 = icmp slt i32 %op101, 10000
	lu12i.w $t0, -30
	ori $t0, $t0, 2404
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2399
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op104 = zext i1 %op103 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2399
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2392
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op105 = icmp sgt i32 %op104, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2392
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2391
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op105, label %label_loop35, label %label_ret36
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2391
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_loop35
	b .long_array_label_ret36
.long_array_label_loop35:
# %op106 = icmp slt i32 %op78, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2492
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2390
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op107 = zext i1 %op106 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2390
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2384
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op108 = add i32 %op107, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2384
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2380
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op109 = icmp ne i32 %op108, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2380
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2379
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op109, label %label_a3_ltz37, label %label_a3_gtz38
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2379
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a3_ltz37
	b .long_array_label_a3_gtz38
.long_array_label_ret36:
# call void @putint(i32 %op102)
	lu12i.w $a0, -30
	ori $a0, $a0, 2400
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.w $a0, $a0, 0
	bl putint
# br label %label_ret60
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2400
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2088
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_ret60
.long_array_label_a3_ltz37:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a3_gtz38
# gen_phi
	b .long_array_label_a3_gtz38
.long_array_label_a3_gtz38:
# %op110 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op78
	lu12i.w $t0, -20
	ori $t0, $t0, 1872
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 9
	ori $t2, $t2, 3136
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, -30
	ori $t1, $t1, 2492
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2368
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op111 = load i32, i32* %op110
	lu12i.w $t0, -30
	ori $t0, $t0, 2368
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2364
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op112 = add i32 %op102, %op111
	lu12i.w $t0, -30
	ori $t0, $t0, 2400
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2364
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2360
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op113 = icmp slt i32 %op101, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2404
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2359
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op114 = zext i1 %op113 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2359
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2352
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op115 = add i32 %op114, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2352
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2348
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op116 = icmp ne i32 %op115, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2348
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2347
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op116, label %label_a1_ltz39, label %label_a1_gtz40
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2347
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a1_ltz39
	b .long_array_label_a1_gtz40
.long_array_label_a1_ltz39:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a1_gtz40
# gen_phi
	b .long_array_label_a1_gtz40
.long_array_label_a1_gtz40:
# %op117 = getelementptr [10000 x i32], [10000 x i32]* %op1, i32 0, i32 %op101
	ld.d $t0, $fp, -32
	lu12i.w $t2, 9
	ori $t2, $t2, 3136
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, -30
	ori $t1, $t1, 2404
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2336
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op118 = load i32, i32* %op117
	lu12i.w $t0, -30
	ori $t0, $t0, 2336
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2332
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op119 = sub i32 %op112, %op118
	lu12i.w $t0, -30
	ori $t0, $t0, 2360
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2332
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	sub.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2328
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op120 = add i32 %op101, 1
	lu12i.w $t0, -30
	ori $t0, $t0, 2404
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2324
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# br label %label_condition34
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2324
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2404
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	lu12i.w $t0, -30
	ori $t0, $t0, 2328
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2400
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_condition34
.long_array_label_true41:
# br label %label_condition43
# gen_phi
	lu12i.w $t0, 1
	ori $t0, $t0, 904
	lu12i.w $t8, -30
	ori $t8, $t8, 2304
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	lu12i.w $t0, -30
	ori $t0, $t0, 2496
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2300
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_condition43
.long_array_label_false42:
# %op121 = icmp slt i32 %op78, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2492
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2323
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op122 = zext i1 %op121 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2323
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2316
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op123 = add i32 %op122, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2316
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2312
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op124 = icmp ne i32 %op123, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2312
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2311
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op124, label %label_a3_ltz57, label %label_a3_gtz58
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2311
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a3_ltz57
	b .long_array_label_a3_gtz58
.long_array_label_condition43:
# %op125 = phi i32 [ 5000, %label_true41 ], [ %op166, %label_ret56 ]
# %op126 = phi i32 [ %op77, %label_true41 ], [ %op167, %label_ret56 ]
# %op127 = icmp slt i32 %op125, 10000
	lu12i.w $t0, -30
	ori $t0, $t0, 2304
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2299
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op128 = zext i1 %op127 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2299
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2292
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op129 = icmp sgt i32 %op128, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2292
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2291
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op129, label %label_loop44, label %label_ret45
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2291
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_loop44
	b .long_array_label_ret45
.long_array_label_loop44:
# %op130 = icmp sgt i32 %op125, 2233
	lu12i.w $t0, -30
	ori $t0, $t0, 2304
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 2233
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2290
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op131 = zext i1 %op130 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2290
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2284
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op132 = icmp sgt i32 %op131, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2284
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2283
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op132, label %label_true46, label %label_false47
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2283
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_true46
	b .long_array_label_false47
.long_array_label_ret45:
# call void @putint(i32 %op126)
	lu12i.w $a0, -30
	ori $a0, $a0, 2300
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.w $a0, $a0, 0
	bl putint
# br label %label_ret59
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2300
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2092
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_ret59
.long_array_label_true46:
# %op133 = icmp slt i32 %op78, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2492
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2282
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op134 = zext i1 %op133 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2282
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2276
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op135 = add i32 %op134, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2276
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2272
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op136 = icmp ne i32 %op135, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2272
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2271
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op136, label %label_a2_ltz48, label %label_a2_gtz49
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2271
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a2_ltz48
	b .long_array_label_a2_gtz49
.long_array_label_false47:
# %op137 = icmp slt i32 %op78, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2492
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2270
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op138 = zext i1 %op137 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2270
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2264
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op139 = add i32 %op138, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2264
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2260
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op140 = icmp ne i32 %op139, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2260
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2259
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op140, label %label_a1_ltz52, label %label_a1_gtz53
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2259
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a1_ltz52
	b .long_array_label_a1_gtz53
.long_array_label_a2_ltz48:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a2_gtz49
# gen_phi
	b .long_array_label_a2_gtz49
.long_array_label_a2_gtz49:
# %op141 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op78
	lu12i.w $t0, -10
	ori $t0, $t0, 920
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 9
	ori $t2, $t2, 3136
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, -30
	ori $t1, $t1, 2492
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2248
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op142 = load i32, i32* %op141
	lu12i.w $t0, -30
	ori $t0, $t0, 2248
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2244
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op143 = add i32 %op126, %op142
	lu12i.w $t0, -30
	ori $t0, $t0, 2300
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2244
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2240
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op144 = icmp slt i32 %op125, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2304
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2239
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op145 = zext i1 %op144 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2239
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2232
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op146 = add i32 %op145, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2232
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2228
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op147 = icmp ne i32 %op146, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2228
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2227
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op147, label %label_a1_ltz50, label %label_a1_gtz51
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2227
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a1_ltz50
	b .long_array_label_a1_gtz51
.long_array_label_a1_ltz50:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a1_gtz51
# gen_phi
	b .long_array_label_a1_gtz51
.long_array_label_a1_gtz51:
# %op148 = getelementptr [10000 x i32], [10000 x i32]* %op1, i32 0, i32 %op125
	ld.d $t0, $fp, -32
	lu12i.w $t2, 9
	ori $t2, $t2, 3136
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, -30
	ori $t1, $t1, 2304
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2216
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op149 = load i32, i32* %op148
	lu12i.w $t0, -30
	ori $t0, $t0, 2216
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2212
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op150 = sub i32 %op143, %op149
	lu12i.w $t0, -30
	ori $t0, $t0, 2240
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2212
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	sub.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2208
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op151 = add i32 %op125, 1
	lu12i.w $t0, -30
	ori $t0, $t0, 2304
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2204
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# br label %label_ret56
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2204
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2132
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	lu12i.w $t0, -30
	ori $t0, $t0, 2208
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2128
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_ret56
.long_array_label_a1_ltz52:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a1_gtz53
# gen_phi
	b .long_array_label_a1_gtz53
.long_array_label_a1_gtz53:
# %op152 = getelementptr [10000 x i32], [10000 x i32]* %op1, i32 0, i32 %op78
	ld.d $t0, $fp, -32
	lu12i.w $t2, 9
	ori $t2, $t2, 3136
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, -30
	ori $t1, $t1, 2492
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2192
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op153 = load i32, i32* %op152
	lu12i.w $t0, -30
	ori $t0, $t0, 2192
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2188
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op154 = add i32 %op126, %op153
	lu12i.w $t0, -30
	ori $t0, $t0, 2300
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2188
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2184
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op155 = icmp slt i32 %op125, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2304
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2183
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op156 = zext i1 %op155 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2183
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2176
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op157 = add i32 %op156, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2176
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2172
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op158 = icmp ne i32 %op157, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2172
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2171
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op158, label %label_a3_ltz54, label %label_a3_gtz55
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2171
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a3_ltz54
	b .long_array_label_a3_gtz55
.long_array_label_a3_ltz54:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a3_gtz55
# gen_phi
	b .long_array_label_a3_gtz55
.long_array_label_a3_gtz55:
# %op159 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op125
	lu12i.w $t0, -20
	ori $t0, $t0, 1872
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 9
	ori $t2, $t2, 3136
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, -30
	ori $t1, $t1, 2304
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2160
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op160 = load i32, i32* %op159
	lu12i.w $t0, -30
	ori $t0, $t0, 2160
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2156
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op161 = add i32 %op154, %op160
	lu12i.w $t0, -30
	ori $t0, $t0, 2184
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2156
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2152
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op162 = sdiv i32 %op161, 13333
	lu12i.w $t0, -30
	ori $t0, $t0, 2152
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 3
	ori $t1, $t1, 1045
	div.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2148
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op163 = mul i32 %op162, 13333
	lu12i.w $t0, -30
	ori $t0, $t0, 2148
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 3
	ori $t1, $t1, 1045
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2144
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op164 = sub i32 %op161, %op163
	lu12i.w $t0, -30
	ori $t0, $t0, 2152
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2144
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	sub.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2140
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op165 = add i32 %op125, 2
	lu12i.w $t0, -30
	ori $t0, $t0, 2304
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2136
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# br label %label_ret56
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2136
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2132
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	lu12i.w $t0, -30
	ori $t0, $t0, 2140
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2128
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_ret56
.long_array_label_ret56:
# %op166 = phi i32 [ %op151, %label_a1_gtz51 ], [ %op165, %label_a3_gtz55 ]
# %op167 = phi i32 [ %op150, %label_a1_gtz51 ], [ %op164, %label_a3_gtz55 ]
# br label %label_condition43
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2132
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2304
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	lu12i.w $t0, -30
	ori $t0, $t0, 2128
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2300
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_condition43
.long_array_label_a3_ltz57:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a3_gtz58
# gen_phi
	b .long_array_label_a3_gtz58
.long_array_label_a3_gtz58:
# %op168 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op78
	lu12i.w $t0, -20
	ori $t0, $t0, 1872
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t2, 9
	ori $t2, $t2, 3136
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	lu12i.w $t1, -30
	ori $t1, $t1, 2492
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2120
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op169 = load i32, i32* %op168
	lu12i.w $t0, -30
	ori $t0, $t0, 2120
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2116
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op170 = mul i32 %op169, %arg0
	lu12i.w $t0, -30
	ori $t0, $t0, 2116
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2112
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op171 = add i32 %op77, %op170
	lu12i.w $t0, -30
	ori $t0, $t0, 2496
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2112
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2108
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op172 = sdiv i32 %op171, 99988
	lu12i.w $t0, -30
	ori $t0, $t0, 2108
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 24
	ori $t1, $t1, 1684
	div.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2104
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op173 = mul i32 %op172, 99988
	lu12i.w $t0, -30
	ori $t0, $t0, 2104
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 24
	ori $t1, $t1, 1684
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2100
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op174 = sub i32 %op171, %op173
	lu12i.w $t0, -30
	ori $t0, $t0, 2108
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2100
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	sub.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2096
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# br label %label_ret59
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2096
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2092
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_ret59
.long_array_label_ret59:
# %op175 = phi i32 [ %op126, %label_ret45 ], [ %op174, %label_a3_gtz58 ]
# br label %label_ret60
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2092
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2088
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_ret60
.long_array_label_ret60:
# %op176 = phi i32 [ %op102, %label_ret36 ], [ %op175, %label_ret59 ]
# br label %label_ret61
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2088
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2084
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_ret61
.long_array_label_ret61:
# %op177 = phi i32 [ %op97, %label_a3_gtz31 ], [ %op176, %label_ret60 ]
# %op178 = add i32 %op78, 1
	lu12i.w $t0, -30
	ori $t0, $t0, 2492
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2080
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# br label %label_condition25
# gen_phi
	lu12i.w $t0, -30
	ori $t0, $t0, 2084
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2496
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	lu12i.w $t0, -30
	ori $t0, $t0, 2080
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2492
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t0, $t8, 0
	b .long_array_label_condition25
.long_array_exit:
	lu12i.w $t0, 29
	ori $t0, $t0, 2016
	lu32i.d $t0, 0
	lu52i.d $t0, $t0, 0
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.main_label_entry:
# %op0 = call i32 @long_array(i32 9)
	addi.w $a0, $zero, 9
	bl long_array
	st.w $a0, $fp, -20
# ret i32 %op0
# gen_phi
	ld.w $a0, $fp, -20
	b .main_exit
.main_exit:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
