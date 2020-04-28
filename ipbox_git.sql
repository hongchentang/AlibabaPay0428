/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ipbox

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-04-28 09:49:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` decimal(19,0) NOT NULL,
  `TYPE_` varchar(128) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(128) DEFAULT NULL,
  `PROC_INST_ID_` varchar(128) DEFAULT NULL,
  `EXECUTION_ID_` varchar(128) DEFAULT NULL,
  `TASK_ID_` varchar(128) DEFAULT NULL,
  `TIME_STAMP_` datetime DEFAULT NULL,
  `USER_ID_` text,
  `DATA_` longblob,
  `LOCK_OWNER_` text,
  `LOCK_TIME_` datetime DEFAULT NULL,
  `IS_PROCESSED_` decimal(3,0) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`),
  UNIQUE KEY `SYS_C0062759` (`LOG_NR_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(128) DEFAULT NULL,
  `REV_` bigint(22) DEFAULT NULL,
  `NAME_` text,
  `DEPLOYMENT_ID_` varchar(128) DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` decimal(1,0) DEFAULT NULL,
  UNIQUE KEY `SYS_C0039052` (`ID_`),
  KEY `ACT_IDX_BYTEAR_DEPL` (`DEPLOYMENT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(128) NOT NULL,
  `VALUE_` text,
  `REV_` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`NAME_`),
  UNIQUE KEY `SYS_C0062767` (`NAME_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(128) NOT NULL,
  `PROC_DEF_ID_` varchar(128) DEFAULT NULL,
  `PROC_INST_ID_` varchar(128) DEFAULT NULL,
  `EXECUTION_ID_` varchar(128) DEFAULT NULL,
  `ACT_ID_` text,
  `TASK_ID_` varchar(128) DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(128) DEFAULT NULL,
  `ACT_NAME_` text,
  `ACT_TYPE_` text,
  `ASSIGNEE_` text,
  `START_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` decimal(19,0) DEFAULT NULL,
  `TENANT_ID_` text,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062775` (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`) USING BTREE,
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(128) NOT NULL,
  `REV_` bigint(22) DEFAULT NULL,
  `USER_ID_` text,
  `NAME_` text,
  `DESCRIPTION_` text,
  `TYPE_` text,
  `TASK_ID_` varchar(128) DEFAULT NULL,
  `PROC_INST_ID_` varchar(128) DEFAULT NULL,
  `URL_` text,
  `CONTENT_ID_` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062777` (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(128) NOT NULL,
  `TYPE_` text,
  `TIME_` datetime DEFAULT NULL,
  `USER_ID_` text,
  `TASK_ID_` varchar(128) DEFAULT NULL,
  `PROC_INST_ID_` varchar(128) DEFAULT NULL,
  `ACTION_` text,
  `MESSAGE_` text,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062780` (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(128) NOT NULL,
  `TYPE_` text,
  `PROC_INST_ID_` varchar(128) DEFAULT NULL,
  `EXECUTION_ID_` varchar(128) DEFAULT NULL,
  `TASK_ID_` varchar(128) DEFAULT NULL,
  `ACT_INST_ID_` varchar(128) DEFAULT NULL,
  `NAME_` text,
  `VAR_TYPE_` varchar(128) DEFAULT NULL,
  `REV_` bigint(22) DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(128) DEFAULT NULL,
  `DOUBLE_` bigint(22) DEFAULT NULL,
  `LONG_` decimal(19,0) DEFAULT NULL,
  `TEXT_` text,
  `TEXT2_` text,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062785` (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(128) NOT NULL,
  `GROUP_ID_` text,
  `TYPE_` text,
  `USER_ID_` text,
  `TASK_ID_` varchar(128) DEFAULT NULL,
  `PROC_INST_ID_` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062787` (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(128) NOT NULL,
  `PROC_INST_ID_` varchar(128) DEFAULT NULL,
  `BUSINESS_KEY_` text,
  `PROC_DEF_ID_` varchar(128) DEFAULT NULL,
  `START_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` decimal(19,0) DEFAULT NULL,
  `START_USER_ID_` text,
  `START_ACT_ID_` text,
  `END_ACT_ID_` text,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(128) DEFAULT NULL,
  `DELETE_REASON_` text,
  `TENANT_ID_` text,
  `NAME_` text,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062792` (`ID_`) USING BTREE,
  UNIQUE KEY `SYS_C0062793` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(128) NOT NULL,
  `PROC_DEF_ID_` varchar(128) DEFAULT NULL,
  `TASK_DEF_KEY_` text,
  `PROC_INST_ID_` varchar(128) DEFAULT NULL,
  `EXECUTION_ID_` varchar(128) DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(128) DEFAULT NULL,
  `NAME_` text,
  `DESCRIPTION_` text,
  `OWNER_` text,
  `ASSIGNEE_` text,
  `START_TIME_` datetime DEFAULT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` decimal(19,0) DEFAULT NULL,
  `DELETE_REASON_` text,
  `PRIORITY_` bigint(22) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` text,
  `CATEGORY_` text,
  `TENANT_ID_` text,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062796` (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(128) NOT NULL,
  `PROC_INST_ID_` varchar(128) DEFAULT NULL,
  `EXECUTION_ID_` varchar(128) DEFAULT NULL,
  `TASK_ID_` varchar(128) DEFAULT NULL,
  `NAME_` text,
  `VAR_TYPE_` varchar(200) DEFAULT NULL,
  `REV_` bigint(22) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(128) DEFAULT NULL,
  `DOUBLE_` bigint(22) DEFAULT NULL,
  `LONG_` decimal(19,0) DEFAULT NULL,
  `TEXT_` text,
  `TEXT2_` text,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062799` (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group` (
  `ID_` varchar(128) NOT NULL,
  `REV_` bigint(22) DEFAULT NULL,
  `NAME_` text,
  `TYPE_` text,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062801` (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info` (
  `ID_` varchar(128) NOT NULL,
  `REV_` bigint(22) DEFAULT NULL,
  `USER_ID_` varchar(128) DEFAULT NULL,
  `TYPE_` varchar(128) DEFAULT NULL,
  `KEY_` text,
  `VALUE_` text,
  `PASSWORD_` longblob,
  `PARENT_ID_` text,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062803` (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(128) NOT NULL,
  `GROUP_ID_` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`USER_ID_`),
  UNIQUE KEY `USER_ID__UNIQUE` (`USER_ID_`) USING BTREE,
  UNIQUE KEY `SYS_C0062808` (`USER_ID_`,`GROUP_ID_`) USING BTREE,
  KEY `ACT_IDX_MEMB_GROUP` (`GROUP_ID_`) USING BTREE,
  KEY `ACT_IDX_MEMB_USER` (`USER_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user` (
  `ID_` varchar(128) NOT NULL,
  `REV_` bigint(22) DEFAULT NULL,
  `FIRST_` text,
  `LAST_` text,
  `EMAIL_` text,
  `PWD_` text,
  `PICTURE_ID_` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062805` (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_interface_sql
-- ----------------------------
DROP TABLE IF EXISTS `act_interface_sql`;
CREATE TABLE `act_interface_sql` (
  `id` varchar(128) NOT NULL,
  `SQL` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(128) NOT NULL,
  `NAME_` text,
  `CATEGORY_` text,
  `TENANT_ID_` text,
  `DEPLOY_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062761` (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model` (
  `ID_` varchar(128) NOT NULL,
  `REV_` bigint(22) DEFAULT NULL,
  `NAME_` text,
  `KEY_` text,
  `CATEGORY_` text,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATE_TIME_` datetime DEFAULT NULL,
  `VERSION_` bigint(22) DEFAULT NULL,
  `META_INFO_` text,
  `DEPLOYMENT_ID_` varchar(128) DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(128) DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(128) DEFAULT NULL,
  `TENANT_ID_` text,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062814` (`ID_`) USING BTREE,
  KEY `ACT_IDX_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`) USING BTREE,
  KEY `ACT_IDX_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`) USING BTREE,
  KEY `ACT_IDX_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(128) NOT NULL,
  `REV_` bigint(22) DEFAULT NULL,
  `CATEGORY_` text,
  `NAME_` text,
  `KEY_` text,
  `VERSION_` bigint(22) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(128) DEFAULT NULL,
  `RESOURCE_NAME_` text,
  `DGRM_RESOURCE_NAME_` text,
  `DESCRIPTION_` text,
  `HAS_START_FORM_KEY_` decimal(1,0) DEFAULT NULL,
  `SUSPENSION_STATE_` bigint(22) DEFAULT NULL,
  `TENANT_ID_` text,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062821` (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(128) NOT NULL,
  `REV_` bigint(22) DEFAULT NULL,
  `EVENT_TYPE_` text,
  `EVENT_NAME_` text,
  `EXECUTION_ID_` varchar(128) DEFAULT NULL,
  `PROC_INST_ID_` varchar(128) DEFAULT NULL,
  `ACTIVITY_ID_` varchar(128) DEFAULT NULL,
  `CONFIGURATION_` text,
  `CREATED_` datetime DEFAULT NULL,
  `PROC_DEF_ID_` varchar(128) DEFAULT NULL,
  `TENANT_ID_` text,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062837` (`ID_`) USING BTREE,
  KEY `ACT_IDX_EVENT_SUBSCR` (`EXECUTION_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(128) NOT NULL,
  `REV_` bigint(22) DEFAULT NULL,
  `PROC_INST_ID_` varchar(128) DEFAULT NULL,
  `BUSINESS_KEY_` text,
  `PARENT_ID_` varchar(128) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(128) DEFAULT NULL,
  `SUPER_EXEC_` varchar(128) DEFAULT NULL,
  `ACT_ID_` text,
  `IS_ACTIVE_` decimal(1,0) DEFAULT NULL,
  `IS_CONCURRENT_` decimal(1,0) DEFAULT NULL,
  `IS_SCOPE_` decimal(1,0) DEFAULT NULL,
  `IS_EVENT_SCOPE_` decimal(1,0) DEFAULT NULL,
  `SUSPENSION_STATE_` bigint(22) DEFAULT NULL,
  `CACHED_ENT_STATE_` bigint(22) DEFAULT NULL,
  `TENANT_ID_` text,
  `NAME_` text,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062825` (`ID_`) USING BTREE,
  KEY `ACT_IDX_EXE_PARENT` (`PARENT_ID_`) USING BTREE,
  KEY `ACT_IDX_EXE_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_IDX_EXE_PROCINST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_EXE_SUPER` (`SUPER_EXEC_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(128) NOT NULL,
  `REV_` bigint(22) DEFAULT NULL,
  `GROUP_ID_` text,
  `TYPE_` text,
  `USER_ID_` text,
  `TASK_ID_` varchar(128) DEFAULT NULL,
  `PROC_INST_ID_` varchar(128) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062845` (`ID_`) USING BTREE,
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_IDX_IDL_PROCINST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_TSKASS_TASK` (`TASK_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(128) NOT NULL,
  `REV_` bigint(22) DEFAULT NULL,
  `TYPE_` text,
  `LOCK_EXP_TIME_` datetime DEFAULT NULL,
  `LOCK_OWNER_` text,
  `EXCLUSIVE_` decimal(1,0) DEFAULT NULL,
  `EXECUTION_ID_` varchar(128) DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(128) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(128) DEFAULT NULL,
  `RETRIES_` bigint(22) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(128) DEFAULT NULL,
  `EXCEPTION_MSG_` text,
  `DUEDATE_` datetime DEFAULT NULL,
  `REPEAT_` text,
  `HANDLER_TYPE_` text,
  `HANDLER_CFG_` text,
  `TENANT_ID_` text,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062851` (`ID_`) USING BTREE,
  KEY `ACT_IDX_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(128) NOT NULL,
  `REV_` bigint(22) DEFAULT NULL,
  `EXECUTION_ID_` varchar(128) DEFAULT NULL,
  `PROC_INST_ID_` varchar(128) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(128) DEFAULT NULL,
  `NAME_` text,
  `PARENT_TASK_ID_` varchar(128) DEFAULT NULL,
  `DESCRIPTION_` text,
  `TASK_DEF_KEY_` text,
  `OWNER_` text,
  `ASSIGNEE_` text,
  `DELEGATION_` varchar(128) DEFAULT NULL,
  `PRIORITY_` bigint(22) DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` text,
  `SUSPENSION_STATE_` bigint(22) DEFAULT NULL,
  `TENANT_ID_` text,
  `FORM_KEY_` text,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062840` (`ID_`) USING BTREE,
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`) USING BTREE,
  KEY `ACT_IDX_TASK_EXEC` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_IDX_TASK_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_IDX_TASK_PROCINST` (`PROC_INST_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(128) NOT NULL,
  `REV_` bigint(22) DEFAULT NULL,
  `TYPE_` text,
  `NAME_` text,
  `EXECUTION_ID_` varchar(128) DEFAULT NULL,
  `PROC_INST_ID_` varchar(128) DEFAULT NULL,
  `TASK_ID_` varchar(128) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(128) DEFAULT NULL,
  `DOUBLE_` bigint(22) DEFAULT NULL,
  `LONG_` decimal(19,0) DEFAULT NULL,
  `TEXT_` text,
  `TEXT2_` text,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `SYS_C0062857` (`ID_`) USING BTREE,
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`) USING BTREE,
  KEY `ACT_IDX_VAR_BYTEARRAY` (`BYTEARRAY_ID_`) USING BTREE,
  KEY `ACT_IDX_VAR_EXE` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_IDX_VAR_PROCINST` (`PROC_INST_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cms_channel
-- ----------------------------
DROP TABLE IF EXISTS `cms_channel`;
CREATE TABLE `cms_channel` (
  `ID` varchar(50) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `TEMPLET_ID` varchar(50) DEFAULT NULL,
  `CONTENT_TEMPLET_ID` varchar(50) DEFAULT NULL,
  `IMG` text,
  `DESCRIPTION` text,
  `PARENT_ID` text,
  `SITE_ID` varchar(50) DEFAULT NULL,
  `STATE` varchar(32) DEFAULT NULL,
  `ORDER_NUM` decimal(11,0) DEFAULT NULL,
  `CLICK_NUM` decimal(11,0) DEFAULT NULL,
  `NAVIGATION` varchar(2) DEFAULT NULL,
  `PAGE_MARK` varchar(50) DEFAULT NULL,
  `HTML_CHANNEL_ID` varchar(2) DEFAULT NULL,
  `HTML_CHANNEL_OLD_ID` varchar(2) DEFAULT NULL,
  `HTML_PAR_CHANNEL_ID` varchar(2) DEFAULT NULL,
  `HTML_SITE_ID` varchar(2) DEFAULT NULL,
  `INDEX_NUM` decimal(11,0) DEFAULT NULL,
  `MAX_PAGE` decimal(11,0) DEFAULT NULL,
  `CREATOR` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `URL` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_CMS_CHANNEL` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cms_config
-- ----------------------------
DROP TABLE IF EXISTS `cms_config`;
CREATE TABLE `cms_config` (
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `CONFIG_VALUE` text,
  `ORDER_NUM` decimal(11,0) DEFAULT NULL,
  `CREATOR` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`CODE`),
  UNIQUE KEY `PK_CMS_CONFIG` (`CODE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cms_directive
-- ----------------------------
DROP TABLE IF EXISTS `cms_directive`;
CREATE TABLE `cms_directive` (
  `ID` varchar(50) NOT NULL,
  `CONTENT` longtext,
  `ORDER_NUM` bigint(22) DEFAULT NULL,
  `CREATOR` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `NAME` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_CMS_DIRECTIVE` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cms_htmlquartz
-- ----------------------------
DROP TABLE IF EXISTS `cms_htmlquartz`;
CREATE TABLE `cms_htmlquartz` (
  `ID` varchar(50) NOT NULL,
  `SITE_ID` varchar(100) DEFAULT NULL,
  `CHANNEL_ID` varchar(100) DEFAULT NULL,
  `TYPE` text,
  `EXE_TIME_HOUR` decimal(11,0) DEFAULT NULL,
  `EXE_TIME_MIN` decimal(11,0) DEFAULT NULL,
  `INTERVAL_TYPE` varchar(2) DEFAULT NULL,
  `INTERVAL_HOUR` decimal(11,0) DEFAULT NULL,
  `INTERVAL_MIN` decimal(11,0) DEFAULT NULL,
  `CREATOR` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_CMS_HTMLQUARTZ` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cms_info
-- ----------------------------
DROP TABLE IF EXISTS `cms_info`;
CREATE TABLE `cms_info` (
  `ID` varchar(50) NOT NULL,
  `SITE_ID` varchar(50) DEFAULT NULL,
  `CHANNEL_ID` varchar(50) DEFAULT NULL,
  `TITLE` text,
  `SHOR_TTITLE` varchar(100) DEFAULT NULL,
  `TITLE_COLOR` varchar(10) DEFAULT NULL,
  `TITLE_BLOD` varchar(2) DEFAULT NULL,
  `SOURCE` varchar(50) DEFAULT NULL,
  `AUTHOR` varchar(50) DEFAULT NULL,
  `DESCRIPTION` text,
  `CONTENT` longtext,
  `TAGS` text,
  `IMG` text,
  `URL` text,
  `ATTCHS` text,
  `ADD_TIME` datetime DEFAULT NULL,
  `TEMPLET_ID` varchar(50) DEFAULT NULL,
  `IS_HOT` varchar(2) DEFAULT NULL,
  `IS_TOP` varchar(2) DEFAULT NULL,
  `TOP_END_TIME` datetime DEFAULT NULL,
  `CLICK_NUM` decimal(11,0) DEFAULT NULL,
  `ADD_USER` varchar(50) DEFAULT NULL,
  `STATE` varchar(2) DEFAULT NULL,
  `IS_SIGN` varchar(2) DEFAULT NULL,
  `VIDEO` text,
  `IS_COMMENT` varchar(2) DEFAULT NULL,
  `OPEN_TIME_TYPE` varchar(2) DEFAULT NULL,
  `OPEN_END_TIME` datetime DEFAULT NULL,
  `OPEN_TYPE` varchar(2) DEFAULT NULL,
  `HTML_INDEX_NUM` varchar(10) DEFAULT NULL,
  `IS_IMGS` varchar(2) DEFAULT NULL,
  `AUDIT_STATE` varchar(2) DEFAULT NULL,
  `CREATOR` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `TYPE` varchar(1) DEFAULT NULL,
  `REGIONS_CODE` varchar(64) DEFAULT NULL,
  `COURSE_ID` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_CMS_INFO` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cms_info_img
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_img`;
CREATE TABLE `cms_info_img` (
  `ID` varchar(50) NOT NULL,
  `INFO_ID` varchar(50) DEFAULT NULL,
  `IMG` text,
  `TITLE` text,
  `CONTENT` text,
  `ORDER_NUM` decimal(11,0) DEFAULT NULL,
  `CREATOR` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_CMS_INFO_IMG` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cms_link
-- ----------------------------
DROP TABLE IF EXISTS `cms_link`;
CREATE TABLE `cms_link` (
  `ID` varchar(50) NOT NULL,
  `PARENT_ID` varchar(50) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `URL` text,
  `ISOK` varchar(2) DEFAULT NULL,
  `ORDER_NUM` decimal(11,0) DEFAULT NULL,
  `SITE_ID` varchar(50) DEFAULT NULL,
  `IMG` text,
  `TYPE` varchar(32) DEFAULT NULL,
  `PAGE_MARK` varchar(50) DEFAULT NULL,
  `CREATOR` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_CMS_LINK` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cms_log
-- ----------------------------
DROP TABLE IF EXISTS `cms_log`;
CREATE TABLE `cms_log` (
  `ID` varchar(64) NOT NULL,
  `SITE_ID` varchar(64) DEFAULT NULL,
  `CHANNEL_ID` varchar(64) DEFAULT NULL,
  `INFO_ID` varchar(64) DEFAULT NULL,
  `URL` text,
  `ADD_TIME` datetime DEFAULT NULL,
  `IP` text,
  `ROLE` varchar(64) DEFAULT NULL,
  `ACTION` varchar(255) DEFAULT NULL,
  `CONTENT` text,
  `END_MACHINE` varchar(255) DEFAULT NULL,
  `CREATOR` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_CMS_LOG` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cms_site
-- ----------------------------
DROP TABLE IF EXISTS `cms_site`;
CREATE TABLE `cms_site` (
  `ID` varchar(50) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `SITE_DO_MAIN` varchar(100) DEFAULT NULL,
  `SOURCE_PATH` text,
  `COPYRIGHT` text,
  `RECORD_CODE` varchar(50) DEFAULT NULL,
  `PARENT_ID` text,
  `STATE` varchar(32) DEFAULT NULL,
  `URL` varchar(50) DEFAULT NULL,
  `INDEX_TEMPLET` varchar(50) DEFAULT NULL,
  `LOGO` text,
  `ORDER_NUM` decimal(11,0) DEFAULT NULL,
  `CLICK_NUM` decimal(11,0) DEFAULT NULL,
  `CREATOR` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `IS_VALID` varchar(2) DEFAULT NULL,
  `PROVINCE` varchar(64) DEFAULT NULL,
  `CITY` varchar(64) DEFAULT NULL,
  `COUNTIES` varchar(64) DEFAULT NULL,
  `IS_MAIN_SITE` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_CMS_SITE` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_survey
-- ----------------------------
DROP TABLE IF EXISTS `ims_survey`;
CREATE TABLE `ims_survey` (
  `ID` varchar(64) NOT NULL,
  `TITLE` varchar(128) DEFAULT NULL,
  `DESCRIPTION` text,
  `STATE` varchar(16) DEFAULT NULL,
  `CREATOR` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `PUBLISH_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IMS_SURVEY_PK` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_survey_question
-- ----------------------------
DROP TABLE IF EXISTS `ims_survey_question`;
CREATE TABLE `ims_survey_question` (
  `ID` varchar(64) NOT NULL,
  `TITLE` varchar(128) DEFAULT NULL,
  `QUES_BODY` text,
  `QUES_TYPE` varchar(16) DEFAULT NULL,
  `INTERACTION` text,
  `SEQUENCE_INDEX` bigint(22) DEFAULT NULL,
  `RELATION_ID` varchar(64) DEFAULT NULL,
  `CREATOR` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IMS_SURVEY_QUESTION_PK` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_survey_submission
-- ----------------------------
DROP TABLE IF EXISTS `ims_survey_submission`;
CREATE TABLE `ims_survey_submission` (
  `ID` varchar(64) NOT NULL,
  `RESPONSE` text,
  `SCORE` bigint(22) DEFAULT NULL,
  `SURVEY_USER_ID` varchar(64) NOT NULL,
  PRIMARY KEY (`ID`,`SURVEY_USER_ID`),
  UNIQUE KEY `IMS_SURVEY_SUBMISSION_PK` (`ID`,`SURVEY_USER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_survey_user
-- ----------------------------
DROP TABLE IF EXISTS `ims_survey_user`;
CREATE TABLE `ims_survey_user` (
  `ID` varchar(64) NOT NULL,
  `SURVEY_ID` varchar(64) DEFAULT NULL,
  `RELATION_ID` varchar(64) DEFAULT NULL,
  `USER_ID` varchar(64) DEFAULT NULL,
  `COMPLETION_STATUS` varchar(16) DEFAULT NULL,
  `SUM_SCORE` bigint(22) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IMS_SURVEY_USER_PK` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_admin_dept
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_admin_dept`;
CREATE TABLE `ipanther_admin_dept` (
  `USER_ID` varchar(64) NOT NULL,
  `DEPT_ID` varchar(64) NOT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`DEPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_admin_regions
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_admin_regions`;
CREATE TABLE `ipanther_admin_regions` (
  `ID` varchar(64) NOT NULL,
  `REGIONS_CODE` varchar(64) NOT NULL,
  `REGIONS_NAME` text,
  `PARENT_CODE` varchar(32) NOT NULL,
  `REGIONS_LEVEL` bigint(22) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPANTHER_ADMIN_REGIONS` (`ID`) USING BTREE,
  KEY `idx_ipantherregions_parent_code` (`PARENT_CODE`),
  KEY `idx_ipantherregions_regions_code` (`REGIONS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_agency
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_agency`;
CREATE TABLE `ipanther_agency` (
  `ID` varchar(32) NOT NULL,
  `AGENCY_NAME` varchar(255) DEFAULT NULL COMMENT '代理机构名称',
  `AGENCY_CODE` varchar(80) DEFAULT NULL COMMENT '代理机构编码',
  `AGENCY_ADDRESS` varchar(255) DEFAULT NULL COMMENT '代理机构地址',
  `AGENCY_EMAIL` varchar(100) DEFAULT NULL COMMENT '代理机构邮箱',
  `AGENCY_MOBILE` varchar(15) DEFAULT NULL COMMENT '理机构联系方式',
  `AGENCYER` varchar(255) DEFAULT NULL COMMENT '代理人',
  `AGENCYER_MOBILE` varchar(15) DEFAULT NULL COMMENT '代理人联系方式',
  `CREATOR` varchar(32) NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `UPDATEDBY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `VERSION` decimal(8,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专利代理信息表';

-- ----------------------------
-- Table structure for ipanther_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_attachment`;
CREATE TABLE `ipanther_attachment` (
  `ID` varchar(64) NOT NULL,
  `FILE_NAME` varchar(255) DEFAULT NULL,
  `FILE_PATH` text,
  `TEMP_FILE_NAME` varchar(255) DEFAULT NULL,
  `TEMP_FILE_PATH` text,
  `BILL_ID` varchar(64) DEFAULT NULL,
  `FILE_SIZE` bigint(22) DEFAULT NULL,
  `TEMP_FILE_SIZE` bigint(22) DEFAULT NULL,
  `STATUS` varchar(64) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPANTHER_ATTACHMENT` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_auth_module
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_auth_module`;
CREATE TABLE `ipanther_auth_module` (
  `ID` varchar(64) NOT NULL,
  `NAME` varchar(64) DEFAULT NULL,
  `DESCRIPTION` varchar(128) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPANTHER_AUTH_MODULE` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_auth_privilege
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_auth_privilege`;
CREATE TABLE `ipanther_auth_privilege` (
  `ID` varchar(64) NOT NULL,
  `PID` varchar(64) DEFAULT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `DESCRIPTION` varchar(128) DEFAULT NULL,
  `MODULE` varchar(32) DEFAULT NULL,
  `PERMISSION` varchar(32) DEFAULT NULL,
  `IS_LEAF` varchar(1) DEFAULT NULL,
  `IS_DISPLAY` varchar(1) DEFAULT NULL,
  `URL` text,
  `TARGET` varchar(64) DEFAULT NULL,
  `ORDER_NO` bigint(22) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPANTHER_AUTH_PRIVILEGE` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_auth_role
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_auth_role`;
CREATE TABLE `ipanther_auth_role` (
  `ID` varchar(64) NOT NULL,
  `NAME` varchar(128) DEFAULT NULL,
  `DESCRIPTION` text,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `ROLE_CODE` varchar(32) DEFAULT NULL,
  `MODULE` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPANTHER_AUTH_ROLE` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_auth_rolepri
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_auth_rolepri`;
CREATE TABLE `ipanther_auth_rolepri` (
  `ROLE_ID` varchar(64) NOT NULL,
  `PRIVILEGE_ID` varchar(64) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`PRIVILEGE_ID`),
  UNIQUE KEY `PK_IPANTHER_AUTH_ROLEPRI` (`ROLE_ID`,`PRIVILEGE_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_auth_userrole
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_auth_userrole`;
CREATE TABLE `ipanther_auth_userrole` (
  `USER_ID` varchar(64) NOT NULL,
  `ROLE_ID` varchar(64) NOT NULL,
  PRIMARY KEY (`USER_ID`,`ROLE_ID`),
  UNIQUE KEY `PK_IPANTHER_AUTH_USERROLE` (`USER_ID`,`ROLE_ID`) USING BTREE,
  KEY `IDX_IAUTH_USERROLE_ROLEID` (`ROLE_ID`) USING BTREE,
  KEY `IDX_IAUTH_USERROLE_USERID` (`USER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_call_cost
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_call_cost`;
CREATE TABLE `ipanther_call_cost` (
  `COMPANY_ID` varchar(32) DEFAULT NULL,
  `years` varchar(4) DEFAULT NULL,
  `agency` decimal(32,2) DEFAULT NULL,
  `officialfees` decimal(32,2) DEFAULT NULL,
  `annualfee` decimal(32,2) DEFAULT NULL,
  `Otherfee` decimal(32,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_department
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_department`;
CREATE TABLE `ipanther_department` (
  `ID` varchar(64) NOT NULL,
  `PARENT_ID` varchar(64) DEFAULT NULL,
  `UNIT_ID` varchar(64) DEFAULT NULL COMMENT '关联的组织id（最高级dept）',
  `DEPT_TYPE` varchar(16) DEFAULT NULL,
  `DEPT_NO` varchar(64) DEFAULT NULL,
  `DEPT_NAME` varchar(128) DEFAULT NULL,
  `DEPT_ADDRESS` text,
  `POST_CODE` varchar(64) DEFAULT NULL,
  `REGIONS_CODE` varchar(64) DEFAULT NULL,
  `PROVINCE` varchar(64) DEFAULT NULL,
  `CITY` varchar(64) DEFAULT NULL,
  `COUNTIES` varchar(64) DEFAULT NULL,
  `STREET` varchar(64) DEFAULT NULL,
  `DEPT_CATEGORY` varchar(64) DEFAULT NULL,
  `DEPT_NATURE` varchar(16) DEFAULT NULL,
  `DEPT_LEVEL` bigint(22) DEFAULT NULL,
  `DEPT_CODE` varchar(32) DEFAULT NULL,
  `LINK_PHONE` varchar(15) DEFAULT NULL,
  `LINK_FAX` varchar(15) DEFAULT NULL,
  `LINK_EMAIL` varchar(200) DEFAULT NULL,
  `HOME_PAGE` varchar(200) DEFAULT NULL,
  `LINK_NAME` varchar(20) DEFAULT NULL,
  `LINK_ADDRESS` text,
  `LEGAL_NAME` varchar(100) DEFAULT NULL,
  `LEGAL_PHONE` varchar(100) DEFAULT NULL,
  `LEGAL_MOBILE` varchar(100) DEFAULT NULL,
  `LEGAL_FAX` varchar(100) DEFAULT NULL,
  `LEGAL_EMAIL` varchar(200) DEFAULT NULL,
  `LEGAL_HOMEPAGE` varchar(200) DEFAULT NULL,
  `LEGAL_IM` varchar(200) DEFAULT NULL,
  `ADMIN_NAME` varchar(100) DEFAULT NULL,
  `ADMIN_PHONE` varchar(100) DEFAULT NULL,
  `ADMIN_MOBILE` varchar(100) DEFAULT NULL,
  `ADMIN_FAX` varchar(100) DEFAULT NULL,
  `ADMIN_EMAIL` varchar(200) DEFAULT NULL,
  `ADMIN_HOMEPAGE` varchar(200) DEFAULT NULL,
  `ADMIN_IM` varchar(200) DEFAULT NULL,
  `STATUS` varchar(16) DEFAULT NULL,
  `SEAL_IMG` text,
  `SIGN_IMG` text,
  `SORT_NO` bigint(22) DEFAULT NULL,
  `REMARK` text,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `TRAIN_ORG_LEVEL` varchar(16) DEFAULT NULL,
  `TRAIN_ORG_FEATURE` text,
  `IS_VIRTUAL` varchar(1) DEFAULT NULL,
  `LOGO` text,
  `INDUSTRY_TYPE` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPANTHER_DEPARTMENT` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_dict_entry
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_dict_entry`;
CREATE TABLE `ipanther_dict_entry` (
  `ID` varchar(64) NOT NULL,
  `DICT_TYPE_CODE` varchar(64) DEFAULT NULL,
  `DICT_VALUE` varchar(64) DEFAULT NULL,
  `DICT_NAME` text,
  `PARENT_VALUE` varchar(64) DEFAULT NULL,
  `PARENT_NAME` text,
  `RANK` bigint(22) DEFAULT NULL,
  `SORT_NO` bigint(22) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `IS_HIDDEN` varchar(1) DEFAULT NULL,
  `EXP_DICT_NAME` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPANTHER_DICT_ENTRY` (`ID`) USING BTREE,
  KEY `INDX_DICT_TYPE_CODE` (`DICT_TYPE_CODE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for ipanther_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_dict_type`;
CREATE TABLE `ipanther_dict_type` (
  `DICT_TYPE_CODE` varchar(64) NOT NULL,
  `DICT_TYPE_NAME` varchar(64) DEFAULT NULL,
  `RANK` bigint(22) DEFAULT NULL,
  `PARENT_CODE` varchar(64) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`DICT_TYPE_CODE`),
  UNIQUE KEY `PK_IPANTHER_DICT_TYPE` (`DICT_TYPE_CODE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_ipiccall
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_ipiccall`;
CREATE TABLE `ipanther_ipiccall` (
  `years` varchar(4) DEFAULT NULL,
  `公司` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `转让` bigint(20) NOT NULL DEFAULT '0',
  `许可` bigint(21) NOT NULL DEFAULT '0',
  `质押` bigint(20) NOT NULL DEFAULT '0',
  `入股` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_login_log`;
CREATE TABLE `ipanther_login_log` (
  `ID` varchar(64) NOT NULL,
  `USER_ID` varchar(64) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `OS` text,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` decimal(19,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPANTHER_USER_LOGIN` (`ID`) USING BTREE,
  KEY `IDX_IPANTHER_LOGINLOG_SESNID` (`SESSION_ID`) USING BTREE,
  KEY `IDX_IPANTHER_USER_LOGIN_USERID` (`USER_ID`) USING BTREE,
  KEY `IDX_LOGINLOG_LOGINTIME` (`CREATE_TIME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_mail_config
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_mail_config`;
CREATE TABLE `ipanther_mail_config` (
  `ID` varchar(32) NOT NULL DEFAULT '',
  `SMTP_ADDRESS` varchar(40) DEFAULT NULL COMMENT 'SMTP服务器地址',
  `USER_NAME` varchar(40) DEFAULT NULL COMMENT '用户名',
  `user_pass` varchar(40) DEFAULT NULL COMMENT '用户密码',
  `DEFAULT_ADDRESS` varchar(40) DEFAULT NULL COMMENT '默认发送地址',
  `SHOW_NAME` varchar(40) DEFAULT NULL COMMENT '默认显示名称',
  `MAIL_SUBJECT` varchar(100) DEFAULT NULL,
  `MAIL_CONTEXT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮箱配置表';

-- ----------------------------
-- Table structure for ipanther_notice
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_notice`;
CREATE TABLE `ipanther_notice` (
  `ID` varchar(64) NOT NULL,
  `NOTICE_TITLE` text,
  `NOTICE_STATUS` decimal(1,0) DEFAULT NULL,
  `NOTICE_TOP` decimal(1,0) DEFAULT NULL,
  `START_TIME` varchar(50) DEFAULT NULL,
  `END_TIME` varchar(50) DEFAULT NULL,
  `ATTACHMENT` text,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `NOTICE_TYPE` decimal(1,0) DEFAULT NULL,
  `NOTICE_SORT_NO` bigint(22) DEFAULT NULL,
  `NOTICE_CONTENT` longtext,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPANTHER_NOTICE` (`ID`) USING BTREE,
  KEY `IDX_IPANTHER_NOTICE_ETIME` (`END_TIME`) USING BTREE,
  KEY `IDX_IPANTHER_NOTICE_RCODE` (`NOTICE_SORT_NO`) USING BTREE,
  KEY `IDX_IPANTHER_NOTICE_STIME` (`START_TIME`) USING BTREE,
  KEY `IDX_IPANTHER_NOTICE_TYPE` (`NOTICE_TYPE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_patent
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_patent`;
CREATE TABLE `ipanther_patent` (
  `ID` varchar(32) NOT NULL COMMENT '唯一识别码',
  `COMPANY_ID` varchar(32) DEFAULT NULL COMMENT '企业编码',
  `COMPLETE_UNIT` varchar(255) DEFAULT NULL COMMENT '完成单位',
  `PATENT_NAME` varchar(255) DEFAULT NULL COMMENT '专利名称',
  `PATENT_ENGLISH_NAME` varchar(255) DEFAULT NULL COMMENT '专利英文名',
  `APP_NUMBER` varchar(32) DEFAULT NULL COMMENT '专利申请号/专利号',
  `APP_DATE` date DEFAULT NULL COMMENT '专利申请日期',
  `APPLYER` varchar(255) DEFAULT NULL COMMENT '专利申请人/专利权人',
  `APPLYER_NUMBER` varchar(100) DEFAULT NULL COMMENT '申请人文号',
  `APPLYER_ADDRESS` varchar(255) DEFAULT NULL COMMENT '专利申请人地址',
  `FIRST_INVENTOR` varchar(255) DEFAULT NULL COMMENT '第一发明人',
  `INVENTOR` varchar(255) DEFAULT NULL COMMENT '发明人',
  `PATENT_TYPE` varchar(8) DEFAULT NULL COMMENT '专利类型',
  `LEGAL_STATUS` varchar(8) DEFAULT NULL COMMENT '专利法律状态',
  `PUBLICATION_NUMBER` varchar(16) DEFAULT NULL COMMENT '公开号',
  `PUBLICATION_DATE` datetime DEFAULT NULL COMMENT '公开日',
  `AUTHOR_COUNTRY` varchar(8) DEFAULT NULL COMMENT '授权国家',
  `IS_AUTHORIZE` varchar(8) DEFAULT NULL COMMENT '是否授权',
  `AUTHORIZE_DATE` date DEFAULT NULL COMMENT '授权日期',
  `ANNOUNCEMENT_NUMBER` varchar(100) DEFAULT NULL COMMENT '公告号',
  `ANNOUNCEMENT_DATE` datetime DEFAULT NULL COMMENT '公告日',
  `CERTIFICATE_NUMBER` varchar(100) DEFAULT NULL COMMENT '证书号',
  `EXPIRATION_DATE` datetime DEFAULT NULL COMMENT '届满日',
  `SSE_DATE` datetime DEFAULT NULL COMMENT '进入实审日（startSubstantiveExaminationDate）',
  `OPEN_BOOK_DATE` datetime DEFAULT NULL COMMENT '开卷日',
  `PRIORITY_NUMBER` varchar(100) DEFAULT NULL COMMENT '优先权号',
  `PRIORITY_DATE` datetime DEFAULT NULL COMMENT '优先权日',
  `PCT_APPLY_NUMBER` varchar(100) DEFAULT NULL COMMENT 'PCT申请号',
  `PCT_ANNOUNCEMENT_NUMBER` varchar(100) DEFAULT NULL COMMENT 'PCT公布号',
  `PCT_ANNOUNCEMENT_DATE` datetime DEFAULT NULL COMMENT 'PCT公布日',
  `ENTRUST_DATE` datetime DEFAULT NULL COMMENT '委案日期（以下为代理基本信息）',
  `ENTRUST_STAGE` tinyint(2) DEFAULT NULL COMMENT '起始阶段',
  `ENTRUST_DEPT` varchar(200) DEFAULT NULL COMMENT '案件承办部门',
  `AGENCY` varchar(255) DEFAULT NULL COMMENT '代理人',
  `ENTRUST_HANDLER` varchar(255) DEFAULT NULL COMMENT '案件处理人',
  `ASSISTANT_HANDLER` varchar(255) DEFAULT NULL COMMENT '业务助理',
  `AGENCY_REMARK` text COMMENT '备注',
  `CUSTOMER_NAME` varchar(255) DEFAULT NULL COMMENT '客户名称（以下为客户基本信息）',
  `CUSTOMER_CODE` varchar(100) DEFAULT NULL COMMENT '客户代码',
  `CUSTOMER_CONTACTS` varchar(255) DEFAULT NULL COMMENT '客户联系人',
  `CUSTOMER_SOURCE` varchar(255) DEFAULT NULL COMMENT '客户来源',
  `CUSTOMER_ADDRESS` varchar(255) DEFAULT NULL COMMENT '客户地址',
  `MONGO_PATENT_ID` varchar(32) DEFAULT NULL COMMENT '关联了MongoDB里数据的id',
  `CREATOR` varchar(32) DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATEDBY` varchar(32) DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `DEP_ID` varchar(50) DEFAULT NULL,
  `IS_COST` varchar(1) DEFAULT NULL COMMENT '是否生成费用',
  `IS_DELETED` char(1) DEFAULT NULL COMMENT '是否删除',
  `VERSION` bigint(22) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `ID` (`ID`) USING HASH,
  KEY `patent_dept_idx` (`DEP_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专利基本系信息表';

-- ----------------------------
-- Table structure for ipanther_patent_applications
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_patent_applications`;
CREATE TABLE `ipanther_patent_applications` (
  `ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PATENT_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '专利申请号',
  `PATENT_PUBLIC_NUMBER` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '专利公开号',
  `PATENT_NAME` varchar(200) DEFAULT '' COMMENT '专利名称',
  `USE_TYPE` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '使用类别',
  `WP_TECHNOLOGY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '项目名称',
  `WP_FORM_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '专利许可人',
  `WP_TO_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '被许可人',
  `WP_START_DATE` datetime DEFAULT NULL COMMENT '许可起始日期',
  `WP_END_DATE` datetime DEFAULT NULL COMMENT '许可终止时间',
  `WP_TYPE` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '许可类型',
  `WP_FIELD` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '许可范围',
  `PLEP_DEBT_NUMBER` decimal(12,2) DEFAULT NULL COMMENT '质押金额',
  `PLEP_MORTGAGER` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '抵押人',
  `PLEP_PLEDGOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '质押人',
  `PLEP_CREATE_DATE` date DEFAULT NULL COMMENT '抵押时间',
  `PLEP_END_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '抵押结束日期',
  `PLEP_STUTA` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '抵押状态',
  `SP_SHARE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '入股企业',
  `SP_SHARE_TYPE` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '入股类型',
  `SP_SHARE_SCALE` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '入股比例',
  `SP_SHARE_DATE` datetime DEFAULT NULL COMMENT '入股时间',
  `SP_SHARE_CONDITION` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '入股条件',
  `SP_SHARE_MONEY` decimal(12,2) DEFAULT NULL,
  `SP_LINK_MAN` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '入股联系人',
  `AP_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '转让类型',
  `AP_DATE` date DEFAULT NULL COMMENT '转让日期',
  `AP_FROM_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '转让代表人',
  `AP_FROM_ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `AP_FROM_MAN` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '转让方',
  `AP_TO_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '受让人代表',
  `AP_TO_MAN` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '受让方',
  `AP_TO_ADRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `AP_CONDITION` text CHARACTER SET utf8 COLLATE utf8_bin,
  `AP_INCOME` decimal(12,2) DEFAULT NULL COMMENT '转让金额',
  `CONTRACT_NUMBER` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ATTACH_NAME` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_bin,
  `ORG_DEP_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_patent_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_patent_attachment`;
CREATE TABLE `ipanther_patent_attachment` (
  `ID` varchar(32) NOT NULL,
  `PATENT_ID` varchar(32) NOT NULL COMMENT '关联的专利的id',
  `PATENT_APP_NUMBER` varchar(32) DEFAULT NULL COMMENT '关联的专利号/申请号',
  `TYPE` int(10) NOT NULL COMMENT '附件类型（0：申请原文件，1：受理通知书，2：专利证书，3：检索报告，4：代理合同）',
  `FILE_NAME` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `FILE_FULL_NAME` varchar(255) DEFAULT NULL COMMENT '文件全名称',
  `FILE_PATH` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `FILE_SUFFIX` varchar(10) DEFAULT NULL COMMENT '文件后缀名',
  `FILE_SIZE` double(10,0) DEFAULT NULL COMMENT '文件大小',
  `CREATOR` varchar(32) NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `UPDATEDBY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `VERSION` decimal(8,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专利附件信息表';

-- ----------------------------
-- Table structure for ipanther_patent_cost
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_patent_cost`;
CREATE TABLE `ipanther_patent_cost` (
  `ID` varchar(32) NOT NULL,
  `COMPANY_ID` varchar(32) DEFAULT '' COMMENT '所属公司id',
  `PATENT_ID` varchar(32) NOT NULL COMMENT '专利id（关联ipanther_patent）',
  `COST_NAME` varchar(50) DEFAULT NULL COMMENT '费用名称',
  `COST_TYPE` int(10) NOT NULL COMMENT '费用的类型（0：代理服务费，1专利年费，2专利官费，3其他费用）',
  `COST_GOVERNMENT_TYPE` int(10) DEFAULT NULL COMMENT '官费的类型（0：申请费，1：申请实质审查费，2：复查费，3：著录事项变更费-发明人、申请人、专利权人的变更，4：优先权要求费/每项，5：恢复权利请求费，6：无效宣告请求费，7：强制许可请求费，8：强制许可使用裁决请求费，9：印花税，10：附加费，11：专利权评价报告请求费，12：实用新型专利检索报告费，13：中止费，14：申请费-公布印刷费）',
  `COST_ANNUAL_TYPE` int(10) DEFAULT NULL COMMENT '年费的类型（0~19）',
  `COST_STATUS` tinyint(1) NOT NULL COMMENT '缴费状态（0：未缴费，1：已缴费）',
  `COST_AREA` varchar(40) DEFAULT '' COMMENT '缴费区域',
  `FEE_PAYABLE` decimal(10,2) DEFAULT NULL COMMENT '应缴金额',
  `FEE_PAYABLE_DATE` datetime NOT NULL COMMENT '应缴日期',
  `COST_REMARK` varchar(500) DEFAULT NULL COMMENT '费用说明',
  `RECEIPT_NUMBER` varchar(50) DEFAULT NULL COMMENT '官方回执编号',
  `RECEIPT_DATE` datetime DEFAULT NULL COMMENT '官方回执日期',
  `PAYOR` varchar(50) DEFAULT NULL COMMENT '缴费人',
  `PAYMENT_AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '缴费金额',
  `PAYMENTER` varchar(50) DEFAULT NULL COMMENT '费用填报人（最后一次填报）',
  `PAYMENT_DATE` datetime DEFAULT NULL COMMENT '费用填报日期（最后一次填报）',
  `ATTACHMENT` text COMMENT '缴费发票附件信息',
  `STANDARD_AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '标准金额',
  `MITIGATION_RATIO` decimal(5,2) DEFAULT NULL COMMENT '费用缓减比例',
  `STANDARD_DATE` datetime DEFAULT NULL COMMENT '标准缴费日期',
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` char(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专利费用管理表';

-- ----------------------------
-- Table structure for ipanther_patent_cost_monitor
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_patent_cost_monitor`;
CREATE TABLE `ipanther_patent_cost_monitor` (
  `ID` varchar(32) NOT NULL,
  `COMPANY_ID` varchar(32) NOT NULL COMMENT '关联的公司的id',
  `PATENT_COST_ID` varchar(32) NOT NULL COMMENT '关联的费用id（ipanther_patent_cost表）',
  `DISTANCE_DEAD_DAY` int(10) DEFAULT NULL COMMENT '距离期限时间',
  `DEAD_DATE` datetime DEFAULT NULL COMMENT '绝限日期',
  `EXECUTOR` varchar(50) DEFAULT NULL COMMENT '执行人',
  `EXECUTE_DATE` datetime DEFAULT NULL COMMENT '执行日期',
  `VERIFICATION` varchar(50) DEFAULT NULL COMMENT '核销人',
  `STATUS` tinyint(1) DEFAULT NULL COMMENT '期限状态',
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` char(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_monitor` (`COMPANY_ID`,`PATENT_COST_ID`,`CREATOR`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='费用监控表';

-- ----------------------------
-- Table structure for ipanther_patent_cost_payment
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_patent_cost_payment`;
CREATE TABLE `ipanther_patent_cost_payment` (
  `ID` varchar(32) NOT NULL,
  `PATENT_COST_ID` varchar(32) NOT NULL COMMENT '关联的费用表的id（ipanther_patent_cost）',
  `PAYMENT_AMOUNT` decimal(10,2) NOT NULL COMMENT '实缴金额',
  `PAYMENT_DATE` datetime DEFAULT NULL COMMENT '实缴日期',
  `PAYMENTER` varchar(50) DEFAULT NULL COMMENT '费用填报人',
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` char(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专利费用确认缴费历史表';

-- ----------------------------
-- Table structure for ipanther_patent_type
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_patent_type`;
CREATE TABLE `ipanther_patent_type` (
  `years` varchar(4) DEFAULT NULL,
  `invent` bigint(21) NOT NULL DEFAULT '0',
  `appearance` bigint(20) NOT NULL DEFAULT '0',
  `utility` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_seq
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_seq`;
CREATE TABLE `ipanther_seq` (
  `ID` varchar(64) NOT NULL,
  `SEQ_NAME` varchar(64) DEFAULT NULL,
  `SEQ_CODE` varchar(64) DEFAULT NULL,
  `CURRENT_NUM` decimal(19,0) DEFAULT NULL,
  `NEXT_NUM` decimal(19,0) DEFAULT NULL,
  `STEP_NUM` decimal(19,0) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPANTHER_SEQ` (`ID`) USING BTREE,
  UNIQUE KEY `IDX_SEQ_CODE` (`SEQ_CODE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_trademark
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_trademark`;
CREATE TABLE `ipanther_trademark` (
  `ID` varchar(64) NOT NULL COMMENT '唯一性标识',
  `REGISTERED_NUMBER` varchar(16) DEFAULT NULL COMMENT '商标注册号',
  `REGISTERED_NAME` varchar(128) DEFAULT NULL COMMENT '注册名称',
  `REGISTERED_IMAGE` text COMMENT '商标图',
  `APPLY_DATE` date DEFAULT NULL COMMENT '申请日期',
  `CLASSIFY` varchar(16) DEFAULT NULL COMMENT '商标服务分类',
  `CLASSIFY_LIKE` varchar(16) DEFAULT NULL,
  `TRADEMARK_STATE` text COMMENT '商标状态',
  `FIRST_PUBLIC_NUMBER` varchar(16) DEFAULT NULL COMMENT '初审公开号',
  `REGISTER_PUBLIC_NUMBER` varchar(40) DEFAULT NULL COMMENT '注册公开号',
  `FIRST_PUBLIC_DATE` date DEFAULT NULL COMMENT '初审公告日期',
  `REGISTER_PUBLIC_DATE` date DEFAULT NULL COMMENT '注册公告日期',
  `BEGIN_DATE` date DEFAULT NULL,
  `IS_OWNER` varchar(8) DEFAULT '0' COMMENT '0：否 1：是',
  `TRADEMARK_TYPE` varchar(8) DEFAULT NULL COMMENT '商标类型',
  `REGISTER_TYPE` varchar(64) DEFAULT NULL,
  `REGISTER_DATE` date DEFAULT NULL COMMENT '注册日期',
  `VALID_DATE` date DEFAULT NULL COMMENT '有效日期',
  `REGISTER_CITY` varchar(16) DEFAULT NULL COMMENT '商标注册地',
  `REGISTER_ROLE` varchar(255) DEFAULT NULL COMMENT '注册人',
  `REGISTER_ADDRESS` varchar(255) DEFAULT NULL COMMENT '注册地址',
  `AGENCY_CODE` varchar(16) DEFAULT NULL COMMENT '委托代理机构',
  `REGISTOR_INFO` text COMMENT '个人信息',
  `TRADEMARK_FILE` text,
  `CREATOR` varchar(64) DEFAULT NULL COMMENT '企业注册号',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '输入信息',
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(255) DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商标';

-- ----------------------------
-- Table structure for ipanther_user
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_user`;
CREATE TABLE `ipanther_user` (
  `ID` varchar(64) NOT NULL,
  `USER_NAME` varchar(32) DEFAULT NULL,
  `PASSWORD` varchar(64) DEFAULT NULL,
  `PASSWORD_PLAIN` varchar(64) DEFAULT NULL,
  `ROLE_CODE` varchar(200) DEFAULT NULL,
  `REAL_NAME` varchar(200) DEFAULT NULL,
  `SEX` varchar(16) DEFAULT NULL,
  `COUNTRY` varchar(16) DEFAULT NULL,
  `NATION` varchar(16) DEFAULT NULL,
  `HOMETOWN` varchar(64) DEFAULT NULL,
  `HOMETOWN_PROVINCE` varchar(64) DEFAULT NULL,
  `HOMETOWN_CITY` varchar(64) DEFAULT NULL,
  `HOMETOWN_COUNTIES` varchar(64) DEFAULT NULL,
  `PAPERWORK_TYPE` varchar(16) DEFAULT NULL,
  `PAPERWORK_NO` varchar(32) DEFAULT NULL,
  `MARITAL_STATUS` varchar(16) DEFAULT NULL,
  `POLITICS_ROLE` varchar(16) DEFAULT NULL,
  `PASSWORD_ASK` varchar(100) DEFAULT NULL,
  `PASSWORD_ANSWER` varchar(100) DEFAULT NULL,
  `BORN_DATE` varchar(8) DEFAULT NULL,
  `WORK_DATE` datetime DEFAULT NULL,
  `JOB` varchar(32) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `MOBILE_PHONE` varchar(15) DEFAULT NULL,
  `OFFICE_ADDRESS` text,
  `OFFICE_PHONE` varchar(32) DEFAULT NULL,
  `HOME_PHONE` varchar(32) DEFAULT NULL,
  `HOME_ADDRESS` text,
  `CORR_ADDRESS` text,
  `POST_CODE` varchar(8) DEFAULT NULL,
  `HOME_PAGE` text,
  `IM_NO` text,
  `AVATAR` text,
  `IS_ADMIN` varchar(2) DEFAULT NULL,
  `ADMIN_LEVEL` varchar(32) DEFAULT NULL,
  `ADMIN_START_DATE` datetime DEFAULT NULL,
  `ADMIN_END_DATE` datetime DEFAULT NULL,
  `START_TIME` datetime DEFAULT CURRENT_TIMESTAMP,
  `END_TIME` datetime DEFAULT NULL,
  `STATUS` varchar(16) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `BELONG_DEPT_NAME` varchar(200) DEFAULT NULL,
  `CURRENT_PROVINCE` varchar(100) DEFAULT NULL,
  `CURRENT_STREET` text,
  `CURRENT_CITY` varchar(100) DEFAULT NULL,
  `CURRENT_COUNTIES` varchar(100) DEFAULT NULL,
  `TYPE` varchar(16) DEFAULT NULL,
  `STUDENT_STATUS` varchar(16) DEFAULT NULL,
  `TEACHER_STATUS` varchar(16) DEFAULT NULL,
  `INTRODUCE` text,
  `IS_PERSON` varchar(16) DEFAULT NULL,
  `faxes` varchar(32) DEFAULT NULL,
  `WECHAT_ID` varchar(255) DEFAULT NULL,
  `WECHAT_NICKNAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPANTHER_USER` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_useremail
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_useremail`;
CREATE TABLE `ipanther_useremail` (
  `ID` varchar(45) NOT NULL,
  `USER_ID` varchar(45) DEFAULT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  `USER_EMAIL` varchar(45) DEFAULT NULL,
  `CREATOR` varchar(45) DEFAULT NULL,
  `CREATE_TIME` varchar(45) DEFAULT NULL,
  `UPDATEDBY` varchar(45) DEFAULT NULL,
  `UPDATE_TIME` varchar(45) DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_user_dept
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_user_dept`;
CREATE TABLE `ipanther_user_dept` (
  `USER_ID` varchar(64) NOT NULL,
  `DEPT_ID` varchar(64) NOT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`DEPT_ID`),
  UNIQUE KEY `PK_IPANTHER_USER_DEPT` (`USER_ID`,`DEPT_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_user_email
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_user_email`;
CREATE TABLE `ipanther_user_email` (
  `ID` varchar(50) NOT NULL,
  `USER_NAME` varchar(45) DEFAULT NULL,
  `USER_EMAIL` varchar(45) DEFAULT NULL,
  `USER_ID` varchar(45) DEFAULT NULL,
  `STATUS` varchar(1) DEFAULT NULL COMMENT '是否为常联系人（发送过邮件为常联系人）',
  `TOTIME` varchar(45) DEFAULT NULL COMMENT '邮件发送时间',
  `COMPANY_NAME` varchar(45) DEFAULT NULL,
  `MOBILE_PHONE` varchar(15) DEFAULT NULL,
  `CREATOR` varchar(45) DEFAULT NULL,
  `CREATE_TIME` varchar(45) DEFAULT NULL,
  `UPDATEDBY` varchar(45) DEFAULT NULL,
  `UPDATE_TIME` varchar(45) DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_user_his
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_user_his`;
CREATE TABLE `ipanther_user_his` (
  `ID` varchar(64) NOT NULL,
  `USER_ID` varchar(64) DEFAULT NULL,
  `DEPT_ID` varchar(64) DEFAULT NULL,
  `USER_NAME` varchar(32) DEFAULT NULL,
  `PASSWORD` varchar(64) DEFAULT NULL,
  `PASSWORD_PLAIN` varchar(64) DEFAULT NULL,
  `ROLE_CODE` varchar(200) DEFAULT NULL,
  `REAL_NAME` varchar(200) DEFAULT NULL,
  `SEX` varchar(16) DEFAULT NULL,
  `COUNTRY` varchar(16) DEFAULT NULL,
  `NATION` varchar(16) DEFAULT NULL,
  `HOMETOWN` varchar(64) DEFAULT NULL,
  `HOMETOWN_PROVINCE` varchar(64) DEFAULT NULL,
  `HOMETOWN_CITY` varchar(64) DEFAULT NULL,
  `HOMETOWN_COUNTIES` varchar(64) DEFAULT NULL,
  `PAPERWORK_TYPE` varchar(16) DEFAULT NULL,
  `PAPERWORK_NO` varchar(32) DEFAULT NULL,
  `MARITAL_STATUS` varchar(16) DEFAULT NULL,
  `POLITICS_ROLE` varchar(16) DEFAULT NULL,
  `PASSWORD_ASK` varchar(100) DEFAULT NULL,
  `PASSWORD_ANSWER` varchar(100) DEFAULT NULL,
  `BORN_DATE` varchar(8) DEFAULT NULL,
  `WORK_DATE` datetime DEFAULT NULL,
  `JOB` varchar(32) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `MOBILE_PHONE` varchar(15) DEFAULT NULL,
  `OFFICE_ADDRESS` text,
  `OFFICE_PHONE` varchar(32) DEFAULT NULL,
  `HOME_PHONE` varchar(32) DEFAULT NULL,
  `HOME_ADDRESS` text,
  `CORR_ADDRESS` text,
  `POST_CODE` varchar(8) DEFAULT NULL,
  `HOME_PAGE` text,
  `IM_NO` text,
  `AVATAR` text,
  `IS_ADMIN` varchar(2) DEFAULT NULL,
  `ADMIN_LEVEL` varchar(32) DEFAULT NULL,
  `ADMIN_START_DATE` datetime DEFAULT NULL,
  `ADMIN_END_DATE` datetime DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `STATUS` varchar(16) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `BELONG_DEPT_NAME` varchar(200) DEFAULT NULL,
  `CURRENT_PROVINCE` varchar(100) DEFAULT NULL,
  `CURRENT_STREET` text,
  `CURRENT_CITY` varchar(100) DEFAULT NULL,
  `CURRENT_COUNTIES` varchar(100) DEFAULT NULL,
  `TYPE` varchar(16) DEFAULT NULL,
  `STUDENT_STATUS` varchar(16) DEFAULT NULL,
  `TEACHER_STATUS` varchar(16) DEFAULT NULL,
  `INTRODUCE` text,
  `IS_PERSON` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPANTHER_USER_HIS` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_user_login_attempt
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_user_login_attempt`;
CREATE TABLE `ipanther_user_login_attempt` (
  `ACCOUNT_ID` varchar(32) NOT NULL,
  `LOGIN_PERIOD_START_TIME` datetime DEFAULT NULL,
  `LAST_LOGIN_ATTEMPT_TIME` datetime DEFAULT NULL,
  `LOGIN_ATTEMPT_COUNT` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ACCOUNT_ID`),
  UNIQUE KEY `SYS_C0062932` (`ACCOUNT_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_user_login_log`;
CREATE TABLE `ipanther_user_login_log` (
  `ID` varchar(32) NOT NULL,
  `ACCOUNT_ID` varchar(32) DEFAULT NULL,
  `LOGIN_TIME` datetime DEFAULT NULL,
  `LOGOUT_TIME` datetime DEFAULT NULL,
  `SESSION_ID` varchar(100) DEFAULT NULL,
  `IP_ADDR` varchar(64) DEFAULT NULL,
  `USER_AGENT` varchar(64) DEFAULT NULL,
  `CREATOR` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_USER_LOGIN_LOG_ID2` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_user_parttime
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_user_parttime`;
CREATE TABLE `ipanther_user_parttime` (
  `ID` varchar(50) NOT NULL,
  `USER_ID` varchar(64) DEFAULT NULL,
  `TYPE` varchar(200) DEFAULT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `TERM_NAME` varchar(200) DEFAULT NULL,
  `TERM_LEVEL` varchar(200) DEFAULT NULL,
  `TERM_DEPT` varchar(200) DEFAULT NULL,
  `JOB` varchar(200) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPANTHER_USER_PARTTIME` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_user_question
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_user_question`;
CREATE TABLE `ipanther_user_question` (
  `ID` varchar(64) NOT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` char(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `NAME` varchar(64) DEFAULT NULL,
  `EMAIL` varchar(64) DEFAULT NULL,
  `PHONE` varchar(64) DEFAULT NULL,
  `QUESTION` text,
  `ANSWER` text,
  `STATUS` varchar(64) DEFAULT NULL,
  `USER_ID` varchar(64) DEFAULT NULL,
  `START_TIME` varchar(50) DEFAULT NULL,
  `END_TIME` varchar(50) DEFAULT NULL,
  `COMMON` varchar(64) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_user_regions
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_user_regions`;
CREATE TABLE `ipanther_user_regions` (
  `ID` varchar(64) NOT NULL,
  `MODULE` text,
  `USER_ID` varchar(64) DEFAULT NULL,
  `REGIONS_CODE` varchar(32) DEFAULT NULL,
  `HAS_CHILD` varchar(1) DEFAULT NULL,
  `NOTE` text,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPANTHER_USER_REGIONS` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_user_research
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_user_research`;
CREATE TABLE `ipanther_user_research` (
  `ID` varchar(64) NOT NULL,
  `USER_ID` varchar(64) DEFAULT NULL,
  `RESEARCH_FIELD` varchar(64) DEFAULT NULL,
  `RESEARCH_SPECIAL` text,
  `ACHIEVEMENT_NAME` varchar(128) DEFAULT NULL,
  `PUBLICATION_DATE` datetime DEFAULT NULL,
  `PUBLICATION_UNIT` varchar(255) DEFAULT NULL,
  `PUBLICATION_NAME` varchar(128) DEFAULT NULL,
  `PUBLICATION_NO` varchar(64) DEFAULT NULL,
  `MEETING_NAME` varchar(128) DEFAULT NULL,
  `SELF_AFFECT` varchar(128) DEFAULT NULL,
  `ATTACHMENT` text,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPANTHER_USER_RESEARCH` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_user_reward
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_user_reward`;
CREATE TABLE `ipanther_user_reward` (
  `ID` varchar(64) NOT NULL,
  `USER_ID` varchar(64) DEFAULT NULL,
  `AWARD_LEVEL` varchar(16) DEFAULT NULL,
  `AWARD_PROJECT` varchar(128) DEFAULT NULL,
  `AWARD_DRADE` varchar(16) DEFAULT NULL,
  `AWARD_DEPT` varchar(128) DEFAULT NULL,
  `AWARD_DATE` datetime DEFAULT NULL,
  `AWARD_REMARK` varchar(128) DEFAULT NULL,
  `ATTACHMENT` text,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPANTHER_USER_REWARD` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_user_staff
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_user_staff`;
CREATE TABLE `ipanther_user_staff` (
  `USER_ID` varchar(64) NOT NULL,
  `USER_TYPE` varchar(200) DEFAULT NULL,
  `HIGH_DIPLOMA` varchar(16) DEFAULT NULL,
  `HIGH_SUBJECT` varchar(200) DEFAULT NULL,
  `HIGH_COLLEGE` varchar(200) DEFAULT NULL,
  `HIGH_DT` datetime DEFAULT NULL,
  `HIGH_DEGREE` varchar(16) DEFAULT NULL,
  `HIGH_DEGREE_UNIT` varchar(200) DEFAULT NULL,
  `HIGH_DEGREE_DT` datetime DEFAULT NULL,
  `FOREIGN_LANGUAGES` varchar(16) DEFAULT NULL,
  `FOREIGN_DEGREE` varchar(16) DEFAULT NULL,
  `FOREIGN_LEVEL` varchar(16) DEFAULT NULL,
  `COMPUTER_LEVEL` varchar(16) DEFAULT NULL,
  `CHINESE_LEVEL` varchar(16) DEFAULT NULL,
  `PRO_NAME` varchar(128) DEFAULT NULL,
  `PRO_DT` datetime DEFAULT NULL,
  `PRO_JOB` varchar(100) DEFAULT NULL,
  `EXPERT_TYPE` varchar(16) DEFAULT NULL,
  `EXPERT_LEVEL` varchar(16) DEFAULT NULL,
  `TITLE` varchar(32) DEFAULT NULL,
  `TITLE_DT` datetime DEFAULT NULL,
  `RESEARCH_FIELD` text,
  `RESEARCH_SPECIAL` text,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `TRAIN_DOMAIN` varchar(200) DEFAULT NULL,
  `TRAIN_DIRECTION` varchar(200) DEFAULT NULL,
  `HAVE_EXP` varchar(16) DEFAULT NULL,
  `EXP_DESC` text,
  `MAIN_THESIS` varchar(200) DEFAULT NULL,
  `BANK_ACCOUNT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `PK_IPANTHER_USER_STAFF` (`USER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_user_staff_his
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_user_staff_his`;
CREATE TABLE `ipanther_user_staff_his` (
  `HIS_ID` varchar(64) NOT NULL,
  `USER_TYPE` varchar(200) DEFAULT NULL,
  `HIGH_DIPLOMA` varchar(16) DEFAULT NULL,
  `HIGH_SUBJECT` varchar(200) DEFAULT NULL,
  `HIGH_COLLEGE` varchar(200) DEFAULT NULL,
  `HIGH_DT` datetime DEFAULT NULL,
  `HIGH_DEGREE` varchar(16) DEFAULT NULL,
  `HIGH_DEGREE_UNIT` varchar(200) DEFAULT NULL,
  `HIGH_DEGREE_DT` datetime DEFAULT NULL,
  `FOREIGN_LANGUAGES` varchar(16) DEFAULT NULL,
  `FOREIGN_DEGREE` varchar(16) DEFAULT NULL,
  `FOREIGN_LEVEL` varchar(16) DEFAULT NULL,
  `COMPUTER_LEVEL` varchar(16) DEFAULT NULL,
  `CHINESE_LEVEL` varchar(16) DEFAULT NULL,
  `PRO_NAME` varchar(128) DEFAULT NULL,
  `PRO_DT` datetime DEFAULT NULL,
  `PRO_JOB` varchar(100) DEFAULT NULL,
  `EXPERT_TYPE` varchar(16) DEFAULT NULL,
  `EXPERT_LEVEL` varchar(16) DEFAULT NULL,
  `TITLE` varchar(32) DEFAULT NULL,
  `TITLE_DT` datetime DEFAULT NULL,
  `RESEARCH_FIELD` text,
  `RESEARCH_SPECIAL` text,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `TRAIN_DOMAIN` varchar(200) DEFAULT NULL,
  `TRAIN_DIRECTION` varchar(200) DEFAULT NULL,
  `HAVE_EXP` varchar(16) DEFAULT NULL,
  `EXP_DESC` text,
  `MAIN_THESIS` varchar(200) DEFAULT NULL,
  `BANK_ACCOUNT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`HIS_ID`),
  UNIQUE KEY `PK_IPANTHER_USER_STAFF_HIS` (`HIS_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_user_transfer
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_user_transfer`;
CREATE TABLE `ipanther_user_transfer` (
  `ID` varchar(64) NOT NULL,
  `USER_ID` varchar(64) DEFAULT NULL,
  `OUT_DEPT_ID` varchar(64) DEFAULT NULL,
  `OUT_TIME` datetime DEFAULT NULL,
  `OUT_OPERATOR` varchar(64) DEFAULT NULL,
  `OUT_COMMENT` text,
  `IN_DEPT_ID` varchar(64) DEFAULT NULL,
  `IN_TIME` datetime DEFAULT NULL,
  `IN_COMMENT` text,
  `IN_OPERATOR` varchar(64) DEFAULT NULL,
  `IS_TRANSFERED` varchar(1) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPANTHER_USER_TRANSFER` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_validate
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_validate`;
CREATE TABLE `ipanther_validate` (
  `ID` varchar(64) NOT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` char(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `EMAIL` varchar(64) DEFAULT NULL,
  `PHONE` varchar(64) DEFAULT NULL,
  `CODE` varchar(64) DEFAULT NULL,
  `USER_ID` varchar(64) DEFAULT NULL,
  `START_TIME` varchar(50) DEFAULT NULL,
  `END_TIME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipanther_warn_time_line
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_warn_time_line`;
CREATE TABLE `ipanther_warn_time_line` (
  `ID` varchar(40) NOT NULL COMMENT '主键',
  `ONE_TIME_LINE` int(10) DEFAULT NULL COMMENT '一级预警时限',
  `TWO_TIME_LINE` int(10) DEFAULT NULL COMMENT '二级预警时限',
  `THREE_TIME_LINE` int(10) DEFAULT NULL COMMENT '三级预警时限',
  `COMPANY_ID` varchar(50) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` char(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='期限预警配置表';

-- ----------------------------
-- Table structure for ipanther_wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `ipanther_wechat_user`;
CREATE TABLE `ipanther_wechat_user` (
  `ID` varchar(32) NOT NULL,
  `OPEN_ID` varchar(32) NOT NULL DEFAULT '' COMMENT '微信拿到的openId',
  `NICK_NAME` varchar(200) DEFAULT NULL COMMENT '微信用户名',
  `PHONE` varchar(50) DEFAULT NULL COMMENT '绑定的手机号',
  `STATUS` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户状态 0：未绑定手机号，1：已绑定手机号但未绑定用户，2：已绑定用户',
  `USER_ID` varchar(32) DEFAULT '' COMMENT '关联的用户的信息',
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` char(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `uq_phone` (`PHONE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipr_course
-- ----------------------------
DROP TABLE IF EXISTS `ipr_course`;
CREATE TABLE `ipr_course` (
  `ID` varchar(64) NOT NULL,
  `PROC_INST_ID` varchar(128) DEFAULT NULL,
  `COURSE_CODE` varchar(64) DEFAULT NULL,
  `COURSE_NAME` varchar(100) DEFAULT NULL,
  `COURSE_INTRO` text,
  `DECLARE_DEPT` varchar(64) DEFAULT NULL,
  `DECLARE_USER` varchar(64) DEFAULT NULL,
  `DECLARE_TIME` datetime DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `TEACHER_NAME` varchar(64) DEFAULT NULL,
  `TEACHER_UNIT` varchar(100) DEFAULT NULL,
  `TEACHER_JOB` varchar(64) DEFAULT NULL,
  `TRAIN_TYPE` varchar(16) DEFAULT NULL,
  `ATTEND_ELEC` varchar(64) DEFAULT NULL,
  `STUDY_HOURS` bigint(22) DEFAULT NULL,
  `HOURS_TYPE` varchar(16) DEFAULT NULL,
  `STUDY_DAYS` bigint(22) DEFAULT NULL,
  `COURSE_TYPE` varchar(16) DEFAULT NULL,
  `COURSE_LEVEL` varchar(16) DEFAULT NULL,
  `APPLY_JOB` text,
  `APPLY_POSITION` text,
  `HAS_BOOK` text,
  `BOOK_NAME` text,
  `BOOK_FORM` varchar(16) DEFAULT NULL,
  `PUBLICATION` varchar(100) DEFAULT NULL,
  `AUTHOR` varchar(100) DEFAULT NULL,
  `AUTHOR_IMG` text,
  `AUTHOR_DESC` text,
  `PUBLISH_TIME` datetime DEFAULT NULL,
  `TRAIN_CASH` decimal(19,2) DEFAULT NULL,
  `TRAIN_CASH_UNIT` varchar(100) DEFAULT NULL,
  `TRAIN_CASH_WAY` varchar(64) DEFAULT NULL,
  `BOOK_CASH` decimal(19,2) DEFAULT NULL,
  `BOOK_CASH_UNIT` varchar(100) DEFAULT NULL,
  `BOOK_CASH_WAY` varchar(64) DEFAULT NULL,
  `TOTAL_CASH` decimal(19,2) DEFAULT NULL,
  `AUDIT_EXPERT` text,
  `AUDIT_CONTENT` text,
  `AUDIT_RESULT` text,
  `AUDIT_TIME` datetime DEFAULT NULL,
  `MOBILE_STUDY` varchar(16) DEFAULT NULL,
  `COURSE_IMG` text,
  `ATTACHMENT` text,
  `STATUS` varchar(16) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `APPLY_COUNT` bigint(22) DEFAULT '0',
  `MAX_APPLY_COUNT` bigint(22) DEFAULT '2',
  `EXPERT_ID` varchar(64) DEFAULT NULL,
  `EXPERT_ATTACHMENT` text,
  `COURSE_STAGE` varchar(16) DEFAULT NULL,
  `TEACHER_AVATAR` text,
  `PERSON_TYPE` varchar(1000) DEFAULT NULL,
  `INDUSTRY_TYPE` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPR_COURSE` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipr_course_effect_evalua
-- ----------------------------
DROP TABLE IF EXISTS `ipr_course_effect_evalua`;
CREATE TABLE `ipr_course_effect_evalua` (
  `ID` varchar(64) NOT NULL,
  `COURSE_ID` varchar(64) DEFAULT NULL,
  `TRAIN_ID` varchar(64) DEFAULT NULL,
  `COMPLETE` bigint(22) DEFAULT NULL,
  `APPROPRIATE` bigint(22) DEFAULT NULL,
  `SUITABLE_FORM` bigint(22) DEFAULT NULL,
  `DOVEWHELL` bigint(22) DEFAULT NULL,
  `LOGISTICS` bigint(22) DEFAULT NULL,
  `OVERALL` bigint(22) DEFAULT NULL,
  `HELP` text,
  `ENUMERATE` text,
  `RESULTS` text,
  `SUGGESTION` text,
  `TOTAL_NUM` bigint(22) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `USER_ID` varchar(64) DEFAULT NULL,
  `TRAINING_SUMMARY` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPR_TRAIN_EFFECT` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipr_course_flow
-- ----------------------------
DROP TABLE IF EXISTS `ipr_course_flow`;
CREATE TABLE `ipr_course_flow` (
  `ID` varchar(64) NOT NULL,
  `COURSE_ID` varchar(64) DEFAULT NULL,
  `TASK_NAME` varchar(200) DEFAULT NULL,
  `TASK_ID` varchar(64) DEFAULT NULL,
  `AUDIT_DEPT` varchar(64) DEFAULT NULL,
  `AUDIT_TIME` datetime DEFAULT NULL,
  `AUDIT_USER` varchar(64) DEFAULT NULL,
  `AUDIT_RESULT` text,
  `AUDIT_CONTENT` text,
  `STATUS` varchar(64) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPR_COURSE_FLOW` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipr_course_register
-- ----------------------------
DROP TABLE IF EXISTS `ipr_course_register`;
CREATE TABLE `ipr_course_register` (
  `ID` varchar(64) NOT NULL,
  `COURSE_ID` varchar(64) DEFAULT NULL,
  `USER_ID` varchar(64) DEFAULT NULL,
  `TRAIN_ID` varchar(64) DEFAULT NULL,
  `SCORE` decimal(19,1) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `RESULT` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPR_COURSE_REGISTER` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipr_course_teacher
-- ----------------------------
DROP TABLE IF EXISTS `ipr_course_teacher`;
CREATE TABLE `ipr_course_teacher` (
  `ID` varchar(64) NOT NULL,
  `COURSE_ID` varchar(64) DEFAULT NULL,
  `TEACHER_ID` varchar(64) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `TRAIN_ID` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPR_COURSE_TEACHER` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipr_project
-- ----------------------------
DROP TABLE IF EXISTS `ipr_project`;
CREATE TABLE `ipr_project` (
  `ID` varchar(64) NOT NULL,
  `PROC_INST_ID` varchar(128) DEFAULT NULL,
  `PROJECT_CODE` varchar(64) DEFAULT NULL,
  `PROJECT_NAME` varchar(100) DEFAULT NULL,
  `YEAR` text,
  `DECLARE_DEPT` varchar(64) DEFAULT NULL,
  `DECLARE_USER` varchar(64) DEFAULT NULL,
  `DECLARE_TIME` datetime DEFAULT NULL,
  `EXPERT_ID` varchar(64) DEFAULT NULL,
  `HEAD_ID` varchar(64) DEFAULT NULL,
  `HEAD_UNIT` varchar(64) DEFAULT NULL,
  `PROJECT_SUBJECT` text,
  `INDEX_OUT` varchar(128) DEFAULT NULL,
  `INDEX_BENEFIT` varchar(128) DEFAULT NULL,
  `INDEX_SATISFY` varchar(128) DEFAULT NULL,
  `CASH` decimal(19,2) DEFAULT NULL,
  `CASH_FROM` varchar(64) DEFAULT NULL,
  `EVAL_PERFORM` decimal(19,2) DEFAULT NULL,
  `EVAL_SCORE` decimal(19,2) DEFAULT NULL,
  `EVAL_RESULT` text,
  `EVAL_REPORT` text,
  `EVAL_STUDENT` text,
  `EVAL_EXPERT` text,
  `PROJECT_IMG` text,
  `ATTACHMENT` text,
  `STATUS` varchar(16) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `PORJECT_INTRO` text,
  `APPLY_COUNT` bigint(22) DEFAULT '0',
  `MAX_APPLY_COUNT` bigint(22) DEFAULT '2',
  `TRAIN_NUM` bigint(22) DEFAULT NULL,
  `PLAN_HOURS` bigint(22) DEFAULT NULL,
  `IS_HIDDEN` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPR_PROJECT` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipr_project_flow
-- ----------------------------
DROP TABLE IF EXISTS `ipr_project_flow`;
CREATE TABLE `ipr_project_flow` (
  `ID` varchar(64) NOT NULL,
  `PROJECT_ID` varchar(64) DEFAULT NULL,
  `TASK_NAME` varchar(200) DEFAULT NULL,
  `TASK_ID` varchar(64) DEFAULT NULL,
  `AUDIT_DEPT` varchar(64) DEFAULT NULL,
  `AUDIT_TIME` datetime DEFAULT NULL,
  `AUDIT_USER` varchar(64) DEFAULT NULL,
  `AUDIT_RESULT` text,
  `AUDIT_CONTENT` text,
  `STATUS` varchar(64) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPR_PROJECT_FLOW` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipr_project_performance_target
-- ----------------------------
DROP TABLE IF EXISTS `ipr_project_performance_target`;
CREATE TABLE `ipr_project_performance_target` (
  `ID` varchar(64) NOT NULL,
  `USER_ID` varchar(64) DEFAULT NULL,
  `COURSE_ID` varchar(64) DEFAULT NULL,
  `TRAIN_ID` varchar(64) DEFAULT NULL,
  `PROJECT_ID` varchar(64) DEFAULT NULL,
  `OVERALL_GOAL` text,
  `ANNUAL_TARGET` text,
  `TRAIN_COMPLETION_RATE` varchar(32) DEFAULT NULL,
  `TRIAIN_REMARK` text,
  `TRAIN_ACTUAL_COMPLETION_RATE` varchar(32) DEFAULT NULL,
  `HOURS_COMPLETION_RATE` varchar(32) DEFAULT NULL,
  `HOURS_REMARK` text,
  `HOURS_ACTUAL_COMPLETION_RATE` varchar(32) DEFAULT NULL,
  `WORK_COMPLETION_RATE` varchar(32) DEFAULT NULL,
  `WORK_REMARK` text,
  `WORK_ACTUAL_COMPLETION_RATE` varchar(32) DEFAULT NULL,
  `PRODUCE_COMPLETION_RATE` varchar(32) DEFAULT NULL,
  `PRODUCE_REMARK` text,
  `PRODUCE_ACTUAL_COMPLETION_RATE` varchar(32) DEFAULT NULL,
  `SATISFACTION_DEGREE` varchar(32) DEFAULT NULL,
  `SATISFACTION_DEGREE_REMARK` text,
  `ACTUAL_SATISFACTION` varchar(32) DEFAULT NULL,
  `BENEFIT_REMARK` text,
  `ACTUAL_BENEFIT` varchar(32) DEFAULT NULL,
  `BENEFIT` varchar(32) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `PERFORMANCE_EVALUATION` text,
  `ATTACHMENT` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_PERFORMANCE_TARGET` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipr_teaching_evalua
-- ----------------------------
DROP TABLE IF EXISTS `ipr_teaching_evalua`;
CREATE TABLE `ipr_teaching_evalua` (
  `ID` varchar(64) NOT NULL,
  `PROJECT_ID` varchar(64) DEFAULT NULL,
  `USER_ID` varchar(64) DEFAULT NULL,
  `COURSE_ID` varchar(64) DEFAULT NULL,
  `TRAIN_ID` varchar(64) DEFAULT NULL,
  `TEACHER_ID` varchar(64) DEFAULT NULL,
  `INSEPARABLE` bigint(22) DEFAULT NULL,
  `ACCURACY` bigint(22) DEFAULT NULL,
  `LIVELY` bigint(22) DEFAULT NULL,
  `DEEP_GOING` bigint(22) DEFAULT NULL,
  `CLEAR` bigint(22) DEFAULT NULL,
  `INSIDE_DOPESTER` bigint(22) DEFAULT NULL,
  `PROPERLY` bigint(22) DEFAULT NULL,
  `BODY_LANGUAGE` bigint(22) DEFAULT NULL,
  `APPROPRIATE` bigint(22) DEFAULT NULL,
  `TOTAL_NUM` bigint(22) DEFAULT NULL,
  `ACTIVE` bigint(22) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPR_TEACHING_EVALUA` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipr_train
-- ----------------------------
DROP TABLE IF EXISTS `ipr_train`;
CREATE TABLE `ipr_train` (
  `ID` varchar(64) NOT NULL,
  `PROJECT_ID` varchar(64) DEFAULT NULL,
  `TRAIN_NAME` varchar(200) DEFAULT NULL,
  `TRAIN_CODE` varchar(64) DEFAULT NULL,
  `TRAIN_INTRO` text,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `CASH_START_TIME` datetime DEFAULT NULL,
  `CASH_END_TIME` datetime DEFAULT NULL,
  `STUDY_START_TIME` datetime DEFAULT NULL,
  `STUDY_END_TIME` datetime DEFAULT NULL,
  `SCORE_TIME` datetime DEFAULT NULL,
  `COUNT_CHOOSE` decimal(19,2) DEFAULT NULL,
  `COUNT_CASH` decimal(19,2) DEFAULT NULL,
  `COUNT_PASS` decimal(19,2) DEFAULT NULL,
  `RESULT_SCORE` decimal(19,2) DEFAULT NULL,
  `SATISFY_SCORE` decimal(19,2) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `IS_STOP_APPLY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPR_TRAIN` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipr_train_course
-- ----------------------------
DROP TABLE IF EXISTS `ipr_train_course`;
CREATE TABLE `ipr_train_course` (
  `ID` varchar(64) NOT NULL,
  `TRAIN_ID` varchar(64) DEFAULT NULL,
  `COURSE_ID` varchar(64) DEFAULT NULL,
  `EXPERT_ID` varchar(64) DEFAULT NULL,
  `ADDRESS` text,
  `COUNT_CHOOSE` decimal(19,2) DEFAULT NULL,
  `COUNT_CASH` decimal(19,2) DEFAULT NULL,
  `COUNT_PASS` decimal(19,2) DEFAULT NULL,
  `RESULT_SCORE` decimal(19,2) DEFAULT NULL,
  `SATISFY_SCORE` decimal(19,2) DEFAULT NULL,
  `ATTACHMENT` text,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPR_TRAIN_COURSE` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipr_train_effect_check
-- ----------------------------
DROP TABLE IF EXISTS `ipr_train_effect_check`;
CREATE TABLE `ipr_train_effect_check` (
  `ID` varchar(64) NOT NULL,
  `TITLE` text,
  `REMARK` text,
  `PROJECT_IDS` text,
  `TEACHER_IDS` text,
  `STATUS` varchar(2) DEFAULT NULL,
  `PUBLISH_TIME` datetime DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPR_TRAIN_EFFECT_CHECK` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipr_train_effect_check_result
-- ----------------------------
DROP TABLE IF EXISTS `ipr_train_effect_check_result`;
CREATE TABLE `ipr_train_effect_check_result` (
  `ID` varchar(64) NOT NULL,
  `CHECK_ID` varchar(64) DEFAULT NULL,
  `PROJECT_ID` varchar(64) DEFAULT NULL,
  `TEACHER_ID` varchar(64) DEFAULT NULL,
  `RESULT` text,
  `STATUS` varchar(2) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPR_TRAIN_EFFECT_CHECK_R` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipr_train_register
-- ----------------------------
DROP TABLE IF EXISTS `ipr_train_register`;
CREATE TABLE `ipr_train_register` (
  `ID` varchar(64) NOT NULL,
  `TRAIN_ID` varchar(64) DEFAULT NULL,
  `USER_ID` varchar(64) DEFAULT NULL,
  `DEPT_ID` varchar(64) DEFAULT NULL,
  `STATUS` varchar(16) DEFAULT NULL,
  `AUDIT_USER` varchar(64) DEFAULT NULL,
  `AUDIT_DEPT` varchar(64) DEFAULT NULL,
  `AUDIT_TIME` datetime DEFAULT NULL,
  `AUDIT_CONTENT` text,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPR_TRAIN_REGISTER` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipr_train_requirement_survey
-- ----------------------------
DROP TABLE IF EXISTS `ipr_train_requirement_survey`;
CREATE TABLE `ipr_train_requirement_survey` (
  `ID` varchar(64) NOT NULL,
  `SURVEY_ID` varchar(64) DEFAULT NULL,
  `REGIONS_CODES` longtext,
  `PROJECT_IDS` text,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_IPR_TRAIN_SURVEY` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipr_user_register
-- ----------------------------
DROP TABLE IF EXISTS `ipr_user_register`;
CREATE TABLE `ipr_user_register` (
  `ID` varchar(32) NOT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  `TYPE` varchar(2) DEFAULT NULL,
  `PROC_INST_ID` varchar(128) DEFAULT NULL,
  `REMARK` text,
  `STATUS` varchar(16) DEFAULT NULL,
  `LAST_FLOW_ID` varchar(32) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IPR_USER_REGISTER_PK` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipr_user_register_flow
-- ----------------------------
DROP TABLE IF EXISTS `ipr_user_register_flow`;
CREATE TABLE `ipr_user_register_flow` (
  `ID` varchar(64) NOT NULL,
  `USER_ID` varchar(64) DEFAULT NULL,
  `TASK_NAME` varchar(200) DEFAULT NULL,
  `TASK_ID` varchar(64) DEFAULT NULL,
  `AUDIT_DEPT` varchar(64) DEFAULT NULL,
  `AUDIT_TIME` datetime DEFAULT NULL,
  `AUDIT_USER` varchar(64) DEFAULT NULL,
  `AUDIT_RESULT` text,
  `AUDIT_CONTENT` text,
  `STATUS` varchar(64) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IPR_USER_REGISTER_FLOW_PK` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for trademark_agencyer
-- ----------------------------
DROP TABLE IF EXISTS `trademark_agencyer`;
CREATE TABLE `trademark_agencyer` (
  `id` varchar(64) NOT NULL,
  `code` varchar(16) NOT NULL,
  `agency_name` varchar(255) DEFAULT NULL,
  `creator` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `updated_by` varchar(64) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_deleted` varchar(1) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for trademark_information_base
-- ----------------------------
DROP TABLE IF EXISTS `trademark_information_base`;
CREATE TABLE `trademark_information_base` (
  `ID` varchar(64) NOT NULL,
  `REGISTE_NUMBER` varchar(16) NOT NULL COMMENT '注册号',
  `NAME` varchar(255) DEFAULT NULL COMMENT '商标名称',
  `REGISTE_TYPE` varchar(32) DEFAULT NULL COMMENT '商标类型',
  `CLASSFIY` varchar(16) DEFAULT '' COMMENT '类别',
  `IMAGE` text COMMENT '图',
  `FIRST_PUBLIC_NUMBER` varchar(64) DEFAULT NULL COMMENT '初审公告号',
  `FIRST_PUBLIC_DATE` date DEFAULT NULL COMMENT '初审公日期',
  `REGISTE_PUBLIC_NUMBER` varchar(64) DEFAULT NULL COMMENT '注册公告号',
  `REGISTE_PUBLIC_DATE` date DEFAULT NULL COMMENT '注册公告日期',
  `DES_GOODS` text COMMENT '商标描述',
  `AGENCY` varchar(64) DEFAULT NULL COMMENT '代理机构编码',
  `REGISTE_ADDRESS` varchar(64) DEFAULT NULL COMMENT '注册地址',
  `PROVICE` varchar(64) DEFAULT NULL COMMENT '省级编码',
  `CITY` varchar(64) DEFAULT NULL COMMENT '市级编码',
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `id_index` (`ID`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for trademark_register_infomation
-- ----------------------------
DROP TABLE IF EXISTS `trademark_register_infomation`;
CREATE TABLE `trademark_register_infomation` (
  `ID` varchar(64) NOT NULL DEFAULT '' COMMENT 'id',
  `REGISTE_NUMBER` varchar(16) DEFAULT NULL COMMENT '注册号',
  `CLASSFIY` varchar(255) DEFAULT NULL COMMENT '类别',
  `CHINESE_NAME` varchar(255) DEFAULT NULL COMMENT '中文名称',
  `FOREIGN_NAME` varchar(255) DEFAULT NULL COMMENT '外文名称',
  `CHINESE_ADDRESS` varchar(255) DEFAULT NULL COMMENT '注册人中文地址',
  `FOREIGN_ADDRESS` varchar(255) DEFAULT NULL COMMENT '注册人外文地址',
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for trademark_service_info
-- ----------------------------
DROP TABLE IF EXISTS `trademark_service_info`;
CREATE TABLE `trademark_service_info` (
  `ID` varchar(64) NOT NULL,
  `REGISTE_NUMBER` varchar(16) DEFAULT NULL,
  `CLASSFIY` varchar(16) DEFAULT NULL,
  `CLASSFIY_LIKE` varchar(64) DEFAULT NULL,
  `ORDER` varchar(16) DEFAULT NULL,
  `PRODUCT_NAME` varchar(255) DEFAULT NULL COMMENT '商品服务名称',
  `STATES` varchar(255) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(64) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_account
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account` (
  `ID` varchar(32) NOT NULL,
  `USER_NAME` varchar(32) DEFAULT NULL,
  `PASSWORD` varchar(64) DEFAULT NULL,
  `STATE` varchar(16) DEFAULT NULL,
  `CREATOR` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_USER_ACCOUNT` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_login_attempt
-- ----------------------------
DROP TABLE IF EXISTS `user_login_attempt`;
CREATE TABLE `user_login_attempt` (
  `ACCOUNT_ID` varchar(32) NOT NULL,
  `LOGIN_PERIOD_START_TIME` datetime DEFAULT NULL,
  `LAST_LOGIN_ATTEMPT_TIME` datetime DEFAULT NULL,
  `LOGIN_ATTEMPT_COUNT` bigint(22) DEFAULT NULL,
  PRIMARY KEY (`ACCOUNT_ID`),
  UNIQUE KEY `SYS_C0062991` (`ACCOUNT_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `user_login_log`;
CREATE TABLE `user_login_log` (
  `ID` varchar(32) NOT NULL,
  `ACCOUNT_ID` varchar(32) DEFAULT NULL,
  `LOGIN_TIME` datetime DEFAULT NULL,
  `LOGOUT_TIME` datetime DEFAULT NULL,
  `SESSION_ID` varchar(100) DEFAULT NULL,
  `IP_ADDR` varchar(64) DEFAULT NULL,
  `USER_AGENT` varchar(64) DEFAULT NULL,
  `CREATOR` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_USER_LOGIN_LOG_ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `user_oper_log`;
CREATE TABLE `user_oper_log` (
  `ID` varchar(32) NOT NULL,
  `TEACHER_ID` varchar(32) DEFAULT NULL,
  `OPER_TIME` datetime DEFAULT NULL,
  `OPER_MODULE` varchar(32) DEFAULT NULL,
  `OPER_FUNCTION` varchar(32) DEFAULT NULL,
  `OPER_CONTENT` text,
  `CREATOR` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATEDBY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `VERSION` bigint(22) DEFAULT NULL,
  `IS_DELETED` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wechat_menu
-- ----------------------------
DROP TABLE IF EXISTS `wechat_menu`;
CREATE TABLE `wechat_menu` (
  `ID` varchar(32) NOT NULL COMMENT '涓婚敭',
  `MENU_KEY` varchar(128) DEFAULT NULL COMMENT '鑿滃崟MENU_KEY锛屽綋MenuType鍊间负CLICK鏃剁敤浜庡尯鍒彍鍗?',
  `PARENT_ID` varchar(32) DEFAULT NULL COMMENT '鐖惰妭鐐笽D',
  `NAME` varchar(60) DEFAULT NULL COMMENT '鑿滃崟涓婃樉绀虹殑鏂囧瓧',
  `TYPE` varchar(32) DEFAULT NULL COMMENT '鑿滃崟绫诲埆',
  `URL` varchar(1024) DEFAULT NULL COMMENT '鑿滃崟璺宠浆鐨刄RL锛屽綋MenuType鍊间负VIEW鏃剁敤',
  `MEDIA_ID` varchar(32) DEFAULT NULL COMMENT '鑿滃崟鏄剧ず鐨勬案涔呯礌鏉?',
  `SORT_NO` decimal(8,0) DEFAULT NULL COMMENT '鎺掑簭鍙?',
  `CREATOR` varchar(32) DEFAULT NULL COMMENT '鍒涘缓浜?',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '鍒涘缓鏃堕棿',
  `UPDATEDBY` varchar(32) DEFAULT NULL COMMENT '鏇存柊浜?',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '鏇存柊鏃堕棿',
  `IS_DELETED` char(1) DEFAULT NULL COMMENT '鏄惁鍒犻櫎',
  `VERSION` decimal(8,0) DEFAULT NULL COMMENT '鐗堟湰鍙?',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- View structure for userview
-- ----------------------------
DROP VIEW IF EXISTS `userview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`liuchao`@`%` SQL SECURITY DEFINER VIEW `userview` AS select `iu`.`ID` AS `ID`,`iu`.`USER_NAME` AS `USER_NAME`,`iu`.`PASSWORD` AS `PASSWORD`,`iu`.`ROLE_CODE` AS `ROLE_CODE`,`iu`.`PAPERWORK_NO` AS `PAPERWORK_NO`,`iu`.`REAL_NAME` AS `REAL_NAME`,`iud`.`DEPT_ID` AS `DEPT_ID`,`ide`.`DEPT_NAME` AS `DEPT_NAME`,`ide`.`DEPT_TYPE` AS `DEPT_TYPE`,`ide`.`PARENT_ID` AS `PARENT_ID`,`ide`.`REGIONS_CODE` AS `REGIONS_CODE`,`iu`.`AVATAR` AS `AVATAR`,`iu`.`PASSWORD_PLAIN` AS `PASSWORD_PLAIN`,`iu`.`STATUS` AS `STATUS`,`ir`.`REGIONS_LEVEL` AS `dept_Level`,`iu`.`TYPE` AS `Type`,`iu`.`WECHAT_ID` AS `WECHAT_ID`,`iu`.`WECHAT_NICKNAME` AS `WECHAT_NICKNAME`,`iu`.`MOBILE_PHONE` AS `phone` from (((`ipanther_user` `iu` join `ipanther_user_dept` `iud` on((`iu`.`ID` = `iud`.`USER_ID`))) join `ipanther_department` `ide` on((`ide`.`ID` = `iud`.`DEPT_ID`))) join `ipanther_admin_regions` `ir` on((`ir`.`REGIONS_CODE` = `ide`.`REGIONS_CODE`))) where ((`iu`.`IS_DELETED` = 'N') and (`ide`.`IS_DELETED` = 'N') and (`iud`.`IS_DELETED` = 'N') and (`ir`.`IS_DELETED` = 'N')) group by `iu`.`ID` ;

-- ----------------------------
-- Procedure structure for ipic
-- ----------------------------
DROP PROCEDURE IF EXISTS `ipic`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ipic`(in companyid varchar(500))
begin 
set @companyId=companyid;
if(companyId='10E82E49016D45A3E050A8C003010417') then 

drop table if  exists ipanther_ipiccall;
create table  ipanther_ipiccall


SELECT date_format(create_time,'%Y') as years, ORG_DEP_ID as 公司, 0 as 转让,count(*) as 许可,0 as 质押,0 as 入股 FROM ipbox.ipanther_patent_applications where  use_type='2' and IS_DELETED='N' group by date_format(create_time,'%Y')  
union
SELECT date_format(create_time,'%Y') as years,ORG_DEP_ID as 公司, count(*) as 转让,0 as 许可,0 as 质押,0 as 入股 FROM ipbox.ipanther_patent_applications where  use_type='1' and IS_DELETED='N'  group by date_format(create_time,'%Y')
union
SELECT date_format(create_time,'%Y') as years,ORG_DEP_ID as 公司, 0 as 转让,0 as 许可,count(*) as 质押,0 as 入股 FROM ipbox.ipanther_patent_applications where  use_type='3' and IS_DELETED='N'  group by date_format(create_time,'%Y')
union
SELECT date_format(create_time,'%Y') as years,ORG_DEP_ID as 公司, 0 as 转让,0 as 许可,0 as 质押,count(*) as 入股 FROM ipbox.ipanther_patent_applications where  use_type='4' and IS_DELETED='N'  group by date_format(create_time,'%Y');

select years,sum(转让) as transfer,sum(许可) as permission,sum(质押) as pledge,sum(入股) shares from ipanther_ipiccall where  years between 2017 AND 2079   group by years order by years ;

else
set @companyId=companyid;
drop table if  exists ipanther_ipiccall;
create table  ipanther_ipiccall


SELECT date_format(create_time,'%Y') as years, ORG_DEP_ID as 公司, 0 as 转让,count(*) as 许可,0 as 质押,0 as 入股 FROM ipbox.ipanther_patent_applications where ORG_DEP_ID LIKE @companyId and use_type='2' and IS_DELETED='N' group by date_format(create_time,'%Y')  
union
SELECT date_format(create_time,'%Y') as years,ORG_DEP_ID as 公司, count(*) as 转让,0 as 许可,0 as 质押,0 as 入股 FROM ipbox.ipanther_patent_applications where ORG_DEP_ID LIKE@companyId and use_type='1' and IS_DELETED='N'  group by date_format(create_time,'%Y')
union
SELECT date_format(create_time,'%Y') as years,ORG_DEP_ID as 公司, 0 as 转让,0 as 许可,count(*) as 质押,0 as 入股 FROM ipbox.ipanther_patent_applications where ORG_DEP_ID LIKE @companyId and use_type='3' and IS_DELETED='N'  group by date_format(create_time,'%Y')
union
SELECT date_format(create_time,'%Y') as years,ORG_DEP_ID as 公司, 0 as 转让,0 as 许可,0 as 质押,count(*) as 入股 FROM ipbox.ipanther_patent_applications where ORG_DEP_ID LIKE@companyId and use_type='4' and IS_DELETED='N'  group by date_format(create_time,'%Y');

select years,sum(转让) as transfer,sum(许可) as permission,sum(质押) as pledge,sum(入股) shares from ipanther_ipiccall where  years between 2017 AND 2079   group by years order by years ;

end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for patentCost
-- ----------------------------
DROP PROCEDURE IF EXISTS `patentCost`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `patentCost`(in companyID varchar(150))
begin 
set @companyID=companyID;
drop table if   exists ipanther_call_cost;

create table  ipanther_call_cost
select COMPANY_ID, date_format(FEE_PAYABLE_DATE,'%Y') as years ,sum(FEE_PAYABLE) as agency,0 as officialfees,0 as annualfee,0 as Otherfee  from ipbox.ipanther_patent_cost where COMPANY_ID=@companyID and  COST_TYPE='0' and IS_DELETED='N' group by date_format(FEE_PAYABLE_DATE,'%Y') 
union 
select COMPANY_ID,  date_format(FEE_PAYABLE_DATE,'%Y') as years ,0 as agency,sum(FEE_PAYABLE) as officialfees,0 as annualfee,0 as Otherfee  from ipbox.ipanther_patent_cost where COMPANY_ID=@companyID and  COST_TYPE='1' and IS_DELETED='N' group by date_format(FEE_PAYABLE_DATE,'%Y') 
union 
select COMPANY_ID,  date_format(FEE_PAYABLE_DATE,'%Y') as years ,0 as agency,0 as officialfees,sum(FEE_PAYABLE) as annualfee,0 as Otherfee  from ipbox.ipanther_patent_cost where  COMPANY_ID=@companyID and COST_TYPE='2' and IS_DELETED='N' group by date_format(FEE_PAYABLE_DATE,'%Y')
union
select COMPANY_ID,  date_format(FEE_PAYABLE_DATE,'%Y') as years ,0 as agency,0 as officialfees,0 as annualfee,sum(FEE_PAYABLE)  as Otherfee   from ipbox.ipanther_patent_cost where COMPANY_ID=@companyID and   COST_TYPE='3' and IS_DELETED='N' group by date_format(FEE_PAYABLE_DATE,'%Y');
SELECT COMPANY_ID,years,sum(agency ) as agency ,sum(officialfees ) as officialfees  ,sum(annualfee) as annualfee,sum(Otherfee) as Otherfee from ipanther_call_cost where  years between '2016' AND '2020' group by years order by years  ;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for patentType
-- ----------------------------
DROP PROCEDURE IF EXISTS `patentType`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `patentType`(in companyID varchar(50),in str varchar(20))
begin 
set @companyID=companyID;
set @str=str;
if(str='index') then 
set @BYtype ='2019';
set @BYtypeEnd ='2018';
else
set @BYtype =Year(CurDate());
set @BYtypeEnd =Year(CurDate())-4;
end if;
drop table if   exists ipanther_patent_type;
create table  ipanther_patent_type
select  date_format(APP_DATE,'%Y') as years ,count(*) as invent,0 as appearance,0 as utility  from ipbox.ipanther_patent where  PATENT_TYPE='1' and COMPANY_ID=@companyID  and IS_DELETED='N' group by date_format(APP_DATE,'%Y') 
union 
select  date_format(APP_DATE,'%Y') as years ,0 as invent,count(*) as appearance,0 as utility  from ipbox.ipanther_patent where   PATENT_TYPE='2' and COMPANY_ID=@companyID  and IS_DELETED='N' group by date_format(APP_DATE,'%Y') 
union 
select  date_format(APP_DATE,'%Y') as years ,0 as invent,0 as appearance,count(*) as utility  from ipbox.ipanther_patent where  PATENT_TYPE='3'and COMPANY_ID=@companyID  and IS_DELETED='N' group by date_format(APP_DATE,'%Y');
SELECT years,sum(invent ) as invent ,sum(appearance ) as appearance  ,sum(utility) as utility from ipanther_patent_type where  years between @BYtypeEnd AND @BYtype   group by years order by years  ;


end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for patentTypekids
-- ----------------------------
DROP PROCEDURE IF EXISTS `patentTypekids`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `patentTypekids`(in companyID varchar(50),in str varchar(20))
begin 
set @companyID=companyID;
set @str=str;
if(str='index') then 
set @BYtype ='2019';
set @BYtypeEnd ='2018';
else
set @BYtype =Year(CurDate());
set @BYtypeEnd =Year(CurDate())-4;
end if;
drop table if   exists ipanther_patent_type;
create table  ipanther_patent_type
select  date_format(APP_DATE,'%Y') as years ,count(*) as invent,0 as appearance,0 as utility  from ipbox.ipanther_patent where  PATENT_TYPE='1' and CREATOR=@companyID  and IS_DELETED='N' group by date_format(APP_DATE,'%Y') 
union 
select  date_format(APP_DATE,'%Y') as years ,0 as invent,count(*) as appearance,0 as utility  from ipbox.ipanther_patent where   PATENT_TYPE='2' and CREATOR=@companyID  and IS_DELETED='N' group by date_format(APP_DATE,'%Y') 
union 
select  date_format(APP_DATE,'%Y') as years ,0 as invent,0 as appearance,count(*) as utility  from ipbox.ipanther_patent where  PATENT_TYPE='3'and CREATOR=@companyID  and IS_DELETED='N' group by date_format(APP_DATE,'%Y');
SELECT years,sum(invent ) as invent ,sum(appearance ) as appearance  ,sum(utility) as utility from ipanther_patent_type where  years between @BYtypeEnd AND @BYtype   group by years order by years  ;


end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for test_proc
-- ----------------------------
DROP PROCEDURE IF EXISTS `test_proc`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `test_proc`(in a_id varchar(50) , out a_goods_id varchar(100))
BEGIN  
	SELECT  a.PATENT_NAME  INTO  a_goods_id  
	FROM  ipanther_patent a  
	WHERE  a.ID=a_id ;  
END
;;
DELIMITER ;
