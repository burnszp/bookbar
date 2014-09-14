<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>采集器管理</title>
</head>
<body flag="admin">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<ol class="breadcrumb">
					<li><a href="/${ctx}">主页</a></li>
					<li><a href="/${ctx}/admin/collector-list">后台管理</a></li>
					<li class="active">采集器</li>
					<div class="alert alert-success" id="tooltip" role="alert" style="float:right;margin-top:-5px;height:40px;padding:5px;display:none">采集中......</div>
					 
					

				</ol>

			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div style="display: inline;">采集器列表</div>
						<div style="display: inline; float: right; margin-top: -5px;">
							<div class="dropdown">
								<button class="btn btn-primary dropdown-toggle"
									data-toggle="dropdown">
									操作<span class="caret"></span>
								</button>
								<span class="dropdown-arrow dropdown-arrow-inverse"></span>
								<ul class="dropdown-menu dropdown-inverse">
									<li><a href="#" id="collectAll">采集全部</a></li>
									<li><a href="${ctx}/admin/collectoredit">新增</a></li>
									<li><a href="#fakelink">編輯</a></li>
									<li><a href="#fakelink">刪除</a></li>
								</ul>
							</div>
						</div>
					</div>

					<div class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>名称</th>
									<th>采集器</th>
									<th>采集时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<c:forEach items="${page.list}" var="item">
								<tr>
									<td><a href="${item.url}" target="_blank">${item.website}-${item.name}</a></td>
									<td>${item.collector}</td>
									<td><fmt:formatDate value="${item.updateTime}" pattern="yyyy-MM-dd hh:MM:ss"/></td>
									<td><a href="#" class="collectorOne" itemid="${item.id}">采集</a></td>
									
								</tr>
							</c:forEach>
						</table>
						<div class="pagination" id="page"></div>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
var pageNumber = "${page.pager.pageNumber}";
var pageSize = "${page.pager.pageSize}";
var pageCount = "${page.pager.pageCount}";
	seajs.use("admin/js/collector-list");
</script>

</html>
