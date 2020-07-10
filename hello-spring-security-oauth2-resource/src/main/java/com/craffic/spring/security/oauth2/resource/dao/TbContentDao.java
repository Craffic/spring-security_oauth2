package com.craffic.spring.security.oauth2.resource.dao;

import com.craffic.spring.security.oauth2.resource.domain.model.TbContent;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface TbContentDao {
    TbContent selectById(@Param("id") String id);
}
