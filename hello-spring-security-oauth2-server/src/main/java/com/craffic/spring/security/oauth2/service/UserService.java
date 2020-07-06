package com.craffic.spring.security.oauth2.service;

import com.craffic.spring.security.oauth2.domain.vo.M_TbUserVo;

public interface UserService {
    M_TbUserVo getTbUserDetail(String userId);
}
