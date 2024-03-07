; ModuleID = 'sysy'
source_filename = "/home/syx/Test/jianmu/2023ustc-jianmu-compiler/tests/all_test_cases/hidden_functional/34_multi_loop.sy"

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
  %op3 = icmp slt i32 %op2, 3
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
label_condition3:                                                ; preds = %label_loop1, %label_ret8
  %op8 = load i32, i32* %op6
  %op9 = icmp slt i32 %op8, 4
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
label_condition6:                                                ; preds = %label_loop4, %label_ret11
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
  br label %label_condition3
label_condition9:                                                ; preds = %label_loop7, %label_ret14
  %op22 = load i32, i32* %op19
  %op23 = icmp slt i32 %op22, 3
  %op24 = zext i1 %op23 to i32
  %op25 = icmp sgt i32 %op24, zeroinitializer
  br i1 %op25, label %label_loop10, label %label_ret11
label_loop10:                                                ; preds = %label_condition9
  %op26 = alloca i32
  store i32 0, i32* %op26
  br label %label_condition12
label_ret11:                                                ; preds = %label_condition9
  %op27 = load i32, i32* %op12
  %op28 = add i32 %op27, 1
  store i32 %op28, i32* %op12
  br label %label_condition6
label_condition12:                                                ; preds = %label_loop10, %label_ret17
  %op29 = load i32, i32* %op26
  %op30 = icmp slt i32 %op29, 5
  %op31 = zext i1 %op30 to i32
  %op32 = icmp sgt i32 %op31, zeroinitializer
  br i1 %op32, label %label_loop13, label %label_ret14
label_loop13:                                                ; preds = %label_condition12
  %op33 = alloca i32
  store i32 0, i32* %op33
  br label %label_condition15
label_ret14:                                                ; preds = %label_condition12
  %op34 = load i32, i32* %op19
  %op35 = add i32 %op34, 1
  store i32 %op35, i32* %op19
  br label %label_condition9
label_condition15:                                                ; preds = %label_loop13, %label_ret20
  %op36 = load i32, i32* %op33
  %op37 = icmp slt i32 %op36, 4
  %op38 = zext i1 %op37 to i32
  %op39 = icmp sgt i32 %op38, zeroinitializer
  br i1 %op39, label %label_loop16, label %label_ret17
label_loop16:                                                ; preds = %label_condition15
  %op40 = alloca i32
  store i32 0, i32* %op40
  br label %label_condition18
label_ret17:                                                ; preds = %label_condition15
  %op41 = load i32, i32* %op26
  %op42 = add i32 %op41, 1
  store i32 %op42, i32* %op26
  br label %label_condition12
label_condition18:                                                ; preds = %label_loop16, %label_ret23
  %op43 = load i32, i32* %op40
  %op44 = icmp slt i32 %op43, 6
  %op45 = zext i1 %op44 to i32
  %op46 = icmp sgt i32 %op45, zeroinitializer
  br i1 %op46, label %label_loop19, label %label_ret20
label_loop19:                                                ; preds = %label_condition18
  %op47 = alloca i32
  store i32 0, i32* %op47
  br label %label_condition21
label_ret20:                                                ; preds = %label_condition18
  %op48 = load i32, i32* %op33
  %op49 = add i32 %op48, 1
  store i32 %op49, i32* %op33
  br label %label_condition15
label_condition21:                                                ; preds = %label_loop19, %label_ret26
  %op50 = load i32, i32* %op47
  %op51 = icmp slt i32 %op50, 5
  %op52 = zext i1 %op51 to i32
  %op53 = icmp sgt i32 %op52, zeroinitializer
  br i1 %op53, label %label_loop22, label %label_ret23
label_loop22:                                                ; preds = %label_condition21
  %op54 = alloca i32
  store i32 0, i32* %op54
  br label %label_condition24
label_ret23:                                                ; preds = %label_condition21
  %op55 = load i32, i32* %op40
  %op56 = add i32 %op55, 1
  store i32 %op56, i32* %op40
  br label %label_condition18
label_condition24:                                                ; preds = %label_loop22, %label_ret29
  %op57 = load i32, i32* %op54
  %op58 = icmp slt i32 %op57, 5
  %op59 = zext i1 %op58 to i32
  %op60 = icmp sgt i32 %op59, zeroinitializer
  br i1 %op60, label %label_loop25, label %label_ret26
label_loop25:                                                ; preds = %label_condition24
  %op61 = alloca i32
  store i32 0, i32* %op61
  br label %label_condition27
label_ret26:                                                ; preds = %label_condition24
  %op62 = load i32, i32* %op47
  %op63 = add i32 %op62, 1
  store i32 %op63, i32* %op47
  br label %label_condition21
label_condition27:                                                ; preds = %label_loop25, %label_ret32
  %op64 = load i32, i32* %op61
  %op65 = icmp slt i32 %op64, 3
  %op66 = zext i1 %op65 to i32
  %op67 = icmp sgt i32 %op66, zeroinitializer
  br i1 %op67, label %label_loop28, label %label_ret29
label_loop28:                                                ; preds = %label_condition27
  %op68 = alloca i32
  store i32 0, i32* %op68
  br label %label_condition30
label_ret29:                                                ; preds = %label_condition27
  %op69 = load i32, i32* %op54
  %op70 = add i32 %op69, 1
  store i32 %op70, i32* %op54
  br label %label_condition24
label_condition30:                                                ; preds = %label_loop28, %label_ret35
  %op71 = load i32, i32* %op68
  %op72 = icmp slt i32 %op71, 6
  %op73 = zext i1 %op72 to i32
  %op74 = icmp sgt i32 %op73, zeroinitializer
  br i1 %op74, label %label_loop31, label %label_ret32
label_loop31:                                                ; preds = %label_condition30
  %op75 = alloca i32
  store i32 0, i32* %op75
  br label %label_condition33
label_ret32:                                                ; preds = %label_condition30
  %op76 = load i32, i32* %op61
  %op77 = add i32 %op76, 1
  store i32 %op77, i32* %op61
  br label %label_condition27
label_condition33:                                                ; preds = %label_loop31, %label_ret38
  %op78 = load i32, i32* %op75
  %op79 = icmp slt i32 %op78, 7
  %op80 = zext i1 %op79 to i32
  %op81 = icmp sgt i32 %op80, zeroinitializer
  br i1 %op81, label %label_loop34, label %label_ret35
label_loop34:                                                ; preds = %label_condition33
  %op82 = alloca i32
  store i32 0, i32* %op82
  br label %label_condition36
label_ret35:                                                ; preds = %label_condition33
  %op83 = load i32, i32* %op68
  %op84 = add i32 %op83, 2
  store i32 %op84, i32* %op68
  br label %label_condition30
label_condition36:                                                ; preds = %label_loop34, %label_ret41
  %op85 = load i32, i32* %op82
  %op86 = icmp slt i32 %op85, 5
  %op87 = zext i1 %op86 to i32
  %op88 = icmp sgt i32 %op87, zeroinitializer
  br i1 %op88, label %label_loop37, label %label_ret38
label_loop37:                                                ; preds = %label_condition36
  %op89 = alloca i32
  store i32 0, i32* %op89
  br label %label_condition39
label_ret38:                                                ; preds = %label_condition36
  %op90 = load i32, i32* %op75
  %op91 = add i32 %op90, 2
  store i32 %op91, i32* %op75
  br label %label_condition33
label_condition39:                                                ; preds = %label_loop37, %label_ret44
  %op92 = load i32, i32* %op89
  %op93 = icmp slt i32 %op92, 3
  %op94 = zext i1 %op93 to i32
  %op95 = icmp sgt i32 %op94, zeroinitializer
  br i1 %op95, label %label_loop40, label %label_ret41
label_loop40:                                                ; preds = %label_condition39
  %op96 = alloca i32
  store i32 0, i32* %op96
  br label %label_condition42
label_ret41:                                                ; preds = %label_condition39
  %op97 = load i32, i32* %op82
  %op98 = add i32 %op97, 2
  store i32 %op98, i32* %op82
  br label %label_condition36
label_condition42:                                                ; preds = %label_loop40, %label_loop43
  %op99 = load i32, i32* %op96
  %op100 = icmp slt i32 %op99, 6
  %op101 = zext i1 %op100 to i32
  %op102 = icmp sgt i32 %op101, zeroinitializer
  br i1 %op102, label %label_loop43, label %label_ret44
label_loop43:                                                ; preds = %label_condition42
  %op103 = load i32, i32* %op0
  %op104 = add i32 %op103, 3
  %op105 = sdiv i32 %op104, 999
  %op106 = mul i32 %op105, 999
  %op107 = sub i32 %op104, %op106
  store i32 %op107, i32* %op0
  %op108 = load i32, i32* %op96
  %op109 = add i32 %op108, 3
  store i32 %op109, i32* %op96
  br label %label_condition42
label_ret44:                                                ; preds = %label_condition42
  %op110 = load i32, i32* %op89
  %op111 = add i32 %op110, 1
  store i32 %op111, i32* %op89
  br label %label_condition39
}
