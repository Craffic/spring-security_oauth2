package com.craffic.spring.security.oauth2.domain.model;

import com.craffic.spring.security.oauth2.domain.BaseEntity.M_BaseEntity;

import java.io.Serializable;

public class TbPermission extends M_BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 父权限
     */
    private String parentId;
    /**
     * 权限名称
     */
    private String name;
    /**
     * 权限英文名称
     */
    private String enName;
    /**
     * 授权路径
     */
    private String url;
    /**
     * 备注
     */
    private String description;
}
