/*
 Navicat Premium Data Transfer

 Source Server         : postgre-sp
 Source Server Type    : PostgreSQL
 Source Server Version : 110003
 Source Host           : localhost:5432
 Source Catalog        : sparchetype
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 110003
 File Encoding         : 65001

 Date: 15/06/2019 16:57:59
*/


-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict";
CREATE TABLE "public"."sys_dict" (
  "id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "value" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "type" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "sort_num" int4,
  "parent_id" varchar(64) COLLATE "pg_catalog"."default",
  "status" char(2) COLLATE "pg_catalog"."default",
  "created_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "created" timestamptz(0),
  "last_upd_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "last_upd" timestamptz(0)
)
;
COMMENT ON COLUMN "public"."sys_dict"."id" IS 'id';
COMMENT ON COLUMN "public"."sys_dict"."name" IS '标签名';
COMMENT ON COLUMN "public"."sys_dict"."value" IS '数据值';
COMMENT ON COLUMN "public"."sys_dict"."type" IS '类型';
COMMENT ON COLUMN "public"."sys_dict"."description" IS '描述';
COMMENT ON COLUMN "public"."sys_dict"."sort_num" IS '排序（升序）';
COMMENT ON COLUMN "public"."sys_dict"."parent_id" IS '父级id';
COMMENT ON COLUMN "public"."sys_dict"."status" IS '状态：0 删除；1 正常';
COMMENT ON COLUMN "public"."sys_dict"."created_by" IS '创建人';
COMMENT ON COLUMN "public"."sys_dict"."created" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dict"."last_upd_by" IS '最后更新人';
COMMENT ON COLUMN "public"."sys_dict"."last_upd" IS '最后更新时间';

-- ----------------------------
-- Primary Key structure for table sys_dict
-- ----------------------------
ALTER TABLE "public"."sys_dict" ADD CONSTRAINT "sys_dict_pkey" PRIMARY KEY ("id");
