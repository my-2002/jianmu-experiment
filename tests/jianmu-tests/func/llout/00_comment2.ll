; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/jianmu-tests/func/00_comment2.sy"

declare void @neg_idx_except()

declare i32 @getint()

declare i32 @getch()

declare float @getfloat()

declare i32 @getarray(i32*)

declare i32 @getfarray(i32*)

declare i32 @putint(i32)

declare i32 @putch(i32)

declare i32 @putarray(i32, i32*)

declare float @putfloat(float)

declare i32 @putfarray(float*)

declare i32 @putf(i32*)

declare void @starttime()

declare void @stoptime()

define i32 @main() {
label_entry:
  ret i32 3
}
