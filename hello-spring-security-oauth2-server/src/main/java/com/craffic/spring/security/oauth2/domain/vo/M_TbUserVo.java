package com.craffic.spring.security.oauth2.domain.vo;

import com.craffic.spring.security.oauth2.domain.BaseEntity.M_BaseEntity;
import lombok.Data;

import java.io.Serializable;

@Data
public class M_TbUserVo extends M_BaseEntity implements Serializable {
    private static final long serialVersionUID = 1L;
    private String userName;
    private String phone;
    private String email;
}
