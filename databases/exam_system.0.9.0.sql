-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: exam_system
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.17.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,'2018年开发岗位校招考试','Hy9DSrx17',100,'2018-05-21 10:00:26','2018-06-24 19:00:26','2018-05-21 21:10:58','2018-05-28 11:18:35',0),(2,'2018年算法岗位校招考试','S1C7LBekX',120,'2018-05-15 21:11:16','2018-06-23 21:11:16','2018-05-21 21:14:14','2018-05-21 21:14:14',0),(3,'2018年运营岗位校招考试','rJpdUBxJQ',100,'2018-05-21 13:00:23','2018-05-31 10:00:23','2018-05-21 21:15:33','2018-05-21 21:15:33',0),(4,'2018年产品岗位校招考试','SJAJvrg1X',100,'2018-05-16 21:16:55','2018-06-24 21:16:55','2018-05-21 21:17:26','2018-05-21 21:17:26',0);
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper`
--

DROP TABLE IF EXISTS `paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper`
--

LOCK TABLES `paper` WRITE;
/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
INSERT INTO `paper` VALUES (1,1,100,20,80,'2018年开放岗位考试A卷','2018-05-21 21:41:51','2018-05-28 11:33:28',52011006),(2,1,100,30,70,'2018年开放岗位考试B卷','2018-05-21 21:42:19','2018-05-21 21:42:19',52011015),(3,1,100,30,70,'2018年开放岗位考试C卷','2018-05-21 21:42:58','2018-05-21 21:42:58',52011058);
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper_question`
--

DROP TABLE IF EXISTS `paper_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper_question`
--

LOCK TABLES `paper_question` WRITE;
/*!40000 ALTER TABLE `paper_question` DISABLE KEYS */;
INSERT INTO `paper_question` VALUES (4,2,1,3,'2018-05-06 11:35:20','2018-05-06 11:35:20'),(5,2,2,3,'2018-05-06 11:35:20','2018-05-06 11:35:20'),(6,2,3,3,'2018-05-06 11:35:20','2018-05-06 11:35:20'),(10,3,6,1,'2018-05-06 11:35:20','2018-05-06 11:35:20'),(11,3,7,1,'2018-05-06 11:35:20','2018-05-06 11:35:20'),(12,3,8,1,'2018-05-06 11:35:20','2018-05-06 11:35:20'),(13,4,1,2,'2018-05-20 16:50:21','2018-05-20 16:50:21'),(14,4,2,2,'2018-05-20 16:50:21','2018-05-20 16:50:21'),(15,4,3,2,'2018-05-20 16:50:21','2018-05-20 16:50:21'),(16,5,1,3,'2018-05-20 16:50:21','2018-05-20 16:50:21'),(17,5,2,3,'2018-05-20 16:50:21','2018-05-20 16:50:21'),(18,5,3,3,'2018-05-20 16:50:21','2018-05-20 16:50:21'),(19,6,1,1,'2018-05-21 19:20:10','2018-05-21 19:20:10'),(20,6,7,1,'2018-05-21 19:20:10','2018-05-21 19:20:10'),(21,6,8,1,'2018-05-21 19:20:10','2018-05-21 19:20:10'),(24,8,1,1,'2018-05-21 19:35:58','2018-05-21 19:35:58'),(25,8,7,1,'2018-05-21 19:35:58','2018-05-21 19:35:58'),(26,9,1,1,'2018-05-21 19:44:33','2018-05-21 19:44:33'),(27,9,7,1,'2018-05-21 19:44:33','2018-05-21 19:44:33'),(30,2,2,1,'2018-05-21 21:42:19','2018-05-21 21:42:19'),(31,2,3,1,'2018-05-21 21:42:19','2018-05-21 21:42:19'),(32,3,1,1,'2018-05-21 21:42:58','2018-05-21 21:42:58'),(33,3,4,1,'2018-05-21 21:42:58','2018-05-21 21:42:58'),(34,1,1,1,'2018-05-28 11:33:28','2018-05-28 11:33:28'),(35,1,2,1,'2018-05-28 11:33:28','2018-05-28 11:33:28'),(36,1,3,1,'2018-05-28 11:33:28','2018-05-28 11:33:28'),(37,1,4,1,'2018-05-28 11:33:28','2018-05-28 11:33:28'),(38,1,5,1,'2018-05-28 11:33:28','2018-05-28 11:33:28'),(39,1,6,1,'2018-05-28 11:33:28','2018-05-28 11:33:28');
/*!40000 ALTER TABLE `paper_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'如下哪个是Java中的标识符',1,5,1,'2018-05-21 21:36:57','2018-05-28 11:31:45'),(2,'定义一个接口必须使用的关键字是',1,5,1,'2018-05-21 21:37:53','2018-05-21 21:37:53'),(3,'Java程序中的单行注释符是/，多行注释符是 /* */ ',2,5,1,'2018-05-21 21:38:43','2018-05-21 21:38:43'),(4,'Java中用于定义小数的关键字有两个：float 和 double',2,5,1,'2018-05-21 21:39:15','2018-05-21 21:39:15'),(5,'js中const不是es6的特性',2,5,1,'2018-05-28 11:19:53','2018-05-28 11:19:53'),(6,'请使用任意一种编程语言写出快速排序的算法',3,20,1,'2018-05-28 11:20:38','2018-05-28 11:20:38');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_option`
--

DROP TABLE IF EXISTS `question_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `question_id` int(11) NOT NULL,
  `is_correct` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_option`
--

LOCK TABLES `question_option` WRITE;
/*!40000 ALTER TABLE `question_option` DISABLE KEYS */;
INSERT INTO `question_option` VALUES (3,'1',7,0,'2018-05-19 22:23:09','2018-05-19 22:23:09'),(4,'2',7,0,'2018-05-19 22:23:09','2018-05-19 22:23:09'),(5,'3',7,1,'2018-05-19 22:23:09','2018-05-19 22:23:09'),(6,'4',7,0,'2018-05-19 22:23:09','2018-05-19 22:23:09'),(11,'static',2,0,'2018-05-21 21:37:53','2018-05-21 21:37:53'),(12,'super',2,0,'2018-05-21 21:37:53','2018-05-21 21:37:53'),(13,'interface',2,1,'2018-05-21 21:37:53','2018-05-21 21:37:53'),(14,'class',2,0,'2018-05-21 21:37:53','2018-05-21 21:37:53'),(15,'是',5,0,'2018-05-28 11:19:53','2018-05-28 11:19:53'),(16,'否',5,1,'2018-05-28 11:19:53','2018-05-28 11:19:53'),(17,'function',1,0,'2018-05-28 11:31:45','2018-05-28 11:31:45'),(18,'var',1,0,'2018-05-28 11:31:45','2018-05-28 11:31:45'),(19,'public',1,1,'2018-05-28 11:31:45','2018-05-28 11:31:45'),(20,'super',1,0,'2018-05-28 11:31:45','2018-05-28 11:31:45');
/*!40000 ALTER TABLE `question_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'张三','111111',1,'2018-05-21 10:00:26','2018-05-21 10:00:26',0,'13898789090','1234567@qq.com','421087199509087865'),(2,'李四','222222',2,'2018-05-21 10:00:26','2018-05-21 10:00:26',0,'13223233432','1234523@qq.com','232312199807287865'),(3,'王五','333333',1,'2018-05-21 10:00:26','2018-05-21 10:00:26',0,'13676568765','wangwu@163.com','563567199609071435'),(4,'柳兮','555555',2,'2018-05-21 10:00:26','2018-05-21 10:00:26',1,'18765786783','luckyabby97@163.com','421087199702187652'),(5,'顾水云','666666',1,'2018-05-21 10:00:26','2018-05-21 10:00:26',1,'18743789898','gushuiyun@qq.com','52011006');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_exam`
--

DROP TABLE IF EXISTS `user_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_exam`
--

LOCK TABLES `user_exam` WRITE;
/*!40000 ALTER TABLE `user_exam` DISABLE KEYS */;
INSERT INTO `user_exam` VALUES (2,1,1,'2018-05-20 22:10:55','2018-05-20 22:10:55'),(3,3,1,'2018-05-21 12:41:53','2018-05-21 12:41:53'),(6,2,1,'2018-05-28 14:41:39','2018-05-28 14:41:39');
/*!40000 ALTER TABLE `user_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_paper`
--

DROP TABLE IF EXISTS `user_paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_paper`
--

LOCK TABLES `user_paper` WRITE;
/*!40000 ALTER TABLE `user_paper` DISABLE KEYS */;
INSERT INTO `user_paper` VALUES (1,2,1,1,NULL,NULL,NULL,'2018-05-28 14:41:39','2018-05-28 14:41:39');
/*!40000 ALTER TABLE `user_paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_question`
--

DROP TABLE IF EXISTS `user_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_question`
--

LOCK TABLES `user_question` WRITE;
/*!40000 ALTER TABLE `user_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-15 13:04:02
