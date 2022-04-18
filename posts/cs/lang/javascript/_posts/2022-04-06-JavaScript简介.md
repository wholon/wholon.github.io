# JavaScript语言简介

JavaScript 诞生于1995年。在那个时代用户提交一个表单需要获取服务器端的反馈，这个时间大概十几秒，如果能在客户端完成一些基本的验证绝对是很大的进步。当时如日中天的 Netscape 公司，决定着手开发一种客户端语言解决简单的表单验证。就职于 Netscape 公司的布兰登·艾奇开始着手计划将1995年2月发布的 LiveScript 同时在浏览器和服务器中使用。Netscape 与 Sun 公司成立了一个开发联盟。Sun 公司正是 Java 的拥有着，而此时，Netscape 为了搭上媒体热炒 Java 的顺风车，临时把 LiveScript 改名为 JavaScript，所以从本质上来说 JavaScript 和 Java 没什么关系。

1997年，以 JavaScript1.1 为蓝本的建议被提交给了欧洲计算机制造商协会（ECMA，European Computer Manufactures Association），该协会指定39号技术委员会负责将其进行标准化，TC39 经过数月的努力完成了 ECMA-262——定义了一种名为 ECMAScript 的新脚本语言的标准。

现在开发人员常说的 JavaScript 包含三个部分：ECMAScript、浏览器对象模型 (BOM) 和文档对象模型 (DOM)。

## JavaScript 注释

JavaScript 的注释与 JAVA 几乎相同，单行注释以`//`开头，在其后添加注释。多行注释以`/*`开头，以`*/`结尾，在中间添加注释。

```js
/**************函数名:getAbsolute******************/
/**************功能:求一个整数的绝对值**************/
/**************作者:Bruce*************************/
/**************时间:2018年2月1日*******************/
function getAbsolute(a) {
    if(a < 0) {
        a = -a;//取a的相反数
    }
    return a;
}
```

养成良好的注释习惯是一个优秀的开发人员的必备素质，注释写的好不好能衡量开发人员的编程水平，一般来说，一个源代码文件需要有一个总体的注释，每一个函数也需要像上面一样的注释，对于难理解的句子，需要单行注释。

## 搭建 JavaScript 的运行环境

JavaScript 运行环境的搭建很简单，下载并安装任意一种浏览器就可以。 以下是运行一个 JavaScript 源代码的全过程：

- 新建一个文本编辑器，打开后输入 JavaScript 源代码，关闭时以 .js 结尾；
- 在 HTML 中调用刚刚建立的 JS 文件；
- 以浏览器方式打开 HTML 文件。 用 Windows 系统自带的文本编辑器不是很方便，推荐使用 Sublime，这是一个免费的集成开发环境，具有代码自动补全等很多优点。
- 也可以使用 JetBrains 家的集成 IDE WebStrom

## JavaScript 输出

JavaScript 的输出有三种方式，如下：

### 第 1 种：弹出对话框模式

通过 `alert()` 函数弹出对话框，这是最常用的方式。在 script 标签下，调用 `window.alert()` 函数，括号内填入输出的内容。将下面的代码以文本编辑器编辑后改为 .html 后缀，然后用浏览器打开后即可弹出对话框。

```html
<!DOCTYPE html>
<html>
    <body>
        <script>
            window.alert("Hello,World!");
        </script>
    </body>
</html>
```

以浏览器方式打开刚刚建立的 HTMl 文件，在浏览器上面可以看到，如图1所示：

![image-20220406185819871](https://cdn.jsdelivr.net/gh/wholon/image@main/2022-04-06-18:58:20-image-20220406185819871.png)

这里的标签是 HTML 中的内容，关于 JavaScript 和 HTML 的关系，将在下一节介绍。

### 第 2 种：控制台模式

通过 console 输出到控制台，在 script 标签下，调用 `console.log()` 函数，括号内填入输出的内容，以浏览器打开下面的代码后，按 F12 键即可在浏览器的控制台中实现输出。

```html
<!DOCTYPE html>
<html>
    <body>
        <script>
        console.log("Hello,World!");
        </script>
    </body>
</html>
```

在浏览器的控制台可以看到如图所示的内容：

![image-20220406184846815](https://cdn.jsdelivr.net/gh/wholon/image@main/2022-04-06-18:48:47-image-20220406184846815.png)

除此之外，还有 `console.error()`、`console.warn()` 等方式实现输出，分别表示输出错误，输出警告。

### 第 3 种：页面输出模式

通过 `document.write()` 实现输出到页面。在 `document.write()` 函数的括号中填入输出的内容即可。例子如下：

```html
<!DOCTYPE html>
<html>
    <body>
        <script>
        document.write("Hello,World!");
        </script>
    </body>
</html>
```

浏览器的页面输出如图所示：

![image-20220406185111830](https://cdn.jsdelivr.net/gh/wholon/image@main/2022-04-06-18:51:12-image-20220406185111830.png)

此外，还有其他几种比较少用的输出方式，这里不做介绍，可参考相关文档。

## 练习1

- 采用相关知识板块介绍的任意一种方法，实现输出“ Hello,JavaScript! ”。

```html
<!DOCTYPE html>
<html>
	<head>
    <!-- 请在此处编写代码 -->
		<!---------Begin--------->
		<script>
			window.alert("Hello,JavaScript!");
		</script>
		<!---------End--------->
	</head>
	<body>
	</body>
</html>
```


## JavaScript 与 HTML

JavaScript 因弥补 HTML 的不足而诞生，使得 HTML 更加丰富多彩，可以说没有 HTML 就没有 JavaScript 的存在，所以当 JavaScript 用于开发网页时，都是放在 HTML 代码之中的，那么，如何在 HTML 中嵌入 JavaScript 呢？

要想了解 JavaScript 如何嵌入到 HTML 代码中，先必须了解 HTML 代码的基本结构。

### 什么是 HTML

HTML，即超文本标记语言，是一种用于编写网页的脚本语言，超文本，包括图片、视频、音频等非文本元素，这些元素要在网页上展示就离不开 HTML。目前，网站后台开发的语言和框架多种多样，前端却基本围绕着如何丰富 HTML 这个基础而发展。 作为一门编程语言，HTML 的内容很多，可以参考我们的 HTML 相关文章，这里仅介绍 HTML 代码的结构。 由尖括号对和括号内文字构成的整体被称为标签，两个匹配的标签构成标签对，匹配指两个标签的文字相同，后者文字前加入`/`符号，`<body></body>`即一个标签对。标签之间可以嵌套。 HTML 代码所有内容在`<html></html>`标签对之间，下层又分为两个标签对`<head></head>`和`<body></body>`，后者中间放入网页内容的主体部分。

### 使用内置 script 标签对的方式嵌入 JS 代码

将 JavaScript 嵌入到 HTML 中有两种方法，对于内容较少的 JavaScript 代码，常采用将 JavaScript 代码直接写在 HTML 中的做法。 在`<script></script>`之间写入 JavaScript 代码，然后将标签连同代码放入到`<head></head>`或者`<body></body>`之间，常见的是放在`<head></head>`之间，因为这样 JavaScript 和 HTML 的主体内容相对分开，便于阅读。如下是一个实例：

```html
<!DOCTYPE html>
<html>
    <head>
        <script>
        console.log("在HTML中嵌入JavaScript，这里是JS部分");
        </script>
    </head>
    <body>
    <!--这里是HTML的主体部分-->
    </body>
</html>
```

### 引入外置代码源文件的方式在 HTML 中嵌入 JavaScript

对于较长的 JavaScript 源代码，使用内置代码的方式会使得 HTML 代码过长，不符合程序开发模块化的要义。这时可采用引入外部代码文件的方式，即将所有的 JavaScript 代码放在一个扩展名为 .js 的文档中，然后将 script 标签的 src 属性值设置为待引入的 JavaScript 文件的路径名，再将`<script></script>`放在`<head></head>`或者`<body></body>`之间。如下是一个实例： 我们将 JavaScript 代码放在 myjs.js 中，HTML 代码放在 hello.html 中，两者在同一个目录下，其内容分别是：

myjs.js 如下：

```js
console.log("在HTML中嵌入JavaScript，这里是JS部分");
```

> 注意：上面的代码中千万不要再加`<script></script>`标签，这些标签是 HTML 语言的内容。 `hello.html`如下：

```html
<!DOCTYPE html>
<html>
    <head>
        <script src="myjs.js">
        </script>
    </head>
    <body>
    <!--这里是HTML的主体部分-->
    </body>
</html>
```

> 注意：这里 src 属性的值 JavaScript 文件的路径名，而不是文件名！这里因为是在同一个目录下，所以路径名同文件名。

## 练习2

- 将下面的 JavaScript 代码嵌入到 HTML 代码中；

- 必须使用内置代码的方式，如下代码所示。

  ```js
  console.log("如何在HTML代码中嵌入JavaScript代码");
  ```

```html
<!DOCTYPE html>
<html>
	<!-- 请在此处编写代码 -->
	<!---------Begin--------->
	<head>
		<script>
			console.log("如何在HTML代码中嵌入JavaScript代码");
		</script>
	</head>
	<body>
	</body>
	<!---------End--------->
</html>
```

## JavaScript 变量

变量可以看成语言中用来标记和存储数据的一种记号。

### JavaScript 中的变量

不同于 C 或 Java，JavaScript 是一种动态类型的语言，即申明的时候不指定变量的数据类型，而在运行的时候根据变量的具体值动态的判断变量的数据类型。 JavaScript 的变量名以字母或者`$`或者`_`开头；变量名只能含有字母、数字、下划线和美元符号；大小写敏感；不能使用保留的关键字，如 html、var、function 等，这一条一定要记住，使用关键字造成的错误往往很难排除。

### JavaScript 中的变量的申明、初始化和赋值

- 变量的申明 在 JavaScript 中，申明变量以关键字 var 开头，空一格后再接变量的名字；当然，可以一次申明多个变量，这时 var 只需要出现一次，多个变量名之间用英文的逗号隔开即可。如：
	```js
  var myvar1;     //申明变量"myvar1"
	var myvar2,myvar3,myvar4;     //一次申明三个变量
	```

- 变量的初始化和赋值 既然变量是用来记录数据的，如何给变量赋值呢？简单来说，和数学中一样，用一个等号连接变量名和变量的值即可，对于数字的赋值，直接用等号连接数字和变量，对于字符串的赋值，需要将字符串包含在英文双引号之中。 变量的第一次赋值称之为初始化。 你可能已经想到了，申明和初始化能一起进行吗？答案是肯定的，下面我们给出具体的例子：
	```js
    var numberVar;     //申明
    numberVar = 1;     //赋值为数字
    var stringVar;     //申明
    stringVar = "I am a String";     //赋值为字符串
    var myNumber = 2;     //申明的同时赋值为数字
    var myString = "我是字符串";     //申明的同时赋值
    var number1 = 1,number2 = 2;     //一次申明、赋值多个变量
	```
	> 注意：一个变量经过多次赋值，它的值为最后一次赋值的值。

### JavaScript 中的变量的作用域

变量的作用范围，或者说作用域，是指变量保持有效的范围，JavaScript 中的变量广义上来说分为局部变量和全局变量。

- 全局变量 在函数外部申明的变量称为全局变量，全局变量的作用自申明的地方起，到整个 JavaScript 文件的末尾（包括这其中的所有函数的内部）。下面是一个例子:
  ```js
  var wholeVar = 12;     //申明并初始化一个全局变量
  function () {
      var localVar = 1;     //局部变量
      console.log(wholeVar+localVar); //输出13
  };
  console.log(wholeVar);     //输出12
  ```

- 局部变量 局部变量是指申明在函数内部的变量，其作用域仅是本函数内部，在函数外不可用。 如果局部变量和全局变量的名字相同，那么在函数内部全局变量会被局部变量覆盖。
    ```js
    var myVar = 1;     //全局变量
    function scope() {
    var myVar = 2;     //局部变量，覆盖了上面的值
    console.log(myVar);     //输出2
    }
    ```

- 申明提前 JavaScript 局部变量有一个很重要的概念，叫申明提前，我们先来看一个例子。
	```js
	var wholeVar = 1;     //全局变量
	function myTest() {
	    console.log(wholeVar);
	    var wholeVar = 2;
	    console.log(wholeVar);
	}
	```

	关于第三行的输出，你的第一反应一定是1吧，正确答案是 undefined。这是因为在函数内部，变量不论在何处申明，都应该看成是在最开始申明（赋值不会看成是在最开始赋值，这就是不输出2的原因），这就是“申明提前”，所以，以上代码等价于：
	```js
	var wholeVar = 1;
	function myTest() {
	    var wholeVar;     //申明提前了，覆盖了全局变量
	    console.log(wholeVar);     //上面只申明，没赋值
	    wholeVar = 2;
	    console.log(wholeVar);
	}
	```

	> 注意：这个地方不太好理解，所以我们在编程的时候局部变量的名字最好不要和全局变量冲突。


## 练习3

- 定义一个局部变量 a，并赋值使其覆盖已有的全局变量 a；
- 定义一个全局变量 b 并初始化之；
- 上面两步必须使得函数 variableTest 返回 100+10*c，c 为输入；

```js
var a = 1;
// 请在此处编写代码
/********** Begin **********/
var b = 100;
/********** End **********/
function variableTest(c) {
	/********** Begin **********/
	var a = 10;
	/********** End **********/
    return a*c+b;
}
```

