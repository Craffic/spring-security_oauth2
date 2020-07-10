package com.craffic.spring.security.oauth2.resource.action;


import com.craffic.spring.security.oauth2.resource.domain.model.TbContent;
import com.craffic.spring.security.oauth2.resource.sercvice.TbContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/content")
public class TbContentAction {

    @Autowired
    private TbContentService contentService;

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String queryUserById(String id){
        TbContent content = contentService.selectById(id);
        if (content == null){
            return "请输入有效的内容ID！";
        }
        return content.toString();
    }
}
