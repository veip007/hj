#!/bin/bash
#$$表示当前shell的pid号,需要过滤掉(防止当前shell脚本名字包含nginx的字符)
ps -ef|grep nginx|grep -vE "grep|$$" >/dev/null
#直接通过$?获取上一句shell执行的状态
if [ $? -eq 0 ];then
                echo "Nginx is running"
        else
                # 2-适用于基于sysv的新版本系统
                systemctl restart nginx
                echo "Nginx is down,Starting..."
fi
