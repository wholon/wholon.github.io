#! /bin/bash
# 自动化推送脚本, 在 ~/.zshrc 里面设置脚本运行的 alias
# 获取脚本所在绝对路径
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
cd $SHELL_FOLDER

# 清空 nohup.out
cat /dev/null > nohup.out

# 将输出定位到nohup.out
nohup nohup git add . && nohup git commit -m "$1" && nohup git push origin --force

# 切换到 main
# git checkout main
# 推送源代码
# 变量1是传送的参数，也就是本次 git 的摘要
# git add .
# git commit -m "$1"
# git push origin --force

# 以下是本地部署的部分
# 删除 _site网站下所有内容
# 从远程 clone gh-pages分支
# rm -rf _site
# mkdir _site
# git clone -b gh-pages https://github.com/wholon/wholon.github.io.git _site
# 以生产模式 build 网站
# JEKYLL_ENV=production bundle exec jekyll build

# 推送编译好的博客
# cd _site
# echo "[主页](https://holon.wang)" > README.md
# git add .
# git commit -m "部署博客"
# git push origin --force
