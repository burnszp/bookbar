<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>首页</title>
</head>
<body flag="admin">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
			<ol class="breadcrumb">
  <li><a href="/${ctx}">主页</a></li>
  <li><a href="/${ctx}/admin/collector-list">后台管理</a></li>
  <li class="active">采集器</li>
  <div style="float:right;margin-top:-6px;">
						<select name="info" class="mbn" style="display: none;">
							<optgroup label="">
								<option value="0" selected="selected">采集器</option>
								<option value="1">書籍</option>
								<option value="1">類別</option>
							</optgroup>
							<optgroup label="">
								<option value="2">用戶</option>
								<option value="3">評論</option>
								<option value="4" class="highlighted">退出</option>
							</optgroup>
						</select>
					</div>
  
</ol>

			</div>
			</div>
		<br>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div style="display: inline;">
							采集器列表
						</div>
						<div style="display: inline; float: right;margin-top:-5px;">
							<div class="dropdown">
								<button class="btn btn-primary dropdown-toggle"
									data-toggle="dropdown">
									操作<span class="caret"></span>
								</button>
								<span class="dropdown-arrow dropdown-arrow-inverse"></span>
								<ul class="dropdown-menu dropdown-inverse">
									<li><a href="#fakelink">新增</a></li>
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
								</tr>
							</thead>
							<c:forEach items="${obj}" var="item">
								<tr>
									<td><a href="${item.url}" target="_blank">${item.name}</a></td>
									<td>${item.collector}</td>

								</tr>
							</c:forEach>
						</table>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>
