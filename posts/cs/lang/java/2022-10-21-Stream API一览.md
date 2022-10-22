# Stream 接口一览

## List 转 Stream

```java
// 转stream
list.stream()

// 并发处理
list.parallelStream()
```

## filter（过滤）

```java
Stream<T> filter(Predicate<? super T> predicate);
```

## map（元素转换）

```java
<R> Stream<R> map(Function<? super T, ? extends R> mapper);

IntStream mapToInt(ToIntFunction<? super T> mapper);

LongStream mapToLong(ToLongFunction<? super T> mapper);

DoubleStream mapToDouble(ToDoubleFunction<? super T> mapper);
```

## flatMap（元素转换）

```java
<R> Stream<R> flatMap(Function<? super T, ? extends Stream<? extends R>> mapper);

IntStream flatMapToInt(Function<? super T, ? extends IntStream> mapper);

LongStream flatMapToLong(Function<? super T, ? extends LongStream> mapper);

DoubleStream flatMapToDouble(Function<? super T, ? extends DoubleStream> mapper);
```

## distinct（去除重复，对象需要重写 equals、hashCode）

```java
Stream<T> distinct();
```

## sorted（排序）

```java
Stream<T> sorted();

Stream<T> sorted(Comparator<? super T> comparator);
```

## peek（生成新的流：流是单向的，例如用于日志打印）

```java
Stream<T> peek(Consumer<? super T> action);
```

## limit（取前面 `n` 个元素）

```java
Stream<T> limit(long maxSize);
```

## skip（跳过 `n` 个元素）

```java
Stream<T> skip(long n);
```

## forEach（遍历）

```java
void forEach(Consumer<? super T> action);

void forEachOrdered(Consumer<? super T> action);
```

## toArray（转换成数组）

```java
Object[] toArray();
<A> A[] toArray(IntFunction<A[]> generator);
```

## reduce（结果归并）

```java
T reduce(T identity, BinaryOperator<T> accumulator);

Optional<T> reduce(BinaryOperator<T> accumulator);

<U> U reduce(U identity,
            BiFunction<U, ? super T, U> accumulator,
            BinaryOperator<U> combiner);
```

## collect（转换成集合）

```java
<R> R collect(Supplier<R> supplier,
             BiConsumer<R, ? super T> accumulator,
             BiConsumer<R, R> combiner);

<R, A> R collect(Collector<? super T, A, R> collector);
```

## 转list

```java
// 转list
Collectors.toList();

// 转set
Collectors.toSet();

// 转map
List<TestVo> testList = new ArrayList<>(10);

Map<Long, TestVo> data = releaseList.stream()
       .collect(Collectors.toMap(TestVo::getId, x -> x));
```

## count（计数）

```java
long count();
```

## 查找

```java
boolean anyMatch(Predicate<? super T> predicate);

boolean allMatch(Predicate<? super T> predicate);

boolean noneMatch(Predicate<? super T> predicate);
```

## 查找

```java
Optional<T> findFirst();

Optional<T> findAny();
```

