# JavaScript-计算整数的阶乘

返回一个给定整数的阶乘计算结果。

对于整数 `n`，n 的阶乘就是所有小于等于 `n` 的正整数的乘积。

阶乘通常用符号 `n!` 来表示。

例如：`5! = 1 * 2 * 3 * 4 * 5 = 120`

在这个挑战中，只有非负整数会作为参数传入函数。

```js
function factorialize(num) {
  let result = 1;
  while (num > 1) {
    result *= num;
    num--;
  }
  return result;
}

factorialize(5);
```

