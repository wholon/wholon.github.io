# JavaScript-基本类型布尔值的检查

检查一个值是否是基本类型中的布尔值（boolean）类型。 函数应返回 `true` 或者 `false`。

基本类型中的布尔值为 `true` 或者 `false`。

```js
function booWho(bool) {
  return typeof bool === "boolean";
}

booWho(null);
```

