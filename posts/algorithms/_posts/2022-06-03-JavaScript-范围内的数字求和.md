# JavaScript-范围内的数字求和

我们会传入一个由两个数字组成的数组。 给出一个含有两个数字的数组，我们需要写一个函数，让它返回这两个数字间所有数字（包含这两个数字）的总和。 最低的数字并不总是第一位。

例如，`sumAll([4,1])` 应返回 `10`，因为从 1 到 4（包含 1、4）的所有数字的和是 `10`。

```js
function sumAll(arr) {
  let first = Math.min(...arr);
  let last = Math.max(...arr);
  return (first + last) * (last - first + 1) / 2;
}

sumAll([1, 4]);
```

