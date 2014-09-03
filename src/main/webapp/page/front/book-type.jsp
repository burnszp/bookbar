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
			<div class="col-md-12">
			<div class="dropdown">
								<button class="btn btn-primary dropdown-toggle"
									data-toggle="dropdown">
									${item.name}<span class="caret"></span>
								</button>
								<span class="dropdown-arrow dropdown-arrow-inverse"></span>
								<ul class="dropdown-menu dropdown-inverse">
								<c:forEach items="${typelist}" var="item">
						<li><a href="${ctx}/front/booklistbytype?itemid=${item.id}">${item.name}</a></li>
						 
					</c:forEach>
						 
								</ul>
							</div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>名称</th>
							<th>出版社</th>
							<th>作者</th>
							<th>譯者</th>
						</tr>
					</thead>
					<c:forEach items="${bookpage.list}" var="book">
						<tr>
							<td><a href="${book.url}" target="_blank">${book.name}</a></td>
							<td>${book.publisher}</td>
							<td>${book.author}</td>
							<td>${book.translator}</td>
						</tr>
					</c:forEach>
				</table>
				<div class="pagination" id="page" url="${ctx}/front/booklistbytype?itemid=${item.id}"></div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	var pageNumber = "${bookpage.pager.pageNumber}";
	var pageSize = "${bookpage.pager.pageSize}";
	var pageCount = "${bookpage.pager.pageCount}";
	seajs.use("front/js/book-type");
</script>
</html>
