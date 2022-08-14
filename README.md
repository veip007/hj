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

生成预览图
```bash
ffmpeg  -i input.mp4 -r 0.0033 -vf scale=-1:720 -vcodec png capture-%003d.png
```
其中input.mp4是需要生成预览图的视频

0.0033是间隔时间比率，这个数越小代表间隔时间越长，0.0033代表每5分钟左右截一张图片，如果调成0.0023大概就是7分钟一张图片

-1:720代表生成图片短边的长度，这里就是 ? x 720, ? 取决于视频的比例

capture-%003d.png代表文件名，生成的文件就以capture-001.png，capture-002.png.....为文件名，如果设置成capture-%002d.png，则文件名就是capture-01.png，capture-02.png.....


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
