; ModuleID = 'sysy'
source_filename = "/home/my2002/compiler_principles/lab5/jianmu-experiment/tests/jianmu-tests/func/05_arr_defn4.sy"

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
  %op0 = alloca [4 x [2 x i32]]
  store [4 x [2 x i32]] [4 x [2 x i32]] [[2 x i32] zeroinitializer, [2 x i32] zeroinitializer, [2 x i32] zeroinitializer, [2 x i32] zeroinitializer], [4 x [2 x i32]]* %op0
  %op1 = alloca [4 x [2 x i32]]
  store [4 x [2 x i32]] [4 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 4], [2 x i32] [i32 5, i32 6], [2 x i32] [i32 7, i32 8]], [4 x [2 x i32]]* %op1
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
  store [4 x [2 x i32]] [4 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 zeroinitializer], [2 x i32] [i32 5, i32 zeroinitializer], [2 x i32] [i32 7, i32 8]], [4 x [2 x i32]]* %op9
  %op10 = icmp slt i32 1, zeroinitializer
  %op11 = zext i1 %op10 to i32
  %op12 = add i32 %op11, zeroinitializer
  %op13 = icmp slt i32 2, zeroinitializer
  %op14 = zext i1 %op13 to i32
  %op15 = add i32 %op14, %op12
  %op16 = icmp ne i32 %op15, zeroinitializer
  br i1 %op16, label %label_d_ltz2, label %label_d_gtz3
label_d_ltz2:                                                ; preds = %label_a_gtz1
  call void @neg_idx_except()
  br label %label_d_gtz3
label_d_gtz3:                                                ; preds = %label_a_gtz1, %label_d_ltz2
  %op17 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op9, i32 0, i32 1, i32 2
  %op18 = load i32, i32* %op17
  %op19 = icmp slt i32 1, zeroinitializer
  %op20 = zext i1 %op19 to i32
  %op21 = add i32 %op20, zeroinitializer
  %op22 = icmp slt i32 2, zeroinitializer
  %op23 = zext i1 %op22 to i32
  %op24 = add i32 %op23, %op21
  %op25 = icmp ne i32 %op24, zeroinitializer
  br i1 %op25, label %label_c_ltz4, label %label_c_gtz5
label_c_ltz4:                                                ; preds = %label_d_gtz3
  call void @neg_idx_except()
  br label %label_c_gtz5
label_c_gtz5:                                                ; preds = %label_d_gtz3, %label_c_ltz4
  %op26 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op1, i32 0, i32 1, i32 2
  %op27 = load i32, i32* %op26
  %op28 = alloca [4 x [2 x [1 x i32]]]
  store [4 x [2 x [1 x i32]]] [4 x [2 x [1 x i32]]] [[2 x [1 x i32]] [[1 x i32] [i32 zeroinitializer], [1 x i32] [i32 zeroinitializer]], [2 x [1 x i32]] [[1 x i32] [i32 3], [1 x i32] [i32 4]], [2 x [1 x i32]] [[1 x i32] [i32 5], [1 x i32] [i32 6]], [2 x [1 x i32]] [[1 x i32] [i32 7], [1 x i32] [i32 8]]], [4 x [2 x [1 x i32]]]* %op28
  %op29 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op28, i32 0, i32 0, i32 1, i32 0
  store i32 %op27, i32* %op29
  %op30 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op28, i32 0, i32 0, i32 2, i32 0
  store i32 %op18, i32* %op30
  %op31 = icmp slt i32 0, zeroinitializer
  %op32 = zext i1 %op31 to i32
  %op33 = add i32 %op32, zeroinitializer
  %op34 = icmp slt i32 1, zeroinitializer
  %op35 = zext i1 %op34 to i32
  %op36 = add i32 %op35, %op33
  %op37 = icmp slt i32 3, zeroinitializer
  %op38 = zext i1 %op37 to i32
  %op39 = add i32 %op38, %op36
  %op40 = icmp ne i32 %op39, zeroinitializer
  br i1 %op40, label %label_e_ltz6, label %label_e_gtz7
label_e_ltz6:                                                ; preds = %label_c_gtz5
  call void @neg_idx_except()
  br label %label_e_gtz7
label_e_gtz7:                                                ; preds = %label_c_gtz5, %label_e_ltz6
  %op41 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op28, i32 0, i32 0, i32 1, i32 3
  %op42 = load i32, i32* %op41
  %op43 = icmp slt i32 0, zeroinitializer
  %op44 = zext i1 %op43 to i32
  %op45 = add i32 %op44, zeroinitializer
  %op46 = icmp slt i32 0, zeroinitializer
  %op47 = zext i1 %op46 to i32
  %op48 = add i32 %op47, %op45
  %op49 = icmp slt i32 0, zeroinitializer
  %op50 = zext i1 %op49 to i32
  %op51 = add i32 %op50, %op48
  %op52 = icmp ne i32 %op51, zeroinitializer
  br i1 %op52, label %label_e_ltz8, label %label_e_gtz9
label_e_ltz8:                                                ; preds = %label_e_gtz7
  call void @neg_idx_except()
  br label %label_e_gtz9
label_e_gtz9:                                                ; preds = %label_e_gtz7, %label_e_ltz8
  %op53 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op28, i32 0, i32 0, i32 0, i32 0
  %op54 = load i32, i32* %op53
  %op55 = add i32 %op42, %op54
  %op56 = icmp slt i32 0, zeroinitializer
  %op57 = zext i1 %op56 to i32
  %op58 = add i32 %op57, zeroinitializer
  %op59 = icmp slt i32 1, zeroinitializer
  %op60 = zext i1 %op59 to i32
  %op61 = add i32 %op60, %op58
  %op62 = icmp slt i32 0, zeroinitializer
  %op63 = zext i1 %op62 to i32
  %op64 = add i32 %op63, %op61
  %op65 = icmp ne i32 %op64, zeroinitializer
  br i1 %op65, label %label_e_ltz10, label %label_e_gtz11
label_e_ltz10:                                                ; preds = %label_e_gtz9
  call void @neg_idx_except()
  br label %label_e_gtz11
label_e_gtz11:                                                ; preds = %label_e_gtz9, %label_e_ltz10
  %op66 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op28, i32 0, i32 0, i32 1, i32 0
  %op67 = load i32, i32* %op66
  %op68 = add i32 %op55, %op67
  %op69 = icmp slt i32 0, zeroinitializer
  %op70 = zext i1 %op69 to i32
  %op71 = add i32 %op70, zeroinitializer
  %op72 = icmp slt i32 3, zeroinitializer
  %op73 = zext i1 %op72 to i32
  %op74 = add i32 %op73, %op71
  %op75 = icmp ne i32 %op74, zeroinitializer
  br i1 %op75, label %label_d_ltz12, label %label_d_gtz13
label_d_ltz12:                                                ; preds = %label_e_gtz11
  call void @neg_idx_except()
  br label %label_d_gtz13
label_d_gtz13:                                                ; preds = %label_e_gtz11, %label_d_ltz12
  %op76 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op9, i32 0, i32 0, i32 3
  %op77 = load i32, i32* %op76
  %op78 = add i32 %op68, %op77
  ret i32 %op78
}
