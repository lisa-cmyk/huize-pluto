

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `rcs_sy_check_data`
-- ----------------------------
DROP TABLE IF EXISTS `rcs_sy_check_data`;
CREATE TABLE `rcs_sy_check_data` (
`id`  bigint(10) NOT NULL AUTO_INCREMENT COMMENT '主键，自增' ,
`running_id`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务-调度-对接的交易流水号(调度流水号)' ,
`license`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '牌照区分（101 慧择\r\n，103104得同）' ,
`company_id`  int(11) NOT NULL COMMENT '公司id' ,
`product_id`  int(11) NOT NULL COMMENT '产品id' ,
`product_type`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品险种类型编码定义和映射' ,
`risk_type`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '险种类型：person个险；group团意险；car车险；cargo货运险' ,
`reply_queue`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送返回队列名称' ,
`exec_command`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送返回命令' ,
`app_running`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务投保单号(业务投保流水号，投保流水号)' ,
`trans_no`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对接与保险的交易流水号(对接流水号)' ,
`ins_app_no`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司返回的投保单号(投保单号)' ,
`ins_policy_no`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司返回的保单号(保单号)' ,
`data_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '数据时间' ,
`data_content`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据内容' ,
`check_result`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调用商涌校验处理结果 00-处理成功,10-未授权,11-验签失败,12-参数格式校验错误,20-参数校验不合法，具体请看错误信息,30-保险公司代码不合法,31-渠道代码不合法,32-产品代码不合法,40-请求超限,99-系统异常' ,
`risk_control_result`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商涌风控模型审核结果 00-审核通过，可以核保,01-审核不通过，超限额,02-审核不通过，拒保,99-系统错误' ,
`seq_no`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商涌流水号' ,
`action`  int(3) NULL DEFAULT 1 COMMENT '触发动作：1出单，-1撤单' ,
`status`  int(3) NULL DEFAULT 0 COMMENT '状态：0未处理，100处理中，200处理成功，900处理失败' ,
`trans_date`  datetime NOT NULL COMMENT '投保时间' ,
`max_amt`  bigint(20) NULL DEFAULT 0 COMMENT '单位：分，保留小数点后2位' ,
`detail_code`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拒保原因编码00 其他\r\n01 手机号有误\r\n02 证件号有误\r\n04 两要素不一致\r\n05 行为风险拒保\r\n06 医疗风险拒保\r\n07 三要素不一致\r\n10 职业风险拒保\r\n12 两要素查无此人' ,
`detail_reson`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拒保原因描述' ,
`suggestion_desc`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拦截话术' ,
`apply_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人姓名' ,
`apply_certi_code`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人证件号' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标识：0为未删除，1删除' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `rcs_sy_check_data_trans_no_IDX` (`trans_no`) USING BTREE ,
INDEX `idx_app_running` (`app_running`) USING BTREE ,
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_company_id` (`company_id`) USING BTREE ,
INDEX `idx_ins_app_no` (`ins_app_no`) USING BTREE ,
INDEX `ins_policy_no` (`ins_policy_no`) USING BTREE ,
INDEX `create_time` (`create_time`) USING BTREE ,
INDEX `update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商涌风控结果存储'
AUTO_INCREMENT=191527551

;

-- ----------------------------
-- Table structure for `rcs_sy_disease_label`
-- ----------------------------
DROP TABLE IF EXISTS `rcs_sy_disease_label`;
CREATE TABLE `rcs_sy_disease_label` (
`id`  bigint(10) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`disease_name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '疾病名称' ,
`rc_role`  varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色(01 投保人,02 被保人,03 受益人)' ,
`name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名' ,
`certi_code`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号' ,
`trans_no`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '慧择投保单号' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识：0为未删除，1删除' ,
PRIMARY KEY (`id`),
INDEX `rcs_sy_disease_label_trans_no_IDX` (`trans_no`) USING BTREE ,
INDEX `rcs_sy_disease_label_create_time_IDX` (`create_time`) USING BTREE ,
INDEX `rcs_sy_disease_label_update_time_IDX` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商涌医疗标签表'
AUTO_INCREMENT=44

;

-- ----------------------------
-- Table structure for `rcs_sy_risk_control`
-- ----------------------------
DROP TABLE IF EXISTS `rcs_sy_risk_control`;
CREATE TABLE `rcs_sy_risk_control` (
`id`  bigint(10) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`rc_name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '风控评分类型(01 医疗风险等级，02 健康行为风险等级)' ,
`rc_level`  varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '风控评分明细（01 低风险，02 中风险，03 高风险）' ,
`rc_role`  varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色(01 投保人,02 被保人,03 受益人)' ,
`name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名' ,
`certi_code`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号' ,
`trans_no`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '慧择投保单号' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识：0为未删除，1删除' ,
PRIMARY KEY (`id`),
INDEX `rcs_sy_risk_control_trans_no_IDX` (`trans_no`) USING BTREE ,
INDEX `rcs_sy_risk_control_create_time_IDX` (`create_time`) USING BTREE ,
INDEX `rcs_sy_risk_control_update_time_IDX` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商涌风险标签表'
AUTO_INCREMENT=4853

;

-- ----------------------------
-- Table structure for `risk_accept_applicant_info`
-- ----------------------------
DROP TABLE IF EXISTS `risk_accept_applicant_info`;
CREATE TABLE `risk_accept_applicant_info` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`applicant_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '投保人姓名' ,
`applicant_card_type_id`  tinyint(1) NOT NULL COMMENT '投保人证件类型id' ,
`applicant_card_type_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保人证件号码' ,
`applicant_detail_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '投保人详细地址' ,
`applicant_community_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人小区地址' ,
`accept_insurance_date`  datetime NOT NULL COMMENT '承保日期' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_risk_accept_person_info_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_risk_accept_applicant_info_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='承保后从IS回调记录的投保人相关信息，用于做风控地址重复校验'
AUTO_INCREMENT=7372

;

-- ----------------------------
-- Table structure for `risk_accept_insured_info`
-- ----------------------------
DROP TABLE IF EXISTS `risk_accept_insured_info`;
CREATE TABLE `risk_accept_insured_info` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`insured_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '被保人姓名' ,
`insured_card_type_id`  tinyint(1) NOT NULL COMMENT '被保人证件类型id' ,
`insured_card_type_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被保人证件号码' ,
`insured_detail_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被保人详细地址' ,
`insured_community_address`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保人小区地址' ,
`accept_insurance_date`  datetime NOT NULL COMMENT '承保时间' ,
`for_who`  int(4) NOT NULL COMMENT '为谁投保' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_risk_accept_insured_info_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_risk_accept_insured_info_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='承保后从IS回调记录的被保人相关信息，用于做风控地址重复校验'
AUTO_INCREMENT=9410

;

-- ----------------------------
-- Table structure for `risk_applicant_info`
-- ----------------------------
DROP TABLE IF EXISTS `risk_applicant_info`;
CREATE TABLE `risk_applicant_info` (
`id`  bigint(30) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`company_id`  int(10) NOT NULL DEFAULT 0 COMMENT '保险公司id' ,
`applicant_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '被保人姓名' ,
`card_type_id`  int(10) NOT NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '证件号码' ,
`province_code`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '省Code' ,
`city_code`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '市Code' ,
`area_code`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地区Code' ,
`province_name`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '省name' ,
`city_name`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '市name' ,
`area_name`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '区name' ,
`phone_number`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '电话号码' ,
`detail_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详细地址' ,
`pay_time`  datetime NOT NULL COMMENT '支付成功时间' ,
`applicant_email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '投保人邮箱' ,
`insure_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '订单类型- 0：互联网，1：线下单（线下单使用）' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除,0:否1是' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_address` (`province_name`, `city_name`, `area_name`, `detail_address`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='风控投保人信息'
AUTO_INCREMENT=7550

;

-- ----------------------------
-- Table structure for `risk_cache_key_config`
-- ----------------------------
DROP TABLE IF EXISTS `risk_cache_key_config`;
CREATE TABLE `risk_cache_key_config` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`prefix`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'key前缀' ,
`full_key`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '完整key名称' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`marked`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否被标记 0:未标记, 1:已被标记' ,
`marked_time`  datetime NULL DEFAULT NULL COMMENT 'key被标记时间' ,
PRIMARY KEY (`id`),
INDEX `idx_prefix_key` (`prefix`, `full_key`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='风控缓存key配置表'
AUTO_INCREMENT=422657

;

-- ----------------------------
-- Table structure for `risk_cbit_company_relation`
-- ----------------------------
DROP TABLE IF EXISTS `risk_cbit_company_relation`;
CREATE TABLE `risk_cbit_company_relation` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`company_id`  int(11) NOT NULL COMMENT '保险公司id' ,
`company_cn_name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司中文名' ,
`cbit_company_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中保信保险公司编码' ,
`cbit_company_name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中保信保险公司名称' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除,0:否1是' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_company_id` (`company_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='中保信保险公司关联表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `risk_cbit_hz_detail`
-- ----------------------------
DROP TABLE IF EXISTS `risk_cbit_hz_detail`;
CREATE TABLE `risk_cbit_hz_detail` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`result_id`  int(11) NOT NULL DEFAULT 0 COMMENT '评估结果id' ,
`result_status`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '结果返回状态,0:调用正常,1:调用异常状态，2:未知异常' ,
`error_message`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '未知异常的说明' ,
`is_call`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否发起调用，0:使用上次结果,1:新发起调用' ,
`is_risk`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否触发风控,0:未触发，1:已触发' ,
`label_codes`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '触发的风控标签' ,
`risk_label_codes`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '触发的阳性风控标签' ,
`label_names`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '触发的风控标签名称' ,
`risk_label_names`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '触发的阳性风控标签名称' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除,0:否1是' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_result_id` (`result_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='中保信接口慧择评估结果'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `risk_cbit_label`
-- ----------------------------
DROP TABLE IF EXISTS `risk_cbit_label`;
CREATE TABLE `risk_cbit_label` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`scene_id`  int(11) NOT NULL COMMENT '风险场景id' ,
`lab_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名称' ,
`lab_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签编码' ,
`rule_name`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '具体规则' ,
`base_score`  int(10) NOT NULL DEFAULT 0 COMMENT '基础分' ,
`extra_score`  int(10) NOT NULL DEFAULT 0 COMMENT '附加分' ,
`decline_tip`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '拒保提示' ,
`is_hit_decline`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '标签命中是否拒保,0:否 1:是,默认否' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除,0:否1是' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_scene_id_label_code` (`scene_id`, `lab_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='中保信风险场景标签'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `risk_cbit_product_label`
-- ----------------------------
DROP TABLE IF EXISTS `risk_cbit_product_label`;
CREATE TABLE `risk_cbit_product_label` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`product_id`  int(11) NOT NULL COMMENT '产品id' ,
`scene_id`  int(11) NOT NULL COMMENT '场景id' ,
`label_id`  int(11) NOT NULL COMMENT '标签id' ,
`is_hit_decline`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '标签命中是否拒保,0:否 1:是,默认否' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除,0:否1是' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_product_label` (`product_id`, `scene_id`, `label_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品风险标签'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `risk_cbit_product_relation`
-- ----------------------------
DROP TABLE IF EXISTS `risk_cbit_product_relation`;
CREATE TABLE `risk_cbit_product_relation` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`product_id`  int(11) NOT NULL COMMENT '保险公司id' ,
`product_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中保信备案的产品编码' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除,0:否1是' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='中保信保险产品关联表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `risk_cbit_result`
-- ----------------------------
DROP TABLE IF EXISTS `risk_cbit_result`;
CREATE TABLE `risk_cbit_result` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`card_type_id`  int(10) NOT NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '证件号码' ,
`policy_holder_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '被保人姓名' ,
`scene_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '场景编码' ,
`request_content`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数' ,
`response_content`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回结果' ,
`response_status`  tinyint(4) NULL DEFAULT NULL COMMENT '0:未拿到返回结果,1:调用成功,2:调用异常' ,
`ret_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交响应码' ,
`ret_message`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '响应码描述' ,
`error_message`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常信息' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除,0:否1是' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_card_number_type` (`card_number`, `card_type_id`, `update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='中保信风险评分结果'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `risk_cbit_scene`
-- ----------------------------
DROP TABLE IF EXISTS `risk_cbit_scene`;
CREATE TABLE `risk_cbit_scene` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`scene_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '场景名称' ,
`scene_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '场景编码' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除,0:否1是' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_scene_code` (`scene_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='中保信风险场景'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `risk_collection`
-- ----------------------------
DROP TABLE IF EXISTS `risk_collection`;
CREATE TABLE `risk_collection` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`collection_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则集名称' ,
`platform`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标识该规则集属于哪一个接入风控的平台.' ,
`subject_type`  tinyint(4) NOT NULL COMMENT '规则集绑定的主体类型。可标示该规则集可绑定哪一类型的主体，或者是不显示绑定但默认绑定所有。' ,
`collection_status`  tinyint(4) NOT NULL COMMENT '规则集状态。0新建状态; 1更新状态(规则集在修改的时候)。2完成状态。（只有完成态才可以进行数据同步）' ,
`collection_desc`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则集描述' ,
`common_flag`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '公共规则集标识.0-缺省值非公共规则集。1-公共规则集(公共规则集不可以被主体绑定)。' ,
`author`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='规则集。一个独立的规则验证的最小单元。可以包含一个或多个规则'
AUTO_INCREMENT=27

;

-- ----------------------------
-- Table structure for `risk_collection_rule`
-- ----------------------------
DROP TABLE IF EXISTS `risk_collection_rule`;
CREATE TABLE `risk_collection_rule` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`collection_id`  int(11) NOT NULL COMMENT '规则集ID' ,
`rule_id`  int(11) NOT NULL COMMENT '规则ID' ,
`author`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_collection_id` (`collection_id`) USING BTREE ,
INDEX `idx_rule_id` (`rule_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='规则集表与规则的关系表。'
AUTO_INCREMENT=43

;

-- ----------------------------
-- Table structure for `risk_company_address_limit`
-- ----------------------------
DROP TABLE IF EXISTS `risk_company_address_limit`;
CREATE TABLE `risk_company_address_limit` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`company_id`  int(11) NOT NULL COMMENT '公司id' ,
`company_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名称' ,
`max_time`  int(11) NOT NULL DEFAULT 0 COMMENT '次数上限' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除,0:否1是' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_company_id` (`company_id`, `deleted`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='保险公司重复地址校验'
AUTO_INCREMENT=13

;

-- ----------------------------
-- Table structure for `risk_divisor`
-- ----------------------------
DROP TABLE IF EXISTS `risk_divisor`;
CREATE TABLE `risk_divisor` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`divisor_code`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '因子编码' ,
`divisor_name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '因子名称' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_divisor_code` (`divisor_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='因子。若干个因子组成一个规则'
AUTO_INCREMENT=9

;

-- ----------------------------
-- Table structure for `risk_error_log`
-- ----------------------------
DROP TABLE IF EXISTS `risk_error_log`;
CREATE TABLE `risk_error_log` (
`id`  int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`risk_code`  char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '风险码' ,
`risk_message`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '风险码描述' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`platform`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标识该规则集属于哪一个接入风控的平台' ,
`detail`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详细' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='风险结果日志记录表'
AUTO_INCREMENT=28411

;

-- ----------------------------
-- Table structure for `risk_group_blacklist`
-- ----------------------------
DROP TABLE IF EXISTS `risk_group_blacklist`;
CREATE TABLE `risk_group_blacklist` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`company_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司单位名称' ,
`company_type`  smallint(6) NOT NULL COMMENT '公司单位证件类型,1-身份证2-护照3-出生证4-驾照5-港澳通行证6-军官证7-台胞证8-警官证9-港澳台回乡证99-其他101-组织机构代码102-营业执照103-税务登记号104-三证合一' ,
`company_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司单位号、证件号' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识 1:删除;0:未删除' ,
`insurance_id`  bigint(10) UNSIGNED NULL DEFAULT NULL COMMENT '受控保险公司ID-对应保险公司的ID' ,
`insurance_name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '受控保险公司名称-要对哪个保险公司进行投保校验' ,
`trigger_times`  int(4) NOT NULL DEFAULT 0 COMMENT '触发次数' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人名' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人名' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='风控投保单位黑名单'
AUTO_INCREMENT=20

;

-- ----------------------------
-- Table structure for `risk_insure_attr_car`
-- ----------------------------
DROP TABLE IF EXISTS `risk_insure_attr_car`;
CREATE TABLE `risk_insure_attr_car` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`start_time`  datetime NOT NULL COMMENT '投保单开始时间' ,
`end_time`  datetime NOT NULL COMMENT '投保单截止时间' ,
`vld_millis`  bigint(30) UNSIGNED NOT NULL COMMENT '有效期截止' ,
`licence_plate`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车牌号' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_licence_plate` (`licence_plate`) USING BTREE ,
INDEX `idx_vld_millis` (`vld_millis`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保动态属性之车辆表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `risk_insure_attr_house`
-- ----------------------------
DROP TABLE IF EXISTS `risk_insure_attr_house`;
CREATE TABLE `risk_insure_attr_house` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`start_time`  datetime NOT NULL COMMENT '投保单开始时间' ,
`end_time`  datetime NOT NULL COMMENT '投保单截止时间' ,
`vld_millis`  bigint(30) UNSIGNED NOT NULL COMMENT '有效期截止' ,
`house_key`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋地址:property_address_text+property_address_user_info' ,
`property_address`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋表地址属性' ,
`property_address_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省名+市名' ,
`property_address_user_info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋信息' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_house_key` (`house_key`) USING BTREE ,
INDEX `idx_vld_millis` (`vld_millis`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保动态属性之房屋表'
AUTO_INCREMENT=3072

;

-- ----------------------------
-- Table structure for `risk_insure_attr_plane`
-- ----------------------------
DROP TABLE IF EXISTS `risk_insure_attr_plane`;
CREATE TABLE `risk_insure_attr_plane` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`start_time`  datetime NOT NULL COMMENT '投保单开始时间' ,
`end_time`  datetime NOT NULL COMMENT '投保单截止时间' ,
`vld_millis`  bigint(30) UNSIGNED NOT NULL COMMENT '有效期截止' ,
`plane_number`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '航班号' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_plane_number` (`plane_number`) USING BTREE ,
INDEX `idx_vld_millis` (`vld_millis`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保动态属性之航班表'
AUTO_INCREMENT=5302

;

-- ----------------------------
-- Table structure for `risk_insured_data`
-- ----------------------------
DROP TABLE IF EXISTS `risk_insured_data`;
CREATE TABLE `risk_insured_data` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`risk_platform_source`  int(4) NOT NULL DEFAULT 0 COMMENT '风控平台类型:1-商涌风控;2-人保财暖哇风控;3-人保财黑灰名单风控' ,
`name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '风控人员名称' ,
`card_type_id`  int(4) NOT NULL DEFAULT 0 COMMENT '投保人证件类型' ,
`card_number`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '风控人员证件编码' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_name_type_card_number` (`name`, `card_type_id`, `card_number`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='被保人风控数据'
AUTO_INCREMENT=5

;

-- ----------------------------
-- Table structure for `risk_insured_data_detail`
-- ----------------------------
DROP TABLE IF EXISTS `risk_insured_data_detail`;
CREATE TABLE `risk_insured_data_detail` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`license`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '101' COMMENT '牌照 101-慧择，103104-得同' ,
`company_id`  int(11) NOT NULL COMMENT '公司id' ,
`product_id`  int(11) NOT NULL COMMENT '产品id' ,
`trans_no`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保单号' ,
`risk_type`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'person' COMMENT '险种类型：person 个险，group 团险，car 车险，cargo 货运险' ,
`insured_info_id`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被保人信息' ,
`risk_level`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核保风险等级：01 低风险，02 中风险，03 中高风险，04 高风险' ,
`risk_odel`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '风控模型：01 医疗风险等级，02 健康行为风险等级 03 诊断模型，04 电票模型，05 特征模型' ,
`risk_tips`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '风险提示' ,
`investigate_channel_type`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据调查来源：NHC 国家卫⽣健康委员会，NHSA  国家医疗保障局  DRGs  诊断相关分类，STA  国家税务总局' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
PRIMARY KEY (`id`),
INDEX `idx_company_id` (`company_id`) USING BTREE ,
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_trans_no` (`trans_no`) USING BTREE ,
INDEX `idx_insured_info_id` (`insured_info_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='被保人风控数据'
AUTO_INCREMENT=17

;

-- ----------------------------
-- Table structure for `risk_insured_data_disease`
-- ----------------------------
DROP TABLE IF EXISTS `risk_insured_data_disease`;
CREATE TABLE `risk_insured_data_disease` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`trans_no`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保单号' ,
`insured_info_id`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被保人信息' ,
`liability_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '责任险种：C 代表防癌险(Cancer) ，D 代表重疾险(DreadDisease)，L 代表寿险(Life) 险，M 代表医疗险(Medical)，A 代表意外险(Accident)' ,
`risk_level`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核保风险等级：01 低风险，02 中风险，03 中高风险，04 高风险' ,
`diagnosis_responses`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疾病结果' ,
`medical_type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医疗类别:00:门诊;01:住院;99:其他' ,
`clinic_date`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '就诊日期: yyyy-MM-dd' ,
`hospital_name`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医院名称' ,
`visit_amount`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '就诊金额' ,
`department_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '就诊科室' ,
`disease_risk_level`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疾病风险等级：01 低风险，02 中风险，03 中高风险，04 高风险 ' ,
`disease_tag`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疾病标签 ' ,
`disease_name`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疾病名称' ,
`feature_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特征编码' ,
`feature_value`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特征值' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
PRIMARY KEY (`id`),
INDEX `idx_trans_no` (`trans_no`) USING BTREE ,
INDEX `idx_insured_info_id` (`insured_info_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='被保人风控疾病数据'
AUTO_INCREMENT=9

;

-- ----------------------------
-- Table structure for `risk_mobile_verify`
-- ----------------------------
DROP TABLE IF EXISTS `risk_mobile_verify`;
CREATE TABLE `risk_mobile_verify` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '姓名' ,
`card_type_id`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '证件号码' ,
`mobile`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号码' ,
`verify_status`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '验证状态,0:未验证,1:免验证,2:已验证' ,
`white_list_status`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '验证状态,0:非白名单,1:白名单' ,
`description`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明' ,
`deleted`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识 1:删除;0:未删除' ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人名' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人名' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
`is_pay`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '支付状态,0:未支付1:已支付' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_verify` (`card_number`, `mobile`, `card_type_id`, `name`, `deleted`) USING BTREE ,
INDEX `idx_mobile` (`mobile`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='风控手机号验证'
AUTO_INCREMENT=1781596

;

-- ----------------------------
-- Table structure for `risk_mobile_verify_file`
-- ----------------------------
DROP TABLE IF EXISTS `risk_mobile_verify_file`;
CREATE TABLE `risk_mobile_verify_file` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`mobile_verify_id`  bigint(20) UNSIGNED NOT NULL COMMENT '手机号验证id' ,
`file_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称' ,
`file_url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件url' ,
`file_id`  int(11) NOT NULL COMMENT '文件id' ,
PRIMARY KEY (`id`),
INDEX `idx_mobile_verify_id` (`mobile_verify_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='风控投保人手机号的附件'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `risk_mobile_verify_insure_num`
-- ----------------------------
DROP TABLE IF EXISTS `risk_mobile_verify_insure_num`;
CREATE TABLE `risk_mobile_verify_insure_num` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`insure_num`  bigint(30) NOT NULL COMMENT '投保单号' ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '姓名' ,
`card_type_id`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '证件号码' ,
`mobile`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号码' ,
`deleted`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识 1:删除;0:未删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_insure_num` (`insure_num`, `card_number`, `mobile`, `card_type_id`, `name`, `deleted`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='风控手机号-投保单号验证'
AUTO_INCREMENT=19

;

-- ----------------------------
-- Table structure for `risk_mobile_verify_log`
-- ----------------------------
DROP TABLE IF EXISTS `risk_mobile_verify_log`;
CREATE TABLE `risk_mobile_verify_log` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '姓名' ,
`card_type_id`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '证件号码' ,
`mobile`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号码' ,
`product_id`  int(11) NULL DEFAULT NULL COMMENT '产品id' ,
`passport_source`  tinyint(4) NULL DEFAULT NULL COMMENT '来源平台' ,
`passport_id`  bigint(20) NULL DEFAULT NULL COMMENT '会员ID' ,
`description`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_verify` (`card_number`, `mobile`, `card_type_id`, `name`) USING BTREE ,
INDEX `idx_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='风控手机号验证日志'
AUTO_INCREMENT=1749

;

-- ----------------------------
-- Table structure for `risk_mobile_verify_passport`
-- ----------------------------
DROP TABLE IF EXISTS `risk_mobile_verify_passport`;
CREATE TABLE `risk_mobile_verify_passport` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`mobile_verify_id`  bigint(20) UNSIGNED NOT NULL COMMENT '手机号验证id' ,
`passport_source`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '用户帐号来源,1:慧择,2:渠道,3:聚米,4:全部,6:齐欣,7:旅游' ,
`passport_id`  bigint(8) NOT NULL DEFAULT 0 COMMENT '用户账号ID' ,
PRIMARY KEY (`id`),
INDEX `idx_mobile_verify_id` (`mobile_verify_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='风控手机号验证的平台来源'
AUTO_INCREMENT=456

;

-- ----------------------------
-- Table structure for `risk_new_blacklist`
-- ----------------------------
DROP TABLE IF EXISTS `risk_new_blacklist`;
CREATE TABLE `risk_new_blacklist` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`usr_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称' ,
`card_type_id`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`phone_number`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码' ,
`description`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述' ,
`reason`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '黑名单原因' ,
`reason_code`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '黑名单原因编码' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识 1:删除;0:未删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人名' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人名' ,
PRIMARY KEY (`id`),
INDEX `idx_card_number` (`card_number`) USING BTREE ,
INDEX `idx_blacklist_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='新版个人黑名单表'
AUTO_INCREMENT=113228

;

-- ----------------------------
-- Table structure for `risk_new_blacklist_relation`
-- ----------------------------
DROP TABLE IF EXISTS `risk_new_blacklist_relation`;
CREATE TABLE `risk_new_blacklist_relation` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`relation_type`  tinyint(4) NOT NULL COMMENT '黑名单关联类型0:产品id,1:保司id' ,
`relation_id`  int(11) NOT NULL COMMENT '关联id,0为产品id,1为保司id' ,
`blacklist_id`  int(11) NOT NULL COMMENT '黑名单id' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识 1:删除;0:未删除' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人名' ,
PRIMARY KEY (`id`),
INDEX `idx_relation_id` (`relation_id`) USING BTREE ,
INDEX `idx_blacklist_id` (`blacklist_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='新版个人黑名单关联表'
AUTO_INCREMENT=93222

;

-- ----------------------------
-- Table structure for `risk_offline_address_repeat_config`
-- ----------------------------
DROP TABLE IF EXISTS `risk_offline_address_repeat_config`;
CREATE TABLE `risk_offline_address_repeat_config` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`check_target`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '校验对象' ,
`repeat_number`  int(3) NOT NULL DEFAULT 0 COMMENT '重复次数上限' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`operator`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作人' ,
PRIMARY KEY (`id`),
INDEX `idx_risk_offline_address_repeat_config_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='风控系统重复地址上限配置表'
AUTO_INCREMENT=3

;

-- ----------------------------
-- Table structure for `risk_person_blacklist`
-- ----------------------------
DROP TABLE IF EXISTS `risk_person_blacklist`;
CREATE TABLE `risk_person_blacklist` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`usr_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称' ,
`card_type_id`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '证件类型ID' ,
`card_number`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`phone_number`  varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码' ,
`insurance_type`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '险种分类, 0:个险; 1:团意;2:雇主' ,
`is_check_applicant`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '包含投保人' ,
`is_check_insurant`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '包含被保人' ,
`is_check_beneficiary`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '包含受益人' ,
`identifier`  char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '相同用户的唯一标识' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识 1:删除;0:未删除' ,
`relate_id`  int(11) UNSIGNED NULL DEFAULT 0 COMMENT '关联id' ,
`trigger_times`  int(4) NOT NULL DEFAULT 0 COMMENT '触发次数' ,
`data_source`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据来源' ,
`upload_reason`  tinyint(2) NOT NULL COMMENT '上传原因:1.涉嫌伪造单据2.曾因责任定义发生纠纷3.涉嫌冒用他人名义投保4.涉嫌医疗责任骗保5.曾未如实告知6.涉嫌意外责任骗保7.涉嫌旅游责任骗保8.涉嫌航延骗保9.涉嫌高保额骗保10.黑名单校验自动关联添加' ,
`remark`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明' ,
`attachment_name`  varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件名称，多个用|分割' ,
`attachment_url`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '附件Url，多个用英文,分割' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人名' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人名' ,
PRIMARY KEY (`id`),
INDEX `idx_blacklist_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='风控投保个人黑名单表'
AUTO_INCREMENT=436

;

-- ----------------------------
-- Table structure for `risk_person_community_address`
-- ----------------------------
DROP TABLE IF EXISTS `risk_person_community_address`;
CREATE TABLE `risk_person_community_address` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`community_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '小区地址' ,
`accept_insurance_date`  datetime NOT NULL COMMENT '承保时间' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：0否，1是' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_risk_person_community_address_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_risk_person_community_address_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='风控系统新增小区名记录表'
AUTO_INCREMENT=1334

;

-- ----------------------------
-- Table structure for `risk_person_detail_address`
-- ----------------------------
DROP TABLE IF EXISTS `risk_person_detail_address`;
CREATE TABLE `risk_person_detail_address` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`insure_num`  bigint(8) NOT NULL DEFAULT 0 COMMENT '投保单号' ,
`detail_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详细地址' ,
`accept_insurance_date`  datetime NOT NULL COMMENT '承保日期' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：0否，1是' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_risk_person_detailed_address_insure_num` (`insure_num`) USING BTREE ,
INDEX `idx_risk_person_detail_address_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='风控系统新增详细地址记录表'
AUTO_INCREMENT=1568

;

-- ----------------------------
-- Table structure for `risk_resp_code`
-- ----------------------------
DROP TABLE IF EXISTS `risk_resp_code`;
CREATE TABLE `risk_resp_code` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`risk_code`  char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '风险码' ,
`risk_message`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '风险码描述' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_risk_code` (`risk_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='风控返回码字典表'
AUTO_INCREMENT=108

;

-- ----------------------------
-- Table structure for `risk_result_policy`
-- ----------------------------
DROP TABLE IF EXISTS `risk_result_policy`;
CREATE TABLE `risk_result_policy` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`platform`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属平台' ,
`business_type`  tinyint(2) NOT NULL COMMENT '业务类型' ,
`risk_level`  tinyint(2) NOT NULL COMMENT '风险级别' ,
`risk_code`  char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '风险码' ,
`risk_message`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '风险描述' ,
`ch_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保人中文名' ,
`card_type_id`  int(4) NULL DEFAULT NULL COMMENT '被保人卡类型ID' ,
`card_number`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被保人卡号' ,
`buy_amount`  int(8) NULL DEFAULT NULL COMMENT '被保人本单购买份数' ,
`birthdate`  date NULL DEFAULT NULL COMMENT '被保人生日' ,
`policy_no`  bigint(30) NULL DEFAULT NULL COMMENT '投保单号' ,
`parent_category_id`  int(4) NULL DEFAULT NULL COMMENT '险种大类' ,
`category_id`  int(4) NULL DEFAULT NULL COMMENT '险种二级分类' ,
`product_id`  int(4) NULL DEFAULT NULL COMMENT '产品ID' ,
`plan_id`  int(4) NULL DEFAULT NULL COMMENT '计划ID' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保单风险结果表'
AUTO_INCREMENT=155

;

-- ----------------------------
-- Table structure for `risk_rule`
-- ----------------------------
DROP TABLE IF EXISTS `risk_rule`;
CREATE TABLE `risk_rule` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`rule_template_id`  int(11) NOT NULL COMMENT '所属规则模板ID' ,
`risk_code`  char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '风险码.' ,
`risk_level`  tinyint(2) NOT NULL COMMENT '规则的风控级别。默认值继承自规则模板的风控级别，如果有特殊要求，可以自定义与规则模板不同的风控级别。' ,
`rule_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则名称' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_rule_template_id` (`rule_template_id`) USING BTREE ,
INDEX `idx_risk_code` (`risk_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='规则表'
AUTO_INCREMENT=33

;

-- ----------------------------
-- Table structure for `risk_rule_divisor`
-- ----------------------------
DROP TABLE IF EXISTS `risk_rule_divisor`;
CREATE TABLE `risk_rule_divisor` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`rule_id`  int(11) NOT NULL COMMENT '规则ID' ,
`divisor_id`  int(11) NOT NULL COMMENT '因子ID' ,
`divisor_value`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '存储规则对应的因子值' ,
`author`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_rule_id` (`rule_id`) USING BTREE ,
INDEX `idx_divisor_id` (`divisor_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='规则模板与因子关系表。一个规则模板由多个因子组成。规则ID和因子ID组合是唯一的。'
AUTO_INCREMENT=83

;

-- ----------------------------
-- Table structure for `risk_rule_template`
-- ----------------------------
DROP TABLE IF EXISTS `risk_rule_template`;
CREATE TABLE `risk_rule_template` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`rule_code`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则模板编码' ,
`template_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则模板名称' ,
`rule_type`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '规则类型' ,
`common_flag`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '公共规则集标识.0-缺省值非公共规则模板。1-公共规则模板' ,
`platform`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标识该模板属于哪一个接入风控的平台.' ,
`template_status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '规则模板状态：0-新建；1-就绪。只有就绪状态的模板才可以派生出规则。' ,
`allow_multi`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '派生的规则是否允许被同一个规则集绑定多个：0-默认不允许；1-允许。' ,
`risk_level`  tinyint(2) NOT NULL COMMENT '风险级别' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
`remark`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_rule_code` (`rule_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='规则模板,由规则模板可派生出各中实体规则'
AUTO_INCREMENT=10

;

-- ----------------------------
-- Table structure for `risk_subject`
-- ----------------------------
DROP TABLE IF EXISTS `risk_subject`;
CREATE TABLE `risk_subject` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`subject_code`  char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一的主体编码。绑定规则集的KEY值组成。' ,
`subject_type`  tinyint(4) NOT NULL COMMENT '主体类型： 1--险种分类，如categoryId=123 2--产品，如production=654 3--产品计划  4--  9--其它' ,
`subject_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主体名称' ,
`platform`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属平台编码' ,
`author`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_subject_code` (`subject_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='风控主体: 险种类（险种的组合） 产品类（产品的组合）'
AUTO_INCREMENT=22

;

-- ----------------------------
-- Table structure for `risk_subject_bind`
-- ----------------------------
DROP TABLE IF EXISTS `risk_subject_bind`;
CREATE TABLE `risk_subject_bind` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`subject_id`  int(11) NOT NULL COMMENT '主体ID' ,
`bind_id`  int(11) NOT NULL COMMENT '绑定的规则集ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`author`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人' ,
PRIMARY KEY (`id`),
INDEX `idx_subject_id` (`subject_id`) USING BTREE ,
INDEX `idx_bind_id` (`bind_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='主体绑定规则集'
AUTO_INCREMENT=40

;

-- ----------------------------
-- Table structure for `risk_subject_member`
-- ----------------------------
DROP TABLE IF EXISTS `risk_subject_member`;
CREATE TABLE `risk_subject_member` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`subject_type`  tinyint(4) NOT NULL COMMENT '1--险种分类  2--产品  3-- 4-- 9--其它' ,
`member_value`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主体成员值' ,
`member_name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主体成员名称' ,
`author`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_type_value` (`member_value`, `subject_type`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='主体成员：险种 产品 计划'
AUTO_INCREMENT=161

;

-- ----------------------------
-- Table structure for `risk_subject_member_rel`
-- ----------------------------
DROP TABLE IF EXISTS `risk_subject_member_rel`;
CREATE TABLE `risk_subject_member_rel` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`subject_id`  int(11) NOT NULL COMMENT '主体ID' ,
`member_id`  int(11) NOT NULL COMMENT '成员ID' ,
`author`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_subject_id` (`subject_id`) USING BTREE ,
INDEX `idx_member_id` (`member_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='主体成员关系表'
AUTO_INCREMENT=44

;

-- ----------------------------
-- Table structure for `risk_template_divisor`
-- ----------------------------
DROP TABLE IF EXISTS `risk_template_divisor`;
CREATE TABLE `risk_template_divisor` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`rule_template_id`  int(4) NOT NULL COMMENT '规则模板ID' ,
`divisor_id`  int(4) NOT NULL COMMENT '因子ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_rule_template_id` (`rule_template_id`) USING BTREE ,
INDEX `idx_divisor_id` (`divisor_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='规则模板的组成因子'
AUTO_INCREMENT=27

;

-- ----------------------------
-- Table structure for `risk_white_list_highcoverage`
-- ----------------------------
DROP TABLE IF EXISTS `risk_white_list_highcoverage`;
CREATE TABLE `risk_white_list_highcoverage` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`ch_name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中文名-用户名称' ,
`card_type_id`  tinyint(1) NOT NULL COMMENT '卡类型ID(1=身份证 2=护照 3=出生证 4=驾照 5=港澳通行证 6=军官证 7=台胞证 8=警官证 9=港澳台回乡证 99=其他)' ,
`card_number`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码' ,
`birthday`  date NULL DEFAULT NULL COMMENT '出生日期' ,
`mobile_no`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号' ,
`author`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_card_info` (`card_type_id`, `card_number`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='高保额白名单'
AUTO_INCREMENT=28

;

-- ----------------------------
-- Table structure for `risk_white_list_highcoverage_detail`
-- ----------------------------
DROP TABLE IF EXISTS `risk_white_list_highcoverage_detail`;
CREATE TABLE `risk_white_list_highcoverage_detail` (
`id`  int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`limit_id`  int(8) NOT NULL COMMENT '高保额限制ID' ,
`object_value`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对象(主体)值, 一般指ID' ,
`object_name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对象(主体)名称' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='高保额白名单额度详细'
AUTO_INCREMENT=75

;

-- ----------------------------
-- Table structure for `risk_white_list_highcoverage_limit`
-- ----------------------------
DROP TABLE IF EXISTS `risk_white_list_highcoverage_limit`;
CREATE TABLE `risk_white_list_highcoverage_limit` (
`id`  int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`white_list_id`  int(11) NOT NULL COMMENT '所属高保额白名单ID' ,
`limit_name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称' ,
`max_coverage`  int(8) NOT NULL COMMENT '最大额度(元)' ,
`min_coverage`  int(8) NOT NULL COMMENT '最小额度(元)' ,
`subject_type`  tinyint(4) NOT NULL COMMENT '一级/二级险种ID,   产品、 计划等。   沿用风险主体ID' ,
`author`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='高保额白名单额度限制'
AUTO_INCREMENT=68

;

-- ----------------------------
-- Table structure for `t_trial_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_trial_item`;
CREATE TABLE `t_trial_item` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`english_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名' ,
`encoding`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码' ,
`main_risk`  tinyint(2) NULL DEFAULT NULL COMMENT '是否主险 1:是，0：否' ,
`item_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称' ,
`cause`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原因' ,
`result`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结果' ,
`protect_type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '保障类型：1.保险公司，2.慧择' ,
`company_id`  int(10) NULL DEFAULT NULL COMMENT '再保公司-关联保险公司' ,
`company_branch_id`  int(10) NULL DEFAULT NULL COMMENT '再保机构-分支机构' ,
`high_coverage`  tinyint(4) NOT NULL DEFAULT 2 COMMENT '身故高保额限制（是/否） 1:是，2：否' ,
`type_id`  int(10) NOT NULL COMMENT '试算类型' ,
`sort`  int(10) NULL DEFAULT NULL COMMENT '排序' ,
`remark`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_date`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_date`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`icon_hz`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '慧择图片' ,
`icon_jm`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '聚米图片' ,
`icon_ap`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道图片' ,
`img_code`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标代码' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='试算项信息'
AUTO_INCREMENT=678

;

-- ----------------------------
-- Auto increment value for `rcs_sy_check_data`
-- ----------------------------
ALTER TABLE `rcs_sy_check_data` AUTO_INCREMENT=191527551;

-- ----------------------------
-- Auto increment value for `rcs_sy_disease_label`
-- ----------------------------
ALTER TABLE `rcs_sy_disease_label` AUTO_INCREMENT=44;

-- ----------------------------
-- Auto increment value for `rcs_sy_risk_control`
-- ----------------------------
ALTER TABLE `rcs_sy_risk_control` AUTO_INCREMENT=4853;

-- ----------------------------
-- Auto increment value for `risk_accept_applicant_info`
-- ----------------------------
ALTER TABLE `risk_accept_applicant_info` AUTO_INCREMENT=7372;

-- ----------------------------
-- Auto increment value for `risk_accept_insured_info`
-- ----------------------------
ALTER TABLE `risk_accept_insured_info` AUTO_INCREMENT=9410;

-- ----------------------------
-- Auto increment value for `risk_applicant_info`
-- ----------------------------
ALTER TABLE `risk_applicant_info` AUTO_INCREMENT=7550;

-- ----------------------------
-- Auto increment value for `risk_cache_key_config`
-- ----------------------------
ALTER TABLE `risk_cache_key_config` AUTO_INCREMENT=422657;

-- ----------------------------
-- Auto increment value for `risk_cbit_company_relation`
-- ----------------------------
ALTER TABLE `risk_cbit_company_relation` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `risk_cbit_hz_detail`
-- ----------------------------
ALTER TABLE `risk_cbit_hz_detail` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `risk_cbit_label`
-- ----------------------------
ALTER TABLE `risk_cbit_label` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `risk_cbit_product_label`
-- ----------------------------
ALTER TABLE `risk_cbit_product_label` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `risk_cbit_product_relation`
-- ----------------------------
ALTER TABLE `risk_cbit_product_relation` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `risk_cbit_result`
-- ----------------------------
ALTER TABLE `risk_cbit_result` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `risk_cbit_scene`
-- ----------------------------
ALTER TABLE `risk_cbit_scene` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `risk_collection`
-- ----------------------------
ALTER TABLE `risk_collection` AUTO_INCREMENT=27;

-- ----------------------------
-- Auto increment value for `risk_collection_rule`
-- ----------------------------
ALTER TABLE `risk_collection_rule` AUTO_INCREMENT=43;

-- ----------------------------
-- Auto increment value for `risk_company_address_limit`
-- ----------------------------
ALTER TABLE `risk_company_address_limit` AUTO_INCREMENT=13;

-- ----------------------------
-- Auto increment value for `risk_divisor`
-- ----------------------------
ALTER TABLE `risk_divisor` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for `risk_error_log`
-- ----------------------------
ALTER TABLE `risk_error_log` AUTO_INCREMENT=28411;

-- ----------------------------
-- Auto increment value for `risk_group_blacklist`
-- ----------------------------
ALTER TABLE `risk_group_blacklist` AUTO_INCREMENT=20;

-- ----------------------------
-- Auto increment value for `risk_insure_attr_car`
-- ----------------------------
ALTER TABLE `risk_insure_attr_car` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `risk_insure_attr_house`
-- ----------------------------
ALTER TABLE `risk_insure_attr_house` AUTO_INCREMENT=3072;

-- ----------------------------
-- Auto increment value for `risk_insure_attr_plane`
-- ----------------------------
ALTER TABLE `risk_insure_attr_plane` AUTO_INCREMENT=5302;

-- ----------------------------
-- Auto increment value for `risk_insured_data`
-- ----------------------------
ALTER TABLE `risk_insured_data` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for `risk_insured_data_detail`
-- ----------------------------
ALTER TABLE `risk_insured_data_detail` AUTO_INCREMENT=17;

-- ----------------------------
-- Auto increment value for `risk_insured_data_disease`
-- ----------------------------
ALTER TABLE `risk_insured_data_disease` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for `risk_mobile_verify`
-- ----------------------------
ALTER TABLE `risk_mobile_verify` AUTO_INCREMENT=1781596;

-- ----------------------------
-- Auto increment value for `risk_mobile_verify_file`
-- ----------------------------
ALTER TABLE `risk_mobile_verify_file` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `risk_mobile_verify_insure_num`
-- ----------------------------
ALTER TABLE `risk_mobile_verify_insure_num` AUTO_INCREMENT=19;

-- ----------------------------
-- Auto increment value for `risk_mobile_verify_log`
-- ----------------------------
ALTER TABLE `risk_mobile_verify_log` AUTO_INCREMENT=1749;

-- ----------------------------
-- Auto increment value for `risk_mobile_verify_passport`
-- ----------------------------
ALTER TABLE `risk_mobile_verify_passport` AUTO_INCREMENT=456;

-- ----------------------------
-- Auto increment value for `risk_new_blacklist`
-- ----------------------------
ALTER TABLE `risk_new_blacklist` AUTO_INCREMENT=113228;

-- ----------------------------
-- Auto increment value for `risk_new_blacklist_relation`
-- ----------------------------
ALTER TABLE `risk_new_blacklist_relation` AUTO_INCREMENT=93222;

-- ----------------------------
-- Auto increment value for `risk_offline_address_repeat_config`
-- ----------------------------
ALTER TABLE `risk_offline_address_repeat_config` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `risk_person_blacklist`
-- ----------------------------
ALTER TABLE `risk_person_blacklist` AUTO_INCREMENT=436;

-- ----------------------------
-- Auto increment value for `risk_person_community_address`
-- ----------------------------
ALTER TABLE `risk_person_community_address` AUTO_INCREMENT=1334;

-- ----------------------------
-- Auto increment value for `risk_person_detail_address`
-- ----------------------------
ALTER TABLE `risk_person_detail_address` AUTO_INCREMENT=1568;

-- ----------------------------
-- Auto increment value for `risk_resp_code`
-- ----------------------------
ALTER TABLE `risk_resp_code` AUTO_INCREMENT=108;

-- ----------------------------
-- Auto increment value for `risk_result_policy`
-- ----------------------------
ALTER TABLE `risk_result_policy` AUTO_INCREMENT=155;

-- ----------------------------
-- Auto increment value for `risk_rule`
-- ----------------------------
ALTER TABLE `risk_rule` AUTO_INCREMENT=33;

-- ----------------------------
-- Auto increment value for `risk_rule_divisor`
-- ----------------------------
ALTER TABLE `risk_rule_divisor` AUTO_INCREMENT=83;

-- ----------------------------
-- Auto increment value for `risk_rule_template`
-- ----------------------------
ALTER TABLE `risk_rule_template` AUTO_INCREMENT=10;

-- ----------------------------
-- Auto increment value for `risk_subject`
-- ----------------------------
ALTER TABLE `risk_subject` AUTO_INCREMENT=22;

-- ----------------------------
-- Auto increment value for `risk_subject_bind`
-- ----------------------------
ALTER TABLE `risk_subject_bind` AUTO_INCREMENT=40;

-- ----------------------------
-- Auto increment value for `risk_subject_member`
-- ----------------------------
ALTER TABLE `risk_subject_member` AUTO_INCREMENT=161;

-- ----------------------------
-- Auto increment value for `risk_subject_member_rel`
-- ----------------------------
ALTER TABLE `risk_subject_member_rel` AUTO_INCREMENT=44;

-- ----------------------------
-- Auto increment value for `risk_template_divisor`
-- ----------------------------
ALTER TABLE `risk_template_divisor` AUTO_INCREMENT=27;

-- ----------------------------
-- Auto increment value for `risk_white_list_highcoverage`
-- ----------------------------
ALTER TABLE `risk_white_list_highcoverage` AUTO_INCREMENT=28;

-- ----------------------------
-- Auto increment value for `risk_white_list_highcoverage_detail`
-- ----------------------------
ALTER TABLE `risk_white_list_highcoverage_detail` AUTO_INCREMENT=75;

-- ----------------------------
-- Auto increment value for `risk_white_list_highcoverage_limit`
-- ----------------------------
ALTER TABLE `risk_white_list_highcoverage_limit` AUTO_INCREMENT=68;

-- ----------------------------
-- Auto increment value for `t_trial_item`
-- ----------------------------
ALTER TABLE `t_trial_item` AUTO_INCREMENT=678;
