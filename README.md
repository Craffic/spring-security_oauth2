# spring-security_oauth2
spring-security_oauth2基于内存储存令牌

1. 创建spring-security_oauth2工程，并创建pom.xml
2. 创建hello-spring-security-oauth2-dependencies项目，并创建pom.xml文件
3. 创建hello-spring-security-oauth2-server项目，并创建pom.xml
   3.1. 创建启动主类OAuth2ServerApplication.java
   3.2. 创建配置文件application.yml
   3.3. 创建com.craffic.spring.security.oauth2.server.config.AuthorizationServerConfiguration配置类，配置客户端信息到内存里，并配置注解@Configuration、@EnableAuthorizationServer
   3.4. 创建com.craffic.spring.security.oauth2.server.config。WebSecurityConfiguration 继承 WebSecurityConfigurerAdapter类
        3.4.1. 声明一个Bean：BCryptPasswordEncoder passwordEncoder，用来加密字符串
        3.4.2. override configure方法，配置用户信息
4. 通过浏览器访问， 第一次访问会跳转到登录页面
   http://localhost:8080/oauth/authorize?client_id=client&response_type=code
5. 授权，跳转到网关获取授权码   
   选择授权后会跳转到百度，浏览器地址上还会包含一个授权码（code=1JuO6V），浏览器地址栏会显示如下地址
   https://www.funtl.com/?code=IOMu2o
6. 向服务器申请令牌
   6.1. 通过 CURL 
        curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d 'grant_type=authorization_code&code=1JuO6V' "http://client:secret@localhost:8080/oauth/token"
   6.2. Postman 请求
        POST http://client:secret@localhost:8080/oauth/token
        param:
        grant_type        authorization_code
        code              IOMu2o   
7. 拿到token，可以到资源服务器申请访问资源        
