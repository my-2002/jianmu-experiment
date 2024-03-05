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
  %op1 = sitofp i32 0 to float
  %op2 = fcmp ugt float %arg0, %op1
  %op3 = zext i1 %op2 to i32
  %op4 = icmp sgt i32 %op3, zeroinitializer
  br i1 %op4, label %label_true0, label %label_ret1
label_true0:                                                ; preds = %label_entry
  ret float %arg0
label_ret1:                                                ; preds = %label_entry
  %op5 = fsub float zeroinitializer, %arg0
  ret float %op5
}
define float @p(float %arg0) {
label_entry:
  %op1 = sitofp i32 3 to float
  %op2 = fmul float %op1, %arg0
  %op3 = sitofp i32 4 to float
  %op4 = fmul float %op3, %arg0
  %op5 = fmul float %op4, %arg0
  %op6 = fmul float %op5, %arg0
  %op7 = fsub float %op2, %op6
  ret float %op7
}
define float @my_sin_impl(float %arg0) {
label_entry:
  %op1 = call float @my_fabs(float %arg0)
  %op2 = fcmp ule float %op1, 0x3eb0c6f7a0000000
  %op3 = zext i1 %op2 to i32
  %op4 = icmp sgt i32 %op3, zeroinitializer
  br i1 %op4, label %label_true2, label %label_ret3
label_true2:                                                ; preds = %label_entry
  ret float %arg0
label_ret3:                                                ; preds = %label_entry
  %op5 = fdiv float %arg0, 0x4008000000000000
  %op6 = call float @my_sin_impl(float %op5)
  %op7 = call float @p(float %op6)
  ret float %op7
}
define float @my_sin(float %arg0) {
label_entry:
  %op1 = fcmp ugt float %arg0, 0x401921fb60000000
  %op2 = zext i1 %op1 to i32
  %op3 = icmp sgt i32 %op2, zeroinitializer
  br i1 %op3, label %label_true4, label %label_false5
label_true4:                                                ; preds = %label_entry
  %op4 = icmp sgt i32 1, zeroinitializer
  br label %label_ret6
label_false5:                                                ; preds = %label_entry
  %op5 = fcmp ult float %arg0, 0xc01921fb60000000
  %op6 = zext i1 %op5 to i32
  %op7 = icmp sgt i32 %op6, zeroinitializer
  br label %label_ret6
label_ret6:                                                ; preds = %label_false5, %label_true4
  %op8 = phi i1 [ %op4, %label_true4 ], [ %op7, %label_false5 ]
  %op9 = zext i1 %op8 to i32
  %op10 = icmp sgt i32 %op9, zeroinitializer
  br i1 %op10, label %label_true7, label %label_ret8
label_true7:                                                ; preds = %label_ret6
  %op11 = fdiv float %arg0, 0x401921fb60000000
  %op12 = fptosi float %op11 to i32
  %op13 = sitofp i32 %op12 to float
  %op14 = fmul float %op13, 0x401921fb60000000
  %op15 = fsub float %arg0, %op14
  br label %label_ret8
label_ret8:                                                ; preds = %label_ret6, %label_true7
  %op16 = phi float [ %arg0, %label_ret6 ], [ %op15, %label_true7 ]
  %op17 = fcmp ugt float %op16, 0x400921fb60000000
  %op18 = zext i1 %op17 to i32
  %op19 = icmp sgt i32 %op18, zeroinitializer
  br i1 %op19, label %label_true9, label %label_ret10
label_true9:                                                ; preds = %label_ret8
  %op20 = fsub float %op16, 0x401921fb60000000
  br label %label_ret10
label_ret10:                                                ; preds = %label_ret8, %label_true9
  %op21 = phi float [ %op16, %label_ret8 ], [ %op20, %label_true9 ]
  %op22 = fcmp ult float %op21, 0xc00921fb60000000
  %op23 = zext i1 %op22 to i32
  %op24 = icmp sgt i32 %op23, zeroinitializer
  br i1 %op24, label %label_true11, label %label_ret12
label_true11:                                                ; preds = %label_ret10
  %op25 = fadd float %op21, 0x401921fb60000000
  br label %label_ret12
label_ret12:                                                ; preds = %label_ret10, %label_true11
  %op26 = phi float [ %op21, %label_ret10 ], [ %op25, %label_true11 ]
  %op27 = call float @my_sin_impl(float %op26)
  ret float %op27
}
define float @my_cos(float %arg0) {
label_entry:
  %op1 = fadd float %arg0, 0x3ff921fb60000000
  %op2 = call float @my_sin(float %op1)
  ret float %op2
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
  %op23 = phi i1 [ %op18, %label_true18 ], [ %op22, %label_false19 ], [ %op9, %label_true18 ], [ %op9, %label_false19 ]
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
  %op31 = phi i1 [ %op26, %label_true21 ], [ %op30, %label_false22 ], [ %op23, %label_true21 ], [ %op23, %label_false22 ]
  %op32 = zext i1 %op31 to i32
  %op33 = icmp sgt i32 %op32, zeroinitializer
  br i1 %op33, label %label_true24, label %label_ret25
label_true24:                                                ; preds = %label_ret23
  ret i32 -1
label_ret25:                                                ; preds = %label_ret23
  br label %label_condition26
label_condition26:                                                ; preds = %label_ret25, %label_ret31
  %op34 = phi i32 [ 0, %label_ret25 ], [ %op51, %label_ret31 ]
  %op35 = load i32, i32* @height
  %op36 = icmp slt i32 %op34, %op35
  %op37 = zext i1 %op36 to i32
  %op38 = icmp sgt i32 %op37, zeroinitializer
  br i1 %op38, label %label_loop27, label %label_ret28
label_loop27:                                                ; preds = %label_condition26
  br label %label_condition29
label_ret28:                                                ; preds = %label_condition26
  ret i32 0
label_condition29:                                                ; preds = %label_loop27, %label_image_gtz33
  %op39 = phi i32 [ 0, %label_loop27 ], [ %op54, %label_image_gtz33 ]
  %op40 = load i32, i32* @width
  %op41 = icmp slt i32 %op39, %op40
  %op42 = zext i1 %op41 to i32
  %op43 = icmp sgt i32 %op42, zeroinitializer
  br i1 %op43, label %label_loop30, label %label_ret31
label_loop30:                                                ; preds = %label_condition29
  %op44 = load i32, i32* @width
  %op45 = mul i32 %op34, %op44
  %op46 = add i32 %op45, %op39
  %op47 = icmp slt i32 %op46, zeroinitializer
  %op48 = zext i1 %op47 to i32
  %op49 = add i32 %op48, zeroinitializer
  %op50 = icmp ne i32 %op49, zeroinitializer
  br i1 %op50, label %label_image_ltz32, label %label_image_gtz33
label_ret31:                                                ; preds = %label_condition29
  %op51 = add i32 %op34, 1
  br label %label_condition26
label_image_ltz32:                                                ; preds = %label_loop30
  call void @neg_idx_except()
  br label %label_image_gtz33
label_image_gtz33:                                                ; preds = %label_loop30, %label_image_ltz32
  %op52 = getelementptr [1048576 x i32], [1048576 x i32]* @image, i32 0, i32 %op46
  %op53 = call i32 @getint()
  store i32 %op53, i32* %op52
  %op54 = add i32 %op39, 1
  br label %label_condition29
}
define i32 @rotate(i32 %arg0, i32 %arg1, float %arg2) {
label_entry:
  %op3 = call float @my_sin(float %arg2)
  %op4 = call float @my_cos(float %arg2)
  %op5 = load i32, i32* @width
  %op6 = sdiv i32 %op5, 2
  %op7 = load i32, i32* @height
  %op8 = sdiv i32 %op7, 2
  %op9 = sub i32 %arg0, %op6
  %op10 = sub i32 %arg1, %op8
  %op11 = sitofp i32 %op9 to float
  %op12 = fmul float %op11, %op4
  %op13 = sitofp i32 %op10 to float
  %op14 = fmul float %op13, %op3
  %op15 = fsub float %op12, %op14
  %op16 = sitofp i32 %op6 to float
  %op17 = fadd float %op15, %op16
  %op18 = fptosi float %op17 to i32
  %op19 = sitofp i32 %op9 to float
  %op20 = fmul float %op19, %op3
  %op21 = sitofp i32 %op10 to float
  %op22 = fmul float %op21, %op4
  %op23 = fadd float %op20, %op22
  %op24 = sitofp i32 %op8 to float
  %op25 = fadd float %op23, %op24
  %op26 = fptosi float %op25 to i32
  %op27 = icmp slt i32 %op18, 0
  %op28 = zext i1 %op27 to i32
  %op29 = icmp sgt i32 %op28, zeroinitializer
  br i1 %op29, label %label_true34, label %label_false35
label_true34:                                                ; preds = %label_entry
  %op30 = icmp sgt i32 1, zeroinitializer
  br label %label_ret36
label_false35:                                                ; preds = %label_entry
  %op31 = load i32, i32* @width
  %op32 = icmp sge i32 %op18, %op31
  %op33 = zext i1 %op32 to i32
  %op34 = icmp sgt i32 %op33, zeroinitializer
  br label %label_ret36
label_ret36:                                                ; preds = %label_false35, %label_true34
  %op35 = phi i1 [ %op30, %label_true34 ], [ %op34, %label_false35 ]
  %op36 = zext i1 %op35 to i32
  %op37 = icmp sgt i32 %op36, zeroinitializer
  br i1 %op37, label %label_true37, label %label_false38
label_true37:                                                ; preds = %label_ret36
  %op38 = icmp sgt i32 1, zeroinitializer
  br label %label_ret39
label_false38:                                                ; preds = %label_ret36
  %op39 = icmp slt i32 %op26, 0
  %op40 = zext i1 %op39 to i32
  %op41 = icmp sgt i32 %op40, zeroinitializer
  br label %label_ret39
label_ret39:                                                ; preds = %label_false38, %label_true37
  %op42 = phi i1 [ %op38, %label_true37 ], [ %op41, %label_false38 ], [ %op35, %label_true37 ], [ %op35, %label_false38 ]
  %op43 = zext i1 %op42 to i32
  %op44 = icmp sgt i32 %op43, zeroinitializer
  br i1 %op44, label %label_true40, label %label_false41
label_true40:                                                ; preds = %label_ret39
  %op45 = icmp sgt i32 1, zeroinitializer
  br label %label_ret42
label_false41:                                                ; preds = %label_ret39
  %op46 = load i32, i32* @height
  %op47 = icmp sge i32 %op26, %op46
  %op48 = zext i1 %op47 to i32
  %op49 = icmp sgt i32 %op48, zeroinitializer
  br label %label_ret42
label_ret42:                                                ; preds = %label_false41, %label_true40
  %op50 = phi i1 [ %op45, %label_true40 ], [ %op49, %label_false41 ], [ %op42, %label_true40 ], [ %op42, %label_false41 ]
  %op51 = zext i1 %op50 to i32
  %op52 = icmp sgt i32 %op51, zeroinitializer
  br i1 %op52, label %label_true43, label %label_ret44
label_true43:                                                ; preds = %label_ret42
  ret i32 0
label_ret44:                                                ; preds = %label_ret42
  %op53 = load i32, i32* @width
  %op54 = mul i32 %op26, %op53
  %op55 = add i32 %op54, %op18
  %op56 = icmp slt i32 %op55, zeroinitializer
  %op57 = zext i1 %op56 to i32
  %op58 = add i32 %op57, zeroinitializer
  %op59 = icmp ne i32 %op58, zeroinitializer
  br i1 %op59, label %label_image_ltz45, label %label_image_gtz46
label_image_ltz45:                                                ; preds = %label_ret44
  call void @neg_idx_except()
  br label %label_image_gtz46
label_image_gtz46:                                                ; preds = %label_ret44, %label_image_ltz45
  %op60 = getelementptr [1048576 x i32], [1048576 x i32]* @image, i32 0, i32 %op55
  %op61 = load i32, i32* %op60
  ret i32 %op61
}
define void @write_pgm(float %arg0) {
label_entry:
  call void @putch(i32 80)
  call void @putch(i32 50)
  call void @putch(i32 10)
  %op1 = load i32, i32* @width
  call void @putint(i32 %op1)
  call void @putch(i32 32)
  %op2 = load i32, i32* @height
  call void @putint(i32 %op2)
  call void @putch(i32 32)
  call void @putint(i32 255)
  call void @putch(i32 10)
  br label %label_condition47
label_condition47:                                                ; preds = %label_entry, %label_ret52
  %op3 = phi i32 [ 0, %label_entry ], [ %op15, %label_ret52 ]
  %op4 = load i32, i32* @height
  %op5 = icmp slt i32 %op3, %op4
  %op6 = zext i1 %op5 to i32
  %op7 = icmp sgt i32 %op6, zeroinitializer
  br i1 %op7, label %label_loop48, label %label_ret49
label_loop48:                                                ; preds = %label_condition47
  br label %label_condition50
label_ret49:                                                ; preds = %label_condition47
  ret void
label_condition50:                                                ; preds = %label_loop48, %label_loop51
  %op8 = phi i32 [ 0, %label_loop48 ], [ %op14, %label_loop51 ]
  %op9 = load i32, i32* @width
  %op10 = icmp slt i32 %op8, %op9
  %op11 = zext i1 %op10 to i32
  %op12 = icmp sgt i32 %op11, zeroinitializer
  br i1 %op12, label %label_loop51, label %label_ret52
label_loop51:                                                ; preds = %label_condition50
  %op13 = call i32 @rotate(i32 %op8, i32 %op3, float %arg0)
  call void @putint(i32 %op13)
  call void @putch(i32 32)
  %op14 = add i32 %op8, 1
  br label %label_condition50
label_ret52:                                                ; preds = %label_condition50
  call void @putch(i32 10)
  %op15 = add i32 %op3, 1
  br label %label_condition47
}
define i32 @main() {
label_entry:
  %op0 = call float @getfloat()
  %op1 = call i32 @getch()
  %op2 = call i32 @read_image()
  %op3 = icmp slt i32 %op2, 0
  %op4 = zext i1 %op3 to i32
  %op5 = icmp sgt i32 %op4, zeroinitializer
  br i1 %op5, label %label_true53, label %label_ret54
label_true53:                                                ; preds = %label_entry
  ret i32 -1
label_ret54:                                                ; preds = %label_entry
  call void @write_pgm(float %op0)
  ret i32 0
}
