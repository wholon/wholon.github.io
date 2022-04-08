---
key: 2022-04-08-Mac使用CLI解压rar文件
---

## 背景

Mac 端自带的解压软件已经能够满足绝大多数需求，但对于 rar 这种格式的却没有支持。

为了不在软件上安装更多的 GUI 软件，希望能够通过 CLI + 快速操作的方式实现解压 rar 软件。

## 安装

1. 首先安装 HomeBrew

2. 运行

   ```shell
   brew install rar
   ```

   

3. 创建快速操作

   1. 打开自动操作

   2. 新建服务，选择左侧的“实用工具”，双击它下面的“运行shell脚本”选项。右侧会出现如下图所示。

      ![preview](https://cdn.jsdelivr.net/gh/wholon/image@main/2022-04-08-18:01:30-v2-3c79fa750a390e88d3de807244abdcb8_r.jpg)

   3. shell代码为

      ```shell
      for f in "$@"
      do
      	PATH="/usr/local/bin:$PATH"
      	unrar x $f $(dirname ${f})
      done
      ```

      

4. 在访达中右键点击需要解压的 rar 文件即可看到 unrar解压 的快速操作。

## 可能遇到的问题

* 无法打开“unrar”，因为Apple无法检查其是否包含恶意软件。

> 进入设置 -> 安全性与隐私 -> 通用 -> 允许 rar 即可。