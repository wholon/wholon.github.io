# JavaScript-重复输出字符串

将一个给定的字符串 `str`（第一个参数）重复输出 `num`（第二个参数）次。 如果 `num`不是正数，返回空字符串。 在这个挑战中，请*不要*使用 JavaScript 内置的 `.repeat()` 方法。

```js
function repeatStringNumTimes(str, num) {
  let result = "";
  for (let i = 0; i < num; i++) {
    result += str;
  }
  return result;
}

repeatStringNumTimes("abc", 3);
```

