#!/bin/bash
# 指定文件夹路径和文件名规则
folder_path="./"
file_extension=".sy"
output_file="result.txt"
rm result.txt
# 遍历文件夹内指定后缀的文件
for file in "$folder_path"/*"$file_extension"; do
    if [ -f "$file" ]; then
        # 提取文件名
        file_name=$(basename "$file")
        echo "处理文件: $file_name"
        # 执行命令并将输出结果追加到输出文件中
        ../../.././build/parser "$file" >> "$output_file"
    fi
done
echo "处理完成"