/*Table structure for table `sp_sys_user` */

DROP TABLE IF EXISTS `sp_sys_user`;

CREATE TABLE `sp_sys_user` (
  `id` varchar(64) NOT NULL COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '姓名',
  `username` varchar(128) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `dept_id` varchar(64) DEFAULT NULL COMMENT '部门id',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(32) NOT NULL COMMENT '手机号',
  `tel` varchar(32) DEFAULT NULL COMMENT '固定电话',
  `sex` char(1) NOT NULL COMMENT '性别(0:女;1:男;2:其他)',
  `birthday` datetime DEFAULT NULL COMMENT '出生年月日',
  `pic_id` varchar(64) DEFAULT NULL COMMENT '图片id，对应sys_file表中的id',
  `id_card` varchar(32) DEFAULT NULL COMMENT '身份证',
  `hobby` varchar(255) DEFAULT NULL COMMENT '爱好',
  `province` varchar(128) DEFAULT NULL COMMENT '省份',
  `city` varchar(128) DEFAULT NULL COMMENT '城市',
  `district` varchar(128) DEFAULT NULL COMMENT '区县',
  `street` varchar(128) DEFAULT NULL COMMENT '街道',
  `street_number` varchar(64) DEFAULT NULL COMMENT '门牌号',
  `descr` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` char(1) NOT NULL COMMENT '状态(0:删除;1:正常;2:禁用)',
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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;