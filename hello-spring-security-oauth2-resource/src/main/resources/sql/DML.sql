SELECT * FROM tb_content;
insert into tb_content(id, category_id, title, sub_title, title_desc, url, pic, pic2, content, created, updated) values
(SYS_GUID(),SYS_GUID(),'标题','子标题','标题说明','http://www.jd.com',NULL,NULL,NULL,SYSDATE,SYSDATE);
insert into tb_content(id, category_id, title, sub_title, title_desc, url, pic, pic2, content, created, updated) values
(SYS_GUID(),SYS_GUID(),'ad2','ad2','ad2','http://www.baidu.com',NULL,NULL,NULL,SYSDATE,SYSDATE);
insert into tb_content(id, category_id, title, sub_title, title_desc, url, pic, pic2, content, created, updated) values
(SYS_GUID(),SYS_GUID(),'ad3','ad3','ad3','http://www.sina.com.cn',NULL,NULL,NULL,SYSDATE,SYSDATE);
insert into tb_content(id, category_id, title, sub_title, title_desc, url, pic, pic2, content, created, updated) values
(SYS_GUID(),SYS_GUID(),'ad4','ad4','ad4','http://www.funtl.com',NULL,NULL,NULL,SYSDATE,SYSDATE);
COMMIT;


insert  into tb_content_category(id, parent_id, name, status, sort_order, is_parent, created, updated) values
(SYS_GUID(),SYS_GUID(),'LeeShop',1,1,1,SYSDATE,SYSDATE);
insert  into tb_content_category(id, parent_id, name, status, sort_order, is_parent, created, updated) values
(SYS_GUID(),'31490C4904F14A679396102FEDB636AC','首页',1,1,1,SYSDATE,SYSDATE);
insert  into tb_content_category(id, parent_id, name, status, sort_order, is_parent, created, updated) values
(SYS_GUID(),'31490C4904F14A679396102FEDB636AC','列表页面',1,1,1,SYSDATE,SYSDATE);
insert  into tb_content_category(id, parent_id, name, status, sort_order, is_parent, created, updated) values
(SYS_GUID(),'31490C4904F14A679396102FEDB636AC','详细页面',1,1,1,SYSDATE,SYSDATE);
insert  into tb_content_category(id, parent_id, name, status, sort_order, is_parent, created, updated) values
(SYS_GUID(),'5451B737A5F644098E9D738F9315ACC1','大广告',1,1,0,SYSDATE,SYSDATE);
insert  into tb_content_category(id, parent_id, name, status, sort_order, is_parent, created, updated) values
(SYS_GUID(),'5451B737A5F644098E9D738F9315ACC1','小广告',1,1,0,SYSDATE,SYSDATE);
insert  into tb_content_category(id, parent_id, name, status, sort_order, is_parent, created, updated) values
(SYS_GUID(),'5451B737A5F644098E9D738F9315ACC1','商城快报',1,1,0,SYSDATE,SYSDATE);
insert  into tb_content_category(id, parent_id, name, status, sort_order, is_parent, created, updated) values
(SYS_GUID(),'96080A6EE8724DD29C0E2006E2A33736','边栏广告',1,1,0,SYSDATE,SYSDATE);
insert  into tb_content_category(id, parent_id, name, status, sort_order, is_parent, created, updated) values
(SYS_GUID(),'96080A6EE8724DD29C0E2006E2A33736','页头广告',1,1,0,SYSDATE,SYSDATE);
insert  into tb_content_category(id, parent_id, name, status, sort_order, is_parent, created, updated) values
(SYS_GUID(),'96080A6EE8724DD29C0E2006E2A33736','页脚广告',1,1,0,SYSDATE,SYSDATE);
insert  into tb_content_category(id, parent_id, name, status, sort_order, is_parent, created, updated) values
(SYS_GUID(),'ABAA2312759740018E0BB0A128DA8509','边栏广告',1,1,0,SYSDATE,SYSDATE);
insert  into tb_content_category(id, parent_id, name, status, sort_order, is_parent, created, updated) values
(SYS_GUID(),'5451B737A5F644098E9D738F9315ACC1','中广告',1,1,1,SYSDATE,SYSDATE);
insert  into tb_content_category(id, parent_id, name, status, sort_order, is_parent, created, updated) values
(SYS_GUID(),'2D6B166DF0B34012BD820B4286FDFBEF','中广告1',1,1,0,SYSDATE,SYSDATE);
COMMIT;