# 在GitHub pages中使用自定义插件

Stack Overflow问题 [Jekyll: How to use custom plugins with GitHub pages?](https://stackoverflow.com/questions/53215356/jekyll-how-to-use-custom-plugins-with-github-pages)

>  🪂 A Github Action to deploy the Jekyll site conveniently for GitHub Pages.https://github.com/jeffreytse/jekyll-deploy-action
>
>  **if you want to make Jekyll site run as if it were local, such as let the custom plugins work properly, this action can be very useful for you, beacause it's really convenient to build and deploy the Jekyll site to Github Pages.**

## 遇到的问题

这个 Action 对于一些依赖 git-log 的插件并没有很好的支持。因为它会在服务器端部署一个 Jekyll 并用其生成静态文件，然后在 gh-pages分支下新建拷贝所有的新生成的静态文件，从而打乱 git-log。

由于是在服务器端新建的环境，所以 git-log 也就失去了效用从而不在支持 jekyll-last-modified-at 插件。

## 解决方法

### 方法1: 结合GitHub Action 

1. 博客根目录下新建 `.github/workflow/copy-folder.yml` 文件

   ```yml
   name: Copy folder to other branch
   
   on: [push]
   
   jobs:
     copy:
       name: Copy my folder
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v2
         - name: copy
           env:
             SRC_FOLDER_PATH: '_site'
             TARGET_BRANCH: 'gh-pages'
           run: |
             files=$(find $SRC_FOLDER_PATH -type f) # get the file list
             git config --global user.name 'GitHub Action'
             git config --global user.email 'action@github.com'
             git fetch                         # fetch branches
             git checkout $TARGET_BRANCH       # checkout to your branch
             git checkout ${GITHUB_REF##*/} -- $files # copy files from the source branch
             git add -A
             git diff-index --quiet HEAD ||  git commit -am "deploy files"  # commit to the repository (ignore if no modification)
             git push origin $TARGET_BRANCH # push to remote branch
   ```

   其作用是把 main 分支下的 `SRC_FOLDER_PATH` 文件下的内容复制到 `TARGET_BRANCH` 分支

   > 如果博客默认生成在 `_sits` 文件夹中，那么你需要将其从 `.gitignore`移出。

2. 在博客根目录下新建文件 `autoGit.sh` 用于简化推送。

   ```shell
   #! /bin/zsh
   # 自动化推送脚本, 在 ~/.zshrc 里面设置脚本运行的 alias
   # 获取脚本所在绝对路径
   SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
   cd $SHELL_FOLDER
   
   # 以生产模式 build 网站
   JEKYLL_ENV=production bundle exec jekyll build
   git add .
   # 变量1是传送的参数，也就是本次 git 的摘要
   git commit -m "$1" 
   git push origin
   ```

3. 给 `autoGit.sh` 设置别名，比如如果你用的是 zsh，那么你可以在 `~/zsh.rc` 里面插入以下命令

   ```shell
   # 给向wholon.github.io push文章设置别名
   alias blog="zsh /Users/holon/Documents/GitHub/wholon.github.io/autoGit.sh"
   ```

4. 在终端任意位置输入

   ```shell
   blog "本次博客更新摘要"
   ```

   即可推送到远程仓库。

5. 成功。

> 此方法不行，这种方式只是相当于复制了 `SRC_FOLDER_PATH` 整个文件到  `TARGET_BRANCH` ，而我们需要 `SRC_FOLDER_PATH` 目录展开。

### 方法2: 结合 jgp 插件

1. 在本地编译静态文件。有一个很好用的 gem 插件 [Deploy Jekyll to GitHub Pages](https://www.yegor256.com/2014/06/24/jekyll-github-deploy.html)。

   它会从运行插件所在的目录推断远程仓库地址，然后从选择的分支拉取文件到本地，然后本地编译，最后再推送到 pages 分支。可以用 `jgd -h` 查看帮助。

2. 这种方法也能实现自定义插件。但是看的出来，需要先把本地修改的文件推送到远程再使用这个插件拉取，十分的费力，不建议使用。

### 方法3: 使用 Travis

需要付费

### 方法4: 本地构建✨

> [How do I push jekyll _site directory to gh-pages branch, and leave the source in master?](https://stackoverflow.com/questions/17835937/how-do-i-push-jekyll-site-directory-to-gh-pages-branch-and-leave-the-source-in)

将方法1中提到的 `autoGit.sh` 文件改为以下内容

```shell
#! /bin/bash
# 自动化推送脚本, 在 ~/.zshrc 里面设置脚本运行的 alias
# 获取脚本所在绝对路径
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
cd $SHELL_FOLDER

# 切换到 main
git checkout main

# 删除 _site网站下所有内容
rm -rf _site

# 从远程 clone gh-pages分支
git clone -b gh-pages https://github.com/wholon/wholon.github.io.git _site
# 以生产模式 build 网站
JEKYLL_ENV=production bundle exec jekyll build
# 推送源代码
git add .
# 变量1是传送的参数，也就是本次 git 的摘要
git commit -m "$1" 
git push origin

# 推送编译好的博客
cd _site
echo "[主页](https://holon.wang)" > README.md
git add .
git commit -m "$1"
git push origin
```

运行该脚本即可。

> GitHub pages需要部署在 gh-pages分支。

### 等待文章开头提到的 GitHubAction优化支持 git-log
