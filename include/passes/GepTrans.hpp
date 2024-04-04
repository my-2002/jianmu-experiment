#pragma once

#include "Value.hpp"
#include "PassManager.hpp"

class GepTrans : public Pass {
public:
    GepTrans(Module *m) : Pass(m) {}
    void run();
private:
    Module *m_;
};