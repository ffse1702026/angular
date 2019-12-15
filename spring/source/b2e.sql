/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : b2e

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-04-23 14:00:16
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `mst_airport`
-- ----------------------------
DROP TABLE IF EXISTS `mst_airport`;
CREATE TABLE `mst_airport` (
  `id` int(11) NOT NULL,
  `airport_code` varchar(3) NOT NULL,
  `city_code` varchar(3) NOT NULL,
  `airport_name_jp` varchar(50) DEFAULT NULL,
  `airport_name_en` varchar(50) DEFAULT NULL,
  `yobi1` varchar(50) DEFAULT NULL,
  `yobi2` varchar(50) DEFAULT NULL,
  `yobi3` varchar(50) DEFAULT NULL,
  `yobi4` varchar(50) DEFAULT NULL,
  `yobi5` varchar(50) DEFAULT NULL,
  `delete_flg` int(11) NOT NULL COMMENT '0: 有効\r\n1: 無効',
  `created_date` timestamp NULL DEFAULT NULL,
  `last_updated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`airport_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mst_airport
-- ----------------------------
INSERT INTO mst_airport VALUES ('1', 'JAO', '1', 'oto woa', 'cmm', '1', '1', '1', '1', '1', '0', '2019-04-20 13:06:32', '2019-04-20 13:06:37');
INSERT INTO mst_airport VALUES ('2', 'JAX', '2', 'nucal', 'o to san ', '1', '1', '1', '1', '1', '0', '2019-04-20 13:07:03', '2019-04-20 13:07:07');
INSERT INTO mst_airport VALUES ('3', 'BAV', '1', 'Culalumpua', 'Culalumpua', '1', '1', '1', '1', '1', '0', '2019-04-22 14:35:28', '2019-04-22 14:35:31');

-- ----------------------------
-- Table structure for `mst_alliance`
-- ----------------------------
DROP TABLE IF EXISTS `mst_alliance`;
CREATE TABLE `mst_alliance` (
  `id` int(11) NOT NULL,
  `carrier_code` varchar(2) NOT NULL,
  `alliance_code` varchar(1) NOT NULL COMMENT 'A: Star Alliance\r\nO: One World\r\nS: Sky Team',
  `delete_flg` int(11) NOT NULL COMMENT '0: 有効\r\n1: 無効',
  `created_date` timestamp NULL DEFAULT NULL,
  `last_updated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`carrier_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mst_alliance
-- ----------------------------

-- ----------------------------
-- Table structure for `mst_carrier`
-- ----------------------------
DROP TABLE IF EXISTS `mst_carrier`;
CREATE TABLE `mst_carrier` (
  `id` int(11) NOT NULL,
  `carrier_code` varchar(2) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `carrier_name_jp` varchar(50) DEFAULT NULL,
  `carrier_name_en` varchar(50) DEFAULT NULL,
  `yobi1` varchar(50) DEFAULT NULL,
  `yobi2` varchar(50) DEFAULT NULL,
  `yobi3` varchar(50) DEFAULT NULL,
  `yobi4` varchar(50) DEFAULT NULL,
  `yobi5` varchar(50) DEFAULT NULL,
  `delete_flg` int(11) NOT NULL COMMENT '0: 有効\r\n1: 無効',
  `created_date` timestamp NULL DEFAULT NULL,
  `last_updated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`carrier_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mst_carrier
-- ----------------------------
INSERT INTO mst_carrier VALUES ('1', 'CX', '1', 'VNAIRLINE', 'VNAIRLINE', '1', '1', '1', '10', '1', '0', '2019-04-20 16:42:31', '2019-04-20 16:42:35');
INSERT INTO mst_carrier VALUES ('2', 'CA', '2', 'VietJet', 'VietJet', '1', '1', '1', '1', '1', '0', '2019-04-20 16:43:22', '2019-04-20 16:43:25');
INSERT INTO mst_carrier VALUES ('3', 'CD', '3', 'AIR mi rate', 'AIR mi rate', '1', '1', '1', '1', '1', '0', '2019-04-22 14:34:14', '2019-04-22 14:34:18');

-- ----------------------------
-- Table structure for `mst_city`
-- ----------------------------
DROP TABLE IF EXISTS `mst_city`;
CREATE TABLE `mst_city` (
  `id` int(11) NOT NULL,
  `city_code` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `city_name_jp` varchar(50) DEFAULT NULL,
  `city_name_en` varchar(50) DEFAULT NULL,
  `yobi1` varchar(50) DEFAULT NULL,
  `yobi2` varchar(50) DEFAULT NULL,
  `yobi3` varchar(50) DEFAULT NULL,
  `yobi4` varchar(50) DEFAULT NULL,
  `yobi5` varchar(50) DEFAULT NULL,
  `delete_flg` int(11) NOT NULL COMMENT '0: 有効\r\n1: 無効',
  `created_date` timestamp NULL DEFAULT NULL,
  `last_updated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`city_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mst_city
-- ----------------------------

-- ----------------------------
-- Table structure for `mst_country`
-- ----------------------------
DROP TABLE IF EXISTS `mst_country`;
CREATE TABLE `mst_country` (
  `id` int(11) NOT NULL,
  `carrier_code` varchar(2) NOT NULL,
  `country_name_jp` varchar(50) NOT NULL,
  `carrier_name_en` varchar(50) NOT NULL,
  `yobi1` varchar(50) DEFAULT NULL,
  `yobi2` varchar(50) DEFAULT NULL,
  `yobi3` varchar(50) DEFAULT NULL,
  `yobi4` varchar(50) DEFAULT NULL,
  `yobi5` varchar(50) DEFAULT NULL,
  `delete_flg` int(11) NOT NULL COMMENT '0: 有効\r\n1: 無効',
  `created_date` timestamp NULL DEFAULT NULL,
  `last_updated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`carrier_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mst_country
-- ----------------------------

-- ----------------------------
-- Table structure for `mst_equipment`
-- ----------------------------
DROP TABLE IF EXISTS `mst_equipment`;
CREATE TABLE `mst_equipment` (
  `id` int(11) NOT NULL,
  `equipment_code` varchar(3) NOT NULL,
  `equipment_name_jp` varchar(50) NOT NULL,
  `equipment_name_en` varchar(50) NOT NULL,
  `yobi1` varchar(50) DEFAULT NULL,
  `yobi2` varchar(50) DEFAULT NULL,
  `yobi3` varchar(50) DEFAULT NULL,
  `yobi4` varchar(50) DEFAULT NULL,
  `yobi5` varchar(50) DEFAULT NULL,
  `delete_flg` int(11) NOT NULL COMMENT '0: 有効\r\n1: 無効',
  `created_date` timestamp NULL DEFAULT NULL,
  `last_updated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`equipment_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mst_equipment
-- ----------------------------

-- ----------------------------
-- Table structure for `mst_holiday`
-- ----------------------------
DROP TABLE IF EXISTS `mst_holiday`;
CREATE TABLE `mst_holiday` (
  `id` int(11) NOT NULL,
  `holiday_date` varchar(8) NOT NULL,
  `holiday_name_jp` varchar(50) NOT NULL,
  `yobi1` varchar(50) NOT NULL,
  `yobi2` varchar(50) DEFAULT NULL,
  `yobi3` varchar(50) DEFAULT NULL,
  `yobi4` varchar(50) DEFAULT NULL,
  `yobi5` varchar(50) DEFAULT NULL,
  `delete_flg` int(11) DEFAULT NULL COMMENT '0: 有効\r\n1: 無効',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_updated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`holiday_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mst_holiday
-- ----------------------------

-- ----------------------------
-- Table structure for `mst_question`
-- ----------------------------
DROP TABLE IF EXISTS `mst_question`;
CREATE TABLE `mst_question` (
  `id` int(11) NOT NULL,
  `question_code` varchar(4) NOT NULL,
  `question_content_jp` varchar(100) NOT NULL,
  `question_content_en` varchar(100) NOT NULL,
  `yobi1` varchar(100) DEFAULT NULL,
  `yobi2` varchar(100) DEFAULT NULL,
  `yobi3` varchar(100) DEFAULT NULL,
  `yobi4` varchar(100) DEFAULT NULL,
  `yobi5` varchar(100) DEFAULT NULL,
  `delete_flg` int(11) NOT NULL COMMENT '0: 有効\r\n1: 無効',
  `created_date` timestamp NULL DEFAULT NULL,
  `last_updated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`question_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mst_question
-- ----------------------------

-- ----------------------------
-- Table structure for `request_flight`
-- ----------------------------
DROP TABLE IF EXISTS `request_flight`;
CREATE TABLE `request_flight` (
  `request_id` varchar(30) NOT NULL,
  `segment_no` int(11) NOT NULL,
  `carrier` varchar(2) NOT NULL,
  `flight_number` varchar(4) NOT NULL,
  `departure_airport` varchar(3) NOT NULL,
  `departure_date` date NOT NULL,
  `departure_time` varchar(4) NOT NULL,
  `arrival_airport` varchar(3) NOT NULL,
  `arrival_date` date NOT NULL,
  `arrival_time` varchar(4) NOT NULL,
  `connection_indicator` int(11) NOT NULL COMMENT '0:インジケータ無し\r\n1:ConnectionInd=""Y"" ',
  `prefer_flight` int(11) NOT NULL COMMENT '0: チェックなし\r\n1: チェックあり',
  `created_date` timestamp NULL DEFAULT NULL,
  `last_updated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`request_id`,`segment_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of request_flight
-- ----------------------------
INSERT INTO request_flight VALUES ('10', '1', 'CX', '345', 'JAX', '2019-04-20', '1830', 'JAO', '2019-04-21', '1840', '0', '1', '2019-04-20 11:31:31', '2019-04-20 11:31:27');
INSERT INTO request_flight VALUES ('10', '2', 'CA', '213', 'JAO', '2019-04-20', '1420', 'JAX', '2019-04-20', '1930', '0', '0', '2019-04-20 11:32:54', '2019-04-20 11:32:51');
INSERT INTO request_flight VALUES ('10', '3', 'CD', '556', 'JAX', '2019-04-22', '1455', 'BAV', '2019-04-22', '1600', '0', '0', '2019-04-22 14:31:03', '2019-04-22 14:31:09');
INSERT INTO request_flight VALUES ('10', '4', 'CD', '556', 'BAV', '2019-04-22', '2000', 'JAO', '2019-04-22', '2200', '1', '0', '2019-04-22 14:32:25', '2019-04-22 14:32:21');

-- ----------------------------
-- Table structure for `request_item`
-- ----------------------------
DROP TABLE IF EXISTS `request_item`;
CREATE TABLE `request_item` (
  `request_id` varchar(30) NOT NULL,
  `agent_id` varchar(10) NOT NULL,
  `corporate_id` varchar(10) NOT NULL,
  `requestor_name` varchar(30) NOT NULL,
  `requestor_phone` varchar(15) NOT NULL,
  `to` varchar(50) NOT NULL,
  `cc` varchar(255) NOT NULL,
  `num_of_adt` int(11) NOT NULL,
  `num_of_cnn` int(11) NOT NULL,
  `num_of_ins` int(11) NOT NULL,
  `num_of_inf` int(11) NOT NULL,
  `request_type` int(11) DEFAULT NULL COMMENT '0: 見積もり\r\n1: 予約\r\n9: その他',
  `prefer_condition` int(11) NOT NULL COMMENT '0: 料金\r\n1: 日程\r\n2: 航空会社\r\n9: 特になし',
  `prefer_class` int(11) NOT NULL COMMENT '0: エコノミー\r\n1: プレミアムエコノミー\r\n2: ビジネス\r\n3: ファースト',
  `prefer_fare` int(11) NOT NULL COMMENT '0: 特になし\r\n1: 最安運賃\r\n2: 条件優先',
  `changeable` int(11) NOT NULL COMMENT '0: チェックなし\r\n1: チェックあり',
  `refundable` int(11) NOT NULL COMMENT '0: チェックなし\r\n1: チェックあり',
  `other_request` varchar(50) DEFAULT NULL,
  `free_text` varchar(255) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of request_item
-- ----------------------------
INSERT INTO request_item VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'abbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb1111111111111111111111111111111111111111111111111111111', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('10', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('11', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('12', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('13', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('14', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('15', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('16', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('17', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('18', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('19', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('20', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('21', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('22', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('23', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('24', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('25', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('26', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('27', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('28', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('29', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('3', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('30', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('31', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('32', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('33', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('34', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('35', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('36', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('37', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('38', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('39', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('4', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('40', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('41', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('42', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('43', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('44', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('45', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('46', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('47', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('48', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('49', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('5', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('50', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('51', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('52', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('53', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('54', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('55', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('56', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('57', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('58', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('59', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('6', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('60', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('61', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('62', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('63', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('64', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('65', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('66', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('67', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('68', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('69', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('7', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('70', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('71', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('72', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('73', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('74', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('75', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('76', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('77', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('78', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('79', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('8', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('80', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('81', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('82', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('83', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('84', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('85', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('86', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('87', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('88', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('89', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('9', '1', '1', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('90', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('91', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('92', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('93', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');
INSERT INTO request_item VALUES ('94', '2', '2', 'SangNX', '972886144', 'nguyenxuansang@gmail.com', 'nguyenxuansangbkdn@amial.com', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0', '0', 'hello it me, hello it me,  hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me, hello it me,', '2019-04-18 16:36:31', '2019-04-18 16:31:42');

-- ----------------------------
-- Table structure for `request_passenger`
-- ----------------------------
DROP TABLE IF EXISTS `request_passenger`;
CREATE TABLE `request_passenger` (
  `request_id` varchar(30) NOT NULL,
  `passenger_no` int(11) NOT NULL,
  `full_name_kanji` varchar(30) NOT NULL,
  `full_name_romaji` varchar(50) NOT NULL,
  `gender` varchar(1) NOT NULL COMMENT 'M:男性\r\nF:女性',
  `mileage_number` int(11) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `seat_request` varchar(10) DEFAULT NULL COMMENT '1: 特になし\r\n2: 窓側\r\n3: 通路側',
  `meal_reaquest` varchar(1) DEFAULT NULL COMMENT '1: 特にな\r\n2: 野菜職(乳製品、卵を含まない)',
  `passport_number` varchar(3) DEFAULT NULL,
  `passport_valid_date` date DEFAULT NULL,
  `nationality` varchar(10) DEFAULT NULL,
  `issued_country` varchar(10) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `last_updated_date` timestamp NULL DEFAULT NULL,
  `passenger_type` int(1) DEFAULT NULL,
  PRIMARY KEY (`request_id`,`passenger_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of request_passenger
-- ----------------------------
INSERT INTO request_passenger VALUES ('10', '1', '1', '1', 'M', '123456', '2019-04-20', '1', '1', '123', '2019-04-13', 'JP', 'JP', '2019-04-20 11:34:01', '2019-04-20 11:34:05', '4');
INSERT INTO request_passenger VALUES ('10', '2', 'asan', 'usu', 'F', '144', '2019-03-31', '2', '2', '4', '2019-04-20', 'VN', 'VN', '2019-04-20 11:36:12', '2019-04-20 11:36:20', '4');

-- ----------------------------
-- Table structure for `user_agent`
-- ----------------------------
DROP TABLE IF EXISTS `user_agent`;
CREATE TABLE `user_agent` (
  `agent_id` varchar(10) NOT NULL,
  `agent_name` varchar(10) NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `pcc` varchar(255) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `mail_address` varchar(50) NOT NULL,
  `delete_flg` varchar(255) NOT NULL COMMENT '0: 有効\r\n1: 削除済',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_agent
-- ----------------------------
INSERT INTO user_agent VALUES ('1', 'agent', '1', '1', '1', '1', '0', '2019-04-18 11:50:04', '2019-04-17 14:04:45');
INSERT INTO user_agent VALUES ('10', '10', '10', '10', '10', '10', '10', '2019-04-19 16:20:54', '2019-04-19 16:20:58');
INSERT INTO user_agent VALUES ('2', '2', '2', '2', '2', '2', '0', '2019-04-17 14:04:51', '2019-04-17 14:04:49');
INSERT INTO user_agent VALUES ('3', '2', '2', '2', '2', '2', '0', '2019-04-17 14:04:54', '2019-04-17 14:04:52');
INSERT INTO user_agent VALUES ('4', '4', '4', '4', '4', '4', '0', '2019-04-17 14:04:57', '2019-04-17 14:04:55');
INSERT INTO user_agent VALUES ('5', '5', '5', '5', '5', '5', '0', '2019-04-17 14:05:00', '2019-04-17 14:04:58');
INSERT INTO user_agent VALUES ('6', '6', '6', '6', '6', '6', '0', '2019-04-17 14:05:04', '2019-04-17 14:05:02');
INSERT INTO user_agent VALUES ('7', 'agent', '1', '2', '2', '2', '0', '2019-04-19 16:20:19', '2019-04-19 16:20:16');
INSERT INTO user_agent VALUES ('8', 'agen', '11', '1', '1', '1', '1', '2019-04-19 16:20:22', '2019-04-19 16:20:19');
INSERT INTO user_agent VALUES ('9', '9', '9', '9', '9', '9', '9', '2019-04-19 16:20:42', '2019-04-19 16:20:39');

-- ----------------------------
-- Table structure for `user_corporate`
-- ----------------------------
DROP TABLE IF EXISTS `user_corporate`;
CREATE TABLE `user_corporate` (
  `agent_id` varchar(10) NOT NULL,
  `corporate_id` varchar(10) NOT NULL,
  `corporate_name` varchar(255) DEFAULT NULL,
  `agent_name` varchar(255) NOT NULL,
  `password` varchar(20) NOT NULL,
  `mail_address` varchar(50) NOT NULL,
  `referrer_url` varchar(255) NOT NULL,
  `logo_path` varchar(255) NOT NULL,
  `background_path` varchar(255) NOT NULL,
  `search_valid_date` int(11) NOT NULL,
  `lcc_airline_list` varchar(255) NOT NULL,
  `display_hotel` int(11) NOT NULL COMMENT '0: 非表示\r\n1: 表示',
  `display_rental_car` int(11) NOT NULL COMMENT '0: 非表示\r\n1: 表示',
  `display_local_transportation` int(11) NOT NULL COMMENT '0: 非表示\r\n1: 表示',
  `display_visa_service` int(11) NOT NULL COMMENT '0: 非表示\r\n1: 表示',
  `display_wifi` int(11) NOT NULL COMMENT '0: 非表示\r\n1: 表示',
  `display_insurance` int(11) NOT NULL COMMENT '0: 非表示\r\n1: 表示',
  `display_other1` varchar(20) NOT NULL,
  `display_other2` varchar(20) NOT NULL,
  `footer_html` varchar(255) NOT NULL COMMENT 'HTMLフォーマット',
  `norification_html` varchar(255) DEFAULT NULL,
  `to` varchar(255) NOT NULL,
  `bcc` varchar(255) NOT NULL,
  `signature` varchar(255) NOT NULL,
  `delete_flg` int(11) NOT NULL COMMENT '0: 有効\r\n1: 無効',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`agent_id`,`corporate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_corporate
-- ----------------------------
INSERT INTO user_corporate VALUES ('1', '1', 'ab', 'ac', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2019-04-18 11:40:44', '2019-04-18 11:40:52');
INSERT INTO user_corporate VALUES ('2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2019-04-18 15:01:00', '2019-04-18 15:01:05');

-- ----------------------------
-- Table structure for `user_infini`
-- ----------------------------
DROP TABLE IF EXISTS `user_infini`;
CREATE TABLE `user_infini` (
  `user_id` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `attemp` int(2) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `block_f` tinyint(1) DEFAULT NULL,
  `last_password_update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_infini
-- ----------------------------
INSERT INTO user_infini VALUES ('sangnguyen', '123456', '2019-04-22 09:36:42', '2019-04-19 16:36:28', '0', null, '1', '2019-04-22 09:36:42');

-- ----------------------------
-- Table structure for `user_secret_question`
-- ----------------------------
DROP TABLE IF EXISTS `user_secret_question`;
CREATE TABLE `user_secret_question` (
  `agent_id` varchar(10) NOT NULL,
  `corporate_id` varchar(10) NOT NULL,
  `question_id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL COMMENT '0: 権限なし\r\n1: 権限あり',
  `answer` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`agent_id`,`corporate_id`,`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_secret_question
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `on_update_password` BEFORE UPDATE ON `user_infini` FOR EACH ROW BEGIN
IF OLD.`password` <> NEW.`password` THEN
set NEW.`last_password_update_date` = NOW();
End IF;
END
;;
DELIMITER ;
