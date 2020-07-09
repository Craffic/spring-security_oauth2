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
