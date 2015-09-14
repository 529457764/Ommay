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

<% String id = (String)session.getAttribute("accountName");
   String operateUserName = (String)session.getAttribute("operateUserName");%>

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
			<div class="col-xs-12 col-sm-10 col-md-10 col-lg-10" id="showBox" data-box="sa_register2">
				<div class="col-md-12 row">
					<div class="row">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">填写详细信息</h3>
							</div>
							<div class="panel-body">
								<form action="../check/UserMessage/complete" class="row col-md-6">
									<div class="form-group">
										<label for="account">账号名：</label> 
										<span><%=operateUserName %></span>
									        <input type="hidden" class="form-control" name="name" placeholder="账号" required="required" value="<%=operateUserName %>">							
									</div>
									<%--
									<div class="form-group">
										<label for="account">请输入账号名：</label> 
										<input type="text" name="name" class="form-control" required="required">
									</div>
									 --%>
									<div class="form-group">
										<label for="sex">性别：</label> 
										<select name="sex" id="sex"  class="form-control">
											<option value="1">男</option>
											<option value="2">女</option>
										</select>
									</div>
									<div class="form-group">
										<label for="identity">身份证号码：</label> 
										<input type="text" name="identity" class="form-control" required="required">
									</div>
									<div class="form-group">
										<label for="telephone">手机号码：</label> 
										<input type="text" name="iphone" class="form-control" required="required">
									</div>
									<div class="form-group">
										<label for="account">家庭电话</label> 
										<input type="text" name="areaNum" required="required">--<input type="text" name="phoneNum" required="required">
									</div>
									<div class="form-group">
										<label for="email">邮箱：</label> 
										<input type="email" name="email" class="form-control" required="required">
									</div>
									<div class="form-group">
										<label for="address">联系地址：</label> 
										<input type="text" name="address" class="form-control" required="required">
									</div>
									<div class="form-group">
										<label for="company">所属公司：</label> 
										<input type="text" name="company" class="form-control" required="required">
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-primary">提交</button>
										<button type="reset" class="btn btn-danger">取消</button>
									</div>
								</form>
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