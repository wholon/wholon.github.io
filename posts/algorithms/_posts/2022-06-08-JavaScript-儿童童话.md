# JavaScript-儿童黑话

儿童黑话也叫 Pig Latin，是一种英语语言游戏。 规则如下：

\- 如果单词以辅音开头，就把第一个辅音字母或第一组辅音簇移到单词的结尾，并在后面加上 `ay`。

\- 如果单词以元音开头，只需要在结尾加上 `way`。

------

请把传入的字符串根据上述规则翻译成儿童黑话并返回结果。 输入的字符串一定是一个小写的英文单词。

* `translatePigLatin("california")` 应该返回字符串 `aliforniacay`。
* `translatePigLatin("paragraphs")` 应该返回字符串 `aragraphspay`。
* `translatePigLatin("glove")` 应该返回字符串 `oveglay`。
* `translatePigLatin("algorithm")` 应该返回字符串 `algorithmway`。
* `translatePigLatin("eight")` 应该返回字符串 `eightway`。
* 应该处理单词的第一个元音在单词中间的位置的情况。 `translatePigLatin("schwartz")` 应该返回字符串 `artzschway`。
* 应该处理不带元音的单词。 `translatePigLatin("rhythm")` 应该返回字符串 `rhythmay`。

```js
function translatePigLatin(str) {
  let consonantRegex = /^[^aeiou]+/;
  let myConsonants = str.match(consonantRegex);
  return myConsonants !== null
    ? str
        .replace(consonantRegex, "")
        .concat(myConsonants)
        .concat("ay")
    : str.concat("way");
}

translatePigLatin("consonant");
```

