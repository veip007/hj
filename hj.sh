#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH


sh_ver="2.0.7"




#0升级脚本
Update_Shell(){
	sh_new_ver=$(wget --no-check-certificate -qO- -t1 -T3 "https://raw.githubusercontent.com/veip007/hj/master/hj.sh"|grep 'sh_ver="'|awk -F "=" '{print $NF}'|sed 's/\"//g'|head -1) && sh_new_type="github"
	[[ -z ${sh_new_ver} ]] && echo -e "${Error} 无法链接到 Github !" && exit 0
	wget -N --no-check-certificate "https://raw.githubusercontent.com/veip007/hj/master/hj.sh" && chmod +x hj.sh
	echo -e "脚本已更新为最新版本[ ${sh_new_ver} ] !(注意：因为更新方式为直接覆盖当前运行的脚本，所以可能下面会提示一些报错，无视即可)" && exit 0
}
 #1安装BBR 锐速
bbr_ruisu(){
	bash <(curl -s -L https://raw.githubusercontent.com/veip007/Linux-NetSpeed/master/tcp.sh)
}
#2谷歌 BBR2 BBRV2
Google_bbr2(){
	bash <(curl -s -L https://raw.githubusercontent.com/yeyingorg/bbr2.sh/master/bbr2.sh)
}
#3安装KCPtun
Kcptun(){
	bash <(curl -s -L https://github.com/veip007/Kcptun/raw/master/kcptun/kcptun.sh)
}
#4安装SSR多用户版
Install_ssr(){
	bash <(curl -s -L https://raw.githubusercontent.com/veip007/doubi/master/ssrmu.sh)
}
#5安装V2ary_233一键
Install_V2ray(){
	bash <(curl -s -L https://raw.githubusercontent.com/veip007/v2ray/master/v2.sh)
}
#6安装Tg专用代理
Tg_socks(){
	bash <(curl -s -L https://raw.githubusercontent.com/veip007/mtg-dist/master/install.sh)
}
#7安装Goflyway
Install_goflyway(){
	bash <(curl -s -L https://git.io/goflyway.sh && chmod +x goflyway.sh)
}
#8小鸡性能测试
View_superbench(){
	bash <(curl -s -L https://raw.githubusercontent.com/veip007/cesu/master/superbench.sh)
}

#9回程线路测试
View_huicheng(){
	bash <(curl -s -L https://raw.githubusercontent.com/veip007/huicheng/master/huicheng)
}
#10安装云监控
Install_status(){
	bash <(curl -s -L https://raw.githubusercontent.com/veip007/doubi/master/status.sh)
}
#11一键DD包（OD源）
DD_OD(){
	bash <(curl -s -L https://raw.githubusercontent.com/veip007/dd/master/dd-od.sh)
}
#12一键DD包（GD源）
DD_GD(){
	bash <(curl -s -L https://raw.githubusercontent.com/veip007/dd/master/dd-gd.sh)
}
#13Curl安装(debian)
Install_curl(){
	apt-get install curl
}
#14Vim安装(debian)
Install_Vim(){
	apt-get install vim-gtk
}
#15更改root密码
root_passwd(){
	passwd root
}
#16wget安装(debian)
Install_wget(){
	apt-get install wget
}	
#17更新系统源 (debian)
Install_update(){
	apt-get update	
}
#18改ls颜色(debian)
ls_color(){
	wget https://raw.githubusercontent.com/veip007/hj/master/bashrc && mv /root/bashrc /root/.bashrc
}
#19 Netflix解锁检测
netflix(){
bash <(curl -sSL "https://github.com/veip007/Netflix_Unlock_Information/raw/main/netflix.sh")	
}
#20 xray
xray(){
bash <(curl -sSL "https://raw.githubusercontent.com/veip007/scripts/master/xray.sh")	
}
action=$1
if [[ "${action}" == "monitor" ]]; then
	crontab_monitor_goflyway
else
echo && echo -e " 
+-------------------------------------------------------------+
|                          懒人专用                           |
|                 小鸡一键管理脚本 ${Red_font_prefix}[v${sh_ver}]${Font_color_suffix}                   |                      
|                     一键在手小鸡无忧                        |
|                     欢迎提交一键脚本                        |
+-------------------------------------------------------------+

  
 ${Green_font_prefix} 0.${Font_color_suffix} 升级脚本
 ——————————————————
 ${Green_font_prefix} 1.${Font_color_suffix} 加速系列：Bbr系列、锐速
 ${Green_font_prefix} 2.${Font_color_suffix} 安装谷歌 BBR2 BBRV2
 ${Green_font_prefix} 3.${Font_color_suffix} 安装KCPtun
 ${Green_font_prefix} 4.${Font_color_suffix} 安装SSR多用户版
 ——————————————————
 ${Green_font_prefix} 5.${Font_color_suffix} 安装V2ary_233一键
 ${Green_font_prefix} 6.${Font_color_suffix} Tg专用代理（Go版）
 ${Green_font_prefix} 7.${Font_color_suffix} 安装Goflyway
 ${Green_font_prefix} 8.${Font_color_suffix} 小鸡性能测试
 ——————————————————
 ${Green_font_prefix} 9.${Font_color_suffix} 回程线路测试:命令:./huicheng 您的IP
 ${Green_font_prefix}10.${Font_color_suffix} 云监控
 ${Green_font_prefix}11.${Font_color_suffix} 傻瓜式一键DD包（OD源）
 ${Green_font_prefix}12.${Font_color_suffix} 傻瓜式一键DD包（GD源）
 ——————————————————
 ${Green_font_prefix}13.${Font_color_suffix} Curl安装(debian)  
 ${Green_font_prefix}14.${Font_color_suffix} Vim安装(debian)  
 ${Green_font_prefix}15.${Font_color_suffix} 更改root密码  
 ${Green_font_prefix}16.${Font_color_suffix} wget安装(debian)  
 ${Green_font_prefix}17.${Font_color_suffix} 更新系统源 (debian)
 ${Green_font_prefix}18.${Font_color_suffix} 改ls颜色(debian)
 ——————————————————
 ${Green_font_prefix}19.${Font_color_suffix} Netflix解锁检测
 ${Green_font_prefix}20.${Font_color_suffix} xray安装 
  " && echo

fi
echo
read -e -p " 请输入数字 [0-20]:" num
case "$num" in
	0)
	Update_Shell
	;;
	1)
	bbr_ruisu
	;;
	2)
	Google_bbr2
	;;
	3)
	Kcptun
	;;
	4)
	Install_ssr
	;;
	5)
	Install_V2ray
	;;
	6)
	Tg_socks
	;;
	7)
	Install_goflyway
	;;
	8)
	View_superbench
	;;
	9)
	View_huicheng
	;;
	10)
	Install_status
	;;
	11)
	DD_OD
	;;
	12)
	DD_GD
	;;
	13)
	Install_curl
	;;
	14)
	Install_Vim
	;;
	15)
	root_passwd
	;;
	16)
	Install_wget
	;;
	17)
	Install_update
	;;
	18)
	ls_color
	;;
	19)
	netflix	
	;;
	20)
	xray	
	;;
	*)
	echo "请输入正确数字 [0-20]"
	;;
esac
