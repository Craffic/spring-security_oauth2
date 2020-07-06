package com.craffic.spring.security.oauth2.service.impl;

import com.craffic.spring.security.oauth2.dao.TbUserDao;
import com.craffic.spring.security.oauth2.domain.vo.M_TbUserVo;
import com.craffic.spring.security.oauth2.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    TbUserDao userDao;

    @Override
    public M_TbUserVo getTbUserDetail(String userId) {
        if (userId == null){
            return null;
        }

        M_TbUserVo user = userDao.selectById(userId);
        return user;
    }

}
