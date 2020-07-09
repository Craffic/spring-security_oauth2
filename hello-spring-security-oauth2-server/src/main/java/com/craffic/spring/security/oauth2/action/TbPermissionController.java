package com.craffic.spring.security.oauth2.action;

import com.craffic.spring.security.oauth2.domain.model.TbPermission;
import com.craffic.spring.security.oauth2.domain.vo.TbPermissionVo;
import com.craffic.spring.security.oauth2.service.TbPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/permission")
public class TbPermissionController {
    @Autowired
    TbPermissionService permissionService;

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String queryUserById(String userId){

        List<TbPermission> permissions = permissionService.getTbPermissionByUserId(userId);
        if (permissions == null){
            return "请输入有效的权限名！";
        }
        return permissions.toString();
    }
}