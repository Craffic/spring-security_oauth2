package com.craffic.spring.security.oauth2.action;

import com.craffic.spring.security.oauth2.domain.vo.M_TbUserVo;
import com.craffic.spring.security.oauth2.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/user")
public class UserController {
    @Autowired
    UserServiceImpl userService;

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String queryUserById(String userId){

        M_TbUserVo tbUSerDetail = userService.getTbUserDetail(userId);
        if (tbUSerDetail == null){
            return "请输入有效的用户ID！";
        }
        return tbUSerDetail.toString();
    }
}