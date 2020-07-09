--role
insert  into tb_role(id,parent_id,name,enname,description,created,updated) values
(SYS_GUID(),SYS_GUID(),'超级管理员','admin',NULL,sysdate,sysdate);

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
--PERMISSION
/*系统管理   -- 37   3C3C5E58956E487D8EE705A1AE3B9269
    用户管理   --38
        查看用户  --39
        新增用户  --40
        编辑用户  --41
        删除用户  --42
    内容管理      --44
        查看内容  --45
        新增内容  --46
        编辑内容  --47
        删除内容  --48*/
--系统管理
insert  into tb_permission(id,parent_id,name,enname,url,description,created,updated) values
(SYS_GUID(),SYS_GUID(),'系统管理','System','/',NULL,sysdate,sysdate);
----用户管理  2CE0262478EA4052878DAB0BC8202999
insert  into tb_permission(id,parent_id,name,enname,url,description,created,updated) values
(SYS_GUID(),'3C3C5E58956E487D8EE705A1AE3B9269','用户管理','SystemUser','/users/',NULL,sysdate,sysdate);

insert into tb_permission(id,parent_id,name,enname,url,description,created,updated) values
(SYS_GUID(), '2CE0262478EA4052878DAB0BC8202999','查看用户','SystemUserView','/users/view/**',NULL, sysdate, sysdate);
insert into tb_permission(id,parent_id,name,enname,url,description,created,updated) values
(SYS_GUID(), '2CE0262478EA4052878DAB0BC8202999','新增用户','SystemUserInsert','/users/insert/**',NULL,sysdate, sysdate);
insert into tb_permission(id,parent_id,name,enname,url,description,created,updated) values
(SYS_GUID(), '2CE0262478EA4052878DAB0BC8202999','编辑用户','SystemUserUpdate','/users/update/**',NULL,sysdate, sysdate);
insert into tb_permission(id,parent_id,name,enname,url,description,created,updated) values
(SYS_GUID(), '2CE0262478EA4052878DAB0BC8202999','删除用户','SystemUserDelete','/users/delete/**',NULL,sysdate, sysdate);

----内容管理  4CBCC28F807741B2AA57E5474FEA53B9
insert  into tb_permission(id,parent_id,name,enname,url,description,created,updated) values
(SYS_GUID(),'3C3C5E58956E487D8EE705A1AE3B9269','内容管理','SystemContent','/contents/',NULL,sysdate,sysdate);

insert  into tb_permission(id,parent_id,name,enname,url,description,created,updated) values
(SYS_GUID(),'4CBCC28F807741B2AA57E5474FEA53B9','查看内容','SystemContentView','/contents/view/**',NULL,sysdate, sysdate);
insert  into tb_permission(id,parent_id,name,enname,url,description,created,updated) values
(SYS_GUID(),'4CBCC28F807741B2AA57E5474FEA53B9','新增内容','SystemContentInsert','/contents/insert/**',NULL,sysdate, sysdate);
insert  into tb_permission(id,parent_id,name,enname,url,description,created,updated) values
(SYS_GUID(),'4CBCC28F807741B2AA57E5474FEA53B9','编辑内容','SystemContentUpdate','/contents/update/**',NULL,sysdate, sysdate);
insert  into tb_permission(id,parent_id,name,enname,url,description,created,updated) values
(SYS_GUID(),'4CBCC28F807741B2AA57E5474FEA53B9','删除内容','SystemContentDelete','/contents/delete/**',NULL,sysdate, sysdate);

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
--tb_role_permission
insert into tb_role_permission(id,role_id,permission_id) values
(SYS_GUID(),'6B1B0284C0344687B30B3DE8485E13C8','3C3C5E58956E487D8EE705A1AE3B9269');
insert into tb_role_permission(id,role_id,permission_id) values
(SYS_GUID(),'6B1B0284C0344687B30B3DE8485E13C8','2CE0262478EA4052878DAB0BC8202999');
insert into tb_role_permission(id,role_id,permission_id) values
(SYS_GUID(),'6B1B0284C0344687B30B3DE8485E13C8','0FACA90C84E2461588045139522D9B93');
insert into tb_role_permission(id,role_id,permission_id) values
(SYS_GUID(),'6B1B0284C0344687B30B3DE8485E13C8','5A897BB449684AFC899E3176959ABC95');
insert into tb_role_permission(id,role_id,permission_id) values
(SYS_GUID(),'6B1B0284C0344687B30B3DE8485E13C8','ADCB067497A94731A19116555FA1F125');
insert into tb_role_permission(id,role_id,permission_id) values
(SYS_GUID(),'6B1B0284C0344687B30B3DE8485E13C8','CE5D0999D0E54DA9AB56BEAA2A6583A2');
insert into tb_role_permission(id,role_id,permission_id) values
(SYS_GUID(),'6B1B0284C0344687B30B3DE8485E13C8','4CBCC28F807741B2AA57E5474FEA53B9');
insert into tb_role_permission(id,role_id,permission_id) values
(SYS_GUID(),'6B1B0284C0344687B30B3DE8485E13C8','C4FC1DCCD9014285BE8E1A5B49033104');
insert into tb_role_permission(id,role_id,permission_id) values
(SYS_GUID(),'6B1B0284C0344687B30B3DE8485E13C8','02A46078628D4CC8B51FDA6D0047327A');
insert into tb_role_permission(id,role_id,permission_id) values
(SYS_GUID(),'6B1B0284C0344687B30B3DE8485E13C8','AF6181E62A28498A8E49595A4FE1D4B9');
insert into tb_role_permission(id,role_id,permission_id) values
(SYS_GUID(),'6B1B0284C0344687B30B3DE8485E13C8','3B63D4ECFBE34C0291C4A294955402AF');


---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
--tb_user_role
insert  into tb_user_role(id,user_id,role_id) values
(SYS_GUID(),'98E038FD91994CE9BCAF453DF89D298F','6B1B0284C0344687B30B3DE8485E13C8');
