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
<% String projectId = "1"; %>
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
			<div class="col-xs-12 col-sm-10 col-md-10 col-lg-10" id="showBox" data-box="ma_myGroupProject">			
				<div class="row col-md-12">
					<div class="panel panel-default">
				        <div class="panel-heading">
				        	<h4>我的团体项目</h4>
				        </div>
				    	<div class="panel-body">
				   	        <div class="row col-md-12">
				                <form class="form" action="#">
				                    <div class="form-group fr">
				                        <input type="text" class="">
				                        <button type="submit" class="btn btn-sm btn-primary">查询</button>
				                    </div>
				                </form>
				            </div>
				            <div class="row col-md-12">
				                <table class="table table-bordered">
				                    <thead>
				                        <tr class="success">
				                            <th>序号</th>
				                            <th>项目编码</th>
				                            <th>公司名称</th>
				                            <th>体检人数范围</th>
				                            <th>项目状态</th>
				                            <th>客户代表</th>
				                            <th>业务员</th>
				                            <th>部门经理</th>           
				                        </tr>
				                    </thead>
				                    <tbody>
										<c:forEach items="${list}" var="project" varStatus="status">
											<tr>
												<td>${status.index+1}</td>
												<td>${project.uidProject}</td>
												<c:if test="${project.projectReviewFlag == false && project.contractReviewFlag == false}">
													<td><a class="linkBtn" href="<%=path%>/project/managerFinishGroupProjectReview?uidProject=${project.uidProject}" data-url="sa_projectDetail">${project.clientName}</a></td>
												</c:if>
												<c:if test="${project.projectReviewFlag == true && project.contractReviewFlag == false }">
													<td><a class="linkBtn" href="<%=path%>/project/managerFinishGroupContractReview?uidProject=${project.uidProject}" data-url="sa_projectDetail">${project.clientName}</a></td>
												</c:if>	
												<c:if test="${project.projectReviewFlag == true && project.contractReviewFlag == true }">
													<td><a class="linkBtn" href="<%=path%>/project/managerFinishGroupContractReview?uidProject=${project.uidProject}" data-url="sa_projectDetail">${project.clientName}</a></td>
												</c:if>		
												<td>${project.peopleNumber}</td>
												<td>${project.status}</td>
												<td>${project.account}</td>
												<td>${project.projectBuilder}</td>
												<td>${project.projectReviewMaster}</td>
											</tr>
										</c:forEach>
										</tr>
									</tbody>
				                </table>
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