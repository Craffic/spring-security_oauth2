package com.craffic.spring.security.oauth2.server.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;

@Configuration
@EnableAuthorizationServer
public class AuthorizationServerConfiguration extends AuthorizationServerConfigurerAdapter {

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    /**
     * 配置客户端
     * 做授权操作
     * 资源所有者，要对客户端授权
     * @param clients
     * @throws Exception
     */
    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
        // 客户端请求服务器， 要和客户端对接上，服务端要知道客户端是谁
        // 客户端的信息要存在服务端，不然不认识，不能全部人都能请求我的token或者授权码
        // 流程：
        // 客户端需要请求认证服务器，服务器通过回调地址返回授权码给客户端，认证服务器要存着客户端的信息
        // clients.inMemory()  把客户端信息存放在内存当中
        // withClient("client")  需要clientId  ，就叫client
        // secret("secret")    client_secret就叫secret
        // 总结：客户端的ID，客户端的安全码
        // authorizedGrantTypes   想用什么授权模式: authorization_code(授权码模式)
        // scopes  授权范围：比如QQ登录有道云笔记时，会获取qq的头像昵称性别等信息的范围。

        clients.inMemory().withClient("client").secret(passwordEncoder.encode("secret")).authorizedGrantTypes("authorization_code")
                .scopes("app")
                .redirectUris("http://www.funtl.com");
    }
}
