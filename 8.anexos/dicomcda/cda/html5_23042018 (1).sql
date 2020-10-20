/*
 Navicat MySQL Data Transfer

 Source Server         : local
 Source Server Version : 50633
 Source Host           : localhost
 Source Database       : html5_bcbsu

 Target Server Version : 50633
 File Encoding         : utf-8

 Date: 04/23/2018 09:47:01 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `articlehtml`
-- ----------------------------
DROP TABLE IF EXISTS `articlehtml`;
CREATE TABLE `articlehtml` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(64) DEFAULT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `xhtml5` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `autenticado`
-- ----------------------------
DROP TABLE IF EXISTS `autenticado`;
CREATE TABLE `autenticado` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `eiud` varchar(64) DEFAULT NULL,
  `eaccnum` varchar(16) DEFAULT NULL,
  `eaccoid` varchar(64) DEFAULT NULL,
  `urlparams` longtext,
  `activo` varchar(2) DEFAULT NULL,
  `pnombre` varchar(255) DEFAULT NULL,
  `pid` varchar(16) DEFAULT NULL,
  `poid` varchar(64) DEFAULT NULL,
  `psexo` varchar(1) DEFAULT NULL,
  `pnacimiento` varchar(8) DEFAULT NULL,
  `pbarrio` varchar(64) DEFAULT NULL,
  `pciudad` varchar(64) DEFAULT NULL,
  `pregion` varchar(64) DEFAULT NULL,
  `ppais` varchar(3) DEFAULT NULL,
  `efecha` datetime(6) DEFAULT NULL,
  `eid` varchar(16) DEFAULT NULL,
  `erealizadoroid` varchar(64) DEFAULT NULL,
  `informetitulo` varchar(255) DEFAULT NULL,
  `informeuid` varchar(64) DEFAULT NULL,
  `custodianoid` varchar(64) DEFAULT NULL,
  `valoracion` varchar(64) DEFAULT NULL,
  `solicituduid` varchar(64) DEFAULT NULL,
  `autenticado_id` bigint(20) DEFAULT NULL,
  `estudio_id` bigint(20) DEFAULT NULL,
  `plantilla_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `autenticado_autenticado_id_81fdc9d4_fk_autenticado_id` (`autenticado_id`),
  KEY `autenticado_11587e5e` (`estudio_id`),
  KEY `autenticado_e3c19d0a` (`plantilla_id`),
  CONSTRAINT `autenticado_autenticado_id_81fdc9d4_fk_autenticado_id` FOREIGN KEY (`autenticado_id`) REFERENCES `autenticado` (`id`),
  CONSTRAINT `autenticado_estudio_id_8725ef62_fk_estudio_id` FOREIGN KEY (`estudio_id`) REFERENCES `estudio` (`id`),
  CONSTRAINT `autenticado_plantilla_id_86b8af82_fk_plantilla_id` FOREIGN KEY (`plantilla_id`) REFERENCES `plantilla` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `bodyscript`
-- ----------------------------
DROP TABLE IF EXISTS `bodyscript`;
CREATE TABLE `bodyscript` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordinal` int(11) DEFAULT NULL,
  `plantilla_id` bigint(20) DEFAULT NULL,
  `script_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bodyscript_e3c19d0a` (`plantilla_id`),
  KEY `bodyscript_a19ff0c0` (`script_id`),
  CONSTRAINT `bodyscript_plantilla_id_c738f49e_fk_plantilla_id` FOREIGN KEY (`plantilla_id`) REFERENCES `plantilla` (`id`),
  CONSTRAINT `bodyscript_script_id_5b678cc8_fk_scriptelement_id` FOREIGN KEY (`script_id`) REFERENCES `scriptelement` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `cell`
-- ----------------------------
DROP TABLE IF EXISTS `cell`;
CREATE TABLE `cell` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `code1_id` bigint(20) DEFAULT NULL,
  `col_id` bigint(20) DEFAULT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  `row_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cell_2b2ebf0e` (`code1_id`),
  KEY `cell_ec8de331` (`col_id`),
  KEY `cell_abec2aca` (`label_id`),
  KEY `cell_187925ee` (`row_id`),
  CONSTRAINT `cell_code1_id_ba474da0_fk_code1_id` FOREIGN KEY (`code1_id`) REFERENCES `code1` (`id`),
  CONSTRAINT `cell_col_id_e0589d4f_fk_col_id` FOREIGN KEY (`col_id`) REFERENCES `col` (`id`),
  CONSTRAINT `cell_label_id_8912274e_fk_label_id` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`),
  CONSTRAINT `cell_row_id_e9aa7335_fk_row_id` FOREIGN KEY (`row_id`) REFERENCES `row` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `code`
-- ----------------------------
DROP TABLE IF EXISTS `code`;
CREATE TABLE `code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `category` varchar(8) DEFAULT NULL,
  `codesystem_id` bigint(20) DEFAULT NULL,
  `translation_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `code_1a245106` (`codesystem_id`),
  KEY `code_f43de212` (`translation_id`),
  CONSTRAINT `code_codesystem_id_b62cc491_fk_codesystem_id` FOREIGN KEY (`codesystem_id`) REFERENCES `codesystem` (`id`),
  CONSTRAINT `code_translation_id_969d6a72_fk_code_id` FOREIGN KEY (`translation_id`) REFERENCES `code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `code1`
-- ----------------------------
DROP TABLE IF EXISTS `code1`;
CREATE TABLE `code1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(8) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `code_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `code1_code_id_2d04e3b9_fk_code_id` (`code_id`),
  CONSTRAINT `code1_code_id_2d04e3b9_fk_code_id` FOREIGN KEY (`code_id`) REFERENCES `code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `code2`
-- ----------------------------
DROP TABLE IF EXISTS `code2`;
CREATE TABLE `code2` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code_id` bigint(20) DEFAULT NULL,
  `code1_id` bigint(20) DEFAULT NULL,
  `rel_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `code2_code_id_00c871b2_fk_code_id` (`code_id`),
  KEY `code2_code1_id_67042c8a_fk_code1_id` (`code1_id`),
  KEY `code2_rel_id_e669e33b_fk_code_id` (`rel_id`),
  CONSTRAINT `code2_code1_id_67042c8a_fk_code1_id` FOREIGN KEY (`code1_id`) REFERENCES `code1` (`id`),
  CONSTRAINT `code2_code_id_00c871b2_fk_code_id` FOREIGN KEY (`code_id`) REFERENCES `code` (`id`),
  CONSTRAINT `code2_rel_id_e669e33b_fk_code_id` FOREIGN KEY (`rel_id`) REFERENCES `code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `code3`
-- ----------------------------
DROP TABLE IF EXISTS `code3`;
CREATE TABLE `code3` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code_id` bigint(20) DEFAULT NULL,
  `code2_id` bigint(20) DEFAULT NULL,
  `rel_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `code3_code_id_6be2c199_fk_code_id` (`code_id`),
  KEY `code3_code2_id_e51b8cec_fk_code2_id` (`code2_id`),
  KEY `code3_rel_id_26b1a69e_fk_code_id` (`rel_id`),
  CONSTRAINT `code3_code2_id_e51b8cec_fk_code2_id` FOREIGN KEY (`code2_id`) REFERENCES `code2` (`id`),
  CONSTRAINT `code3_code_id_6be2c199_fk_code_id` FOREIGN KEY (`code_id`) REFERENCES `code` (`id`),
  CONSTRAINT `code3_rel_id_26b1a69e_fk_code_id` FOREIGN KEY (`rel_id`) REFERENCES `code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `codesystem`
-- ----------------------------
DROP TABLE IF EXISTS `codesystem`;
CREATE TABLE `codesystem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `oid` varchar(64) DEFAULT NULL,
  `version` varchar(16) DEFAULT NULL,
  `shortname` varchar(16) DEFAULT NULL,
  `hl7v2` varchar(16) DEFAULT NULL,
  `dcm` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codesystem_oid_0c6920fe_uniq` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `col`
-- ----------------------------
DROP TABLE IF EXISTS `col`;
CREATE TABLE `col` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `code1_id` bigint(20) DEFAULT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  `table_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `col_code1_id_9bbe4dd4_fk_code1_id` (`code1_id`),
  KEY `col_abec2aca` (`label_id`),
  KEY `col_a15b1ede` (`table_id`),
  CONSTRAINT `col_code1_id_9bbe4dd4_fk_code1_id` FOREIGN KEY (`code1_id`) REFERENCES `code1` (`id`),
  CONSTRAINT `col_label_id_372e525e_fk_label_id` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`),
  CONSTRAINT `col_table_id_26fcee52_fk_table_id` FOREIGN KEY (`table_id`) REFERENCES `table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=709 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `estudio`
-- ----------------------------
DROP TABLE IF EXISTS `estudio`;
CREATE TABLE `estudio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `modalidad` varchar(5) DEFAULT NULL,
  `code_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estudio_code_id_80e2a892_fk_code_id` (`code_id`),
  CONSTRAINT `estudio_code_id_80e2a892_fk_code_id` FOREIGN KEY (`code_id`) REFERENCES `code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `firma`
-- ----------------------------
DROP TABLE IF EXISTS `firma`;
CREATE TABLE `firma` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `md5` varchar(45) DEFAULT NULL,
  `fecha` datetime(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `iname` varchar(255) DEFAULT NULL,
  `ioid` varchar(64) DEFAULT NULL,
  `informe_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `firma_94e42bb5` (`informe_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `firma_iforme_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `firma_informe_id_9d2c6a72_fk_submit_id` FOREIGN KEY (`informe_id`) REFERENCES `submit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `footer`
-- ----------------------------
DROP TABLE IF EXISTS `footer`;
CREATE TABLE `footer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `html` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `header`
-- ----------------------------
DROP TABLE IF EXISTS `header`;
CREATE TABLE `header` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `html` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `headscript`
-- ----------------------------
DROP TABLE IF EXISTS `headscript`;
CREATE TABLE `headscript` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordinal` int(11) DEFAULT NULL,
  `plantilla_id` bigint(20) DEFAULT NULL,
  `script_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `headscript_e3c19d0a` (`plantilla_id`),
  KEY `headscript_a19ff0c0` (`script_id`),
  CONSTRAINT `headscript_plantilla_id_2a4c5aea_fk_plantilla_id` FOREIGN KEY (`plantilla_id`) REFERENCES `plantilla` (`id`),
  CONSTRAINT `headscript_script_id_bec53765_fk_scriptelement_id` FOREIGN KEY (`script_id`) REFERENCES `scriptelement` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `html5dicom_alternate`
-- ----------------------------
DROP TABLE IF EXISTS `html5dicom_alternate`;
CREATE TABLE `html5dicom_alternate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `html5dicom_alternate_84566833` (`role_id`),
  KEY `html5dicom_alternate_e8701ad4` (`user_id`),
  CONSTRAINT `html5dicom_alternate_role_id_6c3fd307_fk_html5dicom_role_id` FOREIGN KEY (`role_id`) REFERENCES `html5dicom_role` (`id`),
  CONSTRAINT `html5dicom_alternate_user_id_b585d09d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `html5dicom_institution`
-- ----------------------------
DROP TABLE IF EXISTS `html5dicom_institution`;
CREATE TABLE `html5dicom_institution` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  `name` varchar(64) NOT NULL,
  `short_name` varchar(64) NOT NULL,
  `oid` varchar(64) DEFAULT NULL,
  `logo_data` longblob,
  `organization_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `html5dicom_institution_short_name_5d468095_uniq` (`short_name`,`oid`,`organization_id`),
  KEY `html5dicom_institution_26b2345e` (`organization_id`),
  CONSTRAINT `html5dico_organization_id_5097919f_fk_html5dicom_organization_id` FOREIGN KEY (`organization_id`) REFERENCES `html5dicom_organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `html5dicom_organization`
-- ----------------------------
DROP TABLE IF EXISTS `html5dicom_organization`;
CREATE TABLE `html5dicom_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  `name` varchar(64) NOT NULL,
  `short_name` varchar(64) NOT NULL,
  `oid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `html5dicom_organization_short_name_760c78f2_uniq` (`short_name`,`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `html5dicom_role`
-- ----------------------------
DROP TABLE IF EXISTS `html5dicom_role`;
CREATE TABLE `html5dicom_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  `name` varchar(3) NOT NULL,
  `default` tinyint(1) NOT NULL,
  `max_rows` int(11) NOT NULL,
  `parameter_rest` varchar(255) DEFAULT NULL,
  `institution_id` bigint(20) DEFAULT NULL,
  `service_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `html5dicom_role_name_2932cbff_uniq` (`name`,`user_id`,`service_id`),
  UNIQUE KEY `html5dicom_role_name_e7458a3a_uniq` (`name`,`user_id`,`institution_id`),
  KEY `html5dicom__institution_id_fef86345_fk_html5dicom_institution_id` (`institution_id`),
  KEY `html5dicom_role_b0dc1e29` (`service_id`),
  KEY `html5dicom_role_e8701ad4` (`user_id`),
  CONSTRAINT `html5dicom__institution_id_fef86345_fk_html5dicom_institution_id` FOREIGN KEY (`institution_id`) REFERENCES `html5dicom_institution` (`id`),
  CONSTRAINT `html5dicom_role_service_id_32bbdb08_fk_html5dicom_service_id` FOREIGN KEY (`service_id`) REFERENCES `html5dicom_service` (`id`),
  CONSTRAINT `html5dicom_role_user_id_bb7d1494_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `html5dicom_service`
-- ----------------------------
DROP TABLE IF EXISTS `html5dicom_service`;
CREATE TABLE `html5dicom_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  `name` varchar(64) NOT NULL,
  `oid` varchar(64) DEFAULT NULL,
  `institution_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `html5dicom_service_name_77ac2137_uniq` (`name`,`oid`,`institution_id`),
  KEY `html5dicom__institution_id_78136b90_fk_html5dicom_institution_id` (`institution_id`),
  CONSTRAINT `html5dicom__institution_id_78136b90_fk_html5dicom_institution_id` FOREIGN KEY (`institution_id`) REFERENCES `html5dicom_institution` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `html5dicom_setting`
-- ----------------------------
DROP TABLE IF EXISTS `html5dicom_setting`;
CREATE TABLE `html5dicom_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  `key` varchar(20) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `html5dicom_userchangepassword`
-- ----------------------------
DROP TABLE IF EXISTS `html5dicom_userchangepassword`;
CREATE TABLE `html5dicom_userchangepassword` (
  `user_id` int(11) NOT NULL,
  `changepassword` tinyint(1) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `html5dicom_userchangepassword_user_id_6b01726d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `html5dicom_userviewersettings`
-- ----------------------------
DROP TABLE IF EXISTS `html5dicom_userviewersettings`;
CREATE TABLE `html5dicom_userviewersettings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  `viewer` varchar(3) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `html5dicom_userviewersettings_user_id_444197ba_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `inputattribute`
-- ----------------------------
DROP TABLE IF EXISTS `inputattribute`;
CREATE TABLE `inputattribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inputattribute_abec2aca` (`label_id`),
  CONSTRAINT `inputattribute_label_id_d9de6fd6_fk_label_id` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `label`
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(9) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `xsitype` varchar(4) NOT NULL,
  `code1_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `label_code1_id_cf6e60a9_fk_code1_id` (`code1_id`),
  CONSTRAINT `label_code1_id_cf6e60a9_fk_code1_id` FOREIGN KEY (`code1_id`) REFERENCES `code1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `observation`
-- ----------------------------
DROP TABLE IF EXISTS `observation`;
CREATE TABLE `observation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code1_id` bigint(20) DEFAULT NULL,
  `col_id` bigint(20) DEFAULT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  `option_id` bigint(20) DEFAULT NULL,
  `row_id` bigint(20) DEFAULT NULL,
  `sec_id` bigint(20) DEFAULT NULL,
  `subsec_id` bigint(20) DEFAULT NULL,
  `subsubsec_id` bigint(20) DEFAULT NULL,
  `table_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `observation_code1_id_53a1b914_fk_code1_id` (`code1_id`),
  KEY `observation_col_id_8de22b5e_fk_col_id` (`col_id`),
  KEY `observation_label_id_ddedc766_fk_label_id` (`label_id`),
  KEY `observation_28df3725` (`option_id`),
  KEY `observation_187925ee` (`row_id`),
  KEY `observation_050883d4` (`sec_id`),
  KEY `observation_697da8c3` (`subsec_id`),
  KEY `observation_d2d2241a` (`subsubsec_id`),
  KEY `observation_a15b1ede` (`table_id`),
  CONSTRAINT `observation_code1_id_53a1b914_fk_code1_id` FOREIGN KEY (`code1_id`) REFERENCES `code1` (`id`),
  CONSTRAINT `observation_col_id_8de22b5e_fk_col_id` FOREIGN KEY (`col_id`) REFERENCES `col` (`id`),
  CONSTRAINT `observation_label_id_ddedc766_fk_label_id` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`),
  CONSTRAINT `observation_option_id_c7f7fb6e_fk_option_id` FOREIGN KEY (`option_id`) REFERENCES `option` (`id`),
  CONSTRAINT `observation_row_id_cdb9163d_fk_row_id` FOREIGN KEY (`row_id`) REFERENCES `row` (`id`),
  CONSTRAINT `observation_sec_id_d3f65548_fk_sec_id` FOREIGN KEY (`sec_id`) REFERENCES `sec` (`id`),
  CONSTRAINT `observation_subsec_id_68dea7b5_fk_subsec_id` FOREIGN KEY (`subsec_id`) REFERENCES `subsec` (`id`),
  CONSTRAINT `observation_subsubsec_id_4c22db02_fk_subsubsec_id` FOREIGN KEY (`subsubsec_id`) REFERENCES `subsubsec` (`id`),
  CONSTRAINT `observation_table_id_f8cfe109_fk_table_id` FOREIGN KEY (`table_id`) REFERENCES `table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `option`
-- ----------------------------
DROP TABLE IF EXISTS `option`;
CREATE TABLE `option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` smallint(6) DEFAULT NULL,
  `selected` varchar(20) NOT NULL,
  `disabled` varchar(20) NOT NULL,
  `interpretationcode` varchar(2) NOT NULL,
  `code1_id` bigint(20) DEFAULT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  `rel_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `option_code1_id_24e314c2_fk_code1_id` (`code1_id`),
  KEY `option_label_id_19313ae2_fk_label_id` (`label_id`),
  KEY `option_rel_id_f08603f7_fk_code1_id` (`rel_id`),
  CONSTRAINT `option_code1_id_24e314c2_fk_code1_id` FOREIGN KEY (`code1_id`) REFERENCES `code1` (`id`),
  CONSTRAINT `option_label_id_19313ae2_fk_label_id` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`),
  CONSTRAINT `option_rel_id_f08603f7_fk_code1_id` FOREIGN KEY (`rel_id`) REFERENCES `code1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `plantilla`
-- ----------------------------
DROP TABLE IF EXISTS `plantilla`;
CREATE TABLE `plantilla` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `publisher` varchar(64) DEFAULT NULL,
  `rights` varchar(64) DEFAULT NULL,
  `licence` varchar(64) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `creator` varchar(64) DEFAULT NULL,
  `language` varchar(16) DEFAULT NULL,
  `title2` varchar(64) DEFAULT NULL,
  `identifier` varchar(64) DEFAULT NULL,
  `cantidadfirmas` int(11) DEFAULT NULL,
  `urlparams` longtext,
  `estudio_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plantilla_11587e5e` (`estudio_id`),
  CONSTRAINT `plantilla_estudio_id_03149749_fk_estudio_id` FOREIGN KEY (`estudio_id`) REFERENCES `estudio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `plantillafooter`
-- ----------------------------
DROP TABLE IF EXISTS `plantillafooter`;
CREATE TABLE `plantillafooter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordinal` int(11) DEFAULT NULL,
  `footer_id` bigint(20) DEFAULT NULL,
  `plantilla_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plantillafooter_footer_id_ab1080d9_fk_footer_id` (`footer_id`),
  KEY `plantillafooter_e3c19d0a` (`plantilla_id`),
  CONSTRAINT `plantillafooter_footer_id_ab1080d9_fk_footer_id` FOREIGN KEY (`footer_id`) REFERENCES `footer` (`id`),
  CONSTRAINT `plantillafooter_plantilla_id_cabe360c_fk_plantilla_id` FOREIGN KEY (`plantilla_id`) REFERENCES `plantilla` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `plantillagruposldap`
-- ----------------------------
DROP TABLE IF EXISTS `plantillagruposldap`;
CREATE TABLE `plantillagruposldap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gdn` varchar(255) DEFAULT NULL,
  `plantilla_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plantillagruposldap_plantilla_id_5705b7c9_fk_plantilla_id` (`plantilla_id`),
  CONSTRAINT `plantillagruposldap_plantilla_id_5705b7c9_fk_plantilla_id` FOREIGN KEY (`plantilla_id`) REFERENCES `plantilla` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `plantillaheader`
-- ----------------------------
DROP TABLE IF EXISTS `plantillaheader`;
CREATE TABLE `plantillaheader` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordinal` int(11) DEFAULT NULL,
  `header_id` bigint(20) DEFAULT NULL,
  `plantilla_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plantillaheader_header_id_1a12c37b_fk_header_id` (`header_id`),
  KEY `plantillaheader_e3c19d0a` (`plantilla_id`),
  CONSTRAINT `plantillaheader_header_id_1a12c37b_fk_header_id` FOREIGN KEY (`header_id`) REFERENCES `header` (`id`),
  CONSTRAINT `plantillaheader_plantilla_id_7244a761_fk_plantilla_id` FOREIGN KEY (`plantilla_id`) REFERENCES `plantilla` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `proxyrest_sessionrest`
-- ----------------------------
DROP TABLE IF EXISTS `proxyrest_sessionrest`;
CREATE TABLE `proxyrest_sessionrest` (
  `sessionid` varchar(32) NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `expiration_date` datetime(6) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `proxyrest_sessionrest_role_id_f2426d10_fk_html5dicom_role_id` (`role_id`),
  CONSTRAINT `proxyrest_sessionrest_role_id_f2426d10_fk_html5dicom_role_id` FOREIGN KEY (`role_id`) REFERENCES `html5dicom_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `proxyrest_tokenaccesspatient`
-- ----------------------------
DROP TABLE IF EXISTS `proxyrest_tokenaccesspatient`;
CREATE TABLE `proxyrest_tokenaccesspatient` (
  `token` varchar(32) NOT NULL,
  `PatientID` varchar(20) NOT NULL,
  `IssuerOfPatientID` varchar(64) DEFAULT NULL,
  `IssuerOfPatientIDQualifiers` longtext,
  `start_date` datetime(6) NOT NULL,
  `expiration_date` datetime(6) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`token`),
  UNIQUE KEY `proxyrest_tokenaccesspatient_token_1c47ca3b_uniq` (`token`,`PatientID`),
  KEY `proxyrest_tokenaccesspati_role_id_af4a6042_fk_html5dicom_role_id` (`role_id`),
  CONSTRAINT `proxyrest_tokenaccesspati_role_id_af4a6042_fk_html5dicom_role_id` FOREIGN KEY (`role_id`) REFERENCES `html5dicom_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `referencerange`
-- ----------------------------
DROP TABLE IF EXISTS `referencerange`;
CREATE TABLE `referencerange` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ucum` varchar(2) NOT NULL,
  `low` double DEFAULT NULL,
  `high` double DEFAULT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `referencerange_label_id_0e58d049_fk_label_id` (`label_id`),
  CONSTRAINT `referencerange_label_id_0e58d049_fk_label_id` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `row`
-- ----------------------------
DROP TABLE IF EXISTS `row`;
CREATE TABLE `row` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `code1_id` bigint(20) DEFAULT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  `table_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `row_code1_id_e43d4dc3_fk_code1_id` (`code1_id`),
  KEY `row_label_id_2a939499_fk_label_id` (`label_id`),
  KEY `row_a15b1ede` (`table_id`),
  CONSTRAINT `row_code1_id_e43d4dc3_fk_code1_id` FOREIGN KEY (`code1_id`) REFERENCES `code1` (`id`),
  CONSTRAINT `row_label_id_2a939499_fk_label_id` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`),
  CONSTRAINT `row_table_id_e00c1ab5_fk_table_id` FOREIGN KEY (`table_id`) REFERENCES `table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `scriptelement`
-- ----------------------------
DROP TABLE IF EXISTS `scriptelement`;
CREATE TABLE `scriptelement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `html` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `sec`
-- ----------------------------
DROP TABLE IF EXISTS `sec`;
CREATE TABLE `sec` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `templateuid` varchar(64) DEFAULT NULL,
  `idsec` varchar(4) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` longtext,
  `autenticado_id` bigint(20) DEFAULT NULL,
  `compcode_id` bigint(20) DEFAULT NULL,
  `seccode_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sec_autenticado_id_7ed01041_fk_autenticado_id` (`autenticado_id`),
  KEY `sec_compcode_id_74675cf1_fk_code_id` (`compcode_id`),
  KEY `sec_seccode_id_0b593b4b_fk_code_id` (`seccode_id`),
  CONSTRAINT `sec_autenticado_id_7ed01041_fk_autenticado_id` FOREIGN KEY (`autenticado_id`) REFERENCES `autenticado` (`id`),
  CONSTRAINT `sec_compcode_id_74675cf1_fk_code_id` FOREIGN KEY (`compcode_id`) REFERENCES `code` (`id`),
  CONSTRAINT `sec_seccode_id_0b593b4b_fk_code_id` FOREIGN KEY (`seccode_id`) REFERENCES `code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `section`
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordinal` int(11) DEFAULT NULL,
  `idattribute` varchar(4) DEFAULT NULL,
  `classattribute` varchar(16) DEFAULT NULL,
  `selectclass` varchar(16) DEFAULT NULL,
  `selectname` varchar(32) DEFAULT NULL,
  `selecttitle` varchar(255) DEFAULT NULL,
  `selectonchange` varchar(255) DEFAULT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `conceptcode_id` bigint(20) DEFAULT NULL,
  `formatcode_id` bigint(20) DEFAULT NULL,
  `plantilla_id` bigint(20) DEFAULT NULL,
  `super_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `section_article_id_96125562_fk_articlehtml_id` (`article_id`),
  KEY `section_conceptcode_id_c04e715e_fk_code_id` (`conceptcode_id`),
  KEY `section_formatcode_id_73f638cb_fk_code_id` (`formatcode_id`),
  KEY `section_plantilla_id_73c9a76e_fk_plantilla_id` (`plantilla_id`),
  KEY `section_super_id_3e61151e_fk_section_id` (`super_id`),
  CONSTRAINT `section_article_id_96125562_fk_articlehtml_id` FOREIGN KEY (`article_id`) REFERENCES `articlehtml` (`id`),
  CONSTRAINT `section_conceptcode_id_c04e715e_fk_code_id` FOREIGN KEY (`conceptcode_id`) REFERENCES `code` (`id`),
  CONSTRAINT `section_formatcode_id_73f638cb_fk_code_id` FOREIGN KEY (`formatcode_id`) REFERENCES `code` (`id`),
  CONSTRAINT `section_plantilla_id_73c9a76e_fk_plantilla_id` FOREIGN KEY (`plantilla_id`) REFERENCES `plantilla` (`id`),
  CONSTRAINT `section_super_id_3e61151e_fk_section_id` FOREIGN KEY (`super_id`) REFERENCES `section` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `selectoption`
-- ----------------------------
DROP TABLE IF EXISTS `selectoption`;
CREATE TABLE `selectoption` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordinal` int(11) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL,
  `text` varchar(64) DEFAULT NULL,
  `selected` tinyint(1) NOT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `selectoption_section_id_510b2bd6_fk_section_id` (`section_id`),
  CONSTRAINT `selectoption_section_id_510b2bd6_fk_section_id` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `submit`
-- ----------------------------
DROP TABLE IF EXISTS `submit`;
CREATE TABLE `submit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `eiud` varchar(64) DEFAULT NULL,
  `eaccnum` varchar(16) DEFAULT NULL,
  `eaccoid` varchar(64) DEFAULT NULL,
  `urlparamsenviado` longtext,
  `urlparamsrecibido` longtext,
  `listoparaautenticacion` varchar(2) DEFAULT NULL,
  `plantilla_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `submit_plantilla_id_53783655_fk_plantilla_id` (`plantilla_id`),
  CONSTRAINT `submit_plantilla_id_53783655_fk_plantilla_id` FOREIGN KEY (`plantilla_id`) REFERENCES `plantilla` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `subsec`
-- ----------------------------
DROP TABLE IF EXISTS `subsec`;
CREATE TABLE `subsec` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `templateuid` varchar(64) DEFAULT NULL,
  `idsubsec` varchar(4) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` longtext,
  `compcode_id` bigint(20) DEFAULT NULL,
  `parent_sec_id` bigint(20) DEFAULT NULL,
  `subseccode_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subsec_compcode_id_b1238359_fk_code_id` (`compcode_id`),
  KEY `subsec_parent_sec_id_26989d83_fk_sec_id` (`parent_sec_id`),
  KEY `subsec_subseccode_id_69975933_fk_code_id` (`subseccode_id`),
  CONSTRAINT `subsec_compcode_id_b1238359_fk_code_id` FOREIGN KEY (`compcode_id`) REFERENCES `code` (`id`),
  CONSTRAINT `subsec_parent_sec_id_26989d83_fk_sec_id` FOREIGN KEY (`parent_sec_id`) REFERENCES `sec` (`id`),
  CONSTRAINT `subsec_subseccode_id_69975933_fk_code_id` FOREIGN KEY (`subseccode_id`) REFERENCES `code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `subsubsec`
-- ----------------------------
DROP TABLE IF EXISTS `subsubsec`;
CREATE TABLE `subsubsec` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `templateuid` varchar(64) DEFAULT NULL,
  `idsubsubsec` varchar(4) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` longtext,
  `compcode_id` bigint(20) DEFAULT NULL,
  `parent_subsec_id` bigint(20) DEFAULT NULL,
  `subsubseccode_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subsubsec_compcode_id_6fc30c2e_fk_code_id` (`compcode_id`),
  KEY `subsubsec_parent_subsec_id_f63b8cff_fk_subsec_id` (`parent_subsec_id`),
  KEY `subsubsec_subsubseccode_id_c704437e_fk_code_id` (`subsubseccode_id`),
  CONSTRAINT `subsubsec_compcode_id_6fc30c2e_fk_code_id` FOREIGN KEY (`compcode_id`) REFERENCES `code` (`id`),
  CONSTRAINT `subsubsec_parent_subsec_id_f63b8cff_fk_subsec_id` FOREIGN KEY (`parent_subsec_id`) REFERENCES `subsec` (`id`),
  CONSTRAINT `subsubsec_subsubseccode_id_c704437e_fk_code_id` FOREIGN KEY (`subsubseccode_id`) REFERENCES `code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `table`
-- ----------------------------
DROP TABLE IF EXISTS `table`;
CREATE TABLE `table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(1) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `code1_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `table_code1_id_ef0f3dde_fk_code1_id` (`code1_id`),
  CONSTRAINT `table_code1_id_ef0f3dde_fk_code1_id` FOREIGN KEY (`code1_id`) REFERENCES `code1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `template`
-- ----------------------------
DROP TABLE IF EXISTS `template`;
CREATE TABLE `template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `urlparams` longtext NOT NULL,
  `plantilla_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `estudio_id` bigint(20),
  `modalidad` varchar(5),
  PRIMARY KEY (`id`),
  KEY `html5cda_template_plantilla_id_d9ad9f09_fk_plantilla_id` (`plantilla_id`),
  KEY `html5cda_template_user_id_6a3d269d_fk_auth_user_id` (`user_id`),
  KEY `template_11587e5e` (`estudio_id`),
  CONSTRAINT `html5cda_template_plantilla_id_d9ad9f09_fk_plantilla_id` FOREIGN KEY (`plantilla_id`) REFERENCES `plantilla` (`id`),
  CONSTRAINT `html5cda_template_user_id_6a3d269d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `template_estudio_id_3eee4956_fk_estudio_id` FOREIGN KEY (`estudio_id`) REFERENCES `estudio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `valueattribute`
-- ----------------------------
DROP TABLE IF EXISTS `valueattribute`;
CREATE TABLE `valueattribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `observation_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `valueattribute_observation_id_e4e81a1c_fk_observation_id` (`observation_id`),
  CONSTRAINT `valueattribute_observation_id_e4e81a1c_fk_observation_id` FOREIGN KEY (`observation_id`) REFERENCES `observation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
