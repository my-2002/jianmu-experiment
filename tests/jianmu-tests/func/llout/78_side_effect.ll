; ModuleID = 'sysy'
source_filename = "/home/my2002/compiler_principles/lab5/jianmu-experiment/tests/jianmu-tests/func/78_side_effect.sy"

@a = global i32 -1
@b = global i32 1
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

define i32 @inc_a() {
label_entry:
  %op0 = load i32, i32* @a
  %op1 = alloca i32
  store i32 %op0, i32* %op1
  %op2 = load i32, i32* %op1
  %op3 = add i32 %op2, 1
  store i32 %op3, i32* %op1
  %op4 = load i32, i32* %op1
  store i32 %op4, i32* @a
  %op5 = load i32, i32* @a
  ret i32 %op5
}
define i32 @main() {
label_entry:
  %op0 = alloca i32
  store i32 5, i32* %op0
  br label %label_condition0
label_condition0:                                                ; preds = %label_entry, %label_ret19
  %op1 = load i32, i32* %op0
  %op2 = icmp sge i32 %op1, 0
  %op3 = zext i1 %op2 to i32
  %op4 = icmp sgt i32 %op3, zeroinitializer
  br i1 %op4, label %label_loop1, label %label_ret2
label_loop1:                                                ; preds = %label_condition0
  %op5 = call i32 @inc_a()
  %op6 = icmp sgt i32 %op5, zeroinitializer
  br i1 %op6, label %label_true3, label %label_false4
label_ret2:                                                ; preds = %label_condition0
  %op7 = load i32, i32* @a
  call void @putint(i32 %op7)
  call void @putch(i32 32)
  %op8 = load i32, i32* @b
  call void @putint(i32 %op8)
  call void @putch(i32 10)
  %op9 = load i32, i32* @a
  ret i32 %op9
label_true3:                                                ; preds = %label_loop1
  %op10 = call i32 @inc_a()
  %op11 = icmp sgt i32 %op10, zeroinitializer
  br label %label_ret5
label_false4:                                                ; preds = %label_loop1
  %op12 = icmp sgt i32 zeroinitializer, zeroinitializer
  br label %label_ret5
label_ret5:                                                ; preds = %label_true3, %label_false4
  %op13 = phi i1 [ %op11, %label_true3 ], [ %op12, %label_false4 ]
  %op14 = zext i1 %op13 to i32
  %op15 = icmp sgt i32 %op14, zeroinitializer
  br i1 %op15, label %label_true6, label %label_false7
label_true6:                                                ; preds = %label_ret5
  %op16 = call i32 @inc_a()
  %op17 = icmp sgt i32 %op16, zeroinitializer
  br label %label_ret8
label_false7:                                                ; preds = %label_ret5
  %op18 = icmp sgt i32 zeroinitializer, zeroinitializer
  br label %label_ret8
label_ret8:                                                ; preds = %label_true6, %label_false7
  %op19 = phi i1 [ %op17, %label_true6 ], [ %op18, %label_false7 ]
  %op20 = zext i1 %op19 to i32
  %op21 = icmp sgt i32 %op20, zeroinitializer
  br i1 %op21, label %label_true9, label %label_ret10
label_true9:                                                ; preds = %label_ret8
  %op22 = load i32, i32* @a
  call void @putint(i32 %op22)
  call void @putch(i32 32)
  %op23 = load i32, i32* @b
  call void @putint(i32 %op23)
  call void @putch(i32 10)
  br label %label_ret10
label_ret10:                                                ; preds = %label_ret8, %label_true9
  %op24 = call i32 @inc_a()
  %op25 = icmp slt i32 %op24, 14
  %op26 = zext i1 %op25 to i32
  %op27 = icmp sgt i32 %op26, zeroinitializer
  br i1 %op27, label %label_true11, label %label_false12
label_true11:                                                ; preds = %label_ret10
  %op28 = icmp sgt i32 1, zeroinitializer
  br label %label_ret13
label_false12:                                                ; preds = %label_ret10
  %op29 = call i32 @inc_a()
  %op30 = icmp sgt i32 %op29, zeroinitializer
  br i1 %op30, label %label_true14, label %label_false15
label_ret13:                                                ; preds = %label_ret16, %label_true11
  %op31 = phi i1 [ %op28, %label_true11 ], [ %op42, %label_ret16 ]
  %op32 = zext i1 %op31 to i32
  %op33 = icmp sgt i32 %op32, zeroinitializer
  br i1 %op33, label %label_true17, label %label_false18
label_true14:                                                ; preds = %label_false12
  %op34 = call i32 @inc_a()
  %op35 = call i32 @inc_a()
  %op36 = sub i32 %op34, %op35
  %op37 = add i32 %op36, 1
  %op38 = icmp sgt i32 %op37, zeroinitializer
  br label %label_ret16
label_false15:                                                ; preds = %label_false12
  %op39 = icmp sgt i32 zeroinitializer, zeroinitializer
  br label %label_ret16
label_ret16:                                                ; preds = %label_true14, %label_false15
  %op40 = phi i1 [ %op38, %label_true14 ], [ %op39, %label_false15 ]
  %op41 = zext i1 %op40 to i32
  %op42 = icmp sgt i32 %op41, zeroinitializer
  br label %label_ret13
label_true17:                                                ; preds = %label_ret13
  %op43 = load i32, i32* @a
  call void @putint(i32 %op43)
  call void @putch(i32 10)
  %op44 = load i32, i32* @b
  %op45 = mul i32 %op44, 2
  store i32 %op45, i32* @b
  br label %label_ret19
label_false18:                                                ; preds = %label_ret13
  %op46 = call i32 @inc_a()
  br label %label_ret19
label_ret19:                                                ; preds = %label_true17, %label_false18
  %op47 = load i32, i32* %op0
  %op48 = sub i32 %op47, 1
  store i32 %op48, i32* %op0
  br label %label_condition0
}
