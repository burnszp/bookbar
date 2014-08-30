<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>分类导航</title>
</head>
<body flag="type">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3">
				<ul class="demo-sidebar hide-on-tablets" style="margin:53 0">
				<c:forEach items="${typelist}" var="item">
				<li><a href="${ctx}/front/booklistbytype?itemid=${item.id}">${item.name}</a></li>
				</c:forEach>
				</ul>
			</div>
			<div class="col-md-9">
			<table class="table table-hover">
							<thead>
								<tr>
									<th>名称</th>
									<th>出版社</th>
									<th>作者</th>
									<th>譯者</th>
								</tr>
							</thead>
							<c:forEach items="${booklist}" var="book">
								<tr>
									<td><a href="${book.url}" target="_blank">${book.name}</a></td>
									<td>${book.publisher}</td>
									<td>${book.author}</td>
									<td>${book.translator}</td>
								</tr>
							</c:forEach>
						</table>
			</div>
		</div>
	</div>

</body>

</html>
