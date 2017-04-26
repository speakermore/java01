-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: worktogether
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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminLoginId` varchar(20) NOT NULL COMMENT '登陆ID',
  `adminPassword` varchar(20) NOT NULL COMMENT '登陆密码',
  `adminTel` varchar(11) NOT NULL COMMENT '电话',
  `adminEmail` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `adminName` varchar(18) NOT NULL COMMENT '管理员姓名',
  `adminStatusNow` int(11) NOT NULL DEFAULT '0' COMMENT '是否在线状态：1.在线 2.下线',
  `adminStatus` int(11) NOT NULL DEFAULT '0' COMMENT '禁用状态：1.正常 0.禁用 2.超级管理员',
  `adminUnName` varchar(20) DEFAULT NULL COMMENT '备用',
  `adminUnName2` varchar(20) DEFAULT NULL COMMENT '备用2',
  PRIMARY KEY (`id`),
  UNIQUE KEY `adminLoginId_UNIQUE` (`adminLoginId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminlog`
--

DROP TABLE IF EXISTS `adminlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminLoginId` int(11) NOT NULL,
  `adminDo` int(11) NOT NULL COMMENT '1.审核 2.禁用 3.密码重置 4.信息维护 5.登录退出',
  `adminTargetType` int(11) NOT NULL COMMENT '操作对象类型',
  `adminAid` int(11) NOT NULL COMMENT '操作对象id',
  `adminTime` datetime DEFAULT NULL COMMENT '操作时间',
  `adminUnName` varchar(20) DEFAULT NULL COMMENT '备用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminlog`
--

LOCK TABLES `adminlog` WRITE;
/*!40000 ALTER TABLE `adminlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id 或 企业id',
  `usersId` int(11) NOT NULL COMMENT '1：企业id  2：用户id',
  `articleTitle` varchar(50) NOT NULL COMMENT '信息标题',
  `articleLikeNum` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `articleReadNum` int(11) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `articleTime` datetime NOT NULL COMMENT '发布时间',
  `articleStatus` int(11) NOT NULL DEFAULT '1' COMMENT '信息状态1:待审 2：审核通过 3：审核不通过 4：删除',
  `articleKey` varchar(20) NOT NULL COMMENT '关键字',
  `articleContent` text NOT NULL COMMENT '文章内容',
  `articleUsersType` int(11) NOT NULL COMMENT '用户状态1：企业 2：个人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,7,'hello',0,0,'2017-04-08 16:15:33',1,'view','The view is very pretty',2),(2,10,'nice',0,0,'2017-04-08 16:15:33',1,'2','2',2),(3,1234567891,'hello',0,0,'2017-04-08 16:15:33',1,'view','The view is very pretty',2),(4,1,'大公司招聘大量人员',0,0,'2017-04-26 13:22:22',2,'招聘','1、依据公司年度经营目标，提交市场营销计划执行方案，监督实施市场营销全过程，完成任务；2、独立搭建公司市场营销与品牌推广体系，结合公司业务独立完成市场营销、品牌推广策划方案，并协调各种资源推动实施；3、全面把握公司产品的市场状况，了解同业竞争策略与消费有效需求，为公司产品的市场定位提供科学的决策依据；4、收集相关行业的市场宣传活动、展会等信息，积累传播公司品牌的机会和资源，结合公司业务和发展开辟各种推广渠道和手段，扩大公司及产品品牌知名度；5、建立和维护合作伙伴资源，开展联合营销活动，提高产品与品牌曝光度；6、对销售人员进行产品培训、市场指导，协助销售部门开展销售活动，以达成销售目标；任职要求：1、市场营销、广告、管理类或相关专业本科以上学历。2、5年以上市场营销、品牌推广相关工作经验，对产品市场化运作极为熟悉；3、具有敏感的商业和市场意识，分析问题及解决问题能力强，善于挖掘和整合资源；4、思路开阔、思维活跃，具有创新意识，追求卓越；5、熟悉各种宣传途径，具备较好的文案能力；6、较强的承压能力和推动执行力；7、具备良好的沟通合作技巧及丰富的团队建设经验。',1);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentarticle`
--

DROP TABLE IF EXISTS `commentarticle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commentarticle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleId` int(11) NOT NULL COMMENT '用户id 或 企业id',
  `usersId` int(11) NOT NULL COMMENT '1：企业id  2：用户id',
  `commentArticleTime` datetime NOT NULL COMMENT '评论时间',
  `commentArticleContent` varchar(300) NOT NULL COMMENT '评论文章内容',
  `commentArticleLikeNum` int(11) NOT NULL DEFAULT '0' COMMENT '评论文章点赞数',
  `commentArticleStatus` int(11) NOT NULL DEFAULT '1' COMMENT '评论文章状态1：等待审核  2：审核通过\n3：审核不通过 4：删除',
  `commentArticleUsersType` int(11) NOT NULL COMMENT '1.企业 2.用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentarticle`
--

LOCK TABLES `commentarticle` WRITE;
/*!40000 ALTER TABLE `commentarticle` DISABLE KEYS */;
/*!40000 ALTER TABLE `commentarticle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyLoginId` varchar(20) NOT NULL COMMENT '登录名',
  `companyPassword` varchar(100) NOT NULL COMMENT '密码',
  `companyName` varchar(30) NOT NULL COMMENT '公司全称',
  `companySimpleName` varchar(15) DEFAULT NULL COMMENT '公司简称',
  `companyLogo` varchar(50) NOT NULL COMMENT '公司logo',
  `companyLicenseImg` varchar(50) NOT NULL COMMENT '公司营业执照图',
  `companyLicenseNo` varchar(50) NOT NULL COMMENT '公司营业执照码',
  `companyCorporator` varchar(50) NOT NULL COMMENT '法人代表',
  `companyTel` varchar(30) NOT NULL COMMENT '公司电话',
  `companyEmail` varchar(30) NOT NULL COMMENT '公司邮件',
  `companyAddress` varchar(100) NOT NULL COMMENT '公司地址',
  `companyStatus` int(11) NOT NULL COMMENT '账户状态：1.正常 2.禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'123','321','1','1','1','1','1','1','1','1','1',1),(2,'12','12','12','12','12','12','12','12','12','12','12',12),(3,'12','12','12','12','12','12','12','12','12','12','12',12),(4,'465','465','465','456','46','465','465','456','465','456','456',456),(5,'465','456','465','456','46','465','465','456','465','456','456',456),(6,'465','111','465','456','46','465','465','456','465','456','456',456),(7,'1','1','1','1','1','1','1','1','1','1','1',1),(8,'1','2','1','1','1','1','1','1','1','1','1',1),(9,'2','2','2','2','2','2','2','2','2','2','2',2),(10,'419660212@qq.com','0','1','0','0','0','0','1','0','419660212@qq.com','0',1),(110,'1','1','1','1','1','1','1','1','1','1','1',1),(111,'123','123','123','123','123','123','123','123','123','123','123',123),(112,'123','321','123','123','123','123','123','123','123','123','123',123);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companycharge`
--

DROP TABLE IF EXISTS `companycharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companycharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyId` int(11) NOT NULL COMMENT '公司编号',
  `cmpChargeMoney` double NOT NULL COMMENT '充值金额',
  `cmpChargeConsume` double NOT NULL COMMENT '消费金额',
  `cmpChargeBalance` double NOT NULL DEFAULT '0' COMMENT '余额',
  `cmpChargeTime` datetime DEFAULT NULL COMMENT '充值时间',
  `cmpChargeStatus` int(11) NOT NULL COMMENT '充值状态 1：充值 2：消费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='公司充值';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companycharge`
--

LOCK TABLES `companycharge` WRITE;
/*!40000 ALTER TABLE `companycharge` DISABLE KEYS */;
INSERT INTO `companycharge` VALUES (1,1,0,0,544,'2017-04-14 17:10:00',2),(2,1,0,0,544,'2017-04-14 17:10:00',2),(3,1,0,0,544,'2017-04-14 17:10:00',2),(4,1,0,10,534,'2017-04-14 17:23:25',2),(5,1,1,0,535,'2017-04-15 13:51:22',1),(6,1,0,1,534,'2017-04-15 13:52:24',2),(7,1,1,0,535,'2017-04-15 15:35:53',1),(8,1,1,0,536,'2017-04-15 15:37:49',1),(9,1,1,0,537,'2017-04-15 15:44:19',1),(10,1,1,0,538,'2017-04-15 15:45:12',1),(11,1,1,0,539,'2017-04-15 15:46:05',1),(12,1,1,0,540,'2017-04-15 15:57:38',1),(13,1,1,0,541,'2017-04-15 16:01:38',1),(14,1,1,0,542,'2017-04-15 16:16:12',1),(15,1,1,0,543,'2017-04-15 16:20:47',1),(16,1,1,0,544,'2017-04-15 16:21:13',1),(17,1,1,0,545,'2017-04-15 16:23:13',1),(18,1,1,0,546,'2017-04-17 10:54:37',1),(19,1,1,0,547,'2017-04-17 13:36:50',1),(20,1,1,0,548,'2017-04-17 13:37:42',1),(21,1,1,0,549,'2017-04-17 13:39:17',1),(22,1,1,0,550,'2017-04-17 13:42:37',1),(23,1,1,0,551,'2017-04-17 13:43:47',1),(24,1,1,0,552,'2017-04-17 14:05:52',1),(25,1,1,0,553,'2017-04-17 14:07:13',1),(26,10,1,0,1,'2017-04-21 10:00:06',1),(27,10,1,0,2,'2017-04-21 10:00:25',1),(28,10,1,0,3,'2017-04-21 10:01:41',1),(29,10,1,0,4,'2017-04-21 10:10:20',1),(30,10,1,0,5,'2017-04-21 10:11:14',1),(31,10,2,0,7,'2017-04-21 10:31:44',1),(32,10,1,0,8,'2017-04-21 10:32:41',1),(33,10,1,0,9,'2017-04-21 10:33:12',1),(34,10,1,0,10,'2017-04-21 10:35:27',1),(35,10,1,0,11,'2017-04-21 10:36:10',1),(36,10,1,0,12,'2017-04-21 10:37:04',1),(37,1,1,0,554,'2017-04-21 11:25:18',1),(38,1,23,0,577,'2017-04-21 14:01:40',1),(39,1,1,0,578,'2017-04-21 14:07:22',1),(40,1,1,0,579,'2017-04-21 14:12:57',1),(41,1,1,0,580,'2017-04-21 14:13:09',1),(42,10,1,0,13,'2017-04-22 16:06:35',1),(43,10,1,0,14,'2017-04-22 16:16:08',1),(44,10,1,0,15,'2017-04-22 16:17:02',1),(45,10,12,0,27,'2017-04-22 16:20:33',1),(46,10,12,0,39,'2017-04-22 16:21:19',1),(47,10,12,0,51,'2017-04-22 16:22:04',1);
/*!40000 ALTER TABLE `companycharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyconnection`
--

DROP TABLE IF EXISTS `companyconnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companyconnection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyId` int(11) NOT NULL COMMENT '公司编号',
  `cmpConnection` varchar(20) NOT NULL COMMENT '公司联系电话',
  `cmpConnectionName` varchar(10) DEFAULT NULL COMMENT '联系人称呼',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业联系人';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyconnection`
--

LOCK TABLES `companyconnection` WRITE;
/*!40000 ALTER TABLE `companyconnection` DISABLE KEYS */;
/*!40000 ALTER TABLE `companyconnection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companydetailimg`
--

DROP TABLE IF EXISTS `companydetailimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companydetailimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyId` int(11) NOT NULL COMMENT '公司ID，外键',
  `companyDetailImg` varchar(50) NOT NULL COMMENT '环境图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companydetailimg`
--

LOCK TABLES `companydetailimg` WRITE;
/*!40000 ALTER TABLE `companydetailimg` DISABLE KEYS */;
/*!40000 ALTER TABLE `companydetailimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyintroduction`
--

DROP TABLE IF EXISTS `companyintroduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companyintroduction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyId` int(11) NOT NULL COMMENT '公司编号',
  `cmpIntroduction` text NOT NULL COMMENT '公司简介',
  `cmpIntQuality` int(11) NOT NULL COMMENT '公司性质:1.政府 2.国企 3.民企 4.其他',
  `cmpIntPeopleNum` int(11) NOT NULL COMMENT '公司规模：1.20人 2.50人 3.80人\n4.100人 5.150人 6.200人 7.200人以上',
  `cmpIntComforts` varchar(500) DEFAULT NULL COMMENT '公司福利',
  `cmpIntRest` varchar(20) DEFAULT NULL COMMENT '公司休息制度',
  `cmpIntInsurance` varchar(100) NOT NULL COMMENT '公司保险制度',
  `cmpIntWage` varchar(10) NOT NULL,
  `cmpIntStatus` int(11) NOT NULL COMMENT '企业简介发表状态：1.待审核 2.审核通过 3.审核通过',
  PRIMARY KEY (`id`),
  UNIQUE KEY `companyId_UNIQUE` (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='企业简介';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyintroduction`
--

LOCK TABLES `companyintroduction` WRITE;
/*!40000 ALTER TABLE `companyintroduction` DISABLE KEYS */;
INSERT INTO `companyintroduction` VALUES (3,11,'11',11,11,'11','21','21','21',2),(4,1,'231',6786,786,'678','68','6786','86',6),(5,10,'2',2,1,'1','1','1','1',1);
/*!40000 ALTER TABLE `companyintroduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyintroduvtion`
--

DROP TABLE IF EXISTS `companyintroduvtion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companyintroduvtion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyId` int(11) NOT NULL COMMENT '公司编号',
  `cmpIntroduction` text NOT NULL COMMENT '公司简介',
  `cmpIntQuality` int(11) NOT NULL COMMENT '公司性质:1.政府 2.国企 3.民企 4.其他',
  `cmpPeopleNum` int(11) NOT NULL COMMENT '公司规模：1.20人 2.50人 3.80人\n4.100人 5.150人 6.200人 7.200人以上',
  `cmpIntComforts` varchar(500) DEFAULT NULL COMMENT '公司福利',
  `cmpIntRest` varchar(20) DEFAULT NULL COMMENT '公司休息制度',
  `cmpIntInsurance` varchar(100) NOT NULL COMMENT '公司保险制度',
  `cmpIntWage` varchar(10) NOT NULL,
  `cmpIntStatus` int(11) NOT NULL COMMENT '企业简介发表状态：1.待审核 2.审核通过 3.审核通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='企业简介';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyintroduvtion`
--

LOCK TABLES `companyintroduvtion` WRITE;
/*!40000 ALTER TABLE `companyintroduvtion` DISABLE KEYS */;
INSERT INTO `companyintroduvtion` VALUES (1,110110,'我是妖妖灵你不知道么',1,7,NULL,NULL,'没有','没有',2),(2,120120,'妖儿灵',1,7,NULL,NULL,'没有','没有',2);
/*!40000 ALTER TABLE `companyintroduvtion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyjob`
--

DROP TABLE IF EXISTS `companyjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companyjob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmpJobType` varchar(10) DEFAULT NULL,
  `cmpJobStatus` int(11) NOT NULL COMMENT '1.等待审核 2.审核通过 3.审核不通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职业种类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyjob`
--

LOCK TABLES `companyjob` WRITE;
/*!40000 ALTER TABLE `companyjob` DISABLE KEYS */;
/*!40000 ALTER TABLE `companyjob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyrecruit`
--

DROP TABLE IF EXISTS `companyrecruit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companyrecruit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyId` int(11) NOT NULL COMMENT '公司编号',
  `cmpRecTitle` varchar(20) NOT NULL COMMENT '公司标题',
  `cmpRecWage` varchar(20) NOT NULL COMMENT '公司薪资',
  `cmpRecEducation` varchar(10) NOT NULL COMMENT '公司学历需求',
  `cmpRecExperience` varchar(500) NOT NULL COMMENT '工作所需技能及水平描述',
  `cmpRecPeople` int(11) NOT NULL COMMENT '需求人数',
  `cmpRecTime` datetime NOT NULL COMMENT '发布时间',
  `cmpRecStatus` int(11) NOT NULL COMMENT '发表招聘信息状态：1.待审 2.审核通过 3.审核不通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='招聘信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyrecruit`
--

LOCK TABLES `companyrecruit` WRITE;
/*!40000 ALTER TABLE `companyrecruit` DISABLE KEYS */;
INSERT INTO `companyrecruit` VALUES (1,3,'ncie',' 5k','123','<p>3213</p>\r\n',231,'2017-04-21 11:07:27',4),(2,3,' 321',' 321','321','<p>3131</p>\r\n',31,'2017-04-21 11:08:59',1),(3,1,' nice',' 4k','大学','<p>hello</p>\r\n',50,'2017-04-21 13:47:15',1);
/*!40000 ALTER TABLE `companyrecruit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyvisitcount`
--

DROP TABLE IF EXISTS `companyvisitcount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companyvisitcount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyYear` int(11) NOT NULL COMMENT '时间一年',
  `companyMonth` int(11) NOT NULL COMMENT '时间一月',
  `companyDay` int(11) NOT NULL COMMENT '时间一日',
  `companyInfoCount` int(11) NOT NULL COMMENT '发表消息数',
  `companyResumeCount` int(11) NOT NULL COMMENT '发表简历数',
  `companyId` int(11) NOT NULL COMMENT '企业Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业访问数统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyvisitcount`
--

LOCK TABLES `companyvisitcount` WRITE;
/*!40000 ALTER TABLE `companyvisitcount` DISABLE KEYS */;
/*!40000 ALTER TABLE `companyvisitcount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discuss`
--

DROP TABLE IF EXISTS `discuss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discuss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discussUsersId` int(11) NOT NULL COMMENT '1：企业id  2：个人用户id',
  `discussContent` varchar(500) NOT NULL COMMENT '评论内容',
  `discussLevel` int(11) NOT NULL COMMENT '评论星级\n1：1星\n2：2星\n3：3星\n4：4星\n5：5星',
  `discussTime` datetime NOT NULL COMMENT '评论时间',
  `discussStatus` int(11) NOT NULL DEFAULT '1' COMMENT '评论状态1:待审 2：审核通过 3：审核不通过 4：删除',
  `discussUsersType` int(11) NOT NULL COMMENT '1：企业id\n2：个人用户id',
  `discussBySendId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discuss`
--

LOCK TABLES `discuss` WRITE;
/*!40000 ALTER TABLE `discuss` DISABLE KEYS */;
INSERT INTO `discuss` VALUES (1,1234567891,'内容',1,'2017-04-07 11:22:10',1,2,0),(2,1234567894,'这是一个好企业',4,'2017-04-26 14:00:00',1,1,1),(3,1234567895,'好人呀就是好人',4,'2017-04-26 14:00:00',1,2,1234567892);
/*!40000 ALTER TABLE `discuss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '培训Id',
  `userId` int(11) NOT NULL COMMENT '用户Id',
  `educationBeginTime` datetime NOT NULL COMMENT '培训开始时间',
  `educationEndTime` datetime NOT NULL COMMENT '培训结束时间',
  `educationSchool` varchar(50) NOT NULL COMMENT '培训地点',
  `educationContent` varchar(300) NOT NULL,
  `resumeId` int(11) NOT NULL,
  `resumeType` int(11) NOT NULL DEFAULT '1' COMMENT '1.待审核 2.正常 3.审核未通过 4.删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `followId` int(11) NOT NULL COMMENT '关注者id(用户或企业id)',
  `byFollowId` int(11) NOT NULL COMMENT '被关注者id(企业或用户的id)',
  `followDate` datetime NOT NULL,
  `followType` int(11) NOT NULL COMMENT '1.企业用户 2.个人用户（关注着）',
  `followStartType` int(11) NOT NULL COMMENT '1.企业用户 2.个人用户（被关注者）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关注';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户ID(发送者ID)',
  `resendId` int(11) NOT NULL COMMENT '接收者ID',
  `messageContent` varchar(500) NOT NULL COMMENT '消息内容',
  `messageSendTime` datetime NOT NULL COMMENT '发送时间',
  `messageResendStatus` int(11) NOT NULL DEFAULT '1' COMMENT '1表示您尚未阅读(默认)\n2表示您已接受邀请\n3表示您婉言谢绝了申请\n4表示已阅读，未回复',
  `messageSendStatus` int(11) NOT NULL DEFAULT '1' COMMENT '1.等待审核 2.审核通过 3.审核部通过',
  `messageStatus` int(11) NOT NULL COMMENT '识别被发送者的id是用户还是企业：1.用户 2 企业',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='私信表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,1234567891,1236547899,'内容','2017-04-07 11:34:44',1,1,0),(2,1234567891,1236547899,'内容','2017-04-07 16:56:53',1,1,1);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '面试邀请Id',
  `companyId` int(11) NOT NULL COMMENT '企业Id',
  `userId` int(11) NOT NULL COMMENT '用户Id',
  `offerJob` varchar(50) NOT NULL COMMENT '岗位',
  `offerContent` varchar(500) NOT NULL COMMENT '信息',
  `offerInvitationTime` datetime NOT NULL COMMENT '面试时间',
  `offerSendTime` datetime NOT NULL COMMENT '发送时间(根据系统时间)',
  `offerStatus` int(11) NOT NULL DEFAULT '1' COMMENT '审核状态：\n1.等待审核\n2.审核通过\n3.审核未过',
  `offerAction` int(11) NOT NULL DEFAULT '1' COMMENT '接收状态：\n1.尚未阅读\n2.接受邀请\n3.拒绝邀请\n4.尚未回复	',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
INSERT INTO `offer` VALUES (1,911,222,'门卫','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','2017-04-12 09:32:47','2017-04-12 09:32:47',2,1),(3,110,222,'程序员','欢迎','2017-04-12 09:36:33','2017-04-12 09:36:33',2,1),(4,911,222,'程序员','欢迎','2017-04-12 11:59:02','2017-04-12 11:59:02',2,2),(5,110,222,'123','321','2017-04-13 11:28:13','2017-04-13 11:28:13',2,2),(6,911,333,'444','555','2017-04-13 11:30:13','2017-04-13 11:30:13',2,3),(7,110,333,'666','777','2017-04-13 11:31:17','2017-04-13 11:31:17',2,3),(8,911,333,'程序员','欢迎','2017-04-14 09:15:40','2017-04-14 09:15:40',2,4),(9,110,333,'清洁工','保洁','2017-04-14 09:17:04','2017-04-14 09:17:04',2,4),(10,911,333,'测试','测试员','2017-04-18 12:13:01','2017-04-18 12:13:01',2,1);
/*!40000 ALTER TABLE `offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目Id\n',
  `userId` int(11) NOT NULL COMMENT '用户Id',
  `projectBeginTime` datetime NOT NULL COMMENT '项目开始时间',
  `projectEndTime` datetime NOT NULL COMMENT '项目结束时间',
  `projectName` varchar(100) NOT NULL COMMENT '项目名字',
  `projectJob` varchar(100) NOT NULL COMMENT '项目岗位',
  `projectDescription` varchar(500) NOT NULL COMMENT '项目描述',
  `projectMakeDescription` varchar(500) NOT NULL COMMENT '责任描述与感受',
  `resumeId` int(11) NOT NULL,
  `resumeType` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resume`
--

DROP TABLE IF EXISTS `resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resume` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '简历Id',
  `userId` int(11) NOT NULL COMMENT '用户Id',
  `resumeTitle` varchar(50) NOT NULL COMMENT '简历标题',
  `resumeCreateDate` date NOT NULL COMMENT '创建时间',
  `resumeName` varchar(10) NOT NULL COMMENT '姓名',
  `resumeGender` int(11) NOT NULL COMMENT '性别',
  `resumeNation` varchar(10) NOT NULL COMMENT '民族',
  `resumePlace` varchar(50) NOT NULL COMMENT '籍贯',
  `resumeBirthday` date NOT NULL COMMENT '生日',
  `resumeMarriage` int(11) NOT NULL COMMENT '婚姻',
  `resumeGraduationSchool` varchar(50) NOT NULL COMMENT '毕业院校',
  `resumeGraduationTime` date NOT NULL COMMENT '毕业时间',
  `resumeEducation` varchar(20) NOT NULL COMMENT '学历',
  `resumeMajor` varchar(20) NOT NULL COMMENT '专业',
  `resumeWages` int(11) NOT NULL COMMENT '期望待遇',
  `resumePhone` int(11) NOT NULL COMMENT '电话',
  `resumeQQ` int(11) NOT NULL COMMENT 'QQ',
  `resumeFLAbility` int(11) NOT NULL DEFAULT '1' COMMENT '外语水平1.入门 2.一般 3.熟练 4.精通	',
  `resumeFLType` int(11) NOT NULL DEFAULT '1' COMMENT '外语类型1.英语 2.日语 3.德语 4.…………	',
  `resumeEnglishGrade` int(11) NOT NULL DEFAULT '6' COMMENT '英语等级1.国家英语考试3级 2.国家英语考试4级 3.国家英语考试6级4.专业4级 5.专业8级 6.未参加 7.未通过	',
  `resumeComputerAbility` int(11) NOT NULL DEFAULT '1' COMMENT '计算机水平1.入门 2.一般 3.熟练 4.精通',
  `resumePersonality` varchar(50) NOT NULL COMMENT '特点描述',
  `resumeSelfEvaluation` varchar(500) NOT NULL COMMENT '自我评价',
  `resumeStatusOne` int(11) NOT NULL DEFAULT '1' COMMENT '状态(用户的操作)\n1.完全公开(默认)\n2.只限企业浏览\n3.只对应聘企业公开\n4.保密',
  `resumeHeight` int(11) NOT NULL COMMENT '身高',
  `resumeWeight` int(11) NOT NULL COMMENT '体重',
  `resumeStatusThree` int(11) NOT NULL DEFAULT '1' COMMENT '1.待审核 2.正常	 3. 审核不通过',
  `resumeJor` varchar(45) NOT NULL COMMENT '岗位意向',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume`
--

LOCK TABLES `resume` WRITE;
/*!40000 ALTER TABLE `resume` DISABLE KEYS */;
INSERT INTO `resume` VALUES (1,1234567891,'标题','2017-04-07','xxx',1,'汉','云南','2017-04-07',2,'云南大学','2017-04-07','本科','工程师',5000,1234567891,951951951,1,1,6,1,'下凡','很好的！',1,150,150,1,''),(2,1234567891,'标题','2017-04-07','xxx',1,'汉','云南','2017-04-07',2,'云南大学','2017-04-07','本科','工程师',5000,1234567891,951951951,1,1,6,1,'下凡','很好的！',1,150,150,1,'');
/*!40000 ALTER TABLE `resume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resumestatustwo`
--

DROP TABLE IF EXISTS `resumestatustwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resumestatustwo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `resumeStatusTwo` int(11) NOT NULL DEFAULT '1' COMMENT '1表示企业尚未阅读（默认）\n2表示企业已接受申请\n3表示企业需要考虑\n4表示企业拒绝了您的申请\n5表示企业已删除你的申请\n6表示已阅读',
  `resumeId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumestatustwo`
--

LOCK TABLES `resumestatustwo` WRITE;
/*!40000 ALTER TABLE `resumestatustwo` DISABLE KEYS */;
/*!40000 ALTER TABLE `resumestatustwo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessage`
--

DROP TABLE IF EXISTS `systemmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sysmContent` varchar(500) NOT NULL COMMENT '消息内容',
  `sysmCreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  `systmScope` int(11) NOT NULL COMMENT '范围：1：所有人2：个人3：企业',
  `adminId` varchar(10) NOT NULL COMMENT '管理员ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessage`
--

LOCK TABLES `systemmessage` WRITE;
/*!40000 ALTER TABLE `systemmessage` DISABLE KEYS */;
INSERT INTO `systemmessage` VALUES (1,'大王叫我来巡山，我把人间转呀转！','2017-04-26 02:45:59',1,'0'),(2,'321321				','2017-04-26 07:52:05',1,'admin');
/*!40000 ALTER TABLE `systemmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户Id',
  `userLoginId` varchar(50) NOT NULL COMMENT '用户名',
  `userPassword` varchar(50) NOT NULL COMMENT '密码',
  `userName` varchar(10) NOT NULL COMMENT '昵称',
  `userGender` int(11) NOT NULL COMMENT '性别\n1.男\n2.女',
  `userEmail` varchar(100) NOT NULL COMMENT '邮箱',
  `userStatus` int(11) NOT NULL DEFAULT '1' COMMENT '状态\n1.未认证\n2.已认证\n3.禁用',
  `userRealName` varchar(10) NOT NULL COMMENT '真实姓名',
  `userIDCard` varchar(18) NOT NULL COMMENT '身份证号码',
  `userIDImgFace` varchar(500) NOT NULL COMMENT '身份证正面',
  `userIDImgCon` varchar(500) NOT NULL COMMENT '身份证反面',
  `userCreateDate` datetime NOT NULL COMMENT '注册时间',
  `userHeadImgPath` varchar(500) NOT NULL COMMENT '用户头像',
  `userMoney` double NOT NULL DEFAULT '0' COMMENT '余额',
  `userBirthday` datetime NOT NULL COMMENT '出生日期',
  `userLevel` int(11) NOT NULL DEFAULT '0' COMMENT '用户等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1234567896 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1234567891,'','123456','测试',1,'123456@163.com',1,'测试1','532165854669649','123','123','2017-04-06 17:03:41','123444',0,'2017-04-06 17:03:41',0),(1234567892,'','123456','测试',1,'123456@163.com',1,'测试1','532165854669649','123','123','2017-04-07 11:16:04','123444',0,'2017-04-07 11:16:04',0),(1234567893,'','123456','测试',1,'123456@163.com',1,'测试1','532165854669649','123','123','2017-04-07 11:16:32','123444',0,'2017-04-07 11:16:32',0),(1234567894,'18213026337','123456','刘致浩',1,'123456@163.com',1,'测试1','532165854669649','123','123','2017-04-06 17:03:41','123444',0,'2017-04-06 17:03:41',0),(1234567895,'15198714192','123456','曾瑞',1,'123456@163.com',1,'测试1','532165854669649','123','123','2017-04-07 11:16:04','123444',0,'2017-04-07 11:16:04',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercharge`
--

DROP TABLE IF EXISTS `usercharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usercharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '充值记录Id',
  `userId` int(11) NOT NULL COMMENT '用户Id',
  `userChargeTime` datetime NOT NULL COMMENT '充值时间',
  `userChargeMoney` double NOT NULL COMMENT '充值金额',
  `userChargeType` int(11) NOT NULL COMMENT '消费类型\n1.收入\n2.支出',
  `userChargeContent` varchar(100) NOT NULL COMMENT '充值说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercharge`
--

LOCK TABLES `usercharge` WRITE;
/*!40000 ALTER TABLE `usercharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `usercharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlog`
--

DROP TABLE IF EXISTS `userlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `userDo` int(11) NOT NULL COMMENT '1.登陆 2.退出 3.点赞 4.评论 5.发表文章 6.发表简历 7.查看 8.企业发表新闻 9.企业发表招聘信息 10.企业推送offer 11.密码重置',
  `userTargeType` int(11) NOT NULL COMMENT '1.个人用户 2.企业用户 3.招聘信息 4.文章 5.新闻 6.企业offer 7.评论 8.点赞 9.简历',
  `userAid` int(11) NOT NULL COMMENT '操作对象',
  `userTime` datetime NOT NULL,
  `userUnName` varchar(20) DEFAULT NULL COMMENT '备用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlog`
--

LOCK TABLES `userlog` WRITE;
/*!40000 ALTER TABLE `userlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `userlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uservisitcount`
--

DROP TABLE IF EXISTS `uservisitcount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uservisitcount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userYear` int(11) NOT NULL COMMENT '时间一年',
  `userMonth` int(11) NOT NULL COMMENT '时间一月',
  `userDay` int(11) NOT NULL COMMENT '时间一日',
  `userCommentCount` int(11) NOT NULL COMMENT '发表评论数',
  `userArticleCount` int(11) NOT NULL COMMENT '发表文章数',
  `userId` int(11) NOT NULL COMMENT '个人Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业访问数统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uservisitcount`
--

LOCK TABLES `uservisitcount` WRITE;
/*!40000 ALTER TABLE `uservisitcount` DISABLE KEYS */;
/*!40000 ALTER TABLE `uservisitcount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工作经历Id',
  `userId` int(11) NOT NULL COMMENT '用户Id',
  `workBeginTime` datetime NOT NULL COMMENT '工作开始时间',
  `workEndTime` datetime NOT NULL COMMENT '工作结束时间',
  `workFirmName` varchar(50) NOT NULL COMMENT '企业名字',
  `workUnit` varchar(50) NOT NULL COMMENT '工作岗位',
  `workDescription` varchar(500) NOT NULL COMMENT '工作描述',
  `resumeId` int(11) NOT NULL,
  `resumeType` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work`
--

LOCK TABLES `work` WRITE;
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
/*!40000 ALTER TABLE `work` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-26 17:33:43
