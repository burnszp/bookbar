<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="page/common/common.jsp"%>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>bookbar书吧欢迎您</title>
</head>
<body flag="index">
	<div class="container-fluid">
		<c:forEach items="${list}" var="book" varStatus="status">
			<c:if test="${status.count % 4 == 0}">
				<div class="row">
			</c:if>

			<div class="col-md-3">
				<div class="tile">
					<a href="${book.url}" target="_blank"><img
						class="tile-image big-illustration" title="${book.name}"
						src="${ctx}/index/img?img=${book.img}"></a>
					<h3 class="tile-title">
						<c:choose>
							<c:when test="${book.name.length()>8}">
							${fn:substring(book.name,0,8)}... 
						</c:when>
							<c:otherwise>
							${book.name}
						</c:otherwise>
						</c:choose>
					</h3>
					<p>
						<small>${book.publisher}&nbsp;&nbsp;<strong>${book.author}</strong><br>评论数:<strong><fmt:formatNumber
									value="${book.commentCount}" pattern="#,#00" /></strong></small>
					</p>
					<a class="btn btn-primary btn-large btn-block" target="_blank"
						href="${book.url}">查看</a>
				</div>
			</div>
			<c:if test="${status.count % 4 == 0}">
	</div>
	</c:if>
	</c:forEach>
	<!-- 
  <div class="row">
        <div class="col-md-3">
          <div class="tile">
            <img class="tile-image big-illustration" alt="" src="${ctx}/resource/flat-ui/2.1.3/images/illustrations/compass.png">
            <h3 class="tile-title">Web Oriented</h3>
            <p>100% convertable to HTML/CSS</p>
            <a class="btn btn-primary btn-large btn-block" href="#">查看</a>
          </div>
        </div>

        <div class="col-md-3">
          <div class="tile">
            <img class="tile-image" alt="" src="${ctx}/resource/flat-ui/2.1.3/images/illustrations/infinity.png">
            <h3 class="tile-title">Easy to Customize</h3>
            <p>Vector-based shapes and minimum.</p>
            <a class="btn btn-primary btn-large btn-block" href="#">查看</a>
          </div>
        </div>

        <div class="col-md-3">
          <div class="tile">
            <img class="tile-image" alt="" src="${ctx}/resource/flat-ui/2.1.3/images/illustrations/colors.png">
            <h3 class="tile-title">Color Swatches</h3>
            <p>Easy to add or change elements. </p>
            <a class="btn btn-primary btn-large btn-block" href="#">查看</a>
          </div>
        </div>

        <div class="col-md-3">
          <div class="tile tile-hot">
            <img class="tile-image big-illustration" alt="" src="${ctx}/resource/flat-ui/2.1.3/images/illustrations/share.png">
            <h3 class="tile-title">Free for Share</h3>
            <p>Your likes, shares and comments</p>
            <a class="btn btn-primary btn-large btn-block" href="#">查看</a>
          </div>

        </div>
      </div>
       -->
	</div>
</body>
</html>
