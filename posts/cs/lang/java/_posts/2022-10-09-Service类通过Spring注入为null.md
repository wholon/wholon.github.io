通过Spring标注为Service的类如果依赖了其他的类，不能再通过new关键字初始化，否则依赖的其他类将无法完成初始化。

[Why is my Spring @Autowired field null?](https://stackoverflow.com/questions/19896870/why-is-my-spring-autowired-field-null)