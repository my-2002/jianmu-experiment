#!/usr/bin/env python3
import subprocess
import os
import shutil
import glob
def find_files_with_extension(folder_path, extension):
    pattern = os.path.join(folder_path, '*' + extension)
    files = glob.glob(pattern)
    return files

TEST_PATH='./'   
def eval():
    folder_path = './'   # 替换为你的文件夹路径
    extension = '.sy'   # 替换为你的文件后缀名
    files = find_files_with_extension(folder_path, extension)
    f = open("eval_result", 'w')
    EXE_PATH = "../../../build/cminusfc"
    TEST_BASE_PATH = "./"
    for file in files:
        fname = os.path.basename(file)
        try:
            result = subprocess.run(['cminusfc',fname,"-emit-llvm"], stderr=subprocess.PIPE, timeout=1)
        except Exception as _:
            f.write('\tFail\n')
            continue

        if result.returncode == 0:
            subprocess.run(["clang", "-O0", "-w", "-no-pie", fname.split(".")[0] + ".ll", "-o", fname.split(".")[0], "-L", "-lcminus_io"])
            input_option = None
            if os.path.isfile(fname+".in"):
                with open(fname.split(".")[0] + ".in", "rb") as fin:
                    input_option = fin.read()
            try:
                result = subprocess.run([fname], input=input_option, stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=1)
                with open(fname.split(".")[0] + ".out", "rb") as fout:
                    if result.stdout == fout.read():
                        f.write('\tSuccess\n')
                    else:
                        f.write('\tFail\n')
                        has_bonus = False
            except Exception as _:
                f.write('\tFail\n')
                has_bonus = False
            #finally:
                #subprocess.call(["rm", "-rf", TEST_PATH, TEST_PATH + ".o", TEST_PATH + ".ll"])

        else:
            f.write('\tFail\n')

        f.write('===========END========\n\n')
    files = find_files_with_extension(folder_path, '.ll')
    if not os.path.exists("llout"):
        os.mkdir("llout")
    # 移动文件
    for file in files:
        file_path = os.path.abspath(file)
        new_file_path = os.path.join("llout", os.path.basename(file))
        shutil.move(file_path, new_file_path)
    

if __name__ == "__main__":
    eval()
