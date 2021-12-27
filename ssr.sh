#!/bin/bash
# 自用SSR订阅脚本
wget -O /root/ssr/ssr.txt https://raw.githubusercontent.com/learnhard-cn/free_proxy_ss/main/free && wget -O /root/ssr/ssr-1.txt https://raw.githubusercontent.com/learnhard-cn/free_proxy_ss/main/v2ray/v2raysub && wget -O /root/ssr/ssr-2.txt https://raw.githubusercontent.com/gushushen/free/main/ss && wget -O /root/ssr/ssr-3.txt https://raw.githubusercontent.com/aiboboxx/v2rayfree/main/v2 && wget -O /root/ssr/ssr-4.txt https://raw.githubusercontent.com/alanbobs999/TopFreeProxies/master/sub/sub_merge_base64.txt && rm /www/wwwroot/www.lefu.men/ssr.txt
# 新建ssr文本
cd /www/wwwroot/www.lefu.men && touch ssr.txt
# 去广告
find /www/wwwroot/www.lefu.men/ -name 'ssr.txt' | xargs perl -pi -e 's|#github.com/v2rayfree|#lefu.men 乐福门|g'
