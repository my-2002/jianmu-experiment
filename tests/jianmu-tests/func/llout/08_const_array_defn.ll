; ModuleID = 'sysy'
source_filename = "/home/my2002/compiler_principles/lab5/jianmu-experiment/tests/jianmu-tests/func/08_const_array_defn.sy"

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
  %op0 = icmp slt i32 4, zeroinitializer
  %op1 = zext i1 %op0 to i32
  %op2 = add i32 %op1, zeroinitializer
  %op3 = icmp ne i32 %op2, zeroinitializer
  br i1 %op3, label %label_a_ltz0, label %label_a_gtz1
label_a_ltz0:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_a_gtz1
label_a_gtz1:                                                ; preds = %label_entry, %label_a_ltz0
  ret i32 4
}
