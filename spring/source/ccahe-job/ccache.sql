/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : 127.0.0.1:3306
Source Database       : ccache

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-04-04 16:05:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for log_access
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
-- Table structure for log_cache
-- ----------------------------
DROP TABLE IF EXISTS `log_cache`;
CREATE TABLE `log_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cache_time` varchar(14) NOT NULL,
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
  `created_time` datetime NOT NULL,
  `last_updated_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_cache
-- ----------------------------

-- ----------------------------
-- Table structure for mgmt_cache_timing
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
  `created_time` datetime NOT NULL,
  `last_updated_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mgmt_cache_timing
-- ----------------------------
INSERT INTO `mgmt_cache_timing` VALUES ('1', '1', '1', '1', '1', '1', '0', '0', '01:00', null, null, '10', '20190305', '20190305');

-- ----------------------------
-- Table structure for mgmt_config
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
INSERT INTO `mgmt_config` VALUES ('622985', '1f122090', '1FQ6', 'https://sws-crt.cert.havail.sabre.com');

-- ----------------------------
-- Table structure for mgmt_user
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
-- Table structure for rq_condition
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
  `created_time` datetime NOT NULL,
  `last_updated_time` datetime NOT NULL,
  PRIMARY KEY (`cache_id`,`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rq_condition
-- ----------------------------

-- ----------------------------
-- Table structure for rq_pattern
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
  `created_time` datetime NOT NULL,
  `last_updated_time` datetime NOT NULL,
  PRIMARY KEY (`pattern_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rq_pattern
-- ----------------------------
INSERT INTO `rq_pattern` VALUES ('AFNRTCDG', 'AF', 'NRT', 'CDG', '1', '200', '1', '1', '2', '1', '1', '0', '0', null, '1', '1', '20190305', '20190305');

-- ----------------------------
-- Table structure for rq_pattern_cabin
-- ----------------------------
DROP TABLE IF EXISTS `rq_pattern_cabin`;
CREATE TABLE `rq_pattern_cabin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern_id` varchar(10) NOT NULL,
  `cabin` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pattern_id_stay_day` (`pattern_id`),
  CONSTRAINT `fk_pattern_id_cabin` FOREIGN KEY (`pattern_id`) REFERENCES `rq_pattern` (`pattern_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rq_pattern_cabin
-- ----------------------------
INSERT INTO `rq_pattern_cabin` VALUES ('6', 'AFNRTCDG', 'Y');

-- ----------------------------
-- Table structure for rq_pattern_inboundtime
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
INSERT INTO `rq_pattern_inboundtime` VALUES ('1', 'AFNRTCDG', 'A', '1200', '1900');

-- ----------------------------
-- Table structure for rq_pattern_outboundtime
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
INSERT INTO `rq_pattern_outboundtime` VALUES ('1', 'AFNRTCDG', 'A', '0700', '1159');

-- ----------------------------
-- Table structure for rq_pattern_staydays
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
INSERT INTO `rq_pattern_staydays` VALUES ('1', 'AFNRTCDG', '3', '1');
INSERT INTO `rq_pattern_staydays` VALUES ('2', 'AFNRTCDG', '4', '2');
INSERT INTO `rq_pattern_staydays` VALUES ('3', 'AFNRTCDG', '5', '3');
INSERT INTO `rq_pattern_staydays` VALUES ('4', 'AFNRTCDG', '6', '4');
INSERT INTO `rq_pattern_staydays` VALUES ('5', 'AFNRTCDG', '7', '5');

-- ----------------------------
-- Table structure for rs_farebasis
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
  `created_time` datetime NOT NULL,
  `last_updated_time` datetime NOT NULL,
  PRIMARY KEY (`cache_id`,`itinerary_id`,`passenger_type`,`segment_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_farebasis
-- ----------------------------

-- ----------------------------
-- Table structure for rs_fare_component
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
  `created_time` datetime NOT NULL,
  `last_updated_time` datetime NOT NULL,
  PRIMARY KEY (`cache_id`,`itinerary_id`,`passenger_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_fare_component
-- ----------------------------

-- ----------------------------
-- Table structure for rs_hidden_stop
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
  `created_time` datetime NOT NULL,
  `last_updated_time` datetime NOT NULL,
  PRIMARY KEY (`cache_id`,`schedule_id`,`hidden_stop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_hidden_stop
-- ----------------------------

-- ----------------------------
-- Table structure for rs_segment
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
  `created_time` datetime NOT NULL,
  `last_updated_time` datetime NOT NULL,
  PRIMARY KEY (`cache_id`,`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_segment
-- ----------------------------

-- ----------------------------
-- Table structure for rs_seg_component
-- ----------------------------
DROP TABLE IF EXISTS `rs_seg_component`;
CREATE TABLE `rs_seg_component` (
  `cache_id` varchar(50) NOT NULL,
  `itinerary_id` smallint(3) NOT NULL,
  `segment_no` smallint(2) NOT NULL,
  `direction` varchar(8) NOT NULL,
  `departure_date` varchar(10) NOT NULL,
  `schedule_id` smallint(3) NOT NULL,
  `created_time` datetime NOT NULL,
  `last_updated_time` datetime NOT NULL,
  PRIMARY KEY (`cache_id`,`itinerary_id`,`segment_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_seg_component
-- ----------------------------

-- ----------------------------
-- Table structure for rs_tax
-- ----------------------------
DROP TABLE IF EXISTS `rs_tax`;
CREATE TABLE `rs_tax` (
  `cache_id` varchar(50) NOT NULL,
  `tax_id` smallint(3) NOT NULL,
  `code` varchar(3) NOT NULL,
  `amount` varchar(10) NOT NULL,
  `created_time` datetime NOT NULL,
  `last_updated_time` datetime NOT NULL,
  PRIMARY KEY (`cache_id`,`tax_id`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_tax
-- ----------------------------

-- ----------------------------
-- Table structure for rs_tax_component
-- ----------------------------
DROP TABLE IF EXISTS `rs_tax_component`;
CREATE TABLE `rs_tax_component` (
  `cache_id` varchar(50) NOT NULL,
  `itinerary_id` smallint(3) NOT NULL,
  `passenger_type` varchar(3) NOT NULL,
  `tax_id` smallint(3) NOT NULL,
  `created_time` datetime NOT NULL,
  `last_updated_time` datetime NOT NULL,
  PRIMARY KEY (`cache_id`,`itinerary_id`,`passenger_type`,`tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_tax_component
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of file_info
-- ----------------------------
INSERT INTO file_info VALUES ('2019-03-12 10:12:05', 'downloadFile/CalendarCache_20190312_101205_001.zip', '3');
INSERT INTO file_info VALUES ('2019-03-26 15:28:16', 'downloadFile/CalendarCache_20190326_152816_001.zip', '4');
