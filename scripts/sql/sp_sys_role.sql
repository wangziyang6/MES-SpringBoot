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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
