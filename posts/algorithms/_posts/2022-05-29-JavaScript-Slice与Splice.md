# JavaScript-Slice 与 Splice

本挑战的输入参数为两个数组和一个索引值。

将第一个数组中的所有元素依次复制到第二个数组中。

请注意，你需要从第二个数组索引值为 `n` 的地方开始插入。

最后，请返回插入元素后的数组。 作为输入参数的两个数组在函数执行前后应保持不变。

```js
function frankenSplice(arr1, arr2, n) {
  let result = arr2.slice();
  result.splice(n, 0, ...arr1);
  return result;
}

frankenSplice([1, 2, 3], [4, 5, 6], 1);
```

