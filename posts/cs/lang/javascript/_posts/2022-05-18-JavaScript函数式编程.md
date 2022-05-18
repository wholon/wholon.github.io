# JavaScript函数式编程

函数式编程是另一种软件开发方法。在函数式编程中，代码被组织成较小的基本的函数，可以结合起来构建复杂的程序。

在本文中，你将学习函数式编程的核心概念，包括纯函数、如何避免突变、如何使用 `.map()` 和 `.filter()` 等方法编写更整洁的代码。

<!--more-->

## 学习函数式编程

函数式编程是一种方案简单、功能独立、对作用域外没有任何副作用的编程范式：`INPUT -> PROCESS -> OUTPUT`。

函数式编程：

1）功能独立——不依赖于程序的状态（比如可能发生变化的全局变量）；

2）纯函数——同一个输入永远能得到同一个输出；

3）有限的副作用——可以严格地限制函数外部对状态的更改。

------

中国人爱喝茶。

在代码编辑器中，已经为你定义好了`prepareTea`和`getTea`函数。 调用 `getTea` 函数为团队准备 40 杯茶，并将它们存储在 `tea4TeamFCC` 变量里。

```js
// 函数返回表示“一杯绿茶（green tea）”的字符串
const prepareTea = () => 'greenTea';

/*
有一个函数（代表茶的种类）和需要几杯茶，下面的函数返回一个数组，包含字符串（每个字符串表示一杯特别种类的茶）。
*/
const getTea = (numOfCups) => {
  const teaCups = [];

  for(let cups = 1; cups <= numOfCups; cups += 1) {
    const teaCup = prepareTea();
    teaCups.push(teaCup);
  }
  return teaCups;
};

// 只修改这一行下面的代码
const tea4TeamFCC = getTea(40);
// 只修改这一行上面的代码
```

## 了解函数式编程术语

FCC 团队需求有变更，现在想要两种茶：绿茶（green tea）和红茶（black tea）。 事实证明，用户需求变更是很常见的。

基于以上信息，我们需要重构上一节挑战中的 `getTea` 函数来处理多种茶的请求。 我们可以修改 `getTea` 接受一个函数作为参数，使它能够修改茶的类型。 这让 `getTea` 更灵活，也使需求变更时为程序员提供更多控制权。

首先，我们将介绍一些术语：

Callbacks 是被传递到另一个函数中调用的函数。 你应该已经在其他函数中看过这个写法，例如在 `filter` 中，回调函数告诉 JavaScript 以什么规则过滤数组。

函数就像其他正常值一样，可以赋值给变量、传递给另一个函数，或从其它函数返回，这种函数叫做头等 first class 函数。 在 JavaScript 中，所有函数都是头等函数。

将函数作为参数或返回值的函数叫做高阶 ( higher order) 函数。

当函数被传递给另一个函数或从另一个函数返回时，那些传入或返回的函数可以叫做 lambda。

------

准备 27 杯绿茶和 13 杯红茶，分别存入 `tea4GreenTeamFCC` 和 `tea4BlackTeamFCC` 变量。 请注意，`getTea` 函数已经变了，现在它接收一个函数作为第一个参数。

注意：数据（茶的数量）作为最后一个参数。 我们将在后面的课程中对此进行更多讨论。

```js
// 函数返回表示“一杯绿茶（green tea）”的字符串
const prepareGreenTea = () => 'greenTea';

// 函数返回表示“一杯红茶（black tea）”的字符串
const prepareBlackTea = () => 'blackTea';

/*
有一个函数（代表茶的种类）和需要几杯茶，下面的函数返回一个数组，包含字符串（每个字符串表示一杯特别种类的茶）。
*/
const getTea = (prepareTea, numOfCups) => {
  const teaCups = [];

  for(let cups = 1; cups <= numOfCups; cups += 1) {
    const teaCup = prepareTea();
    teaCups.push(teaCup);
  }
  return teaCups;
};

// 只修改这一行下面的代码
const tea4GreenTeamFCC = getTea(prepareGreenTea, 27);
const tea4BlackTeamFCC = getTea(prepareBlackTea, 13);
// 只修改这一行上面的代码

console.log(
  tea4GreenTeamFCC,
  tea4BlackTeamFCC
);
```

## 了解使用命令式编程的危害

使用函数式编程是一个好的习惯。 它使你的代码易于管理，避免潜在的 bug。 但在开始之前，先看看命令式编程方法，以强调你可能有什么问题。

在英语 (以及许多其他语言) 中，命令式时态用来发出指令。 同样，命令式编程是向计算机提供一套执行任务的声明。

命令式编程常常改变程序状态，例如更新全局变量。 一个典型的例子是编写 `for` 循环，它为一个数组的索引提供了准确的迭代方向。

相反，函数式编程是声明式编程的一种形式。 通过调用方法或函数来告诉计算机要做什么。

JavaScript 提供了许多处理常见任务的方法，所以你无需写出计算机应如何执行它们。 例如，你可以用 `map` 函数替代上面提到的 `for` 循环来处理数组迭代。 这有助于避免语义错误，如调试章节介绍的 "[Off By One Errors]({% post_url 2022-05-15-JavaScript调试 %}#捕获使用索引的时候出现的错误)"。

考虑这样的场景：你正在浏览器中浏览网页，并想操作你打开的标签。 下面我们来试试用面向对象的思路来描述这种情景。

窗口对象由选项卡组成，通常会打开多个窗口。 窗口对象中每个打开网站的标题都保存在一个数组中。 在对浏览器进行了如打开新标签、合并窗口、关闭标签之类的操作后，你需要输出所有打开的标签。 关掉的标签将从数组中删除，新打开的标签（为简单起见）则添加到数组的末尾。

代码编辑器中显示了此功能的实现，其中包含 `tabOpen()`，`tabClose()`，和 `join()` 函数。 `tabs` 数组是窗口对象的一部分用于储存打开页面的名称。

------

在编辑器中运行代码。 它使用了有副作用的方法，导致输出错误。 存储在 `finalTabs.tabs` 中的打开标签的最终列表应该是 `['FB', 'Gitter', 'Reddit', 'Twitter', 'Medium', 'new tab', 'Netflix', 'YouTube', 'Vine', 'GMail', 'Work mail', 'Docs', 'freeCodeCamp', 'new tab']`，但输出会略有不同。

修改 `Window.prototype.tabClose` 使其删除正确的标签。

```js
// tabs 是在窗口中打开的每个站点的 title 的数组
const Window = function(tabs) {
  this.tabs = tabs; // 我们记录对象内部的数组
};

// 当你将两个窗口合并为一个窗口时
Window.prototype.join = function(otherWindow) {
  this.tabs = this.tabs.concat(otherWindow.tabs);
  return this;
};

// 当你在最后打开一个选项卡时
Window.prototype.tabOpen = function(tab) {
  this.tabs.push('new tab'); // 我们现在打开一个新的选项卡
  return this;
};

// 当你关闭一个选项卡时
Window.prototype.tabClose = function(index) {

  // 只修改这一行下面的代码
  // 将splice修改为slice();
  const tabsBeforeIndex = this.tabs.slice(0, index); // 点击之前获取 tabs
  const tabsAfterIndex = this.tabs.slice(index + 1); // 点击之后获取 tabs

  this.tabs = tabsBeforeIndex.concat(tabsAfterIndex); // 将它们合并起来

  // 只修改这一行上面的代码

  return this;
 };

// 我们创建三个浏览器窗口
const workWindow = new Window(['GMail', 'Inbox', 'Work mail', 'Docs', 'freeCodeCamp']); // 你的邮箱、Google Drive 和其他工作地点
const socialWindow = new Window(['FB', 'Gitter', 'Reddit', 'Twitter', 'Medium']); // 社交网站
const videoWindow = new Window(['Netflix', 'YouTube', 'Vimeo', 'Vine']); // 娱乐网站

// 现在执行打开选项卡，关闭选项卡和其他操作
const finalTabs = socialWindow
  .tabOpen() // 打开一个新的选项卡，显示猫的图片
  .join(videoWindow.tabClose(2)) // 关闭视频窗口的第三个选项卡，并合并
  .join(workWindow.tabClose(1).tabOpen());
console.log(finalTabs.tabs);
```

## 使用函数式编程避免变化和副作用

如果你还没想通，上一个挑战的问题出在 `tabClose()` 函数里的 `splice`。 不幸的是，`splice` 修改了调用它的原始数组，所以第二次调用它时是基于修改后的数组，才给出了意料之外的结果。

这是一个小例子，还有更广义的定义——在变量，数组或对象上调用一个函数，这个函数会改变对象中的变量或其他东西。

函数式编程的核心原则之一是不改变任何东西。 变化会导致错误。 如果一个函数不改变传入的参数、全局变量等数据，那么它造成问题的可能性就会小很多。

前面的例子没有任何复杂的操作，但是 `splice` 方法改变了原始数组，导致 bug 产生。

回想一下，在函数式编程中，改变或变更叫做 mutation，这种改变的结果叫做“副作用”（side effect）。 理想情况下，函数应该是不会产生任何副作用的 pure function。

让我们尝试掌握这个原则：不要改变代码中的任何变量或对象。

------

填写 `incrementer` 函数的代码，使其返回值为全局变量 `fixedValue`增加 1 。

```js
// 全局变量
let fixedValue = 4;

function incrementer() {
  // 只修改这一行下面的代码
  return fixedValue + 1;

  // 只修改这一行上面的代码
}
```

## 传递参数以避免函数中的外部依赖

上一个挑战是更接近函数式编程原则的挑战，但是仍然缺少一些东西。

虽然我们没有改变全局变量值，但在没有全局变量 `fixedValue` 的情况下，`incrementer` 函数将不起作用。

函数式编程的另一个原则是：总是显式声明依赖关系。 如果函数依赖于一个变量或对象，那么将该变量或对象作为参数直接传递到函数中。

这样做会有很多好处。 其中一点是让函数更容易测试，因为你确切地知道参数是什么，并且这个参数也不依赖于程序中的任何其他内容。

其次，这样做可以让你更加自信地更改，删除或添加新代码。 因为你很清楚哪些是可以改的，哪些是不可以改的，这样你就知道哪里可能会有潜在的陷阱。

最后，无论代码的哪一部分执行它，函数总是会为同一组输入生成相同的输出。

------

更新 `incrementer` 函数，明确声明其依赖项。

编写 `incrementer` 函数，获取它的参数，然后将值增加 1。

```js
// 全局变量
let fixedValue = 4;

// 只修改这一行下面的代码
function incrementer(value) {

  return value + 1;
  // 只修改这一行上面的代码
}
```

## 在函数中重构全局变量

目前为止，我们已经看到了函数式编程的两个原则：

1. 不要更改变量或对象 - 创建新变量和对象，并在需要时从函数返回它们。 提示：使用类似 `const newArr = arrVar` 的东西，其中 `arrVar` 是一个数组，只会创建对现有变量的引用，而不是副本。 所以更改 `newArr` 中的值会同时更改 `arrVar` 中的值。
2. 声明函数参数 - 函数内的任何计算仅取决于参数，而不取决于任何全局对象或变量。

给数字增加 1 不够刺激，我们可以在处理数组或更复杂的对象时应用这些原则。

------

重构代码，使全局数组 `bookList` 在函数内部不会被改变。 `add` 函数可以将指定的 `bookName` 增加到数组末尾并返回一个新的数组（列表）。 `remove` 函数可以从数组中移除指定 `bookName`。

**注意：** 两个函数都应该返回一个数组，任何新参数都应该在 `bookName`参数之前添加。

```js
// 全局变量
const bookList = ["The Hound of the Baskervilles", "On The Electrodynamics of Moving Bodies", "Philosophiæ Naturalis Principia Mathematica", "Disquisitiones Arithmeticae"];

// 修改这行下面的代码
function add(bookList, bookName) {
  let result = [...bookList];
  result.push(bookName);
  return result;

  // 修改这行上面的代码
}

// 修改这行下面的代码
function remove(bookList, bookName) {
  let result = [...bookList];
  const book_index = result.indexOf(bookName);
  if (book_index >= 0) {

    result.splice(book_index, 1);
    return result;

    // 修改这行上面的代码
    }
}

// 以下是修改前
// 修改这行下面的代码
function add(bookName) {

  bookList.push(bookName);
  return bookList;

  // 修改这行上面的代码
}

// 修改这行下面的代码
function remove(bookName) {
  const book_index = bookList.indexOf(bookName);
  if (book_index >= 0) {

    bookList.splice(book_index, 1);
    return bookList;

    // 修改这行上面的代码
    }
}
```

## 使用 map 方法从数组中提取数据

目前为止，我们已经学会了使用纯函数来避免程序中的副作用。 此外，我们已经看到函数的值仅取决于其输入参数。

这仅仅是个开始。 顾名思义，函数式编程以函数理论为中心。

能够将它们作为参数传递给其他函数，从另一个函数返回一个函数是有意义的。 函数在 JavaScript 中被视为 First Class Objects，它们可以像任何其他对象一样使用。 它们可以保存在变量中，存储在对象中，也可以作为函数参数传递。

让我们从一些简单的数组函数开始，这些函数是数组对象原型上的方法。 在本练习中，我们来了解下数组的 `map` 方法（即 `Array.prototype.map()`）。

请记住，`map`方法是迭代数组中每一项的方式之一。 在对每个元素应用回调函数后，它会创建一个新数组(不改变原来的数组)。 它这样做时没有改变原始数组。

当调用回调函数时，传入了三个参数。 第一个参数是当前正在处理的数组项。 第二个参数是当前数组项的索引值，第三个参数是在其上调用 `map` 方法的数组。

看下在 `users` 上使用 `map` 方法的例子，返回了一个新数组只包含了用户的名字。 为了简化，例子里只使用了回调函数的第一个参数。

```js
const users = [
  { name: 'John', age: 34 },
  { name: 'Amy', age: 20 },
  { name: 'camperCat', age: 10 }
];

const names = users.map(user => user.name);
console.log(names);
```

控制台将显示值 `[ 'John', 'Amy', 'camperCat' ]`。

------

`watchList` 数组保存了包含一些电影信息的对象。 在 `watchList` 上使用 `map`，将一个新的对象数组赋值给 `ratings` 变量。 新数组中的每个电影都只能有一个值为电影名称的 `title` 键，和一个值为 IMDB 评级的 `rating` 键。 目前编辑器中的代码是使用 `for` 循环实现，你应该使用 `map` 表达式替换循环功能。

```js
// 全局变量
const watchList = [
  {
    "Title": "Inception",
    "Year": "2010",
    "Rated": "PG-13",
    "Released": "16 Jul 2010",
    "Runtime": "148 min",
    "Genre": "Action, Adventure, Crime",
    "Director": "Christopher Nolan",
    "Writer": "Christopher Nolan",
    "Actors": "Leonardo DiCaprio, Joseph Gordon-Levitt, Elliot Page, Tom Hardy",
    "Plot": "A thief, who steals corporate secrets through use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO.",
    "Language": "English, Japanese, French",
    "Country": "USA, UK",
    "Awards": "Won 4 Oscars. Another 143 wins & 198 nominations.",
    "Poster": "http://ia.media-imdb.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg",
    "Metascore": "74",
    "imdbRating": "8.8",
    "imdbVotes": "1,446,708",
    "imdbID": "tt1375666",
    "Type": "movie",
    "Response": "True"
  },
  {
    "Title": "Interstellar",
    "Year": "2014",
    "Rated": "PG-13",
    "Released": "07 Nov 2014",
    "Runtime": "169 min",
    "Genre": "Adventure, Drama, Sci-Fi",
    "Director": "Christopher Nolan",
    "Writer": "Jonathan Nolan, Christopher Nolan",
    "Actors": "Ellen Burstyn, Matthew McConaughey, Mackenzie Foy, John Lithgow",
    "Plot": "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
    "Language": "English",
    "Country": "USA, UK",
    "Awards": "Won 1 Oscar. Another 39 wins & 132 nominations.",
    "Poster": "http://ia.media-imdb.com/images/M/MV5BMjIxNTU4MzY4MF5BMl5BanBnXkFtZTgwMzM4ODI3MjE@._V1_SX300.jpg",
    "Metascore": "74",
    "imdbRating": "8.6",
    "imdbVotes": "910,366",
    "imdbID": "tt0816692",
    "Type": "movie",
    "Response": "True"
  },
  {
    "Title": "The Dark Knight",
    "Year": "2008",
    "Rated": "PG-13",
    "Released": "18 Jul 2008",
    "Runtime": "152 min",
    "Genre": "Action, Adventure, Crime",
    "Director": "Christopher Nolan",
    "Writer": "Jonathan Nolan (screenplay), Christopher Nolan (screenplay), Christopher Nolan (story), David S. Goyer (story), Bob Kane (characters)",
    "Actors": "Christian Bale, Heath Ledger, Aaron Eckhart, Michael Caine",
    "Plot": "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, the caped crusader must come to terms with one of the greatest psychological tests of his ability to fight injustice.",
    "Language": "English, Mandarin",
    "Country": "USA, UK",
    "Awards": "Won 2 Oscars. Another 146 wins & 142 nominations.",
    "Poster": "http://ia.media-imdb.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_SX300.jpg",
    "Metascore": "82",
    "imdbRating": "9.0",
    "imdbVotes": "1,652,832",
    "imdbID": "tt0468569",
    "Type": "movie",
    "Response": "True"
  },
  {
    "Title": "Batman Begins",
    "Year": "2005",
    "Rated": "PG-13",
    "Released": "15 Jun 2005",
    "Runtime": "140 min",
    "Genre": "Action, Adventure",
    "Director": "Christopher Nolan",
    "Writer": "Bob Kane (characters), David S. Goyer (story), Christopher Nolan (screenplay), David S. Goyer (screenplay)",
    "Actors": "Christian Bale, Michael Caine, Liam Neeson, Katie Holmes",
    "Plot": "After training with his mentor, Batman begins his fight to free crime-ridden Gotham City from the corruption that Scarecrow and the League of Shadows have cast upon it.",
    "Language": "English, Urdu, Mandarin",
    "Country": "USA, UK",
    "Awards": "Nominated for 1 Oscar. Another 15 wins & 66 nominations.",
    "Poster": "http://ia.media-imdb.com/images/M/MV5BNTM3OTc0MzM2OV5BMl5BanBnXkFtZTYwNzUwMTI3._V1_SX300.jpg",
    "Metascore": "70",
    "imdbRating": "8.3",
    "imdbVotes": "972,584",
    "imdbID": "tt0372784",
    "Type": "movie",
    "Response": "True"
  },
  {
    "Title": "Avatar",
    "Year": "2009",
    "Rated": "PG-13",
    "Released": "18 Dec 2009",
    "Runtime": "162 min",
    "Genre": "Action, Adventure, Fantasy",
    "Director": "James Cameron",
    "Writer": "James Cameron",
    "Actors": "Sam Worthington, Zoe Saldana, Sigourney Weaver, Stephen Lang",
    "Plot": "A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.",
    "Language": "English, Spanish",
    "Country": "USA, UK",
    "Awards": "Won 3 Oscars. Another 80 wins & 121 nominations.",
    "Poster": "http://ia.media-imdb.com/images/M/MV5BMTYwOTEwNjAzMl5BMl5BanBnXkFtZTcwODc5MTUwMw@@._V1_SX300.jpg",
    "Metascore": "83",
    "imdbRating": "7.9",
    "imdbVotes": "876,575",
    "imdbID": "tt0499549",
    "Type": "movie",
    "Response": "True"
  }
];

// 只修改这一行下面的代码

const ratings = [];
for (let i = 0; i < watchList.length; i++) {
  ratings.push({title: watchList[i]["Title"], rating: watchList[i]["imdbRating"]});
}

// 只修改这一行上面的代码

// 修改后
const ratings = watchList.map(item => ({
    title: item["Title"],
    rating: item["imdbRating"]
}))

console.log(JSON.stringify(ratings));
```

## 在原型上实现 map 方法

之前用到了 `Array.prototype.map()` 方法（即 `map()`），通过 `map`返回一个与调用它的数组长度相同的数组。 只要它的回调函数不改变原始数组，它就不会改变原始数组。

换句话说，`map` 是一个纯函数，它的输出仅取决于输入的数组和作为参数传入的回调函数。 此外，它接收另一个函数作为它的参数。

实现一个 `map`，加深对它的了解。 你可以用 `for` 循环或者 `Array.prototype.forEach()` 方法。

------

写一个和 `Array.prototype.map()` 一样的 `Array.prototype.myMap()`。 不能使用内置的 `map` 方法。 在 `myMap`方法内，可以使用 `this` 访问 `Array` 实例。

```js
// 全局变量
const s = [23, 65, 98, 5];

Array.prototype.myMap = function(callback) {
  const newArray = [];
  // 只修改这一行下面的代码
  for (let i = 0; i < this.length; i++) {
    newArray.push(callback(this[i]));
  }
  // 只修改这一行上面的代码
  return newArray;
};

const new_s = s.myMap(function(item) {
  return item * 2;
});
```

## 使用 filter 方法从数组中提取数据

另一个有用的数组方法是 `filter()`（即 `Array.prototype.filter()`）。

`filter` 接收一个回调函数，将回调函数内的逻辑应用于数组的每个元素，新数组包含根据回调函数内条件返回 `true` 的元素。 换言之，它根据传递给它的函数过滤数组。 和 `map` 一样，filter 不会改变原始数组。

回调函数接收三个参数。 第一个参数是当前正在被处理的元素。 第二个参数是这个元素的索引，第三个参数是在其上调用 `filter` 方法的数组。

看下在 `users` 上使用 `filter` 方法的例子，返回了一个包含了 30 岁以下的用户新数组。 为了简化，例子里只使用了回调函数的第一个参数。

```js
const users = [
  { name: 'John', age: 34 },
  { name: 'Amy', age: 20 },
  { name: 'camperCat', age: 10 }
];

const usersUnder30 = users.filter(user => user.age < 30);
console.log(usersUnder30); 
```

控制台将显示值 `[ { name: 'Amy', age: 20 }, { name: 'camperCat', age: 10 } ]`

------

`watchList` 变量中包含一组存有多部电影信息对象。 结合 `filter` 和 `map` 返回一个 `watchList` 只包含 `title` 和 `rating` 属性的新数组。 新数组只包含 `imdbRating` 值大于或等于 8.0 的对象。 请注意，`rating` 值在对象中保存为字符串，你可能需要将它转换成数字来执行运算。

```js
// 全局变量
const watchList = [
  {
    "Title": "Inception",
    "Year": "2010",
    "Rated": "PG-13",
    "Released": "16 Jul 2010",
    "Runtime": "148 min",
    "Genre": "Action, Adventure, Crime",
    "Director": "Christopher Nolan",
    "Writer": "Christopher Nolan",
    "Actors": "Leonardo DiCaprio, Joseph Gordon-Levitt, Elliot Page, Tom Hardy",
    "Plot": "A thief, who steals corporate secrets through use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO.",
    "Language": "English, Japanese, French",
    "Country": "USA, UK",
    "Awards": "Won 4 Oscars. Another 143 wins & 198 nominations.",
    "Poster": "http://ia.media-imdb.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg",
    "Metascore": "74",
    "imdbRating": "8.8",
    "imdbVotes": "1,446,708",
    "imdbID": "tt1375666",
    "Type": "movie",
    "Response": "True"
  },
  {
    "Title": "Interstellar",
    "Year": "2014",
    "Rated": "PG-13",
    "Released": "07 Nov 2014",
    "Runtime": "169 min",
    "Genre": "Adventure, Drama, Sci-Fi",
    "Director": "Christopher Nolan",
    "Writer": "Jonathan Nolan, Christopher Nolan",
    "Actors": "Ellen Burstyn, Matthew McConaughey, Mackenzie Foy, John Lithgow",
    "Plot": "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
    "Language": "English",
    "Country": "USA, UK",
    "Awards": "Won 1 Oscar. Another 39 wins & 132 nominations.",
    "Poster": "http://ia.media-imdb.com/images/M/MV5BMjIxNTU4MzY4MF5BMl5BanBnXkFtZTgwMzM4ODI3MjE@._V1_SX300.jpg",
    "Metascore": "74",
    "imdbRating": "8.6",
    "imdbVotes": "910,366",
    "imdbID": "tt0816692",
    "Type": "movie",
    "Response": "True"
  },
  {
    "Title": "The Dark Knight",
    "Year": "2008",
    "Rated": "PG-13",
    "Released": "18 Jul 2008",
    "Runtime": "152 min",
    "Genre": "Action, Adventure, Crime",
    "Director": "Christopher Nolan",
    "Writer": "Jonathan Nolan (screenplay), Christopher Nolan (screenplay), Christopher Nolan (story), David S. Goyer (story), Bob Kane (characters)",
    "Actors": "Christian Bale, Heath Ledger, Aaron Eckhart, Michael Caine",
    "Plot": "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, the caped crusader must come to terms with one of the greatest psychological tests of his ability to fight injustice.",
    "Language": "English, Mandarin",
    "Country": "USA, UK",
    "Awards": "Won 2 Oscars. Another 146 wins & 142 nominations.",
    "Poster": "http://ia.media-imdb.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_SX300.jpg",
    "Metascore": "82",
    "imdbRating": "9.0",
    "imdbVotes": "1,652,832",
    "imdbID": "tt0468569",
    "Type": "movie",
    "Response": "True"
  },
  {
    "Title": "Batman Begins",
    "Year": "2005",
    "Rated": "PG-13",
    "Released": "15 Jun 2005",
    "Runtime": "140 min",
    "Genre": "Action, Adventure",
    "Director": "Christopher Nolan",
    "Writer": "Bob Kane (characters), David S. Goyer (story), Christopher Nolan (screenplay), David S. Goyer (screenplay)",
    "Actors": "Christian Bale, Michael Caine, Liam Neeson, Katie Holmes",
    "Plot": "After training with his mentor, Batman begins his fight to free crime-ridden Gotham City from the corruption that Scarecrow and the League of Shadows have cast upon it.",
    "Language": "English, Urdu, Mandarin",
    "Country": "USA, UK",
    "Awards": "Nominated for 1 Oscar. Another 15 wins & 66 nominations.",
    "Poster": "http://ia.media-imdb.com/images/M/MV5BNTM3OTc0MzM2OV5BMl5BanBnXkFtZTYwNzUwMTI3._V1_SX300.jpg",
    "Metascore": "70",
    "imdbRating": "8.3",
    "imdbVotes": "972,584",
    "imdbID": "tt0372784",
    "Type": "movie",
    "Response": "True"
  },
  {
    "Title": "Avatar",
    "Year": "2009",
    "Rated": "PG-13",
    "Released": "18 Dec 2009",
    "Runtime": "162 min",
    "Genre": "Action, Adventure, Fantasy",
    "Director": "James Cameron",
    "Writer": "James Cameron",
    "Actors": "Sam Worthington, Zoe Saldana, Sigourney Weaver, Stephen Lang",
    "Plot": "A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.",
    "Language": "English, Spanish",
    "Country": "USA, UK",
    "Awards": "Won 3 Oscars. Another 80 wins & 121 nominations.",
    "Poster": "http://ia.media-imdb.com/images/M/MV5BMTYwOTEwNjAzMl5BMl5BanBnXkFtZTcwODc5MTUwMw@@._V1_SX300.jpg",
    "Metascore": "83",
    "imdbRating": "7.9",
    "imdbVotes": "876,575",
    "imdbID": "tt0499549",
    "Type": "movie",
    "Response": "True"
  }
];

// 只修改这一行下面的代码
// const filteredList = "";

const filteredList = watchList.map(item => ({
  title: item["Title"],
  rating: item["imdbRating"]
})).filter(item => item.rating > 8.0);
// 只修改这一行上面的代码

console.log(filteredList);
```

## 在原型上实现 filter 方法

为了加深对 `filter` 的理解，可以自己实现一个。 可以用 `for` 循环或 `Array.prototype.forEach()`。

------

编写一个和 `Array.prototype.filter()` 功能一样的 `Array.prototype.myFilter()` 方法。 不能使用内置的 `filter` 方法。 在 `myFilter` 方法内部，可以使用 `this` 访问 `Array` 实例。

```js
// 全局变量
const s = [23, 65, 98, 5];

Array.prototype.myFilter = function(callback) {
  // 只修改这一行下面的代码
  const newArray = [];
  for (let i = 0; i < this.length; i++) {
    if (callback(this[i])) {
      newArray.push(this[i]);
    }
  }
  // 只修改这一行上面的代码
  return newArray;
};

const new_s = s.myFilter(function(item) {
  return item % 2 === 1;
});
```

## 使用 slice 方法返回数组的一部分

`slice` 方法可以从已有数组中返回指定元素。 它接受两个参数，第一个规定从何处开始选取，第二个规定从何处结束选取（不包括该元素）。 如果没有传参，则默认为从数组的开头开始到结尾结束，这是复制整个数组的简单方式。 `slice` 返回一个新数组，不会修改原始数组。

举个例子：

```js
const arr = ["Cat", "Dog", "Tiger", "Zebra"];
const newArray = arr.slice(1, 3);
```

`newArray` 值为 `["Dog", "Tiger"]`

------

在 `sliceArray` 函数中使用 `slice` 方法，给出 `beginSlice` 和 `endSlice` 索引，返回 `anim` 数组的一部分。 这个函数应返回一个数组。

```js
function sliceArray(anim, beginSlice, endSlice) {
  // 只修改这一行下面的代码
  return anim.slice(beginSlice, endSlice);

  // 只修改这一行上面的代码
}

const inputAnim = ["Cat", "Dog", "Tiger", "Zebra", "Ant"];
sliceArray(inputAnim, 1, 3);
```

## 使用 slice 而不是 splice 从数组中移除元素

使用数组时经常遇到要删除一些元素并保留数组剩余部分的情况。 为此，JavaScript 提供了 `splice` 方法，它接收两个参数：从哪里开始删除项目的索引，和要删除的项目数。 如果没有提供第二个参数，默认情况下是移除一直到结尾的所有元素。 但 `splice` 方法会改变调用它的原始数组。 举个例子：

```js
const cities = ["Chicago", "Delhi", "Islamabad", "London", "Berlin"];
cities.splice(3, 1);
```

在这里 `splice` 返回字符串 `London` 并从城市数组中删除它。 `cities`将有值 `["Chicago", "Delhi", "Islamabad", "Berlin"]`。

正如我们在上一次挑战中看到的那样，`slice` 方法不会改变原始数组，而是返回一个可以保存到变量中的新数组。 回想一下，`slice` 方法接收两个参数，从开始索引开始选取到结束（不包括该元素），并在新数组中返回这些元素。 使用 `slice` 方法替代 `splice` 有助于避免数组变化产生的副作用。

------

用 `slice` 代替 `splice` 重写 `nonMutatingSplice` 函数。 将 `cities`数组长度限制为 3，并返回一个仅包含前 3 项的新数组。

不要改变提供给函数的原始数组。

```js
function nonMutatingSplice(cities) {
  // 只修改这一行下面的代码
  // return cities.splice(3);
  return cities.slice(0, 3);
  // 只修改这一行上面的代码
}

const inputCities = ["Chicago", "Delhi", "Islamabad", "London", "Berlin"];
nonMutatingSplice(inputCities);
```

## 使用 concat 方法组合两个数组

Concatenation 意思是将元素连接到尾部。 同理，JavaScript 为字符串和数组提供了`concat`方法。 对数组来说，在一个数组上调用 `concat` 方法，然后提供另一个数组作为参数添加到第一个数组末尾。 它返回一个新数组，不会改变任何一个原始数组。 举个例子：

```js
[1, 2, 3].concat([4, 5, 6]);
```

返回的数组将是 `[1, 2, 3, 4, 5, 6]`。

------

在 `nonMutatingConcat` 函数里使用 `concat`，将 `attach` 拼接到 `original` 尾部。 函数返回拼接后的数组。

```js
function nonMutatingConcat(original, attach) {
  // 只修改这一行下面的代码
  return original.concat(attach);
  // 只修改这一行上面的代码
}

const first = [1, 2, 3];
const second = [4, 5];
nonMutatingConcat(first, second);
```

## 使用 concat 而不是 push 将元素添加到数组的末尾

函数式编程就是创建和使用具有不变性的函数。

上一个挑战介绍了 `concat` 方法，这是一种在不改变原始数组的前提下，将数组组合成新数组的方法。 将 `concat` 方法与 `push` 方法做比较。 `push` 将元素添加到调用它的数组的末尾，这样会改变该数组。 举个例子：

```js
const arr = [1, 2, 3];
arr.push([4, 5, 6]);
```

`arr` 的值被修改为 `[1, 2, 3, [4, 5, 6]]`，这不是函数编程方式。

`concat` 方法可以将新项目添加到数组末尾，而不产生副作用。

------

修改 `nonMutatingPush` 函数，用 `concat` 替代 `push` 将 `newItem` 添加到 `original` 末尾。 该函数应返回一个数组。

```js
function nonMutatingPush(original, newItem) {
  // 只修改这一行下面的代码
  // return original.push(newItem);
  return original.concat(newItem);
  // 只修改这一行上面的代码
}

const first = [1, 2, 3];
const second = [4, 5];
nonMutatingPush(first, second);
```

## 使用 reduce 方法分析数据

`reduce()`（即`Array.prototype.reduce()`），是 JavaScript 所有数组操作中最常用的方法。 几乎可以用`reduce`方法解决所有数组处理问题。

> reduce: 改变...的状态

`reduce`方法是处理数组更通用的方式，而且`filter`和`map`方法都可以当作是`reduce`的特殊实现。 `reduce`方法遍历数组中的每个项目并返回单个值（即字符串、数字、对象、数组）。 这是通过在每次迭代中调用一个回调函数来实现的。

回调函数接受四个参数。 第一个参数称为叠加器，它是上一次迭代中回调函数的返回值，第二个参数是当前正在处理的数组元素，第三个参数是该参数的索引，第四个参数是在其上调用 `reduce` 方法的数组。

除了回调函数，`reduce` 还有一个额外的参数做为叠加器的初始值。 如果没有第二个参数，会跳过第一次迭代，第二次迭代给叠加器传入数组的第一个元素。

见下面的例子，给 `users` 数组使用 `reduce` 方法，返回所有用户数组的和。 为了简化，例子仅使用了回调函数的第一个参数和第二个参数。

```js
const users = [
  { name: 'John', age: 34 },
  { name: 'Amy', age: 20 },
  { name: 'camperCat', age: 10 }
];

const sumOfAges = users.reduce((sum, user) => sum + user.age, 0);
console.log(sumOfAges);
```

这里控制台将显示值 `64`。

在另一个例子里，查看如何返回一个包含用户名称做为属性，其年龄做为值的对象。

```js
const users = [
  { name: 'John', age: 34 },
  { name: 'Amy', age: 20 },
  { name: 'camperCat', age: 10 }
];

const usersObj = users.reduce((obj, user) => {
  obj[user.name] = user.age;
  return obj;
}, {});
console.log(usersObj);
```

控制台将显示值 `{ John: 34, Amy: 20, camperCat: 10 }`。

------

`watchList` 是包含一些电影信息的对象。 使用 `reduce` 查找由 `Christopher Nolan` 导演的电影的 IMDB 评级平均值。 回想一下之前的挑战，如何 `filter` 数据，以及使用 `map` 来获取你想要的数据。 您可能需要创建其他变量，并从 `getRating` 函数返回平均评分。 请注意，评级在对象中是字符串，需要将其转换为数字再用于数学运算。

```js
// 全局变量
const watchList = [
  {
    "Title": "Inception",
    "Year": "2010",
    "Rated": "PG-13",
    "Released": "16 Jul 2010",
    "Runtime": "148 min",
    "Genre": "Action, Adventure, Crime",
    "Director": "Christopher Nolan",
    "Writer": "Christopher Nolan",
    "Actors": "Leonardo DiCaprio, Joseph Gordon-Levitt, Elliot Page, Tom Hardy",
    "Plot": "A thief, who steals corporate secrets through use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO.",
    "Language": "English, Japanese, French",
    "Country": "USA, UK",
    "Awards": "Won 4 Oscars. Another 143 wins & 198 nominations.",
    "Poster": "http://ia.media-imdb.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg",
    "Metascore": "74",
    "imdbRating": "8.8",
    "imdbVotes": "1,446,708",
    "imdbID": "tt1375666",
    "Type": "movie",
    "Response": "True"
  },
  {
    "Title": "Interstellar",
    "Year": "2014",
    "Rated": "PG-13",
    "Released": "07 Nov 2014",
    "Runtime": "169 min",
    "Genre": "Adventure, Drama, Sci-Fi",
    "Director": "Christopher Nolan",
    "Writer": "Jonathan Nolan, Christopher Nolan",
    "Actors": "Ellen Burstyn, Matthew McConaughey, Mackenzie Foy, John Lithgow",
    "Plot": "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
    "Language": "English",
    "Country": "USA, UK",
    "Awards": "Won 1 Oscar. Another 39 wins & 132 nominations.",
    "Poster": "http://ia.media-imdb.com/images/M/MV5BMjIxNTU4MzY4MF5BMl5BanBnXkFtZTgwMzM4ODI3MjE@._V1_SX300.jpg",
    "Metascore": "74",
    "imdbRating": "8.6",
    "imdbVotes": "910,366",
    "imdbID": "tt0816692",
    "Type": "movie",
    "Response": "True"
  },
  {
    "Title": "The Dark Knight",
    "Year": "2008",
    "Rated": "PG-13",
    "Released": "18 Jul 2008",
    "Runtime": "152 min",
    "Genre": "Action, Adventure, Crime",
    "Director": "Christopher Nolan",
    "Writer": "Jonathan Nolan (screenplay), Christopher Nolan (screenplay), Christopher Nolan (story), David S. Goyer (story), Bob Kane (characters)",
    "Actors": "Christian Bale, Heath Ledger, Aaron Eckhart, Michael Caine",
    "Plot": "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, the caped crusader must come to terms with one of the greatest psychological tests of his ability to fight injustice.",
    "Language": "English, Mandarin",
    "Country": "USA, UK",
    "Awards": "Won 2 Oscars. Another 146 wins & 142 nominations.",
    "Poster": "http://ia.media-imdb.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_SX300.jpg",
    "Metascore": "82",
    "imdbRating": "9.0",
    "imdbVotes": "1,652,832",
    "imdbID": "tt0468569",
    "Type": "movie",
    "Response": "True"
  },
  {
    "Title": "Batman Begins",
    "Year": "2005",
    "Rated": "PG-13",
    "Released": "15 Jun 2005",
    "Runtime": "140 min",
    "Genre": "Action, Adventure",
    "Director": "Christopher Nolan",
    "Writer": "Bob Kane (characters), David S. Goyer (story), Christopher Nolan (screenplay), David S. Goyer (screenplay)",
    "Actors": "Christian Bale, Michael Caine, Liam Neeson, Katie Holmes",
    "Plot": "After training with his mentor, Batman begins his fight to free crime-ridden Gotham City from the corruption that Scarecrow and the League of Shadows have cast upon it.",
    "Language": "English, Urdu, Mandarin",
    "Country": "USA, UK",
    "Awards": "Nominated for 1 Oscar. Another 15 wins & 66 nominations.",
    "Poster": "http://ia.media-imdb.com/images/M/MV5BNTM3OTc0MzM2OV5BMl5BanBnXkFtZTYwNzUwMTI3._V1_SX300.jpg",
    "Metascore": "70",
    "imdbRating": "8.3",
    "imdbVotes": "972,584",
    "imdbID": "tt0372784",
    "Type": "movie",
    "Response": "True"
  },
  {
    "Title": "Avatar",
    "Year": "2009",
    "Rated": "PG-13",
    "Released": "18 Dec 2009",
    "Runtime": "162 min",
    "Genre": "Action, Adventure, Fantasy",
    "Director": "James Cameron",
    "Writer": "James Cameron",
    "Actors": "Sam Worthington, Zoe Saldana, Sigourney Weaver, Stephen Lang",
    "Plot": "A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.",
    "Language": "English, Spanish",
    "Country": "USA, UK",
    "Awards": "Won 3 Oscars. Another 80 wins & 121 nominations.",
    "Poster": "http://ia.media-imdb.com/images/M/MV5BMTYwOTEwNjAzMl5BMl5BanBnXkFtZTcwODc5MTUwMw@@._V1_SX300.jpg",
    "Metascore": "83",
    "imdbRating": "7.9",
    "imdbVotes": "876,575",
    "imdbID": "tt0499549",
    "Type": "movie",
    "Response": "True"
  }
];

function getRating(watchList) {
  // 只修改这一行下面的代码
  const averageRating = watchList
  .filter(film => film.Director === "Christopher Nolan")
  .map(film => Number(film.imdbRating))
  .reduce((sum, rating) => sum + rating) / watchList.filter(film => film.Director === "Christopher Nolan").length;


  // 只修改这一行上面的代码
  return averageRating;
}

console.log(getRating(watchList));
```

## 使用高阶函数 map、filter 或者 reduce 来解决复杂问题

已经接触了高阶函数如 `map()`、 `filter()` 和 `reduce()`的使用，是时候用它们来完成一些复杂的挑战了。

------

使用 `map()`、`filter()` 和 `reduce()` 的任何组合完成 `squareList` 函数的代码。 传递一个包含实数的数组给函数时，函数应返回一个新的数组，*只*包含正整数（小数不是整数）的平方值， 例如 `[-3, 4.8, 5, 3, -3.2]` 这样一个包含实数的数组。

**注意：** 函数不应该包含任何形式的 `for` 或者 `while` 循环或者 `forEach()` 函数。

```js
const squareList = arr => {
  // 只修改这一行下面的代码
  return arr
    .filter(num => num > 0 && num % parseInt(num) === 0)
    .map(num => Math.pow(num, 2));
  // 只修改这一行上面的代码
};

const squaredIntegers = squareList([-3, 4.8, 5, 3, -3.2]);
console.log(squaredIntegers);
```

## 使用 sort 方法按字母顺序给数组排序

`sort` 方法可以根据回调函数对数组元素进行排序。

举个例子：

```js
function ascendingOrder(arr) {
  return arr.sort(function(a, b) {
    return a - b;
  });
}

ascendingOrder([1, 5, 2, 3, 4]);
```

这将返回值 `[1, 2, 3, 4, 5]`。

```js
function reverseAlpha(arr) {
  return arr.sort(function(a, b) {
    return a === b ? 0 : a < b ? 1 : -1;
  });
}

reverseAlpha(['l', 'h', 'z', 'b', 's']);
```

这将返回值 `['z', 's', 'l', 'h', 'b']`。

JavaScript 的默认排序方法是 Unicode 值顺序排序，有时可能会得到意想不到的结果。 因此，建议提供一个回调函数来指定如何对数组项目排序。 这个回调函数通常叫做 `compareFunction`，它根据 `compareFunction` 的返回值决定数组元素的排序方式： 如果两个元素 `a` 和 `b`，`compareFunction(a,b)` 返回一个比 0 小的值，那么 `a` 会在 `b` 的前面。 如果两个元素 `a` 和 `b`，`compareFunction(a,b)` 返回一个比 0 大的值，那么 `b` 会在 `a` 的前面。 如果两个元素 `a` 和 `b`，`compareFunction(a,b)` 返回等于 0 的值，那么 `a` 和 `b` 的位置保持不变。

------

在 `alphabeticalOrder` 函数中使用 `sort` 方法对 `arr` 中的元素按照字母顺序排列。 该函数应返回一个排序的数组。

```js
function alphabeticalOrder(arr) {
  // 只修改这一行下面的代码
  return arr.sort(function(a, b) {
    return a === b ? 0 : a < b? -1 : 1;
  });
  // 只修改这一行上面的代码
}

alphabeticalOrder(["a", "d", "c", "a", "z", "g"]);
```

## 在不更改原始数组的前提下返回排序后的数组

`sort` 方法会产生改变原始数组中元素顺序的副作用。 换句话说，它会改变数组的位置。 避免这种情况的一种方法是先将空数组连接到正在排序的数组上（记住 `slice` 和 `concat` 返回一个新数组），再用`sort`方法。

------

在 `nonMutatingSort` 函数中使用 `sort` 方法对数组中的元素按升序进行排列。 函数不能改变 `globalArray` 变量，应返回一个新数组。

```js
const globalArray = [5, 6, 3, 2, 9];

function nonMutatingSort(arr) {
  // 只修改这一行下面的代码
  return arr.slice().sort(function(a, b) {
    return a === b ? 0 : a < b ? -1 : 1;
  })

  // 只修改这一行上面的代码
}

nonMutatingSort(globalArray);
```

## 使用 split 方法将字符串拆分成数组

`split` 方法将一个字符串分割成一个字符串数组。 它需要一个参数作为分隔符，它可以是用于拆分字符串或正则表达式的一个字符。 举个例子，如果分隔符是空格，你会得到一个单词数组；如果分隔符是空字符串，你会得到一个由字符串中每个字符组成的数组。

下面是两个用空格分隔一个字符串的例子，另一个是用数字的正则表达式分隔：

```js
const str = "Hello World";
const bySpace = str.split(" ");

const otherString = "How9are7you2today";
const byDigits = otherString.split(/\d/);
```

`bySpace` 将有值 `["Hello", "World"]`，`byDigits` 将有值 `["How", "are", "you", "today"]`。

因为字符串是不可变的，`split` 方法操作它们更方便。

------

在 `splitify` 函数中用 `split` 方法将 `str` 分割成单词数组。 这个方法应该返回一个数组。 单词不一定都是用空格分隔，所以数组中不应包含标点符号。

```js
function splitify(str) {
  // 只修改这一行下面的代码
  return str.split(/\W/);

  // 只修改这一行上面的代码
}

splitify("Hello World,I-am code");
```

## 使用 join 方法将数组组合成字符串

`join` 方法用来把数组中的所有元素放入一个字符串。 并通过指定的分隔符参数进行分隔。

举个例子：

```js
const arr = ["Hello", "World"];
const str = arr.join(" ");
```

`str` 的值应该是字符串 `Hello World`。

------

在函数 `sentensify` 内用 `join` 方法（及其他方法）用字符串 `str` 中的单词造句，这个函数应返回一个字符串。 该函数应返回一个数组。 举个例子，`I-like-Star-Wars` 会被转换成 `I like Star Wars`。 在此挑战中请勿使用 `replace` 方法。

```js
function sentensify(str) {
  // 只修改这一行下面的代码
  return str.split(/\W/).join(" ");

  // 只修改这一行上面的代码
}

sentensify("May-the-force-be-with-you");
```

## 应用函数式编程将字符串转换为URL片段

最后几个挑战中涵盖了许多符合函数式编程原则并在处理数组和字符串中非常有用的方法。 我们还学习了强大的、可以将问题简化为更简单形式的 `reduce` 方法。 从计算平均值到排序，任何数组操作都可以用它来实现。 回想一下，`map` 和 `filter` 方法都是 `reduce` 的特殊实现。

让我们把学到的知识结合起来解决一个实际问题。

许多内容管理站点（CMS）为了让添加书签更简单，会将帖子的标题添加到 URL 上。 举个例子，如果你写了一篇标题为 `Stop Using Reduce`的帖子，URL很可能会包含标题字符串的某种形式 (如：`.../stop-using-reduce`)。 你可能已经在 freeCodeCamp 网站上注意到了这一点。

------

填写 `urlSlug` 函数，将字符串 `title` 转换成带有连字符号的 URL。 您可以使用本节中介绍的任何方法，但不要用 `replace` 方法。 以下是本次挑战的要求：

输入包含空格和标题大小写单词的字符串

输出字符串，单词之间的空格用连字符 (`-`) 替换

输出应该是小写字母

输出不应有任何空格

```js
// 只修改这一行下面的代码
function urlSlug(title) {
  // 其中，\s+ 表示空白字符至少出现一次
  return title.toLowerCase().trim().split(/\s+/).join("-");
}
// 只修改这一行上面的代码
urlSlug("A Mind Needs Books Like A Sword Needs A Whetstone");
```

## 使用 every 方法检查数组中的每个元素是否符合条件

`every` 方法用于检测数组中*所有*元素是否都符合指定条件。 如果所有元素满足条件，返回布尔值 `true`，反之返回 `false`。

举个例子，下面的代码检测数组 `numbers` 的所有元素是否都小于 10：

```js
const numbers = [1, 5, 8, 0, 10, 11];

numbers.every(function(currentValue) {
  return currentValue < 10;
});
```

`every` 方法在这里会返回 `false`。

------

在 `checkPositive` 函数中使用 `every` 方法检查 `arr` 中是否所有元素都是正数。 函数应返回一个布尔值。

```js
function checkPositive(arr) {
  // 只修改这一行下面的代码

  return arr.every(function(currentValue) {
    return currentValue > 0;
  });
  // 只修改这一行上面的代码
}

checkPositive([1, 2, 3, -4, 5]);
```

## 使用 some 方法检查数组中是否有元素是否符合条件

`some` 方法用于检测数组中*任何*元素是否满足指定条件。 如果有一个元素满足条件，返回布尔值 `true`，反之返回 `false`。

举个例子，下面的代码检测数组`numbers`中是否有元素小于 10：

```js
const numbers = [10, 50, 8, 220, 110, 11];

numbers.some(function(currentValue) {
  return currentValue < 10;
});
```

`some` 方法将返回 `true`。

------

在 `checkPositive` 函数值中使用 `some` 检查 `arr` 中是否有元素为正数。 函数应返回一个布尔值。

```js
function checkPositive(arr) {
  // 只修改这一行下面的代码

  return arr.some(function(currentValue) {
    return currentValue > 0;
  });
  // 只修改这一行上面的代码
}

checkPositive([1, 2, 3, -4, 5]);
```

## 函数柯里化和局部调用

arity（参数个数）是函数所需的形参的数量。 函数柯里化（Currying）意思是把接受多个 arity 的函数变换成接受单一 arity 的函数。

换句话说，就是重构函数让它接收一个参数，然后返回接收下一个参数的函数，依此类推。

举个例子：

```js
function unCurried(x, y) {
  return x + y;
}

function curried(x) {
  return function(y) {
    return x + y;
  }
}

const curried = x => y => x + y

curried(1)(2)
```

`curried(1)(2)` 会返回 `3`。

柯里化在不能一次为函数提供所有参数情况下很有用。 因为它可以将每个函数的调用保存到一个变量中，该变量将保存返回的函数引用，该引用在下一个参数可用时接受该参数。 下面是使用柯里化函数的例子：

```js
const funcForY = curried(1);
console.log(funcForY(2)); // 3
```

类似地，局部调用（ partial application）的意思是一次对一个函数应用几个参数，然后返回另一个应用更多参数的函数。 这是一个示例：

```js
function impartial(x, y, z) {
  return x + y + z;
}

const partialFn = impartial.bind(this, 1, 2);
partialFn(10); // 13
```

------

填写 `add` 函数主体部分，用柯里化添加参数 `x`，`y` 和 `z`.

```js
function add(x) {
  // 只修改这一行下面的代码
  return function(y) {
    return function (z) {
      return x + y + z;
    }
  }

  // 只修改这一行上面的代码
}

add(10)(20)(30);
```

