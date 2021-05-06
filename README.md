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
wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/hj/master/hj.sh && chmod +x hj.sh
```
```
crontab -e
*/1 * * * * bash /root/ng.sh
```
