# JavaScript数组

## 数组的创建、读写和长度

数组的出现就是为了批量处理数据。

### 数组的创建

创建数组有两种方法，一是使用数组字面量，简单来说就是在`[]`之中列出数组的所有元素：

```js
var numberArray = [1,2,3,4,5];//数字数组  
var stringArray = ["java","script","edu","coder"];//字符串数组  
var mixArray = [1,2,"java",true,6.6];//混合数组  
```

如上，各元素之间用`,`隔开。`JavaScript`中数组的元素可以是不同的数据类型，如上面的第三个数组。

创建数组的第二种方法是新建一个`Array`对象的实例，如：

```js
var myArray = new Array();//创建一个初始为空的数组  
var lengthMixArray = new Array(6);//创建一个长为6的数组  
```

这种情况下可以设置数组的长度（即数组中元素的个数），也可以不设置。

### 数组元素的读取和写入

数组元素的读取和写入在形式上相似，都是用赋值符号连接的两个表达式。

读取时，存放读入值的变量在左边，数组元素在右边：

```js
var readArray = [1,3,"js",true,2.22];  
var read = readArray[0];//读取第一个元素到变量read中  
```

写入时，数组元素在左边，待写值在右边：

```js
var writeArray = [1,3,"js",true,2.22];  
writeArray[0] = 2;//在第一个元素的位置写入2  
console.log(writeArray[0]);//原来的1已经被覆盖，输出2  
```

### 数组长度

数组长度指数组中元素的个数，等于最大索引值加`1`，数组的`length`属性即数组的长度。

```js
var arrayLength = [1,"js",true];  
console.log(arrayLength.length);//输出3  
```

数组的长度也可以写入，当写入的值小于数组的实际长度时，数组会被删除一部分。大于实际长度时，数组会在尾部添加一些空的区域。

```js
arrayLength.length = 2;  
console.log(arrayLength);//输出[1,"js"]  
```

## 练习1

- 已知两个数组`array1`和`array2`，参数`a`是一个整数，先判断`a`的值与数组`array1`的长度值相等，如果相等，返回数组`array1`的最后一个元素，反之，则返回数组`array2`的最后一个元素；

```js
var array1 = [1,2,3,"js",4,true,"hello"];
var array2 = [true,true,"java",2.1];
function mainJs(a) {
	//请在此处编写代码
    /*********begin*********/
    if (a == array1.length) {
        return array1[array1.length - 1];
    } else {
        return array2[array2.length - 1];
    }
    /*********end*********/
}
```

## 数组元素的增减

数组元素的增删是`JavaScript`的一个特点，因为其他很多编程语言的数组是不允许增加或者删除元素的。

### 数组元素的增加

在`JavaScript`中，为数组增加元素可以在数组头部（索引最小处）或者尾部进行，可以使用数组的方法或者直接使用运算符。

#### 在尾部添加元素

最直观的方法是直接给当前尾部元素的后一个位置赋值。

```js
var numberArray = [12,23,34,45];  
numberArray[numberArray.length] = 56;  
console.log(numberArray);//输出[12,23,34,45,56]  
```

第二种方法是使用`push()`函数，往数组的末尾添加一个或多个元素，参数是要添加的元素，返回数组长度。  

```js
//利用push()方法在数组尾部添加元素  
var numberArray = [12,23,34,45];  
var newLength = numberArray.push(56);  
console.log(newLength);//输出5  
console.log(numberArray);//输出[12,23,34,45,56]  
```

#### 在头部添加元素

`unshift()`方法在数组的头部添加元素，并返回数组新的长度，其余元素自动向索引大的方向移动。

```js
var sArray = ["ja","va","script"];  
var newLength = sArray.unshift("he","llo");  
console.log(newLength)//输出5  
console.log(sArray);//输出["he","llo","ja","va","script"];  
```

### 数组元素的删除

删除也能在数组头部（索引值小）或者尾部进行。

#### 在尾部删除元素

上一关介绍过一种方法：直接修改数组长度为更小的值。

```js
var array = [1,2,true,"hello"];  
array.length = 3;//索引最大的元素被删除  
console.log(array);//输出[1,2,true]  
```

第二种方法是使用`delete`运算符。`delete`运算符后接要删除的元素，但是删除后，会有一个空占位符，所以数据的长度保持不变。如：

```js
var dArray = [11,22,33,44,55];  
delete dArray[4];//删除索引最大的元素  
console.log(dArray);//输出[11,22,33,44]  
console.log(dArray.length); //长度为5  
```

第三种方法是使用`pop()`，一次删除一个，并返回被删除的元素。

```js
//利用pop()方法在数组尾部删除元素  
var numberArray = [3,4,5,6,7];  
var deletedNumber = numberArray.pop();  
console.log(deletedNumber);//输出被删除的元素7  
console.log(numberArray);//删除后的数组为[3,4,5,6]  
```

#### 在头部删除元素

有`unshift()`，自然有`shift()`，`shift()`的作用是删除数组头部一个元素并返回该元素，然后所有元素往索引值小的方向移动一位。

初学者很容易混淆这两个方法，建议记住`shift`单词的意思是：删除，去掉。

```js
var dArray = [11,22,33,44,55];   
console.log(dArray.shift());//输出11，11被从数组中删除
console.log(dArray);//输出[22,33,44,55]  
```

## 练习2

- 将数组`testArray`的最后`a`个元素移动到最前面，这`a`个元素之间的相对位置不变，其余元素之间的相对位置不变；
- 比如将数组`[1,2,3,4,5]`最后`2`个元素移动到最前面，数组变为`[4,5,1,2,3]`；
- 返回移动结束后数组在索引`b`处的元素；

```js
var testArray = [12,"java","js","c","c++",24,36,"python","c#","css"];
function mainJs(a,b) {
    a = parseInt(a);
    b = parseInt(b);
    //请在此处编写代码
    /*********begin*********/
    for (var i = 0; i < a; i++) {
        testArray.unshift(testArray.pop());
    }

    return testArray[b];
    /*********end*********/
}
```

## 数组的遍历和多维数组

### 数组的遍历

数组的遍历指按顺序访问你数组的每一个元素。有两种方法：  

- 使用`for`循环

```js
//依次在浏览器的控制台输出one，two，three，four  
var stringArray = ["one","two","three","four"]; 
for(var i=0,sLength=stringArray.length;i<sLength;i++) {
    console.log(stringArray[i]);                                                      
}
```

- 使用`forEach()`方法
  `forEach()`方法的参数是一个无名字的函数，函数有三个参数，第一个参数是当前的数组元素，第二个参数是当前的索引，第三个参数是数组对象的索引。与`for`循环的区别是无法用`break`中断循环。

```js
var numArr = [10,11,12,13,14];  
numArr.forEach(function(mem,i,arr) {
    mem *= 10;      
    arr[i] = mem;  
});  
console.log(numArr);//输出[100,110,120,130,140]  
```

### 多维数组的实现

多维数组实际上就是数组的数组，指数组的每一个元素也是一个数组，这里仅讨论二维数组。

`JavaScript`中二维数组的列的长度不唯一，第一列可以有`4`个元素，第二列可以有`5`个元素，等等。

- 二维数组的创建
  创建已知的二维数组：

```js
var multiArr = [[1,2,3,4],[5,6,7],[8,9]];  
```

创建仅知道长度的二维数组

```js
//创建一个4行6列的二维数组 
var muArr = new Array(4);  
for(var i = 0;i <4;i++) {     
    muArr[i] = new Array(6);  
}  
```

- 二维数组的读写
  二维数组的读写用`数组名[][]`的方式，第一个中括号内为行数，从`0`计数，第二个中括号内为列数，也从`0`计数。
  以上面的数组`multiArr`为例：

```js
var multiArr = [[1,2,3,4],[5,6,7],[8,9]]; 
console.log(multiArr[1][1]);//读元素，输出6 
multiArr[0][0] = 0;//写元素  
```

## 练习3

- 将一维数组`arr`转为`a`行`b`列的二维数组，行优先；
- 返回该二维数组；

```js
var arr = [1,2,3,4,5,6,7,8,9,0,10,11,12,13,14,15,16,17,18,19,20,21,23,22];
function mainJs(a,b) {
    a = parseInt(a);
    b = parseInt(b);
    //请在此处编写代码
    /*********begin*********/
    var result = new Array(a);
    for (var i = 0; i < a; i++) {
        result[i] = new Array(b);
        for (var j = 0; j < b; j++) {
            // i * b + j 是 arr 中数组下标
            result[i][j] = arr[i*b + j];
        }
    }

    return result;
    /*********end*********/
}

```

## 数组的常用方法

本关将介绍一些数组常用的方法，你可以通过调用这些方法生成复杂的代码。

### 查找元素的位置

根据值查找元素的位置，有两个方法：`indexOf()`和`lastIndexOf()`，前者从索引小处往大搜索，后者相反。都返回第一次遇到该元素时的索引。

两者都有两个参数，第一个参数为要查找的元素，第二个参数可选，为搜索的起点索引。如：

```js
var search = ["a","b","a","b","c","d","a","a","b","a"];  console.log(search.indexOf("a"));//输出0
console.log(search.lastIndexOf("a"));//输出9
console.log(search.indexOf("a",2));//输出2，从索引为2处开始搜索  
```

第二个参数可以是负数，`-1`表示倒数第一个元素，`-2`表示倒数第二个元素，依次类推。如：

```js
var search = ["a","b","a","b"]; 
console.log(search.indexOf("a"，-3));//输出2 
console.log(search.lastIndexOf("a"，-3));//输出0
```

### 数组的合并

`concat()`实现数组合并，其形式是`数组a.concat(数组b)`，合并之后返回新数组，新数组为数组`a`后面连接数组`b`，但是数组`a`和`b`不变。

```js
var a = [1,2,3]; 
var b = [4,5,6]; 
var c = a.concat(b);//合并后返回新数组 
console.log(c);//输出[1,2,3,4,5,6]  
```

### 数组倒置

`reverse()`实现数组倒置，无参数，返回倒置后的数组，同时调用该方法的数组也会被倒置。称为就地逆置。

```js
var a = [1,2,3,4]; 
var b = a.reverse(); 
console.log(a);//输出[4,3,2,1] 
console.log(b);//输出[4,3,2,1]  
```

### 元素合并

`join()`将数组的所有元素连接起来组成字符串，参数为元素之间的分隔符，默认逗号。

```js
var sArray = ["June","July","August"]; 
console.log(sArray.join());//输出June,July,August 
console.log(sArray.join("+"));//输出June+July+August  
```

### 元素排序

`sort()`实现数据元素排序，不带该参数表示元素按照`ASCII`表从小到大排序（参考`JavaScript`学习手册三）。如：

```js
var stringArray = ["a","ab","b","aa"]; 
stringArray.sort(); 
console.log(stringArray);//输出["a","aa","ab","b"]  
```

需要注意的是数字的排序，例子如下：

```js
var arr = [1,2,10,5,12]; 
arr.sort(); 
console.log(arr);//输出[1,10,12,2,5];  
```

带参数的格式如下：  

```js
arr.sort(function(a,b){        
    return a-b;  //升序排列 
})  
```

或者：

```js
arr.sort(function(a,b){     
    return b-a;  //降序排列 
})  
```

说明：  

- `arr`是要排序的数组；
- `a`，`b`是两个参数，返回`a-b`，升序排列，返回`b-a`，降序排列。

对于数字的排序，`sort()`带参数和不带参数是不一样的，例子如下：

```js
var arr = [1,2,10,5,12]; 
arr.sort(); 
console.log(arr);//输出[1,10,12,2,5] 
arr.sort(function(a,b){    
    return a-b;  }); 
console.log(arr);//输出[1,2,5,10,12]  
```

### 提取子数组

`slice()`返回切割出的子数组，不修改原来的数组。

它有两个整数参数`a`和`b`，`a`表示切割的起点，该点属于子数组；`b`可选，表示切割的终点，该点不属于子数组。

`a`和`b`都可以为负数，如`-1`表示倒数第一个位置，依次类推。

```js
var arr = ["a","b","c","d","e"]; 
console.log(arr.slice(0,3));//["a","b","c"] 
console.log(arr.slice(0,-2));//["a","b","c"] 
console.log(arr.slice(4));//["e"] 
console.log(arr.slice(-4));//["b","c","d","e"]  
```

## 练习4

- 获取字符串`a`在数组`myArray`的所有位置并组成一个位置数组；
- 获取字符串`b`在数组`myArray`的所有位置并组成一个位置数组；
- 合并这两个数组然后返回合并后的数组。

```js
function mainJs(myArray) {
    myArray = myArray.split(",");
    //请在此处编写代码
    /*********begin*********/
    var arrA = new Array();
    var arrB = new Array();
    for (var i = 0; i < myArray.length; i++) {
        var nextA = myArray.indexOf("a", i);
        if (nextA == -1) {
            break;
        } else {
            arrA.push(nextA);
            i = nextA;
        }
    }

    for (var i = 0; i < myArray.length; i++) {
        var nextB = myArray.indexOf("b", i);
        if (nextB == -1) {
            break;
        } else {
            arrA.push(nextB);
            i = nextB;
        }
        
    }

    return arrA.concat(arrB);

    /*********end*********/
}

```

## 数组的应用——内排序

所谓排序是指将一组数据按照从小到大（或从大到小）的顺序重新排列，排序是面试常考的问题之一。

排序一般分为两个步骤：比较和移动。比较指判断两个数据之间的大小关系，移动指根据大小关系把数据移动到合适的位置上。

待排序的数据大多是放置在数组中，一是因为数组中的数据有相对的顺序，二是遍历数组操作起来比较简单。

下面介绍`JavaScript`中两种常见的排序方式：冒泡排序和选择排序。

### 冒泡排序

#### 一趟冒泡排序

先介绍一趟冒泡排序的过程。

以升序为例，从第一个元素开始，将第一个元素与第二个元素比较，如果第一个元素大于第二个元素，交换这两者。

如下图所示，`9`比`5`大，交换两者的位置后，`9`就到后面去了。

   ![img](https://cdn.jsdelivr.net/gh/wholon/image@main/2022-04-06-22:07:14-189245.png)  

然后第二个元素与第三个元素比较，将大的移动到后面；第三个元素与第四个元素比较......，这样一直进行下去，直到倒数第二个元素和最后一个元素进行比较，称为一趟冒泡排序，结束后最大的元素已经移到了索引最大处。下面的图展示了每一次比较并交换后的数组：

   ![img](https://data.educoder.net/api/attachments/189246)  

可以看到，一趟冒泡排序结束后，最大的元素`9`移到了索引最大处。

#### 冒泡排序全过程

接下来对除了最后一个元素的数组进行第二趟冒泡排序，结果是第二大的元素到了索引第二大的地方。这样一直进行下去，直到整个数组有序或者某一趟排序的时候不存在元素的交换。  

   ![img](https://cdn.jsdelivr.net/gh/wholon/image@main/2022-04-06-22:07:14-189251.png)  

第四趟冒泡过程中，未发生元素的交换，结束。

因为排序的原理是不断的把大的数据往上浮动，故而命名为冒泡排序。

```js
//冒泡排序 
var arr = [9，5，8，0，2，6]; 
var aLength = arr.length; 
var temp; 
var flag = 0;//元素交换的标志位 
for(var i = 1;i < aLength;i++) {
    //共进行n-1次冒泡   
    flag = 0;   
    for(var j = 0;j < aLength-i;j++) {
        //一次冒泡       
        if(arr[j]>arr[j+1]) {
            //交换元素        
            temp = arr[j];        
            arr[j] = arr[j+1];     
            arr[j+1] = temp;      
            flag = 1;     
        }    
    }    
    if(flag == 0) break;//本次冒泡没有元素交换 
} 
console.log(arr);  
```

冒泡排序关键在于这两个循环的控制，外层循环控制冒泡的次数，一般是`n-1`次，`n`表示数组长度。

内循环`j`的初值为`0`，因为不论是第几趟冒泡，都是从`arr[0]`开始遍历数组，`j`的上限设置为`arr.length-i`，因为随着冒泡的进行，越往后需要比较的数组的索引上限越小。

### 选择排序

#### 一趟选择排序

原理：遍历数组，记录下最大元素的索引值，将最大的元素与数组最后一个元素交换，这样最大的元素到了索引值最大的地方，称为一趟选择排序。与冒泡不同的是，只会发生一次交换。

   ![img](https://cdn.jsdelivr.net/gh/wholon/image@main/2022-04-06-22:07:14-189254.png)  

可以看到`9`移到了索引最大处。

#### 选择排序全过程

第二趟选择排序是在除了最后一个元素的数组中选择最大的元素，将它与索引值第二大的元素交换，结束后第二大的元素也到了最终的位置上。这样一直进行下去，一共`n-1`趟选择排序。  

   ![img](https://cdn.jsdelivr.net/gh/wholon/image@main/2022-04-06-22:07:14-189255.png)  

```js
//选择排序 
var arr = [6,12,3,34,1,56,77,0,2,43]; 
var aLength = arr.length; 
var temp; 
var max = arr[0]; 
var maxIndex = 0; 
for(var i = 0;i < aLength-1;i++) {
    //共进行n-1次选择   
    for(var j = 1;j < aLength-i;j++) {
        //一次选择     
        if(arr[j] > max) {    
            max = arr[j];      
            maxIndex = j;     
        }    
    }   
    //将本次选出的最大元素移动到最终的位置上   
    temp = arr[aLength-i-1];  
    arr[aLength-i-1] = arr[maxIndex];  
    arr[maxIndex] = temp;  
    var max = arr[0]; 
    var maxIndex = 0; 
} 
console.log(arr);  
```

这里也有两个大循环，第一个循环控制总的排序趟数，第二个循环求本次选择出的最大元素的索引值，第二个循环结束后将本次的最大值与最终位置上的元素交换。

## 练习5

```js
function mainJs(a) {
    var arr = a.split(",");
    for(var i = 0;i < arr.length;i++) {
        arr[i] = parseInt(arr[i]);
    }
    //请在此处编写代码
    /*********begin*********/
    var max = arr[0];
    var maxIndex = 0;
    var result = new Array();
    for (var i = 0; i < arr.length - 1; i++) {
        for (var j = 1; j < arr.length - i; j++) {
            if (arr[j] > max) {
                max = arr[j];
                maxIndex = j;
            }
        }
        

        var temp = arr[arr.length - 1 - i];
        arr[arr.length - 1 - i] = arr[maxIndex];
        arr[maxIndex] = temp;
        result.push(maxIndex);
        var max = arr[0];
        var maxIndex = 0;
    }

    return result;
    /*********end*********/
}
```

