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
    if os.path.exists("./llout"):
        shutil.rmtree("llout")
    os.mkdir("llout")

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
            #f.write('\tFail\n')
            continue
        
        #print(result.returncode)
        if result.returncode == 0:
            exeres=subprocess.run(["clang", "-O0", "-w", "-no-pie", fname.split(".")[0] + ".ll", "-o", fname.split(".")[0], "-L", "-lcminus_io", "-ljianmu-src"])
            if(exeres.returncode!=0):
                print(fname.split(".")[0]+" 生成执行文件错误")
            input_option = None
            if os.path.isfile(fname.split(".")[0]+".in"):
                with open(fname.split(".")[0] + ".in", "r") as fin:
                    input_option = fin.read()
                    # print("input ="+input_option)
            try:
                result = subprocess.run(["./"+fname.split(".")[0]], input=input_option, stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=1)
                name=fname.split(".")[0]
                print(name+":"+"执行完成")
                #with open('./eval_result','wb') as ff:
                with open(fname.split(".")[0] + ".out", "r") as fout:               
                    if not str(result.stdout, encoding='utf-8').endswith("\n") and len(str(result.stdout, encoding='utf-8'))>0:
                        result_stdout = str(result.stdout, encoding='utf-8') +'\n'+ str(result.returncode)
                    else :
                        result_stdout = str(result.stdout, encoding='utf-8') + str(result.returncode)
                    print(result_stdout)
                    fout_content = fout.read()
                    f.write(fname.split(".")[0]+'\n')
                    f.write("输出\n")
                    f.write(result_stdout)
                    f.write("\n")
                    f.write("标答\n")
                    f.write(fout_content)
                    if result_stdout != fout_content:
                        print("结果不一致")
            except Exception as _:
                #f.write('\texecute Fail\n')
                print(fname.split(".")[0]+"执行失败")
                has_bonus = False
            #finally:
                #subprocess.call(["rm", "-rf", TEST_PATH, TEST_PATH + ".o", TEST_PATH + ".ll"])

        #else:
            #f.write('\tFail\n')

        #f.write('===========END========\n\n')
    files = find_files_with_extension(folder_path, '.ll')
    
    # 移动文件
    for file in files:
        file_path = os.path.abspath(file)
        new_file_path = os.path.join("llout", os.path.basename(file))
        shutil.move(file_path, new_file_path)
    

if __name__ == "__main__":
    eval()
