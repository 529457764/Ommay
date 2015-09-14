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
    <script type="text/javascript">
		$(function () {
			/*
			var $linkBtn = $(".link-btn");
			$linkBtn.bind("click", function() {
				var linkUrl = $(this).attr("data-url");
				$("#showBox").empty();
				$("#showBox").load("<%=path %>/jsp/salesman/"+ linkUrl +".jsp");
			});
			*/
			$beginYear = $("#beginYear");
			$beginMonth = $("#beginMonth");
			$beginDay = $("#beginDay");
			$endYear = $("#endYear");
			$endMonth = $("#endMonth");
			$endDay = $("#endDay");
			
			$beginYear.change(function() {
				calendar($beginYear, $beginMonth, $beginDay);
			});
			$beginMonth.change(function() {
				calendar($beginYear, $beginMonth, $beginDay);
			});
			$endYear.change(function() {
				calendar($endYear, $endMonth, $endDay);
			});
			$endMonth.change(function() {
				calendar($endYear, $endMonth, $endDay);
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
			<div class="col-xs-12 col-sm-10 col-md-10 col-lg-10" id="showBox" data-box="sa_newProject">	
				<div class="row col-md-12">
					<div class="row col-md-12">
						<h4>新建项目</h4>
					</div>
					<div class="row btn-row">
						<div class="col-md-6">
							<a class="link-btn" href="<%=path%>/view/sa_newProject" data-url="sa_newProject"><button type="button" class="btn btn-primary">基本信息</button></a>
							<a class="link-btn" href="<%=path%>/project/sa_testSuit_merge" data-url="sa_testSuit"><button type="button" class="btn btn-default">体检套餐</button></a>
							<%-- <a class="link-btn" href="javascript:void(0);" data-url=""><button type="button" class="btn btn-default">项目合同</button></a>--%>
						</div>
						<div class="col-md-6 state-row">
							项目状态：<span>项目登记</span>
						</div>
					</div>
					<form:form  commandName="projectForm" action="../account/newProject" method="post" cssClass="form col-md-12">
						<div class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">项目信息</h3>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="form-group col-md-3 fl">
											<label for="createDate">立项时间：</label> 
											<span class="createDate">${projectForm.createDate}</span>
										</div>
										<div class="form-group col-md-3 fl">
											<label for="uidProject">项目编码：</label>
											<span class="uidProject">${projectForm.uidProject}</span>
										</div>
										<div class="form-group col-md-6 fl">
											<label for="clientName">公司名称：</label> 
											<input type="text"
												value="${projectForm.clientName}" name="clientName" required="required">
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="row">
										<div class="form-group col-md-8">
											<label for="addressGroup">公司地址：</label> 
											<input type="text"
												value="${projectForm.addressGroup}" name="addressGroup" style="width:80%" required="required">
										</div>
										<div class="form-group col-md-4">
											<label for="peopleNumber">体检人数范围：</label> 
											<select
												name="peopleNumber">
												<option value="100">100</option>
												<option value="200">200</option>
												<option value="300">300</option>
												<option value="500">500</option>
											</select>
											<span>左右</span>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-5">
											<label for="timeBegin">项目起始时间：</label> 
											<select name="beginYear" id="beginYear">
												<% for(int i=2000; i<=2040; i++) { %>
													<option value="<%=i%>"><%=i%>年</option>
												<% } %>
											</select> 
											<select name="beginMonth" id="beginMonth">
												<% for(int i=1; i<=12; i++) { %>
													<option value="<%=i%>"><%=i%>月</option>
												<% } %>
											</select> 
											<select name="beginDay" id="beginDay">
												<% for(int i=1; i<=30; i++) { %>
													<option value="<%=i%>"><%=i%>日</option>
												<% } %>
											</select>
										</div>
										<div class="form-group col-md-5">
											<label for="timeEnd">项目结束时间：</label> 
											<select name="endYear" id="endYear">
												<% for(int i=2000; i<=2040; i++) { %>
													<option value="<%=i%>"><%=i%>年</option>
												<% } %>
											</select> 
											<select name="endMonth" id="endMonth">
												<% for(int i=1; i<=12; i++) { %>
													<option value="<%=i%>"><%=i%>月</option>
												<% } %>
											</select> 
											<select name="endDay" id="endDay">
												<% for(int i=1; i<=31; i++) { %>
													<option value="<%=i%>"><%=i%>日</option>
												<% } %>
											</select>
										</div>
									</div>
									<!--
									<div class="row">
										<div class="form-group col-md-12">
											<label for="projectIntroduce">项目简介：</label>
											<textarea cols="" rows="5" name="projectIntroduce"
												class="form-control"></textarea>
										</div>
									</div>
									-->
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
											<input type="text"
												value="${projectForm.nameMaster}" name="nameMaster" required="required">
										</div>
										<div class="form-group col-md-4">
											<label for="phoneMaster">手机：</label> 
											<input type="text"
												value="${projectForm.phoneMaster}" name="phoneMaster" required="required">
										</div>
										<div class="form-group col-md-4">
											<label for="workingPhoneMaster">办公电话：</label> 
											<input type="text"
												value="${projectForm.areaNumber}" name="areaNumber" style="width:15%" required="required">- <input
												type="text" value="${projectForm.phoneNumber}" name="phoneNumber" style="width:40%" required="required">
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-4">
											<label for="emailGroup">邮箱：</label> 
											<input type="email"
												value="${projectForm.emailGroup}" name="emailGroup" required="required">
										</div>
										<div class="form-group col-md-9">
											<!-- <label for="connectAddress">联系地址：</label> 
											<input type="text"
												value="四川省成都市高新区尚锦路104号1221室（人资部）" name="connectAddress"
												style="width:86%"> -->
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-3">
											<label for="nameWorker">业务员</label> 
											<span><%=id %></span>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-3 tr fr">
											<button type="submit" class="btn btn-sm btn-primary">保存</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</section>
	<footer>
		
	</footer>
</body>
</html>