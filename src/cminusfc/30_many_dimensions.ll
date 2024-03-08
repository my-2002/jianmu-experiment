; ModuleID = 'sysy'
source_filename = "/home/my2002/compiler_principles/lab5/jianmu-experiment/tests/all_test_cases/hidden_functional/30_many_dimensions.sy"

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
  %op0 = alloca [2 x [2 x i32]]
  store [2 x [2 x i32]] [[2 x i32] [i32 0, i32 zeroinitializer], [2 x i32] zeroinitializer], [2 x [2 x i32]]* %op0
  ret i32 0
}
