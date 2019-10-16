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

 Date: 15/06/2019 17:03:05
*/


-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_menu";
CREATE TABLE "public"."sys_role_menu" (
  "id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "role_id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "menu_id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "created_by" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "created" timestamptz(0) NOT NULL,
  "last_upd_by" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "last_upd" timestamptz(0) NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_role_menu"."id" IS '角色菜单id';
COMMENT ON COLUMN "public"."sys_role_menu"."role_id" IS '角色id';
COMMENT ON COLUMN "public"."sys_role_menu"."menu_id" IS '角色id';
COMMENT ON COLUMN "public"."sys_role_menu"."created_by" IS '创建人';
COMMENT ON COLUMN "public"."sys_role_menu"."created" IS '创建时间';
COMMENT ON COLUMN "public"."sys_role_menu"."last_upd_by" IS '最后更新人';
COMMENT ON COLUMN "public"."sys_role_menu"."last_upd" IS '最后更新时间';

-- ----------------------------
-- Primary Key structure for table sys_role_menu
-- ----------------------------
ALTER TABLE "public"."sys_role_menu" ADD CONSTRAINT "sys_role_menu_pkey" PRIMARY KEY ("id");
