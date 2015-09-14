
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
    <title>业务员首页</title>
    <script type="text/javascript" src="<%=path %>/resource/jquery/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=path %>/resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/resource/css/main1.css">
    <script type="text/javascript" src="<%=path %>/resource/js/showPage.js"></script>
    <script type="text/javascript" src="<%=path%>/resource/js/calendar.js"></script>

    <script>
	$(function(){
		var $li_item = $(".list-group-item");
		var $showBox = $("#showBox");
	  	$li_item.bind("click", function() {
	   		//showPage($(this), $showBox, "<%=path%>/salesman/", "");//由于团队预约和会员预约都要绕到我的Controller先，所以路径被改了
	   		display($(this), $showBox);
	  	});
	});
    </script>
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
								<li><a href="#">注销</a></li>
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
					<a href="javascript:void(0);" data-url="sa_groupProject" class="list-group-item">团体项目</a>
					<a href="javascript:void(0);" data-url="sa_myGroupProject" class="list-group-item">我的团体项目</a>
					<a href="javascript:void(0);" data-url="sa_vipProject" class="list-group-item">会员项目</a>
					<a href="javascript:void(0);" data-url="sa_myVipProject" class="list-group-item">我的会员项目</a>
					<a href="javascript:void(0);" data-url="http://localhost:8080/Ommay/account/project" class="list-group-item">新建项目</a>
					<a href="javascript:void(0);" data-url="sa_newVip" class="list-group-item">注册会员</a>
					<a href="javascript:void(0);" data-url="sa_groupAppointment" class="list-group-item" id="sa_groupAppointment">团体体检预约</a><!-- Doson's Module -->
					<a href="javascript:void(0);" data-url="sa_vipAppointment" class="list-group-item" id="sa_vipAppointment" >个人体检预约</a><!-- Doson's Module -->
					<a href="javascript:void(0);" data-url="sa_userCenter" class="list-group-item">用户中心</a>
				</ul>
			</div>
			<!-- 右侧主要内容 -->
			<div class="col-xs-12 col-sm-10 col-md-10 col-lg-10" id="showBox">
			</div>
		</div>
	</section>
	<footer>
		
	</footer>
</body>
</html>