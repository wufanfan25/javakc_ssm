prompt PL/SQL Developer import file
prompt Created on 2019年4月12日 by lisiyu
set feedback off
set define off
prompt Dropping AHSYDW_ORG_TREE...
drop table AHSYDW_ORG_TREE cascade constraints;
prompt Dropping ANSYDW_ORG...
drop table ANSYDW_ORG cascade constraints;
prompt Dropping DATA_DICTIONARY...
drop table DATA_DICTIONARY cascade constraints;
prompt Dropping DATA_MENU...
drop table DATA_MENU cascade constraints;
prompt Dropping DATA_ROLE...
drop table DATA_ROLE cascade constraints;
prompt Dropping DATA_ROLE_MENU...
drop table DATA_ROLE_MENU cascade constraints;
prompt Dropping DATA_USER...
drop table DATA_USER cascade constraints;
prompt Dropping DATA_USER_ROLE...
drop table DATA_USER_ROLE cascade constraints;
prompt Creating AHSYDW_ORG_TREE...
create table AHSYDW_ORG_TREE
(
  ORG_TREE_ID    VARCHAR2(32) not null,
  ORG_TREE_NAME  VARCHAR2(50),
  ORG_TREE_PID   VARCHAR2(32),
  ORG_TREE_LEVEL NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table AHSYDW_ORG_TREE
  is '事业单位人事管理系统_机构树表结构';
comment on column AHSYDW_ORG_TREE.ORG_TREE_ID
  is '机构树ID';
comment on column AHSYDW_ORG_TREE.ORG_TREE_NAME
  is '机构树名称';
comment on column AHSYDW_ORG_TREE.ORG_TREE_PID
  is '机构树父ID';
comment on column AHSYDW_ORG_TREE.ORG_TREE_LEVEL
  is '机构树级别
1: 一级机构(省级)
2: 二级机构(市级)
3: 三级机构(县级)
';
alter table AHSYDW_ORG_TREE
  add constraint PK_AHSYDW_ORG_TREE primary key (ORG_TREE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ANSYDW_ORG...
create table ANSYDW_ORG
(
  ORG_ID      VARCHAR2(32) not null,
  ORG_NAME    VARCHAR2(50),
  ORG_TREE_ID VARCHAR2(32)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table ANSYDW_ORG
  is '事业单位人事管理系统_机构表';
comment on column ANSYDW_ORG.ORG_ID
  is '机构主键';
comment on column ANSYDW_ORG.ORG_NAME
  is '机构名称';
comment on column ANSYDW_ORG.ORG_TREE_ID
  is '机构树外键';
alter table ANSYDW_ORG
  add constraint PK_ANSYDW_ORG primary key (ORG_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ANSYDW_ORG
  add constraint FK_ANSYDW_O_REFERENCE_AHSYDW_O foreign key (ORG_TREE_ID)
  references AHSYDW_ORG_TREE (ORG_TREE_ID);

prompt Creating DATA_DICTIONARY...
create table DATA_DICTIONARY
(
  DATA_ID     VARCHAR2(32) not null,
  DATA_NAME   VARCHAR2(32),
  DATA_TYPE   VARCHAR2(32),
  DATA_CODE   VARCHAR2(32),
  DATA_VAL    VARCHAR2(32),
  DATA_COMMON VARCHAR2(32)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DATA_DICTIONARY.DATA_ID
  is '主键';
comment on column DATA_DICTIONARY.DATA_NAME
  is '名称';

prompt Creating DATA_MENU...
create table DATA_MENU
(
  MENU_ID         VARCHAR2(32) not null,
  MENU_NAME       VARCHAR2(25),
  MENU_LEVEL      NUMBER,
  MENU_URI        VARCHAR2(100),
  MENU_PERMISSION VARCHAR2(50),
  MENU_WEIGHT     NUMBER,
  MENU_STATE      NUMBER,
  MENU_PID        VARCHAR2(32)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table DATA_MENU
  is '基础信息菜单表';
comment on column DATA_MENU.MENU_ID
  is '菜单主键ID';
comment on column DATA_MENU.MENU_NAME
  is '菜单名称';
comment on column DATA_MENU.MENU_LEVEL
  is '菜单级别';
comment on column DATA_MENU.MENU_URI
  is '菜单访问路径';
comment on column DATA_MENU.MENU_PERMISSION
  is '菜单访问权限';
comment on column DATA_MENU.MENU_WEIGHT
  is '菜单权重(顺序)';
comment on column DATA_MENU.MENU_STATE
  is '菜单状态0:启用 1:禁用';
comment on column DATA_MENU.MENU_PID
  is '菜单父ID';
alter table DATA_MENU
  add constraint PK_DATA_MENU primary key (MENU_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating DATA_ROLE...
create table DATA_ROLE
(
  ROLE_ID     VARCHAR2(32) not null,
  ROLE_NAME   VARCHAR2(25),
  ROLE_REMARK VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DATA_ROLE
  is '角色表';
comment on column DATA_ROLE.ROLE_ID
  is '角色主键';
comment on column DATA_ROLE.ROLE_NAME
  is '角色名称';
comment on column DATA_ROLE.ROLE_REMARK
  is '角色备注';
alter table DATA_ROLE
  add constraint PK_DATA_ROLE primary key (ROLE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating DATA_ROLE_MENU...
create table DATA_ROLE_MENU
(
  ROLE_ID VARCHAR2(32),
  MENU_ID VARCHAR2(32)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DATA_ROLE_MENU
  is '基础信息菜单角色关系表';
comment on column DATA_ROLE_MENU.ROLE_ID
  is '角色外键';
comment on column DATA_ROLE_MENU.MENU_ID
  is '菜单外键';
alter table DATA_ROLE_MENU
  add constraint FK_DATA_ROL_REFERENCE_DATA_MEN foreign key (MENU_ID)
  references DATA_MENU (MENU_ID);
alter table DATA_ROLE_MENU
  add constraint FK_DATA_ROL_REFERENCE_DATA_ROL foreign key (ROLE_ID)
  references DATA_ROLE (ROLE_ID);

prompt Creating DATA_USER...
create table DATA_USER
(
  USER_ID    VARCHAR2(32),
  USER_NAME  VARCHAR2(32),
  LOGIN_NAME VARCHAR2(32),
  LOGIN_PASS VARCHAR2(64),
  USER_EMAIL VARCHAR2(32),
  USER_PHONE VARCHAR2(32),
  USER_SEX   NUMBER(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );

prompt Creating DATA_USER_ROLE...
create table DATA_USER_ROLE
(
  USER_ID VARCHAR2(32),
  ROLE_ID VARCHAR2(32)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table DATA_USER_ROLE
  is '用户角色关系表';
comment on column DATA_USER_ROLE.USER_ID
  is '用户外键';
comment on column DATA_USER_ROLE.ROLE_ID
  is '角色外键';

prompt Disabling triggers for AHSYDW_ORG_TREE...
alter table AHSYDW_ORG_TREE disable all triggers;
prompt Disabling triggers for ANSYDW_ORG...
alter table ANSYDW_ORG disable all triggers;
prompt Disabling triggers for DATA_DICTIONARY...
alter table DATA_DICTIONARY disable all triggers;
prompt Disabling triggers for DATA_MENU...
alter table DATA_MENU disable all triggers;
prompt Disabling triggers for DATA_ROLE...
alter table DATA_ROLE disable all triggers;
prompt Disabling triggers for DATA_ROLE_MENU...
alter table DATA_ROLE_MENU disable all triggers;
prompt Disabling triggers for DATA_USER...
alter table DATA_USER disable all triggers;
prompt Disabling triggers for DATA_USER_ROLE...
alter table DATA_USER_ROLE disable all triggers;
prompt Disabling foreign key constraints for ANSYDW_ORG...
alter table ANSYDW_ORG disable constraint FK_ANSYDW_O_REFERENCE_AHSYDW_O;
prompt Disabling foreign key constraints for DATA_ROLE_MENU...
alter table DATA_ROLE_MENU disable constraint FK_DATA_ROL_REFERENCE_DATA_MEN;
alter table DATA_ROLE_MENU disable constraint FK_DATA_ROL_REFERENCE_DATA_ROL;
prompt Loading AHSYDW_ORG_TREE...
insert into AHSYDW_ORG_TREE (ORG_TREE_ID, ORG_TREE_NAME, ORG_TREE_PID, ORG_TREE_LEVEL)
values ('b036c30071fe40e0a23a5a9b0e1095e0', '安徽省', '0', 1);
insert into AHSYDW_ORG_TREE (ORG_TREE_ID, ORG_TREE_NAME, ORG_TREE_PID, ORG_TREE_LEVEL)
values ('b793b99c3ad34615a009182b5092d201', '黄山市', 'b036c30071fe40e0a23a5a9b0e1095e0', 2);
insert into AHSYDW_ORG_TREE (ORG_TREE_ID, ORG_TREE_NAME, ORG_TREE_PID, ORG_TREE_LEVEL)
values ('b793b99c3ad34615a009182b5092d202', '芜湖市', 'b036c30071fe40e0a23a5a9b0e1095e0', 2);
insert into AHSYDW_ORG_TREE (ORG_TREE_ID, ORG_TREE_NAME, ORG_TREE_PID, ORG_TREE_LEVEL)
values ('b793b99c3ad34615a009182b5092d203', '淮南市', 'b036c30071fe40e0a23a5a9b0e1095e0', 2);
insert into AHSYDW_ORG_TREE (ORG_TREE_ID, ORG_TREE_NAME, ORG_TREE_PID, ORG_TREE_LEVEL)
values ('b793b99c3ad34615a009182b5092d204', '合肥市', 'b036c30071fe40e0a23a5a9b0e1095e0', 2);
commit;
prompt 5 records loaded
prompt Loading ANSYDW_ORG...
prompt Table is empty
prompt Loading DATA_DICTIONARY...
insert into DATA_DICTIONARY (DATA_ID, DATA_NAME, DATA_TYPE, DATA_CODE, DATA_VAL, DATA_COMMON)
values ('67e69b2f60f045bc8d7acb2ded3df7e1', '性别展示', 'sex', '1', '男', '1：男 2：女 3：保密');
insert into DATA_DICTIONARY (DATA_ID, DATA_NAME, DATA_TYPE, DATA_CODE, DATA_VAL, DATA_COMMON)
values ('e76f28cbf31a499987fb34f564a25780', '性别展示', 'sex', '2', '女', '1：男 2：女 3：保密');
insert into DATA_DICTIONARY (DATA_ID, DATA_NAME, DATA_TYPE, DATA_CODE, DATA_VAL, DATA_COMMON)
values ('803e994b5370477f9b343fe325cb629c', '性别展示', 'sex', '3', '保密', '1：男 2：女 3：保密');
insert into DATA_DICTIONARY (DATA_ID, DATA_NAME, DATA_TYPE, DATA_CODE, DATA_VAL, DATA_COMMON)
values ('b1cd5be1bc314af7a3e84dc26a4c30ee', '菜单级别', 'level', '1', '一级菜单', '1菜单2菜单3按钮');
insert into DATA_DICTIONARY (DATA_ID, DATA_NAME, DATA_TYPE, DATA_CODE, DATA_VAL, DATA_COMMON)
values ('2d95e0e58671499d9512abbd401fb1de', '菜单级别', 'level', '2', '二级菜单', '1菜单2菜单3按钮');
insert into DATA_DICTIONARY (DATA_ID, DATA_NAME, DATA_TYPE, DATA_CODE, DATA_VAL, DATA_COMMON)
values ('4f7c60f93b3c43ae8b7a42d534ffd55e', '菜单级别', 'level', '3', '三级按钮', '1菜单2菜单3按钮');
commit;
prompt 6 records loaded
prompt Loading DATA_MENU...
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('f80b50d5b65c4346a6fe7ec0f60a2898', '机构管理', 1, 'void', 'void', 400, 0, '0');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('b12332044b2a4ba59de359a5c9a0c6ae', '机构树管理', 2, 'view/org/tree/list.jsp', 'void', 410, 0, 'f80b50d5b65c4346a6fe7ec0f60a2898');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('0', 'ROOT', 0, 'root', 'root', 1, 0, null);
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('1', '系统管理', 1, 'system', 'system', 100, 0, '0');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('2', '用户管理', 2, 'user/query.do', 'user:query', 110, 0, '1');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('3', '角色管理', 2, 'role/query.do', 'role:query', 120, 0, '1');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('4', '菜单管理', 2, 'menu/query.do', 'menu:query', 130, 0, '1');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('5', '添加', 3, 'user/create.do', 'user:create', 111, 0, '2');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('6', '修改', 3, 'role/update.do', 'role:update', 121, 0, '3');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('7', '删除', 3, 'menu/delete.do', 'menu:delete', 131, 0, '4');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('3b184f791f95460f86d743ffe1828105', '主页一', 2, 'index_v1.html', 'javascript:void(0);', 3, 0, '1326ec7f149546709878a6f86f422981');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('24ce4a21d9c9428fbb966ec483a091d3', '主页二', 2, 'index_v2.html', 'javascirpt:void(0);', 4, 0, '1326ec7f149546709878a6f86f422981');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('a121059797194e8fab156e0fdcc47cff', '删除', 3, 'user/delete.do', 'user:delete', 112, 0, '2');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('34102a622bc140458afac5589a91068b', '修改', 3, 'user/update.do', 'user:update', 113, 0, '2');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('e7c1e0088c5b49ca8668122a7538637e', '添加', 3, 'role/create.do', 'role:create', 122, 0, '3');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('33b31633729d4c76ba2124e30c969dc8', '删除', 3, 'role/delete.do', 'role:delete', 123, 0, '3');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('75af56fb385b4ea3bedadaaf00e0994a', '添加', 3, 'menu/create.do', 'menu:create', 132, 0, '4');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('81395091647644c1895156a99e17e3f4', '修改', 3, 'menu/update.do', 'menu:update', 133, 0, '4');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('affa0363fad54c069b9d27e562221ffb', '数据字典', 1, 'dictionary', 'dictionary', 200, 0, '0');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('729e7a1e74bc46bdb1975fb657d9cbda', '数据源监控', 2, 'druid', 'druid', 140, 0, '1');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('1326ec7f149546709878a6f86f422981', '主页', 1, 'index_v1.html', 'index', 2, 0, '0');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('55775bfd871a43928a07b8a96a628b61', '测试模块', 1, 'test', 'test', 300, 0, '0');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('e9b75896a7ce49bf96bff13d43611a98', '字典管理', 2, 'dictionary/query.do', 'dictionary:query', 210, 0, 'affa0363fad54c069b9d27e562221ffb');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('9f681e30834d4fcaad918f9de5953baf', '缓存管理', 2, 'view/system/cache/list.jsp', 'cache', 140, 0, '1');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('71552df357c54af1819cee0909bc9b4a', '基本表单', 2, 'static/html/form/form_basic.html', 'void', 320, 0, '55775bfd871a43928a07b8a96a628b61');
insert into DATA_MENU (MENU_ID, MENU_NAME, MENU_LEVEL, MENU_URI, MENU_PERMISSION, MENU_WEIGHT, MENU_STATE, MENU_PID)
values ('0a2ec63450aa4002915437f4b035c552', '高级插件', 2, 'static/html/form/form_advanced.html', 'void', 330, 0, '55775bfd871a43928a07b8a96a628b61');
commit;
prompt 26 records loaded
prompt Loading DATA_ROLE...
insert into DATA_ROLE (ROLE_ID, ROLE_NAME, ROLE_REMARK)
values ('cf40d8523e484a14b43177b7eeb3204f', '普通角色', '只能查看自己的信息');
insert into DATA_ROLE (ROLE_ID, ROLE_NAME, ROLE_REMARK)
values ('a2cab51bfabc429d9c42819cb3da6bca', '超级管理员', '系统最高权限角色');
commit;
prompt 2 records loaded
prompt Loading DATA_ROLE_MENU...
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '0');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '1326ec7f149546709878a6f86f422981');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '3b184f791f95460f86d743ffe1828105');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '24ce4a21d9c9428fbb966ec483a091d3');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '1');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '2');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '5');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', 'a121059797194e8fab156e0fdcc47cff');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '34102a622bc140458afac5589a91068b');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '3');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '6');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', 'e7c1e0088c5b49ca8668122a7538637e');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '33b31633729d4c76ba2124e30c969dc8');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '4');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '7');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '75af56fb385b4ea3bedadaaf00e0994a');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '81395091647644c1895156a99e17e3f4');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '9f681e30834d4fcaad918f9de5953baf');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '729e7a1e74bc46bdb1975fb657d9cbda');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', 'affa0363fad54c069b9d27e562221ffb');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', 'e9b75896a7ce49bf96bff13d43611a98');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '55775bfd871a43928a07b8a96a628b61');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '71552df357c54af1819cee0909bc9b4a');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', '0a2ec63450aa4002915437f4b035c552');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', 'f80b50d5b65c4346a6fe7ec0f60a2898');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a2cab51bfabc429d9c42819cb3da6bca', 'b12332044b2a4ba59de359a5c9a0c6ae');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('cf40d8523e484a14b43177b7eeb3204f', '0');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('cf40d8523e484a14b43177b7eeb3204f', '1326ec7f149546709878a6f86f422981');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('cf40d8523e484a14b43177b7eeb3204f', '1');
insert into DATA_ROLE_MENU (ROLE_ID, MENU_ID)
values ('cf40d8523e484a14b43177b7eeb3204f', '2');
commit;
prompt 30 records loaded
prompt Loading DATA_USER...
insert into DATA_USER (USER_ID, USER_NAME, LOGIN_NAME, LOGIN_PASS, USER_EMAIL, USER_PHONE, USER_SEX)
values ('009565e5e14d4b679b0c6db2688d512e', '管理员', 'admin', '$shiro1$MD5$3$FSQYTgr0ZmByf0tBMSBy6g==$+YBULRmyPa+326I6JIr9BQ==', 'admin@javakc.com', '13888888888', 1);
insert into DATA_USER (USER_ID, USER_NAME, LOGIN_NAME, LOGIN_PASS, USER_EMAIL, USER_PHONE, USER_SEX)
values ('77c0b1e7675545ff9bae7e3ee6246623', '电控锁', 'dks', '$shiro1$MD5$3$GOAKoCiY5uVAOzH1Oo7Vow==$l7VqTX3ZmlqG3BTX0VCybQ==', 'dks@javakc.com', '13888888888', 2);
commit;
prompt 2 records loaded
prompt Loading DATA_USER_ROLE...
insert into DATA_USER_ROLE (USER_ID, ROLE_ID)
values ('009565e5e14d4b679b0c6db2688d512e', 'a2cab51bfabc429d9c42819cb3da6bca');
insert into DATA_USER_ROLE (USER_ID, ROLE_ID)
values ('77c0b1e7675545ff9bae7e3ee6246623', 'cf40d8523e484a14b43177b7eeb3204f');
commit;
prompt 2 records loaded
prompt Enabling foreign key constraints for ANSYDW_ORG...
alter table ANSYDW_ORG enable constraint FK_ANSYDW_O_REFERENCE_AHSYDW_O;
prompt Enabling foreign key constraints for DATA_ROLE_MENU...
alter table DATA_ROLE_MENU enable constraint FK_DATA_ROL_REFERENCE_DATA_MEN;
alter table DATA_ROLE_MENU enable constraint FK_DATA_ROL_REFERENCE_DATA_ROL;
prompt Enabling triggers for AHSYDW_ORG_TREE...
alter table AHSYDW_ORG_TREE enable all triggers;
prompt Enabling triggers for ANSYDW_ORG...
alter table ANSYDW_ORG enable all triggers;
prompt Enabling triggers for DATA_DICTIONARY...
alter table DATA_DICTIONARY enable all triggers;
prompt Enabling triggers for DATA_MENU...
alter table DATA_MENU enable all triggers;
prompt Enabling triggers for DATA_ROLE...
alter table DATA_ROLE enable all triggers;
prompt Enabling triggers for DATA_ROLE_MENU...
alter table DATA_ROLE_MENU enable all triggers;
prompt Enabling triggers for DATA_USER...
alter table DATA_USER enable all triggers;
prompt Enabling triggers for DATA_USER_ROLE...
alter table DATA_USER_ROLE enable all triggers;
set feedback on
set define on
prompt Done.
