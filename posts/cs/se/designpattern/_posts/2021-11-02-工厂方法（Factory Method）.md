# 设计模式-工厂方法

## 工厂方法

### 示例一
![在这里插入图片描述](https://cdn.jsdelivr.net/gh/wholon/image@main/uPic/d9259c6ef4684eaa90ad27aa026fe5ec.png)

```java
package creational.factory_method;

import java.math.BigDecimal;

/**
 * 数字工厂接口
 *
 * @author holon
 * @date 2021/10/16 8:58 下午
 */
public interface NumberFactory {
    /**
     * 返回转换后的数字
     * @param s 接收的参数
     * @return 转换后的数字
     */
    Number parse(String s);

    /**
     * 获取工厂实例
     * @return 工厂实例
     */
    static NumberFactory getFactory() {
        return IMPL;
    }

    NumberFactory IMPL = new NumberFactoryImpl();
}
```

```java
package creational.factory_method;

import java.math.BigDecimal;

/**
 * 数字工厂实现类
 *
 * @author holon
 * @date 2021/10/16 8:59 下午
 */
public class NumberFactoryImpl implements NumberFactory{
    @Override
    public Number parse(String s) {
        return new BigDecimal(s);
    }
}
```

```java
package creational.factory_method;

/**
 * 数字工厂测试客户端
 *
 * @author holon
 * @date 2021/10/16 9:03 下午
 */
public class NumberClient {
    public static void main(String[] args) {
    	// 注意这里，客户端并不知道 NumberFactory 的底层实现细节
        NumberFactory numberFactory = NumberFactory.getFactory();
        Number result = numberFactory.parse("123.456");
        System.out.println("result = " + result);
    }
}
```

## 静态工厂方法
在实际使用的时候，我们可能并不需要那么麻烦的写复杂的工厂，而是通过静态方法直接返回产品，这种方式称为静态工厂方法（Static Factory Method）。
```java
package creational.factory_method.static_factory_method;

import java.math.BigDecimal;

/**
 * 静态工厂方法
 *
 * @author holon
 * @date 2021/10/16 9:06 下午
 */
public class NumberFactory {
    public static Number parse(String s) {
        return new BigDecimal(s);
    }
}
```

### 示例二
![在这里插入图片描述](https://cdn.jsdelivr.net/gh/wholon/image@main/uPic/3819e4e57b374e7e9ab6ed5140d98336.png)

```java
package creational.factory_method.sample2;

import java.time.LocalDate;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 使用静态工厂方法实现一个类似20200202的整数转换为LocalDate
 *
 * @author holon
 * @date 2021/10/16 10:10 下午
 */
public class LocalDateFactory {
    public static LocalDate fromInt(int yyyyMMdd) {
        // 缓存 2020-01-01 到 2030-12-31 之间的日期
        if (yyyyMMdd >= 20200101 && yyyyMMdd <= 20301231) {
            LocalDate result = CACHE.get(yyyyMMdd);
            if (result == null) {
                result = create(yyyyMMdd);
                CACHE.put(yyyyMMdd, result);
            }

            return result;
        }

        return create(yyyyMMdd);
    }

    private static final Map<Integer, LocalDate> CACHE = new ConcurrentHashMap<>();

    private static LocalDate create(int yyyyMMdd) {
        return LocalDate.of(yyyyMMdd / 10000, yyyyMMdd / 100 % 100, yyyyMMdd % 100);
    }
}
```

```java
package creational.factory_method.sample2;

import java.time.LocalDate;

/**
 * LocalDateFactory的客户端
 *
 * @author holon
 * @date 2021/10/16 10:31 下午
 */
public class DateClient {
    public static void main(String[] args) {
        LocalDate ld = LocalDateFactory.fromInt(20200202);
        System.out.println("ld = " + ld);
        LocalDate ld2 = LocalDateFactory.fromInt(20200202);
        System.out.println(ld == ld2);
        /*
        输出结果：
        ld = 2020-02-02
		true
        */
    }
}
```

## 示例三

![image-20221229115207564](https://holon-image.oss-cn-beijing.aliyuncs.com/20221229115207PGjJwH.png)

1. 产品(Product)将会对接口进行声明。对于所有由创建者及 其子类构建的对象， 这些接口都是通用的。

2. 具体产品(Concrete Products)是产品接口的不同实现。

3. 创建者(Creator)类声明返回产品对象的工厂方法。该方法的返回对象类型必须与产品接口相匹配。

   你可以将工厂方法声明为抽象方法， 强制要求每个子类以不 同方式实现该方法。 或者， 你也可以在基础工厂方法中返回 默认产品类型。

   注意， 尽管它的名字是创建者， 但它最主要的职责并不是创 建产品。 一般来说， 创建者类包含一些与产品相关的核心业 务逻辑。 工厂方法将这些逻辑处理从具体产品类中分离出来。 打个比方， 大型软件开发公司拥有程序员培训部门。 但是， 这些公司的主要工作还是编写代码， 而非生产程序员。

4. 具体创建者(Concrete Creators) 将会重写基础工厂方法， 使其返回不同类型的产品。

   注意， 并不一定每次调用工厂方法都会创建新的实例。 工厂 方法也可以返回缓存、 对象池或其他来源的已有对象。


## 总结

## 排版规范
本文遵循 [中文排版指南](https://github.com/mzlogin/chinese-copywriting-guidelines) 规范。