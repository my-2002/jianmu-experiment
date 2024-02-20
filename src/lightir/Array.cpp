#include "../../include/lightir/Array.hpp"
#include "Module.hpp"

#include <iostream>
#include <memory>
#include <sstream>
#include <unordered_map>


Array::Array(ArrayType *ty, const std::vector<Value *> &val)
    : User(ty, "") {
    for (unsigned i = 0; i < val.size(); i++)
        add_operand(val[i]);
    this->array.assign(val.begin(), val.end());
}

Value *Array::get_element_value(int index) {
    return this->array[index];
}

Array *Array::get(ArrayType *ty,
                                  const std::vector<Value *> &val) {
    return new Array(ty, val);
}

std::string Array::print() {
    std::string const_ir;
    const_ir += this->get_type()->print();
    const_ir += " ";
    const_ir += "[";
    for (unsigned i = 0; i < this->get_size_of_array(); i++) {
        Value *element = get_element_value(i);
        if (!dynamic_cast<Array *>(get_element_value(i))) {
            const_ir += element->get_type()->print();
        }
        const_ir += element->print();
        if (i < this->get_size_of_array()) {
            const_ir += ", ";
        }
    }
    const_ir += "]";
    return const_ir;
}