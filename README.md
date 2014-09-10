bookbar 书吧
=============================================
	1，初步做成一个聚合网站，聚合各种网上书店的书籍信息，
		1.2，书籍的基本信息包括：书名，作者，出版社，价格；另外扩展的可以包括，书籍的热度，评论
		1.2，通过基本信息统计书籍的购买指数，购买趋势，流行程度
	2，通过分类，关键字等提供快速的检索功能。 

要解决的问题：
-----------------
	1，通过聚合网上书籍相关销售量，点击量，评论等信息降低用户找书的难度。

	
主要技术：
-----------------
	1，nutz，使用nutz做基本的框架，用作dao，mvc
	2，jsoup，使用jsoup负责进行信息抓取
	3，使用jetty做为内置服务器	
	4，后期通过lucene提供书籍的快速搜索功能

快速使用：
-----------------
	1，在mysql中建立bookbar库，将mysql.sql导入到该库中
	2，更改ioc.js中数据库配置
	3，运行BootStrap.java启动项目，访问地址：http://localhost:8080	
 	

效果截图
-----------------
首页：
##![](img/1.png?raw=true)
分类浏览：
##![](img/2.png?raw=true)
后台管理：
##![](img/3.png?raw=true)


交流、反馈和建议
---------------
		QQ：82552623@qq.com


