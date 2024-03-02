; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/jianmu-tests/func/78_side_effect.sy"

@a = global i32 -1
@b = global i32 1
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

define i32 @inc_a() {
label_entry:
  %op0 = load i32, i32* @a
  %op1 = alloca i32
  store i32 %op0, i32* %op1
  %op2 = load i32, i32* %op1
  %op3 = add i32 %op2, 1
  store i32 %op3, i32* %op1
  %op4 = load i32, i32* %op1
  store i32 %op4, i32* @a
  %op5 = load i32, i32* @a
  ret i32 %op5
}
define i32 @main() {
label_entry:
  %op0 = alloca i32
  store i32 5, i32* %op0
  br label %label_condition0
label_condition0:                                                ; preds = %label_entry, %label_ret13
  %op1 = icmp sgt i32 0, zeroinitializer
  br i1 %op1, label %label_loop1, label %label_ret2
label_loop1:                                                ; preds = %label_condition0
  %op2 = call i32 @inc_a()
  %op3 = icmp sge i32 %op2, zeroinitializer
  br i1 %op3, label %label_true3, label %label_false4
label_ret2:                                                ; preds = %label_condition0
  %op4 = load i32, i32* @a
  call void @putint(i32 %op4)
  call void @putch(i32 32)
  %op5 = load i32, i32* @b
  call void @putint(i32 %op5)
  call void @putch(i32 10)
  %op6 = load i32, i32* @a
  ret i32 %op6
label_true3:                                                ; preds = %label_loop1
  %op7 = call i32 @inc_a()
  %op8 = icmp sgt i32 %op7, zeroinitializer
  br label %label_ret5
label_false4:                                                ; preds = %label_loop1
  br label %label_ret5
label_ret5:                                                ; preds = %label_true3, %label_false4
  %op9 = icmp sgt i32 0, zeroinitializer
  br i1 %op9, label %label_true6, label %label_ret7
label_true6:                                                ; preds = %label_ret5
  %op10 = load i32, i32* @a
  call void @putint(i32 %op10)
  call void @putch(i32 32)
  %op11 = load i32, i32* @b
  call void @putint(i32 %op11)
  call void @putch(i32 10)
  call void @putint(i32 111)
  br label %label_ret7
label_ret7:                                                ; preds = %label_ret5, %label_true6
  %op12 = call i32 @inc_a()
  %op13 = icmp sge i32 %op12, zeroinitializer
  br i1 %op13, label %label_true8, label %label_false9
label_true8:                                                ; preds = %label_ret7
  %op14 = call i32 @inc_a()
  %op15 = call i32 @inc_a()
  %op16 = sub i32 %op14, %op15
  %op17 = add i32 %op16, 1
  %op18 = icmp sgt i32 %op17, zeroinitializer
  br label %label_ret10
label_false9:                                                ; preds = %label_ret7
  br label %label_ret10
label_ret10:                                                ; preds = %label_true8, %label_false9
  br i1 %op9, label %label_true11, label %label_false12
label_true11:                                                ; preds = %label_ret10
  %op19 = load i32, i32* @a
  call void @putint(i32 %op19)
  call void @putch(i32 10)
  %op20 = load i32, i32* @b
  %op21 = mul i32 %op20, 2
  store i32 %op21, i32* @b
  call void @putint(i32 222)
  br label %label_ret13
label_false12:                                                ; preds = %label_ret10
  %op22 = call i32 @inc_a()
  call void @putint(i32 333)
  br label %label_ret13
label_ret13:                                                ; preds = %label_true11, %label_false12
  %op23 = load i32, i32* %op0
  %op24 = sub i32 %op23, 1
  store i32 %op24, i32* %op0
  call void @putch(i32 10)
  call void @putch(i32 97)
  %op25 = load i32, i32* @a
  call void @putint(i32 %op25)
  call void @putch(i32 10)
  br label %label_condition0
}
