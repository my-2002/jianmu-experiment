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
2. 需要完成运行时库
3. 隐式类型转换没有对数组处理
4. 变量定义的数组部分的constexp可能需要做非负整数的检查,init的数组中是含有变量可能导致动态映射失败
5. 要对所有exp加const部分
6.变量定义的隐式转换没写