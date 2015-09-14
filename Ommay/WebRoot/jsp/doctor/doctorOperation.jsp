<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="c.tld" prefix="c"%>
<%@ taglib uri="fmt.tld" prefix="fmt"%>
<%@ taglib uri="fn.tld" prefix="fn"%>
<%@ taglib uri="sql.tld" prefix="sql"%>
<%@ taglib uri="x.tld" prefix="x"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	String username = (String) session.getAttribute("accountName");
%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>doctor</title>
<script type="text/javascript"
	src="<%=path%>/resource/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/resource/js/doctor.js"></script>
<script type="text/javascript" src="<%=path%>/resource/js/public.js"></script>
<link rel="stylesheet" href="<%=path%>/resource/css/doctor.css">
<link rel="stylesheet" href="<%=path%>/resource/css/user.css">
<link rel="stylesheet" href="<%=path%>/resource/css/public.css">
<link rel="stylesheet"
	href="<%=path%>/resource/bootstrap/css/bootstrap.min.css">
<script>
	
</script>
</head>
<body>
	<header class="header">
		<nav class="navbar navbar-default" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-navbar-collapse">
						<span class="sr-only"> Toggle navigation </span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">安生美</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-navbar-collapse">
					<ul class="nav navbar-nav">

					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><span><%=username %></span><b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="../account/logOff">注销</a></li>
							</ul></li>
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
					<a href="<%=path%>/adf/doctorSearch" class="list-group-item">查找会员</a>
					<a href="<%=path%>/adf/doctorOperation"
						class="list-group-item  active">会员体检信息</a>
					<a href="<%=path%>/adf/d_userInfo" class="list-group-item"
						id="personalInfo">个人中心</a>
				</ul>
			</div>
			<!-- 右侧主要内容 -->
			<div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4>会员体检信息</h4>
						</div>
						<div class="panel-body">




							<!-- 查看会员 -->

							<div class="show-client" id="show-client">

								<div class="search-client">
								<a href="#" data-target="#show-client-list">返回会员体检列表</a>
								<!--	<a href="#" data-target="#show-client-list">查找会员列表</a> | <a
										href="#" data-target="#client-result-list">会员体检列表</a>
									  	 | <a
										href="#" data-target="#client-result-before">查看体检结果</a> | <a
										href="#" data-target="#insert-result">体检结果录入</a>
										-->
								</div>
								<div class="tab-content">
									<!--  1.查看会员列表  -->
									<div class="show-client-list" id="show-client-list">
										<form action="#">
											<table class="show-cl-list table table-bordered">
												<thead>
													<tr>
														<th width="5%">序号</th>
														<th width="10%">订单编号</th>
														<th width="10%">会员账号</th>
														<th width="5%">性别</th>
														<th width="15%">预约状态</th>
														<th width="10%">责任医生</th>
														<th width="20%">病历</th>
													</tr>
												</thead>
												<tbody>

													<c:forEach items="${list}" var="indent" varStatus="status">

														<tr>
															<td>${status.index+1}</td>
															<td>${indent.uidIndent}</td>
															<td>${indent.name}</td>
															<td>${indent.sex}</td>
															<td>${indent.status}</td>
															<td>${indent.operator}</td>
															<td>${indent.history}</td>
														</tr>
													</c:forEach>

													</tr>
												</tbody>
											</table>
										</form>
									</div>
									<!--       end      -->

									<!-- 2.某会员体检列表 -->
									<div class="charge-result" id="client-result-list">
										<div class="result-header">
											<div class="header-title">
												<h4>
													<span>何小萌</span>体检列表
												</h4>
											</div>
											<div class="header-content">
												<span>会员编号 :<span class="client-number"></span></span>
												<span>会员姓名 :<span class="client-name"></span></span> <span>所属公司
													:<span class="client-sal"></span>
												</span>

											</div>
										</div>
										<div class="result-body" id="chkUpList">
											<form action="#">
												<table class="table table-bordered">
													<thead>
														<tr>
															<th width="13%">序号</th>
															<th width="18%">预约编号</th>
															<th width="18%">预约体检日期</th>
															<th width="18%">体检状态</th>
															<th width="18%">状态更新日期</th>
															<th width="15%">操作人员</th>
														</tr>
													</thead>
													<tbody>
														
													</tbody>
												</table>

											</form>
										</div>
									</div>
									<!--      end       -->


									<!-- 3.查看某会员之前的体检结果-->
									<div class="charge-result" id="client-result-before">
										<div class="result-header">
											<div class="header-title">
												<h4>
													<span></span>体检报告
												</h4>
											</div>
											<div class="header-content">
												
												<span>会员姓名 :<span class="client-name"></span></span> <span>业务员
													:<span class="client-sal"></span>
												</span> <span>体检时间 :<span class="check-time"></span></span>
												<span>责任医生 :<span class="check-doctor"></span></span>
											</div>
										</div>
										<div class="result-body">
											
												<table class="table table-bordered">
													<thead>
														<tr>
															<th width="10%">项目编号</th>
															<th width="20%">体检项目</th>
															<th width="30%">体检结果</th>
														</tr>
													</thead>
													<tbody>
														
													</tbody>
												</table>
											
										</div>
									</div>
									<!--             end           -->


									<!-- 4.第几次体检结果录入 -->
									<div class="charge-result" id="insert-result">
										<div class="result-header">
											<div class="header-title">
												<h4>
													<span></span>体检报告
												</h4>
											</div>
											<div class="header-content">
												
												<span>会员姓名 :<span class="client-name"></span></span> <span>业务员
													:<span class="client-sal"></span>
												</span> <span>体检时间 :<span class="check-time"></span></span>
												<span>责任医生 :<span class="check-doctor"></span></span>
											</div>
										</div>
										<div class="result-body">
											
												<table class="table table-bordered">
													<thead>
														<tr>
															<th width="10%">项目编号</th>
															<th width="20%">体检项目</th>
															<th width="30%">体检结果</th>
														</tr>
													</thead>
													<tbody>
														
													</tbody>
												</table>
												<div class="form-group">
													<div class="col-sm-offset-9 col-sm-1">
														<button type="reset" class="btn btn-default">重置</button>
													</div>
													<div class=" col-sm-1">
														<button id="result-submit" type="button" class="btn btn-default">提交</button>
													</div>
												</div>
										
										</div>
									</div>
									<!--      end     -->
								</div>
							</div>
							<!--    end   -->



						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer> </footer>
</body>
</html>