

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_airport_information`
-- ----------------------------
DROP TABLE IF EXISTS `t_airport_information`;
CREATE TABLE `t_airport_information` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`city`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '城市名称' ,
`word_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '编码' ,
`airport_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '机场名称' ,
`first_letter`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首字母' ,
`is_hot`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否热门城市：1是0否' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='城市机场信息表'
AUTO_INCREMENT=217

;

-- ----------------------------
-- Table structure for `t_algorithm_exemption_task`
-- ----------------------------
DROP TABLE IF EXISTS `t_algorithm_exemption_task`;
CREATE TABLE `t_algorithm_exemption_task` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`uuid`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一请求标识' ,
`file_url`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件url' ,
`company_material_id`  int(11) NOT NULL COMMENT '关联的公司条款id' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`receive_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '接收算法回调的时间' ,
`task_state`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态 0=等待算法返回结果 1=成功接收, 2=解析异常' ,
`algorithm_response_data`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '算法解析返回内容' ,
PRIMARY KEY (`id`),
INDEX `idx_uuid` (`uuid`) USING BTREE ,
INDEX `idx_company_material_id` (`company_material_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='算法条款免责'
AUTO_INCREMENT=79

;

-- ----------------------------
-- Table structure for `t_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `t_attribute`;
CREATE TABLE `t_attribute` (
`id`  int(10) NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置名称' ,
`key_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'key' ,
`type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=下拉框,1=日历控件，2=同时出现下拉框和日历控件区间,3=文本框 4=地区控件  5=职业控件 6密码控件 7=文本 8=对话框 9单选框，10复选框，11表格，12富文本' ,
`regex`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '校验的正则表达式' ,
`default_remind`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '默认提醒信息' ,
`error_remind`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出错提醒信息' ,
`policy_edit_type`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保全类型，多个以“,”隔开' ,
`sort`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '排序号' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`extend_restrict`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展约束，比如限制文件上传控件的文件大小、类型和数量' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_key_code` (`key_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保信息属性 基础表'
AUTO_INCREMENT=1109

;

-- ----------------------------
-- Table structure for `t_attribute_module`
-- ----------------------------
DROP TABLE IF EXISTS `t_attribute_module`;
CREATE TABLE `t_attribute_module` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '自动增长主键' ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投保信息名称' ,
`sort`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '排序' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除标识：1是0否' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_user_id`  int(11) NOT NULL COMMENT '最后修改人ID' ,
`update_user_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后修改人名称' ,
`is_default`  tinyint(4) NULL DEFAULT 0 COMMENT '默认，0:否，1：是' ,
`remark`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '属性模块说明' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保信息模块基础表'
AUTO_INCREMENT=208

;

-- ----------------------------
-- Table structure for `t_attribute_module_default`
-- ----------------------------
DROP TABLE IF EXISTS `t_attribute_module_default`;
CREATE TABLE `t_attribute_module_default` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`module_id`  int(11) NOT NULL COMMENT '属性模块id' ,
`attribute_id`  int(11) NOT NULL COMMENT '属性id' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=44

;

-- ----------------------------
-- Table structure for `t_attribute_restrict`
-- ----------------------------
DROP TABLE IF EXISTS `t_attribute_restrict`;
CREATE TABLE `t_attribute_restrict` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束名称' ,
`execute_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行类型：0=满足以下所有条件 1=满足以下任一条件' ,
`type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '约束类型 0=一般约束 1=默认约束' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`tip`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误提示信息' ,
`insure_type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '投保类型 0-投保属性,1-预约投保' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-属性-约束项'
AUTO_INCREMENT=173119

;

-- ----------------------------
-- Table structure for `t_attribute_restrict_execute`
-- ----------------------------
DROP TABLE IF EXISTS `t_attribute_restrict_execute`;
CREATE TABLE `t_attribute_restrict_execute` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`restrict_id`  int(10) NOT NULL COMMENT '约束ID' ,
`module_id`  int(10) NOT NULL COMMENT '模块ID' ,
`attribute_id`  int(10) NOT NULL COMMENT '属性ID' ,
`conditions`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '约束条件：0=大于，1=大于等于，2=小于，3=小于等于，4=不等于，5=等于，6=包含，7=不包含,8=提示,9=隐藏,10=正则与提示' ,
`value`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束值，多个值以逗号分隔' ,
`unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '单位 见t_unit表' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-属性-约束计算'
AUTO_INCREMENT=38088

;

-- ----------------------------
-- Table structure for `t_attribute_restrict_execute_gene`
-- ----------------------------
DROP TABLE IF EXISTS `t_attribute_restrict_execute_gene`;
CREATE TABLE `t_attribute_restrict_execute_gene` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`restrict_id`  int(10) NOT NULL COMMENT '约束ID,关联t_attribute_restrict.id' ,
`plan_id`  int(10) NULL DEFAULT NULL COMMENT '计划ID,关联t_product_plan.id' ,
`trial_gene_id`  int(10) NULL DEFAULT NULL COMMENT '试算因子ID' ,
`premium_sum_id`  int(10) NULL DEFAULT NULL COMMENT '总保费id 组合保费id t_product_trial_item.id' ,
`premium_single_id`  int(10) NULL DEFAULT NULL COMMENT '单个保费id t_product_protect_item.id' ,
`other_type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他类型执行条件,job:职业' ,
`conditions`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '约束条件：0=大于，1=大于等于，2=小于，3=小于等于，4=不等于，5=等于，6=包含，7=不包含' ,
`value`  varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束值，多个值以逗号分隔' ,
`unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '单位 见t_unit表' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-属性-试算因子总保费约束项'
AUTO_INCREMENT=875

;

-- ----------------------------
-- Table structure for `t_attribute_restrict_result`
-- ----------------------------
DROP TABLE IF EXISTS `t_attribute_restrict_result`;
CREATE TABLE `t_attribute_restrict_result` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`restrict_id`  int(10) NOT NULL COMMENT '约束ID' ,
`module_id`  int(10) NOT NULL COMMENT '模块ID' ,
`attribute_id`  int(10) NOT NULL COMMENT '属性ID' ,
`conditions`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '约束条件：0=大于，1=大于等于，2=小于，3=小于等于，4=不等于，5=等于，6=包含，7=不包含，8=提示,9.隐藏,10.正则与提示' ,
`value`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束值' ,
`unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '单位 见t_unit表' ,
`remind`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '正则约束条件验证失败提示' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-属性-约束结果'
AUTO_INCREMENT=185096

;

-- ----------------------------
-- Table structure for `t_attribute_trial_key`
-- ----------------------------
DROP TABLE IF EXISTS `t_attribute_trial_key`;
CREATE TABLE `t_attribute_trial_key` (
`id`  int(10) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`attr_key`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性的key' ,
`gene_key`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试算因子的key' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标志，0：未删除， 1： 已删除' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='属性和试算因子的keycode的映射关系'
AUTO_INCREMENT=3

;

-- ----------------------------
-- Table structure for `t_attribute_value`
-- ----------------------------
DROP TABLE IF EXISTS `t_attribute_value`;
CREATE TABLE `t_attribute_value` (
`id`  int(10) NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`value`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置名称' ,
`control_value`  int(11) NULL DEFAULT NULL COMMENT '控件值' ,
`attribute_id`  int(11) NOT NULL COMMENT '属性ID' ,
`sort`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '排序号' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`is_default`  tinyint(4) NULL DEFAULT 0 COMMENT '是否默认选中0：否，1是' ,
PRIMARY KEY (`id`),
INDEX `idx_attribute_id` (`attribute_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品投保属性值 基础表'
AUTO_INCREMENT=3131

;

-- ----------------------------
-- Table structure for `t_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_rule`;
CREATE TABLE `t_auth_rule` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`auth_rule_name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`plan_id`  int(11) NOT NULL COMMENT '计划ID' ,
`auth_object`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证对象：1投保人，2被保人,3受益人。多值逗号分隔。' ,
`auth_occasion`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '认证节点：1核保前，2核保后' ,
`effective`  int(11) NOT NULL DEFAULT 15 COMMENT '有效期' ,
`auth_type`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证方式 1:OCR识别,2:公安联网核身,3:人证识别（人证比对）,4:人脸识别（公安联网）, 5:签名。 多值逗号分隔。' ,
`auth_type_sign_template`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名模板,当auth_type=5时，需要配置。' ,
`auth_type_sign_template_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名模板,当auth_type=5时，上传后的模板url地址' ,
`auth_type_sign_tip`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名提示，当auth_type=5时，需要配置。' ,
`create_user_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者' ,
`update_user_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
`enabled`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '启用状态 1启用 0未启用' ,
`auth_type_html_sign_template`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'H5签名模板，当auth_type=5时,该字段必填' ,
`unique_template_code`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板唯一编码，当auth_type=5时,该字段必填' ,
`certification_type`  tinyint(4) NULL DEFAULT NULL COMMENT '认证类型 0:实名认证,1:其它认证' ,
`auth_way`  tinyint(4) NULL DEFAULT NULL COMMENT '认证方 0:百度,1:保险公司' ,
`not_id_auth_type`  tinyint(4) NULL DEFAULT NULL COMMENT '非身份证审核方式 0:自动审核通过,1:人工审核' ,
`rule_description`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则描述' ,
`face_protocol`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '人脸识别协议' ,
`pdf_template`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成pdf模板id,当auth_type=9时，需要配置' ,
`pdf_template_address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成pdf模板url,当auth_type=9时，需要配置' ,
`pdf_template_html`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '生成pdf模板html富文本,当auth_type=9时，需要配置' ,
`pdf_template_code`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成pdf模板code,当auth_type=9时，需要配置' ,
`face_protocol_type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '人脸识别协议来源：0-富文本,1-获取公共资料' ,
`public_material_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公共资料编码' ,
`is_template`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否是模板 0-否,1-是' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_plan_id` (`plan_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_template_pid` (`is_template`, `plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='认证规则表'
AUTO_INCREMENT=12563

;

-- ----------------------------
-- Table structure for `t_auth_rule_certificate`
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_rule_certificate`;
CREATE TABLE `t_auth_rule_certificate` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`auth_rule_id`  int(10) NOT NULL COMMENT '认证规则id' ,
`certificate_type`  tinyint(4) NOT NULL COMMENT '证件类型，对应证件类型属性值' ,
`file_count`  tinyint(4) NOT NULL COMMENT '文件数量' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_auth_rule_id` (`auth_rule_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='智能认证支持证件'
AUTO_INCREMENT=42146

;

-- ----------------------------
-- Table structure for `t_auth_rule_certificate_tip`
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_rule_certificate_tip`;
CREATE TABLE `t_auth_rule_certificate_tip` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`auth_rule_certificate_id`  int(10) NOT NULL COMMENT '认证规则支持证件id' ,
`sort`  tinyint(4) NOT NULL COMMENT '文件序号' ,
`tip_content`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提示内容' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_auth_rule_certificate_id` (`auth_rule_certificate_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='智能认证支持证件的提示信息'
AUTO_INCREMENT=76938

;

-- ----------------------------
-- Table structure for `t_auth_rule_execute`
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_rule_execute`;
CREATE TABLE `t_auth_rule_execute` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`auth_rule_id`  int(10) NOT NULL COMMENT '认证规则id' ,
`trial_gene_id`  int(10) NULL DEFAULT NULL COMMENT '试算因子ID' ,
`module_id`  int(10) NULL DEFAULT NULL COMMENT '模块ID' ,
`attribute_id`  int(10) NULL DEFAULT NULL COMMENT '属性ID关联t_attribute的id' ,
`special_variable`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特殊变量key' ,
`execute_conditions`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '约束条件：0=大于，1=大于等于，2=小于，3=小于等于，4=不等于，5=等于，6=包含，7=不包含,8=提示' ,
`execute_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '约束执行类型 0:根据投保属性约束 1:根据试算因子约束，2，特殊变量 默认0' ,
`execute_value`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '约束值，多个值以逗号分隔' ,
`execute_value_text`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '约束值对应的冗余，方便前端显示' ,
`execute_unit`  tinyint(4) NULL DEFAULT 0 COMMENT '单位 见t_unit表' ,
`execute_description`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='认证规则——执行条件约束'
AUTO_INCREMENT=23834

;

-- ----------------------------
-- Table structure for `t_auth_rule_verify`
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_rule_verify`;
CREATE TABLE `t_auth_rule_verify` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`auth_rule_id`  int(10) NOT NULL COMMENT '认证规则id' ,
`trial_gene_id`  int(10) NULL DEFAULT NULL COMMENT '试算因子ID' ,
`module_id`  int(10) NULL DEFAULT NULL COMMENT '模块ID' ,
`attribute_id`  int(10) NULL DEFAULT NULL COMMENT '属性ID关联t_attribute的id' ,
`verify_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关键信息校验类型 0:根据投保属性校验 1:根据试算因子校验 默认0' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='认证规则——关键信息'
AUTO_INCREMENT=49874

;

-- ----------------------------
-- Table structure for `t_c_insurance`
-- ----------------------------
DROP TABLE IF EXISTS `t_c_insurance`;
CREATE TABLE `t_c_insurance` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`insurance_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '险种编码' ,
`insurance_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '险种名称' ,
`is_main`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否主险（0: 附加险，1: 主险)' ,
`main_insurance_id`  int(11) NULL DEFAULT NULL COMMENT '主险险种id (类型为0附加险时不为0，自关联）' ,
`company_id`  int(10) NOT NULL COMMENT '保险公司ID' ,
`is_single_buy`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否可以单独购买(0:否,1:是)' ,
`cm_insurant_date_limit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '保障期限是否与主险一致(0:否,1:是)' ,
`cm_insure_age_limit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '缴费年限是否与主险一致(0:否,1:是)' ,
`cm_payment_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '缴费类型是否与主险一致(0:否,1:是)' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除标志 0 未删除 1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者名称' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者名称' ,
`insurance_type_id`  int(10) UNSIGNED NULL DEFAULT NULL COMMENT '关联险类id' ,
`account_flag`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '账户险标志:0-否,1-是' ,
`group_flag`  tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '团个性质:1-个人,2-团体,99-其他' ,
`insurance_recode`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '险种备案编号' ,
`insurance_period_type`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '90' COMMENT '保期类型,英文逗号分隔:11-长期险定期(年),12-长期险定期(岁),13-长期险定期(两可),14-长期险终身,21-短期险短期,22-短期险极短期,30-主险缴费期,90-未知' ,
PRIMARY KEY (`id`),
INDEX `idx_company_id` (`company_id`) USING BTREE ,
INDEX `idx_insurance_code` (`insurance_code`) USING BTREE ,
INDEX `idx_main_insurance_id` (`main_insurance_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='公共险种表'
AUTO_INCREMENT=22808

;

-- ----------------------------
-- Table structure for `t_c_insurance_benefit`
-- ----------------------------
DROP TABLE IF EXISTS `t_c_insurance_benefit`;
CREATE TABLE `t_c_insurance_benefit` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`insurance_id`  int(11) NOT NULL COMMENT '险种ID ' ,
`beneficiary_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '受益方式 0无，1-法定 2-指定 12-法定和指定 3-配偶 4-父亲 5-母亲' ,
`first_beneficiary_limit`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '第一顺序受益人个数' ,
`second_beneficiary_limit`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '第二顺序受益人个数' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
PRIMARY KEY (`id`),
INDEX `idx_insurance_id` (`insurance_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='文件上传记录表'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `t_c_insurance_duty`
-- ----------------------------
DROP TABLE IF EXISTS `t_c_insurance_duty`;
CREATE TABLE `t_c_insurance_duty` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`co_insurance_id`  int(11) NOT NULL COMMENT '险种id' ,
`item_id`  int(10) NULL DEFAULT NULL COMMENT '试算项ID 对应t_trial_item' ,
`encoding`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试算项编码' ,
`by_name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别名' ,
`remark`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明' ,
`sort_flag`  int(10) NULL DEFAULT 0 COMMENT '排序号' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除标志 0 未删除 1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`optional`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '可选标识 0-可选 1-必选' ,
`main_duty`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否是主要责任 0-否 1-是' ,
PRIMARY KEY (`id`),
INDEX `idx_item_id` (`item_id`) USING BTREE ,
INDEX `idx_co_insurance_id` (`co_insurance_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='险种保障责任表'
AUTO_INCREMENT=966

;

-- ----------------------------
-- Table structure for `t_c_insurance_duty_description`
-- ----------------------------
DROP TABLE IF EXISTS `t_c_insurance_duty_description`;
CREATE TABLE `t_c_insurance_duty_description` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`co_insurance_id`  int(11) NOT NULL ,
`duty_id`  int(11) NOT NULL ,
`name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键词' ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对关键词的描述' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
PRIMARY KEY (`id`),
INDEX `idx_insurance_id` (`co_insurance_id`) USING BTREE ,
INDEX `idx_duty_id` (`duty_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='险种责任关键词注释'
AUTO_INCREMENT=322

;

-- ----------------------------
-- Table structure for `t_c_insurance_gene`
-- ----------------------------
DROP TABLE IF EXISTS `t_c_insurance_gene`;
CREATE TABLE `t_c_insurance_gene` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`co_insurance_id`  int(11) NOT NULL COMMENT '险种id' ,
`trial_gene_id`  int(10) NOT NULL COMMENT '试算因子ID' ,
`dic_ids`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据字典id，多个id之间以半角逗号隔开 地区职业时，该字段无值' ,
`control_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '控件类型：0=表示下拉框,1=日历控件，2=同时出现下拉框和日历控件区间,3=文本输入框 4=地区  5=职业  6文本' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除标志 0 未删除 1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_c_insurance_id` (`co_insurance_id`) USING BTREE ,
INDEX `idx_trial_gene_id` (`trial_gene_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='险种投保规则表'
AUTO_INCREMENT=2467

;

-- ----------------------------
-- Table structure for `t_c_insurance_product_relation`
-- ----------------------------
DROP TABLE IF EXISTS `t_c_insurance_product_relation`;
CREATE TABLE `t_c_insurance_product_relation` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人' ,
`update_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人' ,
`co_insurance_id`  int(11) NOT NULL COMMENT '关联 t_c_insurance 表id' ,
`product_id`  int(11) NOT NULL COMMENT '关联 t_product 表id' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_co_insurance_id` (`co_insurance_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='险种_产品关联表'
AUTO_INCREMENT=188

;

-- ----------------------------
-- Table structure for `t_car_photo_data`
-- ----------------------------
DROP TABLE IF EXISTS `t_car_photo_data`;
CREATE TABLE `t_car_photo_data` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`insure_num`  bigint(8) NOT NULL COMMENT '投保单号' ,
`material_id`  int(10) NULL DEFAULT NULL COMMENT '资料id(包含资料的类型、名称等概要信息)' ,
`type`  int(4) NULL DEFAULT NULL COMMENT '类型 1.行驶证  2.投保人' ,
`file_url`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '上传到对应文件服务器的url地址' ,
`sort`  int(11) NULL DEFAULT NULL COMMENT '排序' ,
`data`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '照片数据' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_id` (`insure_num`) USING BTREE ,
INDEX `idx_material_id` (`material_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保资料上传表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_charge_template`
-- ----------------------------
DROP TABLE IF EXISTS `t_charge_template`;
CREATE TABLE `t_charge_template` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`template_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '扣款模板的模板编码（产品ID-WECHAT_PAY：微信代扣，UNION_PAY：银联代扣，-ALI_PAY：支付宝代扣）' ,
`template_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '扣款模板的模板名称' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='扣款模板'
AUTO_INCREMENT=20

;

-- ----------------------------
-- Table structure for `t_collection_count`
-- ----------------------------
DROP TABLE IF EXISTS `t_collection_count`;
CREATE TABLE `t_collection_count` (
`id`  int(10) NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`company_id`  int(10) NOT NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_branch_id`  int(10) NULL DEFAULT 0 COMMENT '支分机构ID' ,
`company_invoice_full_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保险公司开票全称' ,
`company_taxpayer_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保险公司纳税人识别号' ,
`company_bank_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保险公司开户行' ,
`company_bank_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保险公司银行账号' ,
`company_addr_tel`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保险公司税务地址/电话' ,
`company_invoice_type`  tinyint(4) NOT NULL COMMENT '保险公司发票类型 1专票 2普票 3专票+普票' ,
`company_service`  tinyint(4) NOT NULL COMMENT '保险公司应税服务 1*经纪代理服务*经纪费2*经纪代理服务*服务费3*经纪代理服务*技术服务费4*经纪代理服务*咨询服务费5*鉴证咨询服务*咨询服务6*现代服务*服务费' ,
`hz_invoice_full_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '慧择开票全称' ,
`hz_taxpayer_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '慧择纳税人识别号' ,
`hz_bank_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '慧择开户行' ,
`hz_bank_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '慧择银行账号' ,
`hz_addr_tel`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '慧择税务地址/电话' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_user_id`  int(11) NULL DEFAULT NULL COMMENT '更新者ID' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者名称' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='收款账户'
AUTO_INCREMENT=5

;

-- ----------------------------
-- Table structure for `t_common_variable`
-- ----------------------------
DROP TABLE IF EXISTS `t_common_variable`;
CREATE TABLE `t_common_variable` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`variable_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变量名' ,
`placeholder`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '占位符' ,
`hz_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '慧择渠道变量值' ,
`dt_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '得同渠道变量值' ,
`create_user`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '创建人' ,
`update_user`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '更新人' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_placeholder` (`placeholder`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='公共变量'
AUTO_INCREMENT=43

;

-- ----------------------------
-- Table structure for `t_confirm_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_confirm_item`;
CREATE TABLE `t_confirm_item` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`item_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码' ,
`item_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '确认项名称(标题和勾选图标右侧的文本框)' ,
`link_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接名称 4.14.0版本后不使用该字段' ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容' ,
`deleted`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_user_id`  int(11) NULL DEFAULT NULL COMMENT '更新者ID' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者名称' ,
`confirm_type`  tinyint(2) NULL DEFAULT NULL COMMENT '确认形式，1-弹框确认,2-勾选确认' ,
`apply_page`  tinyint(2) NULL DEFAULT NULL COMMENT '应用页面，1-产品详情页,2-健康告知页,3-填写投保信息页,4-银行卡验证,5-订单核对页' ,
`product_limit`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品限定范围(该字段为空时，表示满足所有产品)' ,
`item_tips`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提示语' ,
`item_buttons`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮' ,
`exclude_product`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品排除，当product_limit为空时，默认应用所有产品，但需要排除此字段内的产品id' ,
PRIMARY KEY (`id`),
INDEX `idx_item_code` (`item_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='确认项'
AUTO_INCREMENT=187

;

-- ----------------------------
-- Table structure for `t_confirm_item_keywords`
-- ----------------------------
DROP TABLE IF EXISTS `t_confirm_item_keywords`;
CREATE TABLE `t_confirm_item_keywords` (
`id`  int(10) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`confirm_item_id`  int(10) NOT NULL COMMENT '关联确认项表主键 t_confirm_item.id' ,
`key_word`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字名称' ,
`key_word_type`  tinyint(2) NOT NULL COMMENT '关键字类型，1-富文本,2-超链接,3-自定义内容' ,
`contents`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关键字内容' ,
`link_id`  int(10) NULL DEFAULT NULL COMMENT '关联超链接表主键 t_link.id' ,
`define_text`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义内容' ,
`item_tips`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提示语' ,
`item_buttons`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮' ,
`sort`  int(11) NOT NULL DEFAULT 0 COMMENT '排序字段' ,
PRIMARY KEY (`id`),
INDEX `idx_confirm_item_id` (`confirm_item_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='确认项关键字'
AUTO_INCREMENT=3927

;

-- ----------------------------
-- Table structure for `t_confirm_item_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_confirm_item_product`;
CREATE TABLE `t_confirm_item_product` (
`id`  int(10) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`confirm_item_id`  int(10) NOT NULL COMMENT '关联确认项表主键 t_confirm_item.id' ,
`product_id`  int(10) NOT NULL COMMENT '关联产品表主键 t_product.id' ,
PRIMARY KEY (`id`),
INDEX `idx_confirm_item_id` (`confirm_item_id`) USING BTREE ,
INDEX `idx_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='确认项产品关联表'
AUTO_INCREMENT=1109

;

-- ----------------------------
-- Table structure for `t_dictionary_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_dictionary_type`;
CREATE TABLE `t_dictionary_type` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典类型名称' ,
`code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典类型code' ,
`description`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典类型描述' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=5

;

-- ----------------------------
-- Table structure for `t_dictionary_value`
-- ----------------------------
DROP TABLE IF EXISTS `t_dictionary_value`;
CREATE TABLE `t_dictionary_value` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据字典值名称' ,
`code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据字典值code' ,
`type_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据字典类型code:关联t_dictionary_type.id' ,
`description`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据字典值描述' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=17

;

-- ----------------------------
-- Table structure for `t_directional_link_restrict`
-- ----------------------------
DROP TABLE IF EXISTS `t_directional_link_restrict`;
CREATE TABLE `t_directional_link_restrict` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`directional_link_id`  int(11) UNSIGNED NOT NULL COMMENT '关联定向链接id: t_product_directional_link.id' ,
`restrict_type`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '约束类型，0-普通,1-快捷约束' ,
`execute_type`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '执行类型：0=满足以下所有条件 1=满足以下任一条件' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_directionalLinkId` (`directional_link_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='定向链接约束'
AUTO_INCREMENT=156

;

-- ----------------------------
-- Table structure for `t_directional_link_restrict_result`
-- ----------------------------
DROP TABLE IF EXISTS `t_directional_link_restrict_result`;
CREATE TABLE `t_directional_link_restrict_result` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`restrict_id`  int(11) UNSIGNED NOT NULL COMMENT '关联约束id' ,
`module_id`  int(11) UNSIGNED NOT NULL COMMENT '关联模块id' ,
`unit`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '单位，参见单位表' ,
`attribute_id`  int(11) NOT NULL COMMENT '关联属性id' ,
`conditions`  tinyint(1) NOT NULL COMMENT '约束条件：0=大于，1=大于等于，2=小于，3=小于等于，4=不等于，5=等于，6=包含，7=不包含，8=提示,9.隐藏' ,
`restrict_value`  varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束内容' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_restrict_id` (`restrict_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='定向链接约束内容'
AUTO_INCREMENT=155

;

-- ----------------------------
-- Table structure for `t_droit`
-- ----------------------------
DROP TABLE IF EXISTS `t_droit`;
CREATE TABLE `t_droit` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`droit_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Ȩ' ,
`description`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Ȩ' ,
`hz_img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`jm_img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ap_img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`update_user_id`  int(11) NOT NULL ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`create_user_id`  int(11) NOT NULL ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
`travel_img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '齐欣旅游图片' ,
PRIMARY KEY (`id`),
INDEX `deleted_name` (`deleted`, `droit_name`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Ȩ'
AUTO_INCREMENT=12

;

-- ----------------------------
-- Table structure for `t_dual_record_tip`
-- ----------------------------
DROP TABLE IF EXISTS `t_dual_record_tip`;
CREATE TABLE `t_dual_record_tip` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`company_id`  int(11) UNSIGNED NOT NULL COMMENT '保险公司' ,
`tip_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '双录提示名称' ,
`tip_content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '双录引导文案' ,
`policy_alias`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司投保单号别名' ,
`qr_code_source`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '二维码获取来源 0-无,1-保司接口获取,2-本地生成' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人' ,
`update_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人' ,
`code_show_type`  tinyint(3) UNSIGNED NULL DEFAULT 2 COMMENT '双录码展示样式，0-无,1-二维码,2-投保单号' ,
PRIMARY KEY (`id`),
INDEX `idx_company_id` (`company_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='双录提示配置'
AUTO_INCREMENT=17

;

-- ----------------------------
-- Table structure for `t_duty_exemption`
-- ----------------------------
DROP TABLE IF EXISTS `t_duty_exemption`;
CREATE TABLE `t_duty_exemption` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`create_user_id`  int(10) NOT NULL DEFAULT 0 COMMENT '创建人ID' ,
`update_user_id`  int(10) NOT NULL DEFAULT 0 COMMENT '更新人ID' ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人名' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人名' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`sort`  int(10) NOT NULL DEFAULT 0 COMMENT '排序' ,
`exemption_title`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题' ,
`exemption_content`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容富文本' ,
`company_material_id`  int(10) NULL DEFAULT NULL COMMENT '关联的条款id' ,
`plan_id`  int(10) NULL DEFAULT NULL COMMENT '关联的计划id' ,
`exemption_type`  int(10) NULL DEFAULT NULL COMMENT '条款责任免除，0=责任免除 1=影响保单效力' ,
`origin_source`  int(10) NULL DEFAULT NULL COMMENT '来源 0=条款 1=投保须知 2=其他' ,
PRIMARY KEY (`id`),
INDEX `idx_company_material_id` (`company_material_id`) USING BTREE ,
INDEX `idx_plan_id` (`plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='责任免除'
AUTO_INCREMENT=1756

;

-- ----------------------------
-- Table structure for `t_dynamic_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_dynamic_config`;
CREATE TABLE `t_dynamic_config` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`key_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号' ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置内容' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_key_code` (`key_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='动态配置'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `t_economy_cost`
-- ----------------------------
DROP TABLE IF EXISTS `t_economy_cost`;
CREATE TABLE `t_economy_cost` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`plan_id`  int(11) NOT NULL DEFAULT 0 COMMENT '计划ID（V1.0.5之后财务配置跟计划走）' ,
`economy_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '经济费类型 0=固定 1=不固定 2=分项 3=关联试算项 4=不固定分项' ,
`is_unfixed_split`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '(作废，通过economy_type是否为4判断)是否存在不固定分项,0:否1:是' ,
`economy_rate`  decimal(18,2) NOT NULL DEFAULT 0.00 COMMENT '经济费比例' ,
`preferential_price`  decimal(18,2) NULL DEFAULT 0.00 COMMENT '(作废)结算优惠率:价格' ,
`preferential_rate`  decimal(18,2) NULL DEFAULT 0.00 COMMENT '结算优惠率:比例' ,
`preferential_account`  int(10) NOT NULL DEFAULT 0 COMMENT '结算账号' ,
`decimal_change`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '用结算优惠率计算结算价时，是否需要遇到小数进位：1是0否 ( 0=四舍五入留2位,1=遇小数进位,2=忽略,3=四舍五入留1位,4=舍去小数)' ,
`member_discount`  decimal(18,2) NULL DEFAULT NULL COMMENT '会员折扣下限' ,
`credit_card_pay`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否支持信用卡支付:0否，1是' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`is_compensate`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否包含拒签补偿：1是0否' ,
`is_economy`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否包含经纪费： 0否1是' ,
`is_technical_service`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否包含技术服务费：0否1是' ,
`technical_service_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '技术服务费类型 0=固定' ,
`technical_service_rate`  decimal(18,2) NOT NULL DEFAULT 0.00 COMMENT '技术服务费比例' ,
`pay_real_name`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否验证投保人支付实名 0否1是' ,
`pay_real_name_age`  int(4) NULL DEFAULT NULL COMMENT '支付实名投保人年龄要求(大于等于)岁' ,
PRIMARY KEY (`id`),
INDEX `pid_index` (`product_id`) USING BTREE ,
INDEX `planId` (`plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-经济费'
AUTO_INCREMENT=13087

;

-- ----------------------------
-- Table structure for `t_economy_cost_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_economy_cost_item`;
CREATE TABLE `t_economy_cost_item` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`cost_id`  int(11) NOT NULL COMMENT '财务配置ID:t_economy_cost.id' ,
`protect_id`  int(11) NULL DEFAULT NULL COMMENT '保障项ID' ,
`economy_rate`  decimal(10,2) NULL DEFAULT NULL COMMENT '经济费率' ,
`economy_type`  tinyint(4) NULL DEFAULT NULL COMMENT '经济费类型,1:佣金、2:佣金提成、3:奖金、4:奖金提成' ,
`item_type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '数据类型：1:分项，2:关联试算项' ,
PRIMARY KEY (`id`),
INDEX `idx_cost` (`cost_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='分项经济费率'
AUTO_INCREMENT=203

;

-- ----------------------------
-- Table structure for `t_economy_restrict`
-- ----------------------------
DROP TABLE IF EXISTS `t_economy_restrict`;
CREATE TABLE `t_economy_restrict` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`economy_cost_id`  int(10) NOT NULL COMMENT '经济费ID' ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束名称' ,
`execute_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行类型：0=满足以下所有条件 1=满足以下任一条件' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='经纪费-约束项'
AUTO_INCREMENT=41154

;

-- ----------------------------
-- Table structure for `t_economy_restrict_default_gene`
-- ----------------------------
DROP TABLE IF EXISTS `t_economy_restrict_default_gene`;
CREATE TABLE `t_economy_restrict_default_gene` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`key_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试算因子key' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='经纪费约束默认试算因子'
AUTO_INCREMENT=7

;

-- ----------------------------
-- Table structure for `t_economy_restrict_execute`
-- ----------------------------
DROP TABLE IF EXISTS `t_economy_restrict_execute`;
CREATE TABLE `t_economy_restrict_execute` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`restrict_id`  int(10) NOT NULL COMMENT '约束ID' ,
`trial_gene_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '试算因子key:来源t_trial_gene' ,
`trial_item_id`  int(10) NULL DEFAULT 0 COMMENT '预留作废：试算项ID 一般是总保费' ,
`variable`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变量: 1=累计月保费 ' ,
`conditions`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '约束条件：0=大于，1=大于等于，2=小于，3=小于等于，4=不等于，5=等于，6=包含，7=不包含' ,
`value`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束值' ,
`unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '单位 见t_unit表' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='经纪费-约束计算'
AUTO_INCREMENT=145809

;

-- ----------------------------
-- Table structure for `t_economy_restrict_result`
-- ----------------------------
DROP TABLE IF EXISTS `t_economy_restrict_result`;
CREATE TABLE `t_economy_restrict_result` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`restrict_id`  int(10) NOT NULL COMMENT '约束ID' ,
`economy_rate`  decimal(18,2) NOT NULL DEFAULT 0.00 COMMENT '经纪费率' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='经纪费-约束结果'
AUTO_INCREMENT=36616

;

-- ----------------------------
-- Table structure for `t_economy_unfixed_split`
-- ----------------------------
DROP TABLE IF EXISTS `t_economy_unfixed_split`;
CREATE TABLE `t_economy_unfixed_split` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`economy_cost_id`  int(10) NOT NULL COMMENT '经济费ID' ,
`unfixed_split_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '不固定分项名称' ,
`execute_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行类型：0=满足以下所有条件 1=满足以下任一条件' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='经纪费-不固定分项'
AUTO_INCREMENT=18017

;

-- ----------------------------
-- Table structure for `t_economy_unfixed_split_execute`
-- ----------------------------
DROP TABLE IF EXISTS `t_economy_unfixed_split_execute`;
CREATE TABLE `t_economy_unfixed_split_execute` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`unfixed_split_id`  int(10) NOT NULL COMMENT '不固定分项id,t_economy_unfixed_split.id' ,
`exe_gene_key`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试算因子key:来源t_trial_gene' ,
`exe_variable`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变量: yearPolicy=保单年度' ,
`exe_condition`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '约束条件：0=大于，1=大于等于，2=小于，3=小于等于，4=不等于，5=等于，6=包含，7=不包含' ,
`exe_value`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束值' ,
`exe_unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '单位 见t_unit表' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='经纪费-不固定分项-执行条件'
AUTO_INCREMENT=54872

;

-- ----------------------------
-- Table structure for `t_economy_unfixed_split_result`
-- ----------------------------
DROP TABLE IF EXISTS `t_economy_unfixed_split_result`;
CREATE TABLE `t_economy_unfixed_split_result` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`unfixed_split_id`  int(10) NOT NULL COMMENT '不固定分项id,t_economy_unfixed_split.id' ,
`protect_id`  int(11) NULL DEFAULT NULL COMMENT '保障项-分项保费ID' ,
`protect_rate`  decimal(18,2) NOT NULL DEFAULT 0.00 COMMENT '分项保费经纪费比例' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='经纪费-不固定分项-分项保费经纪费率'
AUTO_INCREMENT=34270

;

-- ----------------------------
-- Table structure for `t_equity_algorithm_variable`
-- ----------------------------
DROP TABLE IF EXISTS `t_equity_algorithm_variable`;
CREATE TABLE `t_equity_algorithm_variable` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`trial_item_id`  int(10) NOT NULL COMMENT '试算项id,t_product_trial_item主键' ,
`algorithm_id`  int(10) NOT NULL COMMENT '权益算法id' ,
`variable_flag`  varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一标示' ,
`variable_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '变量类型，1：参数变量，2：试算因子变量，3：保费变量，4：费率变量，5：枚举费率表，6：公式' ,
`variable_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量名称' ,
`variable_desc`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量描述' ,
`variable_value`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量值，类型为1时是一个数值，类型为2时是因子的gene_key，类型为3时为单表保费或者保费试算项，类型为4/5时为空，类型为6时为公式' ,
`formula_display`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试算公式展示(供页面展示使用)' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='权益算法变量'
AUTO_INCREMENT=16286

;

-- ----------------------------
-- Table structure for `t_equity_attach_variable`
-- ----------------------------
DROP TABLE IF EXISTS `t_equity_attach_variable`;
CREATE TABLE `t_equity_attach_variable` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`trial_item_id`  int(10) NOT NULL COMMENT '试算项id,t_product_trial_item主键' ,
`algorithm_variable_id`  int(10) NOT NULL COMMENT '变量id，t_equity_algorithm_variable.id' ,
`attach_variable_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '附加变量类型，1：' ,
`attach_variable_flag`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '变量标识' ,
`attach_variable_value`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附加变量名称' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='权益算法附加变量'
AUTO_INCREMENT=153

;

-- ----------------------------
-- Table structure for `t_equity_gene`
-- ----------------------------
DROP TABLE IF EXISTS `t_equity_gene`;
CREATE TABLE `t_equity_gene` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`variable_id`  int(10) NOT NULL COMMENT '权益试算项id,t_equity_algorithm_variable主键' ,
`trial_gene_id`  int(10) NOT NULL COMMENT '试算因子id,t_trial_gene主键' ,
`gene_type`  tinyint(4) NULL DEFAULT 0 COMMENT '因子类型，0:试算因子;1:权益因子;2:其他' ,
`dic_ids`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据字典id，多个id之间以半角逗号隔开' ,
`gene_byname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '别名' ,
`gene_remark`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注' ,
`gene_sort`  tinyint(4) NULL DEFAULT 0 COMMENT '排序' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='权益因子'
AUTO_INCREMENT=37594

;

-- ----------------------------
-- Table structure for `t_equity_import_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_equity_import_config`;
CREATE TABLE `t_equity_import_config` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`equity_gene_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联权益因子id，t_equity_gene.id' ,
`gene_type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '因子类型:0-普通因子,1-费率因子,2-方案因子' ,
`start_row`  int(10) UNSIGNED NOT NULL DEFAULT 2 COMMENT '起始行' ,
`begin_data_column`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT '数据列起始' ,
`end_data_column`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT '数据列截止' ,
`data_type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '数据类型:0-单元数据,1-表头数据' ,
PRIMARY KEY (`id`),
INDEX `idx_equity_gene_id` (`equity_gene_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='权益导入配置'
AUTO_INCREMENT=1231

;

-- ----------------------------
-- Table structure for `t_equity_import_config_mapping`
-- ----------------------------
DROP TABLE IF EXISTS `t_equity_import_config_mapping`;
CREATE TABLE `t_equity_import_config_mapping` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`config_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联配置ID，t_equity_import_config.id' ,
`hz_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '对应慧择系统文本' ,
`mapping_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '映射文本' ,
PRIMARY KEY (`id`),
INDEX `idx_config_id` (`config_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='权益导入配置-映射关系配置'
AUTO_INCREMENT=3482

;

-- ----------------------------
-- Table structure for `t_equity_policy`
-- ----------------------------
DROP TABLE IF EXISTS `t_equity_policy`;
CREATE TABLE `t_equity_policy` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(10) NOT NULL COMMENT '产品计划ID' ,
`equity_policy_type`  tinyint(2) NULL DEFAULT NULL COMMENT '(已作废)保单利益类型  1-年末现金价值 2-身故保险金 3-生存保险金' ,
`equity_policy_alias`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保单利益别名' ,
`calc_type`  tinyint(2) NOT NULL COMMENT '计算方式 1-加总 2-合并' ,
`deleted`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_user_id`  int(11) NULL DEFAULT NULL COMMENT '更新者ID' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者名称' ,
`equity_policy_desc`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保单利益说明' ,
`formula`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公式' ,
`formula_display`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公式页面展示' ,
`trial_item_id`  int(10) NULL DEFAULT NULL COMMENT '关联的试算项id' ,
`decimal_format`  tinyint(4) NOT NULL DEFAULT 13 COMMENT '小数点格式，取值参考格式工具类RStringUtil.formatRes' ,
PRIMARY KEY (`id`),
INDEX `idx_product_plan_id` (`product_plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='保单利益表'
AUTO_INCREMENT=5304

;

-- ----------------------------
-- Table structure for `t_equity_policy_relation`
-- ----------------------------
DROP TABLE IF EXISTS `t_equity_policy_relation`;
CREATE TABLE `t_equity_policy_relation` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`policy_id`  int(10) NOT NULL COMMENT 't_equity_policy.id,保单利益id' ,
`trial_item_id`  int(10) NOT NULL COMMENT '试算项id,t_product_trial_item主键' ,
`equity_alias`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '利益别名' ,
PRIMARY KEY (`id`),
INDEX `idx_policy_id` (`policy_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='保单利益基础权益关联表'
AUTO_INCREMENT=7525

;

-- ----------------------------
-- Table structure for `t_equity_rate_file_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_equity_rate_file_log`;
CREATE TABLE `t_equity_rate_file_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`file_id`  int(11) NOT NULL COMMENT '文件服务器id' ,
`file_url`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件url' ,
`variable_id`  int(11) NOT NULL COMMENT '关联变量id' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`available`  bit(1) NOT NULL COMMENT '可用标识,0=可用,1=不可用。生成快照时只会关联=0的文件' ,
`snapshot_used`  bit(1) NOT NULL COMMENT '是否被快照使用, 0=否 1=是' ,
`import_data_type`  bit(1) NOT NULL COMMENT '导入数据类型 0=横向，1=纵向' ,
PRIMARY KEY (`id`),
INDEX `idx_variable_id` (`variable_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='权益费率文件记录表'
AUTO_INCREMENT=4588

;

-- ----------------------------
-- Table structure for `t_equity_variable_rate`
-- ----------------------------
DROP TABLE IF EXISTS `t_equity_variable_rate`;
CREATE TABLE `t_equity_variable_rate` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`variable_id`  int(10) NOT NULL COMMENT '权益变量id,t_equity_algorithm_variable主键' ,
`gene_key`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权益因子key:按ascii的30作为分隔符' ,
`variable_rate`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '变量费率列表，有保单年度因子时列表有多个值，无保单年度因子时列表只有一个值' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_variable_id_gene_key` (`variable_id`, `gene_key`(255)) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='权益变量费率表'
AUTO_INCREMENT=46119237

;

-- ----------------------------
-- Table structure for `t_exemption_exclude`
-- ----------------------------
DROP TABLE IF EXISTS `t_exemption_exclude`;
CREATE TABLE `t_exemption_exclude` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`plan_id`  int(10) NOT NULL COMMENT '关联计划ID' ,
`exemption_id`  int(10) NOT NULL COMMENT '排除的条款id' ,
PRIMARY KEY (`id`),
INDEX `idx_planId_exemptionId` (`plan_id`, `exemption_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='条款免责排除'
AUTO_INCREMENT=13

;

-- ----------------------------
-- Table structure for `t_explain`
-- ----------------------------
DROP TABLE IF EXISTS `t_explain`;
CREATE TABLE `t_explain` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`explain_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注释词语的名称' ,
`explain_byname`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '别名' ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_user_id`  int(11) NULL DEFAULT NULL COMMENT '更新者' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
PRIMARY KEY (`id`),
INDEX `name` (`explain_name`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='名称注释'
AUTO_INCREMENT=32

;

-- ----------------------------
-- Table structure for `t_express`
-- ----------------------------
DROP TABLE IF EXISTS `t_express`;
CREATE TABLE `t_express` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`express_name`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递公司名称' ,
`express_code`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递公司编码' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='快递公司表'
AUTO_INCREMENT=209

;

-- ----------------------------
-- Table structure for `t_extend_attr_change_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_extend_attr_change_log`;
CREATE TABLE `t_extend_attr_change_log` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(11) UNSIGNED NOT NULL COMMENT '关联产品id' ,
`keycode`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性keycode' ,
`attr_value`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值' ,
`opt_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_productId` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='扩展属性重要字段变更记录，提数使用'
AUTO_INCREMENT=1211

;

-- ----------------------------
-- Table structure for `t_extend_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `t_extend_attribute`;
CREATE TABLE `t_extend_attribute` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`belong_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '属性属于产品或计划(0:产品,1:计划)' ,
`object_id`  int(10) NOT NULL DEFAULT 0 COMMENT '扩展属性类型id' ,
`attribute_id`  int(10) NOT NULL DEFAULT 0 COMMENT '属性id(t_attribute.id)' ,
`data_source`  int(10) NOT NULL DEFAULT 0 COMMENT '属性数据来源(0:属性值,非0:特殊算法id)' ,
`has_relation`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '有无关联内容(0:无,1:有)' ,
`required`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '选填/必填(0:选填,1:必填)' ,
`default_value`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '默认值' ,
`remark`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置说明' ,
`sort`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '排序' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_ex_attr_obj_id` (`object_id`) USING BTREE ,
INDEX `idx_attribute_id` (`attribute_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='扩展属性'
AUTO_INCREMENT=29834

;

-- ----------------------------
-- Table structure for `t_extend_attribute_algorithm`
-- ----------------------------
DROP TABLE IF EXISTS `t_extend_attribute_algorithm`;
CREATE TABLE `t_extend_attribute_algorithm` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`algorithm_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '算法名称' ,
`class_path`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '算法类路径' ,
`algorithm_bean_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '算法bean名称' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='扩展属性数据来源算法'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_extend_attribute_default`
-- ----------------------------
DROP TABLE IF EXISTS `t_extend_attribute_default`;
CREATE TABLE `t_extend_attribute_default` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`belong_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '属性属于产品或计划(0:产品,1:计划)' ,
`module_id`  int(10) NOT NULL DEFAULT 0 COMMENT '扩展属性模块id,t_extend_attribute_module.id' ,
`attribute_id`  int(10) NOT NULL DEFAULT 0 COMMENT '属性id(t_attribute.id)' ,
`data_source`  int(10) NOT NULL DEFAULT 0 COMMENT '属性数据来源(0:属性值,非0:特殊算法id)' ,
`has_relation`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '有无关联内容(0:无,1:有)' ,
`required`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '选填/必填(0:选填,1:必填)' ,
`default_value`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '默认值' ,
`remark`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置说明' ,
`sort`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '排序' ,
PRIMARY KEY (`id`),
INDEX `idx_exam_id` (`module_id`) USING BTREE ,
INDEX `idx_attribute_id` (`attribute_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='扩展属性模块的默认属性'
AUTO_INCREMENT=198

;

-- ----------------------------
-- Table structure for `t_extend_attribute_module`
-- ----------------------------
DROP TABLE IF EXISTS `t_extend_attribute_module`;
CREATE TABLE `t_extend_attribute_module` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`module_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块名称' ,
`key_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块keyCode' ,
`description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块描述' ,
`update_user_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='扩展属性模块'
AUTO_INCREMENT=91

;

-- ----------------------------
-- Table structure for `t_extend_attribute_object`
-- ----------------------------
DROP TABLE IF EXISTS `t_extend_attribute_object`;
CREATE TABLE `t_extend_attribute_object` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`sub_id`  int(10) NOT NULL COMMENT '扩展属性组别id,t_extend_attribute_subject.id' ,
`module_id`  int(10) NOT NULL DEFAULT 0 COMMENT '模块id,t_extend_attribute_module.id' ,
`object_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称' ,
`remark`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置说明' ,
`sort`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '排序' ,
`extend_1`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展字段' ,
`extend_2`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展字段' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_ex_attr_sub_id` (`sub_id`) USING BTREE ,
INDEX `idx_module_id` (`module_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='扩展属性类型'
AUTO_INCREMENT=5770

;

-- ----------------------------
-- Table structure for `t_extend_attribute_plan`
-- ----------------------------
DROP TABLE IF EXISTS `t_extend_attribute_plan`;
CREATE TABLE `t_extend_attribute_plan` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`product_id`  int(10) NOT NULL COMMENT '产品id' ,
`plan_id`  int(10) NOT NULL COMMENT '计划id' ,
`extend_attr_id`  int(10) NOT NULL COMMENT '扩展属性id(t_extend_attribute.id)' ,
`attribute_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '基础属性类型' ,
`attribute_value`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '属性值' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_plan_id` (`plan_id`) USING BTREE ,
INDEX `idx_extend_attr_id` (`extend_attr_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='计划扩展属性'
AUTO_INCREMENT=106303

;

-- ----------------------------
-- Table structure for `t_extend_attribute_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_extend_attribute_product`;
CREATE TABLE `t_extend_attribute_product` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`product_id`  int(10) NOT NULL COMMENT '产品id' ,
`extend_attr_id`  int(10) NOT NULL COMMENT '扩展属性id(t_extend_attribute.id)' ,
`attribute_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '基础属性类型' ,
`attribute_value`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '属性值' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_extend_attr_id` (`extend_attr_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品扩展属性'
AUTO_INCREMENT=131159

;

-- ----------------------------
-- Table structure for `t_extend_attribute_range`
-- ----------------------------
DROP TABLE IF EXISTS `t_extend_attribute_range`;
CREATE TABLE `t_extend_attribute_range` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`sub_id`  int(11) NOT NULL COMMENT '组别ID：t_extend_attribute_subject.id' ,
`is_hz_owner`  tinyint(2) NULL DEFAULT NULL COMMENT '是否慧择自营：1是0否2不限' ,
`category_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '险种类别，多个逗号分隔' ,
`company_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司，多个逗号分隔' ,
`tag_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保障项标签，多个逗号分隔' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_idx_sub_id` (`sub_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='扩展属性 限制的产品计划范围'
AUTO_INCREMENT=21

;

-- ----------------------------
-- Table structure for `t_extend_attribute_range_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_extend_attribute_range_item`;
CREATE TABLE `t_extend_attribute_range_item` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`range_id`  int(11) NOT NULL COMMENT '范围ID' ,
`item_id`  int(11) NOT NULL COMMENT '基础保障项ID' ,
`coverage_min`  int(11) NULL DEFAULT NULL COMMENT '保额最小值：单位元' ,
`coverage_max`  int(11) NULL DEFAULT NULL COMMENT '保额最大值：单位元' ,
PRIMARY KEY (`id`),
INDEX `idx_range_id` (`range_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='扩展属性 限制的产品计划范围-保障项'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_extend_attribute_range_plan`
-- ----------------------------
DROP TABLE IF EXISTS `t_extend_attribute_range_plan`;
CREATE TABLE `t_extend_attribute_range_plan` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`range_id`  int(11) NOT NULL COMMENT '范围ID' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`plan_id`  int(11) NOT NULL COMMENT '计划ID' ,
PRIMARY KEY (`id`),
INDEX `idx_range_id` (`range_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='扩展属性  约束产品计划的范围-指定计划'
AUTO_INCREMENT=4076

;

-- ----------------------------
-- Table structure for `t_extend_attribute_relation`
-- ----------------------------
DROP TABLE IF EXISTS `t_extend_attribute_relation`;
CREATE TABLE `t_extend_attribute_relation` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`pro_plan_exattr_id`  int(10) NOT NULL COMMENT '产品或计划扩展属性id,t_extend_attribute_product.id或t_extend_attribute_plan.id' ,
`belong_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '属性属于产品或计划(0:产品,1:计划)' ,
`relation_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '关联类型(1:投保声明,2:主险条款,3:附加险条款,4:备注,5:投保须知,6:常见问题,7:赔付比例,8:索赔方式,9:保障计划中的保障项说明)' ,
`relation_item`  int(10) NOT NULL DEFAULT 0 COMMENT '关联项,relation_type对应类型的id' ,
`content`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关联内容' ,
PRIMARY KEY (`id`),
INDEX `idx_exattr_id_type` (`pro_plan_exattr_id`, `belong_type`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品扩展属性关联设置'
AUTO_INCREMENT=45

;

-- ----------------------------
-- Table structure for `t_extend_attribute_restrict`
-- ----------------------------
DROP TABLE IF EXISTS `t_extend_attribute_restrict`;
CREATE TABLE `t_extend_attribute_restrict` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`module_id`  int(10) NOT NULL COMMENT '扩展属性模块id,t_extend_attribute_module.id' ,
`restrict_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束名称' ,
`execute_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '执行类型：0=满足以下所有条件 1=满足以下任一条件' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_ex_attr_module_id` (`module_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='扩展属性约束'
AUTO_INCREMENT=18

;

-- ----------------------------
-- Table structure for `t_extend_attribute_restrict_execute`
-- ----------------------------
DROP TABLE IF EXISTS `t_extend_attribute_restrict_execute`;
CREATE TABLE `t_extend_attribute_restrict_execute` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`restrict_id`  int(10) NOT NULL COMMENT '约束ID,t_extend_attribute_restrict.id' ,
`belong_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '属性属于产品或计划(0:产品,1:计划)' ,
`attribute_id`  int(10) NOT NULL COMMENT '属性id,t_extend_attribute.attribute_id' ,
`attribute_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '基础属性类型' ,
`conditions`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '约束条件：1=包含,2=不包含,3=等于,4=小于等于,5=大于等于' ,
`execute_value`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束值，多个值以逗号分隔' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='扩展属性约束执行条件'
AUTO_INCREMENT=24

;

-- ----------------------------
-- Table structure for `t_extend_attribute_restrict_result`
-- ----------------------------
DROP TABLE IF EXISTS `t_extend_attribute_restrict_result`;
CREATE TABLE `t_extend_attribute_restrict_result` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`restrict_id`  int(10) NOT NULL COMMENT '约束ID,t_extend_attribute_restrict.id' ,
`belong_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '属性属于产品或计划(0:产品,1:计划)' ,
`attribute_id`  int(10) NOT NULL COMMENT '属性id,t_extend_attribute.attribute_id' ,
`attribute_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '基础属性类型' ,
`conditions`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '选填/必填:0选填,1必填' ,
`default_value`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '默认值，多个值以逗号分隔' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='扩展属性约束执行结果'
AUTO_INCREMENT=25

;

-- ----------------------------
-- Table structure for `t_extend_attribute_subject`
-- ----------------------------
DROP TABLE IF EXISTS `t_extend_attribute_subject`;
CREATE TABLE `t_extend_attribute_subject` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`sub_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展属性组别名称' ,
`sub_type`  tinyint(4) NOT NULL DEFAULT 2 COMMENT '组别类型(0:产品独有，1:公共组别，2:自定义组别)' ,
`product_id`  int(10) NULL DEFAULT NULL COMMENT '产品独有类型关联的产品id' ,
`remark`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置说明' ,
`sort`  int(11) NOT NULL DEFAULT 1 COMMENT '排序' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人名' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='扩展属性组别'
AUTO_INCREMENT=1969

;

-- ----------------------------
-- Table structure for `t_file_upload_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_file_upload_log`;
CREATE TABLE `t_file_upload_log` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`file_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件名称' ,
`file_meta_id`  int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文档上传到dfs返回的metaid' ,
`file_url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件路径' ,
`file_path`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件path' ,
`file_size`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小' ,
`file_type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件类型' ,
`remark`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件备注' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`create_user_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '创建人' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '文件是否删除' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='文件上传记录表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_filter_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_filter_log`;
CREATE TABLE `t_filter_log` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`site_id`  varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点或IP标识' ,
`agent_id`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务标识' ,
`logger_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志名称' ,
`method_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志所在方法' ,
`arguments`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数数组' ,
`event_type`  varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件类型' ,
`message`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息' ,
`create_time`  timestamp(3) NOT NULL DEFAULT 'CURRENT_TIMESTAMP(3)' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='过虑日志，作用有：统计约束时间'
AUTO_INCREMENT=158533

;

-- ----------------------------
-- Table structure for `t_general_restrict`
-- ----------------------------
DROP TABLE IF EXISTS `t_general_restrict`;
CREATE TABLE `t_general_restrict` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`restrict_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '约束编码' ,
`restrict_name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '约束名称' ,
`restrict_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '约束类型 0:试算因子内部约束,1:试算因子约束投保属性,2:投保属性内部约束' ,
`is_configurable`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否可配置 0:不可配置 1:可配置 默认可配置' ,
`execute_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行类型：0=满足以下所有条件 1=满足以下任一条件' ,
`type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '约束类型 0=一般约束 1=默认约束' ,
`execute_gene_codes`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '不可配置使用，试算因子条件code，多个逗号隔开' ,
`execute_attribute_codes`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '不可配置使用，属性条件code，多个逗号隔开' ,
`result_gene_codes`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '不可配置使用, 试算因子结果code，多个逗号隔开' ,
`result_attribute_codes`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '不可配置使用,属性结果code，多个逗号隔开' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除标志 0 未删除 1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者名称' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者名称' ,
`remark`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注说明' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='通用约束'
AUTO_INCREMENT=103

;

-- ----------------------------
-- Table structure for `t_general_restrict_attribute_execute`
-- ----------------------------
DROP TABLE IF EXISTS `t_general_restrict_attribute_execute`;
CREATE TABLE `t_general_restrict_attribute_execute` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`restrict_id`  int(10) NOT NULL COMMENT '约束ID' ,
`module_id`  int(10) NOT NULL COMMENT '模块ID' ,
`attribute_id`  int(10) NOT NULL COMMENT '属性ID' ,
`conditions`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '约束条件：0=大于，1=大于等于，2=小于，3=小于等于，4=不等于，5=等于，6=包含，7=不包含,8=提示' ,
`value`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束值，多个值以逗号分隔' ,
`unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '单位 见t_unit表' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_restrict_id` (`restrict_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='通用约束-属性约束条件'
AUTO_INCREMENT=61

;

-- ----------------------------
-- Table structure for `t_general_restrict_attribute_gene_execute`
-- ----------------------------
DROP TABLE IF EXISTS `t_general_restrict_attribute_gene_execute`;
CREATE TABLE `t_general_restrict_attribute_gene_execute` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`restrict_id`  int(10) NOT NULL COMMENT '约束ID,关联t_attribute_restrict.id' ,
`trial_gene_id`  int(10) NOT NULL COMMENT '试算因子ID' ,
`conditions`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '约束条件：0=大于，1=大于等于，2=小于，3=小于等于，4=不等于，5=等于，6=包含，7=不包含' ,
`value`  varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束值，多个值以逗号分隔' ,
`unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '单位 见t_unit表' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_restrict_id` (`restrict_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='通用约束-属性约束试算因子条件'
AUTO_INCREMENT=5

;

-- ----------------------------
-- Table structure for `t_general_restrict_attribute_result`
-- ----------------------------
DROP TABLE IF EXISTS `t_general_restrict_attribute_result`;
CREATE TABLE `t_general_restrict_attribute_result` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`restrict_id`  int(10) NOT NULL COMMENT '约束ID' ,
`module_id`  int(10) NOT NULL COMMENT '模块ID' ,
`attribute_id`  int(10) NOT NULL COMMENT '属性ID' ,
`conditions`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '约束条件：0=大于，1=大于等于，2=小于，3=小于等于，4=不等于，5=等于，6=包含，7=不包含，8=提示' ,
`value`  varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束值' ,
`unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '单位 见t_unit表' ,
`remind`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '正则约束条件验证失败提示' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_restrict_id` (`restrict_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='通用约束-属性约束结果'
AUTO_INCREMENT=52

;

-- ----------------------------
-- Table structure for `t_general_restrict_gene_execute`
-- ----------------------------
DROP TABLE IF EXISTS `t_general_restrict_gene_execute`;
CREATE TABLE `t_general_restrict_gene_execute` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`restrict_id`  int(10) NOT NULL COMMENT '通用约束ID' ,
`trial_gene_id`  int(10) NULL DEFAULT NULL COMMENT '试算因子ID' ,
`conditions`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '约束条件：0=大于，1=大于等于，2=小于，3=小于等于，4=不等于，5=等于，6=包含，7=不包含' ,
`value`  varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束值，多个值以逗号分隔' ,
`unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '单位 见t_unit表' ,
`exe_type`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '0公式约束，1 一般约束' ,
`formula_type`  tinyint(1) NULL DEFAULT NULL COMMENT '公式类型: 0公式，1固定' ,
`formula`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公式' ,
`formula_display`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公式展示（供页面显示)' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_restrict_id` (`restrict_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='通用约束-试算因子内部约束条件'
AUTO_INCREMENT=15

;

-- ----------------------------
-- Table structure for `t_general_restrict_gene_result`
-- ----------------------------
DROP TABLE IF EXISTS `t_general_restrict_gene_result`;
CREATE TABLE `t_general_restrict_gene_result` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`restrict_id`  int(10) NOT NULL COMMENT '约束ID' ,
`trial_gene_id`  int(10) NOT NULL COMMENT '试算因子ID' ,
`conditions`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '约束条件：0=大于，1=大于等于，2=小于，3=小于等于，4=不等于，5=等于，6=包含，7=不包含,8=不投保,9=提示,10=关联变量' ,
`value`  varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束值，多个值以逗号分隔;如果conditions=10  value值为 11_保障项id,111_试算因子id,' ,
`unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '单位 见t_unit表' ,
`res_type`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '0公式约束，1 一般约束' ,
`formula_type`  tinyint(1) NULL DEFAULT NULL COMMENT '公式类型: 0公式，1固定' ,
`formula`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公式' ,
`formula_display`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公式展示（供页面显示)' ,
`default_value`  varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '约束结果默认值' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_restrict_id` (`restrict_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='通用约束-试算因子约束结果'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `t_healthy_algorithm`
-- ----------------------------
DROP TABLE IF EXISTS `t_healthy_algorithm`;
CREATE TABLE `t_healthy_algorithm` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`algorithm_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '算法名称' ,
`class_path`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应的算法类' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='算法'
AUTO_INCREMENT=41

;

-- ----------------------------
-- Table structure for `t_holiday_date`
-- ----------------------------
DROP TABLE IF EXISTS `t_holiday_date`;
CREATE TABLE `t_holiday_date` (
`id`  int(10) NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`holiday_year`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节假日(年)' ,
`holiday_date`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节假日' ,
`holiday_type`  tinyint(4) NULL DEFAULT NULL COMMENT '节假日类型  1周六,周日  3 法定节假日' ,
`remark`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_holiday_year` (`holiday_year`) USING BTREE ,
INDEX `idx_holiday_date` (`holiday_date`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='节假日维护表'
AUTO_INCREMENT=465

;

-- ----------------------------
-- Table structure for `t_information_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_information_type`;
CREATE TABLE `t_information_type` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信息类型' ,
`deleted`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_user_id`  int(11) NULL DEFAULT NULL COMMENT '更新者ID' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者名称' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='信息类型'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `t_insurance_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_insurance_type`;
CREATE TABLE `t_insurance_type` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人' ,
`update_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人' ,
`type_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别名称' ,
`parent_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父id' ,
`sort`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '序号' ,
`type_level`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '类别等级' ,
`type_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '编码' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_parent_id` (`parent_id`) USING BTREE ,
INDEX `idx_type_code` (`type_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='险种类别表（新）'
AUTO_INCREMENT=185

;

-- ----------------------------
-- Table structure for `t_insure_process_control`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_process_control`;
CREATE TABLE `t_insure_process_control` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`create_user_id`  int(10) NOT NULL DEFAULT 0 COMMENT '创建人ID' ,
`update_user_id`  int(10) NOT NULL DEFAULT 0 COMMENT '更新人ID' ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人名' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人名' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`sort`  int(10) NOT NULL DEFAULT 0 COMMENT '排序' ,
`process_task_id`  int(11) NOT NULL COMMENT '关联的流程任务id' ,
`product_id`  int(11) NOT NULL COMMENT '关联的产品id' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_process_task_id` (`process_task_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='流程控制编排'
AUTO_INCREMENT=16446

;

-- ----------------------------
-- Table structure for `t_insure_process_task`
-- ----------------------------
DROP TABLE IF EXISTS `t_insure_process_task`;
CREATE TABLE `t_insure_process_task` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`task_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码' ,
`task_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名' ,
`task_desc`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_task_code` (`task_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='流程控制任务'
AUTO_INCREMENT=7

;

-- ----------------------------
-- Table structure for `t_letter_template`
-- ----------------------------
DROP TABLE IF EXISTS `t_letter_template`;
CREATE TABLE `t_letter_template` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人' ,
`update_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人' ,
`company_id`  int(10) UNSIGNED NOT NULL COMMENT '保司id' ,
`template_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码' ,
`template_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名' ,
`sign_obj`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '签名对象，多个英文,分隔:1-投保人,2-被保人,3-业务员' ,
`target_obj`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下发对象，多个英文,分隔:1-投保人,2-被保人,3-业务员' ,
`file_id`  int(10) UNSIGNED NULL DEFAULT NULL COMMENT '文件id' ,
`file_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名' ,
`file_url`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件地址' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_companyId_templateCode` (`company_id`, `template_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='信函件模板'
AUTO_INCREMENT=17

;

-- ----------------------------
-- Table structure for `t_letter_template_component`
-- ----------------------------
DROP TABLE IF EXISTS `t_letter_template_component`;
CREATE TABLE `t_letter_template_component` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人' ,
`update_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人' ,
`module_id`  int(10) UNSIGNED NOT NULL COMMENT '关联模块id' ,
`component_type`  tinyint(3) UNSIGNED NOT NULL COMMENT '组件类型:1-富文本（无底色）,2-富文本（有底色）,3-经办人和日期,4-表格,5-数组,6-日期,7-文本框,8-上传资料,9-签名,10-按钮,101-定制化(换卡支付4选1),102-定制化(退费不成功2选1),103-定制化(核保决定通知函2选1)' ,
`rich_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '富文本,组件类型1,2,3,4用到' ,
`title`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主标题，组件类型7-输入框用到' ,
`prompt`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提示语，组件类型7用到' ,
`sign_obj`  tinyint(4) NULL DEFAULT NULL COMMENT '签名对象,签名组件9用到:1-投保人,2-被保人,3-业务员' ,
`button_text`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮文案,组件10用到' ,
`component_sort`  int(11) NOT NULL COMMENT '序号' ,
`key_code`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'keycode' ,
`upload_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传资料提示文本，组件8上传组件用到' ,
`attach_title`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题，组件类型7-输入框用到' ,
`guide`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '引导语，组件类型7-输入框用到' ,
`component_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件自定义名' ,
`required`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否必填，0-否,1-是' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_module_id` (`module_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='信函件模板-组件'
AUTO_INCREMENT=94

;

-- ----------------------------
-- Table structure for `t_letter_template_header`
-- ----------------------------
DROP TABLE IF EXISTS `t_letter_template_header`;
CREATE TABLE `t_letter_template_header` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人' ,
`update_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人' ,
`component_id`  int(10) UNSIGNED NOT NULL COMMENT '关联组件id' ,
`header_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表头名' ,
`header_source`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表数据来源标识' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_component_id` (`component_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='信函件模板-数组列表组件-header配置'
AUTO_INCREMENT=11

;

-- ----------------------------
-- Table structure for `t_letter_template_html`
-- ----------------------------
DROP TABLE IF EXISTS `t_letter_template_html`;
CREATE TABLE `t_letter_template_html` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人' ,
`update_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人' ,
`template_id`  int(10) UNSIGNED NOT NULL COMMENT '关联模板id' ,
`file_id`  int(10) UNSIGNED NOT NULL COMMENT '文件id' ,
`file_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名' ,
`file_url`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件地址' ,
`key_code`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应编码' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_template_id` (`template_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='信函件模板-html配置内容'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_letter_template_module`
-- ----------------------------
DROP TABLE IF EXISTS `t_letter_template_module`;
CREATE TABLE `t_letter_template_module` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人' ,
`update_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人' ,
`template_id`  int(10) UNSIGNED NOT NULL COMMENT '关联模板id' ,
`module_sort`  int(11) NOT NULL COMMENT '序号' ,
`module_type`  tinyint(3) UNSIGNED NOT NULL COMMENT '模块类型：1-展示区域(贴边),2-回复区域(不贴边)' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_template_id` (`template_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='信函件模板-模块'
AUTO_INCREMENT=40

;

-- ----------------------------
-- Table structure for `t_letter_template_snapshot`
-- ----------------------------
DROP TABLE IF EXISTS `t_letter_template_snapshot`;
CREATE TABLE `t_letter_template_snapshot` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人' ,
`template_id`  int(10) UNSIGNED NOT NULL COMMENT '关联模板id' ,
`json_content`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '快照json格式内容' ,
`company_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '保司id' ,
`template_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '编码' ,
`simple_json_content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '主表数据快照json格式内容' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_template_id` (`template_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='信函件模板-快照'
AUTO_INCREMENT=75

;

-- ----------------------------
-- Table structure for `t_letter_template_upload_rule`
-- ----------------------------
DROP TABLE IF EXISTS `t_letter_template_upload_rule`;
CREATE TABLE `t_letter_template_upload_rule` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人' ,
`update_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人' ,
`component_id`  int(10) UNSIGNED NOT NULL COMMENT '关联组件id' ,
`rule_type`  tinyint(4) NOT NULL COMMENT '规则类型:1-文件格式,2-单个文件大小,3-汇总文件大小,4-单个类型文件大小' ,
`rule_value`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则内容' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_component_id` (`component_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='信函件模板-上传组件规则配置'
AUTO_INCREMENT=105

;

-- ----------------------------
-- Table structure for `t_link`
-- ----------------------------
DROP TABLE IF EXISTS `t_link`;
CREATE TABLE `t_link` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`info_type_id`  int(10) NOT NULL COMMENT '信息类型,关联t_information_type.id' ,
`company_limit`  varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司限定范围(不能移除该字段：该字段为空时，表示满足所有保险公司)' ,
`file_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称' ,
`file_url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件url' ,
`file_id`  int(11) NOT NULL COMMENT '文件ID' ,
`upload_file_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件ID' ,
`is_enable`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '是否启用：1是0否' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_user_id`  int(11) NULL DEFAULT NULL COMMENT '更新者ID' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者名称' ,
`insurance_brokers_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '所属保险经纪公司：0-通用,1-慧择,2-慧聚,3-森昊' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '所属牌照' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='超链接'
AUTO_INCREMENT=22

;

-- ----------------------------
-- Table structure for `t_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`business_type`  int(11) NOT NULL DEFAULT 0 COMMENT '日志操作类型：枚举类PsLogType.java' ,
`user_id`  int(11) NOT NULL COMMENT '操作人ID' ,
`user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人' ,
`user_ip`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人IP' ,
`business_id`  int(11) NULL DEFAULT NULL COMMENT '被称作对象的主键ID' ,
`content`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '日志内容' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_name_type` (`user_name`, `business_type`) USING BTREE ,
INDEX `idx_bid_type` (`business_id`, `business_type`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=559513

;

-- ----------------------------
-- Table structure for `t_mail_conf`
-- ----------------------------
DROP TABLE IF EXISTS `t_mail_conf`;
CREATE TABLE `t_mail_conf` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`key_code`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码' ,
`name`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字' ,
`receiver`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '收件人，多个' ,
`sender`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发件人' ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容' ,
`attachment`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '附件，多个附件; 文件服务器id' ,
`subject`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题' ,
`template_key`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件模板的key；来自邮件系统' ,
`is_use_template`  tinyint(4) NULL DEFAULT NULL COMMENT '0=使用模板；1=不使用模板' ,
`deleted`  tinyint(4) NULL DEFAULT NULL COMMENT '删除标识； 1:删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
`create_user_id`  int(10) NULL DEFAULT NULL COMMENT '创建人id' ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名字' ,
`update_user_id`  int(10) NULL DEFAULT NULL COMMENT '修改人id' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人名字' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='邮件内容配置'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `t_manual_recommend_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_manual_recommend_product`;
CREATE TABLE `t_manual_recommend_product` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(11) UNSIGNED NOT NULL COMMENT '关联产品id' ,
`display_content`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '展示内容' ,
`status`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '启用状态 0-未启用,1-启用' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人' ,
`update_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='人核推荐产品配置'
AUTO_INCREMENT=29

;

-- ----------------------------
-- Table structure for `t_manual_template`
-- ----------------------------
DROP TABLE IF EXISTS `t_manual_template`;
CREATE TABLE `t_manual_template` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`template_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称' ,
`company_id`  int(11) NOT NULL COMMENT '保险公司的id' ,
`product_id`  int(11) NOT NULL COMMENT '产品编码' ,
`suit_for`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '适用方：0投保人1被保人' ,
`event_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '触发节点：0:健康告知非标 1:标准核保结果为人工核保 2:智能核保结果为人工核保' ,
`has_interface`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否有人核接口：1是0否' ,
`is_underwriting`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否需要核保：1是0否' ,
`is_additional_material`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '保险公司是否允许补充资料：1是0否' ,
`is_trace_insurance_date`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否允许追溯起保日期：0投保人1被保人2仅生日单追溯' ,
`is_trace_insured_date`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否允许追溯投保日期：0投保人1被保人' ,
`healthy_id`  int(11) NULL DEFAULT NULL COMMENT '健康问卷的id' ,
`underwriting_statement`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '人工核保说明' ,
`create_user_id`  int(10) NULL DEFAULT NULL COMMENT '创建者id' ,
`update_user_id`  int(10) NULL DEFAULT NULL COMMENT '修改者id' ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人名' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人名' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录的创建时间' ,
`is_enable`  tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用 0：不启用 1：启用 默认1' ,
`is_dock_company`  tinyint(4) NULL DEFAULT 0 COMMENT '是否直接对接保险公司,1-是,0-否' ,
`link_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '引用超链接ID，关联t_link.id' ,
`template_type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '模板类型 1.在线人核 2.线下邮核' ,
`zz_mail_template_key`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主站邮件模板' ,
`qx_mail_template_key`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '齐欣邮件模板' ,
`jm_mail_template_key`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '聚米邮件模板' ,
`xb_mail_template_key`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '携保邮件模板' ,
`company_mail_address`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司邮箱' ,
`carbon_copy_mail_address`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抄送邮箱' ,
`material_tip`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '影像资料提示语' ,
`manual_issue_reply`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '函件回销方式 0-无,1-按整单,2-按险种,3-按被保险人,4-按函件' ,
`issue_dock_company`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '问题件是否直接对接保险公司,0否1是' ,
`generate_pdf`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '健康问卷是否生成pdf 0-否,1-是' ,
`generate_pdf_template_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板name' ,
`generate_pdf_template_url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板url' ,
`generate_pdf_template_id`  int(10) UNSIGNED NULL DEFAULT NULL COMMENT '模板文件id' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_manual_template` (`product_id`, `suit_for`, `event_type`, `template_type`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='人核模板'
AUTO_INCREMENT=596

;

-- ----------------------------
-- Table structure for `t_manual_template_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `t_manual_template_attribute`;
CREATE TABLE `t_manual_template_attribute` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`manual_template_id`  int(10) NOT NULL COMMENT '模板id' ,
`product_attribute_id`  int(10) NULL DEFAULT NULL COMMENT '属性id(废弃)' ,
`module_id`  int(10) NOT NULL COMMENT '模块ID' ,
`attribute_id`  int(10) NOT NULL COMMENT '属性ID关联t_attribute的id' ,
`is_fill_in`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否提交人核时填写 1是0否' ,
`is_modify`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否允许人核后修改 1是0否' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='人核属性关联表'
AUTO_INCREMENT=27369

;

-- ----------------------------
-- Table structure for `t_manual_template_mail`
-- ----------------------------
DROP TABLE IF EXISTS `t_manual_template_mail`;
CREATE TABLE `t_manual_template_mail` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`manual_template_id`  int(10) UNSIGNED NOT NULL COMMENT '关联模板ID' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '101' COMMENT '所属牌照' ,
`zz_mail_template_key`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主站邮件模板' ,
`qx_mail_template_key`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '齐欣邮件模板' ,
`jm_mail_template_key`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '聚米邮件模板' ,
`xb_mail_template_key`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '携保邮件模板' ,
`company_mail_address`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司邮箱' ,
`carbon_copy_mail_address`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抄送邮箱' ,
PRIMARY KEY (`id`),
INDEX `idx_manual_template_id` (`manual_template_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='邮核模板-邮件分牌照配置'
AUTO_INCREMENT=103

;

-- ----------------------------
-- Table structure for `t_manual_template_material`
-- ----------------------------
DROP TABLE IF EXISTS `t_manual_template_material`;
CREATE TABLE `t_manual_template_material` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`manual_template_id`  int(10) NOT NULL COMMENT '模板id' ,
`material_id`  int(11) NOT NULL COMMENT '资料id' ,
`is_necessary`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否必须上传：1是0否' ,
`material_type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '资料类型 0-初始资料,1-问题件资料' ,
`file_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '文件类型,0文件,1文本' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='人核模板资料'
AUTO_INCREMENT=3040

;

-- ----------------------------
-- Table structure for `t_manual_template_material_file`
-- ----------------------------
DROP TABLE IF EXISTS `t_manual_template_material_file`;
CREATE TABLE `t_manual_template_material_file` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`material_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联t_manual_template_material表id' ,
`file_id`  int(10) UNSIGNED NULL DEFAULT 0 COMMENT '文件id' ,
`file_url`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '文件地址' ,
`file_name`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '文件名' ,
PRIMARY KEY (`id`),
INDEX `idx_material_id` (`material_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='人核资料上传示例文件'
AUTO_INCREMENT=576

;

-- ----------------------------
-- Table structure for `t_manual_template_material_rule`
-- ----------------------------
DROP TABLE IF EXISTS `t_manual_template_material_rule`;
CREATE TABLE `t_manual_template_material_rule` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`manual_template_id`  int(10) UNSIGNED NOT NULL COMMENT '人核模板id' ,
`rule_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则名称' ,
`rule_condition`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '规则条件：0=包含，1=不包含，2=大于，3=大于等于，4=小于，5=小于等于' ,
`rule_value`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则值' ,
PRIMARY KEY (`id`),
INDEX `idx_manual_template_id` (`manual_template_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='人核资料规则'
AUTO_INCREMENT=1451

;

-- ----------------------------
-- Table structure for `t_material`
-- ----------------------------
DROP TABLE IF EXISTS `t_material`;
CREATE TABLE `t_material` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`material_type`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '资料类别：1保全2续期3寄送4理赔5核保' ,
`material_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资料名称' ,
`material_description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '资料说明' ,
`material_template_url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空白资料模板URL' ,
`material_template_filename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空白资料模板文件名（数据接收方用到）' ,
`material_example_url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资料填写样例URL' ,
`material_example_filename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资料填写样例文件名（数据接收方用到）' ,
`material_company_limit`  varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司限定范围(不能移除该字段：该字段为空时，表示满足所有保险公司)' ,
`special_useful`  tinyint(2) NULL DEFAULT NULL COMMENT '特殊用途：1经办人,2默认核保资料' ,
`deleted`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_user_id`  int(11) NULL DEFAULT NULL COMMENT '更新者ID' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者名称' ,
PRIMARY KEY (`id`),
INDEX `idx_type` (`material_type`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='资料管理'
AUTO_INCREMENT=63

;

-- ----------------------------
-- Table structure for `t_material_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_material_company`;
CREATE TABLE `t_material_company` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`material_id`  int(11) NOT NULL COMMENT '资料ID' ,
`company_id`  int(11) NOT NULL COMMENT '保险公司ID' ,
PRIMARY KEY (`id`),
INDEX `idx_material_company` (`material_id`, `company_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='资料公司关联表'
AUTO_INCREMENT=144

;

-- ----------------------------
-- Table structure for `t_offline_auth_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_auth_config`;
CREATE TABLE `t_offline_auth_config` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_user`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '创建人' ,
`update_user`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '更新人' ,
`product_id`  int(10) UNSIGNED NOT NULL COMMENT '产品id' ,
`node_type`  tinyint(3) UNSIGNED NOT NULL COMMENT '节点类型：1-核对订单,2-修改支付,3-回执回销,4-撤单,5-问题件,6-投保信息填写' ,
`sms_auth`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否勾选短信认证 0-否,1-是' ,
`sms_auth_obj`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '短信认证对象 多个英文,分隔 1-投保人,2-被保人,3-代理人' ,
`face_auth`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否勾选人脸认证 0-否,1-是' ,
`face_auth_obj`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '人脸认证对象 多个英文,分隔 1-投保人,2-被保人,3-代理人' ,
`face_auth_pic`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '人脸认证，是否需要获取认证图片 0-否,1-是' ,
`ocr_auth`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否勾选ocr认证 0-否,1-是' ,
`ocr_auth_obj`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ocr认证对象 多个英文,分隔 1-投保人,2-被保人,3-代理人' ,
`ocr_auth_update_check`  tinyint(4) NOT NULL DEFAULT 0 COMMENT 'ocr认证，是否需要对填充信息做修改校验 0-否,1-是' ,
`juveniles_insured`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '被保人为未成年处理场景 0-无,1-无需被保人认证,2-需要被保人监护人认证' ,
`face_company_api`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否调用保司人脸识别接口上传认证图片 0-否,1-是' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='线下单-认证配置'
AUTO_INCREMENT=427

;

-- ----------------------------
-- Table structure for `t_offline_sign_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_sign_config`;
CREATE TABLE `t_offline_sign_config` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_user`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '创建人' ,
`update_user`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '更新人' ,
`product_id`  int(10) UNSIGNED NOT NULL COMMENT '产品id' ,
`node_type`  tinyint(3) UNSIGNED NOT NULL COMMENT '节点类型：1-核对订单,2-修改支付,3-回执回销,4-撤单,5-问题件' ,
`sms_auth`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否勾选短信认证 0-否,1-是' ,
`sms_auth_obj`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '短信认证对象 多个英文,分隔 1-投保人,2-被保人,3-代理人' ,
`face_auth`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否勾选人脸认证 0-否,1-是' ,
`face_auth_obj`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '人脸认证对象 多个英文,分隔 1-投保人,2-被保人,3-代理人' ,
`face_auth_pic`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '人脸认证，是否需要获取认证图片 0-否,1-是' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='线下单-签名配置'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_oper_buy_count`
-- ----------------------------
DROP TABLE IF EXISTS `t_oper_buy_count`;
CREATE TABLE `t_oper_buy_count` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`product_id`  int(10) NOT NULL COMMENT '基础产品ID t_product.id' ,
`product_plan_id`  int(11) NULL DEFAULT NULL COMMENT '基础产品计划ID t_product_plan.id' ,
`oper_product_id`  int(10) NOT NULL COMMENT '运营产品ID' ,
`oper_product_plan_id`  int(11) NULL DEFAULT NULL COMMENT '运营产品计划ID' ,
`platform`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '平台：1=慧择 2=聚米 3=渠道' ,
`buy_count`  int(10) NOT NULL COMMENT '购买份数' ,
`conditions`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '约束条件：2=小于，3=小于等于，5=等于' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='运营层-购买份数限制'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_payment_limit`
-- ----------------------------
DROP TABLE IF EXISTS `t_payment_limit`;
CREATE TABLE `t_payment_limit` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`payee_type`  tinyint(4) UNSIGNED NOT NULL COMMENT '收款方 0:慧择 1：保险公司' ,
`company_id`  int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '保险公司ID' ,
`payment_way`  tinyint(4) UNSIGNED NOT NULL COMMENT '收款方式 0:收银台,1-微信代扣,2-银行代扣' ,
`cashier_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收银台编码' ,
`payment_gateway`  tinyint(4) NOT NULL COMMENT '支付网关有5个选项：0-支付宝支付/1-微信支付/2-银联支付/3-微信代扣/4-银联代扣' ,
`account_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '账户类型 0-余额,1-储蓄卡,2-信用卡' ,
`description`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '说明' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除标志 0 未删除 1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者名称' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者名称' ,
`data_origin`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据来源' ,
`lock_time`  int(11) NULL DEFAULT NULL COMMENT '锁单时间，单位分' ,
PRIMARY KEY (`id`),
INDEX `idx_company_id` (`company_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='支付限额表'
AUTO_INCREMENT=74

;

-- ----------------------------
-- Table structure for `t_payment_limit_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_payment_limit_detail`;
CREATE TABLE `t_payment_limit_detail` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`payment_limit_id`  int(11) UNSIGNED NOT NULL COMMENT '支付限额id' ,
`bank_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行名称' ,
`single_limit`  decimal(10,2) NULL DEFAULT NULL COMMENT '单笔限额' ,
`day_limit`  decimal(10,2) NULL DEFAULT NULL COMMENT '单日限额' ,
`month_limit`  decimal(10,2) NULL DEFAULT NULL COMMENT '单月限额' ,
PRIMARY KEY (`id`),
INDEX `idx_payment_limit_id` (`payment_limit_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='支付限额明细表'
AUTO_INCREMENT=522

;

-- ----------------------------
-- Table structure for `t_plan_c_insurance`
-- ----------------------------
DROP TABLE IF EXISTS `t_plan_c_insurance`;
CREATE TABLE `t_plan_c_insurance` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`product_id`  int(11) NOT NULL COMMENT '产品id' ,
`product_plan_id`  int(11) NOT NULL COMMENT '产品计划ID' ,
`co_insurance_id`  int(11) NOT NULL COMMENT '险种id,关联t_c_insurance' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除标志 0 未删除 1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_product_plan_id` (`product_plan_id`) USING BTREE ,
INDEX `idx_c_insurance_id` (`co_insurance_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='计划险种表'
AUTO_INCREMENT=5026

;

-- ----------------------------
-- Table structure for `t_plan_restrict_extra`
-- ----------------------------
DROP TABLE IF EXISTS `t_plan_restrict_extra`;
CREATE TABLE `t_plan_restrict_extra` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`restrict_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '约束名称' ,
`restrict_type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '约束类型：1份数约束，2保额约束，3计划互斥' ,
`conditions`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '执行条件：0无条件执行，1满足全部条件，2满足任一条件' ,
`is_hz_owner`  tinyint(4) NULL DEFAULT NULL COMMENT '是否自营：1是0否。2不限' ,
`category_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '险种类别ID串：（二级分类，多个逗号分隔）' ,
`company_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司ID串，多个保险公司逗号分隔' ,
`restrict_main`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '约束主体：0同一被保人，1同一被保人或投保人，2同一被保人且同一航班，3同一航班，4同一房产，5同一车辆' ,
`limit_count`  int(11) NULL DEFAULT NULL COMMENT '约束限制：如果约束类型为份数约束，此值为份数。如果是保额约束，此值为保额。' ,
`coverage_over_prompt`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保额超出范围自定义提示' ,
`over_config_value`  tinyint(2) NULL DEFAULT NULL COMMENT '超出配置值处理：1拒绝投保，2需要审核' ,
`protect_item`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_user_id`  int(11) NULL DEFAULT NULL COMMENT '更新者' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
PRIMARY KEY (`id`),
INDEX `r_name` (`restrict_name`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='额外约束：计划份数保额约束'
AUTO_INCREMENT=362

;

-- ----------------------------
-- Table structure for `t_plan_restrict_extra_execute`
-- ----------------------------
DROP TABLE IF EXISTS `t_plan_restrict_extra_execute`;
CREATE TABLE `t_plan_restrict_extra_execute` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`restrict_id`  int(10) NOT NULL COMMENT '份数保额约束ID' ,
`condition_code`  int(10) NOT NULL COMMENT '执行条件code：枚举RestrictExtraExecuteEnum.java' ,
`conditions`  tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '约束条件：1=大于，2=大于等于，3=等于，4=小于，5=小于等于，6=包含' ,
`condition_value`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '约束值' ,
`unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '单位:1天，2岁' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_restrict_id` (`restrict_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='经纪费-约束计算'
AUTO_INCREMENT=650

;

-- ----------------------------
-- Table structure for `t_plan_restrict_extra_plan`
-- ----------------------------
DROP TABLE IF EXISTS `t_plan_restrict_extra_plan`;
CREATE TABLE `t_plan_restrict_extra_plan` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`restrict_id`  int(11) NOT NULL COMMENT '份数保额约束id' ,
`plan_id`  int(11) NOT NULL COMMENT '计划ID' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`plan_type`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '添加的产品计划类型：1指定产品计划，2排除产品计划' ,
PRIMARY KEY (`id`),
INDEX `r_id` (`restrict_id`) USING BTREE ,
INDEX `plan_id` (`plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='份数保额约束-计划中间表'
AUTO_INCREMENT=3748

;

-- ----------------------------
-- Table structure for `t_political`
-- ----------------------------
DROP TABLE IF EXISTS `t_political`;
CREATE TABLE `t_political` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`political_type`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '政策类型：1保全 2续期 3寄送 4理赔' ,
`check_position`  tinyint(4) NULL DEFAULT NULL COMMENT '保全政策类型校验位置：1生效前 2生效后' ,
`political_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '政策名称' ,
`political_description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '政策说明' ,
`political_company_limit`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司范围' ,
`material_upload`  tinyint(2) NULL DEFAULT 0 COMMENT '所需资料是否需要上传至系统：1是0否' ,
`material_ids`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所需资料ID串：t_material.id' ,
`deleted`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者名称' ,
`political_company_branch_limit`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司分支机构范围，为空表示所有分支' ,
`bq_icon_file_id`  int(10) UNSIGNED NULL DEFAULT NULL COMMENT '保全icon文件id' ,
`bq_icon_file_url`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保全icon文件url' ,
`bq_category`  tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '保全大类 1-保单服务类,2-个人信息维护类,3-保单信息维护类,4-权益变更类' ,
`bq_sort`  int(11) NULL DEFAULT NULL COMMENT '保全项排序' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='政策管理'
AUTO_INCREMENT=58

;

-- ----------------------------
-- Table structure for `t_political_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_political_company`;
CREATE TABLE `t_political_company` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`political_id`  int(11) NOT NULL COMMENT '政策ID' ,
`company_id`  int(11) NOT NULL COMMENT '保险公司ID' ,
PRIMARY KEY (`id`),
INDEX `idx_material_company` (`political_id`, `company_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='政策公司关联表'
AUTO_INCREMENT=120

;

-- ----------------------------
-- Table structure for `t_political_material`
-- ----------------------------
DROP TABLE IF EXISTS `t_political_material`;
CREATE TABLE `t_political_material` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`political_id`  int(11) NOT NULL COMMENT '政策ID' ,
`material_id`  int(11) NOT NULL COMMENT '保险公司ID' ,
PRIMARY KEY (`id`),
INDEX `idx_material_company` (`political_id`, `material_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='政策资料关联表'
AUTO_INCREMENT=244

;

-- ----------------------------
-- Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`en_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品英文名' ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`insure_operation`  tinyint(4) NULL DEFAULT 0 COMMENT '险种运营：1=人寿险 2=意健险 3=财产险' ,
`status`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '产品状态：0待审，1上架，2下架，3停售，4测试' ,
`status_updater`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态修改者：1人工，2系统' ,
`release_type`  tinyint(4) NULL DEFAULT 0 COMMENT '发布类型(0私有，1允许分销)' ,
`insured_way`  tinyint(4) NULL DEFAULT 0 COMMENT '投保方式(0在线投保，1非在线投保)' ,
`suit_for_limit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '适用平台是否限制：1是0否' ,
`suit_for`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '适用平台：1慧择，3聚米，2渠道，4海外，5大白。多个平台逗号分隔。' ,
`is_renewal`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否续保产品：1是0否' ,
`renewal_product_id`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '续保产品ID' ,
`is_hz_owner`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否慧择自有产品：1是0否' ,
`sna_id`  int(11) NULL DEFAULT 1 COMMENT '快照ID' ,
`company_id`  int(10) NOT NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_branch_id`  int(10) NULL DEFAULT 0 COMMENT '支分机构ID' ,
`category_id`  int(11) NOT NULL DEFAULT 0 COMMENT '产品类别ID' ,
`parent_product_id`  int(11) NULL DEFAULT NULL COMMENT '母产品ＩＤ（结算系统使用）' ,
`insurant_type`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '被保险人类型：1,1,1,1 (四个数分别代表：本人、其他、多人、团单，1是0否)' ,
`is_support_split_single`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否支持每人一单（拆单）：1是，0否' ,
`is_support_many_people`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否支持多人一单 1是 0否' ,
`is_support_mp_premium`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否支持多人不同保费出一单：1是，0否' ,
`is_applicant_insurant`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否投保人默认为被保人之一：1是，0否' ,
`is_insurant_payment`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否根据被保人数量缴费 1是 0否' ,
`adult_min_people`  int(10) NOT NULL DEFAULT 0 COMMENT '成年人最少人数' ,
`adult_people`  int(10) NOT NULL DEFAULT 0 COMMENT '被保人组成限制 成年人最多个数' ,
`juveniles_min_people`  int(10) NOT NULL DEFAULT 0 COMMENT '未成年人最少人数' ,
`juveniles_people`  int(10) NOT NULL DEFAULT 0 COMMENT '被保人组成限制 未成年人最多个数' ,
`min_people`  int(10) NULL DEFAULT 0 COMMENT '被保险人人数限制' ,
`max_people`  int(10) NULL DEFAULT 0 COMMENT '被保险人人数限制' ,
`is_insurant_adult`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '如果被保险人为成年人，是否限制投保人只能为本人： 1是 0否' ,
`is_insurant_juveniles`  tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '如果被保险人为未成年人，是否限制投保人只能为其父母或法定监护人 1是 0否' ,
`is_compensate`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否包含拒签补偿：1是0否' ,
`beneficiary_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '受益方式 0无，1-法定 2-指定 12-法定和指定 3-配偶' ,
`first_beneficiary_limit`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '第一顺序受益人个数' ,
`second_beneficiary_limit`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '第二顺序受益人个数' ,
`observation_period`  int(10) NULL DEFAULT 0 COMMENT '观察期' ,
`period_hesitation`  int(10) NULL DEFAULT 0 COMMENT '犹豫期限' ,
`renewal_policy_grace_period`  int(10) NULL DEFAULT 0 COMMENT '续期宽限期' ,
`single_day_limit`  int(11) NULL DEFAULT NULL COMMENT '单次出行天数限制' ,
`insure_time`  tinyint(4) NULL DEFAULT 1 COMMENT '起保时间：1可选起保日期，2固定起保日期，3根据保险公司实际情况确定起保时间' ,
`company_order_time`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '起保日期为保险公司出单日期' ,
`first_date`  int(10) NULL DEFAULT NULL COMMENT '可选的投保日期开始时间，0代表当日' ,
`latest_date`  int(10) NULL DEFAULT NULL COMMENT '可选的投保日期结束时间。0代表当日' ,
`deadline`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当天投保截止时间： 24:00' ,
`insurance_time`  int(10) NOT NULL DEFAULT 0 COMMENT '投保起保时间： 小时' ,
`terminal_time`  tinyint(4) NULL DEFAULT 0 COMMENT '终止时间的计算方式：0.满24小时截止，1.按自然日截止' ,
`fixed_date`  timestamp NULL DEFAULT NULL COMMENT '固定起保日期' ,
`fixed_latest_date`  timestamp NULL DEFAULT NULL COMMENT '固定起保日期投保截止时间' ,
`fix_insure_type`  tinyint(4) NULL DEFAULT 1 COMMENT '固定起保日期类型：1每月，2每年' ,
`fix_insure_start_day`  tinyint(4) NULL DEFAULT NULL COMMENT '每月固定起保日期开始日期:1~28号' ,
`fix_insure_start_time`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每月固定起保日期开始时间：格式23:59' ,
`fix_insure_end_day`  tinyint(4) NULL DEFAULT NULL COMMENT '每月固定起保日期结束日期:1~28号' ,
`fix_insure_end_time`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每月固定起保日期结束时间：格式23:59' ,
`fix_insure_start_datetime`  timestamp NULL DEFAULT NULL COMMENT '每年固定起保开始日期' ,
`fix_insure_end_datetime`  timestamp NULL DEFAULT NULL COMMENT '每年固定起保结束日期' ,
`fixed_show_content`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指定保障期间显示内容' ,
`insure_time_precision`  tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '保障期限精度' ,
`insured_age_calculation`  tinyint(4) UNSIGNED NULL DEFAULT NULL COMMENT '被保人年龄计算方式：1=起保日期 2=投保日期' ,
`insure_include_birthday`  tinyint(4) NULL DEFAULT 1 COMMENT '保费计算是否包含生日当天：0是1否' ,
`chinese_tax_resident_limit`  tinyint(4) NULL DEFAULT 0 COMMENT '是否仅限中国税收居民购买，1:是,0:否' ,
`insure_declare_id`  int(10) NULL DEFAULT NULL COMMENT '投保声明' ,
`insure_declare_ids`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '多个申明ID，使用逗号分隔' ,
`health_inform_app_id`  int(10) NULL DEFAULT NULL COMMENT '健康告知 手机APP' ,
`health_type`  tinyint(4) NULL DEFAULT 0 COMMENT '0无，1内部健告，2外部健告' ,
`health_inform_web_id`  int(10) NULL DEFAULT NULL COMMENT '健康告知 web' ,
`health_inform_position`  tinyint(4) NULL DEFAULT NULL COMMENT '健康告知显示时间：0填写投保信息中，1填写投保信息后' ,
`financial_inform_id`  int(10) NULL DEFAULT NULL COMMENT '财务告知' ,
`order_inform_id`  int(10) NULL DEFAULT NULL COMMENT '其他告知' ,
`major_disease_type`  int(10) NULL DEFAULT NULL COMMENT '重大疾病种类' ,
`is_other_company_insure`  tinyint(4) NULL DEFAULT 1 COMMENT '是否设置其他公司身故投保保额：1是0否(20151012需求已删除)' ,
`other_company_insure_content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设置其他公司身故投保保额内容说明(20151012需求已删除)' ,
`job_template_id`  int(10) NULL DEFAULT 0 COMMENT '职业模板(JobTemplate 表)' ,
`juveniles_job_id`  int(11) NULL DEFAULT NULL COMMENT '未成年默认职业' ,
`job_grade`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级 以逗号分隔' ,
`wealth_is_new_area`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否应用新的地区库（0否，1是,2 保险公司地区模板）' ,
`insure_is_new_area`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否应用新的地区库（0否，1是,2 保险公司地区模板）' ,
`un_insure_area`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '不承保地区' ,
`un_insure_job`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '不承包职业' ,
`travel_area`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出行目的地' ,
`is_force_pay`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否强制续期费：0不支持续期、1支持续期但不强制、2按照续期缴费方式确定是否强制续费、3强制续期' ,
`force_pay_content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '强制续期费说明' ,
`force_pay_bank_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '续期缴费银行ID列表，多个银行id逗号分隔' ,
`force_pay_bank_check`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '续期缴费银行是否需要小额支付验证：1是0否' ,
`alipay_account`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否银行代扣：1是0否' ,
`charge_bank_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '代扣银行ID列表，多个id用逗号分隔' ,
`charge_bank_check`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '代扣银行是否需要小额支付验证：1是0否' ,
`charge_bank_position`  tinyint(4) NULL DEFAULT 0 COMMENT '代扣银行信息呈现位置：0填写投保信息中，1填写投保信息后' ,
`is_company_charge`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否保险公司代收：1是0否' ,
`bank_sign_certificate`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '银行签约认证：默认 0:不需要签约认证 1:核保前签约认证 2:核保后签约认证' ,
`company_charge_way`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保险公司代收时，支持的支付方式：1银联、2支付宝、3微信支付、4易宝、5财付通、6银行代扣、7保险公司支付插件' ,
`company_charge_way_param`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司支付插件参数-TS使用' ,
`company_charge_bank_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保险公司代收的支付方式支持银联时候，支持哪些银行ID，多个银行ID逗号分隔' ,
`company_charge_bank_check`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '保险公司代收选择银行支付时，是否需要小额支付验证：1是0否' ,
`bank_branch_template`  int(11) NOT NULL DEFAULT 0 COMMENT '银行支行模板id,company.t_company_bank_area_template.id' ,
`renewal_charge_way`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '续期保费收取：1保险公司，2慧择' ,
`company_renewal_charge_way`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '选择保险公司代收时，需填写具体的代收方式：1银行代扣（不排除以后有别的）' ,
`hz_renewal_charge_way`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '续期保费收取选择慧择代收时，需填写具体的代收方式：1微信代扣（不排除以后有别的）' ,
`destination_select_one`  tinyint(4) NULL DEFAULT 0 COMMENT '目的地只允许用户选择一个国家/地区:1是0否' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`create_user_id`  int(10) NOT NULL DEFAULT 0 COMMENT '创建人ID' ,
`update_user_id`  int(10) NOT NULL DEFAULT 0 COMMENT '更新人ID' ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人名' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人名' ,
`calculate_type`  tinyint(1) NULL DEFAULT 0 COMMENT '保障期限计算方式 0自然 1固定' ,
`next_day_deadline`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '次日投保截止日期: 24:00' ,
`is_template_product`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否模板产品' ,
`company_auth`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '当配置产品基本信息时，是否保险公司代收选择是、支付方式选择银行代扣，则需要选择保险公司认证。这里保存保险公司认证的值' ,
`hzins_auth`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '当配置产品基本信息时，是否保险公司代收选择是、支付方式选择银行代扣，则需要选择慧择认证。这里保存慧择认证的值' ,
`charge_template_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扣款模板code,对应t_charge_template的code字段' ,
`insure_area_template_id`  int(10) NOT NULL DEFAULT 0 COMMENT '投保地区-地区模板（CompanyAreaTemplate 表 ）' ,
`wealth_area_template_id`  int(10) NOT NULL DEFAULT 0 COMMENT '财产所在地-地区模板（CompanyAreaTemplate 表 ）' ,
`is_many_insurance`  int(4) NOT NULL DEFAULT 0 COMMENT '是否多主险 0：否,1：是 默认0' ,
`is_same_benefit`  int(4) NOT NULL DEFAULT 1 COMMENT '受益方式是否相同 0:否,1：是 默认1' ,
`is_same_period`  int(4) NOT NULL DEFAULT 1 COMMENT '期限配置是否相同 0否,1：是 默认1' ,
`zero_insure_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '0保费是否可投保（0:不可投保,1:可投保,默认0）' ,
`support_append_type`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '可支持的追加类型 （1:单次追加,2:计划追加 多个逗号分隔 默认空字符串）' ,
`is_same_renewal`  int(4) NOT NULL DEFAULT 1 COMMENT '续期方式是否相同 0否,1：是 默认1' ,
`is_support_append`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否支持保全追加 0:否,1:是 默认0' ,
`append_start_date_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '可追加的开始日期 0:起保日期后,1:犹豫期截止日期后 默认0' ,
`bank_template`  int(11) NULL DEFAULT NULL COMMENT '银行模板id,company.t_company_bank_template.id' ,
`append_charge_way`  tinyint(4) NULL DEFAULT NULL COMMENT '追加缴费方,1-保险公司代扣,2-慧择' ,
`hz_append_charge_way`  tinyint(4) NULL DEFAULT NULL COMMENT '追加缴费方式 1-微信代扣' ,
`append_template_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '追加代扣模版code,对应t_charge_template的code字段' ,
`insure_sort_msg_check`  tinyint(4) NULL DEFAULT 0 COMMENT '是否需进行投保人手机短信验证，0-否,1-是' ,
`retroative_type_day`  int(5) NULL DEFAULT NULL COMMENT '追溯方式(往前追溯多少天)' ,
`retroative_effdate`  tinyint(4) NULL DEFAULT NULL COMMENT '是否支持追溯生效日 1是 0否' ,
`risk_rule_check`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '风控校验规则1-手机验证码,2-三要素实名验证(姓名、身份证号、手机号),3-邮箱超过3个拦截(当前投保人+已投保的投保单的邮箱投保人>3个)' ,
`period_hesitation_calc_type`  tinyint(4) NULL DEFAULT NULL COMMENT '犹豫期计算方式1-固定,2-工作日' ,
`is_multiple_insured`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否支持两个被保人(0-否，1-是）' ,
`bank_sign_agreement_ids`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行签约协议ids' ,
`job_group_code`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'A00' COMMENT '职业分组 A00全部,A01未分组,其他关联(CompanyJobGroup.job_group_code)' ,
`simple_name`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品简称，最大不超过40个字' ,
`is_multiple_more_two`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否支持多个被保险人（超过两个）0-否,1-是' ,
`min_insured_no`  int(10) UNSIGNED NULL DEFAULT NULL COMMENT '支持被保险人数最小人数' ,
`max_insured_no`  int(10) UNSIGNED NULL DEFAULT NULL COMMENT '支持被保险人数最大人数' ,
`default_insured_no`  int(10) UNSIGNED NULL DEFAULT NULL COMMENT '默认被保险人数' ,
`healthy_notify_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '健康告知类型 0:单人健告 1:多人健告 默认0' ,
`specify_effective_date`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否指定生效日  0-否,1-是' ,
`specify_insured_start_date`  timestamp NULL DEFAULT NULL COMMENT '指定生效日,投保开始日期' ,
`specify_insured_end_date`  timestamp NULL DEFAULT NULL COMMENT '指定生效日,投保结束日期' ,
`specify_insure_start_date`  timestamp NULL DEFAULT NULL COMMENT '指定生效日,起保开始日期' ,
`specify_support_birth`  tinyint(4) NULL DEFAULT NULL COMMENT '指定生效日是否支持生日单 0-否,1-是 默认空' ,
`specify_birth_allow_buy`  tinyint(4) NULL DEFAULT NULL COMMENT '生日单是否允许投保 0-否,1-是 默认空' ,
`early_renewal_insure_time`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '续保产品提前续保方式 1-上年度保单期满日次日' ,
`renewal_insure_time`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '续保产品上年度保单期满后宽限期内续保方式 1-上年度保单期满日次日,2-投保后第x天到第x天' ,
`renewal_first_date`  int(10) NULL DEFAULT NULL COMMENT '续保产品起保日期:开始 投保日后第x天' ,
`renewal_latest_date`  int(10) NULL DEFAULT NULL COMMENT '续保产品起保日期:结束 投保日后到第x天' ,
`product_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品编码' ,
`insured_rank`  int(10) NULL DEFAULT NULL COMMENT '被保人顺位 可为空' ,
`special_insure_code`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特殊投保流程CODE' ,
`health_risk_notify_id`  int(10) NULL DEFAULT NULL COMMENT '风险告知id' ,
`payee_types`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收款方' ,
`company_payment_methods`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '保司收款方式,6-银行代扣,7-保险公司支付插件 多个逗号隔开' ,
`online_type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '1-线上,2-线下' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'HZ' COMMENT '所属保险经纪公司' ,
`questionnaire_risk_notify_id`  int(11) NULL DEFAULT NULL COMMENT '关联投保适应性问卷id' ,
`renewal_by_conversion`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否续转保：0-否,1-是' ,
`early_renewal_by_conversion_time`  int(11) NULL DEFAULT NULL COMMENT '提前续转保天数' ,
`renewal_by_conversion_grace_period`  int(11) NULL DEFAULT NULL COMMENT '满期后宽限期天数' ,
`diff_phone`  tinyint(1) NULL DEFAULT NULL COMMENT '如果投被保人非同一人，是否限制被保人手机号不能与投保人一致 0-否,1-是' ,
`diff_phone_condition`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '限制被保人手机号不能与投保人一致的执行条件' ,
`risk_phone_check`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '风控手机号验证 0-否,1-是' ,
`renewal_company_last_year`  tinyint(1) NULL DEFAULT NULL COMMENT '是否上年度保司续保 0-否,1-是' ,
`insurance_period_type`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '90' COMMENT '保期类型,英文逗号分隔:11-长期险定期(年),12-长期险定期(岁),13-长期险定期(两可),14-长期险终身,21-短期险短期,22-短期险极短期,30-主险缴费期,90-未知' ,
`tip_juveniles_insured`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '被保人未成年人时，是否提醒监护人签名时说明和被保人的关系;0-否,1-是' ,
`specify_effective_date_self`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '勾选指定生效日时有效，指定生效日支持自主选择,0-否,1-是' ,
`specify_effective_date_content`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '勾选指定生效日时有效，指定生效日展示申明内容' ,
`specify_effective_date_show`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '勾选指定生效日时有效，是否展示申明内容,0-否,1-是' ,
`co_insurance`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否共保 0-否,1-是' ,
`publish_sale_name`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '披露销售名' ,
`config_publish_sale_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '销售名称披露类型,0:按产品,1:按计划' ,
`remark_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注' ,
`insure_area_check_obj`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '投保地区限制保额校验范围 0-投保人,1-被保人' ,
`appointment_insure_same`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '预约投保是否和投保信息保持一致,0-否,1-是' ,
`questionnaire_risk_notify_position`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '投保适当性问卷-展示节点 0-商详页之后,1-投保信息页之后' ,
`mga`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'mga标识 0-否,1-是' ,
`ind_template_id`  int(11) NULL DEFAULT 0 COMMENT '行业类型模板(JobTemplate 表)' ,
`group_flag`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否是团险产品 0-否,1-是' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品基础信息'
AUTO_INCREMENT=106052

;

-- ----------------------------
-- Table structure for `t_product_append_algorithm`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_append_algorithm`;
CREATE TABLE `t_product_append_algorithm` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '算法名称' ,
`class_path`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应的算法类' ,
`description`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '算法说明' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='追加计算算法'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `t_product_area_insure`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_area_insure`;
CREATE TABLE `t_product_area_insure` (
`id`  int(10) NOT NULL AUTO_INCREMENT COMMENT '自动增长主键' ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`area_id`  int(10) NOT NULL COMMENT '数据在区域表中的ID' ,
`parent_id`  int(10) NOT NULL DEFAULT 0 COMMENT '父节点ID' ,
`province_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份名称' ,
`province_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份code' ,
`city_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市code' ,
`area_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区\\县名称' ,
`area_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区code' ,
PRIMARY KEY (`id`),
INDEX `proId` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品投保地区'
AUTO_INCREMENT=173746

;

-- ----------------------------
-- Table structure for `t_product_area_map`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_area_map`;
CREATE TABLE `t_product_area_map` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`product_id`  int(11) NOT NULL COMMENT '映射名称' ,
`area_map_id`  int(11) NOT NULL COMMENT '地区映射ID，对应公司t_area_map的主键ID' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_area_map_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品地区映射'
AUTO_INCREMENT=6

;

-- ----------------------------
-- Table structure for `t_product_area_wealth`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_area_wealth`;
CREATE TABLE `t_product_area_wealth` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '自动增长主键' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`area_id`  int(10) NOT NULL COMMENT '数据在区域表中的ID' ,
`parent_id`  int(10) NOT NULL DEFAULT 0 COMMENT '父节点ID' ,
`province_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份名称' ,
`province_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份code' ,
`city_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市名称' ,
`city_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市code' ,
`area_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区\\县名称' ,
`area_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区code' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品财富地区'
AUTO_INCREMENT=12862

;

-- ----------------------------
-- Table structure for `t_product_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_attribute`;
CREATE TABLE `t_product_attribute` (
`id`  int(10) NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`module_id`  int(10) NOT NULL COMMENT '投保信息模块ID t_product_attribute_module' ,
`attribute_id`  int(10) NULL DEFAULT NULL COMMENT '基础配置项的属性ID' ,
`trial_gene_id`  int(10) NULL DEFAULT NULL COMMENT '如果增加的属性是和试算因子共享的，则关联试算因子t_trial_gene,测试attribute_id为空' ,
`required`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否必填：1是0否' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`by_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别名' ,
`insure_type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '投保类型 0-投保属性,1-预约投保' ,
PRIMARY KEY (`id`),
INDEX `idx_module_id` (`module_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保信息属性表'
AUTO_INCREMENT=663197

;

-- ----------------------------
-- Table structure for `t_product_attribute_general_restrict`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_attribute_general_restrict`;
CREATE TABLE `t_product_attribute_general_restrict` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`general_restrict_id`  int(11) NOT NULL COMMENT '通用约束ID' ,
`insure_type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '投保类型 0-投保属性,1-预约投保' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_general_restrict_id` (`general_restrict_id`) USING BTREE ,
INDEX `idx_product_general_restrict_id` (`product_id`, `general_restrict_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品投保属性的通用约束'
AUTO_INCREMENT=20502

;

-- ----------------------------
-- Table structure for `t_product_attribute_module`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_attribute_module`;
CREATE TABLE `t_product_attribute_module` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '自动增长主键' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`module_id`  int(11) NOT NULL COMMENT '基础配置项的模块ID' ,
`module_by_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块展示别名' ,
`show_in_is`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否在IS展示' ,
`module_description`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块描述' ,
`sort`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '排序' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除标识：1是0否' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`insure_type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '投保类型 0-投保属性,1-预约投保' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保信息投保模块表'
AUTO_INCREMENT=123091

;

-- ----------------------------
-- Table structure for `t_product_bank_sign_agreement`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_bank_sign_agreement`;
CREATE TABLE `t_product_bank_sign_agreement` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`product_id`  int(11) NOT NULL DEFAULT 0 COMMENT '关联产品ID' ,
`agreement_ids`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '关联协议id,逗号分隔' ,
`bank_id`  int(11) NOT NULL DEFAULT 0 COMMENT '银行id，对应属性bank的控件值' ,
`bank_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '银行名称' ,
PRIMARY KEY (`id`),
INDEX `idx_pid_bid` (`product_id`, `bank_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-银行额外签约协议'
AUTO_INCREMENT=77

;

-- ----------------------------
-- Table structure for `t_product_brokers`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_brokers`;
CREATE TABLE `t_product_brokers` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`product_id`  int(11) NOT NULL COMMENT '产品id' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码' ,
`is_default`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否是默认的牌照,0-否,1-是' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品牌照关联表'
AUTO_INCREMENT=6503

;

-- ----------------------------
-- Table structure for `t_product_brokers_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_brokers_config`;
CREATE TABLE `t_product_brokers_config` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`product_id`  int(11) NOT NULL COMMENT '产品id' ,
`belong_broker_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关联产品所属牌照' ,
`create_user`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '创建人' ,
`update_user`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '更新人' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品牌照配置主表'
AUTO_INCREMENT=268

;

-- ----------------------------
-- Table structure for `t_product_common_gene`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_common_gene`;
CREATE TABLE `t_product_common_gene` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(10) NOT NULL COMMENT '产品计划ID' ,
`trial_gene_id`  int(10) NOT NULL COMMENT '试算因子ID' ,
`protect_item_id`  int(10) NOT NULL COMMENT '费率表id （gene_type值为0时关联t_product_plan_append）' ,
`gene_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '通用试算因子类型 0:追加计划因子' ,
`dic_ids`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据字典id，多个id之间以半角逗号隔开 地区职业时，该字段无值' ,
`control_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '控件类型：0=表示下拉框,1=日历控件，2=同时出现下拉框和日历控件区间,3=文本输入框 4=地区  5=职业  6文本' ,
`byname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '别名：用于约束的名字' ,
`remark`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注' ,
`sort`  tinyint(4) NULL DEFAULT 0 COMMENT '排序' ,
`excel_type`  tinyint(4) NOT NULL COMMENT 'excel类型：0=运算 1=制表' ,
`default_value`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '默认值' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-通用试算因子'
AUTO_INCREMENT=41

;

-- ----------------------------
-- Table structure for `t_product_common_premium`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_common_premium`;
CREATE TABLE `t_product_common_premium` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(10) NOT NULL COMMENT '产品计划ID' ,
`protect_item_id`  int(10) NOT NULL COMMENT '费率表id premium_type为0是关联t_product_plan_append' ,
`premium_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '费率表类型 0标识追加计划费率表' ,
`gene_key`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '因子key:按ascii的30作为分隔符' ,
`premium`  decimal(18,4) NOT NULL DEFAULT 0.0000 COMMENT '费率' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-通用试算保费'
AUTO_INCREMENT=73

;

-- ----------------------------
-- Table structure for `t_product_common_premium_blank`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_common_premium_blank`;
CREATE TABLE `t_product_common_premium_blank` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(10) NOT NULL COMMENT '产品计划ID' ,
`protect_item_id`  int(10) NOT NULL COMMENT '费率表id premium_type为0是关联t_product_plan_append' ,
`premium_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '费率表类型 0标识追加计划费率表' ,
`gene_key`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '因子key:按ascii的30作为分隔符' ,
`premium`  decimal(18,4) NOT NULL DEFAULT 0.0000 COMMENT '费率' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-通用试算空白费率'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_product_condition_stop_sale`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_condition_stop_sale`;
CREATE TABLE `t_product_condition_stop_sale` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`has_stop_sale`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:无停售计划,1:有停售计划' ,
`stop_mail_underwriting_time`  datetime NULL DEFAULT NULL COMMENT '停止受理邮件核保时间' ,
`stop_manual_underwriting_time`  datetime NULL DEFAULT NULL COMMENT '停止受理人工核保时间' ,
`stop_underwriting_problem_time`  datetime NULL DEFAULT NULL COMMENT '停止处理人核问题件' ,
`stop_submit_insure_time`  datetime NULL DEFAULT NULL COMMENT '停止提交投保' ,
`stop_not_manual_pay_time`  datetime NULL DEFAULT NULL COMMENT '停止支付（非人核单）' ,
`stop_manual_pay_time`  datetime NULL DEFAULT NULL COMMENT '停止支付（人核单）' ,
`stop_sale_comment`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '停售计划备注' ,
`stop_sale_update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '停售计划修改时间' ,
`stop_sale_update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '停售计划修改人' ,
`stop_sale_update_user_id`  int(11) NOT NULL COMMENT '停售计划修改人id' ,
`product_id`  int(11) NOT NULL COMMENT '关联产品id' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除 0-否1-是' ,
`condition_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '条件类型：0-试算因子' ,
`condition_key`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '条件内容key.type=0时为试算因子key' ,
`condition_conditions`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '执行条件:关联RestrictConditionEnum' ,
`condition_value`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行条件内容.type=0时为试算的文本value' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`stop_mail_underwriting_problem_time`  datetime NULL DEFAULT NULL COMMENT '停止处理邮核问题件时间' ,
`underwriting_pass_time_start`  datetime NULL DEFAULT NULL COMMENT '核保通过时间（开始）' ,
`underwriting_pass_time_end`  datetime NULL DEFAULT NULL COMMENT '核保通过时间（截止）' ,
`pay_time_limit_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '支付时效类型,0-无,1-方式一,2-方式二' ,
`pay_time_limit_day`  int(11) NULL DEFAULT NULL COMMENT '方式一生效 支付时效：x天' ,
`pay_time_limit_time`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方式一生效 支付时效：截止到-时分秒 HH:mm:ss' ,
`pay_time_limit_date`  datetime NULL DEFAULT NULL COMMENT '方式二生效 支付时效：截止到-年月日时分秒' ,
`trace_insurance_date`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否追溯 起保日期0-否,1-是,2-仅生日单追溯' ,
`trace_insured_date`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否追溯 投保日期0-否,1-是,2-仅生日单追溯' ,
`enable_pay_rule`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否启用跨天支付规则0-否1-启用' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品条件停售计划'
AUTO_INCREMENT=53

;

-- ----------------------------
-- Table structure for `t_product_directional_link`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_directional_link`;
CREATE TABLE `t_product_directional_link` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(11) UNSIGNED NOT NULL COMMENT '关联产品id' ,
`support`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支持定向链接: 0-不支持,1-支持' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`create_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人' ,
`update_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人' ,
`need_directional_link`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '业务员填单是否需要定向链接: 0-否,1-是' ,
`validity_period`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '定向链接有效期,0-不限定,1-限定' ,
`time_value`  int(11) UNSIGNED NULL DEFAULT NULL COMMENT '有效期数值' ,
`time_unit`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '有效期单位,0-天,1-小时,2-分' ,
`un_directional`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '非定向链接分享,0-禁用,1-启用' ,
`h5_link_mode`  tinyint(1) NULL DEFAULT NULL COMMENT 'H5链接投保模式 1-H5链接投保+承保后数据回传,2-H5链接投保+过程&承保后数据回传' ,
`insurance_policy_relation`  tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '链接与保单的对应关系. 0-一对一,1-多对一' ,
`support_white_list`  tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '是否支持白名单, 0-否,1-是' ,
`link_type`  tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '链接类型，0-仅非定向链接,1-定向+非定向链接均支持,2-仅定向链接' ,
`appointment_insure`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '预约投保，0-不支持,1-填写要素转发,2-协助客户录单' ,
`allow_channela_insure`  tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否允许A端投保, 0-否,1-是' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品定向链接配置'
AUTO_INCREMENT=1401

;

-- ----------------------------
-- Table structure for `t_product_directional_link_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_directional_link_attribute`;
CREATE TABLE `t_product_directional_link_attribute` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`module_id`  int(11) UNSIGNED NOT NULL COMMENT '关联模块id: t_directional_link_module.id' ,
`attribute_id`  int(10) UNSIGNED NOT NULL COMMENT '关联属性ID' ,
`required`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否必填：1-是,0-否' ,
`by_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别名' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`create_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人' ,
`update_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_module_id` (`module_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品定向链接属性'
AUTO_INCREMENT=1440

;

-- ----------------------------
-- Table structure for `t_product_directional_link_module`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_directional_link_module`;
CREATE TABLE `t_product_directional_link_module` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`directional_link_id`  int(11) UNSIGNED NOT NULL COMMENT '关联定向链接id: t_product_directional_link.id' ,
`by_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别名' ,
`tip_content`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '提示话术富文本' ,
`sort`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`create_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人' ,
`update_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_directional_link_id` (`directional_link_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品定向链接模块'
AUTO_INCREMENT=523

;

-- ----------------------------
-- Table structure for `t_product_discount_execute`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_discount_execute`;
CREATE TABLE `t_product_discount_execute` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(11) NOT NULL COMMENT '产品id' ,
`sort`  int(10) UNSIGNED NOT NULL COMMENT '顺序' ,
`execute_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '条件类型 0:被保险人数量' ,
`min_number`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最小被保险人数量' ,
`max_number`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大被保险人数量' ,
`discount_factor`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '折扣系数,表示打折系数百分比' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`discount_tip`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端提示语' ,
`discount_premium_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '折扣保费计算类型 0=四舍五入保留2位小数 1=3进2进1保留一位小数' ,
`insurance_ids`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '限制险种id' ,
`discount_type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '类型 0-非团意,1-团意' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品折扣表'
AUTO_INCREMENT=151

;

-- ----------------------------
-- Table structure for `t_product_display`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_display`;
CREATE TABLE `t_product_display` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(10) NOT NULL DEFAULT 0 COMMENT '计划ID' ,
`pic_big_pc`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品大图PC端' ,
`pic_small_pc`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品小图PC端' ,
`pic_big_mobile`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '移动端大图' ,
`pic_small_mobile`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '移动端小图' ,
`short_description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品摘要' ,
`full_description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品详情' ,
`applicable_people`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品的适用人群' ,
`insurance_case`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险案例' ,
`special_agreement`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '特别约定' ,
`product_read`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品解读' ,
`default_price`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认价格(一段描述)' ,
`claim_id`  int(10) NOT NULL DEFAULT 0 COMMENT '索赔方式编号（依赖CompanyMaterial公司资料）' ,
`claims_ratio`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '赔付比例表编号，多个编号间用,号分隔（依赖CompanyMaterial公司资料）' ,
`master_provision`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主条款编号，多个编号间用,号分隔（依赖CompanyMaterial公司资料）' ,
`additional_provision`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附加条款编号，多个编号间用,号分隔（依赖CompanyMaterial公司资料）' ,
`comment_ids`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息编号，多个编号用逗号隔开（依赖CompanyMaterialComment公司备注信息）' ,
`picture_policy`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '保单样本' ,
`cash_value`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现金价值' ,
`picture_rate_table`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '费率表' ,
`emergency_card`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '紧急救援卡' ,
`picture_notify`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户告知书' ,
`exclusion_liability`  varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '逗号分隔：1故意伤害，2犯罪，3自杀，4酒家，5毒品，6战争，7先天遗传，8艾滋，9其他' ,
`link_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '引用超链接ID，关联t_link.id，该ID还涵盖t_product_display_faq,t_product_display_feature,t_product_display_tips表' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`reading_guide`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '本人已阅读并同意' COMMENT '阅读资料引导文案' ,
`sign_guide`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '本人已填写' COMMENT '签署文件引导文案' ,
`order_reading_guide`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '本人阅读并同意' COMMENT '核对订单阅读资料引导文案' ,
`policy_type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '保单样本类型 0-上传文件,1-富文本' ,
`policy_rich_text`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保单样本富文本类型时数据' ,
`cancel_order_reading_guide`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '本人阅读并同意' COMMENT '撤单页阅读资料引导文案' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_plan_id` (`product_plan_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品展示信息'
AUTO_INCREMENT=6771

;

-- ----------------------------
-- Table structure for `t_product_display_faq`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_display_faq`;
CREATE TABLE `t_product_display_faq` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`display_id`  int(11) NOT NULL COMMENT '展示信息ID' ,
`faq_question`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '常见问题：提问' ,
`faq_answer`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '常见问题：回答' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识：1是0否' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品展示信息常见问题'
AUTO_INCREMENT=35554

;

-- ----------------------------
-- Table structure for `t_product_display_feature`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_display_feature`;
CREATE TABLE `t_product_display_feature` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`display_id`  int(11) NOT NULL COMMENT '展示信息ID：该数据跟着产品计划走，属于产品计划下的数据' ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '特色内容' ,
`pic`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特色图片' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识：1是0否' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品特色'
AUTO_INCREMENT=4798

;

-- ----------------------------
-- Table structure for `t_product_display_important_tips`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_display_important_tips`;
CREATE TABLE `t_product_display_important_tips` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`display_id`  int(11) NOT NULL DEFAULT 0 COMMENT '展示信息ID：该数据跟着产品计划走，属于产品计划下的数据' ,
`title`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题' ,
`tips`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除标志 0 未删除 1删除' ,
`allow_delete`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否允许页面上删除 0 不允许 1允许' ,
`tip_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '类型；0-自定义须知,1-犹豫期,2-等待期,3-条款和特别约定,4-承保机构,5-线上服务,6-如实告知,7-费用扣除,8-退保损失,9-支付和凭证,10-续保提示' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`create_user_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '创建人' ,
`update_user_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '修改人' ,
PRIMARY KEY (`id`),
INDEX `idx_display_id` (`display_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='重点投保须知'
AUTO_INCREMENT=50557

;

-- ----------------------------
-- Table structure for `t_product_display_policy`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_display_policy`;
CREATE TABLE `t_product_display_policy` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`product_id`  int(11) NOT NULL COMMENT '关联产品ID' ,
`plan_id`  int(11) NOT NULL COMMENT '关联计划id' ,
`picture_policy`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保单样本' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属牌照编码' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_plan_id` (`plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='展示信息-保单样本'
AUTO_INCREMENT=4040

;

-- ----------------------------
-- Table structure for `t_product_display_temp_20171215`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_display_temp_20171215`;
CREATE TABLE `t_product_display_temp_20171215` (
`id`  int(10) NOT NULL DEFAULT 0 ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(10) NOT NULL DEFAULT 0 COMMENT '计划ID' ,
`pic_big_pc`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品大图PC端' ,
`pic_small_pc`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品小图PC端' ,
`pic_big_mobile`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '移动端大图' ,
`pic_small_mobile`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '移动端小图' ,
`short_description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品摘要' ,
`full_description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品详情' ,
`applicable_people`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品的适用人群' ,
`insurance_case`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保险案例' ,
`special_agreement`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '特别约定' ,
`product_read`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品解读' ,
`default_price`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认价格(一段描述)' ,
`claim_id`  int(10) NOT NULL DEFAULT 0 COMMENT '索赔方式编号（依赖CompanyMaterial公司资料）' ,
`claims_ratio`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '赔付比例表编号，多个编号间用,号分隔（依赖CompanyMaterial公司资料）' ,
`master_provision`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主条款编号，多个编号间用,号分隔（依赖CompanyMaterial公司资料）' ,
`additional_provision`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附加条款编号，多个编号间用,号分隔（依赖CompanyMaterial公司资料）' ,
`comment_ids`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息编号，多个编号用逗号隔开（依赖CompanyMaterialComment公司备注信息）' ,
`picture_policy`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '保单样本' ,
`cash_value`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现金价值' ,
`picture_rate_table`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '费率表' ,
`emergency_card`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '紧急救援卡' ,
`picture_notify`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户告知书' ,
`exclusion_liability`  varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '逗号分隔：1故意伤害，2犯罪，3自杀，4酒家，5毒品，6战争，7先天遗传，8艾滋，9其他' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `t_product_display_tips`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_display_tips`;
CREATE TABLE `t_product_display_tips` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`display_id`  int(11) NOT NULL COMMENT '展示信息ID：该数据跟着产品计划走，属于产品计划下的数据' ,
`tips`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提示内容' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识：1是0否' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (`id`),
INDEX `idx_display_id` (`display_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品展示信息的提示信息'
AUTO_INCREMENT=99844

;

-- ----------------------------
-- Table structure for `t_product_dual_record_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_dual_record_config`;
CREATE TABLE `t_product_dual_record_config` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID ' ,
`judgment_way`  tinyint(4) NULL DEFAULT NULL COMMENT '双录判断方式:0-我司定义规则进行判断,1-保司接口返回结果(存本地),2-保司接口返回结果(实时)' ,
`display_check_page`  tinyint(4) NULL DEFAULT NULL COMMENT '双录过程是否展示核对订单页,0-否,1-是' ,
`need_remind`  tinyint(4) NULL DEFAULT NULL COMMENT '是否提醒双录后再提交投保,0-否,1-是' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人' ,
`update_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`display_check_page_obj`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '核对订单页 展示对象,逗号分隔:1-代理人,2-投保人' ,
`need_remind_obj`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提醒双录 展示对象,逗号分隔:1-代理人,2-投保人' ,
`dual_record_node`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '双录节点 0-健告后,1-核保中,2-核保后' ,
`check_result`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否校验双录质检结果 0-否,1-是' ,
`check_state`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否校验双录状态 0-否,1-是' ,
`state_access`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '双录状态获取方式 0-无,1-接口查询,2-保司推送' ,
`can_next`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '双录单可继续下一步节点 0-无,1-提交双录后,2-双录质检通过后' ,
`result_effect_settle`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '双录单质检结果是否影响结算 0-否,1-是' ,
`inspection_state_access`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '双录质检状态获取方式 0-无需获取,1-接口查询,2-保司推送' ,
`need_remind_content`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否提醒双录后再提交为是时，展示的普通文本' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uq_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品双录配置'
AUTO_INCREMENT=395

;

-- ----------------------------
-- Table structure for `t_product_extend`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_extend`;
CREATE TABLE `t_product_extend` (
`id`  int(10) NOT NULL COMMENT '产品id,t_product的扩展表' ,
`has_stop_sale`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '0:无停售计划,1:有停售计划' ,
`stop_mail_underwriting_time`  timestamp NULL DEFAULT NULL COMMENT '停止受理邮件核保时间' ,
`stop_manual_underwriting_time`  timestamp NULL DEFAULT NULL COMMENT '停止受理人工核保时间' ,
`stop_underwriting_problem_time`  timestamp NULL DEFAULT NULL COMMENT '停止处理人核问题件' ,
`stop_submit_insure_time`  datetime NULL DEFAULT NULL COMMENT '停止提交投保' ,
`stop_not_manual_pay_time`  datetime NULL DEFAULT NULL COMMENT '停止支付（非人核单）' ,
`stop_manual_pay_time`  timestamp NULL DEFAULT NULL COMMENT '停止支付（人核单）' ,
`stop_sale_comment`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '停售计划备注' ,
`stop_sale_update_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '停售计划修改时间' ,
`stop_sale_update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '停售计划修改人' ,
`stop_sale_update_user_id`  int(11) NOT NULL COMMENT '停售计划修改人id' ,
`stop_mail_underwriting_problem_time`  datetime NULL DEFAULT NULL COMMENT '停止处理邮核问题件时间' ,
`underwriting_pass_time_start`  datetime NULL DEFAULT NULL COMMENT '核保通过时间（开始）' ,
`underwriting_pass_time_end`  datetime NULL DEFAULT NULL COMMENT '核保通过时间（截止）' ,
`pay_time_limit_type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '支付时效类型,0-无,1-方式一,2-方式二' ,
`pay_time_limit_day`  int(11) NULL DEFAULT NULL COMMENT '方式一生效 支付时效：x天' ,
`pay_time_limit_time`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方式一生效 支付时效：截止到-时分秒 HH:mm:ss' ,
`pay_time_limit_date`  datetime NULL DEFAULT NULL COMMENT '方式二生效 支付时效：截止到-年月日时分秒' ,
`trace_insurance_date`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否追溯 起保日期0-否,1-是,2-仅生日单追溯' ,
`trace_insured_date`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否追溯 投保日期0-否,1-是,2-仅生日单追溯' ,
`enable_pay_rule`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否启用跨天支付规则0-否1-启用' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品扩展信息'

;

-- ----------------------------
-- Table structure for `t_product_insurance`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_insurance`;
CREATE TABLE `t_product_insurance` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`product_id`  int(11) NOT NULL COMMENT '产品id' ,
`insurance_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '险种编码' ,
`insurance_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '险种名称' ,
`duty_type`  int(10) NOT NULL COMMENT '所属责任:试算项类型id' ,
`type`  int(4) NOT NULL COMMENT '类型（0: 主险，1: 附加险,2:其他)' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除标志 0 未删除 1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`main_insurance_id`  int(11) NOT NULL DEFAULT 0 COMMENT '主险险种id (类型为1附加险时不为0，自关联）' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_insurance_code` (`insurance_code`) USING BTREE ,
INDEX `idx_product_id_insurance_code` (`product_id`, `insurance_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品险种表'
AUTO_INCREMENT=820

;

-- ----------------------------
-- Table structure for `t_product_insurance_benefit`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_insurance_benefit`;
CREATE TABLE `t_product_insurance_benefit` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`insurance_id`  int(11) NOT NULL COMMENT '险种ID 关联表t_product_insurance' ,
`product_id`  int(11) NOT NULL COMMENT '产品id' ,
`beneficiary_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '受益方式 0无，1-法定 2-指定 12-法定和指定 3-配偶' ,
`first_beneficiary_limit`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '第一顺序受益人个数' ,
`second_beneficiary_limit`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '第二顺序受益人个数' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insurance_id` (`insurance_id`) USING BTREE ,
INDEX `idx_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品险种受益方式配置 （多主险使用）'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_product_insurance_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_insurance_item`;
CREATE TABLE `t_product_insurance_item` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`data_type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '数据类型：1承保数据、2不承保数据' ,
`item_id`  int(11) NOT NULL COMMENT '承保项目ID' ,
`item_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '承保项目名称' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品的承保项目和不承保项目'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_product_insurance_period`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_insurance_period`;
CREATE TABLE `t_product_insurance_period` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`insurance_id`  int(11) NOT NULL COMMENT '险种ID 关联表t_product_insurance' ,
`product_id`  int(11) NOT NULL COMMENT '产品id' ,
`observation_period`  int(10) NOT NULL DEFAULT 0 COMMENT '观察期' ,
`period_hesitation`  int(10) NOT NULL DEFAULT 0 COMMENT '犹豫期' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insurance_id` (`insurance_id`) USING BTREE ,
INDEX `idx_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品险种期限配置 （多主险使用）'
AUTO_INCREMENT=32

;

-- ----------------------------
-- Table structure for `t_product_insurance_renewal`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_insurance_renewal`;
CREATE TABLE `t_product_insurance_renewal` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`insurance_id`  int(11) NOT NULL COMMENT '险种ID 关联表t_product_insurance' ,
`product_id`  int(11) NOT NULL COMMENT '产品id' ,
`is_force_pay`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否强制续期费：0不支持续期、1支持续期但不强制、2按照续期缴费方式确定是否强制续费' ,
`force_pay_content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '强制续期费说明' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insurance_id` (`insurance_id`) USING BTREE ,
INDEX `idx_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品险种续期方式配置 （多主险使用）'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_product_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_order`;
CREATE TABLE `t_product_order` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`insure_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '出单类型：1：对接出单 ，2：手工出单，3：慧择出单' ,
`pre_insure_number`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保单号前缀' ,
`dock_sync_data`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否需要对接同步数据:0否，1是' ,
`company_product_code`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保险公司产品编码' ,
`buy_way`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购买方式（必填）1-线上  2-保险公司超链，3在线预约' ,
`company_buy_url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司链接' ,
`renewal_way`  tinyint(4) NULL DEFAULT NULL COMMENT '续保方式：1到官网续保 , 2自动续保（投保时） , 3不支持续保 , 4保全续保（需走线下续保）, 5不需要续保（长期险）,6慧择续保（意外险、支持续保其他短期险） 7短险续保' ,
`is_only_renewal`  tinyint(4) UNSIGNED NOT NULL DEFAULT 2 COMMENT '是否只能续保 1=是 2=否' ,
`renewal_product_id`  int(10) NULL DEFAULT NULL COMMENT '续保产品Id' ,
`manual_problem_aging`  int(10) NULL DEFAULT NULL COMMENT '人工核保记录-问题件时效' ,
`has_cancel_manual_interface`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否有撤销人工核保接口：0否，1是' ,
`is_company_check`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否需要保险公司核保:1是0否' ,
`nonstandard_check_type`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '非标准核保方式：1无，2电话核保，3邮件核保，4智能核保。(作废，使用nonstandard_check_types替代)' ,
`nonstandard_check_types`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT ',1,' COMMENT '非标准核保方式：1无，2电话核保，3邮件核保，4智能核保。多个方式英文逗号分隔' ,
`ius_owner`  tinyint(2) NULL DEFAULT NULL COMMENT '智能核保方：1慧择，2保险公司' ,
`ius_result_owner`  tinyint(2) NULL DEFAULT NULL COMMENT '智能核保结论获取方' ,
`company_check_position`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '保险公司核保位置：1前置核保，2后置核保' ,
`is_policy_change`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否支持保单变更：1是0否' ,
`is_back_interface`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否有退保接口：1有，2没有' ,
`cancel_insure_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '退保方式：1=投保当天退保 2=生效前退保 3=保期内退保 4=线下退保，5=不支持退保,6=犹豫期内退保 ,7=无限制退保' ,
`is_plan_exclude`  tinyint(4) NOT NULL DEFAULT 2 COMMENT '保障计划是否排斥：1是2否（V1.1.8版本之后该字段作废）' ,
`policy_download_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '保单下载管理:1=程序获取保单 2=慧择获取保单(保险公司发保单) 3=用户获取保单(用户亲自下载保单)，4=程序获取保单延时' ,
`policy_down_delay`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '您的电子保单会在24小时后生成' COMMENT '程序获取保单延时' ,
`policy_url`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保单下载地址' ,
`insure_confirm_letter`  tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '投保确认函 1-不对接 2-对接' ,
`is_send`  tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否寄送保单：1不支持寄送、2支持寄送、3必须寄送' ,
`send_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '保单寄送类型：如果是否寄送保单为“支持寄送”或“必须寄送”，则该项有值：1电子保单，2纸质保单，3保险卡,12电子保单和纸质保单，23纸质保单和保险卡，13点子保单和保险卡，123为全部' ,
`sender`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '寄送人，1=慧择寄送,2=保险公司寄送' ,
`has_invoice`  tinyint(4) UNSIGNED NOT NULL DEFAULT 2 COMMENT '是否有发票，1=有发票,2=无发票' ,
`invoice_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发票类型，1=电子发票,2=纸质发票，12=电子发票和纸质发票' ,
`invoice_owner`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发票抬头，1=个人,2=公司，12=个人和公司' ,
`invoice_owner_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发票抬头的个人类型，1=投保人,2=被保险人，12=保险人和被保险人' ,
`buy_limit_upper`  int(11) NULL DEFAULT NULL COMMENT '最多购买份数，限制同一被保人对该产品购买份数(20151012新需求去掉该字段)' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`create_user_id`  int(10) NOT NULL DEFAULT 0 COMMENT '创建人ID' ,
`update_user_id`  int(10) NOT NULL DEFAULT 0 COMMENT '更新人ID' ,
`renewal_grace_period`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '续保宽限期' ,
`service_credential_id`  int(11) NULL DEFAULT NULL COMMENT '服务凭证模板id' ,
`electronic_policy_id`  int(11) NULL DEFAULT NULL COMMENT '电子保单ID（company.t_policy.id）' ,
`electronic_policy_ids`  int(11) NULL DEFAULT NULL COMMENT '多人电子保单ID（company.t_policy.id）' ,
`is_cancel_check_interface`  tinyint(2) NULL DEFAULT NULL COMMENT '是否有撤销核保接口：1是0否' ,
`check_record_days`  int(10) NULL DEFAULT NULL COMMENT '核保记录时效（天）' ,
`sign_for_iu`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否需要签名。\r\n 1：是\r\n 2：否' ,
`template_of_sign_for_iu`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '签名模板路径。' ,
`template_id_of_sign_for_iu`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '签名模板文件id。默认为0' ,
`is_batch_update`  tinyint(4) NULL DEFAULT NULL COMMENT '是否有批改接口:1是，0否' ,
`batch_update_project`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批改接口适用项目：1,变更被保人。多选以逗号分隔' ,
`applicant_nonstandard_check_types`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT ',1,' COMMENT '投保人非标准核保方式：1无，2电话核保，3邮件核保，4智能核保。多个方式英文逗号分隔' ,
`manual_underwriting_result`  tinyint(4) NULL DEFAULT NULL COMMENT '人核结果: 1人核补充智核，2以人核为准 默认为空' ,
`manual_underwriting_entrance`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '人核入口配置：0无，1其他疾病' ,
`is_month_renewal_check`  tinyint(4) NULL DEFAULT NULL COMMENT '月缴续期确认缴费  0:否 1是' ,
`interface_need_some_back`  tinyint(4) NULL DEFAULT 0 COMMENT '退保接口是否允许部分退保 0-否,1-是' ,
`renewal_short_insurance`  tinyint(4) NULL DEFAULT NULL COMMENT '短险续保,0-不支持续保,1-保司续保,2-慧择续保' ,
`renewal_ensure`  tinyint(4) NULL DEFAULT NULL COMMENT '保证续保 0是，1否' ,
`renewal_year`  int(5) NULL DEFAULT NULL COMMENT '保证续保年数' ,
`period_refund_party`  tinyint(4) NULL DEFAULT NULL COMMENT '犹豫期退保退款方 1-慧择,2-保险公司' ,
`self_period_cancel_insurance`  tinyint(4) NULL DEFAULT 0 COMMENT '是否开放自助犹豫期退保 0-否,1-是' ,
`renewal_start_day`  int(5) NULL DEFAULT NULL COMMENT '续保起期天数' ,
`check_record_every_days`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核保记录时效(每天)' ,
`period_failure_deal_type`  tinyint(2) NULL DEFAULT NULL COMMENT '已过宽限期续期失败处理方式 1-退保,2-保单失效（慧择）' ,
`insure_company_lock`  tinyint(2) NULL DEFAULT NULL COMMENT '续期扣款是否对接保险公司锁单 1-是  0-否' ,
`renewal_notice_company`  tinyint(2) NULL DEFAULT NULL COMMENT '续期数据通知保险公司 1-是  0-否' ,
`allow_cancel_check`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否允许用户撤销核保记录 1-是 0-否' ,
`auto_renewal`  tinyint(4) UNSIGNED NULL DEFAULT NULL COMMENT '1-不支持,2-必须自动续保,3-可选自动续保默认是,4-可选默认续保无默认' ,
`underwriting_total_day`  int(10) UNSIGNED NULL DEFAULT NULL COMMENT '核保总时长,单位天' ,
`underwriting_total_time`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核保总时长截止到，格式 HH:mm:ss' ,
`manual_problem_aging_time`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人工核保记录-问题件时效截止时间, 格式 HH:mm:ss' ,
`underwriting_result_period_day`  int(10) UNSIGNED NULL DEFAULT NULL COMMENT '核保结论有效期,单位天' ,
`underwriting_result_period_time`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核保结论有效期截止时间, 格式 HH:mm:ss' ,
`human_underwriting_invalid_time`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人核记录失效，格式 HH:mm:ss' ,
`invalid_notify`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失效时是否需要调用保司撤单接口 0-否,1-是' ,
`buy_url_way`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '获取购买链接方式（购买方式为2时必填）1-指定链接地址,2-保司接口获取链接' ,
`manual_underwriting_apply_day`  int(10) UNSIGNED NULL DEFAULT NULL COMMENT '人核申请时效天' ,
`manual_underwriting_apply_time`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人核申请时效截止到，格式 HH:mm:ss' ,
`renewal_by_conversion`  tinyint(4) NULL DEFAULT NULL COMMENT '是否续转保：0-否,1-是' ,
`check_record_time`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '核保记录时效(时分秒)' ,
`cancel_condition`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主动撤单条件,多个,逗号分隔 1-核保通过未支付或支付失败,2-人核中' ,
`manual_party`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '核保方 0-慧择,1-保司' ,
`new_manual`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否新人核方式 0-否,1-是' ,
`letter_interactive_method`  tinyint(4) NULL DEFAULT NULL COMMENT '问题件交互方式 1-补充资料(老流程),2-问题件' ,
`expire_call_cancel_check`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '核保记录过期是否调用保司撤销接口1-是,0否' ,
`except_remove_duplicate`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '智能核保除外责任是否去重1-是,0否' ,
`issue_first_apply_day`  int(10) UNSIGNED NULL DEFAULT NULL COMMENT '初审问题件时效天' ,
`issue_first_apply_time`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '初审问题件时效截止到，格式 HH:mm:ss' ,
`start_record_time`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '起保记录时效(时分秒)' ,
`start_record_days`  int(10) NULL DEFAULT NULL COMMENT '起保记录时效（天）' ,
`manual_result_type`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '人核结果,多个英文逗号分隔 1-变更被保险人,2-变更险种' ,
`underwriting_record_timeliness`  int(11) NULL DEFAULT NULL COMMENT '核保记录通过时效，单位天' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品出单配置'
AUTO_INCREMENT=6871

;

-- ----------------------------
-- Table structure for `t_product_order_limit`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_order_limit`;
CREATE TABLE `t_product_order_limit` (
`id`  int(10) NOT NULL AUTO_INCREMENT COMMENT '自动增长主键ID' ,
`order_id`  int(10) NOT NULL COMMENT '保单配置ID' ,
`product_id`  int(11) NULL DEFAULT NULL COMMENT '产品ID' ,
`product_plan_id`  int(11) NULL DEFAULT NULL COMMENT '产品计划ID' ,
`variable`  int(11) NULL DEFAULT NULL COMMENT '统计变量 t_dictionary_value.id' ,
`conditions`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '约束条件：0=大于，1=大于等于，2=小于，3=小于等于，4=不等于，5=等于，6=包含，7=不包含' ,
`value`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束值' ,
`unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '单位 见t_unit表' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `o_id` (`order_id`) USING BTREE ,
INDEX `plan_id` (`product_plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='出单配置-保额限制表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_product_order_temp_20171215`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_order_temp_20171215`;
CREATE TABLE `t_product_order_temp_20171215` (
`id`  int(10) NOT NULL DEFAULT 0 ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`insure_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '出单类型：1：对接出单 ，2：手工出单，3：慧择出单' ,
`pre_insure_number`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保单号前缀' ,
`dock_sync_data`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否需要对接同步数据:0否，1是' ,
`company_product_code`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保险公司产品编码' ,
`buy_way`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购买方式（必填）1-线上  2-保险公司超链，3在线预约' ,
`company_buy_url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司链接' ,
`renewal_way`  tinyint(4) NULL DEFAULT NULL COMMENT '续保方式：1到官网续保 , 2自动续保（投保时） , 3不支持续保 , 4保全续保（需走线下续保）, 5不需要续保（长期险）,6慧择续保（意外险、支持续保其他短期险）' ,
`is_only_renewal`  tinyint(4) UNSIGNED NOT NULL DEFAULT 2 COMMENT '是否只能续保 1=是 2=否' ,
`renewal_product_id`  int(10) NULL DEFAULT NULL COMMENT '续保产品Id' ,
`is_company_check`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否需要保险公司核保:1是0否' ,
`nonstandard_check_type`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '非标准核保方式：1无，2电话核保，3邮件核保，4智能核保' ,
`company_check_position`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '保险公司核保位置：1前置核保，2后置核保' ,
`is_policy_change`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否支持保单变更：1是0否' ,
`is_back_interface`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否有退保接口：1有，2没有' ,
`cancel_insure_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '退保方式：1=投保当天退保 2=生效前退保 3=保期内退保 4=线下退保，5=不支持退保,6=犹豫期内退保 ,7=无限制退保' ,
`is_plan_exclude`  tinyint(4) NOT NULL DEFAULT 2 COMMENT '保障计划是否排斥：1是2否（V1.1.8版本之后该字段作废）' ,
`policy_download_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '保单下载管理:1=程序获取保单 2=慧择获取保单(保险公司发保单) 3=用户获取保单(用户亲自下载保单)，4=程序获取保单延时' ,
`policy_down_delay`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '您的电子保单会在24小时后生成' COMMENT '程序获取保单延时' ,
`policy_url`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保单下载地址' ,
`is_send`  tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否寄送保单：1不支持寄送、2支持寄送、3必须寄送' ,
`send_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '保单寄送类型：如果是否寄送保单为“支持寄送”或“必须寄送”，则该项有值：1电子保单，2纸质保单，3保险卡,12电子保单和纸质保单，23纸质保单和保险卡，13点子保单和保险卡，123为全部' ,
`sender`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '寄送人，1=慧择寄送,2=保险公司寄送' ,
`has_invoice`  tinyint(4) UNSIGNED NOT NULL DEFAULT 2 COMMENT '是否有发票，1=有发票,2=无发票' ,
`invoice_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发票类型，1=电子发票,2=纸质发票，12=电子发票和纸质发票' ,
`invoice_owner`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发票抬头，1=个人,2=公司，12=个人和公司' ,
`invoice_owner_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发票抬头的个人类型，1=投保人,2=被保险人，12=保险人和被保险人' ,
`buy_limit_upper`  int(11) NULL DEFAULT NULL COMMENT '最多购买份数，限制同一被保人对该产品购买份数(20151012新需求去掉该字段)' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`create_user_id`  int(10) NOT NULL DEFAULT 0 COMMENT '创建人ID' ,
`update_user_id`  int(10) NOT NULL DEFAULT 0 COMMENT '更新人ID' ,
`renewal_grace_period`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '续保宽限期' ,
`service_credential_id`  int(11) NULL DEFAULT NULL COMMENT '服务凭证模板id' ,
`electronic_policy_id`  int(11) NULL DEFAULT NULL COMMENT '电子保单ID（company.t_policy.id）' ,
`electronic_policy_ids`  int(11) NULL DEFAULT NULL COMMENT '多人电子保单ID（company.t_policy.id）' ,
`is_cancel_check_interface`  tinyint(2) NULL DEFAULT NULL COMMENT '是否有撤销核保接口：1是0否' ,
`check_record_days`  int(10) NULL DEFAULT NULL COMMENT '核保记录时效（天）' 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `t_product_plan`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_plan`;
CREATE TABLE `t_product_plan` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`en_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划英文名' ,
`encoding`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划编码' ,
`name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品计划名称' ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_sna_id`  int(10) NULL DEFAULT 1 COMMENT '产品快照ID' ,
`plan_sna_id`  int(10) NULL DEFAULT NULL COMMENT '计划快照ID' ,
`sort`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '排序序号' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_user_id`  int(11) NOT NULL COMMENT '修改者用户Id' ,
`update_user_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者名称。' ,
`status`  tinyint(4) NULL DEFAULT 0 COMMENT '状态：0启动 1不启用' ,
`renewal_plan_ids`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原续保计划' ,
`renewal_plan_healthy_ids`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原续保计划需健告' ,
`receive_age_type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '领取年龄展示方式: 0-年初年龄,1-年末年龄' ,
`default_equity`  int(11) NULL DEFAULT NULL COMMENT '默认显示利率ID' ,
`publish_sale_name`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '披露销售名' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-计划'
AUTO_INCREMENT=112181

;

-- ----------------------------
-- Table structure for `t_product_plan_append`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_plan_append`;
CREATE TABLE `t_product_plan_append` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(10) NOT NULL COMMENT '产品计划ID' ,
`append_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '追加计划名称' ,
`formula_display`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公式展示（供页面使用）' ,
`formula`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公式' ,
`formula_type`  tinyint(4) NULL DEFAULT 0 COMMENT '公式类型 0:公式 1:固定' ,
`decimal_format`  tinyint(4) NULL DEFAULT 0 COMMENT '小数点格式 0:四舍五入留2位 1:遇小数进位 2:忽略 3:四舍五入留1位 4:舍去小数 5:四舍五入取整' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`exist_premium`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '该保障项是否有上传费率excel表，0：存在  1：不存在' ,
`algorithm_id`  int(10) NULL DEFAULT NULL COMMENT '追加计划计算算法id，关联`t_product_append_algorithm`' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-追加计划'
AUTO_INCREMENT=9

;

-- ----------------------------
-- Table structure for `t_product_plan_droit`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_plan_droit`;
CREATE TABLE `t_product_plan_droit` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`plan_id`  int(10) NOT NULL COMMENT '产品计划ID' ,
`droit_id`  int(10) NOT NULL COMMENT 'Ȩ' ,
PRIMARY KEY (`id`),
INDEX `planId_droitId` (`plan_id`, `droit_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='计划其他权利'
AUTO_INCREMENT=12437

;

-- ----------------------------
-- Table structure for `t_product_product_project`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_product_project`;
CREATE TABLE `t_product_product_project` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`project_type_id`  int(11) NOT NULL COMMENT '项目类型ID' ,
`project_id`  int(11) NOT NULL COMMENT '项目ID' ,
`data_type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '数据类型：1承保项目，2不承保项目' ,
PRIMARY KEY (`id`),
INDEX `proId` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品承保项目中间表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_product_project`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_project`;
CREATE TABLE `t_product_project` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`project_type_id`  int(11) NOT NULL COMMENT '项目类型ID' ,
`project_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名称' ,
`description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `type_id` (`project_type_id`, `deleted`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Table structure for `t_product_project_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_project_type`;
CREATE TABLE `t_product_project_type` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`type_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型名称' ,
`description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品项目类型'
AUTO_INCREMENT=5

;

-- ----------------------------
-- Table structure for `t_product_protect_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_protect_item`;
CREATE TABLE `t_product_protect_item` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`flag`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一标示' ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(10) NOT NULL COMMENT '产品计划ID' ,
`insurance_id`  int(11) NULL DEFAULT NULL COMMENT '险种ID 关联表t_product_insurance' ,
`trial_item_id`  int(10) NOT NULL DEFAULT 0 COMMENT '试算项ID' ,
`duty_type`  int(10) NOT NULL DEFAULT 0 COMMENT '所属责任:试算项类型id' ,
`type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '类型（0: 主险，1: 附加险,2:其他)' ,
`buy_singly`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '是否可以单独购买' ,
`insure_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '保障项名称' ,
`formula_display`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公式展示（供页面显示)' ,
`formula`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公式' ,
`formula_type`  tinyint(1) NULL DEFAULT 0 COMMENT '公式类型: 0公式，1固定' ,
`algorithm_key`  int(10) NULL DEFAULT NULL COMMENT '算法key' ,
`decimal_format`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '小数点格式 0=四舍五入留2位 1=遇小数进位 2=忽略 3=四舍五入留1位 4=舍去小数 5=四舍五入取整 6=保留两位小数后再取整' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`create_user_id`  int(10) NOT NULL DEFAULT 0 COMMENT '创建人ID' ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人名' ,
`exist_premium`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '该保障项是否有上传费率excel表，0：存在  1：不存在' ,
PRIMARY KEY (`id`),
INDEX `idx_insurance_id` (`insurance_id`) USING BTREE ,
INDEX `idx_plan_id` (`product_plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-保障项或费率项'
AUTO_INCREMENT=43253

;

-- ----------------------------
-- Table structure for `t_product_reading_material`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_reading_material`;
CREATE TABLE `t_product_reading_material` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`plan_id`  int(11) NOT NULL COMMENT '计划ID' ,
`source_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '资料来源:0-阅读资料' ,
`source_id`  int(11) NOT NULL COMMENT '资料id' ,
`show_title`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '展示标题' ,
`suit_for`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '适用对象 0-投保人，1-被保人，2-代理人 多个用逗号隔开' ,
`restrict_rule`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '展示条件.0-投被保险人非同一人时展示,1-居住省市仅深圳地区展示,2-居住省市广东除深圳以外地区展示,3-试算缴费年限选择趸交展示,4-试算缴费年限选择期交展示,5-投保人年龄大于等于60周岁时展示' ,
`sort`  int(10) NOT NULL DEFAULT 0 COMMENT '排序' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人' ,
`update_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人' ,
`show_type`  tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '资料展示类型：0-阅读资料,1-核对订单阅读资料' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '展示牌照' ,
`custom_config`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阅读资料自定义配置' ,
PRIMARY KEY (`id`),
INDEX `idx_source_id` (`source_id`) USING BTREE ,
INDEX `idx_plan_id` (`plan_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='展示信息阅读资料'
AUTO_INCREMENT=2881

;

-- ----------------------------
-- Table structure for `t_product_renewal_relation`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_renewal_relation`;
CREATE TABLE `t_product_renewal_relation` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`renewal_product_id`  int(11) NOT NULL COMMENT '续保产品ID' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_renewal_product_id` (`renewal_product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='续保产品关联表'
AUTO_INCREMENT=1369

;

-- ----------------------------
-- Table structure for `t_product_rescue`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_rescue`;
CREATE TABLE `t_product_rescue` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`has_rescue`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否包含救援服务：1是0否' ,
`provider`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '救援服务提供方：1保险公司，2慧择' ,
`organization`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '救援机构' ,
`phone`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '紧急救援电话' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_product` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品紧急救援服务'
AUTO_INCREMENT=1042

;

-- ----------------------------
-- Table structure for `t_product_restrict`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_restrict`;
CREATE TABLE `t_product_restrict` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(11) NULL DEFAULT NULL COMMENT '产品计划ID' ,
`trial_item_id`  int(11) NULL DEFAULT NULL COMMENT '试算项ID' ,
`NAME`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`execute_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行类型：0=满足以下所有条件 1=满足以下任一条件' ,
`type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '约束类型 0=一般约束 1=默认约束' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`is_general_restrict`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否通用约束 0:不是,1:是 默认0' ,
`general_restrict_id`  int(11) UNSIGNED NULL DEFAULT NULL COMMENT '通用约束id' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`sort`  int(6) UNSIGNED NULL DEFAULT 0 COMMENT '排序' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-约束项'
AUTO_INCREMENT=133950

;

-- ----------------------------
-- Table structure for `t_product_restrict_common`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_restrict_common`;
CREATE TABLE `t_product_restrict_common` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`product_id`  int(11) NOT NULL ,
`product_plan_id`  int(11) NOT NULL ,
`total_premium`  int(11) NULL DEFAULT NULL ,
`min_year_premium`  int(11) NULL DEFAULT NULL ,
`min_season_premium`  int(11) NULL DEFAULT NULL COMMENT '季缴保费最低值，以元为单位' ,
`min_month_premium`  int(11) NULL DEFAULT NULL COMMENT '月缴保费最低值，以元为单位' ,
`min_year_single_premium`  int(1) NULL DEFAULT NULL COMMENT '趸交保费最低值,以元为单位' ,
`not_apply_high_premium`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '不适用高保费规则(0不勾选，1勾选)' ,
`high_preminum_notice`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '高保费提示，not_apply_high_premium为1时可配置。当保费超过20万，且不适用高保费规则会提示' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (`id`),
UNIQUE INDEX `unique_product_plan_id` (`product_plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=12213

;

-- ----------------------------
-- Table structure for `t_product_restrict_execute`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_restrict_execute`;
CREATE TABLE `t_product_restrict_execute` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`restrict_id`  int(10) NOT NULL COMMENT '约束ID' ,
`protect_item_id`  int(10) NULL DEFAULT NULL COMMENT '(作废)保障项ID' ,
`trial_gene_id`  int(10) NULL DEFAULT NULL COMMENT '试算因子ID' ,
`premium_sum_id`  int(10) NULL DEFAULT NULL COMMENT '总保费id 组合保费id t_product_trial_item.id' ,
`premium_single_id`  int(10) NULL DEFAULT NULL COMMENT '单个保费id t_product_protect_item.id' ,
`other_type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他类型执行条件,job:职业' ,
`conditions`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '约束条件：0=大于，1=大于等于，2=小于，3=小于等于，4=不等于，5=等于，6=包含，7=不包含' ,
`value`  varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Լ' ,
`unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '单位 见t_unit表' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`formula_display`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公式展示（供页面显示)' ,
`formula`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公式' ,
`formula_type`  tinyint(1) NULL DEFAULT NULL COMMENT '公式类型: 0公式，1固定' ,
`exe_type`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '0公式约束，1 一般约束' ,
PRIMARY KEY (`id`),
INDEX `idx_restrict_id` (`restrict_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-约束项-约束计算'
AUTO_INCREMENT=426941

;

-- ----------------------------
-- Table structure for `t_product_restrict_result`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_restrict_result`;
CREATE TABLE `t_product_restrict_result` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`restrict_id`  int(10) NOT NULL COMMENT '约束ID' ,
`trial_gene_id`  int(10) NULL DEFAULT NULL COMMENT '试算因子ID' ,
`protect_item_id`  int(10) NULL DEFAULT NULL COMMENT '(作废)保障项ID' ,
`conditions`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '约束条件：0=大于，1=大于等于，2=小于，3=小于等于，4=不等于，5=等于，6=包含，7=不包含,8=不投保,9=提示,10=关联变量' ,
`value`  varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Լ' ,
`unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '单位 见t_unit表' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`default_value`  varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '约束结果默认值' ,
`default_value_unit`  tinyint(4) NULL DEFAULT NULL COMMENT '删除' ,
`formula_display`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公式展示（供页面显示)' ,
`formula`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公式' ,
`formula_type`  tinyint(1) NULL DEFAULT NULL COMMENT '公式类型: 0公式，1固定' ,
`res_type`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '0公式约束，1 一般约束' ,
PRIMARY KEY (`id`),
INDEX `idx_restrict_id` (`restrict_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-约束项-约束结果'
AUTO_INCREMENT=168763

;

-- ----------------------------
-- Table structure for `t_product_restrict_rule_cache`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_restrict_rule_cache`;
CREATE TABLE `t_product_restrict_rule_cache` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(10) NOT NULL COMMENT '产品计划ID' ,
`cache_table`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缓存表' ,
`cache_key`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '缓存key' ,
`restrict_rule`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缓存值,json格式' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-约束规则-缓存'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_product_restrict_special_cache`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_restrict_special_cache`;
CREATE TABLE `t_product_restrict_special_cache` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(10) NOT NULL COMMENT '产品计划ID' ,
`cache_table`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缓存表' ,
`cache_key`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '缓存key' ,
`restrict_relation`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '缓存值,json格式' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-特殊约束-缓存'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_product_sale_org`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_sale_org`;
CREATE TABLE `t_product_sale_org` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_user`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '创建人' ,
`update_user`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '更新人' ,
`product_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '产品id' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '所属牌照' ,
`branch_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分支机构id' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-线下产品销售机构'
AUTO_INCREMENT=3852

;

-- ----------------------------
-- Table structure for `t_product_sign_material`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_sign_material`;
CREATE TABLE `t_product_sign_material` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(10) UNSIGNED NOT NULL COMMENT '产品ID' ,
`plan_id`  int(10) UNSIGNED NOT NULL COMMENT '计划ID' ,
`source_type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '签署文件来源:0-健康告知' ,
`source_id`  int(10) UNSIGNED NOT NULL COMMENT '关联签署文件id' ,
`show_title`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '展示标题' ,
`suit_for`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '适用对象 0-投保人，1-被保人，2-代理人 多个用逗号隔开' ,
`sort`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人' ,
`update_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人' ,
PRIMARY KEY (`id`),
INDEX `idx_source_id` (`source_id`) USING BTREE ,
INDEX `idx_plan_id` (`plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='展示信息-产品签署文件'
AUTO_INCREMENT=50

;

-- ----------------------------
-- Table structure for `t_product_status_option`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_status_option`;
CREATE TABLE `t_product_status_option` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`old_status`  tinyint(4) NOT NULL DEFAULT '-1' COMMENT '操作前的产品状态：-1表示新增产品还没有状态。' ,
`opt_status`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '操作产品状态：1上架，2下架，3停售' ,
`is_first_up`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否首次上架：1是0否，2表示初始化的数据' ,
`is_first_down`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否首次下架：1是0否，2表示初始化的数据' ,
`opt_uid`  int(11) NULL DEFAULT NULL COMMENT '操作用户ID' ,
`opt_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人名称' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_status` (`product_id`, `opt_status`, `old_status`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品状态修改记录表'
AUTO_INCREMENT=61120

;

-- ----------------------------
-- Table structure for `t_product_tag`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_tag`;
CREATE TABLE `t_product_tag` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`tag_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名称' ,
`tag_description`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签说明' ,
`tag_type`  tinyint(2) NOT NULL COMMENT '标签类型：1保障项' ,
`update_user_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='标签'
AUTO_INCREMENT=137

;

-- ----------------------------
-- Table structure for `t_product_temp_20171215`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_temp_20171215`;
CREATE TABLE `t_product_temp_20171215` (
`id`  int(10) NOT NULL DEFAULT 0 ,
`en_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品英文名' ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`insure_operation`  tinyint(4) NULL DEFAULT 0 COMMENT '险种运营：1=人寿险 2=意健险 3=财产险' ,
`status`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '产品状态：0待审，1上架，2下架，3停售，4测试' ,
`status_updater`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态修改者：1人工，2系统' ,
`suit_for_limit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '适用平台是否限制：1是0否' ,
`suit_for`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '适用平台：1慧择，3聚米，2渠道，4海外，5大白。多个平台逗号分隔。' ,
`is_renewal`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否续保产品：1是0否' ,
`renewal_product_id`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '续保产品ID' ,
`is_hz_owner`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否慧择自有产品：1是0否' ,
`sna_id`  int(11) NULL DEFAULT 1 COMMENT '快照ID' ,
`company_id`  int(10) NOT NULL DEFAULT 0 COMMENT '保险公司ID' ,
`company_branch_id`  int(10) NULL DEFAULT 0 COMMENT '支分机构ID' ,
`category_id`  int(11) NOT NULL DEFAULT 0 COMMENT '产品类别ID' ,
`parent_product_id`  int(11) NULL DEFAULT NULL COMMENT '母产品ＩＤ（结算系统使用）' ,
`insurant_type`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '被保险人类型：1,1,1,1 (四个数分别代表：本人、其他、多人、团单，1是0否)' ,
`is_support_split_single`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否支持每人一单（拆单）：1是，0否' ,
`is_support_many_people`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否支持多人一单 1是 0否' ,
`is_support_mp_premium`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否支持多人不同保费出一单：1是，0否' ,
`is_insurant_payment`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否根据被保人数量缴费 1是 0否' ,
`adult_min_people`  int(10) NOT NULL DEFAULT 0 COMMENT '成年人最少人数' ,
`adult_people`  int(10) NOT NULL DEFAULT 0 COMMENT '被保人组成限制 成年人最多个数' ,
`juveniles_min_people`  int(10) NOT NULL DEFAULT 0 COMMENT '未成年人最少人数' ,
`juveniles_people`  int(10) NOT NULL DEFAULT 0 COMMENT '被保人组成限制 未成年人最多个数' ,
`min_people`  int(10) NULL DEFAULT 0 COMMENT '被保险人人数限制' ,
`max_people`  int(10) NULL DEFAULT 0 COMMENT '被保险人人数限制' ,
`is_insurant_adult`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '如果被保险人为成年人，是否限制投保人只能为本人： 1是 0否' ,
`is_insurant_juveniles`  tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '如果被保险人为未成年人，是否限制投保人只能为其父母或法定监护人 1是 0否' ,
`is_compensate`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否包含拒签补偿：1是0否' ,
`beneficiary_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '受益方式 0无，1-法定 2-指定 12-法定和指定' ,
`first_beneficiary_limit`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '第一顺序受益人个数' ,
`second_beneficiary_limit`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '第二顺序受益人个数' ,
`observation_period`  int(10) NULL DEFAULT 0 COMMENT '观察期' ,
`period_hesitation`  int(10) NULL DEFAULT 0 COMMENT '犹豫期限' ,
`single_day_limit`  int(11) NULL DEFAULT NULL COMMENT '单次出行天数限制' ,
`insure_time`  tinyint(4) NULL DEFAULT 1 COMMENT '起保时间：1可选起保日期，2固定起保日期，3根据保险公司实际情况确定起保时间' ,
`company_order_time`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '起保日期为保险公司出单日期' ,
`first_date`  int(10) NULL DEFAULT NULL COMMENT '可选的投保日期开始时间，0代表当日' ,
`latest_date`  int(10) NULL DEFAULT NULL COMMENT '可选的投保日期结束时间。0代表当日' ,
`deadline`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当天投保截止时间： 24:00' ,
`insurance_time`  int(10) NOT NULL DEFAULT 0 COMMENT '投保起保时间： 小时' ,
`terminal_time`  tinyint(4) NULL DEFAULT 0 COMMENT '终止时间的计算方式：0.满24小时截止，1.按自然日截止' ,
`fixed_date`  timestamp NULL DEFAULT NULL COMMENT '固定起保日期' ,
`fixed_latest_date`  timestamp NULL DEFAULT NULL COMMENT '固定起保日期投保截止时间' ,
`fix_insure_type`  tinyint(4) NULL DEFAULT 1 COMMENT '固定起保日期类型：1每月，2每年' ,
`fix_insure_start_day`  tinyint(4) NULL DEFAULT NULL COMMENT '每月固定起保日期开始日期:1~28号' ,
`fix_insure_start_time`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每月固定起保日期开始时间：格式23:59' ,
`fix_insure_end_day`  tinyint(4) NULL DEFAULT NULL COMMENT '每月固定起保日期结束日期:1~28号' ,
`fix_insure_end_time`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每月固定起保日期结束时间：格式23:59' ,
`fix_insure_start_datetime`  timestamp NULL DEFAULT NULL COMMENT '每年固定起保开始日期' ,
`fix_insure_end_datetime`  timestamp NULL DEFAULT NULL COMMENT '每年固定起保结束日期' ,
`fixed_show_content`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指定保障期间显示内容' ,
`insure_time_precision`  tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '保障期限精度' ,
`insured_age_calculation`  tinyint(4) UNSIGNED NULL DEFAULT NULL COMMENT '被保人年龄计算方式：1=起保日期 2=投保日期' ,
`insure_include_birthday`  tinyint(4) NULL DEFAULT 1 COMMENT '保费计算是否包含生日当天：0是1否' ,
`chinese_tax_resident_limit`  tinyint(4) NULL DEFAULT 0 COMMENT '是否仅限中国税收居民购买，1:是,0:否' ,
`insure_declare_id`  int(10) NULL DEFAULT NULL COMMENT '投保声明' ,
`health_inform_app_id`  int(10) NULL DEFAULT NULL COMMENT '健康告知 手机APP' ,
`health_inform_web_id`  int(10) NULL DEFAULT NULL COMMENT '健康告知 web' ,
`health_inform_position`  tinyint(4) NULL DEFAULT NULL COMMENT '健康告知显示时间：0填写投保信息中，1填写投保信息后' ,
`financial_inform_id`  int(10) NULL DEFAULT NULL COMMENT '财务告知' ,
`order_inform_id`  int(10) NULL DEFAULT NULL COMMENT '其他告知' ,
`major_disease_type`  int(10) NULL DEFAULT NULL COMMENT '重大疾病种类' ,
`is_other_company_insure`  tinyint(4) NULL DEFAULT 1 COMMENT '是否设置其他公司身故投保保额：1是0否(20151012需求已删除)' ,
`other_company_insure_content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设置其他公司身故投保保额内容说明(20151012需求已删除)' ,
`job_template_id`  int(10) NULL DEFAULT 0 COMMENT '职业模板(JobTemplate 表)' ,
`juveniles_job_id`  int(11) NULL DEFAULT NULL COMMENT '未成年默认职业' ,
`job_grade`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业等级 以逗号分隔' ,
`insure_is_new_area`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否应用新的地区库（0否，1是）' ,
`wealth_is_new_area`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否应用新的地区库（0否，1是）' ,
`un_insure_area`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '不承保地区' ,
`un_insure_job`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '不承包职业' ,
`travel_area`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出行目的地' ,
`is_force_pay`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否强制续期费：0不支持续期、1支持续期但不强制、2按照续期缴费方式确定是否强制续费、3强制续期' ,
`force_pay_content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '强制续期费说明' ,
`force_pay_bank_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '续期缴费银行ID列表，多个银行id逗号分隔' ,
`force_pay_bank_check`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '续期缴费银行是否需要小额支付验证：1是0否' ,
`alipay_account`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否银行代扣：1是0否' ,
`charge_bank_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '代扣银行ID列表，多个id用逗号分隔' ,
`charge_bank_check`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '代扣银行是否需要小额支付验证：1是0否' ,
`charge_bank_position`  tinyint(4) NULL DEFAULT 0 COMMENT '代扣银行信息呈现位置：0填写投保信息中，1填写投保信息后' ,
`is_company_charge`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否保险公司代收：1是0否' ,
`company_charge_way`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保险公司代收时，支持的支付方式：1银联、2支付宝、3微信支付、4易宝、5财付通' ,
`company_charge_bank_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保险公司代收的支付方式支持银联时候，支持哪些银行ID，多个银行ID逗号分隔' ,
`company_charge_bank_check`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '保险公司代收选择银行支付时，是否需要小额支付验证：1是0否' ,
`bank_branch_template`  int(11) NOT NULL DEFAULT 0 COMMENT '银行支行模板id,company.t_company_bank_area_template.id' ,
`renewal_charge_way`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '续期保费收取：1保险公司，2慧择' ,
`company_renewal_charge_way`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '选择保险公司代收时，需填写具体的代收方式：1银行代扣（不排除以后有别的）' ,
`destination_select_one`  tinyint(4) NULL DEFAULT 0 COMMENT '目的地只允许用户选择一个国家/地区:1是0否' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`create_user_id`  int(10) NOT NULL DEFAULT 0 COMMENT '创建人ID' ,
`update_user_id`  int(10) NOT NULL DEFAULT 0 COMMENT '更新人ID' ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人名' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人名' ,
`calculate_type`  tinyint(1) NULL DEFAULT 0 COMMENT '保障期限计算方式 0自然 1固定' ,
`next_day_deadline`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '次日投保截止日期: 24:00' ,
`is_template_product`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否模板产品' 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `t_product_trial_algorithm`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_trial_algorithm`;
CREATE TABLE `t_product_trial_algorithm` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '算法名称' ,
`class_path`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应的算法类' ,
`description`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '算法说明' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='算法'
AUTO_INCREMENT=8

;

-- ----------------------------
-- Table structure for `t_product_trial_basic_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_trial_basic_info`;
CREATE TABLE `t_product_trial_basic_info` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(10) NOT NULL COMMENT '产品计划ID' ,
`trial_item_id`  int(10) NOT NULL DEFAULT 0 COMMENT '试算项ID' ,
`decimal_format`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '属性值同t_product_protect_item表decimal_format字段' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标志，0 不删除 1 删除' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=13478

;

-- ----------------------------
-- Table structure for `t_product_trial_cache_status`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_trial_cache_status`;
CREATE TABLE `t_product_trial_cache_status` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`type`  tinyint(4) NOT NULL COMMENT '初始化类型： 1：试算因子 2：试算项 3：试算费率' ,
`create_date`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '初始化时间' ,
`status`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '初始化状态：0初始化中 1初始化成功 2 初始化失败' ,
`desc`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '初始化结果描述' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='缓存状态'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_product_trial_default`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_trial_default`;
CREATE TABLE `t_product_trial_default` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(10) NOT NULL COMMENT '产品计划ID' ,
`trial_item_id`  int(10) NULL DEFAULT 0 COMMENT '试算项ID' ,
`cache_table`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '默认值' ,
`cache_key`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`restrict_rule`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缓存值,json格式' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_plan_id_trial_item_id` (`product_plan_id`, `trial_item_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品计划-试算项-缓存-包含默认缓存'
AUTO_INCREMENT=13200

;

-- ----------------------------
-- Table structure for `t_product_trial_gene`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_trial_gene`;
CREATE TABLE `t_product_trial_gene` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(10) NOT NULL COMMENT '产品计划ID' ,
`protect_item_id`  int(10) NOT NULL COMMENT '保障项(费率)ID' ,
`trial_gene_id`  int(10) NOT NULL COMMENT '试算因子ID' ,
`dic_ids`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据字典id，多个id之间以半角逗号隔开 地区职业时，该字段无值' ,
`control_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '控件类型：0=表示下拉框,1=日历控件，2=同时出现下拉框和日历控件区间,3=文本输入框 4=地区  5=职业  6文本' ,
`area_type`  tinyint(4) NULL DEFAULT NULL COMMENT '地区类型：1=省  2=省市 3=省市区' ,
`byname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '别名：用于约束的名字' ,
`remark`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注' ,
`sort`  tinyint(4) NULL DEFAULT 0 COMMENT '排序' ,
`excel_type`  tinyint(4) UNSIGNED NOT NULL COMMENT 'excel类型：0=运算 1=制表' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`value_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '值来源: 0=普通(参数传入）1=算法计算(根据其他试算因子依赖算法计算得到)' ,
`algorithm_context_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '算法上下文名称,value_type=1时需要配置,关联t_trial_gene_algorithm.context_name' ,
`depend_gene_keys`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '依赖的试算因子key,多个逗号隔开，保额为x+费率表ID。value_type=1时需要配置' ,
`job_group_code`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业分组 A00全部,A01未分组,其他关联(CompanyJobGroup.job_group_code)' ,
`co_insurance_id`  int(11) NULL DEFAULT NULL COMMENT '险种id,关联t_c_insurance' ,
`co_insurance_gene_id`  int(11) NULL DEFAULT NULL COMMENT '险种因子id,关联t_c_insurance_gene' ,
`belong_insured`  tinyint(4) NULL DEFAULT NULL COMMENT '是否归属到被保险人,1=是' ,
PRIMARY KEY (`id`),
INDEX `idx_c_insurance_id` (`co_insurance_id`) USING BTREE ,
INDEX `idx_c_insurance_gene_id` (`co_insurance_gene_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_protect_item_id` (`protect_item_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-试算因子'
AUTO_INCREMENT=306051

;

-- ----------------------------
-- Table structure for `t_product_trial_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_trial_item`;
CREATE TABLE `t_product_trial_item` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(10) NOT NULL COMMENT '产品计划ID' ,
`item_id`  int(10) NULL DEFAULT NULL COMMENT '试算项ID 对应t_trial_item' ,
`base_item_id`  int(10) NULL DEFAULT NULL COMMENT '基础试算项ID, 对应t_trial_item，用来基础费率总保费' ,
`insurance_id`  int(11) NULL DEFAULT NULL COMMENT '险种ID 关联表t_product_insurance' ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '多个保障项的保费计算，供约束使用（该字段有值时item_id必为空）' ,
`formula_display`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试算公式展示(供页面展示使用)' ,
`formula`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '计算公式' ,
`formula_type`  tinyint(1) NULL DEFAULT 1 COMMENT '公式类型: 0公式，1固定' ,
`relate_coverage`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`fixed_coverage`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定保额' ,
`algorithm_key`  int(10) NULL DEFAULT NULL COMMENT '算法key' ,
`premium_formula_display`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '保费试算公式展示(供页面展示使用)' ,
`premium_formula`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '保费计算公式' ,
`premium_formula_type`  tinyint(1) NULL DEFAULT 1 COMMENT '保费试算公式类型: 0公式，1固定' ,
`premium_algorithm_key`  int(20) NULL DEFAULT NULL COMMENT '保费试算算法key' ,
`decimal_format`  int(10) NULL DEFAULT NULL COMMENT '(预留)冗余方便查找：关联t_product_trial_basic_info' ,
`premium_type`  tinyint(1) NULL DEFAULT NULL COMMENT '经济费保费类型，用于分项保费 （1.主险，2附加险，3其他，4救援）' ,
`remark`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明' ,
`en_remark`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '英文说明' ,
`insure_type`  int(10) NULL DEFAULT 0 COMMENT '保障责任 t_product_protect_item.id' ,
`claim_ratio`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '赔付比例' ,
`claim_money`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '赔付额度' ,
`claim_remark`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '赔付说明' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`by_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别名' ,
`split_code`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '分项编码（智能核保添加）' ,
`sort_flag`  int(10) NULL DEFAULT 0 COMMENT '排序号' ,
`insurance_premium`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否险种保费（多主险产品 分项保费使用）0:不是,1:是' ,
`coverage_description`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保额说明' ,
`responsibility_statement`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '责任解读' ,
`encoding`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试算项编码' ,
`trial_item_type`  tinyint(2) NOT NULL COMMENT '试算类型( 0:保费，1:保障项，2:权益，3:分项保费，4:经纪费，5:续期保费,6:险种保费 )' ,
`link_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '引用超链接ID，关联t_link.id' ,
`risk_formula_display`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '风控保额试算公式展示(供页面展示使用)' ,
`risk_formula`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '风控保额计算公式' ,
`risk_formula_type`  tinyint(1) NULL DEFAULT 0 COMMENT '风控保额试算公式类型: 0公式，1固定' ,
`computable_formula_display`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可算保额试算公式展示(供页面展示使用)' ,
`computable_formula`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '可算保额计算公式' ,
`computable_formula_type`  tinyint(1) NULL DEFAULT 0 COMMENT '可算保额试算公式类型: 0公式，1固定' ,
`is_main_coverage`  tinyint(1) NULL DEFAULT 0 COMMENT '是否主要保额: 0否，1是' ,
`co_insurance_id`  int(11) NULL DEFAULT NULL COMMENT '险种id,关联t_c_insurance' ,
`co_insurance_duty_id`  int(11) NULL DEFAULT NULL COMMENT '险种责任id,关联t_c_insurance_duty' ,
PRIMARY KEY (`id`),
INDEX `idx_insurance_id` (`insurance_id`) USING BTREE ,
INDEX `idx_product_plan_id` (`product_plan_id`) USING BTREE ,
INDEX `idx_c_insurance_id` (`co_insurance_id`) USING BTREE ,
INDEX `idx_c_insurance_duty_id` (`co_insurance_duty_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-试算项-保费-保障-权益'
AUTO_INCREMENT=121419

;

-- ----------------------------
-- Table structure for `t_product_trial_item_claims`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_trial_item_claims`;
CREATE TABLE `t_product_trial_item_claims` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`trial_item_id`  int(11) NOT NULL COMMENT '产品试算项id:t_product_trial_item.id' ,
`claims_id`  int(11) NOT NULL ,
`attribute_id`  int(11) NULL DEFAULT NULL COMMENT '属性：t_attribute.id' ,
`value`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-试算-理赔'
AUTO_INCREMENT=14

;

-- ----------------------------
-- Table structure for `t_product_trial_item_description`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_trial_item_description`;
CREATE TABLE `t_product_trial_item_description` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`product_id`  int(11) NOT NULL ,
`product_plan_id`  int(11) NOT NULL ,
`product_trial_item_id`  int(11) NOT NULL COMMENT 't_product_trial_item.id' ,
`name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键词' ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对关键词的描述' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='保障项关键词注释'
AUTO_INCREMENT=4115

;

-- ----------------------------
-- Table structure for `t_product_trial_premium`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_trial_premium`;
CREATE TABLE `t_product_trial_premium` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(10) NOT NULL COMMENT '产品计划ID' ,
`protect_item_id`  int(10) NOT NULL COMMENT '保障项-ID' ,
`gene_key`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '因子key:按ascii的30作为分隔符' ,
`premium`  decimal(18,4) NOT NULL DEFAULT 0.0000 COMMENT '费率' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
PRIMARY KEY (`id`),
INDEX `idx_product_plan_id` (`product_plan_id`) USING BTREE ,
INDEX `idx_protect_item_id` (`protect_item_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-试算-保费'
AUTO_INCREMENT=70831969

;

-- ----------------------------
-- Table structure for `t_product_trial_premium_blank`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_trial_premium_blank`;
CREATE TABLE `t_product_trial_premium_blank` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(10) NOT NULL COMMENT '产品计划ID' ,
`protect_item_id`  int(10) NOT NULL COMMENT '保障项-ID' ,
`gene_key`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '因子key:按ascii的30作为分隔符' ,
`premium`  decimal(18,4) NULL DEFAULT NULL COMMENT '费率' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
PRIMARY KEY (`id`),
INDEX `idx_protect_item_id` (`protect_item_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='空白费率表'
AUTO_INCREMENT=26159032

;

-- ----------------------------
-- Table structure for `t_product_trip_destination`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_trip_destination`;
CREATE TABLE `t_product_trip_destination` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`data_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据类型：1表示常用分类设置(每个常用分类下面设置有多个国家/地区，此类数据需要再查询)，2表示自定义的国家或地区' ,
`goal_id`  int(11) NOT NULL COMMENT '目标数据ID：如果数据类型是常用分类，则id表示的是常用分类的ID，如果是自定义，则表示国家或地区ID' ,
`goal_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目标数据名称：' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识：1是0否' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品的出行目的地'
AUTO_INCREMENT=11754

;

-- ----------------------------
-- Table structure for `t_product_type_map`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_type_map`;
CREATE TABLE `t_product_type_map` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_type_id`  int(10) NOT NULL COMMENT '产品类别ID' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品关联类别'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_product_underwriting_gene`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_underwriting_gene`;
CREATE TABLE `t_product_underwriting_gene` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`gene_key_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '试算因子key' ,
`opt_type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '应用场景,0-被保人,1-投保人' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_gene_key_code` (`gene_key_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2359

;

-- ----------------------------
-- Table structure for `t_product_user_binding`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_user_binding`;
CREATE TABLE `t_product_user_binding` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`user_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '绑定用户编号,只有这些用户能修改该产品' ,
`deleted`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_user_id`  int(11) NULL DEFAULT NULL COMMENT '更新者ID' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者名称' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品用户绑定表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_pti_display_restrict`
-- ----------------------------
DROP TABLE IF EXISTS `t_pti_display_restrict`;
CREATE TABLE `t_pti_display_restrict` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`trial_item_id`  int(11) NULL DEFAULT NULL COMMENT '保障项ID,t_product_trial_item.id' ,
`execute_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行类型：0=满足以下所有条件 1=满足以下任一条件' ,
`restrict_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '约束类型 0=一般约束 1=默认约束' ,
`display`  tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示，默认显示，1显示，0不显示' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-计划-保障项展示约束'
AUTO_INCREMENT=1248

;

-- ----------------------------
-- Table structure for `t_pti_display_restrict_execute`
-- ----------------------------
DROP TABLE IF EXISTS `t_pti_display_restrict_execute`;
CREATE TABLE `t_pti_display_restrict_execute` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`restrict_id`  int(10) NOT NULL COMMENT '约束ID' ,
`gene_key`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试算因子编码' ,
`conditions`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '约束条件：5=等于，6=包含' ,
`execute_value`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束执行条件值' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品-计划-保障项展示约束-执行条件'
AUTO_INCREMENT=1260

;

-- ----------------------------
-- Table structure for `t_public_material`
-- ----------------------------
DROP TABLE IF EXISTS `t_public_material`;
CREATE TABLE `t_public_material` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_user`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '创建人' ,
`update_user`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '更新人' ,
`insurance_brokers_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '所属牌照' ,
`material_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资料名称' ,
`material_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资料编码' ,
`version`  varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '当前版本号' ,
`file_id`  int(10) UNSIGNED NULL DEFAULT NULL COMMENT '文件id' ,
`file_url`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件地址' ,
`content`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '富文本内容' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_material_code` (`material_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='公共资料'
AUTO_INCREMENT=24

;

-- ----------------------------
-- Table structure for `t_public_material_version`
-- ----------------------------
DROP TABLE IF EXISTS `t_public_material_version`;
CREATE TABLE `t_public_material_version` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`public_material_id`  int(10) UNSIGNED NOT NULL COMMENT '公共资料id' ,
`version`  varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本号' ,
`reason`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新原因' ,
`create_user`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '创建人' ,
`json_content`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'json内容' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_version` (`version`) USING BTREE ,
INDEX `idx_public_material_id` (`public_material_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='公共资料历史版本'
AUTO_INCREMENT=52

;

-- ----------------------------
-- Table structure for `t_rate_file_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_rate_file_log`;
CREATE TABLE `t_rate_file_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`file_id`  int(11) NOT NULL COMMENT '文件服务器id' ,
`file_url`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件url' ,
`protect_item_id`  int(11) NOT NULL COMMENT '关联保障id' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`available`  bit(1) NOT NULL COMMENT '可用标识,0=可用,1=不可用。生成快照时只会关联=0的文件' ,
`snapshot_used`  bit(1) NOT NULL COMMENT '是否被快照使用, 0=否 1=是' ,
PRIMARY KEY (`id`),
INDEX `idx_protect_item_id` (`protect_item_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='费率文件记录表'
AUTO_INCREMENT=19630

;

-- ----------------------------
-- Table structure for `t_recommend_pro_plan_condition`
-- ----------------------------
DROP TABLE IF EXISTS `t_recommend_pro_plan_condition`;
CREATE TABLE `t_recommend_pro_plan_condition` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`product_id`  int(10) NOT NULL COMMENT '产品id' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`product_plan_id`  int(10) NOT NULL COMMENT '计划id' ,
`product_plan_name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品计划名称' ,
`insured_types`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '被保险人类型:本人(1)、其他(2)、多人(3)、团单(4)' ,
`insured_age_groups`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '承保年龄段:未成年人(1),18-60岁(2),60-70岁(3),70-80岁(4),80岁以上(5)' ,
`insurant_date_limits`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '保障期限:30天以内(1),90天以内(2),180天以内(3),1年(4),2年(5)' ,
`protect_items`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ProtectItemTagEnum枚举标签关联的保障项' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_product_plan_id` (`product_plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='推荐产品计划过滤条件配置表'
AUTO_INCREMENT=5638552

;

-- ----------------------------
-- Table structure for `t_saas_attr`
-- ----------------------------
DROP TABLE IF EXISTS `t_saas_attr`;
CREATE TABLE `t_saas_attr` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`attr_table_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '底层pluto对应的属性存储表' ,
`table_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '属性存储表维度,0:产品维度,1:计划维度' ,
`attr_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品基本属性名称' ,
`attr_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '属性类型,0:一般属性,1:多级联动(可为单级),2:图片上传,3:文件上传,4:展示信息条款,5:展示信息备注' ,
`attr_url`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联动类型属性值获取url' ,
`attr_display`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示：1是0否' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识,1:删除,0:未删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='基本属性表'
AUTO_INCREMENT=106

;

-- ----------------------------
-- Table structure for `t_saas_attr_input`
-- ----------------------------
DROP TABLE IF EXISTS `t_saas_attr_input`;
CREATE TABLE `t_saas_attr_input` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`attr_id`  int(11) NOT NULL COMMENT '商家产品基本属性id,t_saas_attr.id' ,
`input_attr_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '输入框属性名称' ,
`input_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品基本属性输入框名称，对应属性code' ,
`input_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '产品基本属性输入框类型,0=下拉框,1=日历控件,2=同时出现下拉框和日历控件区间,3=文本框,4=地区控件,5=职业控件,6密码控件,7=文本,8=对话框,9单选框,10复选框,11表格,12富文本,13文件id,14文件路劲,15文件名称' ,
`input_label_left`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品基本属性输入框左侧label文本，可为空' ,
`input_label_right`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品基本属性输入框右侧label文本，可为空' ,
`input_placeholder`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '各个input控件的placeholder' ,
`input_default`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '各个input控件的默认值' ,
`input_regex`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '校验正则表达式,文本框类型的控件可能会有值' ,
`input_required`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否必填：1是0否' ,
`input_enabled`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否可用：1是0否' ,
`default_remind`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认提醒信息' ,
`warn_remind`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '警告提醒信息' ,
`error_remind`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出错提醒信息' ,
`input_sort`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '排序号' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识,1:删除,0:未删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='基本属性控件表'
AUTO_INCREMENT=127

;

-- ----------------------------
-- Table structure for `t_saas_attr_input_opt`
-- ----------------------------
DROP TABLE IF EXISTS `t_saas_attr_input_opt`;
CREATE TABLE `t_saas_attr_input_opt` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`attr_input_id`  int(11) NOT NULL COMMENT '商家产品基本属性控件ID,t_saas_attr_input.id' ,
`option_text`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '显示名称' ,
`option_value`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控件值' ,
`option_sort`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '排序号' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识,1:删除,0:未删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='基本属性控件值表'
AUTO_INCREMENT=182

;

-- ----------------------------
-- Table structure for `t_saas_tenant_attr`
-- ----------------------------
DROP TABLE IF EXISTS `t_saas_tenant_attr`;
CREATE TABLE `t_saas_tenant_attr` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`tenant_id`  int(11) NOT NULL COMMENT '租户id' ,
`attribute_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性id,t_attribute.id' ,
`attr_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '属性类型,1:动态属性,2:扩展属性,3:健康告知答案属性' ,
`public_flag`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '公共属性标识,公共属性租户不可编辑,1:公共,0:私有' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识,1:删除,0:未删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='saas租户属性关联表'
AUTO_INCREMENT=2391

;

-- ----------------------------
-- Table structure for `t_saas_tenant_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_saas_tenant_product`;
CREATE TABLE `t_saas_tenant_product` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`tenant_id`  int(11) NOT NULL COMMENT '租户id' ,
`vendor_product_id`  int(11) NOT NULL COMMENT 'saas层租户商品id,vendor_product.id' ,
`product_id`  int(11) NOT NULL COMMENT '底层产品id,t_product.id' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识,1:删除,0:未删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='saas租户产品关联表'
AUTO_INCREMENT=7155

;

-- ----------------------------
-- Table structure for `t_saas_trial_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_saas_trial_item`;
CREATE TABLE `t_saas_trial_item` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`tenant_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '租户id' ,
`trial_item_id`  int(10) NOT NULL COMMENT '试算t_trial_item表id' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_tenant_id` (`tenant_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='租户试算项信息'
AUTO_INCREMENT=2309

;

-- ----------------------------
-- Table structure for `t_self_mutual_insurance_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_self_mutual_insurance_config`;
CREATE TABLE `t_self_mutual_insurance_config` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`product_id`  int(10) UNSIGNED NOT NULL COMMENT '关联产品id' ,
`self_check`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否进行自保件校验 0-否,1-是' ,
`self_check_area`  varchar(2047) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '自保件校验地区 多个逗号分隔' ,
`mutual_check`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否进行互保件校验 0-否,1-是' ,
`mutual_check_area`  varchar(2047) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '互保件校验地区 多个逗号分隔' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品自互保件规则配置'
AUTO_INCREMENT=7

;

-- ----------------------------
-- Table structure for `t_send_group`
-- ----------------------------
DROP TABLE IF EXISTS `t_send_group`;
CREATE TABLE `t_send_group` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`company_id`  int(11) NOT NULL COMMENT '保险公司ID' ,
`category_id`  int(11) NULL DEFAULT NULL COMMENT '类别ID（一级或二级类别）' ,
`group_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组合名称' ,
`update_user_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
`product_count`  int(11) NOT NULL DEFAULT 0 COMMENT '影响产品数量' ,
PRIMARY KEY (`id`),
INDEX `idx_company` (`company_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='寄送组合'
AUTO_INCREMENT=44

;

-- ----------------------------
-- Table structure for `t_send_group_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_send_group_product`;
CREATE TABLE `t_send_group_product` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`group_id`  int(11) NOT NULL COMMENT '寄送组合ID' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_product` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='寄送组合的组合产品'
AUTO_INCREMENT=866

;

-- ----------------------------
-- Table structure for `t_send_invoice`
-- ----------------------------
DROP TABLE IF EXISTS `t_send_invoice`;
CREATE TABLE `t_send_invoice` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`is_send`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '发票寄送类型：1支持寄送，2不支持寄送' ,
`no_send_tips`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不支持寄送时，给到前台的提示文案信息' ,
`send_amount`  int(11) NULL DEFAULT NULL COMMENT '发票寄送的金额条件（单次寄送金额累计，单位：分）' ,
`send_type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票类型：1定额发票，2普通机打发票，3电子发票，4增值税专票。多个类型英文逗号分隔' ,
`special_description`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特殊说明' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_user_id`  int(11) NULL DEFAULT NULL COMMENT '更新者ID' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者名称' ,
`self_send_platform`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自助寄送平台:1-慧择，2-齐欣，3-聚米；多个用逗号分隔' ,
`address_type`  tinyint(4) NULL DEFAULT NULL COMMENT '地址类型：1-按投保人联系地址，2-允许自定义' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品发票寄送'
AUTO_INCREMENT=1450

;

-- ----------------------------
-- Table structure for `t_send_invoice_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_send_invoice_type`;
CREATE TABLE `t_send_invoice_type` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`invoice_type`  tinyint(4) NOT NULL COMMENT '发票类型：1定额发票，2普通机打发票，3电子发票，4增值税发票' ,
`sender`  tinyint(4) NULL DEFAULT 1 COMMENT '寄送方：1慧择，2保险公司' ,
`company_sender`  tinyint(4) NULL DEFAULT NULL COMMENT '保险公司寄送时：1总公司寄送，2分公司寄送' ,
`invoice_title`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头：1不限，2投保人，3被保人。多项英文逗号分隔' ,
`title_one_type`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头不限时，抬头类型：1个人，2公司。多个逗号分隔' ,
`title_two_type`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头为投保人时，抬头类型：1个人，2公司。多个逗号分隔' ,
`title_three_type`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头为被保人时，抬头类型：1个人，2公司。多个逗号分隔' ,
`invoice_merge`  tinyint(4) NULL DEFAULT 1 COMMENT '多单合并开发票：1支持，2不支持' ,
`invoice_seal`  tinyint(4) NULL DEFAULT NULL COMMENT '盖章资料：1需要，2不需要' ,
`achieve_type`  tinyint(2) NULL DEFAULT NULL COMMENT '电子发票获取方式' ,
`merge_limit_up`  int(11) NULL DEFAULT NULL COMMENT '多单合并开发票的订单上限值。' ,
`send_days_start`  tinyint(4) NULL DEFAULT 1 COMMENT '寄出时效开始天数' ,
`send_days_end`  tinyint(4) NULL DEFAULT 2 COMMENT '寄出时效结束天数' ,
`send_city`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄出城市' ,
`send_express`  int(11) NULL DEFAULT 1 COMMENT '寄付快递公司ID' ,
`cod_express`  int(11) NULL DEFAULT 2 COMMENT '到付快递公司ID' ,
`par_value`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '面值，例如：5,10,20,30,50,100（定额发票）' ,
`stock`  int(10) NULL DEFAULT NULL COMMENT '库存（定额发票）' ,
`invoice_provide_way`  tinyint(2) NULL DEFAULT 1 COMMENT '发票提供方式：1邮件发送、2短信发送。（电子发票）' ,
`no_null_invoice_info`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '必填发票信息：多个信息英文逗号分隔。1纳税人识别号 2税务登记电话 3税务登记地址 4税务开户银行 5税务开户银行账号' ,
`need_material_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '需上传资料ID串' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_prod_type` (`product_id`, `invoice_type`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品发票寄送信息的发票类型信息'
AUTO_INCREMENT=4571

;

-- ----------------------------
-- Table structure for `t_send_policy`
-- ----------------------------
DROP TABLE IF EXISTS `t_send_policy`;
CREATE TABLE `t_send_policy` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`is_send`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '保单寄送类型：1支持寄送，2必须寄送，3不支持寄送' ,
`no_send_tips`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不支持寄送时，给到前台的提示文案' ,
`send_amount`  int(11) NULL DEFAULT NULL COMMENT '保单寄送的金额条件（单次寄送金额累计，单位：分）' ,
`send_type`  int(11) NULL DEFAULT NULL COMMENT '保单类型：1电子保单，2纸质保单，3保险卡,12电子保单和纸质保单，23纸质保单和保险卡，13点子保单和保险卡，123为电子保单和纸质保单和保险卡' ,
`sender`  tinyint(4) NULL DEFAULT 1 COMMENT '保单寄送方：1慧择，2保险公司' ,
`company_sender`  tinyint(4) NULL DEFAULT NULL COMMENT '保险公司寄送时：1总公司，2分公司' ,
`send_days_start`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '寄出时效开始天数' ,
`send_days_end`  tinyint(4) NOT NULL DEFAULT 2 COMMENT '寄出时效结束天数' ,
`send_city`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '寄出城市' ,
`send_express`  int(11) NOT NULL DEFAULT 1 COMMENT '寄付快递公司ID' ,
`cod_express`  int(11) NOT NULL DEFAULT 2 COMMENT '到付快递公司ID' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_user_id`  int(11) NULL DEFAULT NULL COMMENT '更新者ID' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者名称' ,
`self_send_platform`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自助寄送平台:1-慧择，2-齐欣，3-聚米；多个用逗号分隔' ,
`address_type`  tinyint(4) NULL DEFAULT NULL COMMENT '地址类型：1-按投保人联系地址，2-允许自定义' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品保单寄送'
AUTO_INCREMENT=1453

;

-- ----------------------------
-- Table structure for `t_service_charge`
-- ----------------------------
DROP TABLE IF EXISTS `t_service_charge`;
CREATE TABLE `t_service_charge` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`start_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间' ,
`end_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '结束时间' ,
`commission_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '佣金类型 0=固定 1=不固定' ,
`preferential_rate`  decimal(18,2) NOT NULL DEFAULT 0.00 COMMENT '优惠率' ,
`commission_rate`  decimal(18,2) NOT NULL DEFAULT 0.00 COMMENT '佣金率' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='服务费'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_service_charge_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_service_charge_product`;
CREATE TABLE `t_service_charge_product` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`service_charge_id`  int(10) NOT NULL COMMENT '服务费ID' ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='服务费的关联产品'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_service_restrict`
-- ----------------------------
DROP TABLE IF EXISTS `t_service_restrict`;
CREATE TABLE `t_service_restrict` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`service_charge_id`  int(10) NOT NULL COMMENT '服务费ID' ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束名称' ,
`execute_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行类型：0=满足以下所有条件 1=满足以下任一条件' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='服务费-约束项'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_service_restrict_execute`
-- ----------------------------
DROP TABLE IF EXISTS `t_service_restrict_execute`;
CREATE TABLE `t_service_restrict_execute` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`restrict_id`  int(10) NOT NULL COMMENT '约束ID' ,
`trial_gene_id`  int(10) NOT NULL COMMENT '预留：试算因子ID' ,
`trial_item_id`  int(10) NOT NULL COMMENT '预留：试算项ID 一般是总保费' ,
`variable`  tinyint(4) NULL DEFAULT 0 COMMENT '变量: 1=累计月保费 2=多个累计月保费' ,
`condition`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '约束条件：0=大于，1=大于等于，2=小于，3=小于等于，4=不等于，5=等于，6=包含，7=不包含' ,
`value`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '约束值' ,
`unit`  tinyint(4) NOT NULL COMMENT '单位 0=无、1=份、2=万元、3=元、4=0元、5=00元、6=000元、7=岁、8=年、9=月、10=天' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='服务费-约束计算'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_service_restrict_result`
-- ----------------------------
DROP TABLE IF EXISTS `t_service_restrict_result`;
CREATE TABLE `t_service_restrict_result` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`restrict_id`  int(10) NOT NULL COMMENT '约束ID' ,
`commission_rate`  decimal(18,2) NOT NULL DEFAULT 0.00 COMMENT '佣金率' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='服务费-约束结果'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_sna_plan`
-- ----------------------------
DROP TABLE IF EXISTS `t_sna_plan`;
CREATE TABLE `t_sna_plan` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`product_plan_id`  int(10) NOT NULL COMMENT '计划ID' ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`sna_plan_id`  int(10) NULL DEFAULT 1 COMMENT '计划快照ID' ,
`sna_product_id`  int(10) NULL DEFAULT 1 COMMENT '产品快照ID' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='快照-计划'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_snapshot_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_auth_rule`;
CREATE TABLE `t_snapshot_auth_rule` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`auth_rule_id`  int(11) NOT NULL COMMENT '智能认证规则id' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(11) NOT NULL COMMENT '计划ID' ,
`auth_rule_json`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '认证规则快照json串' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_product_plan_id` (`product_plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='智能认证快照'
AUTO_INCREMENT=19243

;

-- ----------------------------
-- Table structure for `t_snapshot_c_insurance`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_c_insurance`;
CREATE TABLE `t_snapshot_c_insurance` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`co_insurance_id`  int(11) NOT NULL COMMENT '通用险种id' ,
`data_json`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '存储对象json' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_coInsuranceId` (`co_insurance_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='通用险种快照表'
AUTO_INCREMENT=1047

;

-- ----------------------------
-- Table structure for `t_snapshot_confirm_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_confirm_item`;
CREATE TABLE `t_snapshot_confirm_item` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`confirm_item_id`  int(10) NOT NULL COMMENT '确认项表ID，关联t_confirm_item.id' ,
`confirm_item_json`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '确认项快照json串' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_confirm_item_id` (`confirm_item_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='确认项快照'
AUTO_INCREMENT=995

;

-- ----------------------------
-- Table structure for `t_snapshot_economy_cost`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_economy_cost`;
CREATE TABLE `t_snapshot_economy_cost` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`cost_id`  int(10) NOT NULL COMMENT '经济费ID' ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`plan_id`  int(10) NOT NULL COMMENT '计划ID' ,
`economy_cost_json`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '财务配置快照json串' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_cost_id` (`cost_id`) USING BTREE ,
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_plan_id` (`plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='财务配置快照表'
AUTO_INCREMENT=17117

;

-- ----------------------------
-- Table structure for `t_snapshot_equity_policy`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_equity_policy`;
CREATE TABLE `t_snapshot_equity_policy` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(11) NOT NULL COMMENT '产品id' ,
`product_plan_id`  int(11) NOT NULL COMMENT '计划id' ,
`data_json`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '存储对象json' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_product_plan_id` (`product_plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='保单权益快照'
AUTO_INCREMENT=9454

;

-- ----------------------------
-- Table structure for `t_snapshot_equity_rate`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_equity_rate`;
CREATE TABLE `t_snapshot_equity_rate` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(11) NOT NULL COMMENT '产品id' ,
`product_plan_id`  int(11) NOT NULL COMMENT '计划id' ,
`equity_variable_id`  int(11) NOT NULL COMMENT '权益变量的id' ,
`mark_date`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次同步快照的时间标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`data_json`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '存储对象json' ,
PRIMARY KEY (`id`),
INDEX `idx_equity_variable_id` (`equity_variable_id`) USING BTREE ,
INDEX `idx_product_plan_id` (`product_plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='权益费率快照'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_snapshot_equity_trial_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_equity_trial_item`;
CREATE TABLE `t_snapshot_equity_trial_item` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`trial_Item_id`  int(11) NOT NULL COMMENT '产品权益试算项id' ,
`product_id`  int(11) NOT NULL COMMENT '产品id' ,
`product_plan_id`  int(11) NOT NULL COMMENT '计划id' ,
`data_json`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '存储对象json' ,
`mark_date`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次同步快照的时间标识' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`file_log_ids`  varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联的文件记录id，逗号分隔' ,
PRIMARY KEY (`id`),
INDEX `idx_trial_item_id` (`trial_Item_id`) USING BTREE ,
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_product_plan_id` (`product_plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='权益快照'
AUTO_INCREMENT=4358

;

-- ----------------------------
-- Table structure for `t_snapshot_exattr_value`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_exattr_value`;
CREATE TABLE `t_snapshot_exattr_value` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`product_id`  int(10) NOT NULL COMMENT '产品id' ,
`product_plan_id`  int(10) NOT NULL COMMENT '计划id' ,
`exattr_value_json`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展属性配置json串' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_plan_id` (`product_plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品扩展属性配置快照'
AUTO_INCREMENT=62287

;

-- ----------------------------
-- Table structure for `t_snapshot_healthy_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_healthy_info`;
CREATE TABLE `t_snapshot_healthy_info` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`healthy_id`  int(10) NOT NULL COMMENT '键告ID' ,
`healthy_info_json`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '键告快照json串' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_healthy_id` (`healthy_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='键告快照表'
AUTO_INCREMENT=5076

;

-- ----------------------------
-- Table structure for `t_snapshot_insure_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_insure_info`;
CREATE TABLE `t_snapshot_insure_info` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`insure_info_json`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '投保属性快照json串' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='投保属性快照表'
AUTO_INCREMENT=14749

;

-- ----------------------------
-- Table structure for `t_snapshot_insure_tips`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_insure_tips`;
CREATE TABLE `t_snapshot_insure_tips` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`product_id`  int(10) NOT NULL COMMENT '产品id' ,
`product_plan_id`  int(10) NOT NULL COMMENT '计划id' ,
`insure_tips_json`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '投保须知json串' ,
`display_id`  int(10) NOT NULL COMMENT '展示信息表id' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_product_plan_id` (`product_plan_id`) USING BTREE ,
INDEX `idx_display_id` (`display_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品计划投保须知快照'
AUTO_INCREMENT=6497

;

-- ----------------------------
-- Table structure for `t_snapshot_link`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_link`;
CREATE TABLE `t_snapshot_link` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`link_id`  int(10) NOT NULL COMMENT '超链接表ID，t_link.id' ,
`link_json`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '确认项快照json串' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_link_id` (`link_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='超链接快照'
AUTO_INCREMENT=87

;

-- ----------------------------
-- Table structure for `t_snapshot_manual_template`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_manual_template`;
CREATE TABLE `t_snapshot_manual_template` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`manual_template_id`  int(11) NOT NULL COMMENT '人核模板id' ,
`manual_template_json`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '展示信息快照json串' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_manual_template_id` (`manual_template_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='人核模板快照'
AUTO_INCREMENT=2053

;

-- ----------------------------
-- Table structure for `t_snapshot_product_base_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_product_base_info`;
CREATE TABLE `t_snapshot_product_base_info` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`observation_period`  int(10) NULL DEFAULT NULL COMMENT '观察期' ,
`period_hesitation`  int(10) NULL DEFAULT NULL COMMENT '犹豫期' ,
`renewal_policy_grace_period`  int(10) NULL DEFAULT 0 COMMENT '续期宽限期' ,
`is_many_insurance`  int(4) NULL DEFAULT 0 COMMENT '是否多主险 0：否,1：是 默认0' ,
`is_same_benefit`  int(4) NULL DEFAULT 1 COMMENT '受益方式是否相同 0:否,1：是 默认1' ,
`is_same_renewal`  int(4) NULL DEFAULT 1 COMMENT '续期方式是否相同 0否,1：是 默认1' ,
`is_same_period`  int(4) NULL DEFAULT 1 COMMENT '期限配置是否相同 0否,1：是 默认1' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品基本信息快照表'
AUTO_INCREMENT=4766

;

-- ----------------------------
-- Table structure for `t_snapshot_product_base_insurance_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_product_base_insurance_info`;
CREATE TABLE `t_snapshot_product_base_insurance_info` (
`id`  int(10) NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称' ,
`insurance_ids`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '险种ids' ,
`observation_period`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '观察期,多个使用逗号分隔' ,
`period_hesitation`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '犹豫期,多个使用逗号分隔' ,
`renewal_policy_grace_period`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '续期宽限期,多个使用逗号分隔' ,
`snapshot_base_info_id`  int(10) NULL DEFAULT NULL COMMENT '产品基本信息快照表Id' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='多主险产品基本信息快照表'
AUTO_INCREMENT=10

;

-- ----------------------------
-- Table structure for `t_snapshot_product_display`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_product_display`;
CREATE TABLE `t_snapshot_product_display` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`display_id`  int(11) NOT NULL COMMENT '显示信息id' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(11) NOT NULL COMMENT '计划ID' ,
`display_json`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '展示信息快照json串' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_product_plan_id` (`product_plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='展示信息快照'
AUTO_INCREMENT=6706

;

-- ----------------------------
-- Table structure for `t_snapshot_product_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_product_info`;
CREATE TABLE `t_snapshot_product_info` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`product_id`  int(10) NOT NULL COMMENT '产品id' ,
`snapshot_product_json`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品信息json传' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品基础信息快照'
AUTO_INCREMENT=13309

;

-- ----------------------------
-- Table structure for `t_snapshot_product_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_product_order`;
CREATE TABLE `t_snapshot_product_order` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`product_id`  int(10) NOT NULL COMMENT '产品id' ,
`snapshot_product_order_json`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品出单信息json传' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品出单信息快照'
AUTO_INCREMENT=8798

;

-- ----------------------------
-- Table structure for `t_snapshot_product_snapshots`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_product_snapshots`;
CREATE TABLE `t_snapshot_product_snapshots` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`product_id`  int(10) NOT NULL COMMENT '产品id' ,
`product_plan_id`  int(10) NOT NULL COMMENT '计划id' ,
`base_info_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '产品基础信息快照id' ,
`insure_info_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '投保信息快照id' ,
`tips_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '投保须知快照id' ,
`master_provision`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主条款ids' ,
`master_provision_snapshot`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主条款快照ids' ,
`additional_provision`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加条款ids' ,
`additional_provision_snapshot`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加条款快照ids' ,
`insure_declare_id`  int(10) NULL DEFAULT NULL COMMENT '投保声明id' ,
`insure_declare_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '投保声明快照id' ,
`insure_declare_ids`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保声明ids' ,
`insure_declare_snapshot_ids`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保声明快照ids' ,
`comment_ids`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注ids' ,
`comment_snapshot_ids`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注快照ids' ,
`economy_cost_id`  int(10) NULL DEFAULT NULL COMMENT '财务配置id' ,
`economy_cost_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '财务配置快照id' ,
`rate_table_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '费率表快照id' ,
`preminum_item_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '保费试算项快照id' ,
`protect_item_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '保障试算项快照id' ,
`equity_item_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '权益试算项快照id' ,
`itemized_premium_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '分项保费快照id' ,
`brokerage_item_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '经纪费试算项快照id' ,
`renewal_premium_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '续期保费快照id' ,
`insurance_premium_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '险种保费快照id' ,
`restrict_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '约束快照id' ,
`show_set_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '显示设置快照id' ,
`exattr_value_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '扩展属性配置快照id' ,
`auth_rule_id`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '智能认证id' ,
`auth_rule_snapshot_id`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '智能认证快照id' ,
`healthy_ids`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '健康告知ids' ,
`healthy_snapshot_ids`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '健康告知快照ids' ,
`display_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '显示信息快照id,关联t_snapshot_product_display.id' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
`status`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '产品状态：0待审，1上架，2下架，3停售，4测试' ,
`product_info_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '产品基础信息快照id' ,
`product_order_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '产品出单信息快照id' ,
`channel_product_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '渠道产品快照ID' ,
`manual_template_snapshot_ids`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人核模板快照Ids' ,
`equity_policy_snapshot_id`  int(20) NULL DEFAULT NULL COMMENT '保单权益快照id' ,
`equity_snapshot_ids`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权益快照id，英文逗号分隔' ,
`co_insurance_snapshot_ids`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联的通用快照id，英文,分隔' ,
`insure_area_sp_template_id`  int(10) NULL DEFAULT NULL COMMENT '投保地区地区模板快照id' ,
`wealth_area_sp_template_id`  int(10) NULL DEFAULT NULL COMMENT '财产所在地地区模板快照id' ,
`wealth_is_new_area`  tinyint(4) NULL DEFAULT NULL COMMENT '财产所在地 1-是,0-否,2-保险公司地区模板' ,
`insure_is_new_area`  tinyint(4) NULL DEFAULT NULL COMMENT '投保地区 1-是,0-否,2-保险公司地区模板' ,
`sp_job_template_id`  int(10) NULL DEFAULT NULL COMMENT '职业模板快照id' ,
`restrict_cache_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '约束快照id' ,
`trial_cache_snapshot_id`  int(10) NULL DEFAULT NULL COMMENT '试算快照id' ,
`questionnaire_risk_notify_id`  int(11) NULL DEFAULT NULL COMMENT '关联投保适应性问卷快照id' ,
`reading_material_id`  int(11) NULL DEFAULT NULL COMMENT '关联的阅读资料快照id' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id` (`product_id`) USING BTREE ,
INDEX `idx_product_plan_id` (`product_plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品计划所有相关快照版本(条款、投保声明、投保须知、财务配置、费率表等的快照版本)'
AUTO_INCREMENT=147583

;

-- ----------------------------
-- Table structure for `t_snapshot_rate_table`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_rate_table`;
CREATE TABLE `t_snapshot_rate_table` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`product_id`  int(10) NOT NULL COMMENT '产品id' ,
`product_plan_id`  int(10) NOT NULL COMMENT '计划id' ,
`rate_table_json`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '费率表json串' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_product_plan_id` (`product_plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品计划费率表快照'
AUTO_INCREMENT=18061

;

-- ----------------------------
-- Table structure for `t_snapshot_reading_material`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_reading_material`;
CREATE TABLE `t_snapshot_reading_material` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(10) UNSIGNED NOT NULL COMMENT '关联产品id' ,
`plan_id`  int(10) UNSIGNED NOT NULL COMMENT '关联计划id' ,
`json_content`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '快照数据详细json格式信息' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE ,
INDEX `idx_plan_id` (`plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='阅读资料快照表'
AUTO_INCREMENT=3066

;

-- ----------------------------
-- Table structure for `t_snapshot_restrict`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_restrict`;
CREATE TABLE `t_snapshot_restrict` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`product_id`  int(10) NOT NULL COMMENT '产品id' ,
`product_plan_id`  int(10) NOT NULL COMMENT '计划id' ,
`total_premium`  int(11) NULL DEFAULT NULL COMMENT '是否允许累计保费>=20万，有数字表示允许' ,
`min_year_premium`  int(11) NULL DEFAULT NULL COMMENT '年缴保费最低值，以元为单位' ,
`min_year_single_premium`  int(11) NULL DEFAULT NULL COMMENT '趸交保费最低值,以元为单位' ,
`not_apply_high_premium`  tinyint(1) NULL DEFAULT 0 COMMENT '不适用高保费规则(0不勾选-适用，1勾选-不适用)' ,
`high_preminum_notice`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '高保费提示，not_apply_high_premium为1时可配置。当保费超过20万，且不适用高保费规则会提示' ,
`restrict_json`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '约束json串' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品计划约束快照'
AUTO_INCREMENT=7514

;

-- ----------------------------
-- Table structure for `t_snapshot_restrict_cache`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_restrict_cache`;
CREATE TABLE `t_snapshot_restrict_cache` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(11) NOT NULL COMMENT '计划ID' ,
`cache_json`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试算快照信息json串' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id_plan` (`product_id`, `product_plan_id`) USING BTREE ,
INDEX `idx_plan_id` (`product_plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='试算信息快照'
AUTO_INCREMENT=20228

;

-- ----------------------------
-- Table structure for `t_snapshot_risk_health`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_risk_health`;
CREATE TABLE `t_snapshot_risk_health` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID ' ,
`risk_notify_id`  int(11) NOT NULL COMMENT '风险告知ID ' ,
`relation_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '类型，0-关联的投保适应性问卷' ,
`content_json`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '快照json串' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_productId_riskNotifyId` (`product_id`, `risk_notify_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='风险告知快照'
AUTO_INCREMENT=544

;

-- ----------------------------
-- Table structure for `t_snapshot_show_set`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_show_set`;
CREATE TABLE `t_snapshot_show_set` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`product_id`  int(10) NOT NULL COMMENT '产品id' ,
`product_plan_id`  int(10) NOT NULL COMMENT '计划id' ,
`show_setting_json`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '显示设置json串，显示单位，是否显示，设置等信息' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品计划显示设置快照'
AUTO_INCREMENT=19407

;

-- ----------------------------
-- Table structure for `t_snapshot_sp_plan`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_sp_plan`;
CREATE TABLE `t_snapshot_sp_plan` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`sp_id`  int(10) NOT NULL COMMENT '活动ID' ,
`sp_plan_id`  int(10) NOT NULL COMMENT '活动计划ID' ,
`sp_plan_detail_json`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动计划快照json串' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='活动计划快照表'
AUTO_INCREMENT=7

;

-- ----------------------------
-- Table structure for `t_snapshot_trial_cache`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_trial_cache`;
CREATE TABLE `t_snapshot_trial_cache` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(11) NOT NULL COMMENT '计划ID' ,
`cache_json`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试算快照信息json串' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_product_id_plan` (`product_id`, `product_plan_id`) USING BTREE ,
INDEX `idx_plan_id` (`product_plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='试算信息快照'
AUTO_INCREMENT=11150

;

-- ----------------------------
-- Table structure for `t_snapshot_trial_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_snapshot_trial_item`;
CREATE TABLE `t_snapshot_trial_item` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`product_id`  int(10) NOT NULL COMMENT '产品id' ,
`product_plan_id`  int(10) NOT NULL COMMENT '计划id' ,
`trial_item_type`  tinyint(2) NOT NULL COMMENT '试算类型(保费0，保障1，权益2)' ,
`decimal_format`  tinyint(4) NULL DEFAULT NULL COMMENT '保费价格格式' ,
`trial_items_json`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试算项json串' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_product_plan_id` (`product_plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品计划试算项(包含保费、保障、权益)快照'
AUTO_INCREMENT=85969

;

-- ----------------------------
-- Table structure for `t_sp`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp`;
CREATE TABLE `t_sp` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`sp_topic`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动主题' ,
`sp_scheme`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动方案' ,
`sp_description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '方案描述' ,
`sp_status`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '活动状态：0待审、1发布' ,
`owners`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '所属运营层：0无，1慧择，2开平，3聚米，4海外' ,
`suit_for`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '适用平台：1慧择，2渠道,3聚米，4海外。多个平台逗号分隔。' ,
`company_id`  int(11) NOT NULL COMMENT '保险公司ID' ,
`branch_id`  int(11) NOT NULL COMMENT '公司机构ID' ,
`sp_department`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动负责单位（部门）' ,
`sp_owner`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动负责人' ,
`is_invoice`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '是否需要发票：1是0否' ,
`invoice_type`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '发票类型：1经纪公司服务费2经济公司经济费3科技公司服务费' ,
`sp_agreement`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '协议/邮件（存文件的URL，多个URL英文逗号分隔）' ,
`sp_agreement_name`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '协议/邮件名称。多个名称用“|”分隔' ,
`create_user_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者' ,
`update_user_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
PRIMARY KEY (`id`),
INDEX `idx_company` (`company_id`, `branch_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='活动主题表'
AUTO_INCREMENT=32

;

-- ----------------------------
-- Table structure for `t_sp_algorithm`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_algorithm`;
CREATE TABLE `t_sp_algorithm` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID' ,
`algorithm_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '算法名称' ,
`class_path`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应的算法类' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='算法'
AUTO_INCREMENT=2

;

-- ----------------------------
-- Table structure for `t_sp_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_dictionary`;
CREATE TABLE `t_sp_dictionary` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`variable_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变量名' ,
`remark`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
`calculate_type`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '计算方式：1编码、2运算、3条件' ,
`encode`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码' ,
`formula`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计算公式' ,
`formula_display`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '运算公式展示' ,
`select_variable`  tinyint(2) NULL DEFAULT NULL COMMENT '筛选变量：1.累计保费,2.投保单保费,3.累计经纪费,4.自定义保费' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='活动统计变量字典表'
AUTO_INCREMENT=31

;

-- ----------------------------
-- Table structure for `t_sp_dictionary_condition`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_dictionary_condition`;
CREATE TABLE `t_sp_dictionary_condition` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`dic_id`  int(11) NOT NULL COMMENT '字典ID' ,
`condition_type`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '条件类型：1试算因子-缴费年限，2出单日期，3支付日志' ,
`conditions`  tinyint(2) NULL DEFAULT NULL COMMENT '条件：1包含，2不包含，3大于等于，4小于等于，5大于，6小于，7等于，8每达到' ,
`condiction_value`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '筛选条件值' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='活动字典条件表'
AUTO_INCREMENT=44

;

-- ----------------------------
-- Table structure for `t_sp_plan`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_plan`;
CREATE TABLE `t_sp_plan` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`plan_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动计划名称' ,
`sp_id`  int(11) NOT NULL COMMENT '活动主题ID' ,
`is_using`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否启用：1是0否' ,
`start_time`  datetime NULL DEFAULT NULL COMMENT '活动开始时间' ,
`end_time`  datetime NULL DEFAULT NULL COMMENT '活动结束时间' ,
`is_persistent`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否持续有效：1是0否' ,
`settle_way`  tinyint(2) NULL DEFAULT 1 COMMENT '结算方式：1按活动费结算  2按补充经济费结算' ,
`settlement_type`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '结算类型：1同活动周期，2每月，3每季度，4每年' ,
`settle_time`  int(10) NOT NULL DEFAULT 15 COMMENT '结算时间' ,
`is_mutual_rule`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '活动规则是否互斥：1是0否' ,
`algorithm_id`  int(11) NULL DEFAULT 0 COMMENT '规则算法ID：0表示无' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
PRIMARY KEY (`id`),
INDEX `idx_sp_id` (`sp_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='活动计划'
AUTO_INCREMENT=34

;

-- ----------------------------
-- Table structure for `t_sp_product_group`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_product_group`;
CREATE TABLE `t_sp_product_group` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`plan_id`  int(11) NOT NULL COMMENT '所属活动计划ID' ,
`group_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自定义组合名称' ,
`update_user_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
PRIMARY KEY (`id`),
INDEX `idx_plan_id` (`plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='活动产品分组'
AUTO_INCREMENT=2

;

-- ----------------------------
-- Table structure for `t_sp_product_plan`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_product_plan`;
CREATE TABLE `t_sp_product_plan` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`sp_plan_id`  int(11) NOT NULL COMMENT '活动计划ID' ,
`group_id`  int(11) NOT NULL DEFAULT 0 COMMENT '所属自定义组合ID，0表示默认组' ,
`product_id`  int(11) NOT NULL COMMENT '产品ID' ,
`product_plan_id`  int(11) NOT NULL COMMENT '产品计划ID' ,
`is_old`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否旧产品：1是0否' ,
PRIMARY KEY (`id`),
INDEX `idx_plan` (`product_plan_id`, `product_id`) USING BTREE ,
INDEX `idx_sp` (`sp_plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='活动产品计划中间表'
AUTO_INCREMENT=58

;

-- ----------------------------
-- Table structure for `t_sp_rule`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_rule`;
CREATE TABLE `t_sp_rule` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`sp_plan_id`  int(11) NOT NULL COMMENT '活动ID' ,
`rule_name`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动规则名称' ,
`deleted`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
PRIMARY KEY (`id`),
INDEX `idx_sp` (`sp_plan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='活动规则表'
AUTO_INCREMENT=28

;

-- ----------------------------
-- Table structure for `t_sp_rule_award`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_rule_award`;
CREATE TABLE `t_sp_rule_award` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`rule_id`  int(11) NULL DEFAULT NULL COMMENT '规则ID：t_sp_rule.id' ,
`award_type`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '奖励类型：1经纪费、2现金、3实物' ,
`dic_id`  int(11) NULL DEFAULT NULL COMMENT '统计变量字典值ID：经纪费时需填该字段' ,
`rate_number`  decimal(10,2) NULL DEFAULT NULL COMMENT '经纪费比率' ,
`cash_value`  int(11) NULL DEFAULT NULL COMMENT '奖励现金时的现金值，单位元' ,
`prize_name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖励实物时的奖品名称' ,
`prize_count`  int(11) NULL DEFAULT NULL COMMENT '奖励实物时，实物份数' ,
`group_id`  int(11) NULL DEFAULT NULL COMMENT '产品组合ID' ,
PRIMARY KEY (`id`),
INDEX `idx_rule` (`rule_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='活动规则奖励表'
AUTO_INCREMENT=111

;

-- ----------------------------
-- Table structure for `t_sp_rule_award_filter`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_rule_award_filter`;
CREATE TABLE `t_sp_rule_award_filter` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`award_id`  int(10) NOT NULL COMMENT '活动奖励id' ,
`filter_key`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '过滤类型key' ,
`filter_value`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '过滤的value值' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='奖励过滤条件'
AUTO_INCREMENT=29

;

-- ----------------------------
-- Table structure for `t_sp_rule_condition`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_rule_condition`;
CREATE TABLE `t_sp_rule_condition` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`rule_id`  int(11) NOT NULL COMMENT '活动规则ID：t_sp_rule.id' ,
`dic_id`  int(11) NOT NULL COMMENT '活动统计变量字典值ID' ,
`conditions`  tinyint(4) NOT NULL COMMENT '条件：1包含，2不包含，3大于等于，4小于等于，5大于，6小于，7等于，8每达到' ,
`condition_type`  tinyint(4) NULL DEFAULT 1 COMMENT '条件类型：1数值、2变量' ,
`condition_value`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条件值：涉及到金额的，单位为（元）' ,
`condition_dic_id`  int(11) NULL DEFAULT NULL COMMENT '条件为变量时的统计变量字典ID' ,
`group_id`  int(11) NULL DEFAULT NULL COMMENT '产品组合ID' ,
PRIMARY KEY (`id`),
INDEX `idx_variable` (`dic_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='活动规则条件表'
AUTO_INCREMENT=81

;

-- ----------------------------
-- Table structure for `t_sp_rule_condition_filter`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_rule_condition_filter`;
CREATE TABLE `t_sp_rule_condition_filter` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`condition_id`  int(10) NOT NULL COMMENT '条件id' ,
`filter_key`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '过滤类型key' ,
`filter_value`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '过滤的value值' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='过滤条件'
AUTO_INCREMENT=40

;

-- ----------------------------
-- Table structure for `t_sp_settlement`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_settlement`;
CREATE TABLE `t_sp_settlement` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '结算单ID' ,
`sp_id`  int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'sp表对应的ID' ,
`sp_plan_id`  int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '活动计划Id' ,
`settlement_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '结算时间' ,
`settlement_status`  tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '结算状态 1待结算，2结算完成,3删除结算数据' ,
`sp_plan_sna_id`  int(11) UNSIGNED NULL DEFAULT 0 COMMENT '活动快照ID' ,
`settlement_start_time`  datetime NULL DEFAULT NULL COMMENT '结算开始时间' ,
`settlement_end_time`  datetime NULL DEFAULT NULL COMMENT '结算结束时间' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='结算清单表'
AUTO_INCREMENT=160

;

-- ----------------------------
-- Table structure for `t_special_insure`
-- ----------------------------
DROP TABLE IF EXISTS `t_special_insure`;
CREATE TABLE `t_special_insure` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`insure_code`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码' ,
`remark`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '说明' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除标志 0 未删除 1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_insure_code` (`insure_code`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='特殊投保'
AUTO_INCREMENT=6

;

-- ----------------------------
-- Table structure for `t_special_unit`
-- ----------------------------
DROP TABLE IF EXISTS `t_special_unit`;
CREATE TABLE `t_special_unit` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`keyword`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字' ,
`unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '单位 与t_trial_dictionary表字段一样' ,
`default_value`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '默认值' ,
`match_type`  tinyint(4) NOT NULL DEFAULT 2 COMMENT '1表示模糊，2表示精确' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`create_user_id`  int(10) NULL DEFAULT 0 COMMENT '创建人ID' ,
`update_user_id`  int(10) NULL DEFAULT 0 COMMENT '更新人ID' ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人名' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人名' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='特殊单位'
AUTO_INCREMENT=8

;

-- ----------------------------
-- Table structure for `t_support_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_support_log`;
CREATE TABLE `t_support_log` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`business_type`  int(11) NOT NULL DEFAULT 0 COMMENT '日志操作类型：枚举类supportLogType.java' ,
`user_id`  int(11) NOT NULL COMMENT '操作人ID' ,
`user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人' ,
`user_ip`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人IP' ,
`business_id`  int(11) NULL DEFAULT NULL COMMENT '被称作对象的主键ID' ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '日志内容' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_name_type` (`user_name`, `business_type`) USING BTREE ,
INDEX `idx_bid_type` (`business_id`, `business_type`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品支持服务日志表'
AUTO_INCREMENT=2932

;

-- ----------------------------
-- Table structure for `t_task_flow_config_copy`
-- ----------------------------
DROP TABLE IF EXISTS `t_task_flow_config_copy`;
CREATE TABLE `t_task_flow_config_copy` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`task_id`  int(11) UNSIGNED NOT NULL COMMENT '关联任务id' ,
`task_sort`  int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序' ,
`relation_type`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '关联关系：0-关联保司,1-关联产品' ,
`relation_id`  int(11) UNSIGNED NOT NULL COMMENT '关联id' ,
`create_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人' ,
`update_user`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`async`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否异步：0-否,1-是' ,
`extra_content`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '补充配置信息' ,
`backend`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否只后台执行:0-否,1-是' ,
`remark`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述备注' ,
PRIMARY KEY (`id`),
INDEX `idx_task_id` (`task_id`) USING BTREE ,
INDEX `idx_relation_id` (`relation_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='任务流配置表'
AUTO_INCREMENT=49

;

-- ----------------------------
-- Table structure for `t_task_flow_copy`
-- ----------------------------
DROP TABLE IF EXISTS `t_task_flow_copy`;
CREATE TABLE `t_task_flow_copy` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`task_code`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '编码' ,
`task_type`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '类型：0-模块,1-任务' ,
`parent_task_code`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父编码' ,
`task_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='任务流表'
AUTO_INCREMENT=15

;

-- ----------------------------
-- Table structure for `t_to_multiple`
-- ----------------------------
DROP TABLE IF EXISTS `t_to_multiple`;
CREATE TABLE `t_to_multiple` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='逗号转多行'
AUTO_INCREMENT=518

;

-- ----------------------------
-- Table structure for `t_trail_attribute_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_trail_attribute_info`;
CREATE TABLE `t_trail_attribute_info` (
`id`  int(10) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`gene_id`  int(10) NOT NULL COMMENT '试算因子ID' ,
`key_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试算因子keycode' ,
`regex`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正则表达式' ,
`default_remind`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缺省提示' ,
`error_remind`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误提示' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='试算因子关联产品属性的属性信息'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `t_trial_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `t_trial_dictionary`;
CREATE TABLE `t_trial_dictionary` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`protect_item_id`  int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '作废：保障项ID 和试算因子  二选一' ,
`trial_gene_id`  int(10) NULL DEFAULT 0 COMMENT '试算因子ID' ,
`value`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字典值' ,
`min`  int(10) NULL DEFAULT NULL COMMENT '最小值' ,
`max`  int(10) NULL DEFAULT NULL COMMENT '最大值' ,
`unit`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '单位 0=无、1=份、2=万元、3=元、4=0元、5=00元、6=000元、7=岁、8=年、9=月、10=天、11=元/年' ,
`type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '1表示固定，2表示自然' ,
`step`  int(10) NOT NULL DEFAULT 0 COMMENT '步长' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`create_user_id`  int(10) NULL DEFAULT 0 COMMENT '创建人ID' ,
`update_user_id`  int(10) NULL DEFAULT 0 COMMENT '更新人ID' ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人名' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人名' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `index_unique` (`trial_gene_id`, `value`, `min`, `max`, `unit`, `type`, `step`, `deleted`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='试算-数据字典'
AUTO_INCREMENT=8669

;

-- ----------------------------
-- Table structure for `t_trial_gene`
-- ----------------------------
DROP TABLE IF EXISTS `t_trial_gene`;
CREATE TABLE `t_trial_gene` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '试算因子名称' ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`create_user_id`  int(10) NOT NULL DEFAULT 0 COMMENT '创建人ID' ,
`update_user_id`  int(10) NOT NULL DEFAULT 0 COMMENT '更新人ID' ,
`create_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人名' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人名' ,
`key_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试算因子key' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='试算因子'
AUTO_INCREMENT=406

;

-- ----------------------------
-- Table structure for `t_trial_gene_algorithm`
-- ----------------------------
DROP TABLE IF EXISTS `t_trial_gene_algorithm`;
CREATE TABLE `t_trial_gene_algorithm` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`algorithm_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '算法名称' ,
`class_path`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应的算法类' ,
`context_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '容器中的名称' ,
`description`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '算法说明' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='试算因子计算算法'
AUTO_INCREMENT=5

;

-- ----------------------------
-- Table structure for `t_trial_import_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_trial_import_config`;
CREATE TABLE `t_trial_import_config` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`plan_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联计划ID' ,
`gene_type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '因子类型:0-普通因子,1-费率,2-费率表' ,
`data_type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '数据类型:0-单元数据,1-表头数据' ,
`start_row`  int(10) UNSIGNED NOT NULL DEFAULT 2 COMMENT '起始行' ,
`begin_data_column`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT '数据列起始' ,
`end_data_column`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT '数据列截止' ,
`gene_key`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '关联因子keycode' ,
PRIMARY KEY (`id`),
INDEX `idx_plan_id` (`plan_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='费率导入配置'
AUTO_INCREMENT=225

;

-- ----------------------------
-- Table structure for `t_trial_import_config_mapping`
-- ----------------------------
DROP TABLE IF EXISTS `t_trial_import_config_mapping`;
CREATE TABLE `t_trial_import_config_mapping` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`create_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间' ,
`deleted`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`config_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联配置ID，t_trial_import_config.id' ,
`hz_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '对应慧择系统文本' ,
`mapping_text`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '映射文本' ,
PRIMARY KEY (`id`),
INDEX `idx_config_id` (`config_id`) USING BTREE ,
INDEX `idx_update_time` (`update_time`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='费率导入配置-映射关系配置'
AUTO_INCREMENT=377

;

-- ----------------------------
-- Table structure for `t_trial_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_trial_item`;
CREATE TABLE `t_trial_item` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称' ,
`english_name`  varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 英文名称' ,
`encoding`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码' ,
`main_risk`  tinyint(2) NULL DEFAULT 0 COMMENT '是否主险 1:是，0：否' ,
`cause`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原因' ,
`result`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结果' ,
`protect_type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '保障类型：1.保险公司，2.慧择' ,
`company_id`  int(10) NULL DEFAULT NULL COMMENT '再保公司-关联保险公司' ,
`company_branch_id`  int(10) NULL DEFAULT NULL COMMENT '再保机构-分支机构' ,
`provision_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属条款：多个条款英文逗号分隔' ,
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
`is_risk_control`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否风控  1:是,0:否' ,
`keycode`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试算项key' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='试算项信息'
AUTO_INCREMENT=1366

;

-- ----------------------------
-- Table structure for `t_trial_item_encode`
-- ----------------------------
DROP TABLE IF EXISTS `t_trial_item_encode`;
CREATE TABLE `t_trial_item_encode` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`item_id`  int(11) NOT NULL COMMENT '试算项ID' ,
`company_id`  int(11) NOT NULL COMMENT '保险公司' ,
`encoding`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码' ,
PRIMARY KEY (`id`),
INDEX `idx_item_id` (`item_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='试算项编码'
AUTO_INCREMENT=399

;

-- ----------------------------
-- Table structure for `t_trial_item_tag`
-- ----------------------------
DROP TABLE IF EXISTS `t_trial_item_tag`;
CREATE TABLE `t_trial_item_tag` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`item_id`  int(11) NOT NULL COMMENT '试算项ID' ,
`tag_id`  int(11) NOT NULL COMMENT '标签ID' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='试算项-标签 表'
AUTO_INCREMENT=2558

;

-- ----------------------------
-- Table structure for `t_trial_item_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_trial_item_type`;
CREATE TABLE `t_trial_item_type` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`type_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试算类型名称' ,
`type`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '类型：保费0，保障1，权益2' ,
`pc_icon`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'PC端图标' ,
`mobile_icon`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '移动端图标' ,
`create_date`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_date`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='试算项目类型'
AUTO_INCREMENT=21

;

-- ----------------------------
-- Table structure for `t_trial_item_type_claims`
-- ----------------------------
DROP TABLE IF EXISTS `t_trial_item_type_claims`;
CREATE TABLE `t_trial_item_type_claims` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`item_type_id`  int(11) NOT NULL COMMENT '试算项类型：t_trial_item_type.id' ,
`attribute_id`  int(11) NOT NULL COMMENT '属性：t_product_attribute.id' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Table structure for `t_unit`
-- ----------------------------
DROP TABLE IF EXISTS `t_unit`;
CREATE TABLE `t_unit` (
`id`  tinyint(4) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '单位名称' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='单位表'
AUTO_INCREMENT=13

;

-- ----------------------------
-- Table structure for `t_user_data`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_data`;
CREATE TABLE `t_user_data` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID' ,
`user_id`  int(10) NOT NULL COMMENT '用户ID' ,
`data_type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据类型' ,
`user_data`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户数据' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `uniq_user_data_user_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户数据信息'
AUTO_INCREMENT=9

;

-- ----------------------------
-- Table structure for `t_user_product_binding`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_product_binding`;
CREATE TABLE `t_user_product_binding` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`product_id`  int(10) NOT NULL COMMENT '产品ID' ,
`employee_nos`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '绑定用户工号,只有这些用户能修改该产品' ,
`deleted`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`update_user_id`  int(11) NULL DEFAULT NULL COMMENT '更新者ID' ,
`update_user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者名称' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品用户绑定表'
AUTO_INCREMENT=80

;

-- ----------------------------
-- Table structure for `t_value_added_service`
-- ----------------------------
DROP TABLE IF EXISTS `t_value_added_service`;
CREATE TABLE `t_value_added_service` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`deleted`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标志，默认0不删除，1删除' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='增值服务'
AUTO_INCREMENT=1

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
-- Auto increment value for `t_airport_information`
-- ----------------------------
ALTER TABLE `t_airport_information` AUTO_INCREMENT=217;

-- ----------------------------
-- Auto increment value for `t_algorithm_exemption_task`
-- ----------------------------
ALTER TABLE `t_algorithm_exemption_task` AUTO_INCREMENT=79;

-- ----------------------------
-- Auto increment value for `t_attribute`
-- ----------------------------
ALTER TABLE `t_attribute` AUTO_INCREMENT=1109;

-- ----------------------------
-- Auto increment value for `t_attribute_module`
-- ----------------------------
ALTER TABLE `t_attribute_module` AUTO_INCREMENT=208;

-- ----------------------------
-- Auto increment value for `t_attribute_module_default`
-- ----------------------------
ALTER TABLE `t_attribute_module_default` AUTO_INCREMENT=44;

-- ----------------------------
-- Auto increment value for `t_attribute_restrict`
-- ----------------------------
ALTER TABLE `t_attribute_restrict` AUTO_INCREMENT=173119;

-- ----------------------------
-- Auto increment value for `t_attribute_restrict_execute`
-- ----------------------------
ALTER TABLE `t_attribute_restrict_execute` AUTO_INCREMENT=38088;

-- ----------------------------
-- Auto increment value for `t_attribute_restrict_execute_gene`
-- ----------------------------
ALTER TABLE `t_attribute_restrict_execute_gene` AUTO_INCREMENT=875;

-- ----------------------------
-- Auto increment value for `t_attribute_restrict_result`
-- ----------------------------
ALTER TABLE `t_attribute_restrict_result` AUTO_INCREMENT=185096;

-- ----------------------------
-- Auto increment value for `t_attribute_trial_key`
-- ----------------------------
ALTER TABLE `t_attribute_trial_key` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `t_attribute_value`
-- ----------------------------
ALTER TABLE `t_attribute_value` AUTO_INCREMENT=3131;

-- ----------------------------
-- Auto increment value for `t_auth_rule`
-- ----------------------------
ALTER TABLE `t_auth_rule` AUTO_INCREMENT=12563;

-- ----------------------------
-- Auto increment value for `t_auth_rule_certificate`
-- ----------------------------
ALTER TABLE `t_auth_rule_certificate` AUTO_INCREMENT=42146;

-- ----------------------------
-- Auto increment value for `t_auth_rule_certificate_tip`
-- ----------------------------
ALTER TABLE `t_auth_rule_certificate_tip` AUTO_INCREMENT=76938;

-- ----------------------------
-- Auto increment value for `t_auth_rule_execute`
-- ----------------------------
ALTER TABLE `t_auth_rule_execute` AUTO_INCREMENT=23834;

-- ----------------------------
-- Auto increment value for `t_auth_rule_verify`
-- ----------------------------
ALTER TABLE `t_auth_rule_verify` AUTO_INCREMENT=49874;

-- ----------------------------
-- Auto increment value for `t_c_insurance`
-- ----------------------------
ALTER TABLE `t_c_insurance` AUTO_INCREMENT=22808;

-- ----------------------------
-- Auto increment value for `t_c_insurance_benefit`
-- ----------------------------
ALTER TABLE `t_c_insurance_benefit` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `t_c_insurance_duty`
-- ----------------------------
ALTER TABLE `t_c_insurance_duty` AUTO_INCREMENT=966;

-- ----------------------------
-- Auto increment value for `t_c_insurance_duty_description`
-- ----------------------------
ALTER TABLE `t_c_insurance_duty_description` AUTO_INCREMENT=322;

-- ----------------------------
-- Auto increment value for `t_c_insurance_gene`
-- ----------------------------
ALTER TABLE `t_c_insurance_gene` AUTO_INCREMENT=2467;

-- ----------------------------
-- Auto increment value for `t_c_insurance_product_relation`
-- ----------------------------
ALTER TABLE `t_c_insurance_product_relation` AUTO_INCREMENT=188;

-- ----------------------------
-- Auto increment value for `t_car_photo_data`
-- ----------------------------
ALTER TABLE `t_car_photo_data` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_charge_template`
-- ----------------------------
ALTER TABLE `t_charge_template` AUTO_INCREMENT=20;

-- ----------------------------
-- Auto increment value for `t_collection_count`
-- ----------------------------
ALTER TABLE `t_collection_count` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for `t_common_variable`
-- ----------------------------
ALTER TABLE `t_common_variable` AUTO_INCREMENT=43;

-- ----------------------------
-- Auto increment value for `t_confirm_item`
-- ----------------------------
ALTER TABLE `t_confirm_item` AUTO_INCREMENT=187;

-- ----------------------------
-- Auto increment value for `t_confirm_item_keywords`
-- ----------------------------
ALTER TABLE `t_confirm_item_keywords` AUTO_INCREMENT=3927;

-- ----------------------------
-- Auto increment value for `t_confirm_item_product`
-- ----------------------------
ALTER TABLE `t_confirm_item_product` AUTO_INCREMENT=1109;

-- ----------------------------
-- Auto increment value for `t_dictionary_type`
-- ----------------------------
ALTER TABLE `t_dictionary_type` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for `t_dictionary_value`
-- ----------------------------
ALTER TABLE `t_dictionary_value` AUTO_INCREMENT=17;

-- ----------------------------
-- Auto increment value for `t_directional_link_restrict`
-- ----------------------------
ALTER TABLE `t_directional_link_restrict` AUTO_INCREMENT=156;

-- ----------------------------
-- Auto increment value for `t_directional_link_restrict_result`
-- ----------------------------
ALTER TABLE `t_directional_link_restrict_result` AUTO_INCREMENT=155;

-- ----------------------------
-- Auto increment value for `t_droit`
-- ----------------------------
ALTER TABLE `t_droit` AUTO_INCREMENT=12;

-- ----------------------------
-- Auto increment value for `t_dual_record_tip`
-- ----------------------------
ALTER TABLE `t_dual_record_tip` AUTO_INCREMENT=17;

-- ----------------------------
-- Auto increment value for `t_duty_exemption`
-- ----------------------------
ALTER TABLE `t_duty_exemption` AUTO_INCREMENT=1756;

-- ----------------------------
-- Auto increment value for `t_dynamic_config`
-- ----------------------------
ALTER TABLE `t_dynamic_config` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `t_economy_cost`
-- ----------------------------
ALTER TABLE `t_economy_cost` AUTO_INCREMENT=13087;

-- ----------------------------
-- Auto increment value for `t_economy_cost_item`
-- ----------------------------
ALTER TABLE `t_economy_cost_item` AUTO_INCREMENT=203;

-- ----------------------------
-- Auto increment value for `t_economy_restrict`
-- ----------------------------
ALTER TABLE `t_economy_restrict` AUTO_INCREMENT=41154;

-- ----------------------------
-- Auto increment value for `t_economy_restrict_default_gene`
-- ----------------------------
ALTER TABLE `t_economy_restrict_default_gene` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for `t_economy_restrict_execute`
-- ----------------------------
ALTER TABLE `t_economy_restrict_execute` AUTO_INCREMENT=145809;

-- ----------------------------
-- Auto increment value for `t_economy_restrict_result`
-- ----------------------------
ALTER TABLE `t_economy_restrict_result` AUTO_INCREMENT=36616;

-- ----------------------------
-- Auto increment value for `t_economy_unfixed_split`
-- ----------------------------
ALTER TABLE `t_economy_unfixed_split` AUTO_INCREMENT=18017;

-- ----------------------------
-- Auto increment value for `t_economy_unfixed_split_execute`
-- ----------------------------
ALTER TABLE `t_economy_unfixed_split_execute` AUTO_INCREMENT=54872;

-- ----------------------------
-- Auto increment value for `t_economy_unfixed_split_result`
-- ----------------------------
ALTER TABLE `t_economy_unfixed_split_result` AUTO_INCREMENT=34270;

-- ----------------------------
-- Auto increment value for `t_equity_algorithm_variable`
-- ----------------------------
ALTER TABLE `t_equity_algorithm_variable` AUTO_INCREMENT=16286;

-- ----------------------------
-- Auto increment value for `t_equity_attach_variable`
-- ----------------------------
ALTER TABLE `t_equity_attach_variable` AUTO_INCREMENT=153;

-- ----------------------------
-- Auto increment value for `t_equity_gene`
-- ----------------------------
ALTER TABLE `t_equity_gene` AUTO_INCREMENT=37594;

-- ----------------------------
-- Auto increment value for `t_equity_import_config`
-- ----------------------------
ALTER TABLE `t_equity_import_config` AUTO_INCREMENT=1231;

-- ----------------------------
-- Auto increment value for `t_equity_import_config_mapping`
-- ----------------------------
ALTER TABLE `t_equity_import_config_mapping` AUTO_INCREMENT=3482;

-- ----------------------------
-- Auto increment value for `t_equity_policy`
-- ----------------------------
ALTER TABLE `t_equity_policy` AUTO_INCREMENT=5304;

-- ----------------------------
-- Auto increment value for `t_equity_policy_relation`
-- ----------------------------
ALTER TABLE `t_equity_policy_relation` AUTO_INCREMENT=7525;

-- ----------------------------
-- Auto increment value for `t_equity_rate_file_log`
-- ----------------------------
ALTER TABLE `t_equity_rate_file_log` AUTO_INCREMENT=4588;

-- ----------------------------
-- Auto increment value for `t_equity_variable_rate`
-- ----------------------------
ALTER TABLE `t_equity_variable_rate` AUTO_INCREMENT=46119237;

-- ----------------------------
-- Auto increment value for `t_exemption_exclude`
-- ----------------------------
ALTER TABLE `t_exemption_exclude` AUTO_INCREMENT=13;

-- ----------------------------
-- Auto increment value for `t_explain`
-- ----------------------------
ALTER TABLE `t_explain` AUTO_INCREMENT=32;

-- ----------------------------
-- Auto increment value for `t_express`
-- ----------------------------
ALTER TABLE `t_express` AUTO_INCREMENT=209;

-- ----------------------------
-- Auto increment value for `t_extend_attr_change_log`
-- ----------------------------
ALTER TABLE `t_extend_attr_change_log` AUTO_INCREMENT=1211;

-- ----------------------------
-- Auto increment value for `t_extend_attribute`
-- ----------------------------
ALTER TABLE `t_extend_attribute` AUTO_INCREMENT=29834;

-- ----------------------------
-- Auto increment value for `t_extend_attribute_algorithm`
-- ----------------------------
ALTER TABLE `t_extend_attribute_algorithm` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_extend_attribute_default`
-- ----------------------------
ALTER TABLE `t_extend_attribute_default` AUTO_INCREMENT=198;

-- ----------------------------
-- Auto increment value for `t_extend_attribute_module`
-- ----------------------------
ALTER TABLE `t_extend_attribute_module` AUTO_INCREMENT=91;

-- ----------------------------
-- Auto increment value for `t_extend_attribute_object`
-- ----------------------------
ALTER TABLE `t_extend_attribute_object` AUTO_INCREMENT=5770;

-- ----------------------------
-- Auto increment value for `t_extend_attribute_plan`
-- ----------------------------
ALTER TABLE `t_extend_attribute_plan` AUTO_INCREMENT=106303;

-- ----------------------------
-- Auto increment value for `t_extend_attribute_product`
-- ----------------------------
ALTER TABLE `t_extend_attribute_product` AUTO_INCREMENT=131159;

-- ----------------------------
-- Auto increment value for `t_extend_attribute_range`
-- ----------------------------
ALTER TABLE `t_extend_attribute_range` AUTO_INCREMENT=21;

-- ----------------------------
-- Auto increment value for `t_extend_attribute_range_item`
-- ----------------------------
ALTER TABLE `t_extend_attribute_range_item` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_extend_attribute_range_plan`
-- ----------------------------
ALTER TABLE `t_extend_attribute_range_plan` AUTO_INCREMENT=4076;

-- ----------------------------
-- Auto increment value for `t_extend_attribute_relation`
-- ----------------------------
ALTER TABLE `t_extend_attribute_relation` AUTO_INCREMENT=45;

-- ----------------------------
-- Auto increment value for `t_extend_attribute_restrict`
-- ----------------------------
ALTER TABLE `t_extend_attribute_restrict` AUTO_INCREMENT=18;

-- ----------------------------
-- Auto increment value for `t_extend_attribute_restrict_execute`
-- ----------------------------
ALTER TABLE `t_extend_attribute_restrict_execute` AUTO_INCREMENT=24;

-- ----------------------------
-- Auto increment value for `t_extend_attribute_restrict_result`
-- ----------------------------
ALTER TABLE `t_extend_attribute_restrict_result` AUTO_INCREMENT=25;

-- ----------------------------
-- Auto increment value for `t_extend_attribute_subject`
-- ----------------------------
ALTER TABLE `t_extend_attribute_subject` AUTO_INCREMENT=1969;

-- ----------------------------
-- Auto increment value for `t_file_upload_log`
-- ----------------------------
ALTER TABLE `t_file_upload_log` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_filter_log`
-- ----------------------------
ALTER TABLE `t_filter_log` AUTO_INCREMENT=158533;

-- ----------------------------
-- Auto increment value for `t_general_restrict`
-- ----------------------------
ALTER TABLE `t_general_restrict` AUTO_INCREMENT=103;

-- ----------------------------
-- Auto increment value for `t_general_restrict_attribute_execute`
-- ----------------------------
ALTER TABLE `t_general_restrict_attribute_execute` AUTO_INCREMENT=61;

-- ----------------------------
-- Auto increment value for `t_general_restrict_attribute_gene_execute`
-- ----------------------------
ALTER TABLE `t_general_restrict_attribute_gene_execute` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for `t_general_restrict_attribute_result`
-- ----------------------------
ALTER TABLE `t_general_restrict_attribute_result` AUTO_INCREMENT=52;

-- ----------------------------
-- Auto increment value for `t_general_restrict_gene_execute`
-- ----------------------------
ALTER TABLE `t_general_restrict_gene_execute` AUTO_INCREMENT=15;

-- ----------------------------
-- Auto increment value for `t_general_restrict_gene_result`
-- ----------------------------
ALTER TABLE `t_general_restrict_gene_result` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `t_healthy_algorithm`
-- ----------------------------
ALTER TABLE `t_healthy_algorithm` AUTO_INCREMENT=41;

-- ----------------------------
-- Auto increment value for `t_holiday_date`
-- ----------------------------
ALTER TABLE `t_holiday_date` AUTO_INCREMENT=465;

-- ----------------------------
-- Auto increment value for `t_information_type`
-- ----------------------------
ALTER TABLE `t_information_type` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `t_insurance_type`
-- ----------------------------
ALTER TABLE `t_insurance_type` AUTO_INCREMENT=185;

-- ----------------------------
-- Auto increment value for `t_insure_process_control`
-- ----------------------------
ALTER TABLE `t_insure_process_control` AUTO_INCREMENT=16446;

-- ----------------------------
-- Auto increment value for `t_insure_process_task`
-- ----------------------------
ALTER TABLE `t_insure_process_task` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for `t_letter_template`
-- ----------------------------
ALTER TABLE `t_letter_template` AUTO_INCREMENT=17;

-- ----------------------------
-- Auto increment value for `t_letter_template_component`
-- ----------------------------
ALTER TABLE `t_letter_template_component` AUTO_INCREMENT=94;

-- ----------------------------
-- Auto increment value for `t_letter_template_header`
-- ----------------------------
ALTER TABLE `t_letter_template_header` AUTO_INCREMENT=11;

-- ----------------------------
-- Auto increment value for `t_letter_template_html`
-- ----------------------------
ALTER TABLE `t_letter_template_html` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_letter_template_module`
-- ----------------------------
ALTER TABLE `t_letter_template_module` AUTO_INCREMENT=40;

-- ----------------------------
-- Auto increment value for `t_letter_template_snapshot`
-- ----------------------------
ALTER TABLE `t_letter_template_snapshot` AUTO_INCREMENT=75;

-- ----------------------------
-- Auto increment value for `t_letter_template_upload_rule`
-- ----------------------------
ALTER TABLE `t_letter_template_upload_rule` AUTO_INCREMENT=105;

-- ----------------------------
-- Auto increment value for `t_link`
-- ----------------------------
ALTER TABLE `t_link` AUTO_INCREMENT=22;

-- ----------------------------
-- Auto increment value for `t_log`
-- ----------------------------
ALTER TABLE `t_log` AUTO_INCREMENT=559513;

-- ----------------------------
-- Auto increment value for `t_mail_conf`
-- ----------------------------
ALTER TABLE `t_mail_conf` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `t_manual_recommend_product`
-- ----------------------------
ALTER TABLE `t_manual_recommend_product` AUTO_INCREMENT=29;

-- ----------------------------
-- Auto increment value for `t_manual_template`
-- ----------------------------
ALTER TABLE `t_manual_template` AUTO_INCREMENT=596;

-- ----------------------------
-- Auto increment value for `t_manual_template_attribute`
-- ----------------------------
ALTER TABLE `t_manual_template_attribute` AUTO_INCREMENT=27369;

-- ----------------------------
-- Auto increment value for `t_manual_template_mail`
-- ----------------------------
ALTER TABLE `t_manual_template_mail` AUTO_INCREMENT=103;

-- ----------------------------
-- Auto increment value for `t_manual_template_material`
-- ----------------------------
ALTER TABLE `t_manual_template_material` AUTO_INCREMENT=3040;

-- ----------------------------
-- Auto increment value for `t_manual_template_material_file`
-- ----------------------------
ALTER TABLE `t_manual_template_material_file` AUTO_INCREMENT=576;

-- ----------------------------
-- Auto increment value for `t_manual_template_material_rule`
-- ----------------------------
ALTER TABLE `t_manual_template_material_rule` AUTO_INCREMENT=1451;

-- ----------------------------
-- Auto increment value for `t_material`
-- ----------------------------
ALTER TABLE `t_material` AUTO_INCREMENT=63;

-- ----------------------------
-- Auto increment value for `t_material_company`
-- ----------------------------
ALTER TABLE `t_material_company` AUTO_INCREMENT=144;

-- ----------------------------
-- Auto increment value for `t_offline_auth_config`
-- ----------------------------
ALTER TABLE `t_offline_auth_config` AUTO_INCREMENT=427;

-- ----------------------------
-- Auto increment value for `t_offline_sign_config`
-- ----------------------------
ALTER TABLE `t_offline_sign_config` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_oper_buy_count`
-- ----------------------------
ALTER TABLE `t_oper_buy_count` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_payment_limit`
-- ----------------------------
ALTER TABLE `t_payment_limit` AUTO_INCREMENT=74;

-- ----------------------------
-- Auto increment value for `t_payment_limit_detail`
-- ----------------------------
ALTER TABLE `t_payment_limit_detail` AUTO_INCREMENT=522;

-- ----------------------------
-- Auto increment value for `t_plan_c_insurance`
-- ----------------------------
ALTER TABLE `t_plan_c_insurance` AUTO_INCREMENT=5026;

-- ----------------------------
-- Auto increment value for `t_plan_restrict_extra`
-- ----------------------------
ALTER TABLE `t_plan_restrict_extra` AUTO_INCREMENT=362;

-- ----------------------------
-- Auto increment value for `t_plan_restrict_extra_execute`
-- ----------------------------
ALTER TABLE `t_plan_restrict_extra_execute` AUTO_INCREMENT=650;

-- ----------------------------
-- Auto increment value for `t_plan_restrict_extra_plan`
-- ----------------------------
ALTER TABLE `t_plan_restrict_extra_plan` AUTO_INCREMENT=3748;

-- ----------------------------
-- Auto increment value for `t_political`
-- ----------------------------
ALTER TABLE `t_political` AUTO_INCREMENT=58;

-- ----------------------------
-- Auto increment value for `t_political_company`
-- ----------------------------
ALTER TABLE `t_political_company` AUTO_INCREMENT=120;

-- ----------------------------
-- Auto increment value for `t_political_material`
-- ----------------------------
ALTER TABLE `t_political_material` AUTO_INCREMENT=244;

-- ----------------------------
-- Auto increment value for `t_product`
-- ----------------------------
ALTER TABLE `t_product` AUTO_INCREMENT=106052;

-- ----------------------------
-- Auto increment value for `t_product_append_algorithm`
-- ----------------------------
ALTER TABLE `t_product_append_algorithm` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `t_product_area_insure`
-- ----------------------------
ALTER TABLE `t_product_area_insure` AUTO_INCREMENT=173746;

-- ----------------------------
-- Auto increment value for `t_product_area_map`
-- ----------------------------
ALTER TABLE `t_product_area_map` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for `t_product_area_wealth`
-- ----------------------------
ALTER TABLE `t_product_area_wealth` AUTO_INCREMENT=12862;

-- ----------------------------
-- Auto increment value for `t_product_attribute`
-- ----------------------------
ALTER TABLE `t_product_attribute` AUTO_INCREMENT=663197;

-- ----------------------------
-- Auto increment value for `t_product_attribute_general_restrict`
-- ----------------------------
ALTER TABLE `t_product_attribute_general_restrict` AUTO_INCREMENT=20502;

-- ----------------------------
-- Auto increment value for `t_product_attribute_module`
-- ----------------------------
ALTER TABLE `t_product_attribute_module` AUTO_INCREMENT=123091;

-- ----------------------------
-- Auto increment value for `t_product_bank_sign_agreement`
-- ----------------------------
ALTER TABLE `t_product_bank_sign_agreement` AUTO_INCREMENT=77;

-- ----------------------------
-- Auto increment value for `t_product_brokers`
-- ----------------------------
ALTER TABLE `t_product_brokers` AUTO_INCREMENT=6503;

-- ----------------------------
-- Auto increment value for `t_product_brokers_config`
-- ----------------------------
ALTER TABLE `t_product_brokers_config` AUTO_INCREMENT=268;

-- ----------------------------
-- Auto increment value for `t_product_common_gene`
-- ----------------------------
ALTER TABLE `t_product_common_gene` AUTO_INCREMENT=41;

-- ----------------------------
-- Auto increment value for `t_product_common_premium`
-- ----------------------------
ALTER TABLE `t_product_common_premium` AUTO_INCREMENT=73;

-- ----------------------------
-- Auto increment value for `t_product_common_premium_blank`
-- ----------------------------
ALTER TABLE `t_product_common_premium_blank` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_product_condition_stop_sale`
-- ----------------------------
ALTER TABLE `t_product_condition_stop_sale` AUTO_INCREMENT=53;

-- ----------------------------
-- Auto increment value for `t_product_directional_link`
-- ----------------------------
ALTER TABLE `t_product_directional_link` AUTO_INCREMENT=1401;

-- ----------------------------
-- Auto increment value for `t_product_directional_link_attribute`
-- ----------------------------
ALTER TABLE `t_product_directional_link_attribute` AUTO_INCREMENT=1440;

-- ----------------------------
-- Auto increment value for `t_product_directional_link_module`
-- ----------------------------
ALTER TABLE `t_product_directional_link_module` AUTO_INCREMENT=523;

-- ----------------------------
-- Auto increment value for `t_product_discount_execute`
-- ----------------------------
ALTER TABLE `t_product_discount_execute` AUTO_INCREMENT=151;

-- ----------------------------
-- Auto increment value for `t_product_display`
-- ----------------------------
ALTER TABLE `t_product_display` AUTO_INCREMENT=6771;

-- ----------------------------
-- Auto increment value for `t_product_display_faq`
-- ----------------------------
ALTER TABLE `t_product_display_faq` AUTO_INCREMENT=35554;

-- ----------------------------
-- Auto increment value for `t_product_display_feature`
-- ----------------------------
ALTER TABLE `t_product_display_feature` AUTO_INCREMENT=4798;

-- ----------------------------
-- Auto increment value for `t_product_display_important_tips`
-- ----------------------------
ALTER TABLE `t_product_display_important_tips` AUTO_INCREMENT=50557;

-- ----------------------------
-- Auto increment value for `t_product_display_policy`
-- ----------------------------
ALTER TABLE `t_product_display_policy` AUTO_INCREMENT=4040;

-- ----------------------------
-- Auto increment value for `t_product_display_tips`
-- ----------------------------
ALTER TABLE `t_product_display_tips` AUTO_INCREMENT=99844;

-- ----------------------------
-- Auto increment value for `t_product_dual_record_config`
-- ----------------------------
ALTER TABLE `t_product_dual_record_config` AUTO_INCREMENT=395;

-- ----------------------------
-- Auto increment value for `t_product_insurance`
-- ----------------------------
ALTER TABLE `t_product_insurance` AUTO_INCREMENT=820;

-- ----------------------------
-- Auto increment value for `t_product_insurance_benefit`
-- ----------------------------
ALTER TABLE `t_product_insurance_benefit` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_product_insurance_item`
-- ----------------------------
ALTER TABLE `t_product_insurance_item` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_product_insurance_period`
-- ----------------------------
ALTER TABLE `t_product_insurance_period` AUTO_INCREMENT=32;

-- ----------------------------
-- Auto increment value for `t_product_insurance_renewal`
-- ----------------------------
ALTER TABLE `t_product_insurance_renewal` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_product_order`
-- ----------------------------
ALTER TABLE `t_product_order` AUTO_INCREMENT=6871;

-- ----------------------------
-- Auto increment value for `t_product_order_limit`
-- ----------------------------
ALTER TABLE `t_product_order_limit` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_product_plan`
-- ----------------------------
ALTER TABLE `t_product_plan` AUTO_INCREMENT=112181;

-- ----------------------------
-- Auto increment value for `t_product_plan_append`
-- ----------------------------
ALTER TABLE `t_product_plan_append` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for `t_product_plan_droit`
-- ----------------------------
ALTER TABLE `t_product_plan_droit` AUTO_INCREMENT=12437;

-- ----------------------------
-- Auto increment value for `t_product_product_project`
-- ----------------------------
ALTER TABLE `t_product_product_project` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_product_project`
-- ----------------------------
ALTER TABLE `t_product_project` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `t_product_project_type`
-- ----------------------------
ALTER TABLE `t_product_project_type` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for `t_product_protect_item`
-- ----------------------------
ALTER TABLE `t_product_protect_item` AUTO_INCREMENT=43253;

-- ----------------------------
-- Auto increment value for `t_product_reading_material`
-- ----------------------------
ALTER TABLE `t_product_reading_material` AUTO_INCREMENT=2881;

-- ----------------------------
-- Auto increment value for `t_product_renewal_relation`
-- ----------------------------
ALTER TABLE `t_product_renewal_relation` AUTO_INCREMENT=1369;

-- ----------------------------
-- Auto increment value for `t_product_rescue`
-- ----------------------------
ALTER TABLE `t_product_rescue` AUTO_INCREMENT=1042;

-- ----------------------------
-- Auto increment value for `t_product_restrict`
-- ----------------------------
ALTER TABLE `t_product_restrict` AUTO_INCREMENT=133950;

-- ----------------------------
-- Auto increment value for `t_product_restrict_common`
-- ----------------------------
ALTER TABLE `t_product_restrict_common` AUTO_INCREMENT=12213;

-- ----------------------------
-- Auto increment value for `t_product_restrict_execute`
-- ----------------------------
ALTER TABLE `t_product_restrict_execute` AUTO_INCREMENT=426941;

-- ----------------------------
-- Auto increment value for `t_product_restrict_result`
-- ----------------------------
ALTER TABLE `t_product_restrict_result` AUTO_INCREMENT=168763;

-- ----------------------------
-- Auto increment value for `t_product_restrict_rule_cache`
-- ----------------------------
ALTER TABLE `t_product_restrict_rule_cache` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_product_restrict_special_cache`
-- ----------------------------
ALTER TABLE `t_product_restrict_special_cache` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_product_sale_org`
-- ----------------------------
ALTER TABLE `t_product_sale_org` AUTO_INCREMENT=3852;

-- ----------------------------
-- Auto increment value for `t_product_sign_material`
-- ----------------------------
ALTER TABLE `t_product_sign_material` AUTO_INCREMENT=50;

-- ----------------------------
-- Auto increment value for `t_product_status_option`
-- ----------------------------
ALTER TABLE `t_product_status_option` AUTO_INCREMENT=61120;

-- ----------------------------
-- Auto increment value for `t_product_tag`
-- ----------------------------
ALTER TABLE `t_product_tag` AUTO_INCREMENT=137;

-- ----------------------------
-- Auto increment value for `t_product_trial_algorithm`
-- ----------------------------
ALTER TABLE `t_product_trial_algorithm` AUTO_INCREMENT=8;

-- ----------------------------
-- Auto increment value for `t_product_trial_basic_info`
-- ----------------------------
ALTER TABLE `t_product_trial_basic_info` AUTO_INCREMENT=13478;

-- ----------------------------
-- Auto increment value for `t_product_trial_cache_status`
-- ----------------------------
ALTER TABLE `t_product_trial_cache_status` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_product_trial_default`
-- ----------------------------
ALTER TABLE `t_product_trial_default` AUTO_INCREMENT=13200;

-- ----------------------------
-- Auto increment value for `t_product_trial_gene`
-- ----------------------------
ALTER TABLE `t_product_trial_gene` AUTO_INCREMENT=306051;

-- ----------------------------
-- Auto increment value for `t_product_trial_item`
-- ----------------------------
ALTER TABLE `t_product_trial_item` AUTO_INCREMENT=121419;

-- ----------------------------
-- Auto increment value for `t_product_trial_item_claims`
-- ----------------------------
ALTER TABLE `t_product_trial_item_claims` AUTO_INCREMENT=14;

-- ----------------------------
-- Auto increment value for `t_product_trial_item_description`
-- ----------------------------
ALTER TABLE `t_product_trial_item_description` AUTO_INCREMENT=4115;

-- ----------------------------
-- Auto increment value for `t_product_trial_premium`
-- ----------------------------
ALTER TABLE `t_product_trial_premium` AUTO_INCREMENT=70831969;

-- ----------------------------
-- Auto increment value for `t_product_trial_premium_blank`
-- ----------------------------
ALTER TABLE `t_product_trial_premium_blank` AUTO_INCREMENT=26159032;

-- ----------------------------
-- Auto increment value for `t_product_trip_destination`
-- ----------------------------
ALTER TABLE `t_product_trip_destination` AUTO_INCREMENT=11754;

-- ----------------------------
-- Auto increment value for `t_product_type_map`
-- ----------------------------
ALTER TABLE `t_product_type_map` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_product_underwriting_gene`
-- ----------------------------
ALTER TABLE `t_product_underwriting_gene` AUTO_INCREMENT=2359;

-- ----------------------------
-- Auto increment value for `t_product_user_binding`
-- ----------------------------
ALTER TABLE `t_product_user_binding` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_pti_display_restrict`
-- ----------------------------
ALTER TABLE `t_pti_display_restrict` AUTO_INCREMENT=1248;

-- ----------------------------
-- Auto increment value for `t_pti_display_restrict_execute`
-- ----------------------------
ALTER TABLE `t_pti_display_restrict_execute` AUTO_INCREMENT=1260;

-- ----------------------------
-- Auto increment value for `t_public_material`
-- ----------------------------
ALTER TABLE `t_public_material` AUTO_INCREMENT=24;

-- ----------------------------
-- Auto increment value for `t_public_material_version`
-- ----------------------------
ALTER TABLE `t_public_material_version` AUTO_INCREMENT=52;

-- ----------------------------
-- Auto increment value for `t_rate_file_log`
-- ----------------------------
ALTER TABLE `t_rate_file_log` AUTO_INCREMENT=19630;

-- ----------------------------
-- Auto increment value for `t_recommend_pro_plan_condition`
-- ----------------------------
ALTER TABLE `t_recommend_pro_plan_condition` AUTO_INCREMENT=5638552;

-- ----------------------------
-- Auto increment value for `t_saas_attr`
-- ----------------------------
ALTER TABLE `t_saas_attr` AUTO_INCREMENT=106;

-- ----------------------------
-- Auto increment value for `t_saas_attr_input`
-- ----------------------------
ALTER TABLE `t_saas_attr_input` AUTO_INCREMENT=127;

-- ----------------------------
-- Auto increment value for `t_saas_attr_input_opt`
-- ----------------------------
ALTER TABLE `t_saas_attr_input_opt` AUTO_INCREMENT=182;

-- ----------------------------
-- Auto increment value for `t_saas_tenant_attr`
-- ----------------------------
ALTER TABLE `t_saas_tenant_attr` AUTO_INCREMENT=2391;

-- ----------------------------
-- Auto increment value for `t_saas_tenant_product`
-- ----------------------------
ALTER TABLE `t_saas_tenant_product` AUTO_INCREMENT=7155;

-- ----------------------------
-- Auto increment value for `t_saas_trial_item`
-- ----------------------------
ALTER TABLE `t_saas_trial_item` AUTO_INCREMENT=2309;

-- ----------------------------
-- Auto increment value for `t_self_mutual_insurance_config`
-- ----------------------------
ALTER TABLE `t_self_mutual_insurance_config` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for `t_send_group`
-- ----------------------------
ALTER TABLE `t_send_group` AUTO_INCREMENT=44;

-- ----------------------------
-- Auto increment value for `t_send_group_product`
-- ----------------------------
ALTER TABLE `t_send_group_product` AUTO_INCREMENT=866;

-- ----------------------------
-- Auto increment value for `t_send_invoice`
-- ----------------------------
ALTER TABLE `t_send_invoice` AUTO_INCREMENT=1450;

-- ----------------------------
-- Auto increment value for `t_send_invoice_type`
-- ----------------------------
ALTER TABLE `t_send_invoice_type` AUTO_INCREMENT=4571;

-- ----------------------------
-- Auto increment value for `t_send_policy`
-- ----------------------------
ALTER TABLE `t_send_policy` AUTO_INCREMENT=1453;

-- ----------------------------
-- Auto increment value for `t_service_charge`
-- ----------------------------
ALTER TABLE `t_service_charge` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_service_charge_product`
-- ----------------------------
ALTER TABLE `t_service_charge_product` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_service_restrict`
-- ----------------------------
ALTER TABLE `t_service_restrict` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_service_restrict_execute`
-- ----------------------------
ALTER TABLE `t_service_restrict_execute` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_service_restrict_result`
-- ----------------------------
ALTER TABLE `t_service_restrict_result` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_sna_plan`
-- ----------------------------
ALTER TABLE `t_sna_plan` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_snapshot_auth_rule`
-- ----------------------------
ALTER TABLE `t_snapshot_auth_rule` AUTO_INCREMENT=19243;

-- ----------------------------
-- Auto increment value for `t_snapshot_c_insurance`
-- ----------------------------
ALTER TABLE `t_snapshot_c_insurance` AUTO_INCREMENT=1047;

-- ----------------------------
-- Auto increment value for `t_snapshot_confirm_item`
-- ----------------------------
ALTER TABLE `t_snapshot_confirm_item` AUTO_INCREMENT=995;

-- ----------------------------
-- Auto increment value for `t_snapshot_economy_cost`
-- ----------------------------
ALTER TABLE `t_snapshot_economy_cost` AUTO_INCREMENT=17117;

-- ----------------------------
-- Auto increment value for `t_snapshot_equity_policy`
-- ----------------------------
ALTER TABLE `t_snapshot_equity_policy` AUTO_INCREMENT=9454;

-- ----------------------------
-- Auto increment value for `t_snapshot_equity_rate`
-- ----------------------------
ALTER TABLE `t_snapshot_equity_rate` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_snapshot_equity_trial_item`
-- ----------------------------
ALTER TABLE `t_snapshot_equity_trial_item` AUTO_INCREMENT=4358;

-- ----------------------------
-- Auto increment value for `t_snapshot_exattr_value`
-- ----------------------------
ALTER TABLE `t_snapshot_exattr_value` AUTO_INCREMENT=62287;

-- ----------------------------
-- Auto increment value for `t_snapshot_healthy_info`
-- ----------------------------
ALTER TABLE `t_snapshot_healthy_info` AUTO_INCREMENT=5076;

-- ----------------------------
-- Auto increment value for `t_snapshot_insure_info`
-- ----------------------------
ALTER TABLE `t_snapshot_insure_info` AUTO_INCREMENT=14749;

-- ----------------------------
-- Auto increment value for `t_snapshot_insure_tips`
-- ----------------------------
ALTER TABLE `t_snapshot_insure_tips` AUTO_INCREMENT=6497;

-- ----------------------------
-- Auto increment value for `t_snapshot_link`
-- ----------------------------
ALTER TABLE `t_snapshot_link` AUTO_INCREMENT=87;

-- ----------------------------
-- Auto increment value for `t_snapshot_manual_template`
-- ----------------------------
ALTER TABLE `t_snapshot_manual_template` AUTO_INCREMENT=2053;

-- ----------------------------
-- Auto increment value for `t_snapshot_product_base_info`
-- ----------------------------
ALTER TABLE `t_snapshot_product_base_info` AUTO_INCREMENT=4766;

-- ----------------------------
-- Auto increment value for `t_snapshot_product_base_insurance_info`
-- ----------------------------
ALTER TABLE `t_snapshot_product_base_insurance_info` AUTO_INCREMENT=10;

-- ----------------------------
-- Auto increment value for `t_snapshot_product_display`
-- ----------------------------
ALTER TABLE `t_snapshot_product_display` AUTO_INCREMENT=6706;

-- ----------------------------
-- Auto increment value for `t_snapshot_product_info`
-- ----------------------------
ALTER TABLE `t_snapshot_product_info` AUTO_INCREMENT=13309;

-- ----------------------------
-- Auto increment value for `t_snapshot_product_order`
-- ----------------------------
ALTER TABLE `t_snapshot_product_order` AUTO_INCREMENT=8798;

-- ----------------------------
-- Auto increment value for `t_snapshot_product_snapshots`
-- ----------------------------
ALTER TABLE `t_snapshot_product_snapshots` AUTO_INCREMENT=147583;

-- ----------------------------
-- Auto increment value for `t_snapshot_rate_table`
-- ----------------------------
ALTER TABLE `t_snapshot_rate_table` AUTO_INCREMENT=18061;

-- ----------------------------
-- Auto increment value for `t_snapshot_reading_material`
-- ----------------------------
ALTER TABLE `t_snapshot_reading_material` AUTO_INCREMENT=3066;

-- ----------------------------
-- Auto increment value for `t_snapshot_restrict`
-- ----------------------------
ALTER TABLE `t_snapshot_restrict` AUTO_INCREMENT=7514;

-- ----------------------------
-- Auto increment value for `t_snapshot_restrict_cache`
-- ----------------------------
ALTER TABLE `t_snapshot_restrict_cache` AUTO_INCREMENT=20228;

-- ----------------------------
-- Auto increment value for `t_snapshot_risk_health`
-- ----------------------------
ALTER TABLE `t_snapshot_risk_health` AUTO_INCREMENT=544;

-- ----------------------------
-- Auto increment value for `t_snapshot_show_set`
-- ----------------------------
ALTER TABLE `t_snapshot_show_set` AUTO_INCREMENT=19407;

-- ----------------------------
-- Auto increment value for `t_snapshot_sp_plan`
-- ----------------------------
ALTER TABLE `t_snapshot_sp_plan` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for `t_snapshot_trial_cache`
-- ----------------------------
ALTER TABLE `t_snapshot_trial_cache` AUTO_INCREMENT=11150;

-- ----------------------------
-- Auto increment value for `t_snapshot_trial_item`
-- ----------------------------
ALTER TABLE `t_snapshot_trial_item` AUTO_INCREMENT=85969;

-- ----------------------------
-- Auto increment value for `t_sp`
-- ----------------------------
ALTER TABLE `t_sp` AUTO_INCREMENT=32;

-- ----------------------------
-- Auto increment value for `t_sp_algorithm`
-- ----------------------------
ALTER TABLE `t_sp_algorithm` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `t_sp_dictionary`
-- ----------------------------
ALTER TABLE `t_sp_dictionary` AUTO_INCREMENT=31;

-- ----------------------------
-- Auto increment value for `t_sp_dictionary_condition`
-- ----------------------------
ALTER TABLE `t_sp_dictionary_condition` AUTO_INCREMENT=44;

-- ----------------------------
-- Auto increment value for `t_sp_plan`
-- ----------------------------
ALTER TABLE `t_sp_plan` AUTO_INCREMENT=34;

-- ----------------------------
-- Auto increment value for `t_sp_product_group`
-- ----------------------------
ALTER TABLE `t_sp_product_group` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `t_sp_product_plan`
-- ----------------------------
ALTER TABLE `t_sp_product_plan` AUTO_INCREMENT=58;

-- ----------------------------
-- Auto increment value for `t_sp_rule`
-- ----------------------------
ALTER TABLE `t_sp_rule` AUTO_INCREMENT=28;

-- ----------------------------
-- Auto increment value for `t_sp_rule_award`
-- ----------------------------
ALTER TABLE `t_sp_rule_award` AUTO_INCREMENT=111;

-- ----------------------------
-- Auto increment value for `t_sp_rule_award_filter`
-- ----------------------------
ALTER TABLE `t_sp_rule_award_filter` AUTO_INCREMENT=29;

-- ----------------------------
-- Auto increment value for `t_sp_rule_condition`
-- ----------------------------
ALTER TABLE `t_sp_rule_condition` AUTO_INCREMENT=81;

-- ----------------------------
-- Auto increment value for `t_sp_rule_condition_filter`
-- ----------------------------
ALTER TABLE `t_sp_rule_condition_filter` AUTO_INCREMENT=40;

-- ----------------------------
-- Auto increment value for `t_sp_settlement`
-- ----------------------------
ALTER TABLE `t_sp_settlement` AUTO_INCREMENT=160;

-- ----------------------------
-- Auto increment value for `t_special_insure`
-- ----------------------------
ALTER TABLE `t_special_insure` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for `t_special_unit`
-- ----------------------------
ALTER TABLE `t_special_unit` AUTO_INCREMENT=8;

-- ----------------------------
-- Auto increment value for `t_support_log`
-- ----------------------------
ALTER TABLE `t_support_log` AUTO_INCREMENT=2932;

-- ----------------------------
-- Auto increment value for `t_task_flow_config_copy`
-- ----------------------------
ALTER TABLE `t_task_flow_config_copy` AUTO_INCREMENT=49;

-- ----------------------------
-- Auto increment value for `t_task_flow_copy`
-- ----------------------------
ALTER TABLE `t_task_flow_copy` AUTO_INCREMENT=15;

-- ----------------------------
-- Auto increment value for `t_to_multiple`
-- ----------------------------
ALTER TABLE `t_to_multiple` AUTO_INCREMENT=518;

-- ----------------------------
-- Auto increment value for `t_trail_attribute_info`
-- ----------------------------
ALTER TABLE `t_trail_attribute_info` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `t_trial_dictionary`
-- ----------------------------
ALTER TABLE `t_trial_dictionary` AUTO_INCREMENT=8669;

-- ----------------------------
-- Auto increment value for `t_trial_gene`
-- ----------------------------
ALTER TABLE `t_trial_gene` AUTO_INCREMENT=406;

-- ----------------------------
-- Auto increment value for `t_trial_gene_algorithm`
-- ----------------------------
ALTER TABLE `t_trial_gene_algorithm` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for `t_trial_import_config`
-- ----------------------------
ALTER TABLE `t_trial_import_config` AUTO_INCREMENT=225;

-- ----------------------------
-- Auto increment value for `t_trial_import_config_mapping`
-- ----------------------------
ALTER TABLE `t_trial_import_config_mapping` AUTO_INCREMENT=377;

-- ----------------------------
-- Auto increment value for `t_trial_item`
-- ----------------------------
ALTER TABLE `t_trial_item` AUTO_INCREMENT=1366;

-- ----------------------------
-- Auto increment value for `t_trial_item_encode`
-- ----------------------------
ALTER TABLE `t_trial_item_encode` AUTO_INCREMENT=399;

-- ----------------------------
-- Auto increment value for `t_trial_item_tag`
-- ----------------------------
ALTER TABLE `t_trial_item_tag` AUTO_INCREMENT=2558;

-- ----------------------------
-- Auto increment value for `t_trial_item_type`
-- ----------------------------
ALTER TABLE `t_trial_item_type` AUTO_INCREMENT=21;

-- ----------------------------
-- Auto increment value for `t_trial_item_type_claims`
-- ----------------------------
ALTER TABLE `t_trial_item_type_claims` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `t_unit`
-- ----------------------------
ALTER TABLE `t_unit` AUTO_INCREMENT=13;

-- ----------------------------
-- Auto increment value for `t_user_data`
-- ----------------------------
ALTER TABLE `t_user_data` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for `t_user_product_binding`
-- ----------------------------
ALTER TABLE `t_user_product_binding` AUTO_INCREMENT=80;

-- ----------------------------
-- Auto increment value for `t_value_added_service`
-- ----------------------------
ALTER TABLE `t_value_added_service` AUTO_INCREMENT=1;
