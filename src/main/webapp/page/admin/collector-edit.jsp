<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>编辑采集器</title>
</head>
<body flag="admin">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<ol class="breadcrumb">
					<li><a href="/${ctx}">主页</a></li>
					<li><a href="/${ctx}/admin/collector-list">后台管理</a></li>
					<li class="active">采集器-编辑</li>
					<div class="alert alert-success" id="tooltip" role="alert" style="float:right;margin-top:-5px;height:40px;padding:5px;display:none">采集中......</div>
					 
					

				</ol>

			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div style="display: inline;">编辑</div>
						 
					</div>

					<div class="panel-body">
						<form action="${ctx}/admin/collectorsave" method="post">
 							<div class="form-group">
										<label class="col-md-3 control-label">网站</label>
										<div class="col-md-9">
											<select class="form-control">
												<option> 当当网</option>
												<option>京东</option>
												<option>亚马逊</option>
											</select>
										</div>
									</div>
 							<div class="form-group">
										<label class="col-md-3 control-label">名称</label>
										<div class="col-md-9">
											<input type="text" class="form-control" placeholder="Enter text">
										</div>
									</div>
									
									
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	seajs.use("admin/js/collector-edit");
</script>

</html>
