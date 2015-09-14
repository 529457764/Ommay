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
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span><%=id%></span>业务员<b class="caret"></b></a>
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
			<div class="col-xs-12 col-sm-10 col-md-10 col-lg-10" id="showBox" data-box="sa_projectDetail">
				<div class="row col-md-12">
					<div class="row col-md-12">
						<h4>项目内容</h4>
					</div>
					<div class="row btn-row">
						<div class="col-md-6">
							<a class="link-btn" href="<%=path%>/project/workerGetSingleProjectById?id=${project.uidProject}" data-url="sa_projectDetail"><button type="button" class="btn btn-primary">基本信息</button></a>
							<a class="link-btn" href="<%=path%>/project/workerGetSuitDetail?id=${project.uidProject}" data-url="sa_testSuitDetail"><button type="button" class="btn btn-default">体检套餐</button></a>
							<%-- <a class="link-btn" href="javascript:void(0);" data-url=""><button type="button" class="btn btn-default">项目合同</button></a>--%>
						</div>
						<div class="col-md-6 state-row">
							项目状态：<span>项目登记</span>
						</div>
					</div>
					<form action="#" class="form col-md-12">
						<div class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">项目信息</h3>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="form-group col-md-3 fl">
											<label for="createDate">立项时间：</label> 
											<span class="createDate">${project.timeBegin}</span>
										</div>
										<div class="form-group col-md-3 fl">
											<label for="uidProject">项目编码：</label>
											<span class="uidProject">${project.uidProject}</span>
										</div>
										<div class="form-group col-md-6 fl">
											<label for="clientName">公司名称：</label>
											<span class="clientName">${project.clientName}</span>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="row">
										<div class="form-group col-md-8">
											<label for="addressGroup">公司地址：</label> 
											<span class="addressGroup">${project.addressGroup}</span>
										</div>
										<div class="form-group col-md-4">
											<label for="peopleNumber">体检人数范围：</label> 
											<span class="peopleNumber">${project.peopleNumber}</span><span>人左右</span>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-5">
											<label for="timeBegin">项目起始时间：</label> 
											<span class="timeBegin">${project.timeBegin}</span>
											</select>
										</div>
										<div class="form-group col-md-5">
											<label for="timeEnd">项目结束时间：</label>
											<span class="timeEnd">${project.timeEnd}</span> 
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">客户代表</h3>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="form-group col-md-4">
											<label for="nameMaster">姓名：</label> 
											<span class="nameMaster">${accountGroup.nameMaster}</span>
										</div>
										<div class="form-group col-md-4">
											<label for="phoneMaster">手机：</label>
											<span class="phoneMaster">${accountGroup.phoneMaster}</span>
										</div>
										<div class="form-group col-md-4">
											<label for="workingPhoneMaster">办公电话：</label>
											<span class="workingPhoneMaster">${accountGroup.phoneMaster}</span>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-4">
											<label for="emailGroup">邮箱：</label> 
											<span class="emailGroup">${accountGroup.emailGroup}</span>
										</div>
										<div class="form-group col-md-8">
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-3">
											<label for="nameWorker">业务员</label> 
											<span class="nameWorker">${project.projectBuilder}</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="row">
										<div class="form-group col-md-3">
											<label for="nameWorker">业务员</label> 
											<span class="nameWorker">${project.projectBuilder}</span>
										</div>
										<div class="form-group col-md-3">
											<button type="button" class="btn btn-sm btn-success">请求审核</button>
										</div>
										<div class="form-group col-md-6">
											<label for="status">状态：</label>
											<span>${project.status}</span><b>&nbsp;&nbsp;&nbsp;</b>
											<span>${project.timeBegin}</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<footer>
		
	</footer>
</body>
</html>