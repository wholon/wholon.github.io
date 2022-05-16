# JavaScript-分割数组

请编写一个函数，该函数将一个数组（第一个参数）拆分成若干长度为 `size`（第二个参数）的子数组，并将它们作为二维数组返回。

```js
function chunkArrayInGroups(arr, size) {
  let newArr = [];
  while (arr.length > 0) {
    newArr.push(arr.splice(0, size));
  }
  return newArr;
}

chunkArrayInGroups(["a", "b", "c", "d"], 2);
```

