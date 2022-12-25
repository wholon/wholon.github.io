使用MyBatis-Plus的批量插入功能，如果是MySQL，需要在JDBC url配置中添加rewriteBatchedStatements=true配置，才能使用，否则会是一条一条插入。

同时，如果是多个字段插入，由于默认的插入策略是NOT_NULL，如果插入的DO存在为空的字段，也会退化为逐个查询，需要给DO的每个字段加上`@TableField(insertStrategy = FieldStrategy.IGNORED)`注解才能执行。

如果是SQL Server，由于SQL Server在批量插入的时候参数不能超过2100个，比如一个实体有100个字段，那每次最多只能插入21个，效率也不高。

SQL Server提供了

**BULK INSERT的解决案：**

**BULK INSERT voucher_status_test FROM '/tmp/test.csv'
with (fieldterminator=',', rowterminator='\n',FIRE_TRIGGERS)**

但需要使用csv，致使我们无法使用框架提供的轮子，建议使用MySQL。

> SQL server同时提供了bulkInsert API，但是由于不支持时间类型，所以使用起来很鸡肋。https://learn.microsoft.com/zh-cn/sql/connect/jdbc/use-bulk-copy-api-batch-insert-operation?view=sql-server-ver16

另外，使用MySQL的时候注意如果使用foreach的方式，在数据量庞大时由于数据映射会耗费较长时间，所以需要谨慎使用。[MyBatis批量插入几千条数据慎用foreach_淡然坊-CSDN博客_mybatis批量更新几千条数据](https://blog.csdn.net/huanghanqian/article/details/83177178?utm_medium=distribute.pc_relevant_t0.none-task-blog-2~default~BlogCommendFromMachineLearnPai2~default-1.control&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-2~default~BlogCommendFromMachineLearnPai2~default-1.control)



sqlsession + sqlsession.flushStatements方式:

```java
SqlSession sqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH, false);

logger.debug("mybatis sql batchinsert start");
long start = System.currentTimeMillis();
for (int i = 0; i < user.length; i++) {
    User entity = user[i];
    userDao.insert(entity);
    if (i % 5000 == 4999) {
        sqlSession.flushStatements();
    }
}
sqlSession.flushStatements();
logger.debug("mybatis sql batchinsert end" + (System.currentTimeMillis() - start));
```

