# Bootstrap

Bootstrap 一个是用于设计响应性网页和应用程序的前端框架。它对网页开发采用移动优先的方法，具有预定义的 CSS 样式和 class，以及一些 JavaScript 功能。

在本文中，你将学习如何使用 Bootstrap 来构建响应式网页，并使用它的 class 来设置按钮、图像、表格、导航和其他常见元素的样式。

<!--more-->

## 使用 Bootstrap Fluid 容器实现响应式设计

之前，在 freeCodeCamp 的 HTML5 和 CSS 章节中我们构建了一个 Cat Photo App。 我们在此基础上继续学习。 这次我们将会使用最受欢迎的响应式 CSS 框架 Bootstrap 来美化它。

Bootstrap 会根据屏幕大小来动态调整 HTML 元素的大小————因此称为 Responsive Design（响应式设计）。

通过响应式设计，我们将无需额外设计一个手机版的网页， 因为它在任何尺寸的屏幕上看起来都很棒。

任何 Web 应用，都可以通过添加如下代码到 HTML 顶部来引入 Bootstrap 。

```html
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
```

不过在这里，已经预先为此页面添加了上述代码。 注意使用 `>` 或者 `/>` 两种方式闭合 `link` 标签都是可行的。

首先，我们应该将所有 HTML（ `link` 标签和 `style` 元素除外）嵌套在带有 `container-fluid`class 的 `div` 元素里面。

![Kapture 2022-05-18 at 23.33.53](https://holon-image.oss-cn-beijing.aliyuncs.com/20220518233429gczery.gif)

## 使图片自适应移动端

首先，在已有的图片下面添加一张新的图片。 将新图片的 `src`属性设置为 `https://cdn.freecodecamp.org/curriculum/cat-photo-app/running-cats.jpg`。

如果图片的大小恰恰和我们手机屏幕尺寸大小一样自然是最好的。

幸运的是，现在通过 Bootstrap，我们仅仅只需要为 image 标签上设置 class 属性为 `img-responsive` ， 就可以让它完美地适应你的页面的宽度了。

![Kapture 2022-05-18 at 23.38.06](https://holon-image.oss-cn-beijing.aliyuncs.com/20220518233841IW50LF.gif)

## 用 Bootstrap 居中文本

可以使用 Bootstrap 将顶部的元素居中来美化页面。 只需要将 `h2` 元素的 class 属性设置为 `text-center` 就可以实现。

记住：可以为一个元素添加多个 classes ，class 间通过空格分隔，就像这样：

```html
<h2 class="red-text text-center">your text</h2>
```

![Kapture 2022-05-18 at 23.41.09](https://holon-image.oss-cn-beijing.aliyuncs.com/20220518234127AfoKbU.gif)

## 创建一个 Bootstrap 按钮

Bootstrap 的 `button` 元素有着独有的、比默认 HTML 按钮更好的样式风格。

在较大的小猫图片下方创建新的 `button` 元素。 为它添加 `btn` 与 `btn-default` 两个 classes 和 `Like` 文本。

----

![Kapture 2022-05-18 at 23.45.24](https://holon-image.oss-cn-beijing.aliyuncs.com/20220518234542qFiYjH.gif)

## 创建一个 Bootstrap 块级元素按钮

一般情况下，`btn` 和 `btn-default` 两个 classes 修饰的 `button` 元素宽度与它包含的文本相同， 举个例子：

```html
<button class="btn btn-default">Submit</button>
```

这个按钮的宽度应该和文本 `Submit` 的宽度相同。

通过为按钮添加 class 属性 `btn-block` 使其成为块级元素，按钮会伸展并填满页面的整个水平空间，后续的元素会流到这个块级元素的下方，即 "另起一行"。

```html
<button class="btn btn-default btn-block">Submit</button>
```

这个按钮会 100% 占满所有的可用宽度。

注意，这些按钮仍然需要 `btn` 这个 class。

给刚创建的 Bootstrap 按钮添加 Bootstrap 的 `btn-block`class。

![Kapture 2022-05-18 at 23.48.01](https://holon-image.oss-cn-beijing.aliyuncs.com/20220518234825nabX6z.gif)

## 体验 Bootstrap 按钮的不同主题

`btn-primary` class 的颜色是应用的主要颜色。 这样 “突出显示” 是引导用户按部就班进行操作的有效办法。

将按钮的 class 从 Bootstrap 的 `btn-default` 替换为 `btn-primary`。

注意：按钮仍然需要 `btn` 和 `btn-block` classes。

![Kapture 2022-05-18 at 23.54.08](https://holon-image.oss-cn-beijing.aliyuncs.com/20220518235447Rxl5rm.gif)

## 可选操作样式 btn-info

Bootstrap 有着丰富的预定义按钮颜色。 浅蓝色的 `btn-info`class 通常用在备选操作上。

在 `Like` 按钮下方使用文本 `Info` 创建一个新的块级 Bootstrap 按钮，并向其中添加 Bootstrap 的 `btn-info` 类。

注意：这些按钮仍然需要 `btn` 和 `btn-block` class。

![Kapture 2022-05-18 at 23.56.39](https://holon-image.oss-cn-beijing.aliyuncs.com/20220518235656cnL8AW.gif)

## 使用 btn-danger 提示危险操作

Bootstrap 有着丰富的预定义按钮颜色。 红色 `btn-danger` class 用来提醒用户此行为具有破坏性，比如删除一张猫的图片。

创建一个带有文本 `Delete` 的按钮，给它设置 class `btn-danger`。

注意：这些按钮仍然需要 `btn` 和 `btn-block` class。

![Kapture 2022-05-18 at 23.58.37](https://holon-image.oss-cn-beijing.aliyuncs.com/20220518235854P6K13F.gif)

## 使用 Bootstrap Grid 并排放置元素

Bootstrap 具有一套 12 列的响应式栅格系统，可以轻松的将多个元素放入一行并指定它们的相对宽度。 Bootstrap 的大部分 class 属性都可以应用在 `div` 元素上。

Bootstrap 的列宽取决于用户的屏幕宽度。 比如，手机有着窄屏幕而笔记本电脑有者更大的屏幕.

就拿 Bootstrap 的 `col-md-*` class 来说。 在这里， `md` 表示 medium （中等的）， 而 `*` 是一个数字，说明了这个元素占有多少个列宽度。 这个例子就是指定了中等大小屏幕（例如笔记本电脑）下元素所占的列宽度。

在 Cat Photo App 中，将使用 `col-xs-*` ， 其中 `xs` 是 extra small 的缩写 (比如窄屏手机屏幕)， `*` 是填写的数字，代表一行中的元素该占多少列宽。

将 `Like`，`Info` 和 `Delete` 三个按钮并排放入一个 `<div class="row">` 元素中，然后每个按钮都各用一个 `<div class="col-xs-4">` 元素包裹起来。

当 `div` 元素设置了 `row` class 之后，那几个按钮便会嵌入其中了。

![Kapture 2022-05-19 at 00.03.20](https://holon-image.oss-cn-beijing.aliyuncs.com/202205190003463CrwKi.gif)

## 用 Bootstrap 来取代我们之前的自定义样式

现在可以清理一下之前代码，用 Bootstrap 的内置样式来替换之前定义的样式，这样 Cat Photo App 看起来更简洁些。

别担心——以后会有大把时间来自定义 CSS 样式的。

删除 `style` 元素里的 `.red-text`，`p`，和 `.smaller-image`CSS 定义，使 `style` 元素只留下 `h2` 和 `thick-green-border`。

删除包含死链接的 `p` 元素。 然后将 `h2` 的 `red-text` class 替换为 Bootstrap 的 `text-primary` class。

最后，从第一个 `img` 元素中删除 `smaller-image` class，并将其替换为 `img-responsive` class。

## 使用 span 创建行内元素

可以使用 span 标签来创建行内元素。 还记得怎么使用 `btn-block` class 来创建填满整行的按钮吗？

普通按钮

块级按钮

上面的例子就是 "inline" （行内）元素和 "block" （块级）元素的区别。

通过使用行内元素 `span`，可以把不同的元素放在同一行，甚至能为一行的不同部分指定不同样式。

使用一个 `span` 元素，将文本 `love` 嵌入现在包含文本 `Things cats love` 的 `p` 元素中。 然后给 `span` 元素设置 class `text-danger`，使文本变成红色。

对含有文本 `Top 3 things cats hate` 的 `p` 元素这样处理：

```html
<p>Top 3 things cats <span class="text-danger">hate:</span></p>
```

