# JavaScript数据类型

## JavaScript 数据类型介绍

JavaScript 的数据类型有数字、字符串、布尔型、对象类型、数组、null 和 undefined。

### 数字类型

JavaScript 中的数字类型指整数和浮点数，不刻意区分二者。

JavaScript 还支持16进制的整数，在所要表示的16进制数前面加上 0x 或者 0X 即可，如 0x1f 表示整数31。

对于较大或较小的数，JavaScript 还支持科学记数法，如 2e3 表示2000。

对于一般的数学运算，如加减乘除，和数学上的表达方式相同。对于稍微复杂的运算，需要通过 Math 对象定义的函数来实现，下面是一些例子：

```js
var number1 = 0X11;     //17
var number2 = 2.01e-2;     //2.01*0.01
var number3 = Math.sqrt(9);     //计算9的平方根
```

> **提示：** 不是所有的实数都可以用浮点数（floating point）来表示。 因为可能产生四舍五入的错误， [点击这里了解细节](https://en.wikipedia.org/wiki/Floating-point_arithmetic#Accuracy_problems)。

### 字符串

在 JavaScript 中，没有字符的说法，字符看成长度为1的字符串，字符串指包含在单引号或者双引号中的文本。

需要特别注意的是，字符串中的字符不能和外侧的单引号或者双引号构成一个引号对，如果字符串中有引号，需要用转义字符将这些引号变为普通字符，简单来说，转义字符的功能就是使字符串中的字符不被误认为该字符串的结束符号。

如 I'm studying a language，需要用`\`把中间的单引号转义：

```js
var tran = 'I\'m studying language';
```

另外，关于字符串，有很多常用的函数，可参考字符串相关文章。

> JavaScript 中的字符串可以使用开始和结束都是同类型的单引号或双引号表示。 与其他一些编程语言不同的是，单引号和双引号的功能在 JavaScript 中是相同的。
>
> 当你需要在一个字符串中使用多个引号的时候，你可以使用单引号包裹双引号或者相反。 常见的场景比如在字符串中包含对话的句子需要用引号包裹。 另外比如在一个包含有 `<a>` 标签的字符串中，标签的属性值需要用引号包裹。
>
> 然而，如果你需要在其中使用外面的引号，这就成为一个问题。 记住，一个字符串在开头和结尾处有相同的引号。 要知道，字符串在开头和结尾都有相同的引号，如果在中间使用了相同的引号，字符串会提前中止并抛出错误。

#### 转义字符

引号不是字符串中唯一可以被转义（escaped）的字符。 使用转义字符有两个原因：

1. 首先是可以让你使用无法输入的字符，例如退格。
2. 其次是可以让你在一个字符串中表示多个引号，而不会出错。

我们在之前的挑战中学到了这个。

| 代码 |  输出  |
| :--: | :----: |
| `\'` | 单引号 |
| `\"` | 双引号 |
| `\\` | 反斜杠 |
| `\n` | 换行符 |
| `\r` | 回车符 |
| `\t` | 制表符 |
| `\b` |  退格  |
| `\f` | 换页符 |

*请注意，必须对反斜杠本身进行转义，它才能显示为反斜杠。*

------

使用转义序列把下面三行文本赋值给一个变量 `myStr`。

> FirstLine<br> 	\SecondLine<br>ThirdLine

你需要使用转义字符正确地插入特殊字符。 确保间距与上面文本一致，并且单词或转义字符之间没有空格。

**注意：**`SecondLine` 前面的空白是制表符，而不是空格。

```js
const myStr = "FirstLine\n\t\\SecondLine\nThirdLine"; // 修改这一行
```

### 布尔型

布尔型：有两种逻辑状态的类型，它的值只有 true 和 false 两个，分别表示正确、错误。

```js
var boolType1 = true;
var boolType2 = false;
```

常用在控制结构的不同入口的判断上，如：

```js
if(myNumber == 1) {     //myNumber为1则返回true并进入下面的句子
    console.log("myNumber值为1")；
}
else {
    console.log("myNumber值不为1")；
}
```

> **注意：** 布尔值是不带引号的。 字符串 `"true"` 和 `"false"` 不是布尔值，在 JavaScript 中也没有特殊含义。

### 数组

JavaScript 中的数组是数据的集合，每一个数据在数组中对应一个位置，称为该数据的索引。数据称为数组中的元素，JavaScript 数组中的元素可以是不同的数据类型。

```js
var myArray = [1,2,true,"string",3.2];
```

上面就定义了一个含有整数、布尔型、字符串、浮点数的数组。 关于数组的内容有很多，详细请参考《JavaScript 学习手册五：JS 数组》。

### null 和 undefined

undefined 表示某个变量没有被赋值，比如，变量在申明的时候没有赋值，那么它的值就是 undefined。null 是对象，是一个空的对象引用。

```js
var myVar;
console.log(myVar);
console.log(a);
```

如上面所示，尝试输出变量 myVar，结果会输出 undefined，因为这个变量只申明，没有赋值。而尝试输出变量`a`会产生错误，因为这个变量没有定义，是一个空的对象引用。

> 记住 [`undefined` 是一个关键字](https://chinese.freecodecamp.org/news/how-to-install-arch-linux/#how-to-install-arch-linux)，而不是一个字符串。

### 对象类型

JavaScript 是面向对象的语言，严格的来说，在 JavaScript 中，一切都可称为对象。但是我们这里介绍的对象仅指键值对的集合，可以类比于 C 中的结构体或者 Java 中的对象。

- 对象的创建：

    ```js
    var student = {
        name:"Peter",
        age:23,
        gender:male
    };     //申明并初始化对象
    ```

- 对象的使用，比如获取对象里的某个属性的值：

    ```js
    console.log(student.name);     //输出"Peter"
    ```

- 还可以更改这个属性的值：

    ```js
    student.name = "Bob";console.log(student.name);     //输出"Bob"
    ```

----

- 在函数 objectTest() 内部定义了六个变量a、b、c、d、e、f，并已经赋值，你需要判断它们各是什么数据类型；
- 变量 aType、bType、cType、dType、eType、fType 分别表示上面六个变量的数据类型的名字，你需要给他们赋值。比如变量 a 如果是数字类型，需要给变量 aType 赋值字符串 number；
- 可选的数据类型名如下： number、string、bool、object、undefined 和 array 分别表示数字、字符串、布尔型、对象类型、undefined 还有数组。

```js
function objectTest() {
	var a = {name:"myName",id:2};
	var b = [1,true,2];
	var c = 1;
	var d = "1";
	var e = true;
	var f;
	var aType,bType,cType,dType,eType,fType;
	//请在此处编写代码
	/********** Begin **********/
    aType = "object";
	bType = "array";
	cType = "number";
	dType = "string";
	eType = "bool";
	fType = "undefined";
	/********** End **********/
	return aType+","+bType+","+cType+","+dType+","+eType+","+fType;
}
```

## JavaScript数据类型转换

在使用 JavaScript 进行的开发过程中，往往会碰到数据类型转换的需求，尤其是数字转字符串和字符串转数字。

例如，在 JavaScript 中，从前端页面获得的值都是字符串类型，包括数字也会被识别为字符串类型，这自然就产生了转换的需求。

### 字符串转整数

如果你想把一个字符串转换成整数，有两种方式。

- 使用 parseInt() 方法，参数为字符串，结果为该字符串转换而来的整数； 转化规则是：如果字符串的首字符不是一个数字，转换失败，返回 NaN；否则，转换到字符串中第一个不是数字的字符止，即，遇到字母、小数点下划线等字符立即停止转换。需要注意的是，16 进制的符号 0x 不会让转换停止。 parseInt() 还可以有第二个参数，表示待转换字符串的进制。下面给一些例子：

    > 进制可以是 2 到 36 的整数。

    ```js
    parseInt("12");
    parseInt("12.2");
    parseInt("C",16);
    parseInt("12a2");
    parseInt("0XC");     //以上均返回数字12
    parseInt("a12");     //失败
    ```

- 使用 Number() 进行强制类型转换； 使用 Number() 转换一个字符串，这个字符串必须是只含有数字的字符串，即数字的字符串形式。与上面的 parseInt() 方法对比可知，Number() 实现的是更加严格的字符串转换为数字操作。因为对于 12a3 这种含有字母等非数字字符的字符串，Number() 会报错。下面是一些例子。

    ```js
    Number("12");     //返回12
    Number("12a2");   //返回NaN
    Number("");       //返回0
    ```

### 字符串转小数

与整数相同，字符串转小数也有两种方式：parseFloat() 和 Number()。

parseFloat() 方法只转换到字符串中第一个不是数字的字符为止，当然这个字符不包括第一个小数点。这里有些不好理解，下面用例子解释。

```js
parseFloat("12");      //返回12
parseFloat("12.2a");   //返回12.2
parseFloat("12.2.2");  //返回12.2，第二个小数点会让转换停止
parseFloat(null);      //返回0
```

### 数字转字符串

toString() 实现一般的数字转字符串，String() 则是强制类型转换。

toString() 括号内有一个可选的参数，指以几进制的形式转换该字符串，如数字12调用 toString(16) 得到的结果就是 C，即12的16进制表示方式。

String() 可以转换 null 和 undefined，而 toString() 不可以。

```js
var myNum = 15;
console.log(myNum.toString());       //输出"15"
console.log(myNum.toString(16));     //输出"F"
console.log(String(myNum));          //输出"15"
```

### 布尔型与其他类型的相互转换

布尔型的值只有两个 true 和 false 。转换规则如下：

- 布尔型转为字符串直接就是字符串 true 或者 false；
- 布尔型中的 true 转换为数字 1，布尔型中的 false 转换为数字 0;
- 数字 0、null、undefined、空字符串转换为布尔型的 false，其他所有都是转换为 true。

下面例子中的 Boolean() 方法实现其他的类型转布尔型。

```js
var myBool = ture;
myBool.toString();     //返回"true"
Number(true);          //返回1
Boolean("js");         //返回true
Boolean("");           //返回false
```

注意，上面讲的空字符串是`""`，而不是空格字符串`" "`，这两个不同，后者双引号之间有一个英文字符的大小的空位，他们转为布尔型的结果不同：

```js
Boolean("");      //返回false
Boolean(" ");     //返回true
```

### 隐式转换

JavaScript 是一种弱类型语言，不同类型的变量在运算符的作用下会发生类型转换。这个是编译环境下直接进行的，所以叫隐式类型转换。下面是一些转换规则：

- `+`运算的两个操作数是数字和字符串，数字会被转换为字符串；
- `+`运算的两个操作数是数字和布尔型，布尔型会被转换为数字；
- `+`运算的两个操作数是字符串和布尔型，布尔型会被转换为字符串；
- 减、乘、除、取余运算会把其他类型转换为数字；
- if 括号中单独的一个变量会被转换为布尔型。

----

- 完成函数 mainJs()；
- 把函数三个参数（从左到右）依次转换为整数，整数和小数；
- 第一个参数既有可能是 12 这种纯整数的字符串形式，也有可能是 12a3 这种含有非数字字符的字符串；
- 第二个参数是 16 进制数字的字符串形式，如 af2；
- 第三个参数是纯小数的字符串形式，如 12.2；

```js
function mainJs(args1,args2,args3) {
	//请在此处编写代码
	/********** Begin **********/
    var a = parseInt(args1);
	var b = parseInt(args2, 16);
	var c = parseFloat(args3);
	/********** End **********/
    return a+b+c;
}
```

