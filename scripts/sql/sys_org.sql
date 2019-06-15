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

 Date: 15/06/2019 16:58:42
*/


-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_org";
CREATE TABLE "public"."sys_org" (
  "id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "parent_id" varchar(64) COLLATE "pg_catalog"."default",
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(16) COLLATE "pg_catalog"."default" NOT NULL,
  "area_id" varchar(64) COLLATE "pg_catalog"."default",
  "type" char(2) COLLATE "pg_catalog"."default" NOT NULL,
  "grade" char(2) COLLATE "pg_catalog"."default" NOT NULL,
  "longitude" varchar(64) COLLATE "pg_catalog"."default",
  "latitude" varchar(64) COLLATE "pg_catalog"."default",
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "zip_code" varchar(32) COLLATE "pg_catalog"."default",
  "created_by" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "created" timestamptz(0) NOT NULL,
  "last_upd_by" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "last_upd" timestamptz(0) NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_org"."id" IS '部门id';
COMMENT ON COLUMN "public"."sys_org"."parent_id" IS '父级id';
COMMENT ON COLUMN "public"."sys_org"."name" IS '角色名称';
COMMENT ON COLUMN "public"."sys_org"."code" IS '角色编码';
COMMENT ON COLUMN "public"."sys_org"."area_id" IS '归属区域id';
COMMENT ON COLUMN "public"."sys_org"."type" IS '机构类型：公司；部门；小组；其他';
COMMENT ON COLUMN "public"."sys_org"."grade" IS '机构等级：省级；地级；县级；乡级；';
COMMENT ON COLUMN "public"."sys_org"."longitude" IS '经度';
COMMENT ON COLUMN "public"."sys_org"."latitude" IS '纬度';
COMMENT ON COLUMN "public"."sys_org"."address" IS '地址';
COMMENT ON COLUMN "public"."sys_org"."zip_code" IS '邮政编码';
COMMENT ON COLUMN "public"."sys_org"."created_by" IS '创建人';
COMMENT ON COLUMN "public"."sys_org"."created" IS '创建时间';
COMMENT ON COLUMN "public"."sys_org"."last_upd_by" IS '最后更新人';
COMMENT ON COLUMN "public"."sys_org"."last_upd" IS '最后更新时间';

-- ----------------------------
-- Primary Key structure for table sys_org
-- ----------------------------
ALTER TABLE "public"."sys_org" ADD CONSTRAINT "sys_dept_pkey" PRIMARY KEY ("id");
