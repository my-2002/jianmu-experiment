	.text
	.globl main
	.type main, @function
main:
	lu12i.w $t0, 0
	ori $t0, $t0, 3216
	lu32i.d $t0, 0
	lu52i.d $t0, $t0, 0
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	sub.d $sp, $sp, $t0
	add.d $fp, $sp, $t0
.main_label_entry:
# %op0 = add i32 0, -2
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -20
# %op1 = add i32 0, %op0
	addi.w $t0, $zero, 0
	ld.w $t1, $fp, -20
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -24
# %op2 = add i32 2, 1
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -28
# %op3 = add i32 %op1, %op2
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -28
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -32
# %op4 = add i32 3, 2
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -36
# %op5 = add i32 %op3, %op4
	ld.w $t0, $fp, -32
	ld.w $t1, $fp, -36
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -40
# %op6 = add i32 2, -3
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -44
# %op7 = add i32 %op5, %op6
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -44
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -48
# %op8 = add i32 2, -2
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# %op9 = add i32 %op7, %op8
	ld.w $t0, $fp, -48
	ld.w $t1, $fp, -52
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -56
# %op10 = add i32 1, 2
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# %op11 = add i32 %op9, %op10
	ld.w $t0, $fp, -56
	ld.w $t1, $fp, -60
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -64
# %op12 = add i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -68
# %op13 = add i32 %op11, %op12
	ld.w $t0, $fp, -64
	ld.w $t1, $fp, -68
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -72
# %op14 = add i32 1, 3
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# %op15 = add i32 %op13, %op14
	ld.w $t0, $fp, -72
	ld.w $t1, $fp, -76
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -80
# %op16 = add i32 1, 2
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -84
# %op17 = add i32 %op15, %op16
	ld.w $t0, $fp, -80
	ld.w $t1, $fp, -84
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -88
# %op18 = add i32 1, -1
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -92
# %op19 = add i32 %op17, %op18
	ld.w $t0, $fp, -88
	ld.w $t1, $fp, -92
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -96
# %op20 = add i32 2, 1
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -100
# %op21 = add i32 %op19, %op20
	ld.w $t0, $fp, -96
	ld.w $t1, $fp, -100
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -104
# %op22 = add i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -108
# %op23 = add i32 %op21, %op22
	ld.w $t0, $fp, -104
	ld.w $t1, $fp, -108
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -112
# %op24 = add i32 4, 1
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# %op25 = add i32 %op23, %op24
	ld.w $t0, $fp, -112
	ld.w $t1, $fp, -116
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -120
# %op26 = add i32 3, -5
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -124
# %op27 = add i32 %op25, %op26
	ld.w $t0, $fp, -120
	ld.w $t1, $fp, -124
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -128
# %op28 = add i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -132
# %op29 = add i32 %op27, %op28
	ld.w $t0, $fp, -128
	ld.w $t1, $fp, -132
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -136
# %op30 = add i32 3, -5
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -140
# %op31 = add i32 %op29, %op30
	ld.w $t0, $fp, -136
	ld.w $t1, $fp, -140
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -144
# %op32 = add i32 0, 2
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -148
# %op33 = add i32 %op31, %op32
	ld.w $t0, $fp, -144
	ld.w $t1, $fp, -148
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -152
# %op34 = add i32 1, -5
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -156
# %op35 = add i32 %op33, %op34
	ld.w $t0, $fp, -152
	ld.w $t1, $fp, -156
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -160
# %op36 = add i32 4, 4
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -164
# %op37 = add i32 %op35, %op36
	ld.w $t0, $fp, -160
	ld.w $t1, $fp, -164
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -168
# %op38 = add i32 3, -1
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -172
# %op39 = add i32 %op37, %op38
	ld.w $t0, $fp, -168
	ld.w $t1, $fp, -172
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -176
# %op40 = add i32 4, 4
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -180
# %op41 = add i32 %op39, %op40
	ld.w $t0, $fp, -176
	ld.w $t1, $fp, -180
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -184
# %op42 = add i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -188
# %op43 = add i32 %op41, %op42
	ld.w $t0, $fp, -184
	ld.w $t1, $fp, -188
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -192
# %op44 = add i32 1, -1
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -196
# %op45 = add i32 %op43, %op44
	ld.w $t0, $fp, -192
	ld.w $t1, $fp, -196
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -200
# %op46 = add i32 0, -1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -204
# %op47 = add i32 %op45, %op46
	ld.w $t0, $fp, -200
	ld.w $t1, $fp, -204
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -208
# %op48 = add i32 1, 4
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -212
# %op49 = add i32 %op47, %op48
	ld.w $t0, $fp, -208
	ld.w $t1, $fp, -212
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -216
# %op50 = add i32 4, 4
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -220
# %op51 = add i32 %op49, %op50
	ld.w $t0, $fp, -216
	ld.w $t1, $fp, -220
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -224
# %op52 = add i32 0, -4
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -228
# %op53 = add i32 %op51, %op52
	ld.w $t0, $fp, -224
	ld.w $t1, $fp, -228
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -232
# %op54 = add i32 2, 4
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -236
# %op55 = add i32 %op53, %op54
	ld.w $t0, $fp, -232
	ld.w $t1, $fp, -236
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -240
# %op56 = add i32 4, -2
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -244
# %op57 = add i32 %op55, %op56
	ld.w $t0, $fp, -240
	ld.w $t1, $fp, -244
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -248
# %op58 = add i32 0, 4
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -252
# %op59 = add i32 %op57, %op58
	ld.w $t0, $fp, -248
	ld.w $t1, $fp, -252
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -256
# %op60 = add i32 3, -5
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -260
# %op61 = add i32 %op59, %op60
	ld.w $t0, $fp, -256
	ld.w $t1, $fp, -260
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -264
# %op62 = add i32 0, -5
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -268
# %op63 = add i32 %op61, %op62
	ld.w $t0, $fp, -264
	ld.w $t1, $fp, -268
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -272
# %op64 = add i32 4, 1
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -276
# %op65 = add i32 %op63, %op64
	ld.w $t0, $fp, -272
	ld.w $t1, $fp, -276
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -280
# %op66 = add i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -284
# %op67 = add i32 %op65, %op66
	ld.w $t0, $fp, -280
	ld.w $t1, $fp, -284
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -288
# %op68 = add i32 2, -1
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -292
# %op69 = add i32 %op67, %op68
	ld.w $t0, $fp, -288
	ld.w $t1, $fp, -292
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -296
# %op70 = add i32 4, -4
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -300
# %op71 = add i32 %op69, %op70
	ld.w $t0, $fp, -296
	ld.w $t1, $fp, -300
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -304
# %op72 = add i32 0, -4
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -308
# %op73 = add i32 %op71, %op72
	ld.w $t0, $fp, -304
	ld.w $t1, $fp, -308
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -312
# %op74 = add i32 4, -3
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -316
# %op75 = add i32 %op73, %op74
	ld.w $t0, $fp, -312
	ld.w $t1, $fp, -316
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -320
# %op76 = add i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -324
# %op77 = add i32 %op75, %op76
	ld.w $t0, $fp, -320
	ld.w $t1, $fp, -324
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -328
# %op78 = add i32 1, 4
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -332
# %op79 = add i32 %op77, %op78
	ld.w $t0, $fp, -328
	ld.w $t1, $fp, -332
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -336
# %op80 = add i32 0, 2
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -340
# %op81 = add i32 %op79, %op80
	ld.w $t0, $fp, -336
	ld.w $t1, $fp, -340
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -344
# %op82 = add i32 0, -5
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -348
# %op83 = add i32 %op81, %op82
	ld.w $t0, $fp, -344
	ld.w $t1, $fp, -348
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -352
# %op84 = add i32 0, 2
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -356
# %op85 = add i32 %op83, %op84
	ld.w $t0, $fp, -352
	ld.w $t1, $fp, -356
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -360
# %op86 = add i32 2, -5
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -364
# %op87 = add i32 %op85, %op86
	ld.w $t0, $fp, -360
	ld.w $t1, $fp, -364
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -368
# %op88 = add i32 2, -1
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -372
# %op89 = add i32 %op87, %op88
	ld.w $t0, $fp, -368
	ld.w $t1, $fp, -372
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -376
# %op90 = add i32 4, -5
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -380
# %op91 = add i32 %op89, %op90
	ld.w $t0, $fp, -376
	ld.w $t1, $fp, -380
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -384
# %op92 = add i32 1, -4
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -388
# %op93 = add i32 %op91, %op92
	ld.w $t0, $fp, -384
	ld.w $t1, $fp, -388
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -392
# %op94 = add i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -396
# %op95 = add i32 %op93, %op94
	ld.w $t0, $fp, -392
	ld.w $t1, $fp, -396
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -400
# %op96 = add i32 0, -1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -404
# %op97 = add i32 %op95, %op96
	ld.w $t0, $fp, -400
	ld.w $t1, $fp, -404
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -408
# %op98 = add i32 0, 2
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -412
# %op99 = add i32 %op97, %op98
	ld.w $t0, $fp, -408
	ld.w $t1, $fp, -412
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -416
# %op100 = add i32 3, -5
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -420
# %op101 = add i32 %op99, %op100
	ld.w $t0, $fp, -416
	ld.w $t1, $fp, -420
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -424
# %op102 = add i32 1, -2
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -428
# %op103 = add i32 %op101, %op102
	ld.w $t0, $fp, -424
	ld.w $t1, $fp, -428
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -432
# %op104 = add i32 3, -3
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -436
# %op105 = add i32 %op103, %op104
	ld.w $t0, $fp, -432
	ld.w $t1, $fp, -436
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -440
# %op106 = add i32 2, -5
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -444
# %op107 = add i32 %op105, %op106
	ld.w $t0, $fp, -440
	ld.w $t1, $fp, -444
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -448
# %op108 = add i32 3, 1
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -452
# %op109 = add i32 %op107, %op108
	ld.w $t0, $fp, -448
	ld.w $t1, $fp, -452
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -456
# %op110 = add i32 4, 1
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -460
# %op111 = add i32 %op109, %op110
	ld.w $t0, $fp, -456
	ld.w $t1, $fp, -460
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -464
# %op112 = add i32 0, -4
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -468
# %op113 = add i32 %op111, %op112
	ld.w $t0, $fp, -464
	ld.w $t1, $fp, -468
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -472
# %op114 = add i32 1, 1
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -476
# %op115 = add i32 %op113, %op114
	ld.w $t0, $fp, -472
	ld.w $t1, $fp, -476
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -480
# %op116 = add i32 1, -5
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -484
# %op117 = add i32 %op115, %op116
	ld.w $t0, $fp, -480
	ld.w $t1, $fp, -484
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -488
# %op118 = add i32 1, -2
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -492
# %op119 = add i32 %op117, %op118
	ld.w $t0, $fp, -488
	ld.w $t1, $fp, -492
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -496
# %op120 = add i32 4, 2
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -500
# %op121 = add i32 %op119, %op120
	ld.w $t0, $fp, -496
	ld.w $t1, $fp, -500
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -504
# %op122 = add i32 4, -5
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -508
# %op123 = add i32 %op121, %op122
	ld.w $t0, $fp, -504
	ld.w $t1, $fp, -508
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -512
# %op124 = add i32 1, 2
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -516
# %op125 = add i32 %op123, %op124
	ld.w $t0, $fp, -512
	ld.w $t1, $fp, -516
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -520
# %op126 = add i32 2, -4
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -524
# %op127 = add i32 %op125, %op126
	ld.w $t0, $fp, -520
	ld.w $t1, $fp, -524
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -528
# %op128 = add i32 1, 3
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -532
# %op129 = add i32 %op127, %op128
	ld.w $t0, $fp, -528
	ld.w $t1, $fp, -532
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -536
# %op130 = add i32 0, -4
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -540
# %op131 = add i32 %op129, %op130
	ld.w $t0, $fp, -536
	ld.w $t1, $fp, -540
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -544
# %op132 = add i32 0, -2
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -548
# %op133 = add i32 %op131, %op132
	ld.w $t0, $fp, -544
	ld.w $t1, $fp, -548
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -552
# %op134 = add i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -556
# %op135 = add i32 %op133, %op134
	ld.w $t0, $fp, -552
	ld.w $t1, $fp, -556
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -560
# %op136 = add i32 0, -1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -564
# %op137 = add i32 %op135, %op136
	ld.w $t0, $fp, -560
	ld.w $t1, $fp, -564
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -568
# %op138 = add i32 0, -1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -572
# %op139 = add i32 %op137, %op138
	ld.w $t0, $fp, -568
	ld.w $t1, $fp, -572
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -576
# %op140 = add i32 2, 2
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -580
# %op141 = add i32 %op139, %op140
	ld.w $t0, $fp, -576
	ld.w $t1, $fp, -580
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -584
# %op142 = add i32 2, 2
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -588
# %op143 = add i32 %op141, %op142
	ld.w $t0, $fp, -584
	ld.w $t1, $fp, -588
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -592
# %op144 = add i32 3, -5
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -596
# %op145 = add i32 %op143, %op144
	ld.w $t0, $fp, -592
	ld.w $t1, $fp, -596
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -600
# %op146 = add i32 3, 4
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -604
# %op147 = add i32 %op145, %op146
	ld.w $t0, $fp, -600
	ld.w $t1, $fp, -604
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -608
# %op148 = add i32 1, -4
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -612
# %op149 = add i32 %op147, %op148
	ld.w $t0, $fp, -608
	ld.w $t1, $fp, -612
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -616
# %op150 = add i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -620
# %op151 = add i32 %op149, %op150
	ld.w $t0, $fp, -616
	ld.w $t1, $fp, -620
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -624
# %op152 = add i32 1, 4
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -628
# %op153 = add i32 %op151, %op152
	ld.w $t0, $fp, -624
	ld.w $t1, $fp, -628
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -632
# %op154 = add i32 3, -3
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -636
# %op155 = add i32 %op153, %op154
	ld.w $t0, $fp, -632
	ld.w $t1, $fp, -636
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -640
# %op156 = add i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -644
# %op157 = add i32 %op155, %op156
	ld.w $t0, $fp, -640
	ld.w $t1, $fp, -644
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -648
# %op158 = add i32 3, 4
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -652
# %op159 = add i32 %op157, %op158
	ld.w $t0, $fp, -648
	ld.w $t1, $fp, -652
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -656
# %op160 = add i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -660
# %op161 = add i32 %op159, %op160
	ld.w $t0, $fp, -656
	ld.w $t1, $fp, -660
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -664
# %op162 = add i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -668
# %op163 = add i32 %op161, %op162
	ld.w $t0, $fp, -664
	ld.w $t1, $fp, -668
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -672
# %op164 = add i32 4, 3
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -676
# %op165 = add i32 %op163, %op164
	ld.w $t0, $fp, -672
	ld.w $t1, $fp, -676
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -680
# %op166 = add i32 0, -1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -684
# %op167 = add i32 %op165, %op166
	ld.w $t0, $fp, -680
	ld.w $t1, $fp, -684
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -688
# %op168 = add i32 4, 3
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -692
# %op169 = add i32 %op167, %op168
	ld.w $t0, $fp, -688
	ld.w $t1, $fp, -692
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -696
# %op170 = add i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -700
# %op171 = add i32 %op169, %op170
	ld.w $t0, $fp, -696
	ld.w $t1, $fp, -700
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -704
# %op172 = add i32 0, -3
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -708
# %op173 = add i32 %op171, %op172
	ld.w $t0, $fp, -704
	ld.w $t1, $fp, -708
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -712
# %op174 = add i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -716
# %op175 = add i32 %op173, %op174
	ld.w $t0, $fp, -712
	ld.w $t1, $fp, -716
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -720
# %op176 = add i32 3, 4
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -724
# %op177 = add i32 %op175, %op176
	ld.w $t0, $fp, -720
	ld.w $t1, $fp, -724
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -728
# %op178 = add i32 2, 1
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -732
# %op179 = add i32 %op177, %op178
	ld.w $t0, $fp, -728
	ld.w $t1, $fp, -732
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -736
# %op180 = add i32 3, -5
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -740
# %op181 = add i32 %op179, %op180
	ld.w $t0, $fp, -736
	ld.w $t1, $fp, -740
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -744
# %op182 = add i32 1, -1
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -748
# %op183 = add i32 %op181, %op182
	ld.w $t0, $fp, -744
	ld.w $t1, $fp, -748
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -752
# %op184 = add i32 1, -4
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -756
# %op185 = add i32 %op183, %op184
	ld.w $t0, $fp, -752
	ld.w $t1, $fp, -756
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -760
# %op186 = add i32 1, 4
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -764
# %op187 = add i32 %op185, %op186
	ld.w $t0, $fp, -760
	ld.w $t1, $fp, -764
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -768
# %op188 = add i32 2, -4
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -772
# %op189 = add i32 %op187, %op188
	ld.w $t0, $fp, -768
	ld.w $t1, $fp, -772
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -776
# %op190 = add i32 0, -1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -780
# %op191 = add i32 %op189, %op190
	ld.w $t0, $fp, -776
	ld.w $t1, $fp, -780
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -784
# %op192 = add i32 1, -3
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -788
# %op193 = add i32 %op191, %op192
	ld.w $t0, $fp, -784
	ld.w $t1, $fp, -788
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -792
# %op194 = add i32 0, 2
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -796
# %op195 = add i32 %op193, %op194
	ld.w $t0, $fp, -792
	ld.w $t1, $fp, -796
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -800
# %op196 = add i32 0, -3
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -804
# %op197 = add i32 %op195, %op196
	ld.w $t0, $fp, -800
	ld.w $t1, $fp, -804
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -808
# %op198 = add i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -812
# %op199 = add i32 %op197, %op198
	ld.w $t0, $fp, -808
	ld.w $t1, $fp, -812
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -816
# %op200 = add i32 2, -1
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -820
# %op201 = add i32 %op199, %op200
	ld.w $t0, $fp, -816
	ld.w $t1, $fp, -820
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -824
# %op202 = add i32 3, 4
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -828
# %op203 = add i32 %op201, %op202
	ld.w $t0, $fp, -824
	ld.w $t1, $fp, -828
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -832
# %op204 = add i32 4, 4
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -836
# %op205 = add i32 %op203, %op204
	ld.w $t0, $fp, -832
	ld.w $t1, $fp, -836
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -840
# %op206 = add i32 0, -1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -844
# %op207 = add i32 %op205, %op206
	ld.w $t0, $fp, -840
	ld.w $t1, $fp, -844
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -848
# %op208 = add i32 1, -3
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -852
# %op209 = add i32 %op207, %op208
	ld.w $t0, $fp, -848
	ld.w $t1, $fp, -852
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -856
# %op210 = add i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -860
# %op211 = add i32 %op209, %op210
	ld.w $t0, $fp, -856
	ld.w $t1, $fp, -860
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -864
# %op212 = add i32 4, -2
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -868
# %op213 = add i32 %op211, %op212
	ld.w $t0, $fp, -864
	ld.w $t1, $fp, -868
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -872
# %op214 = add i32 0, 2
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -876
# %op215 = add i32 %op213, %op214
	ld.w $t0, $fp, -872
	ld.w $t1, $fp, -876
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -880
# %op216 = add i32 2, 3
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -884
# %op217 = add i32 %op215, %op216
	ld.w $t0, $fp, -880
	ld.w $t1, $fp, -884
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -888
# %op218 = add i32 1, -1
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -892
# %op219 = add i32 %op217, %op218
	ld.w $t0, $fp, -888
	ld.w $t1, $fp, -892
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -896
# %op220 = add i32 1, 1
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -900
# %op221 = add i32 %op219, %op220
	ld.w $t0, $fp, -896
	ld.w $t1, $fp, -900
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -904
# %op222 = add i32 0, 4
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -908
# %op223 = add i32 %op221, %op222
	ld.w $t0, $fp, -904
	ld.w $t1, $fp, -908
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -912
# %op224 = add i32 3, -5
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -916
# %op225 = add i32 %op223, %op224
	ld.w $t0, $fp, -912
	ld.w $t1, $fp, -916
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -920
# %op226 = add i32 2, -5
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -924
# %op227 = add i32 %op225, %op226
	ld.w $t0, $fp, -920
	ld.w $t1, $fp, -924
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -928
# %op228 = add i32 0, -4
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -932
# %op229 = add i32 %op227, %op228
	ld.w $t0, $fp, -928
	ld.w $t1, $fp, -932
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -936
# %op230 = add i32 2, 2
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -940
# %op231 = add i32 %op229, %op230
	ld.w $t0, $fp, -936
	ld.w $t1, $fp, -940
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -944
# %op232 = add i32 2, -2
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -948
# %op233 = add i32 %op231, %op232
	ld.w $t0, $fp, -944
	ld.w $t1, $fp, -948
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -952
# %op234 = add i32 4, 3
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -956
# %op235 = add i32 %op233, %op234
	ld.w $t0, $fp, -952
	ld.w $t1, $fp, -956
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -960
# %op236 = add i32 2, -1
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -964
# %op237 = add i32 %op235, %op236
	ld.w $t0, $fp, -960
	ld.w $t1, $fp, -964
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -968
# %op238 = add i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -972
# %op239 = add i32 %op237, %op238
	ld.w $t0, $fp, -968
	ld.w $t1, $fp, -972
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -976
# %op240 = add i32 3, -1
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -980
# %op241 = add i32 %op239, %op240
	ld.w $t0, $fp, -976
	ld.w $t1, $fp, -980
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -984
# %op242 = add i32 1, -1
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -988
# %op243 = add i32 %op241, %op242
	ld.w $t0, $fp, -984
	ld.w $t1, $fp, -988
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -992
# %op244 = add i32 0, -2
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -996
# %op245 = add i32 %op243, %op244
	ld.w $t0, $fp, -992
	ld.w $t1, $fp, -996
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1000
# %op246 = add i32 1, 2
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1004
# %op247 = add i32 %op245, %op246
	ld.w $t0, $fp, -1000
	ld.w $t1, $fp, -1004
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1008
# %op248 = add i32 1, 4
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1012
# %op249 = add i32 %op247, %op248
	ld.w $t0, $fp, -1008
	ld.w $t1, $fp, -1012
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1016
# %op250 = add i32 3, -1
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1020
# %op251 = add i32 %op249, %op250
	ld.w $t0, $fp, -1016
	ld.w $t1, $fp, -1020
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1024
# %op252 = add i32 2, -2
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1028
# %op253 = add i32 %op251, %op252
	ld.w $t0, $fp, -1024
	ld.w $t1, $fp, -1028
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1032
# %op254 = add i32 4, 2
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1036
# %op255 = add i32 %op253, %op254
	ld.w $t0, $fp, -1032
	ld.w $t1, $fp, -1036
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1040
# %op256 = add i32 1, -2
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1044
# %op257 = add i32 %op255, %op256
	ld.w $t0, $fp, -1040
	ld.w $t1, $fp, -1044
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1048
# %op258 = add i32 2, -2
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1052
# %op259 = add i32 %op257, %op258
	ld.w $t0, $fp, -1048
	ld.w $t1, $fp, -1052
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1056
# %op260 = add i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1060
# %op261 = add i32 %op259, %op260
	ld.w $t0, $fp, -1056
	ld.w $t1, $fp, -1060
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1064
# %op262 = add i32 2, -2
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1068
# %op263 = add i32 %op261, %op262
	ld.w $t0, $fp, -1064
	ld.w $t1, $fp, -1068
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1072
# %op264 = add i32 0, -4
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1076
# %op265 = add i32 %op263, %op264
	ld.w $t0, $fp, -1072
	ld.w $t1, $fp, -1076
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1080
# %op266 = add i32 2, -3
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1084
# %op267 = add i32 %op265, %op266
	ld.w $t0, $fp, -1080
	ld.w $t1, $fp, -1084
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1088
# %op268 = add i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1092
# %op269 = add i32 %op267, %op268
	ld.w $t0, $fp, -1088
	ld.w $t1, $fp, -1092
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1096
# %op270 = add i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1100
# %op271 = add i32 %op269, %op270
	ld.w $t0, $fp, -1096
	ld.w $t1, $fp, -1100
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1104
# %op272 = add i32 1, -2
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1108
# %op273 = add i32 %op271, %op272
	ld.w $t0, $fp, -1104
	ld.w $t1, $fp, -1108
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1112
# %op274 = add i32 4, -2
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1116
# %op275 = add i32 %op273, %op274
	ld.w $t0, $fp, -1112
	ld.w $t1, $fp, -1116
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1120
# %op276 = add i32 2, -3
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1124
# %op277 = add i32 %op275, %op276
	ld.w $t0, $fp, -1120
	ld.w $t1, $fp, -1124
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1128
# %op278 = add i32 0, -5
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1132
# %op279 = add i32 %op277, %op278
	ld.w $t0, $fp, -1128
	ld.w $t1, $fp, -1132
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1136
# %op280 = add i32 1, -2
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1140
# %op281 = add i32 %op279, %op280
	ld.w $t0, $fp, -1136
	ld.w $t1, $fp, -1140
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1144
# %op282 = add i32 0, 3
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1148
# %op283 = add i32 %op281, %op282
	ld.w $t0, $fp, -1144
	ld.w $t1, $fp, -1148
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1152
# %op284 = add i32 3, -4
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1156
# %op285 = add i32 %op283, %op284
	ld.w $t0, $fp, -1152
	ld.w $t1, $fp, -1156
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1160
# %op286 = add i32 0, -1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1164
# %op287 = add i32 %op285, %op286
	ld.w $t0, $fp, -1160
	ld.w $t1, $fp, -1164
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1168
# %op288 = add i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1172
# %op289 = add i32 %op287, %op288
	ld.w $t0, $fp, -1168
	ld.w $t1, $fp, -1172
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1176
# %op290 = add i32 4, 3
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1180
# %op291 = add i32 %op289, %op290
	ld.w $t0, $fp, -1176
	ld.w $t1, $fp, -1180
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1184
# %op292 = add i32 2, -3
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1188
# %op293 = add i32 %op291, %op292
	ld.w $t0, $fp, -1184
	ld.w $t1, $fp, -1188
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1192
# %op294 = add i32 3, -3
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1196
# %op295 = add i32 %op293, %op294
	ld.w $t0, $fp, -1192
	ld.w $t1, $fp, -1196
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1200
# %op296 = add i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1204
# %op297 = add i32 %op295, %op296
	ld.w $t0, $fp, -1200
	ld.w $t1, $fp, -1204
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1208
# %op298 = add i32 1, -4
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1212
# %op299 = add i32 %op297, %op298
	ld.w $t0, $fp, -1208
	ld.w $t1, $fp, -1212
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1216
# %op300 = add i32 2, 1
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1220
# %op301 = add i32 %op299, %op300
	ld.w $t0, $fp, -1216
	ld.w $t1, $fp, -1220
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1224
# %op302 = add i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1228
# %op303 = add i32 %op301, %op302
	ld.w $t0, $fp, -1224
	ld.w $t1, $fp, -1228
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1232
# %op304 = add i32 2, 3
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1236
# %op305 = add i32 %op303, %op304
	ld.w $t0, $fp, -1232
	ld.w $t1, $fp, -1236
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1240
# %op306 = add i32 3, 4
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1244
# %op307 = add i32 %op305, %op306
	ld.w $t0, $fp, -1240
	ld.w $t1, $fp, -1244
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1248
# %op308 = add i32 0, 3
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1252
# %op309 = add i32 %op307, %op308
	ld.w $t0, $fp, -1248
	ld.w $t1, $fp, -1252
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1256
# %op310 = add i32 1, -1
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1260
# %op311 = add i32 %op309, %op310
	ld.w $t0, $fp, -1256
	ld.w $t1, $fp, -1260
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1264
# %op312 = add i32 3, 3
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1268
# %op313 = add i32 %op311, %op312
	ld.w $t0, $fp, -1264
	ld.w $t1, $fp, -1268
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1272
# %op314 = add i32 4, -2
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1276
# %op315 = add i32 %op313, %op314
	ld.w $t0, $fp, -1272
	ld.w $t1, $fp, -1276
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1280
# %op316 = add i32 4, -5
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1284
# %op317 = add i32 %op315, %op316
	ld.w $t0, $fp, -1280
	ld.w $t1, $fp, -1284
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1288
# %op318 = add i32 0, -2
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1292
# %op319 = add i32 %op317, %op318
	ld.w $t0, $fp, -1288
	ld.w $t1, $fp, -1292
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1296
# %op320 = add i32 2, 4
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1300
# %op321 = add i32 %op319, %op320
	ld.w $t0, $fp, -1296
	ld.w $t1, $fp, -1300
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1304
# %op322 = add i32 3, 4
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1308
# %op323 = add i32 %op321, %op322
	ld.w $t0, $fp, -1304
	ld.w $t1, $fp, -1308
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1312
# %op324 = add i32 1, 2
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1316
# %op325 = add i32 %op323, %op324
	ld.w $t0, $fp, -1312
	ld.w $t1, $fp, -1316
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1320
# %op326 = add i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1324
# %op327 = add i32 %op325, %op326
	ld.w $t0, $fp, -1320
	ld.w $t1, $fp, -1324
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1328
# %op328 = add i32 2, 2
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1332
# %op329 = add i32 %op327, %op328
	ld.w $t0, $fp, -1328
	ld.w $t1, $fp, -1332
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1336
# %op330 = add i32 3, 1
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1340
# %op331 = add i32 %op329, %op330
	ld.w $t0, $fp, -1336
	ld.w $t1, $fp, -1340
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1344
# %op332 = add i32 1, -1
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1348
# %op333 = add i32 %op331, %op332
	ld.w $t0, $fp, -1344
	ld.w $t1, $fp, -1348
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1352
# %op334 = add i32 1, 3
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1356
# %op335 = add i32 %op333, %op334
	ld.w $t0, $fp, -1352
	ld.w $t1, $fp, -1356
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1360
# %op336 = add i32 4, 4
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1364
# %op337 = add i32 %op335, %op336
	ld.w $t0, $fp, -1360
	ld.w $t1, $fp, -1364
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1368
# %op338 = add i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1372
# %op339 = add i32 %op337, %op338
	ld.w $t0, $fp, -1368
	ld.w $t1, $fp, -1372
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1376
# %op340 = add i32 4, -5
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1380
# %op341 = add i32 %op339, %op340
	ld.w $t0, $fp, -1376
	ld.w $t1, $fp, -1380
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1384
# %op342 = add i32 1, -1
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1388
# %op343 = add i32 %op341, %op342
	ld.w $t0, $fp, -1384
	ld.w $t1, $fp, -1388
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1392
# %op344 = add i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1396
# %op345 = add i32 %op343, %op344
	ld.w $t0, $fp, -1392
	ld.w $t1, $fp, -1396
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1400
# %op346 = add i32 3, -5
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1404
# %op347 = add i32 %op345, %op346
	ld.w $t0, $fp, -1400
	ld.w $t1, $fp, -1404
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1408
# %op348 = add i32 2, 3
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1412
# %op349 = add i32 %op347, %op348
	ld.w $t0, $fp, -1408
	ld.w $t1, $fp, -1412
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1416
# %op350 = add i32 4, -1
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1420
# %op351 = add i32 %op349, %op350
	ld.w $t0, $fp, -1416
	ld.w $t1, $fp, -1420
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1424
# %op352 = add i32 2, 4
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1428
# %op353 = add i32 %op351, %op352
	ld.w $t0, $fp, -1424
	ld.w $t1, $fp, -1428
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1432
# %op354 = add i32 3, -4
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1436
# %op355 = add i32 %op353, %op354
	ld.w $t0, $fp, -1432
	ld.w $t1, $fp, -1436
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1440
# %op356 = add i32 1, 1
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1444
# %op357 = add i32 %op355, %op356
	ld.w $t0, $fp, -1440
	ld.w $t1, $fp, -1444
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1448
# %op358 = add i32 3, -4
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1452
# %op359 = add i32 %op357, %op358
	ld.w $t0, $fp, -1448
	ld.w $t1, $fp, -1452
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1456
# %op360 = add i32 1, 1
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1460
# %op361 = add i32 %op359, %op360
	ld.w $t0, $fp, -1456
	ld.w $t1, $fp, -1460
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1464
# %op362 = add i32 4, -3
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1468
# %op363 = add i32 %op361, %op362
	ld.w $t0, $fp, -1464
	ld.w $t1, $fp, -1468
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1472
# %op364 = add i32 0, -2
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1476
# %op365 = add i32 %op363, %op364
	ld.w $t0, $fp, -1472
	ld.w $t1, $fp, -1476
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1480
# %op366 = add i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1484
# %op367 = add i32 %op365, %op366
	ld.w $t0, $fp, -1480
	ld.w $t1, $fp, -1484
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1488
# %op368 = add i32 2, -4
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1492
# %op369 = add i32 %op367, %op368
	ld.w $t0, $fp, -1488
	ld.w $t1, $fp, -1492
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1496
# %op370 = add i32 2, -1
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1500
# %op371 = add i32 %op369, %op370
	ld.w $t0, $fp, -1496
	ld.w $t1, $fp, -1500
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1504
# %op372 = add i32 3, -2
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1508
# %op373 = add i32 %op371, %op372
	ld.w $t0, $fp, -1504
	ld.w $t1, $fp, -1508
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1512
# %op374 = add i32 3, -1
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1516
# %op375 = add i32 %op373, %op374
	ld.w $t0, $fp, -1512
	ld.w $t1, $fp, -1516
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1520
# %op376 = add i32 0, 3
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1524
# %op377 = add i32 %op375, %op376
	ld.w $t0, $fp, -1520
	ld.w $t1, $fp, -1524
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1528
# %op378 = add i32 0, 3
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1532
# %op379 = add i32 %op377, %op378
	ld.w $t0, $fp, -1528
	ld.w $t1, $fp, -1532
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1536
# %op380 = add i32 1, -4
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1540
# %op381 = add i32 %op379, %op380
	ld.w $t0, $fp, -1536
	ld.w $t1, $fp, -1540
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1544
# %op382 = add i32 4, 1
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1548
# %op383 = add i32 %op381, %op382
	ld.w $t0, $fp, -1544
	ld.w $t1, $fp, -1548
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1552
# %op384 = add i32 2, -5
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1556
# %op385 = add i32 %op383, %op384
	ld.w $t0, $fp, -1552
	ld.w $t1, $fp, -1556
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1560
# %op386 = add i32 4, -4
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1564
# %op387 = add i32 %op385, %op386
	ld.w $t0, $fp, -1560
	ld.w $t1, $fp, -1564
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1568
# %op388 = add i32 1, 2
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1572
# %op389 = add i32 %op387, %op388
	ld.w $t0, $fp, -1568
	ld.w $t1, $fp, -1572
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1576
# %op390 = add i32 2, -3
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1580
# %op391 = add i32 %op389, %op390
	ld.w $t0, $fp, -1576
	ld.w $t1, $fp, -1580
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1584
# %op392 = add i32 3, -2
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1588
# %op393 = add i32 %op391, %op392
	ld.w $t0, $fp, -1584
	ld.w $t1, $fp, -1588
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1592
# %op394 = add i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1596
# %op395 = add i32 %op393, %op394
	ld.w $t0, $fp, -1592
	ld.w $t1, $fp, -1596
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1600
# %op396 = add i32 1, 3
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1604
# %op397 = add i32 %op395, %op396
	ld.w $t0, $fp, -1600
	ld.w $t1, $fp, -1604
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1608
# %op398 = add i32 2, -4
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1612
# %op399 = add i32 %op397, %op398
	ld.w $t0, $fp, -1608
	ld.w $t1, $fp, -1612
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1616
# %op400 = add i32 %op398, -4
	ld.w $t0, $fp, -1612
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1620
# %op401 = add i32 %op399, %op400
	ld.w $t0, $fp, -1616
	ld.w $t1, $fp, -1620
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1624
# %op402 = add i32 %op396, 1
	ld.w $t0, $fp, -1604
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1628
# %op403 = add i32 %op401, %op402
	ld.w $t0, $fp, -1624
	ld.w $t1, $fp, -1628
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1632
# %op404 = add i32 %op394, 2
	ld.w $t0, $fp, -1596
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1636
# %op405 = add i32 %op403, %op404
	ld.w $t0, $fp, -1632
	ld.w $t1, $fp, -1636
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1640
# %op406 = add i32 %op392, 0
	ld.w $t0, $fp, -1588
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1644
# %op407 = add i32 %op405, %op406
	ld.w $t0, $fp, -1640
	ld.w $t1, $fp, -1644
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1648
# %op408 = add i32 %op390, 4
	ld.w $t0, $fp, -1580
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1652
# %op409 = add i32 %op407, %op408
	ld.w $t0, $fp, -1648
	ld.w $t1, $fp, -1652
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1656
# %op410 = add i32 %op388, 0
	ld.w $t0, $fp, -1572
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1660
# %op411 = add i32 %op409, %op410
	ld.w $t0, $fp, -1656
	ld.w $t1, $fp, -1660
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1664
# %op412 = add i32 %op386, -4
	ld.w $t0, $fp, -1564
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1668
# %op413 = add i32 %op411, %op412
	ld.w $t0, $fp, -1664
	ld.w $t1, $fp, -1668
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1672
# %op414 = add i32 %op384, -3
	ld.w $t0, $fp, -1556
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1676
# %op415 = add i32 %op413, %op414
	ld.w $t0, $fp, -1672
	ld.w $t1, $fp, -1676
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1680
# %op416 = add i32 %op382, 1
	ld.w $t0, $fp, -1548
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1684
# %op417 = add i32 %op415, %op416
	ld.w $t0, $fp, -1680
	ld.w $t1, $fp, -1684
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1688
# %op418 = add i32 %op380, 3
	ld.w $t0, $fp, -1540
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1692
# %op419 = add i32 %op417, %op418
	ld.w $t0, $fp, -1688
	ld.w $t1, $fp, -1692
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1696
# %op420 = add i32 %op378, -5
	ld.w $t0, $fp, -1532
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1700
# %op421 = add i32 %op419, %op420
	ld.w $t0, $fp, -1696
	ld.w $t1, $fp, -1700
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1704
# %op422 = add i32 %op376, -3
	ld.w $t0, $fp, -1524
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1708
# %op423 = add i32 %op421, %op422
	ld.w $t0, $fp, -1704
	ld.w $t1, $fp, -1708
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1712
# %op424 = add i32 %op374, 4
	ld.w $t0, $fp, -1516
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1716
# %op425 = add i32 %op423, %op424
	ld.w $t0, $fp, -1712
	ld.w $t1, $fp, -1716
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1720
# %op426 = add i32 %op372, 1
	ld.w $t0, $fp, -1508
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1724
# %op427 = add i32 %op425, %op426
	ld.w $t0, $fp, -1720
	ld.w $t1, $fp, -1724
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1728
# %op428 = add i32 %op370, -5
	ld.w $t0, $fp, -1500
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1732
# %op429 = add i32 %op427, %op428
	ld.w $t0, $fp, -1728
	ld.w $t1, $fp, -1732
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1736
# %op430 = add i32 %op368, -3
	ld.w $t0, $fp, -1492
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1740
# %op431 = add i32 %op429, %op430
	ld.w $t0, $fp, -1736
	ld.w $t1, $fp, -1740
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1744
# %op432 = add i32 %op366, 1
	ld.w $t0, $fp, -1484
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1748
# %op433 = add i32 %op431, %op432
	ld.w $t0, $fp, -1744
	ld.w $t1, $fp, -1748
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1752
# %op434 = add i32 %op364, 4
	ld.w $t0, $fp, -1476
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1756
# %op435 = add i32 %op433, %op434
	ld.w $t0, $fp, -1752
	ld.w $t1, $fp, -1756
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1760
# %op436 = add i32 %op362, -2
	ld.w $t0, $fp, -1468
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1764
# %op437 = add i32 %op435, %op436
	ld.w $t0, $fp, -1760
	ld.w $t1, $fp, -1764
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1768
# %op438 = add i32 %op360, -2
	ld.w $t0, $fp, -1460
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1772
# %op439 = add i32 %op437, %op438
	ld.w $t0, $fp, -1768
	ld.w $t1, $fp, -1772
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1776
# %op440 = add i32 %op358, 3
	ld.w $t0, $fp, -1452
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1780
# %op441 = add i32 %op439, %op440
	ld.w $t0, $fp, -1776
	ld.w $t1, $fp, -1780
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1784
# %op442 = add i32 %op356, 2
	ld.w $t0, $fp, -1444
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1788
# %op443 = add i32 %op441, %op442
	ld.w $t0, $fp, -1784
	ld.w $t1, $fp, -1788
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1792
# %op444 = add i32 %op354, 2
	ld.w $t0, $fp, -1436
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1796
# %op445 = add i32 %op443, %op444
	ld.w $t0, $fp, -1792
	ld.w $t1, $fp, -1796
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1800
# %op446 = add i32 %op352, -4
	ld.w $t0, $fp, -1428
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1804
# %op447 = add i32 %op445, %op446
	ld.w $t0, $fp, -1800
	ld.w $t1, $fp, -1804
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1808
# %op448 = add i32 %op350, -3
	ld.w $t0, $fp, -1420
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1812
# %op449 = add i32 %op447, %op448
	ld.w $t0, $fp, -1808
	ld.w $t1, $fp, -1812
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1816
# %op450 = add i32 %op348, -1
	ld.w $t0, $fp, -1412
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1820
# %op451 = add i32 %op449, %op450
	ld.w $t0, $fp, -1816
	ld.w $t1, $fp, -1820
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1824
# %op452 = add i32 %op346, 4
	ld.w $t0, $fp, -1404
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1828
# %op453 = add i32 %op451, %op452
	ld.w $t0, $fp, -1824
	ld.w $t1, $fp, -1828
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1832
# %op454 = add i32 %op344, 4
	ld.w $t0, $fp, -1396
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1836
# %op455 = add i32 %op453, %op454
	ld.w $t0, $fp, -1832
	ld.w $t1, $fp, -1836
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1840
# %op456 = add i32 %op342, -3
	ld.w $t0, $fp, -1388
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1844
# %op457 = add i32 %op455, %op456
	ld.w $t0, $fp, -1840
	ld.w $t1, $fp, -1844
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1848
# %op458 = add i32 %op340, -4
	ld.w $t0, $fp, -1380
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1852
# %op459 = add i32 %op457, %op458
	ld.w $t0, $fp, -1848
	ld.w $t1, $fp, -1852
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1856
# %op460 = add i32 %op338, -3
	ld.w $t0, $fp, -1372
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1860
# %op461 = add i32 %op459, %op460
	ld.w $t0, $fp, -1856
	ld.w $t1, $fp, -1860
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1864
# %op462 = add i32 %op336, -1
	ld.w $t0, $fp, -1364
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1868
# %op463 = add i32 %op461, %op462
	ld.w $t0, $fp, -1864
	ld.w $t1, $fp, -1868
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1872
# %op464 = add i32 %op334, 3
	ld.w $t0, $fp, -1356
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1876
# %op465 = add i32 %op463, %op464
	ld.w $t0, $fp, -1872
	ld.w $t1, $fp, -1876
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1880
# %op466 = add i32 %op332, 4
	ld.w $t0, $fp, -1348
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1884
# %op467 = add i32 %op465, %op466
	ld.w $t0, $fp, -1880
	ld.w $t1, $fp, -1884
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1888
# %op468 = add i32 %op330, -4
	ld.w $t0, $fp, -1340
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1892
# %op469 = add i32 %op467, %op468
	ld.w $t0, $fp, -1888
	ld.w $t1, $fp, -1892
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1896
# %op470 = add i32 %op328, 4
	ld.w $t0, $fp, -1332
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1900
# %op471 = add i32 %op469, %op470
	ld.w $t0, $fp, -1896
	ld.w $t1, $fp, -1900
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1904
# %op472 = add i32 %op326, 1
	ld.w $t0, $fp, -1324
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1908
# %op473 = add i32 %op471, %op472
	ld.w $t0, $fp, -1904
	ld.w $t1, $fp, -1908
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1912
# %op474 = add i32 %op324, -3
	ld.w $t0, $fp, -1316
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1916
# %op475 = add i32 %op473, %op474
	ld.w $t0, $fp, -1912
	ld.w $t1, $fp, -1916
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1920
# %op476 = add i32 %op322, -4
	ld.w $t0, $fp, -1308
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1924
# %op477 = add i32 %op475, %op476
	ld.w $t0, $fp, -1920
	ld.w $t1, $fp, -1924
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1928
# %op478 = add i32 %op320, -3
	ld.w $t0, $fp, -1300
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1932
# %op479 = add i32 %op477, %op478
	ld.w $t0, $fp, -1928
	ld.w $t1, $fp, -1932
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1936
# %op480 = add i32 %op318, -4
	ld.w $t0, $fp, -1292
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1940
# %op481 = add i32 %op479, %op480
	ld.w $t0, $fp, -1936
	ld.w $t1, $fp, -1940
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1944
# %op482 = add i32 %op316, -2
	ld.w $t0, $fp, -1284
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1948
# %op483 = add i32 %op481, %op482
	ld.w $t0, $fp, -1944
	ld.w $t1, $fp, -1948
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1952
# %op484 = add i32 %op314, 2
	ld.w $t0, $fp, -1276
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1956
# %op485 = add i32 %op483, %op484
	ld.w $t0, $fp, -1952
	ld.w $t1, $fp, -1956
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1960
# %op486 = add i32 %op312, -3
	ld.w $t0, $fp, -1268
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1964
# %op487 = add i32 %op485, %op486
	ld.w $t0, $fp, -1960
	ld.w $t1, $fp, -1964
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1968
# %op488 = add i32 %op310, -3
	ld.w $t0, $fp, -1260
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1972
# %op489 = add i32 %op487, %op488
	ld.w $t0, $fp, -1968
	ld.w $t1, $fp, -1972
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1976
# %op490 = add i32 %op308, 2
	ld.w $t0, $fp, -1252
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1980
# %op491 = add i32 %op489, %op490
	ld.w $t0, $fp, -1976
	ld.w $t1, $fp, -1980
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1984
# %op492 = add i32 %op306, 1
	ld.w $t0, $fp, -1244
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1988
# %op493 = add i32 %op491, %op492
	ld.w $t0, $fp, -1984
	ld.w $t1, $fp, -1988
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1992
# %op494 = add i32 %op304, 3
	ld.w $t0, $fp, -1236
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -1996
# %op495 = add i32 %op493, %op494
	ld.w $t0, $fp, -1992
	ld.w $t1, $fp, -1996
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -2000
# %op496 = add i32 %op302, 4
	ld.w $t0, $fp, -1228
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -2004
# %op497 = add i32 %op495, %op496
	ld.w $t0, $fp, -2000
	ld.w $t1, $fp, -2004
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -2008
# %op498 = add i32 %op300, -4
	ld.w $t0, $fp, -1220
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -2012
# %op499 = add i32 %op497, %op498
	ld.w $t0, $fp, -2008
	ld.w $t1, $fp, -2012
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -2016
# %op500 = add i32 %op298, -4
	ld.w $t0, $fp, -1212
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -2020
# %op501 = add i32 %op499, %op500
	ld.w $t0, $fp, -2016
	ld.w $t1, $fp, -2020
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -2024
# %op502 = add i32 %op296, 2
	ld.w $t0, $fp, -1204
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -2028
# %op503 = add i32 %op501, %op502
	ld.w $t0, $fp, -2024
	ld.w $t1, $fp, -2028
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -2032
# %op504 = add i32 %op294, -5
	ld.w $t0, $fp, -1196
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -2036
# %op505 = add i32 %op503, %op504
	ld.w $t0, $fp, -2032
	ld.w $t1, $fp, -2036
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -2040
# %op506 = add i32 %op292, 4
	ld.w $t0, $fp, -1188
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -2044
# %op507 = add i32 %op505, %op506
	ld.w $t0, $fp, -2040
	ld.w $t1, $fp, -2044
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -2048
# %op508 = add i32 %op290, -4
	ld.w $t0, $fp, -1180
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 2044
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op509 = add i32 %op507, %op508
	ld.w $t0, $fp, -2048
	lu12i.w $t1, -1
	ori $t1, $t1, 2044
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 2040
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op510 = add i32 %op288, -2
	ld.w $t0, $fp, -1172
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 2036
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op511 = add i32 %op509, %op510
	lu12i.w $t0, -1
	ori $t0, $t0, 2040
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 2036
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 2032
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op512 = add i32 %op286, -2
	ld.w $t0, $fp, -1164
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 2028
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op513 = add i32 %op511, %op512
	lu12i.w $t0, -1
	ori $t0, $t0, 2032
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 2028
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 2024
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op514 = add i32 %op284, -3
	ld.w $t0, $fp, -1156
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 2020
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op515 = add i32 %op513, %op514
	lu12i.w $t0, -1
	ori $t0, $t0, 2024
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 2020
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 2016
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op516 = add i32 %op282, -1
	ld.w $t0, $fp, -1148
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 2012
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op517 = add i32 %op515, %op516
	lu12i.w $t0, -1
	ori $t0, $t0, 2016
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 2012
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 2008
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op518 = add i32 %op280, 2
	ld.w $t0, $fp, -1140
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 2004
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op519 = add i32 %op517, %op518
	lu12i.w $t0, -1
	ori $t0, $t0, 2008
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 2004
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 2000
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op520 = add i32 %op278, -2
	ld.w $t0, $fp, -1132
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1996
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op521 = add i32 %op519, %op520
	lu12i.w $t0, -1
	ori $t0, $t0, 2000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1996
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1992
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op522 = add i32 %op276, 1
	ld.w $t0, $fp, -1124
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1988
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op523 = add i32 %op521, %op522
	lu12i.w $t0, -1
	ori $t0, $t0, 1992
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1988
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1984
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op524 = add i32 %op274, -4
	ld.w $t0, $fp, -1116
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1980
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op525 = add i32 %op523, %op524
	lu12i.w $t0, -1
	ori $t0, $t0, 1984
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1980
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1976
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op526 = add i32 %op272, -2
	ld.w $t0, $fp, -1108
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1972
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op527 = add i32 %op525, %op526
	lu12i.w $t0, -1
	ori $t0, $t0, 1976
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1972
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1968
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op528 = add i32 %op270, 0
	ld.w $t0, $fp, -1100
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1964
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op529 = add i32 %op527, %op528
	lu12i.w $t0, -1
	ori $t0, $t0, 1968
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1964
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1960
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op530 = add i32 %op268, -1
	ld.w $t0, $fp, -1092
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1956
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op531 = add i32 %op529, %op530
	lu12i.w $t0, -1
	ori $t0, $t0, 1960
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1956
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1952
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op532 = add i32 %op266, -2
	ld.w $t0, $fp, -1084
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1948
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op533 = add i32 %op531, %op532
	lu12i.w $t0, -1
	ori $t0, $t0, 1952
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1948
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1944
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op534 = add i32 %op264, -4
	ld.w $t0, $fp, -1076
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1940
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op535 = add i32 %op533, %op534
	lu12i.w $t0, -1
	ori $t0, $t0, 1944
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1940
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1936
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op536 = add i32 %op262, 2
	ld.w $t0, $fp, -1068
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1932
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op537 = add i32 %op535, %op536
	lu12i.w $t0, -1
	ori $t0, $t0, 1936
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1932
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1928
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op538 = add i32 %op260, 1
	ld.w $t0, $fp, -1060
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1924
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op539 = add i32 %op537, %op538
	lu12i.w $t0, -1
	ori $t0, $t0, 1928
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1924
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1920
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op540 = add i32 %op258, -1
	ld.w $t0, $fp, -1052
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1916
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op541 = add i32 %op539, %op540
	lu12i.w $t0, -1
	ori $t0, $t0, 1920
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1916
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1912
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op542 = add i32 %op256, -5
	ld.w $t0, $fp, -1044
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1908
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op543 = add i32 %op541, %op542
	lu12i.w $t0, -1
	ori $t0, $t0, 1912
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1908
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1904
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op544 = add i32 %op254, -3
	ld.w $t0, $fp, -1036
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1900
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op545 = add i32 %op543, %op544
	lu12i.w $t0, -1
	ori $t0, $t0, 1904
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1900
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1896
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op546 = add i32 %op252, -4
	ld.w $t0, $fp, -1028
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1892
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op547 = add i32 %op545, %op546
	lu12i.w $t0, -1
	ori $t0, $t0, 1896
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1892
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1888
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op548 = add i32 %op250, -1
	ld.w $t0, $fp, -1020
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1884
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op549 = add i32 %op547, %op548
	lu12i.w $t0, -1
	ori $t0, $t0, 1888
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1884
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1880
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op550 = add i32 %op248, -1
	ld.w $t0, $fp, -1012
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1876
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op551 = add i32 %op549, %op550
	lu12i.w $t0, -1
	ori $t0, $t0, 1880
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1876
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1872
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op552 = add i32 %op246, -5
	ld.w $t0, $fp, -1004
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1868
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op553 = add i32 %op551, %op552
	lu12i.w $t0, -1
	ori $t0, $t0, 1872
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1868
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1864
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op554 = add i32 %op244, -4
	ld.w $t0, $fp, -996
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1860
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op555 = add i32 %op553, %op554
	lu12i.w $t0, -1
	ori $t0, $t0, 1864
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1860
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1856
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op556 = add i32 %op242, -1
	ld.w $t0, $fp, -988
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1852
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op557 = add i32 %op555, %op556
	lu12i.w $t0, -1
	ori $t0, $t0, 1856
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1852
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1848
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op558 = add i32 %op240, -4
	ld.w $t0, $fp, -980
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1844
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op559 = add i32 %op557, %op558
	lu12i.w $t0, -1
	ori $t0, $t0, 1848
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1844
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1840
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op560 = add i32 %op238, -1
	ld.w $t0, $fp, -972
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1836
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op561 = add i32 %op559, %op560
	lu12i.w $t0, -1
	ori $t0, $t0, 1840
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1836
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1832
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op562 = add i32 %op236, 1
	ld.w $t0, $fp, -964
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1828
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op563 = add i32 %op561, %op562
	lu12i.w $t0, -1
	ori $t0, $t0, 1832
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1828
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1824
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op564 = add i32 %op234, -4
	ld.w $t0, $fp, -956
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1820
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op565 = add i32 %op563, %op564
	lu12i.w $t0, -1
	ori $t0, $t0, 1824
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1820
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1816
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op566 = add i32 %op232, 0
	ld.w $t0, $fp, -948
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1812
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op567 = add i32 %op565, %op566
	lu12i.w $t0, -1
	ori $t0, $t0, 1816
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1812
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1808
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op568 = add i32 %op230, 2
	ld.w $t0, $fp, -940
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1804
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op569 = add i32 %op567, %op568
	lu12i.w $t0, -1
	ori $t0, $t0, 1808
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1804
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1800
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op570 = add i32 %op228, -3
	ld.w $t0, $fp, -932
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1796
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op571 = add i32 %op569, %op570
	lu12i.w $t0, -1
	ori $t0, $t0, 1800
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1796
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1792
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op572 = add i32 %op226, -5
	ld.w $t0, $fp, -924
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1788
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op573 = add i32 %op571, %op572
	lu12i.w $t0, -1
	ori $t0, $t0, 1792
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1788
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1784
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op574 = add i32 %op224, -3
	ld.w $t0, $fp, -916
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1780
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op575 = add i32 %op573, %op574
	lu12i.w $t0, -1
	ori $t0, $t0, 1784
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1780
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1776
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op576 = add i32 %op222, 1
	ld.w $t0, $fp, -908
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1772
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op577 = add i32 %op575, %op576
	lu12i.w $t0, -1
	ori $t0, $t0, 1776
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1772
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1768
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op578 = add i32 %op220, -1
	ld.w $t0, $fp, -900
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1764
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op579 = add i32 %op577, %op578
	lu12i.w $t0, -1
	ori $t0, $t0, 1768
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1764
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1760
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op580 = add i32 %op218, -4
	ld.w $t0, $fp, -892
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1756
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op581 = add i32 %op579, %op580
	lu12i.w $t0, -1
	ori $t0, $t0, 1760
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1756
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1752
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op582 = add i32 %op216, 4
	ld.w $t0, $fp, -884
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1748
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op583 = add i32 %op581, %op582
	lu12i.w $t0, -1
	ori $t0, $t0, 1752
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1748
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1744
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op584 = add i32 %op214, -5
	ld.w $t0, $fp, -876
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1740
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op585 = add i32 %op583, %op584
	lu12i.w $t0, -1
	ori $t0, $t0, 1744
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1740
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1736
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op586 = add i32 %op212, 0
	ld.w $t0, $fp, -868
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1732
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op587 = add i32 %op585, %op586
	lu12i.w $t0, -1
	ori $t0, $t0, 1736
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1732
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1728
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op588 = add i32 %op210, 0
	ld.w $t0, $fp, -860
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1724
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op589 = add i32 %op587, %op588
	lu12i.w $t0, -1
	ori $t0, $t0, 1728
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1724
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1720
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op590 = add i32 %op208, 2
	ld.w $t0, $fp, -852
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1716
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op591 = add i32 %op589, %op590
	lu12i.w $t0, -1
	ori $t0, $t0, 1720
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1716
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1712
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op592 = add i32 %op206, 4
	ld.w $t0, $fp, -844
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1708
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op593 = add i32 %op591, %op592
	lu12i.w $t0, -1
	ori $t0, $t0, 1712
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1708
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1704
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op594 = add i32 %op204, 3
	ld.w $t0, $fp, -836
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1700
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op595 = add i32 %op593, %op594
	lu12i.w $t0, -1
	ori $t0, $t0, 1704
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1700
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1696
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op596 = add i32 %op202, -5
	ld.w $t0, $fp, -828
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1692
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op597 = add i32 %op595, %op596
	lu12i.w $t0, -1
	ori $t0, $t0, 1696
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1692
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1688
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op598 = add i32 %op200, 3
	ld.w $t0, $fp, -820
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1684
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op599 = add i32 %op597, %op598
	lu12i.w $t0, -1
	ori $t0, $t0, 1688
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1684
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1680
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op600 = add i32 %op198, 1
	ld.w $t0, $fp, -812
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1676
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op601 = add i32 %op599, %op600
	lu12i.w $t0, -1
	ori $t0, $t0, 1680
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1676
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1672
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op602 = add i32 %op196, -1
	ld.w $t0, $fp, -804
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1668
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op603 = add i32 %op601, %op602
	lu12i.w $t0, -1
	ori $t0, $t0, 1672
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1668
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1664
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op604 = add i32 %op194, 3
	ld.w $t0, $fp, -796
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1660
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op605 = add i32 %op603, %op604
	lu12i.w $t0, -1
	ori $t0, $t0, 1664
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1660
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1656
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op606 = add i32 %op192, -5
	ld.w $t0, $fp, -788
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1652
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op607 = add i32 %op605, %op606
	lu12i.w $t0, -1
	ori $t0, $t0, 1656
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1652
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1648
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op608 = add i32 %op190, 2
	ld.w $t0, $fp, -780
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1644
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op609 = add i32 %op607, %op608
	lu12i.w $t0, -1
	ori $t0, $t0, 1648
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1644
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1640
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op610 = add i32 %op188, 0
	ld.w $t0, $fp, -772
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1636
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op611 = add i32 %op609, %op610
	lu12i.w $t0, -1
	ori $t0, $t0, 1640
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1636
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1632
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op612 = add i32 %op186, 1
	ld.w $t0, $fp, -764
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1628
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op613 = add i32 %op611, %op612
	lu12i.w $t0, -1
	ori $t0, $t0, 1632
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1628
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1624
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op614 = add i32 %op184, -5
	ld.w $t0, $fp, -756
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1620
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op615 = add i32 %op613, %op614
	lu12i.w $t0, -1
	ori $t0, $t0, 1624
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1620
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1616
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op616 = add i32 %op182, 1
	ld.w $t0, $fp, -748
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1612
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op617 = add i32 %op615, %op616
	lu12i.w $t0, -1
	ori $t0, $t0, 1616
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1612
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1608
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op618 = add i32 %op180, -4
	ld.w $t0, $fp, -740
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1604
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op619 = add i32 %op617, %op618
	lu12i.w $t0, -1
	ori $t0, $t0, 1608
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1604
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1600
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op620 = add i32 %op178, -2
	ld.w $t0, $fp, -732
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1596
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op621 = add i32 %op619, %op620
	lu12i.w $t0, -1
	ori $t0, $t0, 1600
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1596
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1592
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op622 = add i32 %op176, -3
	ld.w $t0, $fp, -724
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1588
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op623 = add i32 %op621, %op622
	lu12i.w $t0, -1
	ori $t0, $t0, 1592
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1588
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1584
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op624 = add i32 %op174, 4
	ld.w $t0, $fp, -716
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1580
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op625 = add i32 %op623, %op624
	lu12i.w $t0, -1
	ori $t0, $t0, 1584
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1580
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1576
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op626 = add i32 %op172, -1
	ld.w $t0, $fp, -708
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1572
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op627 = add i32 %op625, %op626
	lu12i.w $t0, -1
	ori $t0, $t0, 1576
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1572
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1568
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op628 = add i32 %op170, 2
	ld.w $t0, $fp, -700
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1564
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op629 = add i32 %op627, %op628
	lu12i.w $t0, -1
	ori $t0, $t0, 1568
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1564
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1560
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op630 = add i32 %op168, 1
	ld.w $t0, $fp, -692
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1556
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op631 = add i32 %op629, %op630
	lu12i.w $t0, -1
	ori $t0, $t0, 1560
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1556
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1552
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op632 = add i32 %op166, 3
	ld.w $t0, $fp, -684
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1548
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op633 = add i32 %op631, %op632
	lu12i.w $t0, -1
	ori $t0, $t0, 1552
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1548
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1544
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op634 = add i32 %op164, 4
	ld.w $t0, $fp, -676
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1540
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op635 = add i32 %op633, %op634
	lu12i.w $t0, -1
	ori $t0, $t0, 1544
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1540
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1536
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op636 = add i32 %op162, -5
	ld.w $t0, $fp, -668
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1532
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op637 = add i32 %op635, %op636
	lu12i.w $t0, -1
	ori $t0, $t0, 1536
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1532
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1528
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op638 = add i32 %op160, -1
	ld.w $t0, $fp, -660
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1524
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op639 = add i32 %op637, %op638
	lu12i.w $t0, -1
	ori $t0, $t0, 1528
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1524
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1520
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op640 = add i32 %op158, -2
	ld.w $t0, $fp, -652
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1516
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op641 = add i32 %op639, %op640
	lu12i.w $t0, -1
	ori $t0, $t0, 1520
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1516
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1512
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op642 = add i32 %op156, -4
	ld.w $t0, $fp, -644
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1508
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op643 = add i32 %op641, %op642
	lu12i.w $t0, -1
	ori $t0, $t0, 1512
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1508
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1504
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op644 = add i32 %op154, 1
	ld.w $t0, $fp, -636
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1500
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op645 = add i32 %op643, %op644
	lu12i.w $t0, -1
	ori $t0, $t0, 1504
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1500
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1496
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op646 = add i32 %op152, 0
	ld.w $t0, $fp, -628
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1492
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op647 = add i32 %op645, %op646
	lu12i.w $t0, -1
	ori $t0, $t0, 1496
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1492
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1488
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op648 = add i32 %op150, 1
	ld.w $t0, $fp, -620
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1484
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op649 = add i32 %op647, %op648
	lu12i.w $t0, -1
	ori $t0, $t0, 1488
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1484
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1480
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op650 = add i32 %op148, -4
	ld.w $t0, $fp, -612
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1476
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op651 = add i32 %op649, %op650
	lu12i.w $t0, -1
	ori $t0, $t0, 1480
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1476
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1472
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op652 = add i32 %op146, -3
	ld.w $t0, $fp, -604
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1468
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op653 = add i32 %op651, %op652
	lu12i.w $t0, -1
	ori $t0, $t0, 1472
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1468
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1464
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op654 = add i32 %op144, 3
	ld.w $t0, $fp, -596
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1460
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op655 = add i32 %op653, %op654
	lu12i.w $t0, -1
	ori $t0, $t0, 1464
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1460
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1456
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op656 = add i32 %op142, 4
	ld.w $t0, $fp, -588
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1452
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op657 = add i32 %op655, %op656
	lu12i.w $t0, -1
	ori $t0, $t0, 1456
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1452
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1448
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op658 = add i32 %op140, -2
	ld.w $t0, $fp, -580
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1444
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op659 = add i32 %op657, %op658
	lu12i.w $t0, -1
	ori $t0, $t0, 1448
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1444
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1440
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op660 = add i32 %op138, 1
	ld.w $t0, $fp, -572
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1436
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op661 = add i32 %op659, %op660
	lu12i.w $t0, -1
	ori $t0, $t0, 1440
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1436
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1432
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op662 = add i32 %op136, 2
	ld.w $t0, $fp, -564
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1428
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op663 = add i32 %op661, %op662
	lu12i.w $t0, -1
	ori $t0, $t0, 1432
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1428
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1424
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op664 = add i32 %op134, 4
	ld.w $t0, $fp, -556
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1420
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op665 = add i32 %op663, %op664
	lu12i.w $t0, -1
	ori $t0, $t0, 1424
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1420
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1416
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op666 = add i32 %op132, 0
	ld.w $t0, $fp, -548
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1412
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op667 = add i32 %op665, %op666
	lu12i.w $t0, -1
	ori $t0, $t0, 1416
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1412
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1408
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op668 = add i32 %op130, -5
	ld.w $t0, $fp, -540
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1404
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op669 = add i32 %op667, %op668
	lu12i.w $t0, -1
	ori $t0, $t0, 1408
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1404
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1400
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op670 = add i32 %op128, 4
	ld.w $t0, $fp, -532
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1396
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op671 = add i32 %op669, %op670
	lu12i.w $t0, -1
	ori $t0, $t0, 1400
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1396
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1392
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op672 = add i32 %op126, -5
	ld.w $t0, $fp, -524
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1388
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op673 = add i32 %op671, %op672
	lu12i.w $t0, -1
	ori $t0, $t0, 1392
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1388
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1384
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op674 = add i32 %op124, 1
	ld.w $t0, $fp, -516
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1380
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op675 = add i32 %op673, %op674
	lu12i.w $t0, -1
	ori $t0, $t0, 1384
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1380
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1376
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op676 = add i32 %op122, -4
	ld.w $t0, $fp, -508
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1372
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op677 = add i32 %op675, %op676
	lu12i.w $t0, -1
	ori $t0, $t0, 1376
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1372
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1368
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op678 = add i32 %op120, 3
	ld.w $t0, $fp, -500
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1364
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op679 = add i32 %op677, %op678
	lu12i.w $t0, -1
	ori $t0, $t0, 1368
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1364
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1360
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op680 = add i32 %op118, 2
	ld.w $t0, $fp, -492
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1356
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op681 = add i32 %op679, %op680
	lu12i.w $t0, -1
	ori $t0, $t0, 1360
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1356
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1352
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op682 = add i32 %op116, -1
	ld.w $t0, $fp, -484
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1348
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op683 = add i32 %op681, %op682
	lu12i.w $t0, -1
	ori $t0, $t0, 1352
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1348
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1344
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op684 = add i32 %op114, -3
	ld.w $t0, $fp, -476
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1340
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op685 = add i32 %op683, %op684
	lu12i.w $t0, -1
	ori $t0, $t0, 1344
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1340
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1336
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op686 = add i32 %op112, 1
	ld.w $t0, $fp, -468
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1332
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op687 = add i32 %op685, %op686
	lu12i.w $t0, -1
	ori $t0, $t0, 1336
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1332
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1328
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op688 = add i32 %op110, 4
	ld.w $t0, $fp, -460
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1324
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op689 = add i32 %op687, %op688
	lu12i.w $t0, -1
	ori $t0, $t0, 1328
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1324
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1320
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op690 = add i32 %op108, -3
	ld.w $t0, $fp, -452
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1316
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op691 = add i32 %op689, %op690
	lu12i.w $t0, -1
	ori $t0, $t0, 1320
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1316
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1312
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op692 = add i32 %op106, -1
	ld.w $t0, $fp, -444
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1308
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op693 = add i32 %op691, %op692
	lu12i.w $t0, -1
	ori $t0, $t0, 1312
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1308
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1304
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op694 = add i32 %op104, 4
	ld.w $t0, $fp, -436
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1300
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op695 = add i32 %op693, %op694
	lu12i.w $t0, -1
	ori $t0, $t0, 1304
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1300
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1296
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op696 = add i32 %op102, -4
	ld.w $t0, $fp, -428
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1292
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op697 = add i32 %op695, %op696
	lu12i.w $t0, -1
	ori $t0, $t0, 1296
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1292
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1288
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op698 = add i32 %op100, -1
	ld.w $t0, $fp, -420
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1284
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op699 = add i32 %op697, %op698
	lu12i.w $t0, -1
	ori $t0, $t0, 1288
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1284
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1280
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op700 = add i32 %op98, -1
	ld.w $t0, $fp, -412
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1276
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op701 = add i32 %op699, %op700
	lu12i.w $t0, -1
	ori $t0, $t0, 1280
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1276
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1272
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op702 = add i32 %op96, 0
	ld.w $t0, $fp, -404
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1268
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op703 = add i32 %op701, %op702
	lu12i.w $t0, -1
	ori $t0, $t0, 1272
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1268
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1264
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op704 = add i32 %op94, 3
	ld.w $t0, $fp, -396
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1260
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op705 = add i32 %op703, %op704
	lu12i.w $t0, -1
	ori $t0, $t0, 1264
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1260
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1256
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op706 = add i32 %op92, -5
	ld.w $t0, $fp, -388
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1252
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op707 = add i32 %op705, %op706
	lu12i.w $t0, -1
	ori $t0, $t0, 1256
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1252
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1248
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op708 = add i32 %op90, -5
	ld.w $t0, $fp, -380
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1244
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op709 = add i32 %op707, %op708
	lu12i.w $t0, -1
	ori $t0, $t0, 1248
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1244
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1240
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op710 = add i32 %op88, 1
	ld.w $t0, $fp, -372
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1236
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op711 = add i32 %op709, %op710
	lu12i.w $t0, -1
	ori $t0, $t0, 1240
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1236
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1232
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op712 = add i32 %op86, -4
	ld.w $t0, $fp, -364
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1228
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op713 = add i32 %op711, %op712
	lu12i.w $t0, -1
	ori $t0, $t0, 1232
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1228
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1224
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op714 = add i32 %op84, 0
	ld.w $t0, $fp, -356
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1220
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op715 = add i32 %op713, %op714
	lu12i.w $t0, -1
	ori $t0, $t0, 1224
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1220
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1216
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op716 = add i32 %op82, -1
	ld.w $t0, $fp, -348
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1212
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op717 = add i32 %op715, %op716
	lu12i.w $t0, -1
	ori $t0, $t0, 1216
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1212
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1208
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op718 = add i32 %op80, -3
	ld.w $t0, $fp, -340
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1204
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op719 = add i32 %op717, %op718
	lu12i.w $t0, -1
	ori $t0, $t0, 1208
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1204
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1200
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op720 = add i32 %op78, -5
	ld.w $t0, $fp, -332
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1196
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op721 = add i32 %op719, %op720
	lu12i.w $t0, -1
	ori $t0, $t0, 1200
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1196
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1192
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op722 = add i32 %op76, -4
	ld.w $t0, $fp, -324
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1188
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op723 = add i32 %op721, %op722
	lu12i.w $t0, -1
	ori $t0, $t0, 1192
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1188
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1184
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op724 = add i32 %op74, -4
	ld.w $t0, $fp, -316
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1180
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op725 = add i32 %op723, %op724
	lu12i.w $t0, -1
	ori $t0, $t0, 1184
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1180
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1176
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op726 = add i32 %op72, -4
	ld.w $t0, $fp, -308
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1172
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op727 = add i32 %op725, %op726
	lu12i.w $t0, -1
	ori $t0, $t0, 1176
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1172
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1168
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op728 = add i32 %op70, 3
	ld.w $t0, $fp, -300
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1164
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op729 = add i32 %op727, %op728
	lu12i.w $t0, -1
	ori $t0, $t0, 1168
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1164
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1160
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op730 = add i32 %op68, -4
	ld.w $t0, $fp, -292
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1156
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op731 = add i32 %op729, %op730
	lu12i.w $t0, -1
	ori $t0, $t0, 1160
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1156
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1152
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op732 = add i32 %op66, -3
	ld.w $t0, $fp, -284
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1148
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op733 = add i32 %op731, %op732
	lu12i.w $t0, -1
	ori $t0, $t0, 1152
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1148
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1144
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op734 = add i32 %op64, -5
	ld.w $t0, $fp, -276
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1140
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op735 = add i32 %op733, %op734
	lu12i.w $t0, -1
	ori $t0, $t0, 1144
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1140
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1136
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op736 = add i32 %op62, 3
	ld.w $t0, $fp, -268
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1132
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op737 = add i32 %op735, %op736
	lu12i.w $t0, -1
	ori $t0, $t0, 1136
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1132
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1128
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op738 = add i32 %op60, -2
	ld.w $t0, $fp, -260
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1124
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op739 = add i32 %op737, %op738
	lu12i.w $t0, -1
	ori $t0, $t0, 1128
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1124
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1120
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op740 = add i32 %op58, -5
	ld.w $t0, $fp, -252
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1116
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op741 = add i32 %op739, %op740
	lu12i.w $t0, -1
	ori $t0, $t0, 1120
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1116
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1112
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op742 = add i32 %op56, 0
	ld.w $t0, $fp, -244
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1108
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op743 = add i32 %op741, %op742
	lu12i.w $t0, -1
	ori $t0, $t0, 1112
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1108
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1104
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op744 = add i32 %op54, 3
	ld.w $t0, $fp, -236
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1100
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op745 = add i32 %op743, %op744
	lu12i.w $t0, -1
	ori $t0, $t0, 1104
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1100
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1096
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op746 = add i32 %op52, -3
	ld.w $t0, $fp, -228
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1092
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op747 = add i32 %op745, %op746
	lu12i.w $t0, -1
	ori $t0, $t0, 1096
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1092
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1088
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op748 = add i32 %op50, -3
	ld.w $t0, $fp, -220
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1084
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op749 = add i32 %op747, %op748
	lu12i.w $t0, -1
	ori $t0, $t0, 1088
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1084
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1080
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op750 = add i32 %op48, 4
	ld.w $t0, $fp, -212
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1076
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op751 = add i32 %op749, %op750
	lu12i.w $t0, -1
	ori $t0, $t0, 1080
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1076
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1072
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op752 = add i32 %op46, -1
	ld.w $t0, $fp, -204
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1068
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op753 = add i32 %op751, %op752
	lu12i.w $t0, -1
	ori $t0, $t0, 1072
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1068
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1064
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op754 = add i32 %op44, 1
	ld.w $t0, $fp, -196
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1060
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op755 = add i32 %op753, %op754
	lu12i.w $t0, -1
	ori $t0, $t0, 1064
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1060
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1056
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op756 = add i32 %op42, 3
	ld.w $t0, $fp, -188
	addi.w $t1, $zero, 3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1052
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op757 = add i32 %op755, %op756
	lu12i.w $t0, -1
	ori $t0, $t0, 1056
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1052
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1048
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op758 = add i32 %op40, 1
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1044
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op759 = add i32 %op757, %op758
	lu12i.w $t0, -1
	ori $t0, $t0, 1048
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1044
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1040
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op760 = add i32 %op38, -2
	ld.w $t0, $fp, -172
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1036
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op761 = add i32 %op759, %op760
	lu12i.w $t0, -1
	ori $t0, $t0, 1040
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1036
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1032
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op762 = add i32 %op36, -1
	ld.w $t0, $fp, -164
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1028
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op763 = add i32 %op761, %op762
	lu12i.w $t0, -1
	ori $t0, $t0, 1032
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1028
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1024
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op764 = add i32 %op34, -2
	ld.w $t0, $fp, -156
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1020
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op765 = add i32 %op763, %op764
	lu12i.w $t0, -1
	ori $t0, $t0, 1024
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1020
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1016
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op766 = add i32 %op32, -2
	ld.w $t0, $fp, -148
	addi.w $t1, $zero, -2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1012
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op767 = add i32 %op765, %op766
	lu12i.w $t0, -1
	ori $t0, $t0, 1016
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1012
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1008
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op768 = add i32 %op30, -1
	ld.w $t0, $fp, -140
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1004
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op769 = add i32 %op767, %op768
	lu12i.w $t0, -1
	ori $t0, $t0, 1008
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 1004
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 1000
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op770 = add i32 %op28, 0
	ld.w $t0, $fp, -132
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 996
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op771 = add i32 %op769, %op770
	lu12i.w $t0, -1
	ori $t0, $t0, 1000
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 996
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 992
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op772 = add i32 %op26, 4
	ld.w $t0, $fp, -124
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 988
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op773 = add i32 %op771, %op772
	lu12i.w $t0, -1
	ori $t0, $t0, 992
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 988
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 984
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op774 = add i32 %op24, 0
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 980
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op775 = add i32 %op773, %op774
	lu12i.w $t0, -1
	ori $t0, $t0, 984
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 980
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 976
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op776 = add i32 %op22, -5
	ld.w $t0, $fp, -108
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 972
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op777 = add i32 %op775, %op776
	lu12i.w $t0, -1
	ori $t0, $t0, 976
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 972
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 968
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op778 = add i32 %op20, -1
	ld.w $t0, $fp, -100
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 964
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op779 = add i32 %op777, %op778
	lu12i.w $t0, -1
	ori $t0, $t0, 968
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 964
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 960
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op780 = add i32 %op18, 4
	ld.w $t0, $fp, -92
	addi.w $t1, $zero, 4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 956
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op781 = add i32 %op779, %op780
	lu12i.w $t0, -1
	ori $t0, $t0, 960
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 956
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 952
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op782 = add i32 %op16, -3
	ld.w $t0, $fp, -84
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 948
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op783 = add i32 %op781, %op782
	lu12i.w $t0, -1
	ori $t0, $t0, 952
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 948
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 944
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op784 = add i32 %op14, 2
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 940
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op785 = add i32 %op783, %op784
	lu12i.w $t0, -1
	ori $t0, $t0, 944
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 940
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 936
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op786 = add i32 %op12, -4
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, -4
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 932
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op787 = add i32 %op785, %op786
	lu12i.w $t0, -1
	ori $t0, $t0, 936
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 932
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 928
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op788 = add i32 %op10, -1
	ld.w $t0, $fp, -60
	addi.w $t1, $zero, -1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 924
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op789 = add i32 %op787, %op788
	lu12i.w $t0, -1
	ori $t0, $t0, 928
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 924
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 920
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op790 = add i32 %op8, 2
	ld.w $t0, $fp, -52
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 916
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op791 = add i32 %op789, %op790
	lu12i.w $t0, -1
	ori $t0, $t0, 920
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 916
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 912
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op792 = add i32 %op6, -3
	ld.w $t0, $fp, -44
	addi.w $t1, $zero, -3
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 908
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op793 = add i32 %op791, %op792
	lu12i.w $t0, -1
	ori $t0, $t0, 912
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 908
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 904
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op794 = add i32 %op4, 1
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 900
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op795 = add i32 %op793, %op794
	lu12i.w $t0, -1
	ori $t0, $t0, 904
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 900
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 896
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op796 = add i32 %op2, 2
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 2
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 892
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op797 = add i32 %op795, %op796
	lu12i.w $t0, -1
	ori $t0, $t0, 896
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 892
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 888
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op798 = add i32 %op0, -5
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, -5
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 884
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# %op799 = add i32 %op797, %op798
	lu12i.w $t0, -1
	ori $t0, $t0, 888
	lu32i.d $t0, -1
	lu52i.d $t0, $t0, -1
	add.d $t0, $fp, $t0
	ld.w $t0, $t0, 0
	lu12i.w $t1, -1
	ori $t1, $t1, 884
	lu32i.d $t1, -1
	lu52i.d $t1, $t1, -1
	add.d $t1, $fp, $t1
	ld.w $t1, $t1, 0
	add.w $t2, $t0, $t1
	lu12i.w $t8, -1
	ori $t8, $t8, 880
	lu32i.d $t8, -1
	lu52i.d $t8, $t8, -1
	add.d $t8, $fp, $t8
	st.w $t2, $t8, 0
# ret i32 %op799
# gen_phi
	lu12i.w $a0, -1
	ori $a0, $a0, 880
	lu32i.d $a0, -1
	lu52i.d $a0, $a0, -1
	add.d $a0, $fp, $a0
	ld.w $a0, $a0, 0
	b .main_exit
.main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 3216
	lu32i.d $t0, 0
	lu52i.d $t0, $t0, 0
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
