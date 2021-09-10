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
