package com.craffic.spring.security.oauth2.domain.vo;

import com.craffic.spring.security.oauth2.domain.BaseEntity.M_BaseEntity;
import lombok.Data;

import java.io.Serializable;

@Data
public class TbPermissionVo extends M_BaseEntity implements Serializable {
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
