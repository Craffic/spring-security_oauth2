package com.craffic.spring.security.oauth2.resource.domain.BaseEntity;

import lombok.Data;

import java.util.Date;

@Data
public class BaseEntity {
    /**
     * 每个对象共同属性：id， 创建日期， 更新日期
     */
    private String id;
    private Date created;
    private Date updated;
}
