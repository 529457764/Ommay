<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="c.tld" prefix="c" %>
<%@ taglib uri="fmt.tld" prefix="fmt" %>
<%@ taglib uri="fn.tld" prefix="fn" %>
<%@ taglib uri="sql.tld" prefix="sql" %>
<%@ taglib uri="x.tld" prefix="x" %>
<% String id = (String)session.getAttribute("accountName"); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>部门经理首页</title>
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
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span><%=id%></span>经理<b class="caret"></b></a>
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
					<a href="<%=path%>/project/managerGetAllGroupProject"
						data-url="ma_groupProject" class="list-group-item">团体项目</a>
					<a href="<%=path%>/project/managerGetOwnerProject?id=<%=id %>"
						data-url="ma_myGroupProject" class="list-group-item">我的团体项目</a>
					<a href="<%=path%>/project/managerGetAllVipProject"
						data-url="ma_vipProject" class="list-group-item">会员项目</a>
					<a href="<%=path%>/view/ma_myVipProject" data-url="ma_myVipProject"
						class="list-group-item">我的会员项目</a>
					<a href="<%=path%>/view/ma_groupAppointment"
						data-url="ma_groupAppointment" class="list-group-item">团体体检预约</a>
					<a href="<%=path%>/view/ma_salesmanManage"
						data-url="ma_salesmanManage" class="list-group-item">业务员管理</a>
					<a href="<%=path%>/view/ma_userCenter" data-url="ma_userCenter"
						class="list-group-item">用户中心</a>
				</ul>
				 --%>
				 <%@ include file="ma_list.jsp" %>
			</div>
			<!-- 右侧主要内容 -->
			<div class="col-xs-12 col-sm-10 col-md-10 col-lg-10" id="showBox" data-box="ma_checkProject">
				<div class="row col-md-12">
					<div class="row col-md-12">
						<h4>项目内容</h4>
					</div>
					<div class="row btn-row">
						<div class="col-md-6">
							<a class="link-btn" href="<%=path%>/project/managerFinishGroupProjectReview?uidProject=${project.uidProject}" data-url="sa_projectDetail"><button type="button" class="btn btn-primary">基本信息</button></a>
							<a class="link-btn" href="<%=path%>/project/managerFinishGroupContractReview?uidProject=${project.uidProject}" data-url="sa_testSuitDetail"><button type="button" class="btn btn-default">体检套餐</button></a>
							<%-- <a class="link-btn" href="javascript:void(0);" data-url=""><button type="button" class="btn btn-default">项目合同</button></a>--%>
						</div>
						<div class="col-md-6 state-row">
							项目状态：<span>项目审批</span>
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
											<label for="projectId">项目编码：</label>
											<span class="projectId">${project.uidProject}</span>
										</div>
										<div class="form-group col-md-6 fl">
											<label for="companyName">公司名称：</label> 
											<span class="companyName">${project.clientName}</span>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="row">
										<div class="form-group col-md-8">
											<label for="companyAddress">公司地址：</label> 
											<span class="companyAddress">${project.addressGroup}</span>
										</div>
										<div class="form-group col-md-4">
											<label for="test_number">体检人数范围：</label>
											<span class="test_number">${project.peopleNumber}</span> 
											<span class="test_number_state">人左右</span> 
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-5">
											<label for="beginDate">项目起始时间：</label>
											<span class="createDate">${project.timeBegin}</span>
										</div>
										<div class="form-group col-md-5">
											<label for="endDate">项目结束时间：</label> 
											<span class="createDate">${project.timeEnd}</span>
										</div>
										<div class="form-group col-md-2">
										</div>
									</div>
									<%-- 
									<div class="row">
										<div class="form-group col-md-12">
											<label for="projectIntroduce">项目简介：</label>
											<textarea cols="" rows="5" name="projectIntroduce"
												class="form-control" readonly="readonly">${project.remark}</textarea>
										</div>
									</div>
									--%>
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
										<div class="form-group col-md-3">
											<label for="representName">姓名：</label> 
											<span class="representName">${accountGroup.nameMaster}</span>
										</div>
										<div class="form-group col-md-3">
											<label for="gender">性别：</label> 
											<span class="gender">男</span>
										</div>
										<div class="form-group col-md-3">
											<label for="telephone">手机：</label>
											<span class="telephone">${accountGroup.phoneMaster}</span> 
										</div>
										<div class="form-group col-md-3">
											<label for="officePhone">办公电话：</label>
											<span class="telephone">${accountGroup.workingPhoneMaster}</span> 
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-3">
											<label for="email">邮箱：</label> 
											<span class="email"><span class="telephone">${accountGroup.emailGroup}</span> </span>
										</div>
										<div class="form-group col-md-9">
											<label for="connectAddress">联系地址：</label> 
											<span class="connectAddress">${project.addressGroup}</span>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-3">
											<label for="workerName">业务员：</label> 
											<span class="workerName">${project.projectBuilder}</span>
										</div>
										<div class="form-group col-md-3">
											
										</div>
										<div class="form-group col-md-6">
											<label for="status">状态：</label>
											<span class="projectStatus">${project.status}</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
					
					<form:form action="../project/managerFinishChangingProject" class="form col-md-12">
						<div class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">审核状态</h3>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="form-group col-md-4">
											<label for="">部门经理：</label> 
											<span><%=id %></span>
										</div>
										<div class="form-group">
											<label for="">审核状态：</label> 
											<span>等待审核</span>
											<input type="hidden" value="${project.uidProject}" name="clientName"/>
											<input type="hidden" value="<%=id %>" name="projectReviewMaster"/>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-12">
											<label for="advice">审核意见：</label>
											<textarea cols="" rows="5" name="projectReviewRemark" class="form-control">${project.projectReviewRemark}</textarea>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-2">
											<select name="projectReviewFlag">
												<option value="1">通过</option>
												<option value="0">不通过</option>
											</select>
										</div>
										<div class="form-group col-md-4">
											<button type="submit" class="btn btn-sm btn-success">提交</button>
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