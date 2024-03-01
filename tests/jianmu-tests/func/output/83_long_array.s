	.text
	.globl long_array
	.type long_array, @function
long_array:
	lu12i.w $t0, 29
	ori $t0, $t0, 2304
	lu32i.d $t0, 0
	lu52i.d $t0, $t0, 0
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	sub.d $sp, $sp, $t0
	add.d $fp, $sp, $t0
	st.w $a0, $fp, -20
.long_array_label_entry:
# %op1 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -32
# store i32 %arg0, i32* %op1
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op2 = alloca [10000 x i32]
	lu12i.w $t0, -1
	ori $t0, $t0, 4048
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -40000
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -48
# %op3 = alloca [10000 x i32]
	lu12i.w $t0, -10
	ori $t0, $t0, 904
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -40000
	add.d $t0, $fp, $t0
	lu12i.w $t8, -10
	ori $t8, $t8, 904
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op4 = alloca [10000 x i32]
	lu12i.w $t0, -20
	ori $t0, $t0, 1856
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -40000
	add.d $t0, $fp, $t0
	lu12i.w $t8, -20
	ori $t8, $t8, 1856
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op5 = alloca i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2808
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# store i32 0, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_condition0
	b .long_array_label_condition0
.long_array_label_condition0:
# %op6 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2800
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op7 = add i32 %op6, 10000
	lu12i.w $t0, -30
	ori $t0, $t0, 2800
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2796
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op8 = icmp slt i32 %op6, 10000
	lu12i.w $t0, -30
	ori $t0, $t0, 2800
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2795
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op9 = zext i1 %op8 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2795
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2788
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op10 = icmp sgt i32 %op9, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2788
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2787
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op10, label %label_loop1, label %label_ret2
	lu12i.w $t0, -30
	ori $t0, $t0, 2787
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_loop1
	b .long_array_label_ret2
.long_array_label_loop1:
# %op11 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2780
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op12 = icmp slt i32 %op11, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2780
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2779
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op13 = zext i1 %op12 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2779
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2772
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op14 = add i32 %op13, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2772
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2768
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op15 = icmp ne i32 %op14, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2768
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2767
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op15, label %label_a1_ltz3, label %label_a1_gtz4
	lu12i.w $t0, -30
	ori $t0, $t0, 2767
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a1_ltz3
	b .long_array_label_a1_gtz4
.long_array_label_ret2:
# store i32 0, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_condition5
	b .long_array_label_condition5
.long_array_label_a1_ltz3:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a1_gtz4
	b .long_array_label_a1_gtz4
.long_array_label_a1_gtz4:
# %op16 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op11
	ld.d $t0, $fp, -48
	lu12i.w $t1, -30
	ori $t1, $t1, 2780
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2752
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op17 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2748
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op18 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2744
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op19 = mul i32 %op17, %op18
	lu12i.w $t0, -30
	ori $t0, $t0, 2748
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2744
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2740
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op20 = sdiv i32 %op19, 10
	lu12i.w $t0, -30
	ori $t0, $t0, 2740
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 10
	div.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2736
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op21 = mul i32 %op20, 10
	lu12i.w $t0, -30
	ori $t0, $t0, 2736
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 10
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2732
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op22 = sub i32 %op19, %op21
	lu12i.w $t0, -30
	ori $t0, $t0, 2740
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2732
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	sub.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2728
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op22, i32* %op16
	lu12i.w $t0, -30
	ori $t0, $t0, 2752
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2728
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# %op23 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2724
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op24 = add i32 %op23, 1
	lu12i.w $t0, -30
	ori $t0, $t0, 2724
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2720
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op24, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2720
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# br label %label_condition0
	b .long_array_label_condition0
.long_array_label_condition5:
# %op25 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2716
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op26 = add i32 %op25, 10000
	lu12i.w $t0, -30
	ori $t0, $t0, 2716
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2712
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op27 = icmp slt i32 %op25, 10000
	lu12i.w $t0, -30
	ori $t0, $t0, 2716
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2711
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op28 = zext i1 %op27 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2711
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2704
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op29 = icmp sgt i32 %op28, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2704
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2703
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op29, label %label_loop6, label %label_ret7
	lu12i.w $t0, -30
	ori $t0, $t0, 2703
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_loop6
	b .long_array_label_ret7
.long_array_label_loop6:
# %op30 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2696
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op31 = icmp slt i32 %op30, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2696
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2695
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op32 = zext i1 %op31 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2695
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2688
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op33 = add i32 %op32, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2688
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2684
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op34 = icmp ne i32 %op33, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2684
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2683
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op34, label %label_a2_ltz8, label %label_a2_gtz9
	lu12i.w $t0, -30
	ori $t0, $t0, 2683
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a2_ltz8
	b .long_array_label_a2_gtz9
.long_array_label_ret7:
# store i32 0, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_condition14
	b .long_array_label_condition14
.long_array_label_a2_ltz8:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a2_gtz9
	b .long_array_label_a2_gtz9
.long_array_label_a2_gtz9:
# %op35 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op30
	lu12i.w $t0, -10
	ori $t0, $t0, 904
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2696
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2672
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op36 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2668
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op37 = icmp slt i32 %op36, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2668
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2667
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op38 = zext i1 %op37 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2667
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2660
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op39 = add i32 %op38, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2660
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2656
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op40 = icmp ne i32 %op39, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2656
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2655
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op40, label %label_a1_ltz10, label %label_a1_gtz11
	lu12i.w $t0, -30
	ori $t0, $t0, 2655
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
	b .long_array_label_a1_gtz11
.long_array_label_a1_gtz11:
# %op41 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op36
	ld.d $t0, $fp, -48
	lu12i.w $t1, -30
	ori $t1, $t1, 2668
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2640
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op42 = load i32, i32* %op41
	lu12i.w $t0, -30
	ori $t0, $t0, 2640
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2636
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op43 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2632
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op44 = icmp slt i32 %op43, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2632
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2631
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op45 = zext i1 %op44 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2631
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2624
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op46 = add i32 %op45, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2624
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2620
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op47 = icmp ne i32 %op46, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2620
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2619
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op47, label %label_a1_ltz12, label %label_a1_gtz13
	lu12i.w $t0, -30
	ori $t0, $t0, 2619
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
	b .long_array_label_a1_gtz13
.long_array_label_a1_gtz13:
# %op48 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op43
	ld.d $t0, $fp, -48
	lu12i.w $t1, -30
	ori $t1, $t1, 2632
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2608
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op49 = load i32, i32* %op48
	lu12i.w $t0, -30
	ori $t0, $t0, 2608
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2604
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op50 = mul i32 %op42, %op49
	lu12i.w $t0, -30
	ori $t0, $t0, 2636
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2604
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2600
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op51 = sdiv i32 %op50, 10
	lu12i.w $t0, -30
	ori $t0, $t0, 2600
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 10
	div.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2596
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op52 = mul i32 %op51, 10
	lu12i.w $t0, -30
	ori $t0, $t0, 2596
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 10
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2592
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op53 = sub i32 %op50, %op52
	lu12i.w $t0, -30
	ori $t0, $t0, 2600
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2592
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	sub.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2588
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op53, i32* %op35
	lu12i.w $t0, -30
	ori $t0, $t0, 2672
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2588
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# %op54 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2584
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op55 = add i32 %op54, 1
	lu12i.w $t0, -30
	ori $t0, $t0, 2584
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2580
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op55, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2580
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# br label %label_condition5
	b .long_array_label_condition5
.long_array_label_condition14:
# %op56 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2576
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op57 = add i32 %op56, 10000
	lu12i.w $t0, -30
	ori $t0, $t0, 2576
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2572
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op58 = icmp slt i32 %op56, 10000
	lu12i.w $t0, -30
	ori $t0, $t0, 2576
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2571
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op59 = zext i1 %op58 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2571
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2564
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op60 = icmp sgt i32 %op59, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2564
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2563
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op60, label %label_loop15, label %label_ret16
	lu12i.w $t0, -30
	ori $t0, $t0, 2563
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_loop15
	b .long_array_label_ret16
.long_array_label_loop15:
# %op61 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
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
# %op62 = icmp slt i32 %op61, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2556
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2555
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op63 = zext i1 %op62 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2555
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2548
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op64 = add i32 %op63, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2548
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2544
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op65 = icmp ne i32 %op64, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2544
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2543
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op65, label %label_a3_ltz17, label %label_a3_gtz18
	lu12i.w $t0, -30
	ori $t0, $t0, 2543
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a3_ltz17
	b .long_array_label_a3_gtz18
.long_array_label_ret16:
# %op66 = alloca i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2528
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2528
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# store i32 0, i32* %op66
	lu12i.w $t0, -30
	ori $t0, $t0, 2528
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_condition25
	b .long_array_label_condition25
.long_array_label_a3_ltz17:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a3_gtz18
	b .long_array_label_a3_gtz18
.long_array_label_a3_gtz18:
# %op67 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op61
	lu12i.w $t0, -20
	ori $t0, $t0, 1856
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2556
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2512
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op68 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
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
# %op69 = icmp slt i32 %op68, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2508
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2507
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op70 = zext i1 %op69 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2507
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2500
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op71 = add i32 %op70, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2500
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2496
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op72 = icmp ne i32 %op71, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2496
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2495
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op72, label %label_a2_ltz19, label %label_a2_gtz20
	lu12i.w $t0, -30
	ori $t0, $t0, 2495
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
	b .long_array_label_a2_gtz20
.long_array_label_a2_gtz20:
# %op73 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op68
	lu12i.w $t0, -10
	ori $t0, $t0, 904
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2508
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2480
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op74 = load i32, i32* %op73
	lu12i.w $t0, -30
	ori $t0, $t0, 2480
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2476
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op75 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2472
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op76 = icmp slt i32 %op75, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2472
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2471
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op77 = zext i1 %op76 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2471
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2464
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op78 = add i32 %op77, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2464
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2460
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op79 = icmp ne i32 %op78, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2460
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2459
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op79, label %label_a2_ltz21, label %label_a2_gtz22
	lu12i.w $t0, -30
	ori $t0, $t0, 2459
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
	b .long_array_label_a2_gtz22
.long_array_label_a2_gtz22:
# %op80 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op75
	lu12i.w $t0, -10
	ori $t0, $t0, 904
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2472
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2448
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op81 = load i32, i32* %op80
	lu12i.w $t0, -30
	ori $t0, $t0, 2448
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2444
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op82 = mul i32 %op74, %op81
	lu12i.w $t0, -30
	ori $t0, $t0, 2476
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2444
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2440
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op83 = sdiv i32 %op82, 100
	lu12i.w $t0, -30
	ori $t0, $t0, 2440
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 100
	div.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2436
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op84 = mul i32 %op83, 100
	lu12i.w $t0, -30
	ori $t0, $t0, 2436
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 100
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2432
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op85 = sub i32 %op82, %op84
	lu12i.w $t0, -30
	ori $t0, $t0, 2440
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2432
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	sub.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2428
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op86 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2424
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op87 = icmp slt i32 %op86, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2424
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2423
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op88 = zext i1 %op87 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2423
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2416
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op89 = add i32 %op88, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2416
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2412
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op90 = icmp ne i32 %op89, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2412
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2411
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op90, label %label_a1_ltz23, label %label_a1_gtz24
	lu12i.w $t0, -30
	ori $t0, $t0, 2411
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
	b .long_array_label_a1_gtz24
.long_array_label_a1_gtz24:
# %op91 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op86
	ld.d $t0, $fp, -48
	lu12i.w $t1, -30
	ori $t1, $t1, 2424
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2400
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op92 = load i32, i32* %op91
	lu12i.w $t0, -30
	ori $t0, $t0, 2400
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2396
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op93 = add i32 %op85, %op92
	lu12i.w $t0, -30
	ori $t0, $t0, 2428
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2396
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2392
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op93, i32* %op67
	lu12i.w $t0, -30
	ori $t0, $t0, 2512
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2392
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# %op94 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2388
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op95 = add i32 %op94, 1
	lu12i.w $t0, -30
	ori $t0, $t0, 2388
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2384
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op95, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2384
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# br label %label_condition14
	b .long_array_label_condition14
.long_array_label_condition25:
# %op96 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2380
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op97 = add i32 %op96, 10000
	lu12i.w $t0, -30
	ori $t0, $t0, 2380
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2376
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op98 = icmp slt i32 %op96, 10000
	lu12i.w $t0, -30
	ori $t0, $t0, 2380
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2375
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op99 = zext i1 %op98 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2375
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2368
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op100 = icmp sgt i32 %op99, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2368
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2367
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op100, label %label_loop26, label %label_ret27
	lu12i.w $t0, -30
	ori $t0, $t0, 2367
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_loop26
	b .long_array_label_ret27
.long_array_label_loop26:
# %op101 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2360
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op102 = add i32 %op101, 10
	lu12i.w $t0, -30
	ori $t0, $t0, 2360
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 10
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2356
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op103 = icmp slt i32 %op101, 10
	lu12i.w $t0, -30
	ori $t0, $t0, 2360
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2355
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op104 = zext i1 %op103 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2355
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2348
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op105 = icmp sgt i32 %op104, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2348
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2347
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op105, label %label_true28, label %label_false29
	lu12i.w $t0, -30
	ori $t0, $t0, 2347
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_true28
	b .long_array_label_false29
.long_array_label_ret27:
# %op106 = load i32, i32* %op66
	lu12i.w $t0, -30
	ori $t0, $t0, 2528
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2340
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# ret i32 %op106
	lu12i.w $a0, -30
	ori $a0, $a0, 2340
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.w $a0, $a0, 0
	b .long_array_exit
.long_array_label_true28:
# %op107 = load i32, i32* %op66
	lu12i.w $t0, -30
	ori $t0, $t0, 2528
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2336
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op108 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
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
# %op109 = icmp slt i32 %op108, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2332
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2331
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op110 = zext i1 %op109 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2331
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2324
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op111 = add i32 %op110, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2324
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2320
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op112 = icmp ne i32 %op111, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2320
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2319
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op112, label %label_a3_ltz30, label %label_a3_gtz31
	lu12i.w $t0, -30
	ori $t0, $t0, 2319
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a3_ltz30
	b .long_array_label_a3_gtz31
.long_array_label_false29:
# %op113 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2312
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op114 = add i32 %op113, 20
	lu12i.w $t0, -30
	ori $t0, $t0, 2312
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 20
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2308
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op115 = icmp slt i32 %op113, 20
	lu12i.w $t0, -30
	ori $t0, $t0, 2312
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 20
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2307
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op116 = zext i1 %op115 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2307
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2300
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op117 = icmp sgt i32 %op116, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2300
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2299
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op117, label %label_true32, label %label_false33
	lu12i.w $t0, -30
	ori $t0, $t0, 2299
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
	b .long_array_label_a3_gtz31
.long_array_label_a3_gtz31:
# %op118 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op108
	lu12i.w $t0, -20
	ori $t0, $t0, 1856
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2332
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2288
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op119 = load i32, i32* %op118
	lu12i.w $t0, -30
	ori $t0, $t0, 2288
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2284
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op120 = add i32 %op107, %op119
	lu12i.w $t0, -30
	ori $t0, $t0, 2336
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2284
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2280
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op121 = sdiv i32 %op120, 1333
	lu12i.w $t0, -30
	ori $t0, $t0, 2280
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1333
	div.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2276
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op122 = mul i32 %op121, 1333
	lu12i.w $t0, -30
	ori $t0, $t0, 2276
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1333
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2272
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op123 = sub i32 %op120, %op122
	lu12i.w $t0, -30
	ori $t0, $t0, 2280
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2272
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	sub.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2268
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op123, i32* %op66
	lu12i.w $t0, -30
	ori $t0, $t0, 2528
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2268
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# %op124 = load i32, i32* %op66
	lu12i.w $t0, -30
	ori $t0, $t0, 2528
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2264
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# call void @putint(i32 %op124)
	lu12i.w $a0, -30
	ori $a0, $a0, 2264
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.w $a0, $a0, 0
	bl putint
# br label %label_ret61
	b .long_array_label_ret61
.long_array_label_true32:
# %op125 = alloca i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2256
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2256
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# store i32 5000, i32* %op125
	lu12i.w $t0, -30
	ori $t0, $t0, 2256
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, 1
	ori $t1, $t1, 904
	st.w $t1, $t0, 0
# br label %label_condition34
	b .long_array_label_condition34
.long_array_label_false33:
# %op126 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2248
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op127 = add i32 %op126, 30
	lu12i.w $t0, -30
	ori $t0, $t0, 2248
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 30
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2244
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op128 = icmp slt i32 %op126, 30
	lu12i.w $t0, -30
	ori $t0, $t0, 2248
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 30
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2243
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op129 = zext i1 %op128 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2243
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2236
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op130 = icmp sgt i32 %op129, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2236
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2235
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op130, label %label_true41, label %label_false42
	lu12i.w $t0, -30
	ori $t0, $t0, 2235
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_true41
	b .long_array_label_false42
.long_array_label_condition34:
# %op131 = load i32, i32* %op125
	lu12i.w $t0, -30
	ori $t0, $t0, 2256
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2228
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op132 = add i32 %op131, 10000
	lu12i.w $t0, -30
	ori $t0, $t0, 2228
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2224
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op133 = icmp slt i32 %op131, 10000
	lu12i.w $t0, -30
	ori $t0, $t0, 2228
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2223
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op134 = zext i1 %op133 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2223
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2216
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op135 = icmp sgt i32 %op134, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2216
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2215
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op135, label %label_loop35, label %label_ret36
	lu12i.w $t0, -30
	ori $t0, $t0, 2215
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_loop35
	b .long_array_label_ret36
.long_array_label_loop35:
# %op136 = load i32, i32* %op66
	lu12i.w $t0, -30
	ori $t0, $t0, 2528
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2208
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op137 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2204
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op138 = icmp slt i32 %op137, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2204
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2203
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op139 = zext i1 %op138 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2203
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2196
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op140 = add i32 %op139, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2196
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2192
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op141 = icmp ne i32 %op140, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2192
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2191
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op141, label %label_a3_ltz37, label %label_a3_gtz38
	lu12i.w $t0, -30
	ori $t0, $t0, 2191
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a3_ltz37
	b .long_array_label_a3_gtz38
.long_array_label_ret36:
# %op142 = load i32, i32* %op66
	lu12i.w $t0, -30
	ori $t0, $t0, 2528
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2184
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# call void @putint(i32 %op142)
	lu12i.w $a0, -30
	ori $a0, $a0, 2184
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.w $a0, $a0, 0
	bl putint
# br label %label_ret60
	b .long_array_label_ret60
.long_array_label_a3_ltz37:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a3_gtz38
	b .long_array_label_a3_gtz38
.long_array_label_a3_gtz38:
# %op143 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op137
	lu12i.w $t0, -20
	ori $t0, $t0, 1856
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2204
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2176
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op144 = load i32, i32* %op143
	lu12i.w $t0, -30
	ori $t0, $t0, 2176
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2172
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op145 = add i32 %op136, %op144
	lu12i.w $t0, -30
	ori $t0, $t0, 2208
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2172
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2168
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op146 = load i32, i32* %op125
	lu12i.w $t0, -30
	ori $t0, $t0, 2256
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2164
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op147 = icmp slt i32 %op146, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2164
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2163
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op148 = zext i1 %op147 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2163
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2156
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op149 = add i32 %op148, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2156
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2152
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op150 = icmp ne i32 %op149, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2152
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2151
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op150, label %label_a1_ltz39, label %label_a1_gtz40
	lu12i.w $t0, -30
	ori $t0, $t0, 2151
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
	b .long_array_label_a1_gtz40
.long_array_label_a1_gtz40:
# %op151 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op146
	ld.d $t0, $fp, -48
	lu12i.w $t1, -30
	ori $t1, $t1, 2164
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2136
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op152 = load i32, i32* %op151
	lu12i.w $t0, -30
	ori $t0, $t0, 2136
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2132
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op153 = sub i32 %op145, %op152
	lu12i.w $t0, -30
	ori $t0, $t0, 2168
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2132
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	sub.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2128
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op153, i32* %op66
	lu12i.w $t0, -30
	ori $t0, $t0, 2528
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2128
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# %op154 = load i32, i32* %op125
	lu12i.w $t0, -30
	ori $t0, $t0, 2256
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2124
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op155 = add i32 %op154, 1
	lu12i.w $t0, -30
	ori $t0, $t0, 2124
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2120
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op155, i32* %op125
	lu12i.w $t0, -30
	ori $t0, $t0, 2256
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2120
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# br label %label_condition34
	b .long_array_label_condition34
.long_array_label_true41:
# %op156 = alloca i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2112
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2112
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# store i32 5000, i32* %op156
	lu12i.w $t0, -30
	ori $t0, $t0, 2112
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, 1
	ori $t1, $t1, 904
	st.w $t1, $t0, 0
# br label %label_condition43
	b .long_array_label_condition43
.long_array_label_false42:
# %op157 = load i32, i32* %op66
	lu12i.w $t0, -30
	ori $t0, $t0, 2528
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2104
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op158 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2100
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op159 = icmp slt i32 %op158, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2100
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2099
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op160 = zext i1 %op159 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2099
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2092
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op161 = add i32 %op160, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2092
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2088
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op162 = icmp ne i32 %op161, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2088
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2087
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op162, label %label_a3_ltz57, label %label_a3_gtz58
	lu12i.w $t0, -30
	ori $t0, $t0, 2087
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a3_ltz57
	b .long_array_label_a3_gtz58
.long_array_label_condition43:
# %op163 = load i32, i32* %op156
	lu12i.w $t0, -30
	ori $t0, $t0, 2112
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2080
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op164 = add i32 %op163, 10000
	lu12i.w $t0, -30
	ori $t0, $t0, 2080
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2076
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op165 = icmp slt i32 %op163, 10000
	lu12i.w $t0, -30
	ori $t0, $t0, 2080
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2075
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op166 = zext i1 %op165 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2075
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2068
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op167 = icmp sgt i32 %op166, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2068
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2067
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op167, label %label_loop44, label %label_ret45
	lu12i.w $t0, -30
	ori $t0, $t0, 2067
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_loop44
	b .long_array_label_ret45
.long_array_label_loop44:
# %op168 = load i32, i32* %op156
	lu12i.w $t0, -30
	ori $t0, $t0, 2112
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2060
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op169 = add i32 %op168, 2233
	lu12i.w $t0, -30
	ori $t0, $t0, 2060
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 2233
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2056
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op170 = icmp sgt i32 %op168, 2233
	lu12i.w $t0, -30
	ori $t0, $t0, 2060
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 2233
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2055
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op171 = zext i1 %op170 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2055
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2048
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op172 = icmp sgt i32 %op171, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2048
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	lu12i.w $t8, -30
	ori $t8, $t8, 2047
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op172, label %label_true46, label %label_false47
	lu12i.w $t0, -30
	ori $t0, $t0, 2047
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_true46
	b .long_array_label_false47
.long_array_label_ret45:
# %op173 = load i32, i32* %op66
	lu12i.w $t0, -30
	ori $t0, $t0, 2528
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2040
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# call void @putint(i32 %op173)
	lu12i.w $a0, -30
	ori $a0, $a0, 2040
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.w $a0, $a0, 0
	bl putint
# br label %label_ret59
	b .long_array_label_ret59
.long_array_label_true46:
# %op174 = load i32, i32* %op66
	lu12i.w $t0, -30
	ori $t0, $t0, 2528
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2036
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op175 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2032
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op176 = icmp slt i32 %op175, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2032
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2031
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op177 = zext i1 %op176 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2031
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2024
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op178 = add i32 %op177, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2024
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2020
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op179 = icmp ne i32 %op178, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2020
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 2019
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op179, label %label_a2_ltz48, label %label_a2_gtz49
	lu12i.w $t0, -30
	ori $t0, $t0, 2019
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	bnez $t0, .long_array_label_a2_ltz48
	b .long_array_label_a2_gtz49
.long_array_label_false47:
# %op180 = load i32, i32* %op66
	lu12i.w $t0, -30
	ori $t0, $t0, 2528
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2012
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op181 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 2008
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op182 = icmp slt i32 %op181, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2008
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 2007
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op183 = zext i1 %op182 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 2007
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 2000
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op184 = add i32 %op183, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 2000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1996
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op185 = icmp ne i32 %op184, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 1996
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 1995
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op185, label %label_a1_ltz52, label %label_a1_gtz53
	lu12i.w $t0, -30
	ori $t0, $t0, 1995
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
	b .long_array_label_a2_gtz49
.long_array_label_a2_gtz49:
# %op186 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op175
	lu12i.w $t0, -10
	ori $t0, $t0, 904
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2032
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1984
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op187 = load i32, i32* %op186
	lu12i.w $t0, -30
	ori $t0, $t0, 1984
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 1980
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op188 = add i32 %op174, %op187
	lu12i.w $t0, -30
	ori $t0, $t0, 2036
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 1980
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1976
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op189 = load i32, i32* %op156
	lu12i.w $t0, -30
	ori $t0, $t0, 2112
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 1972
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op190 = icmp slt i32 %op189, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 1972
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1971
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op191 = zext i1 %op190 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 1971
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 1964
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op192 = add i32 %op191, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 1964
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1960
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op193 = icmp ne i32 %op192, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 1960
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 1959
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op193, label %label_a1_ltz50, label %label_a1_gtz51
	lu12i.w $t0, -30
	ori $t0, $t0, 1959
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
	b .long_array_label_a1_gtz51
.long_array_label_a1_gtz51:
# %op194 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op189
	ld.d $t0, $fp, -48
	lu12i.w $t1, -30
	ori $t1, $t1, 1972
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1944
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op195 = load i32, i32* %op194
	lu12i.w $t0, -30
	ori $t0, $t0, 1944
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 1940
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op196 = sub i32 %op188, %op195
	lu12i.w $t0, -30
	ori $t0, $t0, 1976
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 1940
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	sub.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1936
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op196, i32* %op66
	lu12i.w $t0, -30
	ori $t0, $t0, 2528
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 1936
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# %op197 = load i32, i32* %op156
	lu12i.w $t0, -30
	ori $t0, $t0, 2112
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 1932
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op198 = add i32 %op197, 1
	lu12i.w $t0, -30
	ori $t0, $t0, 1932
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1928
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op198, i32* %op156
	lu12i.w $t0, -30
	ori $t0, $t0, 2112
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 1928
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# br label %label_ret56
	b .long_array_label_ret56
.long_array_label_a1_ltz52:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a1_gtz53
	b .long_array_label_a1_gtz53
.long_array_label_a1_gtz53:
# %op199 = getelementptr [10000 x i32], [10000 x i32]* %op2, i32 0, i32 %op181
	ld.d $t0, $fp, -48
	lu12i.w $t1, -30
	ori $t1, $t1, 2008
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1920
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op200 = load i32, i32* %op199
	lu12i.w $t0, -30
	ori $t0, $t0, 1920
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 1916
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op201 = add i32 %op180, %op200
	lu12i.w $t0, -30
	ori $t0, $t0, 2012
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 1916
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1912
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op202 = load i32, i32* %op156
	lu12i.w $t0, -30
	ori $t0, $t0, 2112
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 1908
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op203 = icmp slt i32 %op202, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 1908
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1907
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# %op204 = zext i1 %op203 to i32
	lu12i.w $t0, -30
	ori $t0, $t0, 1907
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.b $t0, $t0, 0
	andi $t1, $t0, 1
	lu12i.w $t8, -30
	ori $t8, $t8, 1900
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op205 = add i32 %op204, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 1900
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1896
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op206 = icmp ne i32 %op205, zeroinitializer
	lu12i.w $t0, -30
	ori $t0, $t0, 1896
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	lu12i.w $t8, -30
	ori $t8, $t8, 1895
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.b $t2, $t8, 0
# br i1 %op206, label %label_a3_ltz54, label %label_a3_gtz55
	lu12i.w $t0, -30
	ori $t0, $t0, 1895
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
	b .long_array_label_a3_gtz55
.long_array_label_a3_gtz55:
# %op207 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op202
	lu12i.w $t0, -20
	ori $t0, $t0, 1856
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 1908
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1880
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op208 = load i32, i32* %op207
	lu12i.w $t0, -30
	ori $t0, $t0, 1880
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 1876
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op209 = add i32 %op201, %op208
	lu12i.w $t0, -30
	ori $t0, $t0, 1912
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 1876
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1872
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op210 = sdiv i32 %op209, 13333
	lu12i.w $t0, -30
	ori $t0, $t0, 1872
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 3
	ori $t1, $t1, 1045
	div.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1868
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op211 = mul i32 %op210, 13333
	lu12i.w $t0, -30
	ori $t0, $t0, 1868
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 3
	ori $t1, $t1, 1045
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1864
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op212 = sub i32 %op209, %op211
	lu12i.w $t0, -30
	ori $t0, $t0, 1872
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 1864
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	sub.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1860
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op212, i32* %op66
	lu12i.w $t0, -30
	ori $t0, $t0, 2528
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 1860
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# %op213 = load i32, i32* %op156
	lu12i.w $t0, -30
	ori $t0, $t0, 2112
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 1856
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op214 = add i32 %op213, 2
	lu12i.w $t0, -30
	ori $t0, $t0, 1856
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1852
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op214, i32* %op156
	lu12i.w $t0, -30
	ori $t0, $t0, 2112
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 1852
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# br label %label_ret56
	b .long_array_label_ret56
.long_array_label_ret56:
# br label %label_condition43
	b .long_array_label_condition43
.long_array_label_a3_ltz57:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_a3_gtz58
	b .long_array_label_a3_gtz58
.long_array_label_a3_gtz58:
# %op215 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op158
	lu12i.w $t0, -20
	ori $t0, $t0, 1856
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 2100
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	addi.w $t2, $zero, 4
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1840
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.d $t0, $t8, 0
# %op216 = load i32, i32* %op215
	lu12i.w $t0, -30
	ori $t0, $t0, 1840
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 1836
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op217 = load i32, i32* %op1
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 1832
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op218 = mul i32 %op216, %op217
	lu12i.w $t0, -30
	ori $t0, $t0, 1836
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 1832
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1828
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op219 = add i32 %op157, %op218
	lu12i.w $t0, -30
	ori $t0, $t0, 2104
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 1828
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1824
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op220 = sdiv i32 %op219, 99988
	lu12i.w $t0, -30
	ori $t0, $t0, 1824
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 24
	ori $t1, $t1, 1684
	div.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1820
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op221 = mul i32 %op220, 99988
	lu12i.w $t0, -30
	ori $t0, $t0, 1820
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, 24
	ori $t1, $t1, 1684
	mul.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1816
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op222 = sub i32 %op219, %op221
	lu12i.w $t0, -30
	ori $t0, $t0, 1824
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 1816
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	sub.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1812
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op222, i32* %op66
	lu12i.w $t0, -30
	ori $t0, $t0, 2528
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 1812
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# br label %label_ret59
	b .long_array_label_ret59
.long_array_label_ret59:
# br label %label_ret60
	b .long_array_label_ret60
.long_array_label_ret60:
# br label %label_ret61
	b .long_array_label_ret61
.long_array_label_ret61:
# %op223 = load i32, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	ld.w $t1, $t0, 0
	lu12i.w $t8, -30
	ori $t8, $t8, 1808
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t1, $t8, 0
# %op224 = add i32 %op223, 1
	lu12i.w $t0, -30
	ori $t0, $t0, 1808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -30
	ori $t8, $t8, 1804
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# store i32 %op224, i32* %op5
	lu12i.w $t0, -30
	ori $t0, $t0, 2808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.d $t0, $t0, 0
	lu12i.w $t1, -30
	ori $t1, $t1, 1804
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	st.w $t1, $t0, 0
# br label %label_condition25
	b .long_array_label_condition25
.long_array_exit:
	lu12i.w $t0, 29
	ori $t0, $t0, 2304
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
	ld.w $a0, $fp, -20
	b .main_exit
.main_exit:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
