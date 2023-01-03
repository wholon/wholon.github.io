# [解释器](https://www.liaoxuefeng.com/wiki/1252599548343744/1281319508115489)

> 给定一个语言，定义它的文法的一种表示，并定义一个解释器，这个解释器使用该表示来解释语言中的句子。

解释器模式（Interpreter）是一种针对特定问题设计的一种解决方案。例如，匹配字符串的时候，由于匹配条件非常灵活，使得通过代码来实现非常不灵活。举个例子，针对以下的匹配条件：

- 以`+`开头的数字表示的区号和电话号码，如`+861012345678`；
- 以英文开头，后接英文和数字，并以.分隔的域名，如`www.liaoxuefeng.com`；
- 以`/`开头的文件路径，如`/path/to/file.txt`；
- ...

因此，需要一种通用的表示方法——正则表达式来进行匹配。正则表达式就是一个字符串，但要把正则表达式解析为语法树，然后再匹配指定的字符串，就需要一个解释器。

实现一个完整的正则表达式的解释器非常复杂，但是使用解释器模式却很简单：

```java
String s = "+861012345678";
System.out.println(s.matches("^\\+\\d+$"));
```

类似的，当我们使用JDBC时，执行的SQL语句虽然是字符串，但最终需要数据库服务器的SQL解释器来把SQL“翻译”成数据库服务器能执行的代码，这个执行引擎也非常复杂，但对于使用者来说，仅仅需要写出SQL字符串即可。

### 练习

请实现一个简单的解释器，它可以以SLF4J的日志格式输出字符串：

```java
log("[{}] start {} at {}...", LocalTime.now().withNano(0), "engine", LocalDate.now());
// [11:02:18] start engine at 2020-02-21...
```



# [Interpreter](https://java-design-patterns.com/zh/patterns/interpreter/#%E7%B1%BB%E5%9B%BE)

**Behavioral****Gang of Four**大约 1 分钟

------

此页内容

- [目的](https://java-design-patterns.com/zh/patterns/interpreter/#目的)
- [类图](https://java-design-patterns.com/zh/patterns/interpreter/#类图)
- [适用性](https://java-design-patterns.com/zh/patterns/interpreter/#适用性)
- [真实世界例子](https://java-design-patterns.com/zh/patterns/interpreter/#真实世界例子)
- [鸣谢](https://java-design-patterns.com/zh/patterns/interpreter/#鸣谢)

## [#](https://java-design-patterns.com/zh/patterns/interpreter/#目的)目的

给定一种语言，请定义其语法的表示形式，以及使用该表示形式来解释该语言中的句子的解释器。

## [#](https://java-design-patterns.com/zh/patterns/interpreter/#类图)类图

![alt text](https://holon-image.oss-cn-beijing.aliyuncs.com/20230103092116gPWKXE.png)

## [#](https://java-design-patterns.com/zh/patterns/interpreter/#适用性)适用性

有一种要解释的语言时，请使用解释器模式，并且可以将语言中的语句表示为抽象语法树。解释器模式在以下情况下效果最佳

- 语法很简单。 对于复杂的语法，语法的类层次结构变得庞大且难以管理。 在这种情况下，解析器生成器之类的工具是更好的选择。 他们可以在不构建抽象语法树的情况下解释表达式，这可以节省空间并可能节省时间
- 效率不是关键问题。 通常，最有效的解释器不是通过直接解释解析树来实现的，而是先将其转换为另一种形式。 例如，正则表达式通常会转换为状态机。 但是即使这样，翻译器也可以通过解释器模式实现，因此该模式仍然适用。

## [#](https://java-design-patterns.com/zh/patterns/interpreter/#真实世界例子)真实世界例子

- [java.util.Patternopen in new window](http://docs.oracle.com/javase/8/docs/api/java/util/regex/Pattern.html)
- [java.text.Normalizeropen in new window](http://docs.oracle.com/javase/8/docs/api/java/text/Normalizer.html)
- All subclasses of [java.text.Formatopen in new window](http://docs.oracle.com/javase/8/docs/api/java/text/Format.html)
- [javax.el.ELResolveropen in new window](http://docs.oracle.com/javaee/7/api/javax/el/ELResolver.html)

## [#](https://java-design-patterns.com/zh/patterns/interpreter/#鸣谢)