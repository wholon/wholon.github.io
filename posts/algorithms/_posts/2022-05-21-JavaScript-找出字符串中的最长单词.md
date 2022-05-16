# JavaScript-找出字符串中的最长单词

返回给出的句子中，最长单词的长度。

函数的返回值应是一个数字。

```js
function findLongestWordLength(str) {
  let result = 0;
  let strArr = str.split(" ");
  for (let i = 0; i < strArr.length; i++) {
    if (strArr[i].length > result) {
      result = strArr[i].length;
    }
  }
  return result;
}

findLongestWordLength("The quick brown fox jumped over the lazy dog");
```

