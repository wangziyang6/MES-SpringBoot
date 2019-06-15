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

 Date: 15/06/2019 17:03:33
*/


-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
  "id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "username" varchar(128) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "password" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "dept_id" varchar(64) COLLATE "pg_catalog"."default",
  "email" varchar(100) COLLATE "pg_catalog"."default",
  "mobile" varchar(32) COLLATE "pg_catalog"."default",
  "tel" varchar(32) COLLATE "pg_catalog"."default",
  "sex" char(2) COLLATE "pg_catalog"."default",
  "birthday" timestamptz(0),
  "pic_id" varchar(64) COLLATE "pg_catalog"."default",
  "id_card" varchar(32) COLLATE "pg_catalog"."default",
  "hobby" varchar(255) COLLATE "pg_catalog"."default",
  "province" varchar(255) COLLATE "pg_catalog"."default",
  "city" varchar(255) COLLATE "pg_catalog"."default",
  "district" varchar(255) COLLATE "pg_catalog"."default",
  "street" varchar(255) COLLATE "pg_catalog"."default",
  "street_number" varchar(255) COLLATE "pg_catalog"."default",
  "description" varchar(100) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "status" char(2) COLLATE "pg_catalog"."default" NOT NULL,
  "created_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "created" timestamptz(0),
  "last_upd_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "last_upd" timestamptz(0)
)
;
COMMENT ON COLUMN "public"."sys_user"."id" IS 'id';
COMMENT ON COLUMN "public"."sys_user"."name" IS '姓名';
COMMENT ON COLUMN "public"."sys_user"."username" IS '用户名';
COMMENT ON COLUMN "public"."sys_user"."password" IS '密码';
COMMENT ON COLUMN "public"."sys_user"."dept_id" IS '部门id';
COMMENT ON COLUMN "public"."sys_user"."email" IS '邮箱';
COMMENT ON COLUMN "public"."sys_user"."mobile" IS '手机号';
COMMENT ON COLUMN "public"."sys_user"."tel" IS '固定电话';
COMMENT ON COLUMN "public"."sys_user"."sex" IS '0: 女；1: 男；2: 其他';
COMMENT ON COLUMN "public"."sys_user"."birthday" IS '出生年月日';
COMMENT ON COLUMN "public"."sys_user"."pic_id" IS '图片id，对应sys_file表中的id';
COMMENT ON COLUMN "public"."sys_user"."id_card" IS '身份证';
COMMENT ON COLUMN "public"."sys_user"."hobby" IS '爱好';
COMMENT ON COLUMN "public"."sys_user"."province" IS '省份';
COMMENT ON COLUMN "public"."sys_user"."city" IS '城市';
COMMENT ON COLUMN "public"."sys_user"."district" IS '区县';
COMMENT ON COLUMN "public"."sys_user"."street" IS '街道';
COMMENT ON COLUMN "public"."sys_user"."street_number" IS '门牌号';
COMMENT ON COLUMN "public"."sys_user"."description" IS '角色描述';
COMMENT ON COLUMN "public"."sys_user"."status" IS '状态：0 删除；1 正常；2 禁用';
COMMENT ON COLUMN "public"."sys_user"."created_by" IS '创建人';
COMMENT ON COLUMN "public"."sys_user"."created" IS '创建时间';
COMMENT ON COLUMN "public"."sys_user"."last_upd_by" IS '最后更新人';
COMMENT ON COLUMN "public"."sys_user"."last_upd" IS '最后更新时间';

-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "test_by_sp_pkey" PRIMARY KEY ("id");
