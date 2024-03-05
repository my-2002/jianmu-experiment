; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/jianmu-tests/func/89_many_globals.sy"

@a0 = global i32 zeroinitializer
@a1 = global i32 zeroinitializer
@a2 = global i32 zeroinitializer
@a3 = global i32 zeroinitializer
@a4 = global i32 zeroinitializer
@a5 = global i32 zeroinitializer
@a6 = global i32 zeroinitializer
@a7 = global i32 zeroinitializer
@a8 = global i32 zeroinitializer
@a9 = global i32 zeroinitializer
@a10 = global i32 zeroinitializer
@a11 = global i32 zeroinitializer
@a12 = global i32 zeroinitializer
@a13 = global i32 zeroinitializer
@a14 = global i32 zeroinitializer
@a15 = global i32 zeroinitializer
@a16 = global i32 zeroinitializer
@a17 = global i32 zeroinitializer
@a18 = global i32 zeroinitializer
@a19 = global i32 zeroinitializer
@a20 = global i32 zeroinitializer
@a21 = global i32 zeroinitializer
@a22 = global i32 zeroinitializer
@a23 = global i32 zeroinitializer
@a24 = global i32 zeroinitializer
@a25 = global i32 zeroinitializer
@a26 = global i32 zeroinitializer
@a27 = global i32 zeroinitializer
@a28 = global i32 zeroinitializer
@a29 = global i32 zeroinitializer
@a30 = global i32 zeroinitializer
@a31 = global i32 zeroinitializer
@a32 = global i32 zeroinitializer
@a33 = global i32 zeroinitializer
@a34 = global i32 zeroinitializer
@a35 = global i32 zeroinitializer
@a36 = global i32 zeroinitializer
@a37 = global i32 zeroinitializer
@a38 = global i32 zeroinitializer
@a39 = global i32 zeroinitializer
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

define i32 @testParam8(i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3, i32 %arg4, i32 %arg5, i32 %arg6, i32 %arg7) {
label_entry:
  %op8 = add i32 %arg0, %arg1
  %op9 = add i32 %op8, %arg2
  %op10 = add i32 %op9, %arg3
  %op11 = add i32 %op10, %arg4
  %op12 = add i32 %op11, %arg5
  %op13 = add i32 %op12, %arg6
  %op14 = add i32 %op13, %arg7
  ret i32 %op14
}
define i32 @testParam16(i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3, i32 %arg4, i32 %arg5, i32 %arg6, i32 %arg7, i32 %arg8, i32 %arg9, i32 %arg10, i32 %arg11, i32 %arg12, i32 %arg13, i32 %arg14, i32 %arg15) {
label_entry:
  %op16 = add i32 %arg0, %arg1
  %op17 = add i32 %op16, %arg2
  %op18 = sub i32 %op17, %arg3
  %op19 = sub i32 %op18, %arg4
  %op20 = sub i32 %op19, %arg5
  %op21 = sub i32 %op20, %arg6
  %op22 = sub i32 %op21, %arg7
  %op23 = add i32 %op22, %arg8
  %op24 = add i32 %op23, %arg9
  %op25 = add i32 %op24, %arg10
  %op26 = add i32 %op25, %arg11
  %op27 = add i32 %op26, %arg12
  %op28 = add i32 %op27, %arg13
  %op29 = add i32 %op28, %arg14
  %op30 = add i32 %op29, %arg15
  ret i32 %op30
}
define i32 @testParam32(i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3, i32 %arg4, i32 %arg5, i32 %arg6, i32 %arg7, i32 %arg8, i32 %arg9, i32 %arg10, i32 %arg11, i32 %arg12, i32 %arg13, i32 %arg14, i32 %arg15, i32 %arg16, i32 %arg17, i32 %arg18, i32 %arg19, i32 %arg20, i32 %arg21, i32 %arg22, i32 %arg23, i32 %arg24, i32 %arg25, i32 %arg26, i32 %arg27, i32 %arg28, i32 %arg29, i32 %arg30, i32 %arg31) {
label_entry:
  %op32 = add i32 %arg0, %arg1
  %op33 = add i32 %op32, %arg2
  %op34 = add i32 %op33, %arg3
  %op35 = add i32 %op34, %arg4
  %op36 = add i32 %op35, %arg5
  %op37 = add i32 %op36, %arg6
  %op38 = add i32 %op37, %arg7
  %op39 = add i32 %op38, %arg8
  %op40 = add i32 %op39, %arg9
  %op41 = add i32 %op40, %arg10
  %op42 = add i32 %op41, %arg11
  %op43 = add i32 %op42, %arg12
  %op44 = add i32 %op43, %arg13
  %op45 = add i32 %op44, %arg14
  %op46 = add i32 %op45, %arg15
  %op47 = add i32 %op46, %arg16
  %op48 = add i32 %op47, %arg17
  %op49 = sub i32 %op48, %arg18
  %op50 = sub i32 %op49, %arg19
  %op51 = sub i32 %op50, %arg20
  %op52 = sub i32 %op51, %arg21
  %op53 = sub i32 %op52, %arg22
  %op54 = add i32 %op53, %arg23
  %op55 = add i32 %op54, %arg24
  %op56 = add i32 %op55, %arg25
  %op57 = add i32 %op56, %arg26
  %op58 = add i32 %op57, %arg27
  %op59 = add i32 %op58, %arg28
  %op60 = add i32 %op59, %arg29
  %op61 = add i32 %op60, %arg30
  %op62 = add i32 %op61, %arg31
  ret i32 %op62
}
define i32 @main() {
label_entry:
  store i32 0, i32* @a0
  store i32 1, i32* @a1
  store i32 2, i32* @a2
  store i32 3, i32* @a3
  store i32 4, i32* @a4
  store i32 5, i32* @a5
  store i32 6, i32* @a6
  store i32 7, i32* @a7
  store i32 8, i32* @a8
  store i32 9, i32* @a9
  store i32 0, i32* @a10
  store i32 1, i32* @a11
  store i32 2, i32* @a12
  store i32 3, i32* @a13
  store i32 4, i32* @a14
  store i32 5, i32* @a15
  store i32 6, i32* @a16
  store i32 7, i32* @a17
  store i32 8, i32* @a18
  store i32 9, i32* @a19
  store i32 0, i32* @a20
  store i32 1, i32* @a21
  store i32 2, i32* @a22
  store i32 3, i32* @a23
  store i32 4, i32* @a24
  store i32 5, i32* @a25
  store i32 6, i32* @a26
  store i32 7, i32* @a27
  store i32 8, i32* @a28
  store i32 9, i32* @a29
  store i32 0, i32* @a30
  store i32 1, i32* @a31
  store i32 4, i32* @a32
  store i32 5, i32* @a33
  store i32 6, i32* @a34
  store i32 7, i32* @a35
  store i32 8, i32* @a36
  store i32 9, i32* @a37
  store i32 0, i32* @a38
  store i32 1, i32* @a39
  %op0 = load i32, i32* @a0
  %op1 = load i32, i32* @a1
  %op2 = load i32, i32* @a2
  %op3 = load i32, i32* @a3
  %op4 = load i32, i32* @a4
  %op5 = load i32, i32* @a5
  %op6 = load i32, i32* @a6
  %op7 = load i32, i32* @a7
  %op8 = call i32 @testParam8(i32 %op0, i32 %op1, i32 %op2, i32 %op3, i32 %op4, i32 %op5, i32 %op6, i32 %op7)
  store i32 %op8, i32* @a0
  %op9 = load i32, i32* @a0
  call void @putint(i32 %op9)
  %op10 = load i32, i32* @a32
  %op11 = load i32, i32* @a33
  %op12 = load i32, i32* @a34
  %op13 = load i32, i32* @a35
  %op14 = load i32, i32* @a36
  %op15 = load i32, i32* @a37
  %op16 = load i32, i32* @a38
  %op17 = load i32, i32* @a39
  %op18 = load i32, i32* @a8
  %op19 = load i32, i32* @a9
  %op20 = load i32, i32* @a10
  %op21 = load i32, i32* @a11
  %op22 = load i32, i32* @a12
  %op23 = load i32, i32* @a13
  %op24 = load i32, i32* @a14
  %op25 = load i32, i32* @a15
  %op26 = call i32 @testParam16(i32 %op10, i32 %op11, i32 %op12, i32 %op13, i32 %op14, i32 %op15, i32 %op16, i32 %op17, i32 %op18, i32 %op19, i32 %op20, i32 %op21, i32 %op22, i32 %op23, i32 %op24, i32 %op25)
  store i32 %op26, i32* @a0
  %op27 = load i32, i32* @a0
  call void @putint(i32 %op27)
  %op28 = load i32, i32* @a0
  %op29 = load i32, i32* @a1
  %op30 = load i32, i32* @a2
  %op31 = load i32, i32* @a3
  %op32 = load i32, i32* @a4
  %op33 = load i32, i32* @a5
  %op34 = load i32, i32* @a6
  %op35 = load i32, i32* @a7
  %op36 = load i32, i32* @a8
  %op37 = load i32, i32* @a9
  %op38 = load i32, i32* @a10
  %op39 = load i32, i32* @a11
  %op40 = load i32, i32* @a12
  %op41 = load i32, i32* @a13
  %op42 = load i32, i32* @a14
  %op43 = load i32, i32* @a15
  %op44 = load i32, i32* @a16
  %op45 = load i32, i32* @a17
  %op46 = load i32, i32* @a18
  %op47 = load i32, i32* @a19
  %op48 = load i32, i32* @a20
  %op49 = load i32, i32* @a21
  %op50 = load i32, i32* @a22
  %op51 = load i32, i32* @a23
  %op52 = load i32, i32* @a24
  %op53 = load i32, i32* @a25
  %op54 = load i32, i32* @a26
  %op55 = load i32, i32* @a27
  %op56 = load i32, i32* @a28
  %op57 = load i32, i32* @a29
  %op58 = load i32, i32* @a30
  %op59 = load i32, i32* @a31
  %op60 = call i32 @testParam32(i32 %op28, i32 %op29, i32 %op30, i32 %op31, i32 %op32, i32 %op33, i32 %op34, i32 %op35, i32 %op36, i32 %op37, i32 %op38, i32 %op39, i32 %op40, i32 %op41, i32 %op42, i32 %op43, i32 %op44, i32 %op45, i32 %op46, i32 %op47, i32 %op48, i32 %op49, i32 %op50, i32 %op51, i32 %op52, i32 %op53, i32 %op54, i32 %op55, i32 %op56, i32 %op57, i32 %op58, i32 %op59)
  store i32 %op60, i32* @a0
  %op61 = load i32, i32* @a0
  call void @putint(i32 %op61)
  ret i32 0
}
