重点在于一系列产品和多种工厂

## 参考资料

# [廖雪峰的官方网站](https://www.liaoxuefeng.com/wiki/1252599548343744/1281319134822433)

> 提供一个创建一系列相关或相互依赖对象的接口，而无需指定它们具体的类。

抽象工厂模式（Abstract Factory）是一个比较复杂的创建型模式。

抽象工厂模式和工厂方法不太一样，它要解决的问题比较复杂，不但工厂是抽象的，产品是抽象的，而且有多个产品需要创建，因此，这个抽象工厂会对应到多个实际工厂，每个实际工厂负责创建多个实际产品：

```ascii
                                ┌────────┐
                             ─ >│ProductA│
┌────────┐    ┌─────────┐   │   └────────┘
│ Client │─ ─>│ Factory │─ ─
└────────┘    └─────────┘   │   ┌────────┐
                   ▲         ─ >│ProductB│
           ┌───────┴───────┐    └────────┘
           │               │
      ┌─────────┐     ┌─────────┐
      │Factory1 │     │Factory2 │
      └─────────┘     └─────────┘
           │   ┌─────────┐ │   ┌─────────┐
            ─ >│ProductA1│  ─ >│ProductA2│
           │   └─────────┘ │   └─────────┘
               ┌─────────┐     ┌─────────┐
           └ ─>│ProductB1│ └ ─>│ProductB2│
               └─────────┘     └─────────┘
```

这种模式有点类似于多个供应商负责提供一系列类型的产品。我们举个例子：

假设我们希望为用户提供一个[Markdown](https://baike.baidu.com/item/MarkDown)文本转换为HTML和Word的服务，它的接口定义如下：

```
public interface AbstractFactory {
    // 创建Html文档:
    HtmlDocument createHtml(String md);
    // 创建Word文档:
    WordDocument createWord(String md);
}
```

注意到上面的抽象工厂仅仅是一个接口，没有任何代码。同样的，因为`HtmlDocument`和`WordDocument`都比较复杂，现在我们并不知道如何实现它们，所以只有接口：

```
// Html文档接口:
public interface HtmlDocument {
    String toHtml();
    void save(Path path) throws IOException;
}

// Word文档接口:
public interface WordDocument {
    void save(Path path) throws IOException;
}
```

这样，我们就定义好了抽象工厂（`AbstractFactory`）以及两个抽象产品（`HtmlDocument`和`WordDocument`）。因为实现它们比较困难，我们决定让供应商来完成。

现在市场上有两家供应商：FastDoc Soft的产品便宜，并且转换速度快，而GoodDoc Soft的产品贵，但转换效果好。我们决定同时使用这两家供应商的产品，以便给免费用户和付费用户提供不同的服务。

我们先看看FastDoc Soft的产品是如何实现的。首先，FastDoc Soft必须要有实际的产品，即`FastHtmlDocument`和`FastWordDocument`：

```
public class FastHtmlDocument implements HtmlDocument {
    public String toHtml() {
        ...
    }
    public void save(Path path) throws IOException {
        ...
    }
}

public class FastWordDocument implements WordDocument {
    public void save(Path path) throws IOException {
        ...
    }
}
```

然后，FastDoc Soft必须提供一个实际的工厂来生产这两种产品，即`FastFactory`：

```
public class FastFactory implements AbstractFactory {
    public HtmlDocument createHtml(String md) {
        return new FastHtmlDocument(md);
    }
    public WordDocument createWord(String md) {
        return new FastWordDocument(md);
    }
}
```

这样，我们就可以使用FastDoc Soft的服务了。客户端编写代码如下：

```
// 创建AbstractFactory，实际类型是FastFactory:
AbstractFactory factory = new FastFactory();
// 生成Html文档:
HtmlDocument html = factory.createHtml("#Hello\nHello, world!");
html.save(Paths.get(".", "fast.html"));
// 生成Word文档:
WordDocument word = factory.createWord("#Hello\nHello, world!");
word.save(Paths.get(".", "fast.doc"));
```

如果我们要同时使用GoodDoc Soft的服务怎么办？因为用了抽象工厂模式，GoodDoc Soft只需要根据我们定义的抽象工厂和抽象产品接口，实现自己的实际工厂和实际产品即可：

```
// 实际工厂:
public class GoodFactory implements AbstractFactory {
    public HtmlDocument createHtml(String md) {
        return new GoodHtmlDocument(md);
    }
    public WordDocument createWord(String md) {
        return new GoodWordDocument(md);
    }
}

// 实际产品:
public class GoodHtmlDocument implements HtmlDocument {
    ...
}

public class GoodWordDocument implements HtmlDocument {
    ...
}
```

客户端要使用GoodDoc Soft的服务，只需要把原来的`new FastFactory()`切换为`new GoodFactory()`即可。

注意到客户端代码除了通过`new`创建了`FastFactory`或`GoodFactory`外，其余代码只引用了产品接口，并未引用任何实际产品（例如，`FastHtmlDocument`），如果把创建工厂的代码放到`AbstractFactory`中，就可以连实际工厂也屏蔽了：

```
public interface AbstractFactory {
    public static AbstractFactory createFactory(String name) {
        if (name.equalsIgnoreCase("fast")) {
            return new FastFactory();
        } else if (name.equalsIgnoreCase("good")) {
            return new GoodFactory();
        } else {
            throw new IllegalArgumentException("Invalid factory name");
        }
    }
}
```

我们来看看`FastFactory`和`GoodFactory`创建的`WordDocument`的实际效果：

![worddoc](https://holon-image.oss-cn-beijing.aliyuncs.com/20221229121152Q2jLg7.png)

注意：出于简化代码的目的，我们只支持两种Markdown语法：以`#`开头的标题以及普通正文。

# [Java-Design-Pattern](https://java-design-patterns.com/zh/patterns/abstract-factory/)

## 或称

工具包

## [#](https://java-design-patterns.com/zh/patterns/abstract-factory/#目的)目的

提供一个用于创建相关对象家族的接口，而无需指定其具体类。

## [#](https://java-design-patterns.com/zh/patterns/abstract-factory/#解释)解释

真实世界例子

> 要创建一个王国，我们需要具有共同主题的对象。 精灵王国需要精灵王，精灵城堡和精灵军队，而兽人王国需要兽王，精灵城堡和兽人军队。 王国中的对象之间存在依赖性。

通俗的说

> 工厂的工厂； 一个将单个但相关/从属的工厂分组在一起而没有指定其具体类别的工厂。

维基百科上说

> 抽象工厂模式提供了一种封装一组具有共同主题的单个工厂而无需指定其具体类的方法

**程序示例**

翻译上面的王国示例。 首先，我们为王国中的对象提供了一些接口和实现。



```java
public interface Castle {
  String getDescription();
}

public interface King {
  String getDescription();
}

public interface Army {
  String getDescription();
}

// Elven implementations ->
public class ElfCastle implements Castle {
  static final String DESCRIPTION = "This is the Elven castle!";
  @Override
  public String getDescription() {
    return DESCRIPTION;
  }
}
public class ElfKing implements King {
  static final String DESCRIPTION = "This is the Elven king!";
  @Override
  public String getDescription() {
    return DESCRIPTION;
  }
}
public class ElfArmy implements Army {
  static final String DESCRIPTION = "This is the Elven Army!";
  @Override
  public String getDescription() {
    return DESCRIPTION;
  }
}

// Orcish implementations similarly -> ...
```

然后我们有了王国工厂的抽象和实现



```java
public interface KingdomFactory {
  Castle createCastle();
  King createKing();
  Army createArmy();
}

public class ElfKingdomFactory implements KingdomFactory {
  public Castle createCastle() {
    return new ElfCastle();
  }
  public King createKing() {
    return new ElfKing();
  }
  public Army createArmy() {
    return new ElfArmy();
  }
}

public class OrcKingdomFactory implements KingdomFactory {
  public Castle createCastle() {
    return new OrcCastle();
  }
  public King createKing() {
    return new OrcKing();
  }
  public Army createArmy() {
    return new OrcArmy();
  }
}
```

现在我们有了抽象工厂，使我们可以制作相关对象的系列，即精灵王国工厂创建了精灵城堡，国王和军队等。



```java
var factory = new ElfKingdomFactory();
var castle = factory.createCastle();
var king = factory.createKing();
var army = factory.createArmy();

castle.getDescription();
king.getDescription();
army.getDescription();
```

程序输出:



```java
This is the Elven castle!
This is the Elven king!
This is the Elven Army!
```

现在，我们可以为不同的王国工厂设计工厂。 在此示例中，我们创建了FactoryMaker，负责返回ElfKingdomFactory或OrcKingdomFactory的实例。 客户可以使用FactoryMaker来创建所需的具体工厂，该工厂随后将生产不同的具体对象（军队，国王，城堡）。 在此示例中，我们还使用了一个枚举来参数化客户要求的王国工厂类型。



```java
public static class FactoryMaker {

  public enum KingdomType {
    ELF, ORC
  }

  public static KingdomFactory makeFactory(KingdomType type) {
    switch (type) {
      case ELF:
        return new ElfKingdomFactory();
      case ORC:
        return new OrcKingdomFactory();
      default:
        throw new IllegalArgumentException("KingdomType not supported.");
    }
  }
}

public static void main(String[] args) {
  var app = new App();

  LOGGER.info("Elf Kingdom");
  app.createKingdom(FactoryMaker.makeFactory(KingdomType.ELF));
  LOGGER.info(app.getArmy().getDescription());
  LOGGER.info(app.getCastle().getDescription());
  LOGGER.info(app.getKing().getDescription());

  LOGGER.info("Orc Kingdom");
  app.createKingdom(FactoryMaker.makeFactory(KingdomType.ORC));
  -- similar use of the orc factory
}
```

## [#](https://java-design-patterns.com/zh/patterns/abstract-factory/#类图)类图

![alt text](https://holon-image.oss-cn-beijing.aliyuncs.com/202212291211225t7l40.png)

## [#](https://java-design-patterns.com/zh/patterns/abstract-factory/#适用性)适用性

在以下情况下使用抽象工厂模式

- 该系统应独立于其产品的创建，组成和表示方式
- 系统应配置有多个产品系列之一
- 相关产品对象系列旨在一起使用，你需要强制执行此约束
- 你想提供产品的类库，并且只想暴露它们的接口，而不是它们的实现。
- 从概念上讲，依赖项的生存期比使用者的生存期短。
- 你需要一个运行时值来构建特定的依赖关系
- 你想决定在运行时从系列中调用哪种产品。
- 你需要提供一个或更多仅在运行时才知道的参数，然后才能解决依赖关系。
- 当你需要产品之间的一致性时
- 在向程序添加新产品或产品系列时，您不想更改现有代码。

示例场景

- 在运行时在FileSystemAcmeService ，DatabaseAcmeService 或NetworkAcmeService中选择并调用一个
- 单元测试用例的编写变得更加容易
- 适用于不同操作系统的UI工具

## [#](https://java-design-patterns.com/zh/patterns/abstract-factory/#后果)后果:

- Java中的依赖注入会隐藏服务类的依赖关系，这些依赖关系可能导致运行时错误，而这些错误在编译时会被捕获。
- 虽然在创建预定义对象时模式很好，但是添加新对象可能会很困难。
- 由于引入了许多新的接口和类，因此代码变得比应有的复杂。

## [#](https://java-design-patterns.com/zh/patterns/abstract-factory/#教程)教程

- [Abstract Factory Pattern Tutorialopen in new window](https://www.journaldev.com/1418/abstract-factory-design-pattern-in-java)

## [#](https://java-design-patterns.com/zh/patterns/abstract-factory/#已知使用)已知使用

- [javax.xml.parsers.DocumentBuilderFactoryopen in new window](http://docs.oracle.com/javase/8/docs/api/javax/xml/parsers/DocumentBuilderFactory.html)
- [javax.xml.transform.TransformerFactoryopen in new window](http://docs.oracle.com/javase/8/docs/api/javax/xml/transform/TransformerFactory.html#newInstance--)
- [javax.xml.xpath.XPathFactoryopen in new window](http://docs.oracle.com/javase/8/docs/api/javax/xml/xpath/XPathFactory.html#newInstance--)

## [#](https://java-design-patterns.com/zh/patterns/abstract-factory/#相关模式)相关模式

- [Factory Methodopen in new window](https://java-design-patterns.com/patterns/factory-method/)
- [Factory Kitopen in new window](https://java-design-patterns.com/patterns/factory-kit/)

## [#](https://java-design-patterns.com/zh/patterns/abstract-factory/#鸣谢)鸣谢

- [Design Patterns: Elements of Reusable Object-Oriented Softwareopen in new window](https://www.amazon.com/gp/product/0201633612/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=0201633612&linkCode=as2&tag=javadesignpat-20&linkId=675d49790ce11db99d90bde47f1aeb59)
- [Head First Design Patterns: A Brain-Friendly Guide](https://www.amazon.com/gp/product/0596007124/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=0596007124&linkCode=as2&tag=javadesignpat-20&linkId=6b8b6eea86021af6c8e3cd3fc382cb5b)

# 《深入设计模式》-抽象工厂

