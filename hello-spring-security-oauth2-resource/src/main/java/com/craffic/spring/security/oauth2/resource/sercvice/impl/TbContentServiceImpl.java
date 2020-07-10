package com.craffic.spring.security.oauth2.resource.sercvice.impl;

import com.craffic.spring.security.oauth2.resource.dao.TbContentDao;
import com.craffic.spring.security.oauth2.resource.domain.model.TbContent;
import com.craffic.spring.security.oauth2.resource.sercvice.TbContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TbContentServiceImpl implements TbContentService {

    @Autowired
    private TbContentDao contentDao;

    @Override
    public TbContent selectById(String id) {
        return contentDao.selectById(id);
    }
}
