package com.craffic.spring.security.oauth2.service;

import com.craffic.spring.security.oauth2.domain.model.TbPermission;
import com.craffic.spring.security.oauth2.domain.model.TbUser;
import com.craffic.spring.security.oauth2.domain.vo.M_TbUserVo;

public interface UserService {
    M_TbUserVo getTbUserDetail(String userId);

    TbUser getTbUserByUserName(String userName);
}
