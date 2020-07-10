package com.craffic.spring.security.oauth2.resource.domain.model;

import com.craffic.spring.security.oauth2.resource.domain.BaseEntity.BaseEntity;
import lombok.Data;

import java.io.Serializable;

@Data
public class TbContent extends BaseEntity implements Serializable {

    /*
        内容类目ID
     */
    private String categoryId;
    /*
        内容标题
     */
    private String title;
    /*
        子标题
     */
    private String subTitle;
    /*
        标题描述
     */
    private String titleDesc;
    /*
        链接
     */
    private String url;
    /*
        图片绝对路径
     */
    private String pic;
    /*
        图片2
     */
    private String pic2;
    /*
        内容
     */
    private String content;
}
