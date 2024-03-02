; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/jianmu-tests/func/08_global_arr_init.sy"

@i = global [2 x [3 x [4 x i32]]] [[3 x [4 x i32]] [[4 x i32] [i32 1, i32 2, i32 3, i32 4], [4 x i32] [i32 5, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer], [4 x i32] [i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer]], [3 x [4 x i32]] zeroinitializer]
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

define i32 @main() {
label_entry:
  ret i32 5
}
