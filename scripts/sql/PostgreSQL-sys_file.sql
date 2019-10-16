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

 Date: 15/06/2019 16:58:10
*/


-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_file";
CREATE TABLE "public"."sys_file" (
  "id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "type" char(2) COLLATE "pg_catalog"."default",
  "url" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "created" timestamptz(0),
  "last_upd_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "last_upd" timestamptz(0)
)
;
COMMENT ON COLUMN "public"."sys_file"."id" IS 'id';
COMMENT ON COLUMN "public"."sys_file"."type" IS '文件类型';
COMMENT ON COLUMN "public"."sys_file"."url" IS 'URL地址';
COMMENT ON COLUMN "public"."sys_file"."created_by" IS '创建人';
COMMENT ON COLUMN "public"."sys_file"."created" IS '创建时间';
COMMENT ON COLUMN "public"."sys_file"."last_upd_by" IS '最后更新人';
COMMENT ON COLUMN "public"."sys_file"."last_upd" IS '最后更新时间';

-- ----------------------------
-- Primary Key structure for table sys_file
-- ----------------------------
ALTER TABLE "public"."sys_file" ADD CONSTRAINT "sys_file_pkey" PRIMARY KEY ("id");
