**如果你希望在无需修改代码的情况下即可使用对象，且希望在运行时为对象新增额外的行为，可以使用装饰模式。**

**如果用继承来扩展对象行为的方案难以实现或者根本不可行， 你可以使用该模式。**

许多编程语言使用 final 最终 关键字来限制对某个类的进 一步扩展。 复用最终类已有行为的唯一方法是使用装饰模式: 用封装器对其进行封装。

# [装饰器模式](https://www.liaoxuefeng.com/wiki/1252599548343744/1281319302594594)

> 动态地给一个对象添加一些额外的职责。就增加功能来说，相比生成子类更为灵活。

装饰器（Decorator）模式，是一种在运行期动态给某个对象的实例增加功能的方法。

我们在IO的[Filter模式](https://www.liaoxuefeng.com/wiki/1252599548343744/1298364142452770)一节中其实已经讲过装饰器模式了。在Java标准库中，`InputStream`是抽象类，`FileInputStream`、`ServletInputStream`、`Socket.getInputStream()`这些`InputStream`都是最终数据源。

现在，如果要给不同的最终数据源增加缓冲功能、计算签名功能、加密解密功能，那么，3个最终数据源、3种功能一共需要9个子类。如果继续增加最终数据源，或者增加新功能，子类会爆炸式增长，这种设计方式显然是不可取的。

Decorator模式的目的就是把一个一个的附加功能，用Decorator的方式给一层一层地累加到原始数据源上，最终，通过组合获得我们想要的功能。

例如：给`FileInputStream`增加缓冲和解压缩功能，用Decorator模式写出来如下：

```
// 创建原始的数据源:
InputStream fis = new FileInputStream("test.gz");
// 增加缓冲功能:
InputStream bis = new BufferedInputStream(fis);
// 增加解压缩功能:
InputStream gis = new GZIPInputStream(bis);
```

或者一次性写成这样：

```
InputStream input = new GZIPInputStream( // 第二层装饰
                        new BufferedInputStream( // 第一层装饰
                            new FileInputStream("test.gz") // 核心功能
                        ));
```

观察`BufferedInputStream`和`GZIPInputStream`，它们实际上都是从`FilterInputStream`继承的，这个`FilterInputStream`就是一个抽象的Decorator。我们用图把Decorator模式画出来如下：

```ascii
             ┌───────────┐
             │ Component │
             └───────────┘
                   ▲
      ┌────────────┼─────────────────┐
      │            │                 │
┌───────────┐┌───────────┐     ┌───────────┐
│ComponentA ││ComponentB │...  │ Decorator │
└───────────┘└───────────┘     └───────────┘
                                     ▲
                              ┌──────┴──────┐
                              │             │
                        ┌───────────┐ ┌───────────┐
                        │DecoratorA │ │DecoratorB │...
                        └───────────┘ └───────────┘
```

最顶层的Component是接口，对应到IO的就是`InputStream`这个抽象类。ComponentA、ComponentB是实际的子类，对应到IO的就是`FileInputStream`、`ServletInputStream`这些数据源。Decorator是用于实现各个附加功能的抽象装饰器，对应到IO的就是`FilterInputStream`。而从Decorator派生的就是一个一个的装饰器，它们每个都有独立的功能，对应到IO的就是`BufferedInputStream`、`GZIPInputStream`等。

Decorator模式有什么好处？它实际上把核心功能和附加功能给分开了。核心功能指`FileInputStream`这些真正读数据的源头，附加功能指加缓冲、压缩、解密这些功能。如果我们要新增核心功能，就增加Component的子类，例如`ByteInputStream`。如果我们要增加附加功能，就增加Decorator的子类，例如`CipherInputStream`。两部分都可以独立地扩展，而具体如何附加功能，由调用方自由组合，从而极大地增强了灵活性。

如果我们要自己设计完整的Decorator模式，应该如何设计？

我们还是举个栗子：假设我们需要渲染一个HTML的文本，但是文本还可以附加一些效果，比如加粗、变斜体、加下划线等。为了实现动态附加效果，可以采用Decorator模式。

首先，仍然需要定义顶层接口`TextNode`：

```
public interface TextNode {
    // 设置text:
    void setText(String text);
    // 获取text:
    String getText();
}
```

对于核心节点，例如`<span>`，它需要从`TextNode`直接继承：

```
public class SpanNode implements TextNode {
    private String text;

    public void setText(String text) {
        this.text = text;
    }

    public String getText() {
        return "<span>" + text + "</span>";
    }
}
```

紧接着，为了实现Decorator模式，需要有一个抽象的Decorator类：

```
public abstract class NodeDecorator implements TextNode {
    protected final TextNode target;

    protected NodeDecorator(TextNode target) {
        this.target = target;
    }

    public void setText(String text) {
        this.target.setText(text);
    }
}
```

这个`NodeDecorator`类的核心是持有一个`TextNode`，即将要把功能附加到的`TextNode`实例。接下来就可以写一个加粗功能：

```
public class BoldDecorator extends NodeDecorator {
    public BoldDecorator(TextNode target) {
        super(target);
    }

    public String getText() {
        return "<b>" + target.getText() + "</b>";
    }
}
```

类似的，可以继续加`ItalicDecorator`、`UnderlineDecorator`等。客户端可以自由组合这些Decorator：

```
TextNode n1 = new SpanNode();
TextNode n2 = new BoldDecorator(new UnderlineDecorator(new SpanNode()));
TextNode n3 = new ItalicDecorator(new BoldDecorator(new SpanNode()));
n1.setText("Hello");
n2.setText("Decorated");
n3.setText("World");
System.out.println(n1.getText());
// 输出<span>Hello</span>

System.out.println(n2.getText());
// 输出<b><u><span>Decorated</span></u></b>

System.out.println(n3.getText());
// 输出<i><b><span>World</span></b></i>
```

# [Java-design-patterns](https://java-design-patterns.com/zh/patterns/decorator/)

## 或称

包装器

## [#](https://java-design-patterns.com/zh/patterns/decorator/#目的)目的

动态的为对象附加额外的职责。装饰器为子类提供了灵活的替代方案，以扩展功能。

## [#](https://java-design-patterns.com/zh/patterns/decorator/#解释)解释

真实世界例子

> 附近的山丘上住着一个愤怒的巨魔。通常它是徒手的，但有时它有武器。为了武装巨魔不必创建新的巨魔，而是用合适的武器动态的装饰它。

通俗的说

> 装饰者模式让你可以在运行时通过把对象包装进一个装饰类对象中来动态的改变一个对象的行为。

维基百科说

> 在面向对象的编程中，装饰器模式是一种设计模式，它允许将行为静态或动态地添加到单个对象中，而不会影响同一类中其他对象的行为。装饰器模式通常对于遵守单一责任原则很有用，因为它允许将功能划分到具有唯一关注领域的类之间。

**程序示例**

以巨魔的为例。首先我有有一个简单的巨魔，实现了巨魔接口。



```java
public interface Troll {
  void attack();
  int getAttackPower();
  void fleeBattle();
}

@Slf4j
public class SimpleTroll implements Troll {

  @Override
  public void attack() {
    LOGGER.info("The troll tries to grab you!");
  }

  @Override
  public int getAttackPower() {
    return 10;
  }

  @Override
  public void fleeBattle() {
    LOGGER.info("The troll shrieks in horror and runs away!");
  }
}
```

下面我们想为巨魔添加球棒。我们可以用装饰者来动态的实现。



```java
@Slf4j
public class ClubbedTroll implements Troll {

  private final Troll decorated;

  public ClubbedTroll(Troll decorated) {
    this.decorated = decorated;
  }

  @Override
  public void attack() {
    decorated.attack();
    LOGGER.info("The troll swings at you with a club!");
  }

  @Override
  public int getAttackPower() {
    return decorated.getAttackPower() + 10;
  }

  @Override
  public void fleeBattle() {
    decorated.fleeBattle();
  }
}
```

这里是巨魔的实战



```java
// simple troll
var troll = new SimpleTroll();
troll.attack(); // The troll tries to grab you!
troll.fleeBattle(); // The troll shrieks in horror and runs away!

// change the behavior of the simple troll by adding a decorator
var clubbedTroll = new ClubbedTroll(troll);
clubbedTroll.attack(); // The troll tries to grab you! The troll swings at you with a club!
clubbedTroll.fleeBattle(); // The troll shrieks in horror and runs away!
```

## [#](https://java-design-patterns.com/zh/patterns/decorator/#类图)类图

![alt text](https://holon-image.oss-cn-beijing.aliyuncs.com/20221230113040iP5C6e.png)

## [#](https://java-design-patterns.com/zh/patterns/decorator/#适用性)适用性

使用装饰者

- 动态透明地向单个对象添加职责，即不影响其他对象
- 对于可以撤销的责任
- 当通过子类化进行扩展是不切实际的。有时可能会有大量的独立扩展，并且会产生大量的子类来支持每种组合。 否则类定义可能被隐藏或无法用于子类化。

## [#](https://java-design-patterns.com/zh/patterns/decorator/#教程)教程

- [Decorator Pattern Tutorialopen in new window](https://www.journaldev.com/1540/decorator-design-pattern-in-java-example)

## [#](https://java-design-patterns.com/zh/patterns/decorator/#java世界的例子)Java世界的例子

- [java.io.InputStreamopen in new window](http://docs.oracle.com/javase/8/docs/api/java/io/InputStream.html), [java.io.OutputStreamopen in new window](http://docs.oracle.com/javase/8/docs/api/java/io/OutputStream.html), [java.io.Readeropen in new window](http://docs.oracle.com/javase/8/docs/api/java/io/Reader.html) and [java.io.Writeropen in new window](http://docs.oracle.com/javase/8/docs/api/java/io/Writer.html)
- [java.util.Collections#synchronizedXXX()open in new window](http://docs.oracle.com/javase/8/docs/api/java/util/Collections.html#synchronizedCollection-java.util.Collection-)
- [java.util.Collections#unmodifiableXXX()open in new window](http://docs.oracle.com/javase/8/docs/api/java/util/Collections.html#unmodifiableCollection-java.util.Collection-)
- [java.util.Collections#checkedXXX()open in new window](http://docs.oracle.com/javase/8/docs/api/java/util/Collections.html#checkedCollection-java.util.Collection-java.lang.Class-)

## [#](https://java-design-patterns.com/zh/patterns/decorator/#鸣谢)