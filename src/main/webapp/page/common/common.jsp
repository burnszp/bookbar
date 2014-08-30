<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="taglibs.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Loading Bootstrap -->
<link href="${ctx}/resource/flat-ui/2.1.3/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link href="${ctx}/resource/flat-ui/2.1.3/bootstrap/css/prettify.css"
	rel="stylesheet">

<!-- Loading Flat UI -->
<link href="${ctx}/resource/flat-ui/2.1.3/css/flat-ui.css"
	rel="stylesheet">
<link href="${ctx}/resource/flat-ui/2.1.3/css/docs.css" rel="stylesheet">

<link rel="shortcut icon"
	href="${ctx}/resource/flat-ui/2.1.3/images/favicon.ico">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body>

	<nav class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-collapse-01">
				<span class="sr-only"></span>
			</button>
			<a class="navbar-brand" href="/${ctx}">书吧</a>
		</div>
		<div class="collapse navbar-collapse" id="navbar-collapse-01">
			<ul class="nav navbar-nav">
				<li flag="index"><a href="/${ctx}">新书推荐</a></li>
				<li flag="type"><a href="${ctx}/front/book-type">分类</a></li>
				<li flag="my"><a href="#">我的书架</a></li>
				<li flag="admin"><a href="${ctx}/admin/collector-list">后台管理</a></li>
			</ul>
			<form class="navbar-form navbar-right" action="#" role="search">
				<div class="form-group">
					<div class="input-group">
						<input class="form-control" id="navbarInput-01" type="search"
							placeholder="查找新书"> <span class="input-group-btn">
							<button type="submit" class="btn">
								<span class="fui-search"></span>
							</button>
						</span>
					</div>
				</div>
			</form>
		</div>
		<!-- /.navbar-collapse -->
	</nav>
	<!-- /navbar -->

	<!-- Load JS here for greater good =============================-->
	<script src="${ctx}/resource/seajs/2.2.0/sea-debug.js"></script>
	<script type="text/javascript">
		// Set configuration
		seajs.config({
			base : "${ctx}/resource/",
			alias : {
				"jquery" : "flat-ui/2.1.3/js/jquery-1.10.2.min.js",
				 "jquery-ui":"flat-ui/2.1.3/js/jquery-ui-1.10.3.custom.min.js",
				 "juqery-ui_touch":"flat-ui/2.1.3/js/jquery.ui.touch-punch.min.js",
				 "bootstrap":"flat-ui/2.1.3/js/bootstrap.min.js",
				 "bootstra-select":"flat-ui/2.1.3/js/bootstrap-select.js",
				 "jquery-tagsinput":"flat-ui/2.1.3/js/jquery.tagsinput.js",
				 "jquery-placeholder":"flat-ui/2.1.3/js/jquery.placeholder.js",
			 
			}
		});
		 
		// 加载入口模块
		seajs.use("${ctx}/resource/js/common"); 
	</script>
	<!-- 类似百度搜索的自动完成autocomplete库 
    <script src="${ctx}/resource/flat-ui/2.1.3/js/typeahead.js"></script>
    -->
	<!--语法高亮库
    <script src="${ctx}/resource/flat-ui/2.1.3/bootstrap/js/google-code-prettify/prettify.js"></script>
    
	<script src="${ctx}/resource/flat-ui/2.1.3/js/application.js"></script> -->
	  
</body>
</html>
