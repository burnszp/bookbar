#bookbar 书吧

* 初步做成一个聚合网站，聚合各种网上书店的书籍信息，
	* 书籍的基本信息包括：书名，作者，出版社，价格；另外扩展的可以包括，书籍的热度，评论
	* 通过基本信息统计书籍的购买指数，购买趋势，流行程度
* 通过分类，关键字等提供快速的检索功能。 

#要解决的问题：

* 通过聚合网上书籍相关销售量，点击量，评论等信息降低用户找书的难度。

	
#主要技术：

* 使用[nutz](<https://github.com/nutzam/nutz>)做基本的技术框架，主要用了NutzDao和NutzMVC
* 使用[jsoup](<http://jsoup.org/>)负责进行信息抓取
* 使用jetty做为内置服务器	
* 前台使用[flat-ui](<http://www.bootcss.com/p/flat-ui/>)做界面框架，使用[seajs](<http://seajs.org/docs/>)组织js代码

#快速使用：

* 在mysql中建立bookbar库，将mysql.sql导入到该库中
* 更改ioc.js中数据库配置
* 运行BootStrap.java启动项目，访问地址：http://localhost:8080	
 	

#效果截图

首页：
##![](img/1.png?raw=true)
分类浏览：
##![](img/2.png?raw=true)
后台管理：
##![](img/3.png?raw=true)


#交流、反馈和建议

* QQ：82552623@qq.com
* 或者在这里[回复](<http://hi.baidu.com/enilu/item/af5e803d3d97a5179dc65e69>)

