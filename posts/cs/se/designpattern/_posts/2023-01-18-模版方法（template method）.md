# [模板方法](https://www.liaoxuefeng.com/wiki/1252599548343744/1281319636041762)

------

> 定义一个操作中的算法的骨架，而将一些步骤延迟到子类中，使得子类可以不改变一个算法的结构即可重定义该算法的某些特定步骤。

模板方法（Template Method）是一个比较简单的模式。它的主要思想是，定义一个操作的一系列步骤，对于某些暂时确定不下来的步骤，就留给子类去实现好了，这样不同的子类就可以定义出不同的步骤。

因此，模板方法的核心在于定义一个“骨架”。我们还是举例说明。

假设我们开发了一个从数据库读取设置的类：

```
public class Setting {
    public final String getSetting(String key) {
        String value = readFromDatabase(key);
        return value;
    }

	private String readFromDatabase(String key) {
        // TODO: 从数据库读取
    }
}
```

由于从数据库读取数据较慢，我们可以考虑把读取的设置缓存起来，这样下一次读取同样的key就不必再访问数据库了。但是怎么实现缓存，暂时没想好，但不妨碍我们先写出使用缓存的代码：

```
public class Setting {
    public final String getSetting(String key) {
        // 先从缓存读取:
        String value = lookupCache(key);
        if (value == null) {
            // 在缓存中未找到,从数据库读取:
            value = readFromDatabase(key);
            System.out.println("[DEBUG] load from db: " + key + " = " + value);
            // 放入缓存:
            putIntoCache(key, value);
        } else {
            System.out.println("[DEBUG] load from cache: " + key + " = " + value);
        }
        return value;
    }
}
```

整个流程没有问题，但是，`lookupCache(key)`和`putIntoCache(key, value)`这两个方法还根本没实现，怎么编译通过？这个不要紧，我们声明抽象方法就可以：

```
public abstract class AbstractSetting {
    public final String getSetting(String key) {
        String value = lookupCache(key);
        if (value == null) {
            value = readFromDatabase(key);
            putIntoCache(key, value);
        }
        return value;
    }

    protected abstract String lookupCache(String key);

    protected abstract void putIntoCache(String key, String value);
}
```

因为声明了抽象方法，自然整个类也必须是抽象类。如何实现`lookupCache(key)`和`putIntoCache(key, value)`这两个方法就交给子类了。子类其实并不关心核心代码`getSetting(key)`的逻辑，它只需要关心如何完成两个小小的子任务就可以了。

假设我们希望用一个`Map`做缓存，那么可以写一个`LocalSetting`：

```
public class LocalSetting extends AbstractSetting {
    private Map<String, String> cache = new HashMap<>();

    protected String lookupCache(String key) {
        return cache.get(key);
    }

    protected void putIntoCache(String key, String value) {
        cache.put(key, value);
    }
}
```

如果我们要使用Redis做缓存，那么可以再写一个`RedisSetting`：

```
public class RedisSetting extends AbstractSetting {
    private RedisClient client = RedisClient.create("redis://localhost:6379");

    protected String lookupCache(String key) {
        try (StatefulRedisConnection<String, String> connection = client.connect()) {
            RedisCommands<String, String> commands = connection.sync();
            return commands.get(key);
        }
    }

    protected void putIntoCache(String key, String value) {
        try (StatefulRedisConnection<String, String> connection = client.connect()) {
            RedisCommands<String, String> commands = connection.sync();
            commands.set(key, value);
        }
    }
}
```

客户端代码使用本地缓存的代码这么写：

```
AbstractSetting setting1 = new LocalSetting();
System.out.println("test = " + setting1.getSetting("test"));
System.out.println("test = " + setting1.getSetting("test"));
```

要改成Redis缓存，只需要把`LocalSetting`替换为`RedisSetting`：

```
AbstractSetting setting2 = new RedisSetting();
System.out.println("autosave = " + setting2.getSetting("autosave"));
System.out.println("autosave = " + setting2.getSetting("autosave"));
```

可见，模板方法的核心思想是：父类定义骨架，子类实现某些细节。

为了防止子类重写父类的骨架方法，可以在父类中对骨架方法使用`final`。对于需要子类实现的抽象方法，一般声明为`protected`，使得这些方法对外部客户端不可见。

Java标准库也有很多模板方法的应用。在集合类中，`AbstractList`和`AbstractQueuedSynchronizer`都定义了很多通用操作，子类只需要实现某些必要方法。

### 练习

使用模板方法增加一个使用Guava Cache的子类。



# [Template method](https://java-design-patterns.com/zh/patterns/template-method/#%E6%95%99%E7%A8%8B)

**Behavioral****Gang of Four**大约 3 分钟

------

此页内容

- [目的](https://java-design-patterns.com/zh/patterns/template-method/#目的)
- [解释](https://java-design-patterns.com/zh/patterns/template-method/#解释)
- [类图](https://java-design-patterns.com/zh/patterns/template-method/#类图)
- [适用性](https://java-design-patterns.com/zh/patterns/template-method/#适用性)
- [教程](https://java-design-patterns.com/zh/patterns/template-method/#教程)
- [Java例子](https://java-design-patterns.com/zh/patterns/template-method/#java例子)
- [鸣谢](https://java-design-patterns.com/zh/patterns/template-method/#鸣谢)

## [#](https://java-design-patterns.com/zh/patterns/template-method/#目的)目的

在一个操作中定义算法的骨架，将某些步骤推迟到子类。模板方法允许子类重新定义算法的某些步骤，而无需更改算法的结构。

## [#](https://java-design-patterns.com/zh/patterns/template-method/#解释)解释

真实世界例子

> 偷东西的一般步骤是相同的。 首先，选择目标，然后以某种方式使其迷惑，最后，你偷走了该物品。然而这些步骤有很多实现方式。

通俗的说

> 模板方法模式在父类中列出一般的步骤然后让具体的子类定义实现细节。

维基百科说

> 在面向对象的编程中，模板方法是Gamma等人确定的行为设计模式之一。在《设计模式》一书中。模板方法是父类中一个方法，通常是一个抽象父类，根据许多高级步骤定义了操作的骨架。这些步骤本身由与模板方法在同一类中的其他帮助程序方法实现。

**编程示例**

让我们首先介绍模板方法类及其具体实现。



```java
public abstract class StealingMethod {

  private static final Logger LOGGER = LoggerFactory.getLogger(StealingMethod.class);

  protected abstract String pickTarget();

  protected abstract void confuseTarget(String target);

  protected abstract void stealTheItem(String target);

  public void steal() {
    var target = pickTarget();
    LOGGER.info("The target has been chosen as {}.", target);
    confuseTarget(target);
    stealTheItem(target);
  }
}

public class SubtleMethod extends StealingMethod {

  private static final Logger LOGGER = LoggerFactory.getLogger(SubtleMethod.class);

  @Override
  protected String pickTarget() {
    return "shop keeper";
  }

  @Override
  protected void confuseTarget(String target) {
    LOGGER.info("Approach the {} with tears running and hug him!", target);
  }

  @Override
  protected void stealTheItem(String target) {
    LOGGER.info("While in close contact grab the {}'s wallet.", target);
  }
}

public class HitAndRunMethod extends StealingMethod {

  private static final Logger LOGGER = LoggerFactory.getLogger(HitAndRunMethod.class);

  @Override
  protected String pickTarget() {
    return "old goblin woman";
  }

  @Override
  protected void confuseTarget(String target) {
    LOGGER.info("Approach the {} from behind.", target);
  }

  @Override
  protected void stealTheItem(String target) {
    LOGGER.info("Grab the handbag and run away fast!");
  }
}
```

这是包含模板方法的半身贼类。



```java
public class HalflingThief {

  private StealingMethod method;

  public HalflingThief(StealingMethod method) {
    this.method = method;
  }

  public void steal() {
    method.steal();
  }

  public void changeMethod(StealingMethod method) {
    this.method = method;
  }
}
```

最后，我们展示半身人贼如何利用不同的偷窃方法。



```java
    var thief = new HalflingThief(new HitAndRunMethod());
    thief.steal();
    thief.changeMethod(new SubtleMethod());
    thief.steal();
```

## [#](https://java-design-patterns.com/zh/patterns/template-method/#类图)类图

![alt text](https://holon-image.oss-cn-beijing.aliyuncs.com/20230103102626dWbcjB.png)

## [#](https://java-design-patterns.com/zh/patterns/template-method/#适用性)适用性

使用模板方法模式可以

- 一次性实现一个算法中不变的部分并将其留给子类来实现可能变化的行为。
- 子类之间的共同行为应分解并集中在一个共同类中，以避免代码重复。如Opdyke和Johnson所描述的，这是“重构概括”的一个很好的例子。你首先要确定现有代码中的差异，然后将差异拆分为新的操作。最后，将不同的代码替换为调用这些新操作之一的模板方法。
- 控制子类扩展。您可以定义一个模板方法，该方法在特定点调用“ 钩子”操作，从而仅允许在这些点进行扩展

## [#](https://java-design-patterns.com/zh/patterns/template-method/#教程)教程

- [Template-method Pattern Tutorialopen in new window](https://www.journaldev.com/1763/template-method-design-pattern-in-java)

## [#](https://java-design-patterns.com/zh/patterns/template-method/#java例子)Java例子

- [javax.servlet.GenericServlet.initopen in new window](https://jakarta.ee/specifications/servlet/4.0/apidocs/javax/servlet/GenericServlet.html#init--): Method `GenericServlet.init(ServletConfig config)` calls the parameterless method `GenericServlet.init()` which is intended to be overridden in subclasses. Method `GenericServlet.init(ServletConfig config)` is the template method in this example.

## [#](https://java-design-patterns.com/zh/patterns/template-method/#鸣谢)