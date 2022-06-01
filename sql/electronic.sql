/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.16 : Database - electronic
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`electronic` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `electronic`;

/*Table structure for table `bus_customer` */

DROP TABLE IF EXISTS `bus_customer`;

CREATE TABLE `bus_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `connectionpersion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `available` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bus_customer` */

insert  into `bus_customer`(`id`,`customername`,`zip`,`address`,`telephone`,`connectionpersion`,`phone`,`bank`,`account`,`email`,`fax`,`available`) values (10,'张三','330215','深圳','18375203215','张三','18375203215','4544612556654545','46454645','sjdf@qq.com','1200235','1');

/*Table structure for table `bus_goods` */

DROP TABLE IF EXISTS `bus_goods`;

CREATE TABLE `bus_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `produceplace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `goodspackage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `productcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `promitcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `dangernum` int(11) DEFAULT NULL,
  `goodsimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  `providerid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bus_goods` */

insert  into `bus_goods`(`id`,`goodsname`,`produceplace`,`size`,`goodspackage`,`productcode`,`promitcode`,`description`,`price`,`number`,`dangernum`,`goodsimg`,`available`,`providerid`) values (6,'二极管','上海','100','455545','455545','5556655','二极管',10.00,4000,100,'/images/noDefaultImage.jpg',1,10);

/*Table structure for table `bus_inport` */

DROP TABLE IF EXISTS `bus_inport`;

CREATE TABLE `bus_inport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `inporttime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `inportprice` double(10,2) DEFAULT NULL,
  `providerid` int(11) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `uuid` char(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bus_inport` */

insert  into `bus_inport`(`id`,`paytype`,`inporttime`,`operateperson`,`number`,`remark`,`inportprice`,`providerid`,`goodsid`,`uuid`) values (25,NULL,'2021-11-18 01:53:57','admin',0,NULL,10.00,10,6,'b62e7ff2-f9b2-4d57-97c1-ea5322fdfda6');

/*Table structure for table `bus_outport` */

DROP TABLE IF EXISTS `bus_outport`;

CREATE TABLE `bus_outport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `outputtime` datetime DEFAULT NULL,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `outportprice` double DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `uuid` char(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Data for the table `bus_outport` */

insert  into `bus_outport`(`id`,`providerid`,`paytype`,`outputtime`,`operateperson`,`outportprice`,`number`,`remark`,`goodsid`,`uuid`) values (11,10,NULL,'2021-11-18 01:54:17','admin',10,100,NULL,6,'b62e7ff2-f9b2-4d57-97c1-ea5322fdfda6');

/*Table structure for table `bus_provider` */

DROP TABLE IF EXISTS `bus_provider`;

CREATE TABLE `bus_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providername` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `connectionperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Data for the table `bus_provider` */

insert  into `bus_provider`(`id`,`providername`,`zip`,`address`,`telephone`,`connectionperson`,`phone`,`bank`,`account`,`email`,`fax`,`available`) values (10,'李四','023326','北京','18356556654','李四','18356556654','454645464564','465464545','qsdjfksdf@qq.com','445464',1),(11,'王五','023251','天津','1835556525','王五','1835556525','4556566555','446464654','sdjfskdjf@qq.com','5464456',1);

/*Table structure for table `bus_sales` */

DROP TABLE IF EXISTS `bus_sales`;

CREATE TABLE `bus_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `salestime` datetime DEFAULT NULL,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `saleprice` decimal(10,2) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Data for the table `bus_sales` */

insert  into `bus_sales`(`id`,`customerid`,`paytype`,`salestime`,`operateperson`,`number`,`remark`,`saleprice`,`goodsid`) values (4,10,'支付宝','2021-11-15 08:44:46','超级管理员',100,'','10.00',6),(5,10,'支付宝','2021-11-15 08:47:48','超级管理员',10000,'','1.00',6);

/*Table structure for table `bus_salesback` */

DROP TABLE IF EXISTS `bus_salesback`;

CREATE TABLE `bus_salesback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `salesbacktime` datetime DEFAULT NULL,
  `salebackprice` double(10,2) DEFAULT NULL,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Data for the table `bus_salesback` */

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `open` int(11) DEFAULT NULL COMMENT '是否展开，0不展开，1展开',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `available` int(11) DEFAULT NULL COMMENT '是否可用，0不可用，1可用',
  `ordernum` int(11) DEFAULT NULL COMMENT '排序码',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`id`,`pid`,`name`,`open`,`remark`,`address`,`available`,`ordernum`,`createtime`) values (1,0,'总经办',1,'大BOSS','深圳',1,1,'2019-04-10 14:06:32'),(2,1,'销售部',0,'程序员屌丝','武汉',1,2,'2019-04-10 14:06:32'),(3,1,'运营部',0,'无','武汉',1,3,'2019-04-10 14:06:32'),(4,1,'生产部',0,'无','武汉',1,4,'2019-04-10 14:06:32'),(5,2,'销售一部',0,'销售一部','武汉',1,5,'2019-04-10 14:06:32'),(6,2,'销售二部',0,'销售二部','武汉',1,6,'2019-04-10 14:06:32'),(7,3,'运营一部',0,'运营一部','武汉',1,7,'2019-04-10 14:06:32'),(8,2,'销售三部',0,'销售三部','11',1,8,'2019-04-10 14:06:32'),(9,2,'销售四部',0,'销售四部','222',1,9,'2019-04-10 14:06:32'),(10,2,'销售五部',0,'销售五部','33',1,10,'2019-04-10 14:06:32');

/*Table structure for table `sys_loginfo` */

DROP TABLE IF EXISTS `sys_loginfo`;

CREATE TABLE `sys_loginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `loginip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Data for the table `sys_loginfo` */

insert  into `sys_loginfo`(`id`,`loginname`,`loginip`,`logintime`) values (220,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 06:33:51'),(221,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 06:43:15'),(222,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 06:49:36'),(223,'system-system','0:0:0:0:0:0:0:1','2021-11-15 06:51:50'),(224,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 06:53:17'),(225,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 07:01:52'),(226,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 07:04:48'),(227,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 07:11:00'),(228,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 07:12:56'),(229,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 07:37:49'),(230,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 07:44:37'),(231,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 07:50:37'),(232,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 07:53:46'),(233,'system-system','0:0:0:0:0:0:0:1','2021-11-15 07:56:40'),(234,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 07:57:23'),(235,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 08:08:00'),(236,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 08:14:31'),(237,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 08:16:07'),(238,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 08:16:41'),(239,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 11:03:11'),(240,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 11:16:15'),(241,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 11:39:13'),(242,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 11:41:41'),(243,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 11:43:52'),(244,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 11:47:43'),(245,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 11:51:46'),(246,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 11:56:04'),(247,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 12:02:34'),(248,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 12:14:49'),(249,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 12:18:52'),(250,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 12:24:08'),(251,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 12:29:07'),(252,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 13:30:36'),(253,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 13:31:58'),(254,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 13:35:36'),(255,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 13:36:44'),(256,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 13:41:24'),(257,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 13:43:29'),(258,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 13:47:40'),(259,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 14:03:27'),(260,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 14:05:41'),(261,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 14:07:05'),(262,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 14:11:19'),(263,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 14:17:21'),(264,'超级管理员-admin','127.0.0.1','2021-11-15 14:24:40'),(265,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 14:25:41'),(266,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-15 14:27:46'),(267,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 00:57:00'),(268,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 01:02:03'),(269,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 01:03:52'),(270,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 01:05:26'),(271,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 01:06:58'),(272,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 01:08:54'),(273,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 01:17:23'),(274,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 01:19:16'),(275,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 01:20:42'),(276,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 01:21:51'),(277,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 01:32:36'),(278,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 02:39:18'),(279,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 03:48:55'),(280,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 11:30:07'),(281,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 12:33:53'),(282,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 13:44:28'),(283,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 13:51:15'),(284,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 13:55:07'),(285,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 13:57:57'),(286,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 14:01:56'),(287,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 14:04:09'),(288,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 14:06:02'),(289,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 14:08:07'),(290,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 14:10:32'),(291,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-16 14:12:18'),(292,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-17 06:34:29'),(293,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-17 07:45:49'),(294,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-17 09:38:49'),(295,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-17 13:12:05'),(296,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-18 01:58:29'),(297,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-18 02:20:01'),(298,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-18 03:34:17'),(299,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-18 03:34:44'),(300,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-18 07:18:51'),(301,'超级管理员-admin','0:0:0:0:0:0:0:1','2021-11-18 07:19:47');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `createtime` datetime DEFAULT NULL,
  `opername` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Data for the table `sys_notice` */

insert  into `sys_notice`(`id`,`title`,`content`,`createtime`,`opername`) values (24,'放假','<p>放假三天</p>','2021-11-15 11:03:46','超级管理员');

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `percode` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限编码[只有type=permission才有 user:view]',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `target` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `open` int(11) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  `available` int(11) DEFAULT NULL COMMENT '是否可用[0不可用，1可用]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`pid`,`type`,`title`,`percode`,`icon`,`href`,`target`,`open`,`ordernum`,`available`) values (1,0,'menu','仓库管理系统',NULL,'&#xe68e;','','',1,1,1),(2,1,'menu','基础管理',NULL,'&#xe857;','','',0,2,1),(3,1,'menu','库存管理',NULL,'&#xe645;','',NULL,0,3,1),(5,1,'menu','系统管理',NULL,'&#xe614;','','',1,5,1),(6,1,'menu','其它管理',NULL,'&#xe628;','','',0,6,1),(7,2,'menu','客户管理',NULL,'&#xe651;','/bus/toCustomerManager','',0,7,1),(8,2,'menu','供应商管理',NULL,'&#xe658;','/bus/toProviderManager','',0,8,1),(9,2,'menu','元器件管理',NULL,'&#xe657;','/bus/toGoodsManager','',0,9,1),(10,3,'menu','元器件入库',NULL,'&#xe756;','/bus/toInportManager','',0,10,1),(11,3,'menu','元器件出库查询',NULL,'&#xe65a;','/bus/toOutportManager','',0,11,1),(13,4,'menu','销售退货查询',NULL,'&#xe770;','/bus/toSalesbackManager','',0,13,1),(14,5,'menu','部门管理',NULL,'&#xe770;','/sys/toDeptManager','',0,14,1),(15,5,'menu','菜单管理',NULL,'&#xe857;','/sys/toMenuManager','',0,15,1),(16,5,'menu','权限管理','','&#xe857;','/sys/toPermissionManager','',0,16,1),(17,5,'menu','角色管理','','&#xe650;','/sys/toRoleManager','',0,17,1),(18,5,'menu','用户管理','','&#xe612;','/sys/toUserManager','',0,18,1),(21,6,'menu','登陆日志',NULL,'&#xe675;','/sys/toLoginfoManager','',0,21,1),(22,6,'menu','系统公告',NULL,'&#xe756;','/sys/toNoticeManager',NULL,0,22,1),(23,6,'menu','图标管理',NULL,'&#xe670;','../resources/page/icon.html',NULL,0,23,1),(30,14,'permission','添加部门','dept:create','',NULL,NULL,0,24,1),(31,14,'permission','修改部门','dept:update','',NULL,NULL,0,26,1),(32,14,'permission','删除部门','dept:delete','',NULL,NULL,0,27,1),(34,15,'permission','添加菜单','menu:create','','','',0,29,1),(35,15,'permission','修改菜单','menu:update','',NULL,NULL,0,30,1),(36,15,'permission','删除菜单','menu:delete','',NULL,NULL,0,31,1),(38,16,'permission','添加权限','permission:create','',NULL,NULL,0,33,1),(39,16,'permission','修改权限','permission:update','',NULL,NULL,0,34,1),(40,16,'permission','删除权限','permission:delete','',NULL,NULL,0,35,1),(42,17,'permission','添加角色','role:create','',NULL,NULL,0,37,1),(43,17,'permission','修改角色','role:update','',NULL,NULL,0,38,1),(44,17,'permission','删除角色','role:delete','',NULL,NULL,0,39,1),(46,17,'permission','分配权限','role:selectPermission','',NULL,NULL,0,41,1),(47,18,'permission','添加用户','user:create','',NULL,NULL,0,42,1),(48,18,'permission','修改用户','user:update','',NULL,NULL,0,43,1),(49,18,'permission','删除用户','user:delete','',NULL,NULL,0,44,1),(51,18,'permission','用户分配角色','user:selectRole','',NULL,NULL,0,46,1),(52,18,'permission','重置密码','user:resetPwd',NULL,NULL,NULL,0,47,1),(53,14,'permission','部门查询','dept:view',NULL,NULL,NULL,0,48,1),(54,15,'permission','菜单查询','menu:view',NULL,NULL,NULL,0,49,1),(55,16,'permission','权限查询','permission:view',NULL,NULL,NULL,0,50,1),(56,17,'permission','角色查询','role:view',NULL,NULL,NULL,0,51,1),(57,18,'permission','用户查询','user:view',NULL,NULL,NULL,0,52,1),(68,7,'permission','客户查询','customer:view',NULL,NULL,NULL,NULL,60,1),(69,7,'permission','客户添加','customer:create',NULL,NULL,NULL,NULL,61,1),(70,7,'permission','客户修改','customer:update',NULL,NULL,NULL,NULL,62,1),(71,7,'permission','客户删除','customer:delete',NULL,NULL,NULL,NULL,63,1),(73,21,'permission','日志查询','info:view',NULL,NULL,NULL,NULL,65,1),(74,21,'permission','日志删除','info:delete',NULL,NULL,NULL,NULL,66,1),(75,21,'permission','日志批量删除','info:batchdelete',NULL,NULL,NULL,NULL,67,1),(76,22,'permission','公告查询','notice:view',NULL,NULL,NULL,NULL,68,1),(77,22,'permission','公告添加','notice:create',NULL,NULL,NULL,NULL,69,1),(78,22,'permission','公告修改','notice:update',NULL,NULL,NULL,NULL,70,1),(79,22,'permission','公告删除','notice:delete',NULL,NULL,NULL,NULL,71,1),(81,8,'permission','供应商查询','provider:view',NULL,NULL,NULL,NULL,73,1),(82,8,'permission','供应商添加','provider:create',NULL,NULL,NULL,NULL,74,1),(83,8,'permission','供应商修改','provider:update',NULL,NULL,NULL,NULL,75,1),(84,8,'permission','供应商删除','provider:delete',NULL,NULL,NULL,NULL,76,1),(86,22,'permission','公告查看','notice:viewnotice',NULL,NULL,NULL,NULL,78,1),(91,9,'permission','元器件查询','goods:view',NULL,NULL,NULL,0,79,1),(92,9,'permission','元器件添加','goods:create',NULL,NULL,NULL,0,80,1),(116,9,'permission','元器件删除','goods:delete',NULL,NULL,NULL,0,84,1),(117,9,'permission','元器件修改','goods:update',NULL,NULL,NULL,0,85,1),(118,9,'permission','元器件查询','goods:view',NULL,NULL,NULL,0,86,1),(119,22,'permission','公告批量删除','notice:batchdelete',NULL,NULL,NULL,0,87,1);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `available` int(11) DEFAULT NULL COMMENT '0不可用，1可用',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`remark`,`available`,`createtime`) values (1,'超级管理员','拥有所有菜单权限',1,'2019-04-10 14:06:32'),(4,'基础数据管理员','基础数据管理员',1,'2019-04-10 14:06:32'),(5,'仓库管理员','仓库管理员',1,'2019-04-10 14:06:32'),(6,'销售管理员','销售管理员',1,'2019-04-10 14:06:32'),(7,'系统管理员','系统管理员',1,'2019-04-10 14:06:32');

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `rid` int(11) DEFAULT NULL,
  `pid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_role_permission` */

insert  into `sys_role_permission`(`rid`,`pid`) values (1,1),(4,1),(5,1),(6,1),(7,1),(1,2),(4,2),(5,2),(1,3),(5,3),(1,4),(5,4),(6,4),(1,5),(7,5),(1,6),(1,7),(4,7),(5,7),(1,8),(4,8),(5,8),(1,9),(4,9),(5,9),(1,10),(5,10),(1,11),(5,11),(1,12),(5,12),(6,12),(1,13),(5,13),(6,13),(1,14),(7,14),(1,15),(7,15),(1,16),(7,16),(1,17),(7,17),(1,18),(7,18),(1,21),(1,22),(1,23),(1,30),(7,30),(1,31),(7,31),(1,32),(7,32),(1,34),(7,34),(1,35),(7,35),(1,36),(7,36),(1,38),(7,38),(1,39),(7,39),(1,40),(7,40),(1,42),(7,42),(1,43),(7,43),(1,44),(7,44),(1,46),(7,46),(1,47),(7,47),(1,48),(7,48),(1,49),(7,49),(1,51),(7,51),(1,52),(7,52),(1,53),(7,53),(1,54),(7,54),(1,55),(7,55),(1,56),(7,56),(1,57),(7,57),(1,68),(4,68),(5,68),(1,69),(1,70),(1,71),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,81),(4,81),(5,81),(1,82),(1,83),(1,84),(1,86),(1,91),(4,91),(5,91),(1,92),(4,92),(5,92),(1,116),(4,116),(5,116),(1,117),(4,117),(5,117),(1,118),(4,118),(5,118);

/*Table structure for table `sys_statistics` */

DROP TABLE IF EXISTS `sys_statistics`;

CREATE TABLE `sys_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sys_statistics` */

insert  into `sys_statistics`(`id`,`count`,`create_time`) values (1,10,'2021-11-10 21:39:32'),(2,20,'2021-11-11 21:39:48'),(3,30,'2021-11-12 21:40:12'),(4,15,'2021-11-13 21:40:25'),(5,40,'2021-11-14 21:40:34'),(6,14,'2021-11-15 21:40:45'),(7,28,'2021-11-16 10:18:42'),(8,60,'2021-11-17 10:18:49');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `deptid` int(11) DEFAULT NULL,
  `hiredate` datetime DEFAULT NULL,
  `mgr` int(11) DEFAULT NULL COMMENT '上级领导id',
  `available` int(11) DEFAULT '1' COMMENT '是否可用，0不可用，1可用',
  `ordernum` int(11) DEFAULT NULL COMMENT '排序码',
  `type` int(255) DEFAULT NULL COMMENT '用户类型[0超级管理员，1管理员，2普通用户]',
  `imgpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户头像地址',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '盐',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_sys_dept_sys_user` (`deptid`) USING BTREE,
  CONSTRAINT `FK_sys_dept_sys_user` FOREIGN KEY (`deptid`) REFERENCES `sys_dept` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='InnoDB free: 9216 kB; (`deptid`) REFER `warehouse/sys_dept`(`id`) ON UPDATE CASC';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`name`,`loginname`,`pwd`,`address`,`sex`,`remark`,`deptid`,`hiredate`,`mgr`,`available`,`ordernum`,`type`,`imgpath`,`salt`) values (1,'超级管理员','admin','532ac00e86893901af5f0be6b704dbc7','系统深处的男人',1,'超级管理员',1,'2018-06-25 11:06:34',NULL,1,1,0,'../resources/images/defaultusertitle.jpg','04A93C74C8294AA09A8B974FD1F4ECBB'),(18,'system','system','04498859892619e72fc76650b970918d','USA',1,'system',1,'2021-11-15 06:47:16',NULL,1,2,1,NULL,'EC289B4D125C45D8A7C7C73B8B16D234');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `uid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`uid`,`rid`) values (1,1),(18,7);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
