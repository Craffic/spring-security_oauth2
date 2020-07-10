package com.craffic.spring.security.oauth2.resource.sercvice;

import com.craffic.spring.security.oauth2.resource.domain.model.TbContent;

public interface TbContentService {
    TbContent selectById(String id);
}
