<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>客户代表首页</title>
    <script type="text/javascript" src="<%=path %>/resource/jquery/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=path %>/resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/resource/css/main1.css">
    <script type="text/javascript" src="<%=path%>/resource/js/calendar.js"></script>
<script type="text/javascript" src="<%=path %>/resource/js/showPage.js"></script>
    
</head>
<body>
	<header class="header">
		<nav class="navbar navbar-default" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-navbar-collapse">
						<span class="sr-only">
							Toggle navigation
						</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">安生美</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-navbar-collapse">
					<ul class="nav navbar-nav">

					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span>xxx</span>客户代表<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="<%=path%>">注销</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<section class="container">
		<div class="row">
			<!-- 左侧目录 -->
			<div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
				<ul class="list-group">
					<a href="<%=path%>/view/re_userCenter" data-url="re_userCenter" class="list-group-item">用户中心</a>
					<a href="<%=path%>/view/re_testAppointment" data-url="re_testAppointment" class="list-group-item">体检预约</a>
					<a href="<%=path%>/view/re_checkResult" data-url="re_checkResult" class="list-group-item">查看体检结果</a>
				</ul>
			</div>
			<!-- 右侧主要内容 -->
			<div class="col-xs-12 col-sm-10 col-md-10 col-lg-10" id="showBox">
				<div class="row col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4>体检结果报告</h4>
						</div>
						<div class="panel-body">
							<div class="row col-md-12 tc">
								<h3><span>中粮集团</span><b>&nbsp;&nbsp;&nbsp;</b><span>第1次体检结果报告</span></h3>
							</div>
							<table class="table table-bordered col-md-12">
								<thead class="success">
									<tr>
										<th>项目编号</th>
										<th>体检名称</th>
										<th>预约体检人数</th>
										<th>实际体检人数</th>
										<th>复检人数</th>
										<th>导出详细体检报告</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>TD00010201</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<% for (int i=0; i<8; i++) { %>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									<% } %>
								</tbody>
							</table>
							<div class="row col-md-12 tr fr">
								<button class="btn btn-sm btn-default">下载缺检名单</button>
								<button class="btn btn-sm btn-default">下载完整报告</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
	<footer>
		
	</footer>
</body>
</html>