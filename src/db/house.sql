/*
Navicat MySQL Data Transfer

Source Server         : liaijun
Source Server Version : 50512
Source Host           : localhost:3306
Source Database       : house

Target Server Type    : MYSQL
Target Server Version : 50512
File Encoding         : 65001

Date: 2012-11-05 11:07:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `district`
-- ----------------------------
DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `district_name` varchar(50) DEFAULT NULL COMMENT '区',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of district
-- ----------------------------
INSERT INTO `district` VALUES ('1', '莱山');
INSERT INTO `district` VALUES ('2', '芝罘');
INSERT INTO `district` VALUES ('3', '福山');
INSERT INTO `district` VALUES ('4', '牟平');

-- ----------------------------
-- Table structure for `house`
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `street_id` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text,
  `fdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `price` double DEFAULT NULL,
  `contact` varchar(10) DEFAULT NULL,
  `size` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_type_id` (`type_id`),
  KEY `pk_user_id` (`user_id`),
  KEY `pk_street_id` (`street_id`),
  CONSTRAINT `pk_street_id` FOREIGN KEY (`street_id`) REFERENCES `street` (`id`),
  CONSTRAINT `pk_type_id` FOREIGN KEY (`type_id`) REFERENCES `housetype` (`id`),
  CONSTRAINT `pk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES ('2', '2', '2', '3', 'asg', 'ashah', '2012-10-21 18:10:52', '300', null, '500.00');
INSERT INTO `house` VALUES ('9', '1', '1', '1', '万象城', null, '2012-11-02 15:32:04', '122', '', '122.00');
INSERT INTO `house` VALUES ('10', '1', '1', '1', '自动发货速度和', null, '2012-11-02 15:36:34', '122', '', '12.00');
INSERT INTO `house` VALUES ('11', '1', '1', '1', '特', null, '2012-11-02 17:09:45', '300', '', '12.00');

-- ----------------------------
-- Table structure for `housetype`
-- ----------------------------
DROP TABLE IF EXISTS `housetype`;
CREATE TABLE `housetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '房子类型',
  `type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of housetype
-- ----------------------------
INSERT INTO `housetype` VALUES ('1', '一室一厅');
INSERT INTO `housetype` VALUES ('2', '两室一厅');
INSERT INTO `housetype` VALUES ('3', '三室一厅');
INSERT INTO `housetype` VALUES ('4', '三室两厅');
INSERT INTO `housetype` VALUES ('5', '四室一厅');
INSERT INTO `housetype` VALUES ('6', '四室两厅');

-- ----------------------------
-- Table structure for `street`
-- ----------------------------
DROP TABLE IF EXISTS `street`;
CREATE TABLE `street` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `district_id` int(11) DEFAULT NULL,
  `street_name` varchar(50) DEFAULT NULL COMMENT '街道',
  PRIMARY KEY (`id`),
  KEY `pk_district_id` (`district_id`),
  CONSTRAINT `pk_district_id` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of street
-- ----------------------------
INSERT INTO `street` VALUES ('1', '1', '滨海中路');
INSERT INTO `street` VALUES ('2', '1', '观海路');
INSERT INTO `street` VALUES ('3', '1', '环海路');
INSERT INTO `street` VALUES ('4', '2', '南大街');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `isadmin` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '123', '1234567', null, 'no');
INSERT INTO `users` VALUES ('2', 'lisi', '123', '7654321', null, 'no');
INSERT INTO `users` VALUES ('3', 'wangwu', '123', null, null, 'no');
INSERT INTO `users` VALUES ('4', 'wangwu', '123', '1234567', '李爱军', null);
