/*
 Navicat MySQL Data Transfer

 Source Server         : zyk
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 123.56.26.127:3306
 Source Schema         : jiujiuusedcar

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 28/06/2020 11:52:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_name` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_password` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE,
  UNIQUE INDEX `admin_name`(`admin_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin');


-- ----------------------------
-- Table structure for browse_record
-- ----------------------------
DROP TABLE IF EXISTS `browse_record`;
CREATE TABLE `browse_record`  (
  `recordid` int(10) NOT NULL AUTO_INCREMENT,
  `good_num` int(10) NULL DEFAULT NULL,
  `telenum` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`recordid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of browse_record
-- ----------------------------


-- ----------------------------
-- Table structure for detail_classify
-- ----------------------------
DROP TABLE IF EXISTS `detail_classify`;
CREATE TABLE `detail_classify`  (
  `detail_num` int(3) NOT NULL AUTO_INCREMENT,
  `detail_classifyname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `summary_classifyname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`detail_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of detail_classify
-- ----------------------------
INSERT INTO `detail_classify` VALUES (1, '手机数码', '耳机');
INSERT INTO `detail_classify` VALUES (2, '手机数码', '手环');
INSERT INTO `detail_classify` VALUES (3, '手机数码', '手机');
INSERT INTO `detail_classify` VALUES (4, '生活百货', '五金工具');
INSERT INTO `detail_classify` VALUES (5, '生活百货', '办公用品');
INSERT INTO `detail_classify` VALUES (6, '生活百货', '日护洗化');
INSERT INTO `detail_classify` VALUES (7, '美妆', '护肤');
INSERT INTO `detail_classify` VALUES (8, '美妆', '彩妆');
INSERT INTO `detail_classify` VALUES (9, '美妆', '香水');
INSERT INTO `detail_classify` VALUES (10, '美妆', '卸妆');
INSERT INTO `detail_classify` VALUES (11, '短袖', '男装');
INSERT INTO `detail_classify` VALUES (12, '计算机类', '书本');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `good_num` int(5) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(8, 2) NULL DEFAULT NULL,
  `summary_classifyname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail_classifyname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(2) NULL DEFAULT 1,
  `owner` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `star_count` int(8) NULL DEFAULT 0,
  `pur_comment` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '商品还没有人购买，所以没有评价哦',
  PRIMARY KEY (`good_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for leave_message
-- ----------------------------
DROP TABLE IF EXISTS `leave_message`;
CREATE TABLE `leave_message`  (
  `messageid` int(10) NOT NULL AUTO_INCREMENT,
  `good_num` int(10) NULL DEFAULT NULL,
  `telenum` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`messageid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of leave_message
-- ----------------------------

-- ----------------------------
-- Table structure for orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo`  (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `buyer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodnum` int(11) NULL DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `pic` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------

-- ----------------------------
-- Table structure for star
-- ----------------------------
DROP TABLE IF EXISTS `star`;
CREATE TABLE `star`  (
  `starid` int(10) NOT NULL AUTO_INCREMENT,
  `good_num` int(10) NULL DEFAULT NULL,
  `telenum` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`starid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of star
-- ----------------------------


-- ----------------------------
-- Table structure for summary_classify
-- ----------------------------
DROP TABLE IF EXISTS `summary_classify`;
CREATE TABLE `summary_classify`  (
  `summary_num` int(3) NOT NULL AUTO_INCREMENT,
  `summary_classifyname` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`summary_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of summary_classify
-- ----------------------------
INSERT INTO `summary_classify` VALUES (1, '手机数码');
INSERT INTO `summary_classify` VALUES (2, '生活百货');
INSERT INTO `summary_classify` VALUES (3, '美妆');
INSERT INTO `summary_classify` VALUES (4, '女装');
INSERT INTO `summary_classify` VALUES (5, '男装');
INSERT INTO `summary_classify` VALUES (6, '运动户外');
INSERT INTO `summary_classify` VALUES (7, '书本');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `telenum` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `headicon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dwells` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `college` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `balance` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `dormitory` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `info_integrity` int(11) NULL DEFAULT 88,
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`telenum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
