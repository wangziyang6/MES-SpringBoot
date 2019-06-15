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

 Date: 15/06/2019 16:58:34
*/


-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_menu";
CREATE TABLE "public"."sys_menu" (
  "id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "url" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "parent_id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "grade" char(2) COLLATE "pg_catalog"."default" NOT NULL,
  "sort_num" int4 NOT NULL,
  "type" char(2) COLLATE "pg_catalog"."default" NOT NULL,
  "permission" varchar(255) COLLATE "pg_catalog"."default",
  "icon" varchar(255) COLLATE "pg_catalog"."default",
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "created" timestamptz(0),
  "last_upd_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "last_upd" timestamptz(0)
)
;
COMMENT ON COLUMN "public"."sys_menu"."id" IS '菜单id';
COMMENT ON COLUMN "public"."sys_menu"."name" IS '菜单名称';
COMMENT ON COLUMN "public"."sys_menu"."url" IS '菜单URL';
COMMENT ON COLUMN "public"."sys_menu"."parent_id" IS '父菜单ID，一级菜单设为0';
COMMENT ON COLUMN "public"."sys_menu"."grade" IS '层级：1级、2级、3级......';
COMMENT ON COLUMN "public"."sys_menu"."sort_num" IS '排序';
COMMENT ON COLUMN "public"."sys_menu"."type" IS '类型：0 目录；1 菜单；2 按钮';
COMMENT ON COLUMN "public"."sys_menu"."permission" IS '授权(多个用逗号分隔，如：sys:menu:list,sys:menu:create)';
COMMENT ON COLUMN "public"."sys_menu"."icon" IS '菜单图标';
COMMENT ON COLUMN "public"."sys_menu"."description" IS '描述';
COMMENT ON COLUMN "public"."sys_menu"."created_by" IS '创建人';
COMMENT ON COLUMN "public"."sys_menu"."created" IS '创建时间';
COMMENT ON COLUMN "public"."sys_menu"."last_upd_by" IS '最后更新人';
COMMENT ON COLUMN "public"."sys_menu"."last_upd" IS '最后更新时间';

-- ----------------------------
-- Primary Key structure for table sys_menu
-- ----------------------------
ALTER TABLE "public"."sys_menu" ADD CONSTRAINT "sys_menu_pkey" PRIMARY KEY ("id");
