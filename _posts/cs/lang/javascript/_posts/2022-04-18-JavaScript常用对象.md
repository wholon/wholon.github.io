# JavaScript常用对象

## Math类

`Math`用于进行数学计算，没有构造函数。

### 常用的数

一些常用的无理数的表示方法：

| 表示       | 意义        | 约等于 |
| ---------- | ----------- | ------ |
| Math.E     | e           | 2.718  |
| Math.PI    | 圆周率      | 3.14   |
| Math.SQRT2 | 2的平方根   | 1.414  |
| Math.LN2   | 2的自然对数 | 0.693  |

```js
console.log(Math.PI);//输出3.141592653589793 
console.log(Math.pi == 3.141592653589793);//true 
console.log(Math.pi == 3.14);//false  
```

### 向上取整

`Math.ceil(x)`实现向上取整，返回大于等于`x`且离`x`最近的整数。  

```js
console.log(Math.ceil(1.1));//输出2 
console.log(Math.ceil(1));//输出1 
console.log(Math.ceil(-1.1));//输出-1  
```

### 向下取整

`Math.floor(x)`返回小于等于`x`且离`x`最近的整数。  

```js
console.log(Math.floor(1.1));//输出1 
console.log(Math.floor(1));//输出1 
console.log(Math.floor(-1.1));//输出-2  
```

### 随机数

`Math.random()`返回`0`到`1`之间的一个随机数，包含`0`不包含`1`。  

```js
console.log(Math.random());//输出0.1493135392665863  
```

### 平方根

`Math.sqrt(x)`返回`x`的平方根。

```js
Math.sqrt(4);//2 
Math.sqrt(2);//1.4142135623730951  
```

### 四舍五入

`Math.round(x)`返回`x`四舍五入后的整数。

```js
Math.round(1.5);//2 
Math.round(1.49);//1  
```

### 求最值

`Math.max(x1,x2,....xn)`返回参数的最大值，参数个数不限；

```js
Math.max(1,2,34,100);//100 
Math.max(-1,-2,-34,-100);//-1  
```

`Math.min(x1,x2,....xn)`返回参数的最小值；

```js
Math.min(1,2,34,100);//1 
Math.min(-1,-2,-34,-100);//-100  
```

### 随机数

随机数非常适合用来创建随机行为。

在 JavaScript 中，可以用 `Math.random()` 生成一个在`0`（包括 0）到 `1`（不包括 1）之间的随机小数。 因此 `Math.random()` 可能返回 `0`，但绝不会返回 `1`。

**提示：**[使用赋值运算符存储值](https://chinese.freecodecamp.org/learn/javascript-algorithms-and-data-structures/basic-javascript/storing-values-with-the-assignment-operator)这一节讲过，所有函数调用将在 `return`执行之前结束，因此我们可以 `return`（返回）`Math.random()` 函数的值。

------

更改 `randomFraction`，使其返回一个随机数而不是 `0`。

```js
function randomFraction() {
  return Math.random();
}
```

### 随机整数

生成随机小数很棒，但随机数更有用的地方在于生成随机整数。

1. 用 `Math.random()` 生成一个随机小数。
2. 把这个随机小数乘以 `20`。
3. 用 `Math.floor()` 向下取整，获得它最近的整数。

记住 `Math.random()` 永远不会返回 `1`。同时因为我们是在向下取整，所以最终我们获得的结果不可能有 `20`。 这确保了我们获得了一个在 `0`到 `19` 之间的整数。

把操作连缀起来，代码类似于下面：

```js
Math.floor(Math.random() * 20);
```

我们先调用 `Math.random()`，把它的结果乘以 20，然后把上一步的结果传给 `Math.floor()`，最终通过向下取整获得最近的整数。

------

使用这个方法生成并返回 `0` 和 `9` 之间的随机整数。

```js
function randomWholeNum() {
  // 只修改这一行下面的代码
  return Math.floor(Math.random() * 10);
}
```

### 范围随机数

我们之前生成的随机数是在 0 到某个数之间，现在我们要生成的随机数是在两个指定的数之间。

我们需要定义一个最小值 `min` 和一个最大值 `max`。

下面是我们将要使用的方法， 仔细看看并尝试理解这行代码到底在干嘛：

```js
Math.floor(Math.random() * (max - min + 1)) + min
```

------

创建一个函数 `randomRange`，参数为 `myMin` 和 `myMax`，返回一个在 `myMin`（包括 myMin）和 `myMax`（包括 myMax）之间的随机整数。

```js
function randomRange(myMin, myMax) {
  // 只修改这一行下面的代码
  return Math.floor(Math.random() * (myMax - myMin + 1) + myMin);
  // 只修改这一行上面的代码
}
```

### 其余方法

`Math`还有很多的方法，如下面的表格所示：

| 方法            | 作用                                 |
| --------------- | ------------------------------------ |
| Math.abs(x)     | 求x的绝对值                          |
| Math.pow(x,y)   | 计算x的y次幂                         |
| Math.exp(x)     | e的x次方                             |
| Math.log(x)     | x以e为底的对数                       |
| Math.sin(x)     | x的正弦                              |
| Math.cos(x)     | x的余弦                              |
| Math.tan(x)     | x的正切                              |
| Math.asin(x)    | x的反正弦                            |
| Math.acos(x)    | x的反余弦                            |
| Math.atan(x)    | x的反正切(-PI/2到PI/2之间)           |
| Math.atan2(y,x) | x轴到点(x,y)的角度 (-PI/2到PI/2之间) |

----

补全代码片段中`Begin`至`End`中间的代码，具体要求如下：

- 计算参数`a`向上取整、向下取整、四舍五入、平方根、正弦的结果，返回这些结果的最大值和最小值的和；

```js
function mainJs(a) {
    a = parseInt(a);
	//请在此处编写代码
	/********** Begin **********/
    var ceil = Math.ceil(a);
	var floor = Math.floor(a);
	var round = Math.round(a);
	var sqrt = Math.sqrt(a);
	var sin = Math.sin(a);
	return Math.max(ceil, floor, round, sqrt, sin) + Math.min(ceil, floor, round, sqrt, sin);
    
	/********** End **********/
}
```

## Date类

`Date`类用于处理日期和时间。

### 构造函数

`Date(x)`的参数`x`可以有四种情况：

```js
new Date();//无参数，返回当前时间 
new Date(millseconds);//参数为距离1970年1月1日8时0分0秒0毫秒的毫秒数，返回对应的时间  
new Date(timeString);//参数为时间字符串，返回这个时间字符串对应的时间  
new Date(year,month,day,hour,minute,second,millsecond);//参数为整数序列，分别表示年、月、日、时、分、秒、毫秒，返回这些时间参数对应的一个特定的时间  
```

以上均返回一个对应的时间对象，如下：  

```js
console.log(new Date());//输出Sat Apr 07 2018 18:56:00  
console.log(new Date(1000));//输出Thu Jan 01 1970 08:00:01 
console.log(new Date("April 7, 2018 18:00:00"));//输出Sat Apr 07 2018 18:00:00  
console.log(new Date(2018,4,7,18,0,0,0));//输出Mon May 07 2018 18:00:00  
```

时间对象有一系列获取和设置年、月、日、时、分、秒、毫秒的函数。

### 获取和设置年月日

为举例方便，我们先定义一个时间。

```js
//1970年1月1日上午8点0分0秒 
var date = new Date(0);  
```

- `x.getFullYear()`返回`x`对应的四位数年份，`x`为`Date`类对象；

```js
console.log(date.getFullYear());//输出1970  
```

- `setFullYear(year,month,day)`用于设置年份，`month`和`day`可选；

```js
date.setFullYear(2017); 
console.log(date);//输出Sun Jan 01 2017 08:00:00  
```

- `x.getMonth()`返回`x`中的月份，结果在`0`（一月）到`11`（十二月）之间；

```js
console.log(date.getMonth());//输出0  
```

- `setMonth(month,day)`作用是设置月份，`0`表示一月。`1`表示二月，依次类推，`day`可选；

```js
date.setMonth(2); 
console.log(date);//输出Sun Mar 01 1970 08:00:00  
```

- `x.getDate()`返回`x`对象在一个月的第几天(`1`到`31`），`x.getDay()`返回`x`对象在一个星期的第几天（`0`到`6`,`0`为周日）；

```js
console.log(date.getDate());//输出1 
console.log(date.getDay());//输出4  
```

由此可见，`1970`年`1`月`1`号那个美好的新年第一天是个周四。

- `setDate(day)`设置日期对象在一个月的第几天(`1`到`31`）；

```js
date.setDate(31); 
console.log(date.getDate());//输出31  
```

### 获取和设置时分秒

获取和设置时、分、秒、毫秒的函数在形式上与上面的函数几乎相同，这里以表格的形式列出：

| 方法                           | 作用                                | 参数或者结果的范围          |
| ------------------------------ | ----------------------------------- | --------------------------- |
| getHours()                     | 获取小时                            | 0~23                        |
| setHours(hour,min,sec,millsec) | 设置小时                            | 0~~23、0~~59、0~~59、0~~999 |
| getMinutes()                   | 获取分钟                            | 0~59                        |
| setMinutes(min,sec,millsec)    | 设置分钟                            | 0~~59、0~~59、0~999         |
| getSeconds()                   | 获取秒钟                            | 0~59                        |
| setSeconds(sec,millsec)        | 设置秒钟                            | 0~~59、0~~999               |
| getMillSeconds()               | 获取毫秒数                          | 0~999                       |
| setMillSeconds(millsec)        | 设置毫秒数                          | 0~999                       |
| getTime()                      | 获取距1970年1月1日8时0分0秒的毫秒数 | 大于等于0                   |
| setTime(millsec)               | 设置距1970年1月1日8时0分0秒的毫秒数 | 大于等于0                   |

注：以上多个参数的函数，除了第一个参数外的参数都为可选。

### 日期转字符串

`toString()`将日期转字符串，结果类似于`Sun Jan 07 2018 20:01:14 GMT+0800 (中国标准时间)`，分别表示星期、月份、天数、年份、小时、分钟、秒和时区（中国采用东八区时间）。

```js
console.log(new Date().toString());//输出Sat Apr 07 2018 20:40:14 GMT+0800 (中国标准时间)  
```

----

补全代码片段中`Begin`至`End`中间的代码，具体要求如下：

- `date`是一个时间对象，求出`date`对应的年份，月份(`0`表示一月），一个月第几天（`1`表示第一天），星期几（`0`表示周日，`1`表示周一）；
- 拼接这些结果（以`,`隔开）组成一个字符串并返回该字符串；

```js
function mainJs(a) {
    a = parseInt(a);
    var date = new Date(a);
    /*********Begin*********/
    return date.getFullYear() + "," + date.getMonth() + "," + date.getDate() + "," + date.getDay();

    /*********End*********/
}

```

## JavaScript错误

`JavaScript`代码在运行过程中，可能会因为很多原因出现错误，如：语法错误、用户输入错误等。发生错误后不能置之不理，要进行处理。为可能的错误提前在代码中制定解决方案。

### try-catch捕获和处理错误

用法如下：

```js
try {    
    //运行时可能出错的代码 
}catch(err) {   
    //处理出现的错误 
}  
```

`JavaScript`在运行时抛出的错误或者异常，会被`catch`语句捕捉到，其中的变量`err`包含了错误的有关信息。

```js
try {    
    console.lo("JavaScript"); 
}catch(err) {   
    window.alert("发生错误，错误信息："+err.message);
} 
console.log("错误已处理完毕。");  
```

第二句有语法错误，被`catch`捕捉到，错误信息`console.lo is not a function`通过弹窗告知用户。用户点击弹窗上的确定后，程序继续往下运行。

如果没有进行错误处理，程序在第二句停止运行，这样后面的所有代码都不再执行。

### 创建自定义错误

`console.lo is not a function`显然是一个系统内置的错误类型，如果用户觉得这样的错误类型不够具体，可以自定义错误类型：

```js
throw exception;  
```

`exception`可以是字符串、数字、逻辑值或者对象，这样的错误也会被`catch`语句块捕获。

```js
//求开方的值 
function mySqrt(a) {   
    try {      
        if(a < 0)      
            throw new Error("错误！负数不能开平方");    
        if(a > 10000)       
            throw new Error("错误！不支持大数开平方");     
        return Math.sqrt(a);  
    } catch(err) {      
        console.log("发生错误，错误信息："+err.message);   
    }     
    return "error"; 
}  
```

`new Error()`是一个`Error`对象，括号内的参数是`err.message`属性的值。比如`a`是`-2`，抛出第一个自定义异常，并在`catch`块中输出异常的信息，函数最后返回`error`。

----

补全代码片段中`Begin`至`End`中间的代码，具体要求如下：

- 补充完整函数`mainJs(a)`，函数的功能是返回`a`的平方根的倒数；
- 如果`a`为负数，抛出异常`negative cannot be rooted`，同时将该异常信息作为结果返回；如果`a`为`0`，抛出异常`zero cannot be numerator`，同时将该异常信息作为结果返回；

```js
function mainJs(a) {
	//请在此处编写代码
	/********** Begin **********/
    try {
		if (a < 0) {
			throw new Error("negative cannot be rooted");
		} else if (a == 0) {
			throw new Error("zero cannot be numerator");
		}
		return 1 / Math.sqrt(a);
	} catch (err) {
		return err.message;
	}
	return "error";
	/********** End **********/
}
```

## JavaScript Promise

### 创建一个 JavaScript Promise

Promise 是异步编程的一种解决方案 - 它在未来的某时会生成一个值。 任务完成，分执行成功和执行失败两种情况。 `Promise` 是构造器函数，需要通过 `new` 关键字来创建。 构造器参数是一个函数，该函数有两个参数 - `resolve` 和 `reject`。 通过它们来判断 promise 的执行结果。 用法如下：

```js
const myPromise = new Promise((resolve, reject) => {

});
```

------

创建一个名为 `makeServerRequest` 的 promise。 给构造器函数传入 `resolve` 和 `reject` 两个参数。

```js
const makeServerRequest = new Promise((resolve, reject) => {});
```

### 通过 resolve 和 reject 完成 Promise

Promise 有三个状态：`pending`、`fulfilled` 和 `rejected`。 上一个挑战里创建的 promise 一直阻塞在 `pending` 状态里，因为没有调用 promise 的完成方法。 Promise 提供的 `resolve` 和 `reject` 参数就是用来结束 promise 的。 Promise 成功时调用 `resolve`，promise 执行失败时调用 `reject`， 如下文所述，这些方法需要有一个参数。

> pending: 待决的，即将发生的
>
> fulfilled: 实现，满足，符合，执行
>
> rejected: 驳回，拒绝

```js
const myPromise = new Promise((resolve, reject) => {
  if(condition here) {
    resolve("Promise was fulfilled");
  } else {
    reject("Promise was rejected");
  }
});
```

上面的示例使用字符串作为这些函数的参数，但参数实际上可以是任何格式。 通常，它可能是一个包含数据的对象，你可以将它放在网站或其他地方。

------

使 promise 可以处理成功和失败情况。 如果 `responseFromServer` 是 `true`，调用 `resolve` 方法使 promise 成功。 给 `resolve` 传递值为 `We got the data` 的字符串。 如果 `responseFromServer` 是 `false`， 使用 `reject` 方法并传入值为 `Data not received` 的字符串。

```js
const makeServerRequest = new Promise((resolve, reject) => {
  // responseFromServer 表示从服务器获得一个响应
  let responseFromServer;

  if(responseFromServer) {
    // 修改这一行
    resolve("We got the data");
  } else {  
    // 修改这一行
    reject("Data not received");
  }
});
```

### 用 then 处理 Promise 完成的情况

当程序需要花费未知的时间才能完成时（比如一些异步操作），一般是服务器请求，promise 很有用。 服务器请求会花费一些时间，当结束时，需要根据服务器的响应执行一些操作。 这可以用 `then` 方法来实现， 当 promise 完成 `resolve` 时会触发 `then` 方法。 例子如下：

```js
myPromise.then(result => {

});
```

`result` 即传入 `resolve` 方法的参数。

------

给 promise 添加 `then` 方法。 用 `result` 做为回调函数的参数并将 `result` 打印在控制台。

```js
const makeServerRequest = new Promise((resolve, reject) => {
  // responseFromServer 设置为 true，表示从服务器获得有效响应
  let responseFromServer = true;

  if(responseFromServer) {
    resolve("We got the data");
  } else {  
    reject("Data not received");
  }
});

makeServerRequest.then(result => {
  console.log(result);
})
```

### 使用 catch 处理 Promise 失败的情况

当 promise 失败时会调用 `catch` 方法。 当 promise 的 `reject` 方法执行时会直接调用。 用法如下：

```js
myPromise.catch(error => {

});
```

`error` 是传入 `reject` 方法的参数。

------

给 promise 添加 `catch` 方法。 用 `error` 作为回调函数的参数，并把 `error` 打印到控制台。

```js
const makeServerRequest = new Promise((resolve, reject) => {
  // responseFromServer 设置为 false，表示从服务器获得无效响应
  let responseFromServer = false;

  if(responseFromServer) {
    resolve("We got the data");
  } else {  
    reject("Data not received");
  }
});

makeServerRequest.then(result => {
  console.log(result);
});

makeServerRequest.catch(error => {
  console.log(error);
})
```

