# JavaScript字符串

## 查找字符串的位置

### indexOf()

子字符串指一个字符串中**连续**的一部分。

   ![img](https://cdn.jsdelivr.net/gh/wholon/image@main/2022-04-08-18:41:00-199033.png)  

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

### 编程要求

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

### 编程要求

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

### 编程要求

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

### 编程要求

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

### 编程要求

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

