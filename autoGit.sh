#! /bin/zsh
# 自动化推送脚本, 在 ~/.zshrc 里面设置脚本运行的 alias
# 获取脚本所在绝对路径
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
cd $SHELL_FOLDER

# 以生产模式 build 网站
JEKYLL_ENV=production bundle exec jekyll build --incremental
git add .
# 变量1是传送的参数，也就是本次 git 的摘要
git commit -m "$1" 
git push origin