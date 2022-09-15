-- MySQL dump 10.13  Distrib 5.7.28, for Win64 (x86_64)
--
-- Host: localhost    Database: article
-- ------------------------------------------------------
-- Server version	5.7.28

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
create database article charset utf8mb4;
use article;
--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布人id',
  `cat_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COMMENT '内容',
  `read_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后编辑时间',
  `is_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,1,4,'科技新闻标题1','科技新闻内容111',0,1663165852,1663166653,0),(2,1,4,'测试多个分类','多个分类的内容',0,1663166982,1663167958,0),(3,1,14,'测试分类的标签','测试内容',0,1663168032,1663254190,0),(4,1,16,'微博又要崩溃了','又有明星离婚了',0,1663254244,0,0);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `cat_name` varchar(30) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'要闻',0),(2,'北京',0),(3,'娱乐',0),(4,'体育',0),(5,'军事',0),(6,'国际',0),(7,'NBA',0),(8,'科技',0),(9,'财经',0),(10,'汽车',0),(11,'时尚',0),(12,'游戏',0),(13,'信息科技',8),(14,'互联网科技',13),(15,'明星八卦',3),(16,'离婚热门',15),(17,'工业科技',8),(18,'智能转向',17),(19,'健身运动',20),(20,'运动',0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '用户组名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='用户组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'管理员'),(2,'客服'),(3,'运营'),(4,'市场'),(5,'技术');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_node`
--

DROP TABLE IF EXISTS `group_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_node` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `node_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COMMENT='用户组权限分配明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_node`
--

LOCK TABLES `group_node` WRITE;
/*!40000 ALTER TABLE `group_node` DISABLE KEYS */;
INSERT INTO `group_node` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35);
/*!40000 ALTER TABLE `group_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `menu_name` varchar(30) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `node_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '权限id',
  `is_nav` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '是否是导航菜单',
  `menu_sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COMMENT='菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'用户管理',0,1,1000,0),(2,'用户列表',1,1,999,1),(3,'添加用户',2,1,998,1),(4,'编辑用户',3,0,997,1),(5,'删除用户',4,0,996,1),(6,'用户组管理',0,1,900,0),(7,'用户组列表',5,1,899,6),(8,'添加用户组',6,1,898,6),(9,'编辑用户组',7,0,897,6),(10,'删除用户组',8,0,896,6),(11,'权限管理',0,1,800,0),(12,'权限列表',9,1,799,11),(13,'添加权限',10,1,798,11),(14,'编辑权限',11,0,797,11),(15,'删除权限',12,0,796,11),(16,'分配权限',13,0,795,11),(17,'菜单管理',0,1,700,0),(18,'菜单列表',14,1,699,17),(19,'添加菜单',15,1,698,17),(20,'编辑菜单',16,0,697,17),(21,'删除菜单',17,0,696,17),(22,'工单管理',0,1,600,0),(23,'工单列表',18,1,599,22),(24,'添加工单',19,1,598,22),(25,'审核工单',20,0,597,22),(26,'取消工单',21,0,596,22),(27,'会议室预约',0,1,500,0),(28,'会议室列表',22,1,499,27),(29,'添加会议室',23,1,498,27),(30,'编辑会议室',24,0,497,27),(31,'预约列表',25,1,496,27),(32,'取消预约',26,0,495,27),(33,'结束预约',27,0,494,27),(34,'内容管理',0,0,450,0),(35,'分类列表',28,1,449,34),(36,'添加分类',29,0,448,34),(37,'编辑分类',30,0,447,34),(38,'删除分类',31,0,446,34),(39,'文章列表',32,1,445,34),(40,'添加文章',33,0,444,34),(41,'编辑文章',34,0,443,34),(42,'删除文章',35,0,442,34);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `node_name` varchar(30) NOT NULL DEFAULT '' COMMENT '权限节点名称',
  `node_url` varchar(30) NOT NULL DEFAULT '' COMMENT '访问路径',
  `node_sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `node_type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类别',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时候还在使用中 1在使用中 0不再使用了',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COMMENT='权限节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` VALUES (1,'用户列表','/user/index',1000,1,1),(2,'用户添加','/user/add',999,1,1),(3,'用户编辑','/user/edit',998,1,1),(4,'用户禁用','/user/del',997,1,1),(5,'用户组列表','/group/index',900,2,1),(6,'用户组添加','/group/add',899,2,1),(7,'用户组编辑','/group/edit',898,2,1),(8,'用户组删除','/group/del',897,2,1),(9,'权限列表','/node/index',800,3,1),(10,'权限添加','/node/add',799,3,1),(11,'权限编辑','/node/edit',798,3,1),(12,'权限禁用','/node/del',797,3,1),(13,'权限分配','/permission/assign',796,3,1),(14,'菜单列表','/menu/index',700,4,1),(15,'菜单添加','/menu/add',699,4,1),(16,'菜单编辑','/menu/edit',698,4,1),(17,'菜单删除','/menu/del',697,4,1),(18,'工单列表','/ticket/index',600,5,1),(19,'工单添加','/ticket/add',599,5,1),(20,'工单审核','/ticket/judge',598,5,1),(21,'工单取消','/ticket/cancel',597,5,1),(22,'会议室列表','/room/index',500,6,1),(23,'会议室添加','/room/add',499,6,1),(24,'会议室编辑','/room/edit',498,6,1),(25,'预约列表','/reservation/index',497,6,1),(26,'取消预约','/reservation/cancel',496,6,1),(27,'结束预约','/reservation/completed',495,6,1),(28,'分类列表','/category/index',450,7,1),(29,'分类添加','/category/add',449,7,1),(30,'分类编辑','/category/edit',448,7,1),(31,'分类删除','/category/del',447,7,1),(32,'文章列表','/article/index',440,7,1),(33,'文章添加','/article/add',439,7,1),(34,'文章编辑','/article/edit',438,7,1),(35,'文章删除','/article/del',437,7,1);
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `room_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会议室房间id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '预约人id',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定结束时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定结束时间',
  `join_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '参会人列表',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '预约状态 0:已取消 1:使用中 2:已结束',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会议室预约记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `room_name` varchar(30) NOT NULL DEFAULT '' COMMENT '会议室房间名',
  `lock_start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定开始时间',
  `lock_end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定结束时间',
  `room_people_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '容纳人数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可用状态 1:可用 0:不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='会议室表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'中心会议室',0,0,31,1),(2,'小会议室A',0,0,10,1),(3,'小会议室B',0,0,8,1),(4,'小会议室C',0,0,8,1),(5,'小会议室D',0,0,6,1),(6,'小会议室E',0,0,7,1),(7,'小会议室F',0,0,9,1),(8,'小会议室G',0,0,5,1);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(3000) NOT NULL DEFAULT '' COMMENT '访问路径',
  `ticket_type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类别',
  `point_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '待审核用户id',
  `leader_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '审批用户id列表',
  `approve_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '已通过审批用户id列表',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1:初始化 2:处理中 3:已完结 -1:已取消',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='工单记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` varchar(15) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(60) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮箱',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态 1是启用 0是禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','f3970736977b4794bc75f1ef8291b376','admin@article.com',1),(2,'任晨骆','59bb8c33a1f5627f6dcf8d582619dcdf','renchenluo@article.com',1),(3,'窦恒翰','59bb8c33a1f5627f6dcf8d582619dcdf','douhenhan@article.com',1),(4,'尚管思','59bb8c33a1f5627f6dcf8d582619dcdf','shangguansi@article.com',1),(5,'姬翰育','59bb8c33a1f5627f6dcf8d582619dcdf','jihanyu@article.com',1),(6,'彭姣顺','59bb8c33a1f5627f6dcf8d582619dcdf','pengjiaoshun@article.com',1),(7,'潘心颖','59bb8c33a1f5627f6dcf8d582619dcdf','panxinying@article.com',1),(8,'储庄言','59bb8c33a1f5627f6dcf8d582619dcdf','chuzhuangyan@article.com',1),(9,'姚雨芳','59bb8c33a1f5627f6dcf8d582619dcdf','yaoyufang@article.com',1),(10,'冉泰浩','59bb8c33a1f5627f6dcf8d582619dcdf','rantaihao@article.com',1),(11,'袁维梅','59bb8c33a1f5627f6dcf8d582619dcdf','yuanweimei@article.com',1),(12,'林索','59bb8c33a1f5627f6dcf8d582619dcdf','linsuo@article.com',1),(13,'林方豪','59bb8c33a1f5627f6dcf8d582619dcdf','linwenhao@article.com',1),(14,'江心冉','59bb8c33a1f5627f6dcf8d582619dcdf','jiangxinran@article.com',1),(15,'廖文芳','59bb8c33a1f5627f6dcf8d582619dcdf','liaowenfang@article.com',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='用户和用户组的关系对照表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (1,1,1),(2,2,2),(3,3,4),(4,4,1),(5,5,5),(6,6,4),(7,7,1),(8,8,5),(9,9,3),(10,10,2),(11,11,4),(12,12,5),(13,13,3),(14,14,4),(15,15,4);
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'article'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-15 23:07:08
