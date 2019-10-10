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
  `id` varchar(64) NOT NULL COMMENT 'id',
  `name` varchar(64) NOT NULL COMMENT '标签名',
  `value` varchar(64) NOT NULL COMMENT '数据值',
  `type` varchar(64) NOT NULL COMMENT '类型',
  `descr` varchar(255) DEFAULT NULL COMMENT '描述',
  `sort_num` int(11) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT NULL COMMENT '父级id',
  `status` char(1) NOT NULL COMMENT '状态：逻辑已删除值(默认为 1); 逻辑未删除值(默认为 0)',
  `created` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(64) NOT NULL COMMENT '创建人',
  `last_upd` datetime NOT NULL COMMENT '最后更新时间',
  `last_upd_by` varchar(64) NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  KEY `idx_sp_sys_dict_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统字典表';

/*Data for the table `sp_sys_dict` */

insert  into `sp_sys_dict`(`id`,`name`,`value`,`type`,`descr`,`sort_num`,`parent_id`,`status`,`created`,`created_by`,`last_upd`,`last_upd_by`) values 
('1166284627817877506','test','test','test','test',1,'0','0','2019-08-27 17:41:17','test','2019-08-27 17:41:17','test'),
('1300490103029792','是','1','yes_no','是/否',1,'0','0','2019-08-26 00:00:00','sp','2019-08-26 16:08:47','sp'),
('1300490690232352','否','1','yes_no','是/否',2,'0','0','2019-08-26 00:00:00','sp','2019-08-26 16:12:05','sp'),
('1300670302912544','test','test','test','test',1,'0','0','2019-08-27 15:58:52','test','2019-08-27 15:58:52','test');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
