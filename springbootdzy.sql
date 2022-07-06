/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.13 : Database - springbootdzy
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`springbootdzy` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `springbootdzy`;

/*Table structure for table `t_authority` */

DROP TABLE IF EXISTS `t_authority`;

CREATE TABLE `t_authority` (
  `tid` tinyint(1) DEFAULT NULL,
  `authority` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_authority` */

insert  into `t_authority`(`tid`,`authority`) values 
(1,'ROLE_customer'),
(2,'ROLE_store'),
(0,'ROLE_tourist');

/*Table structure for table `t_commodity` */

DROP TABLE IF EXISTS `t_commodity`;

CREATE TABLE `t_commodity` (
  `cid` int(20) NOT NULL,
  `cname` varchar(100) DEFAULT NULL,
  `sketch` text,
  `type` tinyint(1) DEFAULT '0' COMMENT '''0''为日用品，''1''为办公用品，''2''为零食商品，''3''为衣物商品',
  `date` date DEFAULT NULL,
  `cimage` varchar(200) DEFAULT NULL,
  `price` varchar(30) DEFAULT '0.0',
  `pastprice` varchar(30) DEFAULT '1.0',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_commodity` */

insert  into `t_commodity`(`cid`,`cname`,`sketch`,`type`,`date`,`cimage`,`price`,`pastprice`) values 
(1,'小熊饼干','癞蛤蟆！！！',2,'2021-12-08','/index/cimage/1.jpg','0.0','1.0'),
(2,'古驰香水','真货',4,'2021-12-08','/index/cimage/2.jpg','0.0','1.0'),
(3,'小黄车退款','你是认真的吗？\r\n',0,'2021-12-08','/index/cimage/3.jpg','0.0','1.0'),
(4,'华为手机','你值得拥有',5,'2021-12-08','/index/cimage/4.jpg','0.0','1.0'),
(5,'寿司','不来一份？\r\n',3,'2021-12-08','/index/cimage/5.jpg','0.0','1.0'),
(6,'吐司面包','必备用品',3,'2021-12-08','/index/cimage/6.jpg','0.0','1.0'),
(7,'巧克力面包','感觉',3,'2021-12-08','/index/cimage/7.jpg','0.0','1.0'),
(8,'泡面火腿肠','泡面必备',3,'2021-12-08','/index/cimage/8.jpg','0.0','1.0'),
(9,'牛肉粒','正宗食品\r\n',3,'2021-12-08','/index/cimage/9.jpg','0.0','1.0'),
(10,'火腿肠','来一份',3,'2021-12-08','/index/cimage/10.jpg','0.0','1.0'),
(11,'牛肉丸','绝对正宗',3,'2021-12-08','/index/cimage/11.jpg','0.0','1.0'),
(12,'康师傅泡面','人人都爱',3,'2021-12-08','/index/cimage/12.jpg','0.0','1.0'),
(13,'肉松面包','不会吧',3,'2021-12-08','/index/cimage/13.jpg','0.0','1.0'),
(14,'冰红茶','劲爽不停',0,'2021-12-08','/index/cimage/14.jpg','0.0','1.0'),
(15,'冰绿茶','回味无穷',0,'2021-12-08','/index/cimage/15.jpg','0.0','1.0'),
(16,'康帅傅泡面','不是假货！！！',0,'2021-12-08','/index/cimage/16.jpg','0.0','1.0'),
(17,'3+2饼干','自由搭配',0,'2021-12-08','/index/cimage/17.jpg','0.0','1.0'),
(18,'苹果派','缺少货源，暂停供货',0,'2021-12-08','/index/cimage/18.jpg','0.0','1.0'),
(19,'牛肉丝','各种味道任你挑选',0,'2021-12-08','/index/cimage/19.jpg','0.0','1.0'),
(20,'香芋派','缺少货源，暂停供货',0,'2021-12-08','/index/cimage/20.jpg','0.0','1.0'),
(21,'内蒙古牛肉干','不来一份',0,'2021-12-08','/index/cimage/21.jpg','0.0','1.0'),
(22,'瓜子','应有尽有',0,'2021-12-08','/index/cimage/22.jpg','0.0','1.0'),
(23,'花生','各种味道可选',0,'2021-12-08','/index/cimage/23.jpg','0.0','1.0'),
(24,'牛皮糖','真的牛皮',0,'2021-12-08','/index/cimage/24.jpg','0.0','1.0'),
(25,'棒棒糖','真的棒棒',0,'2021-12-08','/index/cimage/25.jpg','0.0','1.0'),
(26,'可口可乐','限时优惠！！！',0,'2021-12-08','/index/cimage/26.jpg','0.0','1.0'),
(27,'百事可乐','限时优惠！！！',0,'2021-12-08','/index/cimage/27.jpg','0.0','1.0'),
(28,'芬达','限时优惠！！！',0,'2021-12-08','/index/cimage/28.jpg','0.0','1.0'),
(29,'跳跳糖','刺激不断',0,'2021-12-08','/index/cimage/29.jpg','0.0','1.0'),
(30,'巴西烤肉','来一份尝尝鲜',0,'2021-12-08','/index/cimage/30.jpg','0.0','1.0'),
(31,'重庆火锅底料','麻辣正宗',0,'2021-12-08','/index/cimage/31.jpg','0.0','1.0'),
(32,'儿童手机','再也不用担心走丢',5,'2021-12-08','/index/cimage/32.jpg','0.0','1.0'),
(33,'撒尿牛丸','星爷代言，值得拥有',0,'2021-12-08','/index/cimage/33.jpg','0.0','1.0'),
(34,'电竞椅','上分不是梦',0,'2021-12-08','/index/cimage/34.jpg','0.0','1.0'),
(35,'网线','安全快速',0,'2021-12-08','/index/cimage/35.jpg','0.0','1.0'),
(36,'三星手机','不错操作',0,'2021-12-08','/index/cimage/36.jpg','0.0','1.0'),
(37,'大哥大','你大哥还是你大哥',0,'2021-12-08','/index/cimage/37.jpg','0.0','1.0'),
(38,'梳打饼','味道不错',0,'2021-12-08','/index/cimage/38.jpg','0.0','1.0'),
(39,'卫龙辣条','够辣够紧',0,'2021-12-08','/index/cimage/39.jpg','0.0','1.0'),
(40,'卫龙小面筋','真的辣',0,'2021-12-08','/index/cimage/40.jpg','0.0','1.0'),
(41,'绿豆饼','为生活加点绿',0,'2021-12-08','/index/cimage/41.jpg','0.0','1.0'),
(42,'红豆饼','头上不绿你要不要',0,'2021-12-08','/index/cimage/42.jpg','0.0','1.0'),
(43,'魔芋爽','爽就完事了',0,'2021-12-08','/index/cimage/43.jpg','0.0','1.0'),
(44,'辣鱼','没见过这么多的',0,'2021-12-08','/index/cimage/44.jpg','0.0','1.0'),
(45,'优乐美奶茶','可绕全球三圈',0,'2021-12-08','/index/cimage/45.jpg','0.0','1.0'),
(46,'香飘飘奶茶','飘飘欲仙的奶茶',0,'2021-12-08','/index/cimage/46.jpg','0.0','1.0'),
(47,'雀巢咖啡','懂的都懂',0,'2021-12-08','/index/cimage/47.jpg','0.0','1.0'),
(48,'丝袜奶茶','你懂我懂',0,'2021-12-08','/index/cimage/48.jpg','0.0','1.0'),
(49,'巧克力','吃了不胖你敢信？\r\n',0,'2021-12-08','/index/cimage/49.jpg','0.0','1.0'),
(50,'剃须刀','剃须无压力',0,'2021-12-08','/index/cimage/50.jpg','0.0','1.0'),
(51,'奥利奥饼干','传承下来了',0,'2021-12-08','/index/cimage/51.jpg','0.0','1.0'),
(52,'厨神小福贵','童年回忆',0,'2021-12-08','/index/cimage/52.jpg','0.0','1.0'),
(53,'U盘','你想要多大',0,'2021-12-08','/index/cimage/53.jpg','0.0','1.0'),
(54,'奶粉','宝宝都说好',0,'2021-12-08','/index/cimage/54.jpg','0.0','1.0'),
(55,'充电头','高速安全',0,'2021-12-08','/index/cimage/55.jpg','0.0','1.0'),
(56,'多插口充电头','更多的介入',0,'2021-12-08','/index/cimage/56.jpg','0.0','1.0'),
(57,'钱包','请尽情的鞭策我吧',0,'2021-12-08','/index/cimage/57.jpg','0.0','1.0'),
(58,'怡宝','矿物质威武！',0,'2021-12-08','/index/cimage/58.jpg','0.0','1.0'),
(59,'农夫山泉','真的很甜',0,'2021-12-08','/index/cimage/59.jpg','0.0','1.0'),
(60,'书架','够工整',0,'2021-12-08','/index/cimage/60.jpg','0.0','1.0'),
(61,'双肩包','完美解决肩上烦恼',0,'2021-12-08','/index/cimage/61.jpg','0.0','1.0'),
(62,'挎包','你想变帅吗',0,'2021-12-08','/index/cimage/62.jpg','0.0','1.0'),
(63,'小空调','够冰',0,'2021-12-08','/index/cimage/63.jpg','0.0','1.0'),
(64,'小冰箱','这你敢信',0,'2021-12-08','/index/cimage/64.jpg','0.0','1.0'),
(65,'小风扇','够爽',0,'2021-12-08','/index/cimage/65.jpg','0.0','1.0'),
(66,'数据线','长短都有',0,'2021-12-08','/index/cimage/66.jpg','0.0','1.0'),
(67,'垃圾袋','够大',0,'2021-12-08','/index/cimage/67.jpg','0.0','1.0'),
(68,'有线耳机','够长',0,'2021-12-08','/index/cimage/68.jpg','0.0','1.0'),
(69,'蓝牙耳机','耳机党的福利',0,'2021-12-08','/index/cimage/69.jpg','0.0','1.0'),
(70,'雨伞','大小都有',0,'2021-12-08','/index/cimage/70.jpg','0.0','1.0'),
(71,'餐纸','可沾水',0,'2021-12-08','/index/cimage/71.jpg','0.0','1.0'),
(72,'小纸巾','够便捷',0,'2021-12-08','/index/cimage/72.jpg','0.0','1.0'),
(73,'插座','多个插口',0,'2021-12-08','/index/cimage/73.jpg','0.0','1.0'),
(74,'衣架','够大',0,'2021-12-08','/index/cimage/74.jpg','0.0','1.0'),
(75,'胶布','别拿我粘一些不该粘的东西',0,'2021-12-08','/index/cimage/75.jpg','0.0','1.0'),
(76,'透明胶','这不是胶布！！！',0,'2021-12-08','/index/cimage/76.jpg','0.0','1.0'),
(77,'彩笔','红橙黄绿青蓝紫',0,'2021-12-08','/index/cimage/77.jpg','0.0','1.0'),
(78,'画纸','画画必备',0,'2021-12-08','/index/cimage/78.jpg','0.0','1.0'),
(79,'笔记本','笔记必备',0,'2021-12-08','/index/cimage/79.jpg','0.0','1.0'),
(80,'削笔刀','真的尖',0,'2021-12-08','/index/cimage/80.jpg','0.0','1.0'),
(81,'橡皮擦','干净',0,'2021-12-08','/index/cimage/81.jpg','0.0','1.0'),
(82,'黑笔芯5.0','好粗哟',0,'2021-12-08','/index/cimage/82.jpg','0.0','1.0'),
(83,'黑笔芯3.8','好细哟',0,'2021-12-08','/index/cimage/83.jpg','0.0','1.0'),
(84,'红笔芯5.0','好粗',0,'2021-12-08','/index/cimage/84.jpg','0.0','1.0'),
(85,'红笔芯3.8','好细',0,'2021-12-08','/index/cimage/85.jpg','0.0','1.0'),
(86,'铅笔芯7.0','懂的都懂',0,'2021-12-08','/index/cimage/86.jpg','0.0','1.0'),
(87,'铅笔芯5.0','懂的都懂',0,'2021-12-08','/index/cimage/87.jpg','0.0','1.0'),
(88,'铅笔7.0','够粗',0,'2021-12-08','/index/cimage/88.jpg','0.0','1.0'),
(89,'铅笔5.0','够细',0,'2021-12-08','/index/cimage/89.jpg','0.0','1.0'),
(90,'黑笔','黑衣如墨',0,'2021-12-08','/index/cimage/90.jpg','0.0','1.0'),
(91,'红笔','红灿灿',0,'2021-12-08','/index/cimage/91.jpg','0.0','1.0'),
(92,'牙膏','闪闪发亮',0,'2021-12-08','/index/cimage/92.jpg','0.0','1.0'),
(93,'牙刷','柔软舒适',0,'2021-12-08','/index/cimage/93.jpg','0.0','1.0'),
(94,'大枕头','睡得安心',0,'2021-12-08','/index/cimage/94.jpg','0.0','1.0'),
(95,'小枕头','随身携带',0,'2021-12-08','/index/cimage/95.jpg','0.0','1.0'),
(96,'床单','舒适就完事了',0,'2021-07-21','/index/cimage/96.jpg','0.0','1.0'),
(97,'蚊帐','不放过一个敌人',0,'2020-11-25','/index/cimage/97.jpg','0.0','1.0'),
(98,'床帘','隔光良好',0,'2021-02-25','/index/cimage/98.jpg','0.0','1.0'),
(99,'窗帘','漂亮不接受反驳',0,'2021-02-18','/index/cimage/99.jpg','0.0','1.0'),
(100,'洗衣液','闪闪发光',0,'2021-12-08','/index/cimage/100.jpg','0.0','1.0'),
(101,'毛衣','保暖。。',3,'2021-08-18','/index/cimage/101.jpg','0.0','1.0');

/*Table structure for table `t_commodity_type` */

DROP TABLE IF EXISTS `t_commodity_type`;

CREATE TABLE `t_commodity_type` (
  `type` tinyint(1) DEFAULT NULL,
  `tname` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_commodity_type` */

insert  into `t_commodity_type`(`type`,`tname`) values 
(0,'日用品'),
(1,'办公用品'),
(2,'零食商品'),
(3,'衣物'),
(4,'化妆品'),
(5,'电子产品');

/*Table structure for table `t_order_state` */

DROP TABLE IF EXISTS `t_order_state`;

CREATE TABLE `t_order_state` (
  `id` tinyint(1) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_order_state` */

insert  into `t_order_state`(`id`,`state`) values 
(1,'待处理'),
(2,'已接受'),
(3,'已拒绝'),
(0,'已取消');

/*Table structure for table `t_shopping` */

DROP TABLE IF EXISTS `t_shopping`;

CREATE TABLE `t_shopping` (
  `uid` int(20) NOT NULL,
  `cid` int(20) NOT NULL,
  `cnum` int(50) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_shopping` */

insert  into `t_shopping`(`uid`,`cid`,`cnum`) values 
(12120101,91,1),
(12120101,12,5),
(12120101,1,2),
(12120101,2,3),
(12120101,65,2),
(12120101,81,2);

/*Table structure for table `t_store` */

DROP TABLE IF EXISTS `t_store`;

CREATE TABLE `t_store` (
  `sid` int(20) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `profile` text,
  `uid` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_store` */

insert  into `t_store`(`sid`,`sname`,`profile`,`uid`) values 
(1,'阿里巴巴','蚂蚁金福',21010101),
(2,'京东','品牌自营',21010102),
(3,'天猫超市',NULL,21010103);

/*Table structure for table `t_store_commodity` */

DROP TABLE IF EXISTS `t_store_commodity`;

CREATE TABLE `t_store_commodity` (
  `cid` int(20) DEFAULT NULL,
  `sid` int(20) DEFAULT NULL,
  `totalnum` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_store_commodity` */

insert  into `t_store_commodity`(`cid`,`sid`,`totalnum`) values 
(1,3,30),
(2,3,40),
(3,3,40),
(4,3,40),
(5,3,40),
(6,3,40),
(7,3,40),
(8,3,40),
(9,3,40),
(10,3,40),
(11,2,40),
(12,2,40),
(13,2,40),
(14,2,40),
(15,2,40),
(16,2,40),
(17,2,40),
(18,2,40),
(19,2,40),
(20,2,40),
(21,2,40),
(22,2,40),
(23,2,40),
(24,2,40),
(25,2,40),
(26,2,40),
(27,2,40),
(28,2,40),
(29,2,40),
(30,2,40),
(31,2,40),
(32,2,40),
(33,2,40),
(34,2,40),
(35,2,40),
(36,2,40),
(37,2,40),
(38,2,40),
(39,2,40),
(40,2,40),
(41,2,40),
(42,2,40),
(43,2,40),
(44,2,40),
(45,2,40),
(46,2,40),
(47,2,40),
(48,2,40),
(49,2,40),
(50,2,40),
(51,1,40),
(52,1,40),
(53,1,40),
(54,1,40),
(55,1,40),
(56,1,40),
(57,1,40),
(58,1,40),
(59,1,40),
(60,1,40),
(61,1,40),
(62,1,40),
(63,1,40),
(64,1,40),
(65,1,40),
(66,1,40),
(67,1,40),
(68,1,40),
(69,1,40),
(70,1,40),
(71,1,40),
(72,1,40),
(73,1,40),
(74,1,40),
(75,1,40),
(76,1,40),
(77,1,40),
(78,1,40),
(79,1,40),
(80,1,40),
(81,1,40),
(82,1,40),
(83,1,40),
(84,1,40),
(85,1,40),
(86,1,40),
(87,1,40),
(88,1,40),
(89,1,40),
(90,1,40),
(91,1,40),
(92,1,40),
(93,1,40),
(94,1,40),
(95,1,40),
(96,1,40),
(97,1,40),
(98,1,40),
(99,1,40),
(100,1,40),
(101,1,40);

/*Table structure for table `t_store_order` */

DROP TABLE IF EXISTS `t_store_order`;

CREATE TABLE `t_store_order` (
  `sid` int(20) DEFAULT NULL,
  `cid` int(20) DEFAULT NULL,
  `num` int(30) DEFAULT '1',
  `state` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_store_order` */

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `uid` int(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '1',
  `portrait` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`uid`,`username`,`password`,`email`,`valid`,`portrait`) values 
(12120101,'admin','$2a$10$OiqwjuTA89AJSlLdI5utNe58bSvW0SZc4yvejvfgCAWP3c1g843R.','3198743496@qq.com',1,'/user/images/原神周年庆.jpg'),
(22110101,'user','$2a$10$5ooQI8dir8jv0/gCa1Six.GpzAdIPf6pMqdminZ/3ijYzivCyPlfK','1965244994@qq.com',2,'/user/images/背景可莉.jpg');

/*Table structure for table `t_user_authority` */

DROP TABLE IF EXISTS `t_user_authority`;

CREATE TABLE `t_user_authority` (
  `id` int(20) NOT NULL,
  `uid` int(20) DEFAULT NULL,
  `tid` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user_authority` */

insert  into `t_user_authority`(`id`,`uid`,`tid`) values 
(1,12120101,1),
(2,22110101,2);

/*Table structure for table `t_user_order` */

DROP TABLE IF EXISTS `t_user_order`;

CREATE TABLE `t_user_order` (
  `id` int(50) NOT NULL,
  `uid` int(20) DEFAULT NULL,
  `cid` int(20) DEFAULT NULL,
  `num` int(30) DEFAULT '0',
  `date` date NOT NULL,
  `state` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user_order` */

insert  into `t_user_order`(`id`,`uid`,`cid`,`num`,`date`,`state`) values 
(1,12120101,97,3,'2021-11-01',2),
(2,12120101,21,1,'2021-12-01',2),
(3,12120101,92,1,'2021-12-09',0),
(4,12120101,93,1,'2021-12-10',1),
(5,12120101,12,2,'2021-12-11',1),
(6,12120101,56,4,'2021-12-13',1),
(7,12120101,96,4,'2021-12-13',2),
(8,12120101,101,5,'2021-12-14',1),
(9,12120101,100,5,'2021-12-15',1),
(10,12120101,94,3,'2021-12-15',1),
(11,12120101,74,5,'2021-12-15',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
