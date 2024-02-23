; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/jianmu-tests/func/36_rotate.sy"

@image = global [1048576 x i32] zeroinitializer
@width = global i32 zeroinitializer
@height = global i32 zeroinitializer
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

define float @my_fabs(float %arg0) {
label_entry:
  %op1 = alloca float
  store float %arg0, float* %op1
  %op2 = load float, float* %op1
  %op3 = sitofp i32 0 to float
  %op4 = fcmp ugt float %op2, %op3
  %op5 = zext i1 %op4 to i32
  %op6 = icmp sgt i32 %op5, zeroinitializer
  br i1 %op6, label %label_true0, label %label_ret1
label_true0:                                                ; preds = %label_entry
  %op7 = load float, float* %op1
  ret float %op7
label_ret1:                                                ; preds = %label_entry
  %op8 = load float, float* %op1
  %op9 = fsub float zeroinitializer, %op8
  ret float %op9
}
define float @p(float %arg0) {
label_entry:
  %op1 = alloca float
  store float %arg0, float* %op1
  %op2 = load float, float* %op1
  %op3 = sitofp i32 3 to float
  %op4 = fmul float %op3, %op2
  %op5 = load float, float* %op1
  %op6 = sitofp i32 4 to float
  %op7 = fmul float %op6, %op5
  %op8 = load float, float* %op1
  %op9 = fmul float %op7, %op8
  %op10 = load float, float* %op1
  %op11 = fmul float %op9, %op10
  %op12 = fsub float %op4, %op11
  ret float %op12
}
define float @my_sin_impl(float %arg0) {
label_entry:
  %op1 = alloca float
  store float %arg0, float* %op1
  %op2 = load float, float* %op1
  %op3 = call float @my_fabs(float %op2)
  %op4 = fcmp ule float %op3, 0x3eb0c6f7a0000000
  %op5 = zext i1 %op4 to i32
  %op6 = icmp sgt i32 %op5, zeroinitializer
  br i1 %op6, label %label_true2, label %label_ret3
label_true2:                                                ; preds = %label_entry
  %op7 = load float, float* %op1
  ret float %op7
label_ret3:                                                ; preds = %label_entry
  %op8 = load float, float* %op1
  %op9 = fdiv float %op8, 0x4008000000000000
  %op10 = call float @my_sin_impl(float %op9)
  %op11 = call float @p(float %op10)
  ret float %op11
}
define float @my_sin(float %arg0) {
label_entry:
  %op1 = alloca float
  store float %arg0, float* %op1
  %op2 = load float, float* %op1
  %op3 = fcmp ult float %op2, 0xc01921fb60000000
  %op4 = zext i1 %op3 to i32
  %op5 = load float, float* %op1
  %op6 = fcmp ugt float %op5, 0x401921fb60000000
  %op7 = zext i1 %op6 to i32
  %op8 = add i32 %op7, %op4
  %op9 = icmp sge i32 %op8, 1
  %op10 = zext i1 %op9 to i32
  %op11 = icmp sgt i32 %op10, zeroinitializer
  br i1 %op11, label %label_true4, label %label_ret5
label_true4:                                                ; preds = %label_entry
  %op12 = load float, float* %op1
  %op13 = fdiv float %op12, 0x401921fb60000000
  %op14 = alloca i32
  store i32 zeroinitializer, i32* %op14
  %op15 = load float, float* %op1
  %op16 = load i32, i32* %op14
  %op17 = sitofp i32 %op16 to float
  %op18 = fmul float %op17, 0x401921fb60000000
  %op19 = fsub float %op15, %op18
  store float %op19, float* %op1
  br label %label_ret5
label_ret5:                                                ; preds = %label_entry, %label_true4
  %op20 = load float, float* %op1
  %op21 = fcmp ugt float %op20, 0x400921fb60000000
  %op22 = zext i1 %op21 to i32
  %op23 = icmp sgt i32 %op22, zeroinitializer
  br i1 %op23, label %label_true6, label %label_ret7
label_true6:                                                ; preds = %label_ret5
  %op24 = load float, float* %op1
  %op25 = fsub float %op24, 0x401921fb60000000
  store float %op25, float* %op1
  br label %label_ret7
label_ret7:                                                ; preds = %label_ret5, %label_true6
  %op26 = load float, float* %op1
  %op27 = fcmp ult float %op26, 0xc00921fb60000000
  %op28 = zext i1 %op27 to i32
  %op29 = icmp sgt i32 %op28, zeroinitializer
  br i1 %op29, label %label_true8, label %label_ret9
label_true8:                                                ; preds = %label_ret7
  %op30 = load float, float* %op1
  %op31 = fadd float %op30, 0x401921fb60000000
  store float %op31, float* %op1
  br label %label_ret9
label_ret9:                                                ; preds = %label_ret7, %label_true8
  %op32 = load float, float* %op1
  %op33 = call float @my_sin_impl(float %op32)
  ret float %op33
}
define float @my_cos(float %arg0) {
label_entry:
  %op1 = alloca float
  store float %arg0, float* %op1
  %op2 = load float, float* %op1
  %op3 = fadd float %op2, 0x3ff921fb60000000
  %op4 = call float @my_sin(float %op3)
  ret float %op4
}
define i32 @read_image() {
label_entry:
  %op0 = call i32 @getch()
  %op1 = add i32 %op0, 50
  %op2 = icmp ne i32 %op0, 50
  %op3 = zext i1 %op2 to i32
  %op4 = call i32 @getch()
  %op5 = add i32 %op4, 80
  %op6 = icmp ne i32 %op4, 80
  %op7 = zext i1 %op6 to i32
  %op8 = add i32 %op7, %op3
  %op9 = icmp sge i32 %op8, 1
  %op10 = zext i1 %op9 to i32
  %op11 = icmp sgt i32 %op10, zeroinitializer
  br i1 %op11, label %label_true10, label %label_ret11
label_true10:                                                ; preds = %label_entry
  ret i32 -1
label_ret11:                                                ; preds = %label_entry
  %op12 = call i32 @getint()
  store i32 %op12, i32* @width
  %op13 = call i32 @getint()
  store i32 %op13, i32* @height
  %op14 = call i32 @getint()
  %op15 = add i32 %op14, 255
  %op16 = icmp ne i32 %op14, 255
  %op17 = zext i1 %op16 to i32
  %op18 = load i32, i32* @height
  %op19 = add i32 %op18, 1024
  %op20 = icmp sgt i32 %op18, 1024
  %op21 = zext i1 %op20 to i32
  %op22 = load i32, i32* @width
  %op23 = add i32 %op22, 1024
  %op24 = icmp sgt i32 %op22, 1024
  %op25 = zext i1 %op24 to i32
  %op26 = add i32 %op25, %op21
  %op27 = icmp sge i32 %op26, 1
  %op28 = zext i1 %op27 to i32
  %op29 = add i32 %op28, %op17
  %op30 = icmp sge i32 %op29, 1
  %op31 = zext i1 %op30 to i32
  %op32 = icmp sgt i32 %op31, zeroinitializer
  br i1 %op32, label %label_true12, label %label_ret13
label_true12:                                                ; preds = %label_ret11
  ret i32 -1
label_ret13:                                                ; preds = %label_ret11
  %op33 = alloca i32
  store i32 0, i32* %op33
  br label %label_condition14
label_condition14:                                                ; preds = %label_ret13, %label_ret19
  %op34 = load i32, i32* @height
  %op35 = load i32, i32* %op33
  %op36 = add i32 %op35, %op34
  %op37 = icmp slt i32 %op35, %op34
  %op38 = zext i1 %op37 to i32
  %op39 = icmp sgt i32 %op38, zeroinitializer
  br i1 %op39, label %label_loop15, label %label_ret16
label_loop15:                                                ; preds = %label_condition14
  %op40 = alloca i32
  store i32 0, i32* %op40
  br label %label_condition17
label_ret16:                                                ; preds = %label_condition14
  ret i32 0
label_condition17:                                                ; preds = %label_loop15, %label_image_gtz21
  %op41 = load i32, i32* @width
  %op42 = load i32, i32* %op40
  %op43 = add i32 %op42, %op41
  %op44 = icmp slt i32 %op42, %op41
  %op45 = zext i1 %op44 to i32
  %op46 = icmp sgt i32 %op45, zeroinitializer
  br i1 %op46, label %label_loop18, label %label_ret19
label_loop18:                                                ; preds = %label_condition17
  %op47 = load i32, i32* %op33
  %op48 = load i32, i32* @width
  %op49 = mul i32 %op47, %op48
  %op50 = load i32, i32* %op40
  %op51 = add i32 %op49, %op50
  %op52 = icmp slt i32 %op51, zeroinitializer
  %op53 = zext i1 %op52 to i32
  %op54 = add i32 %op53, zeroinitializer
  %op55 = icmp ne i32 %op54, zeroinitializer
  br i1 %op55, label %label_image_ltz20, label %label_image_gtz21
label_ret19:                                                ; preds = %label_condition17
  %op56 = load i32, i32* %op33
  %op57 = add i32 %op56, 1
  store i32 %op57, i32* %op33
  br label %label_condition14
label_image_ltz20:                                                ; preds = %label_loop18
  call void @neg_idx_except()
  br label %label_image_gtz21
label_image_gtz21:                                                ; preds = %label_loop18, %label_image_ltz20
  %op58 = getelementptr [1048576 x i32], [1048576 x i32]* @image, i32 0, i32 %op51
  %op59 = call i32 @getint()
  store i32 %op59, i32* %op58
  %op60 = load i32, i32* %op40
  %op61 = add i32 %op60, 1
  store i32 %op61, i32* %op40
  br label %label_condition17
}
define i32 @rotate(i32 %arg0, i32 %arg1, float %arg2) {
label_entry:
  %op3 = alloca i32
  store i32 %arg0, i32* %op3
  %op4 = alloca i32
  store i32 %arg1, i32* %op4
  %op5 = alloca float
  store float %arg2, float* %op5
  %op6 = load float, float* %op5
  %op7 = call float @my_sin(float %op6)
  %op8 = alloca i32
  store i32 zeroinitializer, i32* %op8
  %op9 = load float, float* %op5
  %op10 = call float @my_cos(float %op9)
  %op11 = alloca i32
  store i32 zeroinitializer, i32* %op11
  %op12 = load i32, i32* @width
  %op13 = sdiv i32 %op12, 2
  %op14 = alloca i32
  store i32 zeroinitializer, i32* %op14
  %op15 = load i32, i32* @height
  %op16 = sdiv i32 %op15, 2
  %op17 = alloca i32
  store i32 zeroinitializer, i32* %op17
  %op18 = load i32, i32* %op3
  %op19 = load i32, i32* %op14
  %op20 = sub i32 %op18, %op19
  %op21 = alloca i32
  store i32 zeroinitializer, i32* %op21
  %op22 = load i32, i32* %op4
  %op23 = load i32, i32* %op17
  %op24 = sub i32 %op22, %op23
  %op25 = alloca i32
  store i32 zeroinitializer, i32* %op25
  %op26 = load i32, i32* %op21
  %op27 = load i32, i32* %op11
  %op28 = mul i32 %op26, %op27
  %op29 = load i32, i32* %op25
  %op30 = load i32, i32* %op8
  %op31 = mul i32 %op29, %op30
  %op32 = sub i32 %op28, %op31
  %op33 = load i32, i32* %op14
  %op34 = add i32 %op32, %op33
  %op35 = alloca i32
  store i32 zeroinitializer, i32* %op35
  %op36 = load i32, i32* %op21
  %op37 = load i32, i32* %op8
  %op38 = mul i32 %op36, %op37
  %op39 = load i32, i32* %op25
  %op40 = load i32, i32* %op11
  %op41 = mul i32 %op39, %op40
  %op42 = add i32 %op38, %op41
  %op43 = load i32, i32* %op17
  %op44 = add i32 %op42, %op43
  %op45 = alloca i32
  store i32 zeroinitializer, i32* %op45
  %op46 = load i32, i32* @height
  %op47 = load i32, i32* %op45
  %op48 = add i32 %op47, %op46
  %op49 = icmp sge i32 %op47, %op46
  %op50 = zext i1 %op49 to i32
  %op51 = load i32, i32* %op45
  %op52 = add i32 %op51, 0
  %op53 = icmp slt i32 %op51, 0
  %op54 = zext i1 %op53 to i32
  %op55 = load i32, i32* @width
  %op56 = load i32, i32* %op35
  %op57 = add i32 %op56, %op55
  %op58 = icmp sge i32 %op56, %op55
  %op59 = zext i1 %op58 to i32
  %op60 = load i32, i32* %op35
  %op61 = add i32 %op60, 0
  %op62 = icmp slt i32 %op60, 0
  %op63 = zext i1 %op62 to i32
  %op64 = add i32 %op63, %op59
  %op65 = icmp sge i32 %op64, 1
  %op66 = zext i1 %op65 to i32
  %op67 = add i32 %op66, %op54
  %op68 = icmp sge i32 %op67, 1
  %op69 = zext i1 %op68 to i32
  %op70 = add i32 %op69, %op50
  %op71 = icmp sge i32 %op70, 1
  %op72 = zext i1 %op71 to i32
  %op73 = icmp sgt i32 %op72, zeroinitializer
  br i1 %op73, label %label_true22, label %label_ret23
label_true22:                                                ; preds = %label_entry
  ret i32 0
label_ret23:                                                ; preds = %label_entry
  %op74 = load i32, i32* %op45
  %op75 = load i32, i32* @width
  %op76 = mul i32 %op74, %op75
  %op77 = load i32, i32* %op35
  %op78 = add i32 %op76, %op77
  %op79 = icmp slt i32 %op78, zeroinitializer
  %op80 = zext i1 %op79 to i32
  %op81 = add i32 %op80, zeroinitializer
  %op82 = icmp ne i32 %op81, zeroinitializer
  br i1 %op82, label %label_image_ltz24, label %label_image_gtz25
label_image_ltz24:                                                ; preds = %label_ret23
  call void @neg_idx_except()
  br label %label_image_gtz25
label_image_gtz25:                                                ; preds = %label_ret23, %label_image_ltz24
  %op83 = getelementptr [1048576 x i32], [1048576 x i32]* @image, i32 0, i32 %op78
  %op84 = load i32, i32* %op83
  ret i32 %op84
}
define void @write_pgm(float %arg0) {
label_entry:
  %op1 = alloca float
  store float %arg0, float* %op1
  call void @putch(i32 80)
  call void @putch(i32 50)
  call void @putch(i32 10)
  %op2 = load i32, i32* @width
  call void @putint(i32 %op2)
  call void @putch(i32 32)
  %op3 = load i32, i32* @height
  call void @putint(i32 %op3)
  call void @putch(i32 32)
  call void @putint(i32 255)
  call void @putch(i32 10)
  %op4 = alloca i32
  store i32 0, i32* %op4
  br label %label_condition26
label_condition26:                                                ; preds = %label_entry, %label_ret31
  %op5 = load i32, i32* @height
  %op6 = load i32, i32* %op4
  %op7 = add i32 %op6, %op5
  %op8 = icmp slt i32 %op6, %op5
  %op9 = zext i1 %op8 to i32
  %op10 = icmp sgt i32 %op9, zeroinitializer
  br i1 %op10, label %label_loop27, label %label_ret28
label_loop27:                                                ; preds = %label_condition26
  %op11 = alloca i32
  store i32 0, i32* %op11
  br label %label_condition29
label_ret28:                                                ; preds = %label_condition26
  ret void
label_condition29:                                                ; preds = %label_loop27, %label_loop30
  %op12 = load i32, i32* @width
  %op13 = load i32, i32* %op11
  %op14 = add i32 %op13, %op12
  %op15 = icmp slt i32 %op13, %op12
  %op16 = zext i1 %op15 to i32
  %op17 = icmp sgt i32 %op16, zeroinitializer
  br i1 %op17, label %label_loop30, label %label_ret31
label_loop30:                                                ; preds = %label_condition29
  %op18 = load i32, i32* %op11
  %op19 = load i32, i32* %op4
  %op20 = load float, float* %op1
  %op21 = call i32 @rotate(i32 %op18, i32 %op19, float %op20)
  call void @putint(i32 %op21)
  call void @putch(i32 32)
  %op22 = load i32, i32* %op11
  %op23 = add i32 %op22, 1
  store i32 %op23, i32* %op11
  br label %label_condition29
label_ret31:                                                ; preds = %label_condition29
  call void @putch(i32 10)
  %op24 = load i32, i32* %op4
  %op25 = add i32 %op24, 1
  store i32 %op25, i32* %op4
  br label %label_condition26
}
define i32 @main() {
label_entry:
  %op0 = call float @getfloat()
  %op1 = alloca i32
  store i32 zeroinitializer, i32* %op1
  %op2 = call i32 @getch()
  %op3 = call i32 @read_image()
  %op4 = add i32 %op3, 0
  %op5 = icmp slt i32 %op3, 0
  %op6 = zext i1 %op5 to i32
  %op7 = icmp sgt i32 %op6, zeroinitializer
  br i1 %op7, label %label_true32, label %label_ret33
label_true32:                                                ; preds = %label_entry
  ret i32 -1
label_ret33:                                                ; preds = %label_entry
  %op8 = load i32, i32* %op1
  %op9 = sitofp i32 %op8 to float
  call void @write_pgm(float %op9)
  ret i32 0
}
