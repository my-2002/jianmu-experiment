; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/jianmu-tests/func/03_arr_defn2.sy"

@a = global [10 x [10 x i32]] zeroinitializer
declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  ret i32 0
}
