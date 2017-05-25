-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 172.16.10.248    Database: worktogether
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.9-MariaDB

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
  `adminPassword` varchar(60) NOT NULL COMMENT '登陆密码',
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,113,'摄影新手必须掌握的光圈用法',4,10,'2017-04-08 16:15:33',2,'相机','<p>摄影，影者以光绘图，摄影家的能力是把日常生活中稍纵即逝的平凡事物转化为不朽的视觉图像。每次的拍摄，按动一次快门就是一次曝光的过程。定格美丽定格瞬间，让不少爱好者为之追随，那么我们一起来探讨下摄影中，用光的艺术，把握美丽的景象。</p>\r\n\r\n<p><img alt=\"\" src=\"/worktogether3/company/img/1492764908875.jpg\" style=\"height:403px; width:640px\" /></p>\r\n\r\n<p><img alt=\"光圈,摄影入门,龙摄天下\" src=\"http://www.long-photo.com/uploads/allimg/1603/869-160322110618.jpg\" /></p>\r\n\r\n<p>刚接触摄影的人都一定会接触到曝光这个概念，&ldquo;曝光&rdquo;和摄影如影随形，理解曝光少不了弄清楚相机中的光圈、快门、ISO，但是刚刚入门的人看到这缭乱的参数，常会不知所措。其实弄清这些概念并不难，那么我们一节一节的来，慢慢阐述这些看似复杂的概念，进入一个有趣的光的世界。</p>\r\n\r\n<p><strong>一、光圈的概念</strong></p>\r\n\r\n<p>光圈应该是我们接触曝光时，要了解的第一个概念了，咋一看，光圈的数值非常奇怪，而且还没什么规律，F2.8、F4、F5.6&hellip;&hellip;等等，但是光圈对于摄影非常重要，不少职业的摄影师仅靠大光圈就可以一招走天下，所以让我们首先了解什么是光圈。</p>\r\n\r\n<p><img alt=\"\" src=\"/worktogether3/company/img/1492764946118.gif\" style=\"height:188px; width:240px\" /></p>\r\n\r\n<p>光圈是用光线透过镜头，进入机身内感光面的光量的装置，已经做好的镜头，是不可能随意改变镜头的直径，但是可以在镜头内部加入多边形，让面积可变的孔状光栅来达到控制镜头通光量。简单来说，就是镜头中设置了一个小孔，然后小孔当中有一系列的排列的叶片，然后通过这些叶片的角度来控制大小，孔越大，照射进入的光线就越多，孔越小，进入镜头的光线就越少。</p>\r\n\r\n<p>在实际运用中，根据不同的环境条件，外界照进相机的光线有强有弱，所以就需要调整光圈来给相机适量的光线。例如把相机调整到M档，不改变ISO和快门，使用不同光圈拍出来的照片就有明显的区别，光圈越大照片越亮，光圈越小照片越暗。光圈变化的不同，会对照片效果有着显著的影响。</p>\r\n\r\n<p>光圈还有一个有趣的特点，数值越大光圈越小照片越暗，相反，数值越小代表的是大光圈照片越亮，这是根据光圈的计算公式得来的。光圈F值=镜头的焦距/镜头光圈的直径。完整的光圈值系列如下：F1.4，F2.0，F2.8，F4.0，F5.6，F8.0，F11，F16，F22，F32。</p>\r\n\r\n<p>光圈的档位设计是相邻的两档的数值相差1.4倍（2的平方根1.414的近似值）相邻的两档之间，透光孔直径相差根号2倍，透光孔的面积相差一倍， 底片上形成的影像的亮度相差一倍，维持相同曝光量所需要的时间相差一倍。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>这里值得一提的是光圈 F 值越小，通光孔径越大，在同一单位时间内的进光量便越多，而且上一级的进光量刚好是下一级的两倍。例如光圈从F8调整到F5.6 ，进光量便多一倍，我们也说光圈开大了一级。F5.6的通光量是F8的两倍。同理，F2是F8光通量的16倍，从F8调整到F2，光圈开大了四级。对于消费型数码相机而言，光圈 F值常常介于 F2.8 - F11。此外许多数码相机在调整光圈时，可以做 1/3 级的调整。</p>\r\n\r\n<p>光圈的作用在于决定镜头的进光量，简单的说，在快门速度（曝光速度）不变的情况下，光圈F数值越小光圈就越大，进光量越多，画面比较亮；光圈F数值越大光圈就越小，画面比较暗。</p>\r\n\r\n<p><img alt=\"\" src=\"/worktogether3/company/img/1492765024257.jpg\" style=\"height:427px; width:640px\" /></p>\r\n\r\n<p>在使用变焦镜头的时候，光圈会随之而变化。在调节变焦环时，因为更改了焦距，所以光圈数值会随之变小。例如一般镜头上都会标注这样的信息，Canon EF-S 18-135mm f/3.5-5.6 IS就是说，焦距在18的时候，最大光圈为3.5，但是在长焦端，最大光圈就缩小到了5.6。</p>\r\n\r\n<p>因此在拍摄的时候，在广角端的时候开到大光圈，有可能曝光量和景深是合适的，但如果把焦距拉倒长焦端的时候，有可能会导致曝光量的不足。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>二、景深</strong></p>\r\n\r\n<p>接下来说说景深。这是一个和光圈紧密相关的概念，最简单的定义就是，当焦距对准到某一点，这幅图前后仍然清晰的范围。选择不同的光圈数值，也导致了不同的景深效果。那么我一起来看一看吧。</p>\r\n\r\n<p><img alt=\"\" src=\"/worktogether3/company/img/1492765053236.jpg\" style=\"height:426px; width:640px\" /></p>\r\n\r\n<p>拍特写的时候，常常追求的是，主体影像是清晰锐利的，但是背景梦幻朦胧。而风光作品中，人们希望的是所能拍下的山水全局都能是清晰的。不同的景深效果，与光圈、镜头以及焦距有着密切联系。</p>\r\n\r\n<p><img alt=\"\" src=\"/worktogether3/company/img/1492765076064.jpg\" style=\"height:427px; width:640px\" /></p>\r\n\r\n<p>景深是指在相机对焦完成后，在焦点前后范围都能清晰的成像，能同时被眼看清楚的空间深度称为眼的成像空间深度。不少入门摄影的人都偏爱追求大光圈效果，大光圈能够很好的拍出暗处的景色，同时又能让无关的背景虚化，那种突出主体的效果，也是拍摄人像静物等题材必备。</p>\r\n\r\n<p><strong>三、焦距</strong></p>\r\n\r\n<p>大光圈镜头大多集中在50mm焦距段，50mm是标准焦距镜头，也是最普及的镜头之一，都是物美价廉的，同时也是普遍公认为最接近人眼焦距，同时有利于联系摄影观察力的焦段了，如果你在套头和变焦上感到瓶颈和迷茫，不妨试试定焦，感受下大光圈的魅力。但是大光圈并不是万能的，很多照片需要背景来展示当时的氛围和状态，所以根据实际情况来使用。</p>\r\n\r\n<p><img alt=\"\" src=\"/worktogether3/company/img/1492765098136.jpg\" style=\"height:426px; width:640px\" /></p>\r\n\r\n<p><strong>在此说两个需要注意的点：</strong></p>\r\n\r\n<p>（1）对于一个镜头而言，它最好的成像效果，往往不是光圈数值最大的时候，当镜头调整到最大光圈，容易出现失焦、畸变、色差和紫边等问题，一般可以尝试缩小1-2挡光圈，成像效果会更锐利，画面的通透度、对比度等也会有更好的表现；</p>\r\n\r\n<p>（2）小光圈因为进光量减少，需要更长的快门时间来保证正确的曝光，所以当现场光线不是足够明亮的情况下，想要让拍下的全景都清晰并且少噪点的情况下，光圈会用到F/8以上，很多情况下，为了防止机身抖动，和更长时间的曝光，可能就需要三脚架等外力的辅助。</p>\r\n\r\n<p><strong>四、光圈大小与成像质量</strong></p>\r\n\r\n<p>极端的光圈效果可能可以给摄影师带来意向不到的效果，但是真正最好的成像质量却是停留在中间的光圈数值，物理光学的原理中，当光圈直径过小时，光线的衍射现象会非常严重，会影响成像质量。而当镜头光圈开的过大，镜头由于制作工艺的限制，会产生不同的成像误差。</p>\r\n\r\n<p><img alt=\"\" src=\"/worktogether3/company/img/1492765122901.jpg\" style=\"height:426px; width:640px\" /></p>\r\n\r\n<p>假如一个镜头最大光圈是1.4，最小光圈是16，那么这个镜头的最佳成像效果在光圈4或者5.6上，一般来说，最佳光圈在镜头最大光圈收缩2到3级的位置，不妨拿着相机试试看，这种差异在图片放大后会有着明显的不同。</p>\r\n\r\n<p>那么拍摄时选择怎样的光圈最合适呢，这是困扰每个刚拿起相机的人的问题，那么我们来一点点看看。如果是拍摄人像和静物，用好大光圈浅景深的效果，实现美妙的前实后虚，这样能让人更关注对焦的中心，虚化不必要的干扰和杂物，假如在光线明媚的场景下拍摄，大光圈也能给你带来干净舒服的效果。</p>\r\n\r\n<p>当然纪实人文又有些不同，不少纪实摄影师会使用中等光圈，记录下人物所处的环境和状态，使人与环境相互关联和互动，这就要根据不同的拍摄主题来定了。而一般的风光摄影师会更喜欢小光圈大景深，这样在拍摄的时候能够拍下一切皆清晰的效果，增强画面的渲染力。</p>\r\n\r\n<p><img alt=\"\" src=\"/worktogether3/company/img/1492765140008.jpg\" style=\"height:426px; width:640px\" /></p>\r\n\r\n<p>而在拍摄快速运动的物体时，用好大光圈能保证更好的快门速度，保证捕捉的瞬间不会失焦。无论哪一种拍摄题材都没有固定的规则和模式，都是根据摄影师自身的表现需要，选用不同的效果。对于爱摄影的人而言，各相机厂商都提供了大量的镜头群达到不同的效果和模式，而专业的摄影师有着自己最能胜任和熟悉的镜头焦段，所以用好属于你的焦距。</p>\r\n\r\n<p><strong>五、光圈优先模式</strong></p>\r\n\r\n<p>光圈这一节基本要讲完了，现在说说光圈优先模式，刚入门的摄影新手，可以从半自动的AV档开始学着调试相机。调整不同的光圈大小，相机根据具体情况匹配合适的数值保证正确合适的曝光，这也是不少人像摄影师最爱的法宝。对于很多喜欢简单摄影的人，用好光圈也就足够拍出心满意得的好照片，有时候专业摄影师与普通摄影师爱好者差距也没有很大。</p>\r\n\r\n<p>摄影入门其实很简单，但是光影的世界又非常奇妙，让无数人为之追逐和热爱，背上相机，去拍下最美的瞬间。摄影其实带给我们的是一种对美丽生活的追求，因为想要拍下更多美好，所以才会去探索和追寻。这样的生活多美好，现在已经初步看到摄影的流光溢彩。</p>\r\n',2),(2,113,'学软件编程，看大专生如何逆袭本科生',0,0,'2017-04-21 17:12:41',2,'学习软件编程发展前景如何？','<p>很多人会问：<strong>学习软件编程发展前景如何</strong>？今天就让<a href=\"http://www.kmbdqn.com\" target=\"_blank\">云南北大青鸟</a>的毕业学员通过亲身经历来告诉大家吧！</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>今天要介绍的这位学员是云南北大青鸟的毕业学员&mdash;&mdash;小美。小美大专毕业后，因为学历的问题被很多好的公司拒之门外。在经历多次找工作的挫折后，小美意识到了自身的很多不足，并决心学习一门技能充实自己。在百度里搜索查询的时候找到了云南北大青鸟这所职业培训学校，并且在专业的咨询老师的介绍和推荐下选择了适合自己的课程&mdash;&mdash;<a href=\"http://www.kmbdqn.com/list/572.html\" target=\"_blank\">java软件开发</a>。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>小美的java学习是从零基础开始的，从基本理论知识到上机操作、项目实训，短短6个月的时间，每一次老师的要求小美都认真去完成。从最初的磕磕碰碰，到后面和同学顺利地完成一个小型项目，小美在一点一点进步着。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>因为小美清楚的知道，要想拥有一个美好的职业前景，熟练掌握一项技能是多么重要。而要达到熟练掌握的程度就必须付出比别人多的努力。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>好在功夫不负有心人，6个月的学习结束后，小美靠着扎实的java软件编程能力，就职于一家软件公司，担任java软件开发工作，刚入职的月薪就有5000元。一般的本科毕业生工资在3000-4000左右，而小美现在的工资已经超过了本科毕业生，这是他之前想都不敢想的。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>小美的努力，换来了无限的职业发展前景，这些离不开他的刻苦努力，更离不开他当时正确的选择！</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>可见，学习软件编程的发展前景是非常好的。无论你是什么学历，只要你掌握了扎实的软件编程技术，那么就算你是大专学历的学生，也能实现逆袭本科生！</p>\r\n\r\n<p><img alt=\"\" src=\"/worktogether3/company/img/1492765945774.png\" style=\"height:512px; width:677px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/worktogether3/company/img/1492765958275.png\" style=\"height:129px; width:418px\" /></p>\r\n',2),(3,113,'Java设计模式重要知识点 ',0,0,'2017-04-21 17:15:33',2,'重要知识点 ','<p><strong>设计模式的分类：</strong></p>\r\n\r\n<p>设计模式主要分三个类型:创建型、结构型和行为型。</p>\r\n\r\n<p><strong>创建型有：</strong></p>\r\n\r\n<p>一、Singleton，单例模式：保证一个类只有一个实例，并提供一个访问它的全局访问点</p>\r\n\r\n<p>二、Abstract Factory，抽象工厂：提供一个创建一系列相关或相互依赖对象的接口，而无须指定它们的具体类。</p>\r\n\r\n<p>三、Factory Method，工厂方法：定义一个用于创建对象的接口，让子类决定实例化哪一个类，Factory Method使一个类的实例化延迟到了子类。</p>\r\n\r\n<p>四、Builder，建造模式：将一个复杂对象的构建与他的表示相分离，使得同样的构建过程可以创建不同的表示。</p>\r\n\r\n<p>五、Prototype，原型模式：用原型实例指定创建对象的种类，并且通过拷贝这些原型来创建新的对象。</p>\r\n\r\n<p><strong>行为型有：</strong></p>\r\n\r\n<p>六、Iterator，迭代器模式：提供一个方法顺序访问一个聚合对象的各个元素，而又不需要暴露该对象的内部表示。</p>\r\n\r\n<p>七、Observer，观察者模式：定义对象间一对多的依赖关系，当一个对象的状态发生改变时，所有依赖于它的对象都得到通知自动更新。</p>\r\n\r\n<p>八、Template Method，模板方法：定义一个操作中的算法的骨架，而将一些步骤延迟到子类中，TemplateMethod使得子类可以不改变一个算法的结构即可以重定义该算法得某些特定步骤。</p>\r\n\r\n<p>九、Command，命令模式：将一个请求封装为一个对象，从而使你可以用不同的请求对客户进行参数化，对请求排队和记录请求日志，以及支持可撤销的操作。</p>\r\n\r\n<p>十、State，状态模式：允许对象在其内部状态改变时改变他的行为。对象看起来似乎改变了他的类。</p>\r\n\r\n<p>十一、Strategy，策略模式：定义一系列的算法，把他们一个个封装起来，并使他们可以互相替换，本模式使得算法可以独立于使用它们的客户。</p>\r\n\r\n<p>十二、China of Responsibility，职责链模式：使多个对象都有机会处理请求，从而避免请求的送发者和接收者之间的耦合关系</p>\r\n\r\n<p>十三、Mediator，中介者模式：用一个中介对象封装一些列的对象交互。</p>\r\n\r\n<p>十四、Visitor，访问者模式：表示一个作用于某对象结构中的各元素的操作，它使你可以在不改变各元素类的前提下定义作用于这个元素的新操作。</p>\r\n\r\n<p>十五、Interpreter，解释器模式：给定一个语言，定义他的文法的一个表示，并定义一个解释器，这个解释器使用该表示来解释语言中的句子。</p>\r\n\r\n<p>十六、Memento，备忘录模式：在不破坏对象的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态。</p>\r\n\r\n<p><strong>结构型有：</strong></p>\r\n\r\n<p>十七、Composite，组合模式：将对象组合成树形结构以表示部分整体的关系，Composite使得用户对单个对象和组合对象的使用具有一致性。</p>\r\n\r\n<p>十八、Facade，外观模式：为子系统中的一组接口提供一致的界面，fa?ade提供了一高层接口，这个接口使得子系统更容易使用。</p>\r\n\r\n<p>十九、Proxy，代理模式：为其他对象提供一种代理以控制对这个对象的访问</p>\r\n\r\n<p>二十、Adapter,适配器模式：将一类的接口转换成客户希望的另外一个接口，Adapter模式使得原本由于接口不兼容而不能一起工作那些类可以一起工作。</p>\r\n\r\n<p>二十一、Decrator，装饰模式：动态地给一个对象增加一些额外的职责，就增加的功能来说，Decorator模式相比生成子类更加灵活。</p>\r\n\r\n<p>二十二、Bridge，桥模式：将抽象部分与它的实现部分相分离，使他们可以独立的变化。</p>\r\n\r\n<p>二十三、Flyweight，享元模式</p>\r\n\r\n<p><img alt=\"\" src=\"/worktogether3/company/img/1492766120872.jpg\" style=\"height:273px; width:640px\" /></p>\r\n\r\n<p><strong>常用的</strong><strong>设计原则：(重要)</strong></p>\r\n\r\n<p>1.逻辑代码独立到单独的方法中，注重封装性--易读，易复用。</p>\r\n\r\n<p>2.写类，写方法，写功能时，应考虑其移植性，复用性：防止一次性代码！</p>\r\n\r\n<p>3.熟练运用继承的思想：</p>\r\n\r\n<p>4.熟练运用接口的思想：</p>\r\n\r\n<p><strong>切记：</strong></p>\r\n\r\n<p>1.不要陷入模式的陷阱，为了使用模式而去套模式，那样会陷入形式主义。</p>\r\n\r\n<p>2.使用模式的时候，一定要注意模式的意图（intent），不要过多的去关注模式的实现细节</p>\r\n\r\n<p>3.不要顽固地认为设计模式一书中的类图或实现代码就代表了模式本身。</p>\r\n\r\n<p>&nbsp;</p>\r\n',2),(4,113,'Java中的反射总结 ',0,0,'2017-04-21 17:19:36',2,'反射到底是个什么东西','<p>刚开始学习Java的时候真的很难理解反射到底是个什么东西</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>一些书籍，哪怕是很经典的书籍都解释的让人感觉懵懵的，或许的确是我太笨</p>\r\n\r\n<p>况且，网上说在将来学习框架的时候需要经常应用到反射机制，这样一来总让人心里有些不安</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>就方才偶然又把讲解反射的章节和视频看了一点，觉得能理解一些了</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>现在决定一鼓作气，边看边写，顺便把一些主要的内容和操作都记载到这里</p>\r\n\r\n<p>我想，对于我这么一个笨笨的人来说，学习的最好方法也许就是不断重复</p>\r\n\r\n<p>遇到不懂的知识就停下来把以往的重新学一遍，虽然浪费了很多时间，但对我也有些效果</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>我的理解是：所谓反射，就是根据一个已经实例化了的对象来还原类的完整信息</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>至少对我而言，我认为它带给我的好处是，让我从下往上的又了解了一遍面向对象</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>x_x 在此又痛恨一边那些厚部头们，把我的脑细胞搞死一片</p>\r\n\r\n<p>如果要完成反射，那么必须了解Class类</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>实例1：通过对象取得包名和类名</strong></p>\r\n\r\n<p><img alt=\"\" src=\"/worktogether3/company/img/1492766254032.png\" style=\"height:409px; width:999px\" /></p>\r\n\r\n<p>编译结果如下，注意包的编译方式即可</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>此处的getClass()方法是默认继承自Object类的</p>\r\n\r\n<p><img alt=\"\" src=\"/worktogether3/company/img/1492766297334.png\" style=\"height:131px; width:347px\" /></p>\r\n\r\n<p>在java中，Object类是所有类的父类，同样，所有类的实例化对象也都是Class类的实例</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>因此，这样一来就会牵扯到向上转型和向下转型的概念</p>\r\n\r\n<p>由于向下转型的不安全因素，在这里泛型也会接踵而来</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>（不过我想说的是，此处的泛型设计很刺眼！尼玛，整个java的语法设计同样刺眼，超恶心！！！）</p>\r\n\r\n<p><strong>&nbsp;</strong></p>\r\n\r\n<p><strong>实例2：Class类的实例化</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>由于Class类没有构造方法，所以实例化Class类的方式有点特殊，有三种方式：</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>对象.getClass( )</p>\r\n	</li>\r\n	<li>\r\n	<p>类.Class</p>\r\n	</li>\r\n	<li>\r\n	<p>forName( )</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>我们还是使用String类做例，因为String类用的比较多，便于理解</p>\r\n\r\n<p>这里需要注意的是，构造方法需要使用getConstructor( )方法获得</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>至于参数类型则是：原有类型.class</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>还有一点，无论是有参还是无参，这里所使用的构造方法，原本的类里面必须对应存在</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>那么，如何才能知道原有类里面的构造方法，普通方法，继承的父类等详细信息呢？接着看</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>要通过反射获取类的结构我们这里要导入一个新的包java.lang.reflect</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>实例5：取得类的构造方法</strong></p>\r\n\r\n<pre>\r\n<code>import java.lang.reflect.Constructor; &nbsp; \r\nimport java.util.Arrays; &nbsp; \r\n\r\npublic class Demo { &nbsp; \r\n &nbsp; &nbsp;//下面的几个方法抛出来的异常太多，为了代码的紧凑性，这里就直接抛给虚拟机了 &nbsp; \r\n &nbsp; &nbsp;public static void main(String[] args) throws Exception { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Class&lt;?&gt; c = null; &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;try { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c = Class.forName(&quot;java.lang.Boolean&quot;); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;} catch (ClassNotFoundException e) { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;e.printStackTrace(); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;} &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;//这里的getConstructors()方法返回的是一个Constructor数组 &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Constructor&lt;?&gt;[] cons = c.getConstructors(); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;//打印的方式你可以自己写，为了方便我用Arrays.toString()，凑合着看 &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;System.out.println(Arrays.toString(cons)); &nbsp; \r\n &nbsp; &nbsp;} &nbsp; \r\n}</code></pre>\r\n\r\n<p>&nbsp;我选择了Boolean类来做例，因为Boolean类的构造方法就两个，方便看</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>&nbsp;</strong></p>\r\n\r\n<p><strong>实例6：取得类所实现的接口</strong></p>\r\n\r\n<pre>\r\n<code>import java.util.Arrays; &nbsp; \r\n\r\npublic class Demo { &nbsp; \r\n &nbsp; &nbsp;public static void main(String[] args) throws Exception { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Class&lt;?&gt; c = null; &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;try { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c = Class.forName(&quot;java.lang.Boolean&quot;); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;} catch (ClassNotFoundException e) { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;e.printStackTrace(); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;} &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Class&lt;?&gt;[] in = c.getInterfaces(); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;System.out.println(Arrays.toString(in)); &nbsp; \r\n &nbsp; &nbsp;} &nbsp; \r\n}</code></pre>\r\n\r\n<p>&nbsp;没什么好说的，看结果</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src=\"http://mmbiz.qpic.cn/mmbiz_png/YOkhPCLwLCicS69kcwf3GBtH31DQibvzsNicztLM7NuibBzQJUvGKfic0XKqLNt1aYP5v99TrmVFhhia1ZTIeMP40G2w/640?wxfrom=5&amp;wx_lazy=1\" style=\"border-style:initial; border-width:0px; height:auto ! important; width:525px ! important\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>实例7：取得父类</strong></p>\r\n\r\n<pre>\r\n<code>public class Demo { &nbsp; \r\n &nbsp; &nbsp;public static void main(String[] args) throws Exception { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Class&lt;?&gt; c = null; &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;try { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c = Class.forName(&quot;java.lang.Boolean&quot;); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;} catch (ClassNotFoundException e) { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;e.printStackTrace(); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;} &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;//注意了，这里不会是数组，why？ &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Class&lt;?&gt; su = c.getSuperclass(); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;System.out.println(su); &nbsp; \r\n &nbsp; &nbsp;} &nbsp; \r\n}</code></pre>\r\n\r\n<p>&nbsp;别忘了，java中是单继承，父类只有一个</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>实例8：取得类的全部方法</strong></p>\r\n\r\n<pre>\r\n<code>import java.lang.reflect.Method; &nbsp; \r\n\r\npublic class Demo { &nbsp; \r\n &nbsp; &nbsp;public static void main(String[] args) throws Exception { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Class&lt;?&gt; c = null; &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;try { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c = Class.forName(&quot;java.lang.Boolean&quot;); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;} catch (ClassNotFoundException e) { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;e.printStackTrace(); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;} &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Method[] m = c.getMethods(); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;//好吧，这次我就大发慈悲的写个打印列表出来 &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;for (int i = 0; i &lt; m.length; i++) { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;System.out.println(m[i]); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;} &nbsp; \r\n &nbsp; &nbsp;} &nbsp; \r\n}</code></pre>\r\n\r\n<p>&nbsp;截取一部分，看看，意思下就行了&hellip;&hellip;这几个例子都比较简单</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>实例9：取得本类的全部属性</strong></p>\r\n\r\n<pre>\r\n<code>import java.lang.reflect.Field; &nbsp; \r\n\r\nclass Person { &nbsp; \r\n &nbsp; &nbsp;private String name; &nbsp; \r\n &nbsp; &nbsp;private int age; &nbsp; \r\n} &nbsp; \r\n\r\npublic class Demo { &nbsp; \r\n &nbsp; &nbsp;public static void main(String[] args) throws Exception { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Class&lt;?&gt; c = null; &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;try { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c = Class.forName(&quot;Person&quot;); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;} catch (ClassNotFoundException e) { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;e.printStackTrace(); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;} &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Field[] f = c.getDeclaredFields(); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;for (int i = 0; i &lt; f.length; i++) { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;System.out.println(f[i]); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;} &nbsp; \r\n &nbsp; &nbsp;} &nbsp; \r\n}</code></pre>\r\n\r\n<p>getDeclaredFielsd()方法可以获取全部属性，getFields()只能获取公共属性</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src=\"http://mmbiz.qpic.cn/mmbiz_png/YOkhPCLwLCicS69kcwf3GBtH31DQibvzsNWH3jhHSoek7nicD46VNwic5qWFd0xxnGib5l45VRbdxw3ibN3NIRGJbcZA/640?wxfrom=5&amp;wx_lazy=1\" style=\"border-style:initial; border-width:0px; height:auto ! important; width:350px ! important\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>实例10：获取本类中属性的值</strong></p>\r\n\r\n<pre>\r\n<code>import java.lang.reflect.Field; &nbsp; \r\n\r\nclass Person { &nbsp; \r\n &nbsp; &nbsp;public String name; &nbsp; \r\n &nbsp; &nbsp;private int age; &nbsp; \r\n\r\n &nbsp; &nbsp;public Person(String name, int age) { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;this.name = name; &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;this.age = age; &nbsp; \r\n &nbsp; &nbsp;} &nbsp; \r\n} &nbsp; \r\n\r\npublic class Demo { &nbsp; \r\n &nbsp; &nbsp;public static void main(String[] args) throws Exception { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Person p = new Person(&quot;zhangsan&quot;,12); &nbsp; \r\n\r\n &nbsp; &nbsp; &nbsp; &nbsp;Class&lt;?&gt; c = p.getClass(); &nbsp; \r\n\r\n &nbsp; &nbsp; &nbsp; &nbsp;//获取公共属性的值 &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Field f1 = c.getField(&quot;name&quot;); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;//get(p)表明要获取是哪个对象的值 &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;String str = (String) f1.get(p); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;System.out.println(&quot;姓名： &quot; + str); &nbsp; \r\n\r\n &nbsp; &nbsp; &nbsp; &nbsp;//获取私有属性的值 &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Field f2 = c.getDeclaredField(&quot;age&quot;); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;//age是私有属性，所以要设置安全检查为true &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;f2.setAccessible(true); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;int age = (int) f2.get(p); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;System.out.println(&quot;年龄： &quot; + age); &nbsp; \r\n &nbsp; &nbsp;} &nbsp; \r\n}</code></pre>\r\n\r\n<p>&nbsp;要注意的是：setAccessible()方法可以设置是否访问和修改私有属性</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>坦白说，java学到现在我还没发现什么能亮瞎我钛金眼的知识在里边</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>每次都是写一堆繁琐的语法实现个小玩意儿，不然就是拼命调用API，拼命的抛异常</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>让本身显得不够紧凑的代码变得愈发累赘</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>如果我喜欢一门语言，在我利用它做出东西来之前，它本身的特性必须能够打动我</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>显然，java并不让我快乐，也许很多程序员跟我一样是被迫使用java的</p>\r\n\r\n<p>仅以此来安抚我那颗孤独编码的心，下面接着看内容</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><strong>反射的应用</strong></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>实例11：通过反射修改属性</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n<code>import java.lang.reflect.Field; &nbsp; \r\n\r\nclass Person { &nbsp; \r\n &nbsp; &nbsp;private String name; &nbsp; \r\n\r\n &nbsp; &nbsp;public Person(String name) { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;this.name = name; &nbsp; \r\n &nbsp; &nbsp;} &nbsp; \r\n\r\n &nbsp; &nbsp;public String toString() { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;return &quot;姓名： &quot; + this.name; &nbsp; \r\n &nbsp; &nbsp;} &nbsp; \r\n} &nbsp; \r\n\r\npublic class Demo { &nbsp; \r\n &nbsp; &nbsp;public static void main(String[] args) throws Exception { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Person p = new Person(&quot;王二狗&quot;); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;System.out.println(p); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Class&lt;?&gt; c = p.getClass(); &nbsp; \r\n\r\n &nbsp; &nbsp; &nbsp; &nbsp;//定义要修改的属性 &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Field f = c.getDeclaredField(&quot;name&quot;); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;f.setAccessible(true); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;//修改属性，传入要设置的对象和值 &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;f.set(p, &quot;张二蛋&quot;); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;System.out.println(p); &nbsp; \r\n &nbsp; &nbsp;} &nbsp; \r\n}</code></pre>\r\n\r\n<p>&nbsp;几个方法都是有联系的，如果看不懂就先熟悉上面几个例子</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>&nbsp;</strong></p>\r\n\r\n<p><strong>实例12：通过反射调用方法</strong></p>\r\n\r\n<pre>\r\n<code>import java.lang.reflect.Method; &nbsp; \r\n\r\nclass Person { &nbsp; \r\n &nbsp; &nbsp;public void print(int i) { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;System.out.println(&quot;我在写数字： &quot; + i); &nbsp; \r\n &nbsp; &nbsp;} &nbsp; \r\n\r\n &nbsp; &nbsp;public static void say(String str) { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;System.out.println(&quot;我在说： &quot; + str); &nbsp; \r\n &nbsp; &nbsp;} &nbsp; \r\n} &nbsp; \r\n\r\npublic class Demo { &nbsp; \r\n &nbsp; &nbsp;public static void main(String[] args) throws Exception { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Person p = new Person(); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Class&lt;?&gt; c = p.getClass(); &nbsp; \r\n\r\n &nbsp; &nbsp; &nbsp; &nbsp;//getMethod()方法需要传入方法名，和参数类型 &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Method m1 = c.getMethod(&quot;print&quot;, int.class); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;//invoke()表示调用的意思，需要传入对象和参数 &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;m1.invoke(p, 10); &nbsp; \r\n\r\n &nbsp; &nbsp; &nbsp; &nbsp;Method m2 = c.getMethod(&quot;say&quot;, String.class); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;//这里的null表示不由对象调用，也就是静态方法 &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;m2.invoke(null, &quot;你妹&quot;); &nbsp; \r\n &nbsp; &nbsp;} &nbsp; \r\n}</code></pre>\r\n\r\n<p>这里演示了一个普通的有参方法和一个静态方法</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>既然有参数的都写出来了，那么无参的就更简单了，直接传入一个对象即可</p>\r\n\r\n<p><strong>&nbsp;</strong></p>\r\n\r\n<p><strong>实例13：通过反射操作数组</strong></p>\r\n\r\n<pre>\r\n<code>import java.lang.reflect.Array; &nbsp; \r\n\r\npublic class Demo { &nbsp; \r\n &nbsp; &nbsp;public static void main(String[] args) throws Exception { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;int[] arr = {1,2,3,4,5}; &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Class&lt;?&gt; c = arr.getClass().getComponentType(); &nbsp; \r\n\r\n &nbsp; &nbsp; &nbsp; &nbsp;System.out.println(&quot;数组类型： &quot; + c.getName()); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;int len = Array.getLength(arr); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;System.out.println(&quot;数组长度： &quot; + len); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;System.out.print(&quot;遍历数组： &quot;); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;for (int i = 0; i &lt; len; i++) { &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;System.out.print(Array.get(arr, i) + &quot; &quot;); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;} &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;System.out.println(); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;//修改数组 &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;System.out.println(&quot;修改前的第一个元素： &quot; + Array.get(arr, 0)); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;Array.set(arr, 0, 3); &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;System.out.println(&quot;修改后的第一个元素： &quot; + Array.get(arr, 0)); &nbsp; \r\n &nbsp; &nbsp;} &nbsp; \r\n}</code></pre>\r\n\r\n<p>&nbsp;这里要注意一点，getComponentType( )返回的是数组元素的Class</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>暂时就写这么多，我看的书中还有反射在工厂模式中的应用</p>\r\n\r\n<p>无非是用forName()方法替换一下，没什么可说的</p>\r\n\r\n<p>我是个java初级黑，我恨java那种恶心的语法和设计</p>\r\n\r\n<p>这都是为了Android，为了打基础，为了适应以后的工作</p>\r\n\r\n<p>Fuck java&hellip;&hellip;</p>\r\n\r\n<p>&nbsp;</p>\r\n',2),(11,1234567898,'2016年中国环境违法罚没款66.33亿 创历史新高',0,0,'2017-05-19 17:01:17',1,'2016年中国','<p>中新社北京4月21日电(记者阮煜琳)中国环境保护部21日在北京公布,中国持续加大打击环境违法行为的力度,2016年全国共立案查处环境违法案件13.78万件,下达行政处罚决定12.47万份,罚没款数额总计66.33亿元(人民币,下同),创造历史新高。</p>\r\n\r\n<p>中国环境保护部环境监察局局长田为勇21日在北京对记者说,2016年以来,中国6万多名基层环境监察执法人员不断加强日常执法,在全国范围内逐步形成了严厉打击环境污染违法犯罪的良好氛围。</p>\r\n\r\n<p>2016年中国共立案查处环境违法案件13.78万件,下达行政处罚决定12.47万份,罚没款数额总计66.33亿元人民币,分别比2015年增长了34%、28%和56%,广东、北京、江苏和浙江行政处罚案件数均超过万件,全国有20个地区罚没款数额超过1亿元。全国共实施挂牌督办案件1215个,涉及企业1715家。</p>\r\n\r\n<p>田为勇说,在环保法四个配套办法的执行方面,2016年中国五类案件的总数为22730件,同比上升93%。其中,按日连续处罚案件共1017件,同比上升42%,罚没款数额达81435万元,同比增加43%；实施查封扣押案件共9976件,同比上升138%；实施限产停产案件共5673件,同比上升83%；移送行政拘留共4041起,同比上升94%；移送涉嫌环境污染犯罪案件共计2023件,同比上升20%。</p>\r\n\r\n<p>据介绍,今年第一季度,中国五类案件总数为4987件。其中,按日连续处罚案件共224件,同比上升54%,罚款数额达26375万元；查封扣押案件2190件,同比上升229%；限产停产案件1228件,同比上升308%；移送行政拘留958起,同比上升206%；涉嫌犯罪移送公安机关案件387起,同比上升46%。(完)</p>\r\n\r\n<p>声明：本文由入驻搜狐公众平台的作者撰写，除搜狐官方账号外，观点仅代表作者本人，不代表搜狐立场。</p>\r\n',2);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articlestatus`
--

DROP TABLE IF EXISTS `articlestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articlestatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleId` varchar(45) NOT NULL,
  `articleType` varchar(45) NOT NULL COMMENT '1.技术类\n2.求职类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articlestatus`
--

LOCK TABLES `articlestatus` WRITE;
/*!40000 ALTER TABLE `articlestatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `articlestatus` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentarticle`
--

LOCK TABLES `commentarticle` WRITE;
/*!40000 ALTER TABLE `commentarticle` DISABLE KEYS */;
INSERT INTO `commentarticle` VALUES (1,1,1,'2017-04-07 11:22:10','文章不错，受用了',3,2,2),(2,1,2,'2017-04-07 11:22:10','初学者可以看下，还不错哦',3,2,2),(3,1,3,'2017-04-07 11:22:10','太基础了，飘过',0,2,2),(4,1,1,'2017-04-07 11:22:10','再来学习下',0,2,2),(5,1,2,'2017-04-07 11:22:10','学习下学习下',0,2,2);
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
  `companyPassword` varchar(60) NOT NULL COMMENT '密码',
  `companyName` varchar(30) DEFAULT NULL COMMENT '公司全称',
  `companySimpleName` varchar(15) DEFAULT NULL COMMENT '公司简称',
  `companyLogo` varchar(50) DEFAULT NULL COMMENT '公司logo',
  `companyLicenseImg` varchar(50) DEFAULT NULL COMMENT '公司营业执照图',
  `companyLicenseNo` varchar(50) DEFAULT NULL COMMENT '公司营业执照码',
  `companyCorporator` varchar(50) DEFAULT NULL COMMENT '法人代表',
  `companyTel` varchar(30) DEFAULT NULL COMMENT '公司电话',
  `companyEmail` varchar(30) DEFAULT NULL COMMENT '公司邮件',
  `companyAddress` varchar(100) DEFAULT NULL COMMENT '公司地址',
  `companyStatus` int(11) NOT NULL DEFAULT '1' COMMENT '账户状态：1.正常 2.禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'18988443557','e10adc3949ba59abbe56e057f20f883e','喜大普奔科技有限公司 ','喜大普奔','1','1','1','李胤','18988443557','419660212@qq.com','昆明市西山区时代风华二期14幢1单元203',1),(2,'12','12','12','12','12','12','12','12','12','12','12',12),(3,'12','12','12','12','12','12','12','12','12','12','12',12),(4,'465','465','465','456','46','465','465','456','465','456','456',456),(5,'465','456','465','456','46','465','465','456','465','456','456',456),(6,'465','111','465','456','46','465','465','456','465','456','456',456),(7,'1','1','1','1','1','1','1','1','1','1','1',1),(8,'1','2','1','1','1','1','1','1','1','1','1',1),(9,'2','2','2','2','2','2','2','2','2','2','2',2),(10,'419660212@qq.com','0','1','0','0','0','0','1','0','419660212@qq.com','0',1),(110,'1','1','1','1','1','1','1','1','1','1','1',1),(111,'123','123','123','123','123','123','123','123','123','123','123',123),(112,'123','321','123','123','123','123','123','123','123','123','123',123),(113,'18908780731','e10adc3949ba59abbe56e057f20f883e','沙雕科技食品有限公司','沙雕','20170516/1494913790405.jpg','20170516/1494913792262.jpg','1693456','刘志浩大沙雕','18908780731','419660212@qq.com','云南昆明',1),(114,'13987876003','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(115,'15987867002','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(116,'15287100091','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(117,'13988888888','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(118,'13444444444','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(119,'13555555555','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(120,'13555555555','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(121,'13555555554','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(122,'13456789087','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(123,'15000000000','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(124,'15000000001','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(125,'13888888889','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(126,'13888888889','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(127,'13888888881','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(128,'13888888882','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(129,'13888888883','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(130,'13888888884','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(131,'13888888884','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(132,'13888888884','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(133,'13888888884','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(134,'13888888884','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(135,'13888888887','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(136,'13888888887','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(137,'13888888887','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(138,'13888888880','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(139,'13888888880','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(140,'13888888882','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(141,'13888888882','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(142,'13877766666','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(143,'13765789087','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(144,'13765789083','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(145,'13765789083','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(146,'13765789083','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(147,'13765789083','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(148,'13765789083','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(149,'13765789083','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(150,'13765789083','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(151,'13944484848','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(152,'13944484843','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(153,'13944484843','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(154,'13944484843','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(155,'13944484843','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(156,'13944484843','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(157,'13944484843','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(158,'13944484843','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(159,'13944484843','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(160,'13944484843','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(161,'13944484843','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(162,'13944484843','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(163,'13944484843','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(164,'13944484843','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(165,'15987867002','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='公司充值';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companycharge`
--

LOCK TABLES `companycharge` WRITE;
/*!40000 ALTER TABLE `companycharge` DISABLE KEYS */;
INSERT INTO `companycharge` VALUES (1,1,0,0,544,'2017-04-14 17:10:00',2),(2,1,0,0,544,'2017-04-14 17:10:00',2),(3,1,0,0,544,'2017-04-14 17:10:00',2),(4,1,0,10,534,'2017-04-14 17:23:25',2),(5,1,1,0,535,'2017-04-15 13:51:22',1),(6,1,0,1,534,'2017-04-15 13:52:24',2),(7,1,1,0,535,'2017-04-15 15:35:53',1),(8,1,1,0,536,'2017-04-15 15:37:49',1),(9,1,1,0,537,'2017-04-15 15:44:19',1),(10,1,1,0,538,'2017-04-15 15:45:12',1),(11,1,1,0,539,'2017-04-15 15:46:05',1),(12,1,1,0,540,'2017-04-15 15:57:38',1),(13,1,1,0,541,'2017-04-15 16:01:38',1),(14,1,1,0,542,'2017-04-15 16:16:12',1),(15,1,1,0,543,'2017-04-15 16:20:47',1),(16,1,1,0,544,'2017-04-15 16:21:13',1),(17,1,1,0,545,'2017-04-15 16:23:13',1),(18,1,1,0,546,'2017-04-17 10:54:37',1),(19,1,1,0,547,'2017-04-17 13:36:50',1),(20,1,1,0,548,'2017-04-17 13:37:42',1),(21,1,1,0,549,'2017-04-17 13:39:17',1),(22,1,1,0,550,'2017-04-17 13:42:37',1),(23,1,1,0,551,'2017-04-17 13:43:47',1),(24,1,1,0,552,'2017-04-17 14:05:52',1),(25,1,1,0,553,'2017-04-17 14:07:13',1),(26,10,1,0,1,'2017-04-21 10:00:06',1),(27,10,1,0,2,'2017-04-21 10:00:25',1),(28,10,1,0,3,'2017-04-21 10:01:41',1),(29,10,1,0,4,'2017-04-21 10:10:20',1),(30,10,1,0,5,'2017-04-21 10:11:14',1),(31,10,2,0,7,'2017-04-21 10:31:44',1),(32,10,1,0,8,'2017-04-21 10:32:41',1),(33,10,1,0,9,'2017-04-21 10:33:12',1),(34,10,1,0,10,'2017-04-21 10:35:27',1),(35,10,1,0,11,'2017-04-21 10:36:10',1),(36,10,1,0,12,'2017-04-21 10:37:04',1),(37,1,1,0,554,'2017-04-21 11:25:18',1),(38,1,23,0,577,'2017-04-21 14:01:40',1),(39,1,1,0,578,'2017-04-21 14:07:22',1),(40,1,1,0,579,'2017-04-21 14:12:57',1),(41,1,1,0,580,'2017-04-21 14:13:09',1),(42,10,1,0,13,'2017-04-22 16:06:35',1),(43,10,1,0,14,'2017-04-22 16:16:08',1),(44,10,1,0,15,'2017-04-22 16:17:02',1),(45,10,12,0,27,'2017-04-22 16:20:33',1),(46,10,12,0,39,'2017-04-22 16:21:19',1),(47,10,12,0,51,'2017-04-22 16:22:04',1),(48,113,12,0,12,'2017-05-09 17:24:47',1);
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
  `companyDetailImg` varchar(200) NOT NULL COMMENT '图片名称',
  `companydetailDisc` int(11) NOT NULL COMMENT '图片描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
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
  `cmpIntStatus` int(11) DEFAULT NULL COMMENT '企业简介发表状态：1.待审核 2.审核通过 3.审核通过',
  PRIMARY KEY (`id`),
  UNIQUE KEY `companyId_UNIQUE` (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='企业简介';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyintroduction`
--

LOCK TABLES `companyintroduction` WRITE;
/*!40000 ALTER TABLE `companyintroduction` DISABLE KEYS */;
INSERT INTO `companyintroduction` VALUES (3,1,'公司创建于一九九零年末，是专业生产各种规格高频直缝碳钢焊管的现代化新兴企业。是A集团、B集团、C公司共同投资的中外合资企业。公司以巨资引进美国、德国、台湾等国家和地区九十年代先进水平的焊管生产技术及设备，聘请焊管生产高级专家和高级管理专家，建立完善的符合ISO9002-94《质量体系-生产和安装的质量保证模式》标准的质量体系，严格按照API5L、ASTMA500、ASTMA513、ISO559、JIS G3466、GB3092和GB/TT3739等标准生产各种规格直缝电焊钢管。产品除外销外，尚顾及国内市场需求。',3,1,'初级业务员底薪3000+提成','双休','21','21',2),(4,12,'231',6786,786,'678','68','6786','86',6),(5,10,'2',2,1,'1','1','1','1',1),(6,113,'出访26次，超过160天，平均每年有1个月以上的时间是用于出访。在国内会晤外国元首、政府首脑约230多人次。杭州G20峰会期间平均一天会见6位领导人，有时一天仅睡4小时……四年多来，无论出国访问还是主场外交，超紧凑行程、满负荷运转是习近平工作的常态。',1,1,'','双休','五险一金','8k',NULL);
/*!40000 ALTER TABLE `companyintroduction` ENABLE KEYS */;
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
  `cmpRecTitle` varchar(20) NOT NULL COMMENT '招聘标题',
  `cmpRecWage` varchar(20) NOT NULL COMMENT '公司薪资',
  `cmpRecEducation` varchar(10) NOT NULL COMMENT '公司学历需求',
  `cmpRecExperience` varchar(500) NOT NULL COMMENT '工作所需技能及水平描述',
  `cmpRecPeople` int(11) NOT NULL COMMENT '需求人数',
  `cmpRecTime` datetime NOT NULL COMMENT '发布时间',
  `cmpRecStatus` int(11) NOT NULL COMMENT '发表招聘信息状态：1.待审 2.审核通过 3.审核不通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='招聘信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyrecruit`
--

LOCK TABLES `companyrecruit` WRITE;
/*!40000 ALTER TABLE `companyrecruit` DISABLE KEYS */;
INSERT INTO `companyrecruit` VALUES (1,3,'ncie',' 5k','123','<p>3213</p>\r\n',231,'2017-04-28 11:07:27',2),(2,3,' 321',' 321','321','<p>3131</p>\r\n',31,'2017-04-21 11:08:59',2),(3,1,' nice',' 4k','大学','<p>hello</p>\r\n',50,'2017-04-21 13:47:15',2),(4,1,' 鼓励师','100-10000','大学','<ol>\r\n	<li>\r\n	<p>女性；</p>\r\n	</li>\r\n	<li>\r\n	<p>懂得忍耐、能忍受被鼓励对象负面情绪下的言语；</p>\r\n	</li>\r\n	<li>\r\n	<p>善解人意、善于倾听和沟通，迅速缓解被鼓励对象的精神压力</p>\r\n	</li>\r\n	<li>\r\n	<p>懂互联网、爱玩游戏最好，有共同的话题有助于沟通。</p>\r\n	</li>\r\n</ol>\r\n',1,'2017-04-27 12:07:38',2),(5,113,'程序员鼓励师',' 8k','幼儿园大班','<p>工作所需技能及水平描述</p>\r\n',5,'2017-05-16 11:05:51',1);
/*!40000 ALTER TABLE `companyrecruit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyresume`
--

DROP TABLE IF EXISTS `companyresume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companyresume` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `companyId` int(11) NOT NULL COMMENT '公司ID',
  `resumeId` int(11) NOT NULL COMMENT '简历ID',
  `cmprTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  `cmprStatus` int(11) NOT NULL DEFAULT '1' COMMENT '审核状态：1.等待审核 2.审核通过 3.审核不通过',
  `companyResumeId` int(11) NOT NULL COMMENT '投递简历的用户ID',
  `cmprAction` int(11) NOT NULL DEFAULT '1' COMMENT '接收状态： 1.尚未阅读 2.接受简历 3.拒绝简历4.已阅读',
  `companyrecruitId` int(11) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyresume`
--

LOCK TABLES `companyresume` WRITE;
/*!40000 ALTER TABLE `companyresume` DISABLE KEYS */;
INSERT INTO `companyresume` VALUES (1,113,1,'2017-05-17 05:56:46',1,1,1,0),(2,1,1,'2017-05-19 07:52:24',1,1234567898,1,3),(3,1,1,'2017-05-22 05:51:28',1,1234567898,1,3);
/*!40000 ALTER TABLE `companyresume` ENABLE KEYS */;
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
-- Table structure for table `crowdfund`
--

DROP TABLE IF EXISTS `crowdfund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crowdfund` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '众筹项目ID',
  `crowdfundProjectName` varchar(50) NOT NULL COMMENT '众筹项目名称',
  `crowdfundProjectSummary` varchar(500) NOT NULL COMMENT '众筹项目简介',
  `crowdfundProjectMoney` varchar(11) NOT NULL COMMENT '众筹项目金额（单位：元）',
  `crowdfundProjectCycle` varchar(50) NOT NULL COMMENT '众筹项目周期',
  `crowdfundProjectMethod` varchar(2000) NOT NULL COMMENT '众筹办法',
  `crowdfundProjectStartDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '众筹开始时间',
  `crowdfundProjectEndDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '众筹结束时间',
  `crowdfundProjectCheckState` int(5) NOT NULL DEFAULT '1' COMMENT '众筹审核状态',
  `crowdfundProjectState` int(5) NOT NULL DEFAULT '1' COMMENT '众筹进度状态',
  `publisherId` int(11) NOT NULL COMMENT '众筹发布者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crowdfund`
--

LOCK TABLES `crowdfund` WRITE;
/*!40000 ALTER TABLE `crowdfund` DISABLE KEYS */;
INSERT INTO `crowdfund` VALUES (2,'项目一','项目简介***','110000','三个月','需要**怎么做**','2017-05-05 02:00:01','2017-08-04 16:00:01',2,1,1234567891),(3,'项目二','项目简介***','300000','六个月','需要**怎么做**','2017-06-04 16:05:01','2018-04-04 16:00:01',2,2,1),(4,'项目三','项目简介***','210000','五个月','需要**怎么做**','2017-05-03 16:20:01','2017-12-04 16:00:01',2,1,2),(5,'项目四','项目简介***','130000','七周','需要**怎么做**','2017-05-03 16:10:01','2017-08-04 16:00:01',2,1,3),(6,'项目五','项目简介***','330000','60天左右','需要**怎么做**','2017-05-11 21:00:01','2017-08-04 16:00:01',2,2,4),(7,'项目六','项目简介***','300000','五个月','需要**怎么做**','2017-02-04 20:00:01','2017-09-04 16:00:01',2,1,5),(9,'项目八','项目简介:本项目XX需要java开发人员XXX','550000','12个月','需要**怎么做**','2017-04-04 16:20:01','2017-11-10 16:00:01',2,1,7),(10,'阿里云计算','阿里云计算依托阿里巴巴集团在电子商务领域的宝贵经验积累，阿里云计算汇集来自国内外顶尖的技术人才，专注互联网和电子商务的技术创新，打造未来互联网和电子商务的新体验，用世界一流的技术让阿里巴巴成为世界最有影响的互联网企业和最大的电子商务服务商。','5000000','一年','阿里云计算致力于提供完整的云计算基础服务。在未来的电子商务中云计算将会成为一种随时、随地并根据需要而提供的服务，就像水、电一样成为公共基础服务设施。高效的绿色数据中心以及能支持不同互联网和电子商务应用的大规模分布式存储和计算是营造下一代互联网和电子商务的服务平台所需的最基本的核心技术。阿里云计算在此基础上结合新的用户体验技术以及分布式数据库技术、无线移动计算技术和搜索技术等平台技术，高性能、高扩展、高容量和高安全的计算服务将成为未来互联网和电子商务创新的基石。','2017-05-18 08:14:47','2017-12-11 16:00:00',2,1,1234567896),(11,'众筹1','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',2,1,1234567896),(12,'众筹2','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',2,1,1234567896),(13,'众筹3','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',2,1,1234567896),(14,'众筹4（修改）','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',1,1,1234567896),(15,'众筹5','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',2,1,1234567896),(16,'众筹6','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',2,1,1234567896),(17,'众筹7','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',2,1,1234567896),(18,'众筹8（修改）','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',1,1,1234567896),(19,'众筹9','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',2,1,1234567896),(20,'众筹10','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',2,1,1234567896),(21,'众筹11','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',2,1,1234567896),(22,'众筹12','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',2,1,1234567896),(23,'众筹13','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',2,1,1234567896),(24,'众筹14','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',2,1,1234567896),(25,'众筹15','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',1,1,1234567896),(26,'众筹16','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',2,1,1234567896),(27,'众筹17','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',2,1,1234567896),(28,'众筹18','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',2,1,1234567896),(29,'众筹19','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',1,1,1234567896),(30,'众筹20','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',2,1,1234567896),(31,'众筹21','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',2,1,1234567896),(32,'众筹22','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',2,1,1234567896),(35,'众筹25','XXX依托XXXX,形式一片大好','1010100','一年半载','需要java软件开发人员XXX,项目经理XXX,前端工程师XXX若干人，负责XXX','2017-05-05 02:00:01','2017-12-04 16:00:01',1,1,1234567896),(36,'有道云技术',' 北京网易有道计算机系统有限公司成立于2006年。有道是网易旗下利用大数据技术提供移动互联网应用的子公司。有道以搜索产品和技术为起点，在大规模数据存储计算等领域具有深厚的技术积累，并在此基础上衍生出语言翻译应用与服务、个人云应用和电子商务导购服务等三个核心业务方向。目前网易有道公司已推出有道词典、有道翻译官、有道人工翻译、有道口语大师、有道精品课、有道云笔记、有道云协作、惠惠网、惠惠购物助手等用户产品，及有道易投、有道智选等商业产品。 ','1708949','十六个月','有道云笔记（原有道笔记）是2011年6月28日北京网易有道计算机系统有限公司推出的个人与团队的线上资料库，支持多种附件格式，拥有3G容量的初始免费存储空间，能够实时增量式同步，并采用“三备份存储”技术，同时上线的还有网页剪报功能。2012年12月初，有道云笔记推出3.0新版，PC、iPhone、Android和web端四大平台全面升级。升级后的有道云笔记增加了待办事项、历史版本等全新功能，方便用户更好的对日程及笔记内容管理。','2017-05-20 15:40:14','2017-10-21 15:33:45',1,1,1234567896);
/*!40000 ALTER TABLE `crowdfund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crowdfunddemand`
--

DROP TABLE IF EXISTS `crowdfunddemand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crowdfunddemand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crowdfundId` int(11) NOT NULL COMMENT '项目众筹表ID',
  `demandJobName` varchar(50) NOT NULL COMMENT '需求岗位',
  `demandSummary` varchar(500) NOT NULL COMMENT '需求描述',
  `demandPeopleCount` int(6) NOT NULL COMMENT '需求人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crowdfunddemand`
--

LOCK TABLES `crowdfunddemand` WRITE;
/*!40000 ALTER TABLE `crowdfunddemand` DISABLE KEYS */;
INSERT INTO `crowdfunddemand` VALUES (1,2,'软件开发程序员java','熟练掌握java编程，熟悉SSM、SSH等主流框架',5),(2,2,'软件开发工程师java','精通java编程，精通SSM、SSH等主流框架，3年以上工作经验者优先',2),(3,3,'软件测试工程师','精通java编程，精通SSM、SSH等主流框架，3年以上工作经验者优先',2),(4,3,'软件开发工程师.net','精通C#编程，有桌面应用开发相关经验，3年以上者优先',7),(5,3,'软件开发技术总监','有执行力，带领过相关项目的开发，具备管理能力，5年以上相关工作经验者优先',1),(6,2,'页面设计、web前端工程师','精通html5/css3/javascript/jQuery，会使用bootstrap/angularJS/Node.js等主流框架，能解决一些浏览器兼容问题',3),(7,10,'软件开发工程师','1. 计算机、通信、信息相关专业本科以上学历，3年以上服务器端研发经验；\r\n2. 编程基本功扎实，熟悉常用数据结构和算法，擅长Java编程语言。\r\n3. 熟悉TCP/IP、HTTP协议相关知识，熟悉Unix/Linux环境和系统编程，深入掌握服务器编程模型；\r\n4. 熟悉MySQL数据库及主流NoSQL数据库；\r\n5. 有较好的逻辑思维能力，较强的抽象、概括、总结能力；\r\n6. 有较好的沟通交流能力，善于主动思考和行动，乐于解决具有挑战性的问题，对待技术有强烈兴趣；\r\n7. 有互联网工作经验者优先考虑。 ',6),(9,4,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(10,4,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(11,4,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(12,4,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(13,5,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(14,5,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(15,5,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(16,5,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(17,6,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(18,6,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(19,6,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(20,6,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(21,7,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(22,7,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(23,7,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(24,7,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(25,9,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(26,9,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(27,9,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(28,9,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(29,11,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(30,11,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(31,11,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(32,11,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(33,12,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(34,12,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(35,12,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(36,12,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(38,13,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(39,13,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(40,13,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(41,14,'软件开发工程师','能吃能睡好伺候,不哭不闹无需求！',4),(42,14,'页面设计web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',4),(43,14,'软件开发技术总监','熟练掌握骂人,催进度等专业技能。',2),(44,14,'软件开发项目经理','熟练掌握临时改需求等程序猿必杀技能。',2),(45,15,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(46,15,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(47,15,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(48,15,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(49,16,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(50,16,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(51,16,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(52,16,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(53,17,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(54,17,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(55,17,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(56,17,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(57,18,'软件开发工程师','能吃能睡好伺候,不哭不闹无需求！',6),(58,18,'页面设计web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(59,18,'软件开发技术总监','熟练掌握骂人,催进度等专业技能。',2),(60,18,'软件开发项目经理','熟练掌握临时改需求等程序猿必杀技能。',2),(61,19,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(62,19,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(63,19,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(64,19,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(65,20,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(66,20,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(67,20,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(68,20,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(69,21,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(70,21,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(71,21,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(72,21,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(73,22,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(74,22,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(75,22,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(76,22,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(77,23,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(78,23,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(79,23,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(80,23,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(81,24,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(82,24,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(83,24,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(84,24,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(85,25,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(86,25,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(87,25,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(88,25,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(89,26,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(90,26,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(91,26,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(92,26,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(93,27,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(94,27,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(95,27,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(96,27,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(97,28,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(98,28,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(99,28,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(100,28,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(101,29,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(102,29,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(103,29,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(104,29,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(105,30,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(106,30,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(107,30,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(108,30,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(109,31,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(110,31,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(111,31,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(112,31,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(113,32,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(114,32,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(115,32,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(116,32,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(125,35,'java软件工程师','能吃能睡好伺候,不哭不闹无需求！',6),(126,35,'Web前端工程师','熟练掌握各种页面布局，浏览器兼容问题！精通JavaScript。',5),(127,35,'项目经理','熟练掌握骂人,催进度等专业技能，',2),(128,35,'产品经理','熟练掌握临时该需求等程序猿必杀技能，',2),(129,36,'软件开发程序员','1、根据主管要求，按时保质完成软件模块的开发任务；\r\n\r\n2、能独立分析、解决一定的问题；\r\n\r\n3、遵守公司规章制度，服从公司管理安排\r\n\r\n4、有团队协作的精神，有责任感，积极进取，较强的自学能力。',6),(130,36,'页面设计web前端工程师','1、负责协助工程师进行移动端应用程序开发；\r\n\r\n2、服从公司的发展要求，认真学习和全面了解公司的相关情况和工作细节；\r\n\r\n3、负责公司基本项目的开发，熟练掌握公司所应用的专业技术\r\n\r\n4、参与公司所用技术的优化和升级',4),(131,36,'软件测试软件测试工程师','1. 熟悉软件测试流程、测试理论和方法 2. 配合研发人员进行测试、问题重现和定位 3. 有APP和Web相关测试经验 任职要求： 1. 本科及以上学历，计算机等相关专业，2年以上相关测试经验 1. 负责项目测试工作，编写规范的测试用例，执行测试，编写操作手册 2. 能够很好的跟开发人员沟通，逻辑思维清楚，并有较好的团队合作精神 3. 能承受工作压力，可接受项目临时加班 4. 工作责任心强，做事仔细，有耐心',2),(132,18,'页面设计美工设计','欣赏美，发现美。',4);
/*!40000 ALTER TABLE `crowdfunddemand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crowdfunduser`
--

DROP TABLE IF EXISTS `crowdfunduser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crowdfunduser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crowdfundId` int(11) NOT NULL COMMENT '项目众筹表ID',
  `demandJobName` varchar(50) NOT NULL COMMENT '岗位名称',
  `userId` int(11) NOT NULL COMMENT '用户表ID',
  `checkStatus` int(5) NOT NULL DEFAULT '1' COMMENT '状态（1审核中 2通过 3未通过）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crowdfunduser`
--

LOCK TABLES `crowdfunduser` WRITE;
/*!40000 ALTER TABLE `crowdfunduser` DISABLE KEYS */;
INSERT INTO `crowdfunduser` VALUES (1,10,'软件开发工程师',1234567896,1),(2,10,'Web前端工程师',1234567895,1),(3,11,'java软件工程师',1234567896,1);
/*!40000 ALTER TABLE `crowdfunduser` ENABLE KEYS */;
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
  `discussSendType` int(11) NOT NULL COMMENT '1：企业id\n2：个人用户id',
  `discussBySendId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discuss`
--

LOCK TABLES `discuss` WRITE;
/*!40000 ALTER TABLE `discuss` DISABLE KEYS */;
INSERT INTO `discuss` VALUES (1,1,'很好的学校，我就是在这里学习的',5,'2017-04-07 11:22:10',4,2,0),(2,1,'强力推荐',5,'2017-04-07 11:22:10',2,2,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (1,1234567896,'2009-08-03 00:00:00','2014-05-05 00:00:00','中国地质大学','计算机科学',3,4),(2,1234567896,'2009-01-28 00:00:00','2011-03-03 00:00:00','中国人民大学','计算机科学',3,4),(3,1234567896,'2017-04-02 00:00:00','2017-04-29 00:00:00','中国地质大学','软件工程',3,4),(30,1234567896,'2017-04-02 00:00:00','2017-04-21 00:00:00','中国人民大学','计算机科学',3,4),(31,1234567896,'2017-04-03 00:00:00','2017-04-29 00:00:00','中国地质大学','计算机科学',3,4),(32,1234567896,'2017-04-03 00:00:00','2017-04-29 00:00:00','中国地质大学','计算机科学',3,4),(33,1234567896,'2017-04-02 00:00:00','2017-04-29 00:00:00','中国人民大学','计算机科学',3,4),(34,1234567896,'2017-04-02 00:00:00','2017-04-29 00:00:00','中国人民大学','计算机科学',3,4),(35,1234567896,'2017-04-02 00:00:00','2017-04-15 00:00:00','中国人民大学','计算机科学',3,4),(36,1234567896,'2017-04-02 00:00:00','2017-04-22 00:00:00','中国人民大学','计算机科学',3,4),(37,1234567896,'2017-04-02 00:00:00','2017-04-22 00:00:00','中国人民大学','计算机科学',3,4),(38,1234567896,'2017-04-02 00:00:00','2017-04-22 00:00:00','中国人民大学','计算机科学',3,1),(39,1234567896,'2017-04-01 00:00:00','2017-04-29 00:00:00','中国人民大学','计算机科学',3,4),(40,1234567896,'2017-04-02 00:00:00','2017-04-15 00:00:00','中国人民大学','软件工程',3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='关注';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES (1,1234567897,3,'2017-05-16 12:05:03',2,2),(2,1234567893,4,'2017-05-16 15:42:04',2,2),(3,1234567898,1,'2017-05-22 16:11:45',2,1);
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobName` varchar(50) DEFAULT NULL COMMENT '岗位名称',
  `jobParentId` int(11) DEFAULT NULL COMMENT '父id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'软件开发',NULL),(2,'软件测试',NULL),(3,'页面设计',NULL),(4,'售前',NULL),(5,'售后',NULL),(6,'程序员',1),(7,'工程师',1),(8,'项目经理',1),(9,'技术总监',1),(10,'软件测试员',2),(11,'软件测试工程师',2),(12,'美工设计',3),(13,'UI设计',3),(14,'web前端工程师',3),(17,'程序员鼓励师',NULL);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobskill`
--

DROP TABLE IF EXISTS `jobskill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobskill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobSkill` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobskill`
--

LOCK TABLES `jobskill` WRITE;
/*!40000 ALTER TABLE `jobskill` DISABLE KEYS */;
INSERT INTO `jobskill` VALUES (1,'JAVA'),(2,'.NET'),(3,'C++'),(4,'ORACLE'),(5,'SQL'),(6,'Android'),(7,'IOS'),(8,'PHP'),(9,'Photoshop'),(10,'Coreldraw'),(11,'Flash'),(12,'Adobe Illustrator'),(13,'InDesign'),(14,'DreamWeaver'),(15,'HTML/CSS'),(16,'JavaScript'),(17,'Jquery');
/*!40000 ALTER TABLE `jobskill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likenum`
--

DROP TABLE IF EXISTS `likenum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likenum` (
  `articleId` int(11) DEFAULT NULL,
  `usersId` int(11) NOT NULL,
  `commentArticleId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likenum`
--

LOCK TABLES `likenum` WRITE;
/*!40000 ALTER TABLE `likenum` DISABLE KEYS */;
/*!40000 ALTER TABLE `likenum` ENABLE KEYS */;
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
-- Table structure for table `mood`
--

DROP TABLE IF EXISTS `mood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(50) NOT NULL,
  `moodContent` varchar(100) NOT NULL COMMENT '心情内容',
  `moodTime` datetime NOT NULL COMMENT '心情创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mood`
--

LOCK TABLES `mood` WRITE;
/*!40000 ALTER TABLE `mood` DISABLE KEYS */;
INSERT INTO `mood` VALUES (1,'1234567898','《心情说说》是一款Android平台的应用。应用介绍傻傻的对着电脑，却是满心的寂寞与想念。 上一秒看到的东西，下一秒可能就会忘记。 你说你像太阳，当莪伸手的时候却不觉得暖。','2017-05-17 15:04:23');
/*!40000 ALTER TABLE `mood` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
INSERT INTO `offer` VALUES (1,911,222,'门卫','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','2017-04-12 09:32:47','2017-04-12 09:32:47',2,1),(3,110,222,'程序员','欢迎','2017-04-12 09:36:33','2017-04-12 09:36:33',2,1),(4,911,222,'程序员','欢迎','2017-04-12 11:59:02','2017-04-12 11:59:02',2,2),(5,110,222,'123','321','2017-04-13 11:28:13','2017-04-13 11:28:13',2,2),(6,911,333,'444','555','2017-04-13 11:30:13','2017-04-13 11:30:13',2,3),(7,110,333,'666','777','2017-04-13 11:31:17','2017-04-13 11:31:17',2,3),(8,911,333,'程序员','欢迎','2017-04-14 09:15:40','2017-04-14 09:15:40',2,4),(9,110,333,'清洁工','保洁','2017-04-14 09:17:04','2017-04-14 09:17:04',2,4),(10,911,1234567899,'测试','测试员','2017-04-18 12:13:01','2017-04-18 12:13:01',2,1),(11,1,1234567898,'保安','我司认为阁下完全有能力胜任这一岗位，真心希望阁下加入我们','2017-06-18 12:13:01','2017-05-19 14:50:09',1,1);
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
  `projectDescription` varchar(500) NOT NULL COMMENT '责任描述与感受',
  `resumeId` int(11) NOT NULL,
  `resumeType` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,1234567898,'2017-05-03 00:00:00','2017-05-20 00:00:00','昆明铁路局大型养护路模拟培训系统','软件架构及设计','昆明铁路局大型养护路模拟培训系统昆明铁路局大型养护路模拟培训系统',1,1);
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
  `resumeCreateDate` datetime NOT NULL COMMENT '创建时间',
  `resumeName` varchar(10) NOT NULL COMMENT '姓名',
  `resumeGender` int(11) NOT NULL COMMENT '性别 1男 0女',
  `resumeNation` varchar(10) DEFAULT NULL COMMENT '民族',
  `resumePlace` varchar(50) DEFAULT NULL COMMENT '籍贯',
  `resumeBirthday` datetime NOT NULL COMMENT '生日',
  `resumeMarriage` int(11) DEFAULT NULL COMMENT '婚姻',
  `resumeGraduationSchool` varchar(50) DEFAULT NULL COMMENT '毕业院校',
  `resumeGraduationTime` datetime DEFAULT NULL COMMENT '毕业时间',
  `resumeEducation` varchar(20) DEFAULT NULL COMMENT '学历',
  `resumeMajor` varchar(20) DEFAULT NULL COMMENT '专业',
  `resumeWages` int(11) DEFAULT NULL COMMENT '期望待遇',
  `resumePhone` varchar(11) NOT NULL COMMENT '电话',
  `resumeQQ` varchar(25) DEFAULT NULL COMMENT 'QQ',
  `resumeFLAbility` int(11) NOT NULL DEFAULT '1' COMMENT '外语水平1.入门 2.一般 3.熟练 4.精通	',
  `resumeFLType` int(11) NOT NULL DEFAULT '1' COMMENT '外语类型1.英语 2.日语 3.德语 4.…………	',
  `resumeEnglishGrade` int(11) NOT NULL DEFAULT '6' COMMENT '英语等级1.国家英语考试3级 2.国家英语考试4级 3.国家英语考试6级4.专业4级 5.专业8级 6.未参加 7.未通过	',
  `resumeComputerAbility` int(11) NOT NULL DEFAULT '1' COMMENT '计算机水平1.入门 2.一般 3.熟练 4.精通',
  `resumePersonality` varchar(50) DEFAULT NULL COMMENT '特点描述',
  `resumeSelfEvaluation` varchar(500) DEFAULT NULL COMMENT '自我评价',
  `resumeStatusOne` int(11) NOT NULL DEFAULT '1' COMMENT '状态(用户的操作)\n1.完全公开(默认)\n2.只限企业浏览\n3.只对应聘企业公开\n4.保密',
  `resumeHeight` int(11) DEFAULT NULL COMMENT '身高',
  `resumeWeight` int(11) DEFAULT NULL COMMENT '体重',
  `resumeStatusThree` int(11) NOT NULL DEFAULT '1' COMMENT '1.待审核 2.正常	 3. 审核不通过',
  `resumeJor` varchar(45) NOT NULL COMMENT '岗位意向',
  `resumeHeadImg` varchar(500) DEFAULT NULL COMMENT '头像',
  `resumeWorks` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '工作年限',
  `resumeHouseAddress` varchar(200) DEFAULT NULL COMMENT '家庭地址',
  `resumeNowResidence` varchar(45) NOT NULL COMMENT '目前居住地',
  `resumeEmail` varchar(200) NOT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume`
--

LOCK TABLES `resume` WRITE;
/*!40000 ALTER TABLE `resume` DISABLE KEYS */;
INSERT INTO `resume` VALUES (1,1234567898,'我的简历','2017-05-16 11:09:46','张三',0,'汉','云南','2017-05-04 00:00:00',1,'天津理工大学中环信息学院','2016-01-01 00:00:00','本科','计算机及科学',5000,'18808818048','13513356999',1,1,6,1,'本人性格开朗本人性格开朗','本人性格开朗、为人诚恳、乐观向上、兴趣广泛、拥有较强的组织能力和适应能力、并具有较强的管理策划与组织管理协调能力。',1,170,75,1,'java工程师',NULL,'2017-05-12 00:00:00','昆明','昆明','18808818048@163.com');
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
  `sysmScope` int(11) NOT NULL COMMENT '范围：1：所有人2：个人3：企业',
  `adminId` varchar(10) NOT NULL COMMENT '管理员ID',
  `sysmStatus` int(11) DEFAULT '1' COMMENT '状态：1.未读，2.已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessage`
--

LOCK TABLES `systemmessage` WRITE;
/*!40000 ALTER TABLE `systemmessage` DISABLE KEYS */;
INSERT INTO `systemmessage` VALUES (1,'大王叫我来巡山，我把人间转呀转！','2017-04-26 02:45:59',1,'0',NULL),(2,'321321				','2017-04-26 07:52:05',1,'admin',NULL);
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
  `userGender` int(11) NOT NULL COMMENT '性别\n1.男\n0.女',
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
) ENGINE=InnoDB AUTO_INCREMENT=1234567900 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1234567898,'12345678911','e10adc3949ba59abbe56e057f20f883e','飞飞',1,'18213026337@163.com',1,'无','无','无','无','2017-05-17 14:56:02','20170522/1495431984457.png',0,'1993-10-12 00:00:00',0),(1234567899,'1234567890','e10adc3949ba59abbe56e057f20f883e','萨蒂卡诺',1,'iieoc@qq.com',1,'胡德正','无','无','无','2017-05-17 16:57:00','无',0,'1988-05-17 16:57:00',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work`
--

LOCK TABLES `work` WRITE;
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
INSERT INTO `work` VALUES (1,1234567897,'2017-05-01 00:00:00','2017-05-06 00:00:00','昆明第一(28)女子中学','教员','带初中生物，当班主任，任初中高中的健康教育课，在教务处帮助完成排课，成绩统计等信息化工作',4,1),(2,1234567898,'2017-05-01 00:00:00','2017-05-04 00:00:00','昆明第一(28)女子中学','教员','带初中生物，当班主任，任初中高中的健康教育课，在教务处帮助完成排课，成绩统计等信息化工作',1,1);
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

-- Dump completed on 2017-05-24  8:44:07
