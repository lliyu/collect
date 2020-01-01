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

 Date: 01/01/2020 21:16:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '采集菜单id',
  `name` varchar(50) NOT NULL COMMENT '采集器名称',
  `step` int(12) NOT NULL COMMENT '采集步骤数',
  `uid` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of collect
-- ----------------------------
BEGIN;
INSERT INTO `collect` VALUES (1, '尤果网数据采集', 2, NULL, '2019-10-05 21:02:40', '2019-10-05 21:02:44');
INSERT INTO `collect` VALUES (5, 'meitu', 2, 0, '2019-12-31 14:21:09', '2019-12-31 14:21:09');
COMMIT;

-- ----------------------------
-- Table structure for collect_step
-- ----------------------------
DROP TABLE IF EXISTS `collect_step`;
CREATE TABLE `collect_step` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '采集步骤id',
  `cid` bigint(20) NOT NULL COMMENT '所属采集任务',
  `cname` varchar(50) NOT NULL COMMENT '步骤名称',
  `step_index` int(12) NOT NULL COMMENT '该步骤处于哪一步',
  `mapping` varchar(255) NOT NULL,
  `page` int(11) DEFAULT NULL COMMENT '分页',
  `addr` varchar(255) NOT NULL COMMENT '解析地址',
  `step_value` varchar(2000) NOT NULL COMMENT '解析规则',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of collect_step
-- ----------------------------
BEGIN;
INSERT INTO `collect_step` VALUES (3, 1, '笑话吧采集', 1, '[{\"name\":\"url\"},{\"name\":\"name\"}]', NULL, 'https://tieba.baidu.com/f?ie=utf-8&kw=%E7%BE%8E%E5%A5%B3', '<div class=\"threadlist_title pull_left j_th_tit \">[\\s]*<a.*?href=\"(.*?)\".*?>(.*?)</a>[\\S\\s]*?</div>', '2019-12-24 07:12:35', '2019-12-24 07:12:35');
INSERT INTO `collect_step` VALUES (4, 1, '笑话吧item采集', 2, '[{\"name\":\"content\"}]', NULL, 'https://tieba.baidu.com${url}', '<div id=\"post_content.*?d_post_content j_d_post_content.*?>(.*?)</div>', '2019-12-26 07:10:57', '2019-12-26 07:10:57');
INSERT INTO `collect_step` VALUES (7, 5, 'meitu采集', 1, '[{\"name\":\"url\"},{\"name\":\"name\"}]', NULL, 'https://www.meitulu.com/guochan/', '<p class=p_title><a href=\"https://www.meitulu.com/item/(.*?).html\".*?>(.*?)</a>', '2019-12-31 14:21:10', '2019-12-31 14:21:10');
INSERT INTO `collect_step` VALUES (8, 5, 'meitu-item采集', 2, '[{\"name\":\"img\"}]', NULL, '${url}', '<img src=\"(.*?)\".*?class=\"content_img\".*?>', '2019-12-31 14:21:10', '2019-12-31 14:21:10');
COMMIT;

-- ----------------------------
-- Table structure for sys_attribute
-- ----------------------------
DROP TABLE IF EXISTS `sys_attribute`;
CREATE TABLE `sys_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '属性名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attr_id` bigint(20) NOT NULL COMMENT '属性id',
  `name` varchar(255) DEFAULT NULL COMMENT '属性明细id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `login_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '登录时间',
  `login_iP` varchar(255) DEFAULT NULL COMMENT '登录ip',
  `login_total` int(11) DEFAULT NULL COMMENT '登录总次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_login_log` VALUES (1, 7, '2019-10-02 20:34:58', NULL, 1);
INSERT INTO `sys_login_log` VALUES (2, 7, '2019-10-03 07:48:09', NULL, 2);
INSERT INTO `sys_login_log` VALUES (3, 7, '2019-10-03 20:11:06', NULL, 3);
INSERT INTO `sys_login_log` VALUES (4, 7, '2019-10-04 09:28:20', NULL, 4);
INSERT INTO `sys_login_log` VALUES (5, 7, '2019-10-04 21:17:06', NULL, 5);
INSERT INTO `sys_login_log` VALUES (6, 7, '2019-10-04 22:11:23', NULL, 6);
INSERT INTO `sys_login_log` VALUES (7, 7, '2019-10-04 22:31:58', NULL, 7);
INSERT INTO `sys_login_log` VALUES (8, 7, '2019-10-04 22:32:22', NULL, 8);
INSERT INTO `sys_login_log` VALUES (9, 7, '2019-10-04 22:34:32', NULL, 9);
INSERT INTO `sys_login_log` VALUES (10, 7, '2019-10-04 22:36:01', NULL, 10);
INSERT INTO `sys_login_log` VALUES (11, 7, '2019-10-04 22:39:29', NULL, 11);
INSERT INTO `sys_login_log` VALUES (12, 7, '2019-10-05 04:18:40', NULL, 12);
INSERT INTO `sys_login_log` VALUES (13, 7, '2019-10-05 05:21:46', NULL, 13);
INSERT INTO `sys_login_log` VALUES (14, 7, '2019-10-05 05:23:35', NULL, 14);
INSERT INTO `sys_login_log` VALUES (15, 7, '2019-10-05 05:23:57', NULL, 15);
INSERT INTO `sys_login_log` VALUES (16, 7, '2019-10-05 05:25:27', NULL, 16);
INSERT INTO `sys_login_log` VALUES (17, 7, '2019-10-05 05:27:15', NULL, 17);
INSERT INTO `sys_login_log` VALUES (18, 7, '2019-10-05 05:30:44', NULL, 18);
INSERT INTO `sys_login_log` VALUES (19, 7, '2019-10-05 07:19:05', NULL, 19);
INSERT INTO `sys_login_log` VALUES (20, 7, '2019-10-05 22:37:25', NULL, 20);
INSERT INTO `sys_login_log` VALUES (21, 7, '2019-10-06 03:40:18', NULL, 21);
INSERT INTO `sys_login_log` VALUES (22, 7, '2019-10-06 08:33:47', NULL, 22);
INSERT INTO `sys_login_log` VALUES (23, 7, '2019-10-06 23:11:01', NULL, 23);
INSERT INTO `sys_login_log` VALUES (24, 7, '2019-10-07 01:19:03', NULL, 24);
INSERT INTO `sys_login_log` VALUES (25, 7, '2019-10-07 03:26:37', NULL, 25);
INSERT INTO `sys_login_log` VALUES (26, 7, '2019-10-08 08:57:17', NULL, 26);
INSERT INTO `sys_login_log` VALUES (27, 7, '2019-10-09 07:25:18', NULL, 27);
INSERT INTO `sys_login_log` VALUES (28, 7, '2019-10-10 08:04:53', NULL, 28);
INSERT INTO `sys_login_log` VALUES (29, 7, '2019-10-11 07:17:16', NULL, 29);
INSERT INTO `sys_login_log` VALUES (30, 7, '2019-10-13 05:09:09', NULL, 30);
INSERT INTO `sys_login_log` VALUES (31, 7, '2019-11-21 08:32:53', NULL, 31);
INSERT INTO `sys_login_log` VALUES (32, 7, '2019-12-19 07:19:45', NULL, 32);
INSERT INTO `sys_login_log` VALUES (33, 7, '2019-12-21 21:40:09', NULL, 33);
INSERT INTO `sys_login_log` VALUES (34, 7, '2019-12-23 01:16:11', NULL, 34);
COMMIT;

-- ----------------------------
-- Table structure for sys_operating_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_operating_record`;
CREATE TABLE `sys_operating_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_url` varchar(255) DEFAULT NULL COMMENT '请求的url',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '远程的ip地址',
  `params` varchar(2000) DEFAULT NULL COMMENT '请求参数',
  `method` varchar(255) DEFAULT NULL COMMENT '请示方式',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `flag` varchar(255) DEFAULT NULL COMMENT '标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL COMMENT '编码',
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
  `levels` varchar(255) NOT NULL COMMENT '描述菜单的层次',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
BEGIN;
INSERT INTO `sys_permission` VALUES (1, 'opera_query', '查询操作记录', '/sys/record/list', NULL, 29, NULL, '2', '2019-10-03 22:48:42', '2019-10-03 22:48:42', 'admin', NULL, NULL, 'sys:operation:opera_query');
INSERT INTO `sys_permission` VALUES (2, 'attr_detail_delete', '删除属性明细', '/sys/attr/detail/list', NULL, 4, NULL, '2', '2019-10-03 22:43:01', '2019-10-03 22:43:01', 'wangwu', NULL, NULL, 'dictionary:attribute:attr_detail_delete');
INSERT INTO `sys_permission` VALUES (3, 'role_delete', '删除角色', '/role/delete', NULL, 7, NULL, '2', '2019-10-03 22:44:13', '2019-10-03 22:44:13', 'wangwu', NULL, NULL, 'permission:role_mana:role_delete');
INSERT INTO `sys_permission` VALUES (4, 'attribute', '字典属性', '/dictionaryList', NULL, 9, NULL, '1', '2019-10-03 22:41:10', '2019-10-03 22:41:10', 'wangwu', NULL, NULL, 'dictionary:attribute');
INSERT INTO `sys_permission` VALUES (5, 'login_total', '登录统计', '/sys/login/total', NULL, 14, NULL, '2', '2019-10-03 22:47:31', '2019-10-03 22:47:31', 'admin', NULL, NULL, 'sys:total:login_total');
INSERT INTO `sys_permission` VALUES (6, 'role_query', '查询角色', '/role/list', NULL, 7, NULL, '2', '2019-10-03 22:44:07', '2019-10-03 22:44:07', 'wangwu', NULL, NULL, 'permission:role_mana:role_query');
INSERT INTO `sys_permission` VALUES (7, 'role_mana', '角色管理', '/roleList', NULL, 26, NULL, '1', '2019-10-03 22:44:03', '2019-10-03 22:44:03', 'wangwu', NULL, NULL, 'permission:role_mana');
INSERT INTO `sys_permission` VALUES (8, 'permi_list', '菜单列表', '/permisList', NULL, 26, NULL, '1', '2019-10-03 22:47:38', '2019-10-03 22:47:38', 'wangwu', NULL, NULL, 'permission:permi_list');
INSERT INTO `sys_permission` VALUES (9, 'dictionary', '数据字典', '/', NULL, 0, NULL, '6', '2019-10-03 23:00:55', '2019-10-03 23:00:55', 'wangwu', NULL, 'icon iconfont icon-dic-manager', 'dictionary');
INSERT INTO `sys_permission` VALUES (10, 'permi_query', '查询菜单', '/permission/list', NULL, 8, NULL, '2', '2019-10-03 22:46:06', '2019-10-03 22:46:06', 'wangwu', NULL, NULL, 'permission:permi_list:permi_query');
INSERT INTO `sys_permission` VALUES (11, 'role_add', '新增角色', '/role/add', NULL, 7, NULL, '2', '2019-10-03 22:44:53', '2019-10-03 22:44:53', 'wangwu', NULL, NULL, 'permission:role_mana:role_add');
INSERT INTO `sys_permission` VALUES (12, 'login_log_query', '查询登录日志', '/sys/login/logs', NULL, 21, NULL, '2', '2019-10-03 22:47:53', '2019-10-03 22:47:53', 'admin', NULL, NULL, 'sys:login_log:login_log_query');
INSERT INTO `sys_permission` VALUES (13, 'user', '用户管理', '/', NULL, 0, NULL, '6', '2019-10-03 23:00:59', '2019-10-03 23:00:59', 'wangwu', NULL, 'icon iconfont icon-yonghurenxiang', 'user');
INSERT INTO `sys_permission` VALUES (14, 'total', '统计图表', '/statistics', NULL, 28, NULL, '1', '2019-10-03 22:47:57', '2019-10-03 22:47:57', 'admin', NULL, NULL, 'sys:total');
INSERT INTO `sys_permission` VALUES (15, 'user_list', '用户列表', '/userlist', NULL, 13, NULL, '1', '2019-10-03 22:47:10', '2019-10-03 22:47:10', 'wangwu', NULL, NULL, 'user:user_list');
INSERT INTO `sys_permission` VALUES (16, 'user_status_edit', '编辑用户状态', '/user/editUserStatus', NULL, 15, NULL, '2', '2019-10-03 22:49:22', '2019-10-03 22:49:22', 'admin', NULL, NULL, 'user:user_list:user_status_edit');
INSERT INTO `sys_permission` VALUES (17, 'user_info_edit', '编辑个人信息', '/user/editUserInfo', NULL, 15, NULL, '2', '2019-10-03 22:49:30', '2019-10-03 22:49:30', 'admin', NULL, NULL, 'user:user_list:user_info_edit');
INSERT INTO `sys_permission` VALUES (18, 'attr_query', '查询属性', '/sys/attr/list', NULL, 4, NULL, '2', '2019-10-03 22:43:07', '2019-10-03 22:43:07', 'wangwu', NULL, NULL, 'dictionary:attribute:attr_query');
INSERT INTO `sys_permission` VALUES (19, 'attr_add', '新增属性', '/sys/attr/add', NULL, 4, NULL, '2', '2019-10-03 22:43:16', '2019-10-03 22:43:16', 'wangwu', NULL, NULL, 'dictionary:attribute:attr_add');
INSERT INTO `sys_permission` VALUES (20, 'req_total', '请求统计', '/sys/request/total', NULL, 14, NULL, '2', '2019-10-03 22:47:24', '2019-10-03 22:47:24', 'admin', NULL, NULL, 'sys:total:req_total');
INSERT INTO `sys_permission` VALUES (21, 'login_log', '登录日志', '/loginLog', NULL, 28, NULL, '1', '2019-10-03 22:48:06', '2019-10-03 22:48:06', 'admin', NULL, NULL, 'sys:login_log');
INSERT INTO `sys_permission` VALUES (22, 'user_delete', '删除用户', '/user/delete', NULL, 15, NULL, '2', '2019-10-03 22:48:11', '2019-10-03 22:48:11', 'wangwu', NULL, NULL, 'user:user_list:user_delete');
INSERT INTO `sys_permission` VALUES (23, 'attr_detail_add', '新增属性明细', '/sys/attr/detail/add', NULL, 4, NULL, '2', '2019-10-03 22:42:20', '2019-10-03 22:42:20', 'wangwu', NULL, NULL, 'dictionary:attribute:attr_detail_add');
INSERT INTO `sys_permission` VALUES (24, 'role_permi', '添加/编辑角色权限', '/role/add', NULL, 7, NULL, '2', '2019-10-03 22:45:57', '2019-10-03 22:45:57', 'admin', NULL, NULL, 'permission:role_mana:role_permi');
INSERT INTO `sys_permission` VALUES (25, 'user_add', '新增用户', '/user/add', NULL, 15, NULL, '2', '2019-10-03 22:44:59', '2019-10-03 22:44:59', 'wangwu', NULL, NULL, 'user:user_list:user_add');
INSERT INTO `sys_permission` VALUES (26, 'permission', '权限管理', '/', NULL, 0, NULL, '6', '2019-10-03 23:01:08', '2019-10-03 23:01:08', 'wangwu', NULL, 'icon iconfont icon-Slice', 'permission');
INSERT INTO `sys_permission` VALUES (27, 'user_query', '查询用户', '/user/list', NULL, 15, NULL, '2', '2019-10-03 22:45:28', '2019-10-03 22:45:28', 'wangwu', NULL, NULL, 'user:user_list:user_query');
INSERT INTO `sys_permission` VALUES (28, 'sys', '系统管理', '/', NULL, 0, NULL, '6', '2019-10-03 23:01:04', '2019-10-03 23:01:04', 'admin', NULL, 'icon iconfont icon-xitongguanli', 'sys');
INSERT INTO `sys_permission` VALUES (29, 'operation', '操作记录', '/operatingRecord', NULL, 28, NULL, '1', '2019-10-03 22:48:35', '2019-10-03 22:48:35', 'admin', NULL, NULL, 'sys:operation');
INSERT INTO `sys_permission` VALUES (30, 'permi_add', '添加菜单', '/permission/add', NULL, 8, NULL, '2', '2019-10-03 22:46:12', '2019-10-03 22:46:12', 'wangwu', NULL, NULL, 'permission:permi_list:permi_add');
INSERT INTO `sys_permission` VALUES (31, 'permi_delete', '删除菜单', '/permission/delete', NULL, 8, NULL, '2', '2019-10-03 22:47:00', '2019-10-03 22:47:00', 'wangwu', NULL, NULL, 'permission:permi_list:permi_delete');
INSERT INTO `sys_permission` VALUES (32, 'attr_delete', '删除属性', '/sys/attr/detail', NULL, 4, NULL, '2', '2019-10-03 22:42:07', '2019-10-03 22:42:07', 'wangwu', NULL, NULL, 'dictionary:attribute:attr_delete');
INSERT INTO `sys_permission` VALUES (33, 'attr_detail_query', '查询属性明细', '/sys/attr/detail/delete', NULL, 4, NULL, '2', '2019-10-03 22:43:22', '2019-10-03 22:43:22', 'wangwu', NULL, NULL, 'dictionary:attribute:attr_detail_query');
INSERT INTO `sys_permission` VALUES (34, 'collect', '数据采集', '/collect', NULL, 0, NULL, '6', '2019-10-05 12:17:18', '2019-10-05 12:17:18', 'admin', NULL, NULL, 'collect');
INSERT INTO `sys_permission` VALUES (35, 'collect_list', '采集菜单列表', '/collect/list', NULL, 34, NULL, '1', '2019-10-05 12:17:21', '2019-10-05 12:17:21', 'admin', NULL, NULL, 'collect:collect_list');
INSERT INTO `sys_permission` VALUES (36, 'collect_add', '采集菜单新增', '/collect/add', NULL, 34, NULL, '1', '2019-10-05 18:25:17', '2019-10-05 18:25:17', 'admin', NULL, NULL, 'collect:collect_list:collect_add');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(60) DEFAULT NULL COMMENT '描述',
  `type` int(11) DEFAULT NULL COMMENT '角色类型  002普通用户 001 超级管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_permission` VALUES (4, 1, 10);
INSERT INTO `sys_role_permission` VALUES (7, 1, 5);
INSERT INTO `sys_role_permission` VALUES (15, 1, 33);
INSERT INTO `sys_role_permission` VALUES (16, 1, 18);
INSERT INTO `sys_role_permission` VALUES (21, 1, 27);
INSERT INTO `sys_role_permission` VALUES (23, 1, 20);
INSERT INTO `sys_role_permission` VALUES (26, 1, 17);
INSERT INTO `sys_role_permission` VALUES (31, 3, 27);
INSERT INTO `sys_role_permission` VALUES (32, 1, 14);
INSERT INTO `sys_role_permission` VALUES (77, 2, 1);
INSERT INTO `sys_role_permission` VALUES (78, 2, 2);
INSERT INTO `sys_role_permission` VALUES (79, 2, 3);
INSERT INTO `sys_role_permission` VALUES (80, 2, 4);
INSERT INTO `sys_role_permission` VALUES (81, 2, 5);
INSERT INTO `sys_role_permission` VALUES (82, 2, 6);
INSERT INTO `sys_role_permission` VALUES (83, 2, 7);
INSERT INTO `sys_role_permission` VALUES (84, 2, 8);
INSERT INTO `sys_role_permission` VALUES (85, 2, 9);
INSERT INTO `sys_role_permission` VALUES (86, 2, 10);
INSERT INTO `sys_role_permission` VALUES (87, 2, 11);
INSERT INTO `sys_role_permission` VALUES (88, 2, 12);
INSERT INTO `sys_role_permission` VALUES (89, 2, 13);
INSERT INTO `sys_role_permission` VALUES (90, 2, 14);
INSERT INTO `sys_role_permission` VALUES (91, 2, 15);
INSERT INTO `sys_role_permission` VALUES (92, 2, 16);
INSERT INTO `sys_role_permission` VALUES (93, 2, 17);
INSERT INTO `sys_role_permission` VALUES (94, 2, 18);
INSERT INTO `sys_role_permission` VALUES (95, 2, 19);
INSERT INTO `sys_role_permission` VALUES (96, 2, 20);
INSERT INTO `sys_role_permission` VALUES (97, 2, 21);
INSERT INTO `sys_role_permission` VALUES (98, 2, 22);
INSERT INTO `sys_role_permission` VALUES (99, 2, 23);
INSERT INTO `sys_role_permission` VALUES (100, 2, 24);
INSERT INTO `sys_role_permission` VALUES (101, 2, 25);
INSERT INTO `sys_role_permission` VALUES (102, 2, 26);
INSERT INTO `sys_role_permission` VALUES (103, 2, 27);
INSERT INTO `sys_role_permission` VALUES (104, 2, 28);
INSERT INTO `sys_role_permission` VALUES (105, 2, 29);
INSERT INTO `sys_role_permission` VALUES (106, 2, 30);
INSERT INTO `sys_role_permission` VALUES (107, 2, 31);
INSERT INTO `sys_role_permission` VALUES (108, 2, 32);
INSERT INTO `sys_role_permission` VALUES (109, 2, 33);
INSERT INTO `sys_role_permission` VALUES (110, 2, 34);
INSERT INTO `sys_role_permission` VALUES (111, 2, 35);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `head_portraits` varchar(255) DEFAULT NULL COMMENT '头像',
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱|登录帐号',
  `pswd` varchar(32) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_nickname` (`nickname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

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
