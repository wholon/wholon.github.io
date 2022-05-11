# JavaScript对象

## 对象的创建

`JavaScript`是一种基于对象`（Object-based）`的语言，在`JavaScript`中，对象的创建和`Java`不同，既有`Java`使用的构造函数方式，也有其他方法。

### 对象的定义

`JavaScript`中的一切都是对象，这是该语言的一个很大的特点。像字符串、数组等已经定义的对象叫做内置对象。用户自己也可以定义对象，叫做自定义对象。本实训讲的对象特指自定义对象，自定义对象指数据和函数（又叫方法）的集合。数据指变量名和变量的值构成的组合。如下图所示：

```mermaid
graph LR
A[JavaScript对象]---B[内置对象]
	B---D["数字、字符串、布尔型、数组、函数等"]
	B---E["Date、Math等"]
A---C[自定义对象]
	C---F["属性1:值</br>属性2:值</br>...</br>方法1</br>方法2"]
```



下面介绍五种创建对象的方法，其中通过对象字面量和使用构造函数创建对象最常用。

### 对象字面量

这是最常用的创建对象的方法，通过新建一个键值对的集合（对象字面量）创建对象，如下：

```js
var song = {  
    name:"Liekkas",  
      time:180,  
      "song language":English,  
      singer: {  
        singerName:"Sofia Jannok",  
            singerAge:30  
    }  
};  
```

键值对中的键指的是属性的名字，若其中含有空格，名字需要用双引号包含在内。值指的是属性的值，可以是基本类型：如字符串，数字，布尔型，也可以是一个对象。键值对之间用逗号隔开，最后一个键值对后面没有逗号，所有的键值对在一个大括号中。

#### 使用简单字段编写简洁的对象字面量声明

ES6 添加了一些很棒的功能，用于更方便地定义对象。

请看以下代码：

```js
const getMousePosition = (x, y) => ({
  x: x,
  y: y
});
```

`getMousePosition` 简单的函数，返回拥有两个属性的对象。 ES6 提供了一个语法糖，消除了类似 `x: x` 这种冗余的写法。 你可以只写一次 `x`，解释器会自动将其转换成 `x: x`（或效果相同的内容）。 下面是使用这种语法重写的同样的函数：

```js
const getMousePosition = (x, y) => ({ x, y });
```

------

请使用简单属性对象的语法来创建并返回一个具有 `name`、`age` 和 `gender` 属性的对象。

```js
const createPerson = (name, age, gender) => {
  // 只修改这一行下面的代码
  return {
    name: name,
    age: age,
    gender: gender
  };
  // 只修改这一行上面的代码
};

const createPerson = (name, age, gender) => ({
  // 只修改这一行下面的代码
  name, age, gender
  // 只修改这一行上面的代码
});
```

### 通过关键字new创建对象

通过`new`关键字创建对象也是一个常用的方法。如下：

```js
var Store = new Object();//创建对象的一个实例  
Store.name = "lofo Market";  
Store.location = "NO.13 Five Avenue";  
Store.salesVolume = 1000000;  
```

通过上面的代码，我们就能创建一个名为`Store`的对象。

### 通过工厂方法创建对象

工厂方法就是通过函数创建对象，函数封装了创建对象的过程。

这是一种通过函数创建对象的方法，函数封装了对象的创建过程，创建新对象时只需要调用该函数即可。这种方法适合于一次创建多个对象。

```js
//对象的创建函数  
function createStoreObject(name,location,salesVolume) {  
    var store = new Object();  
    store.name = name;  
    store.locaion = location;  
    store.salesVolume = salesVolume;  
    store.display = function() {  
          console.log(this.name);  
    };  
    return store;  
}  
//利用该函数创建一个对象  
var store1 = createStoreObject("panda express","No.1,People Street",200000);  
```

这样就创建了一个名为`store1`的对象，注意这个对象除了属性之外还有一个方法`display`。要创建更多的类似`store1`的对象，直接调用该函数即可。

### 使用构造函数创建对象

上面虽然也是通过函数创建对象，但不是构造函数，只是普通函数。构造函数名必须以大写字母开头，函数体内没有返回语句。  

```js
//构造函数  
function Store(name,location,salesVolume) {  
    this.name = name;  
    this.locaion = location;  
    this.salesVolume = salesVolume;  
}  
//创建对象的实例  
var myStore = new Store("KeyExp","No.1,L.Street",540000);  
```

上面的代码首先是`Store`对象的构造函数，然后用该构造函数创建了`Store`对象的一个实例`myStore`。

### 使用原型(prototype)创建对象

当我们创建一个函数时，函数就会自动拥有一个`prototype`属性，这个属性的值是一个对象，这个对象被称为该函数的原型对象。也可以叫做原型。

当用`new`关键字加函数的模式创建一个对象时，这个对象就会有一个默认的不可见的属性`[[Prototype]]`，该属性的值就是上面提到的原型对象。如下图所示：

![预览大图](https://cdn.jsdelivr.net/gh/wholon/image@main/2022-04-06-21:36:29-187046.png)

```mermaid
graph LR
A[函数]
B["属性名：属性1"]
C["..."]
D["属性名：prototype"]
E[原型对象]
F[对象]
G["[[prototype]]"]
A----B
A----C
A----D
D--值-->E
A--创建-->F
F--属性-->G
G--值-->E
```



`JavaScript`中每个对象都有一个属性`[[Prototype]]`，指向它的原型对象，该原型对象又具有一个自己的`[[Prototype]]`，层层向上直到一个对象的原型为`null`。根据定义，`null` 没有原型，并作为这个原型链中的最后一个环节。如下图所示：

```mermaid
graph LR
A[对象]--"[[prototype]]"--> B[原型对象] -- "[[prototype]]" --> C[原型对象] --"..."-->null
```



这种方法是对使用构造函数创建对象的改进，使用构造函数创建一个对象时，会把构造函数中的方法（上面的构造函数只有属性的键值对，没有方法）都创建一遍，浪费内存，使用原型不存在这个问题。

```js
function Store() {};  
Store.prototype.name = "SF Express";  
Store.prototype.locaion = "Hong Kong";  
Store.prototype.salesVolume = 1200000000;  
//创建对象  
var myStore = new Store();  
//创建一个新的对象  
var hisStore = new Store();  
hisStore.name = "STO Express";//覆盖了原来的name属性 
```

这种方法的好处是，创建一个新的对象时，可以更改部分属性的值。

----

- 使用对象字面量方法创建名为`student`的对象，有两个属性`name`和`gender`，他们的值分别是`mainJs()`函数的参数`a`和参数`b`；
- 使用已给的构造函数`Car(plate,owner)`创建一个对象`myCar`，它的两个属性的值分别是参数`c`和参数`d`；
- 使用原型创建一个对象`myJob`，它的构造函数是`Job(company,salary)`，它的两个属性的值已经被设置，你需要用参数`e`覆盖属性`company`的值；

```js
function Car(plate,owner) {
    this.plate = plate;
    this.owner = owner;
}

function Job() {};
Job.prototype.company = "myCompany";
Job.prototype.salary = 12000;

function mainJs(a,b,c,d,e) {
	//请在此处编写代码
    /*********bigin*********/
    var student = {
        name:a,
        gender:b
    }

    var myCar = new Car(c, d);
    var myJob = new Job();
    myJob.company = e;
    /*********end*********/
    return student.name+student.gender+myCar.plate+myCar.owner+myJob.company;
}
```

## 属性的增删改查

在`Java`中，当实体类建立以后，类的属性只能获取与修改，不能增加与删除。但是因为`JavaScript`是动态类型的语言，`JavaScript`中对象的属性具有增删改查所有的操作。

> 然而，如果你的对象有非字符串属性的话，JavaScript 会自动将它们转为字符串。

### 属性的获取

#### 方式一

属性的获取有两种方式，一种是使用`.`符号，符号左侧是对象的名字，符号右侧是属性的名字，如下：

```js
var student = {name:"Alice",gender:"girl"};  
console.log(student.name);//输出Alice  
```

这种情况下属性名必须是静态的字符串，即不能是通过计算或者字符串的拼接形成的字符串。

> 如果我们已经提前知道要访问的属性名，使用点号表示法是最方便的。

#### 方式二

另外一种是使用`[""]`符号，符号的左边是对象的名字，双引号中间是属性的名字，这种情况下属性名可以是一个表达式，只要表达式的值是一个字符串即可。如下：

```js
var student = {name:"Alice",gender:"girl"};  
console.log(student["name"]);//输出Alice  
```

有两种情况必须使用第二种方式：

- 属性名含有空格字符，如`student["first name"]`，这时不能用`student.first name`代替，编译器无法解释后者；
- 属性名动态生成，比如用`for`循环获取前端连续`id`的值，这种`id`名之间一般有特定关系。如下面的例子：

```js
for(int i = 0;i < 5;i ++) {  
    console.log(student["id"+i]);  
}  
```

### 属性的修改与新增

属性的修改指修改已有属性的值，这个直接用赋值符号即可。

属性的新增与修改在形式上完全相同，区别仅在于编译器会根据属性的名字判断是否有该属性，有则修改，没有则新增。

```js
var student = {  
    name:"Kim",  
    age:21  
};  
student.age = 20;//修改属性，覆盖了原来的值21  
student.gender = "female";//新增属性gender  
```

> 在你创建了 JavaScript 对象后，你可以随时更新它的属性，就像更新任何其他变量那样。 你可以使用点或中括号操作符来更新。
>
> 举个例子，让我们看看 `ourDog`：
>
> ```js
> const ourDog = {
>   "name": "Camper",
>   "legs": 4,
>   "tails": 1,
>   "friends": ["everything!"]
> };
> ```
>
> 既然他是一个特别愉快的狗，让我们将他的名字更改为字符串 `Happy Camper`。 这有两种方式来更新对象的 name 属性： `ourDog.name = "Happy Camper";` 或 `ourDog["name"] = "Happy Camper";`。更新后，`ourDog.name` 的值就不再是 `Camper`，而是 `Happy Camper`。

### 删除属性

`JavaScript`中的属性还可以删除，这在其他的面向对象语言如`Java`或者`C++`中是无法想象的，删除通过`delete`运算符实现。删除成功返回布尔型`true`，删除失败也是返回`true`，所以在删除之前需要判断一个属性是否存在，这个内容将在下一关讲解。

需要注意的是，对象只能删除自己特有的属性，而不能删除继承自原型对象的属性。同时，对象在删除属性时，要防止删除被其他对象继承的属性，因为这样会导致程序出错。

```js
var Store = new Object();  
Store.name = "lofo Market";  
Store.location = "NO.13 Five Avenue";  
console.log(delete Store.name);//删除成功，输出true  
console.log(Store.name);//已删除，返回undefined  
delete Store.prototype;//删除失败，非自有属性  
```

----

- 如果调用函数`reviseAttribute（reviser,date,attvalue）`并传入值 `Alice,1,1000`那么对应`store`的`day1`属性的值就修改为`1000`,`accountant`属性的值修改为`Alice`；

 ```js
 var store = {
 	name:"Luma Restaurant",
 	location:"No 22,Cot Road",
 	accountant:"Vivian Xie",
 	day1:3200,
 	day2:3200,
 	day3:3200,
 	day4:3200,
 	day5:3200,
 	day6:3200,
 	day7:3200,
 	day8:3200,
 	day9:3200,
 	day10:3200
 }
 function reviseAttribute(reviser,date,attValue) {
     //Convert string to integer
     attValue = parseInt(attValue);
     //请在此处编写代码
     /*********begin*********/
 	store["day"+date] = attValue;
 	store.accountant = reviser;
 
 	/*********end*********/
     var totalSales =  store["day1"]+store["day2"]+store["day3"]+store["day4"]+store["day5"]+store["day6"]+store["day7"]+store["day8"]+store["day9"]+store["day10"];
     return totalSales+store.accountant;
 }
 ```

## 属性的检测和枚举

在`JavaScript`编程实践中，如果我们调用别人的接口，常常需要了解实体是否具有某个属性。

### 属性的检测

属性的检测指检查对象是否有某个属性或者方法，需要使用运算符`in`，`in`的左侧是属性或者方法名，右侧是检查对象，对象有该属性或者方法则返回`true`，否则返回`false`，如下：

```js
var school = {  
    name:"SJTU",  
    location:"ShangHai",  
    studentNum:40000,  
    display:function() {  
          console.log(this.name);  
    }  
};  
//检测属性  
console.log("name" in school);//输出true  
console.log("sales" in school);//输出false  
//检测方法  
console.log("display" in school);//输出true  
console.log("print" in school);//输出false  
```

这里的属性名是字符串，必须用双引号包含在内。

还可以用`hasOwnProperty()`检测对象是否具有某个自有属性或方法。括号内的参数是属性或者方法的名字。

所谓自有属性或者方法，是指对象自己定义的属性或者方法，而不是从原型链上继承来的。关于原型链，请参考本实训第一关。

```js
var school = {  
    name:"SJTU",  
    location:"ShangHai",  
    studentNum:40000,  
    display:function() {  
          console.log(this.name);  
    }  
};  
console.log(school.hasOwnProperty("studentNum"));//true  
console.log(school.hasOwnProperty("hasOwnProperty"));//false  
```

因为`hasOwnProperty`方法继承自`object`对象，不是自有方法，所以返回`false`。

----

* 修改函数 `checkObj` 检查 `obj` 是否有 `checkProp` 属性。 如果属性存在，返回属性对应的值。 如果不存在，返回`"Not Found"`。

```js
function checkObj(obj, checkProp) {
  // 只修改这一行下面的代码
  if (obj.hasOwnProperty(checkProp)) {
    return obj[checkProp];
  } else {
    return "Not Found";
  }
  // 只修改这一行上面的代码
}
```

### 属性的枚举

定义：属性的枚举指按顺序逐个的列出属性的名字。如下面的例子：

```js
var person = {  
    name:"Ye",  
    gender:"Gril",  
    age:23,  
    salary:23000,  
    height:1.78  
}  
```

根据前面的知识，我们知道对象`person`有五个属性，所谓枚举，就是依次列出这五个属性的名字，即：`name、gender、age、salary、height`，至于它们排列的顺序，在不同的浏览器中的结果不同，这里不讨论。

在继续下面的知识点之前，首先要知道一个概念：可枚举性（`enumerable`），这是对象的属性的一个性质，用户自己定义的属性默认为可枚举，系统内置的对象的属性默认为不可枚举。

枚举属性有三种方法：

- `for...in...`循环；
  可以枚举所有可枚举的属性，包括继承的属性。如下：

    ```js
    //首先定义一个school对象，它从原型链上继承的属性都是不可枚举的，而下面自定义的四个属性或者方法都是可枚举的  
    var school = {  
      name:"SJTU",  
      location:"ShangHai",  
      studentNum:40000,  
      display:function() {  
            console.log(this.name);  
      }  
    };  
    //枚举school的属性  
    //下面的圆括号中的att表示对象的属性，school表示对象  
    for(var att in school) {  
      //依次输出name,location,studentNum,display  
      console.log(att);  
    }  
    ```

	圆括号里面的表达式中，`att`表示对象的属性，`school`表示该对象，这个循环将依次遍历对象的所有可枚举属性，每次输出一个属性的值。

- `Object.getOwnPropertyNames()`；   括号中有一个参数，是要枚举的对象。该表达式将返回对象的所有自有属性的名字，不区分是否可枚举，结果以字符串数组的形式呈现，如下：  

	```js
	//定义一个school对象  
	var school = {  
	  name:"SJTU",  
	  location:"ShangHai",  
	  studentNum:40000,  
	  display:function() {  
	        console.log(this.name);  
	  }  
	};  
	//为school对象增加一个不可枚举的属性range  
	Object.defineProperty(school, "range", {  
	  value: 4,//设置range属性的值  
	  enumerable: false//设置range属性为不可枚举  
	});  
	//输出["name","location","studentNum","display","range"]  
	console.log(Object.getOwnPropertyNames(school));  
	```

	如果用上面的`for...in...`循环，`range`属性是不能够枚举到的。
	
- `Object.keys()`；   括号中有一个参数，是要枚举的对象。该表达式返回可枚举的自有属性，以字符串数组的形式。所以这里对属性的要求更加严格，既要求是自有属性，又要求可枚举。  

    ```js
    var school = {  
      name:"SJTU",  
      location:"ShangHai",  
      studentNum:40000,  
      display:function() {  
            console.log(this.name);  
      }  
    };  
    //为school对象增加一个不可枚举的属性range  
    Object.defineProperty(school, "range", {  
      value: 4,//设置range属性的值  
      enumerable: false//设置range属性为不可枚举  
    });  
    //输出["name","location","studentNum","display"]  
    console.log(Object.keys(school));  
    ```

总结一下上面三个方法对属性是否自有，是否可枚举的要求：

| 方法名                       | 是否要求可枚举 | 是否要求自有 |
| ---------------------------- | -------------- | ------------ |
| for...in...                  | 是             | 否           |
| Object.getOwnPropertyNames() | 否             | 是           |
| Object.keys()                | 是             | 是           |

----

- 有两个可选的对象`orange`和`car`，判断给定的属性名`a`属于哪一个对象；
- 返回该对象的所有自有属性名组成的字符串，例如：如果判断为`car`，则返回`brandpricemodel`；
- 给定的两个对象的自有属性都是可枚举的；

```js
var orange = {
    weight:"200g",
    color:"orange",
    taste:"sour"
};
var car = {
    brand:"Jaguar",
    price:"$80000",
    model:"XFL"
}
function mainJs(a){
	//请在此处编写代码
    /*********begin*********/
    var result = "";
    if (orange.hasOwnProperty(a)) {
        for (var att in orange) {
            result += att;
        }
    } else if (car.hasOwnProperty(a)) {
        for (var att in car) {
            result += att;
        }
    }

    return result;
    /*********end*********/
}
```

## 使用对象进行查找

对象和字典一样，可以用来存储键/值对。 如果数据是扁平的，你可以用对象来查找你想要的值，而不是链式使用 `switch` 或 `if/else` 语句。 当你知道你的输入数据在某个范围时，这种查找方式极为有效。

这是简单的反向字母表：

```js
const alpha = {
  1:"Z",
  2:"Y",
  3:"X",
  4:"W",
  ...
  24:"C",
  25:"B",
  26:"A"
};

alpha[2];
alpha[24];

const value = 2;
alpha[value];
```

`alpha[2]` 是字符串 `Y`，`alpha[24]` 是字符串 `C`，`alpha[value]` 是字符串 `Y`。

------

把 switch 语句转化为对象 `lookup` 调用。 使用它来查找 `val` 属性的值，并赋值给 `result` 变量。

```js
// 设置
function phoneticLookup(val) {
  let result = "";

  // 只修改这一行下面的代码
// switch(val) {
//     case "alpha":
//         result = "Adams";
//         break;
//     case "bravo":
//         result = "Boston";
//         break;
//     case "charlie":
//         result = "Chicago";
//         break;
//     case "delta":
//         result = "Denver";
//         break;
//     case "echo":
//         result = "Easy";
//         break;
//     case "foxtrot":
//         result = "Frank";
// }

  const lookup = {
    "alpha": "Adams",
    "bravo": "Boston",
    "charlie": "Chicago",
    "delta": "Denver",
    "echo": "Easy",
    "foxtrot": "Frank"
  }
  
  result = lookup[val];
  // 只修改这一行上面的代码
  return result;
}

phoneticLookup("charlie");
```

## 防止对象改变

通过 [这篇文章]({% post_url 2022-04-06-JavaScript变量 %}#改变一个用-const-声明的数组) 可以看出，`const` 声明并不会真的保护数据不被改变。 为了确保数据不被改变，JavaScript 提供了一个函数 `Object.freeze`。

任何更改对象的尝试都将被拒绝，如果脚本在严格模式下运行，将抛出错误。

```js
let obj = {
  name:"FreeCodeCamp",
  review:"Awesome"
};
Object.freeze(obj);
obj.review = "bad";
obj.newProp = "Test";
console.log(obj); 
```

`obj.review` 和 `obj.newProp` 赋值将导致错误，因为我们的编辑器默认在严格模式下运行，控制台将显示值 `{ name: "FreeCodeCamp", review: "Awesome" }`。

------

在这个挑战中，你将使用 `Object.freeze` 来防止数学常量被改变。 你需要冻结 `MATH_CONSTANTS` 对象，使得没有人可以改变 `PI` 的值，或增加或删除属性。

```js
function freezeObj() {
  const MATH_CONSTANTS = {
    PI: 3.14
  };
  // 只修改这一行下面的代码
  Object.freeze(MATH_CONSTANTS);
  // 只修改这一行上面的代码
  try {
    MATH_CONSTANTS.PI = 99;
  } catch(ex) {
    console.log(ex);
  }
  return MATH_CONSTANTS.PI;
}
const PI = freezeObj();
```

## 解构赋值

### 使用解构赋值来获取对象的值

解构赋值是 ES6 引入的新语法，用来从数组和对象中提取值，并优雅地对变量进行赋值。

有如下 ES5 代码：

```js
const user = { name: 'John Doe', age: 34 };

const name = user.name;
const age = user.age;
```

`name` 的值应该是字符串 `John Doe`， `age` 的值应该是数字 `34`。

下面是使用 ES6 解构赋值语句，实现相同效果：

```js
const { name, age } = user;
```

同样，`name` 的值应该是字符串 `John Doe`， `age` 的值应该是数字 `34`。

在这里，自动创建 `name` 和 `age` 变量，并将 `user` 对象相应属性的值赋值给它们。 这个方法简洁多了。

你可以从对象中提取尽可能多或很少的值。

------

把两个赋值语句替换成效果相同的解构赋值语句。 `today` 和 `tomorrow`的值应该还是 `HIGH_TEMPERATURES` 对象中 `today` 和 `tomorrow` 属性的值。

```js
const HIGH_TEMPERATURES = {
  yesterday: 75,
  today: 77,
  tomorrow: 80
};

// 只修改这一行下面的代码
const today = HIGH_TEMPERATURES.today;
const tomorrow = HIGH_TEMPERATURES.tomorrow;
// 只修改这一行上面的代码
const {today, tomorrow} = HIGH_TEMPERATURES;
```

### 使用解构赋值从对象中分配变量

可以给解构的值赋予一个新的变量名， 通过在赋值的时候将新的变量名放在冒号后面来实现。

还是以上个例子的对象来举例：

```js
const user = { name: 'John Doe', age: 34 };
```

这是指定新的变量名的例子：

```js
const { name: userName, age: userAge } = user;
```

你可以这么理解这段代码：获取 `user.name` 的值，将它赋给一个新的变量 `userName`，等等。 `userName` 的值将是字符串 `John Doe`，`userAge` 的值将是数字 `34`。

------

使用解构赋值语句替换两个赋值语句。 将 `HIGH_TEMPERATURES` 的 `today` 和 `tomorrow` 的值赋值给 `highToday` 和 `highTomorrow`。

```js
const HIGH_TEMPERATURES = {
  yesterday: 75,
  today: 77,
  tomorrow: 80
};

// 只修改这一行下面的代码

const highToday = HIGH_TEMPERATURES.today;
const highTomorrow = HIGH_TEMPERATURES.tomorrow; 

// 只修改这一行上面的代码
const {today: highToday, tomorrow: highTomorrow} = HIGH_TEMPERATURES;
```

### 使用解构赋值从嵌套对象中分配变量

你可以使用前两节课程中相同的原则来解构嵌套对象中的值。

使用与前面的例子中类似的对象：

```js
const user = {
  johnDoe: { 
    age: 34,
    email: 'johnDoe@freeCodeCamp.com'
  }
};
```

这是解构对象的属性值赋值给具有相同名字的变量：

```js
const { johnDoe: { age, email }} = user;
```

这是将对象的属性值赋值给具有不同名字的变量：

```js
const { johnDoe: { age: userAge, email: userEmail }} = user;
```

------

将两个赋值语句替换成等价的解构赋值。 `lowToday` 和 `highToday` 应该为 `LOCAL_FORECAST` 中 `today.low` 和 `today.high` 的值。

```js
const LOCAL_FORECAST = {
  yesterday: { low: 61, high: 75 },
  today: { low: 64, high: 77 },
  tomorrow: { low: 68, high: 80 }
};

// 只修改这一行下面的代码

const lowToday = LOCAL_FORECAST.today.low;
const highToday = LOCAL_FORECAST.today.high;

// 只修改这一行上面的代码
const {today: {low: lowToday, high: highToday}} = LOCAL_FORECAST;
```

### 使用解构赋值将对象作为函数的参数传递

在某些情况下，你可以在函数的参数里直接解构对象。

请看以下代码：

```js
const profileUpdate = (profileData) => {
  const { name, age, nationality, location } = profileData;

}
```

上面的操作解构了传给函数的对象。 这样的操作也可以直接在参数里完成：

```js
const profileUpdate = ({ name, age, nationality, location }) => {

}
```

当 `profileData` 被传递到上面的函数时，从函数参数中解构出值以在函数内使用。

------

对 `half` 的参数进行解构赋值，仅将 `max` 与 `min` 的值传进函数。

```js
const stats = {
  max: 56.78,
  standard_deviation: 4.34,
  median: 34.54,
  mode: 23.87,
  min: -0.75,
  average: 35.85
};

// 只修改这一行下面的代码
const half = (stats) => (stats.max + stats.min) / 2.0; 
// 只修改这一行上面的代码
const half = ({max, min}) => (max + min) / 2.0; 

```

## 用 ES6 编写简洁的函数声明

在 ES5 中，当我们需要在对象中定义一个函数的时候，必须像这样使用 `function` 关键字：

```js
const person = {
  name: "Taylor",
  sayHello: function() {
    return `Hello! My name is ${this.name}.`;
  }
};
```

用 ES6 的语法在对象中定义函数的时候，可以删除 `function` 关键词和冒号。 请看以下例子：

```js
const person = {
  name: "Taylor",
  sayHello() {
    return `Hello! My name is ${this.name}.`;
  }
};
```

------

使用以上这种简短的语法，重构在 `bicycle` 对象中的 `setGear` 函数。

```js
// 只修改这一行下面的代码
const bicycle = {
  gear: 2,
  setGear: function(newGear) {
    this.gear = newGear;
  }
};
// 只修改这一行上面的代码
const bicycle = {
  gear: 2,
  setGear(newGear) {
    this.gear = newGear;
  }
};
bicycle.setGear(3);
console.log(bicycle.gear);
```

## **使用 class 语法定义构造函数**

ES6 提供了一个新的创建对象的语法，使用关键字 class。

值得注意的是，`class` 只是一个语法糖，它并不像 Java、Python 或者 Ruby 这一类的语言一样，严格履行了面向对象的开发规范。

在 ES5 里面，我们通常会定义一个构造函数 `constructor`，然后使用 `new` 关键字来实例化一个对象：

```js
var SpaceShuttle = function(targetPlanet){
  this.targetPlanet = targetPlanet;
}
var zeus = new SpaceShuttle('Jupiter');
```

`class` 语法只是简单地替换了构造函数 `constructor` 的写法：

```js
class SpaceShuttle {
  constructor(targetPlanet) {
    this.targetPlanet = targetPlanet;
  }
}
const zeus = new SpaceShuttle('Jupiter');
```

应该注意 `class` 关键字声明了一个新的函数，里面添加了一个构造函数。 当用 `new` 创建一个新的对象时，构造函数会被调用。

**注意：**首字母大写驼峰命名法 UpperCamelCase 是 ES6 class 命名的惯例，就像上面的 `SpaceShuttle`。

`constructor` 方法是一个特殊方法，用于创建和初始化 class 创建的对象。

------

使用 `class` 关键词，写一个 `constructor` 来创建 `Vegetable` class。

`Vegetable` 这个 class 可以创建 vegetable 对象，这个对象拥有一个在 `constructor` 中赋值的 `name` 属性。

```js
// 只修改这一行下面的代码
class Vegetable {
  constructor(targetVegetable) {
    this.name = targetVegetable;
  }
}
// 只修改这一行上面的代码

const carrot = new Vegetable('carrot');
console.log(carrot.name); // 应该显示 'carrot'
```

## **使用 getter 和 setter 来控制对象的访问**

你可以从对象中获得一个值，也可以给对象的属性赋值。

这些操作通常被称为 getters 以及 setters。

Getter 函数的作用是可以让对象返回一个私有变量，而不需要直接去访问私有变量。

Setter 函数的作用是可以基于传进的参数来修改对象中私有变量。 这些修改可以是计算，或者是直接替换之前的值。

```js
class Book {
  constructor(author) {
    this._author = author;
  }
  // getter
  get writer() {
    return this._author;
  }
  // setter
  set writer(updatedAuthor) {
    this._author = updatedAuthor;
  }
}
const novel = new Book('anonymous');
console.log(novel.writer);
novel.writer = 'newAuthor';
console.log(novel.writer);
```

控制台将显示字符串 `anonymous` 和 `newAuthor`。

请注意用于调用 getter 和 setter 的语法。 它们甚至看起来不像是函数。 getter 和 setter 非常重要，因为它们隐藏了内部的实现细节。

**注意：** 通常会在私有变量前添加下划线（`_`）。 然而，这种做法本身并不是将变量变成私有的。

------

使用 `class` 关键字创建一个 `Thermostat` class。 `constructor` 接收一个华氏温度。

在 class 中，创建一个 `getter` 来获取摄氏温度和一个 `setter` 来设置温度值。

记得在 `C = 5/9 * (F - 32)` 和 `F = C * 9.0 / 5 + 32` 中，`F` 是华氏温度值，`C` 是摄氏温度值。

**注意：** 完成这个挑战后，应该在 class 中使用一个温度标准，要么是华氏温度，要么是摄氏温度。

这就是 getter 和 setter 的功能。 你正在为别的用户创建一个 API，不论你使用哪一个，用户都将获得正确的结果。

或者说，你从用户需求中抽象出了实现细节。

```js
// 只修改这一行下面的代码
class Thermostat {
  constructor(temperature) {
    this._temperature = 5 / 9 * (temperature - 32);
  }

  // getter
  get temperature() {
    return this._temperature;
  }

  // setter
  set temperature(updatedTemperature) {
    this._temperature = updatedTemperature;
  }
}
// 只修改这一行上面的代码

const thermos = new Thermostat(76); // 设置为华氏刻度
let temp = thermos.temperature; // 24.44 摄氏度
thermos.temperature = 26;
temp = thermos.temperature; // 26 摄氏度
```

