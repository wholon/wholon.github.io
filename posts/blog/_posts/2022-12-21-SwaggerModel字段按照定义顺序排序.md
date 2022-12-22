# 1. 存在的问题

我们在项目中使用swagger2.0时，发现如下问题：

- 我们想要按字段排序必须显示声明排序字段@ApiModelProperty(position=0)
- swagger对注解@ApiOperation不支持position属性了，即不能按照指定接口顺序排序。（ps:官方也不提供解决，说设计如此，通过接口地址来排序。[链接](https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2Fspringfox%2Fspringfox%2Fissues%2F732)）

# 2.解决方法

查询[官网](https://links.jianshu.com/go?to=http%3A%2F%2Fspringfox.github.io%2Fspringfox%2Fdocs%2Fcurrent%2F%23plugins-available-for-extensibility)
 使用对应的扩展插件（ModelPropertyBuilderPlugin、OperationBuilderPlugin）

## 2.1使用ModelPropertyBuilderPlugin按代码顺序展示请求和响应字段

可以参考ModelPropertyBuilderPlugin的实现类ApiModelPropertyPropertyBuilder来实现自己的插件，
 大概实现思路为：获取到字段上有ApiModelProperty注解的字段所在的类，然后获取所有字段数组，看这个字段在数组的哪个位置，就设置position属性。
 实现代码如下：

```java


import com.fasterxml.jackson.databind.introspect.AnnotatedField;
import com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition;
import io.swagger.annotations.ApiModelProperty;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.stereotype.Component;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.schema.ModelPropertyBuilderPlugin;
import springfox.documentation.spi.schema.contexts.ModelPropertyContext;
import springfox.documentation.swagger.common.SwaggerPluginSupport;

import java.lang.reflect.Field;
import java.util.Optional;

import static springfox.documentation.schema.Annotations.findPropertyAnnotation;
import static springfox.documentation.swagger.schema.ApiModelProperties.findApiModePropertyAnnotation;

/**
 * 通过编写插件实现字段按类变量定义顺序排序,丰富模型属性
 * @author wanghaolong
 */
@Component
@Slf4j
public class CustomApiModelPropertyPositionBuilder implements ModelPropertyBuilderPlugin {


    @Override
    public boolean supports(DocumentationType delimiter) {
        return SwaggerPluginSupport.pluginDoesApply(delimiter);
    }


    @Override
    public void apply(ModelPropertyContext context) {
        Optional<BeanPropertyDefinition> beanPropertyDefinitionOpt = context.getBeanPropertyDefinition();
        Optional<ApiModelProperty> annotation = Optional.empty();
        if (context.getAnnotatedElement().isPresent()) {
            annotation = findApiModePropertyAnnotation(context.getAnnotatedElement().get());
        }
        if (context.getBeanPropertyDefinition().isPresent()) {
            annotation = findPropertyAnnotation(context.getBeanPropertyDefinition().get(), ApiModelProperty.class);
        }
        //必须是有ApiModelProperty注解的字段，并且beanPropertyDefinitionOpt带有注解
        if (annotation.isPresent() && beanPropertyDefinitionOpt.isPresent()) {
            BeanPropertyDefinition beanPropertyDefinition = beanPropertyDefinitionOpt.get();
            
            //获取到注解字段
            AnnotatedField field = beanPropertyDefinition.getField();
            //获取到字段所在的类
            Class<?> clazz = field.getDeclaringClass();
            //获取类中所有字段
            Field[] declaredFields = clazz.getDeclaredFields();
            Field declaredField;//获取当前字段的Field

            try {
                declaredField = clazz.getDeclaredField(field.getName());
            } catch (NoSuchFieldException | SecurityException e) {
                log.error("", e);
                return;
            }

            //获取当前字段在数组中的位置。然后设置position属性
            int indexOf = ArrayUtils.indexOf(declaredFields, declaredField);
            if (indexOf != -1) {
                context.getBuilder().position(indexOf);
            }
        }
    }
}
```

## 2.2使用OperationBuilderPlugin按代码顺序展示请求接口

可以参考OperationBuilderPlugin的实现类OperationHiddenReader来实现自己的插件，
 大概实现思路为：获取到接口上有ApiOperation注解所在的类，然后获取到该接口方法在类中的多少行，用行号来进行接口排序。
 实现代码如下：

```java


import com.google.common.collect.Lists;
import io.swagger.annotations.ApiOperation;
import javassist.ClassClassPath;
import javassist.ClassPool;
import javassist.CtClass;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import springfox.documentation.RequestHandler;
import springfox.documentation.service.StringVendorExtension;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.OperationBuilderPlugin;
import springfox.documentation.spi.service.contexts.OperationContext;
import springfox.documentation.spi.service.contexts.RequestMappingContext;
import springfox.documentation.swagger.common.SwaggerPluginSupport;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * 通过编写插件实现接口按定义顺序排序
 *
 * @author wanghaolong
 */
@Component
@Slf4j
public class CustomOperationBuilderPlugin implements OperationBuilderPlugin {

    @Override
    public boolean supports(DocumentationType documentationType) {
        return SwaggerPluginSupport.pluginDoesApply(documentationType);
    }


    @Override
    public void apply(OperationContext context) {
        //1.没有ApiOperation注解的直接返回
        Optional<ApiOperation> apiOperation = context.findAnnotation(ApiOperation.class);
        if (!apiOperation.isPresent()) {
            return;
        }

        //2.获取当前方法的位置，然后设置进position中
        try {
            Class<? extends OperationContext> operationContextClass = context.getClass();
            Field requestContextFiled = operationContextClass.getDeclaredField("requestContext");
            requestContextFiled.setAccessible(true);
            RequestMappingContext requestContext = (RequestMappingContext) requestContextFiled.get(context);

            Class<? extends RequestMappingContext> requestContextClass = requestContext.getClass();
            Field handler = requestContextClass.getDeclaredField("handler");
            handler.setAccessible(true);
            RequestHandler requestHandler = (RequestHandler) handler.get(requestContext);

            //得到当前handler对应的Controller
            Class<?> aClass = requestHandler.declaringClass();
            //获取所有方法
//            Method[] declaredMethods = aClass.getDeclaredMethods();
            //获取当前api对应哪个方法
            Method nowMethod = requestHandler.getHandlerMethod().getMethod();

            //等到当前方法在所有方法中的位置(TO:位置变成了编译后的位置，需要找到编译前的位置)
//            int indexOf = ArrayUtils.indexOf(declaredMethods, nowMethod);
            //使用javasisit获取到对应方法在原始类的多少行
            int indexOf = getMethodOriginalLine(aClass, nowMethod);
            if (indexOf != -1) {
                //swagger-ui高版本不支持position排序了，解决方法是引入knife4j-spring-ui
                //ps:找不到swagger-ui前端页面源代码加载位置，所以搞不定了~~~。有能力的小伙伴可以直接去修改swagger-ui的前端源代码
                context.operationBuilder().position(indexOf);
                //添加扩展参数：x-order（支持knife4j-spring-ui）
                context.operationBuilder().extensions(Lists.newArrayList(new StringVendorExtension("x-order", indexOf + "")));
            }

        } catch (Exception e) {
            log.warn("加载swagger中方法api={}，设置顺序出错。", context.getName(), e);
        }
    }

    /**
     * 获取方法在类中的原始开始行数
     *
     * @param clazz     原始类
     * @param nowMethod 需要查找的哪个方法
     * @return
     */
    private int getMethodOriginalLine(Class clazz, Method nowMethod) throws Exception {
        ClassPool pool = ClassPool.getDefault();
        //部署到tomcat需要添加下面两行代码，否则javassist.NotFoundException
        /* The default ClassPool returned by a static method ClassPool.getDefault()
         * searches the same path that the underlying JVM (Java virtual machine) has.
         * If a program is running on a web application server such as JBoss and Tomcat,
         * the ClassPoolobject may not be able to find user classes since such a web application
         * server uses multiple class loaders as well as the system class loader. In that case,
         * an additional class path must be registered to the ClassPool.
         **/
        ClassClassPath classPath = new ClassClassPath(this.getClass());
        pool.insertClassPath(classPath);

        String className = clazz.getName();
        CtClass cc = pool.get(className);
        Class<?>[] parameterTypes = nowMethod.getParameterTypes();
        String[] objects = Arrays.stream(parameterTypes).map(Class::getName).collect(Collectors.toList()).toArray(new String[]{});
        return cc.getDeclaredMethod(nowMethod.getName(), pool.get(objects)).getMethodInfo().getLineNumber(0);
    }
}
```



# 3.注意事项

原来swagger-ui.html地址也会保留
 访问地址： [http://ip:port/doc.html](https://links.jianshu.com/go?to=http%3A%2F%2Fip%3Aport%2Fdoc.html)
 使用到的包：

> 用于获取接口在源代码中的行数：
>  <groupId>org.javassist</groupId>
>  <artifactId>javassist</artifactId>
>  <version>3.21.0-GA</version>
>  用于前端页面展示：
>  <groupId>com.github.xiaoymin</groupId>
>  <artifactId>knife4j-spring-ui</artifactId>
>  <version>2.0.8</version>

# 4.参考资料

1. [https://github.com/springfox/springfox/issues/732](https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2Fspringfox%2Fspringfox%2Fissues%2F732)
2. [http://springfox.github.io/springfox/docs/current/#plugins-available-for-extensibility](https://links.jianshu.com/go?to=http%3A%2F%2Fspringfox.github.io%2Fspringfox%2Fdocs%2Fcurrent%2F%23plugins-available-for-extensibility)
3. [https://www.xiaominfo.com/2019/05/29/springfox-13/](https://links.jianshu.com/go?to=https%3A%2F%2Fwww.xiaominfo.com%2F2019%2F05%2F29%2Fspringfox-13%2F)
4. [https://gitee.com/xiaoym/knife4j](https://links.jianshu.com/go?to=https%3A%2F%2Fgitee.com%2Fxiaoym%2Fknife4j)



