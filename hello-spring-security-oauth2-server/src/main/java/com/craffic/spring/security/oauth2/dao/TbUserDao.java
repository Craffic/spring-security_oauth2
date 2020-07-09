package com.craffic.spring.security.oauth2.dao;

import com.craffic.spring.security.oauth2.domain.model.TbUser;
import com.craffic.spring.security.oauth2.domain.vo.M_TbUserVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface TbUserDao {
    M_TbUserVo selectById(@Param("id") String id);

    /**
     * 根据用户名查找用户
     */
    TbUser selectByName(@Param("name") String name);
}
