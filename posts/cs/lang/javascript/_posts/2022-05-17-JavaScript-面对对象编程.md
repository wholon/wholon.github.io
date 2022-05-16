# JavaScript面对对象编程

OOP，即面向对象编程，是软件开发过程的主要方法之一。在 OOP 中，我们用对象和类来组织代码，以描述事物的特点以及它们可以做什么。

在本文中，你将会学习 JavaScript 中面向对象编程的基本原则，例如 `this` 关键词、原型链、构造器和继承。

<!--more-->

## 创建一个基本的 JavaScript 对象

想想我们在生活中每天都可见到的事物：比如汽车、商店以及小鸟等。 它们都是对象：即人们可以观察和与之互动的实体事物。

这些物体的性质是什么？ 汽车有轮子。 商店销售物品。 鸟儿有翅膀。

这些特征，或者说是属性定义了一个对象由什么构成的。 需要注意的是：那些相似的对象可以拥有相同的属性，但是这些属性可能会有不同的值。 举个例子：所有的汽车都有轮子，但并不是所有汽车的轮子个数都是一样的。

JavaScript 中的对象可以用来描述现实世界中的物体，并赋予他们属性和行为，就像它们在现实世界中的对应物一样。 下面是使用这些概念来创建一个 `duck` 对象的示例：

```js
let duck = {
  name: "Aflac",
  numLegs: 2
};
```

这个 `duck` 对象有两组键值对：一个是 `name` 属性，它的值是 `Aflac`；另一个是 `numLegs` 属性，它的值是 2。

------

创建一个 `dog` 对象，并给这个对象添加两个属性：`name` 和 `numLegs`，同时把这两个属性的值分别设为字符串和数字。

```js
let dog = {
  name: "Puppy",
  numLegs: 2
};
```

## 使用点符号来访问对象的属性

最后一个挑战创建了一个具有各种属性的对象。 现在你会看到如何访问这些属性的值。 下面是一个示例：

```js
let duck = {
  name: "Aflac",
  numLegs: 2
};
console.log(duck.name);
```

我们可以用“点号表示法”来访问对象的属性，`duck` 后面加上点号以及属性名 `name`，来访问到 `Aflac`。

------

请在控制台里面输出 `dog` 对象中两个属性的值。

```js
let dog = {
  name: "Spot",
  numLegs: 4
};
// 只修改这一行下面的代码
console.log(dog.name);
console.log(dog.numLegs);
```

## 在对象上创建方法

对象可以有一个叫做 method 的特殊属性。

方法属性也就是函数。 这给对象添加了不同的行为。 以下就是一个带有方法属性的 `duck` 示例：

```js
let duck = {
  name: "Aflac",
  numLegs: 2,
  sayName: function() {return "The name of this duck is " + duck.name + ".";}
};
duck.sayName();
```

示例添加了 `sayName` 方法，函数返回包含 `duck` 名字的一个句子。 注意：这个方法在返回语句中使用 `duck.name` 的方式来获取 `name` 的属性值。 在下一个挑战中我们将会使用另外一种方法来实现。

------

给 `dog` 对象设置一个名为 `sayLegs` 的方法。 并让它返回 `This dog has 4 legs.` 这句话。

```js
let dog = {
  name: "Spot",
  numLegs: 4,
  sayLegs: function() {
    return `This dog has ${this.numLegs} legs.`;
  }
};

dog.sayLegs();
```

## 使用 this 关键字提高代码重用性

在上一个挑战中我们了解了该如何给 `duck` 对象设置一个方法。 然后在 return 语句里，我们通过使用 “点号表示法” `duck.name` 来获取 `name` 的属性值：

```js
sayName: function() {return "The name of this duck is " + duck.name + ".";}
```

虽然这是访问对象属性的有效方法，但是这里有一个陷阱。 如果变量名发生了改变，那么引用了原始名称的任何代码都需要更新。 在一个简短的对象定义中，这并不是问题，但是如果对象有很多对其属性的引用，那么发生错误的可能性就更大了。

我们可以使用 `this` 关键字来避免这一问题：

```js
let duck = {
  name: "Aflac",
  numLegs: 2,
  sayName: function() {return "The name of this duck is " + this.name + ".";}
};
```

`this` 是一个很复杂的知识点，而上面那个例子也只是使用它的一种方法而已。 在当前的上下文环境中，`this` 指向的就是与这个方法有关联的 `duck` 对象。 如果把对象的变量名改为 `mallard`，那使用 this 后就没有必要在代码中找到所有指向 `duck` 的部分。 这样可以使得代码更具有可读性和复用性。

------

修改 `dog.sayLegs` 方法，以将所有直接对 `dog` 的引用删除。 可以参考上面 `duck` 的例子。

```js
let dog = {
  name: "Spot",
  numLegs: 4,
  sayLegs: function() {return "This dog has " + this.numLegs + " legs.";}
};

dog.sayLegs();
```

## 定义构造函数

Constructors 是创建对象的函数。 函数给这个新对象定义属性和行为。 可将它们视为创建的新对象的蓝图。

以下就是一个构造函数的示例：

```js
function Bird() {
  this.name = "Albert";
  this.color = "blue";
  this.numLegs = 2;
}
```

这个构造函数定义了一个 `Bird` 对象，其属性 `name`、`color` 和 `numLegs` 的值分别被设置为 Albert、blue 和 2。 构造函数遵循一些惯例规则：

- 构造函数函数名的首字母大写，这是为了方便我们区分构造函数（ `constructors`）和其他非构造函数。
- 构造函数使用 `this` 关键字来给它将创建的这个对象设置新的属性。 在构造函数里面，`this` 指向的就是它新创建的这个对象。
- 构造函数定义了属性和行为就可创建对象，而不是像其他函数一样需要设置返回值。

------

创建一个构造函数：`Dog`。 给其添加 `name`，`color` 和 `numLegs` 属性并分别给它们设置为：字符串、字符串和数字。

```js
function Dog() {
  this.name = "Puppy";
  this.color = "white";
  this.numLegs = 4;
}
```

## 使用构造函数创建对象

在上一个挑战中，我们用所学到的知识创建了一个 `Bird` 构造函数：

```js
function Bird() {
  this.name = "Albert";
  this.color  = "blue";
  this.numLegs = 2;
}

let blueBird = new Bird();
```

**注意：** 构造函数内的 `this` 总是指被创建的对象。

注意：通过构造函数创建对象的时候要使用 `new` 操作符。 因为只有这样，JavaScript 才知道要给 `Bird` 这个构造函数创建一个新的实例：`blueBird`。 如果不使用 `new` 操作符来新建对象，那么构造函数里面的 `this` 就无法指向新创建的这个对象实例，从而产生不可预见的错误。 现在 `blueBird` 这个实例就继承了`Bird` 构造函数的所有属性，如下：

```js
blueBird.name;
blueBird.color;
blueBird.numLegs;
```

由构造函数创建的实例也和其他对象一样，它的属性可以被访问和修改：

```js
blueBird.name = 'Elvira';
blueBird.name;
```

------

使用上一个挑战中的 `Dog` 构造函数创建一个 `Dog` 的新实例，并把它赋值给变量 `hound`。

```js
function Dog() {
  this.name = "Rupert";
  this.color = "brown";
  this.numLegs = 4;
}
// 只修改这一行下面的代码
let hound = new Dog();
```

## 扩展构造函数以接收参数

上一个挑战中 `Bird` 和 `Dog` 构造函数运行得不错。 但是，注意到没有：所有通过`Bird`构造函数创建出来的实例 `Birds` 都自动的取名为 Albert，颜色都是蓝色，还都有两条腿。 如果你想要新创建出来的小鸟们拥有不同的名字和颜色要怎么办呢？ 当然，手动的去修改每一个小鸟实例自己的属性也是可以实现的，只是会增加很多无谓的工作量：

```js
let swan = new Bird();
swan.name = "Carlos";
swan.color = "white";
```

假如你写了一个程序来追踪一个鸟舍里面的几百只甚至几千只不同的小鸟。 你将会花费很多时间去创建所有的小鸟实例并给它们的属性一一修改为不同的值。 为了减轻创建不同 `Bird` 对象的工作量，你可以给你的 Bird 设置为可以接收参数的构造函数：

```js
function Bird(name, color) {
  this.name = name;
  this.color = color;
  this.numLegs = 2;
}
```

然后将值通过参数的方式传递给 `Bird` 构造函数来定义每一个唯一的小鸟实例： `let cardinal = new Bird("Bruce", "red");` 这给 `Bird` 的 `name` 和 `color` 属性分别赋值为 `Bruce` 和 `red` 色。 但 `numLegs` 属性仍然设置为 2。 `cardinal` 有以下这些属性：

```js
cardinal.name
cardinal.color
cardinal.numLegs
```

这样一来构造函数就变得很灵活了。 现在可以在创建每个`Bird`实例时直接定义属性，这是 JavaScript 构造函数非常实用的用法之一。 它们根据共同或相似的属性和行为将对象归纳为一组，并能够自动的创建各自实例。

------

创建另一个 `Dog` 构造函数。 这一次，给它设置两个参数：`name` 和 `color`，同时给 `numLegs` 赋值为 4。 然后创建一个新 `Dog` 实例保存为变量名：`terrier`。 再将两个字符串通过参数的形式传入`name` 和 `color` 属性。

```js
function Dog(name, color) {
  this.name = name;
  this.color = color;
  this.numLegs = 4;
}

let terrier = new Dog("Puppy", "white");
```

## 使用 instanceof 验证对象的构造函数

凡是通过构造函数创建出的新对象，这个对象都叫做这个构造函数的 实例。 JavaScript 提供了一种很简便的方法来验证这个事实，那就是通过 `instanceof` 操作符。 `instanceof` 允许你将对象与构造函数之间进行比较，根据对象是否由这个构造函数创建的返回 `true` 或者 `false`。 以下是一个示例：

```js
let Bird = function(name, color) {
  this.name = name;
  this.color = color;
  this.numLegs = 2;
}

let crow = new Bird("Alexis", "black");

crow instanceof Bird;
```

`instanceof` 方法会返回 `true`.

如果一个对象不是使用构造函数创建的，那么 `instanceof` 将会验证这个对象不是构造函数的实例：

```js
let canary = {
  name: "Mildred",
  color: "Yellow",
  numLegs: 2
};

canary instanceof Bird;
```

`instanceof` 方法会返回 `false`。

------

给 `House` 构造函数创建一个新实例，取名为 `myHouse` 并且传递一个数字给 bedrooms 参数。 然后使用 `instanceof` 操作符验证这个对象是否为 `House` 的实例。

```js
function House(numBedrooms) {
  this.numBedrooms = numBedrooms;
}

// 只修改这一行下面的代码
let myHouse = new House(4);

myHouse instanceof House;
```

## 了解自有属性

请看下面的实例，`Bird` 构造函数定义了两个属性：`name` 和 `numLegs`：

```js
function Bird(name) {
  this.name = name;
  this.numLegs = 2;
}

let duck = new Bird("Donald");
let canary = new Bird("Tweety");
```

`name` 和 `numLegs` 被叫做 自身属性，因为它们是直接在实例对象上定义的。 这就意味着 `duck` 和 `canary` 这两个对象分别拥有这些属性的独立副本。 事实上，`Bird` 的所有实例都将拥有这些属性的独立副本。 下面的代码将 `duck` 的所有自身属性都存到一个叫作 `ownProps` 的数组里面：

```js
let ownProps = [];

for (let property in duck) {
  if(duck.hasOwnProperty(property)) {
    ownProps.push(property);
  }
}

console.log(ownProps);
```

控制台将显示值 `["name", "numLegs"]`。

------

将 `canary` 的自身属性添加到 `ownProps` 数组里面。

```js
function Bird(name) {
  this.name = name;
  this.numLegs = 2;
}

let canary = new Bird("Tweety");
let ownProps = [];
// 只修改这一行下面的代码
for (let property in canary) {
  if (canary.hasOwnProperty(property)) {
    ownProps.push(property);
  }
}
```

## 使用原型属性来减少重复代码

所有 `Bird` 实例可能会有相同的 `numLegs` 值，所以在每一个 `Bird` 的实例中本质上都有一个重复的变量 `numLegs`。

当只有两个实例时可能并不是什么问题，但想象一下如果有数百万个实例。 这将会产生许许多多重复的变量。

更好的方法是使用 `Bird` 的 `prototype`。 `prototype` 是一个可以在所有 `Bird` 实例之间共享的对象。 以下是一个在 `Bird prototype` 中添加 `numLegs` 属性的示例：

```js
Bird.prototype.numLegs = 2;
```

现在所有的 `Bird` 实例都拥有了共同的 `numLegs` 属性值。

```js
console.log(duck.numLegs);
console.log(canary.numLegs);
```

由于所有的实例都可以继承 `prototype` 上的属性，所以可以把 `prototype` 看作是创建对象的 "配方"。 请注意：`duck` 和 `canary` 的 `prototype` 属于 `Bird` 的构造函数，即 Bird 的原型 `Bird.prototype`。 JavaScript 中几乎所有的对象都有一个 `prototype`属性，这个属性是属于它所在的构造函数。

------

给 `Dog` 的 `prototype` 添加一个 `numLegs` 属性。

```js
function Dog(name) {
  this.name = name;
}

Dog.prototype.numLegs = 2;

// 只修改这一行上面的代码
let beagle = new Dog("Snoopy");
```

## 迭代所有属性

现在你已经了解了两种属性: 自身属性和 `prototype` 属性。 自身属性是直接在对象上定义的。 而原型属性在 `prototype` 上定义。

```js
function Bird(name) {
  this.name = name;  //own property
}

Bird.prototype.numLegs = 2; // prototype property

let duck = new Bird("Donald");
```

这个示例会告诉你如何将 `duck` 的自身属性和 `prototype` 属性分别添加到 `ownProps` 数组和 `prototypeProps` 数组里面：

```js
let ownProps = [];
let prototypeProps = [];

for (let property in duck) {
  if(duck.hasOwnProperty(property)) {
    ownProps.push(property);
  } else {
    prototypeProps.push(property);
  }
}

console.log(ownProps);
console.log(prototypeProps);
```

`console.log(ownProps)` 将在控制台中显示 `["name"]` ，`console.log(prototypeProps)` 将显示 `["numLegs"]`。

------

将 `beagle` 的自身属性都添加到 `ownProps` 数组里面去。 将 `Dog` 中所有的 `prototype` 属性都添加到 `prototypeProps` 数组中。

```js
function Dog(name) {
  this.name = name;
}

Dog.prototype.numLegs = 4;

let beagle = new Dog("Snoopy");

let ownProps = [];
let prototypeProps = [];

// 只修改这一行下面的代码
for (let property in beagle) {
  if (beagle.hasOwnProperty(property)) {
    ownProps.push(property);
  } else {
    prototypeProps.push(property);
  }
}
```

## 了解构造函数属性

在上一个挑战中创建的实例对象 `duck` 和 `beagle` 都有一个特殊的 `constructor` 属性：

```js
let duck = new Bird();
let beagle = new Dog();

console.log(duck.constructor === Bird); 
console.log(beagle.constructor === Dog);
```

这两次 `console.log` 调用都将在控制台中显示 `true`。

需要注意到的是这个 `constructor` 属性是对创建这个实例的构造函数的一个引用。 `constructor` 属性的一个好处是可以通过检查这个属性来找出它是一个什么对象。 下面是一个例子，来看看是怎么使用的：

```js
function joinBirdFraternity(candidate) {
  if (candidate.constructor === Bird) {
    return true;
  } else {
    return false;
  }
}
```

**注意：** 由于 `constructor` 属性可以被重写（在下面两节挑战中将会遇到），所以最好使用`instanceof` 方法来检查对象的类型。

------

写一个 `joinDogFraternity` 函数，传入一个 `candidate` 参数并使用 `constructor` 属性来判断传入的 candidate 是不是 `Dog` 创建的对象实例，如果是，就返回 `true`，否则返回 `false`。

```js
function Dog(name) {
  this.name = name;
}

// 只修改这一行下面的代码
function joinDogFraternity(candidate) {
  if (candidate.constructor === Dog) {
    return true;
  } else {
    return false;
  }
}
```

## 将原型更改为新对象

到目前为止，你已经可以单独给 `prototype` 添加属性了：

```js
Bird.prototype.numLegs = 2;
```

需要添加多个属性的，这未免会显得拖沓。

```js
Bird.prototype.eat = function() {
  console.log("nom nom nom");
}

Bird.prototype.describe = function() {
  console.log("My name is " + this.name);
}
```

一种更有效的方法就是给对象的 `prototype` 设置为一个已经包含了属性的新对象。 这样一来，所有属性都可以一次性添加进来：

```js
Bird.prototype = {
  numLegs: 2, 
  eat: function() {
    console.log("nom nom nom");
  },
  describe: function() {
    console.log("My name is " + this.name);
  }
};
```

------

通过给 `prototype` 设置一个对象，在 `Dog` 构造函数的 `prototype` 上添加一个属性 `numLegs` 以及两个方法：`eat()` 和 `describe()`。

```js
function Dog(name) {
  this.name = name;
}

Dog.prototype = {
  // 只修改这一行下面的代码
  numLegs: 4,
  eat: function() {
    console.log("wow wow wow");
  },
  describe: function() {
    console.log(`My name is ${this.name}`);
  }
};
```

## 更改原型时，记得设置构造函数属性

手动设置一个新对象的原型有一个重要的副作用。 它清除了 `constructor` 属性！ 此属性可以用来检查是哪个构造函数创建了实例，但由于该属性已被覆盖，它现在给出了错误的结果：

```js
duck.constructor === Bird;
duck.constructor === Object;
duck instanceof Bird;
```

按顺序，这些表达式会返回 `false`、`true` 和 `true`。

为了解决这个问题，凡是手动给新对象重新设置过原型对象的，都别忘记在原型对象中定义一个 `constructor` 属性：

```js
Bird.prototype = {
  constructor: Bird,
  numLegs: 2,
  eat: function() {
    console.log("nom nom nom");
  },
  describe: function() {
    console.log("My name is " + this.name); 
  }
};
```

------

给 `Dog` 的 `prototype` 对象定义一个 `constructor` 属性。

```js
function Dog(name) {
  this.name = name;
}

// 只修改这一行下面的代码
Dog.prototype = {
  constructor: Dog,
  numLegs: 4,
  eat: function() {
    console.log("nom nom nom");
  },
  describe: function() {
    console.log("My name is " + this.name);
  }
};
```

## 了解对象的原型来自哪里

就像人们从父母那里继承基因一样，对象也可直接从创建它的构造函数那里继承其 `prototype`。 请看下面的例子：`Bird` 构造函数创建了一个 `duck` 对象：

```js
function Bird(name) {
  this.name = name;
}

let duck = new Bird("Donald");
```

`duck` 从 `Bird` 构造函数那里继承了它的 `prototype`。 你可以使用 `isPrototypeOf` 方法来验证他们之间的关系：

```js
Bird.prototype.isPrototypeOf(duck);
```

这将返回 `true`。

------

使用 `isPrototypeOf` 方法验证 `beagle` 的 `prototype`。

```js
function Dog(name) {
  this.name = name;
}

let beagle = new Dog("Snoopy");

// 只修改这一行下面的代码
Dog.prototype.isPrototypeOf(beagle);
```

## 了解原型链

JavaScript 中所有的对象（除了少数例外）都有自己的 `prototype`。 而且，对象的 `prototype` 本身也是一个对象。

```js
function Bird(name) {
  this.name = name;
}

typeof Bird.prototype;
```

正因为 `prototype` 是一个对象，所以 `prototype` 对象也有它自己的 `prototype`！ 这样看来的话，`Bird.prototype` 的 `prototype` 就是 `Object.prototype`：

```js
Object.prototype.isPrototypeOf(Bird.prototype);
```

这有什么作用呢？ 你可能还记得我们在上一个挑战中学到的 `hasOwnProperty` 方法：

```js
let duck = new Bird("Donald");
duck.hasOwnProperty("name");
```

`hasOwnProperty` 是定义在 `Object.prototype` 上的一个方法，尽管在 `Bird.prototype` 和 `duck`上并没有定义该方法，但是我们依然可以在这两个对象上访问到。 这就是 `prototype` 链的一个例子。 在这个`prototype` 链中，`Bird` 是 `duck` 的 `supertype`，而 `duck` 是 `subtype`。 `Object` 则是 `Bird` 和 `duck` 实例共同的 `supertype`。 `Object` 是 JavaScript 中所有对象的 `supertype`，也就是原型链的最顶层。 因此，所有对象都可以访问 `hasOwnProperty` 方法。

------

修改以下代码使其展示出正确的原型链。

```js
function Dog(name) {
  this.name = name;
}

let beagle = new Dog("Snoopy");

Dog.prototype.isPrototypeOf(beagle);  // 输出 true

// 修改下方代码，使其结果为 true
Object.prototype.isPrototypeOf(Dog.prototype);
```

## 使用继承避免重复

有一条原则叫做：Don't Repeat Yourself。常以缩写形式 DRY 出现，意思是“不要自己重复”。 编写重复代码会产生的问题是：任何改变都需要去多个地方修复所有重复的代码。 这通常意味着我们需要做更多的工作，会产生更高的出错率。

请观察下面的示例，`Bird` 和 `Dog` 共享 `describe` 方法：

```js
Bird.prototype = {
  constructor: Bird,
  describe: function() {
    console.log("My name is " + this.name);
  }
};

Dog.prototype = {
  constructor: Dog,
  describe: function() {
    console.log("My name is " + this.name);
  }
};
```

我们可以看到 `describe` 方法在两个地方重复定义了。 根据以上所说的 DRY 原则，我们可以通过创建一个 `Animal` `supertype`（或者父类）来重写这段代码：

```js
function Animal() { };

Animal.prototype = {
  constructor: Animal, 
  describe: function() {
    console.log("My name is " + this.name);
  }
};
```

`Animal` 构造函数中定义了 `describe` 方法，可将 `Bird` 和 `Dog` 这两个构造函数的方法删除掉：

```js
Bird.prototype = {
  constructor: Bird
};

Dog.prototype = {
  constructor: Dog
};
```

------

`Cat` 和 `Bear` 重复定义了 `eat` 方法。 本着 DRY 的原则，通过将 `eat`方法移动到 `Animal`的`supertype` 中来重写你的代码。

```js
function Cat(name) {
  this.name = name;
}

Cat.prototype = {
  constructor: Cat,
  eat: function() {
    console.log("nom nom nom");
  }
};

function Bear(name) {
  this.name = name;
}

Bear.prototype = {
  constructor: Bear,
  eat: function() {
    console.log("nom nom nom");
  }
};

function Animal() { }

Animal.prototype = {
  constructor: Animal,

};

// 修改后代码
function Cat(name) {
  this.name = name;
}

function Bear(name) {
  this.name = name;
}

function Animal() { }

Animal.prototype = {
  constructor: Animal,
  eat: function() {
    console.log("nom nom nom");
  }
};
```

## 从超类继承行为

在上一个挑战中，我们创建了一个`Animal` 超类（`supertype`），用来定义所有动物共有的行为：

```js
function Animal() { }
Animal.prototype.eat = function() {
  console.log("nom nom nom");
};
```

在这一节以及下一节挑战中我们将学习如何在 `Bird` 和 `Dog` 中重用 `Animal` 中的方法，而无需重新定义它们。 这里我们会用到构造函数的继承特性。 这一节挑战中我们学习第一步：创建一个超类 `supertype`（或者叫父类）的实例。 你已经学会了一种创建 `Animal` 实例的方法，即使用 `new` 操作符：

```js
let animal = new Animal();
```

此语法用于继承时会存在一些缺点，这些缺点对于当前我们这个挑战来说太复杂了。 相反，我们学习另外一种没有这些缺点的方法来替代 new 操作：

```js
let animal = Object.create(Animal.prototype);
```

`Object.create(obj)` 创建了一个新对象，并指定了 `obj` 作为新对象的 `prototype`。 回忆一下，我们之前说过 `prototype` 就像是创建对象的“配方”。 如果我们把 `animal` 的 `prototype` 设置为与 `Animal` 构造函数的 `prototype` 一样，那么就相当于让 `animal` 这个实例具有与 `Animal` 的其他实例相同的“配方”了。

```js
animal.eat();
animal instanceof Animal;
```

`instanceof` 方法会返回 `true`.

------

使用 `Object.create` 方法给 `Animal` 创建两个实例：`duck` 和 `beagle`。

```js
function Animal() { }

Animal.prototype = {
  constructor: Animal,
  eat: function() {
    console.log("nom nom nom");
  }
};

// 只修改这一行下面的代码

let duck = Object.create(Animal.prototype); // 修改这一行
let beagle = Object.create(Animal.prototype); // 修改这一行
```

## 将子辈的原型设置为父辈的实例

在上一个挑战中，我们学习了从超类（或者叫父类） `Animal` 继承其行为的第一个步骤：创建一个 `Animal` 的新实例。

这一节挑战我们将学习第二个步骤：给子类型（或者子类）设置 `prototype`。 这样一来，`Bird` 就是 `Animal` 的一个实例了。

```js
Bird.prototype = Object.create(Animal.prototype);
```

请记住，`prototype` 类似于创建对象的“配方”。 从某种意义上来说，`Bird` 对象的配方包含了 `Animal` 的所有关键“成分”。

```js
let duck = new Bird("Donald");
duck.eat();
```

`duck` 继承了`Animal` 的所有属性，其中包括了 `eat` 方法。

------

修改你的代码，实现一个继承自 `Animal` 的 `Dog` 实例。

```js
function Animal() { }

Animal.prototype = {
  constructor: Animal,
  eat: function() {
    console.log("nom nom nom");
  }
};

function Dog() { }

// 只修改这一行下面的代码
Dog.prototype = Object.create(Animal.prototype);

let beagle = new Dog();
```

## 重置一个继承的构造函数属性

当一个对象从另一个对象那里继承了其 `prototype` 时，那它也继承了父类的 constructor 属性。

请看下面的举例：

```js
function Bird() { }
Bird.prototype = Object.create(Animal.prototype);
let duck = new Bird();
duck.constructor
```

但是 `duck` 和其他所有 `Bird` 的实例都应该表明它们是由 `Bird` 创建的，而不是由 `Animal` 创建的。 为此，你可以手动将 `Bird` 的构造函数属性设置为 `Bird` 对象：

```js
Bird.prototype.constructor = Bird;
duck.constructor
```

------

修改你的代码，使得 `duck.constructor` 和 `beagle.constructor` 返回各自的构造函数。

```js
function Animal() { }
function Bird() { }
function Dog() { }

Bird.prototype = Object.create(Animal.prototype);
Dog.prototype = Object.create(Animal.prototype);

// 只修改这一行下面的代码
Bird.prototype.constructor = Bird;
Dog.prototype.constructor = Dog;

let duck = new Bird();
let beagle = new Dog();
```

## 继承后添加方法

从超类构造函数继承其 `prototype` 对象的构造函数，除了继承的方法外，还可以拥有自己的方法。

请看举例：`Bird` 是一个构造函数，它继承了 `Animal` 的 `prototype`：

```js
function Animal() { }
Animal.prototype.eat = function() {
  console.log("nom nom nom");
};
function Bird() { }
Bird.prototype = Object.create(Animal.prototype);
Bird.prototype.constructor = Bird;
```

除了从 `Animal` 构造函数继承的行为之外，还需要给 `Bird` 对象添加它独有的行为。 这里，我们给 `Bird` 对象添加一个 `fly()` 函数。 函数会以一种与其他构造函数相同的方式添加到 `Bird's` 的 `prototype` 中：

```js
Bird.prototype.fly = function() {
  console.log("I'm flying!");
};
```

现在 `Bird` 的实例中就有了 `eat()` 和 `fly()` 这两个方法：

```js
let duck = new Bird();
duck.eat();
duck.fly();
```

`duck.eat()` 将在控制台中显示字符串 `nom nom nom`， `duck.fly()`将显示字符串 `I'm flying!`。

------

添加必要的代码，使得 `Dog` 对象继承 `Animal`，并且把 `Dog` 的 `prototype`上的 constructor 属性设置为 `Dog`。 然后给 `Dog` 对象添加一个 `bark()` 方法，这样的话，`beagle` 将同时拥有 `eat()` 和 `bark()`这两个方法。 `bark()` 方法中应该输出 `Woof!` 到控制台。

```js
function Animal() { }
Animal.prototype.eat = function() { console.log("nom nom nom"); };

function Dog() { }

// 只修改这一行下面的代码
Dog.prototype = Object.create(Animal.prototype);
Dog.prototype.constructor = Dog;
Dog.prototype.bark = function() {
  console.log("Woof!");
}
// 只修改这一行上面的代码

let beagle = new Dog();
```

## 重写继承的方法

在上一个挑战中，我们学习了一个对象可以通过引用另一个对象的 `prototype` 来继承其属性和行为（或方法）：

```js
ChildObject.prototype = Object.create(ParentObject.prototype);
```

然后，`ChildObject` 将自己的方法链接到它的 `prototype`中：

```js
ChildObject.prototype.methodName = function() {...};
```

我们还可以重写继承的方法。 以同样的方式 - 通过使用一个与需要重写的方法相同的方法名，向`ChildObject.prototype` 中添加方法。 请看下面的举例：`Bird` 重写了从 `Animal` 继承来的 `eat()` 方法：

```js
function Animal() { }
Animal.prototype.eat = function() {
  return "nom nom nom";
};
function Bird() { }

Bird.prototype = Object.create(Animal.prototype);

Bird.prototype.eat = function() {
  return "peck peck peck";
};
```

如果你有一个实例：`let duck = new Bird();`，然后你调用了 `duck.eat()`，以下就是 JavaScript 在 `duck` 的 `prototype` 链上寻找方法的过程：

1. `duck` => `eat()` 是定义在这里吗？ 不是。
2. `Bird` => `eat()` 是定义在这里吗？ => 是的。 执行它并停止往上搜索。
3. `Animal` => 这里也定义了 `eat()` 方法，但是 JavaScript 在到达这层原型链之前已停止了搜索。
4. Object => JavaScript 在到达这层原型链之前也已经停止了搜索。

------

重写 `Penguin` 的 `fly()` 方法，使其返回字符串 `Alas, this is a flightless bird.`

```js
function Bird() { }

Bird.prototype.fly = function() { return "I am flying!"; };

function Penguin() { }
Penguin.prototype = Object.create(Bird.prototype);
Penguin.prototype.constructor = Penguin;

// 只修改这一行下面的代码
Penguin.prototype.fly = function() {
  return "Alas, this is a flightless bird.";
}


// 只修改这一行上面的代码

let penguin = new Penguin();
console.log(penguin.fly());
```

## 使用 Mixin 在不相关对象之间添加共同行为

正如你所见，行为是可以通过继承来共享的。 然而，在有些情况下，继承不是最好的解决方案。 继承不适用于不相关的对象，比如 `Bird` 和 `Airplane`。 虽然它们都可以飞行，但是 `Bird` 并不是一种 `Airplane`，反之亦然。

对于不相关的对象，更好的方法是使用 mixins。 mixin 允许其他对象使用函数集合。

```js
let flyMixin = function(obj) {
  obj.fly = function() {
    console.log("Flying, wooosh!");
  }
};
```

`flyMixin` 能接受任何对象，并为其提供 `fly` 方法。

```js
let bird = {
  name: "Donald",
  numLegs: 2
};

let plane = {
  model: "777",
  numPassengers: 524
};

flyMixin(bird);
flyMixin(plane);
```

这里的 `flyMixin` 接收了`bird` 和 `plane` 对象，然后将 `fly` 方法分配给了每一个对象。 现在 `bird` 和 `plane` 都可以飞行了：

```js
bird.fly();
plane.fly();
```

控制台将显示字符串 `Flying, wooosh!` 两次，每 `.fly()` 调用都会显示。

注意观察 mixin 是如何允许相同的 `fly` 方法被不相关的对象 `bird` 和 `plane` 重用的。

------

创建一个名为 `glideMixin` 的 mixin，并定义一个 `glide` 方法。 然后使用 `glideMixin` 来给 `bird` 和 `boat` 赋予滑行（glide）的能力。

```js
let bird = {
  name: "Donald",
  numLegs: 2
};

let boat = {
  name: "Warrior",
  type: "race-boat"
};

// 只修改这一行下面的代码

let glideMixin = function(obj) {
  obj.glide = function() {
    console.log("Gliding, woooosh!");
  }
}

glideMixin(bird);
glideMixin(boat);
```

## 使用闭包保护对象内的属性不被外部修改

在上一次挑战中，`bird` 有一个公共属性 `name`。 公共属性的定义就是：它可以在 `bird` 的定义范围之外被访问和更改。

```js
bird.name = "Duffy";
```

因此，代码的任何地方都可以轻松地将 `bird` 的 name 属性更改为任意值。 想想密码和银行账户之类的东西，如果代码库的任何部分都可以轻易改变他们。 那么将会引起很多问题。

使属性私有化最简单的方法就是在构造函数中创建变量。 可以将该变量范围限定在构造函数中，而不是全局可用。 这样，属性只能由构造函数中的方法访问和更改。

```js
function Bird() {
  let hatchedEgg = 10;

  this.getHatchedEggCount = function() { 
    return hatchedEgg;
  };
}
let ducky = new Bird();
ducky.getHatchedEggCount();
```

这里的 `getHatchedEggCount` 是一种特权方法，因为它可以访问私有属性 `hatchedEgg`。 这是因为 `hatchedEgg` 是在与 `getHatchedEggCount` 相同的上下文中声明的。 在 JavaScript 中，函数总是可以访问创建它的上下文。 这就叫做 `closure`。

------

更改在 `Bird` 函数中声明的 `weight` 方法，使其成为私有变量。 然后，创建一个返回 `weight` 值 15 的 `getWeight` 方法。

```js
function Bird() {
  this.weight = 15;

}
//更改后
function Bird() {
  let weight = 15;

  this.getWeight = function() {
    return weight;
  }
}
```

## 了解立即调用函数表达（IIFE）

JavaScript 中的一个常见模式就是，函数在声明后立刻执行：

```js
(function () {
  console.log("Chirp, chirp!");
})();
```

这是一个匿名函数表达式，立即执行并输出 `Chirp, chirp!`。

请注意，函数没有名称，也不存储在变量中。 函数表达式末尾的两个括号（）会让它被立即执行或调用。 这种模式被叫做立即调用函数表达式（immediately invoked function expression) 或者IIFE。

------

重写函数 `makeNest`，并删除它的调用，取而代之是一个匿名的立即调用函数表达式（IIFE）。

```js
function makeNest() {
  console.log("A cozy nest is ready");
}

makeNest();

// 重写后
(function() {
console.log("A cozy nest is ready");
})();

```

## 使用 IIFE 创建一个模块

一个立即调用函数表达式（IIFE）通常用于将相关功能分组到单个对象或者是 module 中。 例如，先前的挑战中定义了两个 mixins：

```js
function glideMixin(obj) {
  obj.glide = function() {
    console.log("Gliding on the water");
  };
}
function flyMixin(obj) {
  obj.fly = function() {
    console.log("Flying, wooosh!");
  };
}
```

我们可以将这些 mixins 分成以下模块：

```js
let motionModule = (function () {
  return {
    glideMixin: function(obj) {
      obj.glide = function() {
        console.log("Gliding on the water");
      };
    },
    flyMixin: function(obj) {
      obj.fly = function() {
        console.log("Flying, wooosh!");
      };
    }
  }
})();
```

注意：一个立即调用函数表达式（IIFE）返回了一个 `motionModule` 对象。 返回的这个对象包含了作为对象属性的所有 mixin 行为。 module 模式的优点是，所有的运动相关的行为都可以打包成一个对象，然后由代码的其他部分使用。 下面是一个使用它的例子：

```js
motionModule.glideMixin(duck);
duck.glide();
```

------

创建一个名为 `funModule` 的模块，将这两个 mixins：`isCuteMixin` 和 `singMixin` 包装起来。 `funModule` 应该返回一个对象。

```js
let isCuteMixin = function(obj) {
  obj.isCute = function() {
    return true;
  };
};
let singMixin = function(obj) {
  obj.sing = function() {
    console.log("Singing to an awesome tune");
  };
};

// 包装后
let funModule = (function(){
  return {
    isCuteMixin: function(obj) {
      obj.isCute = function() {
        return true;
      };
    },
    singMixin: function(obj) {
      obj.sing = function() {
        console.log("Singing to an awesome tune");
      };
    }
  }
})();
```

