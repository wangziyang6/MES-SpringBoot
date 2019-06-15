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

 Date: 15/06/2019 17:12:16
*/


-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role";
CREATE TABLE "public"."sys_role" (
  "id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(16) COLLATE "pg_catalog"."default" NOT NULL,
  "status" char(2) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" varchar(64) COLLATE "pg_catalog"."default",
  "created" timestamptz(0),
  "last_upd_by" varchar(64) COLLATE "pg_catalog"."default",
  "last_upd" timestamptz(0)
)
;
COMMENT ON COLUMN "public"."sys_role"."id" IS '角色id';
COMMENT ON COLUMN "public"."sys_role"."name" IS '角色名称';
COMMENT ON COLUMN "public"."sys_role"."code" IS '角色编码';
COMMENT ON COLUMN "public"."sys_role"."status" IS '状态(0:无效; 1:有效)';
COMMENT ON COLUMN "public"."sys_role"."description" IS '角色描述';
COMMENT ON COLUMN "public"."sys_role"."created_by" IS '创建人';
COMMENT ON COLUMN "public"."sys_role"."created" IS '创建时间';
COMMENT ON COLUMN "public"."sys_role"."last_upd_by" IS '最后更新人';
COMMENT ON COLUMN "public"."sys_role"."last_upd" IS '最后更新时间';

-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE "public"."sys_role" ADD CONSTRAINT "sys_role_pkey" PRIMARY KEY ("id");
