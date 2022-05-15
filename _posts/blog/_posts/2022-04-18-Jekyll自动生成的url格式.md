# Jekyll自动生成的url格式

见这篇文章: [Jekyll永久链接](http://jekyllcn.com/docs/permalinks/)

在 permalink 模板变量中有一个 slug 变量

>  slug: 由文件的文件名中确定的　Slugified title（除数字和字母之外的字符们会被取代为连字符），可以被文件头信息中的 `slug` 覆盖。

slug 变量也是在 [Jekyll解析文章标题问题](https://holon.wang/posts/blog/2022/04/17/Jekyll解析文章标题问题/) 文章中代码部分提到的变量。

所以对于 `2020-02-02-my first article.md`文件解析出的 url 将会是包含 `my-first-article` 形式的，所以**最佳实践是对于文章标题中的空格、之 等特殊符号统一用连字符代替**。