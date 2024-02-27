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
label_condition0:                                                ; preds = %label_entry, %label_ret7
  %op1 = load i32, i32* %op0
  %op2 = add i32 %op1, 0
  %op3 = icmp sge i32 %op1, 0
  %op4 = zext i1 %op3 to i32
  %op5 = icmp sgt i32 %op4, zeroinitializer
  br i1 %op5, label %label_loop1, label %label_ret2
label_loop1:                                                ; preds = %label_condition0
  %op6 = call i32 @inc_a()
  %op7 = call i32 @inc_a()
  %op8 = call i32 @inc_a()
  %op9 = add i32 %op8, %op7
  %op10 = icmp eq i32 %op9, 2
  %op11 = zext i1 %op10 to i32
  %op12 = add i32 %op11, %op6
  %op13 = icmp eq i32 %op12, 2
  %op14 = zext i1 %op13 to i32
  %op15 = icmp sgt i32 %op14, zeroinitializer
  br i1 %op15, label %label_true3, label %label_ret4
label_ret2:                                                ; preds = %label_condition0
  %op16 = load i32, i32* @a
  call void @putint(i32 %op16)
  call void @putch(i32 32)
  %op17 = load i32, i32* @b
  call void @putint(i32 %op17)
  call void @putch(i32 10)
  %op18 = load i32, i32* @a
  ret i32 %op18
label_true3:                                                ; preds = %label_loop1
  %op19 = load i32, i32* @a
  call void @putint(i32 %op19)
  call void @putch(i32 32)
  %op20 = load i32, i32* @b
  call void @putint(i32 %op20)
  call void @putch(i32 10)
  br label %label_ret4
label_ret4:                                                ; preds = %label_loop1, %label_true3
  %op21 = call i32 @inc_a()
  %op22 = call i32 @inc_a()
  %op23 = sub i32 %op21, %op22
  %op24 = add i32 %op23, 1
  %op25 = call i32 @inc_a()
  %op26 = add i32 %op25, %op24
  %op27 = icmp eq i32 %op26, 2
  %op28 = zext i1 %op27 to i32
  %op29 = call i32 @inc_a()
  %op30 = add i32 %op29, 14
  %op31 = icmp slt i32 %op29, 14
  %op32 = zext i1 %op31 to i32
  %op33 = add i32 %op32, %op28
  %op34 = icmp sge i32 %op33, 1
  %op35 = zext i1 %op34 to i32
  %op36 = icmp sgt i32 %op35, zeroinitializer
  br i1 %op36, label %label_true5, label %label_false6
label_true5:                                                ; preds = %label_ret4
  %op37 = load i32, i32* @a
  call void @putint(i32 %op37)
  call void @putch(i32 10)
  %op38 = load i32, i32* @b
  %op39 = mul i32 %op38, 2
  store i32 %op39, i32* @b
  br label %label_ret7
label_false6:                                                ; preds = %label_ret4
  %op40 = call i32 @inc_a()
  br label %label_ret7
label_ret7:                                                ; preds = %label_true5, %label_false6
  %op41 = load i32, i32* %op0
  %op42 = sub i32 %op41, 1
  store i32 %op42, i32* %op0
  br label %label_condition0
}
