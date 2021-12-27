# coding:utf-8
import base64
import os

source_files_path = r'/root/ssr'  # txt文件绝对路径 ex: /root/tmp/原始文件
out_file_path = r'/www/wwwroot/www.lefu.men/'  # 成品文件绝对路径(提前创建好) ex: /root/result

files_path = os.listdir(source_files_path)
base64_tmp = []
for txt_file in files_path:
    if txt_file.endswith('.txt'):
        with open(os.path.join(source_files_path, txt_file), 'r', encoding='utf-8') as fn:
            _txt = fn.read()
            _txt_jiemi = base64.b64decode(_txt.encode('utf-8')).decode('utf-8')
            base64_tmp.append(_txt_jiemi.strip())

with open(os.path.join(out_file_path, 'ssr.txt'), 'a+', encoding='utf-8') as fn:
    fn.write('\n'.join(base64_tmp))
#with open(os.path.join(out_file_path, 'ssr_base64.txt'), 'a+', encoding='utf-8') as fn:
#    _text = '\n'.join(base64_tmp)
#    fn.write(base64.b64encode(_text.encode('utf-8')).decode('utf-8'))
#以上注释为不生成base64格式的txt
# 去广告
find /www/wwwroot/www.lefu.men/ -name 'ssr.txt' | xargs perl -pi -e 's|#github.com/v2rayfree|#lefu.men 乐福门|g'
