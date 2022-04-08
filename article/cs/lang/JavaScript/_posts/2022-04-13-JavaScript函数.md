---
key: JavaScript函数
---

## 用函数语句定义函数

函数的定义是指用一段代码实现函数的功能，通常的定义方式以关键字`function`开头。

先给一个例子，该函数的功能是返回数组元素的和；

```js
function sumArray(arr) {    
    var sum = 0;  
    for(var i = 0,aLength = arr.length;i < aLength;i++) {    
        sum += arr[i];   
    }   
    return sum; 
}  
```

关键字`function`后面空一格，`sumArray`是函数的名字，其命名规范与变量名的命名规范相同：只能有字母、数字、下划线和美元符号，不能以数字开头，不能是关键字。

括号中是参数，又叫**形式参数**，只需要参数名就可以。参数可以是`0`个、`1`个或者多个，相互之间用`,`隔开，`{}`中间包含的是**函数体**。含有一条或者多条语句。函数体用来实现函数的功能。

关键字`return`后面是函数的**返回值**，函数也可以没有返回值。函数运行完`return`这句话这里就会退出运行，`return`下面的语句**不再运行**。返回值即函数的输出。

用这种方式定义的函数，在函数定义的前面和后面都可以调用该函数，只要函数和调用函数的语句在一个源文件里面就可以了。

### 编程要求

补全代码片段中`Begin`至`End`中间的代码，具体要求如下：

- 定义一个名字为`mainJs()`的函数；
- 该函数有两个参数，均为字符串类型；
- 函数的功能是返回这两个参数的拼接结果；

```js
//请在此处编写代码
/********** Begin **********/
function mainJs(str1, str2) {
    return str1 + str2;
}
/********** End **********/
```

## 用表达式定义函数

除了最直观的用函数语句定义函数之外，还可以用表达式定义函数。

用表达式的方式定义函数，就是用赋值表达式**把函数赋值给一个变量**，这其实就是把函数看成一个变量。这个时候函数可以有名字，也可以没有名字，没有名字的函数叫做**匿名函数**。

- 带名字的；

```js
var funct = function getMax(a,b) {   
    return a>b?a:b;  
};//注意这后面的分号不能少，因为我们定义的是一个变量!  
```

和前一关不同的是，只能在**函数定义语句之后**调用该函数，且调用的时候只能用**变量名**`funct`，不能用函数名`getMax`，如：

```js
var funct = function getMax(a,b) {  
    return a>b?a:b; 
}; 
console.log(funct(1,2));//输出2  
```

- 匿名函数；
  所谓匿名函数就是关键字`function`之后直接是参数列表：

```js
var funct = function(a,b) {   
    return a>b?a:b; 
};  
```

这个函数没有名字，它被赋值给了变量`funct`，所以叫匿名函数。同样，也只能在这一语句之后调用该函数。

```js
var funct = function(a,b) {   
    return a>b?a:b; 
}; 
console.log(funct(1,2));//输出2  
```

### 编程要求

补全代码片段中`Begin`至`End`中间的代码，具体要求如下：

- 定义一个匿名函数，将它赋值给变量`myFunc`；
- 该函数实现求一个三位数的各个位上的数字之和，比如`123`各个位上的数字分别为`1`、`2`和`3`，和是`6`；

```JS
function mainJs(a) {
    a = parseInt(a);
	//请在此处编写代码
	/********** Begin **********/
    var myFunc = function(a) {
		var result = 0;
		while (a != 0) {
			result += a % 10;
			a = Math.floor(a / 10);
		}

		return result;
	}
    
	/********** End **********/
    return myFunc(a);
}
```

## 函数的调用

我们曾经介绍过对象可以有自己的方法，当然这也是函数。这种函数的调用和前面两关定义的函数有细小的区别。

```js
//函数的定义：求三个数的最大值 
function max(a,b,c) {    
    if(a > b) {      
        if(a > c)     
            return a;     
        else           
            return c;    
    } else {      
        if(b > c)    
            return b;     
        else          
            return c;  
    } 
} 
//调用该函数 
var result = max(1,2,3);//result为3 
console.log(result);//输出3  
```

调用函数的时候，需要传入和形参相同个数的的具体值，上面的函数有`3`个参数，所以下面调用的时候传入`3`个具体的值，`1`传给参数`a`，`2`传给参数`b`，`3`传给参数`c`。函数的返回值通过赋值符号`=`传给了变量`result`。如果函数体内没有`return`关键字，将返回`undefined`。

再来看一下对象里定义的函数的调用：

```js
var ob = {   
    id:1,  
    getMax:function(a,b) {     
        return a>b?a:b;   
    } 
}; 
var result = ob.getMax(2,1);//result值为2 
var result1 = ob["getMax"](2,1);//result1的值也是2  
```

与上面的区别是，这里要定位到函数，需要使用`对象名.函数名`或者`对象名["函数名"]`,其它相同。

### 编程要求

补全代码片段中`Begin`至`End`中间的代码，具体要求如下：

- `mainJs()`代码区上面定义了三个函数，从上到下分别编号为`1`、`2`和`3`；
- `mainJs()`有三个参数`a`、`b`和`c`，根据`a`的值（函数的编号，可取的值是`1`、`2`和`3`）调用相应的函数（可选的函数分别是`getMax()`、`getMin()`和`getSum()`，具体请参考代码！），并传入参数`b`和`c`，返回得到的结果；
- 比如`a`为`1`表示你需要调用函数`getMax()`；

```js
//求最大值的函数
function getMax(b,c) {
    return b>c?b:c;
}

//求最小值的函数
var getMin = function(b,c) {
    return b>c?c:b;
}

//对象中的求和函数
var myObject = {
    id:1,
    name:"function",
    myFunc:function(b,c) {
        return b+c;
    }
}

function mainJs(a,b,c) {
    a = parseInt(a);
    b = parseInt(b);
    c = parseInt(c);
	//请在此处编写代码
	/********** Begin **********/
    var result;
    switch(a) {
        case 1: result = getMax(b, c);
        break;
        case 2: result = getMin(b, c);
        break;
        case 3: result = myObject.myFunc(b, c);
        break;
    }
    return result;
	/********** End **********/
}
```

## 未定义的实参

函数的基本功能是对函数内的参数进行操作，其中，函数定义时的参数被称为形式参数，函数被调用时传入的参数被称为**实际参数**。

在大部分的编程语言里面，都会对调用函数时传入的实参个数和类型进行检查，而`JavaScript`既**不检查**实参的类型，也不检查实参的个数。
`JavaScript`中的实参会按照顺序**从左到右**依次匹配上形参，例如：

```js
function myFunction(a,b,c) {  
    console.log(a);   
    console.log(b);    
    console.log(c); 
} 
myFunction(1,2,3);  
```

实参`1`传入形参`a`，实参`2`传入形参`b`，实参`3`传入形参`c`。   当实参个数少于形参时，靠右的形参会被传入值`undefined`。如：

```js
function myFunction(a,b,c) {   
    console.log(a);   
    console.log(b);   
    console.log(c); 
} 
myFunction(1,2);  
```

实参`1`传入形参`a`，实参`2`传入形参`b`，`undefined`传入形参`c`。   如果只想给右侧的参数传入数据，可以给前几个实参传入`undefined`。如：

```js
function myFunction(a,b,c){ 
    console.log(a); 
    console.log(b); 
    console.log(c); 
} 
myFunction(undefined,1,2);  
```

上面这两种做法不够严谨，最佳实践是给可能被传入`undefined`值的形参设定一个**默认值**。如：

```js
function getSum(a,b,c) {   
    if(c === undefined)     
        c = 0;    
    console.log(a+b+c); 
} 
myFunction(1,2);  
```

### 编程要求

补全代码片段中`Begin`至`End`中间的代码，具体要求如下：

- 路口有四个方向的红绿灯，其默认值分别是`green`、`green`
  、`red`和`yellow`；
- 对于函数`mainJs(a,b,c,d)`的四个参数，要求在没有传入实参或者传入`undefined`时，其分别设置为上述默认值；
- 最后返回四个字符串型参数的拼接结果，字符串中间用`-`符号隔开，如分别传入`red`、`red`、`yellow`和`undefined`时，返回`red-red-yellow-yellow`；

```js
function mainJs(a,b,c,d) {
	//请在此处编写代码
	/********** Begin **********/
    if (a == undefined) {
		a = "green";
	}
	if (b == undefined) {
		b = "green";
	}
	if (c == undefined) {
		c = "red";
	}
	if (d == undefined) {
		d = "yellow";
	}

	return a + "-" + b + "-" + c + "-" + d;
    
	/********** End **********/
}

```

## 实参对象

`JavaScript`一切都是对象，实参也是一个**对象**，有一个专门的名字`arguments`，这个对象可以看成一个数组（类数组，不是真的数组），实参从左到右分别是`arguments[0]、arguments[1]...`，`arguments.length`表示实参的个数。

实参对象一个最重要的应用是**可变长参数列表**，想象一下求一组数的和，如果这组数不在一个数组里面，使用函数来求则无法定义函数体，因为不知道形参的个数。这个时候就可以用`arguments`来解决问题。如:

```js
//求参数的和 
function getSum() {    
    var aLength = arguments.length;    
    var sum = 0;   
    for(var i = 0;i < aLength;i++) {     
        sum += arguments[i]; 
    }  
    return sum; 
} 
console.log(getSum(1,2,3,4,5))//输出15  
```

这里的形参直接省略，使用`arguments[i]`表示。

### 编程要求

补全代码片段中`Begin`至`End`中间的代码，具体要求如下：

- 定义函数`getMax()`；
- 该函数计算并返回一组整数的最大值；
- 整数的个数不确定；
- 如果整数个数为`0`，直接返回`0`；

```js
//请在此处编写代码
/********** Begin **********/
function getMax() {
    var aLength = arguments.length;
    var result = 0;
    for (var i = 0; i < aLength; i++) {
        if (arguments[i] > result) {
            result = arguments[i];
        }
    }

    return result;
}

/********** End **********/

function mainJs(a) {
    a = parseInt(a);
    switch(a) {
        case 1:return getMax(23,21,56,34,89,34,32,11,66,3,9,55,123);
        case 2:return getMax(23,21,56,34,89,34,32);
        case 3:return getMax(23,21,56,34);
        case 4:return getMax(23,21,56,34,89,34,32,11,66,3,9,55,123,8888);
        case 5:return getMax();
        default:break;
    }
}
```

## 对象作为参数

复杂的函数通常多达十几个参数，尽管`JavaScript`不做参数个数和类型的检查，但是调用时实参的顺序不能乱。开发人员需要检查每一个实参和形参的对应关系，这样效率很低。一种很好的解决方案是使用对象作为参数，函数会根据对象的**属性名**操作参数。

```js
function myFunction(obj) {   
    console.log(obj.name);  
    obj.number++;   
    return obj.number;
} 
myObj = {name:"myObj",number:34}; 
myFunction(myObj);//输出myObj 
console.log(myObj.number);//输出35  
```

这种情况下开发人员不需要记住或查阅形式参数的顺序。

### 编程要求

补全代码片段中`Begin`至`End`中间的代码，具体要求如下：

- 函数`objcetFunction()`的参数是一个对象，该函数的功能是返回`属性名1+':'+属性值1+','+属性名2+':'+属性值2+','+......+属性值n+','`；
- 测试的时候我们会往`mainJs()`传入参数`1`或`2`或`3`，分别表示调用函数`objectFunction()`并传入对象参数`park`、`computer`或者`city`；
- 比如对于第一个对象`park`，该函数需要返回`name:Leaf Prak,location:Fifth Avenue,todayTourists:4000,`；

```js
var park = {
    name:"Leaf Prak",
    location:"Fifth Avenue",
    todayTourists:4000
};

var computer = {
    name:"Levenon",
    price:"$800",
    memory:"8G"
};

var city = {
    name:"HangZhou",
    country:"Chine",
    population:9400000
}

function objectFunction(object) {
//请在此处编写代码
/********** Begin **********/
    var result = "";
    for (var att in object) {
        result = result + att + ":" + object[att.toString()] + ","
    }

    return result;

/********** End **********/
}

function mainJs(a) {
    a = parseInt(a);
    switch(a) {
        case 1:return objectFunction(park);
        case 2:return objectFunction(computer);
        case 3:return objectFunction(city);
        default:break;
    }
}
```

## 函数对象

`JavaScript`中一切都是对象，这句话同样适用于函数。函数对象可以作为函数的参数。

### 函数对象作为另一个函数的参数

一个函数（为方便行文，称为`a`函数）可以作为另外一个函数（称为`b`函数）的**参数**，`b`函数最终可以返回一个具体的值。

从原理上来说，`b`函数在自己的函数体内调用了`a`函数，所以需要把`a`函数的名字作为实际参数传递给`b`函数。如下：

```js
//求最大值 
function getMax(a,b) {    
    return a>b?a:b; 
} 
//求最小值 
function getMin(a,b) {   
    return a<b?a:b; 
} 
//下面这个函数以函数作为参数，并最终返回一个值 
function getM(func,num1,num2) {  
    return func(num1,num2); 
} 
getM(getMax,1,2);//返回2 
getM(getMin,1,2);//返回1  
```

我们把`a`函数的名字（`getMax`或者`getMin`）传给`b`函数（`getM（）`），然后在`b`函数内部调用闯入的`a`函数，得到相关的结果。

### 编程要求

补全代码片段中`Begin`至`End`中间的代码，具体要求如下：

- 已知`getOddNumber(a)`求数组`a`中奇元素的个数，`getEvenNumber(a)`求数组`a`中偶元素的个数；
- 完成函数`getNumber(func,a)`，实现：根据函数参数`func`的不同，求数组`a`中奇元素的个数或者偶元素的个数；
- 上一条提到的`func`的值只有可能是`getOddNumber`或者`getEvenNumber`。

```js
//求数组中奇数元素的个数
function getOddNumber(a) {
    var result = 0;
    for(var i = 0;i < a.length;i++) {
        if(a[i]%2 != 0)
            result++;
    }
    return result;
}

//求数组中偶数元素的个数
function getEvenNumber(a) {
    var result = 0;
    for(var i = 0;i < a.length;i++) {
        if(a[i]%2 == 0)
            result++;
    }
    return result;
}

function getNumber(func,a) {
	//请在此处编写代码
	/********** Begin **********/
    return func(a);

	/********** End **********/
}

//测试接口
function mainJs(b,a) {
    a = a.split(",");
    var aLength = a.length;
    for(var i = 0;i < aLength;i++) {
        a[i] = parseInt(a[i]);
    }
    if(b == "getEvenNumber") {
        return getNumber(getEvenNumber,a);
    } else {
        return getNumber(getOddNumber,a);
    }
}
```

