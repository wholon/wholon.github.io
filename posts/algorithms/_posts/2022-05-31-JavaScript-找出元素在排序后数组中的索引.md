# JavaScript-找出元素在排序后数组中的索引

数组（第一个参数）在排序后，将一个值（第二个参数）插入该数组，并使数组保持有序。返回这个新插入元素的最小索引值。 返回值应为一个数字。

例如，`getIndexToIns([1,2,3,4], 1.5)` 应该返回 `1` 因为1.5 大于 `1`（索引为 0）且小于 `2`（索引为 1）。

同样地，`getIndexToIns([20,3,5], 19)` 应该返回 `2`。 因为数组排序后会变成 `[3,5,20]`，而 `19` 小于 `20`（索引为 2）且大于 `5`（索引为 1）。

```js
function getIndexToIns(arr, num) {
  arr.sort((a, b) => a - b);

  for (let i = 0; i < arr.length; i++) {
    if (arr[i] >= num)
      return i;
  }

  return arr.length;
}

getIndexToIns([40, 60], 50);
```

