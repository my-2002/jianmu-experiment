; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/jianmu-tests/func/78_side_effect.sy"

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
  %op1 = add i32 %op0, 1
  store i32 %op1, i32* @a
  %op2 = load i32, i32* @a
  ret i32 %op2
}
define i32 @main() {
label_entry:
  br label %label_condition0
label_condition0:                                                ; preds = %label_entry, %label_ret19
  %op0 = phi i32 [ 5, %label_entry ], [ %op46, %label_ret19 ]
  %op1 = icmp sge i32 %op0, 0
  %op2 = zext i1 %op1 to i32
  %op3 = icmp sgt i32 %op2, zeroinitializer
  br i1 %op3, label %label_loop1, label %label_ret2
label_loop1:                                                ; preds = %label_condition0
  %op4 = call i32 @inc_a()
  %op5 = icmp sgt i32 %op4, zeroinitializer
  br i1 %op5, label %label_true3, label %label_false4
label_ret2:                                                ; preds = %label_condition0
  %op6 = load i32, i32* @a
  call void @putint(i32 %op6)
  call void @putch(i32 32)
  %op7 = load i32, i32* @b
  call void @putint(i32 %op7)
  call void @putch(i32 10)
  %op8 = load i32, i32* @a
  ret i32 %op8
label_true3:                                                ; preds = %label_loop1
  %op9 = call i32 @inc_a()
  %op10 = icmp sgt i32 %op9, zeroinitializer
  br label %label_ret5
label_false4:                                                ; preds = %label_loop1
  %op11 = icmp sgt i32 zeroinitializer, zeroinitializer
  br label %label_ret5
label_ret5:                                                ; preds = %label_true3, %label_false4
  %op12 = phi i1 [ %op10, %label_true3 ], [ %op11, %label_false4 ]
  %op13 = zext i1 %op12 to i32
  %op14 = icmp sgt i32 %op13, zeroinitializer
  br i1 %op14, label %label_true6, label %label_false7
label_true6:                                                ; preds = %label_ret5
  %op15 = call i32 @inc_a()
  %op16 = icmp sgt i32 %op15, zeroinitializer
  br label %label_ret8
label_false7:                                                ; preds = %label_ret5
  %op17 = icmp sgt i32 zeroinitializer, zeroinitializer
  br label %label_ret8
label_ret8:                                                ; preds = %label_true6, %label_false7
  %op18 = phi i1 [ %op16, %label_true6 ], [ %op17, %label_false7 ], [ %op12, %label_true6 ], [ %op12, %label_false7 ]
  %op19 = zext i1 %op18 to i32
  %op20 = icmp sgt i32 %op19, zeroinitializer
  br i1 %op20, label %label_true9, label %label_ret10
label_true9:                                                ; preds = %label_ret8
  %op21 = load i32, i32* @a
  call void @putint(i32 %op21)
  call void @putch(i32 32)
  %op22 = load i32, i32* @b
  call void @putint(i32 %op22)
  call void @putch(i32 10)
  br label %label_ret10
label_ret10:                                                ; preds = %label_ret8, %label_true9
  %op23 = call i32 @inc_a()
  %op24 = icmp slt i32 %op23, 14
  %op25 = zext i1 %op24 to i32
  %op26 = icmp sgt i32 %op25, zeroinitializer
  br i1 %op26, label %label_true11, label %label_false12
label_true11:                                                ; preds = %label_ret10
  %op27 = icmp sgt i32 1, zeroinitializer
  br label %label_ret13
label_false12:                                                ; preds = %label_ret10
  %op28 = call i32 @inc_a()
  %op29 = icmp sgt i32 %op28, zeroinitializer
  br i1 %op29, label %label_true14, label %label_false15
label_ret13:                                                ; preds = %label_ret16, %label_true11
  %op30 = phi i1 [ %op27, %label_true11 ], [ %op41, %label_ret16 ], [ %op18, %label_true11 ], [ %op39, %label_ret16 ]
  %op31 = zext i1 %op30 to i32
  %op32 = icmp sgt i32 %op31, zeroinitializer
  br i1 %op32, label %label_true17, label %label_false18
label_true14:                                                ; preds = %label_false12
  %op33 = call i32 @inc_a()
  %op34 = call i32 @inc_a()
  %op35 = sub i32 %op33, %op34
  %op36 = add i32 %op35, 1
  %op37 = icmp sgt i32 %op36, zeroinitializer
  br label %label_ret16
label_false15:                                                ; preds = %label_false12
  %op38 = icmp sgt i32 zeroinitializer, zeroinitializer
  br label %label_ret16
label_ret16:                                                ; preds = %label_true14, %label_false15
  %op39 = phi i1 [ %op37, %label_true14 ], [ %op38, %label_false15 ], [ %op18, %label_true14 ], [ %op18, %label_false15 ]
  %op40 = zext i1 %op39 to i32
  %op41 = icmp sgt i32 %op40, zeroinitializer
  br label %label_ret13
label_true17:                                                ; preds = %label_ret13
  %op42 = load i32, i32* @a
  call void @putint(i32 %op42)
  call void @putch(i32 10)
  %op43 = load i32, i32* @b
  %op44 = mul i32 %op43, 2
  store i32 %op44, i32* @b
  br label %label_ret19
label_false18:                                                ; preds = %label_ret13
  %op45 = call i32 @inc_a()
  br label %label_ret19
label_ret19:                                                ; preds = %label_true17, %label_false18
  %op46 = sub i32 %op0, 1
  br label %label_condition0
}
