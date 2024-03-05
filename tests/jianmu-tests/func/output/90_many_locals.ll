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
  %op1 = add i32 3, 7
  %op2 = add i32 %op1, 5
  %op3 = add i32 %op2, 6
  %op4 = add i32 %op3, 1
  %op5 = add i32 %op4, 0
  %op6 = add i32 %op5, 3
  %op7 = add i32 %op6, 5
  %op8 = add i32 4, 2
  %op9 = add i32 %op8, 7
  %op10 = add i32 %op9, 9
  %op11 = add i32 %op10, 8
  %op12 = add i32 %op11, 1
  %op13 = add i32 %op12, 4
  %op14 = add i32 %op13, 6
  %op15 = add i32 %op7, %op14
  %op16 = icmp slt i32 3, zeroinitializer
  %op17 = zext i1 %op16 to i32
  %op18 = add i32 %op17, zeroinitializer
  %op19 = icmp ne i32 %op18, zeroinitializer
  br i1 %op19, label %label_arr_ltz0, label %label_arr_gtz1
label_arr_ltz0:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_arr_gtz1
label_arr_gtz1:                                                ; preds = %label_entry, %label_arr_ltz0
  %op20 = getelementptr [16 x i32], [16 x i32]* %op0, i32 0, i32 3
  %op21 = load i32, i32* %op20
  %op22 = add i32 %op15, %op21
  ret i32 %op22
}
define i32 @main() {
label_entry:
  %op0 = add i32 3, 7
  %op1 = add i32 %op0, 5
  %op2 = add i32 %op1, 6
  %op3 = add i32 %op2, 1
  %op4 = add i32 %op3, 0
  %op5 = add i32 %op4, 3
  %op6 = add i32 %op5, 5
  %op7 = add i32 4, 2
  %op8 = add i32 %op7, 7
  %op9 = add i32 %op8, 9
  %op10 = add i32 %op9, 8
  %op11 = add i32 %op10, 1
  %op12 = add i32 %op11, 4
  %op13 = add i32 %op12, 6
  %op14 = call i32 @foo()
  %op15 = add i32 %op6, %op14
  %op16 = call i32 @foo()
  %op17 = add i32 %op13, %op16
  %op18 = add i32 4, 7
  %op19 = add i32 %op18, 2
  %op20 = add i32 %op19, 5
  %op21 = add i32 %op20, 8
  %op22 = add i32 %op21, 0
  %op23 = add i32 %op22, 6
  %op24 = add i32 %op23, 3
  %op25 = add i32 %op15, %op17
  %op26 = add i32 %op25, %op24
  call void @putint(i32 %op26)
  call void @putch(i32 10)
  ret i32 0
}
