-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: bookbar
-- ------------------------------------------------------


DROP TABLE IF EXISTS `acct_permission`;
CREATE TABLE `acct_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `key` varchar(20) NOT NULL,
  `sort_num` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO `acct_permission` VALUES (1,'浏览用户','user:list',1,NULL),(2,'添加用户','user:add',2,NULL),(3,'修改用户','user:modify',3,NULL),(4,'删除用户','user:remove',4,NULL),(5,'浏览角色','role:list',5,NULL),(6,'添加角色','role:add',6,NULL),(7,'修改角色','role:modify',7,NULL),(8,'删除角色','role:remove',8,NULL),(9,'浏览日志','log:list',9,NULL),(10,'浏览系统参数','param:list',10,NULL),(11,'修改系统参数','param:modify',11,NULL);
 

DROP TABLE IF EXISTS `acct_role`;
CREATE TABLE `acct_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8; 
INSERT INTO `acct_role` VALUES (1,'用户管理员','只能对用户进行操作'),(2,'超级管理员','超级管理员');
 

DROP TABLE IF EXISTS `acct_role_permission`;
CREATE TABLE `acct_role_permission` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  KEY `role_id` (`role_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `acct_role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `acct_role` (`id`),
  CONSTRAINT `acct_role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `acct_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
INSERT INTO `acct_role_permission` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11);
 

DROP TABLE IF EXISTS `acct_user`;
CREATE TABLE `acct_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(64) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

 
INSERT INTO `acct_user` VALUES (1,'admin','Admin','691b14d79bf0fa2215f155235df5e670b64394cc','7efbd59d9741d34f','2012-06-03 17:00:00'),(2,'user','Calvin','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','6d65d24122c30500','2012-06-03 18:00:00'),(3,'test','test','6269761c24740c8c65cbb2696bc6ff508042982d','11a9f442812060dc','2013-12-27 01:27:52'),(7,'asdf','223','f1d1af8d6b86ac3cde167b250dcedb4ed34b9fb8','412645ead7b9fc93','2013-12-30 03:11:37'),(8,'gg','gg','2bf1efa58e708e15c5b3dbe6b37ac886dcc52099','f78acdaf70f26a6e','2013-12-30 03:12:03'),(9,'tester1','张三','e4f313cf742cac21aaf6acacf2c93dead56ab1b4','47bd01eb1de80501','2014-02-14 17:35:49');
 

DROP TABLE IF EXISTS `acct_user_role`;
CREATE TABLE `acct_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `acct_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `acct_user` (`id`),
  CONSTRAINT `acct_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `acct_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `acct_user_role` VALUES (3,1),(2,1),(1,1),(1,2),(8,1),(7,1),(9,1),(9,2);
 
DROP TABLE IF EXISTS `book_data`;
CREATE TABLE `book_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `descript` varchar(512) DEFAULT NULL COMMENT '描述',
  `url` varchar(256) DEFAULT NULL COMMENT '超链接',
  `item_id` bigint(20) DEFAULT NULL,
  `update_time` date DEFAULT NULL COMMENT '数据更新时间',
  `varchar1` varchar(512) DEFAULT NULL,
  `varchar2` varchar(512) DEFAULT NULL,
  `varchar3` varchar(512) DEFAULT NULL,
  `varchar4` varchar(512) DEFAULT NULL,
  `varchar5` varchar(512) DEFAULT NULL,
  `varchar6` varchar(512) DEFAULT NULL,
  `varchar7` varchar(512) DEFAULT NULL,
  `varchar8` varchar(512) DEFAULT NULL,
  `varchar9` varchar(512) DEFAULT NULL,
  `varchar10` varchar(512) DEFAULT NULL,
  `num1` float DEFAULT NULL,
  `num2` float DEFAULT NULL,
  `num3` float DEFAULT NULL,
  `num4` float DEFAULT NULL,
  `num5` float DEFAULT NULL,
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `date3` date DEFAULT NULL,
  `date4` date DEFAULT NULL,
  `date5` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id_book_data` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44282 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `book_item`;
CREATE TABLE `book_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '数据项目名称',
  `url` varchar(256) DEFAULT NULL COMMENT '超链接',
  `collector` varchar(128) DEFAULT NULL COMMENT '采集器',
  `data_option` varchar(512) DEFAULT NULL COMMENT '数据配置，该采集器采集的数据在book_data表中对应的列名称和实际意义名称',
  `website` varchar(256) DEFAULT NULL COMMENT '数据来源，网站名称',
  `descript` varchar(128) DEFAULT NULL COMMENT '备注',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
 
INSERT INTO `book_item` VALUES (1,'近1周销售榜','http://www.jd.com/booktop-2-0-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:14:09'),(2,'年度畅销榜','http://www.jd.com/booktop-1-4-0-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:14:28'),(3,'计算机与互联网图书近1周销售榜','http://www.jd.com/booktop-1-2-3287-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:14:51'),(4,'小说图书近1周销售榜','http://www.jd.com/booktop-1-2-3258-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:15:15'),(5,'新书热卖榜(近7日)','http://bang.dangdang.com/books/newhotsales/01.00.00.00.00.00-recent7-0-0-1-1','com.enilu.bookbar.collector.dangdang.Top500Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','当当网',NULL,'2014-05-28 23:27:09'),(6,'童书榜','http://bang.dangdang.com/books/childrensbooks/01.41.00.00.00.00-24hours-0-0-1-1','com.enilu.bookbar.collector.dangdang.Top500Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','当当网',NULL,'2014-05-28 23:29:35'),(7,'计算机图书畅销榜','http://bang.dangdang.com/books/bestsellers/01.54.00.00.00.00-24hours-0-0-1-1','com.enilu.bookbar.collector.dangdang.Top500Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','当当网',NULL,'2014-05-28 23:32:09'),(8,'软件工程/项目管理','http://bang.dangdang.com/books/bestsellers/01.54.10.00.00.00-recent30-0-0-1-1','com.enilu.bookbar.collector.dangdang.Top500Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','当当网',NULL,'2014-05-28 23:33:37'),(9,'中国当代小数','http://bang.dangdang.com/books/bestsellers/01.03.30.00.00.00-recent30-0-0-1-1','com.enilu.bookbar.collector.dangdang.Top500Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','当当网',NULL,'2014-05-28 23:34:01'),(10,'程序设计','http://bang.dangdang.com/books/bestsellers/01.54.06.00.00.00-recent30-0-0-1-1','com.enilu.bookbar.collector.dangdang.Top500Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','当当网',NULL,'2014-05-28 23:36:24'),(11,'年度畅销榜(计算机)','http://www.jd.com/booktop-1-4-3287-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:15:21'),(12,'日韩漫画','http://bang.dangdang.com/books/bestsellers/01.09.03.00.00.00-recent30-0-0-1-1','com.enilu.bookbar.collector.dangdang.Top500Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','当当网',NULL,'2014-05-28 23:37:59'),(13,'英文原版书1周销售榜','http://www.jd.com/booktop-2-4855-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:15:45'),(14,'管理图书近1周销售榜','http://www.jd.com/booktop-2-3266-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:16:06'),(15,'经济图书近1周销售榜','http://www.jd.com/booktop-2-3264-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:16:29'),(16,'金融与投资图书近1周销售榜','http://www.jd.com/booktop-2-3265-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:16:47'),(17,'旅游/地图图书近1周销售榜','http://www.jd.com/booktop-2-3271-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:17:08'),(18,'电子与通信图书近1周销售榜','http://www.jd.com/booktop-2-9351-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:17:28'),(19,'农业/林业图书近1周销售榜','http://www.jd.com/booktop-2-9368-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:17:47'),(20,'医学图书近1周销售榜','http://www.jd.com/booktop-2-3285-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:18:13'),(21,'法律图书近1周销售榜','http://www.jd.com/booktop-2-3277-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:18:44'),(22,'建筑图书近1周销售榜','http://www.jd.com/booktop-2-3284-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:19:07'),(23,'烹饪/美食图书','http://www.jd.com/booktop-2-9278-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:19:24'),(24,'家教与育儿','http://www.jd.com/booktop-2-3270-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:19:39'),(26,'科学与自然','http://www.jd.com/booktop-2-3286-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:20:08'),(27,'文学图书','http://www.jd.com/booktop-2-3259-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:20:42'),(28,'传记图书','http://www.jd.com/booktop-2-3261-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:21:18'),(29,'艺术图书','http://www.jd.com/booktop-2-3262-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:21:40'),(30,'少儿图书','http://www.jd.com/booktop-2-3263-1.html','com.enilu.bookbar.collector.jd.WeekTop100Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','京东商城',NULL,'2014-05-28 23:22:03'),(31,'投资指南','http://bang.dangdang.com/books/bestsellers/01.24.13.00.00.00-recent30-0-0-1-1','com.enilu.bookbar.collector.dangdang.Top500Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','当当网',NULL,'2014-05-28 23:39:47'),(32,'青春文学','http://bang.dangdang.com/books/bestsellers/01.01.00.00.00.00-recent30-0-0-1-1','com.enilu.bookbar.collector.dangdang.Top500Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','当当网',NULL,'2014-05-28 23:42:00'),(33,'小说','http://bang.dangdang.com/books/bestsellers/01.03.00.00.00.00-recent30-0-0-1-1','com.enilu.bookbar.collector.dangdang.Top500Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','当当网',NULL,'2014-05-28 23:44:19'),(34,'文学','http://bang.dangdang.com/books/bestsellers/01.05.00.00.00.00-recent30-0-0-1-1','com.enilu.bookbar.collector.dangdang.Top500Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','当当网',NULL,'2014-05-28 23:46:38'),(35,'孕产/胎教','http://bang.dangdang.com/books/bestsellers/01.06.00.00.00.00-recent30-0-0-1-1','com.enilu.bookbar.collector.dangdang.Top500Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','当当网',NULL,'2014-05-28 23:49:10'),(36,'艺术','http://bang.dangdang.com/books/bestsellers/01.07.00.00.00.00-recent30-0-0-1-1','com.enilu.bookbar.collector.dangdang.Top500Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','当当网',NULL,'2014-05-28 23:51:10'),(37,'管理','http://bang.dangdang.com/books/bestsellers/01.22.00.00.00.00-recent30-0-0-1-1','com.enilu.bookbar.collector.dangdang.Top500Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','当当网',NULL,'2014-05-28 23:53:40'),(38,'投资理财','http://bang.dangdang.com/books/bestsellers/01.24.00.00.00.00-recent30-0-0-1-1','com.enilu.bookbar.collector.dangdang.Top500Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','当当网',NULL,'2014-05-28 23:56:13'),(39,'经济','http://bang.dangdang.com/books/bestsellers/01.25.00.00.00.00-recent30-0-0-1-1','com.enilu.bookbar.collector.dangdang.Top500Collector','{\'name\':\'书名\',\'varchar1\':\'作者\',\'varchar2\':\'译者\',\'varchar3\':\'出版社\',\'varchar4\':\'排名\',\'varchar5\':\'ISBN号\',\'num1\':\'定价\',\'num2\':\'商城价\'}','当当网',NULL,'2014-05-28 23:58:47');
 

DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_type` tinyint(4) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 

DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(100) NOT NULL,
  `param_value` varchar(100) NOT NULL,
  `param_type` varchar(1) NOT NULL,
  `param_name` varchar(100) NOT NULL,
  `param_desc` varchar(255) DEFAULT NULL,
  `last_modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modify_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
