; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/jianmu-tests/func/90_many_locals.sy"

declare void @neg_idx_except()

declare i32 @getint()

declare i32 @getch()

declare float @getfloat()

declare i32 @getarray(i32*)

declare i32 @getfarray(i32*)

declare void @putint(i32)

declare void @putch(i32)

declare void @putarray(i32, i32*)

declare void @putfloat(float)

declare void @putfarray(float*)

declare void @putf(i32*)

declare void @starttime()

declare void @stoptime()

define i32 @foo() {
label_entry:
  %op0 = alloca [16 x i32]
  store [16 x i32] [16 x i32] [i320, i321, i322, i323, i320, i321, i322, i323, i320, i321, i322, i323, i320, i321, i322, i323, ], [16 x i32]* %op0
  %op1 = alloca i32
  store i32 3, i32* %op1
  %op2 = alloca i32
  store i32 7, i32* %op2
  %op3 = alloca i32
  store i32 5, i32* %op3
  %op4 = alloca i32
  store i32 6, i32* %op4
  %op5 = alloca i32
  store i32 1, i32* %op5
  %op6 = alloca i32
  store i32 0, i32* %op6
  %op7 = alloca i32
  store i32 3, i32* %op7
  %op8 = alloca i32
  store i32 5, i32* %op8
  %op9 = alloca i32
  store i32 4, i32* %op9
  %op10 = alloca i32
  store i32 2, i32* %op10
  %op11 = alloca i32
  store i32 7, i32* %op11
  %op12 = alloca i32
  store i32 9, i32* %op12
  %op13 = alloca i32
  store i32 8, i32* %op13
  %op14 = alloca i32
  store i32 1, i32* %op14
  %op15 = alloca i32
  store i32 4, i32* %op15
  %op16 = alloca i32
  store i32 6, i32* %op16
  %op17 = load i32, i32* %op1
  %op18 = load i32, i32* %op2
  %op19 = add i32 %op17, %op18
  %op20 = load i32, i32* %op3
  %op21 = add i32 %op19, %op20
  %op22 = load i32, i32* %op4
  %op23 = add i32 %op21, %op22
  %op24 = load i32, i32* %op5
  %op25 = add i32 %op23, %op24
  %op26 = load i32, i32* %op6
  %op27 = add i32 %op25, %op26
  %op28 = load i32, i32* %op7
  %op29 = add i32 %op27, %op28
  %op30 = load i32, i32* %op8
  %op31 = add i32 %op29, %op30
  %op32 = alloca i32
  store i32 zeroinitializer, i32* %op32
  %op33 = load i32, i32* %op9
  %op34 = load i32, i32* %op10
  %op35 = add i32 %op33, %op34
  %op36 = load i32, i32* %op11
  %op37 = add i32 %op35, %op36
  %op38 = load i32, i32* %op12
  %op39 = add i32 %op37, %op38
  %op40 = load i32, i32* %op13
  %op41 = add i32 %op39, %op40
  %op42 = load i32, i32* %op14
  %op43 = add i32 %op41, %op42
  %op44 = load i32, i32* %op15
  %op45 = add i32 %op43, %op44
  %op46 = load i32, i32* %op16
  %op47 = add i32 %op45, %op46
  %op48 = alloca i32
  store i32 zeroinitializer, i32* %op48
  %op49 = load i32, i32* %op32
  %op50 = load i32, i32* %op48
  %op51 = add i32 %op49, %op50
  %op52 = load i32, i32* %op1
  %op53 = icmp slt i32 %op52, zeroinitializer
  %op54 = zext i1 %op53 to i32
  %op55 = add i32 %op54, zeroinitializer
  %op56 = icmp ne i32 %op55, zeroinitializer
  br i1 %op56, label %label_arr_ltz0, label %label_arr_gtz1
label_arr_ltz0:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_arr_gtz1
label_arr_gtz1:                                                ; preds = %label_entry, %label_arr_ltz0
  %op57 = getelementptr [16 x i32], [16 x i32]* %op0, i32 0, i32 %op52
  %op58 = load i32, i32* %op57
  %op59 = add i32 %op51, %op58
  ret i32 %op59
}
define i32 @main() {
label_entry:
  %op0 = alloca i32
  store i32 3, i32* %op0
  %op1 = alloca i32
  store i32 7, i32* %op1
  %op2 = alloca i32
  store i32 5, i32* %op2
  %op3 = alloca i32
  store i32 6, i32* %op3
  %op4 = alloca i32
  store i32 1, i32* %op4
  %op5 = alloca i32
  store i32 0, i32* %op5
  %op6 = alloca i32
  store i32 3, i32* %op6
  %op7 = alloca i32
  store i32 5, i32* %op7
  %op8 = alloca i32
  store i32 4, i32* %op8
  %op9 = alloca i32
  store i32 2, i32* %op9
  %op10 = alloca i32
  store i32 7, i32* %op10
  %op11 = alloca i32
  store i32 9, i32* %op11
  %op12 = alloca i32
  store i32 8, i32* %op12
  %op13 = alloca i32
  store i32 1, i32* %op13
  %op14 = alloca i32
  store i32 4, i32* %op14
  %op15 = alloca i32
  store i32 6, i32* %op15
  %op16 = load i32, i32* %op0
  %op17 = load i32, i32* %op1
  %op18 = add i32 %op16, %op17
  %op19 = load i32, i32* %op2
  %op20 = add i32 %op18, %op19
  %op21 = load i32, i32* %op3
  %op22 = add i32 %op20, %op21
  %op23 = load i32, i32* %op4
  %op24 = add i32 %op22, %op23
  %op25 = load i32, i32* %op5
  %op26 = add i32 %op24, %op25
  %op27 = load i32, i32* %op6
  %op28 = add i32 %op26, %op27
  %op29 = load i32, i32* %op7
  %op30 = add i32 %op28, %op29
  %op31 = alloca i32
  store i32 zeroinitializer, i32* %op31
  %op32 = load i32, i32* %op8
  %op33 = load i32, i32* %op9
  %op34 = add i32 %op32, %op33
  %op35 = load i32, i32* %op10
  %op36 = add i32 %op34, %op35
  %op37 = load i32, i32* %op11
  %op38 = add i32 %op36, %op37
  %op39 = load i32, i32* %op12
  %op40 = add i32 %op38, %op39
  %op41 = load i32, i32* %op13
  %op42 = add i32 %op40, %op41
  %op43 = load i32, i32* %op14
  %op44 = add i32 %op42, %op43
  %op45 = load i32, i32* %op15
  %op46 = add i32 %op44, %op45
  %op47 = alloca i32
  store i32 zeroinitializer, i32* %op47
  %op48 = load i32, i32* %op31
  %op49 = call i32 @foo()
  %op50 = add i32 %op48, %op49
  store i32 %op50, i32* %op31
  %op51 = alloca i32
  store i32 4, i32* %op51
  %op52 = alloca i32
  store i32 7, i32* %op52
  %op53 = alloca i32
  store i32 2, i32* %op53
  %op54 = alloca i32
  store i32 5, i32* %op54
  %op55 = alloca i32
  store i32 8, i32* %op55
  %op56 = alloca i32
  store i32 0, i32* %op56
  %op57 = alloca i32
  store i32 6, i32* %op57
  %op58 = alloca i32
  store i32 3, i32* %op58
  %op59 = load i32, i32* %op47
  %op60 = call i32 @foo()
  %op61 = add i32 %op59, %op60
  store i32 %op61, i32* %op47
  %op62 = load i32, i32* %op8
  store i32 %op62, i32* %op0
  %op63 = load i32, i32* %op9
  store i32 %op63, i32* %op1
  %op64 = load i32, i32* %op10
  store i32 %op64, i32* %op2
  %op65 = load i32, i32* %op11
  store i32 %op65, i32* %op3
  %op66 = load i32, i32* %op12
  store i32 %op66, i32* %op4
  %op67 = load i32, i32* %op13
  store i32 %op67, i32* %op5
  %op68 = load i32, i32* %op14
  store i32 %op68, i32* %op6
  %op69 = load i32, i32* %op15
  store i32 %op69, i32* %op7
  %op70 = load i32, i32* %op51
  %op71 = load i32, i32* %op52
  %op72 = add i32 %op70, %op71
  %op73 = load i32, i32* %op53
  %op74 = add i32 %op72, %op73
  %op75 = load i32, i32* %op54
  %op76 = add i32 %op74, %op75
  %op77 = load i32, i32* %op55
  %op78 = add i32 %op76, %op77
  %op79 = load i32, i32* %op56
  %op80 = add i32 %op78, %op79
  %op81 = load i32, i32* %op57
  %op82 = add i32 %op80, %op81
  %op83 = load i32, i32* %op58
  %op84 = add i32 %op82, %op83
  %op85 = alloca i32
  store i32 zeroinitializer, i32* %op85
  %op86 = load i32, i32* %op31
  %op87 = load i32, i32* %op47
  %op88 = add i32 %op86, %op87
  %op89 = load i32, i32* %op85
  %op90 = add i32 %op88, %op89
  %op91 = alloca i32
  store i32 zeroinitializer, i32* %op91
  %op92 = load i32, i32* %op91
  call void @putint(i32 %op92)
  call void @putch(i32 10)
  ret i32 0
}
