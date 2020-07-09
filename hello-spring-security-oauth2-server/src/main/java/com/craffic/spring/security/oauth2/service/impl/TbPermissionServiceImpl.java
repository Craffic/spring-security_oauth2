package com.craffic.spring.security.oauth2.service.impl;

import com.craffic.spring.security.oauth2.dao.TbPermissionDao;
import com.craffic.spring.security.oauth2.dao.TbUserDao;
import com.craffic.spring.security.oauth2.domain.model.TbPermission;
import com.craffic.spring.security.oauth2.domain.vo.M_TbUserVo;
import com.craffic.spring.security.oauth2.domain.vo.TbPermissionVo;
import com.craffic.spring.security.oauth2.service.TbPermissionService;
import com.craffic.spring.security.oauth2.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TbPermissionServiceImpl implements TbPermissionService {
    @Autowired
    TbPermissionDao permissionDao;

    @Override
    public List<TbPermission> getTbPermissionByUserId(String userId) {
        return permissionDao.getTbPermissionByUserId(userId);
    }
}
