# JavaScript-比较字符串

如果数组里的第一个字符串包含了第二个字符串中的所有字母，则返回 `true`。

例如，`["hello", "Hello"]` 应该返回 `true`。因为在忽略大小写的情况下，第一个字符串包含了第二个字符串里出现的所有字母。

`["hello", "hey"]` 应该返回 `false`。因为 `hello` 并不包含字符 `y`。

最后，`["Alien", "line"]` 应该返回 `true`。因为 `line` 中的所有字母都出现在了 `Alien` 中。

```js
function mutation(arr) {
  let src = arr[0].toLowerCase();
  let target = arr[1].toLowerCase();
  for (let i = 0; i < target.length; i++) {
    if (src.indexOf(target[i]) < 0) {
      return false;
    }
  }

  return true;
}

mutation(["hello", "hey"]);
```

