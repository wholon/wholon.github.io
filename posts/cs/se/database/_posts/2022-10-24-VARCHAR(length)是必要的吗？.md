## [Would using varchar(5000) be bad compared to varchar(255)?](https://dba.stackexchange.com/questions/162113/would-using-varchar5000-be-bad-compared-to-varchar255)

 the larger the *defined* size of the column, the more memory and time are required to satisfy the exact same query (even if it does have a meaningless `DISTINCT`).

列的定义大小越大，为了满足同样的查询所需要的存储空间和时间越多。