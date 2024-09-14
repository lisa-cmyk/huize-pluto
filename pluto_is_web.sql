/*
Navicat MySQL Data Transfer

Source Server         : 新中台P版
Source Server Version : 50733
Source Host           : 172.21.0.14:30008
Source Database       : pluto_is_web

Target Server Type    : MYSQL
Target Server Version : 50733
File Encoding         : 65001

Date: 2024-05-20 19:00:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `move_insure_temp`
-- ----------------------------
DROP TABLE IF EXISTS `move_insure_temp`;
CREATE TABLE `move_insure_temp` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`source_platform`  int(4) NULL DEFAULT 2 COMMENT '来源平台' ,
`target_platform`  int(4) NULL DEFAULT 1 COMMENT '来源平台' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NOT NULL DEFAULT 0 COMMENT '计划运营ID' ,
`passport_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`is_processed`  int(4) NULL DEFAULT 0 COMMENT '0:未处理 1:已处理' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `move_insure_temp_UN` (`insure_num`) USING BTREE ,
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='大白数据迁移临时表'
AUTO_INCREMENT=44

;

-- ----------------------------
-- Table structure for `t_abnormal`
-- ----------------------------
DROP TABLE IF EXISTS `t_abnormal`;
CREATE TABLE `t_abnormal` (
`id`  int(4) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '投保用户来源平台' ,
`overdue_time`  timestamp NULL DEFAULT NULL COMMENT '过期时间' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num_platform` (`insure_num`, `platform`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='数据异常监控记录表'
AUTO_INCREMENT=3301707

;

-- ----------------------------
-- Table structure for `t_account_price`
-- ----------------------------
DROP TABLE IF EXISTS `t_account_price`;
CREATE TABLE `t_account_price` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`company_id`  int(11) NOT NULL DEFAULT 0 COMMENT '保险公司ID' ,
`account_code`  int(4) NOT NULL DEFAULT 0 COMMENT '账户编号' ,
`account_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账户名称' ,
`unit_price`  decimal(15,5) NULL DEFAULT NULL COMMENT '单位价格' ,
`price_date`  date NULL DEFAULT NULL COMMENT '计价日期' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='账户价格表'
AUTO_INCREMENT=358

;

-- ----------------------------
-- Table structure for `t_account_trade`
-- ----------------------------
DROP TABLE IF EXISTS `t_account_trade`;
CREATE TABLE `t_account_trade` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`trade_num`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易流水号' ,
`account_code`  int(11) NOT NULL DEFAULT 0 COMMENT '子账户ID' ,
`product_id`  int(11) NOT NULL DEFAULT 0 ,
`insure_num`  bigint(20) NOT NULL COMMENT '投保单号' ,
`policy_company_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司保单号' ,
`trade_amount`  decimal(12,5) NULL DEFAULT NULL COMMENT '交易金额' ,
`trade_number`  decimal(15,5) NULL DEFAULT NULL COMMENT '交易份额' ,
`type`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '交易类型' ,
`trade_account`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易账户ID' ,
`status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`remark`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_policy_company_num` (`policy_company_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='账户交易表'
AUTO_INCREMENT=193

;

-- ----------------------------
-- Table structure for `t_account_worth`
-- ----------------------------
DROP TABLE IF EXISTS `t_account_worth`;
CREATE TABLE `t_account_worth` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(20) NOT NULL COMMENT '投保单号' ,
`product_id`  int(11) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`account_code`  int(11) NOT NULL DEFAULT 0 COMMENT '账户编号' ,
`account_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'z杭湖名称' ,
`price_date`  date NULL DEFAULT NULL COMMENT '计价日期' ,
`account_amount`  decimal(12,5) NULL DEFAULT NULL COMMENT '账户总额' ,
`account_number`  decimal(15,5) NULL DEFAULT NULL COMMENT '账户份额' ,
`surplus_number`  decimal(15,5) NULL DEFAULT NULL COMMENT '剩余份额' ,
`unit_price`  decimal(15,5) NULL DEFAULT NULL COMMENT '单位价格' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='账户价值表'
AUTO_INCREMENT=3546

;

-- ----------------------------
-- Table structure for `t_actuator_task`
-- ----------------------------
DROP TABLE IF EXISTS `t_actuator_task`;
CREATE TABLE `t_actuator_task` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`task_id`  varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务id，全局唯一' ,
`actuator_type`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行器类型' ,
`actuator_param`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '执行器参数' ,
`lock_version`  smallint(6) NOT NULL COMMENT '乐观锁版本' ,
`max_exec`  smallint(6) NOT NULL COMMENT '最大执行次数' ,
`delay_time`  int(11) NOT NULL COMMENT '延迟时间,单位毫秒' ,
`next_exec_time`  datetime NOT NULL COMMENT '下一次执行时间' ,
`update_time`  datetime NOT NULL COMMENT '更新时间' ,
`create_time`  datetime NOT NULL COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_next_exec_time` (`next_exec_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='执行任务表'
AUTO_INCREMENT=159611

;

-- ----------------------------
-- Table structure for `t_adjust_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_adjust_detail`;
CREATE TABLE `t_adjust_detail` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`adjust_num`  bigint(8) NOT NULL COMMENT '批单号' ,
`business_id`  bigint(8) NULL DEFAULT 0 COMMENT '业务ID(投保人ID或被保人ID或受益人ID)' ,
`attribute_key`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批改属性名' ,
`old_value`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原值' ,
`new_value`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新值' ,
`remark`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注' ,
`extend1`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展1' ,
`extend2`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展2' ,
`extend3`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展3' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_adjust_num` (`adjust_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='批单内容表'
AUTO_INCREMENT=6448

;

-- ----------------------------
-- Table structure for `t_adjust_insurant`
-- ----------------------------
DROP TABLE IF EXISTS `t_adjust_insurant`;
CREATE TABLE `t_adjust_insurant` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`insurant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '被保人ID' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '关系ID' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='批改的被保人数据'
AUTO_INCREMENT=1454

;

-- ----------------------------
-- Table structure for `t_adjust_insurant_status`
-- ----------------------------
DROP TABLE IF EXISTS `t_adjust_insurant_status`;
CREATE TABLE `t_adjust_insurant_status` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`adjust_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '批单号' ,
`insurant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '被保人ID' ,
`adjust_status`  tinyint(1) NULL DEFAULT 0 COMMENT '批改状态(0待审核,1审核成功,2审核失败,3批改中,4批改成功,5批改失败,6手动取消)' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`company_adjust_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司批单号' ,
`adjust_file_id`  int(4) NULL DEFAULT 0 COMMENT '批单文件id' ,
`adjust_file_url`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批改文件地址' ,
`effective_date`  timestamp NULL DEFAULT NULL COMMENT '生效时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='被保人批改状态'
AUTO_INCREMENT=1254

;

-- ----------------------------
-- Table structure for `t_adjust_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_adjust_log`;
CREATE TABLE `t_adjust_log` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`adjust_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '批单号' ,
`log_content`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志内容' ,
`user_id`  int(4) NULL DEFAULT 0 COMMENT '操作人ID' ,
`user_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人名称' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_adjust_num` (`adjust_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='批改操作日志表'
AUTO_INCREMENT=1865

;

-- ----------------------------
-- Table structure for `t_assessment_questionnaire`
-- ----------------------------
DROP TABLE IF EXISTS `t_assessment_questionnaire`;
CREATE TABLE `t_assessment_questionnaire` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`insure_num`  bigint(20) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL COMMENT '所属平台' ,
`product_id`  int(5) NOT NULL COMMENT '产品ID' ,
`template_content`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '问卷模板' ,
`answer`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '问卷答案' ,
`result_code`  int(2) NULL DEFAULT NULL COMMENT '问卷评估结果' ,
`deleted`  tinyint(1) NULL DEFAULT 0 ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`customer_level`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户等级' ,
`grade_score`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评分' ,
`answer_ext`  varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '问卷答案扩展字段(支持自定义答案数据)' ,
PRIMARY KEY (`id`),
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='适当性评估问卷'
AUTO_INCREMENT=9350

;

-- ----------------------------
-- Table structure for `t_audit_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `t_audit_attribute`;
CREATE TABLE `t_audit_attribute` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`audit_id`  bigint(8) NOT NULL COMMENT '核保表id' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '平台标识' ,
`attr_key`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性标识' ,
`attr_value`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '属性值' ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除0-否，1-是' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_audit_id` (`audit_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='核保数据的动态属性'
AUTO_INCREMENT=40167

;

-- ----------------------------
-- Table structure for `t_audit_file`
-- ----------------------------
DROP TABLE IF EXISTS `t_audit_file`;
CREATE TABLE `t_audit_file` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`insure_audit_id`  bigint(10) NOT NULL COMMENT '投保单核保ID' ,
`file_item_id`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '清单项ID' ,
`file_id`  int(11) NOT NULL DEFAULT 0 COMMENT '文件ID' ,
`file_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名' ,
`file_url`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件URL' ,
`file_type`  tinyint(4) NOT NULL COMMENT '文件类型' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`remark`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明' ,
`if_add_material`  tinyint(1) NULL DEFAULT 0 COMMENT '是否打回追加资料：0不是，1是' ,
`file_size`  bigint(12) NULL DEFAULT 0 COMMENT '文件大小:单位字节' ,
`type_id`  int(11) NULL DEFAULT NULL COMMENT '文件所属区分 10 投保人，20 被保人' ,
`audit_info_id`  bigint(20) NULL DEFAULT NULL COMMENT '资料项id' ,
PRIMARY KEY (`id`),
INDEX `idx_audit_id_group` (`insure_audit_id`, `file_item_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='核保审核文件表'
AUTO_INCREMENT=23845

;

-- ----------------------------
-- Table structure for `t_audit_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_audit_info`;
CREATE TABLE `t_audit_info` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`insure_audit_id`  bigint(10) NOT NULL COMMENT '投保单核保ID' ,
`file_item_id`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '清单项ID' ,
`file_item_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`business_type`  tinyint(4) NULL DEFAULT 0 COMMENT '资料类型，0 无，1、初始资料，2、问题件资料' ,
`multi_audit_id`  bigint(20) NULL DEFAULT NULL COMMENT '多被保人人核id' ,
`manual_issue_id`  bigint(20) NULL DEFAULT NULL COMMENT '人核问题件id' ,
`info_audit_id`  bigint(20) NULL DEFAULT NULL COMMENT '核保文件审核表id' ,
`item_type`  tinyint(4) NULL DEFAULT 0 COMMENT '资料项类型 上传文件或文本' ,
`item_question`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文本资料项问题' ,
`item_answer`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文本资料项客户回复文本' ,
`item_trans_no`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对接自己使用的标识' ,
`description`  varchar(1200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '资料项描述' ,
PRIMARY KEY (`id`),
INDEX `idx_audit_item_group` (`insure_audit_id`, `file_item_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='核保审核资料表'
AUTO_INCREMENT=16173

;

-- ----------------------------
-- Table structure for `t_audit_manual_condition`
-- ----------------------------
DROP TABLE IF EXISTS `t_audit_manual_condition`;
CREATE TABLE `t_audit_manual_condition` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`manual_rule_id`  int(4) NOT NULL COMMENT '规则id' ,
`condition_priority`  int(4) NOT NULL DEFAULT 0 COMMENT '优先级0-非优先级数据' ,
`condition_type`  int(4) NOT NULL COMMENT '条件类型' ,
`expression`  int(4) NOT NULL COMMENT '表达式1-包含,2-不包含' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='人核规则分配条件表'
AUTO_INCREMENT=249

;

-- ----------------------------
-- Table structure for `t_audit_manual_condition_value`
-- ----------------------------
DROP TABLE IF EXISTS `t_audit_manual_condition_value`;
CREATE TABLE `t_audit_manual_condition_value` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`manual_condition_id`  int(4) NOT NULL COMMENT '条件id' ,
`condition_value`  int(4) NOT NULL COMMENT '条件值' ,
`condition_value_text`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '条件值文本' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='人核分配规则条件值表'
AUTO_INCREMENT=452

;

-- ----------------------------
-- Table structure for `t_audit_manual_deal`
-- ----------------------------
DROP TABLE IF EXISTS `t_audit_manual_deal`;
CREATE TABLE `t_audit_manual_deal` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`audit_id`  bigint(8) NOT NULL COMMENT '核保表id' ,
`deal_user_id`  int(4) NOT NULL COMMENT '处理人id' ,
`deal_user_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人名称' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_audit_id` (`audit_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='人核单处理人表'
AUTO_INCREMENT=9847

;

-- ----------------------------
-- Table structure for `t_audit_manual_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_audit_manual_log`;
CREATE TABLE `t_audit_manual_log` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`audit_id`  bigint(8) NOT NULL COMMENT '人核id' ,
`deal_user_id`  int(4) NOT NULL COMMENT '处理人id' ,
`deal_user_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人名称' ,
`deal_type`  int(4) NOT NULL COMMENT '日志类型' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_audit_id` (`audit_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='人核单操作表'
AUTO_INCREMENT=46274

;

-- ----------------------------
-- Table structure for `t_audit_manual_rule`
-- ----------------------------
DROP TABLE IF EXISTS `t_audit_manual_rule`;
CREATE TABLE `t_audit_manual_rule` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`execute_rule`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '执行规则，1-满足所有，2-满足任意' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识0-否，1-是' ,
`update_id`  int(4) NOT NULL COMMENT '更新人' ,
`create_id`  int(4) NOT NULL COMMENT '创建人' ,
`update_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人名称' ,
`create_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名称' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='人核分配规则表'
AUTO_INCREMENT=20

;

-- ----------------------------
-- Table structure for `t_audit_manual_rule_deal`
-- ----------------------------
DROP TABLE IF EXISTS `t_audit_manual_rule_deal`;
CREATE TABLE `t_audit_manual_rule_deal` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`manual_rule_id`  int(4) NOT NULL COMMENT '规则id' ,
`deal_user_id`  int(4) NOT NULL COMMENT '分配处理人' ,
`deal_user_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分配处理人名称' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='人核规则分配处理人表'
AUTO_INCREMENT=82

;

-- ----------------------------
-- Table structure for `t_audit_pass_temp`
-- ----------------------------
DROP TABLE IF EXISTS `t_audit_pass_temp`;
CREATE TABLE `t_audit_pass_temp` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`company_id`  int(11) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`product_id`  int(11) NULL DEFAULT 0 COMMENT '产品ID' ,
`trans_no`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '交易流水号:平安订单号' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`insurant_card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '被保人证件号码' ,
`audit_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '核保单号(留作核保撤销用)' ,
`cancel_status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已经撤销:0未撤销,1已经撤销' ,
`need_person_check`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否需要人核:0不需要人核,1需要' ,
`remark`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`uptime_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_card_number` (`insurant_card_number`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='核保通过临时记录表'
AUTO_INCREMENT=1438

;

-- ----------------------------
-- Table structure for `t_audit_questionnaire`
-- ----------------------------
DROP TABLE IF EXISTS `t_audit_questionnaire`;
CREATE TABLE `t_audit_questionnaire` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`audit_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '核保ID' ,
`answer`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '问卷答案' ,
`extend1`  int(4) NULL DEFAULT 0 COMMENT '问卷类型，0 单人人核，1 多被保人人核问卷' ,
`extend2`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展字段2' ,
`extend3`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展字段3' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`multi_audit_id`  bigint(20) NULL DEFAULT NULL COMMENT '多被保人人核id，问题件id' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='人工核保问卷数据表'
AUTO_INCREMENT=11563

;

-- ----------------------------
-- Table structure for `t_audit_signature`
-- ----------------------------
DROP TABLE IF EXISTS `t_audit_signature`;
CREATE TABLE `t_audit_signature` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`insure_num`  bigint(20) NOT NULL COMMENT '投保单号' ,
`product_id`  int(20) NULL DEFAULT NULL COMMENT '产品ID' ,
`product_plan_id`  int(20) NULL DEFAULT NULL COMMENT '计划ID' ,
`company_id`  int(11) NULL DEFAULT NULL COMMENT '公司ID' ,
`template_file_id`  bigint(20) NULL DEFAULT NULL COMMENT '模板文件ID' ,
`signature_image_id`  bigint(20) NULL DEFAULT NULL COMMENT '签名图片ID' ,
`signature_pdf_id`  bigint(20) NULL DEFAULT NULL COMMENT '签名pdf文件ID' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='核保签名表'
AUTO_INCREMENT=11

;

-- ----------------------------
-- Table structure for `t_audit_tag`
-- ----------------------------
DROP TABLE IF EXISTS `t_audit_tag`;
CREATE TABLE `t_audit_tag` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`audit_id`  bigint(8) UNSIGNED NOT NULL COMMENT '核保表id' ,
`tag_id`  int(4) UNSIGNED NOT NULL COMMENT '标签id' ,
`tag_reason_desc`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打标签描述' ,
`create_id`  int(4) NOT NULL COMMENT '打标签操作人id' ,
`create_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打标签操作人名称' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_audit_id` (`audit_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='核保标签表'
AUTO_INCREMENT=55

;

-- ----------------------------
-- Table structure for `t_audit_verify`
-- ----------------------------
DROP TABLE IF EXISTS `t_audit_verify`;
CREATE TABLE `t_audit_verify` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`insure_num`  bigint(20) UNSIGNED NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(4) NOT NULL COMMENT '平台，1hz 2ap 4web 3jm 7xb' ,
`passport_source`  tinyint(4) NOT NULL COMMENT '来源平台，1hz 2ap 3jm 7xb' ,
`health_id`  bigint(20) NOT NULL COMMENT '健告id' ,
`health_inform_status`  tinyint(4) NULL DEFAULT 0 COMMENT '健康告知结论(1通过 0不通过)' ,
`smart_audit_id`  bigint(20) NOT NULL COMMENT '绑定的智核id' ,
`insurant_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被保险人姓名,单被保人默认空串' ,
`card_type_id`  tinyint(1) NOT NULL COMMENT '证件类型ID，,单被保人默认0' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码,单被保人默认空串' ,
`deleted`  tinyint(4) NOT NULL COMMENT '删除标识，0未删除，1已删除' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_smart_audit_id` (`smart_audit_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='核保逻辑校验表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_bankwithholding_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_bankwithholding_log`;
CREATE TABLE `t_bankwithholding_log` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`parent_type`  tinyint(1) NULL DEFAULT 0 COMMENT '大类' ,
`small_type`  tinyint(1) NULL DEFAULT 0 COMMENT '小类' ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '日志内容' ,
`status`  tinyint(1) NULL DEFAULT 0 COMMENT '状态(代扣申请使用 0已申请 1申请成功)' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='代扣与小额验证日志表'
AUTO_INCREMENT=43932

;

-- ----------------------------
-- Table structure for `t_bi_insure_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_bi_insure_log`;
CREATE TABLE `t_bi_insure_log` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=46413

;

-- ----------------------------
-- Table structure for `t_blacklist`
-- ----------------------------
DROP TABLE IF EXISTS `t_blacklist`;
CREATE TABLE `t_blacklist` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '名称' ,
`card_type_id`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '生日日期' ,
`mobile`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号' ,
`insurance_type`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '险种' ,
`is_applicant`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否投保人' ,
`is_insurant`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否被保人' ,
`is_beneficiary`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否受益人' ,
`trigger_times`  int(4) NOT NULL DEFAULT 0 COMMENT '触发次数' ,
`relate_id`  int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联id' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`create_user`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '系统迁移' COMMENT '创建用户' ,
`update_time`  timestamp NULL DEFAULT NULL COMMENT '更新时间' ,
`update_user`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人' ,
PRIMARY KEY (`id`),
INDEX `name` (`name`) USING BTREE ,
INDEX `card_type_id` (`card_type_id`) USING BTREE ,
INDEX `card_number` (`card_number`) USING BTREE ,
INDEX `deleted` (`deleted`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='黑名单表'
AUTO_INCREMENT=1956

;

-- ----------------------------
-- Table structure for `t_blacklist_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_blacklist_info`;
CREATE TABLE `t_blacklist_info` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NULL DEFAULT NULL ,
`platform`  int(1) NOT NULL ,
`phone`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号' ,
`card_number`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号码' ,
`applicant_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`json`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求JSON串' ,
`res_code`  int(11) NOT NULL COMMENT '请求状态:200:成功,401:不一致，402：名字不合法，403：身份证号格式错误，300：无法验证' ,
`msg`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '响应消息' ,
`order_sign`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单签名' ,
`create_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_phone` (`phone`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=75

;

-- ----------------------------
-- Table structure for `t_buycount_common`
-- ----------------------------
DROP TABLE IF EXISTS `t_buycount_common`;
CREATE TABLE `t_buycount_common` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`group_id`  int(4) NOT NULL DEFAULT 0 COMMENT '分组ID' ,
`group_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组名称' ,
`plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '计划ID' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `group_id` (`group_id`) USING BTREE ,
INDEX `plan_id` (`plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=127

;

-- ----------------------------
-- Table structure for `t_category_common`
-- ----------------------------
DROP TABLE IF EXISTS `t_category_common`;
CREATE TABLE `t_category_common` (
`id`  int(4) NOT NULL AUTO_INCREMENT ,
`parent_category_id`  int(4) NOT NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`category_id`  int(4) NOT NULL DEFAULT 0 COMMENT '二级分类ID' ,
PRIMARY KEY (`id`),
INDEX `parent_category_id` (`parent_category_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品分类配置信息'
AUTO_INCREMENT=42

;

-- ----------------------------
-- Table structure for `t_change_reason`
-- ----------------------------
DROP TABLE IF EXISTS `t_change_reason`;
CREATE TABLE `t_change_reason` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`change_type`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '修改类型:0上传保单1修改资料' ,
`reason_type`  tinyint(2) NOT NULL COMMENT '修改原因枚举' ,
`remark`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注' ,
`oper_no`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作人工号' ,
`oper_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作人姓名' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insureNum` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='变更原因表'
AUTO_INCREMENT=5768

;

-- ----------------------------
-- Table structure for `t_cleanout_passport`
-- ----------------------------
DROP TABLE IF EXISTS `t_cleanout_passport`;
CREATE TABLE `t_cleanout_passport` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`passport_id`  bigint(8) NOT NULL COMMENT '账户ID' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_passport_id` (`passport_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='需要清洗数据的账号ID配置表'
AUTO_INCREMENT=2

;

-- ----------------------------
-- Table structure for `t_common_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `t_common_dictionary`;
CREATE TABLE `t_common_dictionary` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`config_key`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置项key' ,
`config_value`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置项值' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='字典表'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `t_company_insure`
-- ----------------------------
DROP TABLE IF EXISTS `t_company_insure`;
CREATE TABLE `t_company_insure` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`product_name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品名称' ,
`applicant_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '投保人姓名' ,
`company_insure_num`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '保险公司投保单号' ,
`apply_date`  datetime NOT NULL COMMENT '投保日期' ,
`prem`  decimal(18,0) NULL DEFAULT NULL COMMENT '保费' ,
`agent_id`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '经纪人员ID' ,
`agent_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '经纪人员姓名' ,
`card_number`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '投保人证件号' ,
`risk_code`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '保司险种编码' ,
`agent_com`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '中介网点代码' ,
`platform_channel`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '渠道ID' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
PRIMARY KEY (`id`),
INDEX `idx_company_insure_num` (`company_insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='保险公司订单（同步在保险公司产生的订单）'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_company_insure_insurant`
-- ----------------------------
DROP TABLE IF EXISTS `t_company_insure_insurant`;
CREATE TABLE `t_company_insure_insurant` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insurant_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '被保人姓名' ,
`card_number`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '被保人证件号' ,
`company_insure_num`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '保险公司投保单号' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`company_insure_id`  bigint(20) NOT NULL COMMENT '关联t_company_insure主键' ,
PRIMARY KEY (`id`),
INDEX `idx_company_insure_num` (`company_insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='保险公司订单被保人表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_data_center_statistic`
-- ----------------------------
DROP TABLE IF EXISTS `t_data_center_statistic`;
CREATE TABLE `t_data_center_statistic` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'pk' ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`skey`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名' ,
`svalue`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段值' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='数据中心统计字段表'
AUTO_INCREMENT=2251580

;

-- ----------------------------
-- Table structure for `t_dic_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_item`;
CREATE TABLE `t_dic_item` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'pk' ,
`dic_type_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典类型编码' ,
`dic_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字典编码' ,
`dic_value`  varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典值' ,
`dic_sort`  smallint(6) NOT NULL DEFAULT 0 COMMENT '序号' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_dic_type_code` (`dic_type_code`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='字典记录表'
AUTO_INCREMENT=589

;

-- ----------------------------
-- Table structure for `t_dic_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_type`;
CREATE TABLE `t_dic_type` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'pk' ,
`dic_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典类型编码' ,
`dic_value`  varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典类型名称' ,
`dic_remark`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注' ,
`dic_status`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态(0 有效)' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_dic_code` (`dic_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='字典类型表'
AUTO_INCREMENT=14

;

-- ----------------------------
-- Table structure for `t_economy_rate`
-- ----------------------------
DROP TABLE IF EXISTS `t_economy_rate`;
CREATE TABLE `t_economy_rate` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`trail_id`  int(11) UNSIGNED NULL DEFAULT 0 COMMENT '试算项自增id' ,
`trail_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '试算项名称' ,
`trail_type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '试算项类型(主险、附加险)' ,
`eco_premium`  int(4) NOT NULL COMMENT '保费(结算价)' ,
`eco_rate`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '经纪费' ,
`insurant_id`  bigint(8) NULL DEFAULT 0 COMMENT '被保人id' ,
`snap_ecocost_id`  int(8) NOT NULL DEFAULT 0 COMMENT '经济费快照ID' ,
`eco_type`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '经济费类型0固定1不固定2分项' ,
`cal_type`  tinyint(2) NOT NULL COMMENT '计算类型(1一致2不一致)' ,
`insurance_specie_id`  int(4) NULL DEFAULT 0 COMMENT '险种ID' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`, `insure_num`),
INDEX `idx_insureNum` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='经纪费费率表'
AUTO_INCREMENT=357160

;

-- ----------------------------
-- Table structure for `t_electronic_invoice`
-- ----------------------------
DROP TABLE IF EXISTS `t_electronic_invoice`;
CREATE TABLE `t_electronic_invoice` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`einvoice_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子帐单代码' ,
`invoice_no`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票编号' ,
`security_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全代码' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `deleted` (`deleted`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=57268

;

-- ----------------------------
-- Table structure for `t_ensure_project`
-- ----------------------------
DROP TABLE IF EXISTS `t_ensure_project`;
CREATE TABLE `t_ensure_project` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`project_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障项目名称' ,
`project_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障项目ID' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '逻辑分类ID' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`sum_insured`  double(20,2) NULL DEFAULT 0.00 COMMENT '保额' ,
`unit_text`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保额单位' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '保障开始时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '保障结束时间' ,
`insured_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保障内容说明' ,
`valid`  tinyint(1) NULL DEFAULT 1 COMMENT '高保额统计生效(1是 0否)' ,
`ptype`  tinyint(1) NULL DEFAULT 0 COMMENT '类型(0保障项目1试算因子)' ,
`insurance_specie_id`  int(4) NULL DEFAULT 0 COMMENT '险种ID' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insurant_id`  bigint(20) NULL DEFAULT NULL COMMENT '被保人ID' ,
PRIMARY KEY (`id`),
INDEX `start_date` (`start_date`) USING BTREE ,
INDEX `end_date` (`end_date`) USING BTREE ,
INDEX `project_id` (`project_id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `update_time_IDX` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=36585448

;

-- ----------------------------
-- Table structure for `t_ensure_project_price`
-- ----------------------------
DROP TABLE IF EXISTS `t_ensure_project_price`;
CREATE TABLE `t_ensure_project_price` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'pk' ,
`insure_num`  bigint(30) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`insurant_id`  bigint(8) NOT NULL COMMENT '被保人id' ,
`project_id`  int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '保障项目id' ,
`original_single_price`  int(4) NOT NULL DEFAULT 0 COMMENT '原价' ,
`settlement_price`  int(4) NOT NULL DEFAULT 0 COMMENT '结算价' ,
`price`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '原价保费' ,
`cost_price`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '成本保费' ,
`etype`  tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型(1:一致2:不一致)' ,
`project_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障项目名称' ,
`sum_insured`  double(20,2) NULL DEFAULT 0.00 COMMENT '保额' ,
`insured_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保障内容说明' ,
`unit_text`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保额单位' ,
`project_ename`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障项目英文名称' ,
`policy_company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障项承保公司' ,
`insurance_specie_id`  int(4) NULL DEFAULT 0 COMMENT '险种ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=24202446

;

-- ----------------------------
-- Table structure for `t_ensure_project_risk`
-- ----------------------------
DROP TABLE IF EXISTS `t_ensure_project_risk`;
CREATE TABLE `t_ensure_project_risk` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`project_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障项目名称' ,
`project_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障项目ID' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '逻辑分类ID' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`sum_insured`  double(20,2) NULL DEFAULT 0.00 COMMENT '保额' ,
`unit_text`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保额单位' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '保障开始时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '保障结束时间' ,
`insured_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保障内容说明' ,
`valid`  tinyint(1) NULL DEFAULT 1 COMMENT '高保额统计生效(1是 0否)' ,
`ptype`  tinyint(1) NULL DEFAULT 0 COMMENT '类型(0保障项目1试算因子)' ,
`insurance_specie_id`  int(4) NULL DEFAULT 0 COMMENT '险种ID' ,
`risk_coverage`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '风控保额' ,
`key_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试算项key' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insurant_id`  bigint(20) NULL DEFAULT NULL COMMENT '被保人ID' ,
`project_display`  int(11) NOT NULL DEFAULT 1 COMMENT '是否隐藏（1是0否）' ,
PRIMARY KEY (`id`, `insure_num`),
INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='保障项风控表'
AUTO_INCREMENT=67538284

;

-- ----------------------------
-- Table structure for `t_exception_follow_insure`
-- ----------------------------
DROP TABLE IF EXISTS `t_exception_follow_insure`;
CREATE TABLE `t_exception_follow_insure` (
`id`  int(4) NOT NULL AUTO_INCREMENT ,
`insure_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保单号' ,
`exception_type`  int(1) NOT NULL COMMENT '异常类型 1代表已支付未出单 2代表已出单未支付' ,
`processed_state`  int(1) NULL DEFAULT 0 COMMENT '处理结果 0代表未处理 1代表已处理' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_by`  varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新操作者' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '是否删除' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci
AUTO_INCREMENT=792053

;

-- ----------------------------
-- Table structure for `t_health_inform`
-- ----------------------------
DROP TABLE IF EXISTS `t_health_inform`;
CREATE TABLE `t_health_inform` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(20) NOT NULL DEFAULT 0 COMMENT '健告绑定投保单号，0未知，兼容以前的健告' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`health_inform_status`  tinyint(1) NULL DEFAULT '-1' COMMENT '健康告知结论(1通过 0不通过),-1未知，兼容以前的健告' ,
`answer`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '健康告知答案' ,
`deleted`  tinyint(1) NULL DEFAULT 0 ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`applicant_health_status`  tinyint(4) NULL DEFAULT '-1' COMMENT '投保人健康告知结论(1通过 0不通过),-1未知，兼容以前的健告' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='单人健告'
AUTO_INCREMENT=6472739

;

-- ----------------------------
-- Table structure for `t_health_inform_insurant`
-- ----------------------------
DROP TABLE IF EXISTS `t_health_inform_insurant`;
CREATE TABLE `t_health_inform_insurant` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`insurant_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`card_type_id`  tinyint(1) NULL DEFAULT NULL COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`health_inform_answer`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '健康告知' ,
`health_inform_status`  tinyint(1) NULL DEFAULT 0 COMMENT '健康告知结论(1通过 0不通过)' ,
`audit_id`  bigint(8) NULL DEFAULT 0 COMMENT '核保ID' ,
`audit_status`  tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '核保状态(1待核保 2通过 3失败)' ,
`smart_audit_result`  int(4) NULL DEFAULT 0 COMMENT '智核结果状态码' ,
`audit_problem_content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '核保问题内容' ,
`disease`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疾病' ,
`answers`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '智核的问答内容' ,
`appoint_describe`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '疾病的特别约定' ,
`audit_num`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保司的核保单号' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(4) NULL DEFAULT 0 COMMENT '删除标识（0：否，1：是）' ,
`personnel_type`  int(11) NULL DEFAULT 20 COMMENT '人员类型:10 投保人,20 被保人' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='多被保人健康告知记录表'
AUTO_INCREMENT=15224

;

-- ----------------------------
-- Table structure for `t_highsum_audit`
-- ----------------------------
DROP TABLE IF EXISTS `t_highsum_audit`;
CREATE TABLE `t_highsum_audit` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`audit_type`  tinyint(1) NULL DEFAULT 1 COMMENT '1高保额 2七天三单' ,
`audit_state`  tinyint(1) NULL DEFAULT 0 COMMENT '审核状态' ,
`submit_type`  tinyint(1) NULL DEFAULT 1 COMMENT '拦截类型 1系统提交 2用户提交' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`insurant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '被保险人ID' ,
`insurant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`insurant_card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '被保人证件类型ID' ,
`insurant_card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保人证件号码' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品所属险种二级分类ID' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单所属平台' ,
`is_show`  tinyint(1) NULL DEFAULT 1 COMMENT '投保单数据是否存在 0否 1是' ,
`user_id`  bigint(8) NULL DEFAULT 0 COMMENT '操作人ID' ,
`user_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人名称' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`max_limit`  double(20,2) NULL DEFAULT 0.00 COMMENT '最大限制数量' ,
`current_amount`  double(20,2) NULL DEFAULT 0.00 COMMENT '当前达到的量' ,
`risk_code`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '风险代码' ,
`risk_rule_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '风控规则名称' ,
PRIMARY KEY (`id`),
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='风控拦截审核数据表'
AUTO_INCREMENT=11622

;

-- ----------------------------
-- Table structure for `t_highsum_audit_file`
-- ----------------------------
DROP TABLE IF EXISTS `t_highsum_audit_file`;
CREATE TABLE `t_highsum_audit_file` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`file_id`  int(4) NULL DEFAULT 0 COMMENT '文件ID' ,
`file_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称' ,
`file_url`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件Url' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=182

;

-- ----------------------------
-- Table structure for `t_highsum_audit_insure`
-- ----------------------------
DROP TABLE IF EXISTS `t_highsum_audit_insure`;
CREATE TABLE `t_highsum_audit_insure` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(2) NULL DEFAULT 0 COMMENT '所属平台' ,
`audit_type`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '待审核类型1高保额 2七天三单' ,
`insurant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人名称' ,
`product_id`  int(4) NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司id' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`start_date`  datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保日期' ,
`end_date`  datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '终保日期' ,
`insure_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '投保时间' ,
`total_num`  int(11) NULL DEFAULT 0 COMMENT '购买份数' ,
`pay_status`  tinyint(2) NULL DEFAULT 0 COMMENT '支付状态' ,
`audit_insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '待审核的投保单号' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标示' ,
`pay_amount`  int(11) NULL DEFAULT 0 COMMENT '保费' ,
PRIMARY KEY (`id`),
INDEX `idx_audit_insure_num` (`audit_insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=44883

;

-- ----------------------------
-- Table structure for `t_highsum_audit_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_highsum_audit_log`;
CREATE TABLE `t_highsum_audit_log` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`log_content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '日志内容' ,
`user_id`  bigint(8) NULL DEFAULT 0 COMMENT '操作人ID(0指系统)' ,
`user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '操作人姓名' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=6890

;

-- ----------------------------
-- Table structure for `t_highsum_audit_project`
-- ----------------------------
DROP TABLE IF EXISTS `t_highsum_audit_project`;
CREATE TABLE `t_highsum_audit_project` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`audit_type`  tinyint(2) NULL DEFAULT 1 COMMENT '待审核类型1高保额 2七天三单' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '保障项目ID' ,
`project_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障项目名称' ,
`sum_insured`  double(20,2) NULL DEFAULT 0.00 COMMENT '保额' ,
`insured_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保障内容说明' ,
`audit_insure_num`  bigint(8) NULL DEFAULT 0 COMMENT '待审核的投保单号' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标示' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_audit_insure_num` (`audit_insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=76814

;

-- ----------------------------
-- Table structure for `t_highsum_common`
-- ----------------------------
DROP TABLE IF EXISTS `t_highsum_common`;
CREATE TABLE `t_highsum_common` (
`id`  int(4) NOT NULL AUTO_INCREMENT ,
`project_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障项目ID' ,
`project_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障项目名称' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `project_id` (`project_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=171

;

-- ----------------------------
-- Table structure for `t_highsum_whitelist`
-- ----------------------------
DROP TABLE IF EXISTS `t_highsum_whitelist`;
CREATE TABLE `t_highsum_whitelist` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '姓名' ,
`card_type_id`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '证件类型id' ,
`card_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '证件号码' ,
`type1_limit`  int(8) NOT NULL DEFAULT 0 COMMENT '险种分类1额度' ,
`type2_limit`  int(8) NOT NULL DEFAULT 0 COMMENT '险种分类2' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ,
`create_user`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人' ,
`update_time`  timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间' ,
`update_user`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新人' ,
PRIMARY KEY (`id`),
INDEX `INDEX_NAME` (`name`) USING BTREE ,
INDEX `INDEX_CARD_TYPE` (`card_type_id`) USING BTREE ,
INDEX `INDEX_CARD_NO` (`card_number`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=61

;

-- ----------------------------
-- Table structure for `t_holiday_date`
-- ----------------------------
DROP TABLE IF EXISTS `t_holiday_date`;
CREATE TABLE `t_holiday_date` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`holiday_date`  date NOT NULL COMMENT '节假日期' ,
`holiday_type`  tinyint(4) NOT NULL COMMENT '节假日类型' ,
`remark`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_holiday` (`holiday_date`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='节假日表'
AUTO_INCREMENT=943

;

-- ----------------------------
-- Table structure for `t_honeybee_blacklist`
-- ----------------------------
DROP TABLE IF EXISTS `t_honeybee_blacklist`;
CREATE TABLE `t_honeybee_blacklist` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`passport_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '账号ID' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '所属平台' ,
`email_num`  int(4) NULL DEFAULT NULL COMMENT '邮箱数量' ,
`email_detail_list`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '邮件地址详细内容' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_passport_id` (`passport_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='小蜜蜂针对用户账号的黑名单表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_honeybee_check`
-- ----------------------------
DROP TABLE IF EXISTS `t_honeybee_check`;
CREATE TABLE `t_honeybee_check` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人邮件地址' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`product_id`  int(4) NOT NULL COMMENT '产品ID' ,
`proeuct_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`card_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人证件号码' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_email` (`email`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='小蜜蜂投保人邮件地址校验记录表'
AUTO_INCREMENT=34

;

-- ----------------------------
-- Table structure for `t_insurant_card_type_tmp_2024`
-- ----------------------------
DROP TABLE IF EXISTS `t_insurant_card_type_tmp_2024`;
CREATE TABLE `t_insurant_card_type_tmp_2024` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`passport_source`  int(4) NULL DEFAULT 2 COMMENT '平台' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='被保人续保证件类型更新表'
AUTO_INCREMENT=11

;

-- ----------------------------
-- Table structure for `t_insurant_price`
-- ----------------------------
DROP TABLE IF EXISTS `t_insurant_price`;
CREATE TABLE `t_insurant_price` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`insurant_id`  bigint(8) NOT NULL COMMENT '被保人id' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`itype`  tinyint(1) NULL DEFAULT 0 COMMENT '0正常1暂存单' ,
`applicant_id`  bigint(8) NULL DEFAULT 0 COMMENT '投保人ID' ,
`retreat_status`  tinyint(1) NULL DEFAULT 0 COMMENT '退保状态(0未退保 2 退保中 3 已退保)' ,
`old_insurant_id`  bigint(8) NULL DEFAULT 0 COMMENT '被保人旧ID(重出使用)' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `insurant_id` (`insurant_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=5526021

;

-- ----------------------------
-- Table structure for `t_insurant_relation`
-- ----------------------------
DROP TABLE IF EXISTS `t_insurant_relation`;
CREATE TABLE `t_insurant_relation` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`insurant_id`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人ID' ,
`insurant_name`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称(多人以,分隔)' ,
`policy_company_num`  varchar(383) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL DEFAULT '0' COMMENT '保险公司保单号' ,
`real_startdate`  datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '保单实际生效时间' ,
`real_enddate`  datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '保单实际终止时间' ,
`insurance_specie_id`  int(4) NULL DEFAULT 0 COMMENT '险种ID' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
PRIMARY KEY (`id`),
INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `policy_company_num` (`policy_company_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=39813159

;

-- ----------------------------
-- Table structure for `t_insurant_restric_gene`
-- ----------------------------
DROP TABLE IF EXISTS `t_insurant_restric_gene`;
CREATE TABLE `t_insurant_restric_gene` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'pk' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`insurant_id`  bigint(8) NULL DEFAULT 0 COMMENT '被保人id' ,
`cal_type`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '计算类型(1一致2不一致)' ,
`gene_key`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束因子key，当约束因子为保额时，为费率表ID，否则为试算因子keyCode' ,
`gname`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束因子名称' ,
`gvalue`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '去掉单位后的值' ,
`unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '单位' ,
`display`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示' ,
`fullValue`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '带单位的文本' ,
`showUnit`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '显示单位' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='被保人试算因子表'
AUTO_INCREMENT=202886

;

-- ----------------------------
-- Table structure for `t_insurant_state_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_insurant_state_log`;
CREATE TABLE `t_insurant_state_log` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`insurant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '被保人ID' ,
`retreat_time`  datetime NULL DEFAULT NULL COMMENT '退保完成时间' ,
`remark1`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展1' ,
`remark2`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展2' ,
`remark3`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展3' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='被保人状态变更日志'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_insure_0`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_0`;
CREATE TABLE `t_insure_0` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保 (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人信息表'
AUTO_INCREMENT=8124943

;

-- ----------------------------
-- Table structure for `t_insure_1`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_1`;
CREATE TABLE `t_insure_1` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3149548

;

-- ----------------------------
-- Table structure for `t_insure_10`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_10`;
CREATE TABLE `t_insure_10` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=253608

;

-- ----------------------------
-- Table structure for `t_insure_11`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_11`;
CREATE TABLE `t_insure_11` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=248413

;

-- ----------------------------
-- Table structure for `t_insure_12`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_12`;
CREATE TABLE `t_insure_12` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=244219

;

-- ----------------------------
-- Table structure for `t_insure_13`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_13`;
CREATE TABLE `t_insure_13` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=241392

;

-- ----------------------------
-- Table structure for `t_insure_14`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_14`;
CREATE TABLE `t_insure_14` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=235901

;

-- ----------------------------
-- Table structure for `t_insure_15`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_15`;
CREATE TABLE `t_insure_15` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=232146

;

-- ----------------------------
-- Table structure for `t_insure_16`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_16`;
CREATE TABLE `t_insure_16` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=229647

;

-- ----------------------------
-- Table structure for `t_insure_17`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_17`;
CREATE TABLE `t_insure_17` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=227914

;

-- ----------------------------
-- Table structure for `t_insure_18`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_18`;
CREATE TABLE `t_insure_18` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=226413

;

-- ----------------------------
-- Table structure for `t_insure_19`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_19`;
CREATE TABLE `t_insure_19` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=226461

;

-- ----------------------------
-- Table structure for `t_insure_2`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_2`;
CREATE TABLE `t_insure_2` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=262934

;

-- ----------------------------
-- Table structure for `t_insure_20`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_20`;
CREATE TABLE `t_insure_20` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=227105

;

-- ----------------------------
-- Table structure for `t_insure_21`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_21`;
CREATE TABLE `t_insure_21` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=228569

;

-- ----------------------------
-- Table structure for `t_insure_22`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_22`;
CREATE TABLE `t_insure_22` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=231176

;

-- ----------------------------
-- Table structure for `t_insure_23`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_23`;
CREATE TABLE `t_insure_23` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=233968

;

-- ----------------------------
-- Table structure for `t_insure_24`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_24`;
CREATE TABLE `t_insure_24` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=237220

;

-- ----------------------------
-- Table structure for `t_insure_25`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_25`;
CREATE TABLE `t_insure_25` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=239905

;

-- ----------------------------
-- Table structure for `t_insure_26`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_26`;
CREATE TABLE `t_insure_26` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=242951

;

-- ----------------------------
-- Table structure for `t_insure_27`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_27`;
CREATE TABLE `t_insure_27` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=246685

;

-- ----------------------------
-- Table structure for `t_insure_28`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_28`;
CREATE TABLE `t_insure_28` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=250707

;

-- ----------------------------
-- Table structure for `t_insure_29`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_29`;
CREATE TABLE `t_insure_29` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=253930

;

-- ----------------------------
-- Table structure for `t_insure_3`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_3`;
CREATE TABLE `t_insure_3` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=265068

;

-- ----------------------------
-- Table structure for `t_insure_4`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_4`;
CREATE TABLE `t_insure_4` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=265950

;

-- ----------------------------
-- Table structure for `t_insure_5`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_5`;
CREATE TABLE `t_insure_5` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=266043

;

-- ----------------------------
-- Table structure for `t_insure_6`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_6`;
CREATE TABLE `t_insure_6` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=264997

;

-- ----------------------------
-- Table structure for `t_insure_7`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_7`;
CREATE TABLE `t_insure_7` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=263584

;

-- ----------------------------
-- Table structure for `t_insure_8`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_8`;
CREATE TABLE `t_insure_8` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=259874

;

-- ----------------------------
-- Table structure for `t_insure_9`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_9`;
CREATE TABLE `t_insure_9` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=256893

;

-- ----------------------------
-- Table structure for `t_insure_abnormal`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_abnormal`;
CREATE TABLE `t_insure_abnormal` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`abnormal_type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '异常类型' ,
`message`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常信息' ,
`oper_type`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '异常跟进状态(0未跟进  1已处理  2不需要跟进)' ,
`user_id`  bigint(8) NULL DEFAULT 0 COMMENT '异常跟进用户ID' ,
`user_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常信息跟进用户名称' ,
`oper_log`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常跟进日志记录' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`uptime_time`  timestamp NULL DEFAULT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `oper_type` (`oper_type`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='支付异常单'
AUTO_INCREMENT=819

;

-- ----------------------------
-- Table structure for `t_insure_account`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_account`;
CREATE TABLE `t_insure_account` (
`account_id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '账户ID' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`account_amount`  decimal(12,5) NOT NULL DEFAULT 0.00000 COMMENT '账户总金额' ,
`status`  tinyint(1) NULL DEFAULT NULL COMMENT '账户状态' ,
`product_id`  int(4) NULL DEFAULT NULL COMMENT '产品ID' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`account_id`),
UNIQUE INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='账户表'
AUTO_INCREMENT=154

;

-- ----------------------------
-- Table structure for `t_insure_adjust`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_adjust`;
CREATE TABLE `t_insure_adjust` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`adjust_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '批单号' ,
`adjust_status`  tinyint(1) NULL DEFAULT 0 COMMENT '批改状态(0待审核 1审核成功 2审核失败 3批改中  4批改成功 5批改失败)' ,
`apply_date`  datetime NULL DEFAULT NULL COMMENT '申请时间' ,
`complete_date`  datetime NULL DEFAULT NULL COMMENT '完成时间' ,
`effective_date`  datetime NULL DEFAULT NULL COMMENT '生效时间' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`apply_type`  tinyint(1) NULL DEFAULT 0 COMMENT '申请人类型(0客服 1客户)' ,
`apply_id`  bigint(8) NULL DEFAULT 0 COMMENT '申请人ID' ,
`apply_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人名称' ,
`adjust_type`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '批改类型(1投保人 2被保人 3受益人)' ,
`company_adjust_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司批单号' ,
`adjusts`  int(4) NULL DEFAULT 1 COMMENT '批改次数' ,
`adjust_file_id`  int(4) NULL DEFAULT 0 COMMENT '批单文件ID' ,
`adjust_file_url`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批单文件地址' ,
`reason`  tinyint(1) NULL DEFAULT 0 COMMENT '批改原因' ,
`remark`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注' ,
`extend1`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展1' ,
`extend2`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展2' ,
`extend3`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展3' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_adjust_num` (`adjust_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保单批改记录表'
AUTO_INCREMENT=1459

;

-- ----------------------------
-- Table structure for `t_insure_api_test`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_api_test`;
CREATE TABLE `t_insure_api_test` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'pk' ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2217774

;

-- ----------------------------
-- Table structure for `t_insure_applicant_0`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_0`;
CREATE TABLE `t_insure_applicant_0` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=6115

;

-- ----------------------------
-- Table structure for `t_insure_applicant_1`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_1`;
CREATE TABLE `t_insure_applicant_1` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=4516

;

-- ----------------------------
-- Table structure for `t_insure_applicant_10`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_10`;
CREATE TABLE `t_insure_applicant_10` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=5473

;

-- ----------------------------
-- Table structure for `t_insure_applicant_11`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_11`;
CREATE TABLE `t_insure_applicant_11` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=4768

;

-- ----------------------------
-- Table structure for `t_insure_applicant_12`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_12`;
CREATE TABLE `t_insure_applicant_12` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=9508

;

-- ----------------------------
-- Table structure for `t_insure_applicant_13`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_13`;
CREATE TABLE `t_insure_applicant_13` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=6484

;

-- ----------------------------
-- Table structure for `t_insure_applicant_14`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_14`;
CREATE TABLE `t_insure_applicant_14` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=6316

;

-- ----------------------------
-- Table structure for `t_insure_applicant_15`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_15`;
CREATE TABLE `t_insure_applicant_15` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=7985

;

-- ----------------------------
-- Table structure for `t_insure_applicant_16`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_16`;
CREATE TABLE `t_insure_applicant_16` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=4595

;

-- ----------------------------
-- Table structure for `t_insure_applicant_17`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_17`;
CREATE TABLE `t_insure_applicant_17` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=5854

;

-- ----------------------------
-- Table structure for `t_insure_applicant_18`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_18`;
CREATE TABLE `t_insure_applicant_18` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=5800

;

-- ----------------------------
-- Table structure for `t_insure_applicant_19`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_19`;
CREATE TABLE `t_insure_applicant_19` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=2974

;

-- ----------------------------
-- Table structure for `t_insure_applicant_2`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_2`;
CREATE TABLE `t_insure_applicant_2` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=6060

;

-- ----------------------------
-- Table structure for `t_insure_applicant_20`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_20`;
CREATE TABLE `t_insure_applicant_20` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=2794

;

-- ----------------------------
-- Table structure for `t_insure_applicant_21`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_21`;
CREATE TABLE `t_insure_applicant_21` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=3153

;

-- ----------------------------
-- Table structure for `t_insure_applicant_22`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_22`;
CREATE TABLE `t_insure_applicant_22` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=2297

;

-- ----------------------------
-- Table structure for `t_insure_applicant_23`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_23`;
CREATE TABLE `t_insure_applicant_23` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=3183

;

-- ----------------------------
-- Table structure for `t_insure_applicant_24`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_24`;
CREATE TABLE `t_insure_applicant_24` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=3207

;

-- ----------------------------
-- Table structure for `t_insure_applicant_25`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_25`;
CREATE TABLE `t_insure_applicant_25` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=3384

;

-- ----------------------------
-- Table structure for `t_insure_applicant_26`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_26`;
CREATE TABLE `t_insure_applicant_26` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=2427

;

-- ----------------------------
-- Table structure for `t_insure_applicant_27`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_27`;
CREATE TABLE `t_insure_applicant_27` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=4531

;

-- ----------------------------
-- Table structure for `t_insure_applicant_28`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_28`;
CREATE TABLE `t_insure_applicant_28` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=4119

;

-- ----------------------------
-- Table structure for `t_insure_applicant_29`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_29`;
CREATE TABLE `t_insure_applicant_29` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=4405

;

-- ----------------------------
-- Table structure for `t_insure_applicant_3`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_3`;
CREATE TABLE `t_insure_applicant_3` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=4692

;

-- ----------------------------
-- Table structure for `t_insure_applicant_4`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_4`;
CREATE TABLE `t_insure_applicant_4` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=8751

;

-- ----------------------------
-- Table structure for `t_insure_applicant_5`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_5`;
CREATE TABLE `t_insure_applicant_5` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=4665

;

-- ----------------------------
-- Table structure for `t_insure_applicant_6`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_6`;
CREATE TABLE `t_insure_applicant_6` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=7233

;

-- ----------------------------
-- Table structure for `t_insure_applicant_7`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_7`;
CREATE TABLE `t_insure_applicant_7` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=8701

;

-- ----------------------------
-- Table structure for `t_insure_applicant_8`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_8`;
CREATE TABLE `t_insure_applicant_8` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=9166

;

-- ----------------------------
-- Table structure for `t_insure_applicant_9`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_9`;
CREATE TABLE `t_insure_applicant_9` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人表'
AUTO_INCREMENT=8477

;

-- ----------------------------
-- Table structure for `t_insure_applicant_route`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_applicant_route`;
CREATE TABLE `t_insure_applicant_route` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`applicant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保人ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码密文' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_applicant_cname` (`applicant_cname`) USING BTREE ,
INDEX `idx_moblie` (`moblie`) USING BTREE ,
INDEX `idx_card_number` (`card_number`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保人路由表'
AUTO_INCREMENT=184964

;

-- ----------------------------
-- Table structure for `t_insure_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_attribute`;
CREATE TABLE `t_insure_attribute` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号码' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`type_id`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '属性归属类型(1:投保人2:被保险人3:受益人4:其他设置)' ,
`attr_key`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '属性标识' ,
`attr_value`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '属性值' ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`, `insure_num`),
INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `t_insure_attribute_attr_key_IDX` (`attr_key`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=176119801

;

-- ----------------------------
-- Table structure for `t_insure_attribute_snapshot`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_attribute_snapshot`;
CREATE TABLE `t_insure_attribute_snapshot` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号码' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`type_id`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '属性归属类型(1:投保人2:被保险人3:受益人4:其他设置)' ,
`attr_key`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '属性标识' ,
`attr_value`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '属性值' ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ,
`endorsement_num`  bigint(20) NULL DEFAULT 0 COMMENT '保全受理号' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_endorsement_num` (`endorsement_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='批改投保单动态属性快照表'
AUTO_INCREMENT=1138

;

-- ----------------------------
-- Table structure for `t_insure_audit`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_audit`;
CREATE TABLE `t_insure_audit` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`audit_way`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '核保方式(0：标准核保；1电话核保)' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`audit_problem_content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '核保问题内容' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`audit_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核保单号' ,
`valid_status`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '有效性状态 0为有效 1为已撤销 2为已过期' ,
`audit_owner`  int(4) NULL DEFAULT 2 COMMENT '智能核保方(1：慧择核保 2：保险公司核保）' ,
`material_audit_status`  tinyint(2) NULL DEFAULT NULL COMMENT '资料审核状态' ,
`passport_id`  bigint(20) NULL DEFAULT NULL COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`product_id`  int(11) NULL DEFAULT NULL COMMENT '产品ID' ,
`product_platform_id`  int(11) NULL DEFAULT NULL COMMENT '产品运营ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(11) NULL DEFAULT NULL COMMENT '计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品计划名称' ,
`plan_platform_id`  int(11) NULL DEFAULT NULL COMMENT '计划运营ID' ,
`company_id`  int(11) NULL DEFAULT NULL COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称' ,
`new_price_args`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试算信息' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`create_id`  int(11) NULL DEFAULT NULL COMMENT '创建人' ,
`update_id`  int(11) NULL DEFAULT NULL COMMENT '更新人' ,
`disease_desc`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疾病描述' ,
`coverage`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保额' ,
`audit_result_reason`  tinyint(1) NULL DEFAULT NULL COMMENT '核保结果二级类型' ,
`audit_effective_day`  int(4) NULL DEFAULT NULL COMMENT '核保有效期' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
PRIMARY KEY (`id`),
INDEX `insure_num` (`insure_num`, `audit_way`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_create_audit_way` (`create_time`, `audit_way`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=5232016

;

-- ----------------------------
-- Table structure for `t_insure_audit_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_audit_log`;
CREATE TABLE `t_insure_audit_log` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`audit_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '核保记录id' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`log_content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '日志内容' ,
`user_id`  bigint(8) NULL DEFAULT 0 COMMENT '操作人ID(0指系统)' ,
`user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人姓名' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`, `audit_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=98811

;

-- ----------------------------
-- Table structure for `t_insure_audit_verify`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_audit_verify`;
CREATE TABLE `t_insure_audit_verify` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`insure_num`  bigint(20) UNSIGNED NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(4) NOT NULL COMMENT '平台，1hz 2ap 4web 3jm 7xb' ,
`passport_source`  tinyint(4) NOT NULL COMMENT '来源平台，1hz 2ap 3jm 7xb' ,
`health_id`  bigint(20) NOT NULL COMMENT '健告id，需要区分是否为多被保人还是单被保人,不存在为0' ,
`health_inform_status`  tinyint(4) NOT NULL COMMENT '健康告知结论(1通过 0不通过) -1未知' ,
`smart_audit_id`  bigint(20) NOT NULL COMMENT '绑定的智核id,不存在为0' ,
`manual_audit_id`  bigint(20) NOT NULL COMMENT '绑定的人核id,不存在为0' ,
`insurant_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被保险人姓名,单被保人默认空串' ,
`card_type_id`  tinyint(4) NOT NULL COMMENT '证件类型ID，,单被保人默认0' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码,单被保人默认空串' ,
`deleted`  tinyint(4) NOT NULL COMMENT '删除标识，0未删除，1已删除' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`personnel_type`  int(11) NULL DEFAULT 20 COMMENT '人员类型:10 投保人,20 被保人' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='核保逻辑校验表'
AUTO_INCREMENT=167873

;

-- ----------------------------
-- Table structure for `t_insure_beneficiary`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_beneficiary`;
CREATE TABLE `t_insure_beneficiary` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL ,
`insure_num`  bigint(20) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '受益人姓名' ,
`ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区名称' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`prov_city_id`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`residential_identity`  tinyint(1) NULL DEFAULT NULL COMMENT '税收居民身份: 1 仅为中国税收居民、2 仅为非居民、3 既是中国税收居民又是其他国家（地区）' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`insurant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '被保险人ID' ,
`insurant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '受益人与被保险人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '受益人与被保险人关系ID' ,
`serial`  tinyint(1) NULL DEFAULT 0 COMMENT '受益序例' ,
`proportion`  int(4) NULL DEFAULT 0 COMMENT '受益比例' ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`insurance_specie_id`  int(4) NULL DEFAULT 0 COMMENT '险种ID' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`auto_id`),
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=74121

;

-- ----------------------------
-- Table structure for `t_insure_beneficiary_snapshot`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_beneficiary_snapshot`;
CREATE TABLE `t_insure_beneficiary_snapshot` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '受益人姓名' ,
`ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区名称' ,
`street_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-街道/乡镇' ,
`street_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-街道' ,
`community_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-社区' ,
`community_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-社区' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`prov_city_id`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`residential_identity`  tinyint(1) NULL DEFAULT NULL COMMENT '税收居民身份: 1 仅为中国税收居民、2 仅为非居民、3 既是中国税收居民又是其他国家（地区）' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`insurant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '被保险人ID' ,
`insurant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '受益人与被保险人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '受益人与被保险人关系ID' ,
`serial`  tinyint(1) NULL DEFAULT 0 COMMENT '受益序例' ,
`proportion`  int(4) NULL DEFAULT 0 COMMENT '受益比例' ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`insurance_specie_id`  int(4) NULL DEFAULT 0 COMMENT '险种ID' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  datetime NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`endorsement_num`  bigint(20) NULL DEFAULT 0 COMMENT '保全受理号' ,
PRIMARY KEY (`auto_id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_endorsement_num` (`endorsement_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='批改受益人快照表'
AUTO_INCREMENT=44

;

-- ----------------------------
-- Table structure for `t_insure_endorsement`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_endorsement`;
CREATE TABLE `t_insure_endorsement` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '业务平台' ,
`endorsement_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '保全受理号' ,
`company_endor_no`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保司批单号' ,
`endorsement_name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保全项名称' ,
`policy_no`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保司保单号' ,
`effective_time`  datetime NULL DEFAULT NULL COMMENT '保全生效日期' ,
`insure_origin`  tinyint(1) NOT NULL COMMENT '单子来源 1 API投保，2 录单' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`exe_status`  tinyint(4) NOT NULL DEFAULT 0 COMMENT 'IS处理批改状态 0 未处理，1 处理失败，2 处理成功' ,
`detail_log`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'IS批改字段日志' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识 0 未删除，1-已删除' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_endorsement_num` (`endorsement_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='批改记录表'
AUTO_INCREMENT=351

;

-- ----------------------------
-- Table structure for `t_insure_endorsement_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_endorsement_config`;
CREATE TABLE `t_insure_endorsement_config` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`endorsement_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保全项名称' ,
`block_level`  tinyint(2) NOT NULL COMMENT '保全批改维度' ,
`block_level_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保全批改维度名称' ,
`field_key`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保全批改属性key' ,
`field_key_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保全批改属性key名称' ,
`module_id`  tinyint(2) NOT NULL COMMENT 'IS投保属性模块' ,
`module_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'IS投保属性模块名称' ,
`attribute_key`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'IS投保属性key' ,
`attribute_key_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'IS投保属性key名称' ,
`table_flag`  tinyint(2) NOT NULL DEFAULT 0 COMMENT 'IS投保属性key位置，0 正表，1 动态属性表' ,
`insure_origin`  tinyint(1) NULL DEFAULT 0 COMMENT '配置对应的投保单来源,默认0 通用，1 API投保，2 录单' ,
`desc_method_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联描述字段赋值方法' ,
`extend_handler`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展处理类' ,
`extend_param`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展配置' ,
`update_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建或者更新人姓名' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识 0 未删除，1-已删除' ,
`create_time`  datetime NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='批改配置表'
AUTO_INCREMENT=58

;

-- ----------------------------
-- Table structure for `t_insure_fee_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_fee_detail`;
CREATE TABLE `t_insure_fee_detail` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID自增' ,
`insure_num`  bigint(30) UNSIGNED NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`fee_type`  tinyint(1) UNSIGNED NOT NULL COMMENT '加费类型（0-智核加费,1-人核加费）' ,
`add_fee_premium`  int(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '加费金额' ,
`insurance_specie_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '险种编码' ,
`create_time`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保单加费明细'
AUTO_INCREMENT=2028

;

-- ----------------------------
-- Table structure for `t_insure_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_feedback`;
CREATE TABLE `t_insure_feedback` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`platform`  tinyint(4) NOT NULL COMMENT '平台' ,
`insure_num`  bigint(20) NOT NULL COMMENT '投保单号' ,
`company_id`  int(11) NOT NULL COMMENT '保险公司ID' ,
`asq_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问卷ID' ,
`asq_answer`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '问卷答案' ,
`asq_result`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '校验结果' ,
`send`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已发送对接 (0:否 1:是)' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保单回访表'
AUTO_INCREMENT=1336

;

-- ----------------------------
-- Table structure for `t_insure_file`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_file`;
CREATE TABLE `t_insure_file` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`insure_num`  bigint(8) UNSIGNED NOT NULL COMMENT '投保单号' ,
`business_id`  bigint(8) UNSIGNED NULL DEFAULT 0 COMMENT '业务ID' ,
`file_id`  int(8) UNSIGNED NOT NULL COMMENT '文件ID' ,
`file_name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称' ,
`file_url`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件URL' ,
`insured_category`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '投保人类型：（0：其他，1：投保人，2：被保险人，3:受益人，4:代理人）' ,
`process_node`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '流程节点（默认0:其他，1:核保前，2:核对订单，3:修改支付信息，4:问题件，5:回执回销）' ,
`offline_file_type`  tinyint(2) UNSIGNED NOT NULL COMMENT '文件类型（0:其他，1:证件，2:银行卡，3:签名，4:病例资料，5:体检报告，6:其他健康告知资料，7:回执回销附件）' ,
`card_type`  tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '证件类型 依照PS配置证件类型' ,
`card_classify`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '证件分类（默认0:其他，身份证:1,国徽面，2：人像面，银行卡：1:卡号面，2:磁条面）' ,
`deleted`  tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '删除标识（0：否，1：是）' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='互联网保单文件表'
AUTO_INCREMENT=132

;

-- ----------------------------
-- Table structure for `t_insure_info_audit`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_info_audit`;
CREATE TABLE `t_insure_info_audit` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`insure_audit_id`  bigint(10) NOT NULL COMMENT '投保单核保ID' ,
`file_item_id`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资料项ID' ,
`audit_status`  tinyint(4) NULL DEFAULT NULL COMMENT '审核状态' ,
`audit_opinion`  varchar(1200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见' ,
`create_user_id`  int(11) NULL DEFAULT 0 COMMENT '创建人' ,
`create_user_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名称' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`audit_time`  timestamp NULL DEFAULT NULL COMMENT '审核时间' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`business_type`  tinyint(4) NULL DEFAULT 0 COMMENT '资料类型，0 无，1、初始资料，2、问题件资料' ,
`multi_audit_id`  bigint(20) NULL DEFAULT NULL COMMENT '多被保人人核id' ,
`manual_issue_id`  bigint(20) NULL DEFAULT NULL COMMENT '人核问题件id' ,
PRIMARY KEY (`id`),
INDEX `idx_info_audit` (`insure_audit_id`, `file_item_id`) USING BTREE ,
INDEX `idx_multi_audit` (`multi_audit_id`, `file_item_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='资料审核表'
AUTO_INCREMENT=16179

;

-- ----------------------------
-- Table structure for `t_insure_insurance_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurance_attribute`;
CREATE TABLE `t_insure_insurance_attribute` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`insurance_relation_id`  bigint(20) NOT NULL COMMENT '险种记录id' ,
`insure_num`  bigint(20) NOT NULL COMMENT '投保单号' ,
`passport_source`  tinyint(4) NOT NULL COMMENT '来源平台' ,
`attr_key`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '动态属性key' ,
`attr_value`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '动态属性值' ,
`deleted`  tinyint(4) NOT NULL COMMENT '删除标记' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保号与险种关系表'
AUTO_INCREMENT=64394

;

-- ----------------------------
-- Table structure for `t_insure_insurance_audit_result`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurance_audit_result`;
CREATE TABLE `t_insure_insurance_audit_result` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`insurance_relation_id`  bigint(8) NOT NULL COMMENT '险种关联表ID' ,
`insurance_specie_id`  int(4) NOT NULL COMMENT '险种ID' ,
`insurance_specie_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '险种名称' ,
`insurance_specie_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '险种编码' ,
`original_price`  bigint(20) NULL DEFAULT 0 COMMENT '原价' ,
`settlement_price`  bigint(20) NULL DEFAULT 0 COMMENT '结算价,核保结论下发后确定的价格' ,
`audit_conclusion`  tinyint(4) NULL DEFAULT NULL COMMENT '核保结论' ,
`audit_opinion`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核保意见' ,
`extra_content`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核保补充说明' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否已删除' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='险种核保结论表'
AUTO_INCREMENT=728

;

-- ----------------------------
-- Table structure for `t_insure_insurance_relation`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurance_relation`;
CREATE TABLE `t_insure_insurance_relation` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`insurance_specie_id`  int(4) NOT NULL COMMENT '险种ID' ,
`insurance_specie_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '险种名称' ,
`insurance_specie_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '险种编码' ,
`original_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`underwriting_age`  tinyint(4) NULL DEFAULT NULL COMMENT '承保年龄' ,
`insurance_specie_state`  tinyint(4) NULL DEFAULT NULL COMMENT '险种状态1-有效,2-中止,3-终止,4-未生效,99-其他' ,
`extend1`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展字段1' ,
`extend2`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展字段2' ,
`extend3`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展字段3' ,
`main_insurance_id`  int(4) NOT NULL DEFAULT 0 COMMENT '主险ID' ,
`main_flag`  tinyint(4) NULL DEFAULT NULL COMMENT '险种类型0: 附加险，1: 主险' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`payment_type`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缴费类型' ,
`payment_term`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缴费年限' ,
`payment_year`  smallint(6) NULL DEFAULT NULL COMMENT '缴费年数' ,
`deadline`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障期限' ,
`insurant_id`  bigint(20) NOT NULL DEFAULT 0 COMMENT '被保险人ID' ,
`payment_term_unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '缴费年限单位' ,
`payment_term_unified_unit`  tinyint(4) NULL DEFAULT NULL COMMENT '缴费年限单位统一单位，payment_term_unit的转换值' ,
`payment_term_num`  int(11) NOT NULL DEFAULT 0 COMMENT '缴费年限数值' ,
`deadline_unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '保障期限单位' ,
`deadline_unified_unit`  tinyint(4) NULL DEFAULT NULL COMMENT '保障期限统一单位，deadlineUnit的转换值' ,
`deadline_num`  int(11) NOT NULL DEFAULT 0 COMMENT '保障期限数值' ,
`deadline_year`  smallint(6) NULL DEFAULT NULL COMMENT '保障年数' ,
`insure_flag`  tinyint(4) NULL DEFAULT 1 COMMENT '是否投保该险种标识，0不投保,1投保(默认值)' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_insurance_specie_id` (`insurance_specie_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保号与险种关系表'
AUTO_INCREMENT=79041

;

-- ----------------------------
-- Table structure for `t_insure_insurance_relation_10_30_bak`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurance_relation_10_30_bak`;
CREATE TABLE `t_insure_insurance_relation_10_30_bak` (
`id`  bigint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '自增ID' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`insurance_specie_id`  int(4) NOT NULL COMMENT '险种ID' ,
`insurance_specie_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '险种名称' ,
`insurance_specie_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '险种编码' ,
`original_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`underwriting_age`  tinyint(4) NULL DEFAULT NULL COMMENT '承保年龄' ,
`insurance_specie_state`  tinyint(4) NULL DEFAULT NULL COMMENT '险种状态1-有效,2-中止,3-终止,4-未生效,99-其他' ,
`extend1`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展字段1' ,
`extend2`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展字段2' ,
`extend3`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展字段3' ,
`main_insurance_id`  int(4) NOT NULL DEFAULT 0 COMMENT '主险ID' ,
`main_flag`  tinyint(4) NULL DEFAULT NULL COMMENT '险种类型0: 附加险，1: 主险' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`payment_type`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缴费类型' ,
`payment_term`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缴费年限' ,
`payment_year`  smallint(6) NULL DEFAULT NULL COMMENT '缴费年数' ,
`deadline`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障期限' ,
`insurant_id`  bigint(20) NOT NULL DEFAULT 0 COMMENT '被保险人ID' ,
`payment_term_unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '缴费年限单位' ,
`payment_term_unified_unit`  tinyint(4) NULL DEFAULT NULL COMMENT '缴费年限单位统一单位，payment_term_unit的转换值' ,
`payment_term_num`  int(11) NOT NULL DEFAULT 0 COMMENT '缴费年限数值' ,
`deadline_unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '保障期限单位' ,
`deadline_unified_unit`  tinyint(4) NULL DEFAULT NULL COMMENT '保障期限统一单位，deadlineUnit的转换值' ,
`deadline_num`  int(11) NOT NULL DEFAULT 0 COMMENT '保障期限数值' ,
`deadline_year`  smallint(6) NULL DEFAULT NULL COMMENT '保障年数' 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `t_insure_insurant_0`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_0`;
CREATE TABLE `t_insure_insurant_0` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1031378

;

-- ----------------------------
-- Table structure for `t_insure_insurant_1`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_1`;
CREATE TABLE `t_insure_insurant_1` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2978898

;

-- ----------------------------
-- Table structure for `t_insure_insurant_10`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_10`;
CREATE TABLE `t_insure_insurant_10` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=879878

;

-- ----------------------------
-- Table structure for `t_insure_insurant_11`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_11`;
CREATE TABLE `t_insure_insurant_11` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2964869

;

-- ----------------------------
-- Table structure for `t_insure_insurant_12`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_12`;
CREATE TABLE `t_insure_insurant_12` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=856666

;

-- ----------------------------
-- Table structure for `t_insure_insurant_13`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_13`;
CREATE TABLE `t_insure_insurant_13` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=855261

;

-- ----------------------------
-- Table structure for `t_insure_insurant_14`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_14`;
CREATE TABLE `t_insure_insurant_14` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=859329

;

-- ----------------------------
-- Table structure for `t_insure_insurant_15`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_15`;
CREATE TABLE `t_insure_insurant_15` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=869429

;

-- ----------------------------
-- Table structure for `t_insure_insurant_16`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_16`;
CREATE TABLE `t_insure_insurant_16` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=877997

;

-- ----------------------------
-- Table structure for `t_insure_insurant_17`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_17`;
CREATE TABLE `t_insure_insurant_17` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=902173

;

-- ----------------------------
-- Table structure for `t_insure_insurant_18`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_18`;
CREATE TABLE `t_insure_insurant_18` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=911337

;

-- ----------------------------
-- Table structure for `t_insure_insurant_19`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_19`;
CREATE TABLE `t_insure_insurant_19` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=937106

;

-- ----------------------------
-- Table structure for `t_insure_insurant_2`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_2`;
CREATE TABLE `t_insure_insurant_2` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=976804

;

-- ----------------------------
-- Table structure for `t_insure_insurant_20`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_20`;
CREATE TABLE `t_insure_insurant_20` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=977303

;

-- ----------------------------
-- Table structure for `t_insure_insurant_21`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_21`;
CREATE TABLE `t_insure_insurant_21` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=973389

;

-- ----------------------------
-- Table structure for `t_insure_insurant_22`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_22`;
CREATE TABLE `t_insure_insurant_22` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1002420

;

-- ----------------------------
-- Table structure for `t_insure_insurant_23`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_23`;
CREATE TABLE `t_insure_insurant_23` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1021450

;

-- ----------------------------
-- Table structure for `t_insure_insurant_24`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_24`;
CREATE TABLE `t_insure_insurant_24` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1038579

;

-- ----------------------------
-- Table structure for `t_insure_insurant_25`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_25`;
CREATE TABLE `t_insure_insurant_25` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1048695

;

-- ----------------------------
-- Table structure for `t_insure_insurant_26`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_26`;
CREATE TABLE `t_insure_insurant_26` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=89181761

;

-- ----------------------------
-- Table structure for `t_insure_insurant_27`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_27`;
CREATE TABLE `t_insure_insurant_27` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1052306

;

-- ----------------------------
-- Table structure for `t_insure_insurant_28`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_28`;
CREATE TABLE `t_insure_insurant_28` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1053764

;

-- ----------------------------
-- Table structure for `t_insure_insurant_29`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_29`;
CREATE TABLE `t_insure_insurant_29` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1044831

;

-- ----------------------------
-- Table structure for `t_insure_insurant_3`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_3`;
CREATE TABLE `t_insure_insurant_3` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=965784

;

-- ----------------------------
-- Table structure for `t_insure_insurant_4`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_4`;
CREATE TABLE `t_insure_insurant_4` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=948795

;

-- ----------------------------
-- Table structure for `t_insure_insurant_5`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_5`;
CREATE TABLE `t_insure_insurant_5` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=940369

;

-- ----------------------------
-- Table structure for `t_insure_insurant_6`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_6`;
CREATE TABLE `t_insure_insurant_6` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=921110

;

-- ----------------------------
-- Table structure for `t_insure_insurant_7`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_7`;
CREATE TABLE `t_insure_insurant_7` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=913132

;

-- ----------------------------
-- Table structure for `t_insure_insurant_8`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_8`;
CREATE TABLE `t_insure_insurant_8` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=882092

;

-- ----------------------------
-- Table structure for `t_insure_insurant_9`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_9`;
CREATE TABLE `t_insure_insurant_9` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=875403

;

-- ----------------------------
-- Table structure for `t_insure_insurant_expand`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_expand`;
CREATE TABLE `t_insure_insurant_expand` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'pk' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`insurant_id`  bigint(8) NOT NULL COMMENT '被保人id' ,
`t_type`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段类型' ,
`t_value`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字段值' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_t_type` (`t_type`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='被保人属性扩展表'
AUTO_INCREMENT=3751477

;

-- ----------------------------
-- Table structure for `t_insure_insurant_risk`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_risk`;
CREATE TABLE `t_insure_insurant_risk` (
`auto_id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`auto_id`),
INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `cname` (`cname`) USING BTREE ,
INDEX `card_type_id` (`card_type_id`) USING BTREE ,
INDEX `card_number` (`card_number`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='被保人表'
AUTO_INCREMENT=7715901

;

-- ----------------------------
-- Table structure for `t_insure_insurant_route`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_route`;
CREATE TABLE `t_insure_insurant_route` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(383) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '保险公司保单号' ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
PRIMARY KEY (`auto_id`, `insure_num`),
INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `cname` (`cname`) USING BTREE ,
INDEX `card_number` (`card_number`) USING BTREE ,
INDEX `card_type_id` (`card_type_id`) USING BTREE ,
INDEX `create_time` (`create_time`) USING BTREE ,
INDEX `policy_company_num` (`policy_company_num`) USING BTREE ,
INDEX `idx_id` (`id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_mobile` (`moblie`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=89343193

;

-- ----------------------------
-- Table structure for `t_insure_insurant_route_id_del`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_route_id_del`;
CREATE TABLE `t_insure_insurant_route_id_del` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号码' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=14531889708938039

;

-- ----------------------------
-- Table structure for `t_insure_insurant_route_id_update`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_route_id_update`;
CREATE TABLE `t_insure_insurant_route_id_update` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号码' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1548323202475

;

-- ----------------------------
-- Table structure for `t_insure_insurant_route_snapshot`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_insurant_route_snapshot`;
CREATE TABLE `t_insure_insurant_route_snapshot` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`street_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-街道/乡镇' ,
`street_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-街道' ,
`community_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-社区' ,
`community_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-社区' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(383) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '保险公司保单号' ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识' ,
`create_time`  datetime NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`beneficiary_type`  tinyint(4) NULL DEFAULT 1 COMMENT '受益人类型 1 法定， 2指定' ,
`endorsement_num`  bigint(20) NULL DEFAULT 0 COMMENT '保全受理号' ,
PRIMARY KEY (`auto_id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_id` (`id`) USING BTREE ,
INDEX `idx_endorsement_num` (`endorsement_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='批改被保人快照表'
AUTO_INCREMENT=385

;

-- ----------------------------
-- Table structure for `t_insure_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_log`;
CREATE TABLE `t_insure_log` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`product_id`  int(4) NULL DEFAULT 0 COMMENT '产品ID' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`start_date`  datetime NULL DEFAULT NULL COMMENT '起保时间' ,
`end_date`  datetime NULL DEFAULT NULL COMMENT '截止时间' ,
`detail_info`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '投保单详细内容(json)' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=232141

;

-- ----------------------------
-- Table structure for `t_insure_relay`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_relay`;
CREATE TABLE `t_insure_relay` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`policy_num`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保单号' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '保障计划名称' ,
`insure_insurant_cname`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人名称' ,
`insure_insurant_card_num`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人证件号' ,
`insure_insurant_card_type`  int(11) NULL DEFAULT NULL COMMENT '被保险人证件号类型' ,
`claim`  int(11) NOT NULL DEFAULT 0 COMMENT '是否已理赔' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '保险公司名称' ,
`policy_files`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '保单文件json格式' ,
`branch_id`  int(4) NULL DEFAULT 0 COMMENT '分支机构ID' ,
`branch_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分支机构名称' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上年度保险止期' ,
`unwait_start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '免等待生效日期开始日期' ,
`unwait_end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '免等待生效日期结束日期' ,
`relay_status`  int(11) NOT NULL DEFAULT 0 COMMENT '接力状态，默认0待接力，1成功。2失败' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_insure_insurant_card_num` (`insure_insurant_card_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='订单接力转保记录'
AUTO_INCREMENT=4073

;

-- ----------------------------
-- Table structure for `t_insure_renewal`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_renewal`;
CREATE TABLE `t_insure_renewal` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`renewal_insure_num`  bigint(30) NOT NULL COMMENT '续保原投保单号' ,
`origin_insure_num`  bigint(30) NOT NULL COMMENT '原始投保单号' ,
`renewal_count`  int(5) NOT NULL DEFAULT 0 COMMENT '续保次数' ,
`renewal_type`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '0原始单1续保单' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_renewal_insure_num` (`renewal_insure_num`) USING BTREE ,
INDEX `idx_origin_insure_num` (`origin_insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=24012

;

-- ----------------------------
-- Table structure for `t_insure_risk_cancel_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_risk_cancel_log`;
CREATE TABLE `t_insure_risk_cancel_log` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`risk_insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '关联风险保额投保单号' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '被保人姓名' ,
`card_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '被保人证件号码' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '平台' ,
`canceled`  tinyint(1) NULL DEFAULT 0 COMMENT '是否已撤销1:是/0:否' ,
`cancel_time`  timestamp NULL DEFAULT NULL COMMENT '撤销时间' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`remark`  varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '备注' ,
PRIMARY KEY (`id`),
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='风险保额撤销记录'
AUTO_INCREMENT=5379

;

-- ----------------------------
-- Table structure for `t_insure_route`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_route`;
CREATE TABLE `t_insure_route` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源 1: 慧择；2：齐欣；3：聚米；7：携保；9：森昊' ,
`passport_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态 0-未支付，1-已支付，2-不能支付，6-支付中，7-支付失败' ,
`issue_status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '出单状态 0-未出单，1-已出单，2-延时出单，3-取消出单，4-出单失败' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态 0 -未生效，1 - 已生效，2 -退保中，3 -已退保' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`insure_way_type`  int(11) NOT NULL DEFAULT 0 COMMENT '0普通投保单1预约单' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `order_num` (`order_num`) USING BTREE ,
INDEX `	idx_applicant_cname` (`applicant_cname`) USING BTREE ,
INDEX `idx_moblie` (`moblie`) USING BTREE ,
INDEX `idx_card_number` (`card_number`) USING BTREE ,
INDEX `idx_product_name` (`product_name`) USING BTREE ,
INDEX `idx_urgency_contact` (`urgency_contact`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_payed_time` (`payed_time`) USING BTREE ,
INDEX `idx_passport_id_group` (`passport_id`, `create_time`, `payed_time`) USING BTREE ,
INDEX `idx_passport_name` (`passport_name`) USING BTREE ,
INDEX `idx_company_name` (`company_name`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=102581673

;

-- ----------------------------
-- Table structure for `t_insure_route_outside`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_route_outside`;
CREATE TABLE `t_insure_route_outside` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文/拼音' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '受益人名称' ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`insure_way_type`  int(11) NOT NULL DEFAULT 0 COMMENT '0普通投保单1预约单' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `applicant_cname` (`applicant_cname`) USING BTREE ,
INDEX `card_number` (`card_number`) USING BTREE ,
INDEX `payed_time` (`payed_time`) USING BTREE ,
INDEX `start_date_group` (`start_date`, `end_date`) USING BTREE ,
INDEX `product_id_group` (`product_id`, `start_date`, `end_date`) USING BTREE ,
INDEX `plan_id_group` (`product_plan_id`, `start_date`, `end_date`) USING BTREE ,
INDEX `idx_broker_company_code` (`broker_company_code`) USING BTREE ,
INDEX `idx_broker_company_job_number` (`broker_company_job_number`) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=102578641

;

-- ----------------------------
-- Table structure for `t_insure_route_snapshot`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_route_snapshot`;
CREATE TABLE `t_insure_route_snapshot` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`street_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-街道/乡镇' ,
`street_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-街道' ,
`community_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-社区' ,
`community_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-社区' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  datetime NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司工号(代理人)' ,
`insurance_company_job_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保司工号(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'HZ' COMMENT '所属经纪公司编码' ,
`insure_way_type`  int(11) NULL DEFAULT 0 COMMENT '0普通投保单1预约单' ,
`endorsement_num`  bigint(20) NULL DEFAULT 0 COMMENT '保全受理号' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_endorsement_num` (`endorsement_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='批改投保单快照表'
AUTO_INCREMENT=310

;

-- ----------------------------
-- Table structure for `t_insure_search`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_search`;
CREATE TABLE `t_insure_search` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '所属平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`total_num`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '证件号码' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '电子邮箱' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态(0不可续保 1未续保 2已续保)' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `passport_id_group` (`passport_id`, `create_time`) USING BTREE ,
INDEX `product_id_group` (`product_id`, `start_date`, `end_date`) USING BTREE ,
INDEX `plan_id_group` (`product_plan_id`, `start_date`, `end_date`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保信息查询表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_insure_state_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_state_log`;
CREATE TABLE `t_insure_state_log` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`payed_time`  datetime NULL DEFAULT NULL COMMENT '支付完成时间' ,
`issu_submit_time`  datetime NULL DEFAULT NULL COMMENT '承保完成时间' ,
`issu_policy_time`  datetime NULL DEFAULT NULL COMMENT '出单完成时间' ,
`retreat_time`  datetime NULL DEFAULT NULL COMMENT '退保完成时间' ,
`remark1`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展1' ,
`remark2`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展2' ,
`remark3`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展3' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保单状态变更日志'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_insure_sub_account`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_sub_account`;
CREATE TABLE `t_insure_sub_account` (
`sub_id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '子账户ID' ,
`sub_account_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '子账户名称' ,
`account_code`  tinyint(11) NOT NULL COMMENT '保险公司账户编号' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`insure_num`  bigint(20) NOT NULL COMMENT '投保单号' ,
`account_amount`  decimal(12,5) NOT NULL DEFAULT 0.00000 COMMENT '总金额' ,
`profit_total`  decimal(12,5) NULL DEFAULT NULL COMMENT '合计盈亏' ,
`ystd_profit_total`  decimal(12,5) NULL DEFAULT NULL COMMENT '昨日(上个工作日)盈亏' ,
`account_number`  decimal(15,5) NULL DEFAULT NULL COMMENT '总份额' ,
`unit_price`  decimal(12,5) NULL DEFAULT NULL COMMENT '单位价格' ,
`price_date`  date NULL DEFAULT NULL COMMENT '计价日期' ,
`status`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '账户状态' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
PRIMARY KEY (`sub_id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='子账户表'
AUTO_INCREMENT=283

;

-- ----------------------------
-- Table structure for `t_insure_task`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_task`;
CREATE TABLE `t_insure_task` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`task_type`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '任务类型(1人核、2智能认证、3银行签约)' ,
`action_order`  tinyint(1) NULL DEFAULT 0 COMMENT '核保顺序(1核保前  2核保后  3前后都需要)' ,
`task_status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态(0未执行  1成功  2失败  3取消)' ,
`is_enforce`  tinyint(1) NULL DEFAULT 0 COMMENT '强制执行任务(0否  1 是)' ,
`remark`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
`manual_audit_temp_id`  int(4) NULL DEFAULT 0 COMMENT '人核模板ID' ,
`extend1`  int(4) NULL DEFAULT 0 COMMENT '扩展字段1' ,
`extend2`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展字段2' ,
`extend3`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展字段3' ,
`manual_audit_url`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人核链接' ,
`email_audit_result`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '邮件核保结论' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`, `task_type`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保流程业务约束任务表'
AUTO_INCREMENT=2479162

;

-- ----------------------------
-- Table structure for `t_insure_type_temp`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_type_temp`;
CREATE TABLE `t_insure_type_temp` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='线下单临时表'
AUTO_INCREMENT=3176

;

-- ----------------------------
-- Table structure for `t_intercept_risk_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_intercept_risk_log`;
CREATE TABLE `t_intercept_risk_log` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键自增id' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`pluto_is_error_code`  varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'is返回的响应错误码' ,
`rcs_error_code`  varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转换分控返回结果以后的响应错误码' ,
`pluto_is_response`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'is调用响应结果' ,
`rcs_response`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '转换分控返回结果以后的响应内容' ,
`rcs_time_used`  bigint(8) NULL DEFAULT 0 COMMENT '调用分控耗时（毫秒）' ,
`pluto_is_time_used`  bigint(8) NULL DEFAULT 0 COMMENT 'is调用耗时（毫秒）' ,
`rcs_original_response`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '调用分控系统返回的原始响应内容' ,
`rcs_original_error_code`  varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调用分控系统返回的原始响应错误码' ,
`method_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '调用is的方法接口名' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='调用分控系统拦截日志'
AUTO_INCREMENT=949

;

-- ----------------------------
-- Table structure for `t_issue_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_issue_info`;
CREATE TABLE `t_issue_info` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`other_fields`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`other_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=68760

;

-- ----------------------------
-- Table structure for `t_log_insure_index`
-- ----------------------------
DROP TABLE IF EXISTS `t_log_insure_index`;
CREATE TABLE `t_log_insure_index` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`detail_info`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '投保单详细内容(json)' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insureNum` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保信息记录表'
AUTO_INCREMENT=2985758

;

-- ----------------------------
-- Table structure for `t_log_request_index`
-- ----------------------------
DROP TABLE IF EXISTS `t_log_request_index`;
CREATE TABLE `t_log_request_index` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`detail_info`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '投保单详细内容(json)' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insureNum` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保原始信息记录表'
AUTO_INCREMENT=2984008

;

-- ----------------------------
-- Table structure for `t_manual_audit_issue`
-- ----------------------------
DROP TABLE IF EXISTS `t_manual_audit_issue`;
CREATE TABLE `t_manual_audit_issue` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(20) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(4) NOT NULL COMMENT '所属平台' ,
`audit_id`  bigint(20) NOT NULL COMMENT '人核id' ,
`issue_no`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '问题件编码' ,
`issue_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题件名称' ,
`issue_status`  tinyint(4) NOT NULL COMMENT '问题件状态,0待回复,1已回复' ,
`issue_msg`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题件消息' ,
`check_upload_url`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题件上传链接' ,
`expire_time`  datetime NULL DEFAULT NULL COMMENT '失效时间' ,
`answer_type`  tinyint(4) NULL DEFAULT NULL COMMENT '回复资料类型' ,
`answer_time`  datetime NULL DEFAULT NULL COMMENT '回复时间' ,
`answer_data`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复资料数据' ,
`deleted`  tinyint(4) NOT NULL COMMENT '删除标记' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`multi_audit_id`  bigint(20) NULL DEFAULT NULL COMMENT '多被保人人核id' ,
`issue_type`  tinyint(4) NULL DEFAULT 0 COMMENT '问题件类型0 保司端下发回销 1 慧择端下发回销' ,
`audit_time`  datetime NULL DEFAULT NULL COMMENT '审核时间' ,
`send_time`  datetime NULL DEFAULT NULL COMMENT '发送保司时间' ,
`send_status`  tinyint(4) NULL DEFAULT 0 COMMENT '发送保司状态' ,
`image_type`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对接影像件类别' ,
`distribute_data`  varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保司问题件下发数据' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='人核核保问题件表'
AUTO_INCREMENT=1489

;

-- ----------------------------
-- Table structure for `t_medical`
-- ----------------------------
DROP TABLE IF EXISTS `t_medical`;
CREATE TABLE `t_medical` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`medical_num`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体检单号码' ,
`old_price`  int(4) NULL DEFAULT 0 COMMENT '原保费' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`medical_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '体检信息' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=155

;

-- ----------------------------
-- Table structure for `t_merge_relation`
-- ----------------------------
DROP TABLE IF EXISTS `t_merge_relation`;
CREATE TABLE `t_merge_relation` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`relation_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '合并支付关系号' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`md_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
PRIMARY KEY (`id`),
INDEX `relation_num` (`relation_num`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `md_code` (`md_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4290646

;

-- ----------------------------
-- Table structure for `t_multi_manual_audit`
-- ----------------------------
DROP TABLE IF EXISTS `t_multi_manual_audit`;
CREATE TABLE `t_multi_manual_audit` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL COMMENT '所属平台' ,
`insurant_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被保险人姓名' ,
`card_type_id`  tinyint(1) NOT NULL COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`audit_id`  bigint(8) NULL DEFAULT NULL COMMENT '核保表人核id' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态:0 不用核保，1、待核保，2、核保通过，3、核保失败，4、人工核保中，5、保司核保中' ,
`valid_status`  tinyint(2) NULL DEFAULT 0 COMMENT '有效性状态: 0为有效, 1为已撤销, 2为已过期,3、已删除' ,
`audit_problem_content`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核保问题内容' ,
`audit_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核保单号' ,
`template_id`  int(4) NULL DEFAULT NULL COMMENT '人核模板id' ,
`material_audit_status`  tinyint(2) NULL DEFAULT NULL COMMENT '一级状态，资料审核状态' ,
`audit_result_reason`  tinyint(1) NULL DEFAULT NULL COMMENT '核保结果二级类型' ,
`premium`  bigint(8) NULL DEFAULT NULL COMMENT '保费' ,
`add_premium`  bigint(20) NULL DEFAULT 0 COMMENT '加费' ,
`add_premium_desc`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加费描述' ,
`audit_effective_day`  int(4) NULL DEFAULT NULL COMMENT '核保有效期' ,
`special_content`  varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特别约定' ,
`delay_time`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '延期时间内容,不一定是时间字符串' ,
`apply_expire_time`  datetime NULL DEFAULT NULL COMMENT '人核申请过期时间' ,
`expire_time`  datetime NULL DEFAULT NULL COMMENT '人核过期时间' ,
`confirm_result`  tinyint(2) NULL DEFAULT 0 COMMENT '是否需要确认人核结论，0、不需要，1、需要，2、已确认' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`deleted`  tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '删除标识（0：否，1：是）' ,
`create_time`  datetime NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`personnel_type`  int(11) NULL DEFAULT 20 COMMENT '人员类型:10 投保人,20 被保人' ,
PRIMARY KEY (`id`),
INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='多被保人人核记录表'
AUTO_INCREMENT=1036

;

-- ----------------------------
-- Table structure for `t_offline_audit`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_audit`;
CREATE TABLE `t_offline_audit` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`passport_id`  bigint(20) NULL DEFAULT NULL COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`product_id`  int(11) NULL DEFAULT NULL COMMENT '产品ID' ,
`company_id`  int(11) NULL DEFAULT NULL COMMENT '保险公司ID' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`insure_url`  varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保司定向投保链接' ,
`period_end_time`  datetime NULL DEFAULT NULL COMMENT '投保链接有效期截止时间' ,
`audit_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保司投保单号' ,
`has_problem`  tinyint(2) NULL DEFAULT 0 COMMENT '是否有问题件，0 无，1 有' ,
`agent_problem_status`  tinyint(2) NULL DEFAULT 0 COMMENT '代理人问题件状态，0 无，1 未完成，2 已完成' ,
`customer_problem_status`  tinyint(2) NULL DEFAULT 0 COMMENT '客户问题件状态，0 无，1 未完成，2 已完成' ,
`problem_url`  varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题件链接，代理人、客户统一的链接' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态 1:待核保 2:核保通过 3：核保失败 4：人工核保中 9：其他' ,
`valid_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保有效状态，0有效的 1已撤销 2已过期' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态 0未支付, 1已支付 ,2不能支付, 3银行扣款中, 4银行扣款失败, 5银行扣款成功, 6 支付中,7 支付失败' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态 0未出单 1已出单 2已退保 3取消出单' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态 生效(退保)状态(0未生效 1已生效 2退保中 3已退保 4支付成功但核保异常)' ,
`agent_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '代理销售人员工号' ,
`agent_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '代理销售人员姓名' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构名称(代理人)' ,
`deleted`  tinyint(2) NULL DEFAULT 0 COMMENT '是否删除，0否，1已删除' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`pay_complete_time`  datetime NULL DEFAULT NULL COMMENT '支付完成时间' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '经纪公司编码' ,
PRIMARY KEY (`id`),
INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='录单H5链接投保核保表'
AUTO_INCREMENT=731

;

-- ----------------------------
-- Table structure for `t_offline_bank`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_bank`;
CREATE TABLE `t_offline_bank` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`bank_id`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行ID' ,
`cardholder`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '持卡人' ,
`deposit_bank`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开户银行' ,
`bank_card_no`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '银行卡号' ,
`reserve_phone`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留手机号' ,
`deposit_bank_address`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '开户行地址' ,
`bank_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '银行地址' ,
`deleted`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识(0:否 ,1:是)' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
`pension_account_code`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '养老账户' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='线下单银行信息'
AUTO_INCREMENT=29752

;

-- ----------------------------
-- Table structure for `t_offline_beneficiary`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_beneficiary`;
CREATE TABLE `t_offline_beneficiary` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '受益人姓名' ,
`ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`prov_city_id`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区名称' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`residential_identity`  tinyint(1) NULL DEFAULT NULL COMMENT '税收居民身份: 1 仅为中国税收居民、2 仅为非居民、3 既是中国税收居民又是其他国家（地区）' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 0女)' ,
`insurant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '被保险人ID' ,
`insurant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '受益人与被保险人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '受益人与被保险人关系ID' ,
`benef_type`  int(4) NULL DEFAULT 0 COMMENT '受益人类型：0-生存受益人,1-身故受益人' ,
`benef_serial`  tinyint(1) NULL DEFAULT 0 COMMENT '受益序例' ,
`proportion`  int(4) NULL DEFAULT 0 COMMENT '受益比例' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`auto_id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=924

;

-- ----------------------------
-- Table structure for `t_offline_beneficiary_snapshot`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_beneficiary_snapshot`;
CREATE TABLE `t_offline_beneficiary_snapshot` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '受益人姓名' ,
`ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`prov_city_id`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区名称' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`residential_identity`  tinyint(1) NULL DEFAULT NULL COMMENT '税收居民身份: 1 仅为中国税收居民、2 仅为非居民、3 既是中国税收居民又是其他国家（地区）' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`insurant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '被保险人ID' ,
`insurant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '受益人与被保险人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '受益人与被保险人关系ID' ,
`benef_type`  int(4) NULL DEFAULT 0 COMMENT '受益人类型：0-生存受益人,1-身故受益人' ,
`benef_serial`  tinyint(1) NULL DEFAULT 0 COMMENT '受益序例' ,
`proportion`  int(4) NULL DEFAULT 0 COMMENT '受益比例' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  datetime NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`endorsement_num`  bigint(20) NULL DEFAULT 0 COMMENT '保全受理号' ,
PRIMARY KEY (`auto_id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_endorsement_num` (`endorsement_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='批改录单投保-受益人快照表'
AUTO_INCREMENT=36

;

-- ----------------------------
-- Table structure for `t_offline_double_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_double_record`;
CREATE TABLE `t_offline_double_record` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`insure_num`  bigint(8) UNSIGNED NOT NULL COMMENT '投保单号' ,
`order_no`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保司投保单号（弘康提供）' ,
`record_state`  tinyint(1) NULL DEFAULT 0 COMMENT '双录状态：0 待双录，1 双录失败,2、已提交，处理中，3双录完成' ,
`record_fail_reason`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '双录失败原因' ,
`deleted`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识(0:否 ,1:是)' ,
`create_time`  datetime NOT NULL COMMENT '创建时间' ,
`update_time`  datetime NOT NULL COMMENT '修改时间' ,
`quality_test_state`  tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '质检状态 0:默认值无意义，1：待质检，2：质检中，3：质检不通过，4：质检通过，5：免质检' ,
`complete_time`  datetime NULL DEFAULT NULL COMMENT '保司质检完成时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='线下单双录记录'
AUTO_INCREMENT=1877

;

-- ----------------------------
-- Table structure for `t_offline_file`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_file`;
CREATE TABLE `t_offline_file` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`insure_num`  bigint(8) UNSIGNED NOT NULL COMMENT '投保单号' ,
`business_id`  bigint(8) UNSIGNED NULL DEFAULT 0 COMMENT '业务ID' ,
`file_id`  int(8) UNSIGNED NOT NULL COMMENT '文件ID' ,
`file_name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称' ,
`file_url`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件URL' ,
`insured_category`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '投保人类型：（0：其他，1：投保人，2：被保险人，3:受益人，4:代理人）' ,
`process_node`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '流程节点（默认0:其他，1:核保前，2:核对订单，3:修改支付信息，4:问题件，5:回执回销）' ,
`offline_file_type`  tinyint(2) UNSIGNED NOT NULL COMMENT '线下单文件类型（0:其他，1:证件，2:银行卡，3:签名，4:病例资料，5:体检报告，6:其他健康告知资料，7:回执回销附件）' ,
`card_type`  tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '证件类型 依照PS配置证件类型' ,
`card_classify`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '证件分类（默认0:其他，身份证:1,国徽面，2：人像面，银行卡：1:卡号面，2:磁条面）' ,
`deleted`  tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '删除标识（0：否，1：是）' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='线下单文件表'
AUTO_INCREMENT=211931

;

-- ----------------------------
-- Table structure for `t_offline_insurance_relation`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_insurance_relation`;
CREATE TABLE `t_offline_insurance_relation` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`insurance_specie_id`  int(4) NOT NULL COMMENT '险种ID' ,
`insurance_specie_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '险种名称' ,
`insurance_specie_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保司险种编码' ,
`insurant_id`  bigint(4) NOT NULL COMMENT '被保险人ID' ,
`insurant_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人名称' ,
`original_price`  bigint(20) NULL DEFAULT NULL COMMENT '原价' ,
`pay_amount`  bigint(8) NULL DEFAULT 0 COMMENT '保费' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`underwriting_age`  tinyint(4) NULL DEFAULT NULL COMMENT '承保年龄' ,
`payment_type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '缴费类型' ,
`payment_term`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缴费年限' ,
`payment_term_unit`  smallint(6) NULL DEFAULT NULL COMMENT '缴费年限单位' ,
`payment_term_unified_unit`  tinyint(4) NULL DEFAULT NULL COMMENT '缴费年限单位统一单位，payment_term_unit的转换值' ,
`payment_term_num`  smallint(6) NULL DEFAULT NULL COMMENT '缴费年限数值' ,
`payment_year`  smallint(6) NULL DEFAULT NULL COMMENT '缴费年数' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障期限' ,
`deadline_unit`  tinyint(4) NULL DEFAULT NULL COMMENT '保障期限单位' ,
`deadline_num`  tinyint(4) NULL DEFAULT NULL COMMENT '保障期限数值' ,
`deadline_unified_unit`  tinyint(4) NULL DEFAULT NULL COMMENT '保障期限统一单位，deadlineUnit的转换值' ,
`deadline_year`  smallint(6) NULL DEFAULT NULL COMMENT '保障年数' ,
`main_insurance_id`  int(4) NOT NULL DEFAULT 0 COMMENT '主险ID' ,
`main_flag`  tinyint(4) NULL DEFAULT NULL COMMENT '险种类型0: 附加险，1: 主险' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insurance_specie_type`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '险种类型' ,
`insurance_specie_state`  tinyint(4) NULL DEFAULT NULL COMMENT '险种状态：01-有效,02-中止,03-终止,04-未生效,99-其他' ,
`sum_insured`  decimal(12,2) NULL DEFAULT NULL COMMENT '险种的基本保额' ,
`retreat_type`  tinyint(1) NULL DEFAULT NULL COMMENT '退保类型：1-犹豫期内退保（长险），2-犹豫期外退保（长险），3-协议退保（长险、短险均可用），0-其它，4-短期险退保（短险）' ,
`retreat_date`  datetime NULL DEFAULT NULL COMMENT '退保时间' ,
`retreat_amount`  decimal(12,2) NULL DEFAULT NULL COMMENT '退保金额' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin5 COLLATE=latin5_turkish_ci
COMMENT='险种与被保人关系表'
AUTO_INCREMENT=9555

;

-- ----------------------------
-- Table structure for `t_offline_insurant`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_insurant`;
CREATE TABLE `t_offline_insurant` (
`auto_id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司保单号' ,
`deleted`  bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insured_age`  int(11) NULL DEFAULT NULL COMMENT '投保时年龄' ,
`card_period_type`  tinyint(1) NULL DEFAULT NULL COMMENT '证件有效期类型：0-短期，必录止期；1-长期，不录起期' ,
`social_insurance_flag`  tinyint(1) NULL DEFAULT NULL COMMENT '是否有社保：1-是，0-否' ,
`service_flag`  tinyint(1) NULL DEFAULT NULL COMMENT '在职状态：1-在职，2-退休，9-未知' ,
`nation`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '民族名称' ,
`serial_number`  int(4) NULL DEFAULT 1 COMMENT '被保人序号(数字：1、2)' ,
`bnf_type`  tinyint(1) NULL DEFAULT NULL COMMENT '受益人类型;0-法定受益人，1-指定受益人' ,
PRIMARY KEY (`auto_id`),
INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_id` (`id`) USING BTREE ,
INDEX `idx_cname` (`cname`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='线下单被保人路由表'
AUTO_INCREMENT=6386

;

-- ----------------------------
-- Table structure for `t_offline_insurant_relation`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_insurant_relation`;
CREATE TABLE `t_offline_insurant_relation` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`insurant_id`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人ID' ,
`insurant_name`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称(多人以,分隔)' ,
`policy_company_num`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '保险公司保单号' ,
`insurance_specie_id`  int(4) NULL DEFAULT 0 COMMENT '险种ID' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_policy_company_num` (`policy_company_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='线下单保单与被保人关系表'
AUTO_INCREMENT=8149

;

-- ----------------------------
-- Table structure for `t_offline_insurant_snapshot`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_insurant_snapshot`;
CREATE TABLE `t_offline_insurant_snapshot` (
`auto_id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 0女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司保单号' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  datetime NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`insured_age`  int(11) NULL DEFAULT NULL COMMENT '投保时年龄' ,
`card_period_type`  tinyint(1) NULL DEFAULT NULL COMMENT '证件有效期类型：0-短期，必录止期；1-长期，不录起期' ,
`social_insurance_flag`  tinyint(1) NULL DEFAULT NULL COMMENT '是否有社保：1-是，0-否' ,
`service_flag`  tinyint(1) NULL DEFAULT NULL COMMENT '在职状态：1-在职，2-退休，9-未知' ,
`nation`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '民族名称' ,
`serial_number`  int(4) NULL DEFAULT 1 COMMENT '被保人序号(数字：1、2)' ,
`bnf_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型;0-法定受益人，1-指定受益人' ,
`endorsement_num`  bigint(20) NULL DEFAULT 0 COMMENT '保全受理号' ,
PRIMARY KEY (`auto_id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_id` (`id`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_endorsement_num` (`endorsement_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='批改-录单投保-被保人快照表'
AUTO_INCREMENT=65

;

-- ----------------------------
-- Table structure for `t_offline_insure`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_insure`;
CREATE TABLE `t_offline_insure` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`branch_id`  int(4) NULL DEFAULT 0 COMMENT '分支机构ID' ,
`branch_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分支机构名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`settlement_price`  bigint(20) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  bigint(20) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  bigint(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型(1法定,2指定)' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`audit_status`  tinyint(4) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`issue_time`  datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '出单时间' ,
`expire_date`  datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '犹豫期满时间' ,
`attachment_file_id`  bigint(8) NULL DEFAULT 0 COMMENT '保单附件文件ID' ,
`underwriting_attachment`  bigint(8) NULL DEFAULT 0 COMMENT '核保单附件文件ID' ,
`insure_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '录单审核状态(0待审核,1待审核,2通过)' ,
`insure_source`  tinyint(1) NULL DEFAULT 0 COMMENT '来源 0为接口调用导入数据 1为excel导入' ,
`remark`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`agent_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '代理销售人员工号' ,
`agent_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '代理销售人员姓名' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构名称(代理人)' ,
`receipt_sign_time`  datetime NULL DEFAULT NULL COMMENT '回执签收时间' ,
`card_period_type`  tinyint(1) NULL DEFAULT NULL COMMENT '证件有效期类型：0-短期，必录止期;1-长期，不录起期' ,
`insured_age`  int(11) NULL DEFAULT NULL COMMENT '投保时投保人年龄，投保人豁免时需要录入' ,
`social_insurance_flag`  tinyint(1) NULL DEFAULT NULL COMMENT '是否有社保：1-是,0-否' ,
`service_flag`  tinyint(1) NULL DEFAULT NULL COMMENT '在职状态：1-在职，2-退休，9-未知' ,
`nation`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '民族名称' ,
`renewal_bank_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '续期银行' ,
`renewal_bank_cardholder`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '续期银行持卡人名称' ,
`renewal_bank_no`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '续期银行卡号' ,
`renewal_bank_address`  varchar(260) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '续期银行地址' ,
`urgency_contact_relation`  int(4) NULL DEFAULT NULL COMMENT '紧急联系人与投保险人关系ID' ,
`self_insurance`  int(11) NULL DEFAULT 0 COMMENT '自保/互保件标识：0 普通件 1 互保件，2 自保件' ,
`invalid_insure_num`  bigint(20) NULL DEFAULT NULL COMMENT '已作废投保单号' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`audit_pass_date`  datetime NULL DEFAULT NULL COMMENT '审核通过日期' ,
`moe_apply_id`  bigint(8) UNSIGNED NULL DEFAULT NULL COMMENT '从管代理人申请id' ,
`is_need_dr`  tinyint(1) NULL DEFAULT NULL COMMENT '是否需要双录 0-不需要,1-需要' ,
`dr_state`  tinyint(1) NULL DEFAULT NULL COMMENT '状态（0-未双录，1-已双录待质检，2-质检通过，3-质检不通过）' ,
`dr_complete_time`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '质检完成时间' ,
`fail_reason`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息、失败信息' ,
`fu_complete_time`  datetime NULL DEFAULT NULL COMMENT '双录完成首次更新时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_order_num` (`order_num`) USING BTREE ,
INDEX `idx_applicant_cname` (`applicant_cname`) USING BTREE ,
INDEX `idx_product_name` (`product_name`) USING BTREE ,
INDEX `idx_card_number` (`card_number`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_issue_time` (`issue_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='线下单投保单路由表'
AUTO_INCREMENT=5964

;

-- ----------------------------
-- Table structure for `t_offline_insure_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_insure_attribute`;
CREATE TABLE `t_offline_insure_attribute` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号码' ,
`type_id`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '属性归属类型(1:投保人2:被保险人3:受益人4:其他设置)' ,
`attr_key`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '属性标识' ,
`attr_value`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '属性值' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='线下单动态属性表'
AUTO_INCREMENT=5486

;

-- ----------------------------
-- Table structure for `t_offline_insure_cancel`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_insure_cancel`;
CREATE TABLE `t_offline_insure_cancel` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`complete_time`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '退保完成日期' ,
`retreat_type`  tinyint(1) NULL DEFAULT 0 COMMENT '退保类型(1犹内,2犹外,3协议,0其它)' ,
`policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保单号' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`retreat_amount`  int(11) NOT NULL DEFAULT 0 COMMENT '退保金额' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1388

;

-- ----------------------------
-- Table structure for `t_offline_insure_correct`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_insure_correct`;
CREATE TABLE `t_offline_insure_correct` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`correct_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '批单号' ,
`correct_count`  int(4) NOT NULL DEFAULT 0 COMMENT '批单次数' ,
`correct_file_id`  bigint(8) NULL DEFAULT 0 COMMENT '批单文件' ,
`issue_time`  timestamp NULL DEFAULT '1970-01-01 08:00:01' COMMENT '批单出单时间' ,
`effective_time`  timestamp NULL DEFAULT '1970-01-01 08:00:01' COMMENT '批单生效时间' ,
`pay_amount`  bigint(10) NULL DEFAULT 0 COMMENT '保费' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批单订单' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`payed_time`  timestamp NULL DEFAULT '1970-01-01 08:00:01' COMMENT '录入支付时间' ,
`venus_payed_time`  timestamp NULL DEFAULT '1970-01-01 08:00:01' COMMENT 'venus支付时间' ,
`effective_status`  tinyint(4) NULL DEFAULT 0 COMMENT '退保状态' ,
`remark`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=90

;

-- ----------------------------
-- Table structure for `t_offline_insure_old`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_insure_old`;
CREATE TABLE `t_offline_insure_old` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`passport_source`  tinyint(1) NOT NULL COMMENT '来源平台' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`issue_time`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0000-00-00 00:00:00' COMMENT '出单时间' ,
`product_id`  int(4) NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '产品名称' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '险种ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '险种名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '公司名称' ,
`branch_id`  int(10) NULL DEFAULT 0 COMMENT '分支机构ID' ,
`branch_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '分支机构名称' ,
`passport_id`  int(4) NULL DEFAULT 0 COMMENT '会员Id' ,
`passport_sub_id`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子账号id' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '会员名' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '投保人姓名' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '证件号码(加密)' ,
`mobile`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人手机号' ,
`pay_amount`  int(10) NULL DEFAULT 0 COMMENT '保费' ,
`attachment`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保单附件' ,
`deadline`  varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保障期限' ,
`payment_type`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '缴费类型' ,
`payment_term`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '缴费年限' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`remark`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注' ,
`start_date`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`policy_num`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保单号' ,
`product_plan_id`  int(4) NULL DEFAULT 0 COMMENT '基础计划id' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划名称' ,
`insurant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保人姓名' ,
`insurant_card_typeId`  int(4) NULL DEFAULT 0 COMMENT '被保人证件类型id' ,
`insurant_card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保人证件类型名称' ,
`insurant_card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保人证件号码（加密）' ,
`beneficiary_type`  tinyint(1) NULL DEFAULT NULL COMMENT '受益人类型' ,
`underwriting_attachment`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核保单附件' ,
`currency_type`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'CNY' COMMENT '币种类型' ,
`insure_source`  int(4) NULL DEFAULT 0 COMMENT '来源 0为接口调用导入数据 1为excel导入' ,
`fee_rate`  int(11) NULL DEFAULT 0 COMMENT '经纪费率' ,
`expire_date`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '犹豫期满时间' ,
`pay_order`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付订单号，财务系统生成' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_start_date` (`start_date`) USING BTREE ,
INDEX `idx_end_date` (`end_date`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_cname` (`cname`) USING BTREE ,
INDEX `idx_card_number` (`card_number`) USING BTREE ,
INDEX `idx_pay_order` (`pay_order`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=843

;

-- ----------------------------
-- Table structure for `t_offline_insure_relation`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_insure_relation`;
CREATE TABLE `t_offline_insure_relation` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`policy_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '保单号' ,
`company_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保险公司ID' ,
`branch_id`  int(10) NOT NULL DEFAULT 0 COMMENT '分支机构ID' ,
`policy_num_type`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '类型 0未录单的保单号 1为变更的批单号' ,
`correctCount`  int(4) NOT NULL DEFAULT 0 COMMENT '批单修改次数' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_policy_comp_branch_type` (`policy_num`, `company_id`, `branch_id`, `policy_num_type`) USING BTREE ,
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=835

;

-- ----------------------------
-- Table structure for `t_offline_insure_snapshot`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_insure_snapshot`;
CREATE TABLE `t_offline_insure_snapshot` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`branch_id`  int(4) NULL DEFAULT 0 COMMENT '分支机构ID' ,
`branch_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分支机构名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  bigint(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`audit_status`  tinyint(4) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`issue_time`  datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '出单时间' ,
`expire_date`  datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '犹豫期满时间' ,
`attachment_file_id`  bigint(8) NULL DEFAULT 0 COMMENT '保单附件文件ID' ,
`underwriting_attachment`  bigint(8) NULL DEFAULT 0 COMMENT '核保单附件文件ID' ,
`insure_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '录单审核状态(0待审核,1通过,2失败)' ,
`insure_source`  tinyint(1) NULL DEFAULT 0 COMMENT '来源 0为接口调用导入数据 1为excel导入' ,
`remark`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  datetime NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`agent_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '代理销售人员工号' ,
`agent_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '代理销售人员姓名' ,
`broker_company_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构编码(代理人)' ,
`broker_company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经代公司机构名称(代理人)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属经纪公司编码' ,
`receipt_sign_time`  datetime NULL DEFAULT NULL COMMENT '回执签收时间' ,
`card_period_type`  tinyint(1) NULL DEFAULT NULL COMMENT '证件有效期类型：0-短期，必录止期;1-长期，不录起期' ,
`insured_age`  int(11) NULL DEFAULT NULL COMMENT '投保时投保人年龄，投保人豁免时需要录入' ,
`social_insurance_flag`  tinyint(1) NULL DEFAULT NULL COMMENT '是否有社保：1-是,0-否' ,
`service_flag`  tinyint(1) NULL DEFAULT NULL COMMENT '在职状态：1-在职，2-退休，9-未知' ,
`nation`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '民族名称' ,
`renewal_bank_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '续期银行' ,
`renewal_bank_cardholder`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '续期银行持卡人名称' ,
`renewal_bank_no`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '续期银行卡号' ,
`renewal_bank_address`  varchar(260) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '续期银行地址' ,
`urgency_contact_relation`  int(4) NULL DEFAULT NULL COMMENT '紧急联系人与投保险人关系ID' ,
`self_insurance`  int(11) NULL DEFAULT NULL COMMENT '自保/互保件标识：1 互保件，2 自保件' ,
`invalid_insure_num`  bigint(20) NULL DEFAULT NULL COMMENT '已作废投保单号' ,
`serial_number`  int(4) NULL DEFAULT 1 COMMENT '被保人序号(数字：1、2)' ,
`moe_apply_id`  bigint(8) NULL DEFAULT NULL COMMENT '从管代理人申请id' ,
`is_need_dr`  tinyint(1) NULL DEFAULT NULL COMMENT '是否需要双录 0-不需要,1-需要' ,
`dr_state`  tinyint(1) NULL DEFAULT NULL COMMENT '状态（0-未双录，1-已双录待质检，2-质检通过，3-质检不通过）' ,
`dr_complete_time`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '质检完成时间' ,
`fail_reason`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息、失败信息' ,
`audit_pass_date`  datetime NULL DEFAULT NULL COMMENT '审核通过日期' ,
`fu_complete_time`  datetime NULL DEFAULT NULL COMMENT '双录完成首次更新时间' ,
`endorsement_num`  bigint(20) NULL DEFAULT 0 COMMENT '保全受理号' ,
PRIMARY KEY (`id`),
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_endorsement_num` (`endorsement_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='批改-录单投保单快照表'
AUTO_INCREMENT=47

;

-- ----------------------------
-- Table structure for `t_offline_insure_task_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_insure_task_record`;
CREATE TABLE `t_offline_insure_task_record` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`biz_type`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '业务类型：1.核保检查，2.人核单进批扣检查' ,
`company_id`  int(11) NOT NULL COMMENT '保险公司ID' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`audit_status`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '核保状态：1 待核保，2 核保通过，3 核保失败，4 人工核保中，5 保司核保中' ,
`manual_flag`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有转人核(0:否 ,1:是)' ,
`audit_pass_time`  date NULL DEFAULT NULL COMMENT '核保通过时间' ,
`period`  int(11) NOT NULL DEFAULT 20 COMMENT '配置期限' ,
`start_time`  date NOT NULL COMMENT '开始时间' ,
`stop_time`  date NOT NULL COMMENT '停止时间' ,
`call_count`  int(11) NOT NULL DEFAULT 0 COMMENT '调用次数' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识(0:否 ,1:是)' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`venus_call_back_queue`  varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付系统回调队列' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_stop_time` (`stop_time`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
COMMENT='线下单投保查询任务表'
AUTO_INCREMENT=3697

;

-- ----------------------------
-- Table structure for `t_offline_letters`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_letters`;
CREATE TABLE `t_offline_letters` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(20) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`passport_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '用户账号ID' ,
`agent_code`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '代理人编码-慧择工号' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`template_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT 'ps问题件模板快照ID' ,
`template_name`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模板名称/问题件名称' ,
`policy_order_num`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保司投保单号' ,
`policy_num`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保司保单号' ,
`letters_code`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单证编码PS' ,
`letters_detail_type`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单证明细类型' ,
`letters_no`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单证保司流水号' ,
`trigger_point`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '触发节点 0-其他、1-承保、2-核保、3-支付、4-签单、5-回执' ,
`distribute_object`  varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分发对象 1 代理人、2 投保人、3 第一被保人' ,
`send_time`  datetime NOT NULL COMMENT '下发时间' ,
`end_reply_time`  datetime NULL DEFAULT NULL COMMENT '最晚回复时间' ,
`issue_content`  varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题件保司下发意见' ,
`distribute_content`  mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '下发数据 json数据' ,
`reply_content`  mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '回销数据 json数据' ,
`read_status`  tinyint(4) NOT NULL COMMENT '阅读状态 0-不需要阅读、1-未阅读、2-已阅读' ,
`reply_status`  tinyint(4) NOT NULL COMMENT '回销状态 0-不需要回销、1-待回销、2-回销中、3-回销成功、4-回销失败' ,
`reply_time`  datetime NULL DEFAULT NULL COMMENT '回销时间' ,
`result_msg`  varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回销结果描述' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否已删除' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ,
`reply_mode`  tinyint(4) NULL DEFAULT 0 COMMENT '回销方式 0：本地（默认）；1 保司链接' ,
`reply_url`  varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回销链接' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_agent_code_platform` (`agent_code`, `platform`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
COMMENT='线下单问题件表'
AUTO_INCREMENT=601

;

-- ----------------------------
-- Table structure for `t_offline_policy`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_policy`;
CREATE TABLE `t_offline_policy` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`policy_file_id`  bigint(8) NULL DEFAULT 0 COMMENT '电子保单文件ID' ,
`policy_file_name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子保单文件名称' ,
`policy_num`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保单号' ,
`pay_amount`  decimal(10,0) NULL DEFAULT NULL COMMENT '总保费(分)' ,
`issue_status`  tinyint(1) NULL DEFAULT NULL COMMENT '保单状态:1.已出单 2.已退保 3.待出单 4.无效单' ,
`sign_status`  tinyint(1) NULL DEFAULT NULL COMMENT '签收状态：0-待签收,1-已签收' ,
`sum_insured`  decimal(10,0) NULL DEFAULT NULL COMMENT '保额,险种的基本保额累积之和(分)' ,
`payment_type`  tinyint(4) NULL DEFAULT NULL COMMENT '缴费频次，缴费类型;01-趸交,02-月交,03-季交,04-半年交,05-年交,06-不定期交费,99- 其他' ,
`termination_type`  tinyint(4) NULL DEFAULT NULL COMMENT '保单终止类型：01-满期终止,02-理赔终止,03-退保,04-转换,05-公司解约,06-拒保终止,07-保单迁出,08-犹豫期退保,09-当日撤单,10-团体减人,11-注销,99-其他' ,
`audit_result`  int(11) NULL DEFAULT NULL COMMENT '核保结论:10-标准体,20-次标准体,21-加费,32-限额,33-特别约定,40-延期,50-拒保,60-优标体' ,
`issue_time`  datetime NULL DEFAULT NULL COMMENT '出单日期' ,
`insure_date`  datetime NULL DEFAULT NULL COMMENT '投保日期' ,
`start_date`  datetime NULL DEFAULT NULL COMMENT '生效日期' ,
`end_date`  datetime NULL DEFAULT NULL COMMENT '失效日期' ,
`termination_date`  datetime NULL DEFAULT NULL COMMENT '终止日期' ,
`policy_end_date`  datetime NULL DEFAULT NULL COMMENT '期满日期' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`first_level_state`  tinyint(4) NULL DEFAULT NULL COMMENT '保单一级状态 0 :未生效,1-有效,3-失效,4-终止,9-其他' ,
`second_level_state`  tinyint(4) NULL DEFAULT NULL COMMENT '保单二级状态' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4485

;

-- ----------------------------
-- Table structure for `t_offline_receipt`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_receipt`;
CREATE TABLE `t_offline_receipt` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`insure_num`  bigint(8) UNSIGNED NOT NULL COMMENT '投保单号' ,
`receipt_content`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回执回销内容' ,
`receipt_status`  tinyint(1) NOT NULL COMMENT '状态（0:未签收，1：已发起回执回销，2:签收失败，3:签收成功）' ,
`sign_time`  datetime NULL DEFAULT NULL COMMENT '客户签收时间' ,
`remark_msg`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息、失败信息' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识:（0:否，1:是）' ,
`create_time`  datetime NOT NULL COMMENT '创建时间' ,
`update_time`  datetime NOT NULL COMMENT '更新时间' ,
`receipt_url`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回执链接' ,
`receipt_type`  tinyint(4) NULL DEFAULT NULL COMMENT '回执方式：1 慧择，2 保司' ,
`origin_type`  tinyint(4) NULL DEFAULT 0 COMMENT '来源，0：API投保，1 ：录单投保' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='回执回销表'
AUTO_INCREMENT=3642

;

-- ----------------------------
-- Table structure for `t_offline_withhold_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_withhold_record`;
CREATE TABLE `t_offline_withhold_record` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`company_id`  int(11) NOT NULL COMMENT '保险公司ID' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`period`  int(11) NOT NULL DEFAULT 20 COMMENT '配置期限' ,
`start_time`  date NOT NULL COMMENT '开始时间' ,
`stop_time`  date NOT NULL COMMENT '停止时间' ,
`call_count`  int(11) NOT NULL DEFAULT 0 COMMENT '调用次数' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识(0:否 ,1:是)' ,
`create_time`  datetime NOT NULL COMMENT '创建时间' ,
`update_time`  datetime NOT NULL COMMENT '修改时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uk_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
COMMENT='线下单银行代扣记录'
AUTO_INCREMENT=1635

;

-- ----------------------------
-- Table structure for `t_old_product_branch`
-- ----------------------------
DROP TABLE IF EXISTS `t_old_product_branch`;
CREATE TABLE `t_old_product_branch` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'pk' ,
`pid`  int(4) NOT NULL COMMENT '产品id' ,
`bid`  int(4) NOT NULL COMMENT '分支机构id' ,
`bname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分支机构名称' ,
PRIMARY KEY (`id`),
INDEX `idx_pid` (`pid`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='旧产品id与机构id映射表'
AUTO_INCREMENT=7519

;

-- ----------------------------
-- Table structure for `t_order_audit_insure`
-- ----------------------------
DROP TABLE IF EXISTS `t_order_audit_insure`;
CREATE TABLE `t_order_audit_insure` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`insure_audit_id`  int(11) NOT NULL COMMENT 't_insure_audit.id' ,
`insure_num`  bigint(8) NULL DEFAULT NULL COMMENT '投保单号' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='预约核保关联的投保单号'
AUTO_INCREMENT=9

;

-- ----------------------------
-- Table structure for `t_overdue_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_overdue_detail`;
CREATE TABLE `t_overdue_detail` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`start_date`  datetime NULL DEFAULT NULL COMMENT '起保时间' ,
`end_date`  datetime NULL DEFAULT NULL COMMENT '截保时间' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单来源平台' ,
`action_status`  tinyint(1) NULL DEFAULT 0 COMMENT '处理状态(0未处理 1已备份 2已清除)' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='过期数据明细表'
AUTO_INCREMENT=2558954

;

-- ----------------------------
-- Table structure for `t_overdue_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_overdue_log`;
CREATE TABLE `t_overdue_log` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`execute_day`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行日期' ,
`execute_status`  tinyint(1) NULL DEFAULT 0 COMMENT '完成状态(0未完成 1已完成)' ,
`execute_log`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行日志' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='过期数据执行日志'
AUTO_INCREMENT=26

;

-- ----------------------------
-- Table structure for `t_plan_map_common`
-- ----------------------------
DROP TABLE IF EXISTS `t_plan_map_common`;
CREATE TABLE `t_plan_map_common` (
`id`  int(4) NOT NULL AUTO_INCREMENT ,
`plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '计划ID' ,
`mapping`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '映射关系' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `plan_id` (`plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='新产品计划ID与旧产品计划ID的映射关系表'
AUTO_INCREMENT=165

;

-- ----------------------------
-- Table structure for `t_policy_affiliated`
-- ----------------------------
DROP TABLE IF EXISTS `t_policy_affiliated`;
CREATE TABLE `t_policy_affiliated` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(30) NOT NULL DEFAULT 0 COMMENT '投保单号码' ,
`issue_type`  tinyint(1) NULL DEFAULT 0 COMMENT '出单类型(自动/手动)' ,
`delay`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否延时出单' ,
`remind_time`  timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '出单提醒时间' ,
`issue_status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否出单(1是 0否)' ,
`islock`  tinyint(1) NULL DEFAULT 0 COMMENT '是否锁定' ,
`user_id`  bigint(8) NULL DEFAULT 0 COMMENT '锁定用户ID' ,
`user_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '锁定用户名称' ,
`lockd_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '锁定时间' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`is_bank_withhold`  tinyint(1) NULL DEFAULT 0 COMMENT '是否是银行代扣 1为银行代扣 0为非银行代扣' ,
`is_birthday_insure`  tinyint(1) NULL DEFAULT 0 COMMENT '1是生日单 0是非生日单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `create_time` (`create_time`) USING BTREE ,
INDEX `delay` (`delay`) USING BTREE ,
INDEX `issue_status` (`issue_status`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3521287

;

-- ----------------------------
-- Table structure for `t_policy_affiliated_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_policy_affiliated_config`;
CREATE TABLE `t_policy_affiliated_config` (
`id`  int(4) NOT NULL AUTO_INCREMENT ,
`product_id`  int(4) NULL DEFAULT NULL COMMENT '产品ID' ,
`record_url`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录单地址' ,
`user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名' ,
`password`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码' ,
`update_by`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=57

;

-- ----------------------------
-- Table structure for `t_policy_company_file`
-- ----------------------------
DROP TABLE IF EXISTS `t_policy_company_file`;
CREATE TABLE `t_policy_company_file` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`policy_file_id`  bigint(8) NULL DEFAULT 0 COMMENT '电子保单文件ID' ,
`policy_file_name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子保单文件名称' ,
`voucher_file_id`  bigint(8) NULL DEFAULT 0 COMMENT '电子凭证文件ID' ,
`policy_file_url`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子保单文件路径' ,
`compress_file_id`  bigint(8) NULL DEFAULT 0 COMMENT '压缩文件ID' ,
`policy_num`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保单号' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`confirm_file_id`  bigint(20) NULL DEFAULT NULL COMMENT '投保确认函' ,
PRIMARY KEY (`id`),
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3757727

;

-- ----------------------------
-- Table structure for `t_policy_file_damage`
-- ----------------------------
DROP TABLE IF EXISTS `t_policy_file_damage`;
CREATE TABLE `t_policy_file_damage` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`policy_file_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '文件id' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='保单文件损坏表'
AUTO_INCREMENT=29853

;

-- ----------------------------
-- Table structure for `t_policy_modify_remark`
-- ----------------------------
DROP TABLE IF EXISTS `t_policy_modify_remark`;
CREATE TABLE `t_policy_modify_remark` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`trans_no`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流水记录单号' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保单号' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保人姓名' ,
`product_plan_id`  int(4) NULL DEFAULT 0 COMMENT '产品计划ID' ,
`modify_type`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '备注类型(1整个投保单备注 2单个保单备注)' ,
`audit_type`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '审核状态(0待审核 1审核通过 2审核不通过 3执行成功 4执行失败)' ,
`remark`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注内容' ,
`reason`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批改理由' ,
`apply_file_id`  bigint(8) NULL DEFAULT 0 COMMENT '批改申请文件ID' ,
`update_user_id`  int(4) NULL DEFAULT 0 COMMENT '审核人ID' ,
`create_user_id`  int(4) NULL DEFAULT NULL COMMENT '批改提交人ID' ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批改提交人' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人' ,
`audit_log`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核说明' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_trans_no` (`trans_no`) USING BTREE ,
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='批单备注表'
AUTO_INCREMENT=47

;

-- ----------------------------
-- Table structure for `t_policy_premium_share`
-- ----------------------------
DROP TABLE IF EXISTS `t_policy_premium_share`;
CREATE TABLE `t_policy_premium_share` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`policy_company_num`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保单号' ,
`insure_num`  bigint(30) UNSIGNED NOT NULL COMMENT '投保单号' ,
`insurant_ids`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保人ID（多人按“,”分割）' ,
`issue_source`  tinyint(1) UNSIGNED NOT NULL COMMENT '出单来源（0：手工出单，1：慧择出单，2：对接出单，3:手工临时单）' ,
`issue_type`  tinyint(1) UNSIGNED NOT NULL COMMENT '出单类型（0：一份一单，1：一份多单，2：多份一单）' ,
`settlement_price`  int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付价' ,
`file_id`  bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '文件ID' ,
`file_name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称' ,
`file_url`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件URL' ,
`brokerage_type`  tinyint(1) NULL DEFAULT NULL COMMENT '经纪费类型（0-固定,1-不固定,2-分项,3-关联试算项,4-不固定分项 ）' ,
`brokerage`  int(11) UNSIGNED NULL DEFAULT 0 COMMENT '经纪费' ,
`brokerage_rate`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '经济费率（百分比）' ,
`technology_service_fee`  int(11) UNSIGNED NULL DEFAULT 0 COMMENT '技术服务费（预留字段）' ,
`technology_service_type`  tinyint(1) NULL DEFAULT NULL COMMENT '技术服务类型（预留字段）' ,
`insurance_specie_ids`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '险种（手工分摊使用）' ,
`issue_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '出单时间' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识：（0：未删除，1：已删除）' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_policy_company_num` (`policy_company_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='基于保单保费分摊表'
AUTO_INCREMENT=2961070

;

-- ----------------------------
-- Table structure for `t_policy_receipt`
-- ----------------------------
DROP TABLE IF EXISTS `t_policy_receipt`;
CREATE TABLE `t_policy_receipt` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`insure_num`  bigint(20) NOT NULL COMMENT '投保单号' ,
`company_policy_num`  varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保单号' ,
`company_id`  int(11) NOT NULL COMMENT '保险公司ID' ,
`receipt_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回执时间' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`create_user_id`  int(11) NULL DEFAULT NULL COMMENT '创建人ID' ,
`create_user_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名称' ,
PRIMARY KEY (`id`),
INDEX `idx_company_policy_num_group` (`company_policy_num`, `company_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='保单回执表'
AUTO_INCREMENT=34

;

-- ----------------------------
-- Table structure for `t_policy_state_collect`
-- ----------------------------
DROP TABLE IF EXISTS `t_policy_state_collect`;
CREATE TABLE `t_policy_state_collect` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`policy_company_num`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保单号' ,
`third_policy_num`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方保险公司单号' ,
`company_id`  int(8) NOT NULL COMMENT '公司ID' ,
`company_branch_id`  int(11) NULL DEFAULT NULL COMMENT '保险公司分支机构ID' ,
`policy_source`  tinyint(1) NOT NULL COMMENT '来源，0：对接推送，1：导入，2：退保消息' ,
`first_level_state`  int(4) NOT NULL COMMENT '一级状态，1：有效，2：中止，3：终止，4：未生效，99：其他' ,
`second_level_state`  int(4) NULL DEFAULT NULL COMMENT '二级状态，11：正常缴费，13：复效，31：满期终止，32：理赔终止，33：退保，34：保单迁出，35：犹豫期退保，36：当日撤单，37：其他' ,
`effective_time`  datetime NULL DEFAULT NULL COMMENT '保单生效时间' ,
`is_exempt`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否豁免：0否，1是' ,
`description`  varchar(1100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明' ,
`operator_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '操作人ID' ,
`operator_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '系统' COMMENT '操作人姓名' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_policy_company_num` (`policy_company_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='保单状态变更汇总表'
AUTO_INCREMENT=33421

;

-- ----------------------------
-- Table structure for `t_policy_state_update`
-- ----------------------------
DROP TABLE IF EXISTS `t_policy_state_update`;
CREATE TABLE `t_policy_state_update` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`policy_company_num`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保单号' ,
`third_policy_num`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方保险公司单号' ,
`company_id`  int(8) NOT NULL COMMENT '公司ID' ,
`company_branch_id`  int(11) NULL DEFAULT NULL COMMENT '保险公司分支机构ID' ,
`policy_source`  tinyint(1) NOT NULL COMMENT '来源，0：对接推送，1：导入，2：退保消息' ,
`first_level_state`  int(4) NOT NULL COMMENT '一级状态，1：有效，2：中止，3：终止，4：未生效，99：其他' ,
`second_level_state`  int(4) NULL DEFAULT NULL COMMENT '二级状态，11：正常缴费，13：复效，31：满期终止，32：理赔终止，33：退保，34：保单迁出，35：犹豫期退保，36：当日撤单，37：其他' ,
`effective_time`  datetime NULL DEFAULT NULL COMMENT '保单生效时间' ,
`is_exempt`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否豁免：0否，1是' ,
`description`  varchar(1100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明' ,
`operator_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '操作人ID' ,
`operator_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '系统' COMMENT '操作人姓名' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `unique_policy_insure_num` (`insure_num`, `policy_company_num`) USING BTREE ,
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_policy_company_num` (`policy_company_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='保单状态最新变更'
AUTO_INCREMENT=8045

;

-- ----------------------------
-- Table structure for `t_premium_audit_file`
-- ----------------------------
DROP TABLE IF EXISTS `t_premium_audit_file`;
CREATE TABLE `t_premium_audit_file` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`file_id`  int(4) NULL DEFAULT 0 COMMENT '文件ID' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=141

;

-- ----------------------------
-- Table structure for `t_premium_audit_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_premium_audit_log`;
CREATE TABLE `t_premium_audit_log` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '审核状态' ,
`log_content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '日志内容' ,
`user_id`  bigint(8) NULL DEFAULT 0 COMMENT '操作人ID' ,
`user_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人姓名' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=15

;

-- ----------------------------
-- Table structure for `t_product_whitelist`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_whitelist`;
CREATE TABLE `t_product_whitelist` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被保人姓名' ,
`card_type_id`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`create_user_id`  int(4) NULL DEFAULT 0 COMMENT '创建人ID' ,
`create_user_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名称' ,
`update_user_id`  int(4) NULL DEFAULT 0 COMMENT '更新人ID' ,
`update_user_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人名称' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`birth_date`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别(1男2女)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '经纪公司编码' ,
PRIMARY KEY (`id`),
INDEX `idx_cname` (`cname`) USING BTREE ,
INDEX `idx_card_number` (`card_number`) USING BTREE ,
INDEX `idx_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='老客户产品投保白名单表'
AUTO_INCREMENT=5557

;

-- ----------------------------
-- Table structure for `t_project_common`
-- ----------------------------
DROP TABLE IF EXISTS `t_project_common`;
CREATE TABLE `t_project_common` (
`id`  int(4) NOT NULL AUTO_INCREMENT ,
`old_project_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '旧保障项目名称' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '新保障项目ID' ,
`project_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新保障项目名称' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `old_project_name` (`old_project_name`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='新旧保障项目对象关系'
AUTO_INCREMENT=631

;

-- ----------------------------
-- Table structure for `t_reappear_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_reappear_log`;
CREATE TABLE `t_reappear_log` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '已退保的投保单号' ,
`content`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志内容' ,
`new_insure_num`  bigint(8) NULL DEFAULT 0 COMMENT '重出的投保单号' ,
`status`  tinyint(1) NULL DEFAULT 0 COMMENT '状态(0未重出 1已重出)' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间(重出投保单时间)' ,
PRIMARY KEY (`id`),
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='退保重出日志表'
AUTO_INCREMENT=3552

;

-- ----------------------------
-- Table structure for `t_renewal_bill`
-- ----------------------------
DROP TABLE IF EXISTS `t_renewal_bill`;
CREATE TABLE `t_renewal_bill` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键标示' ,
`renewal_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '续期单号' ,
`info_id`  int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '续期信息主键id' ,
`policy_company_num`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保单号' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`renewal_status`  int(4) NOT NULL DEFAULT 0 COMMENT '续期单状态' ,
`payment_stage`  int(4) NOT NULL DEFAULT 1 COMMENT '保单年度' ,
`pay_fee`  int(4) NOT NULL DEFAULT 0 COMMENT '应缴续期保费' ,
`real_pay_fee`  int(4) NOT NULL DEFAULT 0 COMMENT '续期实际缴费金额' ,
`fee_rate`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '续期经纪费率' ,
`expire_date`  date NOT NULL COMMENT '宽限期满日期' ,
`expire_day`  int(4) NULL DEFAULT NULL COMMENT '宽限天数' ,
`should_pay_time`  date NOT NULL COMMENT '应缴日期' ,
`real_renewal_time`  date NULL DEFAULT NULL COMMENT '实际续期日期' ,
`failure_reason`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失败原因' ,
`pay_type`  tinyint(1) NULL DEFAULT NULL COMMENT '支付方式' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`payed_time`  datetime NULL DEFAULT NULL COMMENT '支付完成日期' ,
`pay_order_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付单号' ,
`remark`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
`auto_withhold_num`  tinyint(1) NULL DEFAULT 0 COMMENT '自动扣款次数' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标示' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_renewal_num` (`renewal_num`) USING BTREE ,
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_policy_company_num` (`policy_company_num`) USING BTREE ,
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='续期明细信息表'
AUTO_INCREMENT=26823

;

-- ----------------------------
-- Table structure for `t_renewal_excel`
-- ----------------------------
DROP TABLE IF EXISTS `t_renewal_excel`;
CREATE TABLE `t_renewal_excel` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'pk' ,
`file_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称' ,
`digest`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '摘要' ,
`user_id`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id' ,
`user_name`  varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名' ,
`file_id`  int(32) NULL DEFAULT NULL COMMENT '文件ID' ,
`status`  int(4) NULL DEFAULT 0 COMMENT '状态' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`result_message`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '处理结果' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_digest` (`digest`) USING BTREE ,
INDEX `idx_status` (`status`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='续期导入信息表'
AUTO_INCREMENT=133

;

-- ----------------------------
-- Table structure for `t_renewal_excel_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_renewal_excel_detail`;
CREATE TABLE `t_renewal_excel_detail` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'pk' ,
`digest`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导入文件MD5' ,
`company_id`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司编号' ,
`seq`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '序号' ,
`policy_no`  varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保单号' ,
`policy_state`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保单状态' ,
`renewal_paid_premium`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实缴续期保费' ,
`payment_actual_date`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实际缴费日期' ,
`renewal_state`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '续期状态' ,
`pay_type`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缴费类型' ,
`pay_period`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缴费年限' ,
`renewal_times`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '续期次数' ,
`renewal_bank_name`  varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '*续期银行' ,
`renewal_account_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '续期账户名' ,
`renewal_bank_account`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '续期账号' ,
`payment_failure_reason`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缴费失败原因' ,
`status`  int(11) NULL DEFAULT 0 COMMENT '状态' ,
PRIMARY KEY (`id`),
INDEX `idx_digest` (`digest`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='续期导入信息明细表'
AUTO_INCREMENT=1020

;

-- ----------------------------
-- Table structure for `t_renewal_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_renewal_info`;
CREATE TABLE `t_renewal_info` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键标示' ,
`policy_company_num`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保单号' ,
`company_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保险公司id' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`branch_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分支机构名称' ,
`branch_id`  int(4) NULL DEFAULT NULL COMMENT '分支机构id' ,
`is_old`  tinyint(4) NULL DEFAULT 0 COMMENT '新旧产品(0新产品1旧产品)' ,
`platform`  int(4) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`is_owner`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否慧择代收(0否 1是)' ,
`policy_status`  int(4) NOT NULL DEFAULT 0 COMMENT '保单状态' ,
`retreat_status`  tinyint(1) NULL DEFAULT 0 COMMENT '退保类型(1犹内退保 2犹外退保)' ,
`renewal_pay_bank_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缴费银行名称' ,
`renewal_pay_account`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缴费账号' ,
`renewal_pay_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缴费账户名' ,
`payment_type`  int(4) NULL DEFAULT 0 COMMENT '缴费方式' ,
`payment_years`  int(4) NULL DEFAULT 0 COMMENT '缴费年限' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  int(4) NOT NULL DEFAULT 0 COMMENT '0为线上单 1为线下单' ,
`company_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司简称' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品id' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NULL DEFAULT 0 COMMENT '计划id' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划名称' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_moblie`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人手机号码' ,
`applicant_email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人邮箱' ,
`insurant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保人姓名' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '会员id' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员名' ,
`follow_type`  tinyint(1) NULL DEFAULT 1 COMMENT '跟进方(1慧择 2渠道)' ,
`cleanout_type`  tinyint(1) NULL DEFAULT 0 COMMENT '数据清洗标记' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标示' ,
PRIMARY KEY (`id`),
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_policy_company_num` (`policy_company_num`) USING BTREE ,
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='续期信息表'
AUTO_INCREMENT=13419

;

-- ----------------------------
-- Table structure for `t_renewal_owner`
-- ----------------------------
DROP TABLE IF EXISTS `t_renewal_owner`;
CREATE TABLE `t_renewal_owner` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`renewal_num`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '续期单号' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`payment_stage`  smallint(2) NOT NULL DEFAULT 0 COMMENT '缴费期数' ,
`payment_type`  tinyint(1) NULL DEFAULT 1 COMMENT '缴费方式(1月交,2季交,3年交)' ,
`renewal_status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '续期状态(0未续 1已续 2已退保)' ,
`should_pay_time`  date NOT NULL COMMENT '应缴日期' ,
`pay_time_over`  date NOT NULL COMMENT '宽限期满日期' ,
`should_pay_amount`  int(4) NULL DEFAULT 0 COMMENT '应缴保费' ,
`pay_type`  tinyint(1) NULL DEFAULT 1 COMMENT '支付方式(1微信)' ,
`pay_status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '支付状态(0未支付 1已支付 2支付失败)' ,
`payed_time`  datetime NULL DEFAULT NULL COMMENT '支付完成日期' ,
`payed_amount`  int(4) NULL DEFAULT 0 COMMENT '实缴保费' ,
`pay_order_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付单号' ,
`remark`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
`auto_withhold_num`  tinyint(1) NULL DEFAULT 0 COMMENT '自动扣款次数' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`passport_source`  int(4) NULL DEFAULT 0 COMMENT '来源平台' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_should_pay_time` (`should_pay_time`) USING BTREE ,
INDEX `idx_pay_time_over` (`pay_time_over`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='慧择代扣续期记录表'
AUTO_INCREMENT=2247

;

-- ----------------------------
-- Table structure for `t_resc_service_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_resc_service_info`;
CREATE TABLE `t_resc_service_info` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'pk' ,
`base_product_id`  int(8) NOT NULL COMMENT '基础层产品id' ,
`service_provider`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '救援服务提供方(1保险公司2惠择)' ,
`resc_org`  varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '救援机构' ,
`emergency_call`  varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '紧急救援电话' ,
`has_resc`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否有救援服务(0无1有)' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `idx_b_prod_id` (`base_product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='救援服务产品配置表'
AUTO_INCREMENT=256

;

-- ----------------------------
-- Table structure for `t_reservation_insure`
-- ----------------------------
DROP TABLE IF EXISTS `t_reservation_insure`;
CREATE TABLE `t_reservation_insure` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增' ,
`reservation_insure_num`  bigint(20) NOT NULL COMMENT '投保单号(预约单号,还是会关联生成的投保单记录，只不过单子不会真正出单)' ,
`insure_num`  bigint(20) NOT NULL DEFAULT 0 COMMENT '真正投保后关联的正式单投保单号（对预约单来说是新单，之前的预约单不会真正出单）' ,
`platform`  int(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`passport_source`  int(1) NULL DEFAULT 0 COMMENT '用户帐号来源 1: 慧择；2：齐欣；3：聚米；7：携保；9：森昊' ,
`passport_id`  bigint(20) NOT NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '投保地区-省名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '投保地区-地区名称' ,
`policy_company_num`  varchar(383) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '保险公司保单号' ,
`insure_type`  tinyint(1) NULL DEFAULT 0 COMMENT '投保单类型 (0:互联网,1:线下单)' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '所属经纪公司编码' ,
`sale_staff_code`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '销售人员工号' ,
`sale_staff_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '销售人员姓名' ,
`service_staff_code`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '服务人员工号' ,
`service_staff_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '服务人员姓名' ,
`reservation_insure_way`  int(11) NOT NULL DEFAULT 0 COMMENT '预约单投保方式1填写要素转发、2协助客户录单' ,
`insure_status`  int(11) NOT NULL DEFAULT 0 COMMENT '预约单录单状态 0待修改、1已提交、2录单中、3录单完成、4已出单、-1已取消' ,
`link_type`  int(11) NOT NULL DEFAULT 0 COMMENT '链接类型0无1url2二维码' ,
`link_info`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接信息' ,
`back_remark`  varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '打回原因' ,
`cancel_remark`  varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '取消原因' ,
`deleted`  int(11) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`commit_time`  datetime NULL DEFAULT NULL COMMENT '提交时间' ,
`expand_employee_code`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '顾问人员工号' ,
`expand_employee_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '顾问人员姓名' ,
`related_product_plans`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '映射录单的商品计划id（如果id与录单id不一致就会存，多个id逗号隔开，注意兼容中文与英文逗号）' ,
PRIMARY KEY (`id`),
INDEX `idx_create_time` (`create_time`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_reservation_insure_num` (`reservation_insure_num`) USING BTREE ,
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_policy_company_num` (`policy_company_num`) USING BTREE ,
INDEX `idx_policy_product_id` (`product_id`) USING BTREE ,
INDEX `idx_commit_time` (`commit_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=220

;

-- ----------------------------
-- Table structure for `t_retreat_rebirth`
-- ----------------------------
DROP TABLE IF EXISTS `t_retreat_rebirth`;
CREATE TABLE `t_retreat_rebirth` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL COMMENT '旧投保单号' ,
`change_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '更改内容记录' ,
`new_insure_num`  bigint(8) NOT NULL COMMENT '新投保单号' ,
`extend1`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展字段' ,
`extend2`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展字段' ,
`extend3`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展字段' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `idx_new_insure_num` (`new_insure_num`) USING BTREE ,
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='退保重出记录表'
AUTO_INCREMENT=349

;

-- ----------------------------
-- Table structure for `t_retreat_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_retreat_record`;
CREATE TABLE `t_retreat_record` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`insure_num`  bigint(20) NOT NULL COMMENT '投保单号' ,
`retreat_num`  bigint(20) NOT NULL COMMENT '退保单号' ,
`issue_type`  tinyint(4) NOT NULL COMMENT '出单类型' ,
`execute_status`  tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '执行状态' ,
`remark`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `index_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1065

;

-- ----------------------------
-- Table structure for `t_risk_notify`
-- ----------------------------
DROP TABLE IF EXISTS `t_risk_notify`;
CREATE TABLE `t_risk_notify` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`insure_num`  bigint(20) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(4) NOT NULL COMMENT '来源平台' ,
`version`  tinyint(4) NOT NULL COMMENT '问卷问题版本号' ,
`json`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '问卷json' ,
`other_json`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他字段json' ,
`risk_status`  tinyint(4) NOT NULL COMMENT '问卷风险结果，1承保，2拒保' ,
`risk_msg`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问卷风险结果消息' ,
`create_time`  datetime NOT NULL COMMENT '创建时间' ,
PRIMARY KEY (`id`, `insure_num`),
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='风险问卷表'
AUTO_INCREMENT=146

;

-- ----------------------------
-- Table structure for `t_saas_insure`
-- ----------------------------
DROP TABLE IF EXISTS `t_saas_insure`;
CREATE TABLE `t_saas_insure` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`company_branch_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司分支机构ID' ,
`company_branch_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司分支机构名称' ,
`tenant_id`  int(4) NULL DEFAULT 0 COMMENT '租户ID' ,
`is_internal`  tinyint(1) NULL DEFAULT 1 COMMENT '内部租户标识(1是 0否)' ,
`is_offline`  tinyint(1) NULL DEFAULT 0 COMMENT '线下单标识(0否 1是)' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `unx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保单与租户关系表'
AUTO_INCREMENT=2601785

;

-- ----------------------------
-- Table structure for `t_smart_audit_result`
-- ----------------------------
DROP TABLE IF EXISTS `t_smart_audit_result`;
CREATE TABLE `t_smart_audit_result` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`audit_id`  bigint(11) NOT NULL COMMENT '核保ID' ,
`disease`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疾病' ,
`answers`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '问答' ,
`premium`  int(11) NULL DEFAULT NULL COMMENT '加费金额' ,
`applicant_exempt_premium`  int(4) NULL DEFAULT 0 COMMENT '投保人豁免保费' ,
`check_code`  int(11) NULL DEFAULT NULL COMMENT '结果状态码' ,
`appoint_describe`  varchar(1800) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疾病的特别约定' ,
`premium_describe`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加费疾病' ,
`disease_health_result`  tinyint(4) NULL DEFAULT NULL COMMENT '单项疾病结论' ,
`disease_appoint_desc`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单项疾病除外说明  疾病结论为除外时填写' ,
`disease_add_prem`  int(11) NULL DEFAULT NULL COMMENT '单项疾病加费金额  疾病结论为加费时填写，单位分' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`result_type`  int(11) NULL DEFAULT NULL COMMENT '回答问题结论 1:拒保、2:承保、3:提问 6转人核 7转人核继续告知' ,
`detail_result_type`  int(11) NULL DEFAULT NULL COMMENT '执行结果操作内容类型：1无2延期3提示4加费5除外6累计EM' ,
`result_content`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行结果操作内容' ,
PRIMARY KEY (`id`),
INDEX `IDX_AUDIT_ID` (`audit_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='智能核保结果表'
AUTO_INCREMENT=114300

;

-- ----------------------------
-- Table structure for `t_smart_ensure_project`
-- ----------------------------
DROP TABLE IF EXISTS `t_smart_ensure_project`;
CREATE TABLE `t_smart_ensure_project` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`audit_id`  bigint(11) NOT NULL COMMENT '核保单ID' ,
`protect_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障项目名称' ,
`protect_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障内容说明' ,
`unit_text`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保额单位' ,
`key_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试算项key' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `IDX_AUDIT_ID` (`audit_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='智能保障项目表'
AUTO_INCREMENT=7054598

;

-- ----------------------------
-- Table structure for `t_spilt_policy`
-- ----------------------------
DROP TABLE IF EXISTS `t_spilt_policy`;
CREATE TABLE `t_spilt_policy` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`insure_num`  bigint(20) NOT NULL COMMENT '投保单号' ,
`policy_company_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保险公司保单号' ,
`is_all_issued`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否全部承保(0否1是)' ,
`split_count`  smallint(6) NOT NULL DEFAULT 0 COMMENT '拆单数量' ,
`send_sms`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否发生短信' ,
`send_email`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否发生邮件' ,
`policy_receipt_url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保单回执下载地址' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=18466

;

-- ----------------------------
-- Table structure for `t_statistics_insure`
-- ----------------------------
DROP TABLE IF EXISTS `t_statistics_insure`;
CREATE TABLE `t_statistics_insure` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`platform`  tinyint(1) NOT NULL COMMENT '事业部' ,
`statistics_date`  date NOT NULL COMMENT '统计日期' ,
`insure_total`  int(11) NULL DEFAULT 0 COMMENT '总投保单量' ,
`insure_succeed`  int(11) NULL DEFAULT 0 COMMENT '投保成功量' ,
`payed_total`  int(11) NULL DEFAULT 0 COMMENT '付款投保单' ,
`average_payed`  int(255) NULL DEFAULT 0 COMMENT '平均支付时长(单位毫秒)' ,
`average_premium`  int(11) NULL DEFAULT 0 COMMENT '人均保费（已支付）' ,
`retreat_total`  int(11) NULL DEFAULT 0 COMMENT '退保重出单量' ,
`create_time`  datetime NOT NULL COMMENT '创建时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=715

;

-- ----------------------------
-- Table structure for `t_statistics_issue`
-- ----------------------------
DROP TABLE IF EXISTS `t_statistics_issue`;
CREATE TABLE `t_statistics_issue` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`statistics_date`  date NOT NULL COMMENT '统计日期' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保险公司名称' ,
`issued_total`  int(11) NULL DEFAULT 0 COMMENT '总出单量' ,
`unissue_total`  int(11) NULL DEFAULT 0 COMMENT '已支付未出单量' ,
`five_issued`  int(11) NULL DEFAULT NULL COMMENT '5分钟以内出单量' ,
`thirty_issued`  int(11) NULL DEFAULT 0 COMMENT '30分钟后出单' ,
`manual_issued`  int(11) NULL DEFAULT 0 COMMENT '手工单数量' ,
`issued_average`  int(11) NULL DEFAULT 0 COMMENT '出单平均耗时(单位毫秒)' ,
`accepe_average`  int(11) NULL DEFAULT 0 COMMENT '生成电子保单平均耗时（单位毫秒）' ,
`try_average`  int(11) NULL DEFAULT 0 COMMENT '平均出单尝试次数' ,
`exception_total`  int(11) NULL DEFAULT 0 COMMENT '异常单量' ,
`exception_declaration`  varchar(520) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常d单说明' ,
`create_time`  datetime NOT NULL COMMENT '创建时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='出单统计'
AUTO_INCREMENT=527

;

-- ----------------------------
-- Table structure for `t_statistics_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_statistics_product`;
CREATE TABLE `t_statistics_product` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`platform`  tinyint(4) NOT NULL COMMENT '事业部' ,
`statistics_date`  date NOT NULL ,
`product_total`  int(11) NULL DEFAULT 0 COMMENT '总产品数量' ,
`plan_total`  int(11) NULL DEFAULT 0 COMMENT '总计划数量' ,
`hit_product_total`  int(11) NULL DEFAULT 0 COMMENT '上架产品数量' ,
`hit_plan_total`  int(11) NULL DEFAULT 0 COMMENT '上架计划数量' ,
`new_hit_product_total`  int(11) NULL DEFAULT 0 COMMENT '新上架产品数量' ,
`new_hit_plan_total`  int(11) NULL DEFAULT 0 COMMENT '新上架计划数量' ,
`suspension_good_total`  int(11) NULL DEFAULT 0 COMMENT '停售商品/计划' ,
`trial_alarm_total`  int(11) NULL DEFAULT 0 COMMENT '试算告警数' ,
`good_change_total`  int(11) NULL DEFAULT 0 COMMENT '商品异动量' ,
`sales_total`  int(11) NULL DEFAULT 0 COMMENT '总销量' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=685

;

-- ----------------------------
-- Table structure for `t_statistics_report`
-- ----------------------------
DROP TABLE IF EXISTS `t_statistics_report`;
CREATE TABLE `t_statistics_report` (
`id`  int(4) NOT NULL AUTO_INCREMENT ,
`statistics_date`  date NULL DEFAULT NULL COMMENT '统计的时间日期' ,
`total_insure_count`  int(4) NULL DEFAULT 0 COMMENT '总投保单量' ,
`pay_insure_count`  int(4) NULL DEFAULT 0 COMMENT '已支付单量' ,
`issued_insure_count`  int(4) NULL DEFAULT 0 COMMENT '已出单量' ,
`total_premium`  bigint(4) NULL DEFAULT 0 COMMENT '总保费' ,
`total_pay_premium`  bigint(8) NULL DEFAULT 0 COMMENT '已支付总保费' ,
`extend1`  int(4) NULL DEFAULT 0 COMMENT '扩展字段' ,
`extend2`  int(4) NULL DEFAULT 0 COMMENT '扩展字段' ,
`extend3`  int(4) NULL DEFAULT 0 COMMENT '扩展字段' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1007

;

-- ----------------------------
-- Table structure for `t_statistics_retreat`
-- ----------------------------
DROP TABLE IF EXISTS `t_statistics_retreat`;
CREATE TABLE `t_statistics_retreat` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`statistics_date`  date NOT NULL COMMENT '统计时间' ,
`retreat_type`  tinyint(4) NULL DEFAULT NULL COMMENT '退保类型(1:API 2:退保重出 3:后台退保  4:前台退保)' ,
`retreat_total`  int(11) NULL DEFAULT NULL COMMENT '总退保单' ,
`retreat_premium`  int(11) NULL DEFAULT NULL COMMENT '退保保费' ,
`retreat_average`  bigint(11) NULL DEFAULT NULL COMMENT '退保平均时长' ,
`customer_audit`  bigint(11) NULL DEFAULT NULL COMMENT '客服产品审核时间' ,
`finance_audit`  bigint(11) NULL DEFAULT NULL COMMENT '财务出纳退款时间' ,
`create_time`  datetime NOT NULL COMMENT '创建时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=208

;

-- ----------------------------
-- Table structure for `t_system_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_config`;
CREATE TABLE `t_system_config` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`config_key`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '键值对key' ,
`config_value`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '键值对value' ,
`config_name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '名称' ,
`remark`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_key` (`config_key`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='系统配置表'
AUTO_INCREMENT=36

;

-- ----------------------------
-- Table structure for `t_system_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_log`;
CREATE TABLE `t_system_log` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`log_type`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '日志类型' ,
`log_content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '日志内容' ,
`operator_id`  bigint(8) NULL DEFAULT 0 COMMENT '操作人ID' ,
`operator_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人名称' ,
`create_time`  timestamp(3) NOT NULL DEFAULT 'CURRENT_TIMESTAMP(3)' COMMENT '创建时间' ,
`business_no`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务关联字段' ,
PRIMARY KEY (`id`),
INDEX `idx_business_no` (`business_no`, `log_type`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='系统日志表'
AUTO_INCREMENT=3695511

;

-- ----------------------------
-- Table structure for `t_system_operate_lock`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_operate_lock`;
CREATE TABLE `t_system_operate_lock` (
`id`  bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`insure_num`  bigint(8) NULL DEFAULT 0 COMMENT '投保单号' ,
`business_id`  bigint(8) NULL DEFAULT 0 COMMENT '表主键ID' ,
`operate_table_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名称' ,
`is_lock`  tinyint(1) NULL DEFAULT 0 COMMENT '是否锁定:0未锁定,1锁定' ,
`lock_user_id`  int(11) NULL DEFAULT NULL COMMENT '锁定用户ID' ,
`lock_time`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '锁定时间' ,
`lock_user_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '锁定用户名称' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_id`  int(11) NULL DEFAULT NULL COMMENT '更新人' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_tableIdName` (`business_id`, `operate_table_name`) USING BTREE ,
INDEX `idx_table_id` (`business_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='系统操作锁表'
AUTO_INCREMENT=1289

;

-- ----------------------------
-- Table structure for `t_temp_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `t_temp_attribute`;
CREATE TABLE `t_temp_attribute` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号码' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`type_id`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '属性归属类型(1:投保人2:被保险人3:受益人4:其他设置)' ,
`attr_key`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '属性标识' ,
`attr_value`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '属性值' ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4321737

;

-- ----------------------------
-- Table structure for `t_temp_beneficiary`
-- ----------------------------
DROP TABLE IF EXISTS `t_temp_beneficiary`;
CREATE TABLE `t_temp_beneficiary` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '所属平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '受益人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区名称' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`prov_city_id`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`contact_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`residential_identity`  tinyint(1) NULL DEFAULT NULL COMMENT '税收居民身份: 1 仅为中国税收居民、2 仅为非居民、3 既是中国税收居民又是其他国家（地区）' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`insurant_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '被保险人ID' ,
`insurant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '受益人与被保险人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '受益人与被保险人关系ID' ,
`serial`  tinyint(1) NULL DEFAULT 0 COMMENT '受益序例' ,
`proportion`  int(4) NULL DEFAULT 0 COMMENT '受益比例' ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`auto_id`),
INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `insurant_id` (`insurant_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=14677

;

-- ----------------------------
-- Table structure for `t_temp_insurant`
-- ----------------------------
DROP TABLE IF EXISTS `t_temp_insurant`;
CREATE TABLE `t_temp_insurant` (
`auto_id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '非自增' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NULL DEFAULT 0 COMMENT '来源平台' ,
`cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名' ,
`ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名/拼音' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`birthdate`  date NULL DEFAULT '0000-00-00' COMMENT '出生日期' ,
`sex`  tinyint(1) NULL DEFAULT 1 COMMENT '性别(1男 2女)' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态(1已婚 2未婚 3离婚 4丧偶 5其他)' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年收入' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`property_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地' ,
`property_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财产所在地邮编' ,
`house_type_id`  tinyint(1) NULL DEFAULT 0 COMMENT '房屋类型ID' ,
`house_type_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型名称' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`have_medical`  tinyint(1) NULL DEFAULT 0 COMMENT '是否有医保' ,
`height`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高' ,
`weight`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重' ,
`relation_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保险人与投保人关系名称' ,
`relation_id`  int(4) NULL DEFAULT 0 COMMENT '被保险人与投保人关系ID' ,
`for_who`  int(4) NULL DEFAULT 0 COMMENT '投保人与被保人关系ID 为谁投保' ,
`buy_amount`  int(4) NULL DEFAULT 0 COMMENT '购买份数' ,
`policy_company_num`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司保单号' ,
`guid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'guid' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`auto_id`),
INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `cname` (`cname`) USING BTREE ,
INDEX `idx_card_number` (`card_number`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=243075

;

-- ----------------------------
-- Table structure for `t_temp_insure`
-- ----------------------------
DROP TABLE IF EXISTS `t_temp_insure`;
CREATE TABLE `t_temp_insure` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`platform`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源平台' ,
`product_id`  int(4) NOT NULL DEFAULT 0 COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(4) NOT NULL DEFAULT 0 COMMENT '保障计划ID' ,
`product_plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障计划名称' ,
`snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '产品快照ID' ,
`plan_snapshot_id`  int(4) NULL DEFAULT 0 COMMENT '计划快照ID' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NULL DEFAULT 0 COMMENT '计划运营ID' ,
`isold`  tinyint(1) NULL DEFAULT 0 COMMENT '产品来源系统(1旧 0新)' ,
`category_id`  int(4) NULL DEFAULT 0 COMMENT '产品险种分类ID' ,
`category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种分类名称' ,
`parent_category_id`  int(4) NULL DEFAULT 0 COMMENT '一级分类ID' ,
`parent_category_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称' ,
`company_id`  int(4) NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司名称' ,
`total_num`  int(4) NOT NULL DEFAULT 0 COMMENT '购买份数' ,
`original_single_price`  int(4) NULL DEFAULT 0 COMMENT '原价' ,
`member_single_price`  int(4) NULL DEFAULT 0 COMMENT '会员价' ,
`settlement_price`  int(4) NULL DEFAULT 0 COMMENT '结算价' ,
`buy_single_price`  int(4) NULL DEFAULT 0 COMMENT '支付价' ,
`pay_amount`  int(4) NULL DEFAULT 0 COMMENT '保费' ,
`client_source`  int(4) NULL DEFAULT 0 COMMENT '投保来源' ,
`passport_source`  tinyint(1) NULL DEFAULT 0 COMMENT '用户帐号来源' ,
`passport_id`  bigint(8) NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`isap`  tinyint(1) NULL DEFAULT 0 COMMENT '是否Ap投保  (1ap 0cps)' ,
`jumi_passport_type`  tinyint(1) NULL DEFAULT 1 COMMENT '聚米用户类型(1常规 2聚米卡激活保单 3聚米卡无卡在线购买 4聚米合作商激活保单)' ,
`start_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起保时间' ,
`end_date`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间' ,
`deadline`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险期限' ,
`applicant_cname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`applicant_ename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人英文/拼音' ,
`card_type_id`  int(4) NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型名称' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码' ,
`card_number_cipher`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码密文' ,
`card_period`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`country_id`  int(4) NULL DEFAULT 0 COMMENT '国家ID' ,
`country`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍' ,
`prov_city_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市编码' ,
`prov_city_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住省市' ,
`province_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省编码' ,
`province_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-省名称' ,
`city_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市编码' ,
`city_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-市名称' ,
`area_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区编码' ,
`area_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保地区-地区名称' ,
`yearly_income`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年收入' ,
`marry_state`  tinyint(1) NULL DEFAULT 0 COMMENT '婚姻状态' ,
`job_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业文本' ,
`job_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业信息' ,
`job_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码' ,
`job_level`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级' ,
`home_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址' ,
`home_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址邮编' ,
`contact_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址' ,
`contact_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址邮编' ,
`office_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址' ,
`office_post`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址邮编' ,
`office_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`moblie`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`moblie_cipher`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱' ,
`ip_address`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人IP地址' ,
`insureinsurant_cname`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被保险人名称' ,
`insureinsurant_type`  tinyint(1) NULL DEFAULT 0 COMMENT '被保险人类型' ,
`insure_beneficiary_type`  tinyint(1) NULL DEFAULT 0 COMMENT '受益人类型' ,
`insure_beneficiary_cname`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '受益人名称' ,
`urgency_contact`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人' ,
`urgency_contact_phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话' ,
`need_paper`  tinyint(1) NULL DEFAULT 0 COMMENT '是否需要纸质保单' ,
`send_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纸质保单寄送信息(json格式)' ,
`compensate`  tinyint(1) NULL DEFAULT 0 COMMENT '是否包含拒签补偿' ,
`premium_audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '高保费审核状态' ,
`medical_status`  tinyint(1) NULL DEFAULT 0 COMMENT '体检状态' ,
`audit_status`  tinyint(1) NULL DEFAULT 0 COMMENT '核保状态' ,
`pay_status`  tinyint(1) NULL DEFAULT 0 COMMENT '支付状态' ,
`issue_status`  tinyint(1) NULL DEFAULT 0 COMMENT '出单状态' ,
`effective_status`  tinyint(1) NULL DEFAULT 0 COMMENT '生效状态' ,
`order_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '支付订单号' ,
`payment_type`  tinyint(1) NULL DEFAULT 0 COMMENT '支付方式(1使用序列号支付)' ,
`project_id`  int(4) NULL DEFAULT 0 COMMENT '方案ID' ,
`renewal_status`  tinyint(1) NULL DEFAULT 0 COMMENT '续保状态' ,
`is_allowbuy`  tinyint(1) NULL DEFAULT 0 COMMENT '是否充许购买' ,
`payed_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付完成时间' ,
`old_policy_num`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧保单号' ,
`merge_pay`  tinyint(1) NULL DEFAULT 0 COMMENT '是否合并支付' ,
`dealline_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险期间提示文本' ,
`auto_renewal`  tinyint(1) NULL DEFAULT 0 COMMENT '自动续保' ,
`is_temp`  tinyint(1) NULL DEFAULT 1 COMMENT '暂存单标识' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`is_audit`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '核保标识' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '101' COMMENT '所属经纪公司编码' ,
`mga_flag`  tinyint(1) NULL DEFAULT 0 COMMENT 'MGA标识:0 非MGA单,1 MGA单' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `insure_num` (`insure_num`) USING BTREE ,
INDEX `passport_id_group` (`passport_id`, `create_time`, `start_date`, `end_date`, `applicant_cname`(10)) USING BTREE ,
INDEX `idx_insurance_brokers_code` (`insurance_brokers_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=655098

;

-- ----------------------------
-- Table structure for `t_underwrite_notice_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_underwrite_notice_log`;
CREATE TABLE `t_underwrite_notice_log` (
`id`  bigint(8) NOT NULL AUTO_INCREMENT COMMENT '递增ID' ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`policy_company_num`  varchar(383) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保险公司保单号' ,
`premium`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '承保保费金额' ,
`create_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='承保消息通知（记录拆单消息）'
AUTO_INCREMENT=14851

;

-- ----------------------------
-- Table structure for `test_temp1`
-- ----------------------------
DROP TABLE IF EXISTS `test_temp1`;
CREATE TABLE `test_temp1` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`source_platform`  int(4) NULL DEFAULT 2 COMMENT '来源平台' ,
`target_platform`  int(4) NULL DEFAULT 1 COMMENT '来源平台' ,
`product_platform_id`  int(4) NULL DEFAULT 0 COMMENT '产品运营ID' ,
`plan_platform_id`  int(4) NOT NULL DEFAULT 0 COMMENT '计划运营ID' ,
`passport_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '用户账号ID' ,
`passport_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号名称' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`is_processed`  int(4) NULL DEFAULT 0 COMMENT '0:未处理 1:已处理' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `move_insure_temp_UN` (`insure_num`) USING BTREE ,
INDEX `idx_insure_num` (`insure_num`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='大白数据迁移test临时表'
AUTO_INCREMENT=56749

;

-- ----------------------------
-- Table structure for `tmp_processlist`
-- ----------------------------
DROP TABLE IF EXISTS `tmp_processlist`;
CREATE TABLE `tmp_processlist` (
`ID`  bigint(21) UNSIGNED NOT NULL DEFAULT 0 ,
`USER`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`HOST`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`DB`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`COMMAND`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`TIME`  int(7) NOT NULL DEFAULT 0 ,
`STATE`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`INFO`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Auto increment value for `move_insure_temp`
-- ----------------------------
ALTER TABLE `move_insure_temp` AUTO_INCREMENT=44;

-- ----------------------------
-- Auto increment value for `t_abnormal`
-- ----------------------------
ALTER TABLE `t_abnormal` AUTO_INCREMENT=3301707;

-- ----------------------------
-- Auto increment value for `t_account_price`
-- ----------------------------
ALTER TABLE `t_account_price` AUTO_INCREMENT=358;

-- ----------------------------
-- Auto increment value for `t_account_trade`
-- ----------------------------
ALTER TABLE `t_account_trade` AUTO_INCREMENT=193;

-- ----------------------------
-- Auto increment value for `t_account_worth`
-- ----------------------------
ALTER TABLE `t_account_worth` AUTO_INCREMENT=3546;

-- ----------------------------
-- Auto increment value for `t_actuator_task`
-- ----------------------------
ALTER TABLE `t_actuator_task` AUTO_INCREMENT=159611;

-- ----------------------------
-- Auto increment value for `t_adjust_detail`
-- ----------------------------
ALTER TABLE `t_adjust_detail` AUTO_INCREMENT=6448;

-- ----------------------------
-- Auto increment value for `t_adjust_insurant`
-- ----------------------------
ALTER TABLE `t_adjust_insurant` AUTO_INCREMENT=1454;

-- ----------------------------
-- Auto increment value for `t_adjust_insurant_status`
-- ----------------------------
ALTER TABLE `t_adjust_insurant_status` AUTO_INCREMENT=1254;

-- ----------------------------
-- Auto increment value for `t_adjust_log`
-- ----------------------------
ALTER TABLE `t_adjust_log` AUTO_INCREMENT=1865;

-- ----------------------------
-- Auto increment value for `t_assessment_questionnaire`
-- ----------------------------
ALTER TABLE `t_assessment_questionnaire` AUTO_INCREMENT=9350;

-- ----------------------------
-- Auto increment value for `t_audit_attribute`
-- ----------------------------
ALTER TABLE `t_audit_attribute` AUTO_INCREMENT=40167;

-- ----------------------------
-- Auto increment value for `t_audit_file`
-- ----------------------------
ALTER TABLE `t_audit_file` AUTO_INCREMENT=23845;

-- ----------------------------
-- Auto increment value for `t_audit_info`
-- ----------------------------
ALTER TABLE `t_audit_info` AUTO_INCREMENT=16173;

-- ----------------------------
-- Auto increment value for `t_audit_manual_condition`
-- ----------------------------
ALTER TABLE `t_audit_manual_condition` AUTO_INCREMENT=249;

-- ----------------------------
-- Auto increment value for `t_audit_manual_condition_value`
-- ----------------------------
ALTER TABLE `t_audit_manual_condition_value` AUTO_INCREMENT=452;

-- ----------------------------
-- Auto increment value for `t_audit_manual_deal`
-- ----------------------------
ALTER TABLE `t_audit_manual_deal` AUTO_INCREMENT=9847;

-- ----------------------------
-- Auto increment value for `t_audit_manual_log`
-- ----------------------------
ALTER TABLE `t_audit_manual_log` AUTO_INCREMENT=46274;

-- ----------------------------
-- Auto increment value for `t_audit_manual_rule`
-- ----------------------------
ALTER TABLE `t_audit_manual_rule` AUTO_INCREMENT=20;

-- ----------------------------
-- Auto increment value for `t_audit_manual_rule_deal`
-- ----------------------------
ALTER TABLE `t_audit_manual_rule_deal` AUTO_INCREMENT=82;

-- ----------------------------
-- Auto increment value for `t_audit_pass_temp`
-- ----------------------------
ALTER TABLE `t_audit_pass_temp` AUTO_INCREMENT=1438;

-- ----------------------------
-- Auto increment value for `t_audit_questionnaire`
-- ----------------------------
ALTER TABLE `t_audit_questionnaire` AUTO_INCREMENT=11563;

-- ----------------------------
-- Auto increment value for `t_audit_signature`
-- ----------------------------
ALTER TABLE `t_audit_signature` AUTO_INCREMENT=11;

-- ----------------------------
-- Auto increment value for `t_audit_tag`
-- ----------------------------
ALTER TABLE `t_audit_tag` AUTO_INCREMENT=55;

-- ----------------------------
-- Auto increment value for `t_audit_verify`
-- ----------------------------
ALTER TABLE `t_audit_verify` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_bankwithholding_log`
-- ----------------------------
ALTER TABLE `t_bankwithholding_log` AUTO_INCREMENT=43932;

-- ----------------------------
-- Auto increment value for `t_bi_insure_log`
-- ----------------------------
ALTER TABLE `t_bi_insure_log` AUTO_INCREMENT=46413;

-- ----------------------------
-- Auto increment value for `t_blacklist`
-- ----------------------------
ALTER TABLE `t_blacklist` AUTO_INCREMENT=1956;

-- ----------------------------
-- Auto increment value for `t_blacklist_info`
-- ----------------------------
ALTER TABLE `t_blacklist_info` AUTO_INCREMENT=75;

-- ----------------------------
-- Auto increment value for `t_buycount_common`
-- ----------------------------
ALTER TABLE `t_buycount_common` AUTO_INCREMENT=127;

-- ----------------------------
-- Auto increment value for `t_category_common`
-- ----------------------------
ALTER TABLE `t_category_common` AUTO_INCREMENT=42;

-- ----------------------------
-- Auto increment value for `t_change_reason`
-- ----------------------------
ALTER TABLE `t_change_reason` AUTO_INCREMENT=5768;

-- ----------------------------
-- Auto increment value for `t_cleanout_passport`
-- ----------------------------
ALTER TABLE `t_cleanout_passport` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `t_common_dictionary`
-- ----------------------------
ALTER TABLE `t_common_dictionary` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `t_company_insure`
-- ----------------------------
ALTER TABLE `t_company_insure` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_company_insure_insurant`
-- ----------------------------
ALTER TABLE `t_company_insure_insurant` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_data_center_statistic`
-- ----------------------------
ALTER TABLE `t_data_center_statistic` AUTO_INCREMENT=2251580;

-- ----------------------------
-- Auto increment value for `t_dic_item`
-- ----------------------------
ALTER TABLE `t_dic_item` AUTO_INCREMENT=589;

-- ----------------------------
-- Auto increment value for `t_dic_type`
-- ----------------------------
ALTER TABLE `t_dic_type` AUTO_INCREMENT=14;

-- ----------------------------
-- Auto increment value for `t_economy_rate`
-- ----------------------------
ALTER TABLE `t_economy_rate` AUTO_INCREMENT=357160;

-- ----------------------------
-- Auto increment value for `t_electronic_invoice`
-- ----------------------------
ALTER TABLE `t_electronic_invoice` AUTO_INCREMENT=57268;

-- ----------------------------
-- Auto increment value for `t_ensure_project`
-- ----------------------------
ALTER TABLE `t_ensure_project` AUTO_INCREMENT=36585448;

-- ----------------------------
-- Auto increment value for `t_ensure_project_price`
-- ----------------------------
ALTER TABLE `t_ensure_project_price` AUTO_INCREMENT=24202446;

-- ----------------------------
-- Auto increment value for `t_ensure_project_risk`
-- ----------------------------
ALTER TABLE `t_ensure_project_risk` AUTO_INCREMENT=67538284;

-- ----------------------------
-- Auto increment value for `t_exception_follow_insure`
-- ----------------------------
ALTER TABLE `t_exception_follow_insure` AUTO_INCREMENT=792053;

-- ----------------------------
-- Auto increment value for `t_health_inform`
-- ----------------------------
ALTER TABLE `t_health_inform` AUTO_INCREMENT=6472739;

-- ----------------------------
-- Auto increment value for `t_health_inform_insurant`
-- ----------------------------
ALTER TABLE `t_health_inform_insurant` AUTO_INCREMENT=15224;

-- ----------------------------
-- Auto increment value for `t_highsum_audit`
-- ----------------------------
ALTER TABLE `t_highsum_audit` AUTO_INCREMENT=11622;

-- ----------------------------
-- Auto increment value for `t_highsum_audit_file`
-- ----------------------------
ALTER TABLE `t_highsum_audit_file` AUTO_INCREMENT=182;

-- ----------------------------
-- Auto increment value for `t_highsum_audit_insure`
-- ----------------------------
ALTER TABLE `t_highsum_audit_insure` AUTO_INCREMENT=44883;

-- ----------------------------
-- Auto increment value for `t_highsum_audit_log`
-- ----------------------------
ALTER TABLE `t_highsum_audit_log` AUTO_INCREMENT=6890;

-- ----------------------------
-- Auto increment value for `t_highsum_audit_project`
-- ----------------------------
ALTER TABLE `t_highsum_audit_project` AUTO_INCREMENT=76814;

-- ----------------------------
-- Auto increment value for `t_highsum_common`
-- ----------------------------
ALTER TABLE `t_highsum_common` AUTO_INCREMENT=171;

-- ----------------------------
-- Auto increment value for `t_highsum_whitelist`
-- ----------------------------
ALTER TABLE `t_highsum_whitelist` AUTO_INCREMENT=61;

-- ----------------------------
-- Auto increment value for `t_holiday_date`
-- ----------------------------
ALTER TABLE `t_holiday_date` AUTO_INCREMENT=943;

-- ----------------------------
-- Auto increment value for `t_honeybee_blacklist`
-- ----------------------------
ALTER TABLE `t_honeybee_blacklist` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_honeybee_check`
-- ----------------------------
ALTER TABLE `t_honeybee_check` AUTO_INCREMENT=34;

-- ----------------------------
-- Auto increment value for `t_insurant_card_type_tmp_2024`
-- ----------------------------
ALTER TABLE `t_insurant_card_type_tmp_2024` AUTO_INCREMENT=11;

-- ----------------------------
-- Auto increment value for `t_insurant_price`
-- ----------------------------
ALTER TABLE `t_insurant_price` AUTO_INCREMENT=5526021;

-- ----------------------------
-- Auto increment value for `t_insurant_relation`
-- ----------------------------
ALTER TABLE `t_insurant_relation` AUTO_INCREMENT=39813159;

-- ----------------------------
-- Auto increment value for `t_insurant_restric_gene`
-- ----------------------------
ALTER TABLE `t_insurant_restric_gene` AUTO_INCREMENT=202886;

-- ----------------------------
-- Auto increment value for `t_insurant_state_log`
-- ----------------------------
ALTER TABLE `t_insurant_state_log` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_insure_0`
-- ----------------------------
ALTER TABLE `t_insure_0` AUTO_INCREMENT=8124943;

-- ----------------------------
-- Auto increment value for `t_insure_1`
-- ----------------------------
ALTER TABLE `t_insure_1` AUTO_INCREMENT=3149548;

-- ----------------------------
-- Auto increment value for `t_insure_10`
-- ----------------------------
ALTER TABLE `t_insure_10` AUTO_INCREMENT=253608;

-- ----------------------------
-- Auto increment value for `t_insure_11`
-- ----------------------------
ALTER TABLE `t_insure_11` AUTO_INCREMENT=248413;

-- ----------------------------
-- Auto increment value for `t_insure_12`
-- ----------------------------
ALTER TABLE `t_insure_12` AUTO_INCREMENT=244219;

-- ----------------------------
-- Auto increment value for `t_insure_13`
-- ----------------------------
ALTER TABLE `t_insure_13` AUTO_INCREMENT=241392;

-- ----------------------------
-- Auto increment value for `t_insure_14`
-- ----------------------------
ALTER TABLE `t_insure_14` AUTO_INCREMENT=235901;

-- ----------------------------
-- Auto increment value for `t_insure_15`
-- ----------------------------
ALTER TABLE `t_insure_15` AUTO_INCREMENT=232146;

-- ----------------------------
-- Auto increment value for `t_insure_16`
-- ----------------------------
ALTER TABLE `t_insure_16` AUTO_INCREMENT=229647;

-- ----------------------------
-- Auto increment value for `t_insure_17`
-- ----------------------------
ALTER TABLE `t_insure_17` AUTO_INCREMENT=227914;

-- ----------------------------
-- Auto increment value for `t_insure_18`
-- ----------------------------
ALTER TABLE `t_insure_18` AUTO_INCREMENT=226413;

-- ----------------------------
-- Auto increment value for `t_insure_19`
-- ----------------------------
ALTER TABLE `t_insure_19` AUTO_INCREMENT=226461;

-- ----------------------------
-- Auto increment value for `t_insure_2`
-- ----------------------------
ALTER TABLE `t_insure_2` AUTO_INCREMENT=262934;

-- ----------------------------
-- Auto increment value for `t_insure_20`
-- ----------------------------
ALTER TABLE `t_insure_20` AUTO_INCREMENT=227105;

-- ----------------------------
-- Auto increment value for `t_insure_21`
-- ----------------------------
ALTER TABLE `t_insure_21` AUTO_INCREMENT=228569;

-- ----------------------------
-- Auto increment value for `t_insure_22`
-- ----------------------------
ALTER TABLE `t_insure_22` AUTO_INCREMENT=231176;

-- ----------------------------
-- Auto increment value for `t_insure_23`
-- ----------------------------
ALTER TABLE `t_insure_23` AUTO_INCREMENT=233968;

-- ----------------------------
-- Auto increment value for `t_insure_24`
-- ----------------------------
ALTER TABLE `t_insure_24` AUTO_INCREMENT=237220;

-- ----------------------------
-- Auto increment value for `t_insure_25`
-- ----------------------------
ALTER TABLE `t_insure_25` AUTO_INCREMENT=239905;

-- ----------------------------
-- Auto increment value for `t_insure_26`
-- ----------------------------
ALTER TABLE `t_insure_26` AUTO_INCREMENT=242951;

-- ----------------------------
-- Auto increment value for `t_insure_27`
-- ----------------------------
ALTER TABLE `t_insure_27` AUTO_INCREMENT=246685;

-- ----------------------------
-- Auto increment value for `t_insure_28`
-- ----------------------------
ALTER TABLE `t_insure_28` AUTO_INCREMENT=250707;

-- ----------------------------
-- Auto increment value for `t_insure_29`
-- ----------------------------
ALTER TABLE `t_insure_29` AUTO_INCREMENT=253930;

-- ----------------------------
-- Auto increment value for `t_insure_3`
-- ----------------------------
ALTER TABLE `t_insure_3` AUTO_INCREMENT=265068;

-- ----------------------------
-- Auto increment value for `t_insure_4`
-- ----------------------------
ALTER TABLE `t_insure_4` AUTO_INCREMENT=265950;

-- ----------------------------
-- Auto increment value for `t_insure_5`
-- ----------------------------
ALTER TABLE `t_insure_5` AUTO_INCREMENT=266043;

-- ----------------------------
-- Auto increment value for `t_insure_6`
-- ----------------------------
ALTER TABLE `t_insure_6` AUTO_INCREMENT=264997;

-- ----------------------------
-- Auto increment value for `t_insure_7`
-- ----------------------------
ALTER TABLE `t_insure_7` AUTO_INCREMENT=263584;

-- ----------------------------
-- Auto increment value for `t_insure_8`
-- ----------------------------
ALTER TABLE `t_insure_8` AUTO_INCREMENT=259874;

-- ----------------------------
-- Auto increment value for `t_insure_9`
-- ----------------------------
ALTER TABLE `t_insure_9` AUTO_INCREMENT=256893;

-- ----------------------------
-- Auto increment value for `t_insure_abnormal`
-- ----------------------------
ALTER TABLE `t_insure_abnormal` AUTO_INCREMENT=819;

-- ----------------------------
-- Auto increment value for `t_insure_account`
-- ----------------------------
ALTER TABLE `t_insure_account` AUTO_INCREMENT=154;

-- ----------------------------
-- Auto increment value for `t_insure_adjust`
-- ----------------------------
ALTER TABLE `t_insure_adjust` AUTO_INCREMENT=1459;

-- ----------------------------
-- Auto increment value for `t_insure_api_test`
-- ----------------------------
ALTER TABLE `t_insure_api_test` AUTO_INCREMENT=2217774;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_0`
-- ----------------------------
ALTER TABLE `t_insure_applicant_0` AUTO_INCREMENT=6115;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_1`
-- ----------------------------
ALTER TABLE `t_insure_applicant_1` AUTO_INCREMENT=4516;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_10`
-- ----------------------------
ALTER TABLE `t_insure_applicant_10` AUTO_INCREMENT=5473;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_11`
-- ----------------------------
ALTER TABLE `t_insure_applicant_11` AUTO_INCREMENT=4768;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_12`
-- ----------------------------
ALTER TABLE `t_insure_applicant_12` AUTO_INCREMENT=9508;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_13`
-- ----------------------------
ALTER TABLE `t_insure_applicant_13` AUTO_INCREMENT=6484;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_14`
-- ----------------------------
ALTER TABLE `t_insure_applicant_14` AUTO_INCREMENT=6316;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_15`
-- ----------------------------
ALTER TABLE `t_insure_applicant_15` AUTO_INCREMENT=7985;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_16`
-- ----------------------------
ALTER TABLE `t_insure_applicant_16` AUTO_INCREMENT=4595;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_17`
-- ----------------------------
ALTER TABLE `t_insure_applicant_17` AUTO_INCREMENT=5854;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_18`
-- ----------------------------
ALTER TABLE `t_insure_applicant_18` AUTO_INCREMENT=5800;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_19`
-- ----------------------------
ALTER TABLE `t_insure_applicant_19` AUTO_INCREMENT=2974;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_2`
-- ----------------------------
ALTER TABLE `t_insure_applicant_2` AUTO_INCREMENT=6060;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_20`
-- ----------------------------
ALTER TABLE `t_insure_applicant_20` AUTO_INCREMENT=2794;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_21`
-- ----------------------------
ALTER TABLE `t_insure_applicant_21` AUTO_INCREMENT=3153;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_22`
-- ----------------------------
ALTER TABLE `t_insure_applicant_22` AUTO_INCREMENT=2297;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_23`
-- ----------------------------
ALTER TABLE `t_insure_applicant_23` AUTO_INCREMENT=3183;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_24`
-- ----------------------------
ALTER TABLE `t_insure_applicant_24` AUTO_INCREMENT=3207;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_25`
-- ----------------------------
ALTER TABLE `t_insure_applicant_25` AUTO_INCREMENT=3384;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_26`
-- ----------------------------
ALTER TABLE `t_insure_applicant_26` AUTO_INCREMENT=2427;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_27`
-- ----------------------------
ALTER TABLE `t_insure_applicant_27` AUTO_INCREMENT=4531;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_28`
-- ----------------------------
ALTER TABLE `t_insure_applicant_28` AUTO_INCREMENT=4119;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_29`
-- ----------------------------
ALTER TABLE `t_insure_applicant_29` AUTO_INCREMENT=4405;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_3`
-- ----------------------------
ALTER TABLE `t_insure_applicant_3` AUTO_INCREMENT=4692;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_4`
-- ----------------------------
ALTER TABLE `t_insure_applicant_4` AUTO_INCREMENT=8751;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_5`
-- ----------------------------
ALTER TABLE `t_insure_applicant_5` AUTO_INCREMENT=4665;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_6`
-- ----------------------------
ALTER TABLE `t_insure_applicant_6` AUTO_INCREMENT=7233;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_7`
-- ----------------------------
ALTER TABLE `t_insure_applicant_7` AUTO_INCREMENT=8701;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_8`
-- ----------------------------
ALTER TABLE `t_insure_applicant_8` AUTO_INCREMENT=9166;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_9`
-- ----------------------------
ALTER TABLE `t_insure_applicant_9` AUTO_INCREMENT=8477;

-- ----------------------------
-- Auto increment value for `t_insure_applicant_route`
-- ----------------------------
ALTER TABLE `t_insure_applicant_route` AUTO_INCREMENT=184964;

-- ----------------------------
-- Auto increment value for `t_insure_attribute`
-- ----------------------------
ALTER TABLE `t_insure_attribute` AUTO_INCREMENT=176119801;

-- ----------------------------
-- Auto increment value for `t_insure_attribute_snapshot`
-- ----------------------------
ALTER TABLE `t_insure_attribute_snapshot` AUTO_INCREMENT=1138;

-- ----------------------------
-- Auto increment value for `t_insure_audit`
-- ----------------------------
ALTER TABLE `t_insure_audit` AUTO_INCREMENT=5232016;

-- ----------------------------
-- Auto increment value for `t_insure_audit_log`
-- ----------------------------
ALTER TABLE `t_insure_audit_log` AUTO_INCREMENT=98811;

-- ----------------------------
-- Auto increment value for `t_insure_audit_verify`
-- ----------------------------
ALTER TABLE `t_insure_audit_verify` AUTO_INCREMENT=167873;

-- ----------------------------
-- Auto increment value for `t_insure_beneficiary`
-- ----------------------------
ALTER TABLE `t_insure_beneficiary` AUTO_INCREMENT=74121;

-- ----------------------------
-- Auto increment value for `t_insure_beneficiary_snapshot`
-- ----------------------------
ALTER TABLE `t_insure_beneficiary_snapshot` AUTO_INCREMENT=44;

-- ----------------------------
-- Auto increment value for `t_insure_endorsement`
-- ----------------------------
ALTER TABLE `t_insure_endorsement` AUTO_INCREMENT=351;

-- ----------------------------
-- Auto increment value for `t_insure_endorsement_config`
-- ----------------------------
ALTER TABLE `t_insure_endorsement_config` AUTO_INCREMENT=58;

-- ----------------------------
-- Auto increment value for `t_insure_fee_detail`
-- ----------------------------
ALTER TABLE `t_insure_fee_detail` AUTO_INCREMENT=2028;

-- ----------------------------
-- Auto increment value for `t_insure_feedback`
-- ----------------------------
ALTER TABLE `t_insure_feedback` AUTO_INCREMENT=1336;

-- ----------------------------
-- Auto increment value for `t_insure_file`
-- ----------------------------
ALTER TABLE `t_insure_file` AUTO_INCREMENT=132;

-- ----------------------------
-- Auto increment value for `t_insure_info_audit`
-- ----------------------------
ALTER TABLE `t_insure_info_audit` AUTO_INCREMENT=16179;

-- ----------------------------
-- Auto increment value for `t_insure_insurance_attribute`
-- ----------------------------
ALTER TABLE `t_insure_insurance_attribute` AUTO_INCREMENT=64394;

-- ----------------------------
-- Auto increment value for `t_insure_insurance_audit_result`
-- ----------------------------
ALTER TABLE `t_insure_insurance_audit_result` AUTO_INCREMENT=728;

-- ----------------------------
-- Auto increment value for `t_insure_insurance_relation`
-- ----------------------------
ALTER TABLE `t_insure_insurance_relation` AUTO_INCREMENT=79041;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_0`
-- ----------------------------
ALTER TABLE `t_insure_insurant_0` AUTO_INCREMENT=1031378;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_1`
-- ----------------------------
ALTER TABLE `t_insure_insurant_1` AUTO_INCREMENT=2978898;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_10`
-- ----------------------------
ALTER TABLE `t_insure_insurant_10` AUTO_INCREMENT=879878;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_11`
-- ----------------------------
ALTER TABLE `t_insure_insurant_11` AUTO_INCREMENT=2964869;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_12`
-- ----------------------------
ALTER TABLE `t_insure_insurant_12` AUTO_INCREMENT=856666;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_13`
-- ----------------------------
ALTER TABLE `t_insure_insurant_13` AUTO_INCREMENT=855261;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_14`
-- ----------------------------
ALTER TABLE `t_insure_insurant_14` AUTO_INCREMENT=859329;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_15`
-- ----------------------------
ALTER TABLE `t_insure_insurant_15` AUTO_INCREMENT=869429;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_16`
-- ----------------------------
ALTER TABLE `t_insure_insurant_16` AUTO_INCREMENT=877997;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_17`
-- ----------------------------
ALTER TABLE `t_insure_insurant_17` AUTO_INCREMENT=902173;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_18`
-- ----------------------------
ALTER TABLE `t_insure_insurant_18` AUTO_INCREMENT=911337;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_19`
-- ----------------------------
ALTER TABLE `t_insure_insurant_19` AUTO_INCREMENT=937106;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_2`
-- ----------------------------
ALTER TABLE `t_insure_insurant_2` AUTO_INCREMENT=976804;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_20`
-- ----------------------------
ALTER TABLE `t_insure_insurant_20` AUTO_INCREMENT=977303;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_21`
-- ----------------------------
ALTER TABLE `t_insure_insurant_21` AUTO_INCREMENT=973389;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_22`
-- ----------------------------
ALTER TABLE `t_insure_insurant_22` AUTO_INCREMENT=1002420;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_23`
-- ----------------------------
ALTER TABLE `t_insure_insurant_23` AUTO_INCREMENT=1021450;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_24`
-- ----------------------------
ALTER TABLE `t_insure_insurant_24` AUTO_INCREMENT=1038579;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_25`
-- ----------------------------
ALTER TABLE `t_insure_insurant_25` AUTO_INCREMENT=1048695;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_26`
-- ----------------------------
ALTER TABLE `t_insure_insurant_26` AUTO_INCREMENT=89181761;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_27`
-- ----------------------------
ALTER TABLE `t_insure_insurant_27` AUTO_INCREMENT=1052306;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_28`
-- ----------------------------
ALTER TABLE `t_insure_insurant_28` AUTO_INCREMENT=1053764;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_29`
-- ----------------------------
ALTER TABLE `t_insure_insurant_29` AUTO_INCREMENT=1044831;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_3`
-- ----------------------------
ALTER TABLE `t_insure_insurant_3` AUTO_INCREMENT=965784;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_4`
-- ----------------------------
ALTER TABLE `t_insure_insurant_4` AUTO_INCREMENT=948795;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_5`
-- ----------------------------
ALTER TABLE `t_insure_insurant_5` AUTO_INCREMENT=940369;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_6`
-- ----------------------------
ALTER TABLE `t_insure_insurant_6` AUTO_INCREMENT=921110;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_7`
-- ----------------------------
ALTER TABLE `t_insure_insurant_7` AUTO_INCREMENT=913132;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_8`
-- ----------------------------
ALTER TABLE `t_insure_insurant_8` AUTO_INCREMENT=882092;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_9`
-- ----------------------------
ALTER TABLE `t_insure_insurant_9` AUTO_INCREMENT=875403;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_expand`
-- ----------------------------
ALTER TABLE `t_insure_insurant_expand` AUTO_INCREMENT=3751477;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_risk`
-- ----------------------------
ALTER TABLE `t_insure_insurant_risk` AUTO_INCREMENT=7715901;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_route`
-- ----------------------------
ALTER TABLE `t_insure_insurant_route` AUTO_INCREMENT=89343193;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_route_id_del`
-- ----------------------------
ALTER TABLE `t_insure_insurant_route_id_del` AUTO_INCREMENT=1006908215;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_route_id_update`
-- ----------------------------
ALTER TABLE `t_insure_insurant_route_id_update` AUTO_INCREMENT=2134975915;

-- ----------------------------
-- Auto increment value for `t_insure_insurant_route_snapshot`
-- ----------------------------
ALTER TABLE `t_insure_insurant_route_snapshot` AUTO_INCREMENT=385;

-- ----------------------------
-- Auto increment value for `t_insure_log`
-- ----------------------------
ALTER TABLE `t_insure_log` AUTO_INCREMENT=232141;

-- ----------------------------
-- Auto increment value for `t_insure_relay`
-- ----------------------------
ALTER TABLE `t_insure_relay` AUTO_INCREMENT=4073;

-- ----------------------------
-- Auto increment value for `t_insure_renewal`
-- ----------------------------
ALTER TABLE `t_insure_renewal` AUTO_INCREMENT=24012;

-- ----------------------------
-- Auto increment value for `t_insure_risk_cancel_log`
-- ----------------------------
ALTER TABLE `t_insure_risk_cancel_log` AUTO_INCREMENT=5379;

-- ----------------------------
-- Auto increment value for `t_insure_route`
-- ----------------------------
ALTER TABLE `t_insure_route` AUTO_INCREMENT=102581673;

-- ----------------------------
-- Auto increment value for `t_insure_route_outside`
-- ----------------------------
ALTER TABLE `t_insure_route_outside` AUTO_INCREMENT=102578641;

-- ----------------------------
-- Auto increment value for `t_insure_route_snapshot`
-- ----------------------------
ALTER TABLE `t_insure_route_snapshot` AUTO_INCREMENT=310;

-- ----------------------------
-- Auto increment value for `t_insure_search`
-- ----------------------------
ALTER TABLE `t_insure_search` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_insure_state_log`
-- ----------------------------
ALTER TABLE `t_insure_state_log` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_insure_sub_account`
-- ----------------------------
ALTER TABLE `t_insure_sub_account` AUTO_INCREMENT=283;

-- ----------------------------
-- Auto increment value for `t_insure_task`
-- ----------------------------
ALTER TABLE `t_insure_task` AUTO_INCREMENT=2479162;

-- ----------------------------
-- Auto increment value for `t_insure_type_temp`
-- ----------------------------
ALTER TABLE `t_insure_type_temp` AUTO_INCREMENT=3176;

-- ----------------------------
-- Auto increment value for `t_intercept_risk_log`
-- ----------------------------
ALTER TABLE `t_intercept_risk_log` AUTO_INCREMENT=949;

-- ----------------------------
-- Auto increment value for `t_issue_info`
-- ----------------------------
ALTER TABLE `t_issue_info` AUTO_INCREMENT=68760;

-- ----------------------------
-- Auto increment value for `t_log_insure_index`
-- ----------------------------
ALTER TABLE `t_log_insure_index` AUTO_INCREMENT=2985758;

-- ----------------------------
-- Auto increment value for `t_log_request_index`
-- ----------------------------
ALTER TABLE `t_log_request_index` AUTO_INCREMENT=2984008;

-- ----------------------------
-- Auto increment value for `t_manual_audit_issue`
-- ----------------------------
ALTER TABLE `t_manual_audit_issue` AUTO_INCREMENT=1489;

-- ----------------------------
-- Auto increment value for `t_medical`
-- ----------------------------
ALTER TABLE `t_medical` AUTO_INCREMENT=155;

-- ----------------------------
-- Auto increment value for `t_merge_relation`
-- ----------------------------
ALTER TABLE `t_merge_relation` AUTO_INCREMENT=4290646;

-- ----------------------------
-- Auto increment value for `t_multi_manual_audit`
-- ----------------------------
ALTER TABLE `t_multi_manual_audit` AUTO_INCREMENT=1036;

-- ----------------------------
-- Auto increment value for `t_offline_audit`
-- ----------------------------
ALTER TABLE `t_offline_audit` AUTO_INCREMENT=731;

-- ----------------------------
-- Auto increment value for `t_offline_bank`
-- ----------------------------
ALTER TABLE `t_offline_bank` AUTO_INCREMENT=29752;

-- ----------------------------
-- Auto increment value for `t_offline_beneficiary`
-- ----------------------------
ALTER TABLE `t_offline_beneficiary` AUTO_INCREMENT=924;

-- ----------------------------
-- Auto increment value for `t_offline_beneficiary_snapshot`
-- ----------------------------
ALTER TABLE `t_offline_beneficiary_snapshot` AUTO_INCREMENT=36;

-- ----------------------------
-- Auto increment value for `t_offline_double_record`
-- ----------------------------
ALTER TABLE `t_offline_double_record` AUTO_INCREMENT=1877;

-- ----------------------------
-- Auto increment value for `t_offline_file`
-- ----------------------------
ALTER TABLE `t_offline_file` AUTO_INCREMENT=211931;

-- ----------------------------
-- Auto increment value for `t_offline_insurance_relation`
-- ----------------------------
ALTER TABLE `t_offline_insurance_relation` AUTO_INCREMENT=9555;

-- ----------------------------
-- Auto increment value for `t_offline_insurant`
-- ----------------------------
ALTER TABLE `t_offline_insurant` AUTO_INCREMENT=6386;

-- ----------------------------
-- Auto increment value for `t_offline_insurant_relation`
-- ----------------------------
ALTER TABLE `t_offline_insurant_relation` AUTO_INCREMENT=8149;

-- ----------------------------
-- Auto increment value for `t_offline_insurant_snapshot`
-- ----------------------------
ALTER TABLE `t_offline_insurant_snapshot` AUTO_INCREMENT=65;

-- ----------------------------
-- Auto increment value for `t_offline_insure`
-- ----------------------------
ALTER TABLE `t_offline_insure` AUTO_INCREMENT=5964;

-- ----------------------------
-- Auto increment value for `t_offline_insure_attribute`
-- ----------------------------
ALTER TABLE `t_offline_insure_attribute` AUTO_INCREMENT=5486;

-- ----------------------------
-- Auto increment value for `t_offline_insure_cancel`
-- ----------------------------
ALTER TABLE `t_offline_insure_cancel` AUTO_INCREMENT=1388;

-- ----------------------------
-- Auto increment value for `t_offline_insure_correct`
-- ----------------------------
ALTER TABLE `t_offline_insure_correct` AUTO_INCREMENT=90;

-- ----------------------------
-- Auto increment value for `t_offline_insure_old`
-- ----------------------------
ALTER TABLE `t_offline_insure_old` AUTO_INCREMENT=843;

-- ----------------------------
-- Auto increment value for `t_offline_insure_relation`
-- ----------------------------
ALTER TABLE `t_offline_insure_relation` AUTO_INCREMENT=835;

-- ----------------------------
-- Auto increment value for `t_offline_insure_snapshot`
-- ----------------------------
ALTER TABLE `t_offline_insure_snapshot` AUTO_INCREMENT=47;

-- ----------------------------
-- Auto increment value for `t_offline_insure_task_record`
-- ----------------------------
ALTER TABLE `t_offline_insure_task_record` AUTO_INCREMENT=3697;

-- ----------------------------
-- Auto increment value for `t_offline_letters`
-- ----------------------------
ALTER TABLE `t_offline_letters` AUTO_INCREMENT=601;

-- ----------------------------
-- Auto increment value for `t_offline_policy`
-- ----------------------------
ALTER TABLE `t_offline_policy` AUTO_INCREMENT=4485;

-- ----------------------------
-- Auto increment value for `t_offline_receipt`
-- ----------------------------
ALTER TABLE `t_offline_receipt` AUTO_INCREMENT=3642;

-- ----------------------------
-- Auto increment value for `t_offline_withhold_record`
-- ----------------------------
ALTER TABLE `t_offline_withhold_record` AUTO_INCREMENT=1635;

-- ----------------------------
-- Auto increment value for `t_old_product_branch`
-- ----------------------------
ALTER TABLE `t_old_product_branch` AUTO_INCREMENT=7519;

-- ----------------------------
-- Auto increment value for `t_order_audit_insure`
-- ----------------------------
ALTER TABLE `t_order_audit_insure` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for `t_overdue_detail`
-- ----------------------------
ALTER TABLE `t_overdue_detail` AUTO_INCREMENT=2558954;

-- ----------------------------
-- Auto increment value for `t_overdue_log`
-- ----------------------------
ALTER TABLE `t_overdue_log` AUTO_INCREMENT=26;

-- ----------------------------
-- Auto increment value for `t_plan_map_common`
-- ----------------------------
ALTER TABLE `t_plan_map_common` AUTO_INCREMENT=165;

-- ----------------------------
-- Auto increment value for `t_policy_affiliated`
-- ----------------------------
ALTER TABLE `t_policy_affiliated` AUTO_INCREMENT=3521287;

-- ----------------------------
-- Auto increment value for `t_policy_affiliated_config`
-- ----------------------------
ALTER TABLE `t_policy_affiliated_config` AUTO_INCREMENT=57;

-- ----------------------------
-- Auto increment value for `t_policy_company_file`
-- ----------------------------
ALTER TABLE `t_policy_company_file` AUTO_INCREMENT=3757727;

-- ----------------------------
-- Auto increment value for `t_policy_file_damage`
-- ----------------------------
ALTER TABLE `t_policy_file_damage` AUTO_INCREMENT=29853;

-- ----------------------------
-- Auto increment value for `t_policy_modify_remark`
-- ----------------------------
ALTER TABLE `t_policy_modify_remark` AUTO_INCREMENT=47;

-- ----------------------------
-- Auto increment value for `t_policy_premium_share`
-- ----------------------------
ALTER TABLE `t_policy_premium_share` AUTO_INCREMENT=2961070;

-- ----------------------------
-- Auto increment value for `t_policy_receipt`
-- ----------------------------
ALTER TABLE `t_policy_receipt` AUTO_INCREMENT=34;

-- ----------------------------
-- Auto increment value for `t_policy_state_collect`
-- ----------------------------
ALTER TABLE `t_policy_state_collect` AUTO_INCREMENT=33421;

-- ----------------------------
-- Auto increment value for `t_policy_state_update`
-- ----------------------------
ALTER TABLE `t_policy_state_update` AUTO_INCREMENT=8045;

-- ----------------------------
-- Auto increment value for `t_premium_audit_file`
-- ----------------------------
ALTER TABLE `t_premium_audit_file` AUTO_INCREMENT=141;

-- ----------------------------
-- Auto increment value for `t_premium_audit_log`
-- ----------------------------
ALTER TABLE `t_premium_audit_log` AUTO_INCREMENT=15;

-- ----------------------------
-- Auto increment value for `t_product_whitelist`
-- ----------------------------
ALTER TABLE `t_product_whitelist` AUTO_INCREMENT=5557;

-- ----------------------------
-- Auto increment value for `t_project_common`
-- ----------------------------
ALTER TABLE `t_project_common` AUTO_INCREMENT=631;

-- ----------------------------
-- Auto increment value for `t_reappear_log`
-- ----------------------------
ALTER TABLE `t_reappear_log` AUTO_INCREMENT=3552;

-- ----------------------------
-- Auto increment value for `t_renewal_bill`
-- ----------------------------
ALTER TABLE `t_renewal_bill` AUTO_INCREMENT=26823;

-- ----------------------------
-- Auto increment value for `t_renewal_excel`
-- ----------------------------
ALTER TABLE `t_renewal_excel` AUTO_INCREMENT=133;

-- ----------------------------
-- Auto increment value for `t_renewal_excel_detail`
-- ----------------------------
ALTER TABLE `t_renewal_excel_detail` AUTO_INCREMENT=1020;

-- ----------------------------
-- Auto increment value for `t_renewal_info`
-- ----------------------------
ALTER TABLE `t_renewal_info` AUTO_INCREMENT=13419;

-- ----------------------------
-- Auto increment value for `t_renewal_owner`
-- ----------------------------
ALTER TABLE `t_renewal_owner` AUTO_INCREMENT=2247;

-- ----------------------------
-- Auto increment value for `t_resc_service_info`
-- ----------------------------
ALTER TABLE `t_resc_service_info` AUTO_INCREMENT=256;

-- ----------------------------
-- Auto increment value for `t_reservation_insure`
-- ----------------------------
ALTER TABLE `t_reservation_insure` AUTO_INCREMENT=220;

-- ----------------------------
-- Auto increment value for `t_retreat_rebirth`
-- ----------------------------
ALTER TABLE `t_retreat_rebirth` AUTO_INCREMENT=349;

-- ----------------------------
-- Auto increment value for `t_retreat_record`
-- ----------------------------
ALTER TABLE `t_retreat_record` AUTO_INCREMENT=1065;

-- ----------------------------
-- Auto increment value for `t_risk_notify`
-- ----------------------------
ALTER TABLE `t_risk_notify` AUTO_INCREMENT=146;

-- ----------------------------
-- Auto increment value for `t_saas_insure`
-- ----------------------------
ALTER TABLE `t_saas_insure` AUTO_INCREMENT=2601785;

-- ----------------------------
-- Auto increment value for `t_smart_audit_result`
-- ----------------------------
ALTER TABLE `t_smart_audit_result` AUTO_INCREMENT=114300;

-- ----------------------------
-- Auto increment value for `t_smart_ensure_project`
-- ----------------------------
ALTER TABLE `t_smart_ensure_project` AUTO_INCREMENT=7054598;

-- ----------------------------
-- Auto increment value for `t_spilt_policy`
-- ----------------------------
ALTER TABLE `t_spilt_policy` AUTO_INCREMENT=18466;

-- ----------------------------
-- Auto increment value for `t_statistics_insure`
-- ----------------------------
ALTER TABLE `t_statistics_insure` AUTO_INCREMENT=715;

-- ----------------------------
-- Auto increment value for `t_statistics_issue`
-- ----------------------------
ALTER TABLE `t_statistics_issue` AUTO_INCREMENT=527;

-- ----------------------------
-- Auto increment value for `t_statistics_product`
-- ----------------------------
ALTER TABLE `t_statistics_product` AUTO_INCREMENT=685;

-- ----------------------------
-- Auto increment value for `t_statistics_report`
-- ----------------------------
ALTER TABLE `t_statistics_report` AUTO_INCREMENT=1007;

-- ----------------------------
-- Auto increment value for `t_statistics_retreat`
-- ----------------------------
ALTER TABLE `t_statistics_retreat` AUTO_INCREMENT=208;

-- ----------------------------
-- Auto increment value for `t_system_config`
-- ----------------------------
ALTER TABLE `t_system_config` AUTO_INCREMENT=36;

-- ----------------------------
-- Auto increment value for `t_system_log`
-- ----------------------------
ALTER TABLE `t_system_log` AUTO_INCREMENT=3695511;

-- ----------------------------
-- Auto increment value for `t_system_operate_lock`
-- ----------------------------
ALTER TABLE `t_system_operate_lock` AUTO_INCREMENT=1289;

-- ----------------------------
-- Auto increment value for `t_temp_attribute`
-- ----------------------------
ALTER TABLE `t_temp_attribute` AUTO_INCREMENT=4321737;

-- ----------------------------
-- Auto increment value for `t_temp_beneficiary`
-- ----------------------------
ALTER TABLE `t_temp_beneficiary` AUTO_INCREMENT=14677;

-- ----------------------------
-- Auto increment value for `t_temp_insurant`
-- ----------------------------
ALTER TABLE `t_temp_insurant` AUTO_INCREMENT=243075;

-- ----------------------------
-- Auto increment value for `t_temp_insure`
-- ----------------------------
ALTER TABLE `t_temp_insure` AUTO_INCREMENT=655098;

-- ----------------------------
-- Auto increment value for `t_underwrite_notice_log`
-- ----------------------------
ALTER TABLE `t_underwrite_notice_log` AUTO_INCREMENT=14851;

-- ----------------------------
-- Auto increment value for `test_temp1`
-- ----------------------------
ALTER TABLE `test_temp1` AUTO_INCREMENT=56749;
