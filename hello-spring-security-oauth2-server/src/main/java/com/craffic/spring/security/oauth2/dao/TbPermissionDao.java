package com.craffic.spring.security.oauth2.dao;

import com.craffic.spring.security.oauth2.domain.model.TbPermission;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TbPermissionDao {
    /**
     * 根据用户id查询用户对应的权限
     */
    List<TbPermission> getTbPermissionByUserId(@Param("userId") String userId);
}
