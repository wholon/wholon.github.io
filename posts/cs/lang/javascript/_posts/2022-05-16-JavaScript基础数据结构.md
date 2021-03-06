# JavaScript基础数据结构

## 数组

我们可以通过多种方式存储和访问数据。你已经知道数组和对象了，它们都是常见的 JavaScript 数据结构。

在基础数据结构中，你会更深入地了解数组和对象之间的差异，以及在不同情况下应该使用哪个。你还将学习到一些好用的 JS 方法，例如 `splice()`，以及使用 `Object.keys()` 来访问和操作数据。

<!--more-->

### 使用数组存储不同类型的数据

以下是最简单的数组（Array）示例： 这是一个一维数组（one-dimensional array），它只有一层，或者说它里面没有包含其它数组。 可以观察到，这个数组中只包含了布尔值（booleans）、字符串（strings）、数字（numbers）以及 JavaScript 中的其他数据类型：

```js
let simpleArray = ['one', 2, 'three', true, false, undefined, null];
console.log(simpleArray.length);
```

调用 `console.log` 显示 `7`。

所有数组都有一个表示长度的**属性**，我们可以通过 `Array.length` 来访问它。 下面是一个关于数组的更复杂的例子。 这是一个多维数组 （multi-dimensional Array），或者说是一个包含了其他数组的数组。 可以注意到，在它的内部还包含了 JavaScript 中的对象（objects）结构。 我们会在后面的小节中讨论该数据结构，但现在你只需要知道数组能够存储复杂的对象类型数据。

```js
let complexArray = [
  [
    {
      one: 1,
      two: 2
    },
    {
      three: 3,
      four: 4
    }
  ],
  [
    {
      a: "a",
      b: "b"
    },
    {
      c: "c",
      d: "d"
    }
  ]
];
```

------

我们已经定义了一个名为 `yourArray` 的变量。 请修改代码，将一个含有至少 5 个元素的数组赋值给 `yourArray` 变量。 你的数组中应包含至少一个 string 类型的数据、一个 number 类型的数据和一个 boolean 类型的数据。

```js
let yourArray; // 修改这一行
yourArray = ["String", 1, true, false, undefined];
```

### 使用方括号访问数组的元素

所有数据结构的基本特性是，它们不仅可以存储数据，还可以让我们按需访问存放在其中的数据。 我们已经学习了如何创建数组，现在让我们来学习如何访问数组中的数据。

我们先定义一个包含 3 个元素的数组：

```js
let ourArray = ["a", "b", "c"];
```

在数组中，内部的每个元素都有一个与之对应的索引（index）。 索引既是该元素在数组中的位置，也是我们访问该元素的引用。 需要注意的是，JavaScript 数组的索引是从 0 开始的（这种从 0 开始的规则叫做 zero-indexed），即数组的第一个元素是在数组中的***第 0 个***位置，而不是第 1 个位置。 要从数组中获取一个元素，我们可以在数组字面量后面加一个用方括号括起来的索引。不过习惯上，我们会通过表示数组的变量名来访问，而不是直接通过字面量。 这种从数组中读取元素的方式叫做方括号表示法（bracket notation）。 如果我们要从数组 `ourArray` 中取出数据 `a` 并将其赋值给另一个变量，可以这样写：

```js
let ourVariable = ourArray[0];
```

现在，变量 `ourVariable` 的值也为 `a`。

通过索引，我们不仅可以获取某个元素值，还可以用类似的写法来*设置*一个索引位置的元素值：

```js
ourArray[1] = "not b anymore";
```

在上面的代码中，我们用方括号表示法把索引为 1 的元素从 `b` 改成了 `not b anymore`。 现在 `ourArray` 的值是 `["a", "not b anymore", "c"]`。

------

在本挑战中，请将 `myArray` 中的第二个元素（索引为 `1`）设置为除了 `b` 以外的任意值。

```js
let myArray = ["a", "b", "c", "d"];
// 只修改这一行下面的代码
myArray[1] = "not b anymore";
// 只修改这一行上面的代码
console.log(myArray);
```

### 使用 push() 和 unshift() 为数组添加元素

数组的长度与数组能包含的数据类型一样，都是不固定的。 数组可以包含任意数量的元素，可以不限次数地往数组中添加元素或者从中移除元素。 总之，数组是可变的（mutable）。 在本挑战中，我们要学习两种修改数组的方法：`Array.push()` 和 `Array.unshift()`。

这两个方法都接收一个或多个元素作为参数，并会将参数中的元素添加到该数组中。 `push()` 方法会将元素插入到数组的末尾，而 `unshift()`方法会将元素插入到数组的开头。 请看以下例子：

```js
let twentyThree = 'XXIII';
let romanNumerals = ['XXI', 'XXII'];

romanNumerals.unshift('XIX', 'XX');
```

`romanNumerals` 的值就变成了 `['XIX', 'XX', 'XXI', 'XXII']`。

```js
romanNumerals.push(twentyThree);
```

`romanNumerals` 的值现在就变成了 `['XIX', 'XX', 'XXI', 'XXII', 'XXIII']`。 请注意这里，我们也可以使用变量作为参数，这让我们在动态修改数组数据时更加灵活。

------

我们已经定义了一个 `mixedNumbers` 函数，它接收一个数组作为参数。 请修改这个函数，使用 `push()` 和 `unshift()` 来将 `'I', 2, 'three'`插入到数组开头；将 `7, 'VIII', 9` 插入到数组的末尾。最终这个函数的返回值就会是一个依次包含不同形式的 1-9 的数组。

```js
function mixedNumbers(arr) {
  // 只修改这一行下面的代码
  arr.unshift("I", 2, 'three');
  arr.push(7, 'VIII', 9);
  // 只修改这一行上面的代码
  return arr;
}

console.log(mixedNumbers(['IV', 5, 'six']));
```

### 使用 pop() 和 shift() 从数组中删除元素

`push()` 和 `unshift()` 都有一个与它们作用相反的函数：`pop()` 和 `shift()`。 与插入元素相反，`pop()` 会从数组的末尾*移除*一个元素，而 `shift()` 会从数组的开头移除一个元素。 `pop()` 和 `shift()` 与 `push()` 和 `unshift()` 的关键区别在于，用于删除元素的方法不接收参数，而且每次只能删除数组中的一个元素。

让我们来看以下的例子：

```js
let greetings = ['whats up?', 'hello', 'see ya!'];

greetings.pop();
```

`greetings` 值为 `['whats up?', 'hello']`。

```js
greetings.shift();
```

`greetings` 值为 `['hello']`。

这些用于删除数组元素的方法会返回被删除的元素：

```js
let popped = greetings.pop();
```

`greetings` 值为 `[]`，`popped` 值为 `hello`。

------

我们已经定义了一个 `popShift` 函数，它接收一个数组作为输入参数并返回一个新的数组。 请修改这个函数，使用 `pop()` 和 `shift()` 来移除输入的数组中的第一个元素和最后一个元素，并将这两个被移除的元素分别赋值给对应的变量，使得最终返回的数组里包含这两个值。

```js
function popShift(arr) {
  let popped = arr.pop(); // 修改这一行
  let shifted = arr.shift(); // 修改这一行
  return [shifted, popped];
}

console.log(popShift(['challenge', 'is', 'not', 'complete']));
```

### 使用 splice() 删除元素

在之前的挑战中，我们已经学习了如何用 `shift()` 和 `pop()` 从数组的开头或末尾移除元素。 但如果我们想删除数组中间的一个元素， 或者想一次删除多个元素，该如何操作呢？ 这时候我们就需要使用 `splice()`方法了， `splice()` 可以让我们从数组中的任意位置**连续删除任意数量的元素**。

`splice()` 最多可以接受 3 个参数，但现在我们先关注前两个。 `splice()` 的前两个参数是整数，表示数组中调用 `splice()` 的项的索引或位置。 别忘了，数组的索引是*从 0 开始的*，所以我们要用 `0` 来表示数组中的第一个元素。 `splice()` 的第一个参数代表从数组中的哪个索引开始移除元素，而第二个参数表示要从数组中的这个位置开始删除多少个元素。 

> 如果第二个参数大于数组长度，将删除并返回数组内的全部单词··。

例如：

```js
let array = ['today', 'was', 'not', 'so', 'great'];

array.splice(2, 2);
```

这里我们移除 2 个元素，首先是第三个元素（索引为 2）。 `array` 会有值 `['today', 'was', 'great']`。

`splice()` 不仅会修改调用该方法的数组，还会返回一个包含被移除元素的数组：

```js
let array = ['I', 'am', 'feeling', 'really', 'happy'];

let newArray = array.splice(3, 2);
```

`newArray` 值为 `['really', 'happy']`。

------

我们已经定义了数组 `arr`。 请使用 `splice()` 从 `arr` 里移除元素，使剩余的元素之和为 `10`。

```js
const arr = [2, 4, 5, 1, 7, 5, 2, 1];
// 只修改这一行下面的代码
arr.splice(1, 4);
// 只修改这一行上面的代码
console.log(arr);
```

### 使用 splice() 添加元素

还记得在[上节](#使用 splice() 删除元素)中我们提到 `splice()` 方法最多可以接收 3 个参数吗？ 第三个参数可以是一个或多个元素，这些元素会被添加到数组中。 这样，我们能够便捷地将数组中的一个或多个连续元素换成其他的元素。

```js
const numbers = [10, 11, 12, 12, 15];
const startIndex = 3;
const amountToDelete = 1;

numbers.splice(startIndex, amountToDelete, 13, 14);
console.log(numbers);
```

第二个 `12` 已被删除，我们在同一索引处添加 `13` 和 `14`。 `numbers` 数组现在将会是 `[ 10, 11, 12, 13, 14, 15 ]`。

在上面的代码中，数组一开始包含了若干数字。 接着，我们调用 `splice()` 方法，索引为 (3) 的地方开始删除元素，删除的元素数量是 (1)。然后，(13, 14) 是在删除位置插入的元素。 可以在 `amountToDelete` 后面传入任意数量的元素（以逗号分隔），每个都会被插入到数组中。

------

我们已经定义了一个 `htmlColorNames` 函数，它以一个 HTML 颜色的数组作为输入参数。 请修改这个函数，使用 `splice()` 来移除数组中的前两个元素，并在对应的位置上添加 `'DarkSalmon'` 和 `'BlanchedAlmond'`。

```js
function htmlColorNames(arr) {
  // 只修改这一行下面的代码
  arr.splice(0, 2, 'DarkSalmon', 'BlanchedAlmond');
  // 只修改这一行上面的代码
  return arr;
}

console.log(htmlColorNames(['DarkGoldenRod', 'WhiteSmoke', 'LavenderBlush', 'PaleTurquoise', 'FireBrick']));
```

### 使用 slice() 复制数组元素

接下来我们要介绍 `slice()` 方法。 `slice()` 不会修改数组，而是会复制，或者说*提取（extract）*给定数量的元素到一个新数组。 `slice()`只接收 2 个输入参数：第一个是开始提取元素的位置（索引），第二个是提取元素的结束位置（索引）。 提取的元素中不包括第二个参数所对应的元素。 如下示例：

```js
let weatherConditions = ['rain', 'snow', 'sleet', 'hail', 'clear'];

let todaysWeather = weatherConditions.slice(1, 3);
```

`todaysWeather` 值为 `['snow', 'sleet']`，`weatherConditions` 值仍然为 `['rain', 'snow', 'sleet', 'hail', 'clear']`。

在上面的代码中，我们从一个数组中提取了一些元素，并用这些元素创建了一个新数组。

------

我们已经定义了一个 `forecast` 函数，它接受一个数组作为参数。 请修改这个函数，利用 `slice()` 从输入的数组中提取信息，最终返回一个包含元素 `warm` 和 `sunny` 的新数组。

```js
function forecast(arr) {
  // 只修改这一行下面的代码

  return arr.slice(2, 4);
}

// 只修改这一行上面的代码
console.log(forecast(['cold', 'rainy', 'warm', 'sunny', 'cool', 'thunderstorms']));
```

### 使用展开运算符复制数组

`slice()` 可以让我们从一个数组中选择一些元素来复制到新数组中，而 ES6 中又引入了一个简洁且可读性强的语法：展开运算符（spread operator），它能让我们方便地复制数组中的*所有*元素。 展开语法写出来是这样：`...`


我们可以用展开运算符来复制数组：

```js
let thisArray = [true, true, undefined, false, null];
let thatArray = [...thisArray];
```

`thatArray` 等于 `[true, true, undefined, false, null]`。 `thisArray` 保持不变， `thatArray` 包含与 `thisArray` 相同的元素。

------

我们已经定义了一个 `copyMachine` 函数，它接受 `arr`（一个数组）和 `num`（一个数字）作为输入参数。 该函数需要返回一个由 `num` 个 `arr`组成的新的二维数组。 同时，我们写好了大致的流程，只是细节实现还没有写完。 请修改这个函数，使用展开语法，使该函数能正常工作（提示：我们已经学到过的一个方法很适合用在这里）！

```js
function copyMachine(arr, num) {
  let newArr = [];
  while (num >= 1) {
    // 只修改这一行下面的代码
    newArr.push([...arr]);
    // 只修改这一行上面的代码
    num--;
  }
  return newArr;
}

console.log(copyMachine([true, false, true], 2));
```

### 使用展开运算符合并数组

展开语法（spread）的另一个重要用途是合并数组，或者将某个数组的所有元素插入到另一个数组的任意位置。 我们也可以使用 ES5 的语法连接两个数组，但只能让它们首尾相接。 而展开语法可以让这样的操作变得极其简单：

```js
let thisArray = ['sage', 'rosemary', 'parsley', 'thyme'];

let thatArray = ['basil', 'cilantro', ...thisArray, 'coriander'];
```

`thatArray` 会有值 `['basil', 'cilantro', 'sage', 'rosemary', 'parsley', 'thyme', 'coriander']`


使用展开语法，我们就可以很方便的实现一个用传统方法会写得很复杂且冗长的操作。

------

我们已经定义了一个返回 `sentence` 变量的 `spreadOut` 函数。 请修改这个函数，利用 spread 使该函数返回数组 `['learning', 'to', 'code', 'is', 'fun']`。

```js
function spreadOut() {
  let fragment = ['to', 'code'];
  let sentence = ['learning', ...fragment, 'is', 'fun']; // 修改这一行
  return sentence;
}

console.log(spreadOut());
```

### 使用 indexOf() 检查元素是否存在

由于数组随时都可以修改或发生 *mutated*，我们很难保证某个数据始终处于数组中的特定位置，甚至不能保证该元素是否还存在于该数组中。 好消息是，JavaScript 为我们提供了内置方法 `indexOf()`。 这个方法让我们可以方便地检查某个元素是否存在于数组中。 `indexOf()` 方法接受一个元素作为输入参数，并返回该元素在数组中的位置（索引）；若该元素不存在于数组中则返回 `-1`。

例如：

```js
let fruits = ['apples', 'pears', 'oranges', 'peaches', 'pears'];

fruits.indexOf('dates');
fruits.indexOf('oranges');
fruits.indexOf('pears');
```

`indexOf('dates')` 返回 `-1`，`indexOf('oranges')` 返回 `2`，`indexOf('pears')` 返回 `1` (每个元素存在的第一个索引)。

------

`indexOf()` 在快速检查一个数组中是否存在某个元素时非常有用。 我们已经定义了一个 `quickCheck` 函数，它接受一个数组和一个元素作为输入参数。 请通过 `indexOf()` 方法修改这个函数，使得当传入的参数在数组中存在时返回 `true`，否则返回 `false`。

```js
function quickCheck(arr, elem) {
  // 只修改这一行下面的代码
  if (arr.indexOf(elem) == -1) {
    return false;
  } else {
    return true;
  }
  // 只修改这一行上面的代码
}

console.log(quickCheck(['squash', 'onions', 'shallots'], 'mushrooms'));
```

### 使用 for 循环遍历数组中的全部元素

使用数组时，我们经常需要遍历数组的所有元素来找出我们需要的一个或多个元素，抑或是对数组执行一些特定的操作。 JavaScript 为我们提供了几个内置的方法，它们以不同的方式遍历数组，以便我们可以用于不同的场景（如 `every()`、`forEach()`、`map()` 等等）。 然而，最简单的 `for` 循环不仅能实现上述这些方法的功能，而且相比之下也会更加灵活。

请看以下的例子：

```js
function greaterThanTen(arr) {
  let newArr = [];
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] > 10) {
      newArr.push(arr[i]);
    }
  }
  return newArr;
}

greaterThanTen([2, 12, 8, 14, 80, 0, 1]);
```

在这个函数中，我们用一个 `for` 循环来遍历数组，逐一对其中的元素进行判断。 通过上面的代码，我们可以找出数组中大于 `10` 的所有元素，并返回一个包含这些元素的新数组 `[12, 14, 80]`。

------

我们已经定义了 `filteredArray` 函数，它接受一个嵌套的数组 `arr` 和一个 `elem` 作为参数，并要返回一个新数组。 `arr` 数组中嵌套的数组里可能包含 `elem` 元素，也可能不包含。 请修改该函数，用一个 `for` 循环来做筛选，使函数返回一个由 `arr` 中不包含 `elem` 的数组所组成的新数组。

```js
function filteredArray(arr, elem) {
  let newArr = [];
  // 只修改这一行下面的代码
  for (let i = 0; i < arr.length; i++) {
    if (arr[i].indexOf(elem) == -1) {
      newArr.push(arr[i]);
    }
  }
  // 只修改这一行上面的代码
  return newArr;
}

console.log(filteredArray([[3, 2, 3], [1, 6, 3], [3, 13, 26], [19, 3, 9]], 3));
```

### 创建复杂的多维数组

很好！ 你现在已经学到很多关于数组的知识了， 但这些只是个开始。我们将在接下来的中挑战中学到更多与数组相关的知识。 在继续学习对象（Objects）之前，让我们再花一点时间了解下更复杂的数组嵌套。

数组的一个强大的特性是，它可以包含其他数组，甚至完全由其他数组组成。 在上一个挑战中，我们已经接触到了包含数组的数组，但它还算是比较简单的。 数组中的数组还可以再包含其他数组，即可以嵌套任意多层数组。 通过这种方式，数组可以很快成为非常复杂的数据结构，称为多维（multi-dimensional）数组，或嵌套（nested）数组。 请看如下的示例：

```js
let nestedArray = [
  ['deep'],
  [
    ['deeper'], ['deeper'] 
  ],
  [
    [
      ['deepest'], ['deepest']
    ],
    [
      [
        ['deepest-est?']
      ]
    ]
  ]
];
```

`deep` 数组已嵌套 2 层。 `deeper` 数组嵌套了 3 层。 `deepest` 数组嵌套了 4 层， `deepest-est?` 嵌套了 5 层。

虽然这个例子看起来错综复杂，不过，尤其是在处理大量数据的时候，这种数据结构还是会用到的。 尽管结构复杂，不过我们仍可以通过方括号表示法来访问嵌套得最深的数组：

```js
console.log(nestedArray[2][1][0][0][0]);
```

控制台打印的是字符串 `deepest-est?`。 既然我们知道数据的位置，当然，我们也可以修改它：

```js
nestedArray[2][1][0][0][0] = 'deeper still';

console.log(nestedArray[2][1][0][0][0]);
```

现在控制台打印的是 `deeper still`。

------

我们已经定义了一个叫做 `myNestedArray` 的数组变量。 请修改 `myNestedArray`，使用字符串（string）、数字（number）或布尔值（boolean）的任意组合作为数组的元素，并让 myNestedArray 刚好有 5 层（注意，最外层的数组是第 1 层）。 同时，请在第 3 层的数组中包含字符串 `deep`；在第 4 层的数组中包含字符串 `deeper`，在第 5 层的数组中包含字符串 `deepest`。

```js
let myNestedArray = [
  // 只修改这一行下面的代码
  ['unshift', false, 1, 2, 3, 'complex', 'nested'],
  ['loop', 'shift', 6, 7, 1000, 'method'],
  ['concat', false, true, 'spread', 'array'],
  ['mutate', 1327.98, 'splice', 'slice', 'push'],
  ['iterate', 1.3849, 7, '8.4876', 'arbitrary', 'depth'],
  [
    [
      'deep',
      [
        'deeper',
        [
          'deepest'
        ]
      ]
    ]
  ]
  // 只修改这一行上面的代码
];
```

## 对象

### 将键值对添加到对象中

对象（object）本质上是键值对（key-value pair）的集合。 或者说，一系列被映射到唯一标识符的数据就是对象；习惯上，唯一标识符叫做属性（property）或者键（key）；数据叫做值（value）。 让我们来看一个简单的例子：

```js
const tekkenCharacter = {
  player: 'Hwoarang',
  fightingStyle: 'Tae Kwon Doe',
  human: true
};
```

上面的代码定义了一个叫做 `tekkenCharacter` 的“铁拳”游戏人物对象。 它有三个属性，每个属性都对应一个特定的值。 如果我们想为它再添加一个叫做 `origin` 的属性，可以这样写：

```js
tekkenCharacter.origin = 'South Korea';
```

上面的代码中，我们使用了点号表示法。 如果我们现在输出 `tekkenCharacter` 对象，便可以看到它具有 `origin` 属性。 接下来，因为这个人物在游戏中有着与众不同的橘色头发， 我们可以通过方括号表示法来为它添加这个属性，像这样：

```js
tekkenCharacter['hair color'] = 'dyed orange';
```

如果要设置的属性中存在空格，或者要设置的属性是一个变量，那我们必须使用方括号表示法（bracket notation）来为对象添加属性。 在上面的代码中，我们把属性（hair color）放到引号里，以此来表示整个字符串都是需要设置的属性。 如果我们不加上引号，那么中括号里的内容会被当作一个变量来解析，这个变量对应的值就会作为要设置的属性， 请看这段代码：

```js
const eyes = 'eye color';

tekkenCharacter[eyes] = 'brown';
```

执行以上所有示例代码后，对象会变成这样：

```js
{
  player: 'Hwoarang',
  fightingStyle: 'Tae Kwon Doe',
  human: true,
  origin: 'South Korea',
  'hair color': 'dyed orange',
  'eye color': 'brown'
};
```

------

我们已经为你创建了包含三个项目的 `foods` 对象。 请使用上述任意语法，来为 foods 对象添加如下三个键值对：`bananas` 属性，值为 `13`；`grapes` 属性，值为 `35`；`strawberries` 属性，值为 `27`。

```js
let foods = {
  apples: 25,
  oranges: 32,
  plums: 28
};

// 只修改这一行下面的代码
foods.bananas = 13;
foods.grapes = 35;
foods.strawberries = 27;
// 只修改这一行上面的代码

console.log(foods);
```

### 修改嵌套在对象中的对象

现在我们来看一个稍复杂的对象。 在对象中，我们也可以嵌套任意层数的对象，对象的属性值可以是 JavaScript 支持的任意类型，包括数组和其他对象。 请看以下例子：

```js
let nestedObject = {
  id: 28802695164,
  date: 'December 31, 2016',
  data: {
    totalUsers: 99,
    online: 80,
    onlineStatus: {
      active: 67,
      away: 13,
      busy: 8
    }
  }
};
```

`nestedObject` 有 3 个属性：`id`（属性值为数字）、`date`（属性值为字符串）、`data`（属性值为嵌套的对象）。 虽然对象中的数据可能很复杂，我们仍能使用上一个挑战中讲到的写法来访问我们需要的信息。 如果我们想把嵌套在 `onlineStatus` 中 `busy` 的属性值改为 `10`，可以用点号表示法来这样实现：

```js
nestedObject.data.onlineStatus.busy = 10;
```

------

我们已经定义了一个 `userActivity` 对象，它包含了另一个对象。 请将 `online` 的属性值改为 `45`。

```js
let userActivity = {
  id: 23894201352,
  date: 'January 1, 2017',
  data: {
    totalUsers: 51,
    online: 42
  }
};

// 只修改这一行下面的代码
userActivity.data.online = 45;
// 只修改这一行上面的代码

console.log(userActivity);
```

### 使用方括号访问属性名称

在关于对象的第一个挑战中，我们提到可以在一对方括号中用一个变量作为属性名来访问属性的值。 假设一个超市收银台程序中有一个 `foods`对象, 并且有一个函数会设置 `selectedFood`；如果我们需要查询 `foods` 对象中，某种食物是否存在， 可以这样实现：

```js
let selectedFood = getCurrentFood(scannedItem);
let inventory = foods[selectedFood];
```

上述代码会先读取 `selectedFood` 变量的值，并返回 `foods` 对象中以该值命名的属性所对应的属性值。 若没有以该值命名的属性，则会返回 `undefined`。 有时候对象的属性名在运行之前是不确定的，或者我们需要动态地访问对象的属性值。在这些场景下，方括号表示法就变得十分有用。

------

我们已经定义了 `checkInventory` 函数，它接受一个被扫描到的商品名作为输入参数。 请让这个函数返回 `foods` 对象中，以 `scannedItem` 的值所命名的属性对应的属性值。 在本挑战中，只有合理有效的属性名会作为参数传入 `checkInventory`，因此你不需要处理参数无效的情况。

```js
let foods = {
  apples: 25,
  oranges: 32,
  plums: 28,
  bananas: 13,
  grapes: 35,
  strawberries: 27
};

function checkInventory(scannedItem) {
  // 只修改这一行下面的代码
  return foods[scannedItem];
  // 只修改这一行上面的代码
}

console.log(checkInventory("apples"));
```

### 使用 delete 关键字删除对象属性

现在我们已经学习了什么是对象以及对象的基本特性和用途。 总之，对象是以键值对的形式，灵活、直观地存储结构化数据的一种方式，***而且***，通过对象的属性查找属性值是速度很快的操作。 在本章余下的挑战中，我们来了解一下对象的几种常用操作，这样你能更好地在代码中使用这个十分有用的数据结构：对象。

在之前的挑战中，我们已经试过添加和修改对象中的键值对。 现在我们来看看如何从一个对象中*移除*一个键值对。

我们再来回顾一下上一个挑战中的 `foods` 对象。 如果我们想移除 `apples` 属性，可以像这样使用 `delete` 关键字：

```js
delete foods.apples;
```

------

请使用 delete 关键字来移除 `foods` 中的 `oranges`、`plums` 和 `strawberries` 属性。

```js
let foods = {
  apples: 25,
  oranges: 32,
  plums: 28,
  bananas: 13,
  grapes: 35,
  strawberries: 27
};

// 只修改这一行下面的代码
delete foods.oranges;
delete foods.plums;
delete foods.strawberries;
// 只修改这一行上面的代码

console.log(foods);
```

### 检查对象是否具有某个属性

我们已经学习了如何添加、修改和移除对象中的属性。 但如果我们想知道一个对象中是否包含某个属性呢？ JavaScript 为我们提供了两种不同的方式来实现这个功能： 一个是通过 `hasOwnProperty()` 方法，另一个是使用 `in` 关键字。 假如我们有一个 `users` 对象，为检查它是否含有 `Alan` 属性，可以这样写：

```js
users.hasOwnProperty('Alan');
'Alan' in users;
```

这两者结果都应该为 `true`。

------

请完善这个函数，如果传递给它的对象包含四个名字 `Alan`、`Jeff`、`Sarah` 和 `Ryan`，函数返回 `true`，否则返回 `false`。

```js
let users = {
  Alan: {
    age: 27,
    online: true
  },
  Jeff: {
    age: 32,
    online: true
  },
  Sarah: {
    age: 48,
    online: true
  },
  Ryan: {
    age: 19,
    online: true
  }
};

function isEveryoneHere(userObj) {
  // 只修改这一行下面的代码
  if (userObj.hasOwnProperty('Alan') && userObj.hasOwnProperty('Jeff') && userObj.hasOwnProperty('Sarah') && userObj.hasOwnProperty('Ryan')) {
    return true;
  } else {
    return false;
  }
  // 只修改这一行上面的代码
}

console.log(isEveryoneHere(users));
```

### 使用 for...in 语句遍历对象

如果我们想要遍历对象中的所有属性， 只需要使用 JavaScript 中的 for...in 语句即可。 以遍历 `users` 对象的属性为例：

```js
for (let user in users) {
  console.log(user);
}
```

这将在控制台打印 `Alan`、`Jeff`、`Sarah` 和 `Ryan` - 每个值占一行。

在上面的代码中，我们定义了一个 `user` 变量。 可以观察到，这个变量在遍历对象的语句执行过程中会一直被重置并赋予新值，结果就是不同的用户名打印到了 console 中。

**注意：**对象中的键是无序的，这与数组不同。 因此，一个对象中某个属性的位置，或者说它出现的相对顺序，在引用或访问该属性时是不确定的。

------

我们已经定义了一个 `countOnline` 函数，它接收一个 users 对象参数。 请在其中使用 for...in 语句来遍历传入函数的 users 对象中的用户，并返回 `online` 属性为 `true` 的用户数量。 以下是一个传入 `countOnline`函数的对象示例， 注意每个用户都有 `online` 属性，其属性值为 `true`或 `false`：

```js
{
  Alan: {
    online: false
  },
  Jeff: {
    online: true
  },
  Sarah: {
    online: false
  }
}
```

```js
const users = {
  Alan: {
    online: false
  },
  Jeff: {
    online: true
  },
  Sarah: {
    online: false
  }
}

function countOnline(usersObj) {
  // 只修改这一行下面的代码
  let result = 0;
  for (let user in usersObj) {
      // 注意： if (user.online) 的写法是错误的
    if (usersObj[user].online) {
      result++;
    }
  }
  return result;
  // 只修改这一行上面的代码
}

console.log(countOnline(users));
```

### 使用 Object.keys() 生成由对象的所有属性组成的数组

我们可以给 `Object.keys()` 方法传入一个对象作为参数，来生成包含对象所有键的数组。 这会返回一个由对象中所有属性（字符串）组成的数组。 需要注意的是，数组中元素的顺序是不确定的。

------

请完成 `getArrayOfUsers` 函数的实现，使其返回一个由输入对象中的所有属性所组成的数组。

```js
let users = {
  Alan: {
    age: 27,
    online: false
  },
  Jeff: {
    age: 32,
    online: true
  },
  Sarah: {
    age: 48,
    online: false
  },
  Ryan: {
    age: 19,
    online: true
  }
};

function getArrayOfUsers(obj) {
  // 只修改这一行下面的代码
  return Object.keys(obj);
  // 只修改这一行上面的代码
}

console.log(getArrayOfUsers(users));
```

### 修改存储在对象中的数组

我们已经学习了 JavaScript 对象的这些基本操作： 添加、修改、移除键值对、检查某个属性是否存在、遍历对象的所有属性。 在继续学习 JavaScript 的过程中，我们会了解对象的更多用法。 另外，在之后的数据结构课程中，我们还会学习 ES6 的 Map 和 Set。 这两种数据结构与我们现在学到的对象十分类似，但它们在对象的基础上提供了一些额外的功能。 目前，我们已经学习了数组和对象的基础知识，让我们试着来用所学的知识解决一些更复杂的问题。

------

请看一下代码编辑器中我们为你写好的对象。 `user` 对象包含 3 个属性； `data` 对象包含 5 个属性，其中包含一个叫做 `friends` 的数组。 这就是对象作为数据结构所展现出的灵活性。 我们已经写好了 `addFriend` 函数的一部分， 请你完成这个函数，使其接受一个 `user`对象，将 `friend` 参数中的名字添加到 `user.data.friends` 数组中并返回该数组。

```js
let user = {
  name: 'Kenneth',
  age: 28,
  data: {
    username: 'kennethCodesAllDay',
    joinDate: 'March 26, 2016',
    organization: 'freeCodeCamp',
    friends: [
      'Sam',
      'Kira',
      'Tomo'
    ],
    location: {
      city: 'San Francisco',
      state: 'CA',
      country: 'USA'
    }
  }
};

function addFriend(userObj, friend) {
  // 只修改这一行下面的代码
  userObj.data.friends.push(friend);
  return userObj.data.friends;
  // 只修改这一行上面的代码
}

console.log(addFriend(user, 'Pete'));
```

