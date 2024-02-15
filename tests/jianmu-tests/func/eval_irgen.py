#!/usr/bin/env python3
import subprocess
import os
import glob
def find_files_with_extension(folder_path, extension):
    pattern = os.path.join(folder_path, '*' + extension)
    files = glob.glob(pattern)
    return files
folder_path = './'   # 替换为你的文件夹路径
extension = '.sy'   # 替换为你的文件后缀名
files = find_files_with_extension(folder_path, extension)
    
def eval():
    f = open("eval_result", 'w')
    EXE_PATH = "../../../build/cminusfc"
    TEST_BASE_PATH = "./"
    total_points = 0
    for file in files:
        try:
            result = subprocess.run([EXE_PATH, "-o", TEST_PATH + ".ll", "-emit-llvm", TEST_PATH + ".cminus"], stderr=subprocess.PIPE, timeout=1)
        except Exception as _:
            f.write('\tFail\n')
            continue

        if result.returncode == 0:
            subprocess.run(["clang", "-O0", "-w", "-no-pie", TEST_PATH + ".ll", "-o", TEST_PATH, "-L", "../../../build", "-lcminus_io"])
            input_option = None
            if need_input:
                with open(ANSWER_PATH + ".in", "rb") as fin:
                    input_option = fin.read()

            try:
                result = subprocess.run(COMMAND, input=input_option, stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=1)
                with open(ANSWER_PATH + ".out", "rb") as fout:
                    if result.stdout == fout.read():
                        f.write('\tSuccess\n')
                        lv_points += score
                    else:
                        f.write('\tFail\n')
                        has_bonus = False
            except Exception as _:
                f.write('\tFail\n')
                has_bonus = False
            finally:
                subprocess.call(["rm", "-rf", TEST_PATH, TEST_PATH + ".o", TEST_PATH + ".ll"])

        else:
            f.write('\tFail\n')
            has_bonus = False

        if has_bonus:
            lv_points += bonus

        total_points += lv_points
        f.write('points of %s is: %d\n' % (level_name, lv_points))
        f.write('===========%s END========\n\n' % level_name)
    f.write('total points: %d\n' % total_points)


if __name__ == "__main__":
    eval()
