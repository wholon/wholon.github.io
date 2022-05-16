# JavaScript-反转字符串

请反转传入函数的字符串。

在反转字符串之前，你可能需要将其切分成包含字符的数组。

函数的返回结果应为字符串。

```js
function reverseString(str) {
  return str.split("").reverse().join("");
}

reverseString("hello");
```

