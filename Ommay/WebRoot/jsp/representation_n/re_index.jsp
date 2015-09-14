<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

HashMap map = (HashMap)request.getAttribute("user");
String success = (String)request.getAttribute("submitAppointmentsuccess");
if(session.getAttribute("accountName")==null)
	response.sendRedirect(basePath);
if(map==null && success==null){
	response.sendRedirect(basePath+"representation");
	return;
}

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
    <script type="text/javascript" src="<%=path %>/resource/js/public.js"></script>
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
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span><%=map.get("namemaster")%></span>客户代表<b class="caret"></b></a>
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

					<a href="<%=path%>/representation/re_userCenter" data-url="re_userCenter" class="list-group-item">用户中心</a>
					<a href="<%=path%>/representation/re_testAppointment" data-url="re_testAppointment" class="list-group-item">体检预约</a>
					<a href="<%=path%>/representation/re_checkResult" data-url="re_checkResult" class="list-group-item">查看体检结果</a>

				</ul>
			</div>
			<!-- 右侧主要内容 -->
			<div class="col-xs-12 col-sm-10 col-md-10 col-lg-10" id="showBox">

			</div>
		</div>
	</section>
	<footer>
		
	</footer>
	
<%  //load the subjsp according to the flag
	if(success != null){
		System.out.println(success);
%>
	<script>
	AlertMes.MesSuccess("提交成功！");	
		$(function(){
		var $li_item = $(".list-group-item");
		var $showBox = $("#showBox");
	   	loadPage($(this),$showBox,"<%=basePath%>vip/vi_checkResult");	   			
	});	
    </script>
<%	
	}else{
	}	
%>
	
	
</body>
</html>