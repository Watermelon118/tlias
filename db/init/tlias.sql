CREATE DATABASE IF NOT EXISTS tlias DEFAULT CHARACTER SET utf8mb4;
USE tlias;

-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: tlias
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clazz`
--

DROP TABLE IF EXISTS `clazz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clazz` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID,主键',
  `name` varchar(30) NOT NULL COMMENT '班级名称',
  `room` varchar(20) DEFAULT NULL COMMENT '班级教室',
  `begin_date` date NOT NULL COMMENT '开课时间',
  `end_date` date NOT NULL COMMENT '结课时间',
  `master_id` int unsigned DEFAULT NULL COMMENT '班主任ID, 关联员工表ID',
  `subject` tinyint unsigned NOT NULL COMMENT '学科, 1:java, 2:前端, 3:大数据, 4:Python, 5:Go, 6: 嵌入式',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='班级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clazz`
--

LOCK TABLES `clazz` WRITE;
/*!40000 ALTER TABLE `clazz` DISABLE KEYS */;
INSERT INTO `clazz` VALUES (1,'JavaEE就业163期','212','2024-04-30','2024-06-29',10,1,'2024-06-01 17:08:23','2024-06-01 17:39:58'),(2,'前端就业90期','210','2024-07-10','2024-01-20',3,2,'2024-06-01 17:45:12','2024-06-01 17:45:12'),(3,'JavaEE就业165期','108','2024-06-15','2024-12-25',6,1,'2024-06-01 17:45:40','2024-06-01 17:45:40'),(4,'JavaEE就业166期','105','2024-07-20','2024-02-20',20,1,'2024-06-01 17:46:10','2024-06-01 17:46:10'),(5,'大数据就业58期','209','2024-08-01','2024-02-15',7,3,'2024-06-01 17:51:21','2024-06-01 17:51:21'),(6,'JavaEE就业167期','325','2024-11-20','2024-05-10',36,1,'2024-11-15 11:35:46','2024-12-13 14:31:24'),(7,'况晨阳','110','2026-06-20','2026-07-18',17,2,'2026-03-26 16:40:42','2026-03-26 16:40:42');
/*!40000 ALTER TABLE `clazz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID, 主键',
  `name` varchar(10) NOT NULL COMMENT '部门名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES (1,'学工部','2024-09-25 09:47:40','2026-03-27 17:01:08'),(2,'教研部','2026-03-24 10:53:20','2026-03-24 10:53:20'),(3,'咨询部','2024-09-25 09:47:40','2024-09-30 21:26:24'),(4,'就业部','2024-09-25 09:47:40','2024-09-25 09:47:40'),(5,'人事部','2024-09-25 09:47:40','2024-09-25 09:47:40'),(13,'研发一部','2026-03-30 17:30:23','2026-03-30 17:30:23'),(14,'研发二部','2026-03-30 17:34:34','2026-03-30 17:34:34'),(15,'研发三部','2026-03-30 17:34:46','2026-03-30 17:34:46');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID,主键',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) DEFAULT '123456' COMMENT '密码',
  `name` varchar(10) NOT NULL COMMENT '姓名',
  `gender` tinyint unsigned NOT NULL COMMENT '性别, 1:男, 2:女',
  `phone` char(11) NOT NULL COMMENT '手机号',
  `job` tinyint unsigned DEFAULT NULL COMMENT '职位, 1 班主任, 2 讲师 , 3 学工主管, 4 教研主管, 5 咨询师',
  `salary` int unsigned DEFAULT NULL COMMENT '薪资',
  `image` varchar(255) DEFAULT NULL COMMENT '头像',
  `entry_date` date DEFAULT NULL COMMENT '入职日期',
  `dept_id` int unsigned DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES (2,'songjiang','123456','宋江',1,'13309090002',2,10000,'https://javaai200037.oss-ap-southeast-1.aliyuncs.com/2026/03/7b583b99-1465-4f29-b4c8-daacbd752f73.jpg','2015-01-01',2,'2023-10-20 16:35:33','2026-03-31 16:42:32'),(3,'lujunyi','123456','卢俊义',1,'13309090003',2,8900,'https://javaai200037.oss-ap-southeast-1.aliyuncs.com/2026/03/4aa9475c-bd1a-4a51-a18d-22283aa20d23.jpg','2008-05-01',2,'2023-10-20 16:35:33','2026-03-31 16:42:54'),(4,'wuyong','123456','吴用',1,'13309090004',2,9200,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2007-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:35:41'),(5,'gongsunsheng','123456','公孙胜',1,'13309090005',2,9500,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2012-12-05',2,'2023-10-20 16:35:33','2023-10-20 16:35:43'),(6,'huosanniang','123456','扈三娘',2,'13309090006',3,6500,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2013-09-05',1,'2023-10-20 16:35:33','2023-10-20 16:35:45'),(7,'chaijin','123456','柴进',1,'13309090007',1,4700,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2005-08-01',1,'2023-10-20 16:35:33','2023-10-20 16:35:47'),(8,'likui','123456','李逵',1,'13309090008',1,4800,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2014-11-09',1,'2023-10-20 16:35:33','2023-10-20 16:35:49'),(9,'wusong','123456','武松',1,'13309090009',1,4900,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2011-03-11',1,'2023-10-20 16:35:33','2023-10-20 16:35:51'),(10,'linchong','123456','林冲',1,'13309090010',1,5000,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2013-09-05',1,'2023-10-20 16:35:33','2023-10-20 16:35:53'),(11,'huyanzhuo','123456','呼延灼',1,'13309090011',2,9700,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2007-02-01',2,'2023-10-20 16:35:33','2023-10-20 16:35:55'),(12,'xiaoliguang','123456','小李广',1,'13309090012',2,10000,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2008-08-18',2,'2023-10-20 16:35:33','2023-10-20 16:35:57'),(13,'yangzhi','123456','杨志',1,'13309090013',1,5300,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2012-11-01',1,'2023-10-20 16:35:33','2023-10-20 16:35:59'),(14,'shijin','123456','史进',1,'13309090014',2,10600,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2002-08-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:01'),(15,'sunerniang','123456','孙二娘',2,'13309090015',2,10900,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2011-05-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:03'),(16,'luzhishen','123456','鲁智深',1,'13309090016',2,9600,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2010-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:05'),(17,'liying','12345678','李应',1,'13309090017',1,5800,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2015-03-21',1,'2023-10-20 16:35:33','2023-10-20 16:36:07'),(18,'shiqian','123456','时迁',1,'13309090018',2,10200,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2015-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:09'),(19,'gudasao','123456','顾大嫂',2,'13309090019',2,10500,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2008-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:11'),(20,'ruanxiaoer','123456','阮小二',1,'13309090020',2,10800,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2018-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:13'),(21,'ruanxiaowu','123456','阮小五',1,'13309090021',5,5200,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2015-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:15'),(22,'ruanxiaoqi','123456','阮小七',1,'13309090022',5,5500,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2016-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:17'),(23,'ruanji','123456','阮籍',1,'13309090023',5,5800,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2012-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:19'),(24,'tongwei','123456','童威',1,'13309090024',5,5000,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2006-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:21'),(25,'tongmeng','123456','童猛',1,'13309090025',5,4800,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2002-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:23'),(26,'yanshun','123456','燕顺',1,'13309090026',5,5400,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2011-01-01',3,'2023-10-20 16:35:33','2023-11-08 22:12:46'),(27,'lijun','123456','李俊',1,'13309090027',2,6600,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2004-01-01',2,'2023-10-20 16:35:33','2023-11-16 17:56:59'),(28,'lizhong','123456','李忠',1,'13309090028',5,5000,'https://javaai200037.oss-ap-southeast-1.aliyuncs.com/2026/04/c38a0687-926e-4f09-9931-21fb21b8e197.png','2007-01-01',3,'2023-10-20 16:35:33','2026-04-06 22:55:27'),(30,'liyun','123456','李云',1,'13309090030',NULL,NULL,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2020-03-01',NULL,'2023-10-20 16:35:33','2023-10-20 16:36:31'),(36,'linghuchong','123456','令狐冲',1,'18809091212',2,6800,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2023-10-19',2,'2023-10-20 20:44:54','2023-11-09 09:41:04'),(39,'cccc','123456','aaaa',1,'18877779999',2,5666,'https://javaai200037.oss-ap-southeast-1.aliyuncs.com/2026/04/049eed5b-eafb-49ee-89e8-9f4269410b3e.png','2024-11-01',2,'2026-03-25 17:39:59','2026-04-06 22:18:46'),(41,'wangyuyan666','123456789','王语嫣666',1,'18899994444',5,7000,'https://javaai200037.oss-ap-southeast-1.aliyuncs.com/2026/03/5c0f2fff-9d4c-4ef1-afea-ed3541465e6f.jpg','2026-03-01',3,'2026-03-25 21:22:17','2026-03-25 23:01:51');
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_expr`
--

DROP TABLE IF EXISTS `emp_expr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_expr` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID, 主键',
  `emp_id` int unsigned DEFAULT NULL COMMENT '员工ID',
  `begin` date DEFAULT NULL COMMENT '开始时间',
  `end` date DEFAULT NULL COMMENT '结束时间',
  `company` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `job` varchar(50) DEFAULT NULL COMMENT '职位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工作经历';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_expr`
--

LOCK TABLES `emp_expr` WRITE;
/*!40000 ALTER TABLE `emp_expr` DISABLE KEYS */;
INSERT INTO `emp_expr` VALUES (16,41,'2026-03-01','2026-03-05','滴滴','前台'),(17,41,'2026-02-05','2026-03-11','抖音','运营'),(20,2,'2026-03-05','2026-03-31','腾讯','前台'),(21,39,'2026-03-01','2026-04-30','bbbb','bbbb');
/*!40000 ALTER TABLE `emp_expr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_log`
--

DROP TABLE IF EXISTS `emp_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID, 主键',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `info` varchar(2000) DEFAULT NULL COMMENT '日志信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='员工日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_log`
--

LOCK TABLES `emp_log` WRITE;
/*!40000 ALTER TABLE `emp_log` DISABLE KEYS */;
INSERT INTO `emp_log` VALUES (1,'2026-03-25 17:39:59','新增员工:Emp(id=39, username=cccc, password=null, name=aaaa, gender=1, phone=18877779999, job=2, salary=5666, image=, entryDate=2024-11-01, deptId=2, createTime=2026-03-25T17:39:58.554486800, updateTime=2026-03-25T17:39:58.554486800, deptName=null, exprList=[EmpExpr(id=null, empId=39, begin=2026-03-01, end=2026-04-30, company=bbbb, job=bbbb)])'),(2,'2026-03-25 17:43:32','新增员工:Emp(id=40, username=qwe, password=null, name=qwe, gender=2, phone=19876543789, job=2, salary=6000, image=, entryDate=2026-03-02, deptId=8, createTime=2026-03-25T17:43:31.848656300, updateTime=2026-03-25T17:43:31.849156300, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=2026-03-11, end=2026-04-16, company=pasd, job=zxdd)])'),(3,'2026-03-25 21:22:17','新增员工:Emp(id=41, username=wangyuyan, password=null, name=王语嫣, gender=2, phone=18899994444, job=1, salary=5500, image=https://java-ai200037.oss-cn-hangzhou.aliyuncs.com/2026/03/ae7787d7-7a82-4ced-95b5-ae787790e18a.jpg, entryDate=2026-03-01, deptId=1, createTime=2026-03-25T21:22:17.369726200, updateTime=2026-03-25T21:22:17.369726200, deptName=null, exprList=[EmpExpr(id=null, empId=41, begin=2026-03-01, end=2026-03-05, company=滴滴, job=前台), EmpExpr(id=null, empId=41, begin=2026-02-05, end=2026-03-11, company=抖音, job=运营)])'),(4,'2026-03-25 21:25:56','新增员工:Emp(id=42, username=wangmou, password=null, name=王某, gender=1, phone=15566667777, job=3, salary=20000, image=https://java-ai200037.oss-cn-hangzhou.aliyuncs.com/2026/03/28ddd56e-1d67-4ad3-b237-dde6983bba8a.jpg, entryDate=2026-03-02, deptId=2, createTime=2026-03-25T21:25:56.426452300, updateTime=2026-03-25T21:25:56.426452300, deptName=null, exprList=[EmpExpr(id=null, empId=42, begin=2026-02-03, end=2026-03-18, company=爱你, job=小姐)])'),(5,'2026-03-31 15:33:43','新增员工:Emp(id=43, username=gaoyuanyuan, password=null, name=高圆圆, gender=2, phone=13509098765, job=1, salary=6000, image=https://javaai200037.oss-ap-southeast-1.aliyuncs.com/2026/03/d579f74a-4429-42a7-a151-b494ca0cf70b.jpg, entryDate=2026-03-31, deptId=1, createTime=2026-03-31T15:33:43.431725900, updateTime=2026-03-31T15:33:43.431725900, deptName=null, exprList=[EmpExpr(id=null, empId=43, begin=2026-03-04, end=2026-03-14, company=腾讯, job=客服), EmpExpr(id=null, empId=43, begin=2026-03-26, end=2026-04-16, company=字节, job=主管)])'),(6,'2026-03-31 15:57:59','新增员工:Emp(id=null, username=1234567898, password=null, name=, gender=null, phone=, job=null, salary=null, image=, entryDate=null, deptId=null, createTime=2026-03-31T15:57:59.214584400, updateTime=2026-03-31T15:57:59.214584400, deptName=null, exprList=[])'),(7,'2026-03-31 16:02:53','新增员工:Emp(id=44, username=a, password=null, name=wang, gender=1, phone=13766664899, job=null, salary=null, image=, entryDate=null, deptId=null, createTime=2026-03-31T16:02:52.893071100, updateTime=2026-03-31T16:02:52.893071100, deptName=null, exprList=[])');
/*!40000 ALTER TABLE `emp_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operate_log`
--

DROP TABLE IF EXISTS `operate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operate_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `operate_emp_id` int unsigned DEFAULT NULL COMMENT '操作人ID',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `class_name` varchar(100) DEFAULT NULL COMMENT '操作的类名',
  `method_name` varchar(100) DEFAULT NULL COMMENT '操作的方法名',
  `method_params` varchar(2000) DEFAULT NULL COMMENT '方法参数',
  `return_value` varchar(2000) DEFAULT NULL COMMENT '返回值',
  `cost_time` bigint unsigned DEFAULT NULL COMMENT '方法执行耗时, 单位:ms',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operate_log`
--

LOCK TABLES `operate_log` WRITE;
/*!40000 ALTER TABLE `operate_log` DISABLE KEYS */;
INSERT INTO `operate_log` VALUES (1,1,'2026-03-27 18:46:07','com.louis.controller.DeptController','add','[Dept(id=null, name=6455, createTime=2026-03-27T18:46:07.274669200, updateTime=2026-03-27T18:46:07.274669200)]','Result(code=1, msg=success, data=null)',6),(2,1,'2026-03-27 18:46:12','com.louis.controller.DeptController','update','[Dept(id=11, name=645566, createTime=2026-03-27T18:46:07, updateTime=2026-03-27T18:46:11.733429100)]','Result(code=1, msg=success, data=null)',6),(3,1,'2026-03-27 18:46:14','com.louis.controller.DeptController','delete','[11]','Result(code=1, msg=success, data=null)',7),(4,2,'2026-03-27 19:07:47','com.louis.controller.DeptController','add','[Dept(id=null, name=666, createTime=2026-03-27T19:07:46.610835900, updateTime=2026-03-27T19:07:46.610835900)]','Result(code=1, msg=success, data=null)',8),(5,2,'2026-03-27 19:07:51','com.louis.controller.DeptController','update','[Dept(id=12, name=666888, createTime=2026-03-27T19:07:47, updateTime=2026-03-27T19:07:50.765186700)]','Result(code=1, msg=success, data=null)',6),(6,2,'2026-03-27 19:07:53','com.louis.controller.DeptController','delete','[12]','Result(code=1, msg=success, data=null)',7),(7,NULL,'2026-03-30 17:30:23','com.louis.controller.DeptController','add','[Dept(id=null, name=研发一部, createTime=2026-03-30T17:30:22.785198200, updateTime=2026-03-30T17:30:22.785198200)]','Result(code=1, msg=success, data=null)',8),(8,NULL,'2026-03-30 17:34:34','com.louis.controller.DeptController','add','[Dept(id=null, name=研发二部, createTime=2026-03-30T17:34:33.503335300, updateTime=2026-03-30T17:34:33.503335300)]','Result(code=1, msg=success, data=null)',7),(9,NULL,'2026-03-30 17:34:46','com.louis.controller.DeptController','add','[Dept(id=null, name=研发三部, createTime=2026-03-30T17:34:46.014179100, updateTime=2026-03-30T17:34:46.014179100)]','Result(code=1, msg=success, data=null)',4),(10,NULL,'2026-03-30 17:37:10','com.louis.controller.DeptController','add','[Dept(id=null, name=123, createTime=2026-03-30T17:37:09.915532100, updateTime=2026-03-30T17:37:09.915532100)]','Result(code=1, msg=success, data=null)',3),(11,NULL,'2026-03-30 18:03:27','com.louis.controller.DeptController','add','[Dept(id=null, name=1, createTime=2026-03-30T18:03:26.604240600, updateTime=2026-03-30T18:03:26.604240600)]','Result(code=1, msg=success, data=null)',10),(12,NULL,'2026-03-30 18:12:35','com.louis.controller.DeptController','add','[Dept(id=null, name=666, createTime=2026-03-30T18:12:34.597856500, updateTime=2026-03-30T18:12:34.597856500)]','Result(code=1, msg=success, data=null)',6),(13,NULL,'2026-03-30 21:29:21','com.louis.controller.DeptController','add','[Dept(id=null, name=888, createTime=2026-03-30T21:29:21.137742700, updateTime=2026-03-30T21:29:21.137742700)]','Result(code=1, msg=success, data=null)',7),(14,NULL,'2026-03-30 21:29:34','com.louis.controller.DeptController','update','[Dept(id=18, name=1333, createTime=2026-03-30T18:03:27, updateTime=2026-03-30T21:29:33.610721100)]','Result(code=1, msg=success, data=null)',4),(15,NULL,'2026-03-30 21:40:18','com.louis.controller.DeptController','delete','[18]','Result(code=1, msg=success, data=null)',7),(16,NULL,'2026-03-30 21:40:23','com.louis.controller.DeptController','delete','[20]','Result(code=1, msg=success, data=null)',10),(17,NULL,'2026-03-30 21:40:25','com.louis.controller.DeptController','delete','[19]','Result(code=1, msg=success, data=null)',4),(18,NULL,'2026-03-30 21:40:26','com.louis.controller.DeptController','delete','[17]','Result(code=1, msg=success, data=null)',4);
/*!40000 ALTER TABLE `operate_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID,主键',
  `name` varchar(10) NOT NULL COMMENT '姓名',
  `no` char(10) NOT NULL COMMENT '学号',
  `gender` tinyint unsigned NOT NULL COMMENT '性别, 1: 男, 2: 女',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `id_card` char(18) NOT NULL COMMENT '身份证号',
  `is_college` tinyint unsigned NOT NULL COMMENT '是否来自于院校, 1:是, 0:否',
  `address` varchar(100) DEFAULT NULL COMMENT '联系地址',
  `degree` tinyint unsigned DEFAULT NULL COMMENT '最高学历, 1:初中, 2:高中, 3:大专, 4:本科, 5:硕士, 6:博士',
  `graduation_date` date DEFAULT NULL COMMENT '毕业时间',
  `clazz_id` int unsigned NOT NULL COMMENT '班级ID, 关联班级表ID',
  `violation_count` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '违纪次数',
  `violation_score` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '违纪扣分',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `no` (`no`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `id_card` (`id_card`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'段誉','2022000001',1,'18800000001','110120000300200001',1,'北京市昌平区建材城西路1号',1,'2021-07-01',2,0,0,'2024-11-14 21:22:19','2024-11-15 16:20:59'),(2,'萧峰','2022000002',1,'18800210008','110120000300200002',1,'北京市昌平区建材城西路2号',2,'2022-07-01',1,0,0,'2024-11-14 21:22:19','2026-03-26 17:58:57'),(3,'虚竹','2022000003',1,'18800013001','110120000300200003',1,'北京市昌平区建材城西路3号',2,'2024-07-01',1,1,5,'2024-11-14 21:22:19','2026-03-26 18:11:51'),(4,'萧远山','2022000004',1,'18800003211','110120000300200004',1,'北京市昌平区建材城西路4号',3,'2024-07-01',1,0,0,'2024-11-14 21:22:19','2024-11-14 21:22:19'),(5,'阿朱','2022000005',2,'18800160002','110120000300200005',1,'北京市昌平区建材城西路5号',4,'2020-07-01',1,0,0,'2024-11-14 21:22:19','2024-11-14 21:22:19'),(6,'阿紫','2022000006',2,'18800000034','110120000300200006',1,'北京市昌平区建材城西路6号',4,'2021-07-01',2,0,0,'2024-11-14 21:22:19','2024-11-14 21:22:19'),(7,'游坦之','2022000007',1,'18800000067','110120000300200007',1,'北京市昌平区建材城西路7号',4,'2022-07-01',2,0,0,'2024-11-14 21:22:19','2024-11-14 21:22:19'),(8,'康敏','2022000008',2,'18800000077','110120000300200008',1,'北京市昌平区建材城西路8号',5,'2024-07-01',2,0,0,'2024-11-14 21:22:19','2024-11-14 21:22:19'),(9,'徐长老','2022000009',1,'18800000341','110120000300200009',1,'北京市昌平区建材城西路9号',3,'2024-07-01',2,0,0,'2024-11-14 21:22:19','2024-11-14 21:22:19'),(10,'云中鹤','2022000010',1,'18800006571','110120000300200010',1,'北京市昌平区建材城西路10号',2,'2020-07-01',2,0,0,'2024-11-14 21:22:19','2024-11-14 21:22:19'),(11,'钟万仇','2022000011',1,'18800000391','110120000300200011',1,'北京市昌平区建材城西路11号',4,'2021-07-01',1,0,0,'2024-11-14 21:22:19','2024-11-15 16:21:24'),(12,'崔百泉','2022000012',1,'18800000781','110120000300200018',1,'北京市昌平区建材城西路12号',4,'2022-07-05',3,6,17,'2024-11-14 21:22:19','2024-12-13 14:33:58'),(13,'耶律洪基','2022000013',1,'18800008901','110120000300200013',1,'北京市昌平区建材城西路13号',4,'2024-07-01',2,0,0,'2024-11-14 21:22:19','2024-11-15 16:21:21'),(14,'天山童姥','2022000014',2,'18800009201','110120000300200014',1,'北京市昌平区建材城西路14号',4,'2024-07-01',1,0,0,'2024-11-14 21:22:19','2024-11-15 16:21:17'),(15,'刘竹庄','2022000015',1,'18800009401','110120000300200015',1,'北京市昌平区建材城西路15号',3,'2020-07-01',4,0,0,'2024-11-14 21:22:19','2024-11-14 21:22:19'),(16,'李春来','2022000016',1,'18800008501','110120000300200016',1,'北京市昌平区建材城西路16号',4,'2021-07-01',4,0,0,'2024-11-14 21:22:19','2024-11-14 21:22:19'),(17,'王语嫣','2022000017',2,'18800007601','110120000300200017',1,'北京市昌平区建材城西路17号',2,'2022-07-01',4,0,0,'2024-11-14 21:22:19','2024-11-14 21:22:19'),(18,'郑成功','2024001101',1,'13309092345','110110110110110110',0,'北京市昌平区回龙观街道88号',5,'2021-07-01',3,3,11,'2024-11-15 16:26:18','2026-03-26 18:11:08');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-06 23:36:39
