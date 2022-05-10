# 使用递归来创建一个数字序列

接着 [使用递归创建一个倒计时](https://holon.wang/posts/algorithms/2022/05/14/JavaScript-使用递归创建一个倒计时/)，有另外一个机会来用递归函数解决问题。

------

已经定义好了 `rangeOfNumbers` 函数，包含两个参数。 函数应该返回一个连续数字数组，`startNum` 参数开始 `endNum` 参数截止。 开始的数字小于或等于截止数字。 函数必需递归调用自身，不能使用任意形式的循环。 要考虑到 `startNum` 和 `endNum` 相同的情况。

```js
function rangeOfNumbers(startNum, endNum) {
  if (startNum == endNum) {
    return [startNum];
  } else {
    const rangeArray = rangeOfNumbers(startNum + 1, endNum);
    rangeArray.unshift(startNum);
    return rangeArray;
  }
};
```

