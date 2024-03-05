; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/jianmu-tests/func/my_test.sy"

@a = global i32 2
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

define i32 @test() {
label_entry:
  %op0 = load i32, i32* @a
  %op1 = add i32 %op0, 1
  store i32 %op1, i32* @a
  %op2 = load i32, i32* @a
  ret i32 %op2
}
define i32 @main() {
label_entry:
  %op0 = call i32 @test()
  %op1 = icmp sgt i32 %op0, zeroinitializer
  br i1 %op1, label %label_true0, label %label_ret1
label_true0:                                                ; preds = %label_entry
  call void @putint(i32 666)
  br label %label_ret1
label_ret1:                                                ; preds = %label_entry, %label_true0
  %op2 = load i32, i32* @a
  call void @putint(i32 %op2)
  ret i32 0
}
