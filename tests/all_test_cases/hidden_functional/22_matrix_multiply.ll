; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/all_test_cases/hidden_functional/22_matrix_multiply.sy"

@MAX_SIZE = constant i32 100
@a = global [100 x [100 x i32]] zeroinitializer
@b = global [100 x [100 x i32]] zeroinitializer
@res = global [100 x [100 x i32]] zeroinitializer
@n1 = global i32 zeroinitializer
@m1 = global i32 zeroinitializer
@n2 = global i32 zeroinitializer
@m2 = global i32 zeroinitializer
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

define void @matrix_multiply() {
label_entry:
  %op0 = alloca i32
  store i32 0, i32* %op0
  br label %label_condition0
label_condition0:                                                ; preds = %label_entry, %label_ret5
  %op1 = load i32, i32* %op0
  %op2 = load i32, i32* @m1
  %op3 = icmp slt i32 %op1, %op2
  %op4 = zext i1 %op3 to i32
  %op5 = icmp sgt i32 %op4, zeroinitializer
  br i1 %op5, label %label_loop1, label %label_ret2
label_loop1:                                                ; preds = %label_condition0
  %op6 = alloca i32
  store i32 0, i32* %op6
  br label %label_condition3
label_ret2:                                                ; preds = %label_condition0
  ret void
label_condition3:                                                ; preds = %label_loop1, %label_ret8
  %op7 = load i32, i32* %op6
  %op8 = load i32, i32* @n2
  %op9 = icmp slt i32 %op7, %op8
  %op10 = zext i1 %op9 to i32
  %op11 = icmp sgt i32 %op10, zeroinitializer
  br i1 %op11, label %label_loop4, label %label_ret5
label_loop4:                                                ; preds = %label_condition3
  %op12 = alloca i32
  store i32 0, i32* %op12
  br label %label_condition6
label_ret5:                                                ; preds = %label_condition3
  %op13 = load i32, i32* %op0
  %op14 = add i32 %op13, 1
  store i32 %op14, i32* %op0
  br label %label_condition0
label_condition6:                                                ; preds = %label_loop4, %label_b_gtz16
  %op15 = load i32, i32* %op12
  %op16 = load i32, i32* @n1
  %op17 = icmp slt i32 %op15, %op16
  %op18 = zext i1 %op17 to i32
  %op19 = icmp sgt i32 %op18, zeroinitializer
  br i1 %op19, label %label_loop7, label %label_ret8
label_loop7:                                                ; preds = %label_condition6
  %op20 = load i32, i32* %op6
  %op21 = load i32, i32* %op0
  %op22 = icmp slt i32 %op21, zeroinitializer
  %op23 = zext i1 %op22 to i32
  %op24 = add i32 %op23, zeroinitializer
  %op25 = icmp slt i32 %op20, zeroinitializer
  %op26 = zext i1 %op25 to i32
  %op27 = add i32 %op26, %op24
  %op28 = icmp ne i32 %op27, zeroinitializer
  br i1 %op28, label %label_res_ltz9, label %label_res_gtz10
label_ret8:                                                ; preds = %label_condition6
  %op29 = load i32, i32* %op6
  %op30 = add i32 %op29, 1
  store i32 %op30, i32* %op6
  br label %label_condition3
label_res_ltz9:                                                ; preds = %label_loop7
  call void @neg_idx_except()
  br label %label_res_gtz10
label_res_gtz10:                                                ; preds = %label_loop7, %label_res_ltz9
  %op31 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* @res, i32 0, i32 %op21, i32 %op20
  %op32 = load i32, i32* %op6
  %op33 = load i32, i32* %op0
  %op34 = icmp slt i32 %op33, zeroinitializer
  %op35 = zext i1 %op34 to i32
  %op36 = add i32 %op35, zeroinitializer
  %op37 = icmp slt i32 %op32, zeroinitializer
  %op38 = zext i1 %op37 to i32
  %op39 = add i32 %op38, %op36
  %op40 = icmp ne i32 %op39, zeroinitializer
  br i1 %op40, label %label_res_ltz11, label %label_res_gtz12
label_res_ltz11:                                                ; preds = %label_res_gtz10
  call void @neg_idx_except()
  br label %label_res_gtz12
label_res_gtz12:                                                ; preds = %label_res_gtz10, %label_res_ltz11
  %op41 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* @res, i32 0, i32 %op33, i32 %op32
  %op42 = load i32, i32* %op41
  %op43 = load i32, i32* %op12
  %op44 = load i32, i32* %op0
  %op45 = icmp slt i32 %op44, zeroinitializer
  %op46 = zext i1 %op45 to i32
  %op47 = add i32 %op46, zeroinitializer
  %op48 = icmp slt i32 %op43, zeroinitializer
  %op49 = zext i1 %op48 to i32
  %op50 = add i32 %op49, %op47
  %op51 = icmp ne i32 %op50, zeroinitializer
  br i1 %op51, label %label_a_ltz13, label %label_a_gtz14
label_a_ltz13:                                                ; preds = %label_res_gtz12
  call void @neg_idx_except()
  br label %label_a_gtz14
label_a_gtz14:                                                ; preds = %label_res_gtz12, %label_a_ltz13
  %op52 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* @a, i32 0, i32 %op44, i32 %op43
  %op53 = load i32, i32* %op52
  %op54 = load i32, i32* %op6
  %op55 = load i32, i32* %op12
  %op56 = icmp slt i32 %op55, zeroinitializer
  %op57 = zext i1 %op56 to i32
  %op58 = add i32 %op57, zeroinitializer
  %op59 = icmp slt i32 %op54, zeroinitializer
  %op60 = zext i1 %op59 to i32
  %op61 = add i32 %op60, %op58
  %op62 = icmp ne i32 %op61, zeroinitializer
  br i1 %op62, label %label_b_ltz15, label %label_b_gtz16
label_b_ltz15:                                                ; preds = %label_a_gtz14
  call void @neg_idx_except()
  br label %label_b_gtz16
label_b_gtz16:                                                ; preds = %label_a_gtz14, %label_b_ltz15
  %op63 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* @b, i32 0, i32 %op55, i32 %op54
  %op64 = load i32, i32* %op63
  %op65 = mul i32 %op53, %op64
  %op66 = add i32 %op42, %op65
  store i32 %op66, i32* %op31
  %op67 = load i32, i32* %op12
  %op68 = add i32 %op67, 1
  store i32 %op68, i32* %op12
  br label %label_condition6
}
define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  %op2 = call i32 @getint()
  store i32 %op2, i32* @m1
  %op3 = call i32 @getint()
  store i32 %op3, i32* @n1
  store i32 0, i32* %op0
  br label %label_condition17
label_condition17:                                                ; preds = %label_entry, %label_ret22
  %op4 = load i32, i32* %op0
  %op5 = load i32, i32* @m1
  %op6 = icmp slt i32 %op4, %op5
  %op7 = zext i1 %op6 to i32
  %op8 = icmp sgt i32 %op7, zeroinitializer
  br i1 %op8, label %label_loop18, label %label_ret19
label_loop18:                                                ; preds = %label_condition17
  store i32 0, i32* %op1
  br label %label_condition20
label_ret19:                                                ; preds = %label_condition17
  %op9 = call i32 @getint()
  store i32 %op9, i32* @m2
  %op10 = call i32 @getint()
  store i32 %op10, i32* @n2
  store i32 0, i32* %op0
  br label %label_condition25
label_condition20:                                                ; preds = %label_loop18, %label_a_gtz24
  %op11 = load i32, i32* %op1
  %op12 = load i32, i32* @n1
  %op13 = icmp slt i32 %op11, %op12
  %op14 = zext i1 %op13 to i32
  %op15 = icmp sgt i32 %op14, zeroinitializer
  br i1 %op15, label %label_loop21, label %label_ret22
label_loop21:                                                ; preds = %label_condition20
  %op16 = load i32, i32* %op1
  %op17 = load i32, i32* %op0
  %op18 = icmp slt i32 %op17, zeroinitializer
  %op19 = zext i1 %op18 to i32
  %op20 = add i32 %op19, zeroinitializer
  %op21 = icmp slt i32 %op16, zeroinitializer
  %op22 = zext i1 %op21 to i32
  %op23 = add i32 %op22, %op20
  %op24 = icmp ne i32 %op23, zeroinitializer
  br i1 %op24, label %label_a_ltz23, label %label_a_gtz24
label_ret22:                                                ; preds = %label_condition20
  %op25 = load i32, i32* %op0
  %op26 = add i32 %op25, 1
  store i32 %op26, i32* %op0
  br label %label_condition17
label_a_ltz23:                                                ; preds = %label_loop21
  call void @neg_idx_except()
  br label %label_a_gtz24
label_a_gtz24:                                                ; preds = %label_loop21, %label_a_ltz23
  %op27 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* @a, i32 0, i32 %op17, i32 %op16
  %op28 = call i32 @getint()
  store i32 %op28, i32* %op27
  %op29 = load i32, i32* %op1
  %op30 = add i32 %op29, 1
  store i32 %op30, i32* %op1
  br label %label_condition20
label_condition25:                                                ; preds = %label_ret19, %label_ret30
  %op31 = load i32, i32* %op0
  %op32 = load i32, i32* @m2
  %op33 = icmp slt i32 %op31, %op32
  %op34 = zext i1 %op33 to i32
  %op35 = icmp sgt i32 %op34, zeroinitializer
  br i1 %op35, label %label_loop26, label %label_ret27
label_loop26:                                                ; preds = %label_condition25
  store i32 0, i32* %op1
  br label %label_condition28
label_ret27:                                                ; preds = %label_condition25
  call void @matrix_multiply()
  store i32 0, i32* %op0
  br label %label_condition33
label_condition28:                                                ; preds = %label_loop26, %label_b_gtz32
  %op36 = load i32, i32* %op1
  %op37 = load i32, i32* @n2
  %op38 = icmp slt i32 %op36, %op37
  %op39 = zext i1 %op38 to i32
  %op40 = icmp sgt i32 %op39, zeroinitializer
  br i1 %op40, label %label_loop29, label %label_ret30
label_loop29:                                                ; preds = %label_condition28
  %op41 = load i32, i32* %op1
  %op42 = load i32, i32* %op0
  %op43 = icmp slt i32 %op42, zeroinitializer
  %op44 = zext i1 %op43 to i32
  %op45 = add i32 %op44, zeroinitializer
  %op46 = icmp slt i32 %op41, zeroinitializer
  %op47 = zext i1 %op46 to i32
  %op48 = add i32 %op47, %op45
  %op49 = icmp ne i32 %op48, zeroinitializer
  br i1 %op49, label %label_b_ltz31, label %label_b_gtz32
label_ret30:                                                ; preds = %label_condition28
  %op50 = load i32, i32* %op0
  %op51 = add i32 %op50, 1
  store i32 %op51, i32* %op0
  br label %label_condition25
label_b_ltz31:                                                ; preds = %label_loop29
  call void @neg_idx_except()
  br label %label_b_gtz32
label_b_gtz32:                                                ; preds = %label_loop29, %label_b_ltz31
  %op52 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* @b, i32 0, i32 %op42, i32 %op41
  %op53 = call i32 @getint()
  store i32 %op53, i32* %op52
  %op54 = load i32, i32* %op1
  %op55 = add i32 %op54, 1
  store i32 %op55, i32* %op1
  br label %label_condition28
label_condition33:                                                ; preds = %label_ret27, %label_ret38
  %op56 = load i32, i32* %op0
  %op57 = load i32, i32* @m1
  %op58 = icmp slt i32 %op56, %op57
  %op59 = zext i1 %op58 to i32
  %op60 = icmp sgt i32 %op59, zeroinitializer
  br i1 %op60, label %label_loop34, label %label_ret35
label_loop34:                                                ; preds = %label_condition33
  store i32 0, i32* %op1
  br label %label_condition36
label_ret35:                                                ; preds = %label_condition33
  ret i32 0
label_condition36:                                                ; preds = %label_loop34, %label_res_gtz40
  %op61 = load i32, i32* %op1
  %op62 = load i32, i32* @n2
  %op63 = icmp slt i32 %op61, %op62
  %op64 = zext i1 %op63 to i32
  %op65 = icmp sgt i32 %op64, zeroinitializer
  br i1 %op65, label %label_loop37, label %label_ret38
label_loop37:                                                ; preds = %label_condition36
  %op66 = load i32, i32* %op1
  %op67 = load i32, i32* %op0
  %op68 = icmp slt i32 %op67, zeroinitializer
  %op69 = zext i1 %op68 to i32
  %op70 = add i32 %op69, zeroinitializer
  %op71 = icmp slt i32 %op66, zeroinitializer
  %op72 = zext i1 %op71 to i32
  %op73 = add i32 %op72, %op70
  %op74 = icmp ne i32 %op73, zeroinitializer
  br i1 %op74, label %label_res_ltz39, label %label_res_gtz40
label_ret38:                                                ; preds = %label_condition36
  call void @putch(i32 10)
  %op75 = load i32, i32* %op0
  %op76 = add i32 %op75, 1
  store i32 %op76, i32* %op0
  br label %label_condition33
label_res_ltz39:                                                ; preds = %label_loop37
  call void @neg_idx_except()
  br label %label_res_gtz40
label_res_gtz40:                                                ; preds = %label_loop37, %label_res_ltz39
  %op77 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* @res, i32 0, i32 %op67, i32 %op66
  %op78 = load i32, i32* %op77
  call void @putint(i32 %op78)
  call void @putch(i32 32)
  %op79 = load i32, i32* %op1
  %op80 = add i32 %op79, 1
  store i32 %op80, i32* %op1
  br label %label_condition36
}
