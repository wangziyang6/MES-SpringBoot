/*
Navicat MySQL Data Transfer

Source Server         : sparchetype
Source Server Version : 50729
Source Host           : localhost:3306
Source Database       : sparchetype

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2020-03-02 10:40:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sp_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_dict`;
CREATE TABLE `sp_sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '标签名',
  `value` varchar(64) NOT NULL COMMENT '数据值',
  `type` varchar(64) NOT NULL COMMENT '类型',
  `descr` varchar(255) DEFAULT '""' COMMENT '描述',
  `sort_num` int(11) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '""' COMMENT '父级id',
  `is_deleted` char(2) NOT NULL COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  KEY `idx_sp_sys_dict_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统字典表';

-- ----------------------------
-- Records of sp_sys_dict
-- ----------------------------
INSERT INTO `sp_sys_dict` VALUES ('1183935079065665538', '足球', 'football', 'hobby', '爱好足球', '1', null, '00', '2019-10-15 10:38:14', 'SongPeng', '2019-10-15 10:38:14', 'SongPeng');
INSERT INTO `sp_sys_dict` VALUES ('1183975587515330561', '篮球', 'basketball', 'hobby', '爱好篮球', '2', null, '00', '2019-10-15 13:19:12', 'SongPeng', '2019-10-15 13:19:12', 'SongPeng');

-- ----------------------------
-- Table structure for sp_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_menu`;
CREATE TABLE `sp_sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '菜单名称',
  `url` varchar(255) NOT NULL COMMENT '菜单URL',
  `parent_id` varchar(64) NOT NULL COMMENT '父菜单ID，一级菜单设为0',
  `grade` varchar(1) NOT NULL COMMENT '层级：1级、2级、3级......',
  `sort_num` int(11) NOT NULL COMMENT '排序',
  `type` varchar(1) NOT NULL COMMENT '类型：0 目录；1 菜单；2 按钮',
  `permission` varchar(255) DEFAULT '""' COMMENT '授权(多个用逗号分隔，如：sys:menu:list,sys:menu:create)',
  `icon` varchar(255) DEFAULT '""' COMMENT '菜单图标',
  `descr` varchar(255) DEFAULT '""' COMMENT '描述',
  `created` datetime NOT NULL COMMENT '创建时间',
  `created_username` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sp_sys_menu_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sp_sys_menu
-- ----------------------------
INSERT INTO `sp_sys_menu` VALUES ('1185032371986358273', '系统管理', '#', '0', '1', '1', '0', 'user:add', '', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');

-- ----------------------------
-- Table structure for sp_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_role`;
CREATE TABLE `sp_sys_role` (
  `id` varchar(64) NOT NULL COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '角色名称',
  `code` varchar(32) NOT NULL COMMENT '角色编码',
  `descr` varchar(255) DEFAULT '""' COMMENT '角色描述',
  `is_deleted` varchar(2) NOT NULL COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sp_sys_role_name` (`name`),
  UNIQUE KEY `idx_sp_sys_role_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sp_sys_role
-- ----------------------------
INSERT INTO `sp_sys_role` VALUES ('1185025876737396738', '超级管理员', 'admin', '超级管理员', '1', '2019-10-18 10:52:40', 'SongPeng', '2020-02-29 16:38:36', 'admin');
INSERT INTO `sp_sys_role` VALUES ('1232532514523213826', '体验者', 'experience', '体验者', '1', '2020-02-26 13:07:05', 'admin', '2020-02-29 16:38:41', 'admin');

-- ----------------------------
-- Table structure for sp_sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_role_menu`;
CREATE TABLE `sp_sys_role_menu` (
  `id` varchar(64) NOT NULL COMMENT '主键id',
  `role_id` varchar(64) NOT NULL COMMENT '角色id',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sp_sys_role_menu
-- ----------------------------
INSERT INTO `sp_sys_role_menu` VALUES ('1', '1185025876737396738', '1185032371986358273', '2019-10-28 14:51:44', '1184019107907227649', '2019-10-28 14:51:56', '1184019107907227649');

-- ----------------------------
-- Table structure for sp_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_user`;
CREATE TABLE `sp_sys_user` (
  `id` varchar(64) NOT NULL COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '姓名',
  `username` varchar(128) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `dept_id` varchar(64) DEFAULT '""' COMMENT '部门id',
  `email` varchar(64) DEFAULT '""' COMMENT '邮箱',
  `mobile` varchar(32) NOT NULL COMMENT '手机号',
  `tel` varchar(32) DEFAULT '""' COMMENT '固定电话',
  `sex` char(1) NOT NULL COMMENT '性别(0:女;1:男;2:其他)',
  `birthday` datetime DEFAULT NULL COMMENT '出生年月日',
  `pic_id` varchar(64) DEFAULT '""' COMMENT '图片id，对应sys_file表中的id',
  `id_card` varchar(32) DEFAULT '""' COMMENT '身份证',
  `hobby` varchar(255) DEFAULT '""' COMMENT '爱好',
  `province` varchar(128) DEFAULT '""' COMMENT '省份',
  `city` varchar(128) DEFAULT '""' COMMENT '城市',
  `district` varchar(128) DEFAULT '""' COMMENT '区县',
  `street` varchar(128) DEFAULT '""' COMMENT '街道',
  `street_number` varchar(64) DEFAULT '""' COMMENT '门牌号',
  `descr` varchar(255) DEFAULT '""' COMMENT '描述',
  `is_deleted` varchar(1) NOT NULL COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sp_sys_user_username` (`username`) COMMENT '用户名唯一索引',
  UNIQUE KEY `idx_sp_sys_user_mobile` (`mobile`) COMMENT '用户手机号唯一索引',
  KEY `idx_sp_sys_user_email` (`email`) COMMENT '用户邮箱唯一索引',
  KEY `idx_sp_sys_user_id_card` (`id_card`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sp_sys_user
-- ----------------------------
INSERT INTO `sp_sys_user` VALUES ('1184009088826392578', '宋鹏', 'iamsongpeng', '9d7281eeaebded0b091340cfa658a7e8', '', '', '13776337795', '', '1', null, '', '', '', '', '', '', '', '', '', '0', '2019-10-15 15:32:19', 'SongPeng', '2020-02-28 16:44:59', 'admin');
INSERT INTO `sp_sys_user` VALUES ('1184010472443396098', '猴子', 'monkey', '9d7281eeaebded0b091340cfa658a7e8', '123', '', '137763377', '', '0', null, '', '', '', '', '', '', '', '', '', '0', '2019-10-15 15:37:52', 'SongPeng', '2020-02-26 15:03:32', 'admin');
INSERT INTO `sp_sys_user` VALUES ('1184019107907227649', '超级管理员', 'admin', '9d7281eeaebded0b091340cfa658a7e8', '11', '', '13776337796', '44', '0', null, '55', '66', '77', '88', '99', '10', '11', '12', '13', '0', '2019-10-15 16:12:08', 'SongPeng', '2020-02-26 15:03:39', 'admin');

-- ----------------------------
-- Table structure for sp_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_user_role`;
CREATE TABLE `sp_sys_user_role` (
  `id` varchar(64) NOT NULL COMMENT '主键id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `role_id` varchar(64) NOT NULL COMMENT '角色id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sp_sys_user_role
-- ----------------------------
INSERT INTO `sp_sys_user_role` VALUES ('1', '1184019107907227649', '1185025876737396738', '2019-10-28 14:33:18', '1184019107907227649', '2019-10-28 14:33:16', '1184019107907227649');
