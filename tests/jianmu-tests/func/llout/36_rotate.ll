; ModuleID = 'sysy'
source_filename = "/home/my2002/compiler_principles/lab5/jianmu-experiment/tests/jianmu-tests/func/36_rotate.sy"

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
  %op3 = fcmp ugt float %op2, 0x401921fb60000000
  %op4 = zext i1 %op3 to i32
  %op5 = icmp sgt i32 %op4, zeroinitializer
  br i1 %op5, label %label_true4, label %label_false5
label_true4:                                                ; preds = %label_entry
  %op6 = icmp sgt i32 1, zeroinitializer
  br label %label_ret6
label_false5:                                                ; preds = %label_entry
  %op7 = load float, float* %op1
  %op8 = fcmp ult float %op7, 0xc01921fb60000000
  %op9 = zext i1 %op8 to i32
  %op10 = icmp sgt i32 %op9, zeroinitializer
  br label %label_ret6
label_ret6:                                                ; preds = %label_false5, %label_true4
  %op11 = phi i1 [ %op6, %label_true4 ], [ %op10, %label_false5 ]
  %op12 = zext i1 %op11 to i32
  %op13 = icmp sgt i32 %op12, zeroinitializer
  br i1 %op13, label %label_true7, label %label_ret8
label_true7:                                                ; preds = %label_ret6
  %op14 = load float, float* %op1
  %op15 = fdiv float %op14, 0x401921fb60000000
  %op16 = fptosi float %op15 to i32
  %op17 = alloca i32
  store i32 %op16, i32* %op17
  %op18 = load float, float* %op1
  %op19 = load i32, i32* %op17
  %op20 = sitofp i32 %op19 to float
  %op21 = fmul float %op20, 0x401921fb60000000
  %op22 = fsub float %op18, %op21
  store float %op22, float* %op1
  br label %label_ret8
label_ret8:                                                ; preds = %label_ret6, %label_true7
  %op23 = load float, float* %op1
  %op24 = fcmp ugt float %op23, 0x400921fb60000000
  %op25 = zext i1 %op24 to i32
  %op26 = icmp sgt i32 %op25, zeroinitializer
  br i1 %op26, label %label_true9, label %label_ret10
label_true9:                                                ; preds = %label_ret8
  %op27 = load float, float* %op1
  %op28 = fsub float %op27, 0x401921fb60000000
  store float %op28, float* %op1
  br label %label_ret10
label_ret10:                                                ; preds = %label_ret8, %label_true9
  %op29 = load float, float* %op1
  %op30 = fcmp ult float %op29, 0xc00921fb60000000
  %op31 = zext i1 %op30 to i32
  %op32 = icmp sgt i32 %op31, zeroinitializer
  br i1 %op32, label %label_true11, label %label_ret12
label_true11:                                                ; preds = %label_ret10
  %op33 = load float, float* %op1
  %op34 = fadd float %op33, 0x401921fb60000000
  store float %op34, float* %op1
  br label %label_ret12
label_ret12:                                                ; preds = %label_ret10, %label_true11
  %op35 = load float, float* %op1
  %op36 = call float @my_sin_impl(float %op35)
  ret float %op36
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
  %op1 = icmp ne i32 %op0, 80
  %op2 = zext i1 %op1 to i32
  %op3 = icmp sgt i32 %op2, zeroinitializer
  br i1 %op3, label %label_true13, label %label_false14
label_true13:                                                ; preds = %label_entry
  %op4 = icmp sgt i32 1, zeroinitializer
  br label %label_ret15
label_false14:                                                ; preds = %label_entry
  %op5 = call i32 @getch()
  %op6 = icmp ne i32 %op5, 50
  %op7 = zext i1 %op6 to i32
  %op8 = icmp sgt i32 %op7, zeroinitializer
  br label %label_ret15
label_ret15:                                                ; preds = %label_false14, %label_true13
  %op9 = phi i1 [ %op4, %label_true13 ], [ %op8, %label_false14 ]
  %op10 = zext i1 %op9 to i32
  %op11 = icmp sgt i32 %op10, zeroinitializer
  br i1 %op11, label %label_true16, label %label_ret17
label_true16:                                                ; preds = %label_ret15
  ret i32 -1
label_ret17:                                                ; preds = %label_ret15
  %op12 = call i32 @getint()
  store i32 %op12, i32* @width
  %op13 = call i32 @getint()
  store i32 %op13, i32* @height
  %op14 = load i32, i32* @width
  %op15 = icmp sgt i32 %op14, 1024
  %op16 = zext i1 %op15 to i32
  %op17 = icmp sgt i32 %op16, zeroinitializer
  br i1 %op17, label %label_true18, label %label_false19
label_true18:                                                ; preds = %label_ret17
  %op18 = icmp sgt i32 1, zeroinitializer
  br label %label_ret20
label_false19:                                                ; preds = %label_ret17
  %op19 = load i32, i32* @height
  %op20 = icmp sgt i32 %op19, 1024
  %op21 = zext i1 %op20 to i32
  %op22 = icmp sgt i32 %op21, zeroinitializer
  br label %label_ret20
label_ret20:                                                ; preds = %label_false19, %label_true18
  %op23 = phi i1 [ %op18, %label_true18 ], [ %op22, %label_false19 ]
  %op24 = zext i1 %op23 to i32
  %op25 = icmp sgt i32 %op24, zeroinitializer
  br i1 %op25, label %label_true21, label %label_false22
label_true21:                                                ; preds = %label_ret20
  %op26 = icmp sgt i32 1, zeroinitializer
  br label %label_ret23
label_false22:                                                ; preds = %label_ret20
  %op27 = call i32 @getint()
  %op28 = icmp ne i32 %op27, 255
  %op29 = zext i1 %op28 to i32
  %op30 = icmp sgt i32 %op29, zeroinitializer
  br label %label_ret23
label_ret23:                                                ; preds = %label_false22, %label_true21
  %op31 = phi i1 [ %op26, %label_true21 ], [ %op30, %label_false22 ]
  %op32 = zext i1 %op31 to i32
  %op33 = icmp sgt i32 %op32, zeroinitializer
  br i1 %op33, label %label_true24, label %label_ret25
label_true24:                                                ; preds = %label_ret23
  ret i32 -1
label_ret25:                                                ; preds = %label_ret23
  %op34 = alloca i32
  store i32 0, i32* %op34
  br label %label_condition26
label_condition26:                                                ; preds = %label_ret25, %label_ret31
  %op35 = load i32, i32* %op34
  %op36 = load i32, i32* @height
  %op37 = icmp slt i32 %op35, %op36
  %op38 = zext i1 %op37 to i32
  %op39 = icmp sgt i32 %op38, zeroinitializer
  br i1 %op39, label %label_loop27, label %label_ret28
label_loop27:                                                ; preds = %label_condition26
  %op40 = alloca i32
  store i32 0, i32* %op40
  br label %label_condition29
label_ret28:                                                ; preds = %label_condition26
  ret i32 0
label_condition29:                                                ; preds = %label_loop27, %label_image_gtz33
  %op41 = load i32, i32* %op40
  %op42 = load i32, i32* @width
  %op43 = icmp slt i32 %op41, %op42
  %op44 = zext i1 %op43 to i32
  %op45 = icmp sgt i32 %op44, zeroinitializer
  br i1 %op45, label %label_loop30, label %label_ret31
label_loop30:                                                ; preds = %label_condition29
  %op46 = load i32, i32* %op34
  %op47 = load i32, i32* @width
  %op48 = mul i32 %op46, %op47
  %op49 = load i32, i32* %op40
  %op50 = add i32 %op48, %op49
  %op51 = icmp slt i32 %op50, zeroinitializer
  %op52 = zext i1 %op51 to i32
  %op53 = add i32 %op52, zeroinitializer
  %op54 = icmp ne i32 %op53, zeroinitializer
  br i1 %op54, label %label_image_ltz32, label %label_image_gtz33
label_ret31:                                                ; preds = %label_condition29
  %op55 = load i32, i32* %op34
  %op56 = add i32 %op55, 1
  store i32 %op56, i32* %op34
  br label %label_condition26
label_image_ltz32:                                                ; preds = %label_loop30
  call void @neg_idx_except()
  br label %label_image_gtz33
label_image_gtz33:                                                ; preds = %label_loop30, %label_image_ltz32
  %op57 = getelementptr [1048576 x i32], [1048576 x i32]* @image, i32 0, i32 %op50
  %op58 = call i32 @getint()
  store i32 %op58, i32* %op57
  %op59 = load i32, i32* %op40
  %op60 = add i32 %op59, 1
  store i32 %op60, i32* %op40
  br label %label_condition29
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
  %op8 = alloca float
  store float %op7, float* %op8
  %op9 = load float, float* %op5
  %op10 = call float @my_cos(float %op9)
  %op11 = alloca float
  store float %op10, float* %op11
  %op12 = load i32, i32* @width
  %op13 = sdiv i32 %op12, 2
  %op14 = alloca i32
  store i32 %op13, i32* %op14
  %op15 = load i32, i32* @height
  %op16 = sdiv i32 %op15, 2
  %op17 = alloca i32
  store i32 %op16, i32* %op17
  %op18 = load i32, i32* %op3
  %op19 = load i32, i32* %op14
  %op20 = sub i32 %op18, %op19
  %op21 = alloca i32
  store i32 %op20, i32* %op21
  %op22 = load i32, i32* %op4
  %op23 = load i32, i32* %op17
  %op24 = sub i32 %op22, %op23
  %op25 = alloca i32
  store i32 %op24, i32* %op25
  %op26 = load i32, i32* %op21
  %op27 = load float, float* %op11
  %op28 = sitofp i32 %op26 to float
  %op29 = fmul float %op28, %op27
  %op30 = load i32, i32* %op25
  %op31 = load float, float* %op8
  %op32 = sitofp i32 %op30 to float
  %op33 = fmul float %op32, %op31
  %op34 = fsub float %op29, %op33
  %op35 = load i32, i32* %op14
  %op36 = sitofp i32 %op35 to float
  %op37 = fadd float %op34, %op36
  %op38 = fptosi float %op37 to i32
  %op39 = alloca i32
  store i32 %op38, i32* %op39
  %op40 = load i32, i32* %op21
  %op41 = load float, float* %op8
  %op42 = sitofp i32 %op40 to float
  %op43 = fmul float %op42, %op41
  %op44 = load i32, i32* %op25
  %op45 = load float, float* %op11
  %op46 = sitofp i32 %op44 to float
  %op47 = fmul float %op46, %op45
  %op48 = fadd float %op43, %op47
  %op49 = load i32, i32* %op17
  %op50 = sitofp i32 %op49 to float
  %op51 = fadd float %op48, %op50
  %op52 = fptosi float %op51 to i32
  %op53 = alloca i32
  store i32 %op52, i32* %op53
  %op54 = load i32, i32* %op39
  %op55 = icmp slt i32 %op54, 0
  %op56 = zext i1 %op55 to i32
  %op57 = icmp sgt i32 %op56, zeroinitializer
  br i1 %op57, label %label_true34, label %label_false35
label_true34:                                                ; preds = %label_entry
  %op58 = icmp sgt i32 1, zeroinitializer
  br label %label_ret36
label_false35:                                                ; preds = %label_entry
  %op59 = load i32, i32* %op39
  %op60 = load i32, i32* @width
  %op61 = icmp sge i32 %op59, %op60
  %op62 = zext i1 %op61 to i32
  %op63 = icmp sgt i32 %op62, zeroinitializer
  br label %label_ret36
label_ret36:                                                ; preds = %label_false35, %label_true34
  %op64 = phi i1 [ %op58, %label_true34 ], [ %op63, %label_false35 ]
  %op65 = zext i1 %op64 to i32
  %op66 = icmp sgt i32 %op65, zeroinitializer
  br i1 %op66, label %label_true37, label %label_false38
label_true37:                                                ; preds = %label_ret36
  %op67 = icmp sgt i32 1, zeroinitializer
  br label %label_ret39
label_false38:                                                ; preds = %label_ret36
  %op68 = load i32, i32* %op53
  %op69 = icmp slt i32 %op68, 0
  %op70 = zext i1 %op69 to i32
  %op71 = icmp sgt i32 %op70, zeroinitializer
  br label %label_ret39
label_ret39:                                                ; preds = %label_false38, %label_true37
  %op72 = phi i1 [ %op67, %label_true37 ], [ %op71, %label_false38 ]
  %op73 = zext i1 %op72 to i32
  %op74 = icmp sgt i32 %op73, zeroinitializer
  br i1 %op74, label %label_true40, label %label_false41
label_true40:                                                ; preds = %label_ret39
  %op75 = icmp sgt i32 1, zeroinitializer
  br label %label_ret42
label_false41:                                                ; preds = %label_ret39
  %op76 = load i32, i32* %op53
  %op77 = load i32, i32* @height
  %op78 = icmp sge i32 %op76, %op77
  %op79 = zext i1 %op78 to i32
  %op80 = icmp sgt i32 %op79, zeroinitializer
  br label %label_ret42
label_ret42:                                                ; preds = %label_false41, %label_true40
  %op81 = phi i1 [ %op75, %label_true40 ], [ %op80, %label_false41 ]
  %op82 = zext i1 %op81 to i32
  %op83 = icmp sgt i32 %op82, zeroinitializer
  br i1 %op83, label %label_true43, label %label_ret44
label_true43:                                                ; preds = %label_ret42
  ret i32 0
label_ret44:                                                ; preds = %label_ret42
  %op84 = load i32, i32* %op53
  %op85 = load i32, i32* @width
  %op86 = mul i32 %op84, %op85
  %op87 = load i32, i32* %op39
  %op88 = add i32 %op86, %op87
  %op89 = icmp slt i32 %op88, zeroinitializer
  %op90 = zext i1 %op89 to i32
  %op91 = add i32 %op90, zeroinitializer
  %op92 = icmp ne i32 %op91, zeroinitializer
  br i1 %op92, label %label_image_ltz45, label %label_image_gtz46
label_image_ltz45:                                                ; preds = %label_ret44
  call void @neg_idx_except()
  br label %label_image_gtz46
label_image_gtz46:                                                ; preds = %label_ret44, %label_image_ltz45
  %op93 = getelementptr [1048576 x i32], [1048576 x i32]* @image, i32 0, i32 %op88
  %op94 = load i32, i32* %op93
  ret i32 %op94
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
  br label %label_condition47
label_condition47:                                                ; preds = %label_entry, %label_ret52
  %op5 = load i32, i32* %op4
  %op6 = load i32, i32* @height
  %op7 = icmp slt i32 %op5, %op6
  %op8 = zext i1 %op7 to i32
  %op9 = icmp sgt i32 %op8, zeroinitializer
  br i1 %op9, label %label_loop48, label %label_ret49
label_loop48:                                                ; preds = %label_condition47
  %op10 = alloca i32
  store i32 0, i32* %op10
  br label %label_condition50
label_ret49:                                                ; preds = %label_condition47
  ret void
label_condition50:                                                ; preds = %label_loop48, %label_loop51
  %op11 = load i32, i32* %op10
  %op12 = load i32, i32* @width
  %op13 = icmp slt i32 %op11, %op12
  %op14 = zext i1 %op13 to i32
  %op15 = icmp sgt i32 %op14, zeroinitializer
  br i1 %op15, label %label_loop51, label %label_ret52
label_loop51:                                                ; preds = %label_condition50
  %op16 = load i32, i32* %op10
  %op17 = load i32, i32* %op4
  %op18 = load float, float* %op1
  %op19 = call i32 @rotate(i32 %op16, i32 %op17, float %op18)
  call void @putint(i32 %op19)
  call void @putch(i32 32)
  %op20 = load i32, i32* %op10
  %op21 = add i32 %op20, 1
  store i32 %op21, i32* %op10
  br label %label_condition50
label_ret52:                                                ; preds = %label_condition50
  call void @putch(i32 10)
  %op22 = load i32, i32* %op4
  %op23 = add i32 %op22, 1
  store i32 %op23, i32* %op4
  br label %label_condition47
}
define i32 @main() {
label_entry:
  %op0 = call float @getfloat()
  %op1 = alloca float
  store float %op0, float* %op1
  %op2 = call i32 @getch()
  %op3 = call i32 @getch()
  %op4 = call i32 @read_image()
  %op5 = icmp slt i32 %op4, 0
  %op6 = zext i1 %op5 to i32
  %op7 = icmp sgt i32 %op6, zeroinitializer
  br i1 %op7, label %label_true53, label %label_ret54
label_true53:                                                ; preds = %label_entry
  ret i32 -1
label_ret54:                                                ; preds = %label_entry
  %op8 = load float, float* %op1
  call void @write_pgm(float %op8)
  ret i32 0
}
