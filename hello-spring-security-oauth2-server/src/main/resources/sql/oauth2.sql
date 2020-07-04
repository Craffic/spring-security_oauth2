CREATE TABLE clientdetails (
  appId varchar2(128) NOT NULL PRIMARY KEY,
  resourceIds varchar2(256) DEFAULT NULL,
  appSecret varchar2(256) DEFAULT NULL,
  scope varchar2(256) DEFAULT NULL,
  grantTypes varchar2(256) DEFAULT NULL,
  redirectUrl varchar2(256) DEFAULT NULL,
  authorities varchar2(256) DEFAULT NULL,
  access_token_validity number(11) DEFAULT NULL,
  refresh_token_validity number(11) DEFAULT NULL,
  additionalInformation varchar2(4000) DEFAULT NULL,
  autoApproveScopes varchar2(256) DEFAULT NULL
);

CREATE TABLE oauth_access_token (
  token_id varchar2(256) DEFAULT NULL,
  token blob,
  authentication_id varchar2(128) NOT NULL PRIMARY KEY,
  user_name varchar2(256) DEFAULT NULL,
  client_id varchar2(256) DEFAULT NULL,
  authentication blob,
  refresh_token varchar2(256) DEFAULT NULL
);

CREATE TABLE oauth_approvals (
  userId varchar2(256) DEFAULT NULL,
  clientId varchar2(256) DEFAULT NULL,
  scope varchar2(256) DEFAULT NULL,
  status varchar2(10) DEFAULT NULL,
  expiresAt date DEFAULT NULL,
  lastModifiedAt date DEFAULT NULL
) ;

CREATE TABLE oauth_client_details (
  client_id varchar2(128) NOT NULL,
  resource_ids varchar2(256) DEFAULT NULL,
  client_secret varchar2(256) DEFAULT NULL,
  scope varchar2(256) DEFAULT NULL,
  authorized_grant_types varchar2(256) DEFAULT NULL,
  web_server_redirect_uri varchar2(256) DEFAULT NULL,
  authorities varchar2(256) DEFAULT NULL,
  access_token_validity number(11) DEFAULT NULL,
  refresh_token_validity number(11) DEFAULT NULL,
  additional_information varchar2(4000) DEFAULT NULL,
  autoapprove varchar2(256) DEFAULT NULL
);

CREATE TABLE oauth_client_token (
  token_id varchar2(256) DEFAULT NULL,
  token blob,
  authentication_id varchar2(128) NOT NULL PRIMARY KEY,
  user_name varchar2(256) DEFAULT NULL,
  client_id varchar2(256) DEFAULT NULL
);

CREATE TABLE oauth_code (
  code varchar2(256) DEFAULT NULL,
  authentication blob
);

CREATE TABLE oauth_refresh_token (
  token_id varchar2(256) DEFAULT NULL,
  token blob,
  authentication blob
);