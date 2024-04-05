#pragma once

#include "Value.hpp"
#include "PassManager.hpp"

class GepTrans : public Pass {
public:
    GepTrans(Module *m) : Pass(m) {}
    ~GepTrans() = default;
    void run() override;
};