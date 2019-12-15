/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : ccache

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-04-24 11:03:32
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `file_info`
-- ----------------------------
DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info` (
  `created_date_time` datetime NOT NULL,
  `file_path` varchar(50) NOT NULL,
  `id` smallint(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of file_info
-- ----------------------------
INSERT INTO file_info VALUES ('2019-03-12 10:12:05', 'downloadFile/CalendarCache_20190312_101205_001.zip', '3');
INSERT INTO file_info VALUES ('2019-03-26 15:28:16', 'downloadFile/CalendarCache_20190326_152816_001.zip', '4');
INSERT INTO file_info VALUES ('2019-04-16 16:29:35', 'downloadFile/CalendarCache_20190416_162928_001.zip', '7');
INSERT INTO file_info VALUES ('2019-04-16 16:33:34', 'downloadFile/CalendarCache_20190416_163330_001.zip', '8');
INSERT INTO file_info VALUES ('2019-04-16 16:35:36', 'downloadFile/CalendarCache_20190416_163523_001.zip', '9');
INSERT INTO file_info VALUES ('2019-04-16 17:03:23', 'downloadFile/CalendarCache_20190416_170322_001.zip', '10');
INSERT INTO file_info VALUES ('2019-04-16 17:05:24', 'downloadFile/CalendarCache_20190416_170523_001.zip', '11');
INSERT INTO file_info VALUES ('2019-04-17 09:55:35', 'downloadFile/CalendarCache_20190417_095533_001.zip', '12');
INSERT INTO file_info VALUES ('2019-04-17 09:57:34', 'downloadFile/CalendarCache_20190417_095733_001.zip', '13');
INSERT INTO file_info VALUES ('2019-04-17 09:59:22', 'downloadFile/CalendarCache_20190417_095921_001.zip', '14');

-- ----------------------------
-- Table structure for `log_access`
-- ----------------------------
DROP TABLE IF EXISTS `log_access`;
CREATE TABLE `log_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_time` varchar(14) DEFAULT NULL,
  `user` varchar(10) DEFAULT NULL,
  `pcc` varchar(4) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `access_result` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_access
-- ----------------------------

-- ----------------------------
-- Table structure for `log_cache`
-- ----------------------------
DROP TABLE IF EXISTS `log_cache`;
CREATE TABLE `log_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cache_time` datetime NOT NULL,
  `pattern_id` varchar(10) NOT NULL,
  `request_id` varchar(25) NOT NULL,
  `carrier` varchar(2) NOT NULL,
  `departure_airport` varchar(3) NOT NULL,
  `arrival_airport` varchar(3) NOT NULL,
  `outbound_date_from` varchar(8) NOT NULL,
  `outbound_date_to` varchar(8) NOT NULL,
  `duration` smallint(6) NOT NULL,
  `stops` smallint(6) NOT NULL,
  `outbound_time` varchar(10) NOT NULL,
  `inbound_time` varchar(10) NOT NULL,
  `cabin` varchar(2) NOT NULL,
  `exclude_codeshare` smallint(6) NOT NULL,
  `request_xml` text NOT NULL,
  `response_xml` text NOT NULL,
  `cache_result` varchar(2) NOT NULL,
  `error_msg` text,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_cache
-- ----------------------------

-- ----------------------------
-- Table structure for `mgmt_cache_timing`
-- ----------------------------
DROP TABLE IF EXISTS `mgmt_cache_timing`;
CREATE TABLE `mgmt_cache_timing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mon` varchar(255) NOT NULL,
  `tue` varchar(255) NOT NULL,
  `web` varchar(255) NOT NULL,
  `thu` varchar(255) NOT NULL,
  `fri` varchar(255) NOT NULL,
  `sat` varchar(255) NOT NULL,
  `sun` varchar(255) NOT NULL,
  `start_time_1` varchar(5) DEFAULT NULL,
  `start_time_2` varchar(5) DEFAULT NULL,
  `start_time_3` varchar(5) DEFAULT NULL,
  `num_of_sessions` tinyint(2) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mgmt_cache_timing
-- ----------------------------
INSERT INTO mgmt_cache_timing VALUES ('1', '1', '1', '1', '1', '1', '0', '0', '01:00', null, null, '1', '2019-03-05 00:00:00', '2019-03-05 00:00:00');

-- ----------------------------
-- Table structure for `mgmt_config`
-- ----------------------------
DROP TABLE IF EXISTS `mgmt_config`;
CREATE TABLE `mgmt_config` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `pseudo_city_code` varchar(4) DEFAULT NULL,
  `sws_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mgmt_config
-- ----------------------------
INSERT INTO mgmt_config VALUES ('622985', '1f122090', '1FQ6', 'https://sws-crt.cert.havail.sabre.com');

-- ----------------------------
-- Table structure for `mgmt_user`
-- ----------------------------
DROP TABLE IF EXISTS `mgmt_user`;
CREATE TABLE `mgmt_user` (
  `id` varchar(10) NOT NULL,
  `pcc` varchar(4) NOT NULL,
  `company_name` text NOT NULL,
  `agent_name` text NOT NULL,
  `ip` text NOT NULL,
  `enable_password` tinyint(1) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  `created_time` datetime NOT NULL,
  `last_updated_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mgmt_user
-- ----------------------------

-- ----------------------------
-- Table structure for `rq_condition`
-- ----------------------------
DROP TABLE IF EXISTS `rq_condition`;
CREATE TABLE `rq_condition` (
  `cache_id` varchar(50) NOT NULL,
  `request_id` varchar(25) NOT NULL,
  `departure_airport` varchar(3) NOT NULL,
  `arrival_airport` varchar(3) NOT NULL,
  `carrier` varchar(2) NOT NULL,
  `outbound_date_from` varchar(10) NOT NULL,
  `outbound_date_to` varchar(10) NOT NULL,
  `outbound_time_from` varchar(5) NOT NULL,
  `outbound_time_to` varchar(5) NOT NULL,
  `inbound_time_from` varchar(5) NOT NULL,
  `inbound_time_to` varchar(5) NOT NULL,
  `num_of_adt` smallint(2) NOT NULL,
  `num_of_cnn` smallint(2) NOT NULL,
  `num_of_ins` smallint(2) NOT NULL,
  `num_of_inf` smallint(2) NOT NULL,
  `staydays` smallint(4) NOT NULL,
  `stops` smallint(4) NOT NULL,
  `cabin` varchar(2) NOT NULL,
  `rbd` varchar(30) DEFAULT NULL,
  `exclude_codeshare` varchar(4) NOT NULL,
  `free_piece` varchar(4) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cache_id`,`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rq_condition
-- ----------------------------
INSERT INTO rq_condition VALUES ('20190417095818_AFNRTCDG_B05P21100AA1', 'AFNRTCDG_B05P21100AA1', 'NRT', 'CDG', 'AF', '2019-10-15', '2019-11-03', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '5', '2', 'P', null, 'true', 'true', '2019-04-17 09:58:18', '2019-04-17 09:58:18');
INSERT INTO rq_condition VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', 'AFNRTCDG_B06Y21100AA1', 'NRT', 'CDG', 'AF', '2019-10-15', '2019-11-03', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '6', '2', 'Y', null, 'true', 'true', '2019-04-17 09:58:19', '2019-04-17 09:58:19');
INSERT INTO rq_condition VALUES ('20190417095830_AFNRTCDG_B06P21100AA1', 'AFNRTCDG_B06P21100AA1', 'NRT', 'CDG', 'AF', '2019-10-15', '2019-11-03', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '6', '2', 'P', null, 'true', 'true', '2019-04-17 09:58:30', '2019-04-17 09:58:30');
INSERT INTO rq_condition VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', 'AFNRTCDG_B07Y21100AA1', 'NRT', 'CDG', 'AF', '2019-10-15', '2019-11-03', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '7', '2', 'Y', null, 'true', 'true', '2019-04-17 09:58:32', '2019-04-17 09:58:32');
INSERT INTO rq_condition VALUES ('20190417095845_AFNRTCDG_B07P21100AA1', 'AFNRTCDG_B07P21100AA1', 'NRT', 'CDG', 'AF', '2019-10-15', '2019-11-03', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '7', '2', 'P', null, 'true', 'true', '2019-04-17 09:58:45', '2019-04-17 09:58:45');
INSERT INTO rq_condition VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', 'AFNRTCDG_A03Y21100AA1', 'NRT', 'CDG', 'AF', '2019-04-18', '2019-10-14', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '3', '2', 'Y', null, 'true', 'true', '2019-04-17 10:00:02', '2019-04-17 10:00:02');
INSERT INTO rq_condition VALUES ('20190417100005_AFNRTCDG_A03P21100AA1', 'AFNRTCDG_A03P21100AA1', 'NRT', 'CDG', 'AF', '2019-04-18', '2019-10-14', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '3', '2', 'P', null, 'true', 'true', '2019-04-17 10:00:05', '2019-04-17 10:00:05');
INSERT INTO rq_condition VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', 'AFNRTCDG_A04Y21100AA1', 'NRT', 'CDG', 'AF', '2019-04-18', '2019-10-14', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '4', '2', 'Y', null, 'true', 'true', '2019-04-17 10:00:06', '2019-04-17 10:00:06');
INSERT INTO rq_condition VALUES ('20190417100008_AFNRTCDG_A04P21100AA1', 'AFNRTCDG_A04P21100AA1', 'NRT', 'CDG', 'AF', '2019-04-18', '2019-10-14', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '4', '2', 'P', null, 'true', 'true', '2019-04-17 10:00:09', '2019-04-17 10:00:09');
INSERT INTO rq_condition VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', 'AFNRTCDG_A05Y21100AA1', 'NRT', 'CDG', 'AF', '2019-04-18', '2019-10-14', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '5', '2', 'Y', null, 'true', 'true', '2019-04-17 10:00:10', '2019-04-17 10:00:10');
INSERT INTO rq_condition VALUES ('20190417100012_AFNRTCDG_A05P21100AA1', 'AFNRTCDG_A05P21100AA1', 'NRT', 'CDG', 'AF', '2019-04-18', '2019-10-14', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '5', '2', 'P', null, 'true', 'true', '2019-04-17 10:00:12', '2019-04-17 10:00:12');
INSERT INTO rq_condition VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', 'AFNRTCDG_A06Y21100AA1', 'NRT', 'CDG', 'AF', '2019-04-18', '2019-10-14', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '6', '2', 'Y', null, 'true', 'true', '2019-04-17 10:00:13', '2019-04-17 10:00:13');
INSERT INTO rq_condition VALUES ('20190417100015_AFNRTCDG_A06P21100AA1', 'AFNRTCDG_A06P21100AA1', 'NRT', 'CDG', 'AF', '2019-04-18', '2019-10-14', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '6', '2', 'P', null, 'true', 'true', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rq_condition VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', 'AFNRTCDG_A07Y21100AA1', 'NRT', 'CDG', 'AF', '2019-04-18', '2019-10-14', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '7', '2', 'Y', null, 'true', 'true', '2019-04-17 10:00:16', '2019-04-17 10:00:16');
INSERT INTO rq_condition VALUES ('20190417100019_AFNRTCDG_A07P21100AA1', 'AFNRTCDG_A07P21100AA1', 'NRT', 'CDG', 'AF', '2019-04-18', '2019-10-14', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '7', '2', 'P', null, 'true', 'true', '2019-04-17 10:00:19', '2019-04-17 10:00:19');
INSERT INTO rq_condition VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', 'AFNRTCDG_B03Y21100AA1', 'NRT', 'CDG', 'AF', '2019-10-15', '2019-11-03', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '3', '2', 'Y', null, 'true', 'true', '2019-04-17 10:00:20', '2019-04-17 10:00:20');
INSERT INTO rq_condition VALUES ('20190417100032_AFNRTCDG_B03P21100AA1', 'AFNRTCDG_B03P21100AA1', 'NRT', 'CDG', 'AF', '2019-10-15', '2019-11-03', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '3', '2', 'P', null, 'true', 'true', '2019-04-17 10:00:32', '2019-04-17 10:00:32');
INSERT INTO rq_condition VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', 'AFNRTCDG_B04Y21100AA1', 'NRT', 'CDG', 'AF', '2019-10-15', '2019-11-03', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '4', '2', 'Y', null, 'true', 'true', '2019-04-17 10:00:35', '2019-04-17 10:00:35');
INSERT INTO rq_condition VALUES ('20190417100045_AFNRTCDG_B04P21100AA1', 'AFNRTCDG_B04P21100AA1', 'NRT', 'CDG', 'AF', '2019-10-15', '2019-11-03', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '4', '2', 'P', null, 'true', 'true', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rq_condition VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', 'AFNRTCDG_B05Y21100AA1', 'NRT', 'CDG', 'AF', '2019-10-15', '2019-11-03', '07:00', '11:59', '12:00', '19:00', '1', '1', '0', '0', '5', '2', 'Y', null, 'true', 'true', '2019-04-17 10:00:48', '2019-04-17 10:00:48');

-- ----------------------------
-- Table structure for `rq_pattern`
-- ----------------------------
DROP TABLE IF EXISTS `rq_pattern`;
CREATE TABLE `rq_pattern` (
  `pattern_id` varchar(10) NOT NULL,
  `carrier` varchar(2) NOT NULL,
  `departure_airport` varchar(3) NOT NULL,
  `arrival_airport` varchar(3) NOT NULL,
  `outbound_date_from` smallint(6) NOT NULL DEFAULT '1',
  `outbound_date_to` smallint(6) NOT NULL DEFAULT '365',
  `direct_flight_only` tinyint(4) NOT NULL,
  `include_transfer` tinyint(4) NOT NULL,
  `stops` smallint(6) DEFAULT NULL,
  `num_of_adt` smallint(6) NOT NULL,
  `num_of_cnn` smallint(6) NOT NULL,
  `num_of_ins` smallint(6) NOT NULL,
  `num_of_inf` smallint(6) NOT NULL,
  `rbd` varchar(30) DEFAULT NULL,
  `exclude_codeshare` smallint(4) NOT NULL,
  `free_piece` smallint(4) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`pattern_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rq_pattern
-- ----------------------------
INSERT INTO rq_pattern VALUES ('AFNRTCDG', 'AF', 'NRT', 'CDG', '1', '200', '1', '1', '2', '1', '1', '0', '0', null, '1', '1', '2019-03-05 00:00:00', '2019-03-05 00:00:00');

-- ----------------------------
-- Table structure for `rq_pattern_cabin`
-- ----------------------------
DROP TABLE IF EXISTS `rq_pattern_cabin`;
CREATE TABLE `rq_pattern_cabin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern_id` varchar(10) NOT NULL,
  `cabin` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pattern_id_stay_day` (`pattern_id`),
  CONSTRAINT `fk_pattern_id_cabin` FOREIGN KEY (`pattern_id`) REFERENCES `rq_pattern` (`pattern_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rq_pattern_cabin
-- ----------------------------
INSERT INTO rq_pattern_cabin VALUES ('6', 'AFNRTCDG', 'Y');
INSERT INTO rq_pattern_cabin VALUES ('7', 'AFNRTCDG', 'P');

-- ----------------------------
-- Table structure for `rq_pattern_inboundtime`
-- ----------------------------
DROP TABLE IF EXISTS `rq_pattern_inboundtime`;
CREATE TABLE `rq_pattern_inboundtime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern_id` varchar(10) NOT NULL,
  `position` varchar(1) NOT NULL,
  `from` varchar(4) NOT NULL,
  `to` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pattern_id_time` (`pattern_id`),
  CONSTRAINT `rq_pattern_inboundtime_ibfk_1` FOREIGN KEY (`pattern_id`) REFERENCES `rq_pattern` (`pattern_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rq_pattern_inboundtime
-- ----------------------------
INSERT INTO rq_pattern_inboundtime VALUES ('1', 'AFNRTCDG', 'A', '1200', '1900');

-- ----------------------------
-- Table structure for `rq_pattern_outboundtime`
-- ----------------------------
DROP TABLE IF EXISTS `rq_pattern_outboundtime`;
CREATE TABLE `rq_pattern_outboundtime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern_id` varchar(10) NOT NULL,
  `position` varchar(1) NOT NULL,
  `from` varchar(4) NOT NULL,
  `to` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pattern_id_time` (`pattern_id`),
  CONSTRAINT `fk_pattern_id_time` FOREIGN KEY (`pattern_id`) REFERENCES `rq_pattern` (`pattern_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rq_pattern_outboundtime
-- ----------------------------
INSERT INTO rq_pattern_outboundtime VALUES ('1', 'AFNRTCDG', 'A', '0700', '1159');

-- ----------------------------
-- Table structure for `rq_pattern_staydays`
-- ----------------------------
DROP TABLE IF EXISTS `rq_pattern_staydays`;
CREATE TABLE `rq_pattern_staydays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern_id` varchar(10) NOT NULL,
  `stay_day` smallint(6) NOT NULL,
  `position` smallint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pattern_id_stay_day` (`pattern_id`),
  CONSTRAINT `fk_pattern_id_stay_day` FOREIGN KEY (`pattern_id`) REFERENCES `rq_pattern` (`pattern_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rq_pattern_staydays
-- ----------------------------
INSERT INTO rq_pattern_staydays VALUES ('1', 'AFNRTCDG', '3', '1');
INSERT INTO rq_pattern_staydays VALUES ('2', 'AFNRTCDG', '4', '2');
INSERT INTO rq_pattern_staydays VALUES ('3', 'AFNRTCDG', '5', '3');
INSERT INTO rq_pattern_staydays VALUES ('4', 'AFNRTCDG', '6', '4');
INSERT INTO rq_pattern_staydays VALUES ('5', 'AFNRTCDG', '7', '5');

-- ----------------------------
-- Table structure for `rs_farebasis`
-- ----------------------------
DROP TABLE IF EXISTS `rs_farebasis`;
CREATE TABLE `rs_farebasis` (
  `cache_id` varchar(50) NOT NULL,
  `itinerary_id` smallint(3) NOT NULL,
  `passenger_type` varchar(3) NOT NULL,
  `segment_no` smallint(3) NOT NULL,
  `cabin` varchar(1) NOT NULL,
  `seats_available` smallint(3) NOT NULL,
  `rbd` varchar(1) NOT NULL,
  `farebasis` varchar(15) NOT NULL,
  `availability_break` varchar(4) NOT NULL,
  `baggage` varchar(1) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cache_id`,`itinerary_id`,`passenger_type`,`segment_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_farebasis
-- ----------------------------
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', 'ADT', '2', 'Y', '9', 'E', 'ELSRJP', 'true', 'A', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', 'ADT', '4', 'Y', '9', 'E', 'ELSRJP', 'true', 'A', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '4', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '4', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '4', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '4', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '5', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '5', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '5', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '5', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '6', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '6', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '6', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '6', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '7', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '7', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '7', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '7', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '8', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '8', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '8', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '8', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '9', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '9', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '9', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '9', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '10', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '10', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '10', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '10', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '11', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '11', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '11', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '11', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:22', '2019-04-17 09:58:22');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '12', 'ADT', '1', 'Y', '9', 'E', 'ELSRJP', 'true', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '12', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '12', 'ADT', '3', 'Y', '9', 'E', 'ELSRJP', 'true', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '12', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '13', 'ADT', '1', 'Y', '9', 'T', 'TLSRJP', 'true', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '13', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '13', 'ADT', '3', 'Y', '9', 'T', 'TLSRJP', 'true', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '13', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '14', 'ADT', '1', 'Y', '9', 'H', 'HLSRJP', 'true', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '14', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '14', 'ADT', '3', 'Y', '9', 'H', 'HLSRJP', 'true', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_farebasis VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '14', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', 'ADT', '1', 'Y', '9', 'N', 'NKSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', 'ADT', '2', 'Y', '9', 'E', 'EKSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', 'ADT', '3', 'Y', '9', 'N', 'NKSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', 'ADT', '4', 'Y', '9', 'E', 'EKSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '5', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '5', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '5', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '5', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '6', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '6', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '6', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '6', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '7', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '7', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '7', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '7', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '8', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '8', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '8', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '8', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '9', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '9', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '9', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '9', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '10', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '10', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '10', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '10', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '11', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '11', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '11', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '11', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '12', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '12', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '12', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '12', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '13', 'ADT', '1', 'Y', '9', 'E', 'ELSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '13', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '13', 'ADT', '3', 'Y', '9', 'E', 'ELSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '13', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '14', 'ADT', '1', 'Y', '9', 'T', 'TLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '14', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '14', 'ADT', '3', 'Y', '9', 'T', 'TLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '14', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '15', 'ADT', '1', 'Y', '9', 'H', 'HLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '15', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '15', 'ADT', '3', 'Y', '9', 'H', 'HLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '15', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_farebasis VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:04', '2019-04-17 10:00:04');
INSERT INTO rs_farebasis VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', 'ADT', '2', 'Y', '4', 'K', 'KLSRJP', 'true', 'A', '2019-04-17 10:00:04', '2019-04-17 10:00:04');
INSERT INTO rs_farebasis VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:04', '2019-04-17 10:00:04');
INSERT INTO rs_farebasis VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', 'ADT', '4', 'Y', '4', 'K', 'KLSRJP', 'true', 'A', '2019-04-17 10:00:04', '2019-04-17 10:00:04');
INSERT INTO rs_farebasis VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:07', '2019-04-17 10:00:07');
INSERT INTO rs_farebasis VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', 'ADT', '2', 'Y', '4', 'K', 'KLSRJP', 'true', 'A', '2019-04-17 10:00:07', '2019-04-17 10:00:07');
INSERT INTO rs_farebasis VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:07', '2019-04-17 10:00:07');
INSERT INTO rs_farebasis VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', 'ADT', '4', 'Y', '4', 'K', 'KLSRJP', 'true', 'A', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_farebasis VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_farebasis VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', 'ADT', '2', 'Y', '4', 'K', 'KLSRJP', 'true', 'A', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_farebasis VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_farebasis VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', 'ADT', '4', 'Y', '4', 'K', 'KLSRJP', 'true', 'A', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_farebasis VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', 'ADT', '1', 'Y', '9', 'R', 'RLPRJP', 'true', 'A', '2019-04-17 10:00:14', '2019-04-17 10:00:14');
INSERT INTO rs_farebasis VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', 'ADT', '2', 'Y', '4', 'K', 'KLSRJP', 'true', 'A', '2019-04-17 10:00:14', '2019-04-17 10:00:14');
INSERT INTO rs_farebasis VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', 'ADT', '3', 'Y', '9', 'R', 'RLPRJP', 'true', 'A', '2019-04-17 10:00:14', '2019-04-17 10:00:14');
INSERT INTO rs_farebasis VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', 'ADT', '4', 'Y', '4', 'K', 'KLSRJP', 'true', 'A', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_farebasis VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_farebasis VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', 'ADT', '2', 'Y', '4', 'K', 'KLSRJP', 'true', 'A', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_farebasis VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_farebasis VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', 'ADT', '4', 'Y', '4', 'K', 'KLSRJP', 'true', 'A', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', 'ADT', '2', 'Y', '9', 'E', 'ELSRJP', 'true', 'A', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', 'ADT', '4', 'Y', '9', 'E', 'ELSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '4', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '4', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '4', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '4', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '5', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '5', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '5', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '5', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '6', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '6', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '6', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '6', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '7', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '7', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '7', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '7', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '8', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '8', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '8', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:23', '2019-04-17 10:00:23');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '8', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '9', 'ADT', '1', 'Y', '9', 'E', 'ELSRJP', 'true', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '9', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '9', 'ADT', '3', 'Y', '9', 'E', 'ELSRJP', 'true', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '9', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '10', 'ADT', '1', 'Y', '9', 'T', 'TLSRJP', 'true', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '10', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '10', 'ADT', '3', 'Y', '9', 'T', 'TLSRJP', 'true', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '10', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '11', 'ADT', '1', 'Y', '9', 'H', 'HLSRJP', 'true', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '11', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '11', 'ADT', '3', 'Y', '9', 'H', 'HLSRJP', 'true', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_farebasis VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '11', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', 'ADT', '2', 'Y', '9', 'E', 'ELSRJP', 'true', 'A', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', 'ADT', '4', 'Y', '9', 'E', 'ELSRJP', 'true', 'A', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '4', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '4', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '4', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '4', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '5', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '5', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '5', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '5', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '6', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '6', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '6', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '6', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '7', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '7', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '7', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '7', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '8', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '8', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '8', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '8', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '9', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '9', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '9', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '9', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '10', 'ADT', '1', 'Y', '9', 'E', 'ELSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '10', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '10', 'ADT', '3', 'Y', '9', 'E', 'ELSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '10', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '11', 'ADT', '1', 'Y', '9', 'T', 'TLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '11', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '11', 'ADT', '3', 'Y', '9', 'T', 'TLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '11', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '12', 'ADT', '1', 'Y', '9', 'H', 'HLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '12', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '12', 'ADT', '3', 'Y', '9', 'H', 'HLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '12', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:38', '2019-04-17 10:00:38');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '1', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '1', 'ADT', '2', 'Y', '9', 'E', 'ELSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '1', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '1', 'ADT', '4', 'Y', '9', 'E', 'ELSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '2', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '2', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '2', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '2', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '3', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '3', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '3', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '3', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '4', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '4', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '4', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '4', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '5', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '5', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '5', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '5', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '6', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '6', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '6', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '6', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '7', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '7', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '7', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '7', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '8', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '8', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '8', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '8', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '9', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '9', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '9', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '9', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '10', 'ADT', '1', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '10', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '10', 'ADT', '3', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '10', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '11', 'ADT', '1', 'Y', '9', 'E', 'ELSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '11', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '11', 'ADT', '3', 'Y', '9', 'E', 'ELSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '11', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '12', 'ADT', '1', 'Y', '9', 'T', 'TLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '12', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '12', 'ADT', '3', 'Y', '9', 'T', 'TLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '12', 'ADT', '4', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '13', 'ADT', '1', 'Y', '9', 'H', 'HLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');
INSERT INTO rs_farebasis VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '13', 'ADT', '2', 'Y', '9', 'N', 'NLSRJP', 'true', 'A', '2019-04-17 10:00:51', '2019-04-17 10:00:51');

-- ----------------------------
-- Table structure for `rs_fare_component`
-- ----------------------------
DROP TABLE IF EXISTS `rs_fare_component`;
CREATE TABLE `rs_fare_component` (
  `cache_id` varchar(50) NOT NULL,
  `itinerary_id` smallint(3) NOT NULL,
  `passenger_type` varchar(3) NOT NULL,
  `validating_carrier` varchar(2) NOT NULL,
  `last_ticket_date` varchar(8) DEFAULT NULL,
  `total_fare` int(11) NOT NULL,
  `total_tax` int(11) NOT NULL,
  `base_fare` int(11) NOT NULL,
  `non_refundable` varchar(4) NOT NULL,
  `exchange_before` int(11) DEFAULT NULL,
  `exchange_after` int(11) DEFAULT NULL,
  `refund_before` int(11) DEFAULT NULL,
  `refund_after` int(11) DEFAULT NULL,
  `baggage` varchar(1) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cache_id`,`itinerary_id`,`passenger_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_fare_component
-- ----------------------------
INSERT INTO rs_fare_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', 'ADT', 'AF', null, '127980', '27980', '100000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_fare_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_fare_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_fare_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '4', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_fare_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '5', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_fare_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '6', 'ADT', 'AF', null, '137980', '27980', '110000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_fare_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '7', 'ADT', 'AF', null, '137980', '27980', '110000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_fare_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '8', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_fare_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '9', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_fare_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '10', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_fare_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '11', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_fare_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '12', 'ADT', 'AF', null, '127980', '27980', '100000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_fare_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '13', 'ADT', 'AF', null, '155980', '27980', '128000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_fare_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '14', 'ADT', 'AF', null, '179480', '27980', '151500', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_fare_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', 'ADT', 'AF', null, '157980', '27980', '130000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_fare_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_fare_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_fare_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_fare_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '5', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_fare_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '6', 'ADT', 'AF', null, '127980', '27980', '100000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_fare_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '7', 'ADT', 'AF', null, '137980', '27980', '110000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_fare_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '8', 'ADT', 'AF', null, '127980', '27980', '100000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:37', '2019-04-17 09:58:37');
INSERT INTO rs_fare_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '9', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_fare_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '10', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_fare_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '11', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_fare_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '12', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_fare_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '13', 'ADT', 'AF', null, '137980', '27980', '110000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_fare_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '14', 'ADT', 'AF', null, '155980', '27980', '128000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_fare_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '15', 'ADT', 'AF', null, '169480', '27980', '141500', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_fare_component VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', 'ADT', 'AF', null, '177980', '27980', '150000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:04', '2019-04-17 10:00:04');
INSERT INTO rs_fare_component VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', 'ADT', 'AF', null, '177980', '27980', '150000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_fare_component VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', 'ADT', 'AF', null, '177980', '27980', '150000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_fare_component VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', 'ADT', 'AF', '20190419', '167980', '27980', '140000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_fare_component VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', 'ADT', 'AF', null, '177980', '27980', '150000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_fare_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', 'ADT', 'AF', null, '127980', '27980', '100000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_fare_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_fare_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', 'ADT', 'AF', null, '127980', '27980', '100000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_fare_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '4', 'ADT', 'AF', null, '127980', '27980', '100000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_fare_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '5', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_fare_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '6', 'ADT', 'AF', null, '127980', '27980', '100000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_fare_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '7', 'ADT', 'AF', null, '127980', '27980', '100000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:24', '2019-04-17 10:00:24');
INSERT INTO rs_fare_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '8', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:25', '2019-04-17 10:00:25');
INSERT INTO rs_fare_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '9', 'ADT', 'AF', null, '127980', '27980', '100000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:25', '2019-04-17 10:00:25');
INSERT INTO rs_fare_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '10', 'ADT', 'AF', null, '145980', '27980', '118000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:25', '2019-04-17 10:00:25');
INSERT INTO rs_fare_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '11', 'ADT', 'AF', null, '169480', '27980', '141500', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:25', '2019-04-17 10:00:25');
INSERT INTO rs_fare_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', 'ADT', 'AF', null, '127980', '27980', '100000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_fare_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_fare_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_fare_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '4', 'ADT', 'AF', null, '127980', '27980', '100000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_fare_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '5', 'ADT', 'AF', null, '127980', '27980', '100000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_fare_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '6', 'ADT', 'AF', null, '127980', '27980', '100000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_fare_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '7', 'ADT', 'AF', null, '127980', '27980', '100000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_fare_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '8', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_fare_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '9', 'ADT', 'AF', null, '117980', '27980', '90000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_fare_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '10', 'ADT', 'AF', null, '127980', '27980', '100000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_fare_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '11', 'ADT', 'AF', null, '145980', '27980', '118000', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_fare_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '12', 'ADT', 'AF', null, '169480', '27980', '141500', 'true', '20000', '20000', '0', '0', 'A', '2019-04-17 10:00:39', '2019-04-17 10:00:39');

-- ----------------------------
-- Table structure for `rs_hidden_stop`
-- ----------------------------
DROP TABLE IF EXISTS `rs_hidden_stop`;
CREATE TABLE `rs_hidden_stop` (
  `cache_id` varchar(50) NOT NULL,
  `schedule_id` smallint(3) NOT NULL,
  `hidden_stop_id` smallint(3) NOT NULL,
  `hidden_stop_airport` varchar(3) NOT NULL,
  `hidden_stop_arrival_time` varchar(20) NOT NULL,
  `hidden_stop_arrival_date_adjustment` smallint(3) DEFAULT NULL,
  `hidden_stop_departure_time` varchar(20) NOT NULL,
  `hidden_stop_departure_date_adjustment` smallint(3) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cache_id`,`schedule_id`,`hidden_stop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_hidden_stop
-- ----------------------------

-- ----------------------------
-- Table structure for `rs_segment`
-- ----------------------------
DROP TABLE IF EXISTS `rs_segment`;
CREATE TABLE `rs_segment` (
  `cache_id` varchar(50) NOT NULL,
  `schedule_id` smallint(3) NOT NULL,
  `stops` smallint(2) NOT NULL,
  `departure_airport` varchar(3) NOT NULL,
  `departure_time` varchar(20) NOT NULL,
  `arrival_airport` varchar(3) NOT NULL,
  `arrival_time` varchar(20) NOT NULL,
  `date_adjustment` smallint(4) DEFAULT NULL,
  `marketing_carrier` varchar(2) NOT NULL,
  `marketing_flight_number` varchar(4) NOT NULL,
  `operating_carrier` varchar(2) NOT NULL,
  `operating_flight_number` varchar(4) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cache_id`,`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_segment
-- ----------------------------
INSERT INTO rs_segment VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', '0', 'NRT', '10:55:00+09:00', 'CDG', '15:40:00+01:00', '0', 'AF', '275', 'AF', '275', '2019-04-17 09:58:20', '2019-04-17 09:58:20');
INSERT INTO rs_segment VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', '0', 'NRT', '10:35:00+09:00', 'CDG', '16:10:00+02:00', '0', 'AF', '275', 'AF', '275', '2019-04-17 09:58:20', '2019-04-17 09:58:20');
INSERT INTO rs_segment VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', '0', 'CDG', '13:15:00+01:00', 'NRT', '09:10:00+09:00', '1', 'AF', '276', 'AF', '276', '2019-04-17 09:58:20', '2019-04-17 09:58:20');
INSERT INTO rs_segment VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', '0', 'NRT', '10:55:00+09:00', 'CDG', '15:40:00+01:00', '0', 'AF', '275', 'AF', '275', '2019-04-17 09:58:34', '2019-04-17 09:58:34');
INSERT INTO rs_segment VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', '0', 'NRT', '10:35:00+09:00', 'CDG', '16:10:00+02:00', '0', 'AF', '275', 'AF', '275', '2019-04-17 09:58:34', '2019-04-17 09:58:34');
INSERT INTO rs_segment VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', '0', 'NRT', '10:35:00+09:00', 'CDG', '16:10:00+02:00', '0', 'AF', '275', 'AF', '275', '2019-04-17 09:58:34', '2019-04-17 09:58:34');
INSERT INTO rs_segment VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', '0', 'CDG', '13:15:00+01:00', 'NRT', '09:10:00+09:00', '1', 'AF', '276', 'AF', '276', '2019-04-17 09:58:34', '2019-04-17 09:58:34');
INSERT INTO rs_segment VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', '0', 'NRT', '10:35:00+09:00', 'CDG', '16:10:00+02:00', '0', 'AF', '275', 'AF', '275', '2019-04-17 10:00:03', '2019-04-17 10:00:03');
INSERT INTO rs_segment VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '2', '0', 'CDG', '17:20:00+02:00', 'NRT', '12:05:00+09:00', '1', 'AF', '278', 'AF', '278', '2019-04-17 10:00:04', '2019-04-17 10:00:04');
INSERT INTO rs_segment VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', '0', 'NRT', '10:35:00+09:00', 'CDG', '16:10:00+02:00', '0', 'AF', '275', 'AF', '275', '2019-04-17 10:00:07', '2019-04-17 10:00:07');
INSERT INTO rs_segment VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '2', '0', 'CDG', '17:20:00+02:00', 'NRT', '12:05:00+09:00', '1', 'AF', '278', 'AF', '278', '2019-04-17 10:00:07', '2019-04-17 10:00:07');
INSERT INTO rs_segment VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', '0', 'NRT', '10:35:00+09:00', 'CDG', '16:10:00+02:00', '0', 'AF', '275', 'AF', '275', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_segment VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '2', '0', 'CDG', '17:20:00+02:00', 'NRT', '12:05:00+09:00', '1', 'AF', '278', 'AF', '278', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_segment VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', '0', 'NRT', '10:35:00+09:00', 'CDG', '16:10:00+02:00', '0', 'AF', '275', 'AF', '275', '2019-04-17 10:00:14', '2019-04-17 10:00:14');
INSERT INTO rs_segment VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '2', '0', 'CDG', '17:20:00+02:00', 'NRT', '12:05:00+09:00', '1', 'AF', '278', 'AF', '278', '2019-04-17 10:00:14', '2019-04-17 10:00:14');
INSERT INTO rs_segment VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', '0', 'NRT', '10:35:00+09:00', 'CDG', '16:10:00+02:00', '0', 'AF', '275', 'AF', '275', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_segment VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '2', '0', 'CDG', '17:20:00+02:00', 'NRT', '12:05:00+09:00', '1', 'AF', '278', 'AF', '278', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_segment VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', '0', 'NRT', '10:55:00+09:00', 'CDG', '15:40:00+01:00', '0', 'AF', '275', 'AF', '275', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_segment VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', '0', 'NRT', '10:35:00+09:00', 'CDG', '16:10:00+02:00', '0', 'AF', '275', 'AF', '275', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_segment VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', '0', 'CDG', '13:15:00+01:00', 'NRT', '09:10:00+09:00', '1', 'AF', '276', 'AF', '276', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_segment VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', '0', 'NRT', '10:55:00+09:00', 'CDG', '15:40:00+01:00', '0', 'AF', '275', 'AF', '275', '2019-04-17 10:00:36', '2019-04-17 10:00:36');
INSERT INTO rs_segment VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', '0', 'NRT', '10:35:00+09:00', 'CDG', '16:10:00+02:00', '0', 'AF', '275', 'AF', '275', '2019-04-17 10:00:36', '2019-04-17 10:00:36');
INSERT INTO rs_segment VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', '0', 'CDG', '13:15:00+01:00', 'NRT', '09:10:00+09:00', '1', 'AF', '276', 'AF', '276', '2019-04-17 10:00:36', '2019-04-17 10:00:36');
INSERT INTO rs_segment VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '1', '0', 'NRT', '10:55:00+09:00', 'CDG', '15:40:00+01:00', '0', 'AF', '275', 'AF', '275', '2019-04-17 10:00:49', '2019-04-17 10:00:49');
INSERT INTO rs_segment VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '2', '0', 'NRT', '10:35:00+09:00', 'CDG', '16:10:00+02:00', '0', 'AF', '275', 'AF', '275', '2019-04-17 10:00:49', '2019-04-17 10:00:49');
INSERT INTO rs_segment VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '3', '0', 'CDG', '13:15:00+01:00', 'NRT', '09:10:00+09:00', '1', 'AF', '276', 'AF', '276', '2019-04-17 10:00:49', '2019-04-17 10:00:49');

-- ----------------------------
-- Table structure for `rs_seg_component`
-- ----------------------------
DROP TABLE IF EXISTS `rs_seg_component`;
CREATE TABLE `rs_seg_component` (
  `cache_id` varchar(50) NOT NULL,
  `itinerary_id` smallint(3) NOT NULL,
  `segment_no` smallint(2) NOT NULL,
  `direction` varchar(8) NOT NULL,
  `departure_date` varchar(10) NOT NULL,
  `schedule_id` smallint(3) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cache_id`,`itinerary_id`,`segment_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_seg_component
-- ----------------------------
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', '1', 'O', '2019-10-21', '2', '2019-04-17 09:58:20', '2019-04-17 09:58:20');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', '2', 'I', '2019-10-27', '3', '2019-04-17 09:58:20', '2019-04-17 09:58:20');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', '1', 'O', '2019-10-22', '2', '2019-04-17 09:58:20', '2019-04-17 09:58:20');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', '2', 'I', '2019-10-28', '3', '2019-04-17 09:58:20', '2019-04-17 09:58:20');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', '1', 'O', '2019-10-23', '2', '2019-04-17 09:58:20', '2019-04-17 09:58:20');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', '2', 'I', '2019-10-29', '3', '2019-04-17 09:58:20', '2019-04-17 09:58:20');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '4', '1', 'O', '2019-10-24', '2', '2019-04-17 09:58:20', '2019-04-17 09:58:20');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '4', '2', 'I', '2019-10-30', '3', '2019-04-17 09:58:20', '2019-04-17 09:58:20');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '5', '1', 'O', '2019-10-25', '2', '2019-04-17 09:58:20', '2019-04-17 09:58:20');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '5', '2', 'I', '2019-10-31', '3', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '6', '1', 'O', '2019-10-26', '2', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '6', '2', 'I', '2019-11-01', '3', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '7', '1', 'O', '2019-10-27', '1', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '7', '2', 'I', '2019-11-02', '3', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '8', '1', 'O', '2019-10-28', '1', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '8', '2', 'I', '2019-11-03', '3', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '9', '1', 'O', '2019-10-29', '1', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '9', '2', 'I', '2019-11-04', '3', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '10', '1', 'O', '2019-10-30', '1', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '10', '2', 'I', '2019-11-05', '3', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '11', '1', 'O', '2019-10-31', '1', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '11', '2', 'I', '2019-11-06', '3', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '12', '1', 'O', '2019-11-01', '1', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '12', '2', 'I', '2019-11-07', '3', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '13', '1', 'O', '2019-11-02', '1', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '13', '2', 'I', '2019-11-08', '3', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '14', '1', 'O', '2019-11-03', '1', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_seg_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '14', '2', 'I', '2019-11-09', '3', '2019-04-17 09:58:21', '2019-04-17 09:58:21');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', '1', 'O', '2019-10-20', '2', '2019-04-17 09:58:34', '2019-04-17 09:58:34');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', '2', 'I', '2019-10-27', '4', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', '1', 'O', '2019-10-21', '3', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', '2', 'I', '2019-10-28', '4', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', '1', 'O', '2019-10-22', '3', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', '2', 'I', '2019-10-29', '4', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', '1', 'O', '2019-10-23', '3', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', '2', 'I', '2019-10-30', '4', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '5', '1', 'O', '2019-10-24', '3', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '5', '2', 'I', '2019-10-31', '4', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '6', '1', 'O', '2019-10-25', '3', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '6', '2', 'I', '2019-11-01', '4', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '7', '1', 'O', '2019-10-26', '3', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '7', '2', 'I', '2019-11-02', '4', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '8', '1', 'O', '2019-10-27', '1', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '8', '2', 'I', '2019-11-03', '4', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '9', '1', 'O', '2019-10-28', '1', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '9', '2', 'I', '2019-11-04', '4', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '10', '1', 'O', '2019-10-29', '1', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '10', '2', 'I', '2019-11-05', '4', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '11', '1', 'O', '2019-10-30', '1', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '11', '2', 'I', '2019-11-06', '4', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '12', '1', 'O', '2019-10-31', '1', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '12', '2', 'I', '2019-11-07', '4', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '13', '1', 'O', '2019-11-01', '1', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '13', '2', 'I', '2019-11-08', '4', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '14', '1', 'O', '2019-11-02', '1', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '14', '2', 'I', '2019-11-09', '4', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '15', '1', 'O', '2019-11-03', '1', '2019-04-17 09:58:35', '2019-04-17 09:58:35');
INSERT INTO rs_seg_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '15', '2', 'I', '2019-11-10', '4', '2019-04-17 09:58:36', '2019-04-17 09:58:36');
INSERT INTO rs_seg_component VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', '1', 'O', '2019-05-10', '1', '2019-04-17 10:00:04', '2019-04-17 10:00:04');
INSERT INTO rs_seg_component VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', '2', 'I', '2019-05-13', '2', '2019-04-17 10:00:04', '2019-04-17 10:00:04');
INSERT INTO rs_seg_component VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', '1', 'O', '2019-05-09', '1', '2019-04-17 10:00:07', '2019-04-17 10:00:07');
INSERT INTO rs_seg_component VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', '2', 'I', '2019-05-13', '2', '2019-04-17 10:00:07', '2019-04-17 10:00:07');
INSERT INTO rs_seg_component VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', '1', 'O', '2019-05-08', '1', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_seg_component VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', '2', 'I', '2019-05-13', '2', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_seg_component VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', '1', 'O', '2019-05-07', '1', '2019-04-17 10:00:14', '2019-04-17 10:00:14');
INSERT INTO rs_seg_component VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', '2', 'I', '2019-05-13', '2', '2019-04-17 10:00:14', '2019-04-17 10:00:14');
INSERT INTO rs_seg_component VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', '1', 'O', '2019-05-06', '1', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_seg_component VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', '2', 'I', '2019-05-13', '2', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', '1', 'O', '2019-10-24', '2', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', '2', 'I', '2019-10-27', '3', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', '1', 'O', '2019-10-25', '2', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', '2', 'I', '2019-10-28', '3', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', '1', 'O', '2019-10-26', '2', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', '2', 'I', '2019-10-29', '3', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '4', '1', 'O', '2019-10-27', '1', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '4', '2', 'I', '2019-10-30', '3', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '5', '1', 'O', '2019-10-28', '1', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '5', '2', 'I', '2019-10-31', '3', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '6', '1', 'O', '2019-10-29', '1', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '6', '2', 'I', '2019-11-01', '3', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '7', '1', 'O', '2019-10-30', '1', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '7', '2', 'I', '2019-11-02', '3', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '8', '1', 'O', '2019-10-31', '1', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '8', '2', 'I', '2019-11-03', '3', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '9', '1', 'O', '2019-11-01', '1', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '9', '2', 'I', '2019-11-04', '3', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '10', '1', 'O', '2019-11-02', '1', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '10', '2', 'I', '2019-11-05', '3', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '11', '1', 'O', '2019-11-03', '1', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '11', '2', 'I', '2019-11-06', '3', '2019-04-17 10:00:22', '2019-04-17 10:00:22');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', '1', 'O', '2019-10-23', '2', '2019-04-17 10:00:36', '2019-04-17 10:00:36');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', '2', 'I', '2019-10-27', '3', '2019-04-17 10:00:36', '2019-04-17 10:00:36');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', '1', 'O', '2019-10-24', '2', '2019-04-17 10:00:36', '2019-04-17 10:00:36');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', '2', 'I', '2019-10-28', '3', '2019-04-17 10:00:36', '2019-04-17 10:00:36');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', '1', 'O', '2019-10-25', '2', '2019-04-17 10:00:36', '2019-04-17 10:00:36');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', '2', 'I', '2019-10-29', '3', '2019-04-17 10:00:36', '2019-04-17 10:00:36');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '4', '1', 'O', '2019-10-26', '2', '2019-04-17 10:00:36', '2019-04-17 10:00:36');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '4', '2', 'I', '2019-10-30', '3', '2019-04-17 10:00:36', '2019-04-17 10:00:36');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '5', '1', 'O', '2019-10-27', '1', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '5', '2', 'I', '2019-10-31', '3', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '6', '1', 'O', '2019-10-28', '1', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '6', '2', 'I', '2019-11-01', '3', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '7', '1', 'O', '2019-10-29', '1', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '7', '2', 'I', '2019-11-02', '3', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '8', '1', 'O', '2019-10-30', '1', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '8', '2', 'I', '2019-11-03', '3', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '9', '1', 'O', '2019-10-31', '1', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '9', '2', 'I', '2019-11-04', '3', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '10', '1', 'O', '2019-11-01', '1', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '10', '2', 'I', '2019-11-05', '3', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '11', '1', 'O', '2019-11-02', '1', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '11', '2', 'I', '2019-11-06', '3', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '12', '1', 'O', '2019-11-03', '1', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_seg_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '12', '2', 'I', '2019-11-07', '3', '2019-04-17 10:00:37', '2019-04-17 10:00:37');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '1', '1', 'O', '2019-10-22', '2', '2019-04-17 10:00:49', '2019-04-17 10:00:49');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '1', '2', 'I', '2019-10-27', '3', '2019-04-17 10:00:49', '2019-04-17 10:00:49');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '2', '1', 'O', '2019-10-23', '2', '2019-04-17 10:00:49', '2019-04-17 10:00:49');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '2', '2', 'I', '2019-10-28', '3', '2019-04-17 10:00:49', '2019-04-17 10:00:49');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '3', '1', 'O', '2019-10-24', '2', '2019-04-17 10:00:49', '2019-04-17 10:00:49');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '3', '2', 'I', '2019-10-29', '3', '2019-04-17 10:00:49', '2019-04-17 10:00:49');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '4', '1', 'O', '2019-10-25', '2', '2019-04-17 10:00:49', '2019-04-17 10:00:49');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '4', '2', 'I', '2019-10-30', '3', '2019-04-17 10:00:49', '2019-04-17 10:00:49');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '5', '1', 'O', '2019-10-26', '2', '2019-04-17 10:00:49', '2019-04-17 10:00:49');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '5', '2', 'I', '2019-10-31', '3', '2019-04-17 10:00:49', '2019-04-17 10:00:49');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '6', '1', 'O', '2019-10-27', '1', '2019-04-17 10:00:49', '2019-04-17 10:00:49');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '6', '2', 'I', '2019-11-01', '3', '2019-04-17 10:00:49', '2019-04-17 10:00:49');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '7', '1', 'O', '2019-10-28', '1', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '7', '2', 'I', '2019-11-02', '3', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '8', '1', 'O', '2019-10-29', '1', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '8', '2', 'I', '2019-11-03', '3', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '9', '1', 'O', '2019-10-30', '1', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '9', '2', 'I', '2019-11-04', '3', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '10', '1', 'O', '2019-10-31', '1', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '10', '2', 'I', '2019-11-05', '3', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '11', '1', 'O', '2019-11-01', '1', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '11', '2', 'I', '2019-11-06', '3', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '12', '1', 'O', '2019-11-02', '1', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '12', '2', 'I', '2019-11-07', '3', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '13', '1', 'O', '2019-11-03', '1', '2019-04-17 10:00:50', '2019-04-17 10:00:50');
INSERT INTO rs_seg_component VALUES ('20190417100047_AFNRTCDG_B05Y21100AA1', '13', '2', 'I', '2019-11-08', '3', '2019-04-17 10:00:50', '2019-04-17 10:00:50');

-- ----------------------------
-- Table structure for `rs_tax`
-- ----------------------------
DROP TABLE IF EXISTS `rs_tax`;
CREATE TABLE `rs_tax` (
  `cache_id` varchar(50) NOT NULL,
  `tax_id` smallint(3) NOT NULL,
  `code` varchar(3) NOT NULL,
  `amount` varchar(10) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cache_id`,`tax_id`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_tax
-- ----------------------------
INSERT INTO rs_tax VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', 'YRI', '7300', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_tax VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', 'SW', '2090', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_tax VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', 'YRI', '7300', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_tax VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '4', 'YQI', '1500', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_tax VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '5', 'FR7', '1490', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_tax VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '6', 'FR', '1050', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_tax VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '7', 'IZ', '580', '2019-04-17 09:58:23', '2019-04-17 09:58:23');
INSERT INTO rs_tax VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '8', 'TK', '1000', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '9', 'QX', '3650', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '10', 'OI', '520', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '11', 'YQI', '1500', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', 'YRI', '7300', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', 'SW', '2090', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', 'YRI', '7300', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', 'YQI', '1500', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '5', 'FR7', '1490', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '6', 'FR', '1050', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '7', 'IZ', '580', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '8', 'TK', '1000', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '9', 'QX', '3650', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '10', 'OI', '520', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '11', 'YQI', '1500', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', 'YRI', '7300', '2019-04-17 10:00:04', '2019-04-17 10:00:04');
INSERT INTO rs_tax VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '2', 'SW', '2090', '2019-04-17 10:00:04', '2019-04-17 10:00:04');
INSERT INTO rs_tax VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '3', 'YRI', '7300', '2019-04-17 10:00:04', '2019-04-17 10:00:04');
INSERT INTO rs_tax VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '4', 'YQI', '1500', '2019-04-17 10:00:04', '2019-04-17 10:00:04');
INSERT INTO rs_tax VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '5', 'FR7', '1490', '2019-04-17 10:00:04', '2019-04-17 10:00:04');
INSERT INTO rs_tax VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '6', 'FR', '1050', '2019-04-17 10:00:04', '2019-04-17 10:00:04');
INSERT INTO rs_tax VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '7', 'IZ', '580', '2019-04-17 10:00:04', '2019-04-17 10:00:04');
INSERT INTO rs_tax VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '8', 'TK', '1000', '2019-04-17 10:00:04', '2019-04-17 10:00:04');
INSERT INTO rs_tax VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '9', 'QX', '3650', '2019-04-17 10:00:04', '2019-04-17 10:00:04');
INSERT INTO rs_tax VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '10', 'OI', '520', '2019-04-17 10:00:05', '2019-04-17 10:00:05');
INSERT INTO rs_tax VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '11', 'YQI', '1500', '2019-04-17 10:00:05', '2019-04-17 10:00:05');
INSERT INTO rs_tax VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', 'YRI', '7300', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '2', 'SW', '2090', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '3', 'YRI', '7300', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '4', 'YQI', '1500', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '5', 'FR7', '1490', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '6', 'FR', '1050', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '7', 'IZ', '580', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '8', 'TK', '1000', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '9', 'QX', '3650', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '10', 'OI', '520', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '11', 'YQI', '1500', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', 'YRI', '7300', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_tax VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '2', 'SW', '2090', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_tax VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '3', 'YRI', '7300', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_tax VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '4', 'YQI', '1500', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_tax VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '5', 'FR7', '1490', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_tax VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '6', 'FR', '1050', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_tax VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '7', 'IZ', '580', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_tax VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '8', 'TK', '1000', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_tax VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '9', 'QX', '3650', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_tax VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '10', 'OI', '520', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_tax VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '11', 'YQI', '1500', '2019-04-17 10:00:11', '2019-04-17 10:00:11');
INSERT INTO rs_tax VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', 'YRI', '7300', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '2', 'SW', '2090', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '3', 'YRI', '7300', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '4', 'YQI', '1500', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '5', 'FR7', '1490', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '6', 'FR', '1050', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '7', 'IZ', '580', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '8', 'TK', '1000', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '9', 'QX', '3650', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '10', 'OI', '520', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '11', 'YQI', '1500', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', 'YRI', '7300', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_tax VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '2', 'SW', '2090', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_tax VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '3', 'YRI', '7300', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_tax VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '4', 'YQI', '1500', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_tax VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '5', 'FR7', '1490', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_tax VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '6', 'FR', '1050', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_tax VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '7', 'IZ', '580', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_tax VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '8', 'TK', '1000', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_tax VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '9', 'QX', '3650', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_tax VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '10', 'OI', '520', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_tax VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '11', 'YQI', '1500', '2019-04-17 10:00:18', '2019-04-17 10:00:18');
INSERT INTO rs_tax VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', 'YRI', '7300', '2019-04-17 10:00:25', '2019-04-17 10:00:25');
INSERT INTO rs_tax VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', 'SW', '2090', '2019-04-17 10:00:25', '2019-04-17 10:00:25');
INSERT INTO rs_tax VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', 'YRI', '7300', '2019-04-17 10:00:25', '2019-04-17 10:00:25');
INSERT INTO rs_tax VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '4', 'YQI', '1500', '2019-04-17 10:00:25', '2019-04-17 10:00:25');
INSERT INTO rs_tax VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '5', 'FR7', '1490', '2019-04-17 10:00:25', '2019-04-17 10:00:25');
INSERT INTO rs_tax VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '6', 'FR', '1050', '2019-04-17 10:00:25', '2019-04-17 10:00:25');
INSERT INTO rs_tax VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '7', 'IZ', '580', '2019-04-17 10:00:25', '2019-04-17 10:00:25');
INSERT INTO rs_tax VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '8', 'TK', '1000', '2019-04-17 10:00:25', '2019-04-17 10:00:25');
INSERT INTO rs_tax VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '9', 'QX', '3650', '2019-04-17 10:00:25', '2019-04-17 10:00:25');
INSERT INTO rs_tax VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '10', 'OI', '520', '2019-04-17 10:00:25', '2019-04-17 10:00:25');
INSERT INTO rs_tax VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '11', 'YQI', '1500', '2019-04-17 10:00:25', '2019-04-17 10:00:25');
INSERT INTO rs_tax VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', 'YRI', '7300', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_tax VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', 'SW', '2090', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_tax VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', 'YRI', '7300', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_tax VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '4', 'YQI', '1500', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_tax VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '5', 'FR7', '1490', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_tax VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '6', 'FR', '1050', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_tax VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '7', 'IZ', '580', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_tax VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '8', 'TK', '1000', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_tax VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '9', 'QX', '3650', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_tax VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '10', 'OI', '520', '2019-04-17 10:00:39', '2019-04-17 10:00:39');
INSERT INTO rs_tax VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '11', 'YQI', '1500', '2019-04-17 10:00:39', '2019-04-17 10:00:39');

-- ----------------------------
-- Table structure for `rs_tax_component`
-- ----------------------------
DROP TABLE IF EXISTS `rs_tax_component`;
CREATE TABLE `rs_tax_component` (
  `cache_id` varchar(50) NOT NULL,
  `itinerary_id` smallint(3) NOT NULL,
  `passenger_type` varchar(3) NOT NULL,
  `tax_id` smallint(3) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cache_id`,`itinerary_id`,`passenger_type`,`tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_tax_component
-- ----------------------------
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', 'ADT', '1', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', 'ADT', '2', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', 'ADT', '3', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', 'ADT', '4', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', 'ADT', '5', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', 'ADT', '6', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', 'ADT', '7', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', 'ADT', '8', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', 'ADT', '9', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', 'ADT', '10', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '1', 'ADT', '11', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', 'ADT', '1', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', 'ADT', '2', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', 'ADT', '3', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', 'ADT', '4', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', 'ADT', '5', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', 'ADT', '6', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', 'ADT', '7', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', 'ADT', '8', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', 'ADT', '9', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', 'ADT', '10', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '2', 'ADT', '11', '2019-04-17 09:58:24', '2019-04-17 09:58:24');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', 'ADT', '1', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', 'ADT', '2', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', 'ADT', '3', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', 'ADT', '4', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', 'ADT', '5', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', 'ADT', '6', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', 'ADT', '7', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', 'ADT', '8', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', 'ADT', '9', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', 'ADT', '10', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '3', 'ADT', '11', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '4', 'ADT', '1', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '4', 'ADT', '2', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '4', 'ADT', '3', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '4', 'ADT', '4', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '4', 'ADT', '5', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '4', 'ADT', '6', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '4', 'ADT', '7', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '4', 'ADT', '8', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '4', 'ADT', '9', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '4', 'ADT', '10', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '4', 'ADT', '11', '2019-04-17 09:58:25', '2019-04-17 09:58:25');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '5', 'ADT', '1', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '5', 'ADT', '2', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '5', 'ADT', '3', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '5', 'ADT', '4', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '5', 'ADT', '5', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '5', 'ADT', '6', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '5', 'ADT', '7', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '5', 'ADT', '8', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '5', 'ADT', '9', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '5', 'ADT', '10', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '5', 'ADT', '11', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '6', 'ADT', '1', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '6', 'ADT', '2', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '6', 'ADT', '3', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '6', 'ADT', '4', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '6', 'ADT', '5', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '6', 'ADT', '6', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '6', 'ADT', '7', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '6', 'ADT', '8', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '6', 'ADT', '9', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '6', 'ADT', '10', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '6', 'ADT', '11', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '7', 'ADT', '1', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '7', 'ADT', '2', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '7', 'ADT', '3', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '7', 'ADT', '4', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '7', 'ADT', '5', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '7', 'ADT', '6', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '7', 'ADT', '7', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '7', 'ADT', '8', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '7', 'ADT', '9', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '7', 'ADT', '10', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '7', 'ADT', '11', '2019-04-17 09:58:26', '2019-04-17 09:58:26');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '8', 'ADT', '1', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '8', 'ADT', '2', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '8', 'ADT', '3', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '8', 'ADT', '4', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '8', 'ADT', '5', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '8', 'ADT', '6', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '8', 'ADT', '7', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '8', 'ADT', '8', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '8', 'ADT', '9', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '8', 'ADT', '10', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '8', 'ADT', '11', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '9', 'ADT', '1', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '9', 'ADT', '2', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '9', 'ADT', '3', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '9', 'ADT', '4', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '9', 'ADT', '5', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '9', 'ADT', '6', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '9', 'ADT', '7', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '9', 'ADT', '8', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '9', 'ADT', '9', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '9', 'ADT', '10', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '9', 'ADT', '11', '2019-04-17 09:58:27', '2019-04-17 09:58:27');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '10', 'ADT', '1', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '10', 'ADT', '2', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '10', 'ADT', '3', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '10', 'ADT', '4', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '10', 'ADT', '5', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '10', 'ADT', '6', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '10', 'ADT', '7', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '10', 'ADT', '8', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '10', 'ADT', '9', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '10', 'ADT', '10', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '10', 'ADT', '11', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '11', 'ADT', '1', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '11', 'ADT', '2', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '11', 'ADT', '3', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '11', 'ADT', '4', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '11', 'ADT', '5', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '11', 'ADT', '6', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '11', 'ADT', '7', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '11', 'ADT', '8', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '11', 'ADT', '9', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '11', 'ADT', '10', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '11', 'ADT', '11', '2019-04-17 09:58:28', '2019-04-17 09:58:28');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '12', 'ADT', '1', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '12', 'ADT', '2', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '12', 'ADT', '3', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '12', 'ADT', '4', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '12', 'ADT', '5', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '12', 'ADT', '6', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '12', 'ADT', '7', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '12', 'ADT', '8', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '12', 'ADT', '9', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '12', 'ADT', '10', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '12', 'ADT', '11', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '13', 'ADT', '1', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '13', 'ADT', '2', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '13', 'ADT', '3', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '13', 'ADT', '4', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '13', 'ADT', '5', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '13', 'ADT', '6', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '13', 'ADT', '7', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '13', 'ADT', '8', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '13', 'ADT', '9', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '13', 'ADT', '10', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '13', 'ADT', '11', '2019-04-17 09:58:29', '2019-04-17 09:58:29');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '14', 'ADT', '1', '2019-04-17 09:58:30', '2019-04-17 09:58:30');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '14', 'ADT', '2', '2019-04-17 09:58:30', '2019-04-17 09:58:30');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '14', 'ADT', '3', '2019-04-17 09:58:30', '2019-04-17 09:58:30');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '14', 'ADT', '4', '2019-04-17 09:58:30', '2019-04-17 09:58:30');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '14', 'ADT', '5', '2019-04-17 09:58:30', '2019-04-17 09:58:30');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '14', 'ADT', '6', '2019-04-17 09:58:30', '2019-04-17 09:58:30');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '14', 'ADT', '7', '2019-04-17 09:58:30', '2019-04-17 09:58:30');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '14', 'ADT', '8', '2019-04-17 09:58:30', '2019-04-17 09:58:30');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '14', 'ADT', '9', '2019-04-17 09:58:30', '2019-04-17 09:58:30');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '14', 'ADT', '10', '2019-04-17 09:58:30', '2019-04-17 09:58:30');
INSERT INTO rs_tax_component VALUES ('20190417095819_AFNRTCDG_B06Y21100AA1', '14', 'ADT', '11', '2019-04-17 09:58:30', '2019-04-17 09:58:30');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', 'ADT', '1', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', 'ADT', '2', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', 'ADT', '3', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', 'ADT', '4', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', 'ADT', '5', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', 'ADT', '6', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', 'ADT', '7', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', 'ADT', '8', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', 'ADT', '9', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', 'ADT', '10', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '1', 'ADT', '11', '2019-04-17 09:58:38', '2019-04-17 09:58:38');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', 'ADT', '1', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', 'ADT', '2', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', 'ADT', '3', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', 'ADT', '4', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', 'ADT', '5', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', 'ADT', '6', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', 'ADT', '7', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', 'ADT', '8', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', 'ADT', '9', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', 'ADT', '10', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '2', 'ADT', '11', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', 'ADT', '1', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', 'ADT', '2', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', 'ADT', '3', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', 'ADT', '4', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', 'ADT', '5', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', 'ADT', '6', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', 'ADT', '7', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', 'ADT', '8', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', 'ADT', '9', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', 'ADT', '10', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '3', 'ADT', '11', '2019-04-17 09:58:39', '2019-04-17 09:58:39');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', 'ADT', '1', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', 'ADT', '2', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', 'ADT', '3', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', 'ADT', '4', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', 'ADT', '5', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', 'ADT', '6', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', 'ADT', '7', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', 'ADT', '8', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', 'ADT', '9', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', 'ADT', '10', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '4', 'ADT', '11', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '5', 'ADT', '1', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '5', 'ADT', '2', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '5', 'ADT', '3', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '5', 'ADT', '4', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '5', 'ADT', '5', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '5', 'ADT', '6', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '5', 'ADT', '7', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '5', 'ADT', '8', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '5', 'ADT', '9', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '5', 'ADT', '10', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '5', 'ADT', '11', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '6', 'ADT', '1', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '6', 'ADT', '2', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '6', 'ADT', '3', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '6', 'ADT', '4', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '6', 'ADT', '5', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '6', 'ADT', '6', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '6', 'ADT', '7', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '6', 'ADT', '8', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '6', 'ADT', '9', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '6', 'ADT', '10', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '6', 'ADT', '11', '2019-04-17 09:58:40', '2019-04-17 09:58:40');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '7', 'ADT', '1', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '7', 'ADT', '2', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '7', 'ADT', '3', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '7', 'ADT', '4', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '7', 'ADT', '5', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '7', 'ADT', '6', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '7', 'ADT', '7', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '7', 'ADT', '8', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '7', 'ADT', '9', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '7', 'ADT', '10', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '7', 'ADT', '11', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '8', 'ADT', '1', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '8', 'ADT', '2', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '8', 'ADT', '3', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '8', 'ADT', '4', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '8', 'ADT', '5', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '8', 'ADT', '6', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '8', 'ADT', '7', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '8', 'ADT', '8', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '8', 'ADT', '9', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '8', 'ADT', '10', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '8', 'ADT', '11', '2019-04-17 09:58:41', '2019-04-17 09:58:41');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '9', 'ADT', '1', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '9', 'ADT', '2', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '9', 'ADT', '3', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '9', 'ADT', '4', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '9', 'ADT', '5', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '9', 'ADT', '6', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '9', 'ADT', '7', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '9', 'ADT', '8', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '9', 'ADT', '9', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '9', 'ADT', '10', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '9', 'ADT', '11', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '10', 'ADT', '1', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '10', 'ADT', '2', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '10', 'ADT', '3', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '10', 'ADT', '4', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '10', 'ADT', '5', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '10', 'ADT', '6', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '10', 'ADT', '7', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '10', 'ADT', '8', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '10', 'ADT', '9', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '10', 'ADT', '10', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '10', 'ADT', '11', '2019-04-17 09:58:42', '2019-04-17 09:58:42');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '11', 'ADT', '1', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '11', 'ADT', '2', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '11', 'ADT', '3', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '11', 'ADT', '4', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '11', 'ADT', '5', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '11', 'ADT', '6', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '11', 'ADT', '7', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '11', 'ADT', '8', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '11', 'ADT', '9', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '11', 'ADT', '10', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '11', 'ADT', '11', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '12', 'ADT', '1', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '12', 'ADT', '2', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '12', 'ADT', '3', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '12', 'ADT', '4', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '12', 'ADT', '5', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '12', 'ADT', '6', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '12', 'ADT', '7', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '12', 'ADT', '8', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '12', 'ADT', '9', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '12', 'ADT', '10', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '12', 'ADT', '11', '2019-04-17 09:58:43', '2019-04-17 09:58:43');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '13', 'ADT', '1', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '13', 'ADT', '2', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '13', 'ADT', '3', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '13', 'ADT', '4', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '13', 'ADT', '5', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '13', 'ADT', '6', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '13', 'ADT', '7', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '13', 'ADT', '8', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '13', 'ADT', '9', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '13', 'ADT', '10', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '13', 'ADT', '11', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '14', 'ADT', '1', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '14', 'ADT', '2', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '14', 'ADT', '3', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '14', 'ADT', '4', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '14', 'ADT', '5', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '14', 'ADT', '6', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '14', 'ADT', '7', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '14', 'ADT', '8', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '14', 'ADT', '9', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '14', 'ADT', '10', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '14', 'ADT', '11', '2019-04-17 09:58:44', '2019-04-17 09:58:44');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '15', 'ADT', '1', '2019-04-17 09:58:45', '2019-04-17 09:58:45');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '15', 'ADT', '2', '2019-04-17 09:58:45', '2019-04-17 09:58:45');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '15', 'ADT', '3', '2019-04-17 09:58:45', '2019-04-17 09:58:45');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '15', 'ADT', '4', '2019-04-17 09:58:45', '2019-04-17 09:58:45');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '15', 'ADT', '5', '2019-04-17 09:58:45', '2019-04-17 09:58:45');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '15', 'ADT', '6', '2019-04-17 09:58:45', '2019-04-17 09:58:45');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '15', 'ADT', '7', '2019-04-17 09:58:45', '2019-04-17 09:58:45');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '15', 'ADT', '8', '2019-04-17 09:58:45', '2019-04-17 09:58:45');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '15', 'ADT', '9', '2019-04-17 09:58:45', '2019-04-17 09:58:45');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '15', 'ADT', '10', '2019-04-17 09:58:45', '2019-04-17 09:58:45');
INSERT INTO rs_tax_component VALUES ('20190417095832_AFNRTCDG_B07Y21100AA1', '15', 'ADT', '11', '2019-04-17 09:58:45', '2019-04-17 09:58:45');
INSERT INTO rs_tax_component VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', 'ADT', '1', '2019-04-17 10:00:05', '2019-04-17 10:00:05');
INSERT INTO rs_tax_component VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', 'ADT', '2', '2019-04-17 10:00:05', '2019-04-17 10:00:05');
INSERT INTO rs_tax_component VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', 'ADT', '3', '2019-04-17 10:00:05', '2019-04-17 10:00:05');
INSERT INTO rs_tax_component VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', 'ADT', '4', '2019-04-17 10:00:05', '2019-04-17 10:00:05');
INSERT INTO rs_tax_component VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', 'ADT', '5', '2019-04-17 10:00:05', '2019-04-17 10:00:05');
INSERT INTO rs_tax_component VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', 'ADT', '6', '2019-04-17 10:00:05', '2019-04-17 10:00:05');
INSERT INTO rs_tax_component VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', 'ADT', '7', '2019-04-17 10:00:05', '2019-04-17 10:00:05');
INSERT INTO rs_tax_component VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', 'ADT', '8', '2019-04-17 10:00:05', '2019-04-17 10:00:05');
INSERT INTO rs_tax_component VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', 'ADT', '9', '2019-04-17 10:00:05', '2019-04-17 10:00:05');
INSERT INTO rs_tax_component VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', 'ADT', '10', '2019-04-17 10:00:05', '2019-04-17 10:00:05');
INSERT INTO rs_tax_component VALUES ('20190417100002_AFNRTCDG_A03Y21100AA1', '1', 'ADT', '11', '2019-04-17 10:00:05', '2019-04-17 10:00:05');
INSERT INTO rs_tax_component VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', 'ADT', '1', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax_component VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', 'ADT', '2', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax_component VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', 'ADT', '3', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax_component VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', 'ADT', '4', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax_component VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', 'ADT', '5', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax_component VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', 'ADT', '6', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax_component VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', 'ADT', '7', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax_component VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', 'ADT', '8', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax_component VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', 'ADT', '9', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax_component VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', 'ADT', '10', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax_component VALUES ('20190417100006_AFNRTCDG_A04Y21100AA1', '1', 'ADT', '11', '2019-04-17 10:00:08', '2019-04-17 10:00:08');
INSERT INTO rs_tax_component VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', 'ADT', '1', '2019-04-17 10:00:12', '2019-04-17 10:00:12');
INSERT INTO rs_tax_component VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', 'ADT', '2', '2019-04-17 10:00:12', '2019-04-17 10:00:12');
INSERT INTO rs_tax_component VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', 'ADT', '3', '2019-04-17 10:00:12', '2019-04-17 10:00:12');
INSERT INTO rs_tax_component VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', 'ADT', '4', '2019-04-17 10:00:12', '2019-04-17 10:00:12');
INSERT INTO rs_tax_component VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', 'ADT', '5', '2019-04-17 10:00:12', '2019-04-17 10:00:12');
INSERT INTO rs_tax_component VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', 'ADT', '6', '2019-04-17 10:00:12', '2019-04-17 10:00:12');
INSERT INTO rs_tax_component VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', 'ADT', '7', '2019-04-17 10:00:12', '2019-04-17 10:00:12');
INSERT INTO rs_tax_component VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', 'ADT', '8', '2019-04-17 10:00:12', '2019-04-17 10:00:12');
INSERT INTO rs_tax_component VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', 'ADT', '9', '2019-04-17 10:00:12', '2019-04-17 10:00:12');
INSERT INTO rs_tax_component VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', 'ADT', '10', '2019-04-17 10:00:12', '2019-04-17 10:00:12');
INSERT INTO rs_tax_component VALUES ('20190417100010_AFNRTCDG_A05Y21100AA1', '1', 'ADT', '11', '2019-04-17 10:00:12', '2019-04-17 10:00:12');
INSERT INTO rs_tax_component VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', 'ADT', '1', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax_component VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', 'ADT', '2', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax_component VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', 'ADT', '3', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax_component VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', 'ADT', '4', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax_component VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', 'ADT', '5', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax_component VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', 'ADT', '6', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax_component VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', 'ADT', '7', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax_component VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', 'ADT', '8', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax_component VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', 'ADT', '9', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax_component VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', 'ADT', '10', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax_component VALUES ('20190417100013_AFNRTCDG_A06Y21100AA1', '1', 'ADT', '11', '2019-04-17 10:00:15', '2019-04-17 10:00:15');
INSERT INTO rs_tax_component VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', 'ADT', '1', '2019-04-17 10:00:19', '2019-04-17 10:00:19');
INSERT INTO rs_tax_component VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', 'ADT', '2', '2019-04-17 10:00:19', '2019-04-17 10:00:19');
INSERT INTO rs_tax_component VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', 'ADT', '3', '2019-04-17 10:00:19', '2019-04-17 10:00:19');
INSERT INTO rs_tax_component VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', 'ADT', '4', '2019-04-17 10:00:19', '2019-04-17 10:00:19');
INSERT INTO rs_tax_component VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', 'ADT', '5', '2019-04-17 10:00:19', '2019-04-17 10:00:19');
INSERT INTO rs_tax_component VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', 'ADT', '6', '2019-04-17 10:00:19', '2019-04-17 10:00:19');
INSERT INTO rs_tax_component VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', 'ADT', '7', '2019-04-17 10:00:19', '2019-04-17 10:00:19');
INSERT INTO rs_tax_component VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', 'ADT', '8', '2019-04-17 10:00:19', '2019-04-17 10:00:19');
INSERT INTO rs_tax_component VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', 'ADT', '9', '2019-04-17 10:00:19', '2019-04-17 10:00:19');
INSERT INTO rs_tax_component VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', 'ADT', '10', '2019-04-17 10:00:19', '2019-04-17 10:00:19');
INSERT INTO rs_tax_component VALUES ('20190417100016_AFNRTCDG_A07Y21100AA1', '1', 'ADT', '11', '2019-04-17 10:00:19', '2019-04-17 10:00:19');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', 'ADT', '1', '2019-04-17 10:00:26', '2019-04-17 10:00:26');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', 'ADT', '2', '2019-04-17 10:00:26', '2019-04-17 10:00:26');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', 'ADT', '3', '2019-04-17 10:00:26', '2019-04-17 10:00:26');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', 'ADT', '4', '2019-04-17 10:00:26', '2019-04-17 10:00:26');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', 'ADT', '5', '2019-04-17 10:00:26', '2019-04-17 10:00:26');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', 'ADT', '6', '2019-04-17 10:00:26', '2019-04-17 10:00:26');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', 'ADT', '7', '2019-04-17 10:00:26', '2019-04-17 10:00:26');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', 'ADT', '8', '2019-04-17 10:00:26', '2019-04-17 10:00:26');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', 'ADT', '9', '2019-04-17 10:00:26', '2019-04-17 10:00:26');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', 'ADT', '10', '2019-04-17 10:00:26', '2019-04-17 10:00:26');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '1', 'ADT', '11', '2019-04-17 10:00:26', '2019-04-17 10:00:26');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', 'ADT', '1', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', 'ADT', '2', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', 'ADT', '3', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', 'ADT', '4', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', 'ADT', '5', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', 'ADT', '6', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', 'ADT', '7', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', 'ADT', '8', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', 'ADT', '9', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', 'ADT', '10', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '2', 'ADT', '11', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', 'ADT', '1', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', 'ADT', '2', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', 'ADT', '3', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', 'ADT', '4', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', 'ADT', '5', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', 'ADT', '6', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', 'ADT', '7', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', 'ADT', '8', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', 'ADT', '9', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', 'ADT', '10', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '3', 'ADT', '11', '2019-04-17 10:00:27', '2019-04-17 10:00:27');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '4', 'ADT', '1', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '4', 'ADT', '2', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '4', 'ADT', '3', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '4', 'ADT', '4', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '4', 'ADT', '5', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '4', 'ADT', '6', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '4', 'ADT', '7', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '4', 'ADT', '8', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '4', 'ADT', '9', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '4', 'ADT', '10', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '4', 'ADT', '11', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '5', 'ADT', '1', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '5', 'ADT', '2', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '5', 'ADT', '3', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '5', 'ADT', '4', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '5', 'ADT', '5', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '5', 'ADT', '6', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '5', 'ADT', '7', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '5', 'ADT', '8', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '5', 'ADT', '9', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '5', 'ADT', '10', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '5', 'ADT', '11', '2019-04-17 10:00:28', '2019-04-17 10:00:28');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '6', 'ADT', '1', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '6', 'ADT', '2', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '6', 'ADT', '3', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '6', 'ADT', '4', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '6', 'ADT', '5', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '6', 'ADT', '6', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '6', 'ADT', '7', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '6', 'ADT', '8', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '6', 'ADT', '9', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '6', 'ADT', '10', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '6', 'ADT', '11', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '7', 'ADT', '1', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '7', 'ADT', '2', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '7', 'ADT', '3', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '7', 'ADT', '4', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '7', 'ADT', '5', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '7', 'ADT', '6', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '7', 'ADT', '7', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '7', 'ADT', '8', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '7', 'ADT', '9', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '7', 'ADT', '10', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '7', 'ADT', '11', '2019-04-17 10:00:29', '2019-04-17 10:00:29');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '8', 'ADT', '1', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '8', 'ADT', '2', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '8', 'ADT', '3', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '8', 'ADT', '4', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '8', 'ADT', '5', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '8', 'ADT', '6', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '8', 'ADT', '7', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '8', 'ADT', '8', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '8', 'ADT', '9', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '8', 'ADT', '10', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '8', 'ADT', '11', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '9', 'ADT', '1', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '9', 'ADT', '2', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '9', 'ADT', '3', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '9', 'ADT', '4', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '9', 'ADT', '5', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '9', 'ADT', '6', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '9', 'ADT', '7', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '9', 'ADT', '8', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '9', 'ADT', '9', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '9', 'ADT', '10', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '9', 'ADT', '11', '2019-04-17 10:00:30', '2019-04-17 10:00:30');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '10', 'ADT', '1', '2019-04-17 10:00:31', '2019-04-17 10:00:31');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '10', 'ADT', '2', '2019-04-17 10:00:31', '2019-04-17 10:00:31');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '10', 'ADT', '3', '2019-04-17 10:00:31', '2019-04-17 10:00:31');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '10', 'ADT', '4', '2019-04-17 10:00:31', '2019-04-17 10:00:31');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '10', 'ADT', '5', '2019-04-17 10:00:31', '2019-04-17 10:00:31');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '10', 'ADT', '6', '2019-04-17 10:00:31', '2019-04-17 10:00:31');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '10', 'ADT', '7', '2019-04-17 10:00:31', '2019-04-17 10:00:31');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '10', 'ADT', '8', '2019-04-17 10:00:31', '2019-04-17 10:00:31');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '10', 'ADT', '9', '2019-04-17 10:00:31', '2019-04-17 10:00:31');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '10', 'ADT', '10', '2019-04-17 10:00:31', '2019-04-17 10:00:31');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '10', 'ADT', '11', '2019-04-17 10:00:31', '2019-04-17 10:00:31');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '11', 'ADT', '1', '2019-04-17 10:00:32', '2019-04-17 10:00:32');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '11', 'ADT', '2', '2019-04-17 10:00:32', '2019-04-17 10:00:32');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '11', 'ADT', '3', '2019-04-17 10:00:32', '2019-04-17 10:00:32');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '11', 'ADT', '4', '2019-04-17 10:00:32', '2019-04-17 10:00:32');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '11', 'ADT', '5', '2019-04-17 10:00:32', '2019-04-17 10:00:32');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '11', 'ADT', '6', '2019-04-17 10:00:32', '2019-04-17 10:00:32');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '11', 'ADT', '7', '2019-04-17 10:00:32', '2019-04-17 10:00:32');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '11', 'ADT', '8', '2019-04-17 10:00:32', '2019-04-17 10:00:32');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '11', 'ADT', '9', '2019-04-17 10:00:32', '2019-04-17 10:00:32');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '11', 'ADT', '10', '2019-04-17 10:00:32', '2019-04-17 10:00:32');
INSERT INTO rs_tax_component VALUES ('20190417100020_AFNRTCDG_B03Y21100AA1', '11', 'ADT', '11', '2019-04-17 10:00:32', '2019-04-17 10:00:32');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', 'ADT', '1', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', 'ADT', '2', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', 'ADT', '3', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', 'ADT', '4', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', 'ADT', '5', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', 'ADT', '6', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', 'ADT', '7', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', 'ADT', '8', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', 'ADT', '9', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', 'ADT', '10', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '1', 'ADT', '11', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', 'ADT', '1', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', 'ADT', '2', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', 'ADT', '3', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', 'ADT', '4', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', 'ADT', '5', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', 'ADT', '6', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', 'ADT', '7', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', 'ADT', '8', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', 'ADT', '9', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', 'ADT', '10', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '2', 'ADT', '11', '2019-04-17 10:00:40', '2019-04-17 10:00:40');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', 'ADT', '1', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', 'ADT', '2', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', 'ADT', '3', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', 'ADT', '4', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', 'ADT', '5', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', 'ADT', '6', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', 'ADT', '7', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', 'ADT', '8', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', 'ADT', '9', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', 'ADT', '10', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '3', 'ADT', '11', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '4', 'ADT', '1', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '4', 'ADT', '2', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '4', 'ADT', '3', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '4', 'ADT', '4', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '4', 'ADT', '5', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '4', 'ADT', '6', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '4', 'ADT', '7', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '4', 'ADT', '8', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '4', 'ADT', '9', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '4', 'ADT', '10', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '4', 'ADT', '11', '2019-04-17 10:00:41', '2019-04-17 10:00:41');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '5', 'ADT', '1', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '5', 'ADT', '2', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '5', 'ADT', '3', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '5', 'ADT', '4', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '5', 'ADT', '5', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '5', 'ADT', '6', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '5', 'ADT', '7', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '5', 'ADT', '8', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '5', 'ADT', '9', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '5', 'ADT', '10', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '5', 'ADT', '11', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '6', 'ADT', '1', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '6', 'ADT', '2', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '6', 'ADT', '3', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '6', 'ADT', '4', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '6', 'ADT', '5', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '6', 'ADT', '6', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '6', 'ADT', '7', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '6', 'ADT', '8', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '6', 'ADT', '9', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '6', 'ADT', '10', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '6', 'ADT', '11', '2019-04-17 10:00:42', '2019-04-17 10:00:42');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '7', 'ADT', '1', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '7', 'ADT', '2', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '7', 'ADT', '3', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '7', 'ADT', '4', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '7', 'ADT', '5', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '7', 'ADT', '6', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '7', 'ADT', '7', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '7', 'ADT', '8', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '7', 'ADT', '9', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '7', 'ADT', '10', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '7', 'ADT', '11', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '8', 'ADT', '1', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '8', 'ADT', '2', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '8', 'ADT', '3', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '8', 'ADT', '4', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '8', 'ADT', '5', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '8', 'ADT', '6', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '8', 'ADT', '7', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '8', 'ADT', '8', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '8', 'ADT', '9', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '8', 'ADT', '10', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '8', 'ADT', '11', '2019-04-17 10:00:43', '2019-04-17 10:00:43');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '9', 'ADT', '1', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '9', 'ADT', '2', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '9', 'ADT', '3', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '9', 'ADT', '4', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '9', 'ADT', '5', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '9', 'ADT', '6', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '9', 'ADT', '7', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '9', 'ADT', '8', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '9', 'ADT', '9', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '9', 'ADT', '10', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '9', 'ADT', '11', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '10', 'ADT', '1', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '10', 'ADT', '2', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '10', 'ADT', '3', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '10', 'ADT', '4', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '10', 'ADT', '5', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '10', 'ADT', '6', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '10', 'ADT', '7', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '10', 'ADT', '8', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '10', 'ADT', '9', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '10', 'ADT', '10', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '10', 'ADT', '11', '2019-04-17 10:00:44', '2019-04-17 10:00:44');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '11', 'ADT', '1', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '11', 'ADT', '2', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '11', 'ADT', '3', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '11', 'ADT', '4', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '11', 'ADT', '5', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '11', 'ADT', '6', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '11', 'ADT', '7', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '11', 'ADT', '8', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '11', 'ADT', '9', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '11', 'ADT', '10', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '11', 'ADT', '11', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '12', 'ADT', '1', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '12', 'ADT', '2', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '12', 'ADT', '3', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '12', 'ADT', '4', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '12', 'ADT', '5', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '12', 'ADT', '6', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '12', 'ADT', '7', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '12', 'ADT', '8', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '12', 'ADT', '9', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '12', 'ADT', '10', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
INSERT INTO rs_tax_component VALUES ('20190417100034_AFNRTCDG_B04Y21100AA1', '12', 'ADT', '11', '2019-04-17 10:00:45', '2019-04-17 10:00:45');
