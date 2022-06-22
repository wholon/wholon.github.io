# 创建一个RESTful风格的Web服务

原文链接：[Building a RESTful Web Service](https://spring.io/guides/gs/rest-service/)

本指南将指导您使用Spring创建“Hello, World”RESTful Web服务的过程。

## 你将建造什么

您将构建一个服务，在`http://localhost:8080/greeting`上接受HTTP GET请求。

它将以问候语的JSON表示形式进行响应，如下列表所示：

```json
{"id":1,"content":"Hello, World!"}
```

您可以使用查询字符串中的可选`name`参数自定义问候语，如下表所示：

```http
http://localhost:8080/greeting?name=User
```

`name`参数值覆盖`World`的默认值，并反映在响应中，如下表所示：

```json
{"id":1,"content":"Hello, User!"}
```

## 你需要的

- 大约15分钟
- 最喜欢的文本编辑器或IDE
- [JDK 1.8 ](http://www.oracle.com/technetwork/java/javase/downloads/index.html)或更高版本
- [Gradle 4+](http://www.gradle.org/downloads)或[Maven 3.2+](https://maven.apache.org/download.cgi)
- 您还可以将代码直接导入您的IDE：
  - [Spring Tool Suite (STS)](https://spring.io/guides/gs/sts)
  - [IntelliJ IDEA](https://spring.io/guides/gs/intellij-idea/)

## 如何完成本指南

与大多数Spring[入门指南](https://spring.io/guides)一样，您可以从头开始并完成每个步骤，也可以绕过您已经熟悉的基本设置步骤。无论哪种方式，你最终都会使用工作代码。

要**从头开始**，请转到[从Spring Initializr开始](https://spring.io/guides/gs/rest-service/#scratch)。

要**跳过基础知识**，请完成以下操作：

- [下载](https://github.com/spring-guides/gs-rest-service/archive/main.zip)并解压缩本指南的源存储库，或使用[Git](https://spring.io/understanding/Git)进行克隆：`git clone https://github.com/spring-guides/gs-rest-service.git`
- cd进入`gs-rest-service/initial`
- 跳转到[创建资源表示类](https://spring.io/guides/gs/rest-service/#initial)。

**完成后**，您可以根据`gs-rest-service/complete`中的代码检查结果。

## 从Spring Initializr开始

您可以使用此[预初始化项目](https://start.spring.io/#!type=maven-project&language=java&platformVersion=2.5.5&packaging=jar&jvmVersion=11&groupId=com.example&artifactId=rest-service&name=rest-service&description=Demo project for Spring Boot&packageName=com.example.rest-service&dependencies=web)，然后单击生成以下载ZIP文件。这个项目配置为符合本教程中的示例。

要手动初始化项目，请按照以下步骤操作：

1. 导航到[https://start.spring.io](https://start.spring.io/)。此服务提取应用程序所需的所有依赖项，并为您完成大部分设置。
2. 选择Gradle或Maven以及您想要使用的语言。本指南假设您选择了Java。
3. 点按“**依赖项**”，然后选择“**Spring Web**”。
4. 点击**生成**。
5. 下载生成的ZIP文件，这是根据您的选择配置的Web应用程序的存档。

> 如果您的IDE具有Spring Initializr集成，您可以从IDE完成此过程。
>
> 您还可以从Github分叉项目，并在IDE或其他编辑器中打开它。

## 创建资源表示类

现在您已经设置了项目并构建系统，您可以创建您的网络服务。

开始思考服务互动。

该服务将处理`/greeting`的`GET`请求，可选地使用查询字符串中的`name`参数。`GET`请求应返回一个`200 OK`响应，正文中包含JSON，表示问候语。它应该类似于以下输出：

```json
{
    "id": 1,
    "content": "Hello, World!"
}
```

`id`字段是问候语的唯一标识符，`content`是问候语的文本表示形式。

要对问候表示进行建模，请创建一个资源表示类。为此，请提供一个普通的旧Java对象，其中包含`id`和`content`数据的字段、构造函数和访问器，如下列表（来自`src/main/java/com/example/restservice/Greeting.java`）所示：

```java
package com.example.restservice;

public class Greeting {

	private final long id;
	private final String content;

	public Greeting(long id, String content) {
		this.id = id;
		this.content = content;
	}

	public long getId() {
		return id;
	}

	public String getContent() {
		return content;
	}
}
```

> 此应用程序使用[Jackson JSON](https://github.com/FasterXML/jackson)库将typeGreeting实例自动合并到JSON中。默认情况下，Web starter包括Jackson。

## 创建资源控制器

在Spring构建RESTful Web服务的方法中，HTTP请求由控制器处理。这些组件由[`@RestController`](https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/RestController.html)注释标识，以下列表中显示的`GreetingController`（from src`src/main/java/com/example/restservice/GreetingController.java`）通过返回`Greeting`类的新实例来处理`GET`请求`/greeting`：

```java
package com.example.restservice;

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingController {

	private static final String template = "Hello, %s!";
	private final AtomicLong counter = new AtomicLong();

	@GetMapping("/greeting")
	public Greeting greeting(@RequestParam(value = "name", defaultValue = "World") String name) {
		return new Greeting(counter.incrementAndGet(), String.format(template, name));
	}
}复制
```

这个控制器简洁简单，但引擎盖下有很多工作要做。我们一步一步地分解它。

`@GetMapping`注释确保HTTP GET请求对`/greeting`映射到thegreeting`greeting()`方法。

> There are companion annotations for other HTTP verbs (e.g. `@PostMapping` for POST). There is also a `@RequestMapping` annotation that they all derive from, and can serve as a synonym (e.g. `@RequestMapping(method=GET)`). 

`@RequestParam` binds the value of the query string parameter `name` into the `name` parameter of the `greeting()` method. If the `name` parameter is absent in the request, the `defaultValue` of `World` is used.

方法主体的实现根据`counter`中的下一个值创建并返回具有`id`和`content`属性的新`Greeting`对象，并使用问候`template`格式化给定`name`。

前面显示的传统MVC控制器和RESTful Web服务控制器之间的一个关键区别是HTTP响应主体的创建方式。这个RESTful Web服务控制器不是依靠视图技术对向HTML执行问候数据的服务器端渲染，而是填充并返回`Greeting`对象。对象数据将直接写入HTTP响应，作为JSON。

此代码使用Spring [`@RestController`](https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/RestController.html)注释，该注释将类标记为控制器，其中每个方法都返回一个域对象而不是视图。这是包括`@Controller`和`@ResponseBody`的缩写。

`Greeting`对象必须转换为JSON。由于Spring的HTTP消息转换器支持，您无需手动进行此转换。由于[Jackson 2](https://github.com/FasterXML/jackson)在类路径上，因此自动选择Spring的[`MappingJackson2HttpMessageConverter`](https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/http/converter/json/MappingJackson2HttpMessageConverter.html)将`Greeting`实例转换为JSON。

`@SpringBootApplication`是一个方便的注释，添加了以下所有内容：

- `@Configuration`：将类作为应用程序上下文的bean定义来源标记。
- `@EnableAutoConfiguration`：告诉Spring Boot根据类路径设置、其他bean和各种属性设置开始添加bean。例如，如果`spring-webmvc`在类路径上，此注释将应用程序标记为Web应用程序，并激活关键行为，例如设置`DispatcherServlet`。
- `@ComponentScan`：告诉Spring在`com/example`软件包中寻找其他组件、配置和服务，让它找到控制器。

`main()`方法使用Spring Boot的`SpringApplication.run()`方法启动应用程序。你注意到没有一行XML吗？也没有`web.xml`文件。这个Web应用程序是100%纯Java，您不必处理任何管道或基础设施的配置。

### 构建可执行的JAR

您可以使用Gradle或Maven从命令行运行应用程序。您还可以构建一个包含所有必要依赖项、类和资源的可执行JAR文件，并运行该文件。构建可执行罐可以轻松地在整个开发生命周期、在不同环境中等环境中作为应用程序发布、版本和部署服务。

如果您使用Gradle，您可以使用`./gradlew bootRun`运行应用程序。或者，您可以使用`./gradlew build`构建JAR文件，然后运行JAR文件，如下所示：

```sh
java -jar build/libs/gs-rest-service-0.1.0.jar
```

如果您使用Maven，则可以使用`./mvnw spring-boot:run`运行应用程序。或者，您可以使用`./mvnw clean package`构建JAR文件，然后运行JAR文件，如下所示：

```sh
java -jar target/gs-rest-service-0.1.0.jar
```

> 这里描述的步骤创建一个可运行的JAR。您还可以[构建经典的WAR文件](https://spring.io/guides/gs/convert-jar-to-war/)。

显示日志输出。该服务应在几秒钟内启动并运行。

## 测试服务

现在服务已上线，请访问`http://localhost:8080/greeting`，您应该在那里看到：

```json
{"id":1,"content":"Hello, World!"}
```

Provide a `name` query string parameter by visiting `http://localhost:8080/greeting?name=User`. Notice how the value of the `content` attribute changes from `Hello, World!` to `Hello, User!`, as the following listing shows:

```json
{"id":2,"content":"Hello, User!"}
```

这一变化表明，`GreetingController`中的`@RequestParam`安排工作正常。`name`参数已获得`World`的默认值，但可以通过查询字符串显式重写。

另请注意`id`属性是如何从`1`变为2的。这证明您正在处理多个请求的同一`GreetingController`实例，并且其`counter`字段正在按预期在每个调用中增加。

## 总结

恭喜你！您刚刚与Spring开发了一个RESTful网络服务。

![image-20220622172755117](https://holon-image.oss-cn-beijing.aliyuncs.com/20220622172756sDpZdI.png)

## See Also

The following guides may also be helpful:

- [Accessing GemFire Data with REST](https://spring.io/guides/gs/accessing-gemfire-data-rest/)
- [Accessing MongoDB Data with REST](https://spring.io/guides/gs/accessing-mongodb-data-rest/)
- [Accessing data with MySQL](https://spring.io/guides/gs/accessing-data-mysql/)
- [Accessing JPA Data with REST](https://spring.io/guides/gs/accessing-data-rest/)
- [Accessing Neo4j Data with REST](https://spring.io/guides/gs/accessing-neo4j-data-rest/)
- [Consuming a RESTful Web Service](https://spring.io/guides/gs/consuming-rest/)
- [Consuming a RESTful Web Service with AngularJS](https://spring.io/guides/gs/consuming-rest-angularjs/)
- [Consuming a RESTful Web Service with jQuery](https://spring.io/guides/gs/consuming-rest-jquery/)
- [Consuming a RESTful Web Service with rest.js](https://spring.io/guides/gs/consuming-rest-restjs/)
- [Securing a Web Application](https://spring.io/guides/gs/securing-web/)
- [Building REST services with Spring](https://spring.io/guides/tutorials/rest/)
- [React.js and Spring Data REST](https://spring.io/guides/tutorials/react-and-spring-data-rest/)
- [Building an Application with Spring Boot](https://spring.io/guides/gs/spring-boot/)
- [Creating API Documentation with Restdocs](https://spring.io/guides/gs/testing-restdocs/)
- [Enabling Cross Origin Requests for a RESTful Web Service](https://spring.io/guides/gs/rest-service-cors/)
- [Building a Hypermedia-Driven RESTful Web Service](https://spring.io/guides/gs/rest-hateoas/)
- [Circuit Breaker](https://spring.io/guides/gs/circuit-breaker/)