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



#添加Oracle数据库和Hikari连接池
1. 添加Oracle数据库依赖
```xml
<dependency>
    <groupId>com.oracle</groupId>
    <artifactId>ojdbc6</artifactId>
    <version>11.2.0.3</version>
</dependency>
```
2. 添加Hkari连接池依赖
````xml
<dependency>
    <groupId>com.zaxxer</groupId>
    <artifactId>HikariCP</artifactId>
    <version>3.3.1</version>
</dependency>
````
3. 添加连接池配置
````property
spring:
  datasource:
    type: com.zaxxer.hikari.HikariDataSource
    driver-class-name: oracle.jdbc.OracleDriver
    hikari:
      jdbc-url: jdbc:oracle:thin:@localhost:1521:DEV
      username: Craffic
      password: Craffic
      minimum-idle: 5
      idle-timeout: 600000
      auto-commit: true
      pool-name: MyHikariCP
      max-lifetime: 1800000
      connection-timeout: 30000
      connection-test-query: select 1
````
4. 重新覆盖数据源和配置客户端信息
```java
@Configuration
@EnableAuthorizationServer
public class AuthorizationServerConfiguration extends AuthorizationServerConfigurerAdapter {

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Bean
    @Primary
    @ConfigurationProperties(prefix = "spring.datasource")
    /**
     * 读取配置在application.yml里的数据源
     * @Bean
     * @Primary datasource已经在spring配置过了，我们再在application里配置的话就会出现重复配置的现象
     *          primary注解就会把默认的数据源配置覆盖掉
     * @ConfigurationProperties 还要指定配置的是谁
     */
    public DataSource dataSource() {
        // 配置数据源（注意，我使用的是 HikariCP 连接池），以上注解是指定数据源，否则会有冲突
        return DataSourceBuilder.create().build();
    }

    @Bean
    public TokenStore tokenStore() {
        // 基于 JDBC 实现，令牌保存到数据库
        return new JdbcTokenStore(dataSource());
    }

    @Bean
    public ClientDetailsService jdbcClientDetailsService() {
        // 基于 JDBC 实现，需要事先在数据库配置客户端信息
        return new JdbcClientDetailsService(dataSource());
    }

    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {
        // 设置令牌存储模式
        endpoints.tokenStore(tokenStore());
    }

    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
        // 客户端配置
        clients.withClientDetails(jdbcClientDetailsService());
    }
}
```


# 基于RBAC的方式获取用户信息和权限交给Security框架认证与授权
1. service方法根据用户名获取TbUser对象
2. TbPermissionService方法，根据用户id获取用户对应的权限
3. 新建UserDetailServiceImpl实现UserDetailService接口，并获取用户信息和对应权限
   把查询出来的userId、password、权限集合注入到User对象中，交给Security框架认证与授权。
````java
package com.craffic.spring.security.oauth2.server.config.service;

import com.craffic.spring.security.oauth2.domain.model.TbPermission;
import com.craffic.spring.security.oauth2.domain.model.TbUser;
import com.craffic.spring.security.oauth2.service.TbPermissionService;
import com.craffic.spring.security.oauth2.service.UserService;
import org.assertj.core.util.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.List;

public class UserDetailServiceImpl implements UserDetailsService {

    @Autowired
    private UserService userService;
    @Autowired
    private TbPermissionService permissionService;


    @Override
    public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {

        // 根据登录页面的用户名查询用户
        TbUser user = userService.getTbUserByUserName(name);

        List<GrantedAuthority> grantedAuthorities = Lists.newArrayList();
        if (user != null){
            // 根据用户id查询对应的权限
            List<TbPermission> permissions = permissionService.getTbPermissionByUserId(user.getId());
            permissions.forEach(tbPermission -> {
                GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(user.getId());
                grantedAuthorities.add(grantedAuthority);
            });
        }
        // 返回用户的
        return new User(user.getId(), user.getPassword(), grantedAuthorities);
    }
}
````   

4. 从以前的内存存储用户信息的方式，改为从数据库读取
````java
package com.craffic.spring.security.oauth2.server.config;

import com.craffic.spring.security.oauth2.server.config.service.UserDetailServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true, jsr250Enabled = true)
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Bean
    public BCryptPasswordEncoder passwordEncoder (){
        return new BCryptPasswordEncoder();
    }

    @Bean
    @Override
    public UserDetailsService userDetailsService(){
        return new UserDetailServiceImpl();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        // 基于内存存储用户信息方式
        /*auth.inMemoryAuthentication()
                .withUser("admin").password(passwordEncoder().encode("123456")).roles("ADMIN")
                .and()
                .withUser("user").password(passwordEncoder().encode("123456")).roles("USER");*/

        // JDBC方式读取用户信息和权限信息
        auth.userDetailsService(userDetailsService());
    }
}
````


