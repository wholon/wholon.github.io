# JavaScript运算符

## 算术运算符

`JavaScript`中的算术运算符除了数学中常见的加减乘除外，还有递增、递减和取余等。

### + - * / %运算符

`JavaScript`中的加号除了具有数学中将两个数字相加的作用外，还能对字符串做连接操作。

对两个数字相加和数学中一样，字符串相加就是拼接字符串的意思，比如`Java+Script`的结果是字符串`JavaScript`。

当字符串和数字相加时需要进行类型转换，数字会先转为字符串，然后再做字符串的拼接。

> **提示：** 注意空格。 拼接操作不会在两个字符串之间添加空格。所以，如果想加上空格的话，你需要自己在字符串里面添加。

```js
var resultNumber = 1+1;//结果是2
var resultString1 = "1"+"1";//结果是“11”
var resultString2 = 1+"2";//结果是“12”
```

减法、乘法、除法以及取余运算符只能用于数字之间的计算，不能做字符串操作。

`-`和数学中减号用法相同；

`*`和数学中乘号用法相同；

`/`表示除以，结果是浮点数，不做四舍五入；

`%`表示取余数，`a%b`返回`a`除以`b`得到的余数，结果与`a`的符号相同。

> **提示**余数运算符（remainder）有时被错误地称为“模数”运算符。 它与模数非常相似，但不能用于负数的运算。

```js
var floatNumber = 3/2;//结果是1.5
var intNumber1 = 3%2;//结果是1
var intNumber2 = -3%2; //结果是-1
```

### 递增运算符和递减运算符

递增运算符`++`表示对一个数做加`1`的操作，递减运算符`--`表示对一个数做减`1`的操作。

`++`符号在数字的左边还是右边会影响运算的顺序，当`++`在数的左边时，表示先对数加`1`，再返回加`1`后的结果。在右边时，表示先返回该数的值，再加`1`。下面的例子展示了这种区别。

递减运算符`--`同理。

递增只对数字有效，不做字符串的拼接。

```js
var i = 1,j = 0;
j = i++;//j为1,i为2
var m = 1,n = 0;
n = ++m;//n为2,m为2
```

----

- 完成函数`mainJs()`；
- 将两个字符串参数`a`和`b`转换为数字；
- 计算`a`除以`b`的余数`c`；
- 将`a`、`b`、`c`分别转换为字符串；
- 拼接字符串`a`、`b`和`c`；

```js
function mainJs(a,b) {
    //请在此处编写代码
    /***********Begin**********/
    var a1 = parseInt(a);
    var b1 = parseInt(b);
    var c = a1 % b1;
    a = a.toString();
    b = b.toString();
    c = c.toString();
	/*********End************/
    return a+b+c;
}
```

## 比较和逻辑运算符

### 比较运算符

`JavaScript`中的比较运算符有`==`,`===`,`>`,`<`,`!=`,`>=`等。

- `==`叫做相等，`===`叫做严格相等。双等号和三等号的区别是：三等号要求数据类型和值都相等，双等号只需要值相等即可，相等包含严格相等。

从比较过程来看，严格相等先比较两个对象的数据类型是否相等，不相等则结束比较，返回`false`，相等在数据类型不同时，尝试进行数据类型转换，例如，在字符串和数字的比较中，字符串会被转为数字再比较；布尔值`true`转为数字`1`，布尔值`false`转为数字`0`。

> 在 JavaScript 中，为了让两个不同的数据类型（例如 `numbers` 和 `strings`）的值可以作比较，它必须把一种类型转换为另一种类型。 这叫作 “类型强制转换”。 转换之后，可以像下面这样来比较：
>
> ```js
> 1   ==  1  // true
> 1   ==  2  // false
> 1   == '1' // true
> "3" ==  3  // true
> ```

如果数据类型相同，相等和严格相等都会直接比较值，值相等返回`true`。

> 与相等操作符转换数据两类型不同，严格相等运算符不会做类型转换。
>
> 如果比较的值类型不同，那么在严格相等运算符比较下它们是不相等的，会返回 false 。
>
> **示例**
>
> ```js
> 3 ===  3  // true
> 3 === '3' // false
> ```
>
> 在第二个例子中，`3` 是一个 `Number` 类型，而 `'3'` 是一个 `String` 类型。

需要特别注意的是，以上仅仅适用于非对象类型。对于对象类型，相等或者严格相等比较的都是对象的引用，而不是具体的值，就是说，一个对象和其他任何对象都是不相等的，即使两者属性、值都相等。下面给出一些例子：

```js
var stringVariable = "2";
var number1 = 2;
var number2 = 2;
console.log(stringVariable == number1);//true
console.log(stringVariable === number1);//false
console.log(number1 === number2);//true
var studentA = {
name:"Bob",
age:22
}
var studentB = {
name:"Bob",
age:22
}
console.log(studentA == studentB);//false，因为不是同一个对象
var studentC = studentA;
console.log(studentA == studentC);//true，因为是同一个对象
```

将`studentA`赋值给`studentC`，这时`studentC`和`studentA`指向内存中的同一个地址块，视为同一个对象，所以两者相等。

- 不等 对应于上面的等号，不等号也有两种：`!=`和`!==`。 `!=`和`==`互为相反，`==`成立，`!=`一定不成立。 `!==`和`===`互为相反，严格相等成立，则严格不相等不成立。

  > 与相等运算符类似，不相等运算符在比较的时候也会转换值的数据类型。

- 其它 大于，小于，大于等于，小于等于的比较规则如下： 比较的两个对象都是数字，按照数学中数字的比较方法。 数字和字符串比较，字符串转为数字后再比较。 字符串和字符串比较，从第一个字符开始，逐个比较，发现不相等立即返回。字符按照`ASCII`编码值的大小比较，一般只要记住：数字<大写字母<小写字母，字母`a`小于字母`z`，`A`小于`Z`， 比较过程中，当一个字符串结束另外一个字符串还有，还没有比较出大小，则长的字符串较大。

  > 与相等运算符一样，大于运算符在比较的时候，会转换值的数据类型。

```js
var number1 = 1;//定义变量number1
var number2 = 2;//定义变量number2
var string1 = "3";//string1
var lowerLetter = "a";//定义变量lowerLetter
var upperLetter = "A";//定义变量upperLetter
var string1 = "aa";//定义变量string1
var String2 = "ab";//定义变量String2
console.log(number1<number2);//输出true
console.log(number2<string1);//输出true
console.log(upperLetter<lowerLetter);//输出true
console.log(lowerLetter<string1);//输出false
console.log(string1<string2);//输出true
```

### 逻辑运算符

在介绍逻辑运算符之前，我们必须明确逻辑运算符的操作数只能是布尔型，其他类型都会被转换为布尔型：除了`0`，`null`，`undefined`，`""`外，其他的值转换为布尔值都是`true`。

- `逻辑与` 逻辑与有两个操作数，中间用`&&`连接，只有两个操作数都是`true`结果才是`true`； 其中一个操作数不是布尔型，当左操作数为真值时，返回右操作数。当左操作数为假值时，返回左操作数。
- `逻辑或` 逻辑或同样有两个操作数，用`||`连接，至少有一个操作数为`true`时结果为`true`； 其中一个操作数不是布尔型，当左操作数为真值时，返回左操作数。当左操作数为假值时，返回右操作数。
- `逻辑非` 逻辑非只有一个操作数，`!`后连接操作数或表达式，意思是将操作数取反； 如果操作数不是布尔型，编译器首先将其他类型转换为布尔型，然后返回`true`或者`false`。

```js
console.log(true&&false);//false
console.log(true||false);//true
console.log(!false);//true
var number1 = 1;
var number2 = 0;
var string = "a";
console.log(number1&&string);//输出字符串"a"
console.log(number1||string);//输出数字1
console.log(!number1);//false
```

----

- 完成函数`mainJs()`；
- 比较字符串`a`和`b`的大小；
- 如果`a>b`，则返回`a`逻辑与`b`的结果，否则返回`a`逻辑取反的结果（返回时使用`return`）；
- 比较需要用到条件表示式，如下：

    ```js
    //打印a和b中较大的哪一个
    var a = 1,b = 2;
    if(a > b) {
        console.log(a);
    }
    else {
        console.log(b);
    }
    ```

```js
function mainJs(a,b) {
    //请在此处编写代码
    /********Begin***************/
    if(a > b) {
        return a && b;
    } else {
        return !a;
    }
    /**********End****************/
}
```

## 条件和赋值运算符

条件运算符最主要的作用是代替选择结构，简化代码。

### 条件运算符

条件运算符由`?`和`:`构成，三个操作数分别在`?`的左边、右边以及`:`的右边，第一个操作数如果是真值，整个表达式返回第二个操作数的值；第一个操作数如果是假值，返回第三个操作数的值。

一般我们说到`JavaScript`中的三元运算符，指的就是条件运算符，因为它有三个操作数。条件运算符通常用来简化表达式。

```js
var result1 = a>b?a:b;//result1赋值为a和b中大的那一个
var result2 = (a==5)?(a+1):(a-1);//a为5，返回a+1，否则返回a-1
```

> **使用多个三元运算符**
>
> 你也可以将多个运算符串联在一起以检查多种条件。
>
> 下面的函数使用 `if`，`else if` 和 `else` 语句来检查多个条件：
>
> ```js
> function findGreaterOrEqual(a, b) {
>   if (a === b) {
>     return "a and b are equal";
>   }
>   else if (a > b) {
>     return "a is greater";
>   }
>   else {
>     return "b is greater";
>   }
> }
> ```
>
> 以上函数可以使用多个三元运算符重写：
>
> ```js
> function findGreaterOrEqual(a, b) {
>   return (a === b) ? "a and b are equal" 
>     : (a > b) ? "a is greater" 
>     : "b is greater";
> }
> ```
>
> 如上文所示，对多个三元运算符进行每个条件都是单独一行的格式化被认为是最佳做法。 使用多个三元运算符而没有适当的缩进可能会使您的代码难以理解。 例如：
>
> ```js
> function findGreaterOrEqual(a, b) {
>   return (a === b) ? "a and b are equal" : (a > b) ? "a is greater" : "b is greater";
> }
> ```
>
> ------
>
> 在 `checkSign` 函数中使用多个三元运算符来检查数字是正数 ("positive")、负数 ("negative") 或零 ("zero")，使用 `findGreaterOrEqual` 里面的建议缩进格式。 函数应返回 `positive`、`negative` 或 `zero`。
>
> ```js
> function checkSign(num) {
>   return (num == 0) ? "zero"
>     : (num > 0) ? "positive"
>     : "negative";
> }
> 
> checkSign(10);
> ```

### 赋值运算符

赋值运算符就是`=`号，其实这个在前面出现过很多次了。赋值运算符的左边是一个变量或者对象的属性，右边是这个变量的值，意思是设置左边变量的值为右边的具体值。

除了基本的等号外，赋值运算符还可以和算术运算符结合。例如`a+=1`表示`a=a+1`，其中就把相加和赋值结合了起来。同理，相减、相乘、相除、取余、位运算都可以和赋值结合起来。如下：

```js
var b = 1;
b += 1;//等价于b = b+1
b *= 1;//等价于b = b*1
b /= 1;//等价于b = b/1
b %= 1;//等价于b = b%1
b &= 1;//等价于b = b&1
```

我们还可以使用 `+=` 运算符来拼接字符串到现有字符串变量的结尾。 对于那些被分割成几段的长的字符串来说，这一操作是非常有用的。

例如：

```js
let ourStr = "I come first. ";
ourStr += "I come second.";
```

`ourStr` 的值为字符串 `I come first. I come second.`

----

- 返回参数`a`和`b`中较大的字符串；
- 判断字符串的大小直接用`<`和`>`即可；

```js
function mainJs(a,b) {
    //请在此处编写代码
    /*********begin*********/
    return a > b ? a : b;
    /*********end*********/
}
```

## 运算符的优先级和结合性

在我们平时的学习中，经常会看到一些前辈的代码短小精悍却功能复杂，大部分是通过把大量运算符放在一起结合使用实现的，所以我们要深入理解运算符的优先级和结合性，写出漂亮的代码!

### 运算符的优先级

`JavaScript`中运算符的优先级和数学中运算符的优先级意思相同，优先级高的运算符比优先级低的运算符先计算，例如数学中`1+2*3`算式，先计算`2*3`,结果再与`1`相加，所以乘法的优先级高于加法，在`JavaScript`中，不同的优先级也是这个作用。

下面是常见的运算符的优先级：

| 分类 | 运算符         | 含义             | 结合性 |
| ---- | -------------- | ---------------- | ------ |
| 1    | ++             | 前后增量         | R      |
| 1    | --             | 前后减量         | R      |
| 1    | ！             | 逻辑非           | R      |
| 2    | * / %          | 乘 除 求余       | L      |
| 3    | + -            | 加减             | L      |
| 4    | < <= > >=      | 比较数字顺序     | L      |
| 4    | in             | 测试属性是否存在 | L      |
| 5    | ==             | 判断相等         | L      |
| 5    | !=             | 判断不等         | L      |
| 6    | &              | 按位与           | L      |
| 7    | &&             | 逻辑与           | L      |
| 8    | ?:             | 条件运算符       | R      |
| 9    | =              | 赋值             | R      |
| 9    | += -= *= /= %= | 运算且赋值       | R      |
| 10   | ,              | 忽略第一个操作数 | L      |

从上到下优先级逐渐降低。第一栏数字相同的运算符优先级相同，对于这个表格，不需要全部记住，但是常见的需要记住，比如加减乘除的优先级高于比较运算符，赋值运算符的优先级几乎是最低的，下面给出例子帮助理解：

```js
var a = 1;
var b = 2;
var c = ++a+b;
```

因为`++`的优先级高于`+`，所以上面的第三个句子等价于：

```js
var c = (++a)+b;
```

### 运算符的结合性

运算符的优先级是针对不同优先级的运算符来说的，对于同一级的运算符，运算顺序取决于运算符的结合性，比如加法和减法的优先级相同，而加法和减法都是从左向右结合，所以`a+b-c`式中，会先计算`a+b`，即按照阅读的顺序计算。

也有很多运算符是从右到左结合的，比如取反、逻辑非。

上面图中的第三栏就是结合性，`R`表示从右向左结合，`L`表示从左到右结合，从左向右的占多数，这和我们在数学中的习惯相同。

```js
var d = a*b/c;//先计算乘法后计算除法
var aa = 2;
var bb = 3;
var cc = aa *= bb;//先计算aa*=bb，再把结果赋值给cc，为6
```

上面第一个式子是从左到右结合，第四个式子是从右到左结合。 分别等价于：

```js
var d = (a*b)/c;
var cc = (aa *= bb);
```

----

- 参数`a`先减去`1`,所得差再与参数`b`相加，然后将结果再与`b`相乘；
- 上面的结果为`24`则给参数`c`赋值`1`，否则赋值`0`；
- 计算`c`与`d`（`d` 等于`4`）的积，这个积再与参数`d`求和，所得结果赋值给参数`e`；

```js
function mainJs(a,b) {
    var a = parseInt(a);
    var b = parseInt(b);
    //请在此处编写代码
    /*********begin*********/
    var c;
    if (((a - 1) + b) * b == 24) {
        c = 1;
    } else {
        c = 0;
    }
    var d = 4;

    var e = c * d + d;
    /*********end*********/
    return e;
}
```

