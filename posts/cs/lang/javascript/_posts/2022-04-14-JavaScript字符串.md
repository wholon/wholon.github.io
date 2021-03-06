# JavaScript字符串

## 查找字符串的长度

你可以通过在字符串变量或字符串后面写上 `.length` 来获得 `String`的长度。

```js
console.log("Alan Peter".length);
```

值 `10` 将显示在控制台中。 请注意，“Alan” 和 “Peter” 之间的空格字符也被计算在内。

例如，如果我们创建了一个变量 `const firstName = "Ada"`，我们可以通过使用 `firstName.length` 找出字符串 `Ada` 的长度属性。

------

使用 `.length` 属性将 `lastNameLength` 设置为 `lastName` 中的字符数。

```js
// 设置
let lastNameLength = 0;
const lastName = "Lovelace";

// 只修改这一行下面的代码
lastNameLength = lastName.length;
```

## 了解字符串的不变性

在 JavaScript 中，字符串（`String`）的值是不可变的（immutable），这意味着一旦字符串被创建就不能被改变。

例如，下面的代码：

```js
let myStr = "Bob";
myStr[0] = "J";
```

是不会把变量 `myStr` 的值改变成 `Job` 的，因为变量 `myStr` 是不可变的。 注意，这*并不*意味着 `myStr` 永远不能被改变，只是字符串字面量 string literal 的各个字符不能被改变。 改变 `myStr` 的唯一方法是重新给它赋一个值，例如：

```js
let myStr = "Bob";
myStr = "Job";
```

## 使用模板字面量创建字符串

模板字符串是 ES6 的另外一项新的功能。 这是一种可以轻松构建复杂字符串的方法。

模板字符串可以使用多行字符串和字符串插值功能。

请看以下代码：

```js
const person = {
  name: "Zodiac Hasbro",
  age: 56
};

const greeting = `Hello, my name is ${person.name}!
I am ${person.age} years old.`;

console.log(greeting);
```

控制台将显示字符串 `Hello, my name is Zodiac Hasbro!` 和 `I am 56 years old.`。

这里发生了许多事情。 首先，这个例子使用反引号（```），而不是引号（`'` 或者 `"`）将字符串括起来。 其次，注意代码和输出中的字符串都是多行的。 不需要在字符串中插入 `\n`。 上面使用的 `${variable}` 语法是一个占位符。 这样一来，你将不再需要使用 `+` 运算符来连接字符串。 当需要在字符串里增加变量的时候，你只需要在变量的外面括上 `${` 和 `}`，并将其放在模板字符串里就可以了。 同样，你可以在字符串中包含其他表达式，例如 `${a + b}`。 这个新的方式使你可以更灵活地创建复杂的字符串。

------

使用模板字符串的反引号的语法创建一个包含条目（`li`）字符串的数组。 每个条目应该是 `result` 对象 `failure` 属性的数组内的元素，并具有 `class` 属性，值为 `text-warning`。 `makeList` 函数应该返回列表项字符串的数组。

使用遍历方法（可以是任意形式的循环）输出指定值（如下）。

```js
[
  '<li class="text-warning">no-var</li>',
  '<li class="text-warning">var-on-top</li>',
  '<li class="text-warning">linebreak</li>'
]
```

```js
const result = {
  success: ["max-length", "no-amd", "prefer-arrow-functions"],
  failure: ["no-var", "var-on-top", "linebreak"],
  skipped: ["no-extra-semi", "no-dup-keys"]
};
function makeList(arr) {
  // 只修改这一行下面的代码
  const failureItems = [];
  // 下面是需要添加的
  for (let i = 0; i < arr.length; i++) {
    failureItems.push(`<li class="text-warning">${arr[i]}</li>`)
  }
  // 只修改这一行上面的代码

  return failureItems;
}

const failuresList = makeList(result.failure);
```



## 方括号查找字符串中的字符

方括号表示法（Bracket notation）是一种在字符串中的特定 index（索引）处获取字符的方法。

大多数现代编程语言，如 JavaScript，不同于人类从 1 开始计数。 它们是从 0 开始计数。 这被称为基于零（Zero-based）的索引。

### 查找第一个字符

例如，单词 `Charles` 的索引 0 的字符是 `C`。 所以如果 `const firstName = "Charles"`，你可以通过 `firstName[0]` 得到字符串第一个字母的值。

示例：

```js
const firstName = "Charles";
const firstLetter = firstName[0];
```

`firstLetter` 值为字符串 `C` 。

### 查找其他位置的字符

你也可以使用方括号（ bracket notation）来获得一个字符串中的其他位置的字符。

请记住，程序是从 `0` 开始计数，所以获取第一个字符实际上是第零个字符串。

例如：

```js
const firstName = "Ada";
const secondLetterOfFirstName = firstName[1];
```

`secondLetterOfFirstName` 值应该为字符串 `d`。

### 查找最后一个字符

要获取字符串的最后一个字符，可以用字符串的长度减 1 的索引值。

例如，如果 `const firstName = "Ada"`，则可以使用 `firstName[firstName.length - 1]` 获取字符串最后一个字母的值。

示例：

```js
const firstName = "Ada";
const lastLetter = firstName[firstName.length - 1];
```

`lastLetter` 值为字符串 `a`。

### 查找倒数第 N 个字符

我们既可以获取字符串的最后一个字符，也可以用获取字符串的倒数第 N 个字符。

例如，你可以使用 `firstName[firstName.length - 3]` 获取 `const firstName = "Augusta"` 字符串的倒数第三个字母的值

例如：

```js
const firstName = "Augusta";
const thirdToLastLetter = firstName[firstName.length - 3];
```

`thirdToLastLetter` 的值应该为字符串 `s`。

## 查找字符串的位置

### indexOf()

子字符串指一个字符串中**连续**的一部分。

   ![img](https://holon-image.oss-cn-beijing.aliyuncs.com/20220419144538CsV3x8.png)  

上图中有两个字符串`aaabc`和`abc`，将`abc`从左往右在`aaabc`中查找，第一次出现的位置是在`aaabc`的索引`2`处。

`indexOf()`就是返回某个字符串在字符串中**首次出现的位置**。如果搜索到尾部还没有找到，返回`-1`。

`indexOf(a,b)`中参数`a`是字符串；`b`是开始查找的位置，即从调用者（一个字符串）的第几个位置开始查找，可选。

```js
var short = "ab"; 
var long = "aabccccaab"; 
var mix = "cdef"; 
long.indexOf(short);//返回1 
long.indexOf(short,4);//返回8 
long.indexOf(mix);//返回-1  
```

可以看到第`4`行与第`5`行的结果不同，因为第`5`行是从`long`的第`5`个字符开始查找的。

### lastIndexOf()

从名字上就可以知道，这个函数与`indexOf()`功能很相似，区别是搜素方向是从后往前搜索。

`lastIndexOf()`也有两个参数，含义同`indexOf()`。

```js
var short = "ab"; 
var long = "aabccccaab"; 
var mix = "cdef"; 
long.lastIndexOf(short);//返回8 
long.lastIndexOf(short,4);//返回1 
long.lastIndexOf(mix);//返回-1  
```

----

补全代码片段中`Begin`至`End`中间的代码，具体要求如下：

- 函数`mainJs()`有两个字符串参数`a`和`b`，其中`b`比较短；
- 要求将`b`从左到右在`a`中查找，返回查找的位置之和；
- 比如`a`为`ababab`，`b`为`ab`，`b`在三个地方与`a`的子串查找，位置分别是`0`、`2`和`4`，返回他们的和`6`；

```js
function mainJs(a,b) {
	//请在此处编写代码
	/********** Begin **********/
    var result = 0;
	for (var i = 0; i < a.length; i++) {
		var curIndex = a.indexOf(b, i);
		if (curIndex == -1) {
			break;
		} else {
			i = curIndex + b.length - 1;
			result += curIndex;
		}
	}

	return result;
    
	/********** End **********/

}
```

## 求指定位置的字符

### charAt()

`charAt()`作用是返回调用者指定位置的字符，位置从`0`计数：

```js
var str = "abcdefg"; 
console.log(str.charAt(0));//输出a 
console.log(str.charAt(str.length-1));//输出g  
```

----

补全代码片段中`Begin`至`End`中间的代码，具体要求如下：

- `mainJs()`的参数`a`是一个身份证号，要求返回其中的前六位；

```js
function mainJs(a) {
	//请在此处编写代码
	/********** Begin **********/
    var result = "";
	for (var i = 0; i < 6; i++) {
		result += a.charAt(i);
	}

	return result;
	/********** End **********/
}
```

## 字符串的截取

字符串的截取是指获得原来字符串连续的一部分。这种操作很常见，比如现在各大互联网企业的招聘官网上，应聘者在填入身份证号码后，页面会自动截取中间`6`位生成出生日期，这是一种提高页面体验的方式。

### slice()

`slice(a,b)`的作用是截取`a`位置（**含**）到`b`位置（**不含**）之间的字符串，被截取的字符串不变，返回截取后获得的子字符串。比如`a`是`0`，`b`是`3`，则截取`0、1、2`三个位置的字符。

`b`为可选参数，不填则表示截取到字符串的**尾部**。`a`或`b`为负数时表示从右往左排，即`-1`表示最右侧的位置，依次类推。

```js
var str = "0123456789"; 
console.log(str.slice(0,4));//输出0123 
console.log(str.slice(3));//输出3456789 
console.log(str.slice(-3));//输出789 
console.log(str.slice(-5,-2));//输出567  
```

### substring()

`substring(a,b)`与`slice(a,b)`功能相同，参数的意义也相同：`a`和`b`都是表示位置的数字。只是参数的处理有些不同：

- `a`或`b`为负数时，自动转换为`0`；
- `a`大于`b`时，编译器会自动对调两者。

```js
var str = "0123456789";
console.log(str.substring(0,4));//输出0123 
console.log(str.substring(-1,4));//输出0123 
console.log(str.substring(4,0));//输出0123  
```

### substr()

与上面的两个函数不同，`substr(a,b)`指定开始位置和**要截取的长度**。

`a`表示开始位置（包含）；`b`表示截取的长度，可选。不填则截取到字符串**结尾**处；

`a`为负数时表示从右往左排，即`-1`表示最右侧的位置，依次类推。

```js
var myStr = "0123456789"; 
console.log(myStr.substr(3));//输出3456789 
console.log(myStr.substr(3,2));//输出34 
console.log(myStr.substr(-2));//输出89  
```

----

补全代码片段中`Begin`至`End`中间的代码，具体要求如下：

- 参数`a`表示待处理的碱基对序列，参数`b`表示可能的杂质字符串，`a`中只混入了`0`个或者`1`个杂质`b`，无其它杂质字符串；
- 你需要删除杂质`b`，返回无杂质的`a`碱基对；

```js
function mainJs(a,b) {
	//请在此处编写代码
	/********** Begin **********/
    var indexOfB = a.indexOf(b);
	if (indexOfB == -1) {
		return a;
	} else {
		return a.substring(0, indexOfB) + a.substring(indexOfB + b.length);
	}
    
	/********** End **********/
}
```

## 大小写转换

### toLowerCase()

`toLowerCase()`把字符串中的所有大写英文字母转为小写，返回转换后的字符串，但是操作该函数的字符串不变。

```js
var upperStr = "aBCd"; 
var lowerStr = upperStr.toLowerCase(); 
console.log(upperStr);//输出aBCd 
console.log(lowerStr);//输出abcd  
```

### toUpperCase()

与上面的函数相反，`toUpperCase()`把字符串中的所有小写英文字母转为大写，返回转换后的字符串，但是操作该函数的字符串不变。

```js
var str = "asdf"; 
var strin = str.toUpperCase(); 
console.log(str);//输出asdf 
console.log(strin);//输出ASDF  
```

----

补全代码片段中`Begin`至`End`中间的代码，具体要求如下：

- 已知参数`a`和`b`都是字符串，`a`比`b`长；
- 要求找到`a`中所有与`b`匹配的子字符串，将这些子字符串全部转化为大写，`a`的其它部分不变，返回转化完成后的`a`；

```js
function mainJs(a,b) {
	//请在此处编写代码
	/********** Begin **********/
    var result = "";
    for (var i = 0; i < a.length; i++) {
		var indexOfB = a.indexOf(b, i);
		if (indexOfB == i) {
			result = result + b.toUpperCase();
			i += b.length - 1;
		} else {
			result += a.charAt(i);
		}
	}

	return result;
	/********** End **********/
}

```

## 字符串的分割

### split()

还记得数组对象的方法`join()`吗？

字符串的方法`split()`与`join()`正好相反，`split()`以指定的字符分割字符串，从而得到一个子字符串数组。

比如字符串`a,b,c,d,e,f`以逗号为分隔符，就可以得到数组`["a","b","c","d","e","f"]`。

`split(a,b)`中的参数`a`是分割符，它的含义是：原来的字符串以该分隔符为边界，分为若干个子字符串（**不含该分隔符**）。`b`表示返回的数组的最大长度，不填表示返回所有子字符串组成的数组。

如果要实现分割每一个字符，需要用空字符串`""`作为分隔符。

```js
var str = "012304560789"; 
var arr1 = str.split("");//返回["0","1","2","3","4","5","6","7","8","9] 
var arr1 = str.split("0");//返回["123","456","789"]; 
var arr2 = str.split("0",2);//返回["123","456"];  
```

后面的学习中我们将看到，`a`也可以是一个正则表达式，表示以该正则表达式匹配到的字符串为分隔符。

----

补全代码片段中`Begin`至`End`中间的代码，具体要求如下：

- 参数`a`是字符串，是一段英文的文本，单词与单词之间要么以`,`隔开，要么以空格字符（即键盘上的`spcae`键）隔开；
- 利用`split()`方法统计`a`中单词的个数；

```js
function mainJs(a) {
	//请在此处编写代码
	/********** Begin **********/
    var firstArr = a.split(" ");
	var result = firstArr.length;
	firstArr.forEach(function(men, i, firstArr){
		var secondArr = men.split(",");
		if (secondArr.length > 1) {
			result += (secondArr.length - 1);
		}
	})

	return result;
    
	/********** End **********/
}
```

