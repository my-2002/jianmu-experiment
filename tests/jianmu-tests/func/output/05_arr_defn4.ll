; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/jianmu-tests/func/05_arr_defn4.sy"

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
  %op1 = icmp slt i32 0, zeroinitializer
  %op2 = zext i1 %op1 to i32
  %op3 = add i32 %op2, zeroinitializer
  %op4 = icmp slt i32 3, zeroinitializer
  %op5 = zext i1 %op4 to i32
  %op6 = add i32 %op5, %op3
  %op7 = icmp ne i32 %op6, zeroinitializer
  br i1 %op7, label %label_a_ltz0, label %label_a_gtz1
label_a_ltz0:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_a_gtz1
label_a_gtz1:                                                ; preds = %label_entry, %label_a_ltz0
  %op8 = alloca [4 x [2 x i32]]
  %op9 = icmp slt i32 2, zeroinitializer
  %op10 = zext i1 %op9 to i32
  %op11 = add i32 %op10, zeroinitializer
  %op12 = icmp slt i32 1, zeroinitializer
  %op13 = zext i1 %op12 to i32
  %op14 = add i32 %op13, %op11
  %op15 = icmp ne i32 %op14, zeroinitializer
  br i1 %op15, label %label_d_ltz2, label %label_d_gtz3
label_d_ltz2:                                                ; preds = %label_a_gtz1
  call void @neg_idx_except()
  br label %label_d_gtz3
label_d_gtz3:                                                ; preds = %label_a_gtz1, %label_d_ltz2
  %op16 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op8, i32 0, i32 2, i32 1
  %op17 = load i32, i32* %op16
  %op18 = icmp slt i32 2, zeroinitializer
  %op19 = zext i1 %op18 to i32
  %op20 = add i32 %op19, zeroinitializer
  %op21 = icmp slt i32 1, zeroinitializer
  %op22 = zext i1 %op21 to i32
  %op23 = add i32 %op22, %op20
  %op24 = icmp ne i32 %op23, zeroinitializer
  br i1 %op24, label %label_c_ltz4, label %label_c_gtz5
label_c_ltz4:                                                ; preds = %label_d_gtz3
  call void @neg_idx_except()
  br label %label_c_gtz5
label_c_gtz5:                                                ; preds = %label_d_gtz3, %label_c_ltz4
  %op25 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op0, i32 0, i32 2, i32 1
  %op26 = load i32, i32* %op25
  %op27 = alloca [4 x [2 x [1 x i32]]]
  %op28 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op27, i32 0, i32 0, i32 1, i32 0
  store i32 %op26, i32* %op28
  %op29 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op27, i32 0, i32 0, i32 2, i32 0
  store i32 %op17, i32* %op29
  %op30 = icmp slt i32 3, zeroinitializer
  %op31 = zext i1 %op30 to i32
  %op32 = add i32 %op31, zeroinitializer
  %op33 = icmp slt i32 1, zeroinitializer
  %op34 = zext i1 %op33 to i32
  %op35 = add i32 %op34, %op32
  %op36 = icmp slt i32 0, zeroinitializer
  %op37 = zext i1 %op36 to i32
  %op38 = add i32 %op37, %op35
  %op39 = icmp ne i32 %op38, zeroinitializer
  br i1 %op39, label %label_e_ltz6, label %label_e_gtz7
label_e_ltz6:                                                ; preds = %label_c_gtz5
  call void @neg_idx_except()
  br label %label_e_gtz7
label_e_gtz7:                                                ; preds = %label_c_gtz5, %label_e_ltz6
  %op40 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op27, i32 0, i32 3, i32 1, i32 0
  %op41 = load i32, i32* %op40
  %op42 = icmp slt i32 0, zeroinitializer
  %op43 = zext i1 %op42 to i32
  %op44 = add i32 %op43, zeroinitializer
  %op45 = icmp slt i32 0, zeroinitializer
  %op46 = zext i1 %op45 to i32
  %op47 = add i32 %op46, %op44
  %op48 = icmp slt i32 0, zeroinitializer
  %op49 = zext i1 %op48 to i32
  %op50 = add i32 %op49, %op47
  %op51 = icmp ne i32 %op50, zeroinitializer
  br i1 %op51, label %label_e_ltz8, label %label_e_gtz9
label_e_ltz8:                                                ; preds = %label_e_gtz7
  call void @neg_idx_except()
  br label %label_e_gtz9
label_e_gtz9:                                                ; preds = %label_e_gtz7, %label_e_ltz8
  %op52 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op27, i32 0, i32 0, i32 0, i32 0
  %op53 = load i32, i32* %op52
  %op54 = add i32 %op41, %op53
  %op55 = icmp slt i32 0, zeroinitializer
  %op56 = zext i1 %op55 to i32
  %op57 = add i32 %op56, zeroinitializer
  %op58 = icmp slt i32 1, zeroinitializer
  %op59 = zext i1 %op58 to i32
  %op60 = add i32 %op59, %op57
  %op61 = icmp slt i32 0, zeroinitializer
  %op62 = zext i1 %op61 to i32
  %op63 = add i32 %op62, %op60
  %op64 = icmp ne i32 %op63, zeroinitializer
  br i1 %op64, label %label_e_ltz10, label %label_e_gtz11
label_e_ltz10:                                                ; preds = %label_e_gtz9
  call void @neg_idx_except()
  br label %label_e_gtz11
label_e_gtz11:                                                ; preds = %label_e_gtz9, %label_e_ltz10
  %op65 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op27, i32 0, i32 0, i32 1, i32 0
  %op66 = load i32, i32* %op65
  %op67 = add i32 %op54, %op66
  %op68 = icmp slt i32 3, zeroinitializer
  %op69 = zext i1 %op68 to i32
  %op70 = add i32 %op69, zeroinitializer
  %op71 = icmp slt i32 0, zeroinitializer
  %op72 = zext i1 %op71 to i32
  %op73 = add i32 %op72, %op70
  %op74 = icmp ne i32 %op73, zeroinitializer
  br i1 %op74, label %label_d_ltz12, label %label_d_gtz13
label_d_ltz12:                                                ; preds = %label_e_gtz11
  call void @neg_idx_except()
  br label %label_d_gtz13
label_d_gtz13:                                                ; preds = %label_e_gtz11, %label_d_ltz12
  %op75 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op8, i32 0, i32 3, i32 0
  %op76 = load i32, i32* %op75
  %op77 = add i32 %op67, %op76
  ret i32 %op77
}
