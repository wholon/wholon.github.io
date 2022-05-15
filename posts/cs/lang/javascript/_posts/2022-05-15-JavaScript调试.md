# JavaScript调试

调试是检查代码、发现并修复问题的过程。

代码中的问题通常有三种形式：1）语法错误导致程序停止运行， 2）代码无法执行或具有意外行为导致运行时错误，3）代码有语义（逻辑）错误，没有实现原来的意图。

在本文中，你将学习如何使用 JavaScript 控制台来调试程序，防止出现常见问题。

<!--more-->

## 使用控制台检查变量值

Chrome 和 Firefox 都有出色的 JavaScript 控制台（也称为 DevTools），可以用来调试 JavaScript 代码

可以在 Chrome 的菜单中找到“开发者工具”或 FireFox 的菜单中的 “Web 控制台”。 如果你使用其他浏览器或手机，我们强烈建议你切换到桌面版 Firefox 或 Chrome。

`console.log()` 方法可能是最有用的调试工具，它可以将括号中的内容输出到控制台。 将它放在代码中的关键点可以显示变量在当时的值。 在查看输出之前，最好先想清楚输出应该是什么。 在整个代码中使用检查点来查看计算状态将有助于缩小问题的范围。

下面是输出 `Hello world!` 字符串到控制台的示例：

```js
console.log('Hello world!');
```

> 有许多方法可以与 `console` 一起使用来输出消息。 `log`、`warn` 和 `clear` 就是几个例子。
>
> 使用 `console.clear` 清除浏览器控制台。

------

使用 `console.log()` 方法打印代码中记录的变量 `a` 的值。

```js
let a = 5;
let b = 1;
a++;
// 只修改这一行下面的代码
console.log(a);

let sumAB = a + b;
console.log(sumAB);
```

## 使用 type of 检查变量的类型

可以使用 `typeof` 检查变量的数据结构或类型。 在处理多种数据类型时，这会对调试很有帮助。 如果想计算两数之和，但实际传入了一个字符串参数，则结果可能是错误的。 类型错误可能隐藏在计算或函数调用中。 当你以 JavaScript 对象（JSON）的形式访问和使用外部数据时尤其要小心。

下面是使用 `typeof` 的一些示例：

```js
console.log(typeof "");
console.log(typeof 0);
console.log(typeof []);
console.log(typeof {});
```

控制台将按顺序显示字符串 `string`、`number`、`object` 和 `object`。

JavaScript 有七种原始（不可变）数据类型： `Boolean`，`Null`，`Undefined`，`Number`，`String`，`Symbol` （new with ES6），`BigInt` （new with ES2020）和一种可变数据类型：`Object`。 注意：在 JavaScript 中，数组在本质上是一种对象。

------

添加两个 `console.log()` 语句来检查代码中的两个变量 `seven` 和 `three` 的 `typeof` 值。

```js
let seven = 7;
let three = "3";
console.log(seven + three);
// 只修改这一行下面的代码
console.log(typeof seven);
console.log(typeof three);
```

## 捕获拼错的变量名和函数名

`console.log()` 和 `typeof` 方法是检查中间值和程序输出类型的两种主要方法。 现在是时候了解一下 bug 出现的常见的情形。 一个语法级别的问题是打字太快带来的低级拼写错误。

变量或函数名的错写、漏写或大小写弄混都会让浏览器尝试查找并不存在的东西，并报出“引用错误”。 JavaScript 变量和函数名称区分大小写。

------

修复代码中的两个拼写错误，以便 `netWorkingCapital` 计算有效。

```js
let receivables = 10;
let payables = 8;
let netWorkingCapital = recievables - payable;
// let netWorkingCapital = receivables - payables;
console.log(`Net working capital is: ${netWorkingCapital}`);
```

## 捕获未闭合的括号、方括号、大括号和引号

要注意的另一个语法错误是所有的小括号、方括号、花括号和引号都必须配对。 当你编辑代码并插入新代码其中带有括号时，很容易忘记括号闭合。 此外，在将代码块嵌套到其他代码块时要小心，例如将回调函数作为参数添加到方法中。

避免这种错误的一种方法是，一次性输入完这些符号，然后将光标移回它们之间继续编写。 好在现在大部分编辑器都会帮你自动补全。

------

修复代码中的两个符号配对错误。

```js
let myArray = [1, 2, 3;
let arraySum = myArray.reduce((previous, current =>  previous + current);
// let myArray = [1, 2, 3];
// let arraySum = myArray.reduce((previous, current) =>  previous + current);
console.log(`Sum of array values is: ${arraySum}`);
```

## 捕捉单引号和双引号的混合用法

JavaScript 允许使用单引号（`'`）和双引号（`"`）声明字符串。 决定使用哪一个通常看个人偏好，但有一些例外。

如果字符串中有缩写或存在一段带引号的文本，你就会明白为什么 JavaScript 允许两种引号了。 请注意，不要提前用引号结束字符串，这会导致语法错误。

下面是混合使用引号的一些示例：

```js
const grouchoContraction = "I've had a perfectly wonderful evening, but this wasn't it.";
const quoteInString = "Groucho Marx once said 'Quote me as saying I was mis-quoted.'";
const uhOhGroucho = 'I've had a perfectly wonderful evening, but this wasn't it.';
```

前两项是正确的，但第三项是不正确的。

当然，只使用一种引号也是可以的。 可以使用反斜杠（`\`）来转义字符串内的引号：

```js
const allSameQuotes = 'I\'ve had a perfectly wonderful evening, but this wasn\'t it.';
```

------

修复字符串，使其对 `href` 值使用不同的引号，或者转义现有的引号。 在整个字符串周围保留双引号。

```js
let innerHtml = "<p>Click here to <a href="#Home">return home</a></p>";
// let innerHtml = "<p>Click here to <a href='#Home'>return home</a></p>";
console.log(innerHtml);
```

## 捕获使用赋值运算符而不是相等运算符

分支程序，即在满足某些条件时执行不同操作的程序，依赖于 JavaScript 中的`if`，`else if`、`else`语句。 条件有时采取测试一个结果是否等于一个值的形式。

这种逻辑可以表述为“如果 x 等于 y ，则......”，听起来像是可以使用 `=`（即赋值运算符）。 然而，这会导致程序中流程出问题。

如前面的挑战所述，JavaScript 中的赋值运算符 (`=`) 是用来为变量名赋值的。 并且 `==` 和 `===` 运算符检查相等性（三等号 `===` 是用来测试是否严格相等的，严格相等的意思是值和类型都必须相同）。

下面的代码将 `x` 赋值为 2，表达式会在执行后得到 `true`。 JavaScript 会把大部分的值都视为 `true`，除了所谓的 “falsy”值，即：`false`、`0`、`""`（空字符串）、`NaN`、`undefined` 和 `null`。

```js
let x = 1;
let y = 2;
if (x = y) {

} else {

}
```

在这个示例中，除非 `y` 值是假值，否则当 `y` 为任何值时，`if` 语句中的代码块都会运行。 我们期望运行的 `else` 代码块实际上将不会运行。

------

修复条件语句，以便程序运行正确的分支，并给 `result` 赋正确的值。

```js
let x = 7;
let y = 9;
let result = "to come";

if(x = y) {
  result = "Equal!";
} else {
  result = "Not equal!";
}

// if(x = y) {
//   result = "Equal!";
// } else {
//   result = "Not equal!";
// }

console.log(result);
```

## 捕捉函数调用后缺少的左括号和右括号

当函数或方法不接受任何参数时，你可能忘记在调用它时加上空的左括号和右括号。 通常，函数调用的结果会保存在变量中，供其他代码使用。 可以通过将变量值（或其类型）打印到控制台，查看输出究竟是一个函数引用还是函数调用的返回值来检测这类错误。

下面示例中的两个变量是不同的:

```js
function myFunction() {
  return "You rock!";
}
let varOne = myFunction;
let varTwo = myFunction();
```

这里 `varOne` 是函数 `myFunction` ，`varTwo` 是字符串 `You rock!`

------

修复代码，将变量 `result` 设置为调用函数 `getNine` 返回的值。

```js
function getNine() {
  let x = 6;
  let y = 3;
  return x + y;
}

let result = getNine;
// let result = getNine();
console.log(result);
```

## 调用函数时，捕获以错误顺序传递的参数

继续讨论调用函数，需要注意的下一个 bug 是函数的参数传递顺序错误。 如果参数分别是不同的类型，例如接受数组和整数两个参数的函数，参数顺序传错就可能会引发运行时错误。 对于接受相同类型参数的函数，传错参数也会导致逻辑错误或运行结果错误。 确保以正确的顺序提供所有必需的参数以避免这些问题。

------

函数 `raiseToPower` 返回基数 (base) 的指数 (exponent) 次幂。 不幸的是，它没有被正确调用 — 修改代码，使 `power` 的值为 8。

```js
function raiseToPower(b, e) {
  return Math.pow(b, e);
}

let base = 2;
let exp = 3;
let power = raiseToPower(exp, base);
// let power = raiseToPower(base, exp);
console.log(power);
```

## 捕获使用索引的时候出现的错误

当试图访问字符串或数组的特定索引（分割或访问一个片段）或循环索引时，有时会出现 Off by one errors 错误（有时称为 OBOE）。 JavaScript 索引从 0 开始，而不是 1，这意味着最后一个索引总会比字符串或数组的长度少 1。 如果尝试访问等于长度的索引，程序可能会抛出“索引超出范围”引用错误或打印出 `undefined`。

当使用将索引范围作为参数的字符串或数组方法时，阅读相关的文档并了解参数中的索引的包含性（即是否考虑进返回值中）很重要。 以下是一些错误的示例：

```js
let alphabet = "abcdefghijklmnopqrstuvwxyz";
let len = alphabet.length;
for (let i = 0; i <= len; i++) {
  console.log(alphabet[i]);
}
for (let j = 1; j < len; j++) {
  console.log(alphabet[j]);
}
for (let k = 0; k < len; k++) {
  console.log(alphabet[k]);
}
```

第一个例子多了一次循环，第二个例子少了一次循环（漏掉了索引 0 处的字符）， 第三个例子是正确的。

------

修复以下函数中的两个索引错误，将 1 到 5 之间（包含 1 和 5）的所有数字打印到控制台。

```js
function countToFive() {
  let firstFive = "12345";
  let len = firstFive.length;
  // 只修改这一行下面的代码
  for (let i = 1; i <= len; i++) {
  //   for (let i = 0; i < len; i++) {
  // 只修改这一行上面的代码
    console.log(firstFive[i]);
  }
}

countToFive();
```

## 重新初始化循环中的变量时要小心

有时需要在循环中保存信息以增加计数器或重置变量。 一个潜在的问题是变量什么时候该重新初始化，什么时候不该重新初始化，反之亦然。 如果你不小心重置了用于终止条件的变量，导致无限循环，这将特别危险。

使用`console.log()`在每个循环中打印变量值可以发现与重置相关的错误或者重置变量失败。

------

以下函数应该创建一个具有`m`行和`n`列“零”的二维数组。 不幸的是，它没有产生预期的输出，因为`row`变量没有在外部循环中重新初始化（设置回空数组）。 修改代码，使其正确地返回包含 3 行 2 列“零”的二维数组，即`[[0, 0], [0, 0], [0, 0]]`。

```js
function zeroArray(m, n) {
  // 创建一个二维数组，有 m 行 n 列，元素均为 0
  let newArray = [];
  let row = [];
  for (let i = 0; i < m; i++) {
    // 添加第 m 行到 newArray
	row = [];
    for (let j = 0; j < n; j++) {
      // 将 n 个 0 推入当前行以创建列
      row.push(0);
    }
    // 将当前行（已有 n 个 0）推送到数组
    newArray.push(row);
  }
  return newArray;
}

let matrix = zeroArray(3, 2);
console.log(matrix);

```

## 使用有效的终止条件防止无限循环

最后一个话题是可怕的无限循环。 当需要程序运行代码块一定次数或满足条件时，循环是很好的工具，但是它们需要终止条件来结束循环。 无限循环可能会使浏览器冻结或崩溃，并导致程序执行混乱，没有人想要这样的结果。

在本节的介绍中有一个无限循环的例子——它没有终止条件来摆脱`loopy()`内的`while`循环。 不要调用这个函数！

```js
function loopy() {
  while(true) {
    console.log("Hello, world!");
  }
}
```

程序员的工作是确保最终达到终止条件，该条件告诉程序何时跳出循环。 有一种错误是从终端条件向错误方向递增或递减计数器变量。 另一种是在循环代码中意外重置计数器或索引变量，而不是递增或递减它。

------

`myFunc()`函数包含一个无限循环，因为终止条件`i != 4`永远不会为`false`(并中断循环) -`i`将每次递增 2，然后跳过 4，因为`i`是从奇数开始递增。 在终端条件中输入比较运算符，使循环仅在`i`小于或等于 4 的情况下运行。

```js
function myFunc() {
  for (let i = 1; i != 4; i += 2) {
// for (let i = 1; i <= 4; i += 2) {
    console.log("Still going!");
  }
}
```

