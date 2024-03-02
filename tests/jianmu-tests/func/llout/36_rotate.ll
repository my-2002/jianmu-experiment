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
  %op2 = icmp sgt i32 0, zeroinitializer
  br i1 %op2, label %label_true0, label %label_ret1
label_true0:                                                ; preds = %label_entry
  %op3 = load float, float* %op1
  ret float %op3
label_ret1:                                                ; preds = %label_entry
  %op4 = load float, float* %op1
  %op5 = fsub float zeroinitializer, %op4
  ret float %op5
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
  %op2 = fcmp ugt float 0x3eb0c6f7a0000000, zeroinitializer
  br i1 %op2, label %label_true2, label %label_ret3
label_true2:                                                ; preds = %label_entry
  %op3 = load float, float* %op1
  ret float %op3
label_ret3:                                                ; preds = %label_entry
  %op4 = load float, float* %op1
  %op5 = fdiv float %op4, 0x4008000000000000
  %op6 = call float @my_sin_impl(float %op5)
  %op7 = call float @p(float %op6)
  ret float %op7
}
define float @my_sin(float %arg0) {
label_entry:
  %op1 = alloca float
  store float %arg0, float* %op1
  %op2 = icmp sgt i32 1, zeroinitializer
  br i1 %op2, label %label_true4, label %label_ret5
label_true4:                                                ; preds = %label_entry
  %op3 = load float, float* %op1
  %op4 = fdiv float %op3, 0x401921fb60000000
  %op5 = fptosi float %op4 to i32
  %op6 = alloca i32
  store i32 %op5, i32* %op6
  %op7 = load float, float* %op1
  %op8 = load i32, i32* %op6
  %op9 = sitofp i32 %op8 to float
  %op10 = fmul float %op9, 0x401921fb60000000
  %op11 = fsub float %op7, %op10
  store float %op11, float* %op1
  br label %label_ret5
label_ret5:                                                ; preds = %label_entry, %label_true4
  %op12 = fcmp ugt float 0x400921fb60000000, zeroinitializer
  br i1 %op12, label %label_true6, label %label_ret7
label_true6:                                                ; preds = %label_ret5
  %op13 = load float, float* %op1
  %op14 = fsub float %op13, 0x401921fb60000000
  store float %op14, float* %op1
  br label %label_ret7
label_ret7:                                                ; preds = %label_ret5, %label_true6
  %op15 = fcmp ugt float 0xc00921fb60000000, zeroinitializer
  br i1 %op15, label %label_true8, label %label_ret9
label_true8:                                                ; preds = %label_ret7
  %op16 = load float, float* %op1
  %op17 = fadd float %op16, 0x401921fb60000000
  store float %op17, float* %op1
  br label %label_ret9
label_ret9:                                                ; preds = %label_ret7, %label_true8
  %op18 = load float, float* %op1
  %op19 = call float @my_sin_impl(float %op18)
  ret float %op19
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
  %op1 = add i32 %op0, 80
  %op2 = icmp ne i32 %op0, 80
  %op3 = zext i1 %op2 to i32
  %op4 = icmp sge i32 %op3, zeroinitializer
  br i1 %op4, label %label_true10, label %label_false11
label_true10:                                                ; preds = %label_entry
  %op5 = icmp sgt i32 1, zeroinitializer
  br label %label_ret12
label_false11:                                                ; preds = %label_entry
  %op6 = call i32 @getch()
  %op7 = add i32 %op6, 50
  %op8 = icmp ne i32 %op6, 50
  %op9 = zext i1 %op8 to i32
  %op10 = icmp sgt i32 %op9, zeroinitializer
  br label %label_ret12
label_ret12:                                                ; preds = %label_false11, %label_true10
  %op11 = zext i1 %op5 to i32
  %op12 = icmp sgt i32 %op11, zeroinitializer
  br i1 %op12, label %label_true13, label %label_ret14
label_true13:                                                ; preds = %label_ret12
  ret i32 -1
label_ret14:                                                ; preds = %label_ret12
  %op13 = call i32 @getint()
  store i32 %op13, i32* @width
  %op14 = call i32 @getint()
  store i32 %op14, i32* @height
  %op15 = icmp sgt i32 1, zeroinitializer
  br i1 %op15, label %label_true15, label %label_ret16
label_true15:                                                ; preds = %label_ret14
  ret i32 -1
label_ret16:                                                ; preds = %label_ret14
  %op16 = alloca i32
  store i32 0, i32* %op16
  br label %label_condition17
label_condition17:                                                ; preds = %label_ret16, %label_ret22
  %op17 = load i32, i32* @height
  %op18 = icmp sgt i32 %op17, zeroinitializer
  br i1 %op18, label %label_loop18, label %label_ret19
label_loop18:                                                ; preds = %label_condition17
  %op19 = alloca i32
  store i32 0, i32* %op19
  br label %label_condition20
label_ret19:                                                ; preds = %label_condition17
  ret i32 0
label_condition20:                                                ; preds = %label_loop18, %label_image_gtz24
  %op20 = load i32, i32* @width
  %op21 = icmp sgt i32 %op20, zeroinitializer
  br i1 %op21, label %label_loop21, label %label_ret22
label_loop21:                                                ; preds = %label_condition20
  %op22 = load i32, i32* %op16
  %op23 = load i32, i32* @width
  %op24 = mul i32 %op22, %op23
  %op25 = load i32, i32* %op19
  %op26 = add i32 %op24, %op25
  %op27 = icmp slt i32 %op26, zeroinitializer
  %op28 = zext i1 %op27 to i32
  %op29 = add i32 %op28, zeroinitializer
  %op30 = icmp ne i32 %op29, zeroinitializer
  br i1 %op30, label %label_image_ltz23, label %label_image_gtz24
label_ret22:                                                ; preds = %label_condition20
  %op31 = load i32, i32* %op16
  %op32 = add i32 %op31, 1
  store i32 %op32, i32* %op16
  br label %label_condition17
label_image_ltz23:                                                ; preds = %label_loop21
  call void @neg_idx_except()
  br label %label_image_gtz24
label_image_gtz24:                                                ; preds = %label_loop21, %label_image_ltz23
  %op33 = getelementptr [1048576 x i32], [1048576 x i32]* @image, i32 0, i32 %op26
  %op34 = call i32 @getint()
  store i32 %op34, i32* %op33
  %op35 = load i32, i32* %op19
  %op36 = add i32 %op35, 1
  store i32 %op36, i32* %op19
  br label %label_condition20
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
  %op8 = fptosi float %op7 to i32
  %op9 = alloca i32
  store i32 %op8, i32* %op9
  %op10 = load float, float* %op5
  %op11 = call float @my_cos(float %op10)
  %op12 = fptosi float %op11 to i32
  %op13 = alloca i32
  store i32 %op12, i32* %op13
  %op14 = load i32, i32* @width
  %op15 = sdiv i32 %op14, 2
  %op16 = alloca i32
  store i32 %op15, i32* %op16
  %op17 = load i32, i32* @height
  %op18 = sdiv i32 %op17, 2
  %op19 = alloca i32
  store i32 %op18, i32* %op19
  %op20 = load i32, i32* %op3
  %op21 = load i32, i32* %op16
  %op22 = sub i32 %op20, %op21
  %op23 = alloca i32
  store i32 %op22, i32* %op23
  %op24 = load i32, i32* %op4
  %op25 = load i32, i32* %op19
  %op26 = sub i32 %op24, %op25
  %op27 = alloca i32
  store i32 %op26, i32* %op27
  %op28 = load i32, i32* %op23
  %op29 = load i32, i32* %op13
  %op30 = mul i32 %op28, %op29
  %op31 = load i32, i32* %op27
  %op32 = load i32, i32* %op9
  %op33 = mul i32 %op31, %op32
  %op34 = sub i32 %op30, %op33
  %op35 = load i32, i32* %op16
  %op36 = add i32 %op34, %op35
  %op37 = alloca i32
  store i32 %op36, i32* %op37
  %op38 = load i32, i32* %op23
  %op39 = load i32, i32* %op9
  %op40 = mul i32 %op38, %op39
  %op41 = load i32, i32* %op27
  %op42 = load i32, i32* %op13
  %op43 = mul i32 %op41, %op42
  %op44 = add i32 %op40, %op43
  %op45 = load i32, i32* %op19
  %op46 = add i32 %op44, %op45
  %op47 = alloca i32
  store i32 %op46, i32* %op47
  %op48 = load i32, i32* @width
  %op49 = icmp sgt i32 %op48, zeroinitializer
  %op50 = zext i1 %op49 to i32
  %op51 = icmp sge i32 %op50, zeroinitializer
  br i1 %op51, label %label_true25, label %label_false26
label_true25:                                                ; preds = %label_entry
  %op52 = icmp sgt i32 1, zeroinitializer
  br label %label_ret27
label_false26:                                                ; preds = %label_entry
  %op53 = icmp sgt i32 0, zeroinitializer
  br label %label_ret27
label_ret27:                                                ; preds = %label_false26, %label_true25
  %op54 = zext i1 %op52 to i32
  %op55 = icmp sge i32 %op54, zeroinitializer
  br i1 %op55, label %label_true28, label %label_false29
label_true28:                                                ; preds = %label_ret27
  %op56 = icmp sgt i32 1, zeroinitializer
  br label %label_ret30
label_false29:                                                ; preds = %label_ret27
  %op57 = load i32, i32* @height
  %op58 = icmp sgt i32 %op57, zeroinitializer
  br label %label_ret30
label_ret30:                                                ; preds = %label_false29, %label_true28
  %op59 = zext i1 %op56 to i32
  %op60 = icmp sgt i32 %op59, zeroinitializer
  br i1 %op60, label %label_true31, label %label_ret32
label_true31:                                                ; preds = %label_ret30
  ret i32 0
label_ret32:                                                ; preds = %label_ret30
  %op61 = load i32, i32* %op47
  %op62 = load i32, i32* @width
  %op63 = mul i32 %op61, %op62
  %op64 = load i32, i32* %op37
  %op65 = add i32 %op63, %op64
  %op66 = icmp slt i32 %op65, zeroinitializer
  %op67 = zext i1 %op66 to i32
  %op68 = add i32 %op67, zeroinitializer
  %op69 = icmp ne i32 %op68, zeroinitializer
  br i1 %op69, label %label_image_ltz33, label %label_image_gtz34
label_image_ltz33:                                                ; preds = %label_ret32
  call void @neg_idx_except()
  br label %label_image_gtz34
label_image_gtz34:                                                ; preds = %label_ret32, %label_image_ltz33
  %op70 = getelementptr [1048576 x i32], [1048576 x i32]* @image, i32 0, i32 %op65
  %op71 = load i32, i32* %op70
  ret i32 %op71
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
  br label %label_condition35
label_condition35:                                                ; preds = %label_entry, %label_ret40
  %op5 = load i32, i32* @height
  %op6 = icmp sgt i32 %op5, zeroinitializer
  br i1 %op6, label %label_loop36, label %label_ret37
label_loop36:                                                ; preds = %label_condition35
  %op7 = alloca i32
  store i32 0, i32* %op7
  br label %label_condition38
label_ret37:                                                ; preds = %label_condition35
  ret void
label_condition38:                                                ; preds = %label_loop36, %label_loop39
  %op8 = load i32, i32* @width
  %op9 = icmp sgt i32 %op8, zeroinitializer
  br i1 %op9, label %label_loop39, label %label_ret40
label_loop39:                                                ; preds = %label_condition38
  %op10 = load i32, i32* %op7
  %op11 = load i32, i32* %op4
  %op12 = load float, float* %op1
  %op13 = call i32 @rotate(i32 %op10, i32 %op11, float %op12)
  call void @putint(i32 %op13)
  call void @putch(i32 32)
  %op14 = load i32, i32* %op7
  %op15 = add i32 %op14, 1
  store i32 %op15, i32* %op7
  br label %label_condition38
label_ret40:                                                ; preds = %label_condition38
  call void @putch(i32 10)
  %op16 = load i32, i32* %op4
  %op17 = add i32 %op16, 1
  store i32 %op17, i32* %op4
  br label %label_condition35
}
define i32 @main() {
label_entry:
  %op0 = call float @getfloat()
  %op1 = fptosi float %op0 to i32
  %op2 = alloca i32
  store i32 %op1, i32* %op2
  %op3 = call i32 @getch()
  %op4 = icmp sgt i32 0, zeroinitializer
  br i1 %op4, label %label_true41, label %label_ret42
label_true41:                                                ; preds = %label_entry
  ret i32 -1
label_ret42:                                                ; preds = %label_entry
  %op5 = load i32, i32* %op2
  %op6 = sitofp i32 %op5 to float
  call void @write_pgm(float %op6)
  ret i32 0
}
