# JavaScript-排队

在计算机科学中队列（queue）是一个抽象的数据结构（Data Structure），队列中的条目都是有秩序的。 新的条目会被加到队列的末尾，旧的条目会从队列的头部被移出。

------

写一个函数 `nextInLine`，用一个数组（`arr`）和一个数字（`item`）作为参数。

把数字添加到数组的结尾，然后移出数组的第一个元素。

最后 `nextInLine` 函数应该返回被删除的元素。

```js
function nextInLine(arr, item) {
  // 只修改这一行下面的代码
  arr.push(item);
  item = arr.shift();
  return item;
  // 只修改这一行上面的代码
}

// 设置
const testArr = [1, 2, 3, 4, 5];

// 显示代码
console.log("Before: " + JSON.stringify(testArr));
console.log(nextInLine(testArr, 6));
console.log("After: " + JSON.stringify(testArr));
```

