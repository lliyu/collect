/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : management-system

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 15/09/2019 20:32:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_attribute
-- ----------------------------
DROP TABLE IF EXISTS `sys_attribute`;
CREATE TABLE `sys_attribute` (
  `id` bigint(20) NOT NULL,
  `name` varchar(32) DEFAULT NULL COMMENT '属性名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_attribute
-- ----------------------------
BEGIN;
INSERT INTO `sys_attribute` VALUES (1, '菜单类型');
INSERT INTO `sys_attribute` VALUES (2, '请求方式');
COMMIT;

-- ----------------------------
-- Table structure for sys_attribute_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_attribute_detail`;
CREATE TABLE `sys_attribute_detail` (
  `id` bigint(20) NOT NULL,
  `attr_id` bigint(20) NOT NULL COMMENT '属性id',
  `name` varchar(255) DEFAULT NULL COMMENT '属性明细id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_attribute_detail
-- ----------------------------
BEGIN;
INSERT INTO `sys_attribute_detail` VALUES (1, 1, '页面');
INSERT INTO `sys_attribute_detail` VALUES (2, 1, '按钮');
INSERT INTO `sys_attribute_detail` VALUES (3, 2, 'DELETE');
INSERT INTO `sys_attribute_detail` VALUES (4, 2, 'POST');
INSERT INTO `sys_attribute_detail` VALUES (5, 2, 'GET');
INSERT INTO `sys_attribute_detail` VALUES (6, 1, '模块');
COMMIT;

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `login_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '登录时间',
  `login_iP` varchar(255) DEFAULT NULL COMMENT '登录ip',
  `login_total` int(11) DEFAULT NULL COMMENT '登录总次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for sys_operating_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_operating_record`;
CREATE TABLE `sys_operating_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_url` varchar(255) DEFAULT NULL COMMENT '请求的url',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '远程的ip地址',
  `params` varchar(255) DEFAULT NULL COMMENT '请求参数',
  `method` varchar(255) DEFAULT NULL COMMENT '请示方式',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `flag` varchar(255) DEFAULT NULL COMMENT '标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `request_type` varchar(255) DEFAULT NULL COMMENT '请求方式',
  `fid` bigint(20) DEFAULT NULL COMMENT '上级菜单id',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `type` varchar(32) DEFAULT NULL COMMENT '类型：页面、按钮',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `updater` varchar(32) DEFAULT NULL COMMENT '修改人',
  `icon_cls` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
BEGIN;
INSERT INTO `sys_permission` VALUES (1, '查询操作记录', '/sys/record/list', NULL, 29, NULL, 2, '2018-01-21 11:16:33', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_permission` VALUES (2, '删除属性明细', '/sys/attr/detail/list', NULL, 4, NULL, 2, '2018-01-03 21:16:05', NULL, 'wangwu', NULL, NULL);
INSERT INTO `sys_permission` VALUES (3, '删除角色', '/role/delete', NULL, 7, NULL, 2, '2018-01-03 21:12:41', NULL, 'wangwu', NULL, NULL);
INSERT INTO `sys_permission` VALUES (4, '字典属性', '/dictionaryList', NULL, 9, NULL, 1, '2018-01-03 21:13:22', NULL, 'wangwu', NULL, NULL);
INSERT INTO `sys_permission` VALUES (5, '登录统计', '/sys/login/total', NULL, 14, NULL, 2, '2018-01-12 09:48:44', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_permission` VALUES (6, '查询角色', '/role/list', NULL, 7, NULL, 2, '2018-01-03 21:12:00', NULL, 'wangwu', NULL, NULL);
INSERT INTO `sys_permission` VALUES (7, '角色管理', '/roleList', NULL, 26, NULL, 1, '2018-01-03 21:11:32', NULL, 'wangwu', NULL, NULL);
INSERT INTO `sys_permission` VALUES (8, '菜单列表', '/permisList', NULL, 26, NULL, 1, '2018-01-03 21:09:39', NULL, 'wangwu', NULL, NULL);
INSERT INTO `sys_permission` VALUES (9, '数据字典', '/', NULL, '0', NULL, 6, '2018-01-21 10:11:01', '2018-01-21 10:11:01', 'wangwu', NULL, 'icon iconfont icon-dic-manager');
INSERT INTO `sys_permission` VALUES (10, '查询菜单', '/permission/list', NULL, 8, NULL, 2, '2018-01-03 21:10:12', NULL, 'wangwu', NULL, NULL);
INSERT INTO `sys_permission` VALUES (11, '新增角色', '/role/add', NULL, 7, NULL, 2, '2018-01-03 21:12:23', NULL, 'wangwu', NULL, NULL);
INSERT INTO `sys_permission` VALUES (12, '查询登录日志', '/sys/login/logs', NULL, 21, NULL, 2, '2018-01-12 09:47:44', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_permission` VALUES (13, '用户管理', '/', NULL, '0', NULL, 6, '2018-01-21 10:10:35', '2018-01-21 10:10:35', 'wangwu', NULL, 'icon iconfont icon-yonghurenxiang');
INSERT INTO `sys_permission` VALUES (14, '统计图表', '/statistics', NULL, 28, NULL, 1, '2018-01-12 09:48:17', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_permission` VALUES (15, '用户列表', '/userlist', NULL, 13, NULL, 1, '2018-01-03 20:35:20', NULL, 'wangwu', NULL, NULL);
INSERT INTO `sys_permission` VALUES (16, '编辑用户状态', '/user/editUserStatus', NULL, 15, NULL, 2, '2018-01-10 21:50:53', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_permission` VALUES (17, '编辑个人信息', '/user/editUserInfo', NULL, 15, NULL, 2, '2018-01-15 21:56:27', '2018-01-15 21:56:27', 'admin', NULL, NULL);
INSERT INTO `sys_permission` VALUES (18, '查询属性', '/sys/attr/list', NULL, 4, NULL, 2, '2018-01-03 21:13:55', NULL, 'wangwu', NULL, NULL);
INSERT INTO `sys_permission` VALUES (19, '新增属性', '/sys/attr/add', NULL, 4, NULL, 2, '2018-01-03 21:14:19', NULL, 'wangwu', NULL, NULL);
INSERT INTO `sys_permission` VALUES (20, '请求统计', '/sys/request/total', NULL, 14, NULL, 2, '2018-01-12 09:49:22', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_permission` VALUES (21, '登录日志', '/loginLog', NULL, 28, NULL, 1, '2018-01-12 09:51:17', '2018-01-12 09:51:17', 'admin', NULL, NULL);
INSERT INTO `sys_permission` VALUES (22, '删除用户', '/user/delete', NULL, 15, NULL, 2, '2018-01-04 15:33:10', NULL, 'wangwu', NULL, NULL);
INSERT INTO `sys_permission` VALUES (23, '新增属性明细', '/sys/attr/detail/add', NULL, 4, NULL, 2, '2018-01-03 21:15:35', NULL, 'wangwu', NULL, NULL);
INSERT INTO `sys_permission` VALUES (24, '添加/编辑角色权限', '/role/add', NULL, 7, NULL, 2, '2018-01-04 21:48:58', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_permission` VALUES (25, '新增用户', '/user/add', NULL, 15, NULL, 2, '2018-01-04 15:35:41', NULL, 'wangwu', NULL, NULL);
INSERT INTO `sys_permission` VALUES (26, '权限管理', '/', NULL, '0', NULL, 6, '2018-01-21 10:10:49', '2018-01-21 10:10:49', 'wangwu', NULL, 'icon iconfont icon-Slice');
INSERT INTO `sys_permission` VALUES (27, '查询用户', '/user/list', NULL, 15, NULL, 2, '2018-01-03 21:07:44', NULL, 'wangwu', NULL, NULL);
INSERT INTO `sys_permission` VALUES (28, '系统管理', '/', NULL, '0', NULL, 6, '2018-01-21 10:11:16', '2018-01-21 10:11:16', 'admin', NULL, 'icon iconfont icon-xitongguanli');
INSERT INTO `sys_permission` VALUES (29, '操作记录', '/operatingRecord', NULL, 28, NULL, 1, '2018-01-21 11:16:15', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_permission` VALUES (30, '添加菜单', '/permission/add', NULL, 8, NULL, 2, '2018-01-03 21:10:35', NULL, 'wangwu', NULL, NULL);
INSERT INTO `sys_permission` VALUES (31, '删除菜单', '/permission/delete', NULL, 8, NULL, 2, '2018-01-03 21:10:49', NULL, 'wangwu', NULL, NULL);
INSERT INTO `sys_permission` VALUES (32, '删除属性', '/sys/attr/detail', NULL, 4, NULL, 2, '2018-01-04 16:43:50', NULL, 'wangwu', NULL, NULL);
INSERT INTO `sys_permission` VALUES (33, '查询属性明细', '/sys/attr/detail/delete', NULL, 4, NULL, 2, '2018-01-03 21:16:37', NULL, 'wangwu', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(60) DEFAULT NULL COMMENT '描述',
  `type` int(11) DEFAULT NULL COMMENT '角色类型  002普通用户 001 超级管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, 'user', '普通用户', 2);
INSERT INTO `sys_role` VALUES (2, 'admin', '超级管理员', 1);
INSERT INTO `sys_role` VALUES (3, '只能查看用户的角色', '只能查看用户的角色', 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` bigint(20) NOT NULL,
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_permission` VALUES (1, 2, 14);
INSERT INTO `sys_role_permission` VALUES (2, 2, 22);
INSERT INTO `sys_role_permission` VALUES (3, 2, 33);
INSERT INTO `sys_role_permission` VALUES (4, 1, 10);
INSERT INTO `sys_role_permission` VALUES (5, 2, 4);
INSERT INTO `sys_role_permission` VALUES (6, 2, 30);
INSERT INTO `sys_role_permission` VALUES (7, 1, 5);
INSERT INTO `sys_role_permission` VALUES (8, 2, 21);
INSERT INTO `sys_role_permission` VALUES (9, 2, 23);
INSERT INTO `sys_role_permission` VALUES (10, 2, 9);
INSERT INTO `sys_role_permission` VALUES (11, 2, 19);
INSERT INTO `sys_role_permission` VALUES (12, 2, 13);
INSERT INTO `sys_role_permission` VALUES (13, 2, 11);
INSERT INTO `sys_role_permission` VALUES (14, 2, 7);
INSERT INTO `sys_role_permission` VALUES (15, 1, 33);
INSERT INTO `sys_role_permission` VALUES (16, 1, 18);
INSERT INTO `sys_role_permission` VALUES (17, 2, 29);
INSERT INTO `sys_role_permission` VALUES (18, 2, 12);
INSERT INTO `sys_role_permission` VALUES (19, 2, 32);
INSERT INTO `sys_role_permission` VALUES (20, 2, 1);
INSERT INTO `sys_role_permission` VALUES (21, 1, 27);
INSERT INTO `sys_role_permission` VALUES (22, 2, 27);
INSERT INTO `sys_role_permission` VALUES (23, 1, 20);
INSERT INTO `sys_role_permission` VALUES (24, 2, 26);
INSERT INTO `sys_role_permission` VALUES (25, 2, 25);
INSERT INTO `sys_role_permission` VALUES (26, 1, 17);
INSERT INTO `sys_role_permission` VALUES (27, 2, 8);
INSERT INTO `sys_role_permission` VALUES (28, 2, 10);
INSERT INTO `sys_role_permission` VALUES (29, 2, 24);
INSERT INTO `sys_role_permission` VALUES (30, 2, 6);
INSERT INTO `sys_role_permission` VALUES (31, 3, 27);
INSERT INTO `sys_role_permission` VALUES (32, 1, 14);
INSERT INTO `sys_role_permission` VALUES (33, 2, 16);
INSERT INTO `sys_role_permission` VALUES (34, 2, 3);
INSERT INTO `sys_role_permission` VALUES (35, 2, 17);
INSERT INTO `sys_role_permission` VALUES (36, 2, 5);
INSERT INTO `sys_role_permission` VALUES (37, 2, 31);
INSERT INTO `sys_role_permission` VALUES (38, 2, 15);
INSERT INTO `sys_role_permission` VALUES (39, 2, 20);
INSERT INTO `sys_role_permission` VALUES (40, 2, 18);
INSERT INTO `sys_role_permission` VALUES (41, 2, 2);
INSERT INTO `sys_role_permission` VALUES (42, 2, 28);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL,
  `head_portraits` varchar(255) DEFAULT NULL COMMENT '头像',
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱|登录帐号',
  `pswd` varchar(32) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_nickname` (`nickname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, '/vue_shiro_photo/userImg/b03ccc77-fea8-47e6-be6a-837ab50f8805.jpg', 'Lady', 'lady@163.com', 'd477887b0636e5d87f79cc25c99d7dc9', '2018-01-11 20:04:38', '2018-01-12 09:23:56', 1);
INSERT INTO `sys_user` VALUES (2, '/vue_shiro_photo/userImg/b03ccc77-fea8-47e6-be6a-837ab50f8805.jpg', 'Cary', 'Cary@163.com', 'd477887b0636e5d87f79cc25c99d7dc9', '2018-01-11 20:06:48', '2018-01-11 20:08:08', 1);
INSERT INTO `sys_user` VALUES (3, '/vue_shiro_photo/userImg/b03ccc77-fea8-47e6-be6a-837ab50f8805.jpg', 'Harry', 'Harry@163.com', 'd477887b0636e5d87f79cc25c99d7dc9', '2018-01-04 16:36:20', '2018-01-12 14:51:31', 1);
INSERT INTO `sys_user` VALUES (4, '/vue_shiro_photo/userImg/b03ccc77-fea8-47e6-be6a-837ab50f8805.jpg', 'Jody', 'Jody@163.com', 'd477887b0636e5d87f79cc25c99d7dc9', '2018-01-04 21:43:31', '2018-01-12 09:21:45', 1);
INSERT INTO `sys_user` VALUES (5, '/vue_shiro_photo/userImg/b03ccc77-fea8-47e6-be6a-837ab50f8805.jpg', 'Kelly', 'Kelly@163.com', 'd477887b0636e5d87f79cc25c99d7dc9', '2018-01-11 20:04:09', '2018-01-21 09:50:33', 1);
INSERT INTO `sys_user` VALUES (6, '/vue_shiro_photo/userImg/6d0ccc2a-e852-4397-93eb-926ddeab4f82.jpg', 'Salad', 'Salad@163.com', 'd477887b0636e5d87f79cc25c99d7dc9', '2018-01-12 11:57:11', '2019-09-13 10:03:31', 1);
INSERT INTO `sys_user` VALUES (7, 'http://a.cphotos.bdimg.com/timg?image&quality=100&size=b4000_4000&sec=1568364286&di=92fc14740211bfa9a3ce714b08167084&src=http://i0.hdslb.com/bfs/article/645247f55aad0e514c44dc2875cf30f2293bde5a.jpg', 'admin', 'admin@163.com', '1702a132e769a623c1adb78353fc9503', '2018-01-04 21:57:51', '2018-01-21 11:14:16', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 6, 1);
INSERT INTO `sys_user_role` VALUES (2, 5, 1);
INSERT INTO `sys_user_role` VALUES (3, 7, 2);
INSERT INTO `sys_user_role` VALUES (4, 1, 1);
INSERT INTO `sys_user_role` VALUES (5, 2, 1);
INSERT INTO `sys_user_role` VALUES (6, 4, 1);
INSERT INTO `sys_user_role` VALUES (7, 3, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
