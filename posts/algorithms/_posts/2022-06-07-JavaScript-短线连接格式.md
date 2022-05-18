# JavaScript-短线连接格式

将字符串转换为短线连接格式。 短线连接格式是小写单词全部小写并以破折号分隔。

* `spinalCase("This Is Spinal Tap")` 应返回 `this-is-spinal-tap`。
* `spinalCase("thisIsSpinalTap")` 应返回 `this-is-spinal-tap`。
* `spinalCase("The_Andy_Griffith_Show")` 应返回 `the-andy-griffith-show`。
* `spinalCase("Teletubbies say Eh-oh")` 应返回 `teletubbies-say-eh-oh`。
* `spinalCase("AllThe-small Things")` 应返回 `all-the-small-things`。

```js
function spinalCase(str) {
  // 创建匹配空白和下划线的正则表达式
  var regex = /\s+|_+/g;

  // Replace low-upper case to low-space-uppercase
  str = str.replace(/([a-z])([A-Z])/g, "$1 $2");

  // Replace space and underscore with -
  return str.replace(regex, "-").toLowerCase();
}

// test here
spinalCase("This Is Spinal Tap");
```

