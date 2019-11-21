/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50513
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50513
File Encoding         : 65001

Date: 2019-04-12 13:42:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ahsydw_org_tree
-- ----------------------------
DROP TABLE IF EXISTS `ahsydw_org_tree`;
CREATE TABLE `ahsydw_org_tree` (
  `ORG_TREE_ID` varchar(32) DEFAULT NULL,
  `ORG_TREE_NAME` varchar(50) DEFAULT NULL,
  `ORG_TREE_PID` varchar(32) DEFAULT NULL,
  `ORG_TREE_LEVEL` bigint(22) DEFAULT NULL,
  UNIQUE KEY `PK_AHSYDW_ORG_TREE` (`ORG_TREE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ahsydw_org_tree
-- ----------------------------
INSERT INTO `ahsydw_org_tree` VALUES ('b036c30071fe40e0a23a5a9b0e1095e0', '安徽省', '0', '1');
INSERT INTO `ahsydw_org_tree` VALUES ('b793b99c3ad34615a009182b5092d201', '黄山市', 'b036c30071fe40e0a23a5a9b0e1095e0', '2');
INSERT INTO `ahsydw_org_tree` VALUES ('b793b99c3ad34615a009182b5092d202', '芜湖市', 'b036c30071fe40e0a23a5a9b0e1095e0', '2');
INSERT INTO `ahsydw_org_tree` VALUES ('b793b99c3ad34615a009182b5092d203', '淮南市', 'b036c30071fe40e0a23a5a9b0e1095e0', '2');
INSERT INTO `ahsydw_org_tree` VALUES ('b793b99c3ad34615a009182b5092d204', '合肥市', 'b036c30071fe40e0a23a5a9b0e1095e0', '2');

-- ----------------------------
-- Table structure for ansydw_org
-- ----------------------------
DROP TABLE IF EXISTS `ansydw_org`;
CREATE TABLE `ansydw_org` (
  `ORG_ID` varchar(32) DEFAULT NULL,
  `ORG_NAME` varchar(50) DEFAULT NULL,
  `ORG_TREE_ID` varchar(32) DEFAULT NULL,
  UNIQUE KEY `PK_ANSYDW_ORG` (`ORG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ansydw_org
-- ----------------------------

-- ----------------------------
-- Table structure for data_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `data_dictionary`;
CREATE TABLE `data_dictionary` (
  `DATA_ID` varchar(32) DEFAULT NULL,
  `DATA_NAME` varchar(32) DEFAULT NULL,
  `DATA_TYPE` varchar(32) DEFAULT NULL,
  `DATA_CODE` varchar(32) DEFAULT NULL,
  `DATA_VAL` varchar(32) DEFAULT NULL,
  `DATA_COMMON` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_dictionary
-- ----------------------------
INSERT INTO `data_dictionary` VALUES ('67e69b2f60f045bc8d7acb2ded3df7e1', '性别展示', 'sex', '1', '男', '1：男 2：女 3：保密');
INSERT INTO `data_dictionary` VALUES ('e76f28cbf31a499987fb34f564a25780', '性别展示', 'sex', '2', '女', '1：男 2：女 3：保密');
INSERT INTO `data_dictionary` VALUES ('803e994b5370477f9b343fe325cb629c', '性别展示', 'sex', '3', '保密', '1：男 2：女 3：保密');
INSERT INTO `data_dictionary` VALUES ('b1cd5be1bc314af7a3e84dc26a4c30ee', '菜单级别', 'level', '1', '一级菜单', '1菜单2菜单3按钮');
INSERT INTO `data_dictionary` VALUES ('2d95e0e58671499d9512abbd401fb1de', '菜单级别', 'level', '2', '二级菜单', '1菜单2菜单3按钮');
INSERT INTO `data_dictionary` VALUES ('4f7c60f93b3c43ae8b7a42d534ffd55e', '菜单级别', 'level', '3', '三级按钮', '1菜单2菜单3按钮');

-- ----------------------------
-- Table structure for data_menu
-- ----------------------------
DROP TABLE IF EXISTS `data_menu`;
CREATE TABLE `data_menu` (
  `MENU_ID` varchar(32) DEFAULT NULL,
  `MENU_NAME` varchar(25) DEFAULT NULL,
  `MENU_LEVEL` bigint(22) DEFAULT NULL,
  `MENU_URI` varchar(100) DEFAULT NULL,
  `MENU_PERMISSION` varchar(50) DEFAULT NULL,
  `MENU_WEIGHT` bigint(22) DEFAULT NULL,
  `MENU_STATE` bigint(22) DEFAULT NULL,
  `MENU_PID` varchar(32) DEFAULT NULL,
  UNIQUE KEY `PK_DATA_MENU` (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_menu
-- ----------------------------
INSERT INTO `data_menu` VALUES ('f80b50d5b65c4346a6fe7ec0f60a2898', '机构管理', '1', 'void', 'void', '400', '0', '0');
INSERT INTO `data_menu` VALUES ('b12332044b2a4ba59de359a5c9a0c6ae', '机构树管理', '2', 'view/org/tree/list.jsp', 'void', '410', '0', 'f80b50d5b65c4346a6fe7ec0f60a2898');
INSERT INTO `data_menu` VALUES ('0', 'ROOT', '0', 'root', 'root', '1', '0', null);
INSERT INTO `data_menu` VALUES ('1', '系统管理', '1', 'system', 'system', '100', '0', '0');
INSERT INTO `data_menu` VALUES ('2', '用户管理', '2', 'user/query.do', 'user:query', '110', '0', '1');
INSERT INTO `data_menu` VALUES ('3', '角色管理', '2', 'role/query.do', 'role:query', '120', '0', '1');
INSERT INTO `data_menu` VALUES ('4', '菜单管理', '2', 'menu/query.do', 'menu:query', '130', '0', '1');
INSERT INTO `data_menu` VALUES ('5', '添加', '3', 'user/create.do', 'user:create', '111', '0', '2');
INSERT INTO `data_menu` VALUES ('6', '修改', '3', 'role/update.do', 'role:update', '121', '0', '3');
INSERT INTO `data_menu` VALUES ('7', '删除', '3', 'menu/delete.do', 'menu:delete', '131', '0', '4');
INSERT INTO `data_menu` VALUES ('3b184f791f95460f86d743ffe1828105', '主页一', '2', 'index_v1.html', 'javascript:void(0);', '3', '0', '1326ec7f149546709878a6f86f422981');
INSERT INTO `data_menu` VALUES ('24ce4a21d9c9428fbb966ec483a091d3', '主页二', '2', 'index_v2.html', 'javascirpt:void(0);', '4', '0', '1326ec7f149546709878a6f86f422981');
INSERT INTO `data_menu` VALUES ('a121059797194e8fab156e0fdcc47cff', '删除', '3', 'user/delete.do', 'user:delete', '112', '0', '2');
INSERT INTO `data_menu` VALUES ('34102a622bc140458afac5589a91068b', '修改', '3', 'user/update.do', 'user:update', '113', '0', '2');
INSERT INTO `data_menu` VALUES ('e7c1e0088c5b49ca8668122a7538637e', '添加', '3', 'role/create.do', 'role:create', '122', '0', '3');
INSERT INTO `data_menu` VALUES ('33b31633729d4c76ba2124e30c969dc8', '删除', '3', 'role/delete.do', 'role:delete', '123', '0', '3');
INSERT INTO `data_menu` VALUES ('75af56fb385b4ea3bedadaaf00e0994a', '添加', '3', 'menu/create.do', 'menu:create', '132', '0', '4');
INSERT INTO `data_menu` VALUES ('81395091647644c1895156a99e17e3f4', '修改', '3', 'menu/update.do', 'menu:update', '133', '0', '4');
INSERT INTO `data_menu` VALUES ('affa0363fad54c069b9d27e562221ffb', '数据字典', '1', 'dictionary', 'dictionary', '200', '0', '0');
INSERT INTO `data_menu` VALUES ('729e7a1e74bc46bdb1975fb657d9cbda', '数据源监控', '2', 'druid', 'druid', '140', '0', '1');
INSERT INTO `data_menu` VALUES ('1326ec7f149546709878a6f86f422981', '主页', '1', 'index_v1.html', 'index', '2', '0', '0');
INSERT INTO `data_menu` VALUES ('55775bfd871a43928a07b8a96a628b61', '测试模块', '1', 'test', 'test', '300', '0', '0');
INSERT INTO `data_menu` VALUES ('e9b75896a7ce49bf96bff13d43611a98', '字典管理', '2', 'dictionary/query.do', 'dictionary:query', '210', '0', 'affa0363fad54c069b9d27e562221ffb');
INSERT INTO `data_menu` VALUES ('9f681e30834d4fcaad918f9de5953baf', '缓存管理', '2', 'view/system/cache/list.jsp', 'cache', '140', '0', '1');
INSERT INTO `data_menu` VALUES ('71552df357c54af1819cee0909bc9b4a', '基本表单', '2', 'static/html/form/form_basic.html', 'void', '320', '0', '55775bfd871a43928a07b8a96a628b61');
INSERT INTO `data_menu` VALUES ('0a2ec63450aa4002915437f4b035c552', '高级插件', '2', 'static/html/form/form_advanced.html', 'void', '330', '0', '55775bfd871a43928a07b8a96a628b61');

-- ----------------------------
-- Table structure for data_role
-- ----------------------------
DROP TABLE IF EXISTS `data_role`;
CREATE TABLE `data_role` (
  `ROLE_ID` varchar(32) DEFAULT NULL,
  `ROLE_NAME` varchar(25) DEFAULT NULL,
  `ROLE_REMARK` varchar(200) DEFAULT NULL,
  UNIQUE KEY `PK_DATA_ROLE` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_role
-- ----------------------------
INSERT INTO `data_role` VALUES ('cf40d8523e484a14b43177b7eeb3204f', '普通角色', '只能查看自己的信息');
INSERT INTO `data_role` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '超级管理员', '系统最高权限角色');

-- ----------------------------
-- Table structure for data_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `data_role_menu`;
CREATE TABLE `data_role_menu` (
  `ROLE_ID` varchar(32) DEFAULT NULL,
  `MENU_ID` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_role_menu
-- ----------------------------
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '0');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '1326ec7f149546709878a6f86f422981');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '3b184f791f95460f86d743ffe1828105');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '24ce4a21d9c9428fbb966ec483a091d3');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '1');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '2');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '5');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', 'a121059797194e8fab156e0fdcc47cff');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '34102a622bc140458afac5589a91068b');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '3');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '6');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', 'e7c1e0088c5b49ca8668122a7538637e');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '33b31633729d4c76ba2124e30c969dc8');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '4');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '7');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '75af56fb385b4ea3bedadaaf00e0994a');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '81395091647644c1895156a99e17e3f4');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '9f681e30834d4fcaad918f9de5953baf');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '729e7a1e74bc46bdb1975fb657d9cbda');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', 'affa0363fad54c069b9d27e562221ffb');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', 'e9b75896a7ce49bf96bff13d43611a98');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '55775bfd871a43928a07b8a96a628b61');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '71552df357c54af1819cee0909bc9b4a');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', '0a2ec63450aa4002915437f4b035c552');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', 'f80b50d5b65c4346a6fe7ec0f60a2898');
INSERT INTO `data_role_menu` VALUES ('a2cab51bfabc429d9c42819cb3da6bca', 'b12332044b2a4ba59de359a5c9a0c6ae');
INSERT INTO `data_role_menu` VALUES ('cf40d8523e484a14b43177b7eeb3204f', '0');
INSERT INTO `data_role_menu` VALUES ('cf40d8523e484a14b43177b7eeb3204f', '1326ec7f149546709878a6f86f422981');
INSERT INTO `data_role_menu` VALUES ('cf40d8523e484a14b43177b7eeb3204f', '1');
INSERT INTO `data_role_menu` VALUES ('cf40d8523e484a14b43177b7eeb3204f', '2');

-- ----------------------------
-- Table structure for data_user
-- ----------------------------
DROP TABLE IF EXISTS `data_user`;
CREATE TABLE `data_user` (
  `USER_ID` varchar(32) DEFAULT NULL,
  `USER_NAME` varchar(32) DEFAULT NULL,
  `LOGIN_NAME` varchar(32) DEFAULT NULL,
  `LOGIN_PASS` varchar(64) DEFAULT NULL,
  `USER_EMAIL` varchar(32) DEFAULT NULL,
  `USER_PHONE` varchar(32) DEFAULT NULL,
  `USER_SEX` decimal(1,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_user
-- ----------------------------
INSERT INTO `data_user` VALUES ('009565e5e14d4b679b0c6db2688d512e', '管理员', 'admin', '$shiro1$MD5$3$FSQYTgr0ZmByf0tBMSBy6g==$+YBULRmyPa+326I6JIr9BQ==', 'admin@javakc.com', '13888888888', '1');
INSERT INTO `data_user` VALUES ('77c0b1e7675545ff9bae7e3ee6246623', '电控锁', 'dks', '$shiro1$MD5$3$GOAKoCiY5uVAOzH1Oo7Vow==$l7VqTX3ZmlqG3BTX0VCybQ==', 'dks@javakc.com', '13888888888', '2');

-- ----------------------------
-- Table structure for data_user_role
-- ----------------------------
DROP TABLE IF EXISTS `data_user_role`;
CREATE TABLE `data_user_role` (
  `USER_ID` varchar(32) DEFAULT NULL,
  `ROLE_ID` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_user_role
-- ----------------------------
INSERT INTO `data_user_role` VALUES ('009565e5e14d4b679b0c6db2688d512e', 'a2cab51bfabc429d9c42819cb3da6bca');
INSERT INTO `data_user_role` VALUES ('77c0b1e7675545ff9bae7e3ee6246623', 'cf40d8523e484a14b43177b7eeb3204f');
