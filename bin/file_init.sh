#!/bin/bash
#自定义函数遍历目录
function ergodic(){
for file in `find . -name "*.sh" |sed 's#.*/##'`
    do
    #判断文件是否是目录
        if [ -d $1"/"$file ]
        then
        #递归调用函数 遍历目录
             ergodic $1"/"$file
        else
                echo "修改文件权限 为可执行文件，修改文件为unix--->:" ${file}
                vi +':w ++ff=unix' +':q' ${file}
                chmod 777 ${file}
        fi
    done
}
INIT_PATH=$(pwd)
ergodic $INIT_PATH
#mkdir -p /home/jrxany/davinci/{workspace,jarhome}

