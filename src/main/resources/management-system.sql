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

 Date: 22/12/2019 16:28:16
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of collect
-- ----------------------------
BEGIN;
INSERT INTO `collect` VALUES (1, '尤果网数据采集', 2, NULL, '2019-10-05 21:02:40', '2019-10-05 21:02:44');
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
  `addr` varchar(255) NOT NULL COMMENT '解析地址',
  `step_value` varchar(2000) NOT NULL COMMENT '解析规则',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=979 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_operating_record
-- ----------------------------
BEGIN;
INSERT INTO `sys_operating_record` VALUES (155, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-01 22:55:42', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (156, '/sys/attr/detail/info', '127.0.0.1', NULL, 'GET', '2019-10-01 22:55:46', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (157, '/sys/attr/detail/info', '127.0.0.1', NULL, 'GET', '2019-10-01 22:58:56', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (158, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-01 23:05:49', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (159, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-01 23:05:52', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (160, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-01 23:08:01', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (161, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-01 23:08:22', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (162, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-01 23:08:52', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (163, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-01 23:09:34', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (164, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-01 23:10:22', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (165, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@520acc9e, org.apache.catalina.connector.RequestFacade@7f918ced, org.apache.catalina.connector.ResponseFacade@6fabb308]', 'POST', '2019-10-02 20:33:49', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (166, '/login', '127.0.0.1', NULL, 'POST', '2019-10-02 20:33:50', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (167, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@6e1c9dca, org.apache.catalina.connector.RequestFacade@7f918ced, org.apache.catalina.connector.ResponseFacade@6fabb308]', 'POST', '2019-10-02 20:34:58', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (168, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-02 20:34:58', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (169, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-02 20:35:08', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (170, '/role/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-02 21:22:00', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (171, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-02 21:22:05', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (172, '/role/rolePermission', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-02 21:22:05', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (173, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-02 21:22:25', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (174, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-02 21:29:45', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (175, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-02 21:29:45', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (176, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-02 21:29:46', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (177, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-02 21:29:46', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (178, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-02 21:30:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (179, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-02 21:30:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (180, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-02 21:31:10', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (181, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-02 21:31:10', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (182, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-02 21:34:21', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (183, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-02 21:34:21', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (184, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-02 21:34:58', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (185, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-02 21:34:58', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (186, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-02 21:36:18', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (187, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-02 21:36:18', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (188, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-02 21:36:56', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (189, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-02 21:36:56', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (190, '/permission/findBasePermission', '127.0.0.1', NULL, 'GET', '2019-10-03 07:40:00', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (191, '/permission/list', '127.0.0.1', NULL, 'GET', '2019-10-03 07:40:00', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (192, '/permission/list', '127.0.0.1', NULL, 'GET', '2019-10-03 07:40:00', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (193, '/permission/findBasePermission', '127.0.0.1', NULL, 'GET', '2019-10-03 07:40:26', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (194, '/permission/list', '127.0.0.1', NULL, 'GET', '2019-10-03 07:40:26', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (195, '/permission/list', '127.0.0.1', NULL, 'GET', '2019-10-03 07:40:49', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (196, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@e11ea5a, org.apache.catalina.connector.RequestFacade@7b00b2ec, org.apache.catalina.connector.ResponseFacade@2d9f9dc2]', 'POST', '2019-10-03 07:48:09', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (197, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 07:48:10', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (198, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 07:48:45', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (199, '/role/findAllRoles', '127.0.0.1', '[com.site.collect.pojo.dto.RolePermisVo@6f6c57db, org.springframework.validation.BeanPropertyBindingResult: 0 errors]', 'GET', '2019-10-03 07:49:45', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (200, '/role/findAllRoles', '127.0.0.1', '[com.site.collect.pojo.dto.RolePermisVo@6f6c57db, org.springframework.validation.BeanPropertyBindingResult: 0 errors]', 'GET', '2019-10-03 07:49:45', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (201, '/role/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 07:49:54', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (202, '/sys/login/logs', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 07:50:45', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (203, '/sys/record/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 07:50:59', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (204, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 09:01:59', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (205, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 09:01:59', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (206, '/sys/attr/detail/info', '127.0.0.1', NULL, 'GET', '2019-10-03 09:02:03', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (207, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 09:08:24', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (208, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 09:08:24', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (209, '/sys/attr/detail/info', '127.0.0.1', NULL, 'GET', '2019-10-03 09:08:30', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (210, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=4, pageSize=10}]', 'GET', '2019-10-03 09:11:32', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (211, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=3, pageSize=10}]', 'GET', '2019-10-03 09:11:34', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (212, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 09:13:51', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (213, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 09:13:51', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (214, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-03 09:13:53', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (215, '/sys/attr/detail/info', '127.0.0.1', NULL, 'GET', '2019-10-03 09:13:53', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (216, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-03 09:14:02', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (217, '/sys/attr/detail/info', '127.0.0.1', NULL, 'GET', '2019-10-03 09:14:02', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (218, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 09:15:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (219, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 09:15:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (220, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-03 09:15:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (221, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 09:16:13', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (222, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 09:16:13', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (223, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-03 09:16:15', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (224, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-03 09:16:32', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (225, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 09:17:51', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (226, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 09:17:51', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (227, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 09:19:11', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (228, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 09:19:11', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (229, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 09:21:08', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (230, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 09:21:08', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (231, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@7c31c441, org.apache.catalina.connector.RequestFacade@249b5f38, org.apache.catalina.connector.ResponseFacade@103a01b9]', 'POST', '2019-10-03 20:11:06', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (232, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:11:07', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (233, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 20:11:17', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (234, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:11:17', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (235, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:11:39', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (236, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 20:11:39', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (237, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:12:59', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (238, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 20:12:59', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (239, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:16:32', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (240, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 20:16:32', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (241, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:16:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (242, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 20:16:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (243, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-03 20:17:10', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (244, '/permission/list', '127.0.0.1', NULL, 'GET', '2019-10-03 20:17:10', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (245, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 20:17:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (246, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:17:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (247, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 20:17:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (248, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:17:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (249, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-03 20:17:38', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (250, '/permission/list', '127.0.0.1', NULL, 'GET', '2019-10-03 20:17:38', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (251, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 20:19:11', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (252, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:19:11', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (253, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-03 20:19:17', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (254, '/permission/list', '127.0.0.1', NULL, 'GET', '2019-10-03 20:19:17', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (255, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 20:21:39', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (256, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:21:39', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (257, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:21:51', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (258, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:22:24', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (259, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:25:34', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (260, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 20:25:34', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (261, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:25:41', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (262, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:26:24', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (263, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:27:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (264, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:28:18', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (265, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 20:28:20', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (266, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 20:28:23', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (267, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:28:23', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (268, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:28:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (269, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 20:29:34', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (270, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:29:34', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (271, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 20:29:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (272, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:29:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (273, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:29:41', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (274, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:37:50', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (275, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 20:37:50', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (276, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:37:55', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (277, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:38:43', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (278, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 20:38:43', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (279, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 20:38:45', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (280, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:38:45', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (281, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:53:29', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (282, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-03 20:53:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (283, '/role/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-03 20:53:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (284, '/role/list', '127.0.0.1', NULL, 'GET', '2019-10-04 08:02:08', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (285, '/role/list', '127.0.0.1', NULL, 'GET', '2019-10-04 08:02:08', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (286, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@61ed6269, org.apache.catalina.connector.RequestFacade@d324429, org.apache.catalina.connector.ResponseFacade@2be2bb7b]', 'POST', '2019-10-04 09:28:20', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (287, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:28:20', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (288, '/sys/attr/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=30}]', 'GET', '2019-10-04 09:28:24', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (289, '/sys/attr/detail/list', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=5}]', 'GET', '2019-10-04 09:28:31', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (290, '/sys/attr/detail/list', '127.0.0.1', NULL, 'GET', '2019-10-04 09:28:31', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (291, '/sys/attr/detail/list', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=5}]', 'GET', '2019-10-04 09:29:37', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (292, '/sys/attr/detail/list', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=5}]', 'GET', '2019-10-04 09:31:16', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (293, '/sys/attr/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=30}]', 'GET', '2019-10-04 09:32:48', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (294, '/sys/attr/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=30}]', 'GET', '2019-10-04 09:32:51', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (295, '/sys/attr/detail/list', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=5}]', 'GET', '2019-10-04 09:32:53', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (296, '/sys/attr/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=30}]', 'GET', '2019-10-04 09:33:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (297, '/sys/attr/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=30}]', 'GET', '2019-10-04 09:33:35', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (298, '/sys/attr/detail/list', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=5}]', 'GET', '2019-10-04 09:33:37', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (299, '/sys/attr/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=30}]', 'GET', '2019-10-04 09:33:53', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (300, '/sys/attr/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=30}]', 'GET', '2019-10-04 09:33:55', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (301, '/sys/attr/detail/list', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=5}]', 'GET', '2019-10-04 09:33:57', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (302, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:34:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (303, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 09:34:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (304, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 09:34:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (305, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 09:36:20', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (306, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:39:38', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (307, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 09:39:38', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (308, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 09:39:40', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (309, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:42:03', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (310, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 09:42:03', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (311, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 09:42:05', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (312, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:42:05', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (313, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:42:08', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (314, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 09:43:41', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (315, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:43:41', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (316, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:43:51', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (317, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 09:44:32', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (318, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:44:53', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (319, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 09:44:53', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (320, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 09:45:45', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (321, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:45:45', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (322, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 09:45:47', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (323, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:45:47', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (324, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:45:49', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (325, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 09:48:45', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (326, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 09:49:11', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (327, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:49:11', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (328, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:49:50', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (329, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 09:49:50', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (330, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:49:54', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (331, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 09:51:12', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (332, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:51:12', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (333, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:51:16', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (334, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 09:53:19', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (335, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 09:54:19', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (336, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:54:19', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (337, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 09:54:23', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (338, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:54:23', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (339, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:55:18', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (340, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 09:56:24', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (341, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 09:58:32', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (342, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:58:32', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (343, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:58:34', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (344, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 09:58:34', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (345, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:58:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (346, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 09:58:42', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (347, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 09:59:05', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (348, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:59:24', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (349, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 09:59:24', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (350, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:59:27', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (351, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 09:59:27', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (352, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:59:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (353, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 09:59:49', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (354, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 09:59:57', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (355, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 09:59:57', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (356, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 10:00:00', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (357, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 10:00:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (358, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 10:00:41', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (359, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 10:00:51', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (360, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 10:00:54', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (361, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 10:00:54', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (362, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 10:00:58', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (363, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 10:02:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (364, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 10:02:35', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (365, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 10:02:40', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (366, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 10:02:41', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (367, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 10:02:58', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (368, '/permission/list', '127.0.0.1', NULL, 'GET', '2019-10-04 21:16:27', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (369, '/permission/findBasePermission', '127.0.0.1', NULL, 'GET', '2019-10-04 21:16:27', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (370, '/permission/list', '127.0.0.1', NULL, 'GET', '2019-10-04 21:16:27', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (371, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@311931c8, org.apache.catalina.connector.RequestFacade@464931f1, org.apache.catalina.connector.ResponseFacade@1f803d5c]', 'POST', '2019-10-04 21:17:06', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (372, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 21:17:06', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (373, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 21:17:15', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (374, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 21:17:15', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (375, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 21:17:34', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (376, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 21:17:54', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (377, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 21:18:16', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (378, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 21:18:16', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (379, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 21:18:18', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (380, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 21:18:18', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (381, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 21:19:50', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (382, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 21:19:50', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (383, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 21:19:52', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (384, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 21:19:52', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (385, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 21:22:26', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (386, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 21:22:26', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (387, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 21:22:31', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (388, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 21:22:31', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (389, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 21:22:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (390, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 21:22:35', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (391, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 21:23:18', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (392, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 21:23:18', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (393, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 21:23:19', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (394, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 21:23:20', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (395, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 21:36:43', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (396, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 21:38:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (397, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 21:38:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (398, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 21:38:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (399, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 21:38:34', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (400, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 21:38:49', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (401, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 21:38:49', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (402, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 21:38:52', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (403, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 21:38:53', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (404, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 21:42:17', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (405, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 21:42:17', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (406, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 21:50:38', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (407, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 21:50:38', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (408, '/role/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 21:55:40', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (409, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 21:55:43', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (410, '/role/rolePermission', '127.0.0.1', '[ParamsDto{id=\'2\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 21:55:43', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (411, '/role/addRolesPermis', '127.0.0.1', '[com.site.collect.pojo.dto.RolePermisVo@2d39cf0d, org.springframework.validation.BeanPropertyBindingResult: 0 errors]', 'POST', '2019-10-04 21:55:47', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (412, '/role/addRolesPermis', '127.0.0.1', '[com.site.collect.pojo.dto.RolePermisVo@2d39cf0d, org.springframework.validation.BeanPropertyBindingResult: 0 errors]', 'POST', '2019-10-04 21:55:47', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (413, '/role/addRolesPermis', '127.0.0.1', NULL, 'POST', '2019-10-04 21:55:47', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (414, '/role/addRolesPermis', '127.0.0.1', '[com.site.collect.pojo.dto.RolePermisVo@520cc1aa, org.springframework.validation.BeanPropertyBindingResult: 0 errors]', 'POST', '2019-10-04 21:56:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (415, '/role/addRolesPermis', '127.0.0.1', '[com.site.collect.pojo.dto.RolePermisVo@520cc1aa, org.springframework.validation.BeanPropertyBindingResult: 0 errors]', 'POST', '2019-10-04 21:56:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (416, '/role/addRolesPermis', '127.0.0.1', NULL, 'POST', '2019-10-04 21:56:56', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (417, '/role/addRolesPermis', '127.0.0.1', '[com.site.collect.pojo.dto.RolePermisVo@7177390e, org.springframework.validation.BeanPropertyBindingResult: 0 errors]', 'POST', '2019-10-04 21:58:14', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (418, '/role/addRolesPermis', '127.0.0.1', '[com.site.collect.pojo.dto.RolePermisVo@7177390e, org.springframework.validation.BeanPropertyBindingResult: 0 errors]', 'POST', '2019-10-04 21:58:14', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (419, '/role/addRolesPermis', '127.0.0.1', NULL, 'POST', '2019-10-04 21:58:21', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (420, '/role/addRolesPermis', '127.0.0.1', '[com.site.collect.pojo.dto.RolePermisVo@38e773e8, org.springframework.validation.BeanPropertyBindingResult: 0 errors]', 'POST', '2019-10-04 22:00:55', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (421, '/role/addRolesPermis', '127.0.0.1', '[com.site.collect.pojo.dto.RolePermisVo@38e773e8, org.springframework.validation.BeanPropertyBindingResult: 0 errors]', 'POST', '2019-10-04 22:00:55', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (422, '/role/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:01:06', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (423, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 22:01:22', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (424, '/role/rolePermission', '127.0.0.1', '[ParamsDto{id=\'2\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 22:01:22', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (425, '/role/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:01:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (426, '/role/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:08:42', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (427, '/role/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:10:07', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (428, '/role/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:10:57', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (429, '/role/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:11:00', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (430, '/logout', '127.0.0.1', '[]', 'GET', '2019-10-04 22:11:04', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (431, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@2b6f5fb2, org.apache.catalina.connector.ResponseFacade@656345e8]', 'POST', '2019-10-04 22:11:23', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (432, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:11:24', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (433, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:16:31', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (434, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 22:16:38', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (435, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:16:38', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (436, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:16:42', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (437, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 22:16:43', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (438, '/permission/add', '127.0.0.1', '[com.site.collect.pojo.vo.PermissionVo@6077375f]', 'POST', '2019-10-04 22:17:28', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (439, '/permission/add', '127.0.0.1', NULL, 'POST', '2019-10-04 22:17:45', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (440, '/permission/add', '127.0.0.1', '[com.site.collect.pojo.vo.PermissionVo@631b5845]', 'POST', '2019-10-04 22:19:05', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (441, '/permission/add', '127.0.0.1', NULL, 'POST', '2019-10-04 22:19:08', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (442, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:19:26', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (443, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 22:20:03', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (444, '/permission/add', '127.0.0.1', '[com.site.collect.pojo.vo.PermissionVo@4b00cdd1]', 'POST', '2019-10-04 22:20:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (445, '/permission/add', '127.0.0.1', NULL, 'POST', '2019-10-04 22:21:16', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (446, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 22:21:24', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (447, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:21:24', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (448, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:21:27', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (449, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 22:21:32', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (450, '/permission/add', '127.0.0.1', '[com.site.collect.pojo.vo.PermissionVo@3564222]', 'POST', '2019-10-04 22:22:03', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (451, '/permission/add', '127.0.0.1', NULL, 'POST', '2019-10-04 22:22:37', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (452, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:22:46', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (453, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:22:55', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (454, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 22:23:11', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (455, '/permission/add', '127.0.0.1', '[com.site.collect.pojo.vo.PermissionVo@160a7819]', 'POST', '2019-10-04 22:23:43', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (456, '/permission/add', '127.0.0.1', NULL, 'POST', '2019-10-04 22:24:15', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (457, '/permission/add', '127.0.0.1', '[com.site.collect.pojo.vo.PermissionVo@7878ba5a]', 'POST', '2019-10-04 22:24:39', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (458, '/permission/add', '127.0.0.1', NULL, 'POST', '2019-10-04 22:24:53', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (459, '/permission/add', '127.0.0.1', '[com.site.collect.pojo.vo.PermissionVo@1a28c601]', 'POST', '2019-10-04 22:25:11', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (460, '/permission/add', '127.0.0.1', NULL, 'POST', '2019-10-04 22:26:38', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (461, '/permission/add', '127.0.0.1', '[com.site.collect.pojo.vo.PermissionVo@4efe749b]', 'POST', '2019-10-04 22:27:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (462, '/permission/add', '127.0.0.1', NULL, 'POST', '2019-10-04 22:28:44', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (463, '/permission/add', '127.0.0.1', '[com.site.collect.pojo.vo.PermissionVo@7ba4d6ed]', 'POST', '2019-10-04 22:29:16', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (464, '/permission/add', '127.0.0.1', NULL, 'POST', '2019-10-04 22:29:16', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (465, '/permission/add', '127.0.0.1', '[com.site.collect.pojo.vo.PermissionVo@5c9354da]', 'POST', '2019-10-04 22:29:18', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (466, '/permission/add', '127.0.0.1', NULL, 'POST', '2019-10-04 22:29:18', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (467, '/permission/add', '127.0.0.1', '[com.site.collect.pojo.vo.PermissionVo@4451e964]', 'POST', '2019-10-04 22:29:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (468, '/permission/add', '127.0.0.1', NULL, 'POST', '2019-10-04 22:29:30', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (469, '/permission/add', '127.0.0.1', '[com.site.collect.pojo.vo.PermissionVo@1d814dcb]', 'POST', '2019-10-04 22:29:31', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (470, '/permission/add', '127.0.0.1', NULL, 'POST', '2019-10-04 22:29:31', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (471, '/permission/add', '127.0.0.1', '[com.site.collect.pojo.vo.PermissionVo@1a2c33d0]', 'POST', '2019-10-04 22:29:32', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (472, '/permission/add', '127.0.0.1', NULL, 'POST', '2019-10-04 22:29:32', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (473, '/permission/add', '127.0.0.1', '[com.site.collect.pojo.vo.PermissionVo@7a06b92]', 'POST', '2019-10-04 22:29:38', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (474, '/permission/add', '127.0.0.1', NULL, 'POST', '2019-10-04 22:29:38', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (475, '/permission/add', '127.0.0.1', '[com.site.collect.pojo.vo.PermissionVo@645f7547]', 'POST', '2019-10-04 22:30:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (476, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:31:14', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (477, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 22:31:14', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (478, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:31:16', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (479, '/role/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:31:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (480, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 22:31:31', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (481, '/role/rolePermission', '127.0.0.1', '[ParamsDto{id=\'2\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 22:31:31', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (482, '/role/addRolesPermis', '127.0.0.1', '[com.site.collect.pojo.dto.RolePermisVo@1a3ada4b, org.springframework.validation.BeanPropertyBindingResult: 0 errors]', 'POST', '2019-10-04 22:31:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (483, '/role/addRolesPermis', '127.0.0.1', '[com.site.collect.pojo.dto.RolePermisVo@1a3ada4b, org.springframework.validation.BeanPropertyBindingResult: 0 errors]', 'POST', '2019-10-04 22:31:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (484, '/role/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:31:49', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (485, '/logout', '127.0.0.1', '[]', 'GET', '2019-10-04 22:31:56', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (486, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@3ef728d5, org.apache.catalina.connector.ResponseFacade@29ec2b36]', 'POST', '2019-10-04 22:31:58', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (487, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:31:59', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (488, '/logout', '127.0.0.1', '[]', 'GET', '2019-10-04 22:32:20', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (489, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@4c047b9e, org.apache.catalina.connector.ResponseFacade@29ec2b36]', 'POST', '2019-10-04 22:32:22', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (490, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:32:22', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (491, '/logout', '127.0.0.1', '[]', 'GET', '2019-10-04 22:33:40', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (492, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@3e75bcec, org.apache.catalina.connector.ResponseFacade@29ec2b36]', 'POST', '2019-10-04 22:33:42', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (493, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@5f076fb2, org.apache.catalina.connector.ResponseFacade@29ec2b36]', 'POST', '2019-10-04 22:35:57', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (494, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:36:02', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (495, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-04 22:36:11', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (496, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:36:11', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (497, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:36:15', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (498, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:36:19', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (499, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 22:36:21', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (500, '/permission/add', '127.0.0.1', '[com.site.collect.pojo.vo.PermissionVo@9aa8f76]', 'POST', '2019-10-04 22:36:54', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (501, '/permission/add', '127.0.0.1', NULL, 'POST', '2019-10-04 22:36:54', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (502, '/permission/add', '127.0.0.1', '[com.site.collect.pojo.vo.PermissionVo@1d0827fb]', 'POST', '2019-10-04 22:38:06', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (503, '/permission/add', '127.0.0.1', NULL, 'POST', '2019-10-04 22:38:25', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (504, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:38:31', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (505, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-04 22:38:42', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (506, '/permission/add', '127.0.0.1', '[com.site.collect.pojo.vo.PermissionVo@48110b51]', 'POST', '2019-10-04 22:38:46', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (507, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:39:14', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (508, '/logout', '127.0.0.1', '[]', 'GET', '2019-10-04 22:39:23', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (509, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@fa99ed7, org.apache.catalina.connector.ResponseFacade@17b19755]', 'POST', '2019-10-04 22:39:29', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (510, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:39:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (511, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 22:39:34', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (512, '/sys/attr/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=30}]', 'GET', '2019-10-04 23:10:49', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (513, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 23:10:51', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (514, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 23:10:57', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (515, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 23:13:20', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (516, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 23:13:25', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (517, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 23:13:27', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (518, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 23:13:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (519, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 23:13:34', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (520, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 23:13:38', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (521, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 23:15:03', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (522, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 23:15:08', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (523, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 23:15:12', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (524, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 23:15:39', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (525, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 23:17:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (526, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 23:17:44', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (527, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-04 23:17:47', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (528, '/logout', '127.0.0.1', NULL, 'GET', '2019-10-05 04:18:38', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (529, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@3b92d9f2, org.apache.catalina.connector.ResponseFacade@17b19755]', 'POST', '2019-10-05 04:18:40', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (530, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-05 04:18:41', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (531, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@558d5abd]', 'GET', '2019-10-05 04:25:41', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (532, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@35fde1c7]', 'GET', '2019-10-05 04:25:43', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (533, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@cffb02c]', 'GET', '2019-10-05 04:26:27', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (534, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@2182f86b]', 'GET', '2019-10-05 04:26:49', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (535, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@c6c44dc]', 'GET', '2019-10-05 04:32:46', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (536, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@35367a02]', 'GET', '2019-10-05 04:55:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (537, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@e1f0f7d]', 'GET', '2019-10-05 04:55:40', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (538, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-05 04:55:47', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (539, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-05 04:55:47', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (540, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-05 04:55:49', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (541, '/sys/attr/detail/info', '127.0.0.1', '[ParamsDto{id=\'1\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-05 04:55:58', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (542, '/logout', '127.0.0.1', '[]', 'GET', '2019-10-05 05:21:44', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (543, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@37eb1b28, org.apache.catalina.connector.ResponseFacade@197df40c]', 'POST', '2019-10-05 05:21:46', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (544, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-05 05:21:47', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (545, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@2599382a]', 'GET', '2019-10-05 05:21:53', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (546, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@3262b19b]', 'GET', '2019-10-05 05:21:55', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (547, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-05 05:21:58', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (548, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-05 05:21:58', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (549, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'null\', startPage=1, pageSize=10}]', 'GET', '2019-10-05 05:22:00', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (550, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@2bafacce]', 'GET', '2019-10-05 05:22:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (551, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@78229850]', 'GET', '2019-10-05 05:22:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (552, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@2703ecff]', 'GET', '2019-10-05 05:22:45', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (553, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@2c433c63]', 'GET', '2019-10-05 05:23:27', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (554, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@4f5f6829]', 'GET', '2019-10-05 05:23:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (555, '/logout', '127.0.0.1', '[]', 'GET', '2019-10-05 05:23:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (556, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@7f662db7, org.apache.catalina.connector.ResponseFacade@442b009c]', 'POST', '2019-10-05 05:23:35', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (557, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-05 05:23:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (558, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@67c005be]', 'GET', '2019-10-05 05:23:40', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (559, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@720b79f0]', 'GET', '2019-10-05 05:23:42', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (560, '/logout', '127.0.0.1', '[]', 'GET', '2019-10-05 05:23:49', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (561, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@5b823b21, org.apache.catalina.connector.ResponseFacade@442b009c]', 'POST', '2019-10-05 05:23:57', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (562, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-05 05:23:58', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (563, '/logout', '127.0.0.1', '[]', 'GET', '2019-10-05 05:25:24', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (564, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@37a1259f, org.apache.catalina.connector.ResponseFacade@442b009c]', 'POST', '2019-10-05 05:25:27', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (565, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-05 05:25:27', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (566, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-05 05:26:47', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (567, '/logout', '127.0.0.1', '[]', 'GET', '2019-10-05 05:26:55', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (568, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@6f3b912b, org.apache.catalina.connector.ResponseFacade@442b009c]', 'POST', '2019-10-05 05:27:15', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (569, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@1a2212c1, org.apache.catalina.connector.ResponseFacade@5f633d31]', 'POST', '2019-10-05 05:30:43', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (570, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-05 05:30:58', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (571, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@64077bf2]', 'GET', '2019-10-05 05:31:05', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (572, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@667ea4b2]', 'GET', '2019-10-05 05:32:02', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (573, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-05 05:32:23', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (574, '/permission/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-05 05:32:23', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (575, '/role/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-05 05:32:26', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (576, '/permission/findBasePermission', '127.0.0.1', '[]', 'GET', '2019-10-05 05:32:27', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (577, '/role/rolePermission', '127.0.0.1', '[ParamsDto{id=\'2\', ids=null, type=null, status=null, keyword=\'null\', startPage=null, pageSize=null}]', 'GET', '2019-10-05 05:32:27', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (578, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@11cb446d]', 'GET', '2019-10-05 07:18:45', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (579, '/sys/login/total', '127.0.0.1', '[]', 'GET', '2019-10-05 07:18:54', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (580, '/sys/login/total', '127.0.0.1', NULL, 'GET', '2019-10-05 07:18:54', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (581, '/sys/request/total', '127.0.0.1', '[]', 'GET', '2019-10-05 07:18:54', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (582, '/logout', '127.0.0.1', '[]', 'GET', '2019-10-05 07:19:03', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (583, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@49df9099, org.apache.catalina.connector.ResponseFacade@64f75860]', 'POST', '2019-10-05 07:19:05', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (584, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-05 07:19:05', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (585, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@5ea0a351]', 'GET', '2019-10-05 07:19:09', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (586, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@8c7bacf]', 'GET', '2019-10-05 07:41:51', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (587, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@39721b7e]', 'GET', '2019-10-05 07:41:55', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (588, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@3b650da0]', 'GET', '2019-10-05 07:41:58', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (589, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@57f428cf]', 'GET', '2019-10-05 07:58:38', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (590, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@1bb7a597]', 'GET', '2019-10-05 08:00:16', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (591, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@6bf449cd]', 'GET', '2019-10-05 08:00:18', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (592, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@59b8dc3c]', 'GET', '2019-10-05 08:04:12', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (593, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@2540c281]', 'GET', '2019-10-05 08:07:54', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (594, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@49fbf9e3]', 'GET', '2019-10-05 08:08:17', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (595, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@1b610322]', 'GET', '2019-10-05 08:08:42', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (596, '/collect/info', '127.0.0.1', '[2]', 'GET', '2019-10-05 08:23:32', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (597, '/collect/info', '127.0.0.1', NULL, 'GET', '2019-10-05 08:23:32', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (598, '/collect/info', '127.0.0.1', '[2]', 'GET', '2019-10-05 08:24:15', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (599, '/collect/info', '127.0.0.1', NULL, 'GET', '2019-10-05 08:24:20', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (600, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 08:24:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (601, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 08:25:08', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (602, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 08:25:16', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (603, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 08:26:14', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (604, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 08:26:38', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (605, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 08:27:02', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (606, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 08:29:25', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (607, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 08:38:29', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (608, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 08:39:28', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (609, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 08:42:27', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (610, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 08:45:04', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (611, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 08:45:32', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (612, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 08:56:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (613, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 08:59:35', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (614, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 09:01:08', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (615, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 09:02:09', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (616, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 09:02:13', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (617, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 09:04:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (618, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 09:05:09', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (619, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-05 09:05:21', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (620, '/logout', '127.0.0.1', NULL, 'GET', '2019-10-05 22:37:23', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (621, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@6400a151, org.apache.catalina.connector.ResponseFacade@dccbdcd]', 'POST', '2019-10-05 22:37:25', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (622, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-05 22:37:26', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (623, '/logout', '127.0.0.1', NULL, 'GET', '2019-10-06 03:40:16', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (624, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@5ac462b1, org.apache.catalina.connector.ResponseFacade@dccbdcd]', 'POST', '2019-10-06 03:40:18', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (625, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-06 03:40:19', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (626, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@6338d4cf]', 'GET', '2019-10-06 03:40:22', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (627, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 03:40:29', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (628, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 03:42:04', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (629, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 03:45:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (630, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 03:45:38', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (631, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 03:52:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (632, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 03:56:55', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (633, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 03:57:47', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (634, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 03:58:01', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (635, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 04:08:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (636, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 04:19:12', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (637, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 04:19:15', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (638, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 04:20:07', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (639, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 04:21:11', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (640, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 04:23:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (641, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 04:23:39', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (642, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 04:26:42', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (643, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 04:30:32', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (644, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 04:30:34', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (645, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 04:32:05', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (646, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 04:52:37', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (647, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 04:52:39', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (648, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 04:53:08', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (649, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 04:53:12', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (650, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 05:09:02', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (651, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 05:09:04', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (652, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 05:10:12', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (653, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 05:17:25', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (654, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 05:17:27', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (655, '/logout', '127.0.0.1', NULL, 'GET', '2019-10-06 08:33:45', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (656, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@11dfcd80, org.apache.catalina.connector.ResponseFacade@dccbdcd]', 'POST', '2019-10-06 08:33:47', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (657, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-06 08:33:48', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (658, '/logout', '127.0.0.1', NULL, 'GET', '2019-10-06 23:10:58', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (659, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@75aab954, org.apache.catalina.connector.ResponseFacade@39275b4a]', 'POST', '2019-10-06 23:11:01', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (660, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-06 23:11:01', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (661, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-06 23:11:06', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (662, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@784e607e]', 'GET', '2019-10-06 23:11:09', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (663, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 23:11:52', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (664, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 23:19:46', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (665, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 23:21:19', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (666, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 23:22:19', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (667, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 23:27:55', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (668, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 23:27:58', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (669, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 23:28:21', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (670, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 23:29:02', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (671, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 23:32:35', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (672, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 23:32:37', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (673, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 23:33:14', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (674, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-06 23:34:28', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (675, '/collect/info', '127.0.0.1', NULL, 'GET', '2019-10-07 01:14:56', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (676, '/collect/info', '127.0.0.1', NULL, 'GET', '2019-10-07 01:15:09', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (677, '/collect/info', '127.0.0.1', NULL, 'GET', '2019-10-07 01:15:50', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (678, '/collect/info', '127.0.0.1', NULL, 'GET', '2019-10-07 01:16:58', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (679, '/collect/info', '127.0.0.1', NULL, 'GET', '2019-10-07 01:17:44', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (680, '/collect/info', '127.0.0.1', NULL, 'GET', '2019-10-07 01:18:53', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (681, '/logout', '127.0.0.1', NULL, 'GET', '2019-10-07 01:19:00', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (682, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@79d3384e, org.apache.catalina.connector.ResponseFacade@30744342]', 'POST', '2019-10-07 01:19:03', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (683, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-07 01:19:03', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (684, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-07 01:19:06', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (685, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@14d22047]', 'GET', '2019-10-07 01:19:12', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (686, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 01:19:19', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (687, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 01:22:20', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (688, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 01:26:09', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (689, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 01:27:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (690, '/collect/test', '127.0.0.1', NULL, 'GET', '2019-10-07 01:27:56', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (691, '/collect/info', '127.0.0.1', NULL, 'GET', '2019-10-07 03:26:29', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (692, '/logout', '127.0.0.1', NULL, 'GET', '2019-10-07 03:26:33', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (693, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@3d60ec0a, org.apache.catalina.connector.ResponseFacade@30744342]', 'POST', '2019-10-07 03:26:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (694, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-07 03:26:37', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (695, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@145ffa92]', 'GET', '2019-10-07 03:26:46', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (696, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 03:26:51', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (697, '/collect/test', '127.0.0.1', '[com.site.collect.entity.collect.CollectSetp@598469bd]', 'POST', '2019-10-07 03:27:55', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (698, '/collect/test', '127.0.0.1', NULL, 'POST', '2019-10-07 03:27:58', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (699, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 03:28:23', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (700, '/collect/test', '127.0.0.1', '[com.site.collect.entity.collect.CollectSetp@7386a561]', 'POST', '2019-10-07 03:28:50', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (701, '/collect/test', '127.0.0.1', '[com.site.collect.entity.collect.CollectSetp@5279bce8]', 'POST', '2019-10-07 03:30:12', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (702, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 03:37:51', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (703, '/collect/test', '127.0.0.1', '[com.site.collect.entity.collect.CollectSetp@6fbbe33]', 'POST', '2019-10-07 03:37:57', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (704, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 03:40:50', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (705, '/collect/test', '127.0.0.1', '[com.site.collect.entity.collect.CollectSetp@1670c207]', 'POST', '2019-10-07 03:40:55', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (706, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:07:11', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (707, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:07:16', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (708, '/collect/test', '127.0.0.1', '[com.site.collect.entity.collect.CollectSetp@1cad557c]', 'POST', '2019-10-07 04:07:22', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (709, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:09:39', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (710, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:09:42', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (711, '/collect/test', '127.0.0.1', '[com.site.collect.entity.collect.CollectSetp@1a4210f3]', 'POST', '2019-10-07 04:09:46', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (712, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:11:05', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (713, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:11:10', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (714, '/collect/test', '127.0.0.1', '[com.site.collect.entity.collect.CollectSetp@31bcd97f]', 'POST', '2019-10-07 04:11:15', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (715, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:12:15', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (716, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:12:16', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (717, '/collect/test', '127.0.0.1', '[com.site.collect.entity.collect.CollectSetp@37dce947]', 'POST', '2019-10-07 04:12:18', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (718, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:15:28', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (719, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:15:29', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (720, '/collect/test', '127.0.0.1', '[com.site.collect.entity.collect.CollectSetp@180802f2]', 'POST', '2019-10-07 04:15:32', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (721, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:15:44', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (722, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:15:47', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (723, '/collect/test', '127.0.0.1', '[com.site.collect.entity.collect.CollectSetp@38733d0]', 'POST', '2019-10-07 04:15:50', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (724, '/collect/test', '127.0.0.1', '[com.site.collect.entity.collect.CollectSetp@5ca32eb1]', 'POST', '2019-10-07 04:46:45', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (725, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:52:28', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (726, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:52:31', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (727, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:53:13', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (728, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:53:34', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (729, '/collect/test', '127.0.0.1', '[com.site.collect.entity.collect.CollectSetp@7f07d78b]', 'POST', '2019-10-07 04:53:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (730, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:54:05', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (731, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:54:07', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (732, '/collect/test', '127.0.0.1', '[com.site.collect.entity.collect.CollectSetp@4e77a384]', 'POST', '2019-10-07 04:54:09', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (733, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:54:40', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (734, '/collect/test', '127.0.0.1', '[com.site.collect.entity.collect.CollectSetp@36197420]', 'POST', '2019-10-07 04:54:42', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (735, '/collect/test', '127.0.0.1', '[com.site.collect.entity.collect.CollectSetp@2301ddee]', 'POST', '2019-10-07 04:54:52', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (736, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:58:26', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (737, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-07 04:58:27', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (738, '/collect/test', '127.0.0.1', '[com.site.collect.entity.collect.CollectSetp@33f2b17f]', 'POST', '2019-10-07 04:58:32', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (739, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@3be4ce7d, org.apache.catalina.connector.ResponseFacade@68fc4304]', 'POST', '2019-10-08 08:57:17', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (740, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-08 08:57:18', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (741, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 08:57:23', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (742, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@162815db]', 'GET', '2019-10-08 08:57:25', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (743, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 08:57:27', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (744, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 08:57:44', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (745, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:00:01', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (746, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:00:03', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (747, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:00:41', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (748, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:00:44', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (749, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:03:25', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (750, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:04:09', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (751, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:04:27', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (752, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:09:00', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (753, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:09:13', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (754, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:09:39', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (755, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:09:42', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (756, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:10:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (757, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:10:35', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (758, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:11:41', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (759, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:11:43', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (760, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:12:29', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (761, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:12:32', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (762, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:13:46', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (763, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:13:48', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (764, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:14:03', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (765, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:14:53', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (766, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:16:11', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (767, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:19:07', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (768, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:19:09', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (769, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:19:28', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (770, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:20:18', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (771, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:20:20', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (772, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:20:28', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (773, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:21:11', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (774, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:23:52', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (775, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:25:37', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (776, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:26:01', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (777, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:27:27', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (778, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:27:29', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (779, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:28:32', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (780, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:28:35', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (781, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:28:56', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (782, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:32:36', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (783, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 09:32:37', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (784, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-08 09:33:30', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (785, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 10:03:32', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (786, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 10:03:34', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (787, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-08 10:03:57', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (788, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 10:04:58', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (789, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 10:05:00', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (790, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-08 10:05:16', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (791, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 10:07:21', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (792, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-08 10:07:34', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (793, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 10:10:05', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (794, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-08 10:10:07', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (795, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-08 10:10:22', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (796, '/collect/info', '127.0.0.1', NULL, 'GET', '2019-10-09 07:25:07', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (797, '/collect/info', '127.0.0.1', NULL, 'GET', '2019-10-09 07:25:09', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (798, '/logout', '127.0.0.1', NULL, 'GET', '2019-10-09 07:25:15', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (799, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@23f8757c, org.apache.catalina.connector.ResponseFacade@3fe207ba]', 'POST', '2019-10-09 07:25:18', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (800, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-09 07:25:18', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (801, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@4b18769]', 'GET', '2019-10-09 07:25:22', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (802, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 07:25:24', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (803, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 07:25:34', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (804, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 07:26:24', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (805, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 07:29:30', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (806, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 07:32:46', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (807, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 07:34:11', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (808, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 07:34:13', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (809, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 07:34:17', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (810, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 07:36:11', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (811, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 07:39:23', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (812, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 07:40:09', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (813, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 07:41:00', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (814, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 07:41:05', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (815, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 07:41:29', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (816, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 07:42:11', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (817, '/step/add', '127.0.0.1', '[null]', 'POST', '2019-10-09 07:42:16', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (818, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 07:42:23', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (819, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 07:46:13', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (820, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 07:46:34', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (821, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 07:48:17', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (822, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 07:49:43', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (823, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 07:51:02', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (824, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 07:52:39', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (825, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 07:52:42', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (826, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 07:52:51', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (827, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 07:56:48', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (828, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 07:56:56', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (829, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 07:58:05', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (830, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 07:58:12', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (831, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:01:09', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (832, '/step/add', '127.0.0.1', '[null]', 'POST', '2019-10-09 08:01:51', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (833, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 08:01:58', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (834, '/step/add', '127.0.0.1', '[null]', 'POST', '2019-10-09 08:05:09', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (835, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 08:05:18', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (836, '/step/add', '127.0.0.1', '[null]', 'POST', '2019-10-09 08:06:19', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (837, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 08:06:21', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (838, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:07:54', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (839, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:07:56', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (840, '/step/add', '127.0.0.1', '[null]', 'POST', '2019-10-09 08:08:06', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (841, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 08:08:12', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (842, '/step/add', '127.0.0.1', '[null]', 'POST', '2019-10-09 08:15:58', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (843, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 08:16:47', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (844, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:16:47', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (845, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:16:47', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (846, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:16:47', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (847, '/step/add', '127.0.0.1', '[null]', 'POST', '2019-10-09 08:17:01', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (848, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 08:17:12', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (849, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:17:43', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (850, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:17:47', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (851, '/step/add', '127.0.0.1', '[com.site.collect.entity.collect.CollectSetp@5244f4d0]', 'POST', '2019-10-09 08:17:53', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (852, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 08:18:54', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (853, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:19:28', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (854, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:19:34', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (855, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:19:40', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (856, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 08:20:59', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (857, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:22:12', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (858, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:22:13', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (859, '/step/add', '127.0.0.1', '[org.apache.catalina.connector.RequestFacade@57812a34]', 'POST', '2019-10-09 08:22:18', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (860, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 08:30:30', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (861, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:32:48', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (862, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:32:49', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (863, '/step/add', '127.0.0.1', '[null]', 'POST', '2019-10-09 08:33:07', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (864, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 08:33:19', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (865, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:35:21', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (866, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:35:24', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (867, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 08:35:32', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (868, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:37:46', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (869, '/step/add', '127.0.0.1', '[[object Object]]', 'POST', '2019-10-09 08:37:51', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (870, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 08:38:01', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (871, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:38:08', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (872, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:38:11', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (873, '/step/add', '127.0.0.1', '[null]', 'POST', '2019-10-09 08:38:15', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (874, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 08:38:22', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (875, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:38:35', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (876, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:38:38', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (877, '/step/add', '127.0.0.1', '[null]', 'POST', '2019-10-09 08:38:43', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (878, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 08:38:48', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (879, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:39:27', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (880, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:39:30', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (881, '/step/add', '127.0.0.1', '[http://www.baidu.com/s?ie=UTF-8&wd=baidu]', 'POST', '2019-10-09 08:39:32', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (882, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 08:39:38', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (883, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:40:03', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (884, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:40:05', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (885, '/step/add', '127.0.0.1', '[{\"name\":\"baidu\",\"addr\":\"http://www.baidu.com/s?ie=UTF-8&wd=baidu\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":1,\"uid\":\"1\"}]', 'POST', '2019-10-09 08:40:07', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (886, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 08:40:13', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (887, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:40:22', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (888, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 08:40:24', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (889, '/step/add', '127.0.0.1', '[[{\"name\":\"baidu\",\"addr\":\"http://www.baidu.com/s?ie=UTF-8&wd=baidu\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":1,\"uid\":\"1\"}]]', 'POST', '2019-10-09 08:40:27', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (890, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 09:23:09', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (891, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 09:27:20', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (892, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 09:27:42', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (893, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 09:28:42', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (894, '/step/add', '127.0.0.1', '[[{\"name\":\"baidu\",\"addr\":\"http://www.baidu.com/s?ie=UTF-8&wd=baidu\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":1,\"collectId\":\"1\"},{\"name\":\"baidu2\",\"addr\":\"www.baidu.com\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":\"2\",\"collectId\":\"1\"},{\"name\":\"baidu2\",\"addr\":\"www.baidu.com\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":\"2\",\"collectId\":\"1\"},{\"name\":\"baidu2\",\"addr\":\"www.baidu.com\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":\"2\",\"collectId\":\"1\"}]]', 'POST', '2019-10-09 09:29:05', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (895, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 09:29:32', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (896, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 09:30:16', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (897, '/step/add', '127.0.0.1', '[[{\"name\":\"baidu\",\"addr\":\"http://www.baidu.com/s?ie=UTF-8&wd=baidu\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":1,\"collectId\":\"1\"},{\"name\":\"test\",\"addr\":\"www.baidu.com\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":\"2\",\"collectId\":\"1\"}]]', 'POST', '2019-10-09 09:30:54', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (898, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 09:31:10', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (899, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 09:31:32', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (900, '/step/add', '127.0.0.1', '[[{\"name\":\"baidu\",\"addr\":\"http://www.baidu.com/s?ie=UTF-8&wd=baidu\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":1,\"collectId\":\"1\"},{\"name\":\"test\",\"addr\":\"www.baidu.com\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":\"2\",\"collectId\":\"1\"}]]', 'POST', '2019-10-09 09:31:51', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (901, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 09:32:22', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (902, '/step/add', '127.0.0.1', '[[{\"name\":\"baidu\",\"addr\":\"http://www.baidu.com/s?ie=UTF-8&wd=baidu\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":1,\"collectId\":\"1\"},{\"name\":\"test\",\"addr\":\"www.baidu.com\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":\"2\",\"collectId\":\"1\"},{\"name\":\"test\",\"addr\":\"www.baidu.com\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":\"2\",\"collectId\":\"1\"}]]', 'POST', '2019-10-09 09:42:51', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (903, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 09:42:58', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (904, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 09:51:53', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (905, '/step/add', '127.0.0.1', '[[{\"name\":\"baidu\",\"addr\":\"http://www.baidu.com/s?ie=UTF-8&wd=baidu\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":1,\"collectId\":\"1\"},{\"name\":\"test1\",\"addr\":\"www.qq.com\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":\"2\",\"collectId\":\"1\"}]]', 'POST', '2019-10-09 09:52:09', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (906, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 09:52:15', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (907, '/step/add', '127.0.0.1', '[[{\"name\":\"baidu\",\"addr\":\"http://www.baidu.com/s?ie=UTF-8&wd=baidu\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":1,\"collectId\":\"1\"},{\"name\":\"test1\",\"addr\":\"www.qq.com\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":\"2\",\"collectId\":\"1\"},{\"name\":\"test1\",\"addr\":\"www.qq.com\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":\"2\",\"collectId\":\"1\"}]]', 'POST', '2019-10-09 09:54:43', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (908, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 09:57:02', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (909, '/step/add', '127.0.0.1', '[[{\"name\":\"baidu\",\"addr\":\"http://www.baidu.com/s?ie=UTF-8&wd=baidu\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":1,\"collectId\":\"1\"},{\"name\":\"test1\",\"addr\":\"www.qq.com\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":\"2\",\"collectId\":\"1\"},{\"name\":\"test1\",\"addr\":\"www.qq.com\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":\"2\",\"collectId\":\"1\"},{\"name\":\"test1\",\"addr\":\"www.qq.com\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":\"2\",\"collectId\":\"1\"}]]', 'POST', '2019-10-09 09:57:13', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (910, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 10:00:32', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (911, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 10:01:05', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (912, '/step/add', '127.0.0.1', '[[{\"name\":\"baidu\",\"addr\":\"http://wwwbaidu.com/s?ie=UTF-8&wd=baidu\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":1,\"collectId\":\"1\"},{\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"collectId\":\"1\"}]]', 'POST', '2019-10-09 10:01:15', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (913, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 10:01:19', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (914, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-09 10:01:43', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (915, '/step/add', '127.0.0.1', '[[{\"name\":\"baidu\",\"addr\":\"http://www.baidu.com/s?ie=UTF-8&wd=baidu\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":1,\"collectId\":\"1\"},{\"name\":\"test2\",\"addr\":\"www.qq.com\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":\"2\",\"collectId\":\"1\"}]]', 'POST', '2019-10-09 10:01:54', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (916, '/step/add', '127.0.0.1', NULL, 'POST', '2019-10-09 10:01:59', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (917, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@260bd97e, org.apache.catalina.connector.ResponseFacade@614d6f3]', 'POST', '2019-10-10 08:04:46', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (918, '/collect/info', '127.0.0.1', NULL, 'GET', '2019-10-10 08:04:53', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (919, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-10 08:04:54', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (920, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@72192aaf]', 'GET', '2019-10-10 08:05:00', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (921, '/collect/info', '127.0.0.1', '[1]', 'GET', '2019-10-10 08:05:18', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (922, '/step/add', '127.0.0.1', '[[{\"name\":\"baidu\",\"addr\":\"http://www.baidu.com/s?ie=UTF-8&wd=baidu\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":1,\"collectId\":\"1\"},{\"name\":\"step2\",\"addr\":\"www.baidu.com\",\"value\":\"[{\\\"value\\\":\\\"//h3[@class=\'t\']/a/allText()\\\",\\\"name\\\":\\\"item\\\"}]\",\"index\":\"2\",\"collectId\":\"1\"}]]', 'POST', '2019-10-10 08:05:39', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (923, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@14968e83]', 'GET', '2019-10-10 08:36:08', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (924, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@c27da83]', 'GET', '2019-10-10 08:38:03', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (925, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@510c945]', 'GET', '2019-10-10 08:38:33', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (926, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@1a50b6e]', 'GET', '2019-10-10 09:18:24', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (927, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@77ce4c1a]', 'GET', '2019-10-10 09:18:26', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (928, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@219e2b88]', 'GET', '2019-10-10 09:19:45', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (929, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@40f14afb]', 'GET', '2019-10-10 09:19:47', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (930, '/collect/add', '127.0.0.1', NULL, 'GET', '2019-10-10 09:20:00', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (931, '/collect/add', '127.0.0.1', NULL, 'GET', '2019-10-10 09:24:31', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (932, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@745eec79]', 'GET', '2019-10-10 09:25:42', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (933, '/collect/add', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@3e4a2f1a]', 'POST', '2019-10-10 09:26:01', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (934, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@2ac99d55]', 'GET', '2019-10-10 09:26:50', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (935, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@3a9c9ead]', 'GET', '2019-10-10 09:27:59', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (936, '/collect/add', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@73f531e7]', 'POST', '2019-10-10 09:28:07', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (937, '/collect/info', '127.0.0.1', NULL, 'GET', '2019-10-10 09:28:17', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (938, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@287e5098]', 'GET', '2019-10-10 09:29:13', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (939, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@3b272558]', 'GET', '2019-10-10 09:29:15', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (940, '/collect/add', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@5c73ceef]', 'POST', '2019-10-10 09:29:29', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (941, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@148748c5]', 'GET', '2019-10-10 09:30:00', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (942, '/collect/add', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@31caa2c2]', 'POST', '2019-10-10 09:30:13', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (943, '/collect/list', '127.0.0.1', NULL, 'GET', '2019-10-11 07:17:00', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (944, '/collect/list', '127.0.0.1', NULL, 'GET', '2019-10-11 07:17:00', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (945, '/logout', '127.0.0.1', NULL, 'GET', '2019-10-11 07:17:14', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (946, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@43bed6dd, org.apache.catalina.connector.ResponseFacade@66e8ec2f]', 'POST', '2019-10-11 07:17:16', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (947, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-11 07:17:17', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (948, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@652df01]', 'GET', '2019-10-11 07:17:22', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (949, '/collect/add', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@2a33a7a2]', 'POST', '2019-10-11 07:17:56', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (950, '/collect/add', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@4cec913f]', 'POST', '2019-10-11 07:36:09', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (951, '/collect/info', '127.0.0.1', '[7]', 'GET', '2019-10-11 07:36:23', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (952, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@75c48716]', 'GET', '2019-10-11 08:23:40', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (953, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@53aed695]', 'GET', '2019-10-11 08:25:20', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (954, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@7fed89f]', 'GET', '2019-10-11 08:26:15', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (955, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@35d175f5]', 'GET', '2019-10-11 08:52:47', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (956, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@2fba8da7]', 'GET', '2019-10-11 09:15:08', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (957, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@4090a88f]', 'GET', '2019-10-11 09:15:10', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (958, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@62ac3771]', 'GET', '2019-10-11 09:15:17', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (959, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@666c79b2]', 'GET', '2019-10-11 09:20:37', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (960, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@2de22970]', 'GET', '2019-10-11 09:20:41', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (961, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@5ce4d70b, org.apache.catalina.connector.ResponseFacade@68ece31c]', 'POST', '2019-10-13 05:09:09', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (962, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-10-13 05:09:10', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (963, '/collect/info', '127.0.0.1', '[null]', 'GET', '2019-10-13 05:09:13', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (964, '/collect/info', '127.0.0.1', NULL, 'GET', '2019-10-13 05:09:13', NULL, '请求出错');
INSERT INTO `sys_operating_record` VALUES (965, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@7bf954d3]', 'GET', '2019-10-13 05:09:14', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (966, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@2398836e]', 'GET', '2019-10-13 05:17:59', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (967, '/test', '0:0:0:0:0:0:0:1', '[]', 'GET', '2019-10-17 07:51:24', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (968, '/test', '0:0:0:0:0:0:0:1', '[]', 'GET', '2019-10-17 07:54:05', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (969, '/test', '0:0:0:0:0:0:0:1', '[]', 'GET', '2019-10-17 07:54:17', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (970, '/test', '0:0:0:0:0:0:0:1', '[]', 'GET', '2019-10-17 07:54:55', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (971, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@6901f6b3, org.apache.catalina.connector.ResponseFacade@7fa7a5f5]', 'POST', '2019-11-21 08:32:52', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (972, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-11-21 08:32:54', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (973, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@1814e269]', 'GET', '2019-11-21 08:34:07', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (974, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@7842c11e, org.apache.catalina.connector.ResponseFacade@b942a19]', 'POST', '2019-12-19 07:19:45', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (975, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-12-19 07:19:46', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (976, '/login', '127.0.0.1', '[com.site.collect.pojo.dto.UserInfoDto@3b153a93, org.apache.catalina.connector.ResponseFacade@b942a19]', 'POST', '2019-12-21 21:40:09', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (977, '/user/list', '127.0.0.1', '[ParamsDto{id=\'null\', ids=null, type=null, status=null, keyword=\'\', startPage=1, pageSize=10}]', 'GET', '2019-12-21 21:40:10', NULL, '授权通过');
INSERT INTO `sys_operating_record` VALUES (978, '/collect/list', '127.0.0.1', '[com.site.collect.pojo.dto.CollectDto@7086caef]', 'GET', '2019-12-21 21:40:13', NULL, '授权通过');
COMMIT;

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
