# 记录集合

给定一个对象，用来表示部分音乐专辑收藏。 每张专辑都有几个属性和一个唯一的 id 号作为键值。 并非所有专辑都有完整的信息。

以 `updateRecords` 函数开始，这个函数需要一个对象 `records`，包含一个音乐专辑集合，一个 `id`，一个 `prop`（如 `artist` 或 `tracks`），和一个 `value`。 使用下面的规则完成函数来修改传递给函数的对象。

- 函数必须始终返回整个音乐专辑集合对象。
- 如果 `prop` 不是 `tracks` 并且 `value` 不是一个空字符串， 将专辑的 `prop` 更新或设置为 `value`。
- 如果 `prop` 是 `tracks` 但专辑没有 `tracks` 属性，则应创建空数组并为其添加 `value`。
- 如果 `prop` 是 `tracks` 并且 `value` 不是一个空字符串，将 `value`添加到专辑现有 `tracks` 数组的末尾。
- 如果 `value` 是空字符串，从专辑里删除指定的 `prop`。

**注意：** 用 `recordCollection` 对象做为测试参数对象。

```js
// 设置
const recordCollection = {
  2548: {
    albumTitle: 'Slippery When Wet',
    artist: 'Bon Jovi',
    tracks: ['Let It Rock', 'You Give Love a Bad Name']
  },
  2468: {
    albumTitle: '1999',
    artist: 'Prince',
    tracks: ['1999', 'Little Red Corvette']
  },
  1245: {
    artist: 'Robert Palmer',
    tracks: []
  },
  5439: {
    albumTitle: 'ABBA Gold'
  }
};

// 只修改这一行下面的代码
function updateRecords(records, id, prop, value) {
  let record = records[id];
  if (prop != "tracks" && value != "") {
    record[prop] = value;
  } else if (prop == "tracks" && !record.hasOwnProperty(prop)) {
    record.tracks = [];
    record.tracks.push(value);
  } else if (prop == "tracks" && value != "") {
    record.tracks.push(value);
  } else if (value == "") {
    delete record[prop];
  }
  return records;
}

updateRecords(recordCollection, 5439, 'artist', 'ABBA');
```

