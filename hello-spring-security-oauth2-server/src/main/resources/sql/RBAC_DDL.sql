--TB_USER  用户表
CREATE TABLE TB_USER
(
  ID       VARCHAR2(50) NOT NULL PRIMARY KEY ,
  USERNAME VARCHAR2(50),
  PASSWORD VARCHAR2(50),
  PHONE    VARCHAR2(20),
  EMAIL    VARCHAR2(100),
  CREATED  DATE,
  UPDATED  DATE
);
comment on table TB_USER is '用户信息表';
comment on column TB_USER.ID is '用户id';
comment on column TB_USER.USERNAME is '用户姓名';
comment on column TB_USER.PASSWORD is '密码，加密存储';
comment on column TB_USER.PHONE is '注册手机号';
comment on column TB_USER.EMAIL is '注册邮箱';
comment on column TB_USER.CREATED is '创建时间';
comment on column TB_USER.UPDATED is '更新时间';
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
--TB_PERMISSION  权限表
CREATE TABLE TB_PERMISSION (
  ID VARCHAR2(50) NOT NULL PRIMARY KEY,
  PARENT_ID VARCHAR2(50) DEFAULT NULL,
  NAME VARCHAR2(64) NOT NULL,
  ENNAME VARCHAR2(64) NOT NULL,
  URL VARCHAR2(255) NOT NULL,
  DESCRIPTION VARCHAR2(200) DEFAULT NULL,
  CREATED DATE,
  UPDATED DATE
);
comment on table TB_PERMISSION is '权限表';
comment on column TB_PERMISSION.ID is '权限id';
comment on column TB_PERMISSION.PARENT_ID is '父权限';
comment on column TB_PERMISSION.NAME is '权限名称';
comment on column TB_PERMISSION.ENNAME is '权限英文名称';
comment on column TB_PERMISSION.URL is '授权路径';
comment on column TB_PERMISSION.DESCRIPTION is '备注';
comment on column TB_PERMISSION.CREATED is '创建时间';
comment on column TB_PERMISSION.UPDATED is '更新时间';


------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
--TB_ROLE  角色表
CREATE TABLE TB_ROLE (
  ID VARCHAR2(50) NOT NULL PRIMARY KEY,
  PARENT_ID VARCHAR2(50) DEFAULT NULL,
  NAME VARCHAR2(64) NOT NULL,
  ENNAME VARCHAR2(64) NOT NULL,
  DESCRIPTION VARCHAR2(200) DEFAULT NULL,
  CREATED DATE,
  UPDATED DATE
);
comment on table TB_ROLE is '角色表';
comment on column TB_ROLE.ID is '角色id';
comment on column TB_ROLE.PARENT_ID is '父角色';
comment on column TB_ROLE.NAME is '角色名称';
comment on column TB_ROLE.ENNAME is '角色英文名称';
comment on column TB_ROLE.DESCRIPTION is '备注';
comment on column TB_ROLE.CREATED is '创建时间';
comment on column TB_ROLE.UPDATED is '更新时间';

------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
--TB_ROLE_PERMISSION  角色权限表
CREATE TABLE TB_ROLE_PERMISSION (
  ID VARCHAR2(50) NOT NULL PRIMARY KEY,
  ROLE_ID VARCHAR2(50) NOT NULL,
  PERMISSION_ID VARCHAR2(50) NOT NULL
);
comment on table TB_ROLE_PERMISSION is '角色表';
comment on column TB_ROLE_PERMISSION.ID is '角色权限表id';
comment on column TB_ROLE_PERMISSION.ROLE_ID is '角色 ID';
comment on column TB_ROLE_PERMISSION.PERMISSION_ID is '权限 ID';

------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
--TB_USER_ROLE  用户角色表
CREATE TABLE TB_USER_ROLE (
  ID VARCHAR2(50) NOT NULL PRIMARY KEY,
  USER_ID VARCHAR2(50) NOT NULL,
  ROLE_ID VARCHAR2(50) NOT NULL
);
comment on table TB_USER_ROLE is '用户角色表';
comment on column TB_USER_ROLE.ID is '用户角色表id';
comment on column TB_USER_ROLE.USER_ID is '用户 ID';
comment on column TB_USER_ROLE.ROLE_ID is '角色 ID';