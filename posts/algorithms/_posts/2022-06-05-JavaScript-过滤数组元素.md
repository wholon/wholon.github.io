# JavaScript-过滤数组元素

你将获得一个初始数组（`destroyer` 函数中的第一个参数），后跟一个或多个参数。 从初始数组中移除所有与后续参数相等的元素。

**注意：** 你可以使用 `arguments` 对象。

```js
function destroyer(arr) {
  let removeValues = Array.from(arguments).slice(1);
  return arr.filter(function(val) {
    return !removeValues.includes(val);
  })
}

destroyer([1, 2, 3, 1, 2, 3], 2, 3);
```

