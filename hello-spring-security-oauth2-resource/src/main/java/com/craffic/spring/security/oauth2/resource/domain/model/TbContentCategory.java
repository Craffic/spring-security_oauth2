package com.craffic.spring.security.oauth2.resource.domain.model;

import com.craffic.spring.security.oauth2.resource.domain.BaseEntity.BaseEntity;
import lombok.Data;

import java.io.Serializable;

@Data
public class TbContentCategory extends BaseEntity implements Serializable {

    /*
        父类目ID=0时，代表的是一级的类目
     */
    private String parentId;
    /*
        分类名称
     */
    private String name;
    /*
        状态。可选值:1(正常),2(删除)
     */
    private String status;
    /*
        排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数
     */
    private String sortOrder;
    /*
        该类目是否为父类目，1为true，0为false
     */
    private String parent;
}
