# JavaScript-数组的对称差

比较两个数组并返回一个新数组，包含所有只在其中一个数组中出现的元素，排除两个数组都存在的元素。 换言之，我们需要返回两个数组的对称差。

**注意：**返回数组中的元素顺序不会影响挑战的测试结果。

```JavaScript 
function diffArray(arr1, arr2) {
  return arr1.concat(arr2).filter(item => {
    return !arr1.includes(item) || !arr2.includes(item);
  })
}

diffArray([1, 2, 3, 5], [1, 2, 3, 4, 5]);
```



