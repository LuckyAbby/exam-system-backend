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

 Date: 15/06/2018 15:20:29
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of exam
-- ----------------------------
BEGIN;
INSERT INTO `exam` VALUES (1, '2018年开发岗位校招考试', 'Hy9DSrx17', 100, '2018-05-21 10:00:26', '2018-06-24 19:00:26', '2018-05-21 21:10:58', '2018-05-28 11:18:35', 0);
INSERT INTO `exam` VALUES (2, '2018年算法岗位校招考试', 'S1C7LBekX', 120, '2018-05-15 21:11:16', '2018-06-23 21:11:16', '2018-05-21 21:14:14', '2018-05-21 21:14:14', 0);
INSERT INTO `exam` VALUES (3, '2018年运营岗位校招考试', 'rJpdUBxJQ', 100, '2018-05-21 13:00:23', '2018-05-31 10:00:23', '2018-05-21 21:15:33', '2018-05-21 21:15:33', 0);
INSERT INTO `exam` VALUES (4, '2018年产品岗位校招考试', 'SJAJvrg1X', 100, '2018-05-16 21:16:55', '2018-06-24 21:16:55', '2018-05-21 21:17:26', '2018-05-21 21:17:26', 0);
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
  `user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of paper
-- ----------------------------
BEGIN;
INSERT INTO `paper` VALUES (1, 1, 100, 20, 80, '2018年开放岗位考试A卷', '2018-05-21 21:41:51', '2018-05-28 11:33:28', 52011006);
INSERT INTO `paper` VALUES (2, 1, 100, 30, 70, '2018年开放岗位考试B卷', '2018-05-21 21:42:19', '2018-05-21 21:42:19', 52011015);
INSERT INTO `paper` VALUES (3, 1, 100, 30, 70, '2018年开放岗位考试C卷', '2018-05-21 21:42:58', '2018-05-21 21:42:58', 52011058);
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of paper_question
-- ----------------------------
BEGIN;
INSERT INTO `paper_question` VALUES (4, 2, 1, 3, '2018-05-06 11:35:20', '2018-05-06 11:35:20');
INSERT INTO `paper_question` VALUES (5, 2, 2, 3, '2018-05-06 11:35:20', '2018-05-06 11:35:20');
INSERT INTO `paper_question` VALUES (6, 2, 3, 3, '2018-05-06 11:35:20', '2018-05-06 11:35:20');
INSERT INTO `paper_question` VALUES (10, 3, 6, 1, '2018-05-06 11:35:20', '2018-05-06 11:35:20');
INSERT INTO `paper_question` VALUES (11, 3, 7, 1, '2018-05-06 11:35:20', '2018-05-06 11:35:20');
INSERT INTO `paper_question` VALUES (12, 3, 8, 1, '2018-05-06 11:35:20', '2018-05-06 11:35:20');
INSERT INTO `paper_question` VALUES (13, 4, 1, 2, '2018-05-20 16:50:21', '2018-05-20 16:50:21');
INSERT INTO `paper_question` VALUES (14, 4, 2, 2, '2018-05-20 16:50:21', '2018-05-20 16:50:21');
INSERT INTO `paper_question` VALUES (15, 4, 3, 2, '2018-05-20 16:50:21', '2018-05-20 16:50:21');
INSERT INTO `paper_question` VALUES (16, 5, 1, 3, '2018-05-20 16:50:21', '2018-05-20 16:50:21');
INSERT INTO `paper_question` VALUES (17, 5, 2, 3, '2018-05-20 16:50:21', '2018-05-20 16:50:21');
INSERT INTO `paper_question` VALUES (18, 5, 3, 3, '2018-05-20 16:50:21', '2018-05-20 16:50:21');
INSERT INTO `paper_question` VALUES (19, 6, 1, 1, '2018-05-21 19:20:10', '2018-05-21 19:20:10');
INSERT INTO `paper_question` VALUES (20, 6, 7, 1, '2018-05-21 19:20:10', '2018-05-21 19:20:10');
INSERT INTO `paper_question` VALUES (21, 6, 8, 1, '2018-05-21 19:20:10', '2018-05-21 19:20:10');
INSERT INTO `paper_question` VALUES (24, 8, 1, 1, '2018-05-21 19:35:58', '2018-05-21 19:35:58');
INSERT INTO `paper_question` VALUES (25, 8, 7, 1, '2018-05-21 19:35:58', '2018-05-21 19:35:58');
INSERT INTO `paper_question` VALUES (26, 9, 1, 1, '2018-05-21 19:44:33', '2018-05-21 19:44:33');
INSERT INTO `paper_question` VALUES (27, 9, 7, 1, '2018-05-21 19:44:33', '2018-05-21 19:44:33');
INSERT INTO `paper_question` VALUES (30, 2, 2, 1, '2018-05-21 21:42:19', '2018-05-21 21:42:19');
INSERT INTO `paper_question` VALUES (31, 2, 3, 1, '2018-05-21 21:42:19', '2018-05-21 21:42:19');
INSERT INTO `paper_question` VALUES (32, 3, 1, 1, '2018-05-21 21:42:58', '2018-05-21 21:42:58');
INSERT INTO `paper_question` VALUES (33, 3, 4, 1, '2018-05-21 21:42:58', '2018-05-21 21:42:58');
INSERT INTO `paper_question` VALUES (34, 1, 1, 1, '2018-05-28 11:33:28', '2018-05-28 11:33:28');
INSERT INTO `paper_question` VALUES (35, 1, 2, 1, '2018-05-28 11:33:28', '2018-05-28 11:33:28');
INSERT INTO `paper_question` VALUES (36, 1, 3, 1, '2018-05-28 11:33:28', '2018-05-28 11:33:28');
INSERT INTO `paper_question` VALUES (37, 1, 4, 1, '2018-05-28 11:33:28', '2018-05-28 11:33:28');
INSERT INTO `paper_question` VALUES (38, 1, 5, 1, '2018-05-28 11:33:28', '2018-05-28 11:33:28');
INSERT INTO `paper_question` VALUES (39, 1, 6, 1, '2018-05-28 11:33:28', '2018-05-28 11:33:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of question
-- ----------------------------
BEGIN;
INSERT INTO `question` VALUES (1, '如下哪个是Java中的标识符', 1, 5, 1, '2018-05-21 21:36:57', '2018-05-28 11:31:45');
INSERT INTO `question` VALUES (2, '定义一个接口必须使用的关键字是', 1, 5, 1, '2018-05-21 21:37:53', '2018-05-21 21:37:53');
INSERT INTO `question` VALUES (3, 'Java程序中的单行注释符是/，多行注释符是 /* */ ', 2, 5, 1, '2018-05-21 21:38:43', '2018-06-15 13:56:54');
INSERT INTO `question` VALUES (4, 'Java中用于定义小数的关键字有两个：float 和 double', 2, 5, 1, '2018-05-21 21:39:15', '2018-06-15 13:57:16');
INSERT INTO `question` VALUES (5, 'js中const不是es6的特性', 2, 5, 1, '2018-05-28 11:19:53', '2018-05-28 11:19:53');
INSERT INTO `question` VALUES (6, '请使用任意一种编程语言写出快速排序的算法', 3, 20, 1, '2018-05-28 11:20:38', '2018-05-28 11:20:38');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of question_option
-- ----------------------------
BEGIN;
INSERT INTO `question_option` VALUES (3, '1', 7, 0, '2018-05-19 22:23:09', '2018-05-19 22:23:09');
INSERT INTO `question_option` VALUES (4, '2', 7, 0, '2018-05-19 22:23:09', '2018-05-19 22:23:09');
INSERT INTO `question_option` VALUES (5, '3', 7, 1, '2018-05-19 22:23:09', '2018-05-19 22:23:09');
INSERT INTO `question_option` VALUES (6, '4', 7, 0, '2018-05-19 22:23:09', '2018-05-19 22:23:09');
INSERT INTO `question_option` VALUES (11, 'static', 2, 0, '2018-05-21 21:37:53', '2018-05-21 21:37:53');
INSERT INTO `question_option` VALUES (12, 'super', 2, 0, '2018-05-21 21:37:53', '2018-05-21 21:37:53');
INSERT INTO `question_option` VALUES (13, 'interface', 2, 1, '2018-05-21 21:37:53', '2018-05-21 21:37:53');
INSERT INTO `question_option` VALUES (14, 'class', 2, 0, '2018-05-21 21:37:53', '2018-05-21 21:37:53');
INSERT INTO `question_option` VALUES (15, '是', 5, 0, '2018-05-28 11:19:53', '2018-05-28 11:19:53');
INSERT INTO `question_option` VALUES (16, '否', 5, 1, '2018-05-28 11:19:53', '2018-05-28 11:19:53');
INSERT INTO `question_option` VALUES (17, 'function', 1, 0, '2018-05-28 11:31:45', '2018-05-28 11:31:45');
INSERT INTO `question_option` VALUES (18, 'var', 1, 0, '2018-05-28 11:31:45', '2018-05-28 11:31:45');
INSERT INTO `question_option` VALUES (19, 'public', 1, 1, '2018-05-28 11:31:45', '2018-05-28 11:31:45');
INSERT INTO `question_option` VALUES (20, 'super', 1, 0, '2018-05-28 11:31:45', '2018-05-28 11:31:45');
INSERT INTO `question_option` VALUES (21, '是', 3, 1, '2018-06-15 13:56:54', '2018-06-15 13:56:54');
INSERT INTO `question_option` VALUES (22, '否', 3, 0, '2018-06-15 13:56:54', '2018-06-15 13:56:54');
INSERT INTO `question_option` VALUES (23, '是', 4, 1, '2018-06-15 13:57:16', '2018-06-15 13:57:16');
INSERT INTO `question_option` VALUES (24, '否', 4, 0, '2018-06-15 13:57:16', '2018-06-15 13:57:16');
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
  `tel` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `account` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_UNIQUE` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, '张三', '111111', 1, '2018-05-21 10:00:26', '2018-05-21 10:00:26', 0, '13898789090', '1234567@qq.com', '421087199509087865');
INSERT INTO `user` VALUES (2, '李四', '222222', 2, '2018-05-21 10:00:26', '2018-05-21 10:00:26', 0, '13223233432', '1234523@qq.com', '232312199807287865');
INSERT INTO `user` VALUES (3, '王五', '333333', 1, '2018-05-21 10:00:26', '2018-05-21 10:00:26', 0, '13676568765', 'wangwu@163.com', '563567199609071435');
INSERT INTO `user` VALUES (4, '柳兮', '555555', 2, '2018-05-21 10:00:26', '2018-05-21 10:00:26', 1, '18765786783', 'luckyabby97@163.com', '421087199702187652');
INSERT INTO `user` VALUES (5, '顾水云', '666666', 1, '2018-05-21 10:00:26', '2018-05-21 10:00:26', 1, '18743789898', 'gushuiyun@qq.com', '52011006');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_exam
-- ----------------------------
BEGIN;
INSERT INTO `user_exam` VALUES (2, 1, 1, '2018-05-20 22:10:55', '2018-05-20 22:10:55');
INSERT INTO `user_exam` VALUES (3, 3, 1, '2018-05-21 12:41:53', '2018-05-21 12:41:53');
INSERT INTO `user_exam` VALUES (6, 2, 1, '2018-05-28 14:41:39', '2018-05-28 14:41:39');
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
INSERT INTO `user_paper` VALUES (1, 2, 1, 1, NULL, NULL, NULL, '2018-05-28 14:41:39', '2018-05-28 14:41:39');
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
