# hj
```bash
wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/hj/master/hj.sh && chmod +x hj.sh && bash hj.sh
```
# 测速

```bash
wget https://raw.githubusercontent.com/veip007/hj/master/speed.zip && unzip speed.zip && rm speed.zip && cd speed && chmod +x speedtest-backend && ./speedtest-backend
```
运行之后网页访问 IP:8989 即可测速， ssh里ctrl+c结束


# Nginx守护
```bash
wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/hj/master/ng.sh && chmod +x ng.sh && crontab -l > conf && echo "*/1 * * * * ./ng.sh" >> conf && crontab conf && rm -f conf 
```

### Linux下载M3U8
先安装ffmpeg
```
update && aptapt install -y ffmpeg
```

使用方法：
```
ffmpeg -i https://http://example.com/index.m3u8 -c:v copy abc.mp4
```
自行更改连接和文件名

### nginx子目录密码访问
1.运行下面脚本
```bash
wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/hj/master/htpasswd.sh && chmod +x htpasswd.sh && ./htpasswd.sh
```
依次输入用户名、密码、文件名称
文件默认保存在root目录
2.把生成的文件复制到要加密的文件夹下
3.更改nginx的server配置文件
```
    location /zb {
index index.html index.htm index.php;#默认首页
auth_basic "Restricted";#访问权限类型
autoindex off;#显示文件列表
charset utf-8;#编码
auth_basic_user_file /www/wwwroot/www.qq.com/zb/htpasswd;#用户名单
}
```
其中```htpasswd```为生成的文件名称，```location /zb```  中的```/zb```为要加密的子目录；注意更换自己的域名
