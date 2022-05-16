# JavaScript-确认结尾

检查字符串（第一个参数 `str`）是否以给定的目标字符串（第二个参数 `target`）结束。

这个挑战 *可以* 用 ES2015 引入的 `.endsWith()` 方法来解决。但在这个挑战中，请使用 JavaScript 的字符串子串方法。

```js
function confirmEnding(str, target) {
  for (let i = str.length - 1, j = target.length - 1; i >= 0 && j >= 0; i--, j--) {
    if (str[i] != target[j]) {
      return false;
    }
  }
  return true;
}

confirmEnding("Bastian", "n");
```

