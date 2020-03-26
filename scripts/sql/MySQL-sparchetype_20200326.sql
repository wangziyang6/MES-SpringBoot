/*
 Navicat Premium Data Transfer

 Source Server         : mytest
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : 192.168.52.76:3306
 Source Schema         : sparchetype

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 26/03/2020 09:04:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sp_factroy
-- ----------------------------
DROP TABLE IF EXISTS `sp_factroy`;
CREATE TABLE `sp_factroy`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `factory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `factory_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工厂表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_factroy
-- ----------------------------
INSERT INTO `sp_factroy` VALUES ('1336542027055136', 'center', '中心工厂123', '2020-03-12 15:22:02', 'admin', '2020-03-13 10:15:54', 'admin');
INSERT INTO `sp_factroy` VALUES ('1336542142398496', '123', '你好', '2020-03-12 15:22:37', 'admin', '2020-03-12 15:22:37', 'admin');
INSERT INTO `sp_factroy` VALUES ('1336542951899168', 'ABC', 'ABC', '2020-03-12 15:29:03', 'admin', '2020-03-12 15:29:03', 'admin');
INSERT INTO `sp_factroy` VALUES ('1336850679595040', '测试数据12', '测试数据12', '2020-03-14 08:14:39', 'admin', '2020-03-14 08:14:39', 'admin');
INSERT INTO `sp_factroy` VALUES ('1336856843124768', '测试数据2', '测试数据2', '2020-03-14 09:03:38', 'admin', '2020-03-14 09:03:38', 'admin');
INSERT INTO `sp_factroy` VALUES ('1336858327908384', '你好', '你好123', '2020-03-14 09:15:26', 'admin', '2020-03-14 09:17:30', 'admin');
INSERT INTO `sp_factroy` VALUES ('1336858648772640', '订单', '的', '2020-03-14 09:17:59', 'admin', '2020-03-14 09:17:59', 'admin');
INSERT INTO `sp_factroy` VALUES ('1336873681158176', 'we', 'wewe', '2020-03-14 11:17:27', 'admin', '2020-03-14 11:17:27', 'admin');
INSERT INTO `sp_factroy` VALUES ('1336873716809760', 'ds', 'sdsdds', '2020-03-14 11:17:44', 'admin', '2020-03-14 11:17:44', 'admin');

-- ----------------------------
-- Table structure for sp_flow
-- ----------------------------
DROP TABLE IF EXISTS `sp_flow`;
CREATE TABLE `sp_flow`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `flow` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程',
  `flow_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '线体描述',
  `process` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程绘制 A——>B——>C',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流程表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_flow
-- ----------------------------
INSERT INTO `sp_flow` VALUES ('1239827518405050369', 'TST-01', '测试流程01', '集成测试工序->测试工序', '2020-03-17 16:14:50', 'admin', '2020-03-17 16:14:50', 'admin');
INSERT INTO `sp_flow` VALUES ('1336868289380384', 'DC-ASY', '电池组装流程', '焊接->封胶工序->加酸工序->清洗工序->入库工序', '2020-03-14 10:34:36', 'admin', '2020-03-17 15:46:12', 'admin');

-- ----------------------------
-- Table structure for sp_flow_oper_relation
-- ----------------------------
DROP TABLE IF EXISTS `sp_flow_oper_relation`;
CREATE TABLE `sp_flow_oper_relation`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `flow_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程ID',
  `flow` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程代码',
  `per_oper_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '前道工序ID',
  `per_oper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '前道工序代码',
  `oper_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '当前工序ID',
  `oper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '当前工序\r\n',
  `next_oper_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '下道工序ID',
  `next_oper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '下道工序',
  `sort_num` int(11) NOT NULL COMMENT '排序',
  `oper_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序类型（首道工序firstOper;最后一道工序lastOper）',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `flow_id_index`(`flow_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流程与工序关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_flow_oper_relation
-- ----------------------------
INSERT INTO `sp_flow_oper_relation` VALUES ('1239820314474020866', '1336868289380384', 'DC-ASY', '', '', '1336868360683552', 'HJ-01', '1336868452958240', 'FJ-01', 1, NULL, '2020-03-17 15:46:12', 'admin', '2020-03-17 15:46:12', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1239820314490798081', '1336868289380384', 'DC-ASY', '1336868360683552', 'HJ-01', '1336868452958240', 'FJ-01', '1336868507484192', 'JS-01', 2, NULL, '2020-03-17 15:46:12', 'admin', '2020-03-17 15:46:12', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1239820314499186690', '1336868289380384', 'DC-ASY', '1336868452958240', 'FJ-01', '1336868507484192', 'JS-01', '1336868562010144', 'QX-01', 3, NULL, '2020-03-17 15:46:12', 'admin', '2020-03-17 15:46:12', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1239820314499186691', '1336868289380384', 'DC-ASY', '1336868507484192', 'JS-01', '1336868562010144', 'QX-01', '1337248255574048', 'RK-01', 4, NULL, '2020-03-17 15:46:12', 'admin', '2020-03-17 15:46:12', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1239820314507575297', '1336868289380384', 'DC-ASY', '1336868562010144', 'QX-01', '1337248255574048', 'RK-01', '', '', 5, NULL, '2020-03-17 15:46:12', 'admin', '2020-03-17 15:46:12', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1239827518556045314', '1239827518405050369', 'TST-01', '', '', '1336864613072928', 'TST-01', '1336864537575456', 'TST-02', 1, NULL, '2020-03-17 16:14:50', 'admin', '2020-03-17 16:14:50', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1239827518564433922', '1239827518405050369', 'TST-01', '1336864613072928', 'TST-01', '1336864537575456', 'TST-02', '', '', 2, NULL, '2020-03-17 16:14:50', 'admin', '2020-03-17 16:14:50', 'admin');

-- ----------------------------
-- Table structure for sp_line
-- ----------------------------
DROP TABLE IF EXISTS `sp_line`;
CREATE TABLE `sp_line`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `line` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '线体',
  `line_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '线体描述',
  `process_section` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序段代号',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '线体表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_line
-- ----------------------------
INSERT INTO `sp_line` VALUES ('1336867983196192', 'WZY-ASY-01', '装配线体01线', 'ASY', '2020-03-14 10:32:10', 'admin', '2020-03-14 10:32:10', 'admin');
INSERT INTO `sp_line` VALUES ('1336868041916448', 'WZY-TEST-01', '测试01线体', 'TST', '2020-03-14 10:32:38', 'admin', '2020-03-14 10:32:38', 'admin');
INSERT INTO `sp_line` VALUES ('1336868662673440', 'WZY-DC-01', '电池组装01线', 'ASY', '2020-03-14 10:37:34', 'admin', '2020-03-14 10:37:34', 'admin');

-- ----------------------------
-- Table structure for sp_materile
-- ----------------------------
DROP TABLE IF EXISTS `sp_materile`;
CREATE TABLE `sp_materile`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `materiel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料编码',
  `materiel_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料描述',
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '基本单位',
  `product_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品组',
  `mat_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物料类型',
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '型号',
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '尺寸',
  `flow_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程',
  `flow_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程描述',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  `is_deleted` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_materile
-- ----------------------------
INSERT INTO `sp_materile` VALUES ('1241968044671590402', '1001001', '智能水杯', '杯', '001', 'FG', 'MD-SH-0001', '10*10*10', '1336868289380384', '电池组装流程', '2020-03-23 14:00:31', 'admin', '2020-03-24 13:31:50', 'admin', '0');
INSERT INTO `sp_materile` VALUES ('1241968665663463425', '1002001', '智能水杯主板', 'PCS', '002', 'PG', 'PCB-01', '00', '1239827518405050369', NULL, '2020-03-23 14:02:59', 'admin', '2020-03-23 14:02:59', 'admin', '0');
INSERT INTO `sp_materile` VALUES ('1241969497641410561', '1003001', '杯盖', 'P', '003', 'material', 'DDD', '', '1239827518405050369', NULL, '2020-03-23 14:06:18', 'admin', '2020-03-23 14:06:18', 'admin', '0');

-- ----------------------------
-- Table structure for sp_oper
-- ----------------------------
DROP TABLE IF EXISTS `sp_oper`;
CREATE TABLE `sp_oper`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `oper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序\r\n',
  `oper_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序描述',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工序表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_oper
-- ----------------------------
INSERT INTO `sp_oper` VALUES ('1336864489340960', 'ASY-01', '装配工序', '2020-03-14 10:04:24', 'admin', '2020-03-14 10:04:24', 'admin');
INSERT INTO `sp_oper` VALUES ('1336864537575456', 'TST-02', '测试工序', '2020-03-14 10:04:47', 'admin', '2020-03-14 10:04:47', 'admin');
INSERT INTO `sp_oper` VALUES ('1336864575324192', 'APK-01', '包装工序', '2020-03-14 10:05:05', 'admin', '2020-03-14 10:05:05', 'admin');
INSERT INTO `sp_oper` VALUES ('1336864613072928', 'TST-01', '集成测试工序', '2020-03-14 10:05:23', 'admin', '2020-03-14 10:05:23', 'admin');
INSERT INTO `sp_oper` VALUES ('1336868360683552', 'HJ-01', '焊接', '2020-03-14 10:35:10', 'admin', '2020-03-14 10:35:10', 'admin');
INSERT INTO `sp_oper` VALUES ('1336868452958240', 'FJ-01', '封胶工序', '2020-03-14 10:35:54', 'admin', '2020-03-14 10:35:54', 'admin');
INSERT INTO `sp_oper` VALUES ('1336868507484192', 'JS-01', '加酸工序', '2020-03-14 10:36:20', 'admin', '2020-03-14 10:36:20', 'admin');
INSERT INTO `sp_oper` VALUES ('1336868562010144', 'QX-01', '清洗工序', '2020-03-14 10:36:46', 'admin', '2020-03-14 10:36:46', 'admin');
INSERT INTO `sp_oper` VALUES ('1337248255574048', 'RK-01', '入库工序', '2020-03-16 12:54:18', 'admin', '2020-03-16 12:54:18', 'admin');

-- ----------------------------
-- Table structure for sp_sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_department`;
CREATE TABLE `sp_sys_department`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sort_num` int(11) NOT NULL,
  `is_deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sp_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_dict`;
CREATE TABLE `sp_sys_dict`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名',
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '数据值',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '描述',
  `sort_num` int(11) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '父级id',
  `is_deleted` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sp_sys_dict_name`(`type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_sys_dict
-- ----------------------------
INSERT INTO `sp_sys_dict` VALUES ('1337615246688288', '原材料', 'material', 'material_type', '物料类型', 1, '\"\"', '0', '2020-03-18 13:30:53', 'admin', '2020-03-18 13:30:53', 'admin');
INSERT INTO `sp_sys_dict` VALUES ('1337618042191904', '成品', 'FG', 'material_type', '物料类型', 2, '\"\"', '0', '2020-03-18 13:53:06', 'admin', '2020-03-18 13:53:06', 'admin');
INSERT INTO `sp_sys_dict` VALUES ('1337618163826720', '半成品', 'PG', 'material_type', '物料类型', 3, '\"\"', '0', '2020-03-18 13:54:04', 'admin', '2020-03-18 13:54:04', 'admin');
INSERT INTO `sp_sys_dict` VALUES ('1337618837012512', '个', 'PCS', 'ORDER_UNIT', '生产单位', 1, '\"\"', '0', '2020-03-18 13:59:25', 'admin', '2020-03-18 13:59:41', 'admin');
INSERT INTO `sp_sys_dict` VALUES ('1337618939772960', '箱', 'BOX', 'ORDER_UNIT', '生产单位', 2, '\"\"', '0', '2020-03-18 14:00:14', 'admin', '2020-03-18 14:00:14', 'admin');

-- ----------------------------
-- Table structure for sp_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_menu`;
CREATE TABLE `sp_sys_menu`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单URL',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '父菜单ID，一级菜单设为0',
  `grade` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '层级：1级、2级、3级......',
  `sort_num` int(11) NOT NULL COMMENT '排序',
  `type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型：0 目录；1 菜单；2 按钮',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '授权(多个用逗号分隔，如：sys:menu:list,sys:menu:create)',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '菜单图标',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '描述',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_sp_sys_menu_name`(`name`) USING BTREE,
  UNIQUE INDEX `idx_sp_sys_menu_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_sys_menu
-- ----------------------------
INSERT INTO `sp_sys_menu` VALUES ('1', 'currency', '常规管理', '#', '0', '1', 1, '0', 'user:add', 'fa fa-address-book', '', '2019-10-18 11:18:29', 'SongPeng', '2020-03-13 14:07:09', 'admin');
INSERT INTO `sp_sys_menu` VALUES ('101', 'menu', '菜单管理', '/admin/sys/menu/list-ui', '11', '3', 1, '0', 'user:add', 'fa fa-bars', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('102', 'user', '用户管理', '/admin/sys/user/list-ui', '11', '3', 2, '0', 'user:add', 'fa fa-user', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('103', 'role', '角色管理', '/admin/sys/role/list-ui', '11', '3', 3, '0', 'user:add', 'fa fa-child', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('104', 'department', '部门管理', '/admin/sys/department/list-ui', '11', '3', 4, '0', 'user:add', 'fa fa-sitemap', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('105', 'basedata', '基础数据配置平台', '/basedata/manager/list-ui', '11', '3', 5, '0', 'user:add', 'fa fa-cog', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('106', 'basedatamanager', '基础数据维护', '/basedata/manager/item/list-ui', '11', '3', 6, '0', 'user:add', 'fa fa-database', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('107', 'f\r\nflowProcess', '工艺路线管理', '/basedata/flow/process/list-ui', '15', '3', 1, '0', 'user:add', 'fa fa-retweet', '', '2019-10-18 11:18:29', 'Wangziyang', '2019-10-18 11:18:29', 'Wangziyang');
INSERT INTO `sp_sys_menu` VALUES ('11', 'system', '系统管理', '#', '1', '2', 1, '0', 'user:add', 'fa fa-gears', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('12', 'order', '工单管理', '#', '1', '2', 3, '0', 'user:add', 'fa fa-calendar', '', '2019-10-18 11:18:29', 'Wangziyang', '2019-10-18 11:18:29', 'Wangziyang');
INSERT INTO `sp_sys_menu` VALUES ('121', 'orderRelease', '工单下达', '/', '12', '3', 1, '0', 'user:add', 'fa fa-flag-o', '', '2019-10-18 11:18:29', 'Wangziyang', '2019-10-18 11:18:29', 'Wangziyang');
INSERT INTO `sp_sys_menu` VALUES ('13', 'materiel', '物料管理', '#', '1', '2', 2, '0', 'user:add', 'fa fa-cubes', '', '2019-10-18 11:18:29', 'Wangziyang', '2019-10-18 11:18:29', 'Wangziyang');
INSERT INTO `sp_sys_menu` VALUES ('131', 'matdef', '物料维护', '/basedata/materile/list-ui', '13', '3', 1, '0', 'user:add', 'fa fa-microchip', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('14', 'Digitalplatform\n\n', '数字化平台', '#', '1', '2', 5, '0', 'user:add', 'fa fa-pie-chart', '', '2019-10-18 11:18:29', 'Wangziyang', '2019-10-18 11:18:29', 'Wangziyang');
INSERT INTO `sp_sys_menu` VALUES ('141', 'plandg', '智慧大屏', '/digitization/plan/plan-ui', '14', '3', 1, '0', 'user:add', 'fa fa-desktop', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('15', 'ProcessManage', '工艺管理', '#', '1', '2', 4, '0', 'user:add', 'fa fa-wrench', '', '2019-10-18 11:18:29', 'Wangziyang', '2019-10-18 11:18:29', 'Wangziyang');
INSERT INTO `sp_sys_menu` VALUES ('2', 'component', 'OPC操作', '#', '0', '1', 1, '0', 'user:add', 'fa fa-lemon-o', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('3', 'other', '其他管理', '#', '0', '1', 1, '0', 'user:add', 'fa fa-slideshare', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');

-- ----------------------------
-- Table structure for sp_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_role`;
CREATE TABLE `sp_sys_role`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色编码',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '角色描述',
  `is_deleted` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_sp_sys_role_name`(`name`) USING BTREE,
  UNIQUE INDEX `idx_sp_sys_role_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_sys_role
-- ----------------------------
INSERT INTO `sp_sys_role` VALUES ('1185025876737396738', '超级管理员', 'admin', '超级管理员', '0', '2019-10-18 10:52:40', 'SongPeng', '2020-03-13 14:06:43', 'admin');
INSERT INTO `sp_sys_role` VALUES ('1232532514523213826', '体验者', 'experience', '体验者', '0', '2020-02-26 13:07:05', 'admin', '2020-02-29 16:38:41', 'admin');
INSERT INTO `sp_sys_role` VALUES ('1336542182244384', '王子杨', '123', '王子杨', '0', '2020-03-12 15:22:56', 'admin', '2020-03-12 15:22:56', 'admin');

-- ----------------------------
-- Table structure for sp_sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_role_menu`;
CREATE TABLE `sp_sys_role_menu`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色id',
  `menu_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单id',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色对应的菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_sys_role_menu
-- ----------------------------
INSERT INTO `sp_sys_role_menu` VALUES ('1', '1185025876737396738', '1', '2019-10-28 14:51:44', 'admin', '2019-10-28 14:51:56', 'admin');
INSERT INTO `sp_sys_role_menu` VALUES ('2', '1185025876737396738', '2', '2019-10-28 14:51:44', 'admin', '2019-10-28 14:51:56', 'admin');
INSERT INTO `sp_sys_role_menu` VALUES ('3', '1185025876737396738', '3', '2019-10-28 14:51:44', 'admin', '2019-10-28 14:51:56', 'admin');
INSERT INTO `sp_sys_role_menu` VALUES ('4', '1185025876737396738', '101', '2019-10-28 14:51:44', 'admin', '2019-10-28 14:51:56', 'admin');
INSERT INTO `sp_sys_role_menu` VALUES ('5', '1185025876737396738', '102', '2019-10-28 14:51:44', 'admin', '2019-10-28 14:51:56', 'admin');
INSERT INTO `sp_sys_role_menu` VALUES ('6', '1185025876737396738', '103', '2019-10-28 14:51:44', 'admin', '2019-10-28 14:51:56', 'admin');
INSERT INTO `sp_sys_role_menu` VALUES ('7', '1185025876737396738', '104', '2019-10-28 14:51:44', 'admin', '2019-10-28 14:51:56', 'admin');

-- ----------------------------
-- Table structure for sp_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_user`;
CREATE TABLE `sp_sys_user`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `dept_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '部门id',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '邮箱',
  `mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `tel` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '固定电话',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '性别(0:女;1:男;2:其他)',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '出生年月日',
  `pic_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '图片id，对应sys_file表中的id',
  `id_card` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '身份证',
  `hobby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '爱好',
  `province` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '省份',
  `city` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '城市',
  `district` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '区县',
  `street` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '街道',
  `street_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '门牌号',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '描述',
  `is_deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_sp_sys_user_username`(`username`) USING BTREE COMMENT '用户名唯一索引',
  UNIQUE INDEX `idx_sp_sys_user_mobile`(`mobile`) USING BTREE COMMENT '用户手机号唯一索引',
  INDEX `idx_sp_sys_user_email`(`email`) USING BTREE COMMENT '用户邮箱唯一索引',
  INDEX `idx_sp_sys_user_id_card`(`id_card`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_sys_user
-- ----------------------------
INSERT INTO `sp_sys_user` VALUES ('1184009088826392578', '宋鹏', 'iamsongpeng', '9d7281eeaebded0b091340cfa658a7e8', '', '', '13776337795', '', '1', NULL, '', '', '', '', '', '', '', '', '', '0', '2019-10-15 15:32:19', 'SongPeng', '2020-02-28 16:44:59', 'admin');
INSERT INTO `sp_sys_user` VALUES ('1184010472443396098', '猴子', 'monkey', '9d7281eeaebded0b091340cfa658a7e8', '123', '', '137763377', '', '0', NULL, '', '', '', '', '', '', '', '', '', '0', '2019-10-15 15:37:52', 'SongPeng', '2020-02-26 15:03:32', 'admin');
INSERT INTO `sp_sys_user` VALUES ('1184019107907227649', '超级管理员', 'admin', '9d7281eeaebded0b091340cfa658a7e8', '11', '', '13776337796', '44', '0', NULL, '55', '66', '77', '88', '99', '10', '11', '12', '13', '0', '2019-10-15 16:12:08', 'SongPeng', '2020-03-24 11:08:22', 'admin');

-- ----------------------------
-- Table structure for sp_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_user_role`;
CREATE TABLE `sp_sys_user_role`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户id',
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色id',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户对应的角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_sys_user_role
-- ----------------------------
INSERT INTO `sp_sys_user_role` VALUES ('1242287110472966146', '1184019107907227649', '1185025876737396738', '2020-03-24 11:08:22', 'admin', '2020-03-24 11:08:22', 'admin');

-- ----------------------------
-- Table structure for sp_table_manager
-- ----------------------------
DROP TABLE IF EXISTS `sp_table_manager`;
CREATE TABLE `sp_table_manager`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '表名称',
  `table_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表描述',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  `is_deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '\"\"' COMMENT '授权(多个用逗号分隔，如：sys:menu:list,sys:menu:create)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index1`(`table_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '主数据通用管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_table_manager
-- ----------------------------
INSERT INTO `sp_table_manager` VALUES ('1237284254149844993', 'sp_factroy', '工厂主数据', '2020-03-10 15:48:48', 'admin', '2020-03-10 15:48:48', 'admin', '0', '\"\"');
INSERT INTO `sp_table_manager` VALUES ('1238646992247808001', 'sp_oper', '工序主数据', '2020-03-14 10:03:51', 'admin', '2020-03-14 10:30:11', 'admin', '0', '\"\"');
INSERT INTO `sp_table_manager` VALUES ('1238649867422228482', 'sp_line', '线体主数据', '2020-03-14 10:15:16', 'admin', '2020-03-14 10:27:01', 'admin', '0', '\"\"');
INSERT INTO `sp_table_manager` VALUES ('1238653752496971777', 'sp_flow', '流程主数据', '2020-03-14 10:30:42', 'admin', '2020-03-14 10:30:42', 'admin', '0', '\"\"');
INSERT INTO `sp_table_manager` VALUES ('1238668511262871554', 'sp_work_shop', '车间主数据', '2020-03-14 11:29:21', 'admin', '2020-03-14 11:29:21', 'admin', '0', '\"\"');
INSERT INTO `sp_table_manager` VALUES ('1240147444588183554', 'sp_sys_dict', '字典表', '2020-03-18 13:26:06', 'admin', '2020-03-18 13:54:15', 'admin', '0', '\"\"');

-- ----------------------------
-- Table structure for sp_table_manager_item
-- ----------------------------
DROP TABLE IF EXISTS `sp_table_manager_item`;
CREATE TABLE `sp_table_manager_item`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `table_name_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '表名称id',
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段',
  `field_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段描述',
  `must_fill` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否必填',
  `sort_num` int(11) NOT NULL COMMENT '排序',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '主数据基础数据明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_table_manager_item
-- ----------------------------
INSERT INTO `sp_table_manager_item` VALUES ('1237284254204370946', '1237284254149844993', 'factory', '工厂编号', 'Y', 1, '2020-03-10 15:48:48', 'admin', '2020-03-10 15:48:48', 'admin');
INSERT INTO `sp_table_manager_item` VALUES ('1237284254212759554', '1237284254149844993', 'factory_desc', '工厂描述', 'Y', 2, '2020-03-10 15:48:48', 'admin', '2020-03-10 15:48:48', 'admin');
INSERT INTO `sp_table_manager_item` VALUES ('1238652822699466753', '1238649867422228482', 'line', '线体代号', 'Y', 1, '2020-03-14 10:27:01', 'admin', '2020-03-14 10:27:01', 'admin');
INSERT INTO `sp_table_manager_item` VALUES ('1238652822699466754', '1238649867422228482', 'line_desc', '线体描述', 'Y', 2, '2020-03-14 10:27:01', 'admin', '2020-03-14 10:27:01', 'admin');
INSERT INTO `sp_table_manager_item` VALUES ('1238652822699466755', '1238649867422228482', 'process_section', '流程工序段', 'Y', 3, '2020-03-14 10:27:01', 'admin', '2020-03-14 10:27:01', 'admin');
INSERT INTO `sp_table_manager_item` VALUES ('1238653621219450882', '1238646992247808001', 'oper', '工序代码', 'Y', 1, '2020-03-14 10:30:11', 'admin', '2020-03-14 10:30:11', 'admin');
INSERT INTO `sp_table_manager_item` VALUES ('1238653621227839489', '1238646992247808001', 'oper_desc', '工序描述', 'Y', 2, '2020-03-14 10:30:11', 'admin', '2020-03-14 10:30:11', 'admin');
INSERT INTO `sp_table_manager_item` VALUES ('1238653752530526209', '1238653752496971777', 'flow', '流程代号', 'Y', 1, '2020-03-14 10:30:42', 'admin', '2020-03-14 10:30:42', 'admin');
INSERT INTO `sp_table_manager_item` VALUES ('1238653752530526210', '1238653752496971777', 'flow_desc', '流程描述', 'Y', 2, '2020-03-14 10:30:42', 'admin', '2020-03-14 10:30:42', 'admin');
INSERT INTO `sp_table_manager_item` VALUES ('1238668511338369025', '1238668511262871554', 'work_shop', '车间代码', 'Y', 1, '2020-03-14 11:29:21', 'admin', '2020-03-14 11:29:21', 'admin');
INSERT INTO `sp_table_manager_item` VALUES ('1238668511342563329', '1238668511262871554', 'work_shop_desc', '车间描述', 'Y', 2, '2020-03-14 11:29:21', 'admin', '2020-03-14 11:29:21', 'admin');
INSERT INTO `sp_table_manager_item` VALUES ('1240154526934728705', '1240147444588183554', 'name', '名称', 'Y', 1, '2020-03-18 13:54:15', 'admin', '2020-03-18 13:54:15', 'admin');
INSERT INTO `sp_table_manager_item` VALUES ('1240154526943117314', '1240147444588183554', 'value', '实际值', 'Y', 2, '2020-03-18 13:54:15', 'admin', '2020-03-18 13:54:15', 'admin');
INSERT INTO `sp_table_manager_item` VALUES ('1240154526951505922', '1240147444588183554', 'type', '类型', 'Y', 3, '2020-03-18 13:54:15', 'admin', '2020-03-18 13:54:15', 'admin');
INSERT INTO `sp_table_manager_item` VALUES ('1240154526951505923', '1240147444588183554', 'descr', '类型描述', 'Y', 4, '2020-03-18 13:54:15', 'admin', '2020-03-18 13:54:15', 'admin');
INSERT INTO `sp_table_manager_item` VALUES ('1240154526951505924', '1240147444588183554', 'sort_num', '序号', 'Y', 5, '2020-03-18 13:54:15', 'admin', '2020-03-18 13:54:15', 'admin');

-- ----------------------------
-- Table structure for sp_work_shop
-- ----------------------------
DROP TABLE IF EXISTS `sp_work_shop`;
CREATE TABLE `sp_work_shop`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `work_shop` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `work_shop_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工作车间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_work_shop
-- ----------------------------
INSERT INTO `sp_work_shop` VALUES ('1336875254022176', 'DC-车间1', '电池组装车间', '2020-03-14 11:29:57', 'admin', '2020-03-18 10:52:39', 'admin');
INSERT INTO `sp_work_shop` VALUES ('1336875591663648', 'DC-JS01', '加酸车间', '2020-03-14 11:32:38', 'admin', '2020-03-14 11:32:38', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
