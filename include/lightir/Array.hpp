#pragma once

#include "Type.hpp"
#include "User.hpp"
#include "Value.hpp"

class Array : public User {
  private:
    std::vector<Value *> array;

    Array(ArrayType *ty, const std::vector<Value *> &val);

  public:
    ~Array() = default;

    Value *get_element_value(int index);

    unsigned get_size_of_array() { return array.size(); }

    static Array *get(ArrayType *ty,
                              const std::vector<Value *> &val);

    virtual std::string print() override;
};