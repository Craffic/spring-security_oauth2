package com.craffic.spring.security.oauth2.service;

import com.craffic.spring.security.oauth2.domain.model.TbPermission;
import com.craffic.spring.security.oauth2.domain.vo.TbPermissionVo;

import java.util.List;

public interface TbPermissionService {
    List<TbPermission> getTbPermissionByUserId(String userId);
}
