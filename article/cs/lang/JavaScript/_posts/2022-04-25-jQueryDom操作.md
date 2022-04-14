## jQuery获取内容和属性

### 获取元素的内容

基本的`html`结构如下：

```html
<p>
    <srtong>我是 srtong 标签</strong>
    我是文本内容
</p>  
```

如何获取`p`标签的内容呢？这里有两种方法，要注意区分，代码如下：

```js
$("p").text(); 
$("p").html();  
```

效果图如下：

   ![img](https://holon-image.oss-cn-beijing.aliyuncs.com/img/2022041500024281edf7.png)  

可以看出：

- `text()`是获取所选元素的文本内容，`html` 标签的内容已经转化；
- `html()`是获取所选元素的内容，包括 `html` 标签。

基本的`html`结构如下：  

```html
<input type="text" placeholder="Educoder平台"/> 
<p></p>  
```

如何获取`input`标签的`value`值呢？这里有一个专门获取表单`value`值的方法`val()`，代码如下：

```js
var val = $("input").val(); //获取表单的 value 值 
$("p").text(val);  
```

效果如下：

   ![img](https://holon-image.oss-cn-beijing.aliyuncs.com/img/20220415000242466fc7.gif)  

### 获取元素的属性

基本的`html`结构如下：

```html
<div class="box" id="wrap" name="容器" data-count="none">  </div>  
```

如何获取该`div`的各种属性呢？这里用`attr()`，代码如下：

```js
console.log($(".box").attr("class")); 
console.log($(".box").attr("id")); 
console.log($(".box").attr("name")); 
console.log($(".box").attr("data-count"));  
```

效果图如下：

   ![img](https://holon-image.oss-cn-beijing.aliyuncs.com/img/20220415000242b22de8.png)  

### 编程要求

根据提示，在`Begin`至`End`之间填充代码，获取元素的内容和属性值。要求如下：

- 点击【获取文本内容】按钮，直接弹出类名为`box`的元素的文本内容；
- 点击【获取内容】按钮，直接弹出类名为`box`的元素的内容；
- 点击【获取表单 value 值】按钮，获取类名为`getVal`的元素的`value`值和`type`属性值，用`"---"`拼接，并赋值给变量`getValue`，弹出变量`getValue`的值。

格式注意：

- 获取元素统一用**类名**获取；
- 统一用双引号`""`表示字符串。

效果如下：  

   ![img](https://holon-image.oss-cn-beijing.aliyuncs.com/img/202204150002423eebe9.gif)  

```html
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

    <style>
    .container{
        width: 300px;
        margin: 30px auto;
    }
    .box{
        border: 2px solid #000;
        background: #eee;
        padding: 10px;
    }
    p{
        font-size: 18px;
    }
    input{
        height: 30px;
    }
    button{
       margin-bottom: 30px;
    }
    </style>
</head>
<body>
    <div class="container">
       <button class="btn1">获取文本内容</button>
        <button class="btn2">获取内容</button>
        <button class="btn3">获取表单value值</button>
       <div class="box">
           <p>我是第一行</p>
           <p>我是第二行</p>
           输入框:<input class="getVal" type="text" value="Hello Educoder"/>
       </div>

    </div>
     
   <script>

    $(function(){        
        //------------ Begin -----------
        $(".btn1").click(function(){
            alert($(".box").text());
        });
        
        $(".btn2").click(function(){
            alert($(".box").html());
        });
        
        $(".btn3").click(function(){
            var getValue = $(".getVal").val() + "---" + $(".getVal").attr("type");
            alert(getValue);
        });
        //------------ End --------------
    })

   </script>
</body>
</html>
```

## jQuery设置内容和属性

### 设置元素的内容

基本的`html`结构如下：

```html
<p class="first"></p> 
<p class="second">我是第二个</p> 
<input class="third" type="text"/>  
```

效果如下：

   ![img](https://holon-image.oss-cn-beijing.aliyuncs.com/img/202204150051105d8586.png)  

如何设置上面标签的内容呢？在第一节的基础上，我们深入学习一下前面的几种方法。代码如下：

```js
$(".first").text("<h3>我是第一个</h3>"); 
$(".second").html("<h3>我是第二个</h3>");
$(".third").val("我是第三个");  
```

效果图如下：

   ![img](https://holon-image.oss-cn-beijing.aliyuncs.com/img/20220415005110afe18a.png)  

可以看出：

- 这三个方法在使用上基本是一样的；
- 以`text()`为例，`text()`表示获取内容，`text(content)`表示设置内容。

### 设置元素的属性

基本的`html`结构如下： 

```html
<div class="box" id="wrap" name="容器" data-count="none">  </div>  
```

如何设置该`div`的各种属性呢？这里用`attr(att, newValue)`，代码如下：

```js
$("div").attr("class","alterClass"); 
$("div").attr("id","alterId"); 
$("div").attr("name","alterName");
$("div").attr("data-count","alterDataCount");  
```

然后，再获取一下它们的属性，效果图如下：

   ![img](https://holon-image.oss-cn-beijing.aliyuncs.com/img/202204150051105a6dfe.png)  

上面的写法是用来设置一种属性的，可不可以设置多种属性呢？当然是可以的，上面的代码简写如下：

```js
$("div").attr({  
    "class": "alterClass",  
    "id": "alterId",  
    "name": "alterName",  
    "data-count": "alterDataCount" 
});
```

设置多种属性是用对象的方式来实现的。

### 编程要求

根据提示，在`Begin`至`End`之间填充代码，设置元素的内容和属性值。要求如下：

- 点击【填充文本内容】按钮，给类名为`first`的元素填充**文本内容**`我是第一行`；
- 点击【填充内容】按钮，给类名为`second`的元素填充**内容**`<span>我是第二行</span>`；
- 点击【填充表单 value 值】按钮，设置`input`框的`type`属性值为`password`，并赋值给变量`typeAttr`。设置`input`框的`value`值为变量`typeAttr`。

格式注意：

- 获取元素统一用**类名**获取；
- 统一用双引号`""`表示字符串。

效果如下：

   ![img](https://holon-image.oss-cn-beijing.aliyuncs.com/img/202204150051107b05aa.gif)  

```html
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

    <style>
    .container{
        width: 300px;
        margin: 30px auto;
    }
    .box{
        border: 2px solid #000;
        background: #eee;
        padding: 10px;
    }
    p{
        font-size: 18px;
    }
    input{
        height: 30px;
    }
    button{
       margin-bottom: 30px;
    }
    </style>
</head>
<body>
    <div class="container">
       <button class="btn1">填充文本内容</button>
        <button class="btn2">填充内容</button>
        <button class="btn3">填充value值</button>
       <div class="box">
           <p class="first"></p>
           <p class="second"></p>
           输入框:<input class="getVal" type="text" value="Hello Educoder"/>
       </div>

    </div>
     
   <script>

    $(function(){        
        //------------ Begin -----------
        $(".btn1").click(function(){
            $(".first").text("我是第一行");
        });

        $(".btn2").click(function(){
            $(".second").html("<span>我是第二行</span>");
        });

        $(".btn3").click(function(){
            var typeAttr = $(".getVal").attr("type", "password");
            $(".getVal").val(typeAttr);
        })
        
        
        //------------ End --------------
    })

   </script>
</body>
</html>
```

## jQuery添加元素

### 元素内添加

需要实现的效果如下： 

   ![img](https://holon-image.oss-cn-beijing.aliyuncs.com/img/20220415005845d1268f.gif)  

如何给类名为`box`的元素添加内容呢？ 这里介绍两个方法：`append()`和`prepend()`，实现代码如下：

```js
$(".btn1").click(function(){   
    $(".box").prepend("<p>头部添加内容</p>") 
}) 
$(".btn2").click(function(){   
    $(".box").append("<p>尾部添加内容</p>") 
})  
```

可以看出：

- `append()`在被选元素的结尾插入内容；
- `prepend()`在被选元素的头部插入内容。

### 元素外添加

需要实现的效果如下：

   ![img](https://holon-image.oss-cn-beijing.aliyuncs.com/img/202204150101565c7075.gif)  

如何实现上面效果呢？ 这里介绍两个方法：`before()`和`after()`，实现代码如下：

```js
$(".btn1").click(function(){  
    $(".box").before("<p>头部添加内容</p>")  
}) 
$(".btn2").click(function(){    
    $(".box").after("<p>尾部添加内容</p>") 
})  
```

可以看出：

- `before()`在被选元素之前插入内容；
- `after()`在被选元素之后插入内容。

注意：要和 `append()`，`prepend()`区分开来。

### 编程要求

根据提示，在`Begin`至`End`之间补充代码，实现添加元素的功能。要求如下：

- 在表格的下面添加按钮【添加内容】，把内容`<button class="btn">添加内容</button>`赋值给变量`addBtn`，添加变量即可；
- 用`append()`给表格底部添加内容；
- 给这个按钮添加点击事件，当点击时，调用`loadData()`。

格式注意：

- 获取元素统一用**类名**获取；
- 统一用双引号`""`表示字符串，注意单引号和双引号的嵌套，类名用双引号。

效果如下：

   ![img](https://holon-image.oss-cn-beijing.aliyuncs.com/img/202204150058455aa1fe.gif)  

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Document</title>
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

  <style>
   button{
    margin-top:20px;
   }
  </style>
</head>
<body>
   <table class="tab" border="1" width="100%" cellspacing="0"  cellpadding="10" align="center">
  <tr id="tb-head">
    <th>序号</th>
    <th>姓名</th>
    <th>性别</th>
    <th>年龄</th>
    <th>住址</th>
  </tr>
  <tr>
    <td>1</td>
    <td>张三</td>
    <td>男</td>
    <td>20</td>
    <td>北京</td>
  </tr>
  <tr>
    <td>2</td>
    <td>李四</td>
    <td>男</td>
    <td>30</td>
    <td>洛杉矶</td>
  </tr>
  <tr>
    <td>3</td>
    <td>丽丽</td>
    <td>女</td>
    <td>24</td>
    <td>上海</td>
  </tr>
  <tr>
    <td>4</td>
    <td>王五</td>
    <td>男</td>
    <td>26</td>
    <td>河南</td>
  </tr>
</table>
    <script>    
    $(function(){
      var count = 4;        
      //---------表格下面添加【添加内容】按钮-------------
	  //------------------- Begin ---------------
	  var addBtn = '<button class="btn">添加内容</button>';
      $(".tab").after(addBtn);
        
      //------------------- End -----------------
      function loadData(){
          for(var i =0; i<2; i++){
            count ++;
            var tr = '<tr>' +
                  '<td>' + count + '</td>'+
                  '<td>王五</td>'+
                  '<td>男</td>'+
                  '<td>26</td>'+
                  '<td>河南</td>'+
                '</tr>';

          //---------表格底部添加内容------------
		      //------------------- Begin ---------------
          $(".tab").append(tr);
          //------------------- End -----------------
          }
       }
        //-------------点击事件-----------------
		    //------------------- Begin ---------------
        $(".btn").click(function(){
          loadData();
        });
       //------------------- End -----------------
    })
    </script>

</body>
</html>
```

## jQuery删除元素

### remove()

需要实现的效果如下：

   ![img](https://holon-image.oss-cn-beijing.aliyuncs.com/20220415011015wurRb8.gif)  

如何删除类名为`.box`的元素呢？这里用`remove()`方法，实现代码如下： 

```js
$(".btn").click(function(){    
    $(".box").remove(); 
})  
```

可以看出：`remove()`是删除被选元素及其子元素。

### empty()

需要实现的效果如下： 

   ![img](https://holon-image.oss-cn-beijing.aliyuncs.com/20220415011015QxVTAr.gif)  

如何只删除类名为`.box`的**子元素**呢？这里用`empty()`方法，实现代码如下： 

```js
$(".btn").click(function(){    
    $(".box").empty(); 
})  
```

可以看出：`empty()`是只删除被选元素的子元素。

### 编程要求

根据提示，在`Begin`至`End`之间补充代码，实现删除元素的功能。要求如下：

- 点击【删除最后一行】，删除表格的最后一行；
- 点击【删除最后一个住址】，删除表格的最后一个住址；
- 获取最后一个用`last()`。

格式注意：

- 获取元素统一用**类名**获取；
- 统一用双引号`""`表示字符串。

效果如下：  

   ![img](https://holon-image.oss-cn-beijing.aliyuncs.com/20220415011016SS96bI.gif)  

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Document</title>
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

  <style>
   button{
    margin-top:20px;
   }
  </style>
</head>
<body>
   <table class="tab" border="1" width="100%" cellspacing="0"  cellpadding="10" align="center">
  <tr class="line">
    <th>序号</th>
    <th>姓名</th>
    <th>性别</th>
    <th>年龄</th>
    <th class="final">住址</th>
  </tr>
  <tr class="line">
    <td>1</td>
    <td>张三</td>
    <td>男</td>
    <td>20</td>
    <td class="final">北京</td>
  </tr>
  <tr class="line">
    <td>2</td>
    <td>李四</td>
    <td>男</td>
    <td>30</td>
    <td class="final">洛杉矶</td>
  </tr>
  <tr class="line">
    <td>3</td>
    <td>丽丽</td>
    <td>女</td>
    <td>24</td>
    <td class="final">上海</td> 
  </tr>
  <tr class="line">
    <td>4</td>
    <td>王五</td>
    <td>男</td>
    <td>26</td>
    <td class="final">河南</td>
  </tr>
</table>
<button class="btn1">删除最后一行</button>
<button class="btn2">删除最后一个住址</button>
    <script>
    //-----------begin-----------
    $(".btn1").click(function(){
      $(".line").last().remove();
    });

    $(".btn2").click(function(){
      $(".final").last().empty();
    });
    
    //------------end------------  
    </script>
    
</body>
</html>

```

