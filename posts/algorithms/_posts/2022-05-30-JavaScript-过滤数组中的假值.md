# JavaScript-过滤数组中的假值

从数组中移除所有假值（falsy values）。

JavaScript 中的假值有 `false`、`null`、`0`、`""`、`undefined`、`NaN`。

提示：可以考虑将每个值都转换为布尔值（boolean）。

```js
function bouncer(arr) {
  let result = [];
  for (let i = 0; i < arr.length; i++) {
    if (arr[i]) {
      result.push(arr[i]);
    }
  }

  return result;
}

bouncer([7, "ate", "", false, 9]);
```

