-- MySQL dump 10.13  Distrib 5.5.50, for Win64 (x86)
--
-- Host: localhost    Database: ostp
-- ------------------------------------------------------
-- Server version	5.5.50

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
-- Table structure for table `basicequiptype`
--

DROP TABLE IF EXISTS `basicequiptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basicequiptype` (
  `EquipTypeID` char(32) NOT NULL COMMENT '装备功能分类编号',
  `EquipTypeName` varchar(20) NOT NULL COMMENT '装备功能分类名称',
  `Note` varchar(20) NOT NULL COMMENT '备注',
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`EquipTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础数据管理：装备功能类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basicequiptype`
--

LOCK TABLES `basicequiptype` WRITE;
/*!40000 ALTER TABLE `basicequiptype` DISABLE KEYS */;
INSERT INTO `basicequiptype` VALUES ('4994769b5c1b44bf84d6efeea5f6771e','看你','','admin','2016-11-08 14:49:00','admin','2016-11-08 14:49:00'),('4ae53e2643f54b6cba6fe1c94632b341','454554','','admin','2016-11-08 14:50:40','admin','2016-11-22 15:04:01'),('96522fa2a8e940f6b3a008ab05c2cc59','fz','','admin','2016-11-08 14:59:06','admin','2016-11-08 14:59:06'),('9bf98b6c01a346bfbd51d5206f6284e5','他的','','admin','2016-11-08 14:48:47','admin','2016-11-08 14:48:47'),('af1adfc3395548c89f509d92d44c8945','dad333','3123','admin','2016-11-08 14:54:58','admin','2016-11-08 14:54:58'),('afc1c51e20294329ab36539ecd5f1439','dad1','13123123','admin','2016-11-08 14:46:17','admin','2016-11-08 14:46:17'),('ba25f44ad54041f4975f1f86b67acecf','12121212','123123123','admin','2016-11-08 14:38:46','admin','2016-11-08 14:38:46'),('d465f39e2e1e4583a51027093c78d317','343111','','admin','2016-11-08 14:54:37','admin','2016-11-08 14:54:37'),('d4dda97f9e7e4e1babec3ebb89b85b88','313123','131232131231231231','admin','2016-11-07 19:12:21','admin','2016-11-08 14:38:55'),('e6e03f4aa2fb467a805e30c10c29517e','个ihb','','admin','2016-11-08 14:51:58','admin','2016-11-08 14:51:58');
/*!40000 ALTER TABLE `basicequiptype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basicinfo`
--

DROP TABLE IF EXISTS `basicinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basicinfo` (
  `InfoID` char(32) NOT NULL COMMENT '资讯标识',
  `Author` varchar(20) NOT NULL COMMENT '作者',
  `Title` varchar(20) NOT NULL COMMENT '资讯标题',
  `FirstLevelInfoTypeID` char(32) NOT NULL COMMENT '资讯一级类型标识',
  `SecondLevelInfoTypeID` char(32) NOT NULL COMMENT '资讯二级类型标识',
  `SportTypeID` char(32) NOT NULL COMMENT '运动类型',
  `CopyFrom` varchar(50) DEFAULT NULL COMMENT '文章来源',
  `KeyWords` varchar(50) NOT NULL COMMENT '关键字',
  `Content` varchar(5000) NOT NULL COMMENT '文本内容',
  `ImgUrl` varchar(255) DEFAULT NULL COMMENT '列表图片',
  `CreateTime` date DEFAULT NULL COMMENT '创建时间',
  `Enabled` char(1) DEFAULT NULL COMMENT '逻辑删除标志',
  PRIMARY KEY (`InfoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资讯：资讯';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basicinfo`
--

LOCK TABLES `basicinfo` WRITE;
/*!40000 ALTER TABLE `basicinfo` DISABLE KEYS */;
INSERT INTO `basicinfo` VALUES ('1479613267947','rt','rt','4','13','56a3c9dc48a840afb0b8daefe3bb14e0','rt','rt','<p>rtrt资讯内容</p>\r\n','/ostp/userfiles/images/2016/12/26/4.jpg','2016-11-20',NULL),('1479613299411','fghfg','gfhfg','5','19','56a3c9dc48a840afb0b8daefe3bb14e0','fghfgh','fghfg','<p>资讯内容fghgfh</p>\r\n','/ostp/userfiles/images/2016/12/26/bp10.jpg','2016-11-20',NULL),('1483016721013','ttt','test','1','1','42daec416efd4a71a1557dc035d6818f','ttt','t','<p>资讯内容</p>\r\n','/ostp/userfiles/images/2016/12/26/bp1.jpg','2016-12-29',NULL),('1483016790145','hh','hhh','1','1','42daec416efd4a71a1557dc035d6818f','hh','h','<p>资讯内容</p>\r\n','/ostp/userfiles/images/2016/12/26/bp11.jpg','2016-12-29',NULL),('1483016853739','hh','gghh','1','1','42daec416efd4a71a1557dc035d6818f','jjjj','jj','<p>资讯内容hhhh</p>\r\n','/ostp/userfiles/images/2016/12/26/bp12.jpg','2016-12-29',NULL);
/*!40000 ALTER TABLE `basicinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basicphotostyle`
--

DROP TABLE IF EXISTS `basicphotostyle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basicphotostyle` (
  `PhotoStyleID` char(32) NOT NULL COMMENT '图像风格类型编号',
  `PhotoStyleName` varchar(20) NOT NULL COMMENT '图像风格类型名称',
  `Note` varchar(20) NOT NULL COMMENT '备注',
  `Enabled` char(1) DEFAULT NULL COMMENT '逻辑删除标志',
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`PhotoStyleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础数据管理：图像风格类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basicphotostyle`
--

LOCK TABLES `basicphotostyle` WRITE;
/*!40000 ALTER TABLE `basicphotostyle` DISABLE KEYS */;
INSERT INTO `basicphotostyle` VALUES ('5a944e3ed8fa4bfb9202f02f5be2af4d','动物','自然界动物',NULL,'admin','2016-11-09 20:07:24','admin','2016-11-09 20:07:24'),('5be20b23916d47f490d4079682b8638c','风景','自然风景',NULL,'admin','2016-11-09 20:06:35','admin','2016-11-09 20:06:35'),('c24c1150c66e472b889f48e3535b73bf','5f','ga',NULL,'admin','2016-11-07 19:39:51','admin','2016-11-07 19:39:51'),('e00900cef2a94488bba1c53d2e296d6d','ghdx','hd',NULL,'admin','2016-11-07 19:35:12','admin','2016-11-07 19:35:12');
/*!40000 ALTER TABLE `basicphotostyle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basicsport`
--

DROP TABLE IF EXISTS `basicsport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basicsport` (
  `SportID` char(32) NOT NULL COMMENT '户外运动编号',
  `SportTypeID` char(32) NOT NULL COMMENT '户外运动类型分类编号',
  `SportName` varchar(20) NOT NULL DEFAULT '' COMMENT '户外运动名称',
  `SportKeywords` varchar(50) NOT NULL DEFAULT '' COMMENT '户外运动搜索用关键词',
  `SportNote` varchar(100) DEFAULT '' COMMENT '备注',
  `Enabled` char(1) DEFAULT NULL COMMENT '逻辑删除标志',
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`SportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础数据管理：户外运动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basicsport`
--

LOCK TABLES `basicsport` WRITE;
/*!40000 ALTER TABLE `basicsport` DISABLE KEYS */;
INSERT INTO `basicsport` VALUES ('135a58b28d254c339e4ee07be460024a','42daec416efd4a71a1557dc035d6818f','喜马拉雅一月游','喜马拉雅','活动买好保险',NULL,'admin','2016-11-09 20:00:13','admin','2016-11-22 15:03:53'),('36783aa724034a2f811fa8fa4987e3a3','56a3c9dc48a840afb0b8daefe3bb14e0','北冰洋花式游泳','北冰洋','带好比基尼',NULL,'admin','2016-11-09 20:02:38','admin','2016-11-09 20:02:38'),('5d8886f487fc464da87f7be7890784f6','48d1d2dac7ff403d8869182eaa18200c','黄河漂流记','黄河','带好衣服',NULL,'admin','2016-11-09 20:00:49','admin','2016-11-09 20:00:49'),('7e6eb1d05ab04f62b341d09447d31610','6e9584816d2e4c06ad026a1c45462109','南海潜水','南海','潜水设备自带',NULL,'admin','2016-11-09 20:03:29','admin','2016-11-09 20:03:29'),('ada2af2eba91458288b104b643554fcb','4fdff762b5494bd4b1763c7c0b7d7e5a','梅岭一日游','梅岭','穿好运动鞋',NULL,'admin','2016-11-09 20:01:47','admin','2016-11-09 20:01:47'),('af45a568d3cf4dbbafd7df2bad0df2bc','ac2d020280294dd099074faa96d9b793','南昌马拉松','南昌','自带饮料',NULL,'admin','2016-11-09 20:05:37','admin','2016-11-09 20:05:37'),('bcb1e6f4588e447a89fb869588a0ccaf','42daec416efd4a71a1557dc035d6818f','川藏骑行','骑行','人数不限',NULL,'admin','2016-11-09 19:59:19','admin','2016-11-09 19:59:19'),('c1ac48456f1f43f98168720a06325324','973ce5e6815f4cf483bbb53dc04a38f6','孔目湖钓鱼比赛','交大孔目湖','自带渔具',NULL,'admin','2016-11-09 20:05:01','admin','2016-11-09 20:05:01'),('ffa09a4b7a7b43b5bb5b19d9860af36c','943376c32ec44247aa12def538355304','张家界攀岩','张家界','带好装备',NULL,'admin','2016-11-09 20:04:11','admin','2016-11-09 20:04:11');
/*!40000 ALTER TABLE `basicsport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basicsporttype`
--

DROP TABLE IF EXISTS `basicsporttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basicsporttype` (
  `SportTypeID` char(32) NOT NULL COMMENT '户外运动类型分类编号',
  `SportTypeName` varchar(20) NOT NULL DEFAULT '' COMMENT '户外运动类型分类名称',
  `Note` varchar(20) DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`SportTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础数据管理：户外运动类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basicsporttype`
--

LOCK TABLES `basicsporttype` WRITE;
/*!40000 ALTER TABLE `basicsporttype` DISABLE KEYS */;
INSERT INTO `basicsporttype` VALUES ('42daec416efd4a71a1557dc035d6818f','骑行','ridding','admin','2016-11-09 19:55:46','admin','2016-11-22 15:03:23'),('46c8dfd3a7cf443e96507698e0495c43','登山','climb mountain','admin','2016-11-09 19:55:06','admin','2016-11-09 19:55:06'),('48d1d2dac7ff403d8869182eaa18200c','漂流','piaoliu','admin','2016-11-09 19:56:03','admin','2016-11-09 19:56:03'),('4fdff762b5494bd4b1763c7c0b7d7e5a','徒步','foot','admin','2016-11-09 19:56:25','admin','2016-11-09 19:56:25'),('56a3c9dc48a840afb0b8daefe3bb14e0','游泳','swimming','admin','2016-11-09 19:53:14','admin','2016-11-09 19:53:14'),('6e9584816d2e4c06ad026a1c45462109','潜水','diving','admin','2016-11-09 19:54:03','admin','2016-11-09 19:54:03'),('943376c32ec44247aa12def538355304','攀岩','panyan','admin','2016-11-09 19:55:23','admin','2016-11-09 19:55:23'),('973ce5e6815f4cf483bbb53dc04a38f6','钓鱼','fishing','admin','2016-11-09 19:56:41','admin','2016-11-09 19:56:41'),('ac2d020280294dd099074faa96d9b793','跑步','running','admin','2016-11-09 19:54:23','admin','2016-11-09 19:54:23'),('de281194801f4011bc491659984b026a','22','22','admin','2016-11-22 15:03:34','admin','2016-11-22 15:03:34');
/*!40000 ALTER TABLE `basicsporttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carousel`
--

DROP TABLE IF EXISTS `carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carousel` (
  `CarouselId` char(32) NOT NULL COMMENT '轮播图编号',
  `CarouselName` varchar(20) NOT NULL DEFAULT '' COMMENT '轮播图名称',
  `carouselHref` varchar(255) DEFAULT NULL COMMENT '轮播图地址',
  `Note` varchar(20) DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`CarouselId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carousel`
--

LOCK TABLES `carousel` WRITE;
/*!40000 ALTER TABLE `carousel` DISABLE KEYS */;
INSERT INTO `carousel` VALUES ('a8efe51702e5494ea3f702a81cfad73f','3','/ostp/userfiles/images/2016/12/26/3.jpg','','admin','2016-12-26 19:46:57','admin','2016-12-26 19:46:57'),('c2bcbc8f449140b7886fbf3caf3b44c2','1','/ostp/userfiles/images/2016/12/26/1.jpg','','admin','2016-12-26 19:46:26','admin','2016-12-26 19:46:26'),('e33613e30efd439f84c0fae1966d010e','2','/ostp/userfiles/images/2016/12/26/2.jpg','','admin','2016-12-26 19:46:46','admin','2016-12-26 19:46:46'),('e85bf0631e744879bffd08f6f2aeff56','4','/ostp/userfiles/images/2016/12/26/4.jpg','','admin','2016-12-26 19:47:07','admin','2016-12-26 19:47:07');
/*!40000 ALTER TABLE `carousel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communityanswerinfo`
--

DROP TABLE IF EXISTS `communityanswerinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communityanswerinfo` (
  `AnsID` int(20) NOT NULL COMMENT '答案的唯一标识',
  `AnsAuthor` varchar(20) NOT NULL COMMENT '答案的作者',
  `AnsTime` datetime NOT NULL COMMENT '答案发布的时间',
  `AnsAttention` varchar(10) NOT NULL COMMENT '答案的关注数',
  `QuestionID` varchar(20) NOT NULL COMMENT '问题的id',
  `Enabled` char(1) DEFAULT NULL COMMENT '逻辑删除标志',
  PRIMARY KEY (`AnsID`),
  UNIQUE KEY `AnsID_UNIQUE` (`AnsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='社区：回答表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communityanswerinfo`
--

LOCK TABLES `communityanswerinfo` WRITE;
/*!40000 ALTER TABLE `communityanswerinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `communityanswerinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communityquestioninfo`
--

DROP TABLE IF EXISTS `communityquestioninfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communityquestioninfo` (
  `QuestionID` char(32) NOT NULL COMMENT '问题唯一标识',
  `QuestionTitle` varchar(20) NOT NULL COMMENT '问题的标题',
  `QuestionContent` varchar(5000) NOT NULL COMMENT '问题内容',
  `QuestionAuthor` varchar(20) NOT NULL COMMENT '问题的发布者',
  `QuestionAttention` varchar(10) NOT NULL COMMENT '问题的关注度',
  `QuestionTime` datetime NOT NULL COMMENT '问题的发布时间',
  `Enabled` char(1) DEFAULT NULL COMMENT '逻辑删除标志',
  PRIMARY KEY (`QuestionID`),
  UNIQUE KEY `QuestionID_UNIQUE` (`QuestionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='社区：问题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communityquestioninfo`
--

LOCK TABLES `communityquestioninfo` WRITE;
/*!40000 ALTER TABLE `communityquestioninfo` DISABLE KEYS */;
INSERT INTO `communityquestioninfo` VALUES ('105996B3FEDD4FF2806BC4DC12662DB9','vvvv','<p>sdfsafs</p>','vvs','sdsadfas','2016-11-11 00:00:00','0'),('1BB0884CAE514D8AAE820E34E55ABD7F','bbb','<p>bbbb</p>','bbb','bbb','2016-11-19 00:00:00','1'),('62E2CAA1425148AABE1B11E456ABDA3E','aaa','<p>aaaa</p>','aaaa','aaa','2016-11-25 00:00:00','1'),('81906DBF26394A9B8B4B7F64E325BCA1','vvvv','<p>vvvvvv</p>','vvvv','vvvv','2016-11-18 00:00:00','1'),('A7CB75C292C54E5C85AE7D805184C5B9','test','<p>adsfsdfsa啊说法地方</p>','tets','ttt','2016-11-20 10:33:23','1'),('F2DDBB417A674EFD8B1CDD18B83F9EBD','sdfsadfda','<p>safsdfgsg</p>','sadfsadfa','asdfsadf','2016-11-10 00:00:00','1');
/*!40000 ALTER TABLE `communityquestioninfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `description` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `teacherID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'MyBatis','MyBatis是一个支持普通SQL查询,存储过程和高级映射的优秀持久层框架。',1),(2,'Java SE','Java se是由Sun Microsystems公司推出的Java程序设计语言。',2),(3,'Maven','Maven是来管理项目的构建，报告和文档的软件项目',1),(4,'Spring','Spring是于2003 年兴起的一个轻量级的Java 开发框架。',2),(5,'Git','Git是一款免费、开源的分布式版本控制系统。',1);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseinfo`
--

DROP TABLE IF EXISTS `courseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseinfo` (
  `CourseID` char(32) NOT NULL COMMENT '文化类别的id',
  `CourseTitle` varchar(20) NOT NULL COMMENT '文化类的教程标题',
  `CourseAuthor` varchar(20) DEFAULT NULL COMMENT '文化类文章的作者',
  `UpdateTime` datetime DEFAULT NULL COMMENT '教程上传时间',
  `Content` varchar(5000) NOT NULL COMMENT '教程的文本内容',
  `CoverPicture` varchar(500) DEFAULT NULL COMMENT '教程封面图片',
  `SportTypeID` char(32) NOT NULL COMMENT '户外运动类型编号',
  `ClickTimes` char(32) DEFAULT NULL COMMENT '本教程的点击量',
  `Keywords` varchar(100) NOT NULL COMMENT '关键字',
  `Enabled` char(1) DEFAULT NULL COMMENT '逻辑删除标志',
  `CreateTime` datetime NOT NULL COMMENT '课程创建时间',
  `CreateBy` varchar(255) NOT NULL COMMENT '课程创建者',
  `UpdateBy` varchar(20) DEFAULT NULL COMMENT '课程更新者',
  PRIMARY KEY (`CourseID`),
  UNIQUE KEY `CourseID_UNIQUE` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教程：教程信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseinfo`
--

LOCK TABLES `courseinfo` WRITE;
/*!40000 ALTER TABLE `courseinfo` DISABLE KEYS */;
INSERT INTO `courseinfo` VALUES ('01CEEFBDDFF54709A67C06294956138C','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('0256DF0FA0B94BDDB8F263E8D0E1C20D','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('043E1821CEFA42D8BFBE9F0E3A537312','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('05BACCED312E428A88998F2D7D4FEFBF','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('0610C03B9A944AC2BBCABB23CE5E3171','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('06957E185BD545A6985D9A299CF400B6','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('06A694FC87194ADBA8B579F696B46691','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('07B64A3844B542E1B4F5A938B4ADB67B','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('084290E86362471D9DCC1249B55D9671','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('0AD7423D69324F629276D8BCFC4B74F1','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('0D616A4E9E5545199599EF7C6539F03B','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('0E6469C01BCE46BD8A45F9A03F432DE5','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('1051D1526A8A4893A9AB8C9A5F2F36F9','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('116B83F75B134126AA28F3551A5F9DED','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('119485B943EE4EAF8B61968887D9DC7F','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('1369007720f584c5a9069518b12f2720','321','321','2016-11-20 17:37:51','<p>11</p>\r\n','/ostp/userfiles/images/2016/12/26/t1.jpg','42daec416efd4a71a1557dc035d6818f','111','3','T','2016-11-20 17:37:51','admin',NULL),('1648c57f4tr4t44ee481c2c2ae58e755','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('1648c57fe6804ee481c2c2a358e75541','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','7','T','2016-11-19 11:18:47','admin','admin'),('1648c57fe6804ee481c2c2ae58e75541','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','10000','1','T','2016-11-19 11:18:47','admin','admin'),('1648c57fe6804ee481c2c2ae58e75543','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('1648c57fe6804ee481c2c2ae5ge75541','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','10000','10','T','2016-11-19 11:18:47','admin','admin'),('1648c57fe6804ee481c2c2de58e75543','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','k','T','2016-11-19 11:18:47','admin','admin'),('1648c57fe6804ee481c2c2de58fgd543','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/11/20/Capture001.png','42daec416efd4a71a1557dc035d6818f','10000','13','T','2016-11-19 11:18:47','admin','admin'),('1648c57fe6804ee481c2j2a358e75541','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','10000','16','T','2016-11-19 11:18:47','admin','admin'),('1648c57fe6804ejujuju75541gsfs','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','10000','10','T','2016-11-19 11:18:47','admin','admin'),('1648c57fe6804erh2c2ae58e7554112a','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','10000','1','T','2016-11-19 11:18:47','admin','admin'),('1648c57wwww81c2c2a358e7554131s','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','10000','7','T','2016-11-19 11:18:47','admin','admin'),('17060C25AD3A4FEFBB4D80D428F643C7','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('17072501E5E4464A94FBC6D011A2203B','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('171A67DA9383436C9A923133FD97993A','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('17B2A712C1B94C7781A7EF59F92E7876','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('18902F26B91A43EABFA170EA4F4BFF3F','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('1A29005F3099498CBA07A1BB1F88E45D','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('1B5DCE094CE0440397F881AFA2F5C7D1','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('1CCDD25E7E7D4460A615217EDF12826E','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('1E0222470C97498D89C9703A85B1FCDA','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('1E457255864A4293AC37CFDD2EB35320','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('1F56C8E0A1774D3089D28A27F3C2048B','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('23B578218F2C4DC49C3E9C9EF22EEE0C','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('23EA4B86880F44499A5EF9EC328101FC','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('25BC10F398FB4609A5D1018960C1AC1C','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('25F04A559C294FA2877B13A47ED4026E','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('268CB8DE01F94E4895627B07693B42A2','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('27A3284EC3544D728C1AF3E3569F88EA','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('27A93029BDC94F9C8DF01EB11AD5B57F','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('287D32EDCA304B81BBB0726174A1BE1D','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('290CE03937D244E58B9B65DD1B98599C','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('2BBAC6B8D48E48CA836A473A57AD4D87','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('2DB716A95FC44051A2C01E9A13BFB66C','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('2E3070E67F764290ADCD5DF4783F7376','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('2EDB7E6100E64AAF982B01079BF2837E','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('2FF827F01F324C819AC5AC7288DB86FA','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('3082478AA8F64890A3156F099684009B','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('30913DB1D4924DD9BBC86220F7CE99D9','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('31CF176B44044D75ACB4F4C2D3754A1A','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('32DA38761BDA4A4A9A3ABC06880438D1','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('3343859DBE6D4786BAB5BF299C5C0E9A','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('33659848B6054BC590972E92D482FB4B','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('3643D012DB5A4531A4EAA5947DA5B6BB','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('369007720f584c5a9069518b12f2720d','攀爬','frak','2016-11-19 11:47:40','<p>f&#39;s&#39;da&#39;f</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','1000000000','2','T','2016-11-19 11:47:13','admin','admin'),('369007720f584c5a9069518b2f2720d7','攀爬','frak','2016-11-19 11:47:40','<p>f&#39;s&#39;da&#39;f</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','1000000000','2','T','2016-11-19 11:47:13','admin','admin'),('369007720f584c5a9069518b2f4720d7','攀爬','frak','2016-11-19 11:47:40','<p>f&#39;s&#39;da&#39;f</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','1000000000','5','T','2016-11-19 11:47:13','admin','admin'),('369007720f584c5a9069518b2f4720gf','攀爬','frak','2016-11-19 11:47:40','<p>f&#39;s&#39;da&#39;f</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','1000000000','5','T','2016-11-19 11:47:13','admin','admin'),('369007720f584c5a9069518h2f2720d7','攀爬','frak','2016-11-19 11:47:40','<p>f&#39;s&#39;da&#39;f</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','1000000000','11','T','2016-11-19 11:47:13','admin','admin'),('369007720f584c5a906951fb2f2720d7','攀爬','frak','2016-11-19 11:47:40','<p>f&#39;s&#39;da&#39;f</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','1000000000','8','T','2016-11-19 11:47:13','admin','admin'),('369007720f584c5a906951pppf2720d7','攀爬','frak','2016-11-19 11:47:40','<p>f&#39;s&#39;da&#39;f</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','1000000000','8','T','2016-11-19 11:47:13','admin','admin'),('369007720f584c5a90695d8b2f4720d7','攀爬','frak','2016-11-19 11:47:40','<p>f&#39;s&#39;da&#39;f</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','1000000000','14','T','2016-11-19 11:47:13','admin','admin'),('369007720f584c5a906v51fb2f2720d7','攀爬','frak','2016-11-19 11:47:40','<p>f&#39;s&#39;da&#39;f</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','1000000000','17','T','2016-11-19 11:47:13','admin','admin'),('369007720f58fdc5a906v51fb2f2720d','攀爬','frak','2016-11-19 11:47:40','<p>f&#39;s&#39;da&#39;f</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','1000000000','17','T','2016-11-19 11:47:13','admin','admin'),('3690077qqq84c5a90695d8b2f4720d74','攀爬','frak','2016-11-19 11:47:40','<p>f&#39;s&#39;da&#39;f</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','1000000000','14','T','2016-11-19 11:47:13','admin','admin'),('36B103F6E4544CD7BBE37C7D1FD253CF','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('371BE3ECFE674EABB7B1CE9FE74D0B9F','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('37A2E15C66FA44C68DF1405A543C9FF6','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('37D3ECAEE1AC43079A9107B45C2AB7C1','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('37F9A48B23FE44B2875091D3AE293870','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('3AF198CACD5942EDAB2E6DF80E9431A7','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('3E2A809A9AE84980BA896F55A494C84E','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('3FCBE7F0135A465ABF329BC89062BB27','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('40D5CC987BB04F789937F8D4F3FB8EAE','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('410EB52CE52749DD9E7FDB4838BA494F','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('430BACB761EC4EBEA2608AE8AE3D2008','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('4364316C8A7647B4B45218A4651DE9BF','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('44C6C37E9AF842CC8141602B4C22D263','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('45EFD48E77C340018EBFC2C262F574A0','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('464EEAB00F9747799AB70302C836788D','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('48829DCDA0A54A5E96B2C61C2AB5DF03','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('48A7F8B83AE04E93A6C83A8E23669CDA','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('4BFA697336E840348DA265CA614D40F8','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('4C9993DDB73B459CADB849DB928E4A29','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('4CB3769B3C1A4EAD82BAD37375B6F685','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('4F7BD1D05A474C109E9A1E2C32F76134','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('563352C653914F6C8736F71C68C133DC','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('566BB2C801CE48F097F0A46F0FC75F4D','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('567AB9E588464FD589CA54B777A9A183','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('5860EB312BD04DEAAD047AE829196B47','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('58CD8670DB364A068218AD8D3D828405','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('599C29B835F34B63AF6C61454C215EDA','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('5B88401F3B7147799BB8621259118E93','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('5C3AD88420CB47D18506C6BED253D9A0','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('5F9258228D0B49629D2F08F033D08753','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('6039C74BC9DF4A969B020A0D1F617391','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('60671F6BE7B741F48A2F8AAF00BD19F8','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('62604A5548454671A150D3B822CF224D','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('643B239E2CBE422784B4804B3A96FF24','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('6447FF885B194B7D9C68E7C38ACFB028','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('651E6C60DF3B4E449488988B31C28871','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('6743A4162A934CDCB2A18F3CBC2BC01B','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('6C53830492CD4A2EA70FDBD6EE5AD7EF','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('6D6EA6C85C75449D9FE7D3095118614B','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('6FE6AFFE2BFA4301AA9959D53D1393A9','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('7119C00A53BF45E6BB794B5C0E6AC3AE','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('71977DBB41A348F3B251E3B40DCCCAAC','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('738A6AB5D23C4E41A953A641DE988FDB','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('7398F4F24A7543CB8958370F707D61DB','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('742192E99D274EAC84D1701E24947390','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('7460E161B15E4ECCAE9B2B8A721B4113','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('75B1BB395CE64CD7B45B238925DB7026','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('75f5ad36bca34351963eb6d67c4e5157','00000000000','0','2017-01-25 13:46:29','<h1>一概述</h1>\r\n\r\n<p><span style=\"font-family:microsoft yahei; font-size:14px\">Git：xhf_buanch_test代表的是当前分支，一般情况下我们的当前分之是master。Local Branches：表示本地仓库中的分支，本地的分支都是从Remote Branches中checkout而来的，选择想要下载的远程分支，右键选择check out as new local branch，然后选择ok，在Local Branches中就会增加一个本地分支。</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-family:microsoft yahei; font-size:14px\">&nbsp; &nbsp; &nbsp; &nbsp;但是分支之间怎么切换呢，提交代码的时候提交到的是哪个分支呢？</span></p>\r\n\r\n<p><span style=\"font-family:microsoft yahei; font-size:14px\">&nbsp; &nbsp; &nbsp; &nbsp;当前分支是什么默认提交到的就是哪个分支，所以想要修改哪个分支，就切换到本地的哪个分支，但是在分支切换的时候会出现一些问题，为了避免这些问题的出现，最好保证如下点。</span></p>\r\n\r\n<p><span style=\"font-family:microsoft yahei; font-size:14px\">&nbsp; &nbsp; &nbsp; &nbsp;3.1切换之前ctrl+k，确保没有未提交到本地仓库的文件</span></p>\r\n\r\n<p><span style=\"font-family:microsoft yahei; font-size:14px\">&nbsp; &nbsp; &nbsp; &nbsp;3.2切换之前先更新，把这个分支更新为最新的code。</span></p>\r\n\r\n<p><span style=\"font-family:microsoft yahei; font-size:14px\">&nbsp; &nbsp; &nbsp; &nbsp;然后选择Local Branches中的分支切换为当前分支。可能会出现如下问题，比如分支A_1和分支A_2 两个分支，当A_1中添加了一些文件，但是还没有commit的时候，这时候切换分支到A_2 , A_2中也会有A_1中未提交的文件。</span></p>\r\n\r\n<h1>二 代码</h1>\r\n\r\n<pre>\r\n<span style=\"color:#cc7832\">package </span>com.zhongmc.blog.controller<span style=\"color:#cc7832\">;\r\n</span>\r\n<span style=\"color:#cc7832\">import </span>com.zhongmc.blog.dao.UserMapper<span style=\"color:#cc7832\">;\r\n</span><span style=\"color:#cc7832\">import </span>com.zhongmc.blog.domain.User<span style=\"color:#cc7832\">;\r\n</span><span style=\"color:#cc7832\">import </span>org.springframework.beans.factory.annotation.<span style=\"color:#bbb529\">Autowired</span><span style=\"color:#cc7832\">;\r\n</span><span style=\"color:#cc7832\">import </span>org.springframework.stereotype.<span style=\"color:#bbb529\">Controller</span><span style=\"color:#cc7832\">;\r\n</span><span style=\"color:#cc7832\">import </span>org.springframework.web.bind.annotation.<span style=\"color:#bbb529\">PathVariable</span><span style=\"color:#cc7832\">;\r\n</span><span style=\"color:#cc7832\">import </span>org.springframework.web.bind.annotation.<span style=\"color:#bbb529\">RequestMapping</span><span style=\"color:#cc7832\">;\r\n</span><span style=\"color:#cc7832\">import </span>org.springframework.web.bind.annotation.<span style=\"color:#bbb529\">ResponseBody</span><span style=\"color:#cc7832\">;\r\n</span>\r\n<em>/**\r\n</em><em> * Created by ZMC on 2017/1/16.\r\n</em><em> */\r\n</em><span style=\"color:#bbb529\">@Controller\r\n</span><span style=\"color:#cc7832\">public class </span>UserController {\r\n    <span style=\"color:#bbb529\">@Autowired\r\n</span><span style=\"color:#bbb529\">    </span>UserMapper <span style=\"color:#9876aa\">userMapper</span><span style=\"color:#cc7832\">;\r\n</span>\r\n<span style=\"color:#cc7832\">    </span><span style=\"color:#bbb529\">@RequestMapping</span>(<span style=\"color:#6a8759\">&quot;/user/{username}&quot;</span>)\r\n    <span style=\"color:#bbb529\">@ResponseBody\r\n</span><span style=\"color:#bbb529\">    </span><span style=\"color:#cc7832\">public </span>String <span style=\"color:#ffc66d\">user</span>(<span style=\"color:#bbb529\">@PathVariable</span>(<span style=\"color:#6a8759\">&quot;username&quot;</span>) String username){\r\n        User user = <span style=\"color:#9876aa\">userMapper</span>.findOneByUserName(username)<span style=\"color:#cc7832\">;\r\n</span><span style=\"color:#cc7832\">        return </span>user.toString()<span style=\"color:#cc7832\">;\r\n</span><span style=\"color:#cc7832\">    </span>}\r\n}\r\n</pre>\r\n','','48d1d2dac7ff403d8869182eaa18200c','0000','00','T','2017-01-25 13:43:52','admin','admin'),('7C3BDEAA826B473BB9F97799EFA7A602','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('7CE2F9ADF82A4F9FADBCA0E3B93A1B12','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('7df85cc459b141f7a2d15e459faf500c','321','321','2016-11-20 17:37:51','<p>11</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','111','6','T','2016-11-20 17:37:51','admin',NULL),('7df85cc459b141f7a2d15e4c9faf500c','321','321','2016-11-20 17:37:51','<p>11</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','111','3','T','2016-11-20 17:37:51','admin',NULL),('7df85cc459b141f7a2d15egc9faf500c','321','321','2016-11-20 17:37:51','<p>11</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','111','9','T','2016-11-20 17:37:51','admin',NULL),('7df85cc459b141f7a2d15egc9fnf500c','321','321','2016-11-20 17:37:51','<p>11</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','111','18','T','2016-11-20 17:37:51','admin',NULL),('7df85cc459b141f7a2d1he459faf500c','321','321','2016-11-20 17:37:51','<p>11</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','111','15','T','2016-11-20 17:37:51','admin',NULL),('7df85cc459b141f7a2d1he4c9faf500c','321','321','2016-11-20 17:37:51','<p>11</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','111','12','T','2016-11-20 17:37:51','admin',NULL),('7df85cc459b141fkkkegc9faf500c3a','321','321','2016-11-20 17:37:51','<p>11</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','111','9','T','2016-11-20 17:37:51','admin',NULL),('7df85cc459b14fgrea2d15egc9fnf500','321','321','2016-11-20 17:37:51','<p>11</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','111','18','T','2016-11-20 17:37:51','admin',NULL),('7df85cc459biiii9faf500c51q','321','321','2016-11-20 17:37:51','<p>11</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','111','15','T','2016-11-20 17:37:51','admin',NULL),('7drtryc459b141f7a2d1he4c9faf500c','321','321','2016-11-20 17:37:51','<p>11</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','111','12','T','2016-11-20 17:37:51','admin',NULL),('7F0D0C0AD15947E29E7E2AA143795BC7','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('7F1B773D67C24FBABF73C7ABB28286CF','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('7F525CAE01934F0CA471323AEBEE66EB','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('837752A35A4749B789103D000F1EF32E','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('873C810634DD47BEBA01D8D42382D273','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('877E0BF894334BDB8BC2E9ADF59C74B4','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('87B1717574B84EF5BD43A060C21C12BD','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('882053F9EE0E4387B578C4D61449E8F7','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('886E9A1ABD8040079BF99C1FD982C84B','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('8AC0A1F6CAE34C3C9CD272F7AC42E6B8','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('8B10B4D984DE48F2A5E231DAFC1937E7','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('8CB14E0C650146B983D2BB5F01ACCCD5','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('8E61C9E9FE094CE7A0C8E9E5D9E3D38E','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('90CFF89BFC094ED2A0F6C24C870C92A8','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('91FF8A0F4B814F8381000E2A5ACE15AB','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('924018F8BB004D7A8EE81CA3B9F1D228','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('92B2C6949BA44B21B5219A5F76FCB6EE','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('95079E0037104B7FACA1A4663B9A18CF','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('95482B16366440C1800EB9612C4A83B0','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('9716F5C90B0148EAB1F899149ACC67E3','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('97835941D5B444E18186326350F5A74A','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('97A4EE648B9345B5950602D58E24E2F5','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('98884375DCF94A54BF7251BE33B11D9A','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('991CBA025D914F5B87507AB25F899B07','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('9C09D4BC56414CFDAAF432BAF1A6D8FE','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('9DA8D7F07D9C4225A15159B93EB774C6','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('A4954B593D42412BB3D51BDD3F77F9FF','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('A57DDFD3835C45348A7042B4BA400213','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('A5F35E89B6A9484C8C1EDAEB464FABAA','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('A86A99F1A2DB4E299D40C0F0575AD2BB','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('A9AE41364B9C48849D0A14ED0EBE1FE0','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('AA41D5A2647841CB96C54D01B49A84E8','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('ACED195E71B94077B9115FCF18573927','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('AE2C2D27CFB84E68A1060D9661719A0D','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('B010A0FF41484049B16C5A87C669E8F9','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('B01F3C06A4AF42CA905F8E53CAF1E58F','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('B07CAD16796A4B928A286C36837F7D45','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('B0DF8434A082464EB7621B102BEB1F69','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('B1119239C26D45128C54BB74E24CDD17','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('B217CD768B0C407F90372675DDB671D4','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('B2391E7E448D4D5D879CA167C8B7D9B8','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('B31C762BB7C1480EBBA3A67C6B92E415','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('B3427937100644769858592AEDBB86A7','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('B465FF64F63B4BBC9B56179AD5E49ED9','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('B50363C866FA4AF9AC14714A89A38182','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('B6293152491746128374A0B5789550A5','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('B6DDAB1EB28742A187FF106DC2A70E65','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('B9B20DA522ED4FBAB45456A4D61C3655','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('BAC3E92E302141999D54508BD7A2F059','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('BAFFC09A91BD4426B53560FFA6E5D90A','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('BC15E1A1149F415890FCE94AA6637DC1','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('BCA1E6564B864ABAA009D52AF139F64E','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('BD11B9869EBA40D8A19867736A80E95E','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('C14543C00A8E4431AFBFBDBAD60D30DC','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('C1A73E67F5634987A2F21482C44E9320','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('C4B9F56FC085483989E2F4085C241231','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('C65F25B85B414851AB5FF7A027357246','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('C888DFD5AF8B4CB3B5F855F1A91D9720','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('CF3A81C3B1014F899162A2F9BC1DE6F5','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('CFB419AC766547668FC65009E9BDD32A','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('D0FACF67E446474799F232818F8CD1D2','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('D12B175123294150A18AE0C90304F67E','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('D1685C7A0D864D909541179ABBB322F8','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('D48C5F7989664D938B9EABFF0A67E863','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('D49ADEBBF42145ED99D434E95E5418D4','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('D55A8E9144E646CA93E0A7FA82705B88','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('D75082BED7824817B8F9BF25C2CF4F1F','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('D874FE1367FC44C8AEFF7A076CFD4695','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('DAA08F3D33CC49B59C835E76CCA235AB','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('DACBA061CC7347B590317E350E35A443','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('DB6306C2CE1B401186598D2C542FF7E6','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('DC9C8D51C3FC4F829707FBC85101431D','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('DD0D9760D21F4807927289135E6F621A','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('DD142F2B42C649A5894F32A3D5099E85','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('DD5A391D357848DBB6EA0F950EF02385','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('DED997D5611D4009A619818AAD4C2069','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('E157D8DA973E4C1BB3BD01BEA8D52C22','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('E331357F3E104453AC7E8DBA296F9679','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('E3B0D311D40E4B5185ECB623398561A7','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('E503B370A65744DFA5C84E49D6619A27','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('E7944C3181A2431C89CC90BE8FED36B6','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('E7CA171A66D34C82A4E4CB7020475957','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('E8DF8C73C712440BBDBEC28A8F544959','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('EB0DEA57018F46D7B0DDDB139EA633BD','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('EBE9B8E19D094C0BBECCDC2479805E4A','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('EC3AD63A096A4DAFB386E42F80C745A1','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('F1E7C3506CE84FCFB7DD9D967B157391','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('F2BBFD64D78E4174BC2E81B86558E157','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('F4289D5F9DDA44BCA9EE0E1312E34665','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('F535C7CB56874E23A8BCA1322273E229','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('F562E1CC305049B19131CD2F925271A1','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('F600B09821374982843B23BDB5463A6B','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('F63F80818D8843F080343329ABFDE349','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('F6D566B2972E4C359A47F622676FBAF4','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('F7B7618616B94295AC384AA02E7065F7','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('F8E985B476D74215A8B2B0BF6B6B4D63','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('FAD173DEDD434F6BAF514F68A61FE1D9','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('FB8D633371484F27B845188E3FC09B4C','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('FC7E014E0D5041E6AF6FC81C4EF25193','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('FCDD23BF588D4477BB2B83AD67761363','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('FD6EEEC2520E45C69FB8500A8B253400','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('FE090260802249EC8A939A709EFB3A76','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('FE6C59B900D9432E9F0B379250BB36C0','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('FF85893D021540BDAD2A2E4069313DCE','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/t3.jpg','42daec416efd4a71a1557dc035d6818f','10000','4','T','2016-11-19 11:18:47','admin','admin'),('qdsfsdfdf','游泳','kenel','2016-11-20 17:27:10','<p>ddddddd</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','10000','16','T','2016-11-19 11:18:47','admin','admin'),('qwdwdefgf','321','321','2016-11-20 17:37:51','<p>11</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','111','6','T','2016-11-20 17:37:51','admin',NULL),('sdgdagdgh','攀爬','frak','2016-11-19 11:47:40','<p>f&#39;s&#39;da&#39;f</p>\r\n','/ostp/userfiles/images/2016/12/26/1.jpg','42daec416efd4a71a1557dc035d6818f','1000000000','11','T','2016-11-19 11:47:13','admin','admin');
/*!40000 ALTER TABLE `courseinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursetype`
--

DROP TABLE IF EXISTS `coursetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursetype` (
  `CourseTypeID` char(32) NOT NULL COMMENT '教程类型编号',
  `CourseTypeName` varchar(20) NOT NULL COMMENT '运动详细类别的名称',
  `Note` int(5) NOT NULL COMMENT '运动所属的大分类id',
  PRIMARY KEY (`CourseTypeID`),
  UNIQUE KEY `CourseTypeID_UNIQUE` (`CourseTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教程：教程分类信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursetype`
--

LOCK TABLES `coursetype` WRITE;
/*!40000 ALTER TABLE `coursetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `coursetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equip`
--

DROP TABLE IF EXISTS `equip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equip` (
  `EquipID` char(32) NOT NULL COMMENT '装备唯一标识',
  `EquipName` varchar(20) NOT NULL COMMENT '装备名字',
  `EquipPrice` varchar(20) NOT NULL COMMENT '装备价格',
  `EquipParam` varchar(20) NOT NULL COMMENT '装备参数',
  `EquipRecommend` char(1) DEFAULT NULL COMMENT '推荐',
  `SportTypeID` char(32) DEFAULT NULL COMMENT '运动类型',
  `EquipTypeID` char(32) DEFAULT NULL COMMENT '装备功能类型',
  `Note` varchar(200) DEFAULT NULL COMMENT '备注',
  `Enabled` char(1) DEFAULT NULL COMMENT '逻辑删除标志',
  `UpdateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime DEFAULT NULL COMMENT '创建时间',
  `UpdateBy` varchar(255) DEFAULT NULL COMMENT '更新者',
  `CreateBy` varchar(255) DEFAULT NULL COMMENT '创建者',
  `EquipImage` varchar(255) DEFAULT NULL COMMENT '封面图片',
  PRIMARY KEY (`EquipID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='装备：装备';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equip`
--

LOCK TABLES `equip` WRITE;
/*!40000 ALTER TABLE `equip` DISABLE KEYS */;
INSERT INTO `equip` VALUES ('119AC153DF224AD48189034945AA03E5','头盔2','200','无','1','42daec416efd4a71a1557dc035d6818f','4994769b5c1b44bf84d6efeea5f6771e','<p>321321</p>\r\n','1','2016-11-20 17:46:14','2016-11-12 17:56:04','admin','admin',''),('366FF6D11604431ABCF174835D584CA6','1','1','1','1','42daec416efd4a71a1557dc035d6818f','4994769b5c1b44bf84d6efeea5f6771e',NULL,'1','2016-11-20 15:51:31','2016-11-19 11:56:38','admin','admin','/ostp/userfiles/images/2016/11/20/019.jpg'),('6AFCBDAE11D14491A1D142030BC74A2D','111','11','11','1','42daec416efd4a71a1557dc035d6818f','4994769b5c1b44bf84d6efeea5f6771e',NULL,'1','2016-11-20 15:52:50','2016-11-13 15:30:30','admin','admin',''),('7B0BCEEDDA9C4E758A3B371811098E97','321tt321321','321','3213','1','42daec416efd4a71a1557dc035d6818f','4994769b5c1b44bf84d6efeea5f6771e','<p>321</p>\r\n','1','2016-11-18 23:42:51','2016-11-18 23:42:51','admin','admin','/ostp/userfiles/images/t01f607aaebdab49126(1).jpg'),('89A8F31CCE944E07A9B09AFA9AD6F56D','2','2','2','1','42daec416efd4a71a1557dc035d6818f','4994769b5c1b44bf84d6efeea5f6771e','<p>2</p>\r\n','1','2016-11-19 11:56:59','2016-11-19 11:56:59','admin','admin',''),('8CFC419292DB4BF2A3C000B54C15426B','asdg','444','fsda','1','42daec416efd4a71a1557dc035d6818f','4994769b5c1b44bf84d6efeea5f6771e','<p>ryjyt</p>\r\n','1','2016-11-20 17:40:27','2016-11-20 17:40:27','admin','admin','/ostp/userfiles/images/2016/11/20/t0132376249b987a37e.jpg'),('A746AB785C57446898C519F6E2F34021','rwedddd','32311','fds','0','42daec416efd4a71a1557dc035d6818f','4994769b5c1b44bf84d6efeea5f6771e',NULL,'0','2016-11-18 23:22:31',NULL,'admin',NULL,'/ostp/userfiles/files/t0132376249b987a37e.jpg'),('BD4EA26DD04947918377CA834EB86C53','rwe','121','rwe','1','42daec416efd4a71a1557dc035d6818f','4994769b5c1b44bf84d6efeea5f6771e',NULL,'1','2016-11-18 23:22:21',NULL,'admin',NULL,'/ostp/userfiles/files/t0132376249b987a37e.jpg'),('BEC1EFACED0243F4ABA66F231CF7D212','gsdfg','gsfdg','gsdfg','1','1','1','gsdfg','1',NULL,'2016-11-06 14:02:20',NULL,'admin',NULL),('C3B1AA29123449B69CAD505FEC2AF61A','111hfdghfgh','312','312','1','42daec416efd4a71a1557dc035d6818f','4994769b5c1b44bf84d6efeea5f6771e','<p>yrty</p>\r\n','1',NULL,'2016-11-18 23:40:54',NULL,'admin','/ostp/userfiles/images/111_jpg.jpg'),('CB66E203325A4A94BC93D6D73C481C12','1122','11','222','1','42daec416efd4a71a1557dc035d6818f','4994769b5c1b44bf84d6efeea5f6771e','															<p>3333</p>\n\n														','1','2016-11-13 15:26:23','2016-11-13 15:26:13','admin','admin',NULL),('CC3B869F301A405B9DC3F9E6631952BA','321','321','312','1','1','1','312','1',NULL,'2016-11-02 16:59:57',NULL,'admin',NULL),('D543AE53234542F7B46A326B3D5B085D','11','23.11','31','1','6a0dd31de8a24eb0ae72c6e803d2f45d','4994769b5c1b44bf84d6efeea5f6771e','3213','1',NULL,'2016-11-08 21:41:41',NULL,'admin',NULL),('E8AD442E4E1640278FFAC4B5048D0914','321tt','312','312','1','42daec416efd4a71a1557dc035d6818f','4994769b5c1b44bf84d6efeea5f6771e','<p>vnm,mbn,</p>\r\n','1',NULL,'2016-11-18 23:39:22',NULL,'admin','/ostp/userfiles/files/t0132376249b987a37e.jpg');
/*!40000 ALTER TABLE `equip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipevaluate`
--

DROP TABLE IF EXISTS `equipevaluate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipevaluate` (
  `EvaluteID` char(32) NOT NULL COMMENT '评测唯一标识',
  `Title` varchar(20) NOT NULL COMMENT '测评标题',
  `Author` varchar(20) NOT NULL COMMENT '作者',
  `PublishTime` varchar(20) NOT NULL COMMENT '发布时间',
  `Origin` varchar(20) NOT NULL COMMENT '来源',
  `EquipID` char(32) NOT NULL COMMENT '关联装备编号',
  `Content` varchar(5000) DEFAULT NULL COMMENT '内容',
  `Enabled` char(1) DEFAULT NULL COMMENT '逻辑删除标志',
  PRIMARY KEY (`EvaluteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='装备：测评';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipevaluate`
--

LOCK TABLES `equipevaluate` WRITE;
/*!40000 ALTER TABLE `equipevaluate` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipevaluate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infofirstleveltype`
--

DROP TABLE IF EXISTS `infofirstleveltype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infofirstleveltype` (
  `FirstLevelInfoTypeID` char(32) NOT NULL COMMENT '资讯一级类型标识',
  `FirstLevelInfoTypeName` varchar(20) NOT NULL COMMENT '咨讯一级分类名称',
  `Note` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FirstLevelInfoTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资讯：资讯一级类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infofirstleveltype`
--

LOCK TABLES `infofirstleveltype` WRITE;
/*!40000 ALTER TABLE `infofirstleveltype` DISABLE KEYS */;
INSERT INTO `infofirstleveltype` VALUES ('1','户外知识',NULL),('2','装备资讯',NULL),('3','专题活动',NULL),('4','赛事新闻',NULL),('5','专栏专访',NULL);
/*!40000 ALTER TABLE `infofirstleveltype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infosecondleveltype`
--

DROP TABLE IF EXISTS `infosecondleveltype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infosecondleveltype` (
  `SecondLevelInfoTypeID` char(32) NOT NULL COMMENT '资讯二级类型标识',
  `SecondLevelInfoTypeName` varchar(20) NOT NULL COMMENT '咨讯二级分类名称',
  `FirstLevelInfoTypeID` char(32) NOT NULL COMMENT '关联一级资讯',
  `Note` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`SecondLevelInfoTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资讯：资讯二级类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infosecondleveltype`
--

LOCK TABLES `infosecondleveltype` WRITE;
/*!40000 ALTER TABLE `infosecondleveltype` DISABLE KEYS */;
INSERT INTO `infosecondleveltype` VALUES ('1','户外常识','1',NULL),('10','撸哇撸','3',NULL),('11','噢噢噢噢','3',NULL),('12','啦啦啦啦','3',NULL),('13','国内新闻','4',NULL),('14','国外新闻','4',NULL),('15','小道消息','4',NULL),('16','关注热点','4',NULL),('17','达人专访','5',NULL),('18','品牌专访','5',NULL),('19','极限挑战','5',NULL),('2','安全知识','1',NULL),('3','户外公开课','1',NULL),('4','领队培训','1',NULL),('5','新品报道','2',NULL),('6','装备评测','2',NULL),('7','装备品牌','2',NULL),('8','装备行情','2',NULL),('9','你造吗？','3',NULL);
/*!40000 ALTER TABLE `infosecondleveltype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(100) DEFAULT NULL,
  `parentId` bigint(32) DEFAULT NULL COMMENT '父节点ID',
  `href` varchar(2000) DEFAULT NULL,
  `menuClass` varchar(100) DEFAULT NULL COMMENT '链接类型(_blank...)',
  `icon` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2245 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1000,'系统管理',0,'','','icon-cog',1),(1001,'基础数据管理',0,NULL,NULL,'icon-folder-open-alt',0),(1002,'资讯管理',0,NULL,NULL,'icon-dashboard',2),(1003,'装备管理',0,'','','icon-flag',3),(1004,'摄影管理',0,'','','icon-camera-retro',4),(1005,'位置管理',0,NULL,NULL,'icon-adjust',5),(1006,'教程管理',0,NULL,NULL,'icon-headphones',6),(1007,'行程管理',0,NULL,NULL,'icon-eye-open',7),(1008,'社区管理',0,NULL,NULL,'icon-comments',8),(2000,'权限管理',1000,'admin/system-authority',NULL,'icon-eye-open',9),(2001,'系统用户',1000,'admin/system-user',NULL,NULL,NULL),(2002,'角色授权管理',1000,'admin/system-role','','',0),(2003,'户外运动类型',1001,'admin/outdoorSportType-list',NULL,NULL,NULL),(2004,'户外运动',1001,'admin/outdoorSport-list',NULL,NULL,NULL),(2005,'装备功能类型',1001,'admin/equipType-list',NULL,NULL,NULL),(2006,'图像风格类型',1001,'admin/pictureStyleType-list',NULL,NULL,NULL),(2007,'位置类型类型',1001,'admin/positionType-list',NULL,NULL,NULL),(2008,'资讯列表',1002,'admin/info-list',NULL,NULL,NULL),(2009,'资讯添加',1002,'admin/info-add',NULL,NULL,NULL),(2010,'装备列表',1003,'admin/equip-list',NULL,NULL,NULL),(2011,'装备添加',1003,'admin/equip-add',NULL,NULL,NULL),(2012,'摄影列表',1004,'admin/photography-list',NULL,NULL,NULL),(2013,'摄影添加',1004,'admin/photography-add',NULL,NULL,NULL),(2014,'位置列表',1005,'admin/position-list',NULL,NULL,NULL),(2015,'位置添加',1005,'admin/position-add',NULL,NULL,NULL),(2016,'教程列表',1006,'admin/course-list',NULL,NULL,NULL),(2017,'教程添加',1006,'admin/course-add',NULL,NULL,NULL),(2018,'行程列表',1007,'admin/travel-list',NULL,NULL,NULL),(2019,'行程添加',1007,'admin/travel-add',NULL,NULL,NULL),(2020,'社区列表',1008,'admin/community_list',NULL,NULL,NULL),(2021,'社区添加',1008,'admin/community_add',NULL,NULL,NULL),(2022,'菜单管理',1000,'admin/system-menu','','',0),(2200,'xxxx',2000,'xxx',NULL,'icon-eye-open',NULL),(2222,'tttt',2200,'tttt',NULL,'icon-eye-open',NULL),(2223,'test',1000,'test','test','test',1),(2226,'tttt1',2222,'test','','',0),(2227,'tttt2',2226,'fff','','',1),(2234,'用户管理',1000,'','','',0),(2235,'23432',2000,'','','',0),(2236,'问题列表',1008,'admin/community-questions-list','','',0),(2237,'问题添加',1008,'admin/community-questions-add','','',0),(2238,'EasyUI',0,'','','icon-book',15),(2239,'EasyUITable',2238,'admin/toeasyuiTable','','',0),(2242,'轮播图管理',0,'','','icon-book',10),(2243,'轮播图列表',2242,'admin/carousel-list','','',0),(2244,'首页导航栏管理',1000,'admin/navigationbar-list','','',0);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigationbar`
--

DROP TABLE IF EXISTS `navigationbar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigationbar` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '网站首页导航栏',
  `menuName` varchar(200) CHARACTER SET utf8 NOT NULL COMMENT '网站首页导航按钮名字',
  `href` varchar(1000) CHARACTER SET utf8 NOT NULL COMMENT '跳转地址',
  `sequence` int(11) NOT NULL COMMENT '按钮排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigationbar`
--

LOCK TABLES `navigationbar` WRITE;
/*!40000 ALTER TABLE `navigationbar` DISABLE KEYS */;
INSERT INTO `navigationbar` VALUES (1,'首页','index.jsp',1),(2,'咨询','info.jsp',0),(3,'装备','bz',3),(4,'摄影','sy',4),(5,'位置','wz',5),(6,'教程','jc',6),(7,'攻略','gl',7),(8,'社区','sq',8);
/*!40000 ALTER TABLE `navigationbar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photophotography`
--

DROP TABLE IF EXISTS `photophotography`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photophotography` (
  `PictureID` char(32) NOT NULL COMMENT '照片唯一标识',
  `Title` varchar(20) NOT NULL COMMENT '照片标题',
  `Author` varchar(20) NOT NULL COMMENT '作者',
  `PublishTime` varchar(20) NOT NULL COMMENT '发布时间',
  `Origin` varchar(20) DEFAULT NULL COMMENT '来源',
  `SportTypeID` char(32) DEFAULT NULL COMMENT '运动类型编号',
  `StyleTypeID` char(32) DEFAULT NULL COMMENT '风格类型编号',
  `LevelType` char(2) DEFAULT NULL COMMENT '等级（1是精品、0是普通）',
  `PhotoParam` varchar(2000) DEFAULT NULL COMMENT '照片参数',
  `Introduction` varchar(300) DEFAULT NULL COMMENT '照片感言',
  `CurrentLikeTimes` char(32) DEFAULT NULL COMMENT '当日点赞数',
  `TotalLikeTimes` char(32) DEFAULT NULL COMMENT '总点赞数',
  `PhotoUrl` varchar(100) DEFAULT NULL COMMENT '照片链接',
  `ThumbPhotography` varchar(100) DEFAULT NULL COMMENT '照片缩略图',
  `Enabled` char(1) DEFAULT NULL COMMENT '逻辑删除标志',
  PRIMARY KEY (`PictureID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='摄影：摄影';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photophotography`
--

LOCK TABLES `photophotography` WRITE;
/*!40000 ALTER TABLE `photophotography` DISABLE KEYS */;
INSERT INTO `photophotography` VALUES ('18CC76CD36D14E60AB6C3B5F662E7113','胸大','雄大','2016-12-26 22:20:22','华东交大','56a3c9dc48a840afb0b8daefe3bb14e0','5be20b23916d47f490d4079682b8638c','1','1','<p>有的时候导游推荐的项目其实也不是刻意途中加钱，还是值得一去的，而且现在的景区都有学生和老人优惠，连我这种海外的学生证都可以一起使用。</p>\r\n\r\n<p>去张家界的途中临时加了宝峰湖和魅力湘西的演出。</p>\r\n\r\n<p>一路上都在听导游说宝峰浮宝峰浮...到了地才知道...果然，他说的是宝峰湖。</p>\r\n\r\n<p>之前还是不少节目来取景过的地方。</p>\r\n\r\n<p>听听少数民族妹纸的山歌，在小船上看看景色，对个歌子也是不错的体验</p>\r\n','1','1','/ostp/userfiles/images/2016/12/26/bp3.jpg',NULL,NULL),('4BD726C4BA934D78A1DD70C350B4B27A','乡村游泳','abc','2016-12-26 22:13:40','非洲','56a3c9dc48a840afb0b8daefe3bb14e0','5be20b23916d47f490d4079682b8638c','1','11','<p>有的时候导游推荐的项目其实也不是刻意途中加钱，还是值得一去的，而且现在的景区都有学生和老人优惠，连我这种海外的学生证都可以一起使用。</p>\r\n\r\n<p>去张家界的途中临时加了宝峰湖和魅力湘西的演出。</p>\r\n\r\n<p>一路上都在听导游说宝峰浮宝峰浮...到了地才知道...果然，他说的是宝峰湖。</p>\r\n\r\n<p>之前还是不少节目来取景过的地方。</p>\r\n\r\n<p>听听少数民族妹纸的山歌，在小船上看看景色，对个歌子也是不错的体验。</p>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n','11','11','/ostp/userfiles/images/2016/12/26/bp1.jpg',NULL,NULL),('59A1A3B4F1FE4F29A1938C344C21332D','登珠峰','董队','2016-12-26 22:25:32','华东交大','46c8dfd3a7cf443e96507698e0495c43','5be20b23916d47f490d4079682b8638c','1','1','<p>有的时候导游推荐的项目其实也不是刻意途中加钱，还是值得一去的，而且现在的景区都有学生和老人优惠，连我这种海外的学生证都可以一起使用。</p>\r\n\r\n<p>去张家界的途中临时加了宝峰湖和魅力湘西的演出。</p>\r\n\r\n<p>一路上都在听导游说宝峰浮宝峰浮...到了地才知道...果然，他说的是宝峰湖。</p>\r\n\r\n<p>之前还是不少节目来取景过的地方。</p>\r\n\r\n<p>听听少数民族妹纸的山歌，在小船上看看景色，对个歌子也是不错的体验</p>\r\n','1','1','/ostp/userfiles/images/2016/12/26/bp6.jpg',NULL,NULL),('5A5EDD4A9690487383A52B947512C035','冰川','植物','2016-12-26 22:29:12','澡堂','48d1d2dac7ff403d8869182eaa18200c','5be20b23916d47f490d4079682b8638c','1','1','<p>有的时候导游推荐的项目其实也不是刻意途中加钱，还是值得一去的，而且现在的景区都有学生和老人优惠，连我这种海外的学生证都可以一起使用。</p>\r\n\r\n<p>去张家界的途中临时加了宝峰湖和魅力湘西的演出。</p>\r\n\r\n<p>一路上都在听导游说宝峰浮宝峰浮...到了地才知道...果然，他说的是宝峰湖。</p>\r\n\r\n<p>之前还是不少节目来取景过的地方。</p>\r\n\r\n<p>听听少数民族妹纸的山歌，在小船上看看景色，对个歌子也是不错的体验</p>\r\n','1','1','/ostp/userfiles/images/2016/12/26/bp9.jpg',NULL,NULL),('8236E231D8E14BF7AE013B94AC444C83','江西风景','董队','2016-12-26 22:21:16','华东啊就','42daec416efd4a71a1557dc035d6818f','5a944e3ed8fa4bfb9202f02f5be2af4d','1','21','<p>有的时候导游推荐的项目其实也不是刻意途中加钱，还是值得一去的，而且现在的景区都有学生和老人优惠，连我这种海外的学生证都可以一起使用。</p>\r\n\r\n<p>去张家界的途中临时加了宝峰湖和魅力湘西的演出。</p>\r\n\r\n<p>一路上都在听导游说宝峰浮宝峰浮...到了地才知道...果然，他说的是宝峰湖。</p>\r\n\r\n<p>之前还是不少节目来取景过的地方。</p>\r\n\r\n<p>听听少数民族妹纸的山歌，在小船上看看景色，对个歌子也是不错的体验</p>\r\n','1','1','/ostp/userfiles/images/2016/12/26/bp4.jpg',NULL,NULL),('89E9B55A3B5E44C485A765B1E9794A80','海底世界','董队','2016-12-26 22:23:23','华东交大','6e9584816d2e4c06ad026a1c45462109','5a944e3ed8fa4bfb9202f02f5be2af4d','1','1','<p>有的时候导游推荐的项目其实也不是刻意途中加钱，还是值得一去的，而且现在的景区都有学生和老人优惠，连我这种海外的学生证都可以一起使用。</p>\r\n\r\n<p>去张家界的途中临时加了宝峰湖和魅力湘西的演出。</p>\r\n\r\n<p>一路上都在听导游说宝峰浮宝峰浮...到了地才知道...果然，他说的是宝峰湖。</p>\r\n\r\n<p>之前还是不少节目来取景过的地方。</p>\r\n\r\n<p>听听少数民族妹纸的山歌，在小船上看看景色，对个歌子也是不错的体验</p>\r\n','1','1','/ostp/userfiles/images/2016/12/26/bp5.jpg',NULL,NULL),('8C7690732BA94AB1B50E86C323849A18','小猫咪','某猫','2016-12-26 22:31:58','兄外婆','42daec416efd4a71a1557dc035d6818f','5a944e3ed8fa4bfb9202f02f5be2af4d','1','1','<p>有的时候导游推荐的项目其实也不是刻意途中加钱，还是值得一去的，而且现在的景区都有学生和老人优惠，连我这种海外的学生证都可以一起使用。</p>\r\n\r\n<p>去张家界的途中临时加了宝峰湖和魅力湘西的演出。</p>\r\n\r\n<p>一路上都在听导游说宝峰浮宝峰浮...到了地才知道...果然，他说的是宝峰湖。</p>\r\n\r\n<p>之前还是不少节目来取景过的地方。</p>\r\n\r\n<p>听听少数民族妹纸的山歌，在小船上看看景色，对个歌子也是不错的体验</p>\r\n','1','1','/ostp/userfiles/images/2016/12/26/bp11.jpg',NULL,NULL),('99ECBAC8F1C54FB9876814B249CAEC3B','秋水共长天一色','源源','2016-12-26 22:30:26','水沟','56a3c9dc48a840afb0b8daefe3bb14e0','5be20b23916d47f490d4079682b8638c','1','1','<p>有的时候导游推荐的项目其实也不是刻意途中加钱，还是值得一去的，而且现在的景区都有学生和老人优惠，连我这种海外的学生证都可以一起使用。</p>\r\n\r\n<p>去张家界的途中临时加了宝峰湖和魅力湘西的演出。</p>\r\n\r\n<p>一路上都在听导游说宝峰浮宝峰浮...到了地才知道...果然，他说的是宝峰湖。</p>\r\n\r\n<p>之前还是不少节目来取景过的地方。</p>\r\n\r\n<p>听听少数民族妹纸的山歌，在小船上看看景色，对个歌子也是不错的体验</p>\r\n','1','1','/ostp/userfiles/images/2016/12/26/bp10.jpg',NULL,NULL),('C31D33027C1241C28086FEB0AF48059A','探索自然','郭队','2016-12-26 22:27:36','江西理工','42daec416efd4a71a1557dc035d6818f','5a944e3ed8fa4bfb9202f02f5be2af4d','1','1','<p>有的时候导游推荐的项目其实也不是刻意途中加钱，还是值得一去的，而且现在的景区都有学生和老人优惠，连我这种海外的学生证都可以一起使用。</p>\r\n\r\n<p>去张家界的途中临时加了宝峰湖和魅力湘西的演出。</p>\r\n\r\n<p>一路上都在听导游说宝峰浮宝峰浮...到了地才知道...果然，他说的是宝峰湖。</p>\r\n\r\n<p>之前还是不少节目来取景过的地方。</p>\r\n\r\n<p>听听少数民族妹纸的山歌，在小船上看看景色，对个歌子也是不错的体验</p>\r\n','1','1','/ostp/userfiles/images/2016/12/26/bp8.jpg',NULL,NULL),('CEBF10B08E9E487A804BBDB2EB051573','不要迷恋哥','xgress','2016-12-26 22:33:32','熊文','6e9584816d2e4c06ad026a1c45462109','5be20b23916d47f490d4079682b8638c','1','1','<p>有的时候导游推荐的项目其实也不是刻意途中加钱，还是值得一去的，而且现在的景区都有学生和老人优惠，连我这种海外的学生证都可以一起使用。</p>\r\n\r\n<p>去张家界的途中临时加了宝峰湖和魅力湘西的演出。</p>\r\n\r\n<p>一路上都在听导游说宝峰浮宝峰浮...到了地才知道...果然，他说的是宝峰湖。</p>\r\n\r\n<p>之前还是不少节目来取景过的地方。</p>\r\n\r\n<p>听听少数民族妹纸的山歌，在小船上看看景色，对个歌子也是不错的体验</p>\r\n','1','1','/ostp/userfiles/images/2016/12/26/bp12.jpg',NULL,NULL),('DC0EA4317691408AB2E4077E63D2D1BA','夕阳垂钓','熊二','2016-12-26 22:18:26','空母虎','973ce5e6815f4cf483bbb53dc04a38f6','5be20b23916d47f490d4079682b8638c','1','11','<p>&nbsp;&nbsp;&nbsp; &nbsp;</p>\r\n\r\n<p>有的时候导游推荐的项目其实也不是刻意途中加钱，还是值得一去的，而且现在的景区都有学生和老人优惠，连我这种海外的学生证都可以一起使用。</p>\r\n\r\n<p>去张家界的途中临时加了宝峰湖和魅力湘西的演出。</p>\r\n\r\n<p>一路上都在听导游说宝峰浮宝峰浮...到了地才知道...果然，他说的是宝峰湖。</p>\r\n\r\n<p>之前还是不少节目来取景过的地方。</p>\r\n\r\n<p>听听少数民族妹纸的山歌，在小船上看看景色，对个歌子也是不错的体验。</p>\r\n\r\n<p>&nbsp;</p>\r\n','1','1','/ostp/userfiles/images/2016/12/26/bp2.jpg',NULL,NULL),('E0FFBE050C33493390236280789A3FB8','乡间小道','董队','2016-12-14','华东交大','42daec416efd4a71a1557dc035d6818f','5be20b23916d47f490d4079682b8638c','1','1','<p>有的时候导游推荐的项目其实也不是刻意途中加钱，还是值得一去的，而且现在的景区都有学生和老人优惠，连我这种海外的学生证都可以一起使用。</p>\r\n\r\n<p>去张家界的途中临时加了宝峰湖和魅力湘西的演出。</p>\r\n\r\n<p>一路上都在听导游说宝峰浮宝峰浮...到了地才知道...果然，他说的是宝峰湖。</p>\r\n\r\n<p>之前还是不少节目来取景过的地方。</p>\r\n\r\n<p>听听少数民族妹纸的山歌，在小船上看看景色，对个歌子也是不错的体验</p>\r\n','1','1','/ostp/userfiles/images/2016/12/26/bp1.jpg',NULL,NULL);
/*!40000 ALTER TABLE `photophotography` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positiondetailinfo`
--

DROP TABLE IF EXISTS `positiondetailinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positiondetailinfo` (
  `PositionID` char(32) NOT NULL COMMENT '位置ID',
  `PositionTypeID` char(32) NOT NULL COMMENT '位置类型',
  `SportTypeID` char(32) NOT NULL COMMENT '运动类型（攀岩，潜水）',
  `PositionName` varchar(20) NOT NULL COMMENT '具体位置名称',
  `PositionCoordinate` varchar(10) NOT NULL COMMENT '位置坐标',
  `PositionPicture` varchar(100) DEFAULT NULL COMMENT '位置图片',
  `PositionThumbnailPicture` varchar(100) DEFAULT NULL COMMENT '缩略图路径',
  `PositionDescribe` varchar(5000) DEFAULT NULL COMMENT '位置详细介绍',
  `PositionTime` datetime NOT NULL COMMENT '位置适宜去的时间',
  `CreatTime` datetime DEFAULT NULL COMMENT '条目创建时间',
  `Enabled` char(1) DEFAULT NULL COMMENT '逻辑删除标志',
  PRIMARY KEY (`PositionID`),
  UNIQUE KEY `PositionID_UNIQUE` (`PositionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='位置：位置详细信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positiondetailinfo`
--

LOCK TABLES `positiondetailinfo` WRITE;
/*!40000 ALTER TABLE `positiondetailinfo` DISABLE KEYS */;
INSERT INTO `positiondetailinfo` VALUES ('2759FF9E667E45CE9574C1DA888CE8B3','4fedcb9937ac41d487df4ed737e703f6','6e9584816d2e4c06ad026a1c45462109','南昌','11|11','/ostp/userfiles/images/2016/11/22/2.PNG','/ostp/userfiles/_thumbs/Images/2016/11/22/2.PNG','<p>江西省南昌市</p>\r\n','2016-11-22 15:08:20','2016-11-22 15:08:57',NULL),('44D2BCA35C5E4964803EF54C7096AB02','2','56a3c9dc48a840afb0b8daefe3bb14e0','1122','1122|12','/ostp/userfiles/images/2016/11/22/1.PNG','/ostp/userfiles/_thumbs/Images/2016/11/22/1.PNG','<p>位置内容112222</p>\r\n','2016-11-17 00:00:00','2016-11-22 11:14:09',NULL);
/*!40000 ALTER TABLE `positiondetailinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positiontypeinfo`
--

DROP TABLE IF EXISTS `positiontypeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positiontypeinfo` (
  `PositionTypeID` char(32) NOT NULL COMMENT '位置分类编号',
  `PositionTypeName` varchar(20) NOT NULL COMMENT '位置类型名称（住宿、餐饮、火车站、机场等）',
  `Note` varchar(20) NOT NULL COMMENT '备注',
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`PositionTypeID`),
  UNIQUE KEY `PositionTypeID_UNIQUE` (`PositionTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='位置：位置类型详细信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positiontypeinfo`
--

LOCK TABLES `positiontypeinfo` WRITE;
/*!40000 ALTER TABLE `positiontypeinfo` DISABLE KEYS */;
INSERT INTO `positiontypeinfo` VALUES ('4fedcb9937ac41d487df4ed737e703f6','机场','airport','admin','2016-11-22 15:06:22','admin','2016-11-22 15:06:26');
/*!40000 ALTER TABLE `positiontypeinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` char(32) NOT NULL COMMENT '角色id',
  `authority` varchar(20) NOT NULL COMMENT '角色权限',
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `code` varchar(20) NOT NULL COMMENT '角色代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('5AF110E0E7984175B657328C227A9AC1','ROLE_PHOTOADMIN','摄影管理员','photoadmin'),('5AF110E0E7984175B657328C227A9AC2','ROLE_COURSEADMIN','教程管理员','courseadmin'),('5AF110E0E7984175B657328C227A9AC3','ROLE_POSITIONADMIN','位置管理员','positionadmin'),('5AF110E0E7984175B657328C227A9AC4','ROLE_BASICADMIN','基础数据管理员','basicadmin'),('5AF110E0E7984175B657328C227A9AC5','ROLE_INFOADMIN','资讯管理员','infoadmin'),('5AF110E0E7984175B657328C227A9AC6','ROLE_ADMIN','超级管理员','admin'),('70427E5323C44AF78C4C9420130E73A6','ROLE_EQUIPADMIN','装备管理员','equipadmin'),('8E6D42C9D257403DA132DAD9CE34CA6A','ROLE_TEST','测试','测试'),('91F40D4325AE47EC9F5C51806528162D','ROLE_TRAVELADMIN','行程管理员','traveladmin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolemenu`
--

DROP TABLE IF EXISTS `rolemenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolemenu` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `roleId` char(32) DEFAULT NULL,
  `menuId` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1897 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolemenu`
--

LOCK TABLES `rolemenu` WRITE;
/*!40000 ALTER TABLE `rolemenu` DISABLE KEYS */;
INSERT INTO `rolemenu` VALUES (498,'5AF110E0E7984175B657328C227A9AC2',1006),(499,'5AF110E0E7984175B657328C227A9AC2',2016),(500,'5AF110E0E7984175B657328C227A9AC2',2017),(501,'5AF110E0E7984175B657328C227A9AC3',1005),(502,'5AF110E0E7984175B657328C227A9AC3',2014),(503,'5AF110E0E7984175B657328C227A9AC3',2015),(1206,'5AF110E0E7984175B657328C227A9AC5',1002),(1207,'5AF110E0E7984175B657328C227A9AC5',2008),(1208,'5AF110E0E7984175B657328C227A9AC5',2009),(1289,'37DE53149A864A5D8BECA7A99B37094E',1005),(1290,'37DE53149A864A5D8BECA7A99B37094E',2014),(1291,'37DE53149A864A5D8BECA7A99B37094E',2015),(1297,'5AF110E0E7984175B657328C227A9AC1',1004),(1298,'5AF110E0E7984175B657328C227A9AC1',2012),(1299,'5AF110E0E7984175B657328C227A9AC1',2013),(1318,'5AF110E0E7984175B657328C227A9AC4',1000),(1319,'5AF110E0E7984175B657328C227A9AC4',2000),(1320,'5AF110E0E7984175B657328C227A9AC4',2200),(1321,'5AF110E0E7984175B657328C227A9AC4',2222),(1322,'5AF110E0E7984175B657328C227A9AC4',2226),(1323,'5AF110E0E7984175B657328C227A9AC4',2227),(1324,'5AF110E0E7984175B657328C227A9AC4',2235),(1325,'5AF110E0E7984175B657328C227A9AC4',2001),(1326,'5AF110E0E7984175B657328C227A9AC4',2002),(1327,'5AF110E0E7984175B657328C227A9AC4',2022),(1328,'5AF110E0E7984175B657328C227A9AC4',2223),(1329,'5AF110E0E7984175B657328C227A9AC4',2234),(1330,'5AF110E0E7984175B657328C227A9AC4',1001),(1331,'5AF110E0E7984175B657328C227A9AC4',2003),(1332,'5AF110E0E7984175B657328C227A9AC4',2004),(1333,'5AF110E0E7984175B657328C227A9AC4',2005),(1334,'5AF110E0E7984175B657328C227A9AC4',2006),(1335,'5AF110E0E7984175B657328C227A9AC4',2007),(1400,'91F40D4325AE47EC9F5C51806528162D',1007),(1401,'91F40D4325AE47EC9F5C51806528162D',2018),(1402,'91F40D4325AE47EC9F5C51806528162D',2019),(1403,'70427E5323C44AF78C4C9420130E73A6',1003),(1404,'70427E5323C44AF78C4C9420130E73A6',2010),(1405,'70427E5323C44AF78C4C9420130E73A6',2011),(1863,'5AF110E0E7984175B657328C227A9AC6',1000),(1864,'5AF110E0E7984175B657328C227A9AC6',2001),(1865,'5AF110E0E7984175B657328C227A9AC6',2002),(1866,'5AF110E0E7984175B657328C227A9AC6',2022),(1867,'5AF110E0E7984175B657328C227A9AC6',2244),(1868,'5AF110E0E7984175B657328C227A9AC6',1001),(1869,'5AF110E0E7984175B657328C227A9AC6',2003),(1870,'5AF110E0E7984175B657328C227A9AC6',2004),(1871,'5AF110E0E7984175B657328C227A9AC6',2005),(1872,'5AF110E0E7984175B657328C227A9AC6',2006),(1873,'5AF110E0E7984175B657328C227A9AC6',2007),(1874,'5AF110E0E7984175B657328C227A9AC6',1002),(1875,'5AF110E0E7984175B657328C227A9AC6',2008),(1876,'5AF110E0E7984175B657328C227A9AC6',2009),(1877,'5AF110E0E7984175B657328C227A9AC6',1003),(1878,'5AF110E0E7984175B657328C227A9AC6',2010),(1879,'5AF110E0E7984175B657328C227A9AC6',2011),(1880,'5AF110E0E7984175B657328C227A9AC6',1004),(1881,'5AF110E0E7984175B657328C227A9AC6',2012),(1882,'5AF110E0E7984175B657328C227A9AC6',2013),(1883,'5AF110E0E7984175B657328C227A9AC6',1005),(1884,'5AF110E0E7984175B657328C227A9AC6',2014),(1885,'5AF110E0E7984175B657328C227A9AC6',2015),(1886,'5AF110E0E7984175B657328C227A9AC6',1006),(1887,'5AF110E0E7984175B657328C227A9AC6',2016),(1888,'5AF110E0E7984175B657328C227A9AC6',2017),(1889,'5AF110E0E7984175B657328C227A9AC6',1007),(1890,'5AF110E0E7984175B657328C227A9AC6',2018),(1891,'5AF110E0E7984175B657328C227A9AC6',2019),(1892,'5AF110E0E7984175B657328C227A9AC6',1008),(1893,'5AF110E0E7984175B657328C227A9AC6',2236),(1894,'5AF110E0E7984175B657328C227A9AC6',2237),(1895,'5AF110E0E7984175B657328C227A9AC6',2242),(1896,'5AF110E0E7984175B657328C227A9AC6',2243);
/*!40000 ALTER TABLE `rolemenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_c3p0`
--

DROP TABLE IF EXISTS `t_c3p0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_c3p0` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_c3p0`
--

LOCK TABLES `t_c3p0` WRITE;
/*!40000 ALTER TABLE `t_c3p0` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_c3p0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `email` varchar(20) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'小明','1213745031@qq.com','18392881300'),(2,'卡特','1203745032@qq.com','18392881301');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `triptravelinfo`
--

DROP TABLE IF EXISTS `triptravelinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `triptravelinfo` (
  `TravelID` char(32) NOT NULL COMMENT '行程编号',
  `TravelName` varchar(100) NOT NULL COMMENT '行程名称',
  `SportTypeID` char(32) NOT NULL COMMENT '运动分类编号',
  `Attention` varchar(2000) DEFAULT NULL COMMENT '注意事项',
  `KeyWord` varchar(100) DEFAULT NULL,
  `Guide` varchar(5000) NOT NULL COMMENT '攻略',
  `CreatTime` datetime DEFAULT NULL,
  `Enabled` char(1) DEFAULT NULL COMMENT '逻辑删除标志',
  `Travelpicture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TravelID`),
  UNIQUE KEY `TravelID_UNIQUE` (`TravelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行程：行程信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `triptravelinfo`
--

LOCK TABLES `triptravelinfo` WRITE;
/*!40000 ALTER TABLE `triptravelinfo` DISABLE KEYS */;
INSERT INTO `triptravelinfo` VALUES ('649366DE345E4869AE49ACD46441FFCB','凤凰古迹随心游','4fdff762b5494bd4b1763c7c0b7d7e5a','','凤凰古迹','<div class=\"general_image_pic c-span6\"><em>丝绸之路</em>和<em>敦煌</em>石窟甘肃是中国古代文化发祥地之一,也是中国历史上最早开放的地区之一。</div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n','2016-12-27 12:29:38',NULL,'/ostp/userfiles/images/2016/12/29/s1.jpg'),('787D4AA50F57485CAD89F0A9F48E7F0C','垂钓仙女湖','973ce5e6815f4cf483bbb53dc04a38f6','<p>仙女湖有仙女</p>\r\n','仙女湖','<p>仙女湖中心岛</p>\r\n','2016-12-27 12:34:38',NULL,'/ostp/userfiles/images/2016/12/29/s2.jpg'),('B123E129E1854B45A19CEC7C44A7ED98','漫游交大','42daec416efd4a71a1557dc035d6818f','<p>交大帅哥有点多</p>\r\n','交大','<p>双港东路口</p>\r\n','2016-12-27 12:33:04',NULL,'/ostp/userfiles/images/2016/12/29/s3.jpg'),('B3063E79C6754540B2EE680D08DD3D60','梅岭一日游','46c8dfd3a7cf443e96507698e0495c43','<p>梅岭有毒</p>\r\n','梅岭','<p>新建县狮子岭</p>\r\n','2016-12-27 12:32:04',NULL,'/ostp/userfiles/images/2016/12/29/s4.jpg'),('F0DC781C784C4950BBCD4E5B8F5741E3','挑战珠穆朗玛峰','46c8dfd3a7cf443e96507698e0495c43','<p>珠峰没你高</p>\r\n','珠穆朗玛峰','<p>西藏东经99度</p>\r\n','2016-12-27 12:36:23',NULL,'/ostp/userfiles/images/2016/12/29/s5.jpg');
/*!40000 ALTER TABLE `triptravelinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `triptravelpath`
--

DROP TABLE IF EXISTS `triptravelpath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `triptravelpath` (
  `TravelID` char(32) NOT NULL COMMENT '交通路线编号',
  `PositionID` varchar(100) NOT NULL COMMENT '行程编号',
  `Enabled` char(1) DEFAULT NULL COMMENT '逻辑删除标志',
  PRIMARY KEY (`TravelID`),
  UNIQUE KEY `TravelID_UNIQUE` (`TravelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行程：交通和线路';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `triptravelpath`
--

LOCK TABLES `triptravelpath` WRITE;
/*!40000 ALTER TABLE `triptravelpath` DISABLE KEYS */;
/*!40000 ALTER TABLE `triptravelpath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserID` char(32) NOT NULL COMMENT '用户唯一标识',
  `UserName` varchar(20) NOT NULL COMMENT '用户昵称',
  `UserSex` char(1) NOT NULL COMMENT '用户性别',
  `UserEmail` varchar(50) NOT NULL COMMENT '用户邮箱',
  `UserPhone` varchar(20) NOT NULL COMMENT '用户手机',
  `UserAuthority` varchar(20) NOT NULL COMMENT '用户权限',
  `UserDesc` varchar(300) NOT NULL COMMENT '用户介绍',
  `UserPsw` char(40) NOT NULL COMMENT '用户密码',
  `UserHobby` varchar(20) DEFAULT NULL COMMENT '兴趣爱好',
  `UserJob` varchar(20) DEFAULT NULL COMMENT '职业',
  `UserEdu` varchar(20) DEFAULT NULL COMMENT '教育程度',
  `UserTag` varchar(20) DEFAULT NULL COMMENT '个人标签',
  `Enabled` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '逻辑删除标志',
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserID_UNIQUE` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='社区：用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('0822AA871DD84C55BCB66862E01B81BF','admin','1','123@sina.com','13812345678','ROLE_ADMIN','超级管理员','ec557bf547043802ef3d625d28f63a92166f03d1','读书，看电影，听音乐										','教师																		','博士后','愤青','1'),('099705B71DFE4BD8B9A92E6050A67208','poadmin','1','21422@qq.com','123123124','ROLE_PHOTOADMIN','摄影管理员','7f591beaa5f0b0d6930bb7b563ebfe57ba671a35','','','博士后','','1'),('0B6563A073F749F7A6CDA79D27CF1A60','aaa','0','222122@qq.com','aaa','ROLE_POSITONADMIN','位置管理员','781545e463efd2357963e98650dd7d839ff25f0b',NULL,NULL,NULL,NULL,'1'),('4B8F791B00AC44F6A4C6D2AA24DACB63','padmin','0','222122@qq.com','123123123','ROLE_POSITONADMIN','位置管理员','7f36d5e56dc447b5bbd88e84bd8eb3d716f86b4c','																	\r\n	','																	\r\n	','','','1'),('6EA8F60C45CF415C99D795684E111B0E','badmin','1','222@qq.com','12312312','ROLE_BASICADMIN','基础数据管理员','58dd02dc2bc8f75e50852c2c9635e02bf054f608','','','无','','1'),('74E2A7B78126454FB4B550E7E7D7C6E7','cadmin','0','222@qq.com','145345345','ROLE_COURSEADMIN','教程管理员','4ef1cc14b3adaf5e6775024f2ab73887039095b2','																	\r\n	','															\r\n			','小学','','1'),('99BC7271C1D94E7B9555D6D10333BF01','iadmin','0','2qw22@qq.com','122q321232','ROLE_INFOADMIN','资讯管理员','c26e551a52a1c64d266b931fd369b6073a8340b1','','','无','','1'),('C6282DC7D9CB4968A5B9AE010746C324','tadmin','0','a@qq.com','1231312124','ROLE_TRAVELADMIN','行程管理员','fc19592f74a7d2d2ea69b11e3beb2c1827da184b',NULL,NULL,NULL,NULL,'1'),('D5864B6B77774C2490ADFBE2B3B5A46B','eadmin','0','222@qq.com','123123123123','ROLE_EQUIPADMIN','装备管理员','f2cb2645460b4e1d4fddaa7ec014f488427c1924',NULL,NULL,NULL,NULL,'1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userrole` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `RoleID` varchar(32) NOT NULL COMMENT '角色ID',
  `UserID` varchar(32) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='用户---角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (12,'5AF110E0E7984175B657328C227A9AC6','0822AA871DD84C55BCB66862E01B81BF'),(16,'5AF110E0E7984175B657328C227A9AC4','6EA8F60C45CF415C99D795684E111B0E'),(17,'5AF110E0E7984175B657328C227A9AC5','99BC7271C1D94E7B9555D6D10333BF01'),(18,'5AF110E0E7984175B657328C227A9AC3','4B8F791B00AC44F6A4C6D2AA24DACB63'),(19,'5AF110E0E7984175B657328C227A9AC1','099705B71DFE4BD8B9A92E6050A67208'),(20,'5AF110E0E7984175B657328C227A9AC2','74E2A7B78126454FB4B550E7E7D7C6E7'),(22,'5AF110E0E7984175B657328C227A9AC3','0B6563A073F749F7A6CDA79D27CF1A60'),(23,'70427E5323C44AF78C4C9420130E73A6','D5864B6B77774C2490ADFBE2B3B5A46B'),(24,'91F40D4325AE47EC9F5C51806528162D','C6282DC7D9CB4968A5B9AE010746C324');
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-20 20:26:38
