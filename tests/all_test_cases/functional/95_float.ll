; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/all_test_cases/functional/95_float.sy"

@RADIUS = constant i32 5
@PI = constant i32 3
@EPS = constant i32 0
@PI_HEX = constant i32 3
@HEX2 = constant i32 0
@FACT = constant i32 -33000
@EVAL1 = constant i32 75
@EVAL2 = constant i32 30
@EVAL3 = constant i32 30
@CONV1 = constant i32 233
@CONV2 = constant i32 0
@MAX = constant i32 1000000000
@TWO = constant i32 2
@THREE = constant i32 3
@FIVE = constant i32 5
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

declare void @putfarray(float*)

declare void @putf(i32*)

declare void @starttime()

declare void @stoptime()

define float @float_abs(float %arg0) {
label_entry:
  %op1 = alloca float
  store float %arg0, float* %op1
  %op2 = load float, float* %op1
  %op3 = sitofp i32 0 to float
  %op4 = fcmp ult float %op2, %op3
  %op5 = zext i1 %op4 to i32
  %op6 = icmp sgt i32 %op5, zeroinitializer
  br i1 %op6, label %label_true0, label %label_ret1
label_true0:                                                ; preds = %label_entry
  %op7 = load float, float* %op1
  %op8 = fsub float zeroinitializer, %op7
  ret float %op8
label_ret1:                                                ; preds = %label_entry
  %op9 = load float, float* %op1
  ret float %op9
}
define float @circle_area(i32 %arg0) {
label_entry:
  %op1 = alloca i32
  store i32 %arg0, i32* %op1
  %op2 = load i32, i32* @PI
  %op3 = load i32, i32* %op1
  %op4 = mul i32 %op2, %op3
  %op5 = load i32, i32* %op1
  %op6 = mul i32 %op4, %op5
  %op7 = load i32, i32* %op1
  %op8 = load i32, i32* %op1
  %op9 = mul i32 %op7, %op8
  %op10 = load i32, i32* @PI
  %op11 = mul i32 %op9, %op10
  %op12 = add i32 %op6, %op11
  %op13 = sdiv i32 %op12, 2
  %op14 = sitofp i32 %op13 to float
  ret float %op14
}
define i32 @float_eq(float %arg0, float %arg1) {
label_entry:
  %op2 = alloca float
  store float %arg0, float* %op2
  %op3 = alloca float
  store float %arg1, float* %op3
  %op4 = load float, float* %op2
  %op5 = load float, float* %op3
  %op6 = fsub float %op4, %op5
  %op7 = call float @float_abs(float %op6)
  %op8 = load i32, i32* @EPS
  %op9 = sitofp i32 %op8 to float
  %op10 = fcmp ult float %op7, %op9
  %op11 = zext i1 %op10 to i32
  %op12 = icmp sgt i32 %op11, zeroinitializer
  br i1 %op12, label %label_true2, label %label_false3
label_true2:                                                ; preds = %label_entry
  %op13 = fptosi float 0x3ff0000000000000 to i32
  ret i32 %op13
label_false3:                                                ; preds = %label_entry
  ret i32 0
}
define void @error() {
label_entry:
  call void @putch(i32 101)
  call void @putch(i32 114)
  call void @putch(i32 114)
  call void @putch(i32 111)
  call void @putch(i32 114)
  call void @putch(i32 10)
  ret void
}
define void @ok() {
label_entry:
  call void @putch(i32 111)
  call void @putch(i32 107)
  call void @putch(i32 10)
  ret void
}
define void @assert(i32 %arg0) {
label_entry:
  %op1 = alloca i32
  store i32 %arg0, i32* %op1
  %op2 = load i32, i32* %op1
  %op3 = icmp sle i32 %op2, zeroinitializer
  %op4 = zext i1 %op3 to i32
  %op5 = icmp sgt i32 %op4, zeroinitializer
  br i1 %op5, label %label_true4, label %label_false5
label_true4:                                                ; preds = %label_entry
  call void @error()
  br label %label_ret6
label_false5:                                                ; preds = %label_entry
  call void @ok()
  br label %label_ret6
label_ret6:                                                ; preds = %label_true4, %label_false5
  ret void
}
define void @assert_not(i32 %arg0) {
label_entry:
  %op1 = alloca i32
  store i32 %arg0, i32* %op1
  %op2 = load i32, i32* %op1
  %op3 = icmp sgt i32 %op2, zeroinitializer
  br i1 %op3, label %label_true7, label %label_false8
label_true7:                                                ; preds = %label_entry
  call void @error()
  br label %label_ret9
label_false8:                                                ; preds = %label_entry
  call void @ok()
  br label %label_ret9
label_ret9:                                                ; preds = %label_true7, %label_false8
  ret void
}
define i32 @main() {
label_entry:
  %op0 = load i32, i32* @HEX2
  %op1 = sitofp i32 %op0 to float
  %op2 = load i32, i32* @FACT
  %op3 = sitofp i32 %op2 to float
  %op4 = call i32 @float_eq(float %op1, float %op3)
  call void @assert_not(i32 %op4)
  %op5 = load i32, i32* @EVAL1
  %op6 = sitofp i32 %op5 to float
  %op7 = load i32, i32* @EVAL2
  %op8 = sitofp i32 %op7 to float
  %op9 = call i32 @float_eq(float %op6, float %op8)
  call void @assert_not(i32 %op9)
  %op10 = load i32, i32* @EVAL2
  %op11 = sitofp i32 %op10 to float
  %op12 = load i32, i32* @EVAL3
  %op13 = sitofp i32 %op12 to float
  %op14 = call i32 @float_eq(float %op11, float %op13)
  call void @assert(i32 %op14)
  %op15 = load i32, i32* @RADIUS
  %op16 = call float @circle_area(i32 %op15)
  %op17 = load i32, i32* @FIVE
  %op18 = call float @circle_area(i32 %op17)
  %op19 = call i32 @float_eq(float %op16, float %op18)
  call void @assert(i32 %op19)
  %op20 = load i32, i32* @CONV1
  %op21 = sitofp i32 %op20 to float
  %op22 = load i32, i32* @CONV2
  %op23 = sitofp i32 %op22 to float
  %op24 = call i32 @float_eq(float %op21, float %op23)
  call void @assert_not(i32 %op24)
  %op25 = fcmp ugt float 0x3ff8000000000000, zeroinitializer
  br i1 %op25, label %label_true10, label %label_ret11
label_true10:                                                ; preds = %label_entry
  call void @ok()
  br label %label_ret11
label_ret11:                                                ; preds = %label_entry, %label_true10
  %op26 = icmp sgt i32 1, zeroinitializer
  br i1 %op26, label %label_true12, label %label_ret13
label_true12:                                                ; preds = %label_ret11
  call void @ok()
  br label %label_ret13
label_ret13:                                                ; preds = %label_ret11, %label_true12
  %op27 = icmp sgt i32 0, zeroinitializer
  br i1 %op27, label %label_true14, label %label_ret15
label_true14:                                                ; preds = %label_ret13
  call void @error()
  br label %label_ret15
label_ret15:                                                ; preds = %label_ret13, %label_true14
  %op28 = icmp sgt i32 1, zeroinitializer
  br i1 %op28, label %label_true16, label %label_ret17
label_true16:                                                ; preds = %label_ret15
  call void @ok()
  br label %label_ret17
label_ret17:                                                ; preds = %label_ret15, %label_true16
  %op29 = alloca i32
  store i32 1, i32* %op29
  %op30 = alloca i32
  store i32 0, i32* %op30
  %op31 = alloca [10 x float]
  store [10 x float] [float 0x3ff0000000000000, i32 2, float zeroinitializer, float zeroinitializer, float zeroinitializer, float zeroinitializer, float zeroinitializer, float zeroinitializer, float zeroinitializer, float zeroinitializer], [10 x float]* %op31
  %op32 = getelementptr [10 x float], [10 x float]* %op31, i32 0, i32 0
  %op33 = call i32 @getfarray(float* %op32)
  %op34 = alloca i32
  store i32 %op33, i32* %op34
  br label %label_condition18
label_condition18:                                                ; preds = %label_ret17, %label_arr_gtz24
  %op35 = load i32, i32* %op29
  %op36 = load i32, i32* @MAX
  %op37 = icmp slt i32 %op35, %op36
  %op38 = zext i1 %op37 to i32
  %op39 = icmp sgt i32 %op38, zeroinitializer
  br i1 %op39, label %label_loop19, label %label_ret20
label_loop19:                                                ; preds = %label_condition18
  %op40 = call float @getfloat()
  %op41 = alloca float
  store float %op40, float* %op41
  %op42 = load i32, i32* @PI
  %op43 = load float, float* %op41
  %op44 = sitofp i32 %op42 to float
  %op45 = fmul float %op44, %op43
  %op46 = load float, float* %op41
  %op47 = fmul float %op45, %op46
  %op48 = alloca float
  store float %op47, float* %op48
  %op49 = load float, float* %op41
  %op50 = fptosi float %op49 to i32
  %op51 = call float @circle_area(i32 %op50)
  %op52 = alloca float
  store float %op51, float* %op52
  %op53 = load i32, i32* %op30
  %op54 = icmp slt i32 %op53, zeroinitializer
  %op55 = zext i1 %op54 to i32
  %op56 = add i32 %op55, zeroinitializer
  %op57 = icmp ne i32 %op56, zeroinitializer
  br i1 %op57, label %label_arr_ltz21, label %label_arr_gtz22
label_ret20:                                                ; preds = %label_condition18
  ret i32 0
label_arr_ltz21:                                                ; preds = %label_loop19
  call void @neg_idx_except()
  br label %label_arr_gtz22
label_arr_gtz22:                                                ; preds = %label_loop19, %label_arr_ltz21
  %op58 = getelementptr [10 x float], [10 x float]* %op31, i32 0, i32 %op53
  %op59 = load i32, i32* %op30
  %op60 = icmp slt i32 %op59, zeroinitializer
  %op61 = zext i1 %op60 to i32
  %op62 = add i32 %op61, zeroinitializer
  %op63 = icmp ne i32 %op62, zeroinitializer
  br i1 %op63, label %label_arr_ltz23, label %label_arr_gtz24
label_arr_ltz23:                                                ; preds = %label_arr_gtz22
  call void @neg_idx_except()
  br label %label_arr_gtz24
label_arr_gtz24:                                                ; preds = %label_arr_gtz22, %label_arr_ltz23
  %op64 = getelementptr [10 x float], [10 x float]* %op31, i32 0, i32 %op59
  %op65 = load float, float* %op64
  %op66 = load float, float* %op41
  %op67 = fadd float %op65, %op66
  store float %op67, float* %op58
  %op68 = load float, float* %op48
  call void @putfloat(float %op68)
  call void @putch(i32 32)
  %op69 = load float, float* %op52
  %op70 = fptosi float %op69 to i32
  call void @putint(i32 %op70)
  call void @putch(i32 10)
  %op71 = load i32, i32* %op29
  %op72 = sitofp i32 %op71 to float
  %op73 = fmul float %op72, 0x4024000000000000
  %op74 = fptosi float %op73 to i32
  store i32 %op74, i32* %op29
  %op75 = load i32, i32* %op30
  %op76 = add i32 %op75, 1
  store i32 %op76, i32* %op30
  br label %label_condition18
}
