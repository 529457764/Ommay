<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="c.tld" prefix="c" %>
<%@ taglib uri="fmt.tld" prefix="fmt" %>
<%@ taglib uri="fn.tld" prefix="fn" %>
<%@ taglib uri="sql.tld" prefix="sql" %>
<%@ taglib uri="x.tld" prefix="x" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% String id = (String)session.getAttribute("accountName"); %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>业务员首页</title>
    <script type="text/javascript" src="<%=path %>/resource/jquery/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=path %>/resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/resource/css/main1.css">
    <script type="text/javascript" src="<%=path %>/resource/js/showPage.js"></script>
    <script type="text/javascript" src="<%=path%>/resource/js/calendar.js"></script>
    
<style type="text/css">
	.label1, .label2, .label3, .label5 {
		width: 20%;
	}
	.label4 {
		width: 25%;
	}
	.label5 {
		width: 25%;
	}
	.total-money-row {
		margin-bottom: 20px;
	}
	.total-money {
		color: red;
		text-decoration: underline;
	}

</style>
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
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span>xxx</span>业务员<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="../account/logOff">注销</a></li>
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
<%--
				<ul class="list-group">
					<a href="<%=path%>/view/sa_groupProject" data-url="sa_groupProject" class="list-group-item">团体项目</a>
					<a href="<%=path%>/view/sa_myGroupProject" data-url="sa_myGroupProject" class="list-group-item">我的团体项目</a>
					<a href="<%=path%>/view/sa_vipProject" data-url="sa_vipProject" class="list-group-item">会员项目</a>
					<a href="<%=path%>/view/sa_myVipProject" data-url="sa_myVipProject" class="list-group-item">我的会员项目</a>
					<a href="<%=path%>/view/sa_newProject" data-url="sa_newProject" class="list-group-item">新建项目</a>
					<a href="<%=path%>/view/sa_VipManage" data-url="sa_VipManage" class="list-group-item">管理用户</a>
					<a href="<%=path%>/salesman/sa_groupAppointment" data-url="sa_groupAppointment" class="list-group-item">团体体检预约</a>
					<a href="<%=path%>/salesman/sa_vipAppointment" data-url="sa_vipAppointment" class="list-group-item">个人体检预约</a>

					<a href="<%=path%>/view/sa_userCenter" data-url="sa_userCenter" class="list-group-item">用户中心</a>
				</ul>
				 --%>
				<%@ include file="sa_list.jsp" %>
			</div>
			<!-- 右侧主要内容 -->
			<div class="col-xs-12 col-sm-10 col-md-10 col-lg-10" id="showBox" data-box="sa_vipAppointmentDetail">
				<div class="row col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="tc"><span>何小萌</span><b>&nbsp;&nbsp;&nbsp;</b><span>第2次体检预约</span></h4>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-2 label1">
									<label for="">会员编号：</label>
									<span>HY000001</span>
								</div>
								<div class="col-md-2 label2">
									<label for="">会员姓名：</label>
									<span>何小萌</span>
								</div>
								<div class="col-md-2 label3">
									<label for="">业务员：</label>
									<span>司徒靖</span>
								</div>
								<div class="col-md-2 label4">
									<label for="">预约时间：</label>
									<span>2015年8月2日</span>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3 label5">
									<label for="">预约号：</label>
									<span>HY201508001</span>
								</div>
								<div class="col-md-5 label6">
									<label for="">预约体检时间：</label>
									<span>2015年8月7日上午</span>
								</div>
								<div class="col-md-2 label7">
									<label for="">已选套餐：</label>
									<span>4个</span>
								</div>
							</div>
							<table class="table table-bordered col-md-12">
								<thead>
									<tr class="success">
										<th>套餐编号</th>
										<th>套餐名</th>
										<th>套餐单价</th>
										<th>体检人数</th>
										<th>合计</th>
										<th>体检名单</th>
									</tr>
								</thead>
								<tbody>
									<% for (int i=1; i<=5; i++) { %>
										<tr>
											<td><%=i%></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>		
									<%	} %>
								</tbody>
							</table>
							<div class="row col-md-12 tr fr total-money-row">
								<span class="total-money">体检总价：530000</span>
							</div>
							<table class="table table-bordered col-md-12">
								<thead>
									<tr class="success">
										<th>时间</th>
										<th>状态</th>
										<th>操作人员</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>2015年8月2日</td>
										<td>提交预约</td>
										<td>上官清明</td>
									</tr>
									<tr>
										<td>2015年8月2日</td>
										<td>确定预约</td>
										<td>李世明</td>
									</tr>
								</tbody>
							</table>
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