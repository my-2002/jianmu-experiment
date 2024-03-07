; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/all_test_cases/hidden_functional/04_break_continue.sy"

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

define i32 @main() {
label_entry:
  %op0 = alloca i32
  store i32 0, i32* %op0
  %op1 = alloca i32
  store i32 0, i32* %op1
  br label %label_condition0
label_condition0:                                                ; preds = %label_entry, %label_ret5
  %op2 = load i32, i32* %op1
  %op3 = icmp slt i32 %op2, 20
  %op4 = zext i1 %op3 to i32
  %op5 = icmp sgt i32 %op4, zeroinitializer
  br i1 %op5, label %label_loop1, label %label_ret2
label_loop1:                                                ; preds = %label_condition0
  %op6 = alloca i32
  store i32 0, i32* %op6
  br label %label_condition3
label_ret2:                                                ; preds = %label_condition0
  %op7 = load i32, i32* %op0
  ret i32 %op7
label_condition3:                                                ; preds = %label_loop1
  %op8 = load i32, i32* %op6
  %op9 = icmp slt i32 %op8, 10
  %op10 = zext i1 %op9 to i32
  %op11 = icmp sgt i32 %op10, zeroinitializer
  br i1 %op11, label %label_loop4, label %label_ret5
label_loop4:                                                ; preds = %label_condition3
  %op12 = alloca i32
  store i32 0, i32* %op12
  br label %label_condition6
label_ret5:                                                ; preds = %label_condition3
  %op13 = load i32, i32* %op1
  %op14 = add i32 %op13, 1
  store i32 %op14, i32* %op1
  br label %label_condition0
label_condition6:                                                ; preds = %label_loop4, %label_ret28
  %op15 = load i32, i32* %op12
  %op16 = icmp slt i32 %op15, 5
  %op17 = zext i1 %op16 to i32
  %op18 = icmp sgt i32 %op17, zeroinitializer
  br i1 %op18, label %label_loop7, label %label_ret8
label_loop7:                                                ; preds = %label_condition6
  %op19 = alloca i32
  store i32 0, i32* %op19
  br label %label_condition9
label_ret8:                                                ; preds = %label_condition6
  %op20 = load i32, i32* %op6
  %op21 = add i32 %op20, 1
  store i32 %op21, i32* %op6
  br label %label_condition29
label_condition9:                                                ; preds = %label_loop7, %label_true21, %label_ret25
  %op22 = load i32, i32* %op19
  %op23 = icmp slt i32 %op22, 3
  %op24 = zext i1 %op23 to i32
  %op25 = icmp sgt i32 %op24, zeroinitializer
  br i1 %op25, label %label_loop10, label %label_ret11
label_loop10:                                                ; preds = %label_condition9
  %op26 = load i32, i32* %op19
  %op27 = add i32 %op26, 1
  %op28 = icmp sge i32 %op27, 3
  %op29 = zext i1 %op28 to i32
  %op30 = icmp sgt i32 %op29, zeroinitializer
  br i1 %op30, label %label_true12, label %label_ret13
label_ret11:                                                ; preds = %label_condition9, %label_true21
  br label %label_condition26
label_true12:                                                ; preds = %label_loop10
  %op31 = load i32, i32* %op19
  %op32 = icmp sgt i32 %op31, zeroinitializer
  br i1 %op32, label %label_true14, label %label_ret15
label_ret13:                                                ; preds = %label_loop10, %label_ret15
  %op33 = alloca i32
  store i32 0, i32* %op33
  br label %label_condition23
label_true14:                                                ; preds = %label_true12
  %op34 = load i32, i32* %op19
  %op35 = icmp sgt i32 %op34, zeroinitializer
  br i1 %op35, label %label_true16, label %label_false17
label_ret15:                                                ; preds = %label_true12, %label_ret20
  br label %label_ret13
label_true16:                                                ; preds = %label_true14
  %op36 = icmp sgt i32 1, zeroinitializer
  br label %label_ret18
label_false17:                                                ; preds = %label_true14
  %op37 = load i32, i32* %op19
  %op38 = icmp sle i32 %op37, zeroinitializer
  %op39 = zext i1 %op38 to i32
  %op40 = icmp sgt i32 %op39, zeroinitializer
  br label %label_ret18
label_ret18:                                                ; preds = %label_false17, %label_true16
  %op41 = phi i1 [ %op36, %label_true16 ], [ %op40, %label_false17 ]
  %op42 = zext i1 %op41 to i32
  %op43 = icmp sgt i32 %op42, zeroinitializer
  br i1 %op43, label %label_true19, label %label_ret20
label_true19:                                                ; preds = %label_ret18
  %op44 = load i32, i32* %op19
  %op45 = sub i32 %op44, -1
  %op46 = icmp sge i32 %op45, 3
  %op47 = zext i1 %op46 to i32
  %op48 = icmp sgt i32 %op47, zeroinitializer
  br i1 %op48, label %label_true21, label %label_ret22
label_ret20:                                                ; preds = %label_ret18, %label_ret22
  br label %label_ret15
label_true21:                                                ; preds = %label_true19
  br label %label_ret11
label_ret22:                                                ; preds = %label_true19
  br label %label_ret20
label_condition23:                                                ; preds = %label_ret13, %label_loop24
  %op49 = load i32, i32* %op33
  %op50 = icmp slt i32 %op49, 2
  %op51 = zext i1 %op50 to i32
  %op52 = icmp sgt i32 %op51, zeroinitializer
  br i1 %op52, label %label_loop24, label %label_ret25
label_loop24:                                                ; preds = %label_condition23
  %op53 = load i32, i32* %op33
  %op54 = add i32 %op53, 1
  store i32 %op54, i32* %op33
  br label %label_condition23
label_ret25:                                                ; preds = %label_condition23, %label_loop24
  %op55 = load i32, i32* %op19
  %op56 = add i32 %op55, 1
  store i32 %op56, i32* %op19
  %op57 = load i32, i32* %op0
  %op58 = add i32 %op57, 1
  store i32 %op58, i32* %op0
  br label %label_condition9
label_condition26:                                                ; preds = %label_ret11
  %op59 = icmp sgt i32 1, zeroinitializer
  br i1 %op59, label %label_loop27, label %label_ret28
label_loop27:                                                ; preds = %label_condition26
  br label %label_condition29
label_ret28:                                                ; preds = %label_condition26
  %op60 = load i32, i32* %op12
  %op61 = add i32 %op60, 1
  store i32 %op61, i32* %op12
  br label %label_condition6
label_condition29:                                                ; preds = %label_loop27, %label_ret8
  %op62 = icmp sgt i32 1, zeroinitializer
  br i1 %op62, label %label_loop30, label %label_ret31
label_loop30:                                                ; preds = %label_condition29
  br label %label_ret31
label_ret31:                                                ; preds = %label_condition29, %label_loop30, %label_ret31
  br label %label_ret31
}
