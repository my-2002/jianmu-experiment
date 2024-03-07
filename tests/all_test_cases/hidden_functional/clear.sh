#!/bin/bash
# 删除llout
rm -rf llout
rm -rf output
# 指定目录
directory="./"
# 移除没有后缀的可执行文件
find "$directory" -type f -executable ! -name "*.*" -exec rm {} \;