CREATE DATABASE  IF NOT EXISTS `worktogether` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `worktogether`;
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
  `adminPasswork` varchar(20) NOT NULL COMMENT '登陆密码',
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
  `articleId` int(11) NOT NULL AUTO_INCREMENT,
  `usersId` int(11) NOT NULL COMMENT '企业信息标题',
  `articleTitle` varchar(50) NOT NULL COMMENT '信息标题',
  `articleLikeNum` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `articleReadNum` int(11) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `articleTime` datetime NOT NULL COMMENT '发布时间',
  `articleStatus` int(11) NOT NULL COMMENT '信息状态1:待审 2：审核通过 3：审核不通过 4：删除',
  `articleKey` varchar(20) NOT NULL,
  `articleContent` text NOT NULL COMMENT '文章内容',
  `articleUsersType` int(11) NOT NULL COMMENT '用户状态1：企业 2：个人',
  PRIMARY KEY (`articleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
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
  `articleId` int(11) NOT NULL COMMENT '文章id',
  `usersId` int(11) NOT NULL COMMENT '1：企业id  2：用户id',
  `commentArticleTime` datetime NOT NULL COMMENT '评论时间',
  `commentArticleContent` varchar(300) NOT NULL COMMENT '评论文章内容',
  `commentArticleLikeNum` int(11) NOT NULL DEFAULT '0' COMMENT '评论文章点赞数',
  `commentArticleStatus` int(11) NOT NULL COMMENT '评论文章状态1：等待审核  2：审核通过\n3：审核不通过 4：删除',
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
  `companyId` int(11) NOT NULL AUTO_INCREMENT,
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
  `companyDetailImg` varchar(50) NOT NULL COMMENT '公司细节环境图片',
  `companyStatus` int(11) NOT NULL COMMENT '账户状态：1.正常 2.禁用',
  PRIMARY KEY (`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companycharge`
--

DROP TABLE IF EXISTS `companycharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companycharge` (
  `id` int(11) NOT NULL,
  `companyId` int(11) NOT NULL COMMENT '公司编号',
  `cmpChargeMoney` double NOT NULL COMMENT '充值金额',
  `cmpChargeConsume` double NOT NULL COMMENT '消费金额',
  `cmpChargeBalance` double NOT NULL DEFAULT '0' COMMENT '余额',
  `cmpChargeTime` datetime DEFAULT NULL COMMENT '充值时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司充值';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companycharge`
--

LOCK TABLES `companycharge` WRITE;
/*!40000 ALTER TABLE `companycharge` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业简介';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyintroduvtion`
--

LOCK TABLES `companyintroduvtion` WRITE;
/*!40000 ALTER TABLE `companyintroduvtion` DISABLE KEYS */;
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
  `id` int(11) NOT NULL,
  `companyId` int(11) NOT NULL COMMENT '公司编号',
  `cmpRecTitle` varchar(20) NOT NULL COMMENT '公司标题',
  `cmpRecWage` varchar(20) NOT NULL COMMENT '公司薪资',
  `cpmRecEducation` varchar(10) NOT NULL COMMENT '公司学历需求',
  `cmpRecExperience` varchar(500) NOT NULL COMMENT '工作所需技能及水平描述',
  `cmpRecPeople` int(11) NOT NULL COMMENT '需求人数',
  `cmpRecTime` datetime NOT NULL COMMENT '发布时间',
  `cmpRecStatus` int(11) NOT NULL COMMENT '发表招聘信息状态：1.待审 2.审核通过 3.审核不通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='招聘信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyrecruit`
--

LOCK TABLES `companyrecruit` WRITE;
/*!40000 ALTER TABLE `companyrecruit` DISABLE KEYS */;
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
  `discussContent` varchar(300) NOT NULL COMMENT '评论内容',
  `discussLevel` int(11) NOT NULL COMMENT '评论星级\n1：1星\n2：2星\n3：3星\n4：4星\n5：5星',
  `discussTime` datetime NOT NULL COMMENT '评论时间',
  `discussStatus` int(11) NOT NULL COMMENT '评论状态1:待审 2：审核通过 3：审核不通过 4：删除',
  `discusUsersType` int(11) NOT NULL COMMENT '1：企业id\n2：个人用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discuss`
--

LOCK TABLES `discuss` WRITE;
/*!40000 ALTER TABLE `discuss` DISABLE KEYS */;
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
  `followDate` datetime DEFAULT NULL,
  `followType` int(11) DEFAULT NULL COMMENT '1.企业用户 2.个人用户',
  `followStartType` int(11) DEFAULT NULL COMMENT '1.企业用户 2.个人用户',
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
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `resendId` int(11) NOT NULL,
  `messageContent` text COMMENT '消息内容',
  `messageSendTime` datetime NOT NULL COMMENT '发送时间',
  `messageResendStatus` int(11) NOT NULL COMMENT '1表示您尚未阅读(默认)\n2表示您已接受邀请\n3表示您婉言谢绝了申请\n4表示已阅读，未回复',
  `messageSendStatus` int(11) NOT NULL COMMENT '1.等待审核 2.审核通过 3.审核部通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='私信表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '邀请Id',
  `userId` int(11) NOT NULL COMMENT '用户Id',
  `companyId` int(11) NOT NULL COMMENT '公司Id',
  `offerJob` varchar(50) NOT NULL COMMENT '岗位',
  `offerContent` varchar(500) NOT NULL COMMENT '信息',
  `offerInvitationTime` datetime NOT NULL COMMENT '邀请时间',
  `offerSendTime` datetime NOT NULL COMMENT '发送时间(根据系统时间)',
  `offerStatus` int(11) NOT NULL DEFAULT '1' COMMENT '状态\n1.表示您尚未阅读(默认)\n2.表示您已接受邀请\n3.表示您婉言谢绝了申请\n4.表示已阅读，未回复	\n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
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
  `id` int(11) NOT NULL COMMENT '简历Id',
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
  `resumeFLAbility` int(11) NOT NULL COMMENT '外语水平',
  `resumeFLType` int(11) NOT NULL COMMENT '外语类型',
  `resumeEnglishGrade` int(11) NOT NULL COMMENT '英语等级',
  `resumeComputerAbility` int(11) NOT NULL COMMENT '计算机水平',
  `resumePersonality` varchar(50) NOT NULL COMMENT '特点描述',
  `resumeSelfEvaluation` varchar(500) NOT NULL COMMENT '自我评价',
  `resumeStatusOne` int(11) NOT NULL DEFAULT '1' COMMENT '状态(用户的操作)\n1.完全公开(默认)\n2.只限企业浏览\n3.只对应聘企业公开\n4.保密',
  `resumeHeight` int(11) NOT NULL COMMENT '身高',
  `resumeWeight` int(11) NOT NULL COMMENT '体重',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume`
--

LOCK TABLES `resume` WRITE;
/*!40000 ALTER TABLE `resume` DISABLE KEYS */;
/*!40000 ALTER TABLE `resume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '用户Id',
  `userPassword` varchar(50) NOT NULL COMMENT '密码',
  `userName` varchar(10) NOT NULL COMMENT '昵称',
  `userGender` int(11) NOT NULL COMMENT '性别\n1.男\n2.女',
  `userEmail` varchar(100) NOT NULL COMMENT '邮箱',
  `userStatus` int(11) NOT NULL DEFAULT '1' COMMENT '状态\n1.未认证\n2.已认证\n3.禁用',
  `userRealName` varchar(10) NOT NULL COMMENT '真实姓名',
  `userIDCard` varchar(18) NOT NULL COMMENT '身份证号码',
  `userIDImg` varchar(500) NOT NULL COMMENT '身份证图片',
  `userCreateDate` datetime NOT NULL COMMENT '注册时间',
  `userHeadImgPath` varchar(500) NOT NULL COMMENT '用户头像',
  `userMoney` double NOT NULL DEFAULT '0' COMMENT '余额',
  `userBirthday` datetime NOT NULL COMMENT '出生日期',
  `userLevel` int(11) NOT NULL COMMENT '用户等级',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2017-04-05 16:41:17