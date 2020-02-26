/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.7.24 : Database - sparchetype
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sparchetype` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `sparchetype`;

/*Table structure for table `sp_sys_dict` */

DROP TABLE IF EXISTS `sp_sys_dict`;

CREATE TABLE `sp_sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '标签名',
  `value` varchar(64) NOT NULL COMMENT '数据值',
  `type` varchar(64) NOT NULL COMMENT '类型',
  `descr` varchar(255) DEFAULT '""' COMMENT '描述',
  `sort_num` int(11) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '""' COMMENT '父级id',
  `status` char(2) NOT NULL COMMENT '状态：逻辑已删除值(默认为 1); 逻辑未删除值(默认为 00)',
  `created` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(64) NOT NULL COMMENT '创建人',
  `last_upd` datetime NOT NULL COMMENT '最后更新时间',
  `last_upd_by` varchar(64) NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  KEY `idx_sp_sys_dict_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统字典表';

/*Data for the table `sp_sys_dict` */

insert  into `sp_sys_dict`(`id`,`name`,`value`,`type`,`descr`,`sort_num`,`parent_id`,`status`,`created`,`created_by`,`last_upd`,`last_upd_by`) values
('1183935079065665538','足球','football','hobby','爱好足球',1,NULL,'00','2019-10-15 10:38:14','SongPeng','2019-10-15 10:38:14','SongPeng'),
('1183975587515330561','篮球','basketball','hobby','爱好篮球',2,NULL,'00','2019-10-15 13:19:12','SongPeng','2019-10-15 13:19:12','SongPeng');

/*Table structure for table `sp_sys_menu` */

DROP TABLE IF EXISTS `sp_sys_menu`;

CREATE TABLE `sp_sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '菜单名称',
  `url` varchar(255) NOT NULL COMMENT '菜单URL',
  `parent_id` varchar(64) NOT NULL COMMENT '父菜单ID，一级菜单设为0',
  `grade` char(2) NOT NULL COMMENT '层级：1级、2级、3级......',
  `sort_num` int(11) NOT NULL COMMENT '排序',
  `type` char(2) NOT NULL COMMENT '类型：0 目录；1 菜单；2 按钮',
  `permission` varchar(255) DEFAULT '""' COMMENT '授权(多个用逗号分隔，如：sys:menu:list,sys:menu:create)',
  `icon` varchar(255) DEFAULT '""' COMMENT '菜单图标',
  `descr` varchar(255) DEFAULT '""' COMMENT '描述',
  `created` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(64) NOT NULL COMMENT '创建人',
  `last_upd` datetime NOT NULL COMMENT '最后更新时间',
  `last_upd_by` varchar(64) NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sp_sys_menu_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `sp_sys_menu` */

insert  into `sp_sys_menu`(`id`,`name`,`url`,`parent_id`,`grade`,`sort_num`,`type`,`permission`,`icon`,`descr`,`created`,`created_by`,`last_upd`,`last_upd_by`) values
('1185032371986358273','系统管理','#','0','1',1,'0','user:add','','','2019-10-18 11:18:29','SongPeng','2019-10-18 11:18:29','SongPeng');

/*Table structure for table `sp_sys_role` */

DROP TABLE IF EXISTS `sp_sys_role`;

CREATE TABLE `sp_sys_role` (
  `id` varchar(64) NOT NULL COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '角色名称',
  `code` varchar(32) NOT NULL COMMENT '角色编码',
  `descr` varchar(255) DEFAULT '""' COMMENT '角色描述',
  `status` char(2) NOT NULL COMMENT '状态(00:删除;01:正常;02:禁用)',
  `created` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(64) NOT NULL COMMENT '创建人',
  `last_upd` datetime NOT NULL COMMENT '最后更新时间',
  `last_upd_by` varchar(64) DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sp_sys_role_name` (`name`),
  UNIQUE KEY `idx_sp_sys_role_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `sp_sys_role` */

insert  into `sp_sys_role`(`id`,`name`,`code`,`descr`,`status`,`created`,`created_by`,`last_upd`,`last_upd_by`) values
('1185025876737396738','超级管理员','admin','超级管理员','0','2019-10-18 10:52:40','SongPeng','2019-10-18 10:52:40','SongPeng');

/*Table structure for table `sp_sys_role_menu` */

DROP TABLE IF EXISTS `sp_sys_role_menu`;

CREATE TABLE `sp_sys_role_menu` (
  `id` varchar(64) NOT NULL COMMENT '主键id',
  `role_id` varchar(64) NOT NULL COMMENT '角色id',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单id',
  `created` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(64) NOT NULL COMMENT '创建人',
  `last_upd` datetime NOT NULL COMMENT '最后更新时间',
  `last_upd_by` varchar(64) NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `sp_sys_role_menu` */

insert  into `sp_sys_role_menu`(`id`,`role_id`,`menu_id`,`created`,`created_by`,`last_upd`,`last_upd_by`) values
('1','1185025876737396738','1185032371986358273','2019-10-28 14:51:44','1184019107907227649','2019-10-28 14:51:56','1184019107907227649');

/*Table structure for table `sp_sys_user` */

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
  `status` char(2) NOT NULL COMMENT '状态(00:删除;01:正常;02:禁用)',
  `created` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(64) NOT NULL COMMENT '创建人',
  `last_upd` datetime NOT NULL COMMENT '最后更新时间',
  `last_upd_by` varchar(64) NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sp_sys_user_username` (`username`) COMMENT '用户名唯一索引',
  UNIQUE KEY `idx_sp_sys_user_mobile` (`mobile`) COMMENT '用户手机号唯一索引',
  KEY `idx_sp_sys_user_email` (`email`) COMMENT '用户邮箱唯一索引',
  KEY `idx_sp_sys_user_id_card` (`id_card`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `sp_sys_user` */

insert  into `sp_sys_user`(`id`,`name`,`username`,`password`,`dept_id`,`email`,`mobile`,`tel`,`sex`,`birthday`,`pic_id`,`id_card`,`hobby`,`province`,`city`,`district`,`street`,`street_number`,`descr`,`status`,`created`,`created_by`,`last_upd`,`last_upd_by`) values
('1184009088826392578','宋鹏','iamsongpeng','123','','','13776337795','','1',NULL,'','','','','','','','','','0','2019-10-15 15:32:19','SongPeng','2019-10-15 15:51:29','SongPeng'),
('1184010472443396098','猴子','monkey','1','','','1','','0',NULL,'','','','','','','','','','0','2019-10-15 15:37:52','SongPeng','2019-10-18 13:32:05','SongPeng'),
('1184019107907227649','超级管理员','admin','9d7281eeaebded0b091340cfa658a7e8','11','','13776337796','44','0',NULL,'55','66','77','88','99','10','11','12','13','0','2019-10-15 16:12:08','SongPeng','2019-10-18 13:05:28','SongPeng');

/*Table structure for table `sp_sys_user_role` */

DROP TABLE IF EXISTS `sp_sys_user_role`;

CREATE TABLE `sp_sys_user_role` (
  `id` varchar(64) NOT NULL COMMENT '主键id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `role_id` varchar(64) NOT NULL COMMENT '角色id',
  `created` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(64) NOT NULL COMMENT '创建人',
  `last_upd` datetime NOT NULL COMMENT '最后更新时间',
  `last_upd_by` varchar(64) NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `sp_sys_user_role` */

insert  into `sp_sys_user_role`(`id`,`user_id`,`role_id`,`created`,`created_by`,`last_upd`,`last_upd_by`) values
('1','1184019107907227649','1185025876737396738','2019-10-28 14:33:18','1184019107907227649','2019-10-28 14:33:16','1184019107907227649');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
