<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="c.tld" prefix="c"%>
<%@ taglib uri="fmt.tld" prefix="fmt"%>
<%@ taglib uri="fn.tld" prefix="fn"%>
<%@ taglib uri="sql.tld" prefix="sql"%>
<%@ taglib uri="x.tld" prefix="x"%>
<% String id = (String)session.getAttribute("accountName"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>部门经理首页</title>
<script type="text/javascript"
	src="<%=path %>/resource/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="<%=path %>/resource/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="<%=path %>/resource/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=path %>/resource/css/main1.css">
<script type="text/javascript" src="<%=path %>/resource/js/showPage.js"></script>
<script type="text/javascript" src="<%=path%>/resource/js/calendar.js"></script>
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
							data-toggle="dropdown"><span><%=id%></span>经理<b class="caret"></b></a>
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
			<div class="col-xs-12 col-sm-10 col-md-10 col-lg-10" id="showBox" data-box="ma_checkTestSuit">
				<div class="row col-md-12">
					<div class="row col-md-12">
						<h4>项目内容</h4>
					</div>
					<div class="row btn-row">
						<div class="col-md-6">
							<a class="link-btn" href="<%=path%>/project/managerFinishGroupProjectReview?uidProject=${project.uidProject}" data-url="sa_projectDetail"><button type="button" class="btn btn-default">基本信息</button></a>
							<a class="link-btn" href="<%=path%>/project/managerFinishGroupContractReview?uidProject=${project.uidProject}" data-url="sa_testSuitDetail"><button type="button" class="btn btn-primary">体检套餐</button></a>
							<%-- <a class="link-btn"
								href="javascript:void(0);" data-url=""><button type="button"
									class="btn btn-default">项目合同</button></a>--%>
						</div>
						<div class="col-md-6 state-row">
							项目状态：<span>${project.status}</span>
						</div>
					</div>

					<div class="row col-md-12">
						<c:forEach items="${list}" var="suit">
							<div class="panel panel-default box">
								<div class="panel-heading">
									<h3 class="panel-title">套餐${suit.suit_number}</h3>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="form-group col-md-12">
											<h4>套餐信息</h4>
										</div>
									</div>
									<div class="row">
										<%--
										<div class="form-group col-md-3">
											<label for="">套餐生产日期：</label>
											<span>2015年8月5日</span>
										</div>
									--%>
										<div class="form-group col-md-3">
											<label for="">套餐编号：</label> <span>${suit.suit_number}</span>
										</div>
										<div class="form-group col-md-6">
											<label for="">体检单位：</label> <span>${suit.suit_client_name}</span>
										</div>
									</div>
									<div class="row bottom-line">
										<div class="form-group col-md-5">
											<label for="">套餐名：</label> <span>${suit.suit_name}</span>
										</div>
										<div class="form-group col-md-2">
											<label for="">适用性别：</label> <span>${suit.suit_sex}</span>
										</div>
										<div class="form-group col-md-2">
											<label for="">年龄上限：</label> <span>${suit.suit_age_upper}</span>
										</div>
										<div class="form-group col-md-3">
											<label for="">年龄下限：</label> <span>${suit.suit_age_lower}</span>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-12">
											<h4>选择套餐</h4>
										</div>
									</div>
									<div class="row btn-row">
										<div class="state2-row">
											<div class="col-md-3">
												已选择组合：<span>${suit.suit_selected_number}</span>
											</div>
											<div class="col-md-3">
												套餐总计（元）：<span>${suit.suit_sum}</span>
											</div>
										</div>
									</div>
									<table class="table table-bordered col-md-12">
										<thead>
											<tr class="success">
												<th>选择</th>
												<th>项目编号</th>
												<th>体检项目</th>
												<th>体检单项价格</th>
												<th>检查类型</th>
												<th>适用性别</th>
												<th>科室名称</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><c:if test='${suit.number_item1 ne 0}'>
														<input type="checkbox" value="1" disabled
															checked="checked">
													</c:if> <c:if test='${suit.number_item1 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if></td>
												<td>1</td>
												<td>视力</td>
												<td>10</td>
												<td>眼科</td>
												<td>男/女</td>
												<td>眼科室</td>
											</tr>
											<tr>
												<td><c:if test='${suit.number_item2 ne 0}'>
														<input type="checkbox" value="1" disabled
															checked="checked">
													</c:if> <c:if test='${suit.number_item2 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if></td>
												<td>2</td>
												<td>耳、鼻、喉、口咽、鼻咽</td>
												<td>20</td>
												<td>鼻喉科</td>
												<td>男/女</td>
												<td>鼻喉科科室</td>
											</tr>
											<tr>
												<td><c:if test='${suit.number_item3 ne 0}'>
														<input type="checkbox" value="1" disabled
															checked="checked">
													</c:if> <c:if test='${suit.number_item3 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if></td>
												<td>3</td>
												<td>听力</td>
												<td>10</td>
												<td>耳科</td>
												<td>男/女</td>
												<td>耳科室</td>
											</tr>
											<tr>
												<td><c:if test='${suit.number_item4 ne 0}'>
														<input type="checkbox" value="1" disabled
															checked="checked">
													</c:if> <c:if test='${suit.number_item4 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if></td>
												<td>4</td>
												<td>上腹（肝胆胰脾肾）+泌尿系</td>
												<td>50</td>
												<td>彩超检查</td>
												<td>男</td>
												<td>彩超科室</td>
											</tr>
											<tr>
												<td><c:if test='${suit.number_item5 ne 0}'>
														<input type="checkbox" value="1" disabled
															checked="checked">
													</c:if> <c:if test='${suit.number_item5 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if></td>
												<td>5</td>
												<td>上腹（肝胆胰脾肾）+盆腔</td>
												<td>50</td>
												<td>彩超检查</td>
												<td>女</td>
												<td>彩超科室</td>
											</tr>
											<tr>
												<td><c:if test='${suit.number_item6 ne 0}'>
														<input type="checkbox" value="1" disabled
															checked="checked">
													</c:if> <c:if test='${suit.number_item6 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if></td>
												<td>6</td>
												<td>白带常规检查</td>
												<td>30</td>
												<td>妇科</td>
												<td>女</td>
												<td>妇科室</td>
											</tr>
											<tr>
												<td><c:if test='${suit.number_item7 ne 0}'>
														<input type="checkbox" value="1" disabled
															checked="checked">
													</c:if> <c:if test='${suit.number_item7 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if></td>
												<td>7</td>
												<td>肺活量、一秒用力吐气量、血氧饱和度等</td>
												<td>10</td>
												<td>肺功能</td>
												<td>男/女</td>
												<td>五脏科室</td>
											</tr>
											<tr>
												<td><c:if test='${suit.number_item8 ne 0}'>
														<input type="checkbox" value="1" disabled
															checked="checked">
													</c:if> <c:if test='${suit.number_item8 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if></td>
												<td>8</td>
												<td>癌症筛查——卵巢肿瘤标记物</td>
												<td>200</td>
												<td>生化/免疫类</td>
												<td>女</td>
												<td>实验科室</td>
											</tr>
											<tr>
												<td><c:if test='${suit.number_item9 ne 0}'>
														<input type="checkbox" value="1" disabled
															checked="checked">
													</c:if> <c:if test='${suit.number_item9 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if></td>
												<td>9</td>
												<td>癌症筛查——前列腺肿瘤标记物</td>
												<td>200</td>
												<td>生化/免疫类</td>
												<td>男</td>
												<td>实验科室</td>
											</tr>
											<tr>
												<td><c:if test='${suit.number_item10 ne 0}'>
														<input type="checkbox" value="1" disabled
															checked="checked">
													</c:if> <c:if test='${suit.number_item10 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if></td>
												<td>10</td>
												<td>血液常规检查</td>
												<td>200</td>
												<td>生化/免疫类</td>
												<td>男/女</td>
												<td>实验科室</td>
											</tr>
											<tr>
												<td><c:if test='${suit.number_item10 ne 0}'>
														<input type="checkbox" value="1" disabled
															checked="checked">
													</c:if> <c:if test='${suit.number_item10 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if></td>
												<td>11</td>
												<td>头部CT检查</td>
												<td>300</td>
												<td>CT检查</td>
												<td>男/女</td>
												<td>放射科室</td>
											</tr>
											<tr>
												<td><c:if test='${suit.number_item12 ne 0}'>
														<input type="checkbox" value="1" disabled
															checked="checked">
													</c:if> <c:if test='${suit.number_item12 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if></td>
												<td>12</td>
												<td>X光检查</td>
												<td>100</td>
												<td>骨科</td>
												<td>男/女</td>
												<td>放射科室</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</c:forEach>
					</div>


					<form:form action="../project/managerFinishChangingContract" class="form col-md-12">
						<div class="row">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="row bottom-line">
										<div class="form-group col-md-3 state2-row">
											<label for="">业务员：</label> <span>${project.projectBuilder}</span>
										</div>
										<div class="form-group col-md-3"></div>
										<%-- 
										<div class="form-group col-md-6 state2-row tr">
											<label for="">状态：</label> <span>${project.status}</span> <b>&nbsp;&nbsp;&nbsp;</b><span>${project.timeBegin}</span>
										</div>
										--%>
									</div>
									<div class="row">
										<div class="form-group col-md-6">
											<label for="">部门经理：</label> <span><%=id %></span>
										</div>
										<div class="form-group col-md-6 tr">
											<label for="">状态：</label> <span>${project.status}</span>
											<input type="hidden" value="${project.uidProject}" name="clientName"/>
											<input type="hidden" value="<%=id %>" name="contractReviewMaster"/>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-12">
											<label for="recomment">审核意见：</label>
											<textarea cols="" rows="5" name="contractReviewRemark"
												class="form-control">${project.projectReviewRemark}</textarea>
										</div>
									</div>
									 
									<div class="row">
										<div class="form-group col-md-2">
											<select name="contractReviewFlag">
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
	<footer> </footer>
</body>
</html>