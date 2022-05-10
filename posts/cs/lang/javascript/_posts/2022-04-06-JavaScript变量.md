# JavaScript 变量

变量可以看成语言中用来标记和存储数据的一种记号。

## JavaScript 中的变量

不同于 C 或 Java，JavaScript 是一种动态类型的语言，即申明的时候不指定变量的数据类型，而在运行的时候根据变量的具体值动态的判断变量的数据类型。 JavaScript 的变量名以字母或者`$`或者`_`开头；变量名只能含有字母、数字、下划线和美元符号；大小写敏感；不能使用保留的关键字，如 html、var、function 等，这一条一定要记住，使用关键字造成的错误往往很难排除。

## JavaScript 中的变量的申明、初始化和赋值

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

## 理解未初始化的变量

当 JavaScript 中的变量被声明的时候，程序内部会给它一个初始值 `undefined`。 当你对一个值为 `undefined` 的变量进行运算操作的时候，算出来的结果将会是 `NaN`，它的意思是 "Not a Number"。 如果你用 `undefined` 变量连接一个字符串，你将得到一个 `undefined` 的 字符串。

## 了解变量名区分大小写

在 JavaScript 中所有的变量和函数名都是大小写敏感的。 要区别对待大写字母和小写字母。

`MYVAR` 与 `MyVar` 和 `myvar` 是不同的变量。 这有可能导致出现多个相似名字的变量。 所以强烈地建议你，为了保持代码清晰*不要*使用这一特性。

**最佳实践**

使用驼峰命名法（camelCase）来书写一个 Javascript 变量。 在驼峰命名法（camelCase）中，变量名的第一个单词的首写字母小写，后面的单词的第一个字母大写

**示例：**

```js
var someVariable;
var anotherVariableName;
var thisVariableNameIsSoLong;
```

## JavaScript 中的变量的作用域

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

----

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

## 探索 var 和 let 关键字之间的差异

使用 `var` 关键字声明变量的最大问题之一是你可以轻松覆盖变量声明：

```js
var camper = "James";
var camper = "David";
console.log(camper);
```

在上面的代码中，`camper` 变量最初声明为 `James`，然后被覆盖为 `David`。 然后控制台显示字符串 `David`。

在小型应用程序中，你可能不会遇到此类问题。 但是随着你的代码库变大，你可能会意外地覆盖一个你不打算覆盖的变量。 由于此行为不会引发错误，因此搜索和修复错误变得更加困难。

ES6 中引入了一个名为 `let` 的关键字，这是对 JavaScript 的一次重大更新，以解决与 `var` 关键字有关的潜在问题。 你将在后面的挑战中了解其他 ES6 特性。

如果将上面代码中的 `var` 替换为 `let` ，则会导致错误：

```js
let camper = "James";
let camper = "David";
```

该错误可以在你的浏览器控制台中看到。

所以不像 `var`，当你使用 `let` 时，同名的变量只能声明一次。

> 在 JavaScript 中，作用域涉及到变量的作用范围。 在函数外定义的变量具有 全局 作用域。 这意味着，具有全局作用域的变量可以在代码的任何地方被调用。
>
> 未使用 `let` 或 `const` 关键字声明的变量会在 `global` 范围内自动创建。 当在代码其他地方无意间定义了一个变量，刚好变量名与全局变量相同，这时会产生意想不到的后果。**你应该总是用 `let` 或 `const` 声明你的变量。**

----

* 使用 `let` 或 `const`，在任何函数之外声明一个名为 `myGlobal` 的全局变量。 并给它一个初始值 `10`。

* 在函数 `fun1` 中，***不要*** 使用 `let` 或 `const` 关键字，将 `5` 分配给 `oopsGlobal` 。

```js
// 在这行下面声明 myGlobal 变量
let myGlobal = 10;

function fun1() {
  // 给 oopsGlobal 赋值 5
  oopsGlobal = 5;
}

// 只修改这一行上面的代码

function fun2() {
  var output = "";
  if (typeof myGlobal != "undefined") {
    output += "myGlobal: " + myGlobal;
  }
  if (typeof oopsGlobal != "undefined") {
    output += " oopsGlobal: " + oopsGlobal;
  }
  console.log(output);
}

// 打印输出
myGlobal: 10 oopsGlobal: 5
myGlobal: 10 oopsGlobal: 5
```

## 使用 const 关键字声明只读变量

关键字 `let` 并不是声明变量的唯一新方法。 在 ES6 中，你还可以使用 `const` 关键字声明变量。

`const` 具有 `let` 的所有出色功能，另外还有一个额外的好处，即使用 `const` 声明的变量是只读的。 它们是一个常量值，这意味着一旦一个变量被赋值为 `const`，它就不能被重新赋值：

```js
const FAV_PET = "Cats";
FAV_PET = "Dogs";
```

由于重新分配 `FAV_PET` 的值，控制台将显示错误。

你应该始终使用 `const` 关键字命名不想重新分配的变量。 这有助于避免给一个常量进行额外的再次赋值。

**注意：** 通常，开发者会用大写字母作为常量标识符，用小写字母或者驼峰命名作为变量（对象或数组）标识符。 

------

更改代码，以便使用 `let` 或 `const` 声明所有变量。 当你想要改变变量时使用 `let`，当你想要变量保持不变时使用 `const`。 此外，重命名使用 `const` 声明的变量以符合惯例。

```js
const FCC = "freeCodeCamp"; // 修改这一行
let fact = "is cool!"; // 修改这一行
fact = "is awesome!";
console.log(FCC, fact); // 修改这一行
```