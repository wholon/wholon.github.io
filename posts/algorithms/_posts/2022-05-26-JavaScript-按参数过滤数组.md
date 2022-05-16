# JavaScript-按参数过滤数组

请写一个函数来检查数组（第一个参数 `arr`）中的元素，并返回数组中第一个通过校验测试的元素。 其中，“通过校验测试”指的是对于数组中的一个元素 `x`，若 `func(x)` 返回的结果为 `true`，则校验测试通过。 如果没有元素通过测试，请返回 `undefined`。

```js
function findElement(arr, func) {
  for (let i = 0; i < arr.length; i++) {
    if (func(arr[i])) {
      return arr[i];
    }
  }
  return undefined;
}

findElement([1, 2, 3, 4], num => num % 2 === 0);
```

