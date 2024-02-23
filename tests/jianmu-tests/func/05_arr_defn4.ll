; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/jianmu-tests/func/05_arr_defn4.sy"

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
  %op0 = alloca [4 x [2 x i32]]
  store [4 x [2 x i32]] [4 x [2 x i32]] [[2 x i32]zeroinitializer, [2 x i32]zeroinitializer, [2 x i32]zeroinitializer, [2 x i32]zeroinitializer, ], [4 x [2 x i32]]* %op0
  %op1 = alloca [4 x [2 x i32]]
  store [4 x [2 x i32]] [4 x [2 x i32]] [[2 x i32] [i321, i322, ], [2 x i32] [i323, i324, ], [2 x i32] [i325, i326, ], [2 x i32] [i327, i328, ], ], [4 x [2 x i32]]* %op1
  %op2 = icmp slt i32 0, zeroinitializer
  %op3 = zext i1 %op2 to i32
  %op4 = add i32 %op3, zeroinitializer
  %op5 = icmp slt i32 3, zeroinitializer
  %op6 = zext i1 %op5 to i32
  %op7 = add i32 %op6, %op4
  %op8 = icmp ne i32 %op7, zeroinitializer
  br i1 %op8, label %label_a_ltz0, label %label_a_gtz1
label_a_ltz0:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_a_gtz1
label_a_gtz1:                                                ; preds = %label_entry, %label_a_ltz0
  %op9 = alloca [4 x [2 x i32]]
  store [4 x [2 x i32]] [4 x [2 x i32]] [[2 x i32] [i321, i322, ], [2 x i32] [i323, i32zeroinitializer, ], [2 x i32] [i325, i32zeroinitializer, ], [2 x i32] [i327, i328, ], ], [4 x [2 x i32]]* %op9
  ret i32 0
}
