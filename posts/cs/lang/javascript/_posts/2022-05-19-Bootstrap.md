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

![image-20220603232811517](https://holon-image.oss-cn-beijing.aliyuncs.com/20220603232811QdxCWO.png)

上面的例子就是 "inline" （行内）元素和 "block" （块级）元素的区别。

通过使用行内元素 `span`，可以把不同的元素放在同一行，甚至能为一行的不同部分指定不同样式。

使用一个 `span` 元素，将文本 `love` 嵌入现在包含文本 `Things cats love` 的 `p` 元素中。 然后给 `span` 元素设置 class `text-danger`，使文本变成红色。

对含有文本 `Top 3 things cats hate` 的 `p` 元素这样处理：

```html
<p>Top 3 things cats <span class="text-danger">hate:</span></p>
```

## 创建自定义标题

为 Cat Photo App 做一个导航，把标题和惬意的猫咪图片放在同一行。

记住，由于 Bootstrap 使用了响应式栅格系统，可以很方便的把元素放到一行以及指定元素的相对宽度。 大部分的 Bootstrap 的 class 都能用在 `div` 元素上。

把第一张图片和 `h2` 元素用一个简单的 `<div class="row">` 元素包裹起来。 再用 `<div class="col-xs-8">` 包裹 `h2` 元素，用 `<div class="col-xs-4">` 包裹我们的图片，这样它们就能位于同一行了。

注意现在图片是否与文字大小一致呢？

| Before                                                       | After                                                        |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![image-20220603233701734](https://holon-image.oss-cn-beijing.aliyuncs.com/2022060323370204HapW.png) | ![image-20220603233628442](https://holon-image.oss-cn-beijing.aliyuncs.com/2022060323362914LTQH.png) |

## 在按钮中添加字体图标

Font Awesome 是一个非常便利的图标库。 我们可以通过 webfont 或矢量图的方式来使用这些图标。 这些图标就和字体一样， 不仅能通过像素单位指定它们的大小，它们也同样会继承父级 HTML 元素的字号。

可以将 Font Awesome 图标库添加至任何一个 web app 中，方法很简单，只需要在 HTML head 标签中添加以下代码即可：

```html
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
```

在这个挑战中，我们已经为你在页面上添加好了 Font Awesome 图标库。

`i` 元素原本是用来表示斜体文字内容的；不过现在，用它来表示图标也很常见。 只需要为 `i` 元素添加相应的 class 就可以让它展示图标，比如：

```html
<i class="fas fa-info-circle"></i>
```

同时，我们也可以使用 `span` 元素来展示图标。

------

请使用 Font Awesome 来为我们的点赞按钮添加一个 `thumbs-up` 图标，只需添加一个 class 包含 `fas` 和 `fa-thumbs-up` 的 `i` 元素即可。 同时，请记得保留图标之后的文字内容 `Like`。

| Before                                                       | After                                                        |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![image-20220603233900372](https://holon-image.oss-cn-beijing.aliyuncs.com/20220603233900TAyr5s.png) | ![image-20220603233959064](https://holon-image.oss-cn-beijing.aliyuncs.com/20220603233959akOYzf.png) |

## 将字体图标添加到所有的按钮上

Font Awesome 是一个非常便利的图标库。 这些图标可以是网络字体，也可以是一张矢量图。 这些图标就和字体一样， 不仅能通过像素单位指定它们的大小，它们也同样会继承父级 HTML 元素的字号。

------

为 info 按钮添加 Font Awesome `info-circle` 图标，delete 按钮添加 `trash` 图标。

**注意：** 下述要求中的 `i` 元素也可以用 `span` 元素代替。

| Before                                                       | After                                                        |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![image-20220603234121925](https://holon-image.oss-cn-beijing.aliyuncs.com/20220603234122Kus4jq.png) | ![image-20220603234227369](https://holon-image.oss-cn-beijing.aliyuncs.com/20220603234227BcpPba.png) |

## 响应式风格的单选按钮

Bootstrap 的 `col-xs-*` class 也可以用在 `form` 元素上！ 这样就可以在不关心屏幕大小的情况下，将单选按钮均匀的平铺在页面上。

将所有单选按钮放入 `<div class="row">` 元素中。 再用 `<div class="col-xs-6">` 元素包裹每一个单选按钮。

**注意：** 提醒一句，单选按钮是 type 为 `radio`的 `input` 元素。

| Before                                                       | After                                                        |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![image-20220603234513291](https://holon-image.oss-cn-beijing.aliyuncs.com/20220603234513XyKsqR.png) | ![image-20220603234751945](https://holon-image.oss-cn-beijing.aliyuncs.com/202206032347524GtqrQ.png) |

## 响应式风格的复选框

Bootstrap 的 `col-xs-*` 可应用于所有的 `form` 元素上，包括复选框！ 这样就可以不必关注屏幕大小，均匀地把复选框放在页面上了。

------

将所有三个复选框都放置于一个 `<div class="row">` 元素中。 然后分别把每个复选框都放置于一个 `<div class="col-xs-4">` 元素中。

| Before                                                       | After                                                        |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![image-20220603234858001](https://holon-image.oss-cn-beijing.aliyuncs.com/20220603234858Jqge2G.png) | ![image-20220603235048373](https://holon-image.oss-cn-beijing.aliyuncs.com/20220603235048OG48dA.png) |

## 给表单输入框添加样式

可以在 submit `button` 元素内加上 `<i class="fa fa-paper-plane"></i>`，来添加 Font Awesome 的 `fa-paper-plane` 图标。

为表单的文本输入框（text input）设置 `form-control` class。 为表单的提交（submit）按钮设置 `btn btn-primary` class， 并为它加上 Font Awesome 的 `fa-paper-plane` 图标。

所有文本输入类的元素如 `<input>`，`<textarea>` 和 `<select>`只要设置 `.form-control` class 就会占满100%的宽度。

| Before                                                       | After                                                        |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![image-20220603235302602](https://holon-image.oss-cn-beijing.aliyuncs.com/20220603235302OD9Kbo.png) | ![image-20220603235439518](https://holon-image.oss-cn-beijing.aliyuncs.com/20220603235439J3vGqx.png) |

## 使用 Bootstrap 响应式排列表单元素

现在把表单里的 `input` 元素和 submit `button` （提交按钮）放在同一行。 跟着之前的做法来就行：准备好一个具有 `row` class 的 `div` 元素还有几个具有 `col-xs-*` class 的 `div` 元素。

先把表单的 text `input` （文本输入框）和 submit `button` （提交按钮）放进具有 `row` class 的 `div` 中。 再用 `col-xs-7` class 的 div 包裹表单的 text `input` （文本输入框）， `col-xs-5`class 的 `div` 包裹表单的 submit `button` （提交按钮）。

这是我们到目前为止 Cat Photo App 的最后一个挑战了。 祝你编码愉快。

| Before                                                       | After                                                        |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![image-20220603235541631](https://holon-image.oss-cn-beijing.aliyuncs.com/20220603235541nrrz5W.png) | ![image-20220603235659956](https://holon-image.oss-cn-beijing.aliyuncs.com/202206032357001PiQXm.png) |

## 创建一个 Bootstrap 标题

现在，来运用 HTML、CSS 和 Bootstrap 从头开始做点东西。

接下来将会搭建一个 jQuery playground，以便在后续的 jQuery 课程中使用它。

首先，创建一个包含 `jQuery Playground` 文本内容的 `h3` 元素。

通过给 `h3` 元素设置 Bootstrap 的 `text-primary` class 属性来为其上色，然后添加 Bootstrap 的 `text-center` class 属性使其文本居中显示。