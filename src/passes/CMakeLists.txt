add_library(
    opt_lib STATIC
    Dominators.cpp
    Mem2Reg.cpp
    FuncInfo.cpp
    DeadCode.cpp
    LiveVar.cpp
    RegAlloc.cpp
    Gvn.cpp
    GepTrans.cpp
    LoopUnrolling.cpp
    LoopFind.cpp
    LoopInvariant.cpp
)
