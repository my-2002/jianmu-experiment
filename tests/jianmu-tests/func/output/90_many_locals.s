	.text
	.globl foo
	.type foo, @function
foo:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -544
.foo_label_entry:
# %op0 = alloca [16 x i32]
	lu12i.w $t0, -1
	ori $t0, $t0, 4072
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -64
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -24
# store [16 x i32] [i32 0, i32 1, i32 2, i32 3, i32 0, i32 1, i32 2, i32 3, i32 0, i32 1, i32 2, i32 3, i32 0, i32 1, i32 2, i32 3], [16 x i32]* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op1 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -96
# store i32 3, i32* %op1
	ld.d $t0, $fp, -96
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op2 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3984
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -112
# store i32 7, i32* %op2
	ld.d $t0, $fp, -112
	addi.w $t1, $zero, 7
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op3 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3968
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -128
# store i32 5, i32* %op3
	ld.d $t0, $fp, -128
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op4 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3952
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -144
# store i32 6, i32* %op4
	ld.d $t0, $fp, -144
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op5 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3936
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -160
# store i32 1, i32* %op5
	ld.d $t0, $fp, -160
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op6 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3920
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -176
# store i32 0, i32* %op6
	ld.d $t0, $fp, -176
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op7 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3904
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -192
# store i32 3, i32* %op7
	ld.d $t0, $fp, -192
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op8 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3888
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -208
# store i32 5, i32* %op8
	ld.d $t0, $fp, -208
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op9 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3872
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -224
# store i32 4, i32* %op9
	ld.d $t0, $fp, -224
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op10 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3856
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -240
# store i32 2, i32* %op10
	ld.d $t0, $fp, -240
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op11 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3840
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -256
# store i32 7, i32* %op11
	ld.d $t0, $fp, -256
	addi.w $t1, $zero, 7
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op12 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3824
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -272
# store i32 9, i32* %op12
	ld.d $t0, $fp, -272
	addi.w $t1, $zero, 9
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op13 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -288
# store i32 8, i32* %op13
	ld.d $t0, $fp, -288
	addi.w $t1, $zero, 8
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op14 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3792
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -304
# store i32 1, i32* %op14
	ld.d $t0, $fp, -304
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op15 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3776
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -320
# store i32 4, i32* %op15
	ld.d $t0, $fp, -320
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op16 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3760
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -336
# store i32 6, i32* %op16
	ld.d $t0, $fp, -336
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op17 = load i32, i32* %op1
	ld.d $t0, $fp, -96
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -344
# %op18 = load i32, i32* %op2
	ld.d $t0, $fp, -112
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -348
# %op19 = add i32 %op17, %op18
	ld.w $t0, $fp, -344
	ld.w $t1, $fp, -348
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -352
# %op20 = load i32, i32* %op3
	ld.d $t0, $fp, -128
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -356
# %op21 = add i32 %op19, %op20
	ld.w $t0, $fp, -352
	ld.w $t1, $fp, -356
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -360
# %op22 = load i32, i32* %op4
	ld.d $t0, $fp, -144
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -364
# %op23 = add i32 %op21, %op22
	ld.w $t0, $fp, -360
	ld.w $t1, $fp, -364
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -368
# %op24 = load i32, i32* %op5
	ld.d $t0, $fp, -160
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -372
# %op25 = add i32 %op23, %op24
	ld.w $t0, $fp, -368
	ld.w $t1, $fp, -372
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -376
# %op26 = load i32, i32* %op6
	ld.d $t0, $fp, -176
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -380
# %op27 = add i32 %op25, %op26
	ld.w $t0, $fp, -376
	ld.w $t1, $fp, -380
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -384
# %op28 = load i32, i32* %op7
	ld.d $t0, $fp, -192
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -388
# %op29 = add i32 %op27, %op28
	ld.w $t0, $fp, -384
	ld.w $t1, $fp, -388
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -392
# %op30 = load i32, i32* %op8
	ld.d $t0, $fp, -208
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -396
# %op31 = add i32 %op29, %op30
	ld.w $t0, $fp, -392
	ld.w $t1, $fp, -396
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -400
# %op32 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3688
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -408
# store i32 %op31, i32* %op32
	ld.d $t0, $fp, -408
	ld.w $t1, $fp, -400
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op33 = load i32, i32* %op9
	ld.d $t0, $fp, -224
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -416
# %op34 = load i32, i32* %op10
	ld.d $t0, $fp, -240
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -420
# %op35 = add i32 %op33, %op34
	ld.w $t0, $fp, -416
	ld.w $t1, $fp, -420
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -424
# %op36 = load i32, i32* %op11
	ld.d $t0, $fp, -256
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -428
# %op37 = add i32 %op35, %op36
	ld.w $t0, $fp, -424
	ld.w $t1, $fp, -428
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -432
# %op38 = load i32, i32* %op12
	ld.d $t0, $fp, -272
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -436
# %op39 = add i32 %op37, %op38
	ld.w $t0, $fp, -432
	ld.w $t1, $fp, -436
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -440
# %op40 = load i32, i32* %op13
	ld.d $t0, $fp, -288
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -444
# %op41 = add i32 %op39, %op40
	ld.w $t0, $fp, -440
	ld.w $t1, $fp, -444
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -448
# %op42 = load i32, i32* %op14
	ld.d $t0, $fp, -304
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -452
# %op43 = add i32 %op41, %op42
	ld.w $t0, $fp, -448
	ld.w $t1, $fp, -452
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -456
# %op44 = load i32, i32* %op15
	ld.d $t0, $fp, -320
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -460
# %op45 = add i32 %op43, %op44
	ld.w $t0, $fp, -456
	ld.w $t1, $fp, -460
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -464
# %op46 = load i32, i32* %op16
	ld.d $t0, $fp, -336
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -468
# %op47 = add i32 %op45, %op46
	ld.w $t0, $fp, -464
	ld.w $t1, $fp, -468
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -472
# %op48 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3616
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -480
# store i32 %op47, i32* %op48
	ld.d $t0, $fp, -480
	ld.w $t1, $fp, -472
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op49 = load i32, i32* %op32
	ld.d $t0, $fp, -408
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -488
# %op50 = load i32, i32* %op48
	ld.d $t0, $fp, -480
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -492
# %op51 = add i32 %op49, %op50
	ld.w $t0, $fp, -488
	ld.w $t1, $fp, -492
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -496
# %op52 = load i32, i32* %op1
	ld.d $t0, $fp, -96
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -500
# %op53 = icmp slt i32 %op52, zeroinitializer
	ld.w $t0, $fp, -500
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -501
# %op54 = zext i1 %op53 to i32
	ld.b $t0, $fp, -501
	andi $t1, $t0, 1
	st.w $t1, $fp, -508
# %op55 = add i32 %op54, zeroinitializer
	ld.w $t0, $fp, -508
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -512
# %op56 = icmp ne i32 %op55, zeroinitializer
	ld.w $t0, $fp, -512
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	or $t2, $t2, $t3
	st.b $t2, $fp, -513
# br i1 %op56, label %label_arr_ltz0, label %label_arr_gtz1
# gen_phi
	ld.b $t0, $fp, -513
	bnez $t0, .foo_label_arr_ltz0
	b .foo_label_arr_gtz1
.foo_label_arr_ltz0:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_arr_gtz1
# gen_phi
	b .foo_label_arr_gtz1
.foo_label_arr_gtz1:
# %op57 = getelementptr [16 x i32], [16 x i32]* %op0, i32 0, i32 %op52
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 64
	addi.w $t1, $zero, 0
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	ld.w $t1, $fp, -500
	mul.w $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -528
# %op58 = load i32, i32* %op57
	ld.d $t0, $fp, -528
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -532
# %op59 = add i32 %op51, %op58
	ld.w $t0, $fp, -496
	ld.w $t1, $fp, -532
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -536
# ret i32 %op59
# gen_phi
	ld.w $a0, $fp, -536
	b .foo_exit
.foo_exit:
	addi.d $sp, $sp, 544
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -704
.main_label_entry:
# %op0 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4072
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -24
# store i32 3, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 3
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
# store i32 7, i32* %op1
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 7
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op2 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4040
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -56
# store i32 5, i32* %op2
	ld.d $t0, $fp, -56
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op3 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4024
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -72
# store i32 6, i32* %op3
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op4 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 4008
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -88
# store i32 1, i32* %op4
	ld.d $t0, $fp, -88
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op5 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3992
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -104
# store i32 0, i32* %op5
	ld.d $t0, $fp, -104
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op6 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3976
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -120
# store i32 3, i32* %op6
	ld.d $t0, $fp, -120
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op7 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3960
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -136
# store i32 5, i32* %op7
	ld.d $t0, $fp, -136
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op8 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3944
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -152
# store i32 4, i32* %op8
	ld.d $t0, $fp, -152
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op9 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3928
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -168
# store i32 2, i32* %op9
	ld.d $t0, $fp, -168
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op10 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3912
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -184
# store i32 7, i32* %op10
	ld.d $t0, $fp, -184
	addi.w $t1, $zero, 7
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op11 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3896
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -200
# store i32 9, i32* %op11
	ld.d $t0, $fp, -200
	addi.w $t1, $zero, 9
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op12 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3880
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -216
# store i32 8, i32* %op12
	ld.d $t0, $fp, -216
	addi.w $t1, $zero, 8
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op13 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3864
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -232
# store i32 1, i32* %op13
	ld.d $t0, $fp, -232
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op14 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3848
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -248
# store i32 4, i32* %op14
	ld.d $t0, $fp, -248
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op15 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3832
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -264
# store i32 6, i32* %op15
	ld.d $t0, $fp, -264
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op16 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -272
# %op17 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -276
# %op18 = add i32 %op16, %op17
	ld.w $t0, $fp, -272
	ld.w $t1, $fp, -276
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -280
# %op19 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -284
# %op20 = add i32 %op18, %op19
	ld.w $t0, $fp, -280
	ld.w $t1, $fp, -284
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -288
# %op21 = load i32, i32* %op3
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -292
# %op22 = add i32 %op20, %op21
	ld.w $t0, $fp, -288
	ld.w $t1, $fp, -292
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -296
# %op23 = load i32, i32* %op4
	ld.d $t0, $fp, -88
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -300
# %op24 = add i32 %op22, %op23
	ld.w $t0, $fp, -296
	ld.w $t1, $fp, -300
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -304
# %op25 = load i32, i32* %op5
	ld.d $t0, $fp, -104
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -308
# %op26 = add i32 %op24, %op25
	ld.w $t0, $fp, -304
	ld.w $t1, $fp, -308
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -312
# %op27 = load i32, i32* %op6
	ld.d $t0, $fp, -120
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -316
# %op28 = add i32 %op26, %op27
	ld.w $t0, $fp, -312
	ld.w $t1, $fp, -316
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -320
# %op29 = load i32, i32* %op7
	ld.d $t0, $fp, -136
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -324
# %op30 = add i32 %op28, %op29
	ld.w $t0, $fp, -320
	ld.w $t1, $fp, -324
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -328
# %op31 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3760
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -336
# store i32 %op30, i32* %op31
	ld.d $t0, $fp, -336
	ld.w $t1, $fp, -328
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op32 = load i32, i32* %op8
	ld.d $t0, $fp, -152
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -344
# %op33 = load i32, i32* %op9
	ld.d $t0, $fp, -168
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -348
# %op34 = add i32 %op32, %op33
	ld.w $t0, $fp, -344
	ld.w $t1, $fp, -348
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -352
# %op35 = load i32, i32* %op10
	ld.d $t0, $fp, -184
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -356
# %op36 = add i32 %op34, %op35
	ld.w $t0, $fp, -352
	ld.w $t1, $fp, -356
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -360
# %op37 = load i32, i32* %op11
	ld.d $t0, $fp, -200
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -364
# %op38 = add i32 %op36, %op37
	ld.w $t0, $fp, -360
	ld.w $t1, $fp, -364
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -368
# %op39 = load i32, i32* %op12
	ld.d $t0, $fp, -216
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -372
# %op40 = add i32 %op38, %op39
	ld.w $t0, $fp, -368
	ld.w $t1, $fp, -372
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -376
# %op41 = load i32, i32* %op13
	ld.d $t0, $fp, -232
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -380
# %op42 = add i32 %op40, %op41
	ld.w $t0, $fp, -376
	ld.w $t1, $fp, -380
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -384
# %op43 = load i32, i32* %op14
	ld.d $t0, $fp, -248
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -388
# %op44 = add i32 %op42, %op43
	ld.w $t0, $fp, -384
	ld.w $t1, $fp, -388
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -392
# %op45 = load i32, i32* %op15
	ld.d $t0, $fp, -264
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -396
# %op46 = add i32 %op44, %op45
	ld.w $t0, $fp, -392
	ld.w $t1, $fp, -396
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -400
# %op47 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3688
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -408
# store i32 %op46, i32* %op47
	ld.d $t0, $fp, -408
	ld.w $t1, $fp, -400
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op48 = load i32, i32* %op31
	ld.d $t0, $fp, -336
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -416
# %op49 = call i32 @foo()
	bl foo
	st.w $a0, $fp, -420
# %op50 = add i32 %op48, %op49
	ld.w $t0, $fp, -416
	ld.w $t1, $fp, -420
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -424
# store i32 %op50, i32* %op31
	ld.d $t0, $fp, -336
	ld.w $t1, $fp, -424
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op51 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3664
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -432
# store i32 4, i32* %op51
	ld.d $t0, $fp, -432
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op52 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3648
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -448
# store i32 7, i32* %op52
	ld.d $t0, $fp, -448
	addi.w $t1, $zero, 7
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op53 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3632
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -464
# store i32 2, i32* %op53
	ld.d $t0, $fp, -464
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op54 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3616
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -480
# store i32 5, i32* %op54
	ld.d $t0, $fp, -480
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op55 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3600
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -496
# store i32 8, i32* %op55
	ld.d $t0, $fp, -496
	addi.w $t1, $zero, 8
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op56 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3584
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -512
# store i32 0, i32* %op56
	ld.d $t0, $fp, -512
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op57 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3568
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -528
# store i32 6, i32* %op57
	ld.d $t0, $fp, -528
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op58 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3552
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -544
# store i32 3, i32* %op58
	ld.d $t0, $fp, -544
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op59 = load i32, i32* %op47
	ld.d $t0, $fp, -408
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -552
# %op60 = call i32 @foo()
	bl foo
	st.w $a0, $fp, -556
# %op61 = add i32 %op59, %op60
	ld.w $t0, $fp, -552
	ld.w $t1, $fp, -556
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -560
# store i32 %op61, i32* %op47
	ld.d $t0, $fp, -408
	ld.w $t1, $fp, -560
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op62 = load i32, i32* %op8
	ld.d $t0, $fp, -152
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -564
# store i32 %op62, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -564
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op63 = load i32, i32* %op9
	ld.d $t0, $fp, -168
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -568
# store i32 %op63, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -568
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op64 = load i32, i32* %op10
	ld.d $t0, $fp, -184
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -572
# store i32 %op64, i32* %op2
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -572
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op65 = load i32, i32* %op11
	ld.d $t0, $fp, -200
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -576
# store i32 %op65, i32* %op3
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -576
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op66 = load i32, i32* %op12
	ld.d $t0, $fp, -216
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -580
# store i32 %op66, i32* %op4
	ld.d $t0, $fp, -88
	ld.w $t1, $fp, -580
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op67 = load i32, i32* %op13
	ld.d $t0, $fp, -232
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -584
# store i32 %op67, i32* %op5
	ld.d $t0, $fp, -104
	ld.w $t1, $fp, -584
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op68 = load i32, i32* %op14
	ld.d $t0, $fp, -248
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -588
# store i32 %op68, i32* %op6
	ld.d $t0, $fp, -120
	ld.w $t1, $fp, -588
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op69 = load i32, i32* %op15
	ld.d $t0, $fp, -264
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -592
# store i32 %op69, i32* %op7
	ld.d $t0, $fp, -136
	ld.w $t1, $fp, -592
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op70 = load i32, i32* %op51
	ld.d $t0, $fp, -432
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -596
# %op71 = load i32, i32* %op52
	ld.d $t0, $fp, -448
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -600
# %op72 = add i32 %op70, %op71
	ld.w $t0, $fp, -596
	ld.w $t1, $fp, -600
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -604
# %op73 = load i32, i32* %op53
	ld.d $t0, $fp, -464
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -608
# %op74 = add i32 %op72, %op73
	ld.w $t0, $fp, -604
	ld.w $t1, $fp, -608
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -612
# %op75 = load i32, i32* %op54
	ld.d $t0, $fp, -480
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -616
# %op76 = add i32 %op74, %op75
	ld.w $t0, $fp, -612
	ld.w $t1, $fp, -616
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -620
# %op77 = load i32, i32* %op55
	ld.d $t0, $fp, -496
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -624
# %op78 = add i32 %op76, %op77
	ld.w $t0, $fp, -620
	ld.w $t1, $fp, -624
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -628
# %op79 = load i32, i32* %op56
	ld.d $t0, $fp, -512
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -632
# %op80 = add i32 %op78, %op79
	ld.w $t0, $fp, -628
	ld.w $t1, $fp, -632
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -636
# %op81 = load i32, i32* %op57
	ld.d $t0, $fp, -528
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -640
# %op82 = add i32 %op80, %op81
	ld.w $t0, $fp, -636
	ld.w $t1, $fp, -640
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -644
# %op83 = load i32, i32* %op58
	ld.d $t0, $fp, -544
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -648
# %op84 = add i32 %op82, %op83
	ld.w $t0, $fp, -644
	ld.w $t1, $fp, -648
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -652
# %op85 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3432
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -664
# store i32 %op84, i32* %op85
	ld.d $t0, $fp, -664
	ld.w $t1, $fp, -652
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op86 = load i32, i32* %op31
	ld.d $t0, $fp, -336
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -672
# %op87 = load i32, i32* %op47
	ld.d $t0, $fp, -408
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -676
# %op88 = add i32 %op86, %op87
	ld.w $t0, $fp, -672
	ld.w $t1, $fp, -676
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -680
# %op89 = load i32, i32* %op85
	ld.d $t0, $fp, -664
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -684
# %op90 = add i32 %op88, %op89
	ld.w $t0, $fp, -680
	ld.w $t1, $fp, -684
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -688
# %op91 = alloca i32
	lu12i.w $t0, -1
	ori $t0, $t0, 3400
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	addi.d $t0, $t0, -4
	add.d $t0, $fp, $t0
	st.d $t0, $fp, -696
# store i32 %op90, i32* %op91
	ld.d $t0, $fp, -696
	ld.w $t1, $fp, -688
	st.w $t1, $t0, 0
	addi.d $t0, $t0, 4
# %op92 = load i32, i32* %op91
	ld.d $t0, $fp, -696
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -704
# call void @putint(i32 %op92)
	ld.w $a0, $fp, -704
	bl putint
# call void @putch(i32 10)
	addi.w $a0, $zero, 10
	bl putch
# ret i32 0
# gen_phi
	addi.w $a0, $zero, 0
	b .main_exit
.main_exit:
	addi.d $sp, $sp, 704
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
