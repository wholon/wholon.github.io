# JavaScript-将摄氏度转换为华氏度

从摄氏转换为华氏的公式是，摄氏温度乘以 `9/5`，再加上 `32`。

输入参数 `celsius` 代表一个摄氏度的温度。 使用已定义的变量 `fahrenheit`，并赋值为相应的华氏度的温度值。 使用上面提到的公式来帮助将摄氏温度转换为华氏温度。

```js
function convertToF(celsius) {
  let fahrenheit = celsius * 9 / 5 + 32;
  return fahrenheit;
}

convertToF(30);
```

