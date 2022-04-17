# 取消文章标题对与英文的首字母大写设置
# 如默认设置下 文章 `2020-02-02-HTML基础` 的标题会被更改为 Html基础
# 有了这个插件，标题会保持原样，即 HTML基础
# 详情见这篇文章： In Jekyll, how to change the capitalization rules for converting a file name into a blog post title?
# 链接：https://stackoverflow.com/questions/37975716/in-jekyll-how-to-change-the-capitalization-rules-for-converting-a-file-name-int
module Jekyll
    module Utils
        def titleize_slug(slug)
        slug.split("-").join(" ")
        end
    end
end