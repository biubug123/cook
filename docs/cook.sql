/*
 Navicat Premium Data Transfer

 Source Server         : TziPg
 Source Server Type    : PostgreSQL
 Source Server Version : 100400
 Source Host           : 139.199.86.11
 Source Database       : cook
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 100400
 File Encoding         : utf-8

 Date: 05/18/2018 21:37:53 PM
*/

-- ----------------------------
--  Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS "public"."service";
CREATE TABLE "public"."service" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"name" varchar(50) COLLATE "default",
	"description" varchar(50) COLLATE "default",
	"icon_name" varchar(50) COLLATE "default",
	"money" money
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."service" OWNER TO "postgres";

-- ----------------------------
--  Table structure for active
-- ----------------------------
DROP TABLE IF EXISTS "public"."active";
CREATE TABLE "public"."active" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"user_id" varchar(128) COLLATE "default",
	"city_id" varchar(128) COLLATE "default",
	"day_count" varchar(128) COLLATE "default",
	"month_count" varchar(128) COLLATE "default",
	"last_date" int8
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."active" OWNER TO "postgres";

-- ----------------------------
--  Table structure for food_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."food_type";
CREATE TABLE "public"."food_type" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"name" varchar(50) COLLATE "default",
	"icon_name" varchar(50) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."food_type" OWNER TO "postgres";

-- ----------------------------
--  Records of food_type
-- ----------------------------
BEGIN;
INSERT INTO "public"."food_type" VALUES ('32fc3520-511f-4246-bb09-6772e47b9d31', '粤菜', '20180515205401');
INSERT INTO "public"."food_type" VALUES ('f0ea5ce0-4ab7-454f-a5ac-57ca0a43b664', '川菜', '20180518102456');
INSERT INTO "public"."food_type" VALUES ('aaab39c1-3540-4009-933e-6f4592597c02', '湘菜', '20180518111756');
INSERT INTO "public"."food_type" VALUES ('45abe7e2-2851-4bdd-9792-d1ac1a9f9434', '鲁菜', '20180518111911');
COMMIT;

-- ----------------------------
--  Table structure for count
-- ----------------------------
DROP TABLE IF EXISTS "public"."count";
CREATE TABLE "public"."count" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"proxy_count" int4,
	"hunt_count" int4,
	"refresh_count" int4,
	"user_id" varchar(128) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."count" OWNER TO "postgres";

-- ----------------------------
--  Table structure for user_browse
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_browse";
CREATE TABLE "public"."user_browse" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"browse_type" int2,
	"last_browse_date" int8,
	"user_id" varchar(128) COLLATE "default",
	"content_id" varchar(128) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."user_browse" OWNER TO "postgres";

COMMENT ON COLUMN "public"."user_browse"."browse_type" IS '0:招聘 1:求职 2:资讯';

-- ----------------------------
--  Table structure for work_experience
-- ----------------------------
DROP TABLE IF EXISTS "public"."work_experience";
CREATE TABLE "public"."work_experience" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"job_name" varchar(50) COLLATE "default",
	"company" varchar(50) COLLATE "default",
	"entry_date" int8,
	"dimission_date" int8,
	"job_content" text COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."work_experience" OWNER TO "postgres";

COMMENT ON COLUMN "public"."work_experience"."job_name" IS '职位名称';
COMMENT ON COLUMN "public"."work_experience"."company" IS '公司';
COMMENT ON COLUMN "public"."work_experience"."entry_date" IS '入职时间';
COMMENT ON COLUMN "public"."work_experience"."dimission_date" IS '离职时间';
COMMENT ON COLUMN "public"."work_experience"."job_content" IS '工作的内容';

-- ----------------------------
--  Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS "public"."job";
CREATE TABLE "public"."job" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"name" varchar(50) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."job" OWNER TO "postgres";

-- ----------------------------
--  Records of job
-- ----------------------------
BEGIN;
INSERT INTO "public"."job" VALUES ('0352e163-f066-43a1-892b-afa0c8e69cfa', '厨师长');
INSERT INTO "public"."job" VALUES ('4a7da461-f55b-47f7-beec-7f7f1f01a7df', '服务员');
INSERT INTO "public"."job" VALUES ('2e645e2f-0ea9-417e-8182-2b3663a94112', '总经理');
INSERT INTO "public"."job" VALUES ('6fd5c34e-127f-4f15-b5bf-4bea7c14602a', '收银员');
INSERT INTO "public"."job" VALUES ('14cd79d8-2148-49f1-b176-1ebc398c815d', '店长');
COMMIT;

-- ----------------------------
--  Table structure for advertise
-- ----------------------------
DROP TABLE IF EXISTS "public"."advertise";
CREATE TABLE "public"."advertise" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"name" varchar(128) COLLATE "default",
	"type" varchar(50) COLLATE "default",
	"url" varchar(128) COLLATE "default",
	"img_url" varchar(128) COLLATE "default",
	"date" int8,
	"city_id" varchar(128) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."advertise" OWNER TO "postgres";

-- ----------------------------
--  Table structure for rank
-- ----------------------------
DROP TABLE IF EXISTS "public"."rank";
CREATE TABLE "public"."rank" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"name" varchar(50) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."rank" OWNER TO "postgres";

-- ----------------------------
--  Table structure for proxy
-- ----------------------------
DROP TABLE IF EXISTS "public"."proxy";
CREATE TABLE "public"."proxy" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"name" varchar(128) COLLATE "default",
	"contact_way" varchar(50) COLLATE "default",
	"work_area" varchar(50) COLLATE "default",
	"address" varchar(255) COLLATE "default",
	"user_id" varchar(128) NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."proxy" OWNER TO "postgres";

COMMENT ON COLUMN "public"."proxy"."name" IS '代招人名称';
COMMENT ON COLUMN "public"."proxy"."contact_way" IS '联系方式';
COMMENT ON COLUMN "public"."proxy"."work_area" IS '工作地区 (广东省白云区)';
COMMENT ON COLUMN "public"."proxy"."address" IS '工作详细地点';

-- ----------------------------
--  Records of proxy
-- ----------------------------
BEGIN;
INSERT INTO "public"."proxy" VALUES ('442c9d86-b17e-4cb6-9ff8-2f9ab5f70ef9', '陈先生', '56357640364', '广东省广州市越秀区', '广东省广州市越秀区公元前3号街', '1d7a14f2-1aa9-4581-8b85-194036b77f3e');
INSERT INTO "public"."proxy" VALUES ('991c829e-0f66-4727-91cb-0b3765fc91e1', '陈先生', '56357640364', '广东省广州市越秀区', '广东省广州市越秀区公元前3号街', '1d7a14f2-1aa9-4581-8b85-194036b77f3e');
INSERT INTO "public"."proxy" VALUES ('2428289f-ee60-4494-bec3-b5aae24ab139', '张先生', '82593463034', '广东省广州市白云区', '广东省广州市越秀区公元前3号街', '1d7a14f2-1aa9-4581-8b85-194036b77f3e');
INSERT INTO "public"."proxy" VALUES ('85825765-5612-4c5c-a49c-ca353f52c9e4', '张先生', '82593463034', '广东省广州市白云区', '广东省广州市越秀区公元前3号街', '1d7a14f2-1aa9-4581-8b85-194036b77f3e');
INSERT INTO "public"."proxy" VALUES ('f569deb6-a464-4d34-a9c4-586c449eaa00', '王先生', '30568799245', '广东省广州市白云区', '广东省广州市越秀区公元前3号街', '1d7a14f2-1aa9-4581-8b85-194036b77f3e');
INSERT INTO "public"."proxy" VALUES ('e532e49a-f465-4a8f-b1c9-454e328e5d45', '李先生', '16486976240', '广东省广州市天河区', '广东省广州市越秀区公元前3号街', '1d7a14f2-1aa9-4581-8b85-194036b77f3e');
INSERT INTO "public"."proxy" VALUES ('4f1f4e35-2eef-46c2-a7b8-3a0a6266f016', '李先生', '03217648779', '广东省广州市天河区', '广东省广州市越秀区公元前3号街', '1d7a14f2-1aa9-4581-8b85-194036b77f3e');
INSERT INTO "public"."proxy" VALUES ('5c9dbcb6-d14d-42df-8364-9c5f6ad7125b', '芳先生', '74523583794', '广东省广州市天河区', '广东省广州市天河区公元前3号街', '1d7a14f2-1aa9-4581-8b85-194036b77f3e');
INSERT INTO "public"."proxy" VALUES ('03aca249-7847-41d8-8a9a-4e090a686da4', '芳先生', '74523583794', '广东省广州市天河区', '广东省广州市天河区3号街', '1d7a14f2-1aa9-4581-8b85-194036b77f3e');
COMMIT;

-- ----------------------------
--  Table structure for user_collect
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_collect";
CREATE TABLE "public"."user_collect" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"collect_type" int2,
	"collect_date" int8,
	"user_id" varchar(128) COLLATE "default",
	"content_id" varchar(128) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."user_collect" OWNER TO "postgres";

COMMENT ON COLUMN "public"."user_collect"."collect_type" IS '0:招聘的职位 1:求职的职位 2:咨询的收藏';
COMMENT ON COLUMN "public"."user_collect"."content_id" IS '招聘表Id或huntId';

-- ----------------------------
--  Records of user_collect
-- ----------------------------
BEGIN;
INSERT INTO "public"."user_collect" VALUES ('4dbcc063-9c39-484f-9c51-756e95d5cdf3', '0', '1526633797', '1d7a14f2-1aa9-4581-8b85-194036b77f3e', '9cf7aa81-81f2-4987-b497-78709a52c958');
INSERT INTO "public"."user_collect" VALUES ('eaa251bf-660a-4c68-a51e-dece2cb8ca95', '0', '1526633811', '1d7a14f2-1aa9-4581-8b85-194036b77f3e', '5a048509-06a8-4a34-b52a-756af661362c');
INSERT INTO "public"."user_collect" VALUES ('f126bbb2-b78c-4a6b-9213-7c568673951e', '0', '1526633824', '1d7a14f2-1aa9-4581-8b85-194036b77f3e', '7f83b6ed-6c15-44d1-91b7-323798a00744');
INSERT INTO "public"."user_collect" VALUES ('11ea196a-4eba-4955-9afe-e07bc81a4e4a', '0', '1526633862', '5c76cdb0-9422-4537-ac83-0ba709425bab', '5a048509-06a8-4a34-b52a-756af661362c');
COMMIT;

-- ----------------------------
--  Table structure for user_service
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_service";
CREATE TABLE "public"."user_service" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"money" money,
	"purchase_count" int4,
	"purchase_date" int8,
	"expire_date" int8,
	"user_id" varchar(128) COLLATE "default",
	"product_id" varchar(128) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."user_service" OWNER TO "postgres";

-- ----------------------------
--  Table structure for stick
-- ----------------------------
DROP TABLE IF EXISTS "public"."stick";
CREATE TABLE "public"."stick" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"type" int2,
	"begin_time" int8,
	"end_time" int8,
	"job_id" varchar(128) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."stick" OWNER TO "postgres";

-- ----------------------------
--  Table structure for recruit
-- ----------------------------
DROP TABLE IF EXISTS "public"."recruit";
CREATE TABLE "public"."recruit" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"salary" varchar(50) COLLATE "default",
	"recruit_people_num" int4,
	"recruit_type" int2,
	"description" text COLLATE "default",
	"publish_date" int8,
	"apply_people_num" int4,
	"browse_count" int4,
	"publisher_id" varchar(128) COLLATE "default",
	"food_type_id" varchar(128) COLLATE "default",
	"welfare_id_list" varchar(128) COLLATE "default",
	"job_id" varchar(128) COLLATE "default",
	"education" varchar(20) COLLATE "default",
	"experience_require" varchar(20) COLLATE "default",
	"age_require" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."recruit" OWNER TO "postgres";

COMMENT ON COLUMN "public"."recruit"."salary" IS '薪资区间';
COMMENT ON COLUMN "public"."recruit"."recruit_people_num" IS '招聘人数';
COMMENT ON COLUMN "public"."recruit"."recruit_type" IS '招聘类型 0:代招 1:企业招聘';
COMMENT ON COLUMN "public"."recruit"."publish_date" IS '发布日期';
COMMENT ON COLUMN "public"."recruit"."apply_people_num" IS '申请人数';
COMMENT ON COLUMN "public"."recruit"."browse_count" IS '浏览次数';
COMMENT ON COLUMN "public"."recruit"."publisher_id" IS '发布者id';
COMMENT ON COLUMN "public"."recruit"."food_type_id" IS '菜系id';
COMMENT ON COLUMN "public"."recruit"."welfare_id_list" IS '福利id集合';
COMMENT ON COLUMN "public"."recruit"."job_id" IS '职位id';
COMMENT ON COLUMN "public"."recruit"."education" IS '学历要求';
COMMENT ON COLUMN "public"."recruit"."experience_require" IS '要求的工作经验';
COMMENT ON COLUMN "public"."recruit"."age_require" IS 'd年龄要求';

-- ----------------------------
--  Records of recruit
-- ----------------------------
BEGIN;
INSERT INTO "public"."recruit" VALUES ('9cf7aa81-81f2-4987-b497-78709a52c958', '3000-4000', '2', '0', '搬砖递水', '1526631743', null, null, '442c9d86-b17e-4cb6-9ff8-2f9ab5f70ef9', '32fc3520-511f-4246-bb09-6772e47b9d31', 'a7ef2c02-c2ed-4d92-9a5c-b14703fa617d,78bfca72-0ccc-4ecb-a79f-34ddfffee7b3', '14cd79d8-2148-49f1-b176-1ebc398c815d', '不限', '三年工作经验', '28岁以上');
INSERT INTO "public"."recruit" VALUES ('6a10f97a-00ae-4cbd-9856-b7b80ab5c3f2', '3000-4000', '2', '0', '搬砖递水', '1526631743', null, null, '991c829e-0f66-4727-91cb-0b3765fc91e1', '32fc3520-511f-4246-bb09-6772e47b9d31', 'a7ef2c02-c2ed-4d92-9a5c-b14703fa617d', '0352e163-f066-43a1-892b-afa0c8e69cfa', '不限', '三年工作经验', '30岁以上');
INSERT INTO "public"."recruit" VALUES ('ed791412-9a38-4440-bad6-4f73c8b988b5', '3000-4000', '2', '0', '搬砖递水', '1526631915', null, null, '2428289f-ee60-4494-bec3-b5aae24ab139', '32fc3520-511f-4246-bb09-6772e47b9d31', 'a7ef2c02-c2ed-4d92-9a5c-b14703fa617d,78bfca72-0ccc-4ecb-a79f-34ddfffee7b3', '14cd79d8-2148-49f1-b176-1ebc398c815d', '高中', '一年工作经验', '20岁以上');
INSERT INTO "public"."recruit" VALUES ('e1c6370a-ab1f-41f2-8e60-01126d4b32fc', '3000-4000', '2', '0', '搬砖递水', '1526631915', null, null, '85825765-5612-4c5c-a49c-ca353f52c9e4', '32fc3520-511f-4246-bb09-6772e47b9d31', 'a7ef2c02-c2ed-4d92-9a5c-b14703fa617d,78bfca72-0ccc-4ecb-a79f-34ddfffee7b3,b535dc64-c353-4f93-88e0-530077f8b713', '0352e163-f066-43a1-892b-afa0c8e69cfa', '高中', '一年工作经验', '22岁以上');
INSERT INTO "public"."recruit" VALUES ('162ee877-4859-4077-93f0-515c82895ae5', '3000-4000', '2', '0', '搬砖递水', '1526631942', null, null, 'f569deb6-a464-4d34-a9c4-586c449eaa00', '32fc3520-511f-4246-bb09-6772e47b9d31', 'a7ef2c02-c2ed-4d92-9a5c-b14703fa617d,78bfca72-0ccc-4ecb-a79f-34ddfffee7b3', '14cd79d8-2148-49f1-b176-1ebc398c815d', '高中', '一年工作经验', '20岁以上');
INSERT INTO "public"."recruit" VALUES ('7f83b6ed-6c15-44d1-91b7-323798a00744', '3000-4000', '2', '0', '发呆', '1526632032', null, null, 'e532e49a-f465-4a8f-b1c9-454e328e5d45', 'f0ea5ce0-4ab7-454f-a5ac-57ca0a43b664', 'a7ef2c02-c2ed-4d92-9a5c-b14703fa617d,78bfca72-0ccc-4ecb-a79f-34ddfffee7b3', '14cd79d8-2148-49f1-b176-1ebc398c815d', '本科', '一年工作经验', '20岁以上');
INSERT INTO "public"."recruit" VALUES ('d77327ed-0d47-44b7-bfff-43cfc34c44e0', '3000-4000', '2', '0', '发呆', '1526632057', null, null, '4f1f4e35-2eef-46c2-a7b8-3a0a6266f016', 'aaab39c1-3540-4009-933e-6f4592597c02', 'a7ef2c02-c2ed-4d92-9a5c-b14703fa617d,78bfca72-0ccc-4ecb-a79f-34ddfffee7b3', '14cd79d8-2148-49f1-b176-1ebc398c815d', '本科', '一年工作经验', '20岁以上');
INSERT INTO "public"."recruit" VALUES ('56324194-c04a-4c8f-bcc4-1b581468e564', '3000-4000', '2', '0', '发呆', '1526632116', null, null, '5c9dbcb6-d14d-42df-8364-9c5f6ad7125b', 'aaab39c1-3540-4009-933e-6f4592597c02', 'a7ef2c02-c2ed-4d92-9a5c-b14703fa617d', '14cd79d8-2148-49f1-b176-1ebc398c815d', '本科', '一年工作经验', '20岁以上');
INSERT INTO "public"."recruit" VALUES ('c47025cb-307f-47f5-a6ad-bff4cbc2b59f', '3000-4000', '2', '0', '发呆', '1526632116', null, null, '03aca249-7847-41d8-8a9a-4e090a686da4', '45abe7e2-2851-4bdd-9792-d1ac1a9f9434', 'a7ef2c02-c2ed-4d92-9a5c-b14703fa617d,78bfca72-0ccc-4ecb-a79f-34ddfffee7b3', '14cd79d8-2148-49f1-b176-1ebc398c815d', '本科', '一年工作经验', '20岁以上');
INSERT INTO "public"."recruit" VALUES ('5a048509-06a8-4a34-b52a-756af661362c', '6000-7000', '1', '1', '收银', '1526632432', null, null, 'd24a9a4d-f65b-497d-b4ad-97f40bd06960', '32fc3520-511f-4246-bb09-6772e47b9d31', 'b535dc64-c353-4f93-88e0-530077f8b713,a7ef2c02-c2ed-4d92-9a5c-b14703fa617d', '6fd5c34e-127f-4f15-b5bf-4bea7c14602a', '大学', '10年', '20岁以上');
INSERT INTO "public"."recruit" VALUES ('89fa2aaf-7975-4747-9d79-2baab931d609', '6000-7000', '1', '1', '店长', '1526632478', null, null, 'd24a9a4d-f65b-497d-b4ad-97f40bd06960', '32fc3520-511f-4246-bb09-6772e47b9d31', 'b535dc64-c353-4f93-88e0-530077f8b713,a7ef2c02-c2ed-4d92-9a5c-b14703fa617d', '14cd79d8-2148-49f1-b176-1ebc398c815d', '大学', '10年', '20岁以上');
INSERT INTO "public"."recruit" VALUES ('7fbd2adf-b0d4-4979-b076-5fc8a2fd7c82', '6000-7000', '3', '1', '二店长', '1526632527', null, null, '53b3bbba-b9e2-41d3-b2ee-0b29ce764b18', '32fc3520-511f-4246-bb09-6772e47b9d31', 'b535dc64-c353-4f93-88e0-530077f8b713,a7ef2c02-c2ed-4d92-9a5c-b14703fa617d', '14cd79d8-2148-49f1-b176-1ebc398c815d', '大学', '10年', '20岁以上');
INSERT INTO "public"."recruit" VALUES ('660437f9-dba9-46c7-a1b0-022c1d27a279', '6000-7000', '3', '1', '二店长', '1526632559', null, null, '53b3bbba-b9e2-41d3-b2ee-0b29ce764b18', 'aaab39c1-3540-4009-933e-6f4592597c02', 'b535dc64-c353-4f93-88e0-530077f8b713,a7ef2c02-c2ed-4d92-9a5c-b14703fa617d', '14cd79d8-2148-49f1-b176-1ebc398c815d', '大学', '10年', '10岁以上');
COMMIT;

-- ----------------------------
--  Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS "public"."resume";
CREATE TABLE "public"."resume" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"work_year" int2,
	"work_experience_id" varchar(128) COLLATE "default",
	"education" varchar(50) COLLATE "default",
	"user_id" varchar(128) COLLATE "default",
	"title" varchar(128) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."resume" OWNER TO "postgres";

COMMENT ON COLUMN "public"."resume"."work_year" IS '工作年份';
COMMENT ON COLUMN "public"."resume"."work_experience_id" IS '工作经验Id';
COMMENT ON COLUMN "public"."resume"."education" IS '学历教育';
COMMENT ON COLUMN "public"."resume"."title" IS '简历标题';

-- ----------------------------
--  Table structure for comment_user_admire
-- ----------------------------
DROP TABLE IF EXISTS "public"."comment_user_admire";
CREATE TABLE "public"."comment_user_admire" (
	"id" varchar(128) COLLATE "default",
	"comment_id" varchar(128) COLLATE "default",
	"user_id" varchar(128) COLLATE "default",
	"admire_date" int8
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."comment_user_admire" OWNER TO "postgres";

-- ----------------------------
--  Table structure for consult_user_admire
-- ----------------------------
DROP TABLE IF EXISTS "public"."consult_user_admire";
CREATE TABLE "public"."consult_user_admire" (
	"id" varchar(128) COLLATE "default",
	"consult_id" varchar(128) COLLATE "default",
	"user_id" varchar(128) COLLATE "default",
	"admire_date" int8
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."consult_user_admire" OWNER TO "postgres";

-- ----------------------------
--  Table structure for consult_comment
-- ----------------------------
DROP TABLE IF EXISTS "public"."consult_comment";
CREATE TABLE "public"."consult_comment" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"content" varchar(255) COLLATE "default",
	"admire_count" int4,
	"comment_user_id" varchar(128) COLLATE "default",
	"consult_id" varchar(128) COLLATE "default",
	"comment_date" int8
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."consult_comment" OWNER TO "postgres";

COMMENT ON COLUMN "public"."consult_comment"."content" IS '评论内容';
COMMENT ON COLUMN "public"."consult_comment"."admire_count" IS '点赞次数';
COMMENT ON COLUMN "public"."consult_comment"."comment_date" IS '评论的时间';

-- ----------------------------
--  Table structure for user_recruit_apply
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_recruit_apply";
CREATE TABLE "public"."user_recruit_apply" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"apply_date" int8,
	"user_id" varchar(128) COLLATE "default",
	"recruit_id" varchar(128) COLLATE "default",
	"is_checked" int2,
	"recruit_type" int2,
	"publisher_id" varchar(128) COLLATE "default",
	"publisher_name" varchar(50) COLLATE "default",
	"food_type_name" varchar(20) COLLATE "default",
	"job_name" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."user_recruit_apply" OWNER TO "postgres";

COMMENT ON COLUMN "public"."user_recruit_apply"."is_checked" IS '公司是否已接受';
COMMENT ON COLUMN "public"."user_recruit_apply"."recruit_type" IS '招聘方式';
COMMENT ON COLUMN "public"."user_recruit_apply"."job_name" IS '投递的岗位名称';

-- ----------------------------
--  Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"account_num" varchar(50) COLLATE "default",
	"password" varchar(50) COLLATE "default",
	"phone" varchar(30) COLLATE "default",
	"enroll_date" int8,
	"last_login_date" int8
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."sys_user" OWNER TO "postgres";

COMMENT ON COLUMN "public"."sys_user"."account_num" IS '账号';

-- ----------------------------
--  Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_user" VALUES ('1d7a14f2-1aa9-4581-8b85-194036b77f3e', '21139728497', 'KwGiRWYN3x1', '12186250159', '1526611626', '1526611626');
INSERT INTO "public"."sys_user" VALUES ('5c76cdb0-9422-4537-ac83-0ba709425bab', null, 'QGbWGmG23vG', '40183783991', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('3cb1a0da-2581-41d0-98cb-f34d45e90148', '36132853061', 'iEqiFiIx9Te', '56915963191', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('aacf3077-b9e6-4f57-bfda-6dbbfe454e63', null, 'JxhN74xqTVs', '23022804053', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('e1be91bd-1510-4b3a-aad7-4632e6dac3ae', '59380184316', '03x33qbDZP1', '04151996589', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('f9ee4c82-bb56-4cdf-b357-bc499281612c', null, 'cvmYMQ917qf', '14123007756', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('92543369-1d63-4ea1-be6f-3ffc9c0eeba4', '14067962008', 'hkmoOPMe4C3', '42684496297', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('7c5cb37a-b4c1-4f8f-a60e-bb043fc4d723', null, 'UDzxctfDgGL', '06759334837', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('8e8d8711-a4b0-4e36-90c2-caff828ef857', '90528511934', '0DGbXRmBGrK', '74237231419', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('01704c33-85b9-4d43-a108-6fd27daaa932', null, 'PSkQYZwlZIy', '04844661871', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('1d551627-b9e1-4722-a36c-7f358a247079', '71234772203', 'akWYIazNyBQ', '67742699896', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('f8d0b836-0cb0-4f5d-830e-5e1296a8d177', null, '4dKiuf1gr2P', '21039663014', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('e64437e7-cbd1-4190-986e-54b5becdbae0', '57213235164', 'VMyQCTHoHl4', '13210002794', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('5819e76e-757b-439e-a73c-a69a6524b4d5', null, 'noSk1l40uwc', '50320469279', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('f7c95856-6cd0-4559-a5fd-6b7b1ad511a8', '25845735357', 'JEQ8ra4DjxB', '26736757294', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('6b443a4e-9937-4cfc-af16-387807a616d3', null, 'FLhVZ37t0BR', '23152149056', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('06c08e5d-92ad-42ef-bde3-93e169771bc5', '25925054445', 'pTl8emt8Wcs', '70097790517', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('9d2bc2ad-bf1b-4737-bc9e-4049f9782899', null, 'tFjMVWrylW6', '38399452261', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('219d4034-f1ef-4f27-a868-409a081f3288', '43124999755', 'fBZCPGjv9l6', '89493704583', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('1eea14ab-c52d-46ab-b1d0-b8cd1da36b0d', null, '1TBW5XXskLu', '21211898847', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('5033e2c7-d3ad-4634-9a0f-77b58c6e9f2c', '21998146864', 'oKbw6H50Joa', '16513941040', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('b4b595da-97d1-4185-b186-fb23a732b33b', null, 'H8lG3lkyWmh', '33694247250', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('029d744e-8037-4d90-ba24-d0c81afbc427', '73196776948', 'jU5GFuagp4u', '81506766559', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('01146da4-20e7-4e11-b06b-f902a50f74e6', null, 'Z4hW8RiOqQh', '27332547399', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('28ca196a-73de-4d2d-9078-44a5d41595f4', '02873133704', 'mX8O0WCfVR3', '67201012003', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('a6b4effb-6c66-42d1-830e-70e3ed54a810', null, 'b6GmzVeokuo', '74702535582', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('86cd2fb9-9ab0-4f2b-89ef-ed6aa0ef8c8a', '04516904259', 'wQqKxzZ7ySv', '13478626907', '1526611627', '1526611627');
INSERT INTO "public"."sys_user" VALUES ('94f60963-413a-4e23-bd7a-41218e71663b', null, 'AVZl0S9AqbL', '48592965563', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('479caabb-128a-41bd-a769-32bb231f62fe', '72501743875', 'vr8ND9Xh6YG', '98962099227', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('aab5c253-d6e3-4078-99d3-503e3e88e592', null, 'cFQ87Bp2fmW', '22264683642', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('9987a6ad-af9e-4e67-87ff-bb6671c619f0', '29201443365', '01FfMDvEAeF', '71038590080', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('4f1b3653-4b90-44de-bd76-d6d4c7b534ac', null, 'KJsvP0nAei7', '16586040485', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('f7a21139-3b3a-4ac6-8c09-d5513f4dd42c', '31434617527', 'EBnsjbeF1Zd', '23933285846', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('34c4e670-3944-423c-935e-172fc5600713', null, 'n6xDdsR3lNN', '75950057426', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('3fc27b1a-c23e-44c1-a5aa-b7cf786d6f68', '81619347840', 'bG7KJlgyfdl', '30081466786', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('8d103a5a-8202-4741-8760-be96858ddc8a', null, 'hwsppDWMHZQ', '96343913707', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('0c8b6649-738c-4023-b057-f3651ae2fb8d', '72571783765', 'dIiuyol65Fq', '35650021227', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('e3039e7f-f95d-49db-a770-e504bfba0b4a', null, 's0ULKiC6E8K', '10936392762', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('27afbcf2-5982-4c6a-8ae8-33005cd86b9f', '92664892800', 'if9mrIYxtjC', '40545364088', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('b7070d09-0452-47e4-ae0f-b6a7e9b407c4', null, 'myRm1Vurzk1', '24325073147', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('535996b9-4180-4133-b9be-4357e623bad9', '55752718795', 'o1gTQFH4tEW', '33238033231', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('c824662d-1c06-418f-8f6a-cf37f6fe4099', null, 'iyMFKWpg5Vw', '25393742280', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('2aed958c-11b1-4ff2-898c-42c1ef4e6c5f', '61754542315', 'aXqArI13Dil', '88537108983', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('9dcc62e8-9573-496b-ae95-4c9ec47e7e04', null, 'yIv1thEBOgZ', '15786740787', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('00fc2cff-9e23-4f1c-bf9c-eeaa25e24ed8', '71289883683', 'iGv1bAEYjvF', '90225051902', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('6f4aa21d-3be3-4223-9139-599775a5d117', null, '1qvRFN3s2T3', '73726082115', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('b9a04921-3357-46ee-b89a-6a22b78567e0', '15108323864', 'SQb2Ypxx9le', '63053754252', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('000c0f2b-5c6e-4c1b-ac05-2e49fcb1cdbc', null, 'SztwHKuwdgb', '17995780195', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('3e8cec22-91df-437e-9af0-d5c77b263a44', '91298882324', 'q7m34qlY7pc', '32663820861', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('f9685eea-167d-4dd7-9b7d-1596b1148ca4', null, 'ozKgFuF5LXQ', '93535671810', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('bf149c2f-d103-4d4f-9393-521f2c3761fb', '79606576483', 'VMiM91vICco', '57483739270', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('dce7b6f8-62c9-481b-a89c-1914361bfd45', null, 'VCkDGiStg0h', '68646940101', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('bb1b31ac-4cb2-40ae-ac74-6707b14bd348', '96262966724', 'M4DajVMFIpQ', '09074673180', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('cdbea5a2-3e65-4afe-a742-7a6ad5be8669', null, 'nLvftupMavW', '86089176274', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('d080da54-7ab9-47a7-ba39-c2e612441a19', '04698646857', 'jAnJ5fsLHcR', '85846054127', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('e282998a-294e-41fa-bc67-b47ac6754d82', null, '1jq3sFfaFEH', '81852079408', '1526611628', '1526611628');
INSERT INTO "public"."sys_user" VALUES ('2518f95b-f370-411e-b95c-a01a05eb70fc', '66847243905', 'MVorcNX4mll', '17324867363', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('1eb726f5-dcbe-42ed-b7d9-518d5965138a', null, '5z0j2DhAhU6', '20816666788', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('46eca236-0071-48e7-b046-34056817506b', '94033645748', 'w4S8M7YdlCe', '09545553181', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('4aa41863-86c9-4930-936d-7921b94e060d', null, 'ExNuJNNsA86', '46659165978', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('55482150-75b7-4366-8a48-b59e788c7aa4', '12712317703', 'eHSxl97ELo3', '17253261257', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('b1d8c402-46b7-41b6-aaba-69d3269db2fd', null, 'jwlNBxv71Va', '05713709606', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('db1e3e31-438a-4e16-b613-65bef8c43fce', '16530650122', 'xTnVefzAaIW', '23804669193', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('fa28c28f-3177-4783-b465-c5f8303449c2', null, '2bxOflXfsFg', '55669374058', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('6208f485-2702-4032-b984-d0dece0b6c31', '46045658066', 'jpoOigURBvc', '50400596418', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('4ac8acbc-3a71-4041-93e3-3f45c7ec12bc', null, 'VHWOfZF5SWs', '24480022866', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('cf9afeba-d154-4dec-8c93-c1edb0508c20', '37488498544', 'b73UdtPq6gS', '88606684546', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('6f6cffe1-f114-4049-b912-23f072de0b42', null, 'OkImw39HoHt', '02078134666', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('c5729401-da5f-4e53-85b4-2f13a7a9c108', '65138429195', 'pbvP20zypJ2', '83323597679', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('50434f6a-92b1-448e-b3f3-46d22c5ce46a', null, '3PASDKSxRn8', '63914444253', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('503a3a3c-88a1-47cd-a0cc-fb830e7cf939', '74380741708', 'NlGL2WagSzp', '86267191636', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('e353a2c5-7620-4ace-bac2-ddd84a7d7038', null, 'vlENC9Q6yPg', '01643221950', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('62bd5137-2fe0-4df9-80df-c58ef9ea5477', '46559115144', 'ZBVb8rk9TPY', '93097281344', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('e92635da-5813-46ab-acd1-8ceb822fae3c', null, 'F1gd4aNGOxO', '67096827148', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('b9c7b256-837d-4168-80d8-ba117af61347', '45869154926', 'efZxQswIRnr', '93965857730', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('0738dd84-0fd4-4643-bf55-cf3213fe3206', null, 'JOmtSkOzMXO', '25100007512', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('0cc784dd-3ae9-4861-98c1-3b94cda3fa37', '26174925398', 'fTbIgguDESp', '01784660091', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('6091ba45-e249-43ba-b0df-8319e07cca1b', null, '0Zpov5EVB8n', '61764402102', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('a5143ccc-80d9-4761-ad03-5a31b192a52a', '59716829632', 'RQHDCsPcfBs', '44605155643', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('fe88b49c-c44b-4ce4-8716-f34d5e0c57c1', null, 'fCg9d3eFwth', '11339473590', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('17d3ab44-08dc-472a-9ff1-1df707779089', '89680566326', 'OZIziNB7Ptq', '20891743054', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('e83152dd-3e2f-4025-845d-3343e1876cc1', null, 'kgYXhfEj6sU', '96316696658', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('32494f8a-bcdf-4bf3-91c9-f639033c8145', '67809001362', 'kWqeNTTbTsp', '72929487991', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('378572b7-8974-4fd5-a4fd-fc2bc2954099', null, 'u9UFqPXaeA4', '10826271332', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('d7c9414d-d4f4-4f8f-b76f-35f67f3d1251', '57987398345', 'ns91Vujh103', '10304814106', '1526611629', '1526611629');
INSERT INTO "public"."sys_user" VALUES ('1c5485fc-50bc-44cd-a2f2-ff265db75c4a', null, 'xP5q6p4IoUM', '83492749021', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('c2ed8bed-7aff-44a4-9cf3-944414219993', '23885480147', 'NeHeU10ckJG', '05469047921', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('66090ec1-10c7-45d1-bf8a-ed3a86b9cb9f', null, 'KmDZCZpx32R', '07878430337', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('8722b325-1fb7-4481-b957-11a5260c44cb', '89679081619', 'P3y0dAlrZ3D', '73568884008', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('81fde213-d29a-4eed-bbb9-9d1257112ef9', null, 'y7Fv8GsLNgv', '98594636666', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('e442d815-07fc-411d-8683-c22151718d5f', '11849312802', 'XwMWWHfH9Ji', '19019124793', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('b740ba4a-dbb6-4d30-ad7f-6e65876d7463', null, 'io0oLzaeJrQ', '99844211292', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('69536761-7373-4e7e-8846-e4d826e7cb25', '76427146904', 'JVYHxOICzkn', '07324162902', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('bcc4c3f9-17c5-4576-b3e0-061b12625fb8', null, 'jOzg2IgYDEH', '26883853445', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('f1ea3587-486f-477e-97b9-c5d0c84b13e2', '94441237056', 'luXD5IEs97d', '52749023778', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('b99fd1f1-d748-42b9-9470-6199a0b840a5', null, 'EH2KGR0nf2Q', '36978165441', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('e3b0c9d5-3ecb-43e5-9ccb-477fe63e7a53', '08064986003', 'lQUNp0VEBK0', '35388742782', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('70c5d134-dedb-4dab-8093-1a0de1c1610e', null, 'TwXlLdKVFig', '36843686889', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('84a9b1c4-0574-4d47-aa24-f57142b00cb0', '58542795081', 'ScJ0T6rITWF', '50536959507', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('e67b1306-dd04-441d-bcd8-3a5df30368cd', null, 'ukkayf6A5aL', '58375457785', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('0e2dbff3-7981-4684-a195-ae6a7cfaa20b', '47812780010', 'zE9inQ9EcWj', '32302609963', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('cf983cda-03fa-4edf-a6bb-a7c3638b9943', null, 'KXBe8UhLA7B', '48151694798', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('ebd7c7d0-334c-4217-8950-5f8f1988d09b', '47971711516', 'XMkrJhWH5AB', '80274834682', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('0f1eabb2-5532-448a-a736-e971b03452b7', null, 'nxqZEf6HdEv', '70925020134', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('a9448684-5d4d-4dfc-99f0-9ec083c8f506', '50037386663', 'v1HpfwwMiDX', '02754716959', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('c1472813-1f3c-45e4-8308-4823e16a5508', null, 'u1LrCmiYIKh', '03979371342', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('40268d6c-ae3f-41e0-a6fb-6a30d03d9a66', '26717006101', 'UdrPnV4cASp', '01252063147', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('1eef4e60-a707-4953-b1c9-a0ed2310df4d', null, '3kSxpLrVnCN', '70243858049', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('66a0f54f-de6e-4f29-ae75-0f9815cbaf0f', '39967469354', 'dtP13ZopwhW', '47464029793', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('a8c1af5c-992e-4172-9ecd-5950c03cc8aa', null, 'iz1zBylGj1C', '97260941052', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('57bf73d0-4c6f-46d6-b792-6a7bc443e17f', '91567483171', 'fUGmSOAXU2T', '69583205622', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('efffa098-5454-458e-98d5-cae7cced65c3', null, 'XjauNMisQA6', '30949393387', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('b21d21cf-1baf-4e82-bb03-05b2de811a25', '77377217482', 'dL7k1rJI88n', '50836958941', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('550696b3-475b-4735-81f0-be5aa99d7a30', null, 'XplYESvgz9Y', '93130432558', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('b8e02ca2-ed08-4f4f-ba01-701f399aaf48', '63194877748', 'GwvZ910hcmy', '16888377273', '1526611630', '1526611630');
INSERT INTO "public"."sys_user" VALUES ('7e8eb827-ef80-413f-a423-7a6532cd7e7c', null, 'RcICxORUYI4', '68543949359', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('cb1af5cb-8ed6-4cf9-bbe7-be98534860e3', '33803188128', 'A6O9EpvL4YG', '56981981728', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('f36bcf6e-22b5-4953-9a4c-a8c15eb520f1', null, 'yaEOOM3OqoY', '91705597309', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('122da872-92af-4325-904c-53dabdde90d1', '17573820208', 'XJv75rFjaEB', '98618832840', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('448ba0c8-7f0d-4aa1-88b5-e96d391b00eb', null, '846vAt7gAvh', '08035174350', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('a598dc04-0360-450a-98c5-36dc3b7debfe', '53091117141', 'edHCTOZ5rYR', '67251651718', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('1810248f-9604-43c1-8cd8-3cc7140237eb', null, 'VNcZJOmPXMa', '99823276500', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('d4f5f78f-6cad-4c5e-8221-55a29859ae1d', '51360773612', 'fqybW6kRc7p', '82590516785', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('f17aa76e-bc20-4a48-978c-fa55ba0e594d', null, 'ehDB2WWEJl1', '23340089405', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('7b71a862-7f37-41dc-bcb2-f7c0ae23496e', '50495504966', 'n3P3VQRKX2w', '02948676587', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('241cf562-63f8-4ee1-ab6d-02f44b448f9e', null, 'op8raPYN7Y8', '69720633034', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('24c52ced-a222-434e-9ddc-7bbb039928d9', '09816170343', 'MRU5UCUfdah', '11551653657', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('2d00a4a2-6457-4ab8-9397-f54e3802a541', null, 'beimyIhYLne', '12285541450', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('fae8fef5-3efc-4029-9f68-8653cba18b97', '70872762898', '969U8ubJ2xs', '84962912614', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('7521ef3e-35e8-4976-a6dd-1eadc7f2b578', null, '0o3TVjcJKO7', '81234160608', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('50378eeb-ead3-4c17-9749-0df2e6f407ef', '37952224173', 'LoLZGjIEi9d', '82036539034', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('ec0b2666-c098-416c-9164-e9fd6263407b', null, '9ueIGH98aAL', '69853491987', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('f88ab6bd-2160-4a17-a718-865ed8e45446', '09165460899', 'WO5I1yXfQRw', '24712296230', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('b7bdf6cc-658f-4121-8b03-dc358ebda96b', null, 'Fy8TXRIMhAA', '66448440893', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('6f0f80ff-f121-44f5-9622-2299badd3f96', '93858256831', 'vhQEGqncJf0', '49736489797', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('f8006f56-33e2-4cde-90c5-16b5f51004f4', null, 'V1Gz70jAhrg', '71983932369', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('858b2410-0bf2-4f2f-ba4a-3520568ac252', '56918850936', 'KirsGW56aDb', '04686960867', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('3321154c-54fa-4c02-b093-04cf70648b4c', null, '5Iia0kCPE5T', '53229899325', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('aab83436-e565-4f09-bc1c-846c7c8459cc', '03009018413', 'hmBbDgb4N7L', '17005042780', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('cc5fb29c-938b-496c-b234-b4f9ebc9f299', null, 'AZro1qEib1E', '63791297547', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('9ff4a16d-0632-4c36-9537-c7fb229aedce', '21606183196', 'q72pMGI5YMt', '08594869438', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('1970f21e-c7f1-4e85-bc11-ca4f1d944aca', null, 'GpD3pt8KlP2', '81504875862', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('26db7424-247d-4290-90d4-2488b5b988ef', '69057406221', 'qrLIURu7ENO', '74044469255', '1526611631', '1526611631');
INSERT INTO "public"."sys_user" VALUES ('4a7e9ac9-9339-41e7-9b40-9ee891ddf6f2', null, 'dm8KzPz37Pm', '19573564655', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('88c0164b-945a-4043-8b4d-8e5629e17af3', '54123028388', 'DGvLEo8LjKz', '46209683440', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('41d48a74-ed87-4c61-8ba1-67bc3b090a09', null, 'cPC2WQIIZTK', '16101919888', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('cde857c8-ffd9-4dc3-b2f2-b461d4f15ee1', '17624294412', 'IHkvUVq61tO', '12061477501', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('33fa28b4-9d13-4d96-98d1-955c801fd69f', null, 'vvF32Z9fu49', '89045594839', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('87bb9b0a-983b-4791-b346-ee7826d18d0f', '43971075007', 'VUKHVHlzY52', '23106651157', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('037e5256-68a9-4423-80f0-e0dcd0729f46', null, 'TNlSRrWUGaw', '90011749506', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('4f7870c6-7a55-46fa-a561-a0fab3dda008', '15587435516', 'pmYDMmV2uca', '90733818464', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('9936b04f-1ac2-49e3-a30b-1b848fdab4d2', null, 'YX220PDhof3', '03587096541', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('7f10abd2-51d7-4970-b163-c4c9cbe73bcc', '76235294415', 'Sgt0NcjJORd', '25209591252', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('2364c42b-89ba-4cd3-a448-a1526ad26f70', null, 'EuQdZ62mgcn', '98981232411', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('5ecf6ecd-798b-43ed-a03f-59e6930a2b61', '09899381187', 'SLgPpRmRlcK', '54266823930', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('48229d74-4cea-4348-9c31-d8f0707de415', null, 'ldx9KnSGt7i', '06578888250', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('01a2b632-44da-4723-a396-4137a8b0d77a', '71283927512', 'NIc2wyZMdga', '31876204680', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('21afb588-67b1-49da-b038-67440821caa4', null, 'omYGIk6vpcy', '47914157894', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('51f8b718-d2fb-459c-9de6-feface763189', '68513372887', 'y6nESzDUozF', '09380028044', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('d32fc0cc-1ba9-4239-95b3-467195ae83ff', null, '8YqYnxUGnJt', '42881813314', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('c7a30309-a125-4fcd-8a3e-44526d0c447b', '36763741200', 'iQaEgorVFB3', '33385890804', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('90050a30-4f0d-40c2-8ad5-c935ed498fcb', null, 'SI1HMBLeQm3', '50648518516', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('568ebc46-3b1c-48a2-a24a-a6abc86575a8', '18775796434', 'bBHuHBNbpKV', '20703180263', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('dcc34638-7702-4fb0-b845-e954ee75afd2', null, 'gmXgxCWImm5', '13689913965', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('cc5ece2d-fad2-451b-9eef-e47e803ccc35', '25995420486', 'jVQVQ0XTPNm', '64168795660', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('f081a1bb-3063-4c21-821a-81813c55d43b', null, 'k5ML2PDdE5r', '87257866551', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('44608377-b250-4089-a986-e1c27939757f', '81053914394', '6b5amveKUeo', '19063300482', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('852fac40-d829-487a-b73b-6961719e67f4', null, 'S5ecGKFaQUV', '55659619449', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('46d8b4f1-e95e-415c-b8de-19735c697948', '22442590852', '015BDlVAiaf', '01778469680', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('5ce4bfd1-362b-4082-af11-24ef476c8aca', null, 'kFNRqOkuRJ9', '94150380133', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('48f3348a-65dd-4d44-8e63-6b03475c2acb', '92423296610', 'J5lrw8LyuiO', '51814657425', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('be2d53f7-c108-4468-bb94-85fcb2ea59a9', null, 'WtzggGDFRmF', '27278036973', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('d9b85183-e078-4083-b4ff-9f6d9e725d68', '01801792167', 'dy1IJHCNWl6', '39728185572', '1526611632', '1526611632');
INSERT INTO "public"."sys_user" VALUES ('98e561df-a276-48c5-aea6-af2991a28668', null, 'vheS3VroLz3', '44607281373', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('bf574f94-db9c-44d7-b63b-0e611a471a1f', '74938088856', '2cR58i9rjsB', '21380144280', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('b905bea0-1407-41b3-8c2a-041f5e9efaac', null, '43ZJganGgCx', '95455006951', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('b4b89665-3493-409b-a0c4-e89caa62c03b', '68316884350', 'JtV7h6yJiRM', '85022383243', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('baa7348e-ad4f-4027-8fe7-d0b94f3c0ac6', null, 'nSYLNPi2zXS', '17866112062', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('1bf4a4b5-d22a-45c1-863c-08cb4db72cd4', '26419507204', 'lQ4wXamfEkr', '19840359599', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('6d9cada9-4a98-408a-9d68-8aaa9c477aba', null, 'AtSa9vUxuv1', '70970685594', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('7bd4d400-9893-4fbc-b74a-5c656defc767', '14731059534', 'p3Gu6ulS9gy', '51609332025', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('b386e12f-e31d-4e41-b15a-9b4eee30230f', null, 'lrLCh5HLcEX', '76690492573', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('a0357c29-5000-488a-a0c9-6b24fb5b9981', '31142214486', 'cDEVQZAO0rE', '40560124578', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('b51f17a0-b0b9-447b-9fe5-c2916df884ae', null, 'lK3iX3o5km4', '88435302130', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('f486b2ba-5e06-464b-9148-d90041cb4972', '61191799936', '1SGVerppsZB', '68995162045', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('34d5a7ea-7a6b-4df8-998b-a7f577b5f687', null, 'u8V2mmfjJgY', '52542511159', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('55efe28d-60bd-419b-8229-27e59623f086', '15908920533', 'oHexsGD0CsO', '84200622234', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('edd48160-c57d-4aa2-b20b-e5cebc7c829e', null, 'Vr8G8fFRHAA', '42752146351', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('f3e88626-c0b2-4a2e-b41a-041f15836625', '49968558360', 'dOl5RxJHhCG', '68351463360', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('c59288f8-4b9c-4433-9b1c-0b05af100d10', null, 'DVxFwKU8eo1', '89769357601', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('09a0e7f1-8552-468e-8064-5296eef8b107', '00664691215', 'VAOr8xkyf90', '76885315176', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('f9eb5e0c-0531-41af-8dda-e3bc724a2842', null, '3XxDUIG8jiK', '69569888393', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('d77640c3-bebe-4cb2-a31e-67a30442726c', '58308281787', '9CqXW9Zph04', '02263999885', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('d92108de-90b9-4fcc-80e7-303460dd527d', null, 'JMcovE0WITo', '78343304223', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('927f6fd3-4bab-4866-bcae-83a497d91ad0', '36527269942', '1RRArJTjSyo', '79512439322', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('59f43c41-eeef-4aa4-8f3d-46751059844a', null, 'WBlGsg7HQe1', '20763049823', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('78bbb6b6-e345-4cc7-89b7-9abcd158a01b', '80627631675', 'vFI5gs30I00', '44113451575', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('6c894d52-24f3-4aa5-9f4c-0eab39ead01e', null, 'nQNJ5gIHoVs', '14307539106', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('9cd14c80-f3ca-4233-83d8-e79f01002c3a', '77863429507', 'QXkmkVyo1EO', '33263335585', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('54b9dbd9-d6f8-46da-ab31-68ae0195c50b', null, 'BHcikak0BH5', '16892221364', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('fe7fed36-0cdc-4346-9666-3e7da38493fa', '91374336326', 'Tr1a11bd5th', '19011528808', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('303e6e22-ac35-4c0f-bbec-3fcaff301daa', null, 'jZTTxrM5ndY', '24389293601', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('06427eac-4a97-47dc-bf18-cccd3d158022', '75136437387', '9V4aWEhlHHk', '87240268753', '1526611633', '1526611633');
INSERT INTO "public"."sys_user" VALUES ('503c4a47-ecba-4e7d-a807-1d3ca5d92bbb', null, 'u47Up1lpWct', '87886631313', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('0225316f-d6fb-457a-a5ba-2a0f64f97d4b', '80804925304', 'f0y6wZA1OEc', '39674275445', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('bf69ff6a-6768-41b6-b9b1-f98e96b3ed23', null, 'ArdTrN6WFkk', '85494407866', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('f730aad0-161c-4fbc-bd45-a5c1f945eb88', '37008706826', '5IOoBR5swyx', '10455099130', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('32c99e23-1eb0-4387-abbd-88275dcd0fa6', null, 'VS4U6VAoJFY', '37038419645', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('39200afb-372e-4a35-9aa6-3cef3615de91', '10592597156', 'wou08gGwsBB', '40201737412', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('e9c551b0-109a-4637-9e57-96cef4c81592', null, 'jEkFX3gwPT3', '04571575134', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('465885b1-4964-4622-8f72-5b69cfaa5b21', '91311096816', 'GzcSTYCfSlD', '90383213296', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('35f83f15-0e00-4394-a504-f62dade49448', null, 'col68J6mI1D', '68298096036', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('7311f98d-5511-4143-9d06-3f4c021bb7ca', '16349887278', 'o8tUyl7awYN', '36086838448', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('2c5e05ea-6066-463f-bbd7-fa0d136fcdaa', null, 'Cbi2upgiDBT', '23430277555', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('abfa2be1-dde6-43cb-ae5d-bc4aa54b33e0', '78515418499', 'bmnby8B6Ub5', '92264726830', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('206e59b9-6b0b-40a5-a405-ebecd2c161b6', null, 'M519uArBnox', '33927241958', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('96f8a8d0-7234-4586-b6cd-f691f9343563', '21135955181', 'edGmmx3tqvr', '49087959393', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('0a0b4155-c7ba-4d03-90ff-74e3af33750d', null, 'wFbjUPwGcPP', '28920827403', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('d1903cec-8b23-4cd1-838f-91bb4cb3c988', '34187936116', 'CEoZ2KKiwZ0', '91527209837', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('08affe1a-5bcd-4f5a-8be2-7beb746c454a', null, 'Vw3yfVIGqvB', '39850578509', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('119274d8-4c4c-40cf-96c4-cb0be7f4ef08', '33800786938', 'Cj6RN9zC3Y0', '47022443804', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('77cb3fc2-11b6-403f-8f15-9f555a879832', null, 'DmqdQdxmWwj', '05095981344', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('5f4ecfb4-8604-43a1-807c-1b9c60083abe', '34469942193', '7oebbyM1pMj', '22864847547', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('6256b8d0-93f1-416c-a49c-eb45fd73f181', null, 'kCBb3gsecRj', '65553605357', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('0915d28c-a84b-4eb5-9d2f-43dc2fff405d', '59804267252', 'MmcyU5h1PdU', '88956748448', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('9b40236d-ed22-47b1-af20-7cda4ad83b75', null, 'QKrHhmG4KUm', '00218303246', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('8677bedb-d092-4b2a-827d-ef35b7a1748a', '74841850723', 'nFf8W5B9yHw', '47713419947', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('bf78288e-e9f4-4834-a915-8c7ed2d7a07f', null, 'JwZdPxTokTt', '11277602333', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('0da70074-5fcd-45e0-a1a3-016506eb220c', '32944193709', '5DAz7W28vMd', '16592294328', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('74c3d79e-031e-4bb4-8e55-6c20c517e6f0', null, 'hU08rNdHYW6', '58465639190', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('dd219120-0fef-4bda-80fd-6adb9a3b9b2c', '87162755318', 'cxGqbMVJ6b6', '09782566514', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('2cb561d8-7fb7-4a18-a468-e062a544e1d3', null, 'yx4vtLKiZVM', '70589852818', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('8a8e5be4-6030-4b69-a3a4-e092179ea54f', '96646517682', 'O3B9QThdji3', '33789031526', '1526611634', '1526611634');
INSERT INTO "public"."sys_user" VALUES ('af387461-3d15-4cb5-8822-a5fc89c3b201', null, 'B8kP0Rmw9HB', '04923551526', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('d8ea3a62-99f3-44cd-954d-706c048ca94b', '35973819315', 'kZ5F4GT588v', '52373530830', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('60351701-dade-475b-83a9-02fa9a1dbf22', null, 'I6GnerR8H0h', '46179023058', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('e2b137f9-b1c7-46a1-8416-5a179a3c9e9a', '63124916802', 'pQHNzgFWOQG', '14927824961', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('3909aec5-26c1-4300-b9db-68adb53b468c', null, '30V7YTQolNc', '76269397005', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('bb35571b-600c-42ee-a17d-5a20692448ea', '15360780687', 'uMvhBJMl6zs', '15498668343', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('49b62496-ea5f-4d72-9dc3-9762ec6beeb9', null, 'yEQIbB4I20k', '58687330673', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('46a6a5e5-c735-44c4-a444-1869a94c8677', '02067506330', 'dRugeBBFkXy', '64897222985', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('5d055af0-2229-4e63-a0d5-892201710624', null, 'Y2R3OTtOOi4', '12963065006', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('59e14f5e-c0df-4f29-86e3-33c2845adb04', '79587677958', 'VLfy2M0axQS', '25085938995', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('73e8910f-9495-4130-99f9-ca2ce1ca5946', null, 'LQ1qUFB27Ky', '63988632347', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('bcdba95f-7900-421a-9d1c-3c712bdf2e2f', '61872240498', '3NuftNO2x0M', '33645200726', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('1b60e192-c26a-478b-a381-1dc37b694ab5', null, 'mbinRKjbCs1', '87885242442', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('5db9419d-1454-4c44-ab6d-620662d22c0f', '09467527602', 'ucDf4f8FHS2', '91666618155', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('67838fc1-4257-4f41-80a0-b3e43bbcc094', null, '1rT6Ez7oyVp', '19122394045', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('6b976a67-de04-4120-9b5f-20facd801a37', '73796251908', 'mcXqMjEORdb', '51920990183', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('57d71f14-15df-4eee-8662-bfd27dc6e6df', null, 'G4hGxBTbQCR', '01196577169', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('d4dd3dcc-a724-4a78-ae8e-204b6fa9622c', '51023196472', 'Bo27wFqQRhg', '48127908454', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('575dd40c-abb7-4ec9-be9f-2a7a4d47d121', null, 'EoU4QyllTaw', '21289649565', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('561175e8-4d9f-40a2-936b-00012f22b2a0', '73173941023', '7trtzQ9k8Lv', '89898434884', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('93f13917-353e-4547-a0bf-0b442a3486e5', null, 'YFv3F2MEpcw', '18556145556', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('6241f5e8-1c28-4cd7-a7ad-b42362eb0a8a', '95524969401', 'lAwd5E7lm36', '54163123580', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('8d9c1fe0-174a-4a4e-b00f-e4a15bb59315', null, 'HcqWT4ShGrZ', '66340800394', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('8d7b1236-7bbb-4572-bc78-14dc4045c901', '53469662236', 'fDYuYdaFY55', '13112608605', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('64621455-bda9-4e99-a821-8e7c0f82288f', null, '4aXukvdUzdf', '07422085100', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('2cbe2ea3-9584-45e9-b0c3-50b3c3001bd5', '09420403169', 'KCBDKEasvdO', '74375206003', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('d7db6668-f583-4a8b-b558-4aa0e5d0f7c9', null, 'VIDlDTjpKp3', '53610122568', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('eb7925b6-19db-4e2c-85cb-fd3256695e5d', '98925981527', '47LPsx81URV', '75343009410', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('fffb69c8-86e1-46fb-ab1e-770632d5aa65', null, '6hsXTRdgVqk', '85648730240', '1526611635', '1526611635');
INSERT INTO "public"."sys_user" VALUES ('ad06d8b8-b51e-40d3-a95a-4531d887d10a', '96484295457', 'wW1IvVP8M2f', '15426998758', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('7f039062-65d0-4461-ac1d-4908468c5d79', null, 'bw0oOVbHs6u', '79925998933', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('ba2fdf41-1b99-40ad-bda6-498a04d5d092', '47046086265', 'VRCUPoDYwUz', '06007321263', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('7bb2c270-6e58-4aef-9a12-622d49bfd592', null, 'U2408YQZMEB', '65241072950', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('fbe9321f-694b-4f29-bcf2-7875ba889921', '28092018563', 'Su0iODBj1xg', '64187657853', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('5552e417-87b0-44ac-a7ac-8b792b80a477', null, 'tMNPHE2BLgI', '14115195916', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('ae7a46d4-7119-4997-ace4-54629e20f285', '79865605330', 'Buu3CccSR2W', '62725956321', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('d3b1a294-6f01-4e04-9b20-81368168d819', null, '8KAi7lUlrK0', '81530376036', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('4862b1ca-1ffa-4db4-a3cd-236bbf0a27be', '71770014742', 'rYNdqARfwOZ', '95837620124', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('b9bf4a50-a3da-424f-abd6-c925e2704246', null, 'AeREjLzPgMS', '78677418871', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('f6df1659-5104-4816-817f-291290001bbf', '91343665684', 'ux1hk5rN5Ip', '11352476113', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('6ec795e6-81d0-4102-99a1-1a23121cf257', null, 'NQZQnIIuwfw', '06368125291', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('a73508ee-f1e7-4fea-870f-70c666cc458d', '94933288373', 'k5jvfWd0ljd', '05732942188', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('fa269be5-b071-400f-8e93-23b877a5f72f', null, 'G4gBl8m8wGM', '80055689333', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('1b472ca2-ed8e-4988-8677-e73da37f4200', '54482310826', 'ArWHtrcjtb9', '08589653027', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('54d29fc3-e6e4-412c-a778-1a3a04187da4', null, 'DBmpyWzGaAY', '60937810147', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('36a7c418-428d-48b1-9290-8dc5cc6e4859', '05743012265', 'ulWRJoNio9R', '22046681559', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('1ccc2de3-aae9-4be7-95ce-13a16ff148a7', null, 'mMVgQgP0LIm', '05105933571', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('70a8b8b9-e742-495d-b492-1f57ca92410a', '29552155859', 'GCOt6byvds0', '78638249990', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('2cc5092d-6b09-4341-b54a-409c4d39806a', null, 'xtVgaoy9yAK', '31017255622', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('ad5d394d-25d0-4f5f-b09e-c16430697ff1', '94175771864', 'toymwMe1IJ6', '13577083331', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('a23f7475-ac69-4007-9a42-99a7a160505d', null, 'U8o3zmdwDET', '71821551610', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('b96bf494-b6b2-4a50-86e0-52d413a861ca', '06327203309', '5GdsbrWGke4', '33578199395', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('1515eb03-2024-4294-8619-747b50d965ac', null, 'MDvyQiobSJt', '53717468903', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('2246bc5b-cb82-40a3-895a-b18303fb1d11', '42953699386', 'qXmaMJe1hJf', '55768336554', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('223a2b94-cf4d-4669-bc45-7cecb2e4d8ed', null, 'JOlrzh2r4Iu', '22751089580', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('a6498a5a-119f-4959-a115-b7c4fe22d23b', '70794457118', 'Xm9rALkWf4m', '13933336420', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('bd851f70-13de-4a6f-9b2f-14f717b21fcf', null, 'MmyViCgJgsM', '37204193337', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('1fc8c0a5-0cfc-4567-ae4a-a3a68e78b137', '72828644429', 'PbyOJd4e8QG', '70496756701', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('396f68cf-b904-487b-b8dc-26cb383016a6', null, 'aExol6hWTd3', '56470347390', '1526611636', '1526611636');
INSERT INTO "public"."sys_user" VALUES ('3c0d717f-88f8-4a49-98a6-ba533f8045b0', '74942640528', 'xSgIjhjRnlT', '06799877905', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('e59625eb-0b69-4480-bb12-a2f930784ba1', null, 'ZYgVl1yhWmd', '92221334860', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('4357f5c2-6639-42ed-96ef-cf3c91482b10', '79883115920', 'xshGeQ2q49p', '43162691249', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('6d678e75-2933-46ec-b537-c4a4b7b02ca5', null, 'A4x5Zmdp6YN', '40617119269', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('f43ff608-811a-4cc9-a970-bbf999e15c33', '48651346710', 'Z0A3pSbn8Tg', '16059516162', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('fea7aa69-da68-4963-b071-54013b01e61a', null, 'W05oEiiGDqq', '35785997656', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('b7e6332c-bca7-423a-a447-0586f57d82b1', '94107559188', '5fHtc0Vqnz9', '82496003942', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('d148770e-5334-4da0-a5e7-095eb058225e', null, '5e2XrSyawR8', '55325372565', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('3466290b-4d00-4a03-940c-3c156150e458', '03574749094', '6jtazktezZr', '46104161871', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('def11706-e81b-46e2-84b7-c1899419da04', null, 'MZ3PeK6zUwj', '22899851237', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('5dc0768c-97e2-4e97-9a3d-de05acd7e0c0', '56491659461', 'swfzvFIjG1R', '86030446546', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('ec2551f7-3b14-43fa-a5ac-0ff4366a0803', null, 'aZeFiIM2Brv', '04471837388', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('c4464f25-4288-454b-ab32-62b890816748', '81348666232', '6gvoLN2Fpyw', '64299706959', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('4fe77295-1c72-4a1d-a36d-709bf575d6c7', null, 'PFNK3iDoZKG', '55696542348', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('044ccd39-2082-4fa4-905c-ee047eb55181', '73363948957', 'vb7VmZDN3qC', '37515778907', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('bb8af870-3004-4376-9461-fb61f068a265', null, 'oQhpwXPsClc', '16528305586', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('da4c3d60-f949-404a-9ecd-45aeb5967fe7', '82301095428', '3NAwVPfnmm6', '72492126336', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('8acc7996-fe26-4aba-bcd0-b9e85feacbea', null, 'ivrgTjK29OU', '58423963224', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('0760350c-ea05-48b3-b17a-50abb3aa2bc4', '05050969238', 'w4IG3X3v1F8', '94512669657', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('27e25dd8-d149-4115-9835-9379fbf11fcb', null, 'OHmKbMsUonm', '07765272613', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('35ce1ce9-27d6-43fa-b6cb-8b278efd8130', '41815780686', 'R8aZRYNKvFh', '33307165508', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('ce737284-518e-4b32-90ea-20780a58fb90', null, 'sJfF7Ncobmz', '73499935981', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('65c08981-5de3-4b81-b717-7c67a0408567', '61268250046', '1Uk4rqq06BA', '27443330279', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('222b027c-cc61-479e-98d9-37e2dd7de99e', null, 'tMKZyQgBLxD', '85390603786', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('6e3887de-4d37-467a-bff5-5a9b6fa20c11', '48695346815', 'fKLmUiwj5O5', '44461421736', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('2e8b68d6-ac0b-42e5-a028-06d410c66cd4', null, '97uExfF3dea', '40428017322', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('70a59d3b-94aa-4bf5-a6e9-80a32777a9ed', '01266983504', '0M0i4ZHlATW', '79137833362', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('d559e3cc-341b-4067-aaa9-21cc62d44e38', null, 'oHBrw1RfuMM', '72974754504', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('80352101-f0c3-4df9-820b-4714cc73f5ad', '60490476377', 'BpmK8SbzmXZ', '37756257880', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('89af91e5-5873-41ac-a361-406a0866adbb', null, 'nYbR1Eh8qO1', '63346300609', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('b66be0e3-5f46-44f8-a25c-90cb10e84df1', '41686985575', 'ykBNdlWGd2n', '21921904961', '1526611637', '1526611637');
INSERT INTO "public"."sys_user" VALUES ('f6ab4752-46d0-46c8-90fa-c74319d37d40', null, 'DRhkaZu2lwq', '27734667524', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('12300401-f436-4662-b4e3-a143a2e65475', '42748386394', 's1zjonZjhHj', '25230846647', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('cceb336b-ed7d-47da-983a-334acd4f65f5', null, 'tssNI46KJfk', '07834231964', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('aabf8b2d-b7da-42c1-829d-7eabbb72d0ac', '35482682928', 'NXPxb9BfiCF', '30058952905', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('e442a257-d0b4-4b7b-9e82-624e5d390b0f', null, 'cwfBeFjAPxm', '04260138541', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('a1a74654-4330-452c-a5b8-99e2cc6a4a0a', '25040659948', '7EqaN6lLphF', '83508365992', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('7f43a503-24a3-4e33-90e3-0045f525da2b', null, 'QnrX3LbZjm0', '35997094832', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('41409bdf-8e63-407b-b447-6351b4bf671c', '63388603084', 'gBJcsfuBqmf', '56682675555', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('30cf1c3c-bf45-43aa-9b6e-102d52271c8b', null, '15IQSSc3kCw', '75213626369', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('502ea4cb-b3ce-4ada-a725-a7d7fe533f9f', '69559505659', '4erdc9SLj7Z', '37035032384', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('51c72baf-2e06-4265-869c-77ececd816fa', null, 'FKEJy2v8Ymx', '11409154744', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('2944c56c-c886-4dc6-8086-688cdef25af3', '13092884445', 'gq18uqhCPl9', '61045085973', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('20fd4c8e-7c4e-4fd7-8f6b-1725c1368ead', null, 'arXXjDmFlmD', '91910523739', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('d64a24b5-0891-4987-9b9d-3b572e988228', '75994149891', 'uKZLtcyfLjP', '15495385238', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('edd8ffcb-1a18-4120-b759-5f68e957765e', null, '6YwHkP6JQts', '24654699306', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('119a923b-49ff-428f-975e-61060a4c4dc9', '50445539779', 'JuiIKDQ7exi', '86083870130', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('e243cb98-8257-49e4-bdb8-820254ae2bf5', null, 'WCiHom2OMYP', '42690014122', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('3ff6ea24-bf96-447d-9f35-f8c72ce1374d', '70348042889', 'T102xGCshct', '63381096333', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('da21e9e3-d84b-470f-b121-2b579a413fc2', null, '6pLMuhplfzV', '70459901383', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('a5486dcf-6409-48f0-8a91-7af66eb02a50', '65389939940', 'H1FrlD39wwf', '00231759062', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('34fc5b7c-65d6-4f47-968d-a54b6056e852', null, 'JEEmtfBndUt', '71673265160', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('96aa97c4-cbe5-4bfe-a3c4-da9969d89804', '44490502204', 'h3ZV514pT57', '15443899047', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('26609010-88e7-4b0e-9363-fbfcc2012d81', null, 'nGGGXRGEHBV', '11882758684', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('305f67dd-136a-4254-9af7-850b74c67851', '13613711821', 'p6dC4CoVPLW', '63562783526', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('2f3609ae-91fd-4995-865e-e833083c0784', null, 'M0Hw98uxTRZ', '24423853930', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('3b1f3a6f-3da0-4082-b30f-e3e4b89ff9d4', '91842505428', 'akGDEE2Cmk3', '71517695155', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('bdce7a30-5d86-4c92-a610-277ebfc4aca8', null, 'FGTuisHm5E7', '12043252153', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('163a6145-8a64-403a-b214-94ca563be10b', '38756026895', 'fFEkJfCmnuu', '60353579274', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('3b7a763f-c726-4a94-a6bb-304fc46eb88e', null, 'Rp4igktrkA6', '06391892272', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('fd16eb47-5ccb-4e7d-874c-06ec07b434c6', '31746457384', 'cXZh5YDB8me', '97392091751', '1526611638', '1526611638');
INSERT INTO "public"."sys_user" VALUES ('8aa4bfce-2ce8-4cf7-b047-b9502f3fb8ea', null, 'OtLCcZ5c0th', '96978541338', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('94a66cf1-37e7-43c0-bbbb-004b45b4daf5', '20239664019', 'YHQK0MMjiM0', '52539568477', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('045a9fae-2c50-4fb0-b0b8-ba8b3baeb861', null, '5Bd10xftyvv', '04350809789', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('8691296b-630e-43a4-b82c-707507188f71', '14971234391', 'eY45HqclHhc', '19313248808', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('e80df154-a06f-4364-823f-55a3f35f7edd', null, 'oS8QLBvk06H', '38440167212', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('575267d9-cb3c-4ab6-8d39-b7585adf21e6', '08988581199', 'dzP6ol0bE88', '97675164105', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('6517cfe8-0137-4aea-b82c-db1ae51e1f37', null, '4EZE6fY76pa', '53760404274', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('007ad2e3-e942-4613-8aca-8d67d903481e', '00444773872', 'HAOfgkeux4f', '18007648452', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('7a57ac9e-c5e4-4b77-8fc3-f23d0087bb52', null, 'AK6cFHS43B8', '56955041652', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('3184b52d-f9a3-4ab9-906e-423572338f69', '89250100447', 'qLAk0xlRjxT', '83958008209', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('f8124a22-0999-4bc2-89d3-891beec2ff75', null, 'foHmwwTkvLJ', '68694473920', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('36fd193b-3de8-4c3d-9c47-25d8a880a416', '66031733339', 'PTmFKQp4ORK', '26509636234', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('6f1a0c28-4ab9-4e88-891d-3c34a91dcda4', null, '2y7V8b26K3h', '87192909513', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('dab36896-e856-4362-a553-4483e2696f15', '59239115615', 'k2VlHZlfBMh', '25665160824', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('a8eb533a-1bcb-4fec-8f00-5792d360f542', null, 'UFzmyw4ME09', '67588050590', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('ce2b5189-1802-4b68-845f-b01c56ee66a5', '13462116791', '7C7feCy704Z', '93457476295', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('71ef2093-8959-4ab1-9b4b-b55af539d7d5', null, 'W4FkBihoERQ', '71659792758', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('49655a96-b102-4fbc-8100-bcad086e1867', '64901375990', 'wz2u2B22jpo', '37706781035', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('708f514b-d8e0-46b5-9918-da37d48521b2', null, 'jWXHsdjCGu2', '35928745394', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('8dd79572-ed95-4346-b623-fb63df75e4b4', '89052652138', 'anTsKqS8uTU', '91515158154', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('39ed87ef-28dc-4e86-b231-eadf64c13ec9', null, 'C3vZW8UGM0P', '51425435055', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('b0627a43-2ee1-4f4f-bc9b-ff25cac79d77', '33451458318', 'EKn20GUP0KZ', '97504492521', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('49b0f2c0-75c1-4d6b-a3b2-4f03c4eaf5a1', null, 'tCLyyTNpkcX', '95663479683', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('02dbe24d-2cdc-4d00-852c-09e14cbfa75e', '40840414347', 'DlydDy5eCiL', '91373647576', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('28cf2d87-b580-417e-91d7-1cfd2d3215d2', null, 'r82LuMIROLq', '16019702119', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('c6732732-5aa5-4399-8de5-b55dc14dfff8', '07086457864', '4G8om3CbCul', '57460662127', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('2bc181bd-6b36-443d-a929-b9830aa490d1', null, '15GIYV35qRc', '71011874409', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('ebabafd9-158d-4913-89a8-54d1feb70089', '79852164146', '0KtCgqHNDpi', '75444517616', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('d20a09eb-4a05-4f17-8391-1a1aef19f852', null, 'c48WjHaPLCe', '38242107069', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('e4de2e98-169a-46c8-b301-a3426ce37cd6', '51920804637', 'JmHMuhslkI8', '62319050123', '1526611639', '1526611639');
INSERT INTO "public"."sys_user" VALUES ('3e341278-1d11-4e47-93ca-804683200c21', null, 'LCi7s5h6ZQc', '09977477002', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('223dc57c-4b40-4e97-a698-689e03ea562b', '75750846070', 'U61vzjMTwkI', '92579643967', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('4b25c984-eb44-4dbd-9632-05713327d89a', null, 'gMNoQM5nWnm', '69384158205', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('594e7472-4533-40da-afc9-1abfb690878c', '75128007228', 'IJesDQtOFzn', '81515320686', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('cc67c7be-5a4d-4699-99c7-1f7766e5d160', null, 'bnmLv4j7S6W', '57984520596', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('6b8e5c32-8c80-4669-9254-09b82eb409ba', '92572225814', 'BDphYPI2vdm', '13314562039', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('f156f44d-c670-4bab-a350-225d394651a5', null, 'Hyf2hBYyIDH', '11789951319', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('76814a61-72db-42d7-a4c9-b11d7104020e', '37394833759', 'RmiIZkaNtEj', '99616366315', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('4bc452ab-0fe2-42cf-a6e9-3f150d7a2d0e', null, 'ffOIirEw437', '39091283993', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('9be310e2-96be-43b4-9d19-0ae1584f76a0', '72646822808', 'Scjt2jS1ZL8', '64951636111', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('2da4aa3c-67f0-40cb-94ff-1690fc9bcbff', null, 'cQGkjOliZBE', '00688116051', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('682987c0-fdc6-4911-98f1-52e6861feb59', '76459541749', 'eR9JA4PbNeF', '00801331524', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('e351bac4-39b8-4902-85b2-dffa9f827631', null, 'mVTPF3FD5cz', '15668479686', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('111ed106-30c9-46e9-8002-78f62ee6ae6f', '97310738232', 'gWZtMhcUnDp', '29006521178', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('08acbc95-b14a-4cd1-9fe6-dc3f703f6ad1', null, '7aPnlqM3OEk', '08341394543', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('c281bae2-b6e2-4b8d-9ce7-a3ea6a062989', '79689977696', 'acjM6PqMmAZ', '62142588771', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('f1a62aa3-3355-4702-acf5-387b5f6891a6', null, 'imYxXJJoOAw', '03046266281', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('1dccedd9-a6c6-4248-8b6b-30d155995bcb', '15083709717', 'tv1gPhiJXAZ', '64538650475', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('4c5c3bea-7482-4060-b2fa-a0f90b5bfbb4', null, '7AFKvlV2d9X', '44144882765', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('7613ce08-9d63-4258-b392-752aace8bbef', '14632466570', 'oF3LhHtEAWx', '79173985332', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('2b9053a7-9b1b-4b04-ba21-c6c2f3f5c1b5', null, 'mVhJSwThgeE', '00073601428', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('42df6181-e767-4f8e-bdf6-a09217c87e0a', '45439051417', 'bIk43U95TCf', '58047590456', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('a04f6612-ee5c-4dc5-b4fa-d988243a31e8', null, 'aJKskhG9F2L', '02206899517', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('78b505be-2777-4e50-ac01-c466f71c3480', '15292853713', 'yAwPJc4iQ5i', '88883610492', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('24617da6-5ce6-4dc3-9467-989d66e0ba3c', null, '18YBzzx6uMu', '07572858838', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('9ae4c0fc-d63d-4098-92ff-af159fc6be48', '77170015349', 'IuDm8gV9z1Z', '99947089652', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('ea2f30c6-ce69-4c69-9824-150009a6ab5a', null, 'jiCuxmFQxT7', '25280574393', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('fcb7e270-5007-4e56-8a93-feddb9917c29', '07154558512', '8VDXSVNrUfv', '81543356157', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('ae662c4b-332d-4dd4-8545-9ee2026f5c20', null, '0VDwslpueby', '46608287673', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('57187c8f-4616-4083-9db2-cee1108cf646', '14101576541', 'dcFoqYjG311', '73164833534', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('dfc1a09f-cf24-4cd7-8e4b-0feeb61bbfb1', null, 'r9TE94m0KuQ', '64469319825', '1526611640', '1526611640');
INSERT INTO "public"."sys_user" VALUES ('1bc3d27c-d8d8-4547-9bc4-a170f943c1bd', '71046346853', 'ZdgAToMcHKk', '10274711506', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('271e2151-b71a-4a63-83c1-13791b5b177d', null, '2jB88o5BrQv', '53823796592', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('a3e71d04-75b7-4a0d-a75c-3968e7a5270b', '15032681044', 'R68OVp6tKOL', '98856870848', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('b69f767d-eacf-4083-b294-74866a5c3b0a', null, 'fvVloc00cIi', '28519223482', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('445bbcbf-4579-4bd0-93d9-3ffc79791666', '09128712950', 'jRXmcyG9FJW', '84670423856', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('8e005c90-3799-4882-8477-c4ef751565fb', null, 'qU73rc7xcuO', '59162206506', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('d11c1649-c6af-463b-b74d-488bee12a5d0', '95413146518', 'Kxs83vNsdN8', '89414624413', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('769f2900-fc3a-43f6-b28e-172001e9a8f4', null, 'qvbV5T1oVnG', '16815140298', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('c77ccd41-32d0-458e-961f-5898dbb97226', '87782280722', '6FDphPuGLz1', '65808440027', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('551c9fb0-8118-44f5-98ab-625196d0091a', null, 'AHuP3cKnT8i', '70188585206', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('a49860c1-0ec7-4d6e-804f-9d508ec03aba', '48918476382', 'GXhqzc6FQwc', '62208242021', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('1b590821-4fca-4143-9de8-def560a386c0', null, 'zBhnBMo0M4i', '09935022088', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('6e2cbf99-900b-45ba-88e8-25716baf5e9d', '67524385541', 'QuKqZVa0lyM', '63058749017', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('c78d2156-d3a2-45bb-9258-194e66fc8269', null, 'KJIwEdGubz0', '80185652193', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('5b55f7ea-f0f1-40ad-9825-b73c1ba985b2', '64853409452', 'tbhhkDWYwaE', '66657996686', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('76484cbc-4733-4ea8-b21b-9fed7f9d3ae9', null, 'lGFBtrm45rl', '14621516622', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('538889f8-826a-4c84-8241-c04847e2eb8f', '98513808874', 'R7VEB6mMCxE', '08357457223', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('fc46779c-bbd1-46b0-9557-073239c7c4bc', null, 'nsz15aZx55Q', '62203263196', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('ac47202f-eba7-4483-926c-ca9eaadaeaa1', '35047647636', 'zhCb5e5XTuj', '27218494779', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('d97e0747-4e22-40fd-bd69-681b316dbcd6', null, 'Y5yu0nV0HHQ', '04351259435', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('45e5886b-d8bf-4674-aef1-7b0e7fe3c0f0', '47268835684', 'jslYqQqYFO0', '07805471851', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('3ca947e2-a5af-43ce-8d3b-af8369871e75', null, 'JKBU3ntrlgZ', '86573756010', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('c57261c0-ff9e-484e-bbfa-6fc15bd68674', '00437805447', 'oGgzX0ySDBJ', '89656613041', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('856a4689-ebc2-403c-82d6-bd37a10b3b3c', null, 'Yf7H1xsd4lT', '55457672469', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('1de9b154-d55b-4b58-a47f-74ab345ccf2b', '02174799577', 'C9kJMQP2JJq', '38394859884', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('93e0a3b2-efe2-437a-8736-94fd59fe5638', null, 'LlHhAajVgST', '37852993764', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('4cb4b21b-80ee-4a5f-a1bd-f36f7780a911', '28065692984', 'yxi4zd0iLSD', '88580762806', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('7e2fbc6c-632e-4460-b3b5-3a4b0d1aa3e7', null, 'VxDa06AexcH', '52640271066', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('aa959f6b-7d86-4ad4-ace8-acd708e40f09', '22898601478', 'yI8T35pBAfW', '16007298338', '1526611641', '1526611641');
INSERT INTO "public"."sys_user" VALUES ('0b7a4d75-3009-4e34-a8ad-e916d4f42412', null, 'nFYTLkM4eEO', '65816918759', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('11806745-7621-4912-8e03-904d84ce60d5', '96509794415', '8wsEFKmaItl', '96580806466', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('237d7ffa-8209-4826-a447-8eb6b7cfeb1d', null, 'eUTBPTRxCW4', '12733905734', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('7a4dc86c-de6e-4f4b-8fcf-d561d2681af3', '31209450050', 'ZgbwD34I3S5', '29177167244', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('d11d52c8-85ca-4ee4-9811-6545e5061eaa', null, 'CcasvHmnfAL', '55700510245', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('d14a6cf5-be7d-4be1-a2be-e1d1f3bd2c27', '51457252774', 'kd9rJ6ZielM', '88093523637', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('5ca6df53-3c91-4f6f-b369-429c610a07b2', null, '76xUz06bez3', '96758674673', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('7badbe29-9b22-4c20-8fc7-62f3ed8369ef', '20172276283', 'EwbiFeQM9Gx', '03017780565', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('ac0e21c8-ee9a-4920-9077-4d3c0c747012', null, 'K6fzeGlL25Z', '04133350357', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('131d60c1-e7c2-477a-bc4f-3b5de2048a8e', '72392807680', 'DD3hnjUK673', '74475909698', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('66462c0c-d9f1-4d03-8a44-05182cf52f77', null, 'uoo3yA8w4Zy', '30123263424', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('fcc43400-1e91-4c4c-af46-53d35159cdbc', '88184477268', 'zEDvJVU1SRo', '16046137454', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('e0f55724-095e-44c6-b51a-6f96001d5756', null, 'lPpLyAJ3GYR', '72583903614', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('029e7c59-e556-4ae0-b300-a40bd95200cb', '13878831375', '6RkbHqxqugz', '74850740619', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('a19f5152-6948-4927-b71d-65c931f847e0', null, 'YOz0D4Cuw2y', '18590221170', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('09cc96b4-ec34-4cbe-97d3-f07d98ed7772', '96582235034', 'hAJfQkn8TqT', '98479854661', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('e80520c9-2863-4ed9-b978-28476331144e', null, 'b5lQes7LeKt', '03597283822', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('f0e847a1-3a70-4426-af4d-543918fc1aa5', '05222282555', 'rmvKfuzA5Cf', '65003610486', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('0f294fcd-9e67-4647-a54a-72af35725b1b', null, 'xWkm11GFSjo', '81065826465', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('76315908-3db8-420b-927b-1ec7e1acb66e', '89658077363', 'MjF7gRmAFwe', '87025623783', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('a58640b8-9a19-4100-b593-4529cb352655', null, '1XGelAZBSYY', '23736831394', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('582a7714-c313-4f73-bdf7-c79ef987a95b', '05746385793', '9p1Er5hFIAh', '31012697468', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('eea57f15-ab11-4b17-ab35-2252e7b25d47', null, 'Ug344ODHLB4', '89641822922', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('69e5fb0d-305f-4abd-a7d5-30cb2cbed2bc', '76222639093', '4SsXkq7nOT5', '03322279476', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('83bab143-bdd2-463c-a13a-ee59e1ac23c9', null, '2fytNZ9IaOc', '91379026592', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('dff060a8-a42a-46cf-af17-927c66b9c224', '30005839745', 'H0T9J7iaYRr', '21452581218', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('444586de-7322-47c8-9205-2fbcd6580dbc', null, 'xPYtPH8bnbY', '45216466455', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('947d42d4-eb1f-4507-b49d-570f5e7a65d2', '99027179854', 'fDo7JwFLloQ', '18820292639', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('f368bf4e-9976-484e-9630-6d520121f3b6', null, 'kK0JOOn0BeH', '62452259546', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('b9839caf-b0ce-4e28-a06f-284b6d1885a6', '61945402165', '2G1TqyYGc1C', '81120351343', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('069fc5a3-5d88-4a76-9f65-536a0a76802c', null, 'slBNig51iXa', '52600798542', '1526611642', '1526611642');
INSERT INTO "public"."sys_user" VALUES ('77d6a7d8-7d38-4040-9d49-68979f4eb038', '08935617383', '6iyffvvM5x1', '09049038519', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('b404180a-2a7d-4663-87ef-dd1739411aa0', null, 'S6F4XA6ERWu', '19718281220', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('71fdae11-42fa-480d-ae8c-d5a99dbf6bd9', '52295120040', 'jRxnXgLq0Wq', '15538025316', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('a79615e9-b480-4f0b-8335-571b2bef7dbd', null, 'nk4IpNuWDIH', '97456632074', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('2816f52c-a6e5-4566-9bf6-d8d83db49290', '38557052616', 'Sb94PD5hjKF', '45396323473', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('21d70112-67c0-44e8-b55f-b8a50aba1f9c', null, 'Q5TcbNKrjc5', '06206081828', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('45d31464-3db2-465a-9b17-d234fed97b8a', '69738512546', 'UFsfl9rjwp9', '87497871180', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('6f5c5771-eb1a-4ca2-8e91-e60779967017', null, 'bmJv9CTud1H', '37601365619', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('b000fe65-4805-4f7a-9a1d-8da40da6cd41', '93458726786', 'GlvxJeHRnCy', '95497928583', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('eb7595d0-fd3d-4cfd-80f1-a21c124fae96', null, 'ZZQRUA7h9Lv', '86289055913', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('188cbca9-2fd7-420e-9d30-4ec2886d1f0c', '86173589952', 'eN1e1gSYPDF', '38018461478', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('2ba39cda-7bc8-44a9-a664-a9557fedf3e0', null, 'MpunuYo3Nmw', '79607924604', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('e1ce9a12-37a7-433e-a3b0-ecc6c744f660', '45289162677', 'DxASTfjm7y6', '06866673511', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('46eeb9e5-a786-4187-93f8-179d00c08fa7', null, 'KsEPjelOSdt', '55099617524', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('ba6036b9-6c9f-45b7-864b-4dfa92929bf4', '99738679405', 'BNKgGegfVvb', '20630780745', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('0e7554eb-5553-4523-95ed-c3d75a63de03', null, 'GWHdYpyeBtO', '91135509105', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('7f0d1294-90a1-4e41-ae1e-832c068798db', '88153209057', '5fHGAI2cAGj', '80918680012', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('82c330b0-f494-4c31-83a1-6f2719477e44', null, '2KlagwRMOqW', '72468317731', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('c8f00c73-003e-470e-b3ba-7035e462b6ca', '38446723592', 'lZoYIpiLAuH', '33935059702', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('c8da34ef-d782-41d9-8068-f4cb3d5adef0', null, 'R1w3vMQiWRg', '49477760206', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('943b3e29-640d-4247-b998-782c28b7238d', '17047497260', '2KXuFi0uEZ7', '23143087380', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('b290a161-156e-4a94-8c1e-252a415cf761', null, 'VuBVEdQvutp', '21539982931', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('3375305b-1e19-42d1-92ad-feef0b5962a1', '04208434675', 'QjoCrgAUTfm', '25314356117', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('d3524411-f424-401a-bee7-52ff40a40b4a', null, '9osEZ48fo9Y', '91400857829', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('2180783d-98ee-43e3-a77a-d0fe8488a226', '95555449524', 'Gx2PaJZTxfR', '83708978076', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('2cbdb753-95ca-4bfc-a156-d9c64eb1161c', null, 'Smk8ClLpnYL', '47984607538', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('adef5682-714a-4ca1-bc37-56bbb35f43d4', '69462906882', 'tp9SlW82z1i', '44416311384', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('65d58da5-0df0-4434-b7c3-1766d833a598', null, 'S1RiafswPNG', '72152681227', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('1ca0063e-29a7-4715-ac71-831cf7f066ab', '18092146795', 'cCDOmG1ziHu', '45376385689', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('d49071b9-20f5-4256-b6e3-f924be814fc9', null, 'pToUowKhHvf', '83415322831', '1526611643', '1526611643');
INSERT INTO "public"."sys_user" VALUES ('91cfb19c-d196-4a3f-9294-af56f7ad2f93', '01843339022', 'hTZHjAQfM4A', '12421065719', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('0feef8e6-5bf7-40e9-822e-3cd87ce3c445', null, 'X1lBCtbIu0y', '08026732343', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('da9ba4f3-609a-48d8-9498-40bfa24b1396', '59573878804', 'aQ9PtFf013o', '52420590881', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('9649a6f7-2a2d-4912-984e-5c6b38982c3d', null, 'YyNeZvKpglp', '16647246238', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('84aed0da-7a9f-4349-a830-8944929c5db3', '76005758017', 'AgyPIrptAOC', '87640966177', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('e10e3567-c0f7-439b-9a45-e928bad01bc7', null, 'pUekM0WKcfS', '45849145957', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('212c1b69-47ef-47bc-ad4e-887ccf9743c2', '51433698950', 'dZLzaeUUjUz', '38051775494', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('87087c6a-8acd-43a3-8055-3bd0812a86c9', null, 'ZGMQ1ptzYHJ', '55219377035', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('9e6f7e3c-28ed-45ba-8e56-eab2e96dc8d6', '06907727492', 't9ByQa8odcu', '17282550632', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('79c5e985-1c36-4a63-af0a-300d3567a916', null, 'K25LyVpqMLc', '29161682563', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('aa1fd99c-4945-4cf0-a341-54520e6154b3', '16153150556', 'bTceG6Z8OQf', '21534747950', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('17292b64-3dff-46c4-9dfd-63b4da66da7b', null, 'wVQepm0U6zi', '65557265823', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('9578ee39-3154-4ba6-b125-6e89174302cd', '98345688551', 'AEAW7gnyahC', '84291058237', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('f80f233d-1c2f-43cb-9aa6-698c4022b705', null, 'WfN77wFSVib', '93516376442', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('74d252bb-a3c3-4b31-872d-517a58142a15', '33893967356', 'IOafR3NNkaR', '20917240414', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('c225b120-b8de-4f91-bc99-7bd85bb74669', null, 'FMR3UfPEkmR', '95968337526', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('0be80d0d-c267-403d-8b8f-9ffa7e356b5f', '60293845768', 'kj0uycv9jhA', '56695226670', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('07cc7ee8-5834-49a7-8fa1-c420d8ddffd6', null, 'kynSIYBJJqT', '68841344330', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('32ba3fd6-7e3b-4249-82f8-a083051ebd46', '42257769205', 'WHKc8BPTGGf', '41867987356', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('8cf9234b-e4d0-4ad3-93f6-b9913a8041aa', null, 'eCCvrYI4Xjc', '52564731747', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('93b2cd58-e245-4f14-af5c-b39aaa552574', '10945832357', 'PDSMpp14OID', '97234736000', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('7116de29-82f7-48fb-8b69-22214d38c9bd', null, 'P47QSYSTGno', '45377816955', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('71a99bb1-8dcd-4156-b48f-0d02219acb51', '34556031678', 'erdBZRiTxbx', '90732606247', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('934b7b4d-8457-4b04-aee0-8368f2984406', null, '9pj8QzeP9ry', '54314771893', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('92e04e9c-24db-450e-8740-973474a92053', '10632725729', 'Q5wMXjOBFRx', '83298315386', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('26dcd6ed-01d6-42ae-8bd5-2bde27f356cc', null, '8Xuvr4niev4', '53462384991', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('b3e9a0c9-f573-4494-a69f-2b65fb4f10df', '32944542590', 'Lg1Jlh3ArMU', '86854402078', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('9514efb6-8f76-4179-bac0-16ecaad4f94c', null, 'xuXAmjXKZVg', '49760522572', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('2bb30024-4fef-4f5d-8f8f-91fbf361a32b', '45819632093', 'luL8QvbLnpA', '57885472489', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('2cce41c5-af52-4a1a-8fc6-bb00a27354da', null, 'G5eB4lNiqrS', '68531326708', '1526611644', '1526611644');
INSERT INTO "public"."sys_user" VALUES ('d865fad9-5dd7-40bb-a0a5-69fb00ca64cc', '97170087721', 'WSGppkq0zBo', '71695074583', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('cc13210a-928c-43f8-9dcb-75945d297987', null, 'UuRx3fChttY', '83448145152', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('cea74646-07f4-460a-bde3-126ac46071cc', '55755552249', '0cFOvLGZkxl', '30043892690', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('045d7346-2e3c-4f1f-98d5-2d159b4ff3aa', null, 'BsgObX2B9nj', '63427027537', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('3a454186-2a1f-43f6-b450-740eeeeab0e8', '34209431338', 'Qh6aLeU4rRQ', '39267919074', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('e2dae195-bfe0-43bc-8be4-b2f783638b49', null, 'E1DBs8t9pA9', '58473654942', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('bfeeeffe-8d55-4e83-8a3f-6f6e17a67c0e', '09857470017', '8nVFnxvgZ4f', '56332033456', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('3c18a3bd-ac81-47a7-927d-e8a359607c2e', null, 'iGYXKyUcrOZ', '78294741645', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('7b648e19-60ee-411a-9366-fef988f53663', '92742775603', 'Fw2xrozH0yC', '05872040023', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('c395b4e6-d780-461a-8102-94378504c769', null, '7yz5uACufWr', '90801825802', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('aa5ea19e-5683-4cee-bed2-2a49d313a562', '55756948289', 'Z6zvVTdzQVJ', '17441079294', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('5e7453f2-7e52-4640-9168-4f15f7703171', null, '0jljU5qtCNp', '03015400968', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('e5b81746-e1a8-4e14-bb62-f2632b0ff6e3', '28640858277', 'myHiQHFev2f', '46610480122', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('5408726d-5dff-4bda-8402-d5ee803cbe57', null, '0925ED8OCmd', '22869400563', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('5e946ebf-9ed3-4358-b8f2-630dfa6bc98e', '01415484083', 'gRAWCO66NsS', '87381758271', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('91a9aded-e446-4a8b-8c65-c6d2d307408a', null, 'XaqulTq9Slg', '96496179849', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('278f1f50-4a0b-492c-82df-2ed7baf4cb63', '48336364258', 'ulIE23lZnPd', '99166626016', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('1831e022-5cf3-43b8-bd71-771d5fd85827', null, 'M7raOJGuv9M', '49988276139', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('2e5c3d06-1b5a-417c-b617-900379c53e9a', '79155761430', 'xukv0jW8gCF', '74304406759', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('9754fde4-d79e-4dcd-a265-02f5c81525c9', null, 'iwEdKnAJHPT', '70967317658', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('d0262cc2-ed2f-472c-b330-795bd2049722', '71224143712', 'OWDIhBtNaxW', '38572288308', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('ff88ee22-6098-4057-982b-7edf41efc2c6', null, 'm77BJLCASQt', '26496324093', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('4fa68747-9dbe-4775-90d3-99a348103075', '32774187269', '2Q3Ap5VzEPq', '29330533826', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('5e4ac0cb-bda0-4e2d-8ea4-45ab9eaf2628', null, 'HU9CX10sMFW', '42745883317', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('098b5b38-831c-443e-980f-301ccf96bf65', '50117949082', 'bpHgSsvCRVD', '19556453340', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('3d83856b-25ac-4f3a-aae0-0b0aaa65f6e8', null, 'tc5ey3QhZ9l', '43935277055', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('3dcfb01c-9b66-4222-bf52-906a0b91c63c', '79378731990', '4ReLkzGakoF', '09510445798', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('2c134970-b324-4bba-b4aa-67d10a1ccd36', null, 'gL8H7LrP2nf', '61116875543', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('a564e1de-ca1e-4ea0-83e2-8b03da27ba55', '79924417032', 'wtSSMVFkyla', '43332024172', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('8edf7fab-69a7-47b8-9d40-bc12be68c481', null, 'rPl2XNDUDGh', '04279391894', '1526611645', '1526611645');
INSERT INTO "public"."sys_user" VALUES ('229891d7-de1a-4068-a894-c7d5310d9e1e', '40121731444', 'kWQSctbP0zd', '03100214855', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('0d5872a2-1b79-4dee-9eda-7dbaf5b10ad7', null, 'LYvPInm1NWK', '26005533638', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('99489eb3-b425-4927-92a0-e0c3c96d29ed', '65936222160', 'G2uwZ1llhsA', '60714903902', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('32f48e5c-53e9-46a9-b7d5-3aaec96c4b05', null, '951k97n1Lgo', '61341410975', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('3a49d10b-2004-40c4-b0d8-6cc833f5980f', '33051412566', '6ou5OuJvAg6', '07126907156', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('109d9c41-a691-40f1-b3c7-744019abdff2', null, 'oz6sB36Dz2K', '01538845240', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('acf0bc6c-5ab1-4dcd-a5c8-714b4c07f9c2', '05112300886', 'KaogJ4aWHR2', '74787834273', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('2a3fe145-8471-4c98-8d08-0b558b493c74', null, 'sa947OKMAWH', '71321722104', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('05e6b9b0-7138-4170-b308-6341bd14455f', '19298447076', 'Ffsi0vYIZwD', '67712437042', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('7caef891-ab9e-484a-8dfa-432a63bd39dd', null, 'lG71Sy9GMzC', '73270610539', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('93d0459d-7df5-47d0-87ca-30bd1d8929f8', '67107747627', 'tHAgeHCQGw3', '27521905809', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('08a59ed2-f217-4f3e-9d31-a760e597bc49', null, 'cNaUMDlYfs9', '96761837233', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('2ee3c6ef-971e-41c5-8664-fe67e970ad06', '44544967045', 'uAFajVE6BuX', '34589328240', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('4b839b12-db18-460d-b337-66a7a9d18449', null, 'wuskfaQkpsw', '78053137736', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('e732262d-ad68-4df1-b4b4-885e1b7eeefe', '41456750036', 'OsH0bBDn2PJ', '40283805612', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('0e248417-47c6-44a5-9b2f-04d9ef32f65f', null, '0AYuhmF9K2S', '41041718360', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('cabd4f21-246e-43ec-992d-3c0770647cfe', '02241632871', 'sghr81ApRi8', '07670369036', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('b418abcf-881b-4c41-bc78-ab68c6f31ad4', null, 'eHYNcRbwv9m', '59165927443', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('1d02e936-a329-4b6c-974e-f392dd40ec5b', '30479246810', '77wAWaac1ZF', '22187399010', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('98ef8a61-66c3-41e9-a0b9-9ce425331e3a', null, '686YH5MehZW', '58476040121', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('7fccee1d-3eb9-4755-8638-4e650f0aedb3', '73426269900', 'v7PnUOoCujH', '95846091274', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('a4b9e7c9-8e21-41b8-b3d6-465efc898613', null, 'YVkgPZPwxR3', '12948392727', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('16377c2c-1d26-4a95-a626-79b96e52e3c8', '86997003084', '0F5GrLziqn0', '37184341392', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('4c0f56af-64a9-42ee-b862-ae8852f10663', null, '7dhlJvl3hAc', '81177028575', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('a10a4914-88e7-4dc4-9fad-d2edd76f10f6', '05845387297', 'gZJLXI0gWek', '04592030580', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('7c60a550-b1bf-4bea-b9b1-c5fdde81e38d', null, 'KQuJh4ebSaI', '25397634842', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('29de20e7-d54b-4169-bd97-facd8a7fa936', '37516313685', 'tBVm30ZC8Ry', '91102610394', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('0147390c-ddf3-4bde-8f09-0f59061b84b3', null, '9765fOuIiqw', '95060009317', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('313aaefc-7c90-4fe2-9328-2aff0c7f0ea0', '82633755621', 'vqKMSu38ESV', '15600252671', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('0c58af31-951c-4697-aa4b-e6dce446b6ef', null, 'zmp8HfzdSmG', '04555086746', '1526611646', '1526611646');
INSERT INTO "public"."sys_user" VALUES ('8565c8ab-e737-46f3-a02b-39803b2636a0', '82726361422', 'XGdp3Pl6jGD', '09239206571', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('8d40d58e-9a1e-430f-abc0-45441a4af369', null, '8h8eHk5rBcN', '47226952562', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('f22c825a-041e-4830-bea6-fe929e1be295', '30863215100', 'dfEZOnSuRP5', '34140031335', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('a54f5451-5f68-4db6-926a-c916b6c99152', null, 'XwVwY97sv3v', '18444391458', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('e41d43ea-ec38-468e-86f2-87e0b13ac3ed', '34294377139', 'aMhuVAORYP1', '35707742800', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('fbaaba1d-c01b-4b89-a9a0-75c375b24c98', null, 'sBVt43obqAg', '86595698584', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('016f83db-ff62-4695-9607-cb40bc74bcb6', '19114955685', 'AiJ1lccbTP5', '84615085215', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('f17ae40e-5d12-450b-8f94-639438258a17', null, '5bvTmSp6FG1', '66352781167', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('99b65bb9-89b4-470f-8887-73c6d7f31368', '46375619283', 'dBXybBEwo79', '30100745502', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('170177b4-9cf8-407c-abc8-5491a5f0b72d', null, 'kdeSUfqhzN3', '81518214207', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('69d8a640-5364-4ed7-9ee8-c729af43102e', '82494733911', 'zElH1TxDUFy', '21212816677', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('defef316-32ac-41fa-9e2a-5aee0e68f1f5', null, 'YSaGhfiXfKB', '35796906058', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('f15e6eeb-3905-4a05-aaec-f830f1ac1aaf', '33848012401', 'r9fVCPXtxsX', '59275512828', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('ee564c38-4783-46b0-a2f5-0dca3b32cf06', null, 'cR3tRZYqcFx', '19977196043', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('03e4e9cd-cce7-4e9a-a6b4-745837154094', '10061132493', 'IPQ78BlkaRo', '74447283338', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('206f5247-255c-4563-92d3-014295fb8489', null, 'uMtxMGJyJNo', '12409473561', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('a5be6f05-9957-47e4-b987-f7a0166448a2', '45010742574', 'u64Agx5XiMx', '60153664626', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('e9ef95b2-6f52-429e-aeea-d2c6af2dac42', null, 'fITa8iPyQ4l', '98225179977', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('df683ec9-7e42-4693-95d3-8667791c5e2b', '67373198289', 'DMcOo5K7mq7', '26265181114', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('39f55003-8856-42e3-a9c1-c60d497282ff', null, 'RttNDjKlrPv', '22467342693', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('057b10de-77b5-456e-bfcd-f907a6b6b910', '45725431133', 'iuX3LFpPZ2p', '88499791128', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('47b35f11-06fb-440b-9ede-20bd0116408a', null, 'qQdqWQg6h3Q', '57781844567', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('8c038736-bccd-4346-b667-07dd04e0b600', '29710215301', 'Og8Gt60WRX6', '51395103439', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('3cd54e79-9dfd-4c73-9509-05092fec7f3d', null, 'BUqgmIz23GT', '49880659789', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('c293249c-d783-46c7-8dec-cad69c86a7d0', '97761728845', 'YXsH6yEwHSI', '99857023184', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('21b1434c-a493-4329-9653-78cbb9f07335', null, 'wQzhk13HDLr', '59715625165', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('78b7d482-2fed-4876-b90c-da4880ffafca', '12274153176', 'Ug5YbUUU4nT', '20848875478', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('ca3284d0-68b3-4ae8-9301-465fde284520', null, 'Y4xqnG0xvVs', '80240155206', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('458b563f-3261-4488-b6de-ed9671579bfb', '66152382985', 'bVToN8mUAOT', '10485938151', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('c9f2f441-25ca-4af6-a3bc-0fc11e9a472e', null, 'kfcDs8X7R34', '12001509043', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('661ddd14-692f-4100-a2ce-42f5679deac3', '68225766209', 'YbZVJ9rdubt', '38034146845', '1526611647', '1526611647');
INSERT INTO "public"."sys_user" VALUES ('4516d5a6-5745-4eef-b5a6-a079722e7a0d', null, 'uhUQIm4GHUN', '91525062096', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('82424945-b0c1-4ca2-ae2e-7ba84d6ef370', '72816078545', 'oda92p52Z72', '91993605501', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('c2fce12b-4678-43f3-be16-d3f99fabf095', null, 'h1u2PpEmXSu', '31510124859', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('53d7541f-98ae-437b-af93-3bf88028f33e', '58692767709', '1LL79lckXo4', '66150289054', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('5cc8e02c-807c-41de-94b9-8c9d9d6619e5', null, 'qjN4JmoRwzi', '26468880729', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('38edc581-e5f1-40ac-9ed7-bd0fdd78ecb7', '20695448328', 'Lx07tRypPz5', '24456268814', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('eb8501d4-abdc-4bcf-8ee1-00a7fe70eb07', null, 'JaHWYEeVkrY', '86443850732', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('532292a4-6882-4450-9929-2c8271899ef3', '79633758187', 'J1il86zl94z', '76367357873', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('0457391a-d8e1-45ef-981d-81ac829625e2', null, '6SgsBNTJbyz', '56977346872', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('bc7cc768-eef9-4bfa-b529-b5cd472087c8', '46658345326', '7vdafCe6H5L', '34569301994', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('9faca0a1-ce48-426c-b10e-f9eaa2f0e157', null, 'KVHgoyymaSp', '72931648794', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('185f8244-ec70-45df-b89c-d2fbf3c7728d', '06663038694', '0Qb9qwvLo4g', '30317194850', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('b0943ddb-afbd-41c4-a7e3-35ec547e9595', null, 'B46jPwxCn1W', '68413066251', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('a66031a2-0595-4b09-8191-a7ee3bc5be74', '70967396818', 'rEiLIOFERX2', '75346517169', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('c92ef334-2040-493f-8c52-59bd1698587e', null, 'RLoiUdGfEYw', '12870157953', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('5336a3f2-57a8-4e06-a320-2ac2b1cd96df', '11415564168', 'zULVfPNrMGx', '88562094950', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('b47e22a8-7c7b-40a9-961a-889d5ef104e9', null, 'Z0wXubnXies', '25296038042', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('79fae360-55e3-4354-a5a8-ee55c73d418d', '21039549611', 'n0vjrCRuyA4', '29324501695', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('f7a0be44-1d1d-413c-8b8f-9a6ba785305d', null, 'XtI1YNIvG65', '96246615978', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('463c0a97-2443-4d48-a630-663003a019a9', '70624542339', 'XMowO569cBk', '62239206641', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('593eb295-07ff-47c8-82fb-6d9d4d88e535', null, 'up0wMdLfce3', '13360963599', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('508c23a1-ab18-47e6-98e2-c5157fccbf9f', '79460850033', 'oEOs150Qroj', '08131295346', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('1f4b9099-2c8c-4a62-bbaa-bede80f3fba4', null, 'drNgidXyjVo', '56839636854', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('00fc0172-c754-4b17-8a09-3dae7a90e8d5', '34474401547', 'IY2N2qgQcyB', '74101231991', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('78d9c9d7-5d41-4d49-9d6d-c86453f43477', null, 'eB5kKI4GvtU', '00029378396', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('8e1f0194-dcd4-4e25-a49b-ba6b14474b6f', '32244981864', 'ub2ACyJ906F', '29257781416', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('f0d418ab-75a6-47e7-9d5d-4b608e5d1616', null, '3Eq1k5Rza9y', '85952189563', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('3f31849f-2808-425f-87cb-32916a4b9b0b', '43265888982', 'PW4j85tQ9f1', '84804972042', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('8102c98c-4764-494f-b23f-af0add6d40d3', null, 'RwOsgn09jpH', '77421647520', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('4101b6db-b7a5-40b7-a300-ca85f8a53b16', '58325570339', 'VfGWkpBKHj6', '31374174124', '1526611648', '1526611648');
INSERT INTO "public"."sys_user" VALUES ('9e8801f9-7938-451d-aeae-9b3a110a7e26', null, '5AZm7I1GwnX', '29117530194', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('eda920aa-6f94-491c-bba0-758a817b0b5c', '06388741127', 'gxCqcGzOI1N', '05564487798', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('10b42a8a-79a3-44c2-a804-5b9c8ca7f7c7', null, 'tFXwX7iguvg', '11350352995', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('327b25da-1587-4ef9-8ab2-2c3ac80120cf', '94592561721', 'Eas4z4ZVxLg', '86307949691', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('9b5e3ada-a938-47c7-aa05-1b72bb42722b', null, 'DnGwyGOIiRw', '45957448775', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('f75230b8-ca48-4cd1-9331-0f2de7aec438', '84833577235', 'vktgDDE8vdd', '35300655123', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('f3910816-090a-43f4-8dda-309f23909089', null, '7Rt0tN6kgLT', '81663590402', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('f6a97c7b-934e-4ecc-98b1-300ee50f16fd', '48849096185', 'djBVqb6Iknz', '69459116215', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('1cc593ea-eb2a-435e-9289-dfb1136bf493', null, 'yvqObHLsGFg', '03797513853', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('453d8fe0-62d4-43e4-957b-68c42ac595d8', '01394820309', 'vgWQW6JlCZP', '29740177687', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('1fc03629-b90c-4056-a234-bd710f23f1cc', null, 'ZB5TWDdkBSL', '33258816830', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('3170045b-da08-4a4b-b5f6-9ea268dc1926', '29763607571', 'rriuRb5Sse5', '03582336098', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('5807542a-1f21-4ec7-b82c-2e441931f463', null, 'LHejkENuFOO', '61549929705', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('7b25575e-ff50-4883-bf58-76610ccb0473', '95732915796', 'c8hbI3UwAfQ', '86550283546', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('ec44f3ce-e6a0-43d1-8574-5d8a9429fbb9', null, 'Z5r7X2SWe8O', '65756249972', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('74210686-afd5-4846-8539-169e46146ef3', '93795354170', 'JbJMXglTZXb', '89819247727', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('2c341fe4-c99e-40af-9e79-1fb6068f3c01', null, 'Wd0Z70nO67Z', '24477922019', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('59c89e18-8769-493c-a6ef-9fd197aee039', '07773281916', 'rt7GeVxSe8Q', '92172871775', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('6975b84f-a4f2-4233-ad78-4935051f2f56', null, 'f0NPYU8cWuk', '16707331825', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('8bfe1a29-f9ae-4b71-a07f-7549f4a2bb15', '61543571442', 'ZgaO3fnxSEx', '73672590109', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('27f969f5-82fb-4ca1-8770-ae0cc4538323', null, 'zhmQy4HQd75', '92891384246', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('e02552f5-ca05-4eed-9ed6-4c7fd99d764e', '38645684402', 'Lcw30R51Bk7', '62163404489', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('391b42a0-8e1d-4e45-b4cf-55e8bd31708e', null, 'q6erRgynKfm', '19044128952', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('9fed5c00-9af1-49f9-bcf3-09f48a6e7260', '12126374447', '38htBGtkP5D', '85378353248', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('94706f18-5ba1-43c3-8be3-b2fd2a800329', null, '4Fd0nkmyFsG', '25555682422', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('6408cff1-1f1a-4f82-8399-3fd03ebee062', '18197768451', 'LDYlU2Xg4lF', '78298334280', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('d239e77c-2004-4282-a1d6-72227ffeac60', null, 'RgrziZUdDta', '38384982694', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('be711e7b-65c7-43d9-9f3f-2996f4855611', '05084637275', 'kTiJt1OuYnv', '03572794401', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('188de5bb-e45e-44f4-bc3b-884e25262964', null, 'TkKRqiarCh5', '79203144987', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('974fe34a-2520-4507-9e6b-f08b2309b39b', '44016357218', 'ZnIy7P9Y1pW', '35347274405', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('726b207b-fdd8-402f-b8c3-69f4344bc9f1', null, 'fC4Sp17Lr8K', '50053777810', '1526611649', '1526611649');
INSERT INTO "public"."sys_user" VALUES ('789b9b46-0038-402d-9457-6595d0a7dba5', '02402800616', 'sIWXHMMRnp1', '87602990145', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('4379bf9f-aac3-4e38-a925-34a7304bf7eb', null, 'r50bq4juD2v', '89595847788', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('9bf54911-1db3-4fc8-9d19-d5b7837fbb1e', '06330866534', 'zL1GzSvGGVH', '39808487066', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('51f09f83-0ca6-42ed-82f3-36ff77313d38', null, '19S0FQWJo4s', '91723217190', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('ac2f69f2-707e-414a-953f-51e5c3a7eee2', '24998958796', 'HS0OVvOyz1S', '02634685388', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('4948e2e8-d122-426f-9e24-48d596084b4e', null, 'nk4E7PJV7Es', '09202003584', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('b6209e1f-26a4-4199-b00d-bc9d80c4ecc8', '36927990450', 'EoeVpXsQ2Xv', '48847224360', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('d7b122ee-493c-48cd-949f-2219c18fc5a0', null, 'yfILUiWT0Qe', '67139598445', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('c38feed1-18f2-42e3-baac-33e09f7dd0c0', '49522674084', 'LEzx5zM4UCZ', '48339744916', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('e4a83ec1-e120-47b9-8c23-adaea62848af', null, '7dZsEJOTCQk', '27731775939', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('398f7a73-4c60-4779-860d-d14ab4babed2', '99733944129', 'cuye2mw01dA', '49611033407', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('e2b2c1ed-196f-4606-8782-64648199362c', null, '8XvrTpVZaAH', '34209152587', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('8fb02f18-18e3-4513-aa21-dfe1472a98f0', '74638735609', 'dPpoPqb05Rm', '44787197998', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('4abfc657-6182-41f5-84aa-f6dcb891aa95', null, 'm8qzGS1Vlki', '55595107828', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('e8ce5e56-3c2e-497a-bed8-2720fd2f09ef', '72402266857', 'pzMl6XKa5Dl', '45958480670', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('e658a157-8269-4bf8-b01d-988563b66796', null, 'qR3MghirG0w', '84899329398', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('74cd29c4-44f4-4513-9825-d964e283be84', '50076727879', 'e0IIeelGnQ3', '60906745980', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('6f831c4b-7c4e-4410-ac55-357e9b848c49', null, 'lmQ2rlZmNfr', '30264878672', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('246c0fab-a32b-4527-bd9f-ae17087f0908', '53108300671', 'ygbd0KUCep0', '75845833248', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('590401a7-ca38-47c7-8e5a-60ea2392bc98', null, 'FFauZBT4OiL', '31019336609', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('8faf911d-d032-4e7f-827a-fcd78adc071a', '87327307814', '9qEACAniQrE', '54070637785', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('6cda3630-8408-4075-8cc4-af1497593d16', null, 'j72DrhAdNhq', '78240181176', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('0932a5e5-ff7e-4290-b018-94b78b6b698c', '90717777481', 'dNospAS2Sgq', '53686823492', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('61112e6d-dd91-46ce-bf75-de441a2bb785', null, '2B7C3gqjRCz', '53724800039', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('72938f0b-bed0-401e-8218-1a7245b67fa9', '23586398124', 'Yu7JLqoJst9', '38807285692', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('76216a5d-7b6e-4c7b-af9c-c9525c35db24', null, 'L4HF5fD3npS', '53478538832', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('03f0b694-0eeb-4e42-aa3d-310ab9f32e8f', '40796232599', 'SX1G6nRQSmy', '32825727271', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('58ffd32f-4a94-4a93-a874-87ec3f423694', null, '0QSSXfN7SRH', '78177494577', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('c7557d37-4e7d-4fff-a427-818d85b4899a', '93042522102', 'Rr1UtgKhDVA', '49694198963', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('3cc62248-5bb9-4ed1-9662-d0604702be83', null, 'Gna4bQaCIbn', '17351699331', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('52aca7d9-d7eb-439d-8757-c108d9b764ef', '40289281922', '7I3usAjdiu2', '75628368244', '1526611650', '1526611650');
INSERT INTO "public"."sys_user" VALUES ('0c9d16ac-7806-4f8c-928a-be578ea03a16', null, 'jpw0kEkfapC', '94662073359', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('efebb731-2019-43e0-b01e-81825be2a826', '15738633183', 'y3tmxchnNg7', '90669468682', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('e04f90aa-bce2-4bdf-9241-3c3aa7b4a1ef', null, 'gxYhB3HehcA', '80435822771', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('1ecf4904-01b3-4188-884e-e25e4696b843', '15274670544', 'nnyFsZt5OKE', '95364100458', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('8684c188-3215-4c1b-9846-c11c3df59b96', null, 'e2vj1HduLuF', '01662779851', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('9d9d2dd9-2ea3-4f10-bd38-6876968b591e', '58358397127', 'EZkVMhC0TpD', '52217705881', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('b72bb4a9-e4b0-40f7-8012-590ab703a79a', null, 'xCMHeTkZuSU', '86248548678', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('6ff6f17a-15d9-4353-a68a-80be50ca4e4c', '14154962038', 'F2RyYhf0qEA', '10304847950', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('f6116e06-5f45-44c6-88a0-bc2cf42b2673', null, 'mdAzRTPjR71', '17742172369', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('03ab5e9a-0774-403b-8c22-1d1e274bd598', '86936093735', 'SRf03aVMaVU', '39603955143', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('ab594e31-80eb-45ad-8c63-47b3e9a42a5e', null, '1r2EQgAJBgl', '35258557057', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('9bf42c5e-6581-4be7-a895-5d6e772247dd', '50253168133', 'CQLDjg3Z6WV', '93897619395', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('94e3cc12-520b-455d-a8f6-a4de810996f0', null, 'Yf7BpAQO8Kz', '32966520345', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('6301b7a3-b1a2-47f5-95d2-93b0dc8128d7', '03986894514', 'tY2Sd4yA5qz', '27653456543', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('2e65984c-82ad-43d9-bb29-311f22d04ee4', null, 'mgA6wooga6D', '96699802685', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('a8f79346-f3b0-4cb3-8fba-5767808d60fc', '73703463914', 'WzQs4m1lLG8', '04478275476', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('604379f5-ff23-413a-85f6-68cf4065d57c', null, 'BfERQkeeAN8', '95646526130', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('799f1cec-893a-47c7-ba4e-c7b26304b379', '55904670132', 'vozAiZj5bRl', '55737219241', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('f1dd4a6f-dc5f-48fa-9ebf-4abc5e4e04f0', null, 'BmLMu5CqNJB', '02542360065', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('4ed9fbad-fe76-45ce-a744-17cc818278e5', '49983843825', 'RkEPZbaLnGq', '92577307458', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('31a582ab-867e-4de0-a76b-6f294d58c3b8', null, 'PxzBWDb4ppY', '60866639898', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('d1ef5e6d-aa31-45f1-bbe8-b13137b86e89', '96333892380', 'DmIxnGgLwjI', '83532308425', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('bec733bc-a840-469a-8621-9c98adea8b40', null, 'USIbZz6PVTW', '22835574170', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('9978f44d-bd39-441e-8c1f-0d4254e140a2', '62783001753', 'gRDckoakgVk', '06101567940', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('e9fe6a0d-59d6-4815-8622-5e910e6dd0f4', null, 'KvBKeCPGSKQ', '97141009587', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('2e050472-5314-4848-ba05-f1dbe479c633', '52420379900', 'V1Op9JXGAf8', '04927832682', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('da760136-b329-4351-a8d4-5c7d92068dca', null, 'lYoQaxvTHXt', '81582492331', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('68f0cf98-b8e7-4f21-9e00-024d04be19f1', '30212505759', 'pmSmZx4z1I9', '18053134940', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('f40e1d48-d98b-4ba3-b0be-2fc0faf604ca', null, 'sup8BuIzJlH', '87007548477', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('90a5a165-3ab7-40f8-8a77-d7f8e69eaa85', '17580740417', 'xZols81T6Tu', '21332463274', '1526611651', '1526611651');
INSERT INTO "public"."sys_user" VALUES ('c085cd63-04da-4a90-ac20-c95dd406e118', null, 'QxAQIYlqtNs', '20661489939', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('bb400861-59bb-4884-99a1-fbe5c2f922ab', '92728203949', 'J6fpMv1Uuge', '63199659619', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('51052923-0fc0-4e45-ae03-a0f223818264', null, 'ixAUOuh5mUh', '51333963378', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('4b244745-8250-48ac-9659-4b5fff49b8b1', '43133431051', 'l5DQDXBPDzK', '81967908901', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('c5194172-c13e-4da7-b178-71165509b8d0', null, 'opZZ2E4BvoP', '48972496089', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('e78f0e21-fd2b-4235-8860-320cbd1b2b7a', '43788265671', 'FIM8Yj6HxW2', '60161246296', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('3f3f7dbd-460e-4554-8d8e-3e6143b40cc1', null, 'uc6w2HKj5Wb', '62639299970', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('e15382f7-077a-4e00-ab48-05b523762376', '67026153347', 'ZSAZALDgsQw', '92704203434', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('caace491-954a-4dd7-b68a-f6ed792de62b', null, 'nUXIq68sqzP', '91024078740', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('8935cfc8-34da-4184-ba7d-ec828b98aba8', '15730114367', '0fVVbdLi1KO', '26385228174', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('a69ac961-23c1-4e77-9c00-17d9ce9033f8', null, 'XzGGVNYackY', '84655055544', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('aca69c32-5ca1-4a31-ac69-1b2405ae8976', '20206678095', 't2GCFB7GMPi', '21849199392', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('1899b16b-d1ed-48a6-a4d7-8b717d33ab60', null, '0IqB1aqi6nK', '41088185856', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('0530e264-eb78-4d4f-92e9-90de95938c97', '69054188150', '2Gh16iR9Jc2', '73974457759', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('bf14be3c-ef58-4e4d-9902-b0b935c6e02e', null, 'WPRfqorGimv', '31559305058', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('72497a28-9586-4600-afcd-50f49942d89f', '67695043902', 'ydYsVMOaGMx', '58962225845', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('47a78dd6-232c-4867-a42d-674517480369', null, 'm2MDmemTTCz', '46106429144', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('1c44ab44-e0fd-4c20-9651-e0f0818c5978', '09203507246', 'k7nmk7eUfnr', '89525740743', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('f8e39a7c-47b8-4bb8-a05d-6701bc9e3104', null, 'zRO3ere35bq', '56693548668', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('6b820c70-9ced-4c8a-a387-52ef01d589a7', '97357119481', 'sX6UKyPTLBh', '76280789969', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('a8901ba4-ad22-4ae7-9437-95856ab8d53e', null, 'SrCJipqMGR7', '70964792817', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('de8d17e6-c0f9-473b-8d96-1a2c04b7b8ea', '27285414687', 'eklAokmqgkM', '62173913976', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('3165412b-0ac2-492f-8575-2f6c2525f241', null, 'INH3TkMnlFw', '92241480833', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('c1c55738-6710-49ea-a043-54bb7ea6df76', '54015288328', 'LlS8cDiul8F', '50976652475', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('d8f760a6-50e6-4305-bd6d-863ba2be86b3', null, 'nrWiff9vwmY', '45991902755', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('ce753313-4526-4771-ad51-4134a5a7a0d7', '76699087235', 'Sc6kTcH8blT', '17019095471', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('d5521ffc-edcb-4c54-b408-62c57c745e56', null, '27oDpf8EFyS', '32859982228', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('4b78f1f1-cf6d-4b58-b794-10a16dbf73c4', '47700646727', 'pRbfuEXEBV3', '11803734231', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('afe99e1e-ab36-4bf6-bcd2-303bd6fbf3a2', null, 'PQ5lJIg2nZN', '99274716469', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('23e46882-ed9e-4843-8f42-416726eefd63', '81221498398', 'LF7yV6f6EEU', '32594097187', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('2580dd9f-8f07-4d36-977c-2c912fae7302', null, 'ZQ66X6qsXOc', '43716832598', '1526611652', '1526611652');
INSERT INTO "public"."sys_user" VALUES ('7c31459c-b56a-441e-89dc-ed16e17cae8b', '82687323884', 'v0t06rwFXkH', '12888283193', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('0724502a-7e7b-4bdd-9f78-9e9a25f5b247', null, 'XXaF0t1IVoN', '26057864088', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('4c6098ec-3c7a-4793-9ce0-c7b8f300595d', '75052628321', 'z1CEhOwayQZ', '15862824952', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('85b71f9b-ce54-4688-a0ee-afb96cd82347', null, 'zWKT5CvnXiE', '80999032441', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('a29646f4-2bf9-4352-b15e-f875b925f6ba', '21889744525', 'DAtsjSv6NIw', '99952308199', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('1e5e7d03-e969-43e7-b02c-d30d54279a3b', null, '4Z5gCiXE977', '79274444415', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('00a78571-1dea-4304-bc4e-eac9cd83e475', '36183197498', '6BgFFKhr3xg', '65255969880', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('1d3305b9-c3ca-40c4-bdef-1b99f0f63b30', null, 'qxiAT3dJ476', '61447111196', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('dbb20a11-21e3-4fe5-9914-76f35a1f310e', '17964643495', 'JY8UrcDSQ5y', '73166465340', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('5a5607c4-b3cd-412d-98af-edfe9dc27699', null, 'hR0UymJVBD8', '39915795896', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('c32275a6-3a93-48b1-a757-69338ede371b', '39188538616', '8gbBTcWwXB6', '69557676953', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('25a6baa8-2650-44cd-92e2-bec6dfec479c', null, 'kt9Mh1HzWkI', '98881925749', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('78b54329-b99b-467a-8590-b0faf59efa6d', '52952322148', 'OKirWBMFmtN', '49915118963', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('efaec473-5fcd-4254-83f9-05b152b17285', null, 'deBHPfPqTeC', '98188711141', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('a225031d-7429-44e8-8cb4-03d912bbf9bd', '23770313132', '9bNBKmR7DaK', '75594661926', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('012db83c-fc52-4d09-a65b-5183ed2f642e', null, 'kHDDGiWoZ37', '01248246416', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('239693ad-d00a-4880-b83f-2b58adc85eea', '67265889667', 'qHuKk3TQ1AM', '05404085163', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('20b26486-6138-4d53-aa0f-0cef5015cd19', null, 'Sz0SLXHT7Xk', '81423223134', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('2c98f475-fd37-4af0-87e3-7888ff41c401', '01641309547', 'gp54c8H505S', '11794955693', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('74882d6b-dc72-4f9e-8aea-056e36de5618', null, 'kLxnQ5GUFOe', '37515656580', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('1bc10474-d193-4a67-8f13-8e433fc8179c', '50734432169', 'w6NKmHHAgGC', '86099065029', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('5cbdc19e-bed8-4670-a552-fd981ad80547', null, 'kFYhVfc4rON', '31712583310', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('a3e9a6dd-e975-47d7-a211-66f801c0ac79', '31308981978', 'C6ZViWrjpg7', '40408256719', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('f9a2f4db-846d-4df6-a318-6ab0d66095aa', null, '2sqnIq5CCiU', '32193747826', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('f6403ad6-b1bf-4788-8ae9-5599237ae0cb', '49292092614', '7qI06CYWma6', '51090278768', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('106cdaeb-ae7a-4135-834c-6cec0dabefac', null, '4My5GmpUdL6', '18443159520', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('f0a57a1d-ad07-4444-8bdd-17d808132ed1', '20180530315', 'kFCpgrXho9V', '33189795300', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('5eb81410-7114-49ef-b6b9-359f6cb06dcb', null, 'qX8AMFzsbMT', '46072747978', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('69621331-1837-4de4-95f7-2fad8c6784ba', '80008285205', 'X3dIz2lUxZc', '13659838553', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('634fe89e-68bb-4635-abd4-e71f3cf72f8c', null, 'cN71QQbD2sh', '47652293532', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('c5b3d379-5a8e-4919-a379-fa89ac080c36', '26646647868', 'tHu10NEGGjo', '72925669153', '1526611653', '1526611653');
INSERT INTO "public"."sys_user" VALUES ('8475b0c6-1e7d-42cd-8b58-d36fe219a1a1', null, 'xsWk3AHvTtO', '86779301619', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('a2384429-b465-417b-b336-d78679e37d53', '94345576983', '0K6ZpPxtZyV', '79508591278', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('b7b35bb6-43f3-4d6b-beec-efd8dafc8d79', null, 'MygaQ0p1ZG2', '26325977182', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('d0642c55-1d7e-4db2-814f-f50bae5563ff', '27165673020', 'R50Ovc265Wr', '60478076165', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('132e5da5-315b-4c88-bfb4-c0093abaeb82', null, '6MCxKcoX12H', '56639864372', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('39323c3c-cf3f-4803-9d90-1893f3ffb0d4', '18732479685', '2dTEsENKK8s', '70498827438', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('fadf220f-379c-409b-ad24-e620213e3e14', null, 'JxXSJpFcSSS', '16868895761', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('0715b320-6cef-41cb-8bd4-712652256b29', '11653821741', '3sV17thnCAz', '55358175368', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('17b46ec7-4031-44da-abe6-68812f6e81d8', null, 'QxLVAksFhKj', '00740722486', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('3d1d6768-c233-4363-9928-605ce34fbeb6', '31030815385', 'QoweWg5iwvn', '88236501604', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('ae3118ef-e177-42ff-bf4a-d9ed867353d7', null, 'F4riu3o96Vs', '18212687144', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('853d7aff-1a03-41f9-bc5c-5f8d04a0a20a', '55432317866', '0xPbAFBJefu', '97111220738', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('5e912800-64b7-40a4-a8c7-92de14989ca8', null, 'zdCfVIqVwRl', '60499307594', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('d628024b-f7e4-42f5-ace2-0b66f43b5071', '30035895847', 'G3KXgUebJhv', '95813576172', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('f6a8c42d-9866-449f-bba7-d47cbeb1bbb2', null, 'Z7OIxboQrU8', '89978310490', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('b3854c82-b1e0-49ec-98c5-2629f4d3925d', '13634217673', 'RlUkzhf5Mm6', '18831716669', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('2623aefe-923e-4c63-b16a-d9409e49c53d', null, 'X3R4Hy3xSR2', '00086063326', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('674fd09b-33de-4a23-9169-93fa191441f0', '03906720517', 'JbIDTX6AtwP', '45107019234', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('7dfcfabe-f953-49c7-9a89-d9551ebbb2ae', null, 'gg64z9cyOjI', '60204238909', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('1a3707f7-232c-4bea-8a40-f60dc2d76e87', '19135807578', 'qSGFVMXUagu', '48469894084', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('1cd9979e-b6f3-415a-8f88-0ceae0be0445', null, 'DVJWHqykf5U', '42925846674', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('a8325c20-f5fb-4073-973c-d010c86dd0bd', '38870957503', 'DSAp6OwzqAf', '53913661223', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('13029314-389c-464f-8d86-d027356e504b', null, 'O2h3NXN4piT', '18618340603', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('540041a6-8c01-41fd-befa-7554462ec33d', '72630409911', 'dmYC8WpxDCp', '38432346570', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('7d533798-8fa5-42e0-ba10-dd1b0e16e60c', null, 'IqKQvaszmKN', '16333129825', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('e9e77038-c018-4b3a-8ef4-53e32582e2c0', '60597839294', '0iERmudvaHI', '50889038902', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('c233d0bb-0cc0-4756-b339-336089063588', null, '1tcejCbOh26', '08627593978', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('3f1847c8-4635-456e-80fa-9a344be55135', '89735706259', 'UJIncXNQ339', '98080640661', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('e3d536ff-08c5-43c8-99c2-f871d8d79548', null, 'DFpyCjuPzzb', '33162636567', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('d847e919-ab1b-4975-9c3b-15f55bb397d4', '22017014113', '6rxWUyS4a7l', '74333593696', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('3350ae66-2d64-4bc6-a210-ac6bcb07c840', null, 'wqUf9zIPfMj', '48942376158', '1526611654', '1526611654');
INSERT INTO "public"."sys_user" VALUES ('bc1867de-621e-4efe-847b-b6d494af526e', '81144654486', 'gDOxp2SLcCD', '08104813984', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('8c018954-fe05-4c5f-b459-38862bf001a6', null, 'FS6AI7dofdt', '60888897292', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('bc362ac1-23da-4ecd-8708-298a90ff5385', '74946733839', 'AlyhlsXa46E', '58173622849', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('6e429246-a9f6-4fad-9a25-fe2f9797dbd7', null, 'uCzVMqUYLZ2', '24316568783', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('2581a975-0558-4f86-8392-27236ef86cf7', '00201928858', 'TtAL3igRUwf', '35428054512', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('b3f64758-6623-4826-a614-00694355399e', null, 'hBNzgF4LBp0', '00953504817', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('2b9b8f3c-0936-4eaa-aa91-c58c707e66ed', '38311323735', '5BS2F8DjALt', '95066505258', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('14bf38c9-a9b4-49c0-92b4-c5f3172901b2', null, 'r5vgqbwjKR5', '43492765973', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('902fd31a-9ef9-41f4-a619-2ae8cefd43e8', '66402040636', 'CNmgcysHEip', '93675370809', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('2dec5a5c-d14a-4731-a362-b75cad01ea11', null, 'coALmzD9Gre', '95737041928', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('1daedee0-6e4c-4741-ba73-a43b60f31660', '08301666804', 'LTgtZG0xCcU', '25862654424', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('f2378813-f020-4475-94a7-92e141f2baf0', null, 'woKKcwYoXoh', '34262474991', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('a7f349c3-0680-405b-8011-84436b9c4fe6', '39140486908', 'N3ZL6AqgzPt', '67321636883', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('31f6b12e-d477-438d-8014-ec79bed9fd5e', null, '5GJ15shl5Ro', '29660792734', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('a2789759-69c3-4c29-9ab8-e3fa83a2262b', '22564066503', 'gVnHy2D0Dz1', '71195075813', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('ab9428a1-1910-4f1a-9171-ea3831d614de', null, 'MOfdzdPYMo0', '03343829245', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('27f3812c-a98a-45d4-a776-0dc9e4048e9b', '19509006980', 'Brdig8Q1BGn', '56989970591', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('aae5d112-a098-483e-a1fd-3181e85eb38f', null, 'smTDxkKm2ny', '12802646394', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('d81d06f4-2214-4338-9acd-09eedcd913ec', '33172076252', 'rM31IIxc14q', '82453930293', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('520f3811-6e26-4981-8460-bad1ca6d8afa', null, 'BVLYNxnfgzG', '31703977254', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('223f2011-7521-44ec-9ae0-42a809809780', '67858128748', 'qfq1W3VYuIu', '68128703396', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('354c6d39-2d05-4884-9d5c-1a6d4e32bbef', null, 'P2yn8K9R1Mo', '36716849251', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('8aae2616-e170-4aca-8f78-cdf8963a2580', '53285224497', 'qsxn1383rR2', '76043837927', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('716079ca-4824-4557-9e11-4cfb6f80eb30', null, 'QLWvehJyCKN', '73333050510', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('0b8ac197-d26f-41f4-bfb1-19fe4fac6809', '35939537901', 'OUWnC5MvKAv', '28237152216', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('3a719447-0725-4296-9aa9-c821719f09df', null, 'f2AqQgbNXtg', '43625074380', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('75d2006b-c597-4c68-89d4-fa80d1a1441b', '31610688005', 'F2SScjGZ7ST', '59093511387', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('c8447a88-4e9e-4f7d-8f0a-98644889aa09', null, 'wfVK3fSPBS3', '56002407470', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('67e67be0-6008-4c1f-81a9-f34f6a8cc60f', '09040062372', 'EUfcuTjJgHf', '38497763499', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('7536ebd3-0109-48b5-adef-015d4dd97e6e', null, 'FiJdHaCgims', '40829960843', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('ab263631-78b9-470a-99bf-c7491eb8b1ce', '84178259280', 'kyGSReOnVh9', '80060178975', '1526611655', '1526611655');
INSERT INTO "public"."sys_user" VALUES ('0a77a757-c698-4066-92b9-32798ce0ad6a', null, 'JSsQ2sfPjSv', '88721402961', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('b72040a7-cb13-4a6a-b206-05025220126c', '79039497179', '9rQEBWaJWcW', '88262934830', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('d6aa13e0-1dec-4c26-9a84-ca92ae0ec414', null, 'xOXuvSQkT0J', '01000453356', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('3bc97af7-d295-478c-8ba9-25e3f92732ee', '66409313235', 'y2Q9awDPtNG', '27701626260', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('46248f6a-c926-4815-b959-5880d9e0871f', null, '963mTzaCDnA', '50944785108', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('66676917-e7d0-4142-8ecf-c65daa69a4da', '12403200598', 'zUvb6Qvyyk1', '32623724135', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('05e14a38-ea65-470f-8ed7-6151fe4ab4f3', null, 'BxF2TQg0VJU', '30383533675', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('b331e4ba-095f-447b-b8ef-8bc2b98f42f5', '48795129063', 'CNnfiK9K9vk', '67523429080', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('39ebfd1e-f329-4b42-b88b-3371f37b7c71', null, 'unGDnxwLat8', '12483258265', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('97b7b000-6642-4ae3-8d1b-d457e65515dc', '02232842378', 'mCUJ3JiiuJL', '67428030523', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('507e2409-b3d5-4e24-997f-4397b5536fbc', null, 'NSLbfyuZ9QV', '90995462213', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('818e8f37-9c02-453f-9e54-aabec4e07589', '55995754778', 'I4K0iZqTht8', '63220492366', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('e985d017-91fe-4e27-81bb-b6d9cdf2ef95', null, 'oSfsXti8G4q', '07934350922', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('a4f3fa89-15c8-46c3-aef4-636df518a752', '19836372961', '5MU5zfH4zfw', '42970110355', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('d2ed76f6-d55b-4006-9948-ec401532c2a0', null, 'mpMfhQ6nVka', '80595893046', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('0a749d4c-54e4-4491-af89-a126ae882703', '58319174833', 'lXMpoeS4HkB', '63251018593', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('25bbecad-6e5a-457f-a401-e069842d3e69', null, 'e8yFdTGwk6E', '63214282015', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('ccdfce0e-aff5-4c83-94b1-d4e1469353ea', '31729333537', 'xsayYgJqsD1', '81935545917', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('bd365b7d-7970-4222-b851-b90b905bb9c0', null, 'cQ7sYmsrmtP', '27229314965', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('9400d0ee-4eae-4fde-aa0e-d0186c33aa21', '23522984196', 'YDNpvIyfIsq', '32729971833', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('4e92eabf-c576-4177-b8c6-b93af9c34f90', null, 'Cxo47xjU4lF', '75946297458', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('3f94d7f0-1a93-407a-aa80-708b5fcceca6', '02343188832', 'Nojw2x5VdtE', '08847425370', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('fe60ec86-13e2-4b88-b65f-265c0938831e', null, 'dK4CInaVmyX', '68797776014', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('4bdace5c-d6f5-4682-91c0-7de5b2269563', '15877495935', 'ssE3NNkmICP', '85179779556', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('fd9cbee6-aedf-4487-bd1d-22b81d819274', null, 'HjUCy5u8GYU', '36707608186', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('8e55c614-be88-41e0-ab53-aadc9b740a88', '13154505866', 'eWJLrQDa8YT', '30543100656', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('3b770dd5-ae63-41a2-b2ca-e7028e5d1929', null, 'wuk22cdrwqc', '91564853040', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('ce956877-331e-4dee-ba08-cad9bc1c4a0c', '53896364714', 'rpJAgIxDEKc', '83083685885', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('cd1ad19c-5f72-40d9-a95b-068af406c7dd', null, 'zpwOjfjlIlz', '22710916508', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('960295f6-cb10-4da3-b936-9697e7915e50', '57769054938', 'WNxcqH3ABbT', '84349553856', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('ce1e6aae-f273-4084-9a7e-7c82d8a44193', null, 'LVU2KLODnV6', '38485893226', '1526611656', '1526611656');
INSERT INTO "public"."sys_user" VALUES ('6c3f7f21-b5be-49b2-ba24-36bc8908b719', '75251174822', '9E9t5yVe12l', '71926049298', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('559e43d7-d152-4a73-9b14-129da480dee7', null, 'Jy8k1iS0Ysl', '30542676059', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('7d6f4e04-a241-41e2-8eda-65bf4c38443a', '83885788055', 'CEVUtbe7t0o', '96543511088', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('5c7084e2-b678-4b0e-a99f-f0cb9d56138c', null, 'SS0rNvLcEY9', '51220528077', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('e5821ab6-179b-4863-8e16-3d91e8a22b91', '99768986597', 'RcMJfsKbinr', '21839945578', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('99e14914-7f65-4b0d-abc6-0d488c13d2cf', null, 'lwd7BAvh6sO', '16513923745', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('67d6b5af-a424-45c5-8108-23f4741e29e6', '68715028332', 'nrlp167fE2Q', '99469646670', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('e01c5089-29f9-473b-a547-29d5d61dd4a2', null, 'FtJ6GjFvo0o', '38914104728', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('f1f3c4cb-0634-48c1-ae60-60f0a4e761a8', '63937916119', 'bbkTRrZMUcj', '73709081886', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('036a154b-536e-4a2c-86ea-d66272ea76b5', null, 'w8SlsMvaPNX', '42404185469', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('9bf954b3-a2f2-4ae2-ad3f-be6d38ac1574', '11553721500', '7NrDDkywobJ', '18875035052', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('d4d33feb-d7ec-4f5c-886d-d6a60592f121', null, 'Pvok9JSWf6n', '11177277348', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('3b834fd3-7dda-473e-83ea-a3d72278653e', '01444784614', 'qGyrOKUjvkB', '03835555328', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('5f49c4cf-909a-47a1-a317-b24f3b98c6a9', null, 'OKrLtYJ5rBv', '63669043438', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('c271038e-2f3b-4ebc-bd5a-bdd29b5c339d', '34186138009', 'zHaFK7isxBz', '45580237358', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('621b28eb-7a8e-4b53-bfb8-8e61ed798b0c', null, 'b0UDAzezPKK', '12949741073', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('6b9d39c0-e7fc-4376-8855-b8631735fb06', '15830001064', 'EWDjT3j2sae', '20975702737', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('ff71166c-8406-4d0f-9ef3-6cc7d719a372', null, 'zI64zNb2ceg', '43303825192', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('95b1acd9-fc26-4d84-9cd4-d533faeb98c9', '43050108484', '2EPy37BV045', '41302058439', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('bd0b3068-cfef-4448-b37e-ae7a7162fbe0', null, 'QRwy62F9USN', '67595867687', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('91f88a4b-7544-4e42-852e-403252b42a76', '89042621576', 'xZ12spyJdvU', '93787643875', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('718fb377-e177-472d-b5d3-0cc5b7d04ba9', null, 'zPYyhhRHuHu', '51712604753', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('929ef94c-5662-419e-bc2e-e1b707520144', '24267308515', 'jderM7PeFhn', '53255575467', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('719a3e7b-46cb-4cf9-8bf9-fd4a3af2c979', null, 'G9FFWjNn3ZD', '90693775813', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('018fd360-a55e-4ed9-a3fd-e6105dee8d43', '54550617620', 'ixR4o7d5X5V', '50567869944', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('e1b6a922-c3da-45fc-9f9e-c2ba0abe5663', null, 'Rt6A6Ridn9F', '06577546822', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('6b323000-a373-4533-97b7-6fa6420a4fd5', '85038591272', 'vcCFllg6FNP', '76954332463', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('61439f5f-2007-477b-9d6b-a0f637ddcdbc', null, 'vEc6P7wfPac', '84562742398', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('b0454789-c138-47dc-b7dc-65d595211188', '71373348388', 'hzhYX0kQZYe', '03657144189', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('81e964c7-b78e-4b22-a673-47b421e5e3aa', null, 'xBj5rlEsP5H', '92404372669', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('5cb7a233-b2bc-4e79-8958-c8042393975a', '44672304408', 'o346X2FwwYh', '61825554289', '1526611657', '1526611657');
INSERT INTO "public"."sys_user" VALUES ('c0988d59-5c89-4a9f-8eca-db9e72026e3d', null, 'EqImyoE3pIj', '41075768581', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('103d217f-ee4a-4d43-8a77-993e204d1522', '31959410451', '9im5AFqccIL', '07961384448', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('6fbdbb4b-f3da-4cac-b07f-b8b7ddb37ad0', null, 'sSKstrbEF94', '12505342586', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('f69e53d4-a9ab-45b3-b271-229795d1d79c', '51664392274', 'g4fdLOuezB5', '74687045525', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('983d5223-d6a3-41a0-a35b-5f3d860dc3a9', null, 'qtMC9pZI9TT', '70538590189', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('9c77be66-a60d-493d-8c05-9201711fa076', '79423773827', 'TuqvreOXDED', '12575573250', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('a12a9bee-ad00-498d-83f2-ec2ea081711e', null, 'YehH3B14bih', '37575495193', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('bdd0084d-e917-4f40-ae0b-2cf49f51e8bc', '64958257199', 'yQyxHcntFJM', '34845411804', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('ffd8fe44-df45-4f00-b1d9-73e740d8c52e', null, 'gFOdOpBjmKI', '93937663103', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('cb62ebb1-3522-41e0-b5a4-69a133eb3138', '98847185143', 'WtITDmMTg1p', '58839626801', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('7e07b295-e314-4ecc-93c7-67c160c6a5b3', null, '3yaHJxVgyQo', '36385105242', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('a943d19f-9901-4a4c-84a5-6d843540d3e7', '63420962624', 'kiBbKSrHbQk', '92066483016', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('082f8350-b4e3-4a36-9a50-1cd56440f7dd', null, 'F2xan5Y4uCY', '15701185370', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('818a373a-055a-4557-a1cc-0df723e0db4b', '82290527049', 'Ed7KPUcy4wF', '22248831158', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('1d6f3712-52c3-42c6-b775-e669c36dba86', null, 'P60otvEDpPo', '10105582480', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('c30deb23-b50d-4f6c-8824-0d0c41fd7cf9', '90467647071', 'sNOFyxbVZsH', '01642329031', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('d9846d1e-5605-4d4b-acf2-abd425eff8aa', null, '9n3juNFiENd', '73215013463', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('f7756fe4-9e0d-4d29-94f0-b5eb7e7e14aa', '42638954109', 'gVapyMpIxKU', '73170415729', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('3aeb38e1-11bf-46d2-a5f7-9689c698d663', null, 'ADgL7w2URhJ', '72615230892', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('189e8e64-bccc-472b-b741-0331779d50a5', '28502186579', 'cr3bN0B32GJ', '95292818029', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('5a84c497-0c0e-4631-ab0e-209dfe02ff0a', null, 'd9QBufvKMg2', '04471394382', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('e6cd1e9c-7635-4f6e-a9c2-18aac147514a', '71235277109', 'KWaGdiQdVZD', '10473094494', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('25afd997-c99b-45fb-81b4-60e27bc88d1a', null, 'L2c3yz8SHqd', '68045175100', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('e236057b-969e-4671-abc6-dd4115550a76', '92156368392', 'JT20YuwbN6G', '71413024066', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('8fee0353-dcd5-408c-9ccb-9bd84d02e0da', null, 'DxlTiswNYKP', '60918041260', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('3c112b9e-690e-48fc-8101-9515cf9e555e', '09194218367', 'xkKjnYjslwu', '07047844958', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('7f9b54b1-8f89-4d7c-adf5-fa07dac0024b', null, 'ihdoLtk6gbl', '84870851302', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('7c61e599-7f93-49c7-88a7-32518733f028', '98206264360', 'j3xIgJkwYP6', '55277906083', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('56ab7667-7d34-4f7d-96ac-8cd6dd9e429b', null, 'd5H09LGwPYD', '08966462621', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('1e11b062-da5b-4426-a445-6bfaf34770e2', '65878371656', 'LZv9OwC2Szc', '48019439528', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('ceda7931-6235-4e77-af04-a1f21512951b', null, 'JdSjpg8ImAW', '92243890964', '1526611658', '1526611658');
INSERT INTO "public"."sys_user" VALUES ('c9283bec-7d79-4f06-944d-761c2b54ad19', '63418459108', 'o7yhwf2etNX', '17556433762', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('7313bdf0-70f1-4c7e-b54f-74dd0d851b25', null, 'hZKTXd3Sx3i', '72177366408', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('79ae9611-bd6e-4702-9ca2-7bb6d85f4ccc', '44156614515', 'iNGKsSSWAJe', '10819527793', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('1752c9cd-d6a0-4fef-bda8-2ac83ae7538f', null, 'K7SsSm1dPSY', '28053034479', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('b5248390-97bc-4f2e-b6be-8362d14ec58f', '71333702062', 'YQT32OgFhWV', '39361687656', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('b079fe53-37eb-4b96-874e-2ec279e1b2ee', null, 'ILPkTBhRb1I', '53661761242', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('e05f4781-ea5b-4ee2-a1c5-a35a042cba8d', '57197679756', 'SkcfDR6K5EL', '67264699196', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('cd005a22-f638-474b-8004-b8e3f9059eda', null, '6JNHHzrR2oz', '87884033426', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('9b0abd96-4364-4919-9b2f-c0128971068a', '48522268184', 'W65xHn0QKQ5', '51157581134', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('4aaa3845-734a-4f50-a6a3-538cb48afc6b', null, 'x1nNr3HhzuN', '98760268841', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('10892b37-15c2-4252-8da8-251de3b4630d', '18184281486', 'AJ63f5kz4M9', '77184151496', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('05f9e54b-7791-4c4a-9898-cede0a74f75a', null, 'ocR9EAdh6b9', '67903484495', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('4e2eb944-9d16-4bee-b2e8-bcd3418104b6', '67928974244', 'm7Vm5p6o55s', '61682843298', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('f9d0f3aa-31f6-46bc-a410-064b1b9adc47', null, 'jS8zPmCZiuc', '05911491246', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('7a752d93-2364-4686-b4ea-c1ab7286b267', '80547685471', 'ynultkCFW5g', '46698066147', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('153bb2f0-9fa2-472e-b074-a24f74097f67', null, 'KRL6IDimpXD', '10675898736', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('40976679-4e8b-4bb2-b01b-081e12678d04', '76830018307', 'MbTlU2GaauX', '64038103733', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('07779b59-bf56-48c3-ad34-f5ba0d184cc4', null, 'prK44NlNgNW', '50765375892', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('24c07ab5-8929-4ad5-a943-08b0b69f0f18', '05147928326', 'P80H3KuYHK5', '90480315338', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('9918e22d-956c-47af-9699-8e0baf8f63f5', null, 'J9bW9hUNofy', '10442963591', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('03190b52-7a3a-46ea-adc2-313bebd69d30', '49121177720', 'VvGYAmQcB2Q', '05632210831', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('dd45e37e-d0f5-4501-89ee-4763fc7eac64', null, '7afcCBapMSk', '73475785857', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('d08d6112-ad0b-4b30-b182-fe8899d3abaa', '35573145434', 'OZsw2zPoo4y', '52715403719', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('87d1acbb-90dd-4837-8780-db734869145c', null, 'i6qWF7tjX18', '06054370673', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('92b91871-e821-4c8a-9a61-6f040425e5ae', '97876090694', 'UTbVOanQCap', '10922835940', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('c4295ef8-6e09-49bc-922c-1f0249a44f7e', null, '8vtXDjt8BOm', '78377212791', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('3d8959e8-e53f-4892-ab4c-8ee3a7d89e79', '02038058009', 'GJbUR9BUcud', '77373815730', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('6371a955-48a4-4202-879a-ae47b03cfa69', null, 'KBvbXmrEuZk', '09689160353', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('23fae268-4e6f-4b0c-acfe-14170609ba74', '20147845203', 'R0KL04n6Yxs', '61228827129', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('8a08f730-586b-42b8-996b-9335069e4c3e', null, 'mFsJFjLgOsw', '12006697545', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('f187b742-cadb-4eea-bbe4-3b2434355729', '73026835168', 'nP4EdmzE63J', '51179951640', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('7e29f97d-dc14-4843-a156-a336546afb10', null, 'ELRhRwUrBuD', '22914997351', '1526611659', '1526611659');
INSERT INTO "public"."sys_user" VALUES ('ca902763-52cd-48c7-87de-a46e1e6d19b0', '29148713252', 'ZjFWhPlgGEZ', '51679654010', '1526611660', '1526611660');
INSERT INTO "public"."sys_user" VALUES ('10dad122-7b73-42b1-8f3e-f8867447e9c6', null, 'CXwwV8LafwQ', '35875495417', '1526611660', '1526611660');
INSERT INTO "public"."sys_user" VALUES ('85119881-290d-47bf-9aca-876173b15798', '73747640371', 'F1VgzHfdC6Z', '21111030321', '1526611660', '1526611660');
INSERT INTO "public"."sys_user" VALUES ('fff0cab6-f6c3-42aa-85af-a58689f29a4e', null, 'ZvLjExh3jCl', '13251332261', '1526611660', '1526611660');
COMMIT;

-- ----------------------------
--  Table structure for sys_user_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_info";
CREATE TABLE "public"."sys_user_info" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"username" varchar(50) COLLATE "default",
	"sex" varchar COLLATE "default",
	"head_img_name" varchar(50) COLLATE "default",
	"signature" varchar(128) COLLATE "default",
	"address" varchar(255) COLLATE "default",
	"identity_front" varchar(50) COLLATE "default",
	"identity_back" varchar(50) COLLATE "default",
	"identity_upload_date" int8,
	"sys_user_id" varchar(128) COLLATE "default",
	"birth_date" int8
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."sys_user_info" OWNER TO "postgres";

COMMENT ON COLUMN "public"."sys_user_info"."identity_front" IS '身份证正面的图片名';
COMMENT ON COLUMN "public"."sys_user_info"."identity_back" IS '身份证背面的图片名';
COMMENT ON COLUMN "public"."sys_user_info"."identity_upload_date" IS '上传身份证时的日期';

-- ----------------------------
--  Records of sys_user_info
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_user_info" VALUES ('32fcffca-29e5-4841-993d-9166b828a616', null, '男', null, null, null, null, null, null, '1d7a14f2-1aa9-4581-8b85-194036b77f3e', null);
INSERT INTO "public"."sys_user_info" VALUES ('df2f8490-e2e8-4b92-8449-114997792798', null, '女', null, null, null, null, null, null, '5c76cdb0-9422-4537-ac83-0ba709425bab', null);
INSERT INTO "public"."sys_user_info" VALUES ('734d2e5f-98f0-4696-aed8-620df4daf44b', null, '男', null, null, null, null, null, null, '3cb1a0da-2581-41d0-98cb-f34d45e90148', null);
INSERT INTO "public"."sys_user_info" VALUES ('52669efd-6e9e-42b5-a88d-2ef6d2669a50', null, '女', null, null, null, null, null, null, 'aacf3077-b9e6-4f57-bfda-6dbbfe454e63', null);
INSERT INTO "public"."sys_user_info" VALUES ('e90847ea-ed10-4899-8ee3-6f7bbf777f4a', null, '男', null, null, null, null, null, null, 'e1be91bd-1510-4b3a-aad7-4632e6dac3ae', null);
INSERT INTO "public"."sys_user_info" VALUES ('aa80c8de-a8ba-46b7-a1ae-4a9fb9100481', null, '女', null, null, null, null, null, null, 'f9ee4c82-bb56-4cdf-b357-bc499281612c', null);
INSERT INTO "public"."sys_user_info" VALUES ('6875d386-cf33-4a9a-889a-128fb6dfbf11', null, '男', null, null, null, null, null, null, '92543369-1d63-4ea1-be6f-3ffc9c0eeba4', null);
INSERT INTO "public"."sys_user_info" VALUES ('bba0fac5-f743-49ff-b147-82b62d4099af', null, '女', null, null, null, null, null, null, '7c5cb37a-b4c1-4f8f-a60e-bb043fc4d723', null);
INSERT INTO "public"."sys_user_info" VALUES ('8b7697ca-3b06-45a9-a8cf-2e0c34e06117', null, '男', null, null, null, null, null, null, '8e8d8711-a4b0-4e36-90c2-caff828ef857', null);
INSERT INTO "public"."sys_user_info" VALUES ('d5582dfb-d56e-4e33-95ce-74ee26317b35', null, '女', null, null, null, null, null, null, '01704c33-85b9-4d43-a108-6fd27daaa932', null);
INSERT INTO "public"."sys_user_info" VALUES ('1380e126-b773-4890-8c8a-5921fac4de83', null, '男', null, null, null, null, null, null, '1d551627-b9e1-4722-a36c-7f358a247079', null);
INSERT INTO "public"."sys_user_info" VALUES ('8cc51267-43a9-42ec-8fb8-6b7db4e00e14', null, '女', null, null, null, null, null, null, 'f8d0b836-0cb0-4f5d-830e-5e1296a8d177', null);
INSERT INTO "public"."sys_user_info" VALUES ('1e4d7b12-7822-4795-b7cc-8896da82856b', null, '男', null, null, null, null, null, null, 'e64437e7-cbd1-4190-986e-54b5becdbae0', null);
INSERT INTO "public"."sys_user_info" VALUES ('17618180-1bfb-428b-8e52-85f2cce925df', null, '女', null, null, null, null, null, null, '5819e76e-757b-439e-a73c-a69a6524b4d5', null);
INSERT INTO "public"."sys_user_info" VALUES ('b93764b2-2454-454e-8af1-eb9e47aeda77', null, '男', null, null, null, null, null, null, 'f7c95856-6cd0-4559-a5fd-6b7b1ad511a8', null);
INSERT INTO "public"."sys_user_info" VALUES ('fc5fca0a-e237-492a-a752-0cd4cc7067e2', null, '女', null, null, null, null, null, null, '6b443a4e-9937-4cfc-af16-387807a616d3', null);
INSERT INTO "public"."sys_user_info" VALUES ('a106c8c6-bf41-49c3-826f-2ec1897d52d1', null, '男', null, null, null, null, null, null, '06c08e5d-92ad-42ef-bde3-93e169771bc5', null);
INSERT INTO "public"."sys_user_info" VALUES ('8899715a-e377-4c62-843e-eace7d36bf4c', null, '女', null, null, null, null, null, null, '9d2bc2ad-bf1b-4737-bc9e-4049f9782899', null);
INSERT INTO "public"."sys_user_info" VALUES ('2d4821af-db8e-41ef-9399-e1d458074fc2', null, '男', null, null, null, null, null, null, '219d4034-f1ef-4f27-a868-409a081f3288', null);
INSERT INTO "public"."sys_user_info" VALUES ('1dd9ff89-c875-4226-bf57-eb971f2b0a58', null, '女', null, null, null, null, null, null, '1eea14ab-c52d-46ab-b1d0-b8cd1da36b0d', null);
INSERT INTO "public"."sys_user_info" VALUES ('7883c084-5eb4-41bb-a7d1-a31544a6c5f6', null, '男', null, null, null, null, null, null, '5033e2c7-d3ad-4634-9a0f-77b58c6e9f2c', null);
INSERT INTO "public"."sys_user_info" VALUES ('0fe32dc1-f9c2-4ce9-aa40-9e3ce56513b3', null, '女', null, null, null, null, null, null, 'b4b595da-97d1-4185-b186-fb23a732b33b', null);
INSERT INTO "public"."sys_user_info" VALUES ('827fffa9-d998-4457-87db-231f1d96f087', null, '男', null, null, null, null, null, null, '029d744e-8037-4d90-ba24-d0c81afbc427', null);
INSERT INTO "public"."sys_user_info" VALUES ('ff4637cb-bc1d-4aa6-97d3-a8e379227cd3', null, '女', null, null, null, null, null, null, '01146da4-20e7-4e11-b06b-f902a50f74e6', null);
INSERT INTO "public"."sys_user_info" VALUES ('9dfa7ca5-74e0-42ed-aac9-acc2c835267e', null, '男', null, null, null, null, null, null, '28ca196a-73de-4d2d-9078-44a5d41595f4', null);
INSERT INTO "public"."sys_user_info" VALUES ('96753340-3250-4467-82df-7e52135d8675', null, '女', null, null, null, null, null, null, 'a6b4effb-6c66-42d1-830e-70e3ed54a810', null);
INSERT INTO "public"."sys_user_info" VALUES ('ce5d2590-460b-4cc7-8a29-26ea0e3159e4', null, '男', null, null, null, null, null, null, '86cd2fb9-9ab0-4f2b-89ef-ed6aa0ef8c8a', null);
INSERT INTO "public"."sys_user_info" VALUES ('c38ef0c0-8557-4527-a292-711b263e5afb', null, '女', null, null, null, null, null, null, '94f60963-413a-4e23-bd7a-41218e71663b', null);
INSERT INTO "public"."sys_user_info" VALUES ('c45d06d9-f58e-4c9b-9e2f-a9adc51002eb', null, '男', null, null, null, null, null, null, '479caabb-128a-41bd-a769-32bb231f62fe', null);
INSERT INTO "public"."sys_user_info" VALUES ('a09ce734-5d53-40d5-9b5d-85e6a9423cea', null, '女', null, null, null, null, null, null, 'aab5c253-d6e3-4078-99d3-503e3e88e592', null);
INSERT INTO "public"."sys_user_info" VALUES ('ead23bf1-844b-4c21-8a78-96f2c73bb7fc', null, '男', null, null, null, null, null, null, '9987a6ad-af9e-4e67-87ff-bb6671c619f0', null);
INSERT INTO "public"."sys_user_info" VALUES ('16151aeb-dd74-4592-8ffa-6a5e09bb4f49', null, '女', null, null, null, null, null, null, '4f1b3653-4b90-44de-bd76-d6d4c7b534ac', null);
INSERT INTO "public"."sys_user_info" VALUES ('87544e18-99c9-46b7-ab14-9ab59a83efcf', null, '男', null, null, null, null, null, null, 'f7a21139-3b3a-4ac6-8c09-d5513f4dd42c', null);
INSERT INTO "public"."sys_user_info" VALUES ('0c78a7c3-6885-40cd-be11-a86657ca6c19', null, '女', null, null, null, null, null, null, '34c4e670-3944-423c-935e-172fc5600713', null);
INSERT INTO "public"."sys_user_info" VALUES ('74d71f55-9863-4d51-934b-a98c8700a7cf', null, '男', null, null, null, null, null, null, '3fc27b1a-c23e-44c1-a5aa-b7cf786d6f68', null);
INSERT INTO "public"."sys_user_info" VALUES ('cf819bc4-5df2-450d-8231-53b916c4e1e9', null, '女', null, null, null, null, null, null, '8d103a5a-8202-4741-8760-be96858ddc8a', null);
INSERT INTO "public"."sys_user_info" VALUES ('f1b8a3aa-e91d-436b-9f31-3af18b201b00', null, '男', null, null, null, null, null, null, '0c8b6649-738c-4023-b057-f3651ae2fb8d', null);
INSERT INTO "public"."sys_user_info" VALUES ('e2ef58da-35e4-4149-b7b2-b17745202e1b', null, '女', null, null, null, null, null, null, 'e3039e7f-f95d-49db-a770-e504bfba0b4a', null);
INSERT INTO "public"."sys_user_info" VALUES ('caf35c1a-e2c7-43be-9b47-3a500fc63ca0', null, '男', null, null, null, null, null, null, '27afbcf2-5982-4c6a-8ae8-33005cd86b9f', null);
INSERT INTO "public"."sys_user_info" VALUES ('830e491e-f494-4f11-b2fd-71409baa0066', null, '女', null, null, null, null, null, null, 'b7070d09-0452-47e4-ae0f-b6a7e9b407c4', null);
INSERT INTO "public"."sys_user_info" VALUES ('262a3386-f21a-482d-9ac7-fdc9ca6354f9', null, '男', null, null, null, null, null, null, '535996b9-4180-4133-b9be-4357e623bad9', null);
INSERT INTO "public"."sys_user_info" VALUES ('2b2003cd-e776-4755-a84e-8bf5ad930d7d', null, '女', null, null, null, null, null, null, 'c824662d-1c06-418f-8f6a-cf37f6fe4099', null);
INSERT INTO "public"."sys_user_info" VALUES ('c73f2913-cf1b-4054-aded-8179baca0123', null, '男', null, null, null, null, null, null, '2aed958c-11b1-4ff2-898c-42c1ef4e6c5f', null);
INSERT INTO "public"."sys_user_info" VALUES ('6ace67d1-b2e7-45b8-9d19-74ac496b14c5', null, '女', null, null, null, null, null, null, '9dcc62e8-9573-496b-ae95-4c9ec47e7e04', null);
INSERT INTO "public"."sys_user_info" VALUES ('351e7939-4d3d-414b-8854-ae45b546d9a1', null, '男', null, null, null, null, null, null, '00fc2cff-9e23-4f1c-bf9c-eeaa25e24ed8', null);
INSERT INTO "public"."sys_user_info" VALUES ('eac7aa94-0143-4cc5-b2c0-4d3b344336e3', null, '女', null, null, null, null, null, null, '6f4aa21d-3be3-4223-9139-599775a5d117', null);
INSERT INTO "public"."sys_user_info" VALUES ('ca3d90d0-624d-4ffc-9e4b-497cd0e6790b', null, '男', null, null, null, null, null, null, 'b9a04921-3357-46ee-b89a-6a22b78567e0', null);
INSERT INTO "public"."sys_user_info" VALUES ('0675ca83-0aa0-4064-952d-d91b3866aab0', null, '女', null, null, null, null, null, null, '000c0f2b-5c6e-4c1b-ac05-2e49fcb1cdbc', null);
INSERT INTO "public"."sys_user_info" VALUES ('dc97db39-4dc2-4cc3-a76a-f05d378ce8fc', null, '男', null, null, null, null, null, null, '3e8cec22-91df-437e-9af0-d5c77b263a44', null);
INSERT INTO "public"."sys_user_info" VALUES ('89ee55ee-67a8-48a0-9dd7-e96f60b8ce27', null, '女', null, null, null, null, null, null, 'f9685eea-167d-4dd7-9b7d-1596b1148ca4', null);
INSERT INTO "public"."sys_user_info" VALUES ('2cc04a62-78d4-4f0c-92e5-305dcba6626b', null, '男', null, null, null, null, null, null, 'bf149c2f-d103-4d4f-9393-521f2c3761fb', null);
INSERT INTO "public"."sys_user_info" VALUES ('e0531b55-844f-491e-b549-1091fa2541a4', null, '女', null, null, null, null, null, null, 'dce7b6f8-62c9-481b-a89c-1914361bfd45', null);
INSERT INTO "public"."sys_user_info" VALUES ('ea17fa13-ef2f-4e8a-b660-3629e373a2e0', null, '男', null, null, null, null, null, null, 'bb1b31ac-4cb2-40ae-ac74-6707b14bd348', null);
INSERT INTO "public"."sys_user_info" VALUES ('762a2db5-bb3c-462b-a706-c8746787069e', null, '女', null, null, null, null, null, null, 'cdbea5a2-3e65-4afe-a742-7a6ad5be8669', null);
INSERT INTO "public"."sys_user_info" VALUES ('6a1e2d89-b377-4cd5-b5a6-77f82402046a', null, '男', null, null, null, null, null, null, 'd080da54-7ab9-47a7-ba39-c2e612441a19', null);
INSERT INTO "public"."sys_user_info" VALUES ('582c5194-07cc-476c-93f1-bd99d8ce6cfc', null, '女', null, null, null, null, null, null, 'e282998a-294e-41fa-bc67-b47ac6754d82', null);
INSERT INTO "public"."sys_user_info" VALUES ('8067f191-c1e2-497f-a2fc-3beb2550007d', null, '男', null, null, null, null, null, null, '2518f95b-f370-411e-b95c-a01a05eb70fc', null);
INSERT INTO "public"."sys_user_info" VALUES ('999e5032-90da-4a34-8c45-bf1bfa136384', null, '女', null, null, null, null, null, null, '1eb726f5-dcbe-42ed-b7d9-518d5965138a', null);
INSERT INTO "public"."sys_user_info" VALUES ('fc2e7649-6839-426e-b608-1aae4cacf2a7', null, '男', null, null, null, null, null, null, '46eca236-0071-48e7-b046-34056817506b', null);
INSERT INTO "public"."sys_user_info" VALUES ('868ab4ab-4f36-4fe9-a311-f09a6cf402c1', null, '女', null, null, null, null, null, null, '4aa41863-86c9-4930-936d-7921b94e060d', null);
INSERT INTO "public"."sys_user_info" VALUES ('ef9d1aa5-be8e-4973-8fc7-676eaecda62b', null, '男', null, null, null, null, null, null, '55482150-75b7-4366-8a48-b59e788c7aa4', null);
INSERT INTO "public"."sys_user_info" VALUES ('754f744c-5e25-46ca-a672-d1c1eca7b909', null, '女', null, null, null, null, null, null, 'b1d8c402-46b7-41b6-aaba-69d3269db2fd', null);
INSERT INTO "public"."sys_user_info" VALUES ('d9bb12b7-b6a2-4eb9-af8d-7ad75418639f', null, '男', null, null, null, null, null, null, 'db1e3e31-438a-4e16-b613-65bef8c43fce', null);
INSERT INTO "public"."sys_user_info" VALUES ('ef2956bd-f9e9-4c30-9b0d-ccfd75b78ee6', null, '女', null, null, null, null, null, null, 'fa28c28f-3177-4783-b465-c5f8303449c2', null);
INSERT INTO "public"."sys_user_info" VALUES ('8b5d8102-2f25-46e3-bf94-b7e73760c569', null, '男', null, null, null, null, null, null, '6208f485-2702-4032-b984-d0dece0b6c31', null);
INSERT INTO "public"."sys_user_info" VALUES ('d02c8f06-42a9-4ccc-a245-f87078c9ac12', null, '女', null, null, null, null, null, null, '4ac8acbc-3a71-4041-93e3-3f45c7ec12bc', null);
INSERT INTO "public"."sys_user_info" VALUES ('ba19766f-05b0-411b-84b0-e83c48431c2f', null, '男', null, null, null, null, null, null, 'cf9afeba-d154-4dec-8c93-c1edb0508c20', null);
INSERT INTO "public"."sys_user_info" VALUES ('bb78f07f-e6e3-48fb-a1fe-4a41dc143c0a', null, '女', null, null, null, null, null, null, '6f6cffe1-f114-4049-b912-23f072de0b42', null);
INSERT INTO "public"."sys_user_info" VALUES ('f10fbc2a-75be-4071-8caf-6e1c9677ea48', null, '男', null, null, null, null, null, null, 'c5729401-da5f-4e53-85b4-2f13a7a9c108', null);
INSERT INTO "public"."sys_user_info" VALUES ('67fd5462-0e06-4d8e-aa29-63742c781388', null, '女', null, null, null, null, null, null, '50434f6a-92b1-448e-b3f3-46d22c5ce46a', null);
INSERT INTO "public"."sys_user_info" VALUES ('c6276be0-bf27-4ac1-aee2-dcf05f79ae0c', null, '男', null, null, null, null, null, null, '503a3a3c-88a1-47cd-a0cc-fb830e7cf939', null);
INSERT INTO "public"."sys_user_info" VALUES ('f7121997-b32f-43ad-8cf3-6182d8fd771c', null, '女', null, null, null, null, null, null, 'e353a2c5-7620-4ace-bac2-ddd84a7d7038', null);
INSERT INTO "public"."sys_user_info" VALUES ('154cb235-231b-49ce-b83b-30b80a0094e7', null, '男', null, null, null, null, null, null, '62bd5137-2fe0-4df9-80df-c58ef9ea5477', null);
INSERT INTO "public"."sys_user_info" VALUES ('c5b9a883-ae36-4ef9-a3ec-aae56f9f9a3c', null, '女', null, null, null, null, null, null, 'e92635da-5813-46ab-acd1-8ceb822fae3c', null);
INSERT INTO "public"."sys_user_info" VALUES ('1a9f007e-fe8e-444f-afd2-81eb7652daab', null, '男', null, null, null, null, null, null, 'b9c7b256-837d-4168-80d8-ba117af61347', null);
INSERT INTO "public"."sys_user_info" VALUES ('26684e80-1eb1-4d11-8409-dfa384c65293', null, '女', null, null, null, null, null, null, '0738dd84-0fd4-4643-bf55-cf3213fe3206', null);
INSERT INTO "public"."sys_user_info" VALUES ('424e1096-94c5-4f4e-a925-cfc2daf848e4', null, '男', null, null, null, null, null, null, '0cc784dd-3ae9-4861-98c1-3b94cda3fa37', null);
INSERT INTO "public"."sys_user_info" VALUES ('c3f3acb8-2f76-480a-90c1-5e30197b44d1', null, '女', null, null, null, null, null, null, '6091ba45-e249-43ba-b0df-8319e07cca1b', null);
INSERT INTO "public"."sys_user_info" VALUES ('1642f758-1e08-4ac0-8beb-b5cf6a586917', null, '男', null, null, null, null, null, null, 'a5143ccc-80d9-4761-ad03-5a31b192a52a', null);
INSERT INTO "public"."sys_user_info" VALUES ('82cc82d9-4fb8-48c1-a2e0-d8065eff86cf', null, '女', null, null, null, null, null, null, 'fe88b49c-c44b-4ce4-8716-f34d5e0c57c1', null);
INSERT INTO "public"."sys_user_info" VALUES ('f10c45c3-8800-4992-b876-8051a581cc28', null, '男', null, null, null, null, null, null, '17d3ab44-08dc-472a-9ff1-1df707779089', null);
INSERT INTO "public"."sys_user_info" VALUES ('aea40639-65e9-4eec-8103-04c1ce678808', null, '女', null, null, null, null, null, null, 'e83152dd-3e2f-4025-845d-3343e1876cc1', null);
INSERT INTO "public"."sys_user_info" VALUES ('470716e3-c38d-410b-b441-c75fad2f00ab', null, '男', null, null, null, null, null, null, '32494f8a-bcdf-4bf3-91c9-f639033c8145', null);
INSERT INTO "public"."sys_user_info" VALUES ('df1455d8-7b62-4a51-9808-bbe3bfecff17', null, '女', null, null, null, null, null, null, '378572b7-8974-4fd5-a4fd-fc2bc2954099', null);
INSERT INTO "public"."sys_user_info" VALUES ('02617953-1e33-4524-b9d7-ac33e5d1e441', null, '男', null, null, null, null, null, null, 'd7c9414d-d4f4-4f8f-b76f-35f67f3d1251', null);
INSERT INTO "public"."sys_user_info" VALUES ('9f502721-56d7-4a42-9736-fb05a8289825', null, '女', null, null, null, null, null, null, '1c5485fc-50bc-44cd-a2f2-ff265db75c4a', null);
INSERT INTO "public"."sys_user_info" VALUES ('aee84149-cacd-4dc6-b528-a0a53fa6015a', null, '男', null, null, null, null, null, null, 'c2ed8bed-7aff-44a4-9cf3-944414219993', null);
INSERT INTO "public"."sys_user_info" VALUES ('5fd3552b-0a30-4dc2-a05d-c99794eeae6d', null, '女', null, null, null, null, null, null, '66090ec1-10c7-45d1-bf8a-ed3a86b9cb9f', null);
INSERT INTO "public"."sys_user_info" VALUES ('cf966ce0-f1e8-4acb-833c-f7b5027a4ea9', null, '男', null, null, null, null, null, null, '8722b325-1fb7-4481-b957-11a5260c44cb', null);
INSERT INTO "public"."sys_user_info" VALUES ('3c9d5ea3-d30f-4a2c-ae8a-2b117c37079c', null, '女', null, null, null, null, null, null, '81fde213-d29a-4eed-bbb9-9d1257112ef9', null);
INSERT INTO "public"."sys_user_info" VALUES ('8db8889f-35a3-4c8d-93ae-4f9f3a3b49be', null, '男', null, null, null, null, null, null, 'e442d815-07fc-411d-8683-c22151718d5f', null);
INSERT INTO "public"."sys_user_info" VALUES ('ba13a599-808b-4ee8-974f-2ee5a8f2b9c3', null, '女', null, null, null, null, null, null, 'b740ba4a-dbb6-4d30-ad7f-6e65876d7463', null);
INSERT INTO "public"."sys_user_info" VALUES ('5653344a-da71-48df-a176-9591b6310b44', null, '男', null, null, null, null, null, null, '69536761-7373-4e7e-8846-e4d826e7cb25', null);
INSERT INTO "public"."sys_user_info" VALUES ('f5d32d7f-f554-4b9c-808b-3b37b423cfbd', null, '女', null, null, null, null, null, null, 'bcc4c3f9-17c5-4576-b3e0-061b12625fb8', null);
INSERT INTO "public"."sys_user_info" VALUES ('26a81e09-14fa-4539-945b-199fedea54e3', null, '男', null, null, null, null, null, null, 'f1ea3587-486f-477e-97b9-c5d0c84b13e2', null);
INSERT INTO "public"."sys_user_info" VALUES ('051e7925-5d55-422e-893a-2cbad2050b23', null, '女', null, null, null, null, null, null, 'b99fd1f1-d748-42b9-9470-6199a0b840a5', null);
INSERT INTO "public"."sys_user_info" VALUES ('ff0505c0-dfea-4c3c-85ae-6895da75610f', null, '男', null, null, null, null, null, null, 'e3b0c9d5-3ecb-43e5-9ccb-477fe63e7a53', null);
INSERT INTO "public"."sys_user_info" VALUES ('d6a020c5-b70d-4cc4-baf0-57d331b2595c', null, '女', null, null, null, null, null, null, '70c5d134-dedb-4dab-8093-1a0de1c1610e', null);
INSERT INTO "public"."sys_user_info" VALUES ('82f469a8-421c-4ce8-9b41-345ffdf643a2', null, '男', null, null, null, null, null, null, '84a9b1c4-0574-4d47-aa24-f57142b00cb0', null);
INSERT INTO "public"."sys_user_info" VALUES ('1b307964-1fba-41a3-b203-7c91e3100dde', null, '女', null, null, null, null, null, null, 'e67b1306-dd04-441d-bcd8-3a5df30368cd', null);
INSERT INTO "public"."sys_user_info" VALUES ('b2065f37-6a17-437e-bcc8-7c19900f81c7', null, '男', null, null, null, null, null, null, '0e2dbff3-7981-4684-a195-ae6a7cfaa20b', null);
INSERT INTO "public"."sys_user_info" VALUES ('53cbba57-e7cf-415b-b3b8-f50505bbf936', null, '女', null, null, null, null, null, null, 'cf983cda-03fa-4edf-a6bb-a7c3638b9943', null);
INSERT INTO "public"."sys_user_info" VALUES ('5628b18d-f8af-4450-87bc-f226b50e6040', null, '男', null, null, null, null, null, null, 'ebd7c7d0-334c-4217-8950-5f8f1988d09b', null);
INSERT INTO "public"."sys_user_info" VALUES ('8c330c7c-6f26-4c89-aa7c-20d973f0b3c1', null, '女', null, null, null, null, null, null, '0f1eabb2-5532-448a-a736-e971b03452b7', null);
INSERT INTO "public"."sys_user_info" VALUES ('b1489c57-8d67-4d3c-86ed-0922e271e947', null, '男', null, null, null, null, null, null, 'a9448684-5d4d-4dfc-99f0-9ec083c8f506', null);
INSERT INTO "public"."sys_user_info" VALUES ('e80025df-bfd1-460b-b23a-a9b69dc89889', null, '女', null, null, null, null, null, null, 'c1472813-1f3c-45e4-8308-4823e16a5508', null);
INSERT INTO "public"."sys_user_info" VALUES ('73c63be0-4752-49d7-b3c8-93a7a468a828', null, '男', null, null, null, null, null, null, '40268d6c-ae3f-41e0-a6fb-6a30d03d9a66', null);
INSERT INTO "public"."sys_user_info" VALUES ('1b19d461-3866-4b78-b9c9-ee83319fec6b', null, '女', null, null, null, null, null, null, '1eef4e60-a707-4953-b1c9-a0ed2310df4d', null);
INSERT INTO "public"."sys_user_info" VALUES ('fbe25f9e-4a42-476d-8f1d-c388e318be4d', null, '男', null, null, null, null, null, null, '66a0f54f-de6e-4f29-ae75-0f9815cbaf0f', null);
INSERT INTO "public"."sys_user_info" VALUES ('dcc71461-7799-4653-bb79-078108e74759', null, '女', null, null, null, null, null, null, 'a8c1af5c-992e-4172-9ecd-5950c03cc8aa', null);
INSERT INTO "public"."sys_user_info" VALUES ('8552cfd7-fd0f-43ce-99e9-0007bc3a0f3a', null, '男', null, null, null, null, null, null, '57bf73d0-4c6f-46d6-b792-6a7bc443e17f', null);
INSERT INTO "public"."sys_user_info" VALUES ('d5d7f864-d61e-41d4-820f-4e389aab5a87', null, '女', null, null, null, null, null, null, 'efffa098-5454-458e-98d5-cae7cced65c3', null);
INSERT INTO "public"."sys_user_info" VALUES ('9177c8c6-2be3-4493-95bd-fbd32bd56b98', null, '男', null, null, null, null, null, null, 'b21d21cf-1baf-4e82-bb03-05b2de811a25', null);
INSERT INTO "public"."sys_user_info" VALUES ('e5eeacf1-0966-4389-a90b-4cf50868da0d', null, '女', null, null, null, null, null, null, '550696b3-475b-4735-81f0-be5aa99d7a30', null);
INSERT INTO "public"."sys_user_info" VALUES ('5c68ae5f-ddf7-434b-b036-e637557a727f', null, '男', null, null, null, null, null, null, 'b8e02ca2-ed08-4f4f-ba01-701f399aaf48', null);
INSERT INTO "public"."sys_user_info" VALUES ('f72f0af0-4ee1-4ce5-a3b9-14dd31effbbd', null, '女', null, null, null, null, null, null, '7e8eb827-ef80-413f-a423-7a6532cd7e7c', null);
INSERT INTO "public"."sys_user_info" VALUES ('b2f4465f-67a9-4e67-a9d4-930568f512ca', null, '男', null, null, null, null, null, null, 'cb1af5cb-8ed6-4cf9-bbe7-be98534860e3', null);
INSERT INTO "public"."sys_user_info" VALUES ('2115a2dc-e3ed-40b7-ad98-0337bff4feaa', null, '女', null, null, null, null, null, null, 'f36bcf6e-22b5-4953-9a4c-a8c15eb520f1', null);
INSERT INTO "public"."sys_user_info" VALUES ('1c9b2dbd-bbc5-47e1-998a-cb42df2e1a20', null, '男', null, null, null, null, null, null, '122da872-92af-4325-904c-53dabdde90d1', null);
INSERT INTO "public"."sys_user_info" VALUES ('56fd3914-c0f8-4679-b495-47519fa9277a', null, '女', null, null, null, null, null, null, '448ba0c8-7f0d-4aa1-88b5-e96d391b00eb', null);
INSERT INTO "public"."sys_user_info" VALUES ('70ea4aa0-0f21-4176-a751-3a14dcc25aa8', null, '男', null, null, null, null, null, null, 'a598dc04-0360-450a-98c5-36dc3b7debfe', null);
INSERT INTO "public"."sys_user_info" VALUES ('bdaefe6c-d866-4083-8eb3-dabdd5de6924', null, '女', null, null, null, null, null, null, '1810248f-9604-43c1-8cd8-3cc7140237eb', null);
INSERT INTO "public"."sys_user_info" VALUES ('2aea88a5-4ebe-4a8c-9680-8d6c0c0f49d4', null, '男', null, null, null, null, null, null, 'd4f5f78f-6cad-4c5e-8221-55a29859ae1d', null);
INSERT INTO "public"."sys_user_info" VALUES ('f1ebf461-608a-4222-975c-4318e24d0b42', null, '女', null, null, null, null, null, null, 'f17aa76e-bc20-4a48-978c-fa55ba0e594d', null);
INSERT INTO "public"."sys_user_info" VALUES ('0dfa95f0-4bd7-49f5-b7a4-68f16bd658e9', null, '男', null, null, null, null, null, null, '7b71a862-7f37-41dc-bcb2-f7c0ae23496e', null);
INSERT INTO "public"."sys_user_info" VALUES ('acd59bcb-ff70-4f1b-9ff2-d0c044a5c891', null, '女', null, null, null, null, null, null, '241cf562-63f8-4ee1-ab6d-02f44b448f9e', null);
INSERT INTO "public"."sys_user_info" VALUES ('512d34ab-44b3-4a10-a79b-672a637e6382', null, '男', null, null, null, null, null, null, '24c52ced-a222-434e-9ddc-7bbb039928d9', null);
INSERT INTO "public"."sys_user_info" VALUES ('ee7a8fc1-1b1a-4dc6-897b-5051ce441f3a', null, '女', null, null, null, null, null, null, '2d00a4a2-6457-4ab8-9397-f54e3802a541', null);
INSERT INTO "public"."sys_user_info" VALUES ('68080d07-e50a-4615-9662-b5522cd27bad', null, '男', null, null, null, null, null, null, 'fae8fef5-3efc-4029-9f68-8653cba18b97', null);
INSERT INTO "public"."sys_user_info" VALUES ('bb230165-ffdc-4286-8ea9-0bede0cdc563', null, '女', null, null, null, null, null, null, '7521ef3e-35e8-4976-a6dd-1eadc7f2b578', null);
INSERT INTO "public"."sys_user_info" VALUES ('4c4384fa-80e9-439d-824c-6a40fa950b5b', null, '男', null, null, null, null, null, null, '50378eeb-ead3-4c17-9749-0df2e6f407ef', null);
INSERT INTO "public"."sys_user_info" VALUES ('d4867afd-0ec1-4ae5-b4bd-3295daf62050', null, '女', null, null, null, null, null, null, 'ec0b2666-c098-416c-9164-e9fd6263407b', null);
INSERT INTO "public"."sys_user_info" VALUES ('af73edc0-8cd5-4882-9609-287fb219b8ef', null, '男', null, null, null, null, null, null, 'f88ab6bd-2160-4a17-a718-865ed8e45446', null);
INSERT INTO "public"."sys_user_info" VALUES ('5b8da5f5-43dc-4e13-beab-863237740f7b', null, '女', null, null, null, null, null, null, 'b7bdf6cc-658f-4121-8b03-dc358ebda96b', null);
INSERT INTO "public"."sys_user_info" VALUES ('46aaa397-38ea-4721-910c-f958b9176523', null, '男', null, null, null, null, null, null, '6f0f80ff-f121-44f5-9622-2299badd3f96', null);
INSERT INTO "public"."sys_user_info" VALUES ('65f73014-62ea-4817-8236-0201a36df4b9', null, '女', null, null, null, null, null, null, 'f8006f56-33e2-4cde-90c5-16b5f51004f4', null);
INSERT INTO "public"."sys_user_info" VALUES ('49416aa3-13ee-4a90-8066-91483fb65c70', null, '男', null, null, null, null, null, null, '858b2410-0bf2-4f2f-ba4a-3520568ac252', null);
INSERT INTO "public"."sys_user_info" VALUES ('d40bd8d4-19ca-4a66-8903-f5a849cc6209', null, '女', null, null, null, null, null, null, '3321154c-54fa-4c02-b093-04cf70648b4c', null);
INSERT INTO "public"."sys_user_info" VALUES ('806858d5-9663-41f4-ae07-b1354d663217', null, '男', null, null, null, null, null, null, 'aab83436-e565-4f09-bc1c-846c7c8459cc', null);
INSERT INTO "public"."sys_user_info" VALUES ('e152504d-ccd8-40fe-97d9-fe629735a11b', null, '女', null, null, null, null, null, null, 'cc5fb29c-938b-496c-b234-b4f9ebc9f299', null);
INSERT INTO "public"."sys_user_info" VALUES ('8fac8526-57e4-4018-834c-49320cdb8f66', null, '男', null, null, null, null, null, null, '9ff4a16d-0632-4c36-9537-c7fb229aedce', null);
INSERT INTO "public"."sys_user_info" VALUES ('c0258d54-2ba6-49ee-8657-b01905e38f9e', null, '女', null, null, null, null, null, null, '1970f21e-c7f1-4e85-bc11-ca4f1d944aca', null);
INSERT INTO "public"."sys_user_info" VALUES ('7610ebf3-d737-4ec3-a569-ab2d102cff08', null, '男', null, null, null, null, null, null, '26db7424-247d-4290-90d4-2488b5b988ef', null);
INSERT INTO "public"."sys_user_info" VALUES ('ed472e7a-1b61-4c23-afc2-fd6440cebb60', null, '女', null, null, null, null, null, null, '4a7e9ac9-9339-41e7-9b40-9ee891ddf6f2', null);
INSERT INTO "public"."sys_user_info" VALUES ('b987d077-7429-4c8c-8612-12da94b86b8a', null, '男', null, null, null, null, null, null, '88c0164b-945a-4043-8b4d-8e5629e17af3', null);
INSERT INTO "public"."sys_user_info" VALUES ('afec44f1-b368-4fb4-ae30-1f678904ad05', null, '女', null, null, null, null, null, null, '41d48a74-ed87-4c61-8ba1-67bc3b090a09', null);
INSERT INTO "public"."sys_user_info" VALUES ('c806d81e-1f2a-4e00-9363-e7b78de22bba', null, '男', null, null, null, null, null, null, 'cde857c8-ffd9-4dc3-b2f2-b461d4f15ee1', null);
INSERT INTO "public"."sys_user_info" VALUES ('220c8c69-ea3a-48cd-a7b9-9736003debce', null, '女', null, null, null, null, null, null, '33fa28b4-9d13-4d96-98d1-955c801fd69f', null);
INSERT INTO "public"."sys_user_info" VALUES ('86284713-2e59-4c5f-97c6-7dd587d3ecce', null, '男', null, null, null, null, null, null, '87bb9b0a-983b-4791-b346-ee7826d18d0f', null);
INSERT INTO "public"."sys_user_info" VALUES ('987d59e7-a2bc-4fb4-b9a6-dcacc2948a1b', null, '女', null, null, null, null, null, null, '037e5256-68a9-4423-80f0-e0dcd0729f46', null);
INSERT INTO "public"."sys_user_info" VALUES ('972fab13-215f-43a5-b720-8508c8f7338d', null, '男', null, null, null, null, null, null, '4f7870c6-7a55-46fa-a561-a0fab3dda008', null);
INSERT INTO "public"."sys_user_info" VALUES ('a6821a0a-a0f6-4b54-907b-8800d9e493ed', null, '女', null, null, null, null, null, null, '9936b04f-1ac2-49e3-a30b-1b848fdab4d2', null);
INSERT INTO "public"."sys_user_info" VALUES ('515038a4-3245-407f-8ec0-3ae4e1f1e175', null, '男', null, null, null, null, null, null, '7f10abd2-51d7-4970-b163-c4c9cbe73bcc', null);
INSERT INTO "public"."sys_user_info" VALUES ('a7fad837-158c-4f26-a911-d696f86efe5b', null, '女', null, null, null, null, null, null, '2364c42b-89ba-4cd3-a448-a1526ad26f70', null);
INSERT INTO "public"."sys_user_info" VALUES ('c7679791-3244-4cdb-aa75-6b29bf0f8d08', null, '男', null, null, null, null, null, null, '5ecf6ecd-798b-43ed-a03f-59e6930a2b61', null);
INSERT INTO "public"."sys_user_info" VALUES ('e7b1f15b-3704-4758-bf48-ade955e5f6ff', null, '女', null, null, null, null, null, null, '48229d74-4cea-4348-9c31-d8f0707de415', null);
INSERT INTO "public"."sys_user_info" VALUES ('33eb520c-4ee4-4128-b7de-33f05be8e926', null, '男', null, null, null, null, null, null, '01a2b632-44da-4723-a396-4137a8b0d77a', null);
INSERT INTO "public"."sys_user_info" VALUES ('fb9d2be2-1447-47b4-942b-c97757a97682', null, '女', null, null, null, null, null, null, '21afb588-67b1-49da-b038-67440821caa4', null);
INSERT INTO "public"."sys_user_info" VALUES ('67ae223a-0ee5-45f2-aa00-75903cc6d837', null, '男', null, null, null, null, null, null, '51f8b718-d2fb-459c-9de6-feface763189', null);
INSERT INTO "public"."sys_user_info" VALUES ('80a44b2b-f197-4b62-8585-aa322ec558c6', null, '女', null, null, null, null, null, null, 'd32fc0cc-1ba9-4239-95b3-467195ae83ff', null);
INSERT INTO "public"."sys_user_info" VALUES ('a421c1ee-4bd2-4a64-a459-c348774ce01d', null, '男', null, null, null, null, null, null, 'c7a30309-a125-4fcd-8a3e-44526d0c447b', null);
INSERT INTO "public"."sys_user_info" VALUES ('1863f18e-1605-4833-8918-8ee900397753', null, '女', null, null, null, null, null, null, '90050a30-4f0d-40c2-8ad5-c935ed498fcb', null);
INSERT INTO "public"."sys_user_info" VALUES ('f2ede0ae-eb82-45fa-90dd-643932a4f620', null, '男', null, null, null, null, null, null, '568ebc46-3b1c-48a2-a24a-a6abc86575a8', null);
INSERT INTO "public"."sys_user_info" VALUES ('14331f27-840f-4e7c-8bce-6f3fbaba8359', null, '女', null, null, null, null, null, null, 'dcc34638-7702-4fb0-b845-e954ee75afd2', null);
INSERT INTO "public"."sys_user_info" VALUES ('792474f1-b0a7-4c6a-bf6f-e8ee74969542', null, '男', null, null, null, null, null, null, 'cc5ece2d-fad2-451b-9eef-e47e803ccc35', null);
INSERT INTO "public"."sys_user_info" VALUES ('8bd2b1df-78f2-47c8-b218-1156a46d42b9', null, '女', null, null, null, null, null, null, 'f081a1bb-3063-4c21-821a-81813c55d43b', null);
INSERT INTO "public"."sys_user_info" VALUES ('f5fa6c92-77f9-420b-8156-ac688584c269', null, '男', null, null, null, null, null, null, '44608377-b250-4089-a986-e1c27939757f', null);
INSERT INTO "public"."sys_user_info" VALUES ('a04cbdf5-7b37-4ada-bf0f-0a20d9d66c9a', null, '女', null, null, null, null, null, null, '852fac40-d829-487a-b73b-6961719e67f4', null);
INSERT INTO "public"."sys_user_info" VALUES ('f5240b6a-dfbb-4736-a907-8beb3d5a48d8', null, '男', null, null, null, null, null, null, '46d8b4f1-e95e-415c-b8de-19735c697948', null);
INSERT INTO "public"."sys_user_info" VALUES ('b964e118-fcab-4d3b-bf4d-f448f6902fc4', null, '女', null, null, null, null, null, null, '5ce4bfd1-362b-4082-af11-24ef476c8aca', null);
INSERT INTO "public"."sys_user_info" VALUES ('6a88bb6b-0990-4a45-96f5-95f0c7054d5f', null, '男', null, null, null, null, null, null, '48f3348a-65dd-4d44-8e63-6b03475c2acb', null);
INSERT INTO "public"."sys_user_info" VALUES ('43a54cc3-a7f4-47a3-b043-1759183dd838', null, '女', null, null, null, null, null, null, 'be2d53f7-c108-4468-bb94-85fcb2ea59a9', null);
INSERT INTO "public"."sys_user_info" VALUES ('3ea217a2-fa4c-4c71-a469-9d2f0455527b', null, '男', null, null, null, null, null, null, 'd9b85183-e078-4083-b4ff-9f6d9e725d68', null);
INSERT INTO "public"."sys_user_info" VALUES ('3d6dcba0-d871-4bae-b9a8-6b987be3a5f3', null, '女', null, null, null, null, null, null, '98e561df-a276-48c5-aea6-af2991a28668', null);
INSERT INTO "public"."sys_user_info" VALUES ('3ceb6d21-f90e-481b-802a-5745a1719186', null, '男', null, null, null, null, null, null, 'bf574f94-db9c-44d7-b63b-0e611a471a1f', null);
INSERT INTO "public"."sys_user_info" VALUES ('02042ba0-f462-4dd9-ab81-c9ab1c5e1cbc', null, '女', null, null, null, null, null, null, 'b905bea0-1407-41b3-8c2a-041f5e9efaac', null);
INSERT INTO "public"."sys_user_info" VALUES ('83f7abff-6b72-415c-95ac-78f6bbc0fd12', null, '男', null, null, null, null, null, null, 'b4b89665-3493-409b-a0c4-e89caa62c03b', null);
INSERT INTO "public"."sys_user_info" VALUES ('f52ab47b-532f-42d3-accb-a84506cdb870', null, '女', null, null, null, null, null, null, 'baa7348e-ad4f-4027-8fe7-d0b94f3c0ac6', null);
INSERT INTO "public"."sys_user_info" VALUES ('ec42500f-20dd-47e0-b6eb-6272d703d262', null, '男', null, null, null, null, null, null, '1bf4a4b5-d22a-45c1-863c-08cb4db72cd4', null);
INSERT INTO "public"."sys_user_info" VALUES ('e2944b87-0871-4795-bc15-5e3230b55b6c', null, '女', null, null, null, null, null, null, '6d9cada9-4a98-408a-9d68-8aaa9c477aba', null);
INSERT INTO "public"."sys_user_info" VALUES ('0a3bb33c-ea0f-4616-81b6-1797aa1a970d', null, '男', null, null, null, null, null, null, '7bd4d400-9893-4fbc-b74a-5c656defc767', null);
INSERT INTO "public"."sys_user_info" VALUES ('ade432d3-2685-4b6e-848f-b7821f9e52d8', null, '女', null, null, null, null, null, null, 'b386e12f-e31d-4e41-b15a-9b4eee30230f', null);
INSERT INTO "public"."sys_user_info" VALUES ('3545eed6-d97f-42ef-ab34-12be48995a6d', null, '男', null, null, null, null, null, null, 'a0357c29-5000-488a-a0c9-6b24fb5b9981', null);
INSERT INTO "public"."sys_user_info" VALUES ('802251c0-5008-4694-8d2c-b0e29d6872fc', null, '女', null, null, null, null, null, null, 'b51f17a0-b0b9-447b-9fe5-c2916df884ae', null);
INSERT INTO "public"."sys_user_info" VALUES ('655e794e-de4c-480c-8ed8-5821bd5ce593', null, '男', null, null, null, null, null, null, 'f486b2ba-5e06-464b-9148-d90041cb4972', null);
INSERT INTO "public"."sys_user_info" VALUES ('fc8251ce-1684-4b02-b3d3-8894b926f573', null, '女', null, null, null, null, null, null, '34d5a7ea-7a6b-4df8-998b-a7f577b5f687', null);
INSERT INTO "public"."sys_user_info" VALUES ('729a2df2-62aa-4b1b-88d5-ec308ec8f2d4', null, '男', null, null, null, null, null, null, '55efe28d-60bd-419b-8229-27e59623f086', null);
INSERT INTO "public"."sys_user_info" VALUES ('95a9446b-b11c-4c30-af67-1aa1dae66292', null, '女', null, null, null, null, null, null, 'edd48160-c57d-4aa2-b20b-e5cebc7c829e', null);
INSERT INTO "public"."sys_user_info" VALUES ('85c125fb-a1ec-489e-bd52-3280d60f5433', null, '男', null, null, null, null, null, null, 'f3e88626-c0b2-4a2e-b41a-041f15836625', null);
INSERT INTO "public"."sys_user_info" VALUES ('6443e083-8687-4fe2-b16d-d51fbdddcadf', null, '女', null, null, null, null, null, null, 'c59288f8-4b9c-4433-9b1c-0b05af100d10', null);
INSERT INTO "public"."sys_user_info" VALUES ('660bffd0-2eae-434d-afdb-97da8b21db66', null, '男', null, null, null, null, null, null, '09a0e7f1-8552-468e-8064-5296eef8b107', null);
INSERT INTO "public"."sys_user_info" VALUES ('c2015aca-da4b-4269-a9de-9328a46c7792', null, '女', null, null, null, null, null, null, 'f9eb5e0c-0531-41af-8dda-e3bc724a2842', null);
INSERT INTO "public"."sys_user_info" VALUES ('6b395a16-f0b1-4064-912c-3a10067396bd', null, '男', null, null, null, null, null, null, 'd77640c3-bebe-4cb2-a31e-67a30442726c', null);
INSERT INTO "public"."sys_user_info" VALUES ('c6643fca-2b4b-4fa7-b94d-4a90016b9723', null, '女', null, null, null, null, null, null, 'd92108de-90b9-4fcc-80e7-303460dd527d', null);
INSERT INTO "public"."sys_user_info" VALUES ('6f8c25f8-b474-433e-aeb8-a14c9aec00b1', null, '男', null, null, null, null, null, null, '927f6fd3-4bab-4866-bcae-83a497d91ad0', null);
INSERT INTO "public"."sys_user_info" VALUES ('4228b58d-fe9a-4532-a04c-394e58813a63', null, '女', null, null, null, null, null, null, '59f43c41-eeef-4aa4-8f3d-46751059844a', null);
INSERT INTO "public"."sys_user_info" VALUES ('147be968-17be-4dd8-aa81-a9c8c7e6b191', null, '男', null, null, null, null, null, null, '78bbb6b6-e345-4cc7-89b7-9abcd158a01b', null);
INSERT INTO "public"."sys_user_info" VALUES ('f006779c-bef3-4b6c-867b-2a7238cd9aa0', null, '女', null, null, null, null, null, null, '6c894d52-24f3-4aa5-9f4c-0eab39ead01e', null);
INSERT INTO "public"."sys_user_info" VALUES ('f457cbbf-0bbc-477f-b2a4-38fb3cc1e5ba', null, '男', null, null, null, null, null, null, '9cd14c80-f3ca-4233-83d8-e79f01002c3a', null);
INSERT INTO "public"."sys_user_info" VALUES ('0b278ca8-801d-4638-84cb-8809336fb76a', null, '女', null, null, null, null, null, null, '54b9dbd9-d6f8-46da-ab31-68ae0195c50b', null);
INSERT INTO "public"."sys_user_info" VALUES ('5c55ab0b-ffe5-4e21-9ee5-4e8c366d2f4b', null, '男', null, null, null, null, null, null, 'fe7fed36-0cdc-4346-9666-3e7da38493fa', null);
INSERT INTO "public"."sys_user_info" VALUES ('e7af92e2-80a0-407e-8f24-377b02153dc2', null, '女', null, null, null, null, null, null, '303e6e22-ac35-4c0f-bbec-3fcaff301daa', null);
INSERT INTO "public"."sys_user_info" VALUES ('332a8756-3801-4828-966b-5c981b364114', null, '男', null, null, null, null, null, null, '06427eac-4a97-47dc-bf18-cccd3d158022', null);
INSERT INTO "public"."sys_user_info" VALUES ('b160719b-a552-489c-96c1-ec77c2869616', null, '女', null, null, null, null, null, null, '503c4a47-ecba-4e7d-a807-1d3ca5d92bbb', null);
INSERT INTO "public"."sys_user_info" VALUES ('47d10914-dea5-4d4d-b5dd-0e39b2a16daf', null, '男', null, null, null, null, null, null, '0225316f-d6fb-457a-a5ba-2a0f64f97d4b', null);
INSERT INTO "public"."sys_user_info" VALUES ('b02c1e66-e4d9-402d-8571-b074a631fa62', null, '女', null, null, null, null, null, null, 'bf69ff6a-6768-41b6-b9b1-f98e96b3ed23', null);
INSERT INTO "public"."sys_user_info" VALUES ('4b56ff2a-7d24-4949-821e-7c88d2d03502', null, '男', null, null, null, null, null, null, 'f730aad0-161c-4fbc-bd45-a5c1f945eb88', null);
INSERT INTO "public"."sys_user_info" VALUES ('a4c6ce11-2a17-4a8a-879d-b59e0bb9d17e', null, '女', null, null, null, null, null, null, '32c99e23-1eb0-4387-abbd-88275dcd0fa6', null);
INSERT INTO "public"."sys_user_info" VALUES ('c3b667f0-9f40-462d-b45e-4d9dc541ef73', null, '男', null, null, null, null, null, null, '39200afb-372e-4a35-9aa6-3cef3615de91', null);
INSERT INTO "public"."sys_user_info" VALUES ('8f96a5a9-9447-47e8-8627-106561aa6556', null, '女', null, null, null, null, null, null, 'e9c551b0-109a-4637-9e57-96cef4c81592', null);
INSERT INTO "public"."sys_user_info" VALUES ('78384d38-4e38-477a-824f-175b0fc78f1a', null, '男', null, null, null, null, null, null, '465885b1-4964-4622-8f72-5b69cfaa5b21', null);
INSERT INTO "public"."sys_user_info" VALUES ('19774851-6b61-4b32-b579-759e3e566000', null, '女', null, null, null, null, null, null, '35f83f15-0e00-4394-a504-f62dade49448', null);
INSERT INTO "public"."sys_user_info" VALUES ('e322093e-1146-4ec6-8972-54050ffb6011', null, '男', null, null, null, null, null, null, '7311f98d-5511-4143-9d06-3f4c021bb7ca', null);
INSERT INTO "public"."sys_user_info" VALUES ('2c15e881-dd4d-4330-b210-d614e0fb6f72', null, '女', null, null, null, null, null, null, '2c5e05ea-6066-463f-bbd7-fa0d136fcdaa', null);
INSERT INTO "public"."sys_user_info" VALUES ('280ba1f0-07fc-4775-b5b4-a49a78fc4684', null, '男', null, null, null, null, null, null, 'abfa2be1-dde6-43cb-ae5d-bc4aa54b33e0', null);
INSERT INTO "public"."sys_user_info" VALUES ('2e0edf2a-ab0e-406a-83ca-0c58002df156', null, '女', null, null, null, null, null, null, '206e59b9-6b0b-40a5-a405-ebecd2c161b6', null);
INSERT INTO "public"."sys_user_info" VALUES ('7f869639-78c1-4828-a5dc-dcfcc73c3675', null, '男', null, null, null, null, null, null, '96f8a8d0-7234-4586-b6cd-f691f9343563', null);
INSERT INTO "public"."sys_user_info" VALUES ('204251e6-93f4-4930-ba8a-63419eea8607', null, '女', null, null, null, null, null, null, '0a0b4155-c7ba-4d03-90ff-74e3af33750d', null);
INSERT INTO "public"."sys_user_info" VALUES ('e35ac38f-d306-4d60-8cf1-0b09e5af8e03', null, '男', null, null, null, null, null, null, 'd1903cec-8b23-4cd1-838f-91bb4cb3c988', null);
INSERT INTO "public"."sys_user_info" VALUES ('d4e53efa-0dd4-4af8-8c95-9df4bd9337bf', null, '女', null, null, null, null, null, null, '08affe1a-5bcd-4f5a-8be2-7beb746c454a', null);
INSERT INTO "public"."sys_user_info" VALUES ('ac9c3f19-92ff-42ce-9a77-607767de7258', null, '男', null, null, null, null, null, null, '119274d8-4c4c-40cf-96c4-cb0be7f4ef08', null);
INSERT INTO "public"."sys_user_info" VALUES ('ab836605-616c-4f92-905f-60c4a8baaf4a', null, '女', null, null, null, null, null, null, '77cb3fc2-11b6-403f-8f15-9f555a879832', null);
INSERT INTO "public"."sys_user_info" VALUES ('d4ecc6ec-a2ee-49be-b290-8939cadeea3a', null, '男', null, null, null, null, null, null, '5f4ecfb4-8604-43a1-807c-1b9c60083abe', null);
INSERT INTO "public"."sys_user_info" VALUES ('e5074c9b-2188-4d5e-9105-234946b2a16a', null, '女', null, null, null, null, null, null, '6256b8d0-93f1-416c-a49c-eb45fd73f181', null);
INSERT INTO "public"."sys_user_info" VALUES ('9053c5f7-2eab-454f-bc5c-b5a69cec5217', null, '男', null, null, null, null, null, null, '0915d28c-a84b-4eb5-9d2f-43dc2fff405d', null);
INSERT INTO "public"."sys_user_info" VALUES ('b21948c3-d878-44ff-ae61-d22edc26db4c', null, '女', null, null, null, null, null, null, '9b40236d-ed22-47b1-af20-7cda4ad83b75', null);
INSERT INTO "public"."sys_user_info" VALUES ('e51c7d2d-4f0c-4072-adbe-9dc5c0671f3b', null, '男', null, null, null, null, null, null, '8677bedb-d092-4b2a-827d-ef35b7a1748a', null);
INSERT INTO "public"."sys_user_info" VALUES ('d6dbcf5f-f203-4929-84fc-f3ee470ca188', null, '女', null, null, null, null, null, null, 'bf78288e-e9f4-4834-a915-8c7ed2d7a07f', null);
INSERT INTO "public"."sys_user_info" VALUES ('f37277d2-360d-4ab6-993f-cc6d1523b4b1', null, '男', null, null, null, null, null, null, '0da70074-5fcd-45e0-a1a3-016506eb220c', null);
INSERT INTO "public"."sys_user_info" VALUES ('f7f6521a-5e0f-43ae-a855-079c460d3711', null, '女', null, null, null, null, null, null, '74c3d79e-031e-4bb4-8e55-6c20c517e6f0', null);
INSERT INTO "public"."sys_user_info" VALUES ('c33c0dae-a282-48fb-a126-17532883168b', null, '男', null, null, null, null, null, null, 'dd219120-0fef-4bda-80fd-6adb9a3b9b2c', null);
INSERT INTO "public"."sys_user_info" VALUES ('2f409aca-cdfe-4ac7-b6ac-ee244f3d48e9', null, '女', null, null, null, null, null, null, '2cb561d8-7fb7-4a18-a468-e062a544e1d3', null);
INSERT INTO "public"."sys_user_info" VALUES ('47620ba0-87ea-4887-b6c5-588ed805d5be', null, '男', null, null, null, null, null, null, '8a8e5be4-6030-4b69-a3a4-e092179ea54f', null);
INSERT INTO "public"."sys_user_info" VALUES ('d0dc1e57-9421-4534-9168-047d85ce2b68', null, '女', null, null, null, null, null, null, 'af387461-3d15-4cb5-8822-a5fc89c3b201', null);
INSERT INTO "public"."sys_user_info" VALUES ('99511af7-a8cc-4833-a1f5-09330e295771', null, '男', null, null, null, null, null, null, 'd8ea3a62-99f3-44cd-954d-706c048ca94b', null);
INSERT INTO "public"."sys_user_info" VALUES ('cdb16e05-85a1-4f88-ad6c-54ca711f6be3', null, '女', null, null, null, null, null, null, '60351701-dade-475b-83a9-02fa9a1dbf22', null);
INSERT INTO "public"."sys_user_info" VALUES ('a455d686-52e3-4189-a7d9-ae82e9a04454', null, '男', null, null, null, null, null, null, 'e2b137f9-b1c7-46a1-8416-5a179a3c9e9a', null);
INSERT INTO "public"."sys_user_info" VALUES ('d1a6f1d9-76ed-433b-ac0c-8b6fa4b86947', null, '女', null, null, null, null, null, null, '3909aec5-26c1-4300-b9db-68adb53b468c', null);
INSERT INTO "public"."sys_user_info" VALUES ('11beb89a-6a8b-4c6f-9770-a33fa7178259', null, '男', null, null, null, null, null, null, 'bb35571b-600c-42ee-a17d-5a20692448ea', null);
INSERT INTO "public"."sys_user_info" VALUES ('23de3631-48e1-4a2e-8924-a2096be329ad', null, '女', null, null, null, null, null, null, '49b62496-ea5f-4d72-9dc3-9762ec6beeb9', null);
INSERT INTO "public"."sys_user_info" VALUES ('12dcb38f-8fe8-4013-8b53-25bcb8fad9b5', null, '男', null, null, null, null, null, null, '46a6a5e5-c735-44c4-a444-1869a94c8677', null);
INSERT INTO "public"."sys_user_info" VALUES ('96fd8263-ce50-42f8-ad9a-4f66686cc6b5', null, '女', null, null, null, null, null, null, '5d055af0-2229-4e63-a0d5-892201710624', null);
INSERT INTO "public"."sys_user_info" VALUES ('ab4ae84f-b8b0-4b24-b184-ffb6d85e3653', null, '男', null, null, null, null, null, null, '59e14f5e-c0df-4f29-86e3-33c2845adb04', null);
INSERT INTO "public"."sys_user_info" VALUES ('b6b7bfd8-b4cb-4363-b8bd-e63d2665c0bd', null, '女', null, null, null, null, null, null, '73e8910f-9495-4130-99f9-ca2ce1ca5946', null);
INSERT INTO "public"."sys_user_info" VALUES ('92e85f93-930c-43f3-8fb1-869a118f7e79', null, '男', null, null, null, null, null, null, 'bcdba95f-7900-421a-9d1c-3c712bdf2e2f', null);
INSERT INTO "public"."sys_user_info" VALUES ('21cce8f9-c530-424b-a08f-53e5426241bf', null, '女', null, null, null, null, null, null, '1b60e192-c26a-478b-a381-1dc37b694ab5', null);
INSERT INTO "public"."sys_user_info" VALUES ('ea0d064e-0234-4d6a-baac-753f63475da4', null, '男', null, null, null, null, null, null, '5db9419d-1454-4c44-ab6d-620662d22c0f', null);
INSERT INTO "public"."sys_user_info" VALUES ('58180c82-6fb4-4644-a0b5-7be2435e2879', null, '女', null, null, null, null, null, null, '67838fc1-4257-4f41-80a0-b3e43bbcc094', null);
INSERT INTO "public"."sys_user_info" VALUES ('a51b571e-eca7-4350-87e6-6c2cf1460036', null, '男', null, null, null, null, null, null, '6b976a67-de04-4120-9b5f-20facd801a37', null);
INSERT INTO "public"."sys_user_info" VALUES ('0db38432-f181-42f4-891d-d56152add8ef', null, '女', null, null, null, null, null, null, '57d71f14-15df-4eee-8662-bfd27dc6e6df', null);
INSERT INTO "public"."sys_user_info" VALUES ('2275913c-3de3-46d4-971e-25535aa9b192', null, '男', null, null, null, null, null, null, 'd4dd3dcc-a724-4a78-ae8e-204b6fa9622c', null);
INSERT INTO "public"."sys_user_info" VALUES ('530d2608-d7c6-472b-bc8b-2193f748cc95', null, '女', null, null, null, null, null, null, '575dd40c-abb7-4ec9-be9f-2a7a4d47d121', null);
INSERT INTO "public"."sys_user_info" VALUES ('16d6bea9-2f21-4c55-9cae-a117a0438be2', null, '男', null, null, null, null, null, null, '561175e8-4d9f-40a2-936b-00012f22b2a0', null);
INSERT INTO "public"."sys_user_info" VALUES ('4eb11faf-5fd3-4b1b-b6c0-f8b2dae658e9', null, '女', null, null, null, null, null, null, '93f13917-353e-4547-a0bf-0b442a3486e5', null);
INSERT INTO "public"."sys_user_info" VALUES ('e238baf9-bda8-48dc-95ff-5e8be55e3867', null, '男', null, null, null, null, null, null, '6241f5e8-1c28-4cd7-a7ad-b42362eb0a8a', null);
INSERT INTO "public"."sys_user_info" VALUES ('4cd1393f-3716-4ae8-b2ab-2d23d4ae4910', null, '女', null, null, null, null, null, null, '8d9c1fe0-174a-4a4e-b00f-e4a15bb59315', null);
INSERT INTO "public"."sys_user_info" VALUES ('d7248eed-d279-4e49-81df-93c5975a7a0f', null, '男', null, null, null, null, null, null, '8d7b1236-7bbb-4572-bc78-14dc4045c901', null);
INSERT INTO "public"."sys_user_info" VALUES ('e1e12b0b-a324-48bb-abd2-6f45a5f8dbcf', null, '女', null, null, null, null, null, null, '64621455-bda9-4e99-a821-8e7c0f82288f', null);
INSERT INTO "public"."sys_user_info" VALUES ('34400ec7-2fb0-4773-9013-d8b846993aa2', null, '男', null, null, null, null, null, null, '2cbe2ea3-9584-45e9-b0c3-50b3c3001bd5', null);
INSERT INTO "public"."sys_user_info" VALUES ('0ad7b507-f25e-4ee2-93e6-2d37d5e376af', null, '女', null, null, null, null, null, null, 'd7db6668-f583-4a8b-b558-4aa0e5d0f7c9', null);
INSERT INTO "public"."sys_user_info" VALUES ('970041bd-7b92-4cef-a15f-f4d20e32ee8b', null, '男', null, null, null, null, null, null, 'eb7925b6-19db-4e2c-85cb-fd3256695e5d', null);
INSERT INTO "public"."sys_user_info" VALUES ('33b9aac4-c1ec-4951-8ff8-4460a36ceaca', null, '女', null, null, null, null, null, null, 'fffb69c8-86e1-46fb-ab1e-770632d5aa65', null);
INSERT INTO "public"."sys_user_info" VALUES ('3dc74eb8-548d-45b1-a1b9-24b9e5814465', null, '男', null, null, null, null, null, null, 'ad06d8b8-b51e-40d3-a95a-4531d887d10a', null);
INSERT INTO "public"."sys_user_info" VALUES ('b718eec3-c757-47cd-ac6c-eaf9f455566e', null, '女', null, null, null, null, null, null, '7f039062-65d0-4461-ac1d-4908468c5d79', null);
INSERT INTO "public"."sys_user_info" VALUES ('849f51e1-cf18-4ca5-9548-94d2db5f3d4f', null, '男', null, null, null, null, null, null, 'ba2fdf41-1b99-40ad-bda6-498a04d5d092', null);
INSERT INTO "public"."sys_user_info" VALUES ('1d6ce7ff-dfd4-4e67-b462-80accf6b86d9', null, '女', null, null, null, null, null, null, '7bb2c270-6e58-4aef-9a12-622d49bfd592', null);
INSERT INTO "public"."sys_user_info" VALUES ('08769f2f-7a3c-4483-81b7-3735e6d42daf', null, '男', null, null, null, null, null, null, 'fbe9321f-694b-4f29-bcf2-7875ba889921', null);
INSERT INTO "public"."sys_user_info" VALUES ('1c728557-dc34-46cb-926c-8f99108ed5e6', null, '女', null, null, null, null, null, null, '5552e417-87b0-44ac-a7ac-8b792b80a477', null);
INSERT INTO "public"."sys_user_info" VALUES ('8383455e-8e67-4b49-b4b3-ed0817b511dc', null, '男', null, null, null, null, null, null, 'ae7a46d4-7119-4997-ace4-54629e20f285', null);
INSERT INTO "public"."sys_user_info" VALUES ('b458db31-4b91-42b0-9f44-65e4d10124b4', null, '女', null, null, null, null, null, null, 'd3b1a294-6f01-4e04-9b20-81368168d819', null);
INSERT INTO "public"."sys_user_info" VALUES ('62a82b9a-a109-4e53-943e-f23b17053cea', null, '男', null, null, null, null, null, null, '4862b1ca-1ffa-4db4-a3cd-236bbf0a27be', null);
INSERT INTO "public"."sys_user_info" VALUES ('06abcae4-2c01-45f7-8054-26883125ed00', null, '女', null, null, null, null, null, null, 'b9bf4a50-a3da-424f-abd6-c925e2704246', null);
INSERT INTO "public"."sys_user_info" VALUES ('2ac1e549-4783-4181-aab2-6e6d915220db', null, '男', null, null, null, null, null, null, 'f6df1659-5104-4816-817f-291290001bbf', null);
INSERT INTO "public"."sys_user_info" VALUES ('cfe970fe-ec83-4033-b196-5053c3a5cc7d', null, '女', null, null, null, null, null, null, '6ec795e6-81d0-4102-99a1-1a23121cf257', null);
INSERT INTO "public"."sys_user_info" VALUES ('57cb5596-d575-49d7-ac4b-60bbcd5b22c0', null, '男', null, null, null, null, null, null, 'a73508ee-f1e7-4fea-870f-70c666cc458d', null);
INSERT INTO "public"."sys_user_info" VALUES ('c566dbba-dddb-4af4-96de-21ee43fb3d9c', null, '女', null, null, null, null, null, null, 'fa269be5-b071-400f-8e93-23b877a5f72f', null);
INSERT INTO "public"."sys_user_info" VALUES ('b7ac31e7-1529-4a98-b3be-b08d6d4c2b36', null, '男', null, null, null, null, null, null, '1b472ca2-ed8e-4988-8677-e73da37f4200', null);
INSERT INTO "public"."sys_user_info" VALUES ('d871d0d1-b198-4062-9663-89d45d2c8f87', null, '女', null, null, null, null, null, null, '54d29fc3-e6e4-412c-a778-1a3a04187da4', null);
INSERT INTO "public"."sys_user_info" VALUES ('e6d049fd-a812-4412-9fbd-ac7a200f04a8', null, '男', null, null, null, null, null, null, '36a7c418-428d-48b1-9290-8dc5cc6e4859', null);
INSERT INTO "public"."sys_user_info" VALUES ('c18c43d6-0fba-4ea9-a104-a383b98f75a6', null, '女', null, null, null, null, null, null, '1ccc2de3-aae9-4be7-95ce-13a16ff148a7', null);
INSERT INTO "public"."sys_user_info" VALUES ('feab76d6-4fa2-4593-84eb-25248555cb38', null, '男', null, null, null, null, null, null, '70a8b8b9-e742-495d-b492-1f57ca92410a', null);
INSERT INTO "public"."sys_user_info" VALUES ('ef3ef5af-26cc-4258-9d74-b7a3dcfde9ba', null, '女', null, null, null, null, null, null, '2cc5092d-6b09-4341-b54a-409c4d39806a', null);
INSERT INTO "public"."sys_user_info" VALUES ('02bed46e-62ff-4046-bb0e-af3bdef4ea1f', null, '男', null, null, null, null, null, null, 'ad5d394d-25d0-4f5f-b09e-c16430697ff1', null);
INSERT INTO "public"."sys_user_info" VALUES ('dd971f5b-f76b-401b-b9ce-8c2b325652e6', null, '女', null, null, null, null, null, null, 'a23f7475-ac69-4007-9a42-99a7a160505d', null);
INSERT INTO "public"."sys_user_info" VALUES ('06b70597-467e-4627-8468-2d62a1a2db4c', null, '男', null, null, null, null, null, null, 'b96bf494-b6b2-4a50-86e0-52d413a861ca', null);
INSERT INTO "public"."sys_user_info" VALUES ('4c0f8ab2-cf3e-4c5f-bf1a-2f2e8825b320', null, '女', null, null, null, null, null, null, '1515eb03-2024-4294-8619-747b50d965ac', null);
INSERT INTO "public"."sys_user_info" VALUES ('038ebd48-9a2d-4e56-8bd0-1de2d9cc816a', null, '男', null, null, null, null, null, null, '2246bc5b-cb82-40a3-895a-b18303fb1d11', null);
INSERT INTO "public"."sys_user_info" VALUES ('6b20d232-79e7-4cc9-88ee-88c8e2b2b5ad', null, '女', null, null, null, null, null, null, '223a2b94-cf4d-4669-bc45-7cecb2e4d8ed', null);
INSERT INTO "public"."sys_user_info" VALUES ('9c1a0ff7-0fab-4e28-8241-b4f1dad351f6', null, '男', null, null, null, null, null, null, 'a6498a5a-119f-4959-a115-b7c4fe22d23b', null);
INSERT INTO "public"."sys_user_info" VALUES ('43671d9c-a932-4245-9b15-92add08e7e84', null, '女', null, null, null, null, null, null, 'bd851f70-13de-4a6f-9b2f-14f717b21fcf', null);
INSERT INTO "public"."sys_user_info" VALUES ('7c720b30-4753-495b-ac31-3185611639ed', null, '男', null, null, null, null, null, null, '1fc8c0a5-0cfc-4567-ae4a-a3a68e78b137', null);
INSERT INTO "public"."sys_user_info" VALUES ('f67e497b-6c63-4345-9e8f-2c99ad7b1d99', null, '女', null, null, null, null, null, null, '396f68cf-b904-487b-b8dc-26cb383016a6', null);
INSERT INTO "public"."sys_user_info" VALUES ('35f86887-8ac1-4a7d-abbd-ef1b6d4f3acd', null, '男', null, null, null, null, null, null, '3c0d717f-88f8-4a49-98a6-ba533f8045b0', null);
INSERT INTO "public"."sys_user_info" VALUES ('bc3ee56d-e368-41d6-9c66-cc26ba803651', null, '女', null, null, null, null, null, null, 'e59625eb-0b69-4480-bb12-a2f930784ba1', null);
INSERT INTO "public"."sys_user_info" VALUES ('eba35a96-f844-4211-8d3a-bcb9b8396030', null, '男', null, null, null, null, null, null, '4357f5c2-6639-42ed-96ef-cf3c91482b10', null);
INSERT INTO "public"."sys_user_info" VALUES ('0d30b58d-2bb6-4ef1-99fc-c72db8119d6f', null, '女', null, null, null, null, null, null, '6d678e75-2933-46ec-b537-c4a4b7b02ca5', null);
INSERT INTO "public"."sys_user_info" VALUES ('182bb8a9-49c1-4c0f-bfe7-973cb1e90e74', null, '男', null, null, null, null, null, null, 'f43ff608-811a-4cc9-a970-bbf999e15c33', null);
INSERT INTO "public"."sys_user_info" VALUES ('6d496620-a29a-4805-b91f-c1ed6bdbdf5b', null, '女', null, null, null, null, null, null, 'fea7aa69-da68-4963-b071-54013b01e61a', null);
INSERT INTO "public"."sys_user_info" VALUES ('1512c5a3-525e-4645-838d-1fc9c5984f93', null, '男', null, null, null, null, null, null, 'b7e6332c-bca7-423a-a447-0586f57d82b1', null);
INSERT INTO "public"."sys_user_info" VALUES ('05265101-9823-4341-be34-87436fdcb189', null, '女', null, null, null, null, null, null, 'd148770e-5334-4da0-a5e7-095eb058225e', null);
INSERT INTO "public"."sys_user_info" VALUES ('200cb467-aced-41e9-8de5-61a376fb0738', null, '男', null, null, null, null, null, null, '3466290b-4d00-4a03-940c-3c156150e458', null);
INSERT INTO "public"."sys_user_info" VALUES ('460478de-0ed5-4fbc-b0d3-2fc780be18d0', null, '女', null, null, null, null, null, null, 'def11706-e81b-46e2-84b7-c1899419da04', null);
INSERT INTO "public"."sys_user_info" VALUES ('4556fcaa-91e5-463d-ab05-e930f828299c', null, '男', null, null, null, null, null, null, '5dc0768c-97e2-4e97-9a3d-de05acd7e0c0', null);
INSERT INTO "public"."sys_user_info" VALUES ('9f3cdd45-85e5-4989-aa01-14c19a8e80dd', null, '女', null, null, null, null, null, null, 'ec2551f7-3b14-43fa-a5ac-0ff4366a0803', null);
INSERT INTO "public"."sys_user_info" VALUES ('b4d8e67f-adf0-4892-a8f5-cd0cdf892946', null, '男', null, null, null, null, null, null, 'c4464f25-4288-454b-ab32-62b890816748', null);
INSERT INTO "public"."sys_user_info" VALUES ('e8c12498-a5bc-4e7f-8bae-45d975cf4f4d', null, '女', null, null, null, null, null, null, '4fe77295-1c72-4a1d-a36d-709bf575d6c7', null);
INSERT INTO "public"."sys_user_info" VALUES ('64c3d0e7-e302-4aa7-8586-aa487023ee1f', null, '男', null, null, null, null, null, null, '044ccd39-2082-4fa4-905c-ee047eb55181', null);
INSERT INTO "public"."sys_user_info" VALUES ('ae7d2252-1889-49f0-befa-fda42f547e13', null, '女', null, null, null, null, null, null, 'bb8af870-3004-4376-9461-fb61f068a265', null);
INSERT INTO "public"."sys_user_info" VALUES ('5accab4c-e7e8-4350-a468-59f54bf76693', null, '男', null, null, null, null, null, null, 'da4c3d60-f949-404a-9ecd-45aeb5967fe7', null);
INSERT INTO "public"."sys_user_info" VALUES ('b203575a-661b-4897-a010-3ef93d26bca1', null, '女', null, null, null, null, null, null, '8acc7996-fe26-4aba-bcd0-b9e85feacbea', null);
INSERT INTO "public"."sys_user_info" VALUES ('b1f62ac0-0071-4cf3-95a1-307e8c4e0887', null, '男', null, null, null, null, null, null, '0760350c-ea05-48b3-b17a-50abb3aa2bc4', null);
INSERT INTO "public"."sys_user_info" VALUES ('d398e0b6-40cf-4f96-9146-6569ee560616', null, '女', null, null, null, null, null, null, '27e25dd8-d149-4115-9835-9379fbf11fcb', null);
INSERT INTO "public"."sys_user_info" VALUES ('f8cc6953-674e-4f5d-85d7-8feef81e814d', null, '男', null, null, null, null, null, null, '35ce1ce9-27d6-43fa-b6cb-8b278efd8130', null);
INSERT INTO "public"."sys_user_info" VALUES ('09e03e8b-3a73-40c9-b886-a7355ac6bf2c', null, '女', null, null, null, null, null, null, 'ce737284-518e-4b32-90ea-20780a58fb90', null);
INSERT INTO "public"."sys_user_info" VALUES ('dafb3733-e97b-4096-8dee-5fa45e79284e', null, '男', null, null, null, null, null, null, '65c08981-5de3-4b81-b717-7c67a0408567', null);
INSERT INTO "public"."sys_user_info" VALUES ('158eace5-9803-4c03-8c11-ff99d26ae20b', null, '女', null, null, null, null, null, null, '222b027c-cc61-479e-98d9-37e2dd7de99e', null);
INSERT INTO "public"."sys_user_info" VALUES ('c0698231-a004-45ca-af4c-ddc59cbbf13a', null, '男', null, null, null, null, null, null, '6e3887de-4d37-467a-bff5-5a9b6fa20c11', null);
INSERT INTO "public"."sys_user_info" VALUES ('19e0277e-194e-425a-88b1-e5af6fa8e801', null, '女', null, null, null, null, null, null, '2e8b68d6-ac0b-42e5-a028-06d410c66cd4', null);
INSERT INTO "public"."sys_user_info" VALUES ('ec259c0e-7016-4c83-9aec-3a89c3d3a686', null, '男', null, null, null, null, null, null, '70a59d3b-94aa-4bf5-a6e9-80a32777a9ed', null);
INSERT INTO "public"."sys_user_info" VALUES ('b22ffc85-d913-45bb-bc66-59c8900f6be7', null, '女', null, null, null, null, null, null, 'd559e3cc-341b-4067-aaa9-21cc62d44e38', null);
INSERT INTO "public"."sys_user_info" VALUES ('1b61082e-96da-401a-b3c5-b632f6f4056d', null, '男', null, null, null, null, null, null, '80352101-f0c3-4df9-820b-4714cc73f5ad', null);
INSERT INTO "public"."sys_user_info" VALUES ('d999d395-0140-4b52-a146-1e334a8df8f0', null, '女', null, null, null, null, null, null, '89af91e5-5873-41ac-a361-406a0866adbb', null);
INSERT INTO "public"."sys_user_info" VALUES ('6eb2c35c-2bde-486d-b5ae-499938f97005', null, '男', null, null, null, null, null, null, 'b66be0e3-5f46-44f8-a25c-90cb10e84df1', null);
INSERT INTO "public"."sys_user_info" VALUES ('5bf33ac0-05ea-49ba-94ba-0d8709385da1', null, '女', null, null, null, null, null, null, 'f6ab4752-46d0-46c8-90fa-c74319d37d40', null);
INSERT INTO "public"."sys_user_info" VALUES ('dbbcd472-2e37-4211-a7cc-699a31d7c3a4', null, '男', null, null, null, null, null, null, '12300401-f436-4662-b4e3-a143a2e65475', null);
INSERT INTO "public"."sys_user_info" VALUES ('c309185a-edd9-41fb-ba9f-509e375da8a7', null, '女', null, null, null, null, null, null, 'cceb336b-ed7d-47da-983a-334acd4f65f5', null);
INSERT INTO "public"."sys_user_info" VALUES ('08cddacb-0794-43ea-a4f2-db17fc86a369', null, '男', null, null, null, null, null, null, 'aabf8b2d-b7da-42c1-829d-7eabbb72d0ac', null);
INSERT INTO "public"."sys_user_info" VALUES ('43c3155c-aece-4b88-a357-08eb69a1a33b', null, '女', null, null, null, null, null, null, 'e442a257-d0b4-4b7b-9e82-624e5d390b0f', null);
INSERT INTO "public"."sys_user_info" VALUES ('f0dd4fe6-bbee-4360-b36e-8e28cf550852', null, '男', null, null, null, null, null, null, 'a1a74654-4330-452c-a5b8-99e2cc6a4a0a', null);
INSERT INTO "public"."sys_user_info" VALUES ('759a7376-4762-4ba4-8032-796bbce393c4', null, '女', null, null, null, null, null, null, '7f43a503-24a3-4e33-90e3-0045f525da2b', null);
INSERT INTO "public"."sys_user_info" VALUES ('1a32fba2-f10e-4032-ade7-197e99141b48', null, '男', null, null, null, null, null, null, '41409bdf-8e63-407b-b447-6351b4bf671c', null);
INSERT INTO "public"."sys_user_info" VALUES ('3d3f18dc-01bc-4ce0-bf1e-b30acceb295b', null, '女', null, null, null, null, null, null, '30cf1c3c-bf45-43aa-9b6e-102d52271c8b', null);
INSERT INTO "public"."sys_user_info" VALUES ('3ceedf5f-f934-4c0a-97e7-7b712e67de71', null, '男', null, null, null, null, null, null, '502ea4cb-b3ce-4ada-a725-a7d7fe533f9f', null);
INSERT INTO "public"."sys_user_info" VALUES ('f4a31385-74fe-4438-89d7-618f3db4f01b', null, '女', null, null, null, null, null, null, '51c72baf-2e06-4265-869c-77ececd816fa', null);
INSERT INTO "public"."sys_user_info" VALUES ('43ad8231-ba3c-44e3-8e17-4f50db4a86e5', null, '男', null, null, null, null, null, null, '2944c56c-c886-4dc6-8086-688cdef25af3', null);
INSERT INTO "public"."sys_user_info" VALUES ('38187392-941a-4d9f-a2bb-e1b660c40d0f', null, '女', null, null, null, null, null, null, '20fd4c8e-7c4e-4fd7-8f6b-1725c1368ead', null);
INSERT INTO "public"."sys_user_info" VALUES ('0c546b19-051a-4c2b-b2d0-54f5e7aba9c8', null, '男', null, null, null, null, null, null, 'd64a24b5-0891-4987-9b9d-3b572e988228', null);
INSERT INTO "public"."sys_user_info" VALUES ('6b4cdc8b-403d-4644-9217-af265fa71508', null, '女', null, null, null, null, null, null, 'edd8ffcb-1a18-4120-b759-5f68e957765e', null);
INSERT INTO "public"."sys_user_info" VALUES ('b3b3e023-5f36-40b1-8f4e-16ede63a48b7', null, '男', null, null, null, null, null, null, '119a923b-49ff-428f-975e-61060a4c4dc9', null);
INSERT INTO "public"."sys_user_info" VALUES ('c8260500-7828-4fe8-b31a-89da99d7e912', null, '女', null, null, null, null, null, null, 'e243cb98-8257-49e4-bdb8-820254ae2bf5', null);
INSERT INTO "public"."sys_user_info" VALUES ('027079b0-ba36-4cb1-91d9-441bff16660a', null, '男', null, null, null, null, null, null, '3ff6ea24-bf96-447d-9f35-f8c72ce1374d', null);
INSERT INTO "public"."sys_user_info" VALUES ('2d4009ff-9f35-490f-91eb-dbbf36ac68ec', null, '女', null, null, null, null, null, null, 'da21e9e3-d84b-470f-b121-2b579a413fc2', null);
INSERT INTO "public"."sys_user_info" VALUES ('d2ddf62e-ebaf-4c47-b856-e9eb2ec74312', null, '男', null, null, null, null, null, null, 'a5486dcf-6409-48f0-8a91-7af66eb02a50', null);
INSERT INTO "public"."sys_user_info" VALUES ('916630a6-2d54-40cc-adec-3a59092de004', null, '女', null, null, null, null, null, null, '34fc5b7c-65d6-4f47-968d-a54b6056e852', null);
INSERT INTO "public"."sys_user_info" VALUES ('85b34d7e-2d79-4dd6-9a0d-914a6aac4f69', null, '男', null, null, null, null, null, null, '96aa97c4-cbe5-4bfe-a3c4-da9969d89804', null);
INSERT INTO "public"."sys_user_info" VALUES ('de02cba3-e620-42ba-aed2-0b38fe4c1d22', null, '女', null, null, null, null, null, null, '26609010-88e7-4b0e-9363-fbfcc2012d81', null);
INSERT INTO "public"."sys_user_info" VALUES ('04f7edda-bd0e-4bda-a861-10a4469faf0c', null, '男', null, null, null, null, null, null, '305f67dd-136a-4254-9af7-850b74c67851', null);
INSERT INTO "public"."sys_user_info" VALUES ('81adb75c-7177-49b6-b9d9-90b669c12559', null, '女', null, null, null, null, null, null, '2f3609ae-91fd-4995-865e-e833083c0784', null);
INSERT INTO "public"."sys_user_info" VALUES ('b315ebf3-32ac-4056-89b4-badcda1a4302', null, '男', null, null, null, null, null, null, '3b1f3a6f-3da0-4082-b30f-e3e4b89ff9d4', null);
INSERT INTO "public"."sys_user_info" VALUES ('e4c77875-eb38-428b-8b73-10d007c4ab85', null, '女', null, null, null, null, null, null, 'bdce7a30-5d86-4c92-a610-277ebfc4aca8', null);
INSERT INTO "public"."sys_user_info" VALUES ('5a567e71-323c-40d6-bb91-83395c906a61', null, '男', null, null, null, null, null, null, '163a6145-8a64-403a-b214-94ca563be10b', null);
INSERT INTO "public"."sys_user_info" VALUES ('53e7f6b5-1c6e-42dc-a517-3877a969d285', null, '女', null, null, null, null, null, null, '3b7a763f-c726-4a94-a6bb-304fc46eb88e', null);
INSERT INTO "public"."sys_user_info" VALUES ('82a2b667-412e-4348-bfe9-06fb685cacd0', null, '男', null, null, null, null, null, null, 'fd16eb47-5ccb-4e7d-874c-06ec07b434c6', null);
INSERT INTO "public"."sys_user_info" VALUES ('a39fd02e-1526-4e7d-a080-a531acc701e6', null, '女', null, null, null, null, null, null, '8aa4bfce-2ce8-4cf7-b047-b9502f3fb8ea', null);
INSERT INTO "public"."sys_user_info" VALUES ('94126156-89bb-4417-832f-b3b399bc9681', null, '男', null, null, null, null, null, null, '94a66cf1-37e7-43c0-bbbb-004b45b4daf5', null);
INSERT INTO "public"."sys_user_info" VALUES ('0699067d-75ef-4dce-85e6-23d156e15e95', null, '女', null, null, null, null, null, null, '045a9fae-2c50-4fb0-b0b8-ba8b3baeb861', null);
INSERT INTO "public"."sys_user_info" VALUES ('57936ccb-3242-45ee-8247-2ce3645ecf7c', null, '男', null, null, null, null, null, null, '8691296b-630e-43a4-b82c-707507188f71', null);
INSERT INTO "public"."sys_user_info" VALUES ('c0a09c5f-ed4e-4653-b68c-1ad6777a75da', null, '女', null, null, null, null, null, null, 'e80df154-a06f-4364-823f-55a3f35f7edd', null);
INSERT INTO "public"."sys_user_info" VALUES ('e86b6e48-4a88-40be-8b53-0e6ae22d2344', null, '男', null, null, null, null, null, null, '575267d9-cb3c-4ab6-8d39-b7585adf21e6', null);
INSERT INTO "public"."sys_user_info" VALUES ('c9f38345-3249-4de8-b5a2-8b48e334885b', null, '女', null, null, null, null, null, null, '6517cfe8-0137-4aea-b82c-db1ae51e1f37', null);
INSERT INTO "public"."sys_user_info" VALUES ('1bf90812-6ae0-4860-8267-cba0712b8b91', null, '男', null, null, null, null, null, null, '007ad2e3-e942-4613-8aca-8d67d903481e', null);
INSERT INTO "public"."sys_user_info" VALUES ('ba2f4aac-5e3f-4126-924b-46031d02e0db', null, '女', null, null, null, null, null, null, '7a57ac9e-c5e4-4b77-8fc3-f23d0087bb52', null);
INSERT INTO "public"."sys_user_info" VALUES ('9ea6c823-9f57-48c5-bac8-cbe005e1b694', null, '男', null, null, null, null, null, null, '3184b52d-f9a3-4ab9-906e-423572338f69', null);
INSERT INTO "public"."sys_user_info" VALUES ('a4fce793-530d-4c79-bd17-9ba6c4877713', null, '女', null, null, null, null, null, null, 'f8124a22-0999-4bc2-89d3-891beec2ff75', null);
INSERT INTO "public"."sys_user_info" VALUES ('7c412b2e-6d70-4351-a685-b6093a8be019', null, '男', null, null, null, null, null, null, '36fd193b-3de8-4c3d-9c47-25d8a880a416', null);
INSERT INTO "public"."sys_user_info" VALUES ('42b3d9b4-d99c-47c1-a1a0-1ce3f1fcc7e9', null, '女', null, null, null, null, null, null, '6f1a0c28-4ab9-4e88-891d-3c34a91dcda4', null);
INSERT INTO "public"."sys_user_info" VALUES ('f1990794-aa9e-49ab-b0b6-870a7ef9de1f', null, '男', null, null, null, null, null, null, 'dab36896-e856-4362-a553-4483e2696f15', null);
INSERT INTO "public"."sys_user_info" VALUES ('8e5b061c-3983-465a-84ba-905b697efc67', null, '女', null, null, null, null, null, null, 'a8eb533a-1bcb-4fec-8f00-5792d360f542', null);
INSERT INTO "public"."sys_user_info" VALUES ('227daf58-c6e5-451a-be6a-4759aaf407d4', null, '男', null, null, null, null, null, null, 'ce2b5189-1802-4b68-845f-b01c56ee66a5', null);
INSERT INTO "public"."sys_user_info" VALUES ('cc4bdd0e-3726-458a-b09e-83008e22c7c3', null, '女', null, null, null, null, null, null, '71ef2093-8959-4ab1-9b4b-b55af539d7d5', null);
INSERT INTO "public"."sys_user_info" VALUES ('c7449931-556c-47a9-95cc-3e4dfade313c', null, '男', null, null, null, null, null, null, '49655a96-b102-4fbc-8100-bcad086e1867', null);
INSERT INTO "public"."sys_user_info" VALUES ('b5b4d601-a59e-4dd9-b8ac-d5c7fc16ce27', null, '女', null, null, null, null, null, null, '708f514b-d8e0-46b5-9918-da37d48521b2', null);
INSERT INTO "public"."sys_user_info" VALUES ('dd23cd34-3665-4405-8e90-40fca1fb846d', null, '男', null, null, null, null, null, null, '8dd79572-ed95-4346-b623-fb63df75e4b4', null);
INSERT INTO "public"."sys_user_info" VALUES ('d01ea69d-b8c5-45e5-b195-ea2975bbd55b', null, '女', null, null, null, null, null, null, '39ed87ef-28dc-4e86-b231-eadf64c13ec9', null);
INSERT INTO "public"."sys_user_info" VALUES ('a3c52f67-69e8-41fa-a96e-3f0a4fa2baa6', null, '男', null, null, null, null, null, null, 'b0627a43-2ee1-4f4f-bc9b-ff25cac79d77', null);
INSERT INTO "public"."sys_user_info" VALUES ('6681b748-e6c7-42d0-8d81-aa5537b70b16', null, '女', null, null, null, null, null, null, '49b0f2c0-75c1-4d6b-a3b2-4f03c4eaf5a1', null);
INSERT INTO "public"."sys_user_info" VALUES ('1ddf3223-2cdc-40ed-a44a-a1a03ae18988', null, '男', null, null, null, null, null, null, '02dbe24d-2cdc-4d00-852c-09e14cbfa75e', null);
INSERT INTO "public"."sys_user_info" VALUES ('a36e2e90-00d4-438d-a596-ec15de984ad0', null, '女', null, null, null, null, null, null, '28cf2d87-b580-417e-91d7-1cfd2d3215d2', null);
INSERT INTO "public"."sys_user_info" VALUES ('d808173e-f12f-4209-bdbe-37ede86c1101', null, '男', null, null, null, null, null, null, 'c6732732-5aa5-4399-8de5-b55dc14dfff8', null);
INSERT INTO "public"."sys_user_info" VALUES ('036dec49-787a-4be6-9945-98db7d8f1759', null, '女', null, null, null, null, null, null, '2bc181bd-6b36-443d-a929-b9830aa490d1', null);
INSERT INTO "public"."sys_user_info" VALUES ('96d82d14-75fe-4776-ab85-f67f1e11f165', null, '男', null, null, null, null, null, null, 'ebabafd9-158d-4913-89a8-54d1feb70089', null);
INSERT INTO "public"."sys_user_info" VALUES ('2777eacc-20dc-4b80-91dd-e09ff757d980', null, '女', null, null, null, null, null, null, 'd20a09eb-4a05-4f17-8391-1a1aef19f852', null);
INSERT INTO "public"."sys_user_info" VALUES ('d3d25023-d51c-4528-90b6-7d57317997de', null, '男', null, null, null, null, null, null, 'e4de2e98-169a-46c8-b301-a3426ce37cd6', null);
INSERT INTO "public"."sys_user_info" VALUES ('fe780c11-ece5-4b51-8167-f17240274a7b', null, '女', null, null, null, null, null, null, '3e341278-1d11-4e47-93ca-804683200c21', null);
INSERT INTO "public"."sys_user_info" VALUES ('fa67f33b-7209-4db3-a045-bdaec32db7c3', null, '男', null, null, null, null, null, null, '223dc57c-4b40-4e97-a698-689e03ea562b', null);
INSERT INTO "public"."sys_user_info" VALUES ('e34b19a0-5997-4745-9a42-0b5eacf0f605', null, '女', null, null, null, null, null, null, '4b25c984-eb44-4dbd-9632-05713327d89a', null);
INSERT INTO "public"."sys_user_info" VALUES ('f4d3ef0e-23c1-4595-9e28-93eec2809c81', null, '男', null, null, null, null, null, null, '594e7472-4533-40da-afc9-1abfb690878c', null);
INSERT INTO "public"."sys_user_info" VALUES ('5a7eebe1-817d-4337-b9e1-852d95fea885', null, '女', null, null, null, null, null, null, 'cc67c7be-5a4d-4699-99c7-1f7766e5d160', null);
INSERT INTO "public"."sys_user_info" VALUES ('8a593770-3d3c-4a32-ba6c-5c37f5fc16c0', null, '男', null, null, null, null, null, null, '6b8e5c32-8c80-4669-9254-09b82eb409ba', null);
INSERT INTO "public"."sys_user_info" VALUES ('c00736cb-742c-454f-8df9-2bb594277a69', null, '女', null, null, null, null, null, null, 'f156f44d-c670-4bab-a350-225d394651a5', null);
INSERT INTO "public"."sys_user_info" VALUES ('1c8fccd2-902b-443c-b385-ab05019a5c9f', null, '男', null, null, null, null, null, null, '76814a61-72db-42d7-a4c9-b11d7104020e', null);
INSERT INTO "public"."sys_user_info" VALUES ('3e4b1d87-6097-4ae6-8d95-460a664d6c86', null, '女', null, null, null, null, null, null, '4bc452ab-0fe2-42cf-a6e9-3f150d7a2d0e', null);
INSERT INTO "public"."sys_user_info" VALUES ('089ca1f8-2aca-4df2-be0e-11c3aa35ff29', null, '男', null, null, null, null, null, null, '9be310e2-96be-43b4-9d19-0ae1584f76a0', null);
INSERT INTO "public"."sys_user_info" VALUES ('ccfcfb65-4d27-4d08-9d08-341836b64764', null, '女', null, null, null, null, null, null, '2da4aa3c-67f0-40cb-94ff-1690fc9bcbff', null);
INSERT INTO "public"."sys_user_info" VALUES ('3d44497a-b591-4680-b18c-33c693c19618', null, '男', null, null, null, null, null, null, '682987c0-fdc6-4911-98f1-52e6861feb59', null);
INSERT INTO "public"."sys_user_info" VALUES ('0fa65c9f-dcfd-4acd-867f-896f0d9c3b53', null, '女', null, null, null, null, null, null, 'e351bac4-39b8-4902-85b2-dffa9f827631', null);
INSERT INTO "public"."sys_user_info" VALUES ('bae85f70-6c3a-439c-a002-414c8693a38c', null, '男', null, null, null, null, null, null, '111ed106-30c9-46e9-8002-78f62ee6ae6f', null);
INSERT INTO "public"."sys_user_info" VALUES ('ba4c5073-194e-4b00-808e-416241021ac5', null, '女', null, null, null, null, null, null, '08acbc95-b14a-4cd1-9fe6-dc3f703f6ad1', null);
INSERT INTO "public"."sys_user_info" VALUES ('5038db50-8d92-4e58-afae-778e8b0b6488', null, '男', null, null, null, null, null, null, 'c281bae2-b6e2-4b8d-9ce7-a3ea6a062989', null);
INSERT INTO "public"."sys_user_info" VALUES ('f1f67d69-5b53-43bf-95f4-1f3189bc84aa', null, '女', null, null, null, null, null, null, 'f1a62aa3-3355-4702-acf5-387b5f6891a6', null);
INSERT INTO "public"."sys_user_info" VALUES ('4245b9e7-5bb4-47b9-9d97-98dc863ded77', null, '男', null, null, null, null, null, null, '1dccedd9-a6c6-4248-8b6b-30d155995bcb', null);
INSERT INTO "public"."sys_user_info" VALUES ('8cf44d40-38bf-4726-8401-2184a1b634bf', null, '女', null, null, null, null, null, null, '4c5c3bea-7482-4060-b2fa-a0f90b5bfbb4', null);
INSERT INTO "public"."sys_user_info" VALUES ('17915c48-5b3a-452f-8881-200bd3b39e9b', null, '男', null, null, null, null, null, null, '7613ce08-9d63-4258-b392-752aace8bbef', null);
INSERT INTO "public"."sys_user_info" VALUES ('a7c06171-bbe4-4183-81f0-0b7d6181e404', null, '女', null, null, null, null, null, null, '2b9053a7-9b1b-4b04-ba21-c6c2f3f5c1b5', null);
INSERT INTO "public"."sys_user_info" VALUES ('9bdd8a2a-64ae-43f0-8198-1107d0527ed0', null, '男', null, null, null, null, null, null, '42df6181-e767-4f8e-bdf6-a09217c87e0a', null);
INSERT INTO "public"."sys_user_info" VALUES ('5c96c3df-fa22-4fda-a22b-646dc4c472a6', null, '女', null, null, null, null, null, null, 'a04f6612-ee5c-4dc5-b4fa-d988243a31e8', null);
INSERT INTO "public"."sys_user_info" VALUES ('730dfbbe-d084-40f6-b40e-28458ce57c47', null, '男', null, null, null, null, null, null, '78b505be-2777-4e50-ac01-c466f71c3480', null);
INSERT INTO "public"."sys_user_info" VALUES ('d6702ed9-115c-4063-933b-d088ffc861b8', null, '女', null, null, null, null, null, null, '24617da6-5ce6-4dc3-9467-989d66e0ba3c', null);
INSERT INTO "public"."sys_user_info" VALUES ('69057c4a-158e-4471-b242-f25c2e21b8f9', null, '男', null, null, null, null, null, null, '9ae4c0fc-d63d-4098-92ff-af159fc6be48', null);
INSERT INTO "public"."sys_user_info" VALUES ('7f8f1343-01d6-4c5a-b9cf-cf5c9d20b96a', null, '女', null, null, null, null, null, null, 'ea2f30c6-ce69-4c69-9824-150009a6ab5a', null);
INSERT INTO "public"."sys_user_info" VALUES ('114c6d99-3370-48e4-8a00-b91a41197661', null, '男', null, null, null, null, null, null, 'fcb7e270-5007-4e56-8a93-feddb9917c29', null);
INSERT INTO "public"."sys_user_info" VALUES ('04438ff7-65be-450c-a964-1a14eba3177e', null, '女', null, null, null, null, null, null, 'ae662c4b-332d-4dd4-8545-9ee2026f5c20', null);
INSERT INTO "public"."sys_user_info" VALUES ('940d3127-01ec-4ae2-981a-24579974bba2', null, '男', null, null, null, null, null, null, '57187c8f-4616-4083-9db2-cee1108cf646', null);
INSERT INTO "public"."sys_user_info" VALUES ('8da23130-6c73-455f-8bf4-9fa8ed047838', null, '女', null, null, null, null, null, null, 'dfc1a09f-cf24-4cd7-8e4b-0feeb61bbfb1', null);
INSERT INTO "public"."sys_user_info" VALUES ('97e4b061-5aa6-48fe-bed6-cff20623a132', null, '男', null, null, null, null, null, null, '1bc3d27c-d8d8-4547-9bc4-a170f943c1bd', null);
INSERT INTO "public"."sys_user_info" VALUES ('d22ad8cb-3356-4724-97a4-539f22aa79b6', null, '女', null, null, null, null, null, null, '271e2151-b71a-4a63-83c1-13791b5b177d', null);
INSERT INTO "public"."sys_user_info" VALUES ('e2bd6bdb-cd01-41c8-ab4b-a1fedf8e1835', null, '男', null, null, null, null, null, null, 'a3e71d04-75b7-4a0d-a75c-3968e7a5270b', null);
INSERT INTO "public"."sys_user_info" VALUES ('39ad1233-d223-489f-8643-5d4a34111131', null, '女', null, null, null, null, null, null, 'b69f767d-eacf-4083-b294-74866a5c3b0a', null);
INSERT INTO "public"."sys_user_info" VALUES ('4a66d467-d646-4e84-8465-b3957e8f5e39', null, '男', null, null, null, null, null, null, '445bbcbf-4579-4bd0-93d9-3ffc79791666', null);
INSERT INTO "public"."sys_user_info" VALUES ('21c8f7b6-5dae-428c-88f1-40a221cce766', null, '女', null, null, null, null, null, null, '8e005c90-3799-4882-8477-c4ef751565fb', null);
INSERT INTO "public"."sys_user_info" VALUES ('56f8b128-7d87-4620-ac96-2139f6637cb3', null, '男', null, null, null, null, null, null, 'd11c1649-c6af-463b-b74d-488bee12a5d0', null);
INSERT INTO "public"."sys_user_info" VALUES ('e360f043-945d-470e-a909-2029f66fbc8d', null, '女', null, null, null, null, null, null, '769f2900-fc3a-43f6-b28e-172001e9a8f4', null);
INSERT INTO "public"."sys_user_info" VALUES ('bbbb34ab-9416-4807-802d-b67a77ee1646', null, '男', null, null, null, null, null, null, 'c77ccd41-32d0-458e-961f-5898dbb97226', null);
INSERT INTO "public"."sys_user_info" VALUES ('a771418d-49c2-4af6-9007-d70583578472', null, '女', null, null, null, null, null, null, '551c9fb0-8118-44f5-98ab-625196d0091a', null);
INSERT INTO "public"."sys_user_info" VALUES ('fa71a944-96a6-45a2-8555-e9915837977d', null, '男', null, null, null, null, null, null, 'a49860c1-0ec7-4d6e-804f-9d508ec03aba', null);
INSERT INTO "public"."sys_user_info" VALUES ('ef1a06f4-1133-49c0-82e2-4bdcb7a3b41c', null, '女', null, null, null, null, null, null, '1b590821-4fca-4143-9de8-def560a386c0', null);
INSERT INTO "public"."sys_user_info" VALUES ('b3bf8fd3-8fdf-4732-9a87-f5a71c170e14', null, '男', null, null, null, null, null, null, '6e2cbf99-900b-45ba-88e8-25716baf5e9d', null);
INSERT INTO "public"."sys_user_info" VALUES ('670ddc25-69bb-4943-8a04-f7cf322a0752', null, '女', null, null, null, null, null, null, 'c78d2156-d3a2-45bb-9258-194e66fc8269', null);
INSERT INTO "public"."sys_user_info" VALUES ('3b639f4a-9110-4549-b2cb-4ae25ad9e6c7', null, '男', null, null, null, null, null, null, '5b55f7ea-f0f1-40ad-9825-b73c1ba985b2', null);
INSERT INTO "public"."sys_user_info" VALUES ('23ca5970-e153-4ae6-9d9e-02ef34902fcd', null, '女', null, null, null, null, null, null, '76484cbc-4733-4ea8-b21b-9fed7f9d3ae9', null);
INSERT INTO "public"."sys_user_info" VALUES ('ed750fce-b2d5-45b0-9181-6aa448beaa24', null, '男', null, null, null, null, null, null, '538889f8-826a-4c84-8241-c04847e2eb8f', null);
INSERT INTO "public"."sys_user_info" VALUES ('582cbcd8-56c0-489b-8316-0ba7371aa5f1', null, '女', null, null, null, null, null, null, 'fc46779c-bbd1-46b0-9557-073239c7c4bc', null);
INSERT INTO "public"."sys_user_info" VALUES ('24552fa6-5e19-42b9-ad72-e1d730fd835f', null, '男', null, null, null, null, null, null, 'ac47202f-eba7-4483-926c-ca9eaadaeaa1', null);
INSERT INTO "public"."sys_user_info" VALUES ('88e6a641-c9c9-4c08-9139-4e93595d85ee', null, '女', null, null, null, null, null, null, 'd97e0747-4e22-40fd-bd69-681b316dbcd6', null);
INSERT INTO "public"."sys_user_info" VALUES ('deb26183-477e-4d47-9b31-26ec07181b30', null, '男', null, null, null, null, null, null, '45e5886b-d8bf-4674-aef1-7b0e7fe3c0f0', null);
INSERT INTO "public"."sys_user_info" VALUES ('5ac2a85a-b7ea-4bb7-8cdc-6689899273a7', null, '女', null, null, null, null, null, null, '3ca947e2-a5af-43ce-8d3b-af8369871e75', null);
INSERT INTO "public"."sys_user_info" VALUES ('54c225b0-1559-43eb-8412-71c8ca0710c9', null, '男', null, null, null, null, null, null, 'c57261c0-ff9e-484e-bbfa-6fc15bd68674', null);
INSERT INTO "public"."sys_user_info" VALUES ('bd131c0d-a6cc-4d86-91fe-226ad5a7aaa0', null, '女', null, null, null, null, null, null, '856a4689-ebc2-403c-82d6-bd37a10b3b3c', null);
INSERT INTO "public"."sys_user_info" VALUES ('601b76d5-1ee2-47c8-b0d9-a681cd0cffb3', null, '男', null, null, null, null, null, null, '1de9b154-d55b-4b58-a47f-74ab345ccf2b', null);
INSERT INTO "public"."sys_user_info" VALUES ('d4e48336-ce93-4b8b-9766-c00d5be78fd8', null, '女', null, null, null, null, null, null, '93e0a3b2-efe2-437a-8736-94fd59fe5638', null);
INSERT INTO "public"."sys_user_info" VALUES ('8cd95f0c-3769-41d8-b628-12c96bd1b47f', null, '男', null, null, null, null, null, null, '4cb4b21b-80ee-4a5f-a1bd-f36f7780a911', null);
INSERT INTO "public"."sys_user_info" VALUES ('76869719-62bd-48cc-807c-5933084babe9', null, '女', null, null, null, null, null, null, '7e2fbc6c-632e-4460-b3b5-3a4b0d1aa3e7', null);
INSERT INTO "public"."sys_user_info" VALUES ('393ac0ec-0af2-4fc3-a8f2-2017c83e92d5', null, '男', null, null, null, null, null, null, 'aa959f6b-7d86-4ad4-ace8-acd708e40f09', null);
INSERT INTO "public"."sys_user_info" VALUES ('45c57d0e-dd1e-4119-aab0-2901136d3635', null, '女', null, null, null, null, null, null, '0b7a4d75-3009-4e34-a8ad-e916d4f42412', null);
INSERT INTO "public"."sys_user_info" VALUES ('72c6d1ab-9194-466e-8dbf-16ec5e0791ca', null, '男', null, null, null, null, null, null, '11806745-7621-4912-8e03-904d84ce60d5', null);
INSERT INTO "public"."sys_user_info" VALUES ('2754fe81-344b-4ce9-80b5-f70c34e76d9a', null, '女', null, null, null, null, null, null, '237d7ffa-8209-4826-a447-8eb6b7cfeb1d', null);
INSERT INTO "public"."sys_user_info" VALUES ('30354023-945c-4f6e-b14f-da61b4cd54df', null, '男', null, null, null, null, null, null, '7a4dc86c-de6e-4f4b-8fcf-d561d2681af3', null);
INSERT INTO "public"."sys_user_info" VALUES ('aa0780fc-588f-4be6-b777-7691155c39bd', null, '女', null, null, null, null, null, null, 'd11d52c8-85ca-4ee4-9811-6545e5061eaa', null);
INSERT INTO "public"."sys_user_info" VALUES ('c7eca8ab-8b1b-49e4-896d-4732fc83a840', null, '男', null, null, null, null, null, null, 'd14a6cf5-be7d-4be1-a2be-e1d1f3bd2c27', null);
INSERT INTO "public"."sys_user_info" VALUES ('c103f63b-5ac9-4e2f-a686-da09feceede7', null, '女', null, null, null, null, null, null, '5ca6df53-3c91-4f6f-b369-429c610a07b2', null);
INSERT INTO "public"."sys_user_info" VALUES ('369cf9f3-764e-4abb-b127-79715ca7377a', null, '男', null, null, null, null, null, null, '7badbe29-9b22-4c20-8fc7-62f3ed8369ef', null);
INSERT INTO "public"."sys_user_info" VALUES ('e0293289-ae5d-4f47-ad04-b3761a50aa76', null, '女', null, null, null, null, null, null, 'ac0e21c8-ee9a-4920-9077-4d3c0c747012', null);
INSERT INTO "public"."sys_user_info" VALUES ('169d8c75-d546-404b-ad71-c15504b813ba', null, '男', null, null, null, null, null, null, '131d60c1-e7c2-477a-bc4f-3b5de2048a8e', null);
INSERT INTO "public"."sys_user_info" VALUES ('73c9e02e-b8dc-434f-91af-d0c379f55cc4', null, '女', null, null, null, null, null, null, '66462c0c-d9f1-4d03-8a44-05182cf52f77', null);
INSERT INTO "public"."sys_user_info" VALUES ('b7dd0769-310d-47b7-bd4a-4ea4858dd209', null, '男', null, null, null, null, null, null, 'fcc43400-1e91-4c4c-af46-53d35159cdbc', null);
INSERT INTO "public"."sys_user_info" VALUES ('e044f993-93db-4acb-afb8-d723f374ee1a', null, '女', null, null, null, null, null, null, 'e0f55724-095e-44c6-b51a-6f96001d5756', null);
INSERT INTO "public"."sys_user_info" VALUES ('45351b33-86d8-44d5-b0f6-1624c1dc551a', null, '男', null, null, null, null, null, null, '029e7c59-e556-4ae0-b300-a40bd95200cb', null);
INSERT INTO "public"."sys_user_info" VALUES ('60545183-6bee-4e41-80cb-b5f3ab5c5c86', null, '女', null, null, null, null, null, null, 'a19f5152-6948-4927-b71d-65c931f847e0', null);
INSERT INTO "public"."sys_user_info" VALUES ('7597b2d1-892e-4253-a991-361ee2ef1f35', null, '男', null, null, null, null, null, null, '09cc96b4-ec34-4cbe-97d3-f07d98ed7772', null);
INSERT INTO "public"."sys_user_info" VALUES ('dcabd365-937c-45ae-9dd6-5f0181731a18', null, '女', null, null, null, null, null, null, 'e80520c9-2863-4ed9-b978-28476331144e', null);
INSERT INTO "public"."sys_user_info" VALUES ('d6bbfd94-c725-4029-a109-dda9e5eab89e', null, '男', null, null, null, null, null, null, 'f0e847a1-3a70-4426-af4d-543918fc1aa5', null);
INSERT INTO "public"."sys_user_info" VALUES ('f1c8f4ce-59bf-466d-ad44-e1c815e3d0cd', null, '女', null, null, null, null, null, null, '0f294fcd-9e67-4647-a54a-72af35725b1b', null);
INSERT INTO "public"."sys_user_info" VALUES ('8a260df9-548a-4313-83b7-b613e5d75eb4', null, '男', null, null, null, null, null, null, '76315908-3db8-420b-927b-1ec7e1acb66e', null);
INSERT INTO "public"."sys_user_info" VALUES ('0fd175e3-a290-40ea-b932-27da5ec91821', null, '女', null, null, null, null, null, null, 'a58640b8-9a19-4100-b593-4529cb352655', null);
INSERT INTO "public"."sys_user_info" VALUES ('290b9436-f76b-457c-a56a-cb64ba7e370a', null, '男', null, null, null, null, null, null, '582a7714-c313-4f73-bdf7-c79ef987a95b', null);
INSERT INTO "public"."sys_user_info" VALUES ('1d3764a5-cb95-4fa7-beec-c7fb1bfaa89d', null, '女', null, null, null, null, null, null, 'eea57f15-ab11-4b17-ab35-2252e7b25d47', null);
INSERT INTO "public"."sys_user_info" VALUES ('b0d6b42b-b6aa-442c-baac-dde1c45cdcb5', null, '男', null, null, null, null, null, null, '69e5fb0d-305f-4abd-a7d5-30cb2cbed2bc', null);
INSERT INTO "public"."sys_user_info" VALUES ('47b7b3da-cb64-4db7-9b6a-7825d563ab9e', null, '女', null, null, null, null, null, null, '83bab143-bdd2-463c-a13a-ee59e1ac23c9', null);
INSERT INTO "public"."sys_user_info" VALUES ('8a540149-3c21-4e68-8b8b-4c178fc04f0d', null, '男', null, null, null, null, null, null, 'dff060a8-a42a-46cf-af17-927c66b9c224', null);
INSERT INTO "public"."sys_user_info" VALUES ('c2d11e65-4039-4efb-8112-80b47842453e', null, '女', null, null, null, null, null, null, '444586de-7322-47c8-9205-2fbcd6580dbc', null);
INSERT INTO "public"."sys_user_info" VALUES ('5444ef07-243e-421c-801e-8d8b0bde72fe', null, '男', null, null, null, null, null, null, '947d42d4-eb1f-4507-b49d-570f5e7a65d2', null);
INSERT INTO "public"."sys_user_info" VALUES ('e5486e66-ebd3-444f-9dea-8c53ca2b4d01', null, '女', null, null, null, null, null, null, 'f368bf4e-9976-484e-9630-6d520121f3b6', null);
INSERT INTO "public"."sys_user_info" VALUES ('f08247a8-6609-45c7-9f4d-1d4ee0152954', null, '男', null, null, null, null, null, null, 'b9839caf-b0ce-4e28-a06f-284b6d1885a6', null);
INSERT INTO "public"."sys_user_info" VALUES ('93634288-e6a8-410c-8709-8119f46a0c8d', null, '女', null, null, null, null, null, null, '069fc5a3-5d88-4a76-9f65-536a0a76802c', null);
INSERT INTO "public"."sys_user_info" VALUES ('2a151e96-fbde-4b19-bf8d-26f580d95e0c', null, '男', null, null, null, null, null, null, '77d6a7d8-7d38-4040-9d49-68979f4eb038', null);
INSERT INTO "public"."sys_user_info" VALUES ('d266c551-6333-43e5-b854-2ef179c68cd8', null, '女', null, null, null, null, null, null, 'b404180a-2a7d-4663-87ef-dd1739411aa0', null);
INSERT INTO "public"."sys_user_info" VALUES ('e9be6cb3-8293-4ca4-b2de-c82cb2f3f71a', null, '男', null, null, null, null, null, null, '71fdae11-42fa-480d-ae8c-d5a99dbf6bd9', null);
INSERT INTO "public"."sys_user_info" VALUES ('a93d3204-2abb-4c8b-a941-d420876d0a5d', null, '女', null, null, null, null, null, null, 'a79615e9-b480-4f0b-8335-571b2bef7dbd', null);
INSERT INTO "public"."sys_user_info" VALUES ('f8bed710-a25a-40d6-b599-28853513bb25', null, '男', null, null, null, null, null, null, '2816f52c-a6e5-4566-9bf6-d8d83db49290', null);
INSERT INTO "public"."sys_user_info" VALUES ('4521ce41-ba28-4d73-9f1e-a4c2f916ccb3', null, '女', null, null, null, null, null, null, '21d70112-67c0-44e8-b55f-b8a50aba1f9c', null);
INSERT INTO "public"."sys_user_info" VALUES ('dc674ad3-53a6-487e-80b4-b479f98bfa1d', null, '男', null, null, null, null, null, null, '45d31464-3db2-465a-9b17-d234fed97b8a', null);
INSERT INTO "public"."sys_user_info" VALUES ('4e13b555-78c7-4a17-b2f6-048ad1abd002', null, '女', null, null, null, null, null, null, '6f5c5771-eb1a-4ca2-8e91-e60779967017', null);
INSERT INTO "public"."sys_user_info" VALUES ('48b2759b-8699-478d-825c-4c93d7ff893c', null, '男', null, null, null, null, null, null, 'b000fe65-4805-4f7a-9a1d-8da40da6cd41', null);
INSERT INTO "public"."sys_user_info" VALUES ('8354321a-2e88-4a87-bfe1-c8d99c41f176', null, '女', null, null, null, null, null, null, 'eb7595d0-fd3d-4cfd-80f1-a21c124fae96', null);
INSERT INTO "public"."sys_user_info" VALUES ('359926a3-eec9-481b-84d0-95efcd5a630d', null, '男', null, null, null, null, null, null, '188cbca9-2fd7-420e-9d30-4ec2886d1f0c', null);
INSERT INTO "public"."sys_user_info" VALUES ('141e4586-b3a5-493f-93d1-8a5bc92117c8', null, '女', null, null, null, null, null, null, '2ba39cda-7bc8-44a9-a664-a9557fedf3e0', null);
INSERT INTO "public"."sys_user_info" VALUES ('0524b675-26c9-4606-9eba-06b32d73cda3', null, '男', null, null, null, null, null, null, 'e1ce9a12-37a7-433e-a3b0-ecc6c744f660', null);
INSERT INTO "public"."sys_user_info" VALUES ('6bfb4c09-a004-4133-86cb-0e3295d79fb9', null, '女', null, null, null, null, null, null, '46eeb9e5-a786-4187-93f8-179d00c08fa7', null);
INSERT INTO "public"."sys_user_info" VALUES ('c2b3e558-41b4-4d1e-aed1-5142b8f610a9', null, '男', null, null, null, null, null, null, 'ba6036b9-6c9f-45b7-864b-4dfa92929bf4', null);
INSERT INTO "public"."sys_user_info" VALUES ('494cd955-e826-42ff-a5c5-5291b5ce66d2', null, '女', null, null, null, null, null, null, '0e7554eb-5553-4523-95ed-c3d75a63de03', null);
INSERT INTO "public"."sys_user_info" VALUES ('116dee00-9aff-44f4-b39a-bcf7ae475d45', null, '男', null, null, null, null, null, null, '7f0d1294-90a1-4e41-ae1e-832c068798db', null);
INSERT INTO "public"."sys_user_info" VALUES ('c4b3fa6f-44d9-4e80-a53f-c89cb8a1d6df', null, '女', null, null, null, null, null, null, '82c330b0-f494-4c31-83a1-6f2719477e44', null);
INSERT INTO "public"."sys_user_info" VALUES ('37accbd2-4ea4-4a29-84ef-7ceaaa1ee54e', null, '男', null, null, null, null, null, null, 'c8f00c73-003e-470e-b3ba-7035e462b6ca', null);
INSERT INTO "public"."sys_user_info" VALUES ('4c71ed22-0a2e-49e5-af8c-73a89d3c2b87', null, '女', null, null, null, null, null, null, 'c8da34ef-d782-41d9-8068-f4cb3d5adef0', null);
INSERT INTO "public"."sys_user_info" VALUES ('32cc3ee8-8aec-4d17-b2dc-bb73f675952b', null, '男', null, null, null, null, null, null, '943b3e29-640d-4247-b998-782c28b7238d', null);
INSERT INTO "public"."sys_user_info" VALUES ('2fe7d82a-e02c-4ebe-bbf6-e04ad09434d8', null, '女', null, null, null, null, null, null, 'b290a161-156e-4a94-8c1e-252a415cf761', null);
INSERT INTO "public"."sys_user_info" VALUES ('34e7fa64-501d-4c10-9a2e-4f2c4724003c', null, '男', null, null, null, null, null, null, '3375305b-1e19-42d1-92ad-feef0b5962a1', null);
INSERT INTO "public"."sys_user_info" VALUES ('e605127e-1c81-48f2-a609-505e2aac8cd5', null, '女', null, null, null, null, null, null, 'd3524411-f424-401a-bee7-52ff40a40b4a', null);
INSERT INTO "public"."sys_user_info" VALUES ('cc827e00-b115-4b4a-8ab1-26137c00240d', null, '男', null, null, null, null, null, null, '2180783d-98ee-43e3-a77a-d0fe8488a226', null);
INSERT INTO "public"."sys_user_info" VALUES ('22f55085-bfd2-4ece-88f1-8e68ec4d329d', null, '女', null, null, null, null, null, null, '2cbdb753-95ca-4bfc-a156-d9c64eb1161c', null);
INSERT INTO "public"."sys_user_info" VALUES ('53d8e398-40c0-4026-9117-b4facfe639fa', null, '男', null, null, null, null, null, null, 'adef5682-714a-4ca1-bc37-56bbb35f43d4', null);
INSERT INTO "public"."sys_user_info" VALUES ('1976f775-5eb2-4457-8fa2-c6ee9fd4c3ff', null, '女', null, null, null, null, null, null, '65d58da5-0df0-4434-b7c3-1766d833a598', null);
INSERT INTO "public"."sys_user_info" VALUES ('19f23690-049c-4a4f-9329-1dd0e999ca72', null, '男', null, null, null, null, null, null, '1ca0063e-29a7-4715-ac71-831cf7f066ab', null);
INSERT INTO "public"."sys_user_info" VALUES ('237f9405-40c5-448a-a0a7-928dc0d9ed0f', null, '女', null, null, null, null, null, null, 'd49071b9-20f5-4256-b6e3-f924be814fc9', null);
INSERT INTO "public"."sys_user_info" VALUES ('2ea60729-9d99-49ff-9ce3-63d33f715081', null, '男', null, null, null, null, null, null, '91cfb19c-d196-4a3f-9294-af56f7ad2f93', null);
INSERT INTO "public"."sys_user_info" VALUES ('6dc23854-6705-4177-a9ce-4d8e62d45896', null, '女', null, null, null, null, null, null, '0feef8e6-5bf7-40e9-822e-3cd87ce3c445', null);
INSERT INTO "public"."sys_user_info" VALUES ('4fdd04ff-2610-45fb-b28c-34487d983f7e', null, '男', null, null, null, null, null, null, 'da9ba4f3-609a-48d8-9498-40bfa24b1396', null);
INSERT INTO "public"."sys_user_info" VALUES ('2edb48ea-892c-4e00-9528-7557d49eee72', null, '女', null, null, null, null, null, null, '9649a6f7-2a2d-4912-984e-5c6b38982c3d', null);
INSERT INTO "public"."sys_user_info" VALUES ('55f0948a-2f2d-4b7f-8cba-5a0b637f8a2f', null, '男', null, null, null, null, null, null, '84aed0da-7a9f-4349-a830-8944929c5db3', null);
INSERT INTO "public"."sys_user_info" VALUES ('4cb8a1a8-68b1-4305-8c90-354e6a00028c', null, '女', null, null, null, null, null, null, 'e10e3567-c0f7-439b-9a45-e928bad01bc7', null);
INSERT INTO "public"."sys_user_info" VALUES ('61253d99-6918-4010-a17e-bca5ad3bb274', null, '男', null, null, null, null, null, null, '212c1b69-47ef-47bc-ad4e-887ccf9743c2', null);
INSERT INTO "public"."sys_user_info" VALUES ('49982ef2-5d9c-4a22-b857-08f1ae7ade3c', null, '女', null, null, null, null, null, null, '87087c6a-8acd-43a3-8055-3bd0812a86c9', null);
INSERT INTO "public"."sys_user_info" VALUES ('724a7684-ff98-41ac-b517-997128ea0630', null, '男', null, null, null, null, null, null, '9e6f7e3c-28ed-45ba-8e56-eab2e96dc8d6', null);
INSERT INTO "public"."sys_user_info" VALUES ('687b4f93-282e-46c2-a82e-720d8020d0a3', null, '女', null, null, null, null, null, null, '79c5e985-1c36-4a63-af0a-300d3567a916', null);
INSERT INTO "public"."sys_user_info" VALUES ('fd561c58-d126-40a9-ae89-df7ea025e175', null, '男', null, null, null, null, null, null, 'aa1fd99c-4945-4cf0-a341-54520e6154b3', null);
INSERT INTO "public"."sys_user_info" VALUES ('7863ad91-f46f-43b1-b8f0-934cdb49f51f', null, '女', null, null, null, null, null, null, '17292b64-3dff-46c4-9dfd-63b4da66da7b', null);
INSERT INTO "public"."sys_user_info" VALUES ('dd5076e2-7947-4a52-b4e2-00ee3ce71d2a', null, '男', null, null, null, null, null, null, '9578ee39-3154-4ba6-b125-6e89174302cd', null);
INSERT INTO "public"."sys_user_info" VALUES ('a57e8199-1cba-4091-b0b3-85d3bb88eab5', null, '女', null, null, null, null, null, null, 'f80f233d-1c2f-43cb-9aa6-698c4022b705', null);
INSERT INTO "public"."sys_user_info" VALUES ('32c422b3-c20b-4807-a2d8-aa75c84f9c6c', null, '男', null, null, null, null, null, null, '74d252bb-a3c3-4b31-872d-517a58142a15', null);
INSERT INTO "public"."sys_user_info" VALUES ('144440a6-b684-4fec-81c2-00f0aa930812', null, '女', null, null, null, null, null, null, 'c225b120-b8de-4f91-bc99-7bd85bb74669', null);
INSERT INTO "public"."sys_user_info" VALUES ('e6f77747-701c-4199-a3af-d67630973062', null, '男', null, null, null, null, null, null, '0be80d0d-c267-403d-8b8f-9ffa7e356b5f', null);
INSERT INTO "public"."sys_user_info" VALUES ('c431cd09-51e2-478c-b6a9-38a1b1cef4e7', null, '女', null, null, null, null, null, null, '07cc7ee8-5834-49a7-8fa1-c420d8ddffd6', null);
INSERT INTO "public"."sys_user_info" VALUES ('8f70027d-fd1d-44fc-be26-afa657ca4287', null, '男', null, null, null, null, null, null, '32ba3fd6-7e3b-4249-82f8-a083051ebd46', null);
INSERT INTO "public"."sys_user_info" VALUES ('642a7ee6-c1b0-424f-b2ff-c8046eab4a2a', null, '女', null, null, null, null, null, null, '8cf9234b-e4d0-4ad3-93f6-b9913a8041aa', null);
INSERT INTO "public"."sys_user_info" VALUES ('b21322a6-e83f-49e8-b4d8-04219d7c10e8', null, '男', null, null, null, null, null, null, '93b2cd58-e245-4f14-af5c-b39aaa552574', null);
INSERT INTO "public"."sys_user_info" VALUES ('b49e5cae-5c67-40da-b2ec-6bd5b3291c37', null, '女', null, null, null, null, null, null, '7116de29-82f7-48fb-8b69-22214d38c9bd', null);
INSERT INTO "public"."sys_user_info" VALUES ('7f268ed3-77a2-421c-b62d-a4a72677a425', null, '男', null, null, null, null, null, null, '71a99bb1-8dcd-4156-b48f-0d02219acb51', null);
INSERT INTO "public"."sys_user_info" VALUES ('20dc6799-7400-4148-ba3a-af647e32b62c', null, '女', null, null, null, null, null, null, '934b7b4d-8457-4b04-aee0-8368f2984406', null);
INSERT INTO "public"."sys_user_info" VALUES ('ff85953e-d2c0-4698-ae6a-1c38a4ab1f2f', null, '男', null, null, null, null, null, null, '92e04e9c-24db-450e-8740-973474a92053', null);
INSERT INTO "public"."sys_user_info" VALUES ('ededea47-954b-4f31-b504-165d1c299cf5', null, '女', null, null, null, null, null, null, '26dcd6ed-01d6-42ae-8bd5-2bde27f356cc', null);
INSERT INTO "public"."sys_user_info" VALUES ('17f08362-8214-4421-a242-210f76ea527f', null, '男', null, null, null, null, null, null, 'b3e9a0c9-f573-4494-a69f-2b65fb4f10df', null);
INSERT INTO "public"."sys_user_info" VALUES ('5285a06b-eda3-4816-a156-eb121edb1879', null, '女', null, null, null, null, null, null, '9514efb6-8f76-4179-bac0-16ecaad4f94c', null);
INSERT INTO "public"."sys_user_info" VALUES ('8bb629eb-3ee2-499a-8b9b-f716879fc74d', null, '男', null, null, null, null, null, null, '2bb30024-4fef-4f5d-8f8f-91fbf361a32b', null);
INSERT INTO "public"."sys_user_info" VALUES ('07c3869e-b7f8-4626-8c96-480a27752944', null, '女', null, null, null, null, null, null, '2cce41c5-af52-4a1a-8fc6-bb00a27354da', null);
INSERT INTO "public"."sys_user_info" VALUES ('dc915381-2b9c-4d56-b74b-d4771b9a5105', null, '男', null, null, null, null, null, null, 'd865fad9-5dd7-40bb-a0a5-69fb00ca64cc', null);
INSERT INTO "public"."sys_user_info" VALUES ('b383869c-bfdc-4862-b843-382d23975bd8', null, '女', null, null, null, null, null, null, 'cc13210a-928c-43f8-9dcb-75945d297987', null);
INSERT INTO "public"."sys_user_info" VALUES ('3c5c4e1d-9425-46b1-a8bb-d988f29ba17d', null, '男', null, null, null, null, null, null, 'cea74646-07f4-460a-bde3-126ac46071cc', null);
INSERT INTO "public"."sys_user_info" VALUES ('f0e81040-584d-4b9a-9e50-6d9ff80e58c1', null, '女', null, null, null, null, null, null, '045d7346-2e3c-4f1f-98d5-2d159b4ff3aa', null);
INSERT INTO "public"."sys_user_info" VALUES ('28eca01e-d5ea-4bbd-bdf7-e851015ae300', null, '男', null, null, null, null, null, null, '3a454186-2a1f-43f6-b450-740eeeeab0e8', null);
INSERT INTO "public"."sys_user_info" VALUES ('b047c8a5-bf06-4927-83ec-1ade836d7caf', null, '女', null, null, null, null, null, null, 'e2dae195-bfe0-43bc-8be4-b2f783638b49', null);
INSERT INTO "public"."sys_user_info" VALUES ('7772c694-53a2-420a-8bfe-ff33e6c26cbc', null, '男', null, null, null, null, null, null, 'bfeeeffe-8d55-4e83-8a3f-6f6e17a67c0e', null);
INSERT INTO "public"."sys_user_info" VALUES ('10caa975-f4e0-4b2e-bc99-90f711d01c64', null, '女', null, null, null, null, null, null, '3c18a3bd-ac81-47a7-927d-e8a359607c2e', null);
INSERT INTO "public"."sys_user_info" VALUES ('1d054cad-d6d1-45a4-a5ba-50c9c5dc5bce', null, '男', null, null, null, null, null, null, '7b648e19-60ee-411a-9366-fef988f53663', null);
INSERT INTO "public"."sys_user_info" VALUES ('3ab3c911-114e-4672-9c15-0fbaa80e6b0e', null, '女', null, null, null, null, null, null, 'c395b4e6-d780-461a-8102-94378504c769', null);
INSERT INTO "public"."sys_user_info" VALUES ('1eeb0407-5d6a-4bfa-b21c-e52301e3ad1b', null, '男', null, null, null, null, null, null, 'aa5ea19e-5683-4cee-bed2-2a49d313a562', null);
INSERT INTO "public"."sys_user_info" VALUES ('e08e4fca-0137-47fd-a6f6-f51b672c7451', null, '女', null, null, null, null, null, null, '5e7453f2-7e52-4640-9168-4f15f7703171', null);
INSERT INTO "public"."sys_user_info" VALUES ('b3591fde-0460-48ed-8340-b42d99cb8644', null, '男', null, null, null, null, null, null, 'e5b81746-e1a8-4e14-bb62-f2632b0ff6e3', null);
INSERT INTO "public"."sys_user_info" VALUES ('8ee07e46-3234-4cae-8460-27d57191dc84', null, '女', null, null, null, null, null, null, '5408726d-5dff-4bda-8402-d5ee803cbe57', null);
INSERT INTO "public"."sys_user_info" VALUES ('4286ad49-56dd-4681-aba1-d404cd8c1411', null, '男', null, null, null, null, null, null, '5e946ebf-9ed3-4358-b8f2-630dfa6bc98e', null);
INSERT INTO "public"."sys_user_info" VALUES ('c068fa6b-0a4c-46bc-8d9b-8f184bf28743', null, '女', null, null, null, null, null, null, '91a9aded-e446-4a8b-8c65-c6d2d307408a', null);
INSERT INTO "public"."sys_user_info" VALUES ('403b57c0-1734-470e-8e14-f68f63d8e08f', null, '男', null, null, null, null, null, null, '278f1f50-4a0b-492c-82df-2ed7baf4cb63', null);
INSERT INTO "public"."sys_user_info" VALUES ('920b4a4e-62b9-4d34-830b-3cf83e493c0a', null, '女', null, null, null, null, null, null, '1831e022-5cf3-43b8-bd71-771d5fd85827', null);
INSERT INTO "public"."sys_user_info" VALUES ('889db252-2eb2-490d-8cce-c3c4261b8c78', null, '男', null, null, null, null, null, null, '2e5c3d06-1b5a-417c-b617-900379c53e9a', null);
INSERT INTO "public"."sys_user_info" VALUES ('da2ce352-61ed-4e31-a09b-3c09b7838f23', null, '女', null, null, null, null, null, null, '9754fde4-d79e-4dcd-a265-02f5c81525c9', null);
INSERT INTO "public"."sys_user_info" VALUES ('fc7c391a-ad8c-4c55-a435-82870dadff17', null, '男', null, null, null, null, null, null, 'd0262cc2-ed2f-472c-b330-795bd2049722', null);
INSERT INTO "public"."sys_user_info" VALUES ('f05feb22-b19f-4df9-be44-12149e1b397a', null, '女', null, null, null, null, null, null, 'ff88ee22-6098-4057-982b-7edf41efc2c6', null);
INSERT INTO "public"."sys_user_info" VALUES ('1b465466-0ee0-4304-84f1-9c98bd82aaac', null, '男', null, null, null, null, null, null, '4fa68747-9dbe-4775-90d3-99a348103075', null);
INSERT INTO "public"."sys_user_info" VALUES ('906bcdf3-185f-4dc8-be41-4535614632b1', null, '女', null, null, null, null, null, null, '5e4ac0cb-bda0-4e2d-8ea4-45ab9eaf2628', null);
INSERT INTO "public"."sys_user_info" VALUES ('1e2bbc53-b5aa-4fed-932b-c5fbdfd964b1', null, '男', null, null, null, null, null, null, '098b5b38-831c-443e-980f-301ccf96bf65', null);
INSERT INTO "public"."sys_user_info" VALUES ('06a4dcfe-fe5e-4495-87c7-016751105c9c', null, '女', null, null, null, null, null, null, '3d83856b-25ac-4f3a-aae0-0b0aaa65f6e8', null);
INSERT INTO "public"."sys_user_info" VALUES ('f68ed439-d07b-451f-905d-b38c28d29212', null, '男', null, null, null, null, null, null, '3dcfb01c-9b66-4222-bf52-906a0b91c63c', null);
INSERT INTO "public"."sys_user_info" VALUES ('c47e0c1f-816f-418b-9da5-e172702f162c', null, '女', null, null, null, null, null, null, '2c134970-b324-4bba-b4aa-67d10a1ccd36', null);
INSERT INTO "public"."sys_user_info" VALUES ('3d84ed33-88f1-4c22-9a85-4166528e9480', null, '男', null, null, null, null, null, null, 'a564e1de-ca1e-4ea0-83e2-8b03da27ba55', null);
INSERT INTO "public"."sys_user_info" VALUES ('33384324-c789-4f0e-9c88-037a8f37e5ef', null, '女', null, null, null, null, null, null, '8edf7fab-69a7-47b8-9d40-bc12be68c481', null);
INSERT INTO "public"."sys_user_info" VALUES ('94f58d49-1434-4be4-8656-10e78209509a', null, '男', null, null, null, null, null, null, '229891d7-de1a-4068-a894-c7d5310d9e1e', null);
INSERT INTO "public"."sys_user_info" VALUES ('e0beca04-d609-4fe2-a013-6d6247ce2e40', null, '女', null, null, null, null, null, null, '0d5872a2-1b79-4dee-9eda-7dbaf5b10ad7', null);
INSERT INTO "public"."sys_user_info" VALUES ('1ed7c090-1c04-4b1e-83ce-79e809d825d9', null, '男', null, null, null, null, null, null, '99489eb3-b425-4927-92a0-e0c3c96d29ed', null);
INSERT INTO "public"."sys_user_info" VALUES ('b02ea474-1abd-4cbf-84da-8a62d7e1e798', null, '女', null, null, null, null, null, null, '32f48e5c-53e9-46a9-b7d5-3aaec96c4b05', null);
INSERT INTO "public"."sys_user_info" VALUES ('baa825e5-98b8-4b6d-add1-4ebcbbdb6b0d', null, '男', null, null, null, null, null, null, '3a49d10b-2004-40c4-b0d8-6cc833f5980f', null);
INSERT INTO "public"."sys_user_info" VALUES ('4dfbcfa4-266c-4d87-92b8-9b265c21de5b', null, '女', null, null, null, null, null, null, '109d9c41-a691-40f1-b3c7-744019abdff2', null);
INSERT INTO "public"."sys_user_info" VALUES ('17839005-85e7-4b75-8d44-18e1832a2fa6', null, '男', null, null, null, null, null, null, 'acf0bc6c-5ab1-4dcd-a5c8-714b4c07f9c2', null);
INSERT INTO "public"."sys_user_info" VALUES ('9d72e53f-4c2d-4193-9b50-822476cbc77b', null, '女', null, null, null, null, null, null, '2a3fe145-8471-4c98-8d08-0b558b493c74', null);
INSERT INTO "public"."sys_user_info" VALUES ('f40a0220-0093-4531-b13c-1183c62414d9', null, '男', null, null, null, null, null, null, '05e6b9b0-7138-4170-b308-6341bd14455f', null);
INSERT INTO "public"."sys_user_info" VALUES ('869bb22c-d1b1-44d3-9658-735635182cbb', null, '女', null, null, null, null, null, null, '7caef891-ab9e-484a-8dfa-432a63bd39dd', null);
INSERT INTO "public"."sys_user_info" VALUES ('381e68a4-fdf1-4735-ad4f-ccefe212700c', null, '男', null, null, null, null, null, null, '93d0459d-7df5-47d0-87ca-30bd1d8929f8', null);
INSERT INTO "public"."sys_user_info" VALUES ('e8bd8b3e-5be1-4a9f-bb64-c16cc0297bbe', null, '女', null, null, null, null, null, null, '08a59ed2-f217-4f3e-9d31-a760e597bc49', null);
INSERT INTO "public"."sys_user_info" VALUES ('df34746f-93ba-4884-98de-c156784fa7ea', null, '男', null, null, null, null, null, null, '2ee3c6ef-971e-41c5-8664-fe67e970ad06', null);
INSERT INTO "public"."sys_user_info" VALUES ('48bc2f20-31ed-43ee-b811-3aed49619484', null, '女', null, null, null, null, null, null, '4b839b12-db18-460d-b337-66a7a9d18449', null);
INSERT INTO "public"."sys_user_info" VALUES ('53d4c7a4-0d0d-42d9-b326-50494d77da31', null, '男', null, null, null, null, null, null, 'e732262d-ad68-4df1-b4b4-885e1b7eeefe', null);
INSERT INTO "public"."sys_user_info" VALUES ('df18c772-2d7c-4bd6-a5d8-22e3c1dce635', null, '女', null, null, null, null, null, null, '0e248417-47c6-44a5-9b2f-04d9ef32f65f', null);
INSERT INTO "public"."sys_user_info" VALUES ('5938db42-beab-44c5-ad33-b2f392b1c651', null, '男', null, null, null, null, null, null, 'cabd4f21-246e-43ec-992d-3c0770647cfe', null);
INSERT INTO "public"."sys_user_info" VALUES ('fda18069-a97d-48d8-ba1e-cade309999ae', null, '女', null, null, null, null, null, null, 'b418abcf-881b-4c41-bc78-ab68c6f31ad4', null);
INSERT INTO "public"."sys_user_info" VALUES ('28318642-7a73-474e-b043-4a88a7b55fcc', null, '男', null, null, null, null, null, null, '1d02e936-a329-4b6c-974e-f392dd40ec5b', null);
INSERT INTO "public"."sys_user_info" VALUES ('02693871-34a9-4c80-829c-0dc40aa71850', null, '女', null, null, null, null, null, null, '98ef8a61-66c3-41e9-a0b9-9ce425331e3a', null);
INSERT INTO "public"."sys_user_info" VALUES ('6ebcbf0c-5065-446d-a223-e07bd17a25b8', null, '男', null, null, null, null, null, null, '7fccee1d-3eb9-4755-8638-4e650f0aedb3', null);
INSERT INTO "public"."sys_user_info" VALUES ('ad8be1e2-6983-4fd4-9f72-3bee0210c9cd', null, '女', null, null, null, null, null, null, 'a4b9e7c9-8e21-41b8-b3d6-465efc898613', null);
INSERT INTO "public"."sys_user_info" VALUES ('25034d32-1d4d-4cfc-905f-985a501e7176', null, '男', null, null, null, null, null, null, '16377c2c-1d26-4a95-a626-79b96e52e3c8', null);
INSERT INTO "public"."sys_user_info" VALUES ('0344b88b-7154-4d8c-ac59-37f435483b37', null, '女', null, null, null, null, null, null, '4c0f56af-64a9-42ee-b862-ae8852f10663', null);
INSERT INTO "public"."sys_user_info" VALUES ('08f05cdb-da29-4c48-9fe6-4139bd34c42e', null, '男', null, null, null, null, null, null, 'a10a4914-88e7-4dc4-9fad-d2edd76f10f6', null);
INSERT INTO "public"."sys_user_info" VALUES ('dd8f4025-9e15-40b6-a64d-188cc706968f', null, '女', null, null, null, null, null, null, '7c60a550-b1bf-4bea-b9b1-c5fdde81e38d', null);
INSERT INTO "public"."sys_user_info" VALUES ('c8e0cf7d-cc8b-41d1-8031-d23164ee11d2', null, '男', null, null, null, null, null, null, '29de20e7-d54b-4169-bd97-facd8a7fa936', null);
INSERT INTO "public"."sys_user_info" VALUES ('48d9bb00-79ba-4562-863b-efba199c1c05', null, '女', null, null, null, null, null, null, '0147390c-ddf3-4bde-8f09-0f59061b84b3', null);
INSERT INTO "public"."sys_user_info" VALUES ('e345c52c-062f-483e-81d9-1e24de935cb8', null, '男', null, null, null, null, null, null, '313aaefc-7c90-4fe2-9328-2aff0c7f0ea0', null);
INSERT INTO "public"."sys_user_info" VALUES ('1ac00efb-b5cb-4ec8-b8c9-ef0138214349', null, '女', null, null, null, null, null, null, '0c58af31-951c-4697-aa4b-e6dce446b6ef', null);
INSERT INTO "public"."sys_user_info" VALUES ('38755104-26e5-4c45-9478-0631e3e7e758', null, '男', null, null, null, null, null, null, '8565c8ab-e737-46f3-a02b-39803b2636a0', null);
INSERT INTO "public"."sys_user_info" VALUES ('f4d6d62f-ff13-402f-9c54-7065b6ab150d', null, '女', null, null, null, null, null, null, '8d40d58e-9a1e-430f-abc0-45441a4af369', null);
INSERT INTO "public"."sys_user_info" VALUES ('9edd85f9-8163-4c4c-8dd9-62052c456b08', null, '男', null, null, null, null, null, null, 'f22c825a-041e-4830-bea6-fe929e1be295', null);
INSERT INTO "public"."sys_user_info" VALUES ('91d40119-5f07-4de7-9030-6f8720e02501', null, '女', null, null, null, null, null, null, 'a54f5451-5f68-4db6-926a-c916b6c99152', null);
INSERT INTO "public"."sys_user_info" VALUES ('fa08c6de-e482-45b2-a4dc-30677d10652b', null, '男', null, null, null, null, null, null, 'e41d43ea-ec38-468e-86f2-87e0b13ac3ed', null);
INSERT INTO "public"."sys_user_info" VALUES ('1b8d8872-56ae-420b-95e3-90cbb2a473a0', null, '女', null, null, null, null, null, null, 'fbaaba1d-c01b-4b89-a9a0-75c375b24c98', null);
INSERT INTO "public"."sys_user_info" VALUES ('28c45ebe-94f1-44f2-b04c-4e09a23b37a4', null, '男', null, null, null, null, null, null, '016f83db-ff62-4695-9607-cb40bc74bcb6', null);
INSERT INTO "public"."sys_user_info" VALUES ('ce77a6e2-b8a8-4338-abf0-c30971f3b902', null, '女', null, null, null, null, null, null, 'f17ae40e-5d12-450b-8f94-639438258a17', null);
INSERT INTO "public"."sys_user_info" VALUES ('8c8db653-956a-475b-9c7c-4d5ebd4e3509', null, '男', null, null, null, null, null, null, '99b65bb9-89b4-470f-8887-73c6d7f31368', null);
INSERT INTO "public"."sys_user_info" VALUES ('c1e18b9e-0350-4920-af67-a9dec94d2211', null, '女', null, null, null, null, null, null, '170177b4-9cf8-407c-abc8-5491a5f0b72d', null);
INSERT INTO "public"."sys_user_info" VALUES ('a3c0323e-74a9-4887-a61c-5a5cba673087', null, '男', null, null, null, null, null, null, '69d8a640-5364-4ed7-9ee8-c729af43102e', null);
INSERT INTO "public"."sys_user_info" VALUES ('1fc1f018-9e9d-4b7c-b4e1-bb53fe2403ff', null, '女', null, null, null, null, null, null, 'defef316-32ac-41fa-9e2a-5aee0e68f1f5', null);
INSERT INTO "public"."sys_user_info" VALUES ('c459efe7-3971-4036-b138-65234d49066d', null, '男', null, null, null, null, null, null, 'f15e6eeb-3905-4a05-aaec-f830f1ac1aaf', null);
INSERT INTO "public"."sys_user_info" VALUES ('9d377e98-17f5-4812-bef5-ad982f69e1a6', null, '女', null, null, null, null, null, null, 'ee564c38-4783-46b0-a2f5-0dca3b32cf06', null);
INSERT INTO "public"."sys_user_info" VALUES ('b338a8eb-249c-461c-9eb2-f7bd1e097d5f', null, '男', null, null, null, null, null, null, '03e4e9cd-cce7-4e9a-a6b4-745837154094', null);
INSERT INTO "public"."sys_user_info" VALUES ('b4ec8e00-fdb1-46b9-a05b-7b689d082a3c', null, '女', null, null, null, null, null, null, '206f5247-255c-4563-92d3-014295fb8489', null);
INSERT INTO "public"."sys_user_info" VALUES ('98795902-1619-436d-9d9f-bf0d8c303fea', null, '男', null, null, null, null, null, null, 'a5be6f05-9957-47e4-b987-f7a0166448a2', null);
INSERT INTO "public"."sys_user_info" VALUES ('d6e6c7a7-4dfe-4490-8147-87aca1f0e840', null, '女', null, null, null, null, null, null, 'e9ef95b2-6f52-429e-aeea-d2c6af2dac42', null);
INSERT INTO "public"."sys_user_info" VALUES ('1d23c023-8342-48fa-80df-dfb380b74d80', null, '男', null, null, null, null, null, null, 'df683ec9-7e42-4693-95d3-8667791c5e2b', null);
INSERT INTO "public"."sys_user_info" VALUES ('64b42b46-15b8-4d66-8b90-8f6d603cdca3', null, '女', null, null, null, null, null, null, '39f55003-8856-42e3-a9c1-c60d497282ff', null);
INSERT INTO "public"."sys_user_info" VALUES ('52866680-915d-4a09-ad48-1516b30cf795', null, '男', null, null, null, null, null, null, '057b10de-77b5-456e-bfcd-f907a6b6b910', null);
INSERT INTO "public"."sys_user_info" VALUES ('6d7d1b86-9cae-4146-b5ae-ed7911df7431', null, '女', null, null, null, null, null, null, '47b35f11-06fb-440b-9ede-20bd0116408a', null);
INSERT INTO "public"."sys_user_info" VALUES ('b608ac20-3bdd-4dc0-9f3a-83fcbd666209', null, '男', null, null, null, null, null, null, '8c038736-bccd-4346-b667-07dd04e0b600', null);
INSERT INTO "public"."sys_user_info" VALUES ('f4051f06-0b84-4c85-ac13-21d52c4aa03c', null, '女', null, null, null, null, null, null, '3cd54e79-9dfd-4c73-9509-05092fec7f3d', null);
INSERT INTO "public"."sys_user_info" VALUES ('c1e3c564-68a8-45a3-a941-1f66324a9c18', null, '男', null, null, null, null, null, null, 'c293249c-d783-46c7-8dec-cad69c86a7d0', null);
INSERT INTO "public"."sys_user_info" VALUES ('6ba9c282-2ff7-4883-af56-bd28aa449f85', null, '女', null, null, null, null, null, null, '21b1434c-a493-4329-9653-78cbb9f07335', null);
INSERT INTO "public"."sys_user_info" VALUES ('998684c3-7310-4a07-a736-a21b8308025b', null, '男', null, null, null, null, null, null, '78b7d482-2fed-4876-b90c-da4880ffafca', null);
INSERT INTO "public"."sys_user_info" VALUES ('ac1b800b-9a4f-47f5-9dc3-c974aaa7cc91', null, '女', null, null, null, null, null, null, 'ca3284d0-68b3-4ae8-9301-465fde284520', null);
INSERT INTO "public"."sys_user_info" VALUES ('1b896b9c-667b-4ace-ad16-579e8903a4a8', null, '男', null, null, null, null, null, null, '458b563f-3261-4488-b6de-ed9671579bfb', null);
INSERT INTO "public"."sys_user_info" VALUES ('ab6222da-b84e-4a4a-86b5-4452c3cc0a7b', null, '女', null, null, null, null, null, null, 'c9f2f441-25ca-4af6-a3bc-0fc11e9a472e', null);
INSERT INTO "public"."sys_user_info" VALUES ('328fe49d-5c7c-404c-a270-80e8d07bef49', null, '男', null, null, null, null, null, null, '661ddd14-692f-4100-a2ce-42f5679deac3', null);
INSERT INTO "public"."sys_user_info" VALUES ('9cedc8da-3c5a-4552-89a2-7d369f999dc8', null, '女', null, null, null, null, null, null, '4516d5a6-5745-4eef-b5a6-a079722e7a0d', null);
INSERT INTO "public"."sys_user_info" VALUES ('17ac948b-2921-4bc2-9156-099c745e0d6d', null, '男', null, null, null, null, null, null, '82424945-b0c1-4ca2-ae2e-7ba84d6ef370', null);
INSERT INTO "public"."sys_user_info" VALUES ('99d0ec53-458d-4586-b8fc-9a3a7c875b31', null, '女', null, null, null, null, null, null, 'c2fce12b-4678-43f3-be16-d3f99fabf095', null);
INSERT INTO "public"."sys_user_info" VALUES ('0b15531d-5668-4420-8dd5-c0e3ff8e105a', null, '男', null, null, null, null, null, null, '53d7541f-98ae-437b-af93-3bf88028f33e', null);
INSERT INTO "public"."sys_user_info" VALUES ('2cc2870f-97fe-4896-b6c9-e07ce6701582', null, '女', null, null, null, null, null, null, '5cc8e02c-807c-41de-94b9-8c9d9d6619e5', null);
INSERT INTO "public"."sys_user_info" VALUES ('d3b72030-6d3d-42dc-b808-ef05d65c169b', null, '男', null, null, null, null, null, null, '38edc581-e5f1-40ac-9ed7-bd0fdd78ecb7', null);
INSERT INTO "public"."sys_user_info" VALUES ('314264ce-a6f2-47cc-b194-8fe55246cf52', null, '女', null, null, null, null, null, null, 'eb8501d4-abdc-4bcf-8ee1-00a7fe70eb07', null);
INSERT INTO "public"."sys_user_info" VALUES ('798c5f7a-0f4e-47e8-936f-e13323ba591c', null, '男', null, null, null, null, null, null, '532292a4-6882-4450-9929-2c8271899ef3', null);
INSERT INTO "public"."sys_user_info" VALUES ('d28d381c-224e-42bc-a898-dc842b4a37e6', null, '女', null, null, null, null, null, null, '0457391a-d8e1-45ef-981d-81ac829625e2', null);
INSERT INTO "public"."sys_user_info" VALUES ('12020613-d70e-4722-b8b2-99399a0ac817', null, '男', null, null, null, null, null, null, 'bc7cc768-eef9-4bfa-b529-b5cd472087c8', null);
INSERT INTO "public"."sys_user_info" VALUES ('50dec55c-bb2d-4617-9336-272a99f102fd', null, '女', null, null, null, null, null, null, '9faca0a1-ce48-426c-b10e-f9eaa2f0e157', null);
INSERT INTO "public"."sys_user_info" VALUES ('2fe34d2a-766e-4b9c-a566-7afec1079a9e', null, '男', null, null, null, null, null, null, '185f8244-ec70-45df-b89c-d2fbf3c7728d', null);
INSERT INTO "public"."sys_user_info" VALUES ('e0ae69a6-a9ae-4c1d-9c91-70dcacc3c924', null, '女', null, null, null, null, null, null, 'b0943ddb-afbd-41c4-a7e3-35ec547e9595', null);
INSERT INTO "public"."sys_user_info" VALUES ('c18adb94-b7ee-498b-bf38-9a7a0ef00f0e', null, '男', null, null, null, null, null, null, 'a66031a2-0595-4b09-8191-a7ee3bc5be74', null);
INSERT INTO "public"."sys_user_info" VALUES ('57550b78-a382-4894-adea-c3aefea4b68f', null, '女', null, null, null, null, null, null, 'c92ef334-2040-493f-8c52-59bd1698587e', null);
INSERT INTO "public"."sys_user_info" VALUES ('3b8fa812-743f-4f93-854a-4098cf52e7ea', null, '男', null, null, null, null, null, null, '5336a3f2-57a8-4e06-a320-2ac2b1cd96df', null);
INSERT INTO "public"."sys_user_info" VALUES ('46e53f77-fad1-438b-b95a-c52a02031536', null, '女', null, null, null, null, null, null, 'b47e22a8-7c7b-40a9-961a-889d5ef104e9', null);
INSERT INTO "public"."sys_user_info" VALUES ('58c31c0b-fb78-4362-a3f7-cf278ab19675', null, '男', null, null, null, null, null, null, '79fae360-55e3-4354-a5a8-ee55c73d418d', null);
INSERT INTO "public"."sys_user_info" VALUES ('2da46b96-0176-4e05-867e-c828ef501a0e', null, '女', null, null, null, null, null, null, 'f7a0be44-1d1d-413c-8b8f-9a6ba785305d', null);
INSERT INTO "public"."sys_user_info" VALUES ('86664fd5-f046-4500-967f-03de732a7be6', null, '男', null, null, null, null, null, null, '463c0a97-2443-4d48-a630-663003a019a9', null);
INSERT INTO "public"."sys_user_info" VALUES ('5127d0d6-1dc1-4b67-9517-16a0e413b2f2', null, '女', null, null, null, null, null, null, '593eb295-07ff-47c8-82fb-6d9d4d88e535', null);
INSERT INTO "public"."sys_user_info" VALUES ('cf038972-d7d0-40b6-abc9-44677410c7e0', null, '男', null, null, null, null, null, null, '508c23a1-ab18-47e6-98e2-c5157fccbf9f', null);
INSERT INTO "public"."sys_user_info" VALUES ('5e8a3b63-f97c-4f00-adf9-694c94a6b574', null, '女', null, null, null, null, null, null, '1f4b9099-2c8c-4a62-bbaa-bede80f3fba4', null);
INSERT INTO "public"."sys_user_info" VALUES ('522ce190-9d3a-4539-a15d-306656b081f2', null, '男', null, null, null, null, null, null, '00fc0172-c754-4b17-8a09-3dae7a90e8d5', null);
INSERT INTO "public"."sys_user_info" VALUES ('f02c1d93-41af-47eb-bdf1-b1cb60b4fdc0', null, '女', null, null, null, null, null, null, '78d9c9d7-5d41-4d49-9d6d-c86453f43477', null);
INSERT INTO "public"."sys_user_info" VALUES ('2e9d6920-f421-499f-99ab-95c07647318a', null, '男', null, null, null, null, null, null, '8e1f0194-dcd4-4e25-a49b-ba6b14474b6f', null);
INSERT INTO "public"."sys_user_info" VALUES ('bcfe70a1-3383-4e79-826f-b57e7cdeed91', null, '女', null, null, null, null, null, null, 'f0d418ab-75a6-47e7-9d5d-4b608e5d1616', null);
INSERT INTO "public"."sys_user_info" VALUES ('12738259-777c-409a-ac50-618672f86723', null, '男', null, null, null, null, null, null, '3f31849f-2808-425f-87cb-32916a4b9b0b', null);
INSERT INTO "public"."sys_user_info" VALUES ('b5fd3fc3-57f7-46a7-ac75-4b00ba7ef27a', null, '女', null, null, null, null, null, null, '8102c98c-4764-494f-b23f-af0add6d40d3', null);
INSERT INTO "public"."sys_user_info" VALUES ('f0de03af-a9da-439c-acd0-3c2ab31083d9', null, '男', null, null, null, null, null, null, '4101b6db-b7a5-40b7-a300-ca85f8a53b16', null);
INSERT INTO "public"."sys_user_info" VALUES ('abba98d8-3b4a-4c6b-8a1a-659537017321', null, '女', null, null, null, null, null, null, '9e8801f9-7938-451d-aeae-9b3a110a7e26', null);
INSERT INTO "public"."sys_user_info" VALUES ('48ba2e0d-b769-4b38-84cd-ae2ada50cbdf', null, '男', null, null, null, null, null, null, 'eda920aa-6f94-491c-bba0-758a817b0b5c', null);
INSERT INTO "public"."sys_user_info" VALUES ('cef55ea2-75d8-4123-aabe-5edaf1fdfd4b', null, '女', null, null, null, null, null, null, '10b42a8a-79a3-44c2-a804-5b9c8ca7f7c7', null);
INSERT INTO "public"."sys_user_info" VALUES ('17e98be3-04d4-4dbd-841b-ad0d5b204d97', null, '男', null, null, null, null, null, null, '327b25da-1587-4ef9-8ab2-2c3ac80120cf', null);
INSERT INTO "public"."sys_user_info" VALUES ('db560d74-a619-4ff6-9e28-a449a486a891', null, '女', null, null, null, null, null, null, '9b5e3ada-a938-47c7-aa05-1b72bb42722b', null);
INSERT INTO "public"."sys_user_info" VALUES ('df49fdcd-9144-4f3e-958d-f05b9e8e67ec', null, '男', null, null, null, null, null, null, 'f75230b8-ca48-4cd1-9331-0f2de7aec438', null);
INSERT INTO "public"."sys_user_info" VALUES ('94ceb59a-753c-4397-865b-ace817067097', null, '女', null, null, null, null, null, null, 'f3910816-090a-43f4-8dda-309f23909089', null);
INSERT INTO "public"."sys_user_info" VALUES ('dbee163a-0903-4e48-8df8-ebaf31538ded', null, '男', null, null, null, null, null, null, 'f6a97c7b-934e-4ecc-98b1-300ee50f16fd', null);
INSERT INTO "public"."sys_user_info" VALUES ('a01ac1cf-a5ae-4131-a5b3-9ed68cd4f551', null, '女', null, null, null, null, null, null, '1cc593ea-eb2a-435e-9289-dfb1136bf493', null);
INSERT INTO "public"."sys_user_info" VALUES ('24123c3c-df20-4af2-b124-334c453ac9af', null, '男', null, null, null, null, null, null, '453d8fe0-62d4-43e4-957b-68c42ac595d8', null);
INSERT INTO "public"."sys_user_info" VALUES ('4eda230a-11c0-4029-829b-24c36c6a5bab', null, '女', null, null, null, null, null, null, '1fc03629-b90c-4056-a234-bd710f23f1cc', null);
INSERT INTO "public"."sys_user_info" VALUES ('801158eb-45b1-44bb-be13-6f750b792f81', null, '男', null, null, null, null, null, null, '3170045b-da08-4a4b-b5f6-9ea268dc1926', null);
INSERT INTO "public"."sys_user_info" VALUES ('5ebd7651-abf2-4fc5-ba2f-6b4ad6733171', null, '女', null, null, null, null, null, null, '5807542a-1f21-4ec7-b82c-2e441931f463', null);
INSERT INTO "public"."sys_user_info" VALUES ('a68ba602-6517-4693-84d6-e5fddc1f8cbc', null, '男', null, null, null, null, null, null, '7b25575e-ff50-4883-bf58-76610ccb0473', null);
INSERT INTO "public"."sys_user_info" VALUES ('ef016c16-b99c-41c1-b4ff-e957fc96bc9c', null, '女', null, null, null, null, null, null, 'ec44f3ce-e6a0-43d1-8574-5d8a9429fbb9', null);
INSERT INTO "public"."sys_user_info" VALUES ('50c9fd00-ccbd-4f14-a90a-8d931fdd91e2', null, '男', null, null, null, null, null, null, '74210686-afd5-4846-8539-169e46146ef3', null);
INSERT INTO "public"."sys_user_info" VALUES ('099fe4ea-4c25-4804-ab19-4b7d31ae57d2', null, '女', null, null, null, null, null, null, '2c341fe4-c99e-40af-9e79-1fb6068f3c01', null);
INSERT INTO "public"."sys_user_info" VALUES ('366020a5-aab6-4249-89c4-18d28b6a0e54', null, '男', null, null, null, null, null, null, '59c89e18-8769-493c-a6ef-9fd197aee039', null);
INSERT INTO "public"."sys_user_info" VALUES ('b21bb848-15f3-428f-b0e1-f3a8ac08b452', null, '女', null, null, null, null, null, null, '6975b84f-a4f2-4233-ad78-4935051f2f56', null);
INSERT INTO "public"."sys_user_info" VALUES ('e6d054b6-c3a0-48cc-8a52-57c424cb3e2d', null, '男', null, null, null, null, null, null, '8bfe1a29-f9ae-4b71-a07f-7549f4a2bb15', null);
INSERT INTO "public"."sys_user_info" VALUES ('5d42d484-d7fa-40bd-b5b0-f8f0f1835dea', null, '女', null, null, null, null, null, null, '27f969f5-82fb-4ca1-8770-ae0cc4538323', null);
INSERT INTO "public"."sys_user_info" VALUES ('d1112b6a-e8ec-43c8-ba45-421f76b91f03', null, '男', null, null, null, null, null, null, 'e02552f5-ca05-4eed-9ed6-4c7fd99d764e', null);
INSERT INTO "public"."sys_user_info" VALUES ('a49cf769-1fd9-4720-91a6-59750f8d01e5', null, '女', null, null, null, null, null, null, '391b42a0-8e1d-4e45-b4cf-55e8bd31708e', null);
INSERT INTO "public"."sys_user_info" VALUES ('18ace52e-af3f-4060-bc93-243a57ed68cc', null, '男', null, null, null, null, null, null, '9fed5c00-9af1-49f9-bcf3-09f48a6e7260', null);
INSERT INTO "public"."sys_user_info" VALUES ('6db6eea0-1228-4ccf-80ee-4cfce54a4fdb', null, '女', null, null, null, null, null, null, '94706f18-5ba1-43c3-8be3-b2fd2a800329', null);
INSERT INTO "public"."sys_user_info" VALUES ('0daedd14-1eb5-4347-bf70-42b011158e93', null, '男', null, null, null, null, null, null, '6408cff1-1f1a-4f82-8399-3fd03ebee062', null);
INSERT INTO "public"."sys_user_info" VALUES ('aef867fd-4d70-49a7-be37-642ab9b843fa', null, '女', null, null, null, null, null, null, 'd239e77c-2004-4282-a1d6-72227ffeac60', null);
INSERT INTO "public"."sys_user_info" VALUES ('d0bf53ab-adac-4bc9-be13-2bef693572d1', null, '男', null, null, null, null, null, null, 'be711e7b-65c7-43d9-9f3f-2996f4855611', null);
INSERT INTO "public"."sys_user_info" VALUES ('6c2d7357-95ca-453b-8eee-f9d4b1467992', null, '女', null, null, null, null, null, null, '188de5bb-e45e-44f4-bc3b-884e25262964', null);
INSERT INTO "public"."sys_user_info" VALUES ('471722b4-217e-44ae-b64c-8a7d2e86efb0', null, '男', null, null, null, null, null, null, '974fe34a-2520-4507-9e6b-f08b2309b39b', null);
INSERT INTO "public"."sys_user_info" VALUES ('005ee178-10b1-4682-a882-c8b17a0aead5', null, '女', null, null, null, null, null, null, '726b207b-fdd8-402f-b8c3-69f4344bc9f1', null);
INSERT INTO "public"."sys_user_info" VALUES ('fb75af2e-cdb7-4aae-9d6b-0fbfc022644d', null, '男', null, null, null, null, null, null, '789b9b46-0038-402d-9457-6595d0a7dba5', null);
INSERT INTO "public"."sys_user_info" VALUES ('db324fb8-928b-4589-a6ec-0e0d578431db', null, '女', null, null, null, null, null, null, '4379bf9f-aac3-4e38-a925-34a7304bf7eb', null);
INSERT INTO "public"."sys_user_info" VALUES ('58b2889f-f0a7-4f04-89d4-2cfc3b56b6ca', null, '男', null, null, null, null, null, null, '9bf54911-1db3-4fc8-9d19-d5b7837fbb1e', null);
INSERT INTO "public"."sys_user_info" VALUES ('7b7d9b63-ccb9-4100-ad07-09a15283e77b', null, '女', null, null, null, null, null, null, '51f09f83-0ca6-42ed-82f3-36ff77313d38', null);
INSERT INTO "public"."sys_user_info" VALUES ('c34d624c-621b-4a76-a460-3afc254e3fe7', null, '男', null, null, null, null, null, null, 'ac2f69f2-707e-414a-953f-51e5c3a7eee2', null);
INSERT INTO "public"."sys_user_info" VALUES ('3cf1c489-5ed5-47d2-8364-62ce92c20621', null, '女', null, null, null, null, null, null, '4948e2e8-d122-426f-9e24-48d596084b4e', null);
INSERT INTO "public"."sys_user_info" VALUES ('1250951c-a5dd-4752-ab4a-de0da3e6f423', null, '男', null, null, null, null, null, null, 'b6209e1f-26a4-4199-b00d-bc9d80c4ecc8', null);
INSERT INTO "public"."sys_user_info" VALUES ('fff30065-30c4-4cfb-8e2a-a98d5a781cf0', null, '女', null, null, null, null, null, null, 'd7b122ee-493c-48cd-949f-2219c18fc5a0', null);
INSERT INTO "public"."sys_user_info" VALUES ('94cf9c9b-11c6-49cc-b8e1-7d2574590ae1', null, '男', null, null, null, null, null, null, 'c38feed1-18f2-42e3-baac-33e09f7dd0c0', null);
INSERT INTO "public"."sys_user_info" VALUES ('9f435069-a3b3-45f4-9dfc-ac614d0214cf', null, '女', null, null, null, null, null, null, 'e4a83ec1-e120-47b9-8c23-adaea62848af', null);
INSERT INTO "public"."sys_user_info" VALUES ('64bd4279-79a7-45bf-9aca-b4a059d14f8c', null, '男', null, null, null, null, null, null, '398f7a73-4c60-4779-860d-d14ab4babed2', null);
INSERT INTO "public"."sys_user_info" VALUES ('35a3be15-a0be-4237-9407-745acfa7d645', null, '女', null, null, null, null, null, null, 'e2b2c1ed-196f-4606-8782-64648199362c', null);
INSERT INTO "public"."sys_user_info" VALUES ('43864554-35a5-48ec-bbce-679b8b06623f', null, '男', null, null, null, null, null, null, '8fb02f18-18e3-4513-aa21-dfe1472a98f0', null);
INSERT INTO "public"."sys_user_info" VALUES ('f3b42e6a-fa1e-4daa-8f6a-27e9447ee692', null, '女', null, null, null, null, null, null, '4abfc657-6182-41f5-84aa-f6dcb891aa95', null);
INSERT INTO "public"."sys_user_info" VALUES ('0e469647-f9e7-47ac-a948-bd1808d914f5', null, '男', null, null, null, null, null, null, 'e8ce5e56-3c2e-497a-bed8-2720fd2f09ef', null);
INSERT INTO "public"."sys_user_info" VALUES ('b96a9f85-5dc1-486d-8312-f9c516d1f5fd', null, '女', null, null, null, null, null, null, 'e658a157-8269-4bf8-b01d-988563b66796', null);
INSERT INTO "public"."sys_user_info" VALUES ('e4b65723-bc91-45d2-8a98-27d6a95b66d3', null, '男', null, null, null, null, null, null, '74cd29c4-44f4-4513-9825-d964e283be84', null);
INSERT INTO "public"."sys_user_info" VALUES ('781d20fe-84b9-453d-9cf8-cee1dc7e3785', null, '女', null, null, null, null, null, null, '6f831c4b-7c4e-4410-ac55-357e9b848c49', null);
INSERT INTO "public"."sys_user_info" VALUES ('e71fdbfa-8144-4a6d-a907-b5861ce395be', null, '男', null, null, null, null, null, null, '246c0fab-a32b-4527-bd9f-ae17087f0908', null);
INSERT INTO "public"."sys_user_info" VALUES ('1bf2aebd-a321-4b08-8b27-f34ffb621ede', null, '女', null, null, null, null, null, null, '590401a7-ca38-47c7-8e5a-60ea2392bc98', null);
INSERT INTO "public"."sys_user_info" VALUES ('abd289a5-09f3-4088-a92a-ed01cee9aa2b', null, '男', null, null, null, null, null, null, '8faf911d-d032-4e7f-827a-fcd78adc071a', null);
INSERT INTO "public"."sys_user_info" VALUES ('7dad0919-7f55-40fa-b16e-8f5ca5e6db15', null, '女', null, null, null, null, null, null, '6cda3630-8408-4075-8cc4-af1497593d16', null);
INSERT INTO "public"."sys_user_info" VALUES ('b671cc3b-9537-4636-953b-80662249f7dc', null, '男', null, null, null, null, null, null, '0932a5e5-ff7e-4290-b018-94b78b6b698c', null);
INSERT INTO "public"."sys_user_info" VALUES ('2037cb8e-5dbd-485f-97b4-a47de1be7516', null, '女', null, null, null, null, null, null, '61112e6d-dd91-46ce-bf75-de441a2bb785', null);
INSERT INTO "public"."sys_user_info" VALUES ('ca1ce34f-dfc1-4a82-a5f4-3be92b4aea46', null, '男', null, null, null, null, null, null, '72938f0b-bed0-401e-8218-1a7245b67fa9', null);
INSERT INTO "public"."sys_user_info" VALUES ('1ff672d0-1dd5-43a8-b0a6-be3744cdae81', null, '女', null, null, null, null, null, null, '76216a5d-7b6e-4c7b-af9c-c9525c35db24', null);
INSERT INTO "public"."sys_user_info" VALUES ('66093fee-9c96-4a0e-a365-d0c7ccddc74d', null, '男', null, null, null, null, null, null, '03f0b694-0eeb-4e42-aa3d-310ab9f32e8f', null);
INSERT INTO "public"."sys_user_info" VALUES ('304d1f84-8d4d-4ee9-8629-45050ca03d48', null, '女', null, null, null, null, null, null, '58ffd32f-4a94-4a93-a874-87ec3f423694', null);
INSERT INTO "public"."sys_user_info" VALUES ('7d718306-a8c9-4e06-89c7-657789e90e77', null, '男', null, null, null, null, null, null, 'c7557d37-4e7d-4fff-a427-818d85b4899a', null);
INSERT INTO "public"."sys_user_info" VALUES ('9a297741-7fa3-40fd-b797-06454df9ac45', null, '女', null, null, null, null, null, null, '3cc62248-5bb9-4ed1-9662-d0604702be83', null);
INSERT INTO "public"."sys_user_info" VALUES ('e10a985c-cd07-490b-b8c0-101e8e73825b', null, '男', null, null, null, null, null, null, '52aca7d9-d7eb-439d-8757-c108d9b764ef', null);
INSERT INTO "public"."sys_user_info" VALUES ('fb590060-7ee6-43dd-af2a-4ff2047c2139', null, '女', null, null, null, null, null, null, '0c9d16ac-7806-4f8c-928a-be578ea03a16', null);
INSERT INTO "public"."sys_user_info" VALUES ('f061ed25-69bb-46cb-b2dc-4ab5a9fb1df0', null, '男', null, null, null, null, null, null, 'efebb731-2019-43e0-b01e-81825be2a826', null);
INSERT INTO "public"."sys_user_info" VALUES ('e2f84ea8-6610-4b51-9d99-dd25b936b085', null, '女', null, null, null, null, null, null, 'e04f90aa-bce2-4bdf-9241-3c3aa7b4a1ef', null);
INSERT INTO "public"."sys_user_info" VALUES ('d2d4ad4f-481c-4ee4-beb6-76a181363eb8', null, '男', null, null, null, null, null, null, '1ecf4904-01b3-4188-884e-e25e4696b843', null);
INSERT INTO "public"."sys_user_info" VALUES ('1ab9ff39-d39b-4a56-ab1c-56c5eca2d2ef', null, '女', null, null, null, null, null, null, '8684c188-3215-4c1b-9846-c11c3df59b96', null);
INSERT INTO "public"."sys_user_info" VALUES ('560fa0b4-dd52-4098-af93-a947aabd8029', null, '男', null, null, null, null, null, null, '9d9d2dd9-2ea3-4f10-bd38-6876968b591e', null);
INSERT INTO "public"."sys_user_info" VALUES ('919e3275-cb06-4585-8a7c-9edd8c82471b', null, '女', null, null, null, null, null, null, 'b72bb4a9-e4b0-40f7-8012-590ab703a79a', null);
INSERT INTO "public"."sys_user_info" VALUES ('2684ff89-4f5e-4b1f-93ab-136153bb6ef2', null, '男', null, null, null, null, null, null, '6ff6f17a-15d9-4353-a68a-80be50ca4e4c', null);
INSERT INTO "public"."sys_user_info" VALUES ('1d501c7d-835a-4d15-88ed-41de691e9d4f', null, '女', null, null, null, null, null, null, 'f6116e06-5f45-44c6-88a0-bc2cf42b2673', null);
INSERT INTO "public"."sys_user_info" VALUES ('20741a0c-a408-4087-8b30-c313e204fb5c', null, '男', null, null, null, null, null, null, '03ab5e9a-0774-403b-8c22-1d1e274bd598', null);
INSERT INTO "public"."sys_user_info" VALUES ('884aca23-68b1-4b37-a9b7-4bce44e46b07', null, '女', null, null, null, null, null, null, 'ab594e31-80eb-45ad-8c63-47b3e9a42a5e', null);
INSERT INTO "public"."sys_user_info" VALUES ('715b889f-6f68-43ec-8f69-9ce6200adf35', null, '男', null, null, null, null, null, null, '9bf42c5e-6581-4be7-a895-5d6e772247dd', null);
INSERT INTO "public"."sys_user_info" VALUES ('a19c4a19-b4a4-4af5-b09c-d57a454183a0', null, '女', null, null, null, null, null, null, '94e3cc12-520b-455d-a8f6-a4de810996f0', null);
INSERT INTO "public"."sys_user_info" VALUES ('7fd027f0-73c0-4260-a03d-6d9613064bf6', null, '男', null, null, null, null, null, null, '6301b7a3-b1a2-47f5-95d2-93b0dc8128d7', null);
INSERT INTO "public"."sys_user_info" VALUES ('11940ba3-1199-49ce-9ca6-2abea8de4772', null, '女', null, null, null, null, null, null, '2e65984c-82ad-43d9-bb29-311f22d04ee4', null);
INSERT INTO "public"."sys_user_info" VALUES ('3b743377-8417-464d-b495-9644e0846f61', null, '男', null, null, null, null, null, null, 'a8f79346-f3b0-4cb3-8fba-5767808d60fc', null);
INSERT INTO "public"."sys_user_info" VALUES ('3ab39c43-2286-4697-a04c-df41114cd2da', null, '女', null, null, null, null, null, null, '604379f5-ff23-413a-85f6-68cf4065d57c', null);
INSERT INTO "public"."sys_user_info" VALUES ('f46c4352-dc79-47b9-8f21-b69719f137eb', null, '男', null, null, null, null, null, null, '799f1cec-893a-47c7-ba4e-c7b26304b379', null);
INSERT INTO "public"."sys_user_info" VALUES ('32334d46-75c9-4105-a7fd-21f0da83ea24', null, '女', null, null, null, null, null, null, 'f1dd4a6f-dc5f-48fa-9ebf-4abc5e4e04f0', null);
INSERT INTO "public"."sys_user_info" VALUES ('ec299fb0-c7e4-472d-aace-cffe6c3b3279', null, '男', null, null, null, null, null, null, '4ed9fbad-fe76-45ce-a744-17cc818278e5', null);
INSERT INTO "public"."sys_user_info" VALUES ('23b582ab-6f32-48e3-a78c-0b1a777214ff', null, '女', null, null, null, null, null, null, '31a582ab-867e-4de0-a76b-6f294d58c3b8', null);
INSERT INTO "public"."sys_user_info" VALUES ('8879d726-b441-4c01-adfb-175f75614974', null, '男', null, null, null, null, null, null, 'd1ef5e6d-aa31-45f1-bbe8-b13137b86e89', null);
INSERT INTO "public"."sys_user_info" VALUES ('af97fefb-2e81-4a79-9d70-8bb3f171c828', null, '女', null, null, null, null, null, null, 'bec733bc-a840-469a-8621-9c98adea8b40', null);
INSERT INTO "public"."sys_user_info" VALUES ('adb674ab-24a2-4998-8fa2-0f572d0c3bdc', null, '男', null, null, null, null, null, null, '9978f44d-bd39-441e-8c1f-0d4254e140a2', null);
INSERT INTO "public"."sys_user_info" VALUES ('e7df2b2c-70bf-4824-8b31-2165ce9200eb', null, '女', null, null, null, null, null, null, 'e9fe6a0d-59d6-4815-8622-5e910e6dd0f4', null);
INSERT INTO "public"."sys_user_info" VALUES ('2efa5e31-9e3e-471e-9f29-deedeb69a8a6', null, '男', null, null, null, null, null, null, '2e050472-5314-4848-ba05-f1dbe479c633', null);
INSERT INTO "public"."sys_user_info" VALUES ('40dc38f5-ce9c-43ff-9f8e-3e09c7542949', null, '女', null, null, null, null, null, null, 'da760136-b329-4351-a8d4-5c7d92068dca', null);
INSERT INTO "public"."sys_user_info" VALUES ('3917aa66-43c3-4320-9942-18bcebd65a88', null, '男', null, null, null, null, null, null, '68f0cf98-b8e7-4f21-9e00-024d04be19f1', null);
INSERT INTO "public"."sys_user_info" VALUES ('1c925254-f98d-4d0b-a415-38c29e4521e4', null, '女', null, null, null, null, null, null, 'f40e1d48-d98b-4ba3-b0be-2fc0faf604ca', null);
INSERT INTO "public"."sys_user_info" VALUES ('26680b61-c42d-4271-9c14-49d7b0f4f189', null, '男', null, null, null, null, null, null, '90a5a165-3ab7-40f8-8a77-d7f8e69eaa85', null);
INSERT INTO "public"."sys_user_info" VALUES ('7f86cf09-7750-4dcd-881b-2e5ffcebe0bc', null, '女', null, null, null, null, null, null, 'c085cd63-04da-4a90-ac20-c95dd406e118', null);
INSERT INTO "public"."sys_user_info" VALUES ('65d53dca-3042-4b3c-995a-f7f9a098ed96', null, '男', null, null, null, null, null, null, 'bb400861-59bb-4884-99a1-fbe5c2f922ab', null);
INSERT INTO "public"."sys_user_info" VALUES ('26a425af-9f4a-4faa-80f6-5cf25c35f8a3', null, '女', null, null, null, null, null, null, '51052923-0fc0-4e45-ae03-a0f223818264', null);
INSERT INTO "public"."sys_user_info" VALUES ('95abb035-7fad-4ad2-a4ec-1960bb868846', null, '男', null, null, null, null, null, null, '4b244745-8250-48ac-9659-4b5fff49b8b1', null);
INSERT INTO "public"."sys_user_info" VALUES ('1e16c448-5e2e-40ef-b3a1-9e237db97f92', null, '女', null, null, null, null, null, null, 'c5194172-c13e-4da7-b178-71165509b8d0', null);
INSERT INTO "public"."sys_user_info" VALUES ('6ce14178-e94c-42c6-87de-5fa52b8a6c9b', null, '男', null, null, null, null, null, null, 'e78f0e21-fd2b-4235-8860-320cbd1b2b7a', null);
INSERT INTO "public"."sys_user_info" VALUES ('0209fded-4785-40d7-a990-0cf56ca01bae', null, '女', null, null, null, null, null, null, '3f3f7dbd-460e-4554-8d8e-3e6143b40cc1', null);
INSERT INTO "public"."sys_user_info" VALUES ('68cf9bfb-b198-4143-a982-5fa183788fa3', null, '男', null, null, null, null, null, null, 'e15382f7-077a-4e00-ab48-05b523762376', null);
INSERT INTO "public"."sys_user_info" VALUES ('c53d3595-d667-468d-ba85-5050fbb78382', null, '女', null, null, null, null, null, null, 'caace491-954a-4dd7-b68a-f6ed792de62b', null);
INSERT INTO "public"."sys_user_info" VALUES ('e5402c92-0a02-4121-b199-6ce1fafa18b2', null, '男', null, null, null, null, null, null, '8935cfc8-34da-4184-ba7d-ec828b98aba8', null);
INSERT INTO "public"."sys_user_info" VALUES ('fe37f991-7ba2-44a6-90ed-1217138a8b7c', null, '女', null, null, null, null, null, null, 'a69ac961-23c1-4e77-9c00-17d9ce9033f8', null);
INSERT INTO "public"."sys_user_info" VALUES ('64d1a456-af00-4eee-9cb0-ca7ea881a33c', null, '男', null, null, null, null, null, null, 'aca69c32-5ca1-4a31-ac69-1b2405ae8976', null);
INSERT INTO "public"."sys_user_info" VALUES ('68a1a66e-6072-4631-8b0d-7620cd48d481', null, '女', null, null, null, null, null, null, '1899b16b-d1ed-48a6-a4d7-8b717d33ab60', null);
INSERT INTO "public"."sys_user_info" VALUES ('638d8be0-1bbd-4bef-90cd-644a73abc897', null, '男', null, null, null, null, null, null, '0530e264-eb78-4d4f-92e9-90de95938c97', null);
INSERT INTO "public"."sys_user_info" VALUES ('ee66cf59-5ae5-4c2a-b49f-878266acaf91', null, '女', null, null, null, null, null, null, 'bf14be3c-ef58-4e4d-9902-b0b935c6e02e', null);
INSERT INTO "public"."sys_user_info" VALUES ('1e3aa9dd-a6dd-4a7a-816f-ac5011ada265', null, '男', null, null, null, null, null, null, '72497a28-9586-4600-afcd-50f49942d89f', null);
INSERT INTO "public"."sys_user_info" VALUES ('0b4698f9-c3df-4c31-a857-d56e2b17d7a6', null, '女', null, null, null, null, null, null, '47a78dd6-232c-4867-a42d-674517480369', null);
INSERT INTO "public"."sys_user_info" VALUES ('3a121062-6762-45fb-970c-48615e552715', null, '男', null, null, null, null, null, null, '1c44ab44-e0fd-4c20-9651-e0f0818c5978', null);
INSERT INTO "public"."sys_user_info" VALUES ('bb3b2163-874e-475a-97f6-1af1650ef0af', null, '女', null, null, null, null, null, null, 'f8e39a7c-47b8-4bb8-a05d-6701bc9e3104', null);
INSERT INTO "public"."sys_user_info" VALUES ('86442dee-dff1-459e-9aee-e7e9f305a39e', null, '男', null, null, null, null, null, null, '6b820c70-9ced-4c8a-a387-52ef01d589a7', null);
INSERT INTO "public"."sys_user_info" VALUES ('09e16494-aff8-4954-9ab6-606d6fdb5e69', null, '女', null, null, null, null, null, null, 'a8901ba4-ad22-4ae7-9437-95856ab8d53e', null);
INSERT INTO "public"."sys_user_info" VALUES ('c1d64762-3989-4098-bd33-6e36deb90cb4', null, '男', null, null, null, null, null, null, 'de8d17e6-c0f9-473b-8d96-1a2c04b7b8ea', null);
INSERT INTO "public"."sys_user_info" VALUES ('13eb80ce-1cbc-42dc-8150-b81c8d1589de', null, '女', null, null, null, null, null, null, '3165412b-0ac2-492f-8575-2f6c2525f241', null);
INSERT INTO "public"."sys_user_info" VALUES ('3e7d025b-8927-4628-867d-420f9ddf3479', null, '男', null, null, null, null, null, null, 'c1c55738-6710-49ea-a043-54bb7ea6df76', null);
INSERT INTO "public"."sys_user_info" VALUES ('d3a519fd-2b5e-4a59-9521-8cea9aff8d34', null, '女', null, null, null, null, null, null, 'd8f760a6-50e6-4305-bd6d-863ba2be86b3', null);
INSERT INTO "public"."sys_user_info" VALUES ('a34a1f1a-1a8f-4509-b212-05b282977871', null, '男', null, null, null, null, null, null, 'ce753313-4526-4771-ad51-4134a5a7a0d7', null);
INSERT INTO "public"."sys_user_info" VALUES ('f84bbbc4-d1e1-4ec6-8825-93ae199f8f8b', null, '女', null, null, null, null, null, null, 'd5521ffc-edcb-4c54-b408-62c57c745e56', null);
INSERT INTO "public"."sys_user_info" VALUES ('1e16b200-e670-4dba-bf97-2fcf374916fb', null, '男', null, null, null, null, null, null, '4b78f1f1-cf6d-4b58-b794-10a16dbf73c4', null);
INSERT INTO "public"."sys_user_info" VALUES ('28682261-3718-4e2a-8a55-1dd26e54bba8', null, '女', null, null, null, null, null, null, 'afe99e1e-ab36-4bf6-bcd2-303bd6fbf3a2', null);
INSERT INTO "public"."sys_user_info" VALUES ('604ad016-de75-453d-8b81-3b0d045f9950', null, '男', null, null, null, null, null, null, '23e46882-ed9e-4843-8f42-416726eefd63', null);
INSERT INTO "public"."sys_user_info" VALUES ('2c69e06b-252b-4f69-be27-07a590926ee4', null, '女', null, null, null, null, null, null, '2580dd9f-8f07-4d36-977c-2c912fae7302', null);
INSERT INTO "public"."sys_user_info" VALUES ('606c5121-8f41-49f1-a93f-5dd6385e27b2', null, '男', null, null, null, null, null, null, '7c31459c-b56a-441e-89dc-ed16e17cae8b', null);
INSERT INTO "public"."sys_user_info" VALUES ('e731cd53-3d12-4493-b67a-b6f3f757f431', null, '女', null, null, null, null, null, null, '0724502a-7e7b-4bdd-9f78-9e9a25f5b247', null);
INSERT INTO "public"."sys_user_info" VALUES ('09a3704a-ba0f-4082-830c-5d620006db04', null, '男', null, null, null, null, null, null, '4c6098ec-3c7a-4793-9ce0-c7b8f300595d', null);
INSERT INTO "public"."sys_user_info" VALUES ('a2888aa0-9df2-479c-bd09-a64125441edb', null, '女', null, null, null, null, null, null, '85b71f9b-ce54-4688-a0ee-afb96cd82347', null);
INSERT INTO "public"."sys_user_info" VALUES ('4bbceaef-92dc-441b-ad7f-06200ce15d4a', null, '男', null, null, null, null, null, null, 'a29646f4-2bf9-4352-b15e-f875b925f6ba', null);
INSERT INTO "public"."sys_user_info" VALUES ('9292c37b-20e5-442a-a773-0f3fa73f6058', null, '女', null, null, null, null, null, null, '1e5e7d03-e969-43e7-b02c-d30d54279a3b', null);
INSERT INTO "public"."sys_user_info" VALUES ('5b899efe-6a13-4813-a621-4431342fefd5', null, '男', null, null, null, null, null, null, '00a78571-1dea-4304-bc4e-eac9cd83e475', null);
INSERT INTO "public"."sys_user_info" VALUES ('2cfb308b-6a3e-495b-9654-69401ae603e5', null, '女', null, null, null, null, null, null, '1d3305b9-c3ca-40c4-bdef-1b99f0f63b30', null);
INSERT INTO "public"."sys_user_info" VALUES ('0a1dc7ee-c90c-43bb-a066-fb28d0e840b5', null, '男', null, null, null, null, null, null, 'dbb20a11-21e3-4fe5-9914-76f35a1f310e', null);
INSERT INTO "public"."sys_user_info" VALUES ('9bf02871-9cd1-4f4f-9714-6e61ed543702', null, '女', null, null, null, null, null, null, '5a5607c4-b3cd-412d-98af-edfe9dc27699', null);
INSERT INTO "public"."sys_user_info" VALUES ('2fef73ea-52bc-49ca-853d-0998d57578b9', null, '男', null, null, null, null, null, null, 'c32275a6-3a93-48b1-a757-69338ede371b', null);
INSERT INTO "public"."sys_user_info" VALUES ('6a92202b-0e8e-43dd-9733-02c019de0cd9', null, '女', null, null, null, null, null, null, '25a6baa8-2650-44cd-92e2-bec6dfec479c', null);
INSERT INTO "public"."sys_user_info" VALUES ('1342fc68-6333-4fce-9e2d-7806b270f6a2', null, '男', null, null, null, null, null, null, '78b54329-b99b-467a-8590-b0faf59efa6d', null);
INSERT INTO "public"."sys_user_info" VALUES ('ee3335db-27fb-4ed0-b6b5-c410816421f9', null, '女', null, null, null, null, null, null, 'efaec473-5fcd-4254-83f9-05b152b17285', null);
INSERT INTO "public"."sys_user_info" VALUES ('c75ebacf-b0e1-4fc2-a849-cfc3b99cfe18', null, '男', null, null, null, null, null, null, 'a225031d-7429-44e8-8cb4-03d912bbf9bd', null);
INSERT INTO "public"."sys_user_info" VALUES ('b5dec402-21ed-471d-b5e7-57e5c587e899', null, '女', null, null, null, null, null, null, '012db83c-fc52-4d09-a65b-5183ed2f642e', null);
INSERT INTO "public"."sys_user_info" VALUES ('4cb05b8e-c6be-4558-b5d7-a7be9957a21f', null, '男', null, null, null, null, null, null, '239693ad-d00a-4880-b83f-2b58adc85eea', null);
INSERT INTO "public"."sys_user_info" VALUES ('77745cd6-84c1-4e59-bde6-61988fc8573b', null, '女', null, null, null, null, null, null, '20b26486-6138-4d53-aa0f-0cef5015cd19', null);
INSERT INTO "public"."sys_user_info" VALUES ('009c64c9-4066-4559-8c00-9bbe6dc020cd', null, '男', null, null, null, null, null, null, '2c98f475-fd37-4af0-87e3-7888ff41c401', null);
INSERT INTO "public"."sys_user_info" VALUES ('815516de-ec4f-4c8e-aba7-af94359c5ac1', null, '女', null, null, null, null, null, null, '74882d6b-dc72-4f9e-8aea-056e36de5618', null);
INSERT INTO "public"."sys_user_info" VALUES ('b4c57d3f-edfb-4e8e-beb8-adefa935a092', null, '男', null, null, null, null, null, null, '1bc10474-d193-4a67-8f13-8e433fc8179c', null);
INSERT INTO "public"."sys_user_info" VALUES ('d65a99cc-6f04-4f98-a883-4a8c225b64eb', null, '女', null, null, null, null, null, null, '5cbdc19e-bed8-4670-a552-fd981ad80547', null);
INSERT INTO "public"."sys_user_info" VALUES ('f95ebdf9-6ff0-4fe5-a7c2-1af6aaeb19f1', null, '男', null, null, null, null, null, null, 'a3e9a6dd-e975-47d7-a211-66f801c0ac79', null);
INSERT INTO "public"."sys_user_info" VALUES ('3945e9ff-540c-40c9-839f-a2faffff7899', null, '女', null, null, null, null, null, null, 'f9a2f4db-846d-4df6-a318-6ab0d66095aa', null);
INSERT INTO "public"."sys_user_info" VALUES ('09410c69-8d49-412f-a5de-44c34e5b87b7', null, '男', null, null, null, null, null, null, 'f6403ad6-b1bf-4788-8ae9-5599237ae0cb', null);
INSERT INTO "public"."sys_user_info" VALUES ('34f92c46-3560-414a-90d9-53fb4b4d8cc8', null, '女', null, null, null, null, null, null, '106cdaeb-ae7a-4135-834c-6cec0dabefac', null);
INSERT INTO "public"."sys_user_info" VALUES ('96fad8d0-26fe-4159-83d8-32cea3cf6f66', null, '男', null, null, null, null, null, null, 'f0a57a1d-ad07-4444-8bdd-17d808132ed1', null);
INSERT INTO "public"."sys_user_info" VALUES ('9a9f3be5-4a9c-4888-b937-cd19bd01615a', null, '女', null, null, null, null, null, null, '5eb81410-7114-49ef-b6b9-359f6cb06dcb', null);
INSERT INTO "public"."sys_user_info" VALUES ('77f2d510-82cd-4be5-850e-603097aa71b2', null, '男', null, null, null, null, null, null, '69621331-1837-4de4-95f7-2fad8c6784ba', null);
INSERT INTO "public"."sys_user_info" VALUES ('053e939a-f344-4f48-8dab-fda1f637df45', null, '女', null, null, null, null, null, null, '634fe89e-68bb-4635-abd4-e71f3cf72f8c', null);
INSERT INTO "public"."sys_user_info" VALUES ('137fde7a-a50a-468b-88a4-f70d17205552', null, '男', null, null, null, null, null, null, 'c5b3d379-5a8e-4919-a379-fa89ac080c36', null);
INSERT INTO "public"."sys_user_info" VALUES ('e791328d-9eaa-45d9-b941-58667b68ebb1', null, '女', null, null, null, null, null, null, '8475b0c6-1e7d-42cd-8b58-d36fe219a1a1', null);
INSERT INTO "public"."sys_user_info" VALUES ('6746b32c-f292-4cd4-8221-186791521004', null, '男', null, null, null, null, null, null, 'a2384429-b465-417b-b336-d78679e37d53', null);
INSERT INTO "public"."sys_user_info" VALUES ('bd5e4d40-a1c7-4b5e-81a3-0e3ac98b1368', null, '女', null, null, null, null, null, null, 'b7b35bb6-43f3-4d6b-beec-efd8dafc8d79', null);
INSERT INTO "public"."sys_user_info" VALUES ('fa64570e-b9e4-4ac9-8a23-fca11e6aca0e', null, '男', null, null, null, null, null, null, 'd0642c55-1d7e-4db2-814f-f50bae5563ff', null);
INSERT INTO "public"."sys_user_info" VALUES ('0c32b639-eafc-4b55-9180-9bcdca020455', null, '女', null, null, null, null, null, null, '132e5da5-315b-4c88-bfb4-c0093abaeb82', null);
INSERT INTO "public"."sys_user_info" VALUES ('4b324b12-2ade-4048-b19e-2da1c51a4f1c', null, '男', null, null, null, null, null, null, '39323c3c-cf3f-4803-9d90-1893f3ffb0d4', null);
INSERT INTO "public"."sys_user_info" VALUES ('e7ebae64-5a15-43cb-9118-c127ecf288c6', null, '女', null, null, null, null, null, null, 'fadf220f-379c-409b-ad24-e620213e3e14', null);
INSERT INTO "public"."sys_user_info" VALUES ('c78c42b9-a91d-44ac-bc92-695e0e715802', null, '男', null, null, null, null, null, null, '0715b320-6cef-41cb-8bd4-712652256b29', null);
INSERT INTO "public"."sys_user_info" VALUES ('479cb2c0-e5c4-4427-b311-6b80da52fcf3', null, '女', null, null, null, null, null, null, '17b46ec7-4031-44da-abe6-68812f6e81d8', null);
INSERT INTO "public"."sys_user_info" VALUES ('75d1356a-fad1-4a91-a1a9-f8963077d30d', null, '男', null, null, null, null, null, null, '3d1d6768-c233-4363-9928-605ce34fbeb6', null);
INSERT INTO "public"."sys_user_info" VALUES ('1a7eea34-d94b-4dd9-b3bb-b95145ef2bf3', null, '女', null, null, null, null, null, null, 'ae3118ef-e177-42ff-bf4a-d9ed867353d7', null);
INSERT INTO "public"."sys_user_info" VALUES ('4fd111a5-1f29-4a4a-a7dc-dbe23b04843f', null, '男', null, null, null, null, null, null, '853d7aff-1a03-41f9-bc5c-5f8d04a0a20a', null);
INSERT INTO "public"."sys_user_info" VALUES ('6bba5be6-6763-4604-9a90-139263511e7a', null, '女', null, null, null, null, null, null, '5e912800-64b7-40a4-a8c7-92de14989ca8', null);
INSERT INTO "public"."sys_user_info" VALUES ('e25ad6d2-d9ee-43dc-8cfd-382d8f93583d', null, '男', null, null, null, null, null, null, 'd628024b-f7e4-42f5-ace2-0b66f43b5071', null);
INSERT INTO "public"."sys_user_info" VALUES ('0e072d12-c38f-4e15-9e16-b086fe79e075', null, '女', null, null, null, null, null, null, 'f6a8c42d-9866-449f-bba7-d47cbeb1bbb2', null);
INSERT INTO "public"."sys_user_info" VALUES ('f3ad150c-caf7-41b8-830b-96fda2cc700d', null, '男', null, null, null, null, null, null, 'b3854c82-b1e0-49ec-98c5-2629f4d3925d', null);
INSERT INTO "public"."sys_user_info" VALUES ('9e238269-59af-4c91-b566-6c470d5e61ab', null, '女', null, null, null, null, null, null, '2623aefe-923e-4c63-b16a-d9409e49c53d', null);
INSERT INTO "public"."sys_user_info" VALUES ('c4204259-46de-437c-b447-489752b9debf', null, '男', null, null, null, null, null, null, '674fd09b-33de-4a23-9169-93fa191441f0', null);
INSERT INTO "public"."sys_user_info" VALUES ('e6b7fa47-1675-41da-bb9c-fcd1b2be925a', null, '女', null, null, null, null, null, null, '7dfcfabe-f953-49c7-9a89-d9551ebbb2ae', null);
INSERT INTO "public"."sys_user_info" VALUES ('3b3041f1-06f1-45c9-8a0c-8b69164fd7de', null, '男', null, null, null, null, null, null, '1a3707f7-232c-4bea-8a40-f60dc2d76e87', null);
INSERT INTO "public"."sys_user_info" VALUES ('b1b3c7fb-b1f4-4baa-b168-82ae611b67db', null, '女', null, null, null, null, null, null, '1cd9979e-b6f3-415a-8f88-0ceae0be0445', null);
INSERT INTO "public"."sys_user_info" VALUES ('9efeca18-113b-4e4a-89f1-b8c4391ab161', null, '男', null, null, null, null, null, null, 'a8325c20-f5fb-4073-973c-d010c86dd0bd', null);
INSERT INTO "public"."sys_user_info" VALUES ('b72245e9-b707-48dc-baa8-35a5d6817593', null, '女', null, null, null, null, null, null, '13029314-389c-464f-8d86-d027356e504b', null);
INSERT INTO "public"."sys_user_info" VALUES ('2cfcf377-7f95-4ac5-b3f1-2b3976a5704b', null, '男', null, null, null, null, null, null, '540041a6-8c01-41fd-befa-7554462ec33d', null);
INSERT INTO "public"."sys_user_info" VALUES ('dab5d8d5-4f02-4e2a-8243-c1443dd3c9bb', null, '女', null, null, null, null, null, null, '7d533798-8fa5-42e0-ba10-dd1b0e16e60c', null);
INSERT INTO "public"."sys_user_info" VALUES ('aca3534b-fa32-4d3d-b8ee-e6dabbfc57d5', null, '男', null, null, null, null, null, null, 'e9e77038-c018-4b3a-8ef4-53e32582e2c0', null);
INSERT INTO "public"."sys_user_info" VALUES ('d4901f06-873c-4f34-b9b9-ad9cbf25e0bf', null, '女', null, null, null, null, null, null, 'c233d0bb-0cc0-4756-b339-336089063588', null);
INSERT INTO "public"."sys_user_info" VALUES ('cb55fdeb-82e4-4732-bd9d-d209bca8f9a2', null, '男', null, null, null, null, null, null, '3f1847c8-4635-456e-80fa-9a344be55135', null);
INSERT INTO "public"."sys_user_info" VALUES ('38a6fab5-d747-47fd-8239-5e6747079aec', null, '女', null, null, null, null, null, null, 'e3d536ff-08c5-43c8-99c2-f871d8d79548', null);
INSERT INTO "public"."sys_user_info" VALUES ('57fed1a1-1031-473f-8822-e77e0bfdc6db', null, '男', null, null, null, null, null, null, 'd847e919-ab1b-4975-9c3b-15f55bb397d4', null);
INSERT INTO "public"."sys_user_info" VALUES ('68e38b79-de5d-4632-82ae-f26ac31de892', null, '女', null, null, null, null, null, null, '3350ae66-2d64-4bc6-a210-ac6bcb07c840', null);
INSERT INTO "public"."sys_user_info" VALUES ('40d32a91-12c3-406b-b3da-f7ffb278c9e2', null, '男', null, null, null, null, null, null, 'bc1867de-621e-4efe-847b-b6d494af526e', null);
INSERT INTO "public"."sys_user_info" VALUES ('17deab19-b5f3-4940-9b69-a5086c29b91f', null, '女', null, null, null, null, null, null, '8c018954-fe05-4c5f-b459-38862bf001a6', null);
INSERT INTO "public"."sys_user_info" VALUES ('402a45d9-01fc-42d7-86d4-2f0b1dc93627', null, '男', null, null, null, null, null, null, 'bc362ac1-23da-4ecd-8708-298a90ff5385', null);
INSERT INTO "public"."sys_user_info" VALUES ('d3a45782-5f70-45f1-b6f6-8f925d376c01', null, '女', null, null, null, null, null, null, '6e429246-a9f6-4fad-9a25-fe2f9797dbd7', null);
INSERT INTO "public"."sys_user_info" VALUES ('04235ffd-59ec-4093-bc0d-43aec31f8a5b', null, '男', null, null, null, null, null, null, '2581a975-0558-4f86-8392-27236ef86cf7', null);
INSERT INTO "public"."sys_user_info" VALUES ('eb18288e-e216-40b5-917a-b7273bdef4a9', null, '女', null, null, null, null, null, null, 'b3f64758-6623-4826-a614-00694355399e', null);
INSERT INTO "public"."sys_user_info" VALUES ('9f75f4de-a007-4abc-8477-564b931b7b62', null, '男', null, null, null, null, null, null, '2b9b8f3c-0936-4eaa-aa91-c58c707e66ed', null);
INSERT INTO "public"."sys_user_info" VALUES ('270cfd5e-fefc-40b9-8f0a-4612c72acd3c', null, '女', null, null, null, null, null, null, '14bf38c9-a9b4-49c0-92b4-c5f3172901b2', null);
INSERT INTO "public"."sys_user_info" VALUES ('6dce410c-2f4f-453f-abc3-7997148bdcd9', null, '男', null, null, null, null, null, null, '902fd31a-9ef9-41f4-a619-2ae8cefd43e8', null);
INSERT INTO "public"."sys_user_info" VALUES ('8d3b1dea-40e3-4ab3-bc53-5cbf412f4a86', null, '女', null, null, null, null, null, null, '2dec5a5c-d14a-4731-a362-b75cad01ea11', null);
INSERT INTO "public"."sys_user_info" VALUES ('131e56e2-1f9b-4c4a-9771-ffcfaa8878c7', null, '男', null, null, null, null, null, null, '1daedee0-6e4c-4741-ba73-a43b60f31660', null);
INSERT INTO "public"."sys_user_info" VALUES ('07ea46f5-0980-4e52-bf34-f0835995ddbd', null, '女', null, null, null, null, null, null, 'f2378813-f020-4475-94a7-92e141f2baf0', null);
INSERT INTO "public"."sys_user_info" VALUES ('7787c08a-4ea2-4ade-95fa-6bf13b518519', null, '男', null, null, null, null, null, null, 'a7f349c3-0680-405b-8011-84436b9c4fe6', null);
INSERT INTO "public"."sys_user_info" VALUES ('ba5822f4-f175-4e82-821a-b496367ed196', null, '女', null, null, null, null, null, null, '31f6b12e-d477-438d-8014-ec79bed9fd5e', null);
INSERT INTO "public"."sys_user_info" VALUES ('6c2b4c30-4bdc-4d0d-b45f-54a883bf16f8', null, '男', null, null, null, null, null, null, 'a2789759-69c3-4c29-9ab8-e3fa83a2262b', null);
INSERT INTO "public"."sys_user_info" VALUES ('dd30dacd-e1c7-4611-beaf-8dcc4e053872', null, '女', null, null, null, null, null, null, 'ab9428a1-1910-4f1a-9171-ea3831d614de', null);
INSERT INTO "public"."sys_user_info" VALUES ('904d441c-681f-40f4-ae1a-194ce135e493', null, '男', null, null, null, null, null, null, '27f3812c-a98a-45d4-a776-0dc9e4048e9b', null);
INSERT INTO "public"."sys_user_info" VALUES ('f6ab3aba-7c09-48a5-9202-d7adb221b74a', null, '女', null, null, null, null, null, null, 'aae5d112-a098-483e-a1fd-3181e85eb38f', null);
INSERT INTO "public"."sys_user_info" VALUES ('c685c196-3b19-40f5-a1bd-dcfdff9c21eb', null, '男', null, null, null, null, null, null, 'd81d06f4-2214-4338-9acd-09eedcd913ec', null);
INSERT INTO "public"."sys_user_info" VALUES ('1a58c447-31ef-4f8d-aae7-453a104673a3', null, '女', null, null, null, null, null, null, '520f3811-6e26-4981-8460-bad1ca6d8afa', null);
INSERT INTO "public"."sys_user_info" VALUES ('6602537a-003f-45a3-9af4-16822965ead5', null, '男', null, null, null, null, null, null, '223f2011-7521-44ec-9ae0-42a809809780', null);
INSERT INTO "public"."sys_user_info" VALUES ('b2c40cc4-aceb-479e-afaa-062eee106908', null, '女', null, null, null, null, null, null, '354c6d39-2d05-4884-9d5c-1a6d4e32bbef', null);
INSERT INTO "public"."sys_user_info" VALUES ('d43ca859-28ca-4040-83e5-fc5965f296be', null, '男', null, null, null, null, null, null, '8aae2616-e170-4aca-8f78-cdf8963a2580', null);
INSERT INTO "public"."sys_user_info" VALUES ('acb4ab26-26e4-4b68-b1b7-0488d812ebab', null, '女', null, null, null, null, null, null, '716079ca-4824-4557-9e11-4cfb6f80eb30', null);
INSERT INTO "public"."sys_user_info" VALUES ('9ad642de-188a-4039-a75c-9a0fec78e123', null, '男', null, null, null, null, null, null, '0b8ac197-d26f-41f4-bfb1-19fe4fac6809', null);
INSERT INTO "public"."sys_user_info" VALUES ('14758e17-fbd9-4063-8163-22593872e021', null, '女', null, null, null, null, null, null, '3a719447-0725-4296-9aa9-c821719f09df', null);
INSERT INTO "public"."sys_user_info" VALUES ('1cb361b8-4334-4c1a-8335-35dc19db2543', null, '男', null, null, null, null, null, null, '75d2006b-c597-4c68-89d4-fa80d1a1441b', null);
INSERT INTO "public"."sys_user_info" VALUES ('f0a61962-a9ea-4b43-a89f-747e4b5c5e35', null, '女', null, null, null, null, null, null, 'c8447a88-4e9e-4f7d-8f0a-98644889aa09', null);
INSERT INTO "public"."sys_user_info" VALUES ('1f2b4822-11e0-4ca1-8e29-03b0665e2b4f', null, '男', null, null, null, null, null, null, '67e67be0-6008-4c1f-81a9-f34f6a8cc60f', null);
INSERT INTO "public"."sys_user_info" VALUES ('72148067-7088-4e7e-99d1-bfe3e6455080', null, '女', null, null, null, null, null, null, '7536ebd3-0109-48b5-adef-015d4dd97e6e', null);
INSERT INTO "public"."sys_user_info" VALUES ('ee87878f-c996-4bd4-bed9-012befdb1af9', null, '男', null, null, null, null, null, null, 'ab263631-78b9-470a-99bf-c7491eb8b1ce', null);
INSERT INTO "public"."sys_user_info" VALUES ('0009b06c-5315-41c5-b048-8ddee4b519f6', null, '女', null, null, null, null, null, null, '0a77a757-c698-4066-92b9-32798ce0ad6a', null);
INSERT INTO "public"."sys_user_info" VALUES ('a90e24da-826c-4a9a-86cd-5de76da7de79', null, '男', null, null, null, null, null, null, 'b72040a7-cb13-4a6a-b206-05025220126c', null);
INSERT INTO "public"."sys_user_info" VALUES ('fce323d8-4c5c-46f2-b5a8-49d5da69a1f7', null, '女', null, null, null, null, null, null, 'd6aa13e0-1dec-4c26-9a84-ca92ae0ec414', null);
INSERT INTO "public"."sys_user_info" VALUES ('5bfd8263-c591-40f8-a579-4e9e8b8aedcd', null, '男', null, null, null, null, null, null, '3bc97af7-d295-478c-8ba9-25e3f92732ee', null);
INSERT INTO "public"."sys_user_info" VALUES ('5feeb284-df42-4d25-97f2-41e984bd475f', null, '女', null, null, null, null, null, null, '46248f6a-c926-4815-b959-5880d9e0871f', null);
INSERT INTO "public"."sys_user_info" VALUES ('699ab1de-6f60-4cc0-9807-b5b197639df5', null, '男', null, null, null, null, null, null, '66676917-e7d0-4142-8ecf-c65daa69a4da', null);
INSERT INTO "public"."sys_user_info" VALUES ('456065eb-fc4f-47b5-9373-7ab5a8d6e20f', null, '女', null, null, null, null, null, null, '05e14a38-ea65-470f-8ed7-6151fe4ab4f3', null);
INSERT INTO "public"."sys_user_info" VALUES ('7774f6d3-826e-47ee-bd93-971802e917ac', null, '男', null, null, null, null, null, null, 'b331e4ba-095f-447b-b8ef-8bc2b98f42f5', null);
INSERT INTO "public"."sys_user_info" VALUES ('80c996d4-5fb4-4d8f-a674-8b4f979ec603', null, '女', null, null, null, null, null, null, '39ebfd1e-f329-4b42-b88b-3371f37b7c71', null);
INSERT INTO "public"."sys_user_info" VALUES ('c50fde7c-313f-483b-91d4-a721ab6caeff', null, '男', null, null, null, null, null, null, '97b7b000-6642-4ae3-8d1b-d457e65515dc', null);
INSERT INTO "public"."sys_user_info" VALUES ('24e3b5c7-e470-4de3-9a1e-d62c3883bca6', null, '女', null, null, null, null, null, null, '507e2409-b3d5-4e24-997f-4397b5536fbc', null);
INSERT INTO "public"."sys_user_info" VALUES ('33e7e1f1-6375-486b-98d8-52a3a9e72dca', null, '男', null, null, null, null, null, null, '818e8f37-9c02-453f-9e54-aabec4e07589', null);
INSERT INTO "public"."sys_user_info" VALUES ('851a675b-f3f4-4ec6-a765-83d70f039075', null, '女', null, null, null, null, null, null, 'e985d017-91fe-4e27-81bb-b6d9cdf2ef95', null);
INSERT INTO "public"."sys_user_info" VALUES ('7df76cb2-9886-4ddc-b787-842c06df9ae3', null, '男', null, null, null, null, null, null, 'a4f3fa89-15c8-46c3-aef4-636df518a752', null);
INSERT INTO "public"."sys_user_info" VALUES ('c0ca5215-ba80-44b6-90e1-24f0c7f7f597', null, '女', null, null, null, null, null, null, 'd2ed76f6-d55b-4006-9948-ec401532c2a0', null);
INSERT INTO "public"."sys_user_info" VALUES ('41ba4b08-fbbe-4650-a41d-529ce866b0de', null, '男', null, null, null, null, null, null, '0a749d4c-54e4-4491-af89-a126ae882703', null);
INSERT INTO "public"."sys_user_info" VALUES ('fc86e91b-4ee4-40b4-a252-348a03b2a7f0', null, '女', null, null, null, null, null, null, '25bbecad-6e5a-457f-a401-e069842d3e69', null);
INSERT INTO "public"."sys_user_info" VALUES ('d081e43a-6bd4-4164-82d5-cb7e2512e25d', null, '男', null, null, null, null, null, null, 'ccdfce0e-aff5-4c83-94b1-d4e1469353ea', null);
INSERT INTO "public"."sys_user_info" VALUES ('f3ee498e-41e1-49dc-9558-8aa6d7da62da', null, '女', null, null, null, null, null, null, 'bd365b7d-7970-4222-b851-b90b905bb9c0', null);
INSERT INTO "public"."sys_user_info" VALUES ('05b6b56e-9552-44c6-8a78-449f8d7801c4', null, '男', null, null, null, null, null, null, '9400d0ee-4eae-4fde-aa0e-d0186c33aa21', null);
INSERT INTO "public"."sys_user_info" VALUES ('8a86fe31-537c-43f0-8345-b66409dbc891', null, '女', null, null, null, null, null, null, '4e92eabf-c576-4177-b8c6-b93af9c34f90', null);
INSERT INTO "public"."sys_user_info" VALUES ('89d530f7-ecc3-4392-b5b3-15b9f78d8391', null, '男', null, null, null, null, null, null, '3f94d7f0-1a93-407a-aa80-708b5fcceca6', null);
INSERT INTO "public"."sys_user_info" VALUES ('21d01644-6cd3-4cbc-9c3b-544deb479972', null, '女', null, null, null, null, null, null, 'fe60ec86-13e2-4b88-b65f-265c0938831e', null);
INSERT INTO "public"."sys_user_info" VALUES ('cda3fe6f-7ba3-4bec-9d49-7dbd58d38b1c', null, '男', null, null, null, null, null, null, '4bdace5c-d6f5-4682-91c0-7de5b2269563', null);
INSERT INTO "public"."sys_user_info" VALUES ('bd02af60-fb46-4e13-bcad-9bc7772c0825', null, '女', null, null, null, null, null, null, 'fd9cbee6-aedf-4487-bd1d-22b81d819274', null);
INSERT INTO "public"."sys_user_info" VALUES ('377385e1-f764-411d-b518-76f88bbced7c', null, '男', null, null, null, null, null, null, '8e55c614-be88-41e0-ab53-aadc9b740a88', null);
INSERT INTO "public"."sys_user_info" VALUES ('9ce45bec-0a65-46ba-af4a-15489ef3fa09', null, '女', null, null, null, null, null, null, '3b770dd5-ae63-41a2-b2ca-e7028e5d1929', null);
INSERT INTO "public"."sys_user_info" VALUES ('f5b722da-adc8-402a-8bcf-94e700848d8e', null, '男', null, null, null, null, null, null, 'ce956877-331e-4dee-ba08-cad9bc1c4a0c', null);
INSERT INTO "public"."sys_user_info" VALUES ('04328fc5-9ff6-4490-951b-a05e694abf26', null, '女', null, null, null, null, null, null, 'cd1ad19c-5f72-40d9-a95b-068af406c7dd', null);
INSERT INTO "public"."sys_user_info" VALUES ('7778bd45-cf41-44e0-b2c8-1a52f9e3657a', null, '男', null, null, null, null, null, null, '960295f6-cb10-4da3-b936-9697e7915e50', null);
INSERT INTO "public"."sys_user_info" VALUES ('61ac8c30-acbe-41e1-a78f-136a5299e851', null, '女', null, null, null, null, null, null, 'ce1e6aae-f273-4084-9a7e-7c82d8a44193', null);
INSERT INTO "public"."sys_user_info" VALUES ('59ef6855-4970-4487-97ae-dad544586237', null, '男', null, null, null, null, null, null, '6c3f7f21-b5be-49b2-ba24-36bc8908b719', null);
INSERT INTO "public"."sys_user_info" VALUES ('aae1ea74-e3d2-45a2-80b9-2cc726a2562d', null, '女', null, null, null, null, null, null, '559e43d7-d152-4a73-9b14-129da480dee7', null);
INSERT INTO "public"."sys_user_info" VALUES ('cf2b905d-e5cb-47f3-9ce0-b46f2b9c7afc', null, '男', null, null, null, null, null, null, '7d6f4e04-a241-41e2-8eda-65bf4c38443a', null);
INSERT INTO "public"."sys_user_info" VALUES ('9c310d96-3ef2-4bbb-bef9-e0916ccfe8aa', null, '女', null, null, null, null, null, null, '5c7084e2-b678-4b0e-a99f-f0cb9d56138c', null);
INSERT INTO "public"."sys_user_info" VALUES ('5df93d4e-c607-441b-bb57-a49c566c11da', null, '男', null, null, null, null, null, null, 'e5821ab6-179b-4863-8e16-3d91e8a22b91', null);
INSERT INTO "public"."sys_user_info" VALUES ('cba2d5d3-23a9-4d84-b8c4-34ad808e8b3a', null, '女', null, null, null, null, null, null, '99e14914-7f65-4b0d-abc6-0d488c13d2cf', null);
INSERT INTO "public"."sys_user_info" VALUES ('6b1ccf70-b648-4632-82e6-36fe396b439b', null, '男', null, null, null, null, null, null, '67d6b5af-a424-45c5-8108-23f4741e29e6', null);
INSERT INTO "public"."sys_user_info" VALUES ('da8178c9-594c-4666-bc11-d5ce607866a7', null, '女', null, null, null, null, null, null, 'e01c5089-29f9-473b-a547-29d5d61dd4a2', null);
INSERT INTO "public"."sys_user_info" VALUES ('b434a1ea-b9b6-4ab3-a16d-a846edc39813', null, '男', null, null, null, null, null, null, 'f1f3c4cb-0634-48c1-ae60-60f0a4e761a8', null);
INSERT INTO "public"."sys_user_info" VALUES ('c6e4872f-212e-4438-a081-33348a6ddd55', null, '女', null, null, null, null, null, null, '036a154b-536e-4a2c-86ea-d66272ea76b5', null);
INSERT INTO "public"."sys_user_info" VALUES ('36d23883-04fd-4ff3-a3cf-cb9f3ca4d1e3', null, '男', null, null, null, null, null, null, '9bf954b3-a2f2-4ae2-ad3f-be6d38ac1574', null);
INSERT INTO "public"."sys_user_info" VALUES ('221f0d53-266b-460a-a69a-c5e64ab9e63b', null, '女', null, null, null, null, null, null, 'd4d33feb-d7ec-4f5c-886d-d6a60592f121', null);
INSERT INTO "public"."sys_user_info" VALUES ('fbe6ed0f-1ec4-4140-b235-d70f889ccbf8', null, '男', null, null, null, null, null, null, '3b834fd3-7dda-473e-83ea-a3d72278653e', null);
INSERT INTO "public"."sys_user_info" VALUES ('ba40049d-448f-47f8-8fb9-fc7c0c9f073d', null, '女', null, null, null, null, null, null, '5f49c4cf-909a-47a1-a317-b24f3b98c6a9', null);
INSERT INTO "public"."sys_user_info" VALUES ('16eea315-dadf-4286-af1e-5dea8fb1a737', null, '男', null, null, null, null, null, null, 'c271038e-2f3b-4ebc-bd5a-bdd29b5c339d', null);
INSERT INTO "public"."sys_user_info" VALUES ('f6301d32-0f17-4118-ad5f-54512a904eeb', null, '女', null, null, null, null, null, null, '621b28eb-7a8e-4b53-bfb8-8e61ed798b0c', null);
INSERT INTO "public"."sys_user_info" VALUES ('6c21321f-f941-4079-b0b0-b392eea0b0ab', null, '男', null, null, null, null, null, null, '6b9d39c0-e7fc-4376-8855-b8631735fb06', null);
INSERT INTO "public"."sys_user_info" VALUES ('c05e81e6-8b05-4860-bdf9-7c27418e441f', null, '女', null, null, null, null, null, null, 'ff71166c-8406-4d0f-9ef3-6cc7d719a372', null);
INSERT INTO "public"."sys_user_info" VALUES ('3c6896b9-25e6-4689-ae35-b21fb6b6645b', null, '男', null, null, null, null, null, null, '95b1acd9-fc26-4d84-9cd4-d533faeb98c9', null);
INSERT INTO "public"."sys_user_info" VALUES ('4feaec0e-fa38-452f-a027-eeff80a535d2', null, '女', null, null, null, null, null, null, 'bd0b3068-cfef-4448-b37e-ae7a7162fbe0', null);
INSERT INTO "public"."sys_user_info" VALUES ('e7c90564-de8d-4ec3-b4ff-c07c9c283b48', null, '男', null, null, null, null, null, null, '91f88a4b-7544-4e42-852e-403252b42a76', null);
INSERT INTO "public"."sys_user_info" VALUES ('53f70593-0e40-47e8-8626-0d3ece09441f', null, '女', null, null, null, null, null, null, '718fb377-e177-472d-b5d3-0cc5b7d04ba9', null);
INSERT INTO "public"."sys_user_info" VALUES ('7fa8d7f0-b37c-413e-a126-de7214b1fdd2', null, '男', null, null, null, null, null, null, '929ef94c-5662-419e-bc2e-e1b707520144', null);
INSERT INTO "public"."sys_user_info" VALUES ('92c29cad-d49b-4c87-9be3-56044d805381', null, '女', null, null, null, null, null, null, '719a3e7b-46cb-4cf9-8bf9-fd4a3af2c979', null);
INSERT INTO "public"."sys_user_info" VALUES ('f7af15f7-da7a-4381-b0ba-190672bad2b9', null, '男', null, null, null, null, null, null, '018fd360-a55e-4ed9-a3fd-e6105dee8d43', null);
INSERT INTO "public"."sys_user_info" VALUES ('02bf26ef-0976-4b46-a527-3a8b51bde6c2', null, '女', null, null, null, null, null, null, 'e1b6a922-c3da-45fc-9f9e-c2ba0abe5663', null);
INSERT INTO "public"."sys_user_info" VALUES ('f64fd002-895e-4506-9d23-5133fae3d3c8', null, '男', null, null, null, null, null, null, '6b323000-a373-4533-97b7-6fa6420a4fd5', null);
INSERT INTO "public"."sys_user_info" VALUES ('2f44fb1f-9edf-4847-b769-1d0a021d216a', null, '女', null, null, null, null, null, null, '61439f5f-2007-477b-9d6b-a0f637ddcdbc', null);
INSERT INTO "public"."sys_user_info" VALUES ('055762e0-4626-45ef-a3c2-984583938ac8', null, '男', null, null, null, null, null, null, 'b0454789-c138-47dc-b7dc-65d595211188', null);
INSERT INTO "public"."sys_user_info" VALUES ('cde9294d-8a3d-4a97-bf2a-c28036d6e311', null, '女', null, null, null, null, null, null, '81e964c7-b78e-4b22-a673-47b421e5e3aa', null);
INSERT INTO "public"."sys_user_info" VALUES ('664e3d59-20ba-4e6f-bf6a-52726cc3b4cd', null, '男', null, null, null, null, null, null, '5cb7a233-b2bc-4e79-8958-c8042393975a', null);
INSERT INTO "public"."sys_user_info" VALUES ('39b6e6d4-7f94-4270-a32c-ce76c3b4cf47', null, '女', null, null, null, null, null, null, 'c0988d59-5c89-4a9f-8eca-db9e72026e3d', null);
INSERT INTO "public"."sys_user_info" VALUES ('da20ee1c-93cf-43b3-8b5c-3438e56c91d9', null, '男', null, null, null, null, null, null, '103d217f-ee4a-4d43-8a77-993e204d1522', null);
INSERT INTO "public"."sys_user_info" VALUES ('20ca6bfc-78c7-43e8-8bd8-0d2377ba2aa5', null, '女', null, null, null, null, null, null, '6fbdbb4b-f3da-4cac-b07f-b8b7ddb37ad0', null);
INSERT INTO "public"."sys_user_info" VALUES ('a3e02ad2-581c-4c31-8677-4109029c1721', null, '男', null, null, null, null, null, null, 'f69e53d4-a9ab-45b3-b271-229795d1d79c', null);
INSERT INTO "public"."sys_user_info" VALUES ('23a10168-6646-43e9-ac00-1d098cd3e238', null, '女', null, null, null, null, null, null, '983d5223-d6a3-41a0-a35b-5f3d860dc3a9', null);
INSERT INTO "public"."sys_user_info" VALUES ('6791d77d-d73a-4bb4-9ed7-1e7a56dc3696', null, '男', null, null, null, null, null, null, '9c77be66-a60d-493d-8c05-9201711fa076', null);
INSERT INTO "public"."sys_user_info" VALUES ('383f3426-6057-4ef2-8519-4f7708e9261b', null, '女', null, null, null, null, null, null, 'a12a9bee-ad00-498d-83f2-ec2ea081711e', null);
INSERT INTO "public"."sys_user_info" VALUES ('e8ad31dc-157d-494d-90a9-10c2e0ee1057', null, '男', null, null, null, null, null, null, 'bdd0084d-e917-4f40-ae0b-2cf49f51e8bc', null);
INSERT INTO "public"."sys_user_info" VALUES ('2cebd9b5-977f-4db5-9138-4022061f6a04', null, '女', null, null, null, null, null, null, 'ffd8fe44-df45-4f00-b1d9-73e740d8c52e', null);
INSERT INTO "public"."sys_user_info" VALUES ('936b540f-6d66-43ce-b17f-83955f4a4ae4', null, '男', null, null, null, null, null, null, 'cb62ebb1-3522-41e0-b5a4-69a133eb3138', null);
INSERT INTO "public"."sys_user_info" VALUES ('bc8ab17a-7749-43ca-a6ff-66227123f593', null, '女', null, null, null, null, null, null, '7e07b295-e314-4ecc-93c7-67c160c6a5b3', null);
INSERT INTO "public"."sys_user_info" VALUES ('b434f558-8ffb-4473-96b9-1f3c1ce03331', null, '男', null, null, null, null, null, null, 'a943d19f-9901-4a4c-84a5-6d843540d3e7', null);
INSERT INTO "public"."sys_user_info" VALUES ('60205202-2512-43c3-8395-192b996dc87c', null, '女', null, null, null, null, null, null, '082f8350-b4e3-4a36-9a50-1cd56440f7dd', null);
INSERT INTO "public"."sys_user_info" VALUES ('e5e81f00-5f52-42f1-b69a-512ee5a83728', null, '男', null, null, null, null, null, null, '818a373a-055a-4557-a1cc-0df723e0db4b', null);
INSERT INTO "public"."sys_user_info" VALUES ('231f4730-d376-4590-bdda-deb933e322c6', null, '女', null, null, null, null, null, null, '1d6f3712-52c3-42c6-b775-e669c36dba86', null);
INSERT INTO "public"."sys_user_info" VALUES ('96238550-c68e-43d4-b9cb-ab920c2cc1c0', null, '男', null, null, null, null, null, null, 'c30deb23-b50d-4f6c-8824-0d0c41fd7cf9', null);
INSERT INTO "public"."sys_user_info" VALUES ('e3899a3d-24d4-4ae1-a81f-dcc7041f9816', null, '女', null, null, null, null, null, null, 'd9846d1e-5605-4d4b-acf2-abd425eff8aa', null);
INSERT INTO "public"."sys_user_info" VALUES ('4ff73823-b322-4b2e-b359-96acef6bbca4', null, '男', null, null, null, null, null, null, 'f7756fe4-9e0d-4d29-94f0-b5eb7e7e14aa', null);
INSERT INTO "public"."sys_user_info" VALUES ('0051ad16-f28a-4884-9c34-5d49b43f9f74', null, '女', null, null, null, null, null, null, '3aeb38e1-11bf-46d2-a5f7-9689c698d663', null);
INSERT INTO "public"."sys_user_info" VALUES ('13e79b4a-b63f-470c-873a-baad2cd07c0a', null, '男', null, null, null, null, null, null, '189e8e64-bccc-472b-b741-0331779d50a5', null);
INSERT INTO "public"."sys_user_info" VALUES ('d601e664-0021-4ddc-8456-02bbbb72403e', null, '女', null, null, null, null, null, null, '5a84c497-0c0e-4631-ab0e-209dfe02ff0a', null);
INSERT INTO "public"."sys_user_info" VALUES ('7fb830c2-467a-4b74-8428-e53eb2666fb0', null, '男', null, null, null, null, null, null, 'e6cd1e9c-7635-4f6e-a9c2-18aac147514a', null);
INSERT INTO "public"."sys_user_info" VALUES ('727dfb85-51aa-4384-a50d-954fb77aa38d', null, '女', null, null, null, null, null, null, '25afd997-c99b-45fb-81b4-60e27bc88d1a', null);
INSERT INTO "public"."sys_user_info" VALUES ('4e8bac90-3269-4fb7-abd8-148a0712fc5d', null, '男', null, null, null, null, null, null, 'e236057b-969e-4671-abc6-dd4115550a76', null);
INSERT INTO "public"."sys_user_info" VALUES ('7a55719f-2fe2-432a-a6f1-794f729aae37', null, '女', null, null, null, null, null, null, '8fee0353-dcd5-408c-9ccb-9bd84d02e0da', null);
INSERT INTO "public"."sys_user_info" VALUES ('fe454e62-97b4-4697-a979-0eb61b8bb552', null, '男', null, null, null, null, null, null, '3c112b9e-690e-48fc-8101-9515cf9e555e', null);
INSERT INTO "public"."sys_user_info" VALUES ('48298e4d-95d9-4fab-9122-d8f561234a78', null, '女', null, null, null, null, null, null, '7f9b54b1-8f89-4d7c-adf5-fa07dac0024b', null);
INSERT INTO "public"."sys_user_info" VALUES ('6e0121ad-4fa6-4880-b7e8-c747f146aa15', null, '男', null, null, null, null, null, null, '7c61e599-7f93-49c7-88a7-32518733f028', null);
INSERT INTO "public"."sys_user_info" VALUES ('ff793bb6-0ba4-4334-b3a1-eede5e1db5a1', null, '女', null, null, null, null, null, null, '56ab7667-7d34-4f7d-96ac-8cd6dd9e429b', null);
INSERT INTO "public"."sys_user_info" VALUES ('1e68e5bd-78cf-4889-bfbf-2e8173dc1df2', null, '男', null, null, null, null, null, null, '1e11b062-da5b-4426-a445-6bfaf34770e2', null);
INSERT INTO "public"."sys_user_info" VALUES ('90992457-8186-4b56-96e5-f7c3ad9d0fd9', null, '女', null, null, null, null, null, null, 'ceda7931-6235-4e77-af04-a1f21512951b', null);
INSERT INTO "public"."sys_user_info" VALUES ('e5a50ed2-a4b7-429a-8221-a52745f08d20', null, '男', null, null, null, null, null, null, 'c9283bec-7d79-4f06-944d-761c2b54ad19', null);
INSERT INTO "public"."sys_user_info" VALUES ('956afdfa-4a2d-49e0-9420-4dfd03c2d757', null, '女', null, null, null, null, null, null, '7313bdf0-70f1-4c7e-b54f-74dd0d851b25', null);
INSERT INTO "public"."sys_user_info" VALUES ('56c16998-7676-42e1-bcd1-e6d3a9dafcf4', null, '男', null, null, null, null, null, null, '79ae9611-bd6e-4702-9ca2-7bb6d85f4ccc', null);
INSERT INTO "public"."sys_user_info" VALUES ('cdf7d371-6e5f-4c47-9846-f56866e86500', null, '女', null, null, null, null, null, null, '1752c9cd-d6a0-4fef-bda8-2ac83ae7538f', null);
INSERT INTO "public"."sys_user_info" VALUES ('fae8d4e1-00d9-42fa-a337-3d3abce5fad5', null, '男', null, null, null, null, null, null, 'b5248390-97bc-4f2e-b6be-8362d14ec58f', null);
INSERT INTO "public"."sys_user_info" VALUES ('d6e545b5-22ff-4e40-9766-98ce4a712bb0', null, '女', null, null, null, null, null, null, 'b079fe53-37eb-4b96-874e-2ec279e1b2ee', null);
INSERT INTO "public"."sys_user_info" VALUES ('83a979e0-3c85-4e0d-9bb0-ba01dcbf23c5', null, '男', null, null, null, null, null, null, 'e05f4781-ea5b-4ee2-a1c5-a35a042cba8d', null);
INSERT INTO "public"."sys_user_info" VALUES ('393be309-2186-4412-9403-cae98c2ea092', null, '女', null, null, null, null, null, null, 'cd005a22-f638-474b-8004-b8e3f9059eda', null);
INSERT INTO "public"."sys_user_info" VALUES ('109e38d4-cf54-45b3-a6a6-760026859528', null, '男', null, null, null, null, null, null, '9b0abd96-4364-4919-9b2f-c0128971068a', null);
INSERT INTO "public"."sys_user_info" VALUES ('8904636c-c1f6-4182-92b3-c01f135038af', null, '女', null, null, null, null, null, null, '4aaa3845-734a-4f50-a6a3-538cb48afc6b', null);
INSERT INTO "public"."sys_user_info" VALUES ('1abb9011-c875-4b1f-8883-73c680e0ab82', null, '男', null, null, null, null, null, null, '10892b37-15c2-4252-8da8-251de3b4630d', null);
INSERT INTO "public"."sys_user_info" VALUES ('d5b3c9bb-3592-4001-b154-3ba0ad2353fc', null, '女', null, null, null, null, null, null, '05f9e54b-7791-4c4a-9898-cede0a74f75a', null);
INSERT INTO "public"."sys_user_info" VALUES ('fe3fa64f-555c-4d02-8bb9-3dfaa42ea596', null, '男', null, null, null, null, null, null, '4e2eb944-9d16-4bee-b2e8-bcd3418104b6', null);
INSERT INTO "public"."sys_user_info" VALUES ('b21403b7-671c-4f8c-83b9-410217c655a4', null, '女', null, null, null, null, null, null, 'f9d0f3aa-31f6-46bc-a410-064b1b9adc47', null);
INSERT INTO "public"."sys_user_info" VALUES ('613025a7-d532-4f14-8ca3-6540d4f1a435', null, '男', null, null, null, null, null, null, '7a752d93-2364-4686-b4ea-c1ab7286b267', null);
INSERT INTO "public"."sys_user_info" VALUES ('e67c6b71-1931-471c-a174-deb5c16f75f6', null, '女', null, null, null, null, null, null, '153bb2f0-9fa2-472e-b074-a24f74097f67', null);
INSERT INTO "public"."sys_user_info" VALUES ('a5e8f267-8aaa-4268-95fd-5d5282a22aac', null, '男', null, null, null, null, null, null, '40976679-4e8b-4bb2-b01b-081e12678d04', null);
INSERT INTO "public"."sys_user_info" VALUES ('4bc585f5-4fb3-4749-8ce4-983d1391c39b', null, '女', null, null, null, null, null, null, '07779b59-bf56-48c3-ad34-f5ba0d184cc4', null);
INSERT INTO "public"."sys_user_info" VALUES ('824c19a1-df49-424b-b197-e7779516c964', null, '男', null, null, null, null, null, null, '24c07ab5-8929-4ad5-a943-08b0b69f0f18', null);
INSERT INTO "public"."sys_user_info" VALUES ('246b2e3f-b58d-46a1-b6d6-67539e99c7d6', null, '女', null, null, null, null, null, null, '9918e22d-956c-47af-9699-8e0baf8f63f5', null);
INSERT INTO "public"."sys_user_info" VALUES ('d759d86b-5868-4cee-8415-5c7daecfab42', null, '男', null, null, null, null, null, null, '03190b52-7a3a-46ea-adc2-313bebd69d30', null);
INSERT INTO "public"."sys_user_info" VALUES ('9f62d233-1202-44c1-bdbb-7567437c60b0', null, '女', null, null, null, null, null, null, 'dd45e37e-d0f5-4501-89ee-4763fc7eac64', null);
INSERT INTO "public"."sys_user_info" VALUES ('368bd705-5636-493e-a945-592ca6cdaff0', null, '男', null, null, null, null, null, null, 'd08d6112-ad0b-4b30-b182-fe8899d3abaa', null);
INSERT INTO "public"."sys_user_info" VALUES ('63e1fdc2-8fd5-4cc3-a486-6b49a22c63fa', null, '女', null, null, null, null, null, null, '87d1acbb-90dd-4837-8780-db734869145c', null);
INSERT INTO "public"."sys_user_info" VALUES ('81a8210d-a498-4415-9888-ff01fbc93fc3', null, '男', null, null, null, null, null, null, '92b91871-e821-4c8a-9a61-6f040425e5ae', null);
INSERT INTO "public"."sys_user_info" VALUES ('e4cc6d92-c697-49b7-9649-09385340c7e9', null, '女', null, null, null, null, null, null, 'c4295ef8-6e09-49bc-922c-1f0249a44f7e', null);
INSERT INTO "public"."sys_user_info" VALUES ('0bae7db5-f468-4833-96e5-7111669e85d4', null, '男', null, null, null, null, null, null, '3d8959e8-e53f-4892-ab4c-8ee3a7d89e79', null);
INSERT INTO "public"."sys_user_info" VALUES ('8a18bbdc-cbc2-4cbe-ba30-c7669144b9e3', null, '女', null, null, null, null, null, null, '6371a955-48a4-4202-879a-ae47b03cfa69', null);
INSERT INTO "public"."sys_user_info" VALUES ('dbe9615e-e881-44b4-a38c-2afb0f684da4', null, '男', null, null, null, null, null, null, '23fae268-4e6f-4b0c-acfe-14170609ba74', null);
INSERT INTO "public"."sys_user_info" VALUES ('9fad2d44-77f6-4ff1-976c-d8bb5f1b40c7', null, '女', null, null, null, null, null, null, '8a08f730-586b-42b8-996b-9335069e4c3e', null);
INSERT INTO "public"."sys_user_info" VALUES ('a5609815-595f-4e55-8d64-1c941e752aab', null, '男', null, null, null, null, null, null, 'f187b742-cadb-4eea-bbe4-3b2434355729', null);
INSERT INTO "public"."sys_user_info" VALUES ('946238a8-efb1-4283-9d83-02cb63513639', null, '女', null, null, null, null, null, null, '7e29f97d-dc14-4843-a156-a336546afb10', null);
INSERT INTO "public"."sys_user_info" VALUES ('4851ab23-4957-4839-b11e-8f9afd327313', null, '男', null, null, null, null, null, null, 'ca902763-52cd-48c7-87de-a46e1e6d19b0', null);
INSERT INTO "public"."sys_user_info" VALUES ('6cc78807-33c8-4026-b1a1-50f6066f4049', null, '女', null, null, null, null, null, null, '10dad122-7b73-42b1-8f3e-f8867447e9c6', null);
INSERT INTO "public"."sys_user_info" VALUES ('a4a3232f-0e8a-40b4-b29d-1a2cce0cd289', null, '男', null, null, null, null, null, null, '85119881-290d-47bf-9aca-876173b15798', null);
INSERT INTO "public"."sys_user_info" VALUES ('60c31d70-0e7b-4d9c-9262-43040847497e', null, '女', null, null, null, null, null, null, 'fff0cab6-f6c3-42aa-85af-a58689f29a4e', null);
COMMIT;

-- ----------------------------
--  Table structure for hunt
-- ----------------------------
DROP TABLE IF EXISTS "public"."hunt";
CREATE TABLE "public"."hunt" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"salary" varchar(50) COLLATE "default",
	"browse_count" int4,
	"resume_id" varchar(128) COLLATE "default",
	"job_id" varchar(128) COLLATE "default",
	"food_type_id" varchar(128) COLLATE "default",
	"hunt_date" int8,
	"work_area" varchar COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."hunt" OWNER TO "postgres";

COMMENT ON COLUMN "public"."hunt"."salary" IS '工资区间';
COMMENT ON COLUMN "public"."hunt"."browse_count" IS '浏览次数';
COMMENT ON COLUMN "public"."hunt"."resume_id" IS '简历id';
COMMENT ON COLUMN "public"."hunt"."job_id" IS '职位id';
COMMENT ON COLUMN "public"."hunt"."food_type_id" IS '菜系id';
COMMENT ON COLUMN "public"."hunt"."hunt_date" IS '求职日期';
COMMENT ON COLUMN "public"."hunt"."work_area" IS '工作区域';

-- ----------------------------
--  Table structure for enterprise
-- ----------------------------
DROP TABLE IF EXISTS "public"."enterprise";
CREATE TABLE "public"."enterprise" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"name" varchar(128) COLLATE "default",
	"contact_way" varchar(50) COLLATE "default",
	"work_area" varchar(50) COLLATE "default",
	"address" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."enterprise" OWNER TO "postgres";

COMMENT ON COLUMN "public"."enterprise"."name" IS '企业名称';
COMMENT ON COLUMN "public"."enterprise"."contact_way" IS '联系方式';
COMMENT ON COLUMN "public"."enterprise"."work_area" IS '企业的工作地区';
COMMENT ON COLUMN "public"."enterprise"."address" IS '企业的地址';

-- ----------------------------
--  Records of enterprise
-- ----------------------------
BEGIN;
INSERT INTO "public"."enterprise" VALUES ('d24a9a4d-f65b-497d-b4ad-97f40bd06960', '银座-A有限公司', '020-32152032', '广东省广州市天河区', '广东省广州市天河区体育中心大厦北街A座');
INSERT INTO "public"."enterprise" VALUES ('53b3bbba-b9e2-41d3-b2ee-0b29ce764b18', '都市村庄有限公司', '020-132152032', '广东省广州市天河区', '广东省广州市天河区社会大厦B座');
INSERT INTO "public"."enterprise" VALUES ('eb3339b8-7779-4257-874f-80b870ee86ef', '小北公司', '020-63214221', '广东省广州市越秀区', '广东省广州市越秀区恒安路2号');
INSERT INTO "public"."enterprise" VALUES ('194adbf4-bae5-4e7c-b972-da8e10229b38', '广州体育馆公司', '1333214221', '广东省广州市白云区', '广东省广州市白云区白云大道南783号');
INSERT INTO "public"."enterprise" VALUES ('e3c44e02-baef-4a27-a201-55a2ea562935', '广州医院公司', '020-83214221', '广东省广州市越秀区', '广东省广州市越秀区恒福路21号');
COMMIT;

-- ----------------------------
--  Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS "public"."video";
CREATE TABLE "public"."video" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"title" varchar(50) COLLATE "default",
	"random_name" varchar(50) COLLATE "default",
	"play_count" int4,
	"admire_count" int4,
	"img_name" varchar(50) COLLATE "default",
	"video_url" varchar(255) COLLATE "default",
	"video_img_name" varchar(50) COLLATE "default",
	"content" text COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."video" OWNER TO "postgres";

-- ----------------------------
--  Table structure for welfare
-- ----------------------------
DROP TABLE IF EXISTS "public"."welfare";
CREATE TABLE "public"."welfare" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"name" varchar(50) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."welfare" OWNER TO "postgres";

-- ----------------------------
--  Records of welfare
-- ----------------------------
BEGIN;
INSERT INTO "public"."welfare" VALUES ('b535dc64-c353-4f93-88e0-530077f8b713', '五险一金');
INSERT INTO "public"."welfare" VALUES ('a7ef2c02-c2ed-4d92-9a5c-b14703fa617d', '餐补');
INSERT INTO "public"."welfare" VALUES ('78bfca72-0ccc-4ecb-a79f-34ddfffee7b3', '房补');
COMMIT;

-- ----------------------------
--  Table structure for image_text
-- ----------------------------
DROP TABLE IF EXISTS "public"."image_text";
CREATE TABLE "public"."image_text" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"title" varchar(50) COLLATE "default",
	"image_name" varchar(50) COLLATE "default",
	"content" text COLLATE "default",
	"admire_count" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."image_text" OWNER TO "postgres";

-- ----------------------------
--  Table structure for consult
-- ----------------------------
DROP TABLE IF EXISTS "public"."consult";
CREATE TABLE "public"."consult" (
	"id" varchar(128) NOT NULL COLLATE "default",
	"article_type" int2,
	"consult_type" int2,
	"publish_date" int8,
	"user_id" varchar(128) COLLATE "default",
	"article_id" varchar(128) COLLATE "default",
	"publisher_name" varchar(50) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."consult" OWNER TO "postgres";

COMMENT ON COLUMN "public"."consult"."article_type" IS '文章类型 0:图文 1:视频';
COMMENT ON COLUMN "public"."consult"."consult_type" IS '咨询类型 (0:饮食文化,1:日常记录)';
COMMENT ON COLUMN "public"."consult"."publish_date" IS '发布日期';

-- ----------------------------
--  Primary key structure for table service
-- ----------------------------
ALTER TABLE "public"."service" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table active
-- ----------------------------
ALTER TABLE "public"."active" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table food_type
-- ----------------------------
ALTER TABLE "public"."food_type" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table count
-- ----------------------------
ALTER TABLE "public"."count" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table user_browse
-- ----------------------------
ALTER TABLE "public"."user_browse" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table work_experience
-- ----------------------------
ALTER TABLE "public"."work_experience" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table job
-- ----------------------------
ALTER TABLE "public"."job" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table advertise
-- ----------------------------
ALTER TABLE "public"."advertise" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table rank
-- ----------------------------
ALTER TABLE "public"."rank" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table proxy
-- ----------------------------
ALTER TABLE "public"."proxy" ADD PRIMARY KEY ("id", "user_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table user_collect
-- ----------------------------
ALTER TABLE "public"."user_collect" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table user_service
-- ----------------------------
ALTER TABLE "public"."user_service" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table stick
-- ----------------------------
ALTER TABLE "public"."stick" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table recruit
-- ----------------------------
ALTER TABLE "public"."recruit" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table resume
-- ----------------------------
ALTER TABLE "public"."resume" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table consult_comment
-- ----------------------------
ALTER TABLE "public"."consult_comment" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table user_recruit_apply
-- ----------------------------
ALTER TABLE "public"."user_recruit_apply" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table sys_user_info
-- ----------------------------
ALTER TABLE "public"."sys_user_info" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table hunt
-- ----------------------------
ALTER TABLE "public"."hunt" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table enterprise
-- ----------------------------
ALTER TABLE "public"."enterprise" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table video
-- ----------------------------
ALTER TABLE "public"."video" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table welfare
-- ----------------------------
ALTER TABLE "public"."welfare" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table image_text
-- ----------------------------
ALTER TABLE "public"."image_text" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table consult
-- ----------------------------
ALTER TABLE "public"."consult" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

