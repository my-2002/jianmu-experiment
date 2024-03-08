; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/all_test_cases/hidden_functional/01_multiple_returns.sy"

declare void @neg_idx_except()

declare i32 @getint()

declare i32 @getch()

declare float @getfloat()

declare i32 @getarray(i32*)

declare i32 @getfarray(float*)

declare void @putint(i32)

declare void @putch(i32)

declare void @putarray(i32, i32*)

declare void @putfloat(float)

declare void @putfarray(i32, float*)

declare void @putf(i32*)

declare void @starttime()

declare void @stoptime()

define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  store i32 8, i32* %op1
  %op2 = alloca i32
  store i32 12, i32* %op2
  %op3 = load i32, i32* %op1
  %op4 = load i32, i32* %op2
  %op5 = add i32 %op3, %op4
  store i32 %op5, i32* %op0
  %op6 = load i32, i32* %op0
  ret i32 %op6
}
