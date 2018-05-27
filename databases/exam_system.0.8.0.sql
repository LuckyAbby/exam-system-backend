/*
 Navicat Premium Data Transfer

 Source Server         :  localhost
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : exam_system

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 27/05/2018 22:15:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `display_id` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of exam
-- ----------------------------
BEGIN;
INSERT INTO `exam` VALUES (44, '校招考试', 'rkKuv7Oym', 60, '2018-05-25 20:41:07', '2018-06-27 20:41:07', '2018-05-27 20:41:21', '2018-05-27 20:41:35', 0);
COMMIT;

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `total_score` int(11) NOT NULL,
  `subjective_score` int(11) NOT NULL,
  `objective_score` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `user` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of paper
-- ----------------------------
BEGIN;
INSERT INTO `paper` VALUES (135, 44, 50, 10, 40, '试卷 ', '2018-05-27 20:51:45', '2018-05-27 20:51:45', '1');
COMMIT;

-- ----------------------------
-- Table structure for paper_question
-- ----------------------------
DROP TABLE IF EXISTS `paper_question`;
CREATE TABLE `paper_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of paper_question
-- ----------------------------
BEGIN;
INSERT INTO `paper_question` VALUES (370, 135, 50, 44, '2018-05-27 20:51:45', '2018-05-27 20:51:45');
INSERT INTO `paper_question` VALUES (371, 135, 51, 44, '2018-05-27 20:51:45', '2018-05-27 20:51:45');
INSERT INTO `paper_question` VALUES (372, 135, 52, 44, '2018-05-27 20:51:45', '2018-05-27 20:51:45');
INSERT INTO `paper_question` VALUES (373, 135, 53, 44, '2018-05-27 20:51:45', '2018-05-27 20:51:45');
INSERT INTO `paper_question` VALUES (374, 135, 54, 44, '2018-05-27 20:51:45', '2018-05-27 20:51:45');
COMMIT;

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of question
-- ----------------------------
BEGIN;
INSERT INTO `question` VALUES (50, '题目1', 1, 10, 44, '2018-05-27 20:44:47', '2018-05-27 20:44:47');
INSERT INTO `question` VALUES (51, '2222', 1, 10, 44, '2018-05-27 20:45:03', '2018-05-27 20:45:03');
INSERT INTO `question` VALUES (52, '333', 1, 10, 44, '2018-05-27 20:45:16', '2018-05-27 20:45:16');
INSERT INTO `question` VALUES (53, '123123', 2, 10, 44, '2018-05-27 20:45:38', '2018-05-27 20:46:22');
INSERT INTO `question` VALUES (54, '问答题123', 3, 10, 44, '2018-05-27 20:45:49', '2018-05-27 20:45:55');
COMMIT;

-- ----------------------------
-- Table structure for question_option
-- ----------------------------
DROP TABLE IF EXISTS `question_option`;
CREATE TABLE `question_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `question_id` int(11) NOT NULL,
  `is_correct` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of question_option
-- ----------------------------
BEGIN;
INSERT INTO `question_option` VALUES (35, '1', 50, 1, '2018-05-27 20:44:47', '2018-05-27 20:44:47');
INSERT INTO `question_option` VALUES (36, '2', 50, 0, '2018-05-27 20:44:47', '2018-05-27 20:44:47');
INSERT INTO `question_option` VALUES (37, '3', 50, 0, '2018-05-27 20:44:47', '2018-05-27 20:44:47');
INSERT INTO `question_option` VALUES (38, '4', 50, 0, '2018-05-27 20:44:47', '2018-05-27 20:44:47');
INSERT INTO `question_option` VALUES (39, '1', 51, 1, '2018-05-27 20:45:03', '2018-05-27 20:45:03');
INSERT INTO `question_option` VALUES (40, '1', 51, 0, '2018-05-27 20:45:03', '2018-05-27 20:45:03');
INSERT INTO `question_option` VALUES (41, '1', 51, 0, '2018-05-27 20:45:03', '2018-05-27 20:45:03');
INSERT INTO `question_option` VALUES (42, '1', 51, 0, '2018-05-27 20:45:03', '2018-05-27 20:45:03');
INSERT INTO `question_option` VALUES (43, '1', 52, 1, '2018-05-27 20:45:16', '2018-05-27 20:45:16');
INSERT INTO `question_option` VALUES (44, '1', 52, 0, '2018-05-27 20:45:16', '2018-05-27 20:45:16');
INSERT INTO `question_option` VALUES (45, '1', 52, 0, '2018-05-27 20:45:16', '2018-05-27 20:45:16');
INSERT INTO `question_option` VALUES (46, '1', 52, 0, '2018-05-27 20:45:16', '2018-05-27 20:45:16');
INSERT INTO `question_option` VALUES (51, '是', 53, 1, '2018-05-27 20:46:22', '2018-05-27 20:46:22');
INSERT INTO `question_option` VALUES (52, '否', 53, 0, '2018-05-27 20:46:22', '2018-05-27 20:46:22');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `sex` int(11) NOT NULL,
  `tel` int(11) NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `account` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_unique_account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (4, '小明', '111111', 1, '2018-05-27 20:40:45', '2018-05-27 20:40:45', 1, 111111, 'user@qq.com', 'user');
COMMIT;

-- ----------------------------
-- Table structure for user_exam
-- ----------------------------
DROP TABLE IF EXISTS `user_exam`;
CREATE TABLE `user_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_exam
-- ----------------------------
BEGIN;
INSERT INTO `user_exam` VALUES (30, 4, 44, '2018-05-27 22:13:36', '2018-05-27 22:13:36');
COMMIT;

-- ----------------------------
-- Table structure for user_paper
-- ----------------------------
DROP TABLE IF EXISTS `user_paper`;
CREATE TABLE `user_paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `paper_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `grade` int(11) DEFAULT NULL,
  `subjective_grade` int(11) DEFAULT NULL,
  `objective_grade` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_paper
-- ----------------------------
BEGIN;
INSERT INTO `user_paper` VALUES (1, 4, 135, 44, NULL, NULL, NULL, '2018-05-27 22:13:36', '2018-05-27 22:13:36');
COMMIT;

-- ----------------------------
-- Table structure for user_question
-- ----------------------------
DROP TABLE IF EXISTS `user_question`;
CREATE TABLE `user_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `paper_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `answer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
