#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH


sh_ver="2.1.1"




#0升级脚本
Update_Shell(){
	sh_new_ver=$(wget --no-check-certificate -qO- -t1 -T3 "https://raw.githubusercontent.com/veip007/hj/master/hj.sh"|grep 'sh_ver="'|awk -F "=" '{print $NF}'|sed 's/\"//g'|head -1) && sh_new_type="github"
	[[ -z ${sh_new_ver} ]] && echo -e "${Error} 无法链接到 Github !" && exit 0
	wget -N --no-check-certificate "https://raw.githubusercontent.com/veip007/hj/master/hj.sh" && chmod +x hj.sh
	echo -e "脚本已更新为最新版本[ ${sh_new_ver} ] !(注意：因为更新方式为直接覆盖当前运行的脚本，所以可能下面会提示一些报错，无视即可)" && exit 0
}
#—————————系统类—————————
#1改ls颜色(debian)
ls_color(){
	wget https://raw.githubusercontent.com/veip007/hj/master/bashrc && mv /root/bashrc /root/.bashrc
}
#2更改为中国时区(24h制,重启生效)
timezone(){
	cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && hwclock -w && echo $(curl -sSL "https://github.com/veip007/hj/raw/main/time") >> ~/.bashrc 
}
#3安装系统依赖
yl(){
	apt update && apt list --upgradable && apt install -y wget && apt install -y curl && apt install -y vim
}
#4 Nginx进程守护
Nginx(){
wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/hj/master/ng.sh && chmod +x ng.sh && crontab -l > conf && echo "*/1 * * * * ./ng.sh" >> conf && crontab conf && rm -f conf 	
}
#5小鸡性能测试
View_superbench(){
	bash <(curl -s -L https://raw.githubusercontent.com/veip007/cesu/master/superbench.sh)
}
#6回程线路测试
View_huicheng(){
	wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/huicheng/master/huicheng && chmod +x huicheng
}
#—————————代理类—————————
#11安装V2ary_233一键
Install_V2ray(){
	bash <(curl -s -L https://raw.githubusercontent.com/veip007/v2ray/master/v2.sh)
}
#12 V2八合一脚本
v2_8(){
	bash <(curl -s -L https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh)
}
#13 xray
xray(){
bash <(curl -sSL "https://raw.githubusercontent.com/veip007/scripts/master/xray.sh")
}
#14安装SSR多用户版
Install_ssr(){
	bash <(curl -s -L https://raw.githubusercontent.com/veip007/doubi/master/ssrmu.sh)
}
#15 trojan-go
trojan-go(){
bash <(curl -sSL "https://raw.githubusercontent.com/veip007/hj/main/trojan-go.sh")	
}
#16安装Tg专用代理
Tg_socks(){
	bash <(curl -s -L https://raw.githubusercontent.com/veip007/mtg-dist/master/install.sh)
}
#17安装Goflyway
Install_goflyway(){
	bash <(curl -s -L https://git.io/goflyway.sh && chmod +x goflyway.sh)
}
#18 Hysteria安装
Hysteria(){
bash <(curl -sSL "https://raw.githubusercontent.com/emptysuns/Hi_Hysteria/main/server/install.sh") 
}
#19 安装warp
warp(){
bash <(curl -sSL "https://cdn.jsdelivr.net/gh/fscarmen/warp/menu.sh")
}
#—————————加速类—————————
#31一键开启默认bbr
open_bbr(){
	modprobe tcp_bbr && echo "tcp_bbr" | tee --append /etc/modules-load.d/modules.conf && echo "net.core.default_qdisc=fq" | tee --append /etc/sysctl.conf && echo "net.ipv4.tcp_congestion_control=bbr" | tee --append /etc/sysctl.conf && sysctl -p && sysctl net.ipv4.tcp_available_congestion_control && sysctl net.ipv4.tcp_congestion_control && lsmod | grep bbr
}
#32安装BBR 锐速
bbr_ruisu(){
	bash <(curl -s -L https://raw.githubusercontent.com/veip007/Linux-NetSpeed/master/tcp.sh)
}
#33谷歌 BBR2 BBRV2
Google_bbr2(){
	bash <(curl -s -L https://raw.githubusercontent.com/yeyingorg/bbr2.sh/master/bbr2.sh)
}
#—————————辅助类—————————
#41安装Aria2
Aria2(){
	bash <(curl -s -L https://raw.githubusercontent.com/veip007/doubi/master/aria2.sh)
}
#42安装云监控
Install_status(){
	bash <(curl -s -L https://raw.githubusercontent.com/veip007/doubi/master/status.sh)
}
#43一键DD包（OD源）
DD_OD(){
	bash <(curl -s -L https://raw.githubusercontent.com/veip007/dd/master/dd-od.sh)
}
#44一键DD包（GD源）
DD_GD(){
	bash <(curl -s -L https://raw.githubusercontent.com/veip007/dd/master/dd-gd.sh)
}
#45 Netflix解锁检测
netflix(){
bash <(curl -sSL "https://github.com/veip007/Netflix_Unlock_Information/raw/main/netflix.sh")	
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
 —————————系统类—————————
 ${Green_font_prefix} 1.${Font_color_suffix} 改ls颜色(debian)
 ${Green_font_prefix} 2.${Font_color_suffix} 更改为中国时区(24h制,重启生效)
 ${Green_font_prefix} 3.${Font_color_suffix} 安装系统依赖
 ${Green_font_prefix} 4.${Font_color_suffix} Nginx进程守护
 ${Green_font_prefix} 5.${Font_color_suffix} 小鸡性能测试
 ${Green_font_prefix} 6.${Font_color_suffix} 回程线路测试:命令:./huicheng 您的IP
 —————————代理类—————————
 ${Green_font_prefix} 11.${Font_color_suffix} 安装V2ary_233一键
 ${Green_font_prefix} 12.${Font_color_suffix} V2八合一脚本
 ${Green_font_prefix} 13.${Font_color_suffix} xray安装 
 ${Green_font_prefix} 14.${Font_color_suffix} 安装SSR多用户版
 ${Green_font_prefix} 15.${Font_color_suffix} trojan-go安装
 ${Green_font_prefix} 16.${Font_color_suffix} Tg专用代理（Go版）
 ${Green_font_prefix} 17.${Font_color_suffix} 安装Goflyway
 ${Green_font_prefix} 18.${Font_color_suffix} Hysteria安装
 ${Green_font_prefix} 19.${Font_color_suffix} 安装warp
 —————————加速类—————————
 ${Green_font_prefix} 31.${Font_color_suffix} 一键开启默认bbr
 ${Green_font_prefix} 32.${Font_color_suffix} 加速系列：Bbr系列、锐速
 ${Green_font_prefix} 33.${Font_color_suffix} 安装谷歌 BBR2 BBRV2
 —————————辅助类—————————
 ${Green_font_prefix} 41.${Font_color_suffix} 安装Aria2
 ${Green_font_prefix} 42.${Font_color_suffix} 云监控
 ${Green_font_prefix} 43.${Font_color_suffix} 傻瓜式一键DD包（OD源）
 ${Green_font_prefix} 44.${Font_color_suffix} 傻瓜式一键DD包（GD源）
 ${Green_font_prefix} 44.${Font_color_suffix} Netflix解锁检测

 
 
 
  " && echo

fi
echo
read -e -p " 请输入数字 [0-44]:" num
case "$num" in
	0)
	Update_Shell
	;;
	1)
	ls_color
	;;
	2)
	timezone
	;;
	3)
	yl
	;;
	4)
	Nginx
	;;
	5)
	View_superbench
	;;
	6)
	View_huicheng
	;;
	11)
	Install_V2ray
	;;
	12)
	v2_8
	;;
	13)
	xray
	14)
	Install_ssr
	;;
	15)
	trojan-go
	;;
	16)
	Tg_socks
	;;
	17)
	Install_goflyway
	;;
	18)
	Hysteria
	;;
	19)
	warp
	;;
	31)
	open_bbr
	;;
	32)
	bbr_ruisu
	;;
	33)
	Google_bbr2
	;;
	41)
	Aria2
	;;
	42)
	Install_status
	;;
	43)
	DD_OD
	;;
	44)
	DD_GD
	;;
	45)
	netflix
	;;
	*)
	echo "请输入正确数字 [0-44]"
	;;
esac
