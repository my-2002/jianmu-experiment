# 简介

本仓库为 USTC 编译原理和技术 2023 的课程实验仓库。在本学期的编译实验中，你们将构建一个从词法分析器开始到后端代码生成的JIANMU编译器。

你们需要 fork 此 repo 到自己的仓库下，随后在自己的仓库中完成实验。

## FAQ: 如何与上游远程分支进行 merge 操作

简单来说，你需要给上游仓库设置一个别名（alias）。在你 fork 后的本地仓库中：

```shell
$ git remote add upstream https://cscourse.ustc.edu.cn/vdir/Gitlab/compiler_staff/2023ustc-jianmu-compiler.git
```

然后尝试将远程的 commit 与你本地仓库进行 merge 操作：

```shell
$ git pull upstream master
```

然后将更改同步到你 fork 得到的远程仓库中：

```shell
$ git push origin master
```

# log
1. 对于新添加文件的cmake需要随使用进行修改
3. 隐式类型转换没有对数组处理
4. 变量定义的数组部分的constexp可能需要做非负整数的检查
5. getchar 暂时按照整数写，如需要更改，在cminusbuilderhpp中将有关函数类型改为TyChar即可
6. 数组和putf需要修改，计时函数没有完成
7. genstore处记得删
8. 84长数组需要优化，从中间代码角度
9. 对于浮点运算，暂时都按照单精度float处理，要是需要double，需要修改constantFP处的print函数到double,uint32改为64
10. 考虑函数调用时,寄存器上变量值的保存 条件表示寄存器的处理
11. phi函数可能涉及类型转换
12. 添加寄存器相等时不移动的判断

#### 运行时间
> perf 103s