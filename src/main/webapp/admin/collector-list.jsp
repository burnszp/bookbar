<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html lang="cn">
<head>
<meta charset="utf-8">
<title>nlpChina 有组织无纪律</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width">
</head>
<body>
	<div class="main">
		<c:forEach items="${obj}" var="item">
			<a href="${item.url}" target="_blank">${item.name}</a>&nbsp;&nbsp;&nbsp;${item.collector}<br>
		</c:forEach>
	</div>
	 
</body>
</html>