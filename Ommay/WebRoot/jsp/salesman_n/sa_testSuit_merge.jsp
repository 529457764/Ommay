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
			var $newBtn = $("#newBtn");
			$newBtn.bind("click", function() {
				//var $box = $(".box");
				var $boxArea = $(".box-area");
				var $boxLast = $boxArea.last();
				var boxStr = '<div class="panel panel-default box">';
					boxStr += '<div class="panel-heading">';
						boxStr += '<h3 class="panel-title">套餐</h3>';
					boxStr += '</div>';
					boxStr += '<div class="panel-body">';
						boxStr += '<div class="row">';
							boxStr += '<div class="form-group col-md-12">';
								boxStr += '<h4>套餐信息</h4>';
							boxStr += '</div>';
						boxStr += '</div>';
						boxStr += '<div class="row">';
							//boxStr += '<div class="form-group col-md-3">';
								//boxStr += '<label for="">套餐生产日期：</label>';
								//boxStr += '<span>2015年8月5日</span>';
							//boxStr += '</div>';
							boxStr += '<input type="hidden" name="project_id" value="${suit.project_id}">'
							boxStr += '<div class="form-group col-md-3">';
								boxStr += '<label for="">套餐编号：</label>';
								boxStr += '<span>${suit.suit_number}</span>';
								boxStr += '<input type="hidden" value="${suit.suit_number}" name="suit_number" required="required">';
							boxStr += '</div>';
							boxStr += '<div class="form-group col-md-6">';
								boxStr += '<label for="suit_client_name">体检单位：</label>';
								boxStr += '<input type="text" value="" name="suit_client_name" required="required">';
							boxStr += '</div>';
						boxStr += '</div>';
						boxStr += '<div class="row bottom-line">';
							boxStr += '<div class="form-group col-md-4">';
								boxStr += '<label for="suit_name">套餐名：</label>';
								boxStr += '<input type="text" value="" name="suit_name" required="required">';
							boxStr += '</div>';
							boxStr += '<div class="form-group col-md-2">';
								boxStr += '<label for="suit_sex">适用性别：</label>';
								boxStr += '<select name="suit_sex">';
									boxStr += '<option value="1">男</option>';
									boxStr += '<option value="2">女</option>';
								boxStr += '</select>';
							boxStr += '</div>';
							boxStr += '<div class="form-group col-md-3">';
								boxStr += '<label for="">年龄上限：</label>';
								boxStr += '<select name="suit_age_upper">';
									boxStr += '<option value="20">20</option>';
									boxStr += '<option value="30">30</option>';
									boxStr += '<option value="40">40</option>';
									boxStr += '<option value="50">50</option>';
									boxStr += '<option value="60">60</option>';
									boxStr += '<option value="0">不限</option>';
								boxStr += '</select>';
							boxStr += '</div>';
							boxStr += '<div class="form-group col-md-3">';
								boxStr += '<label for="">年龄下限：</label>';
								boxStr += '<select name="suit_age_lower">';
									boxStr += '<option value="20">20</option>';
									boxStr += '<option value="30">30</option>';
									boxStr += '<option value="40">40</option>';
									boxStr += '<option value="50">50</option>';
									boxStr += '<option value="60">60</option>';
									boxStr += '<option value="0">不限</option>';
								boxStr += '</select>';
							boxStr += '</div>';
						boxStr += '</div>';
						boxStr += '<div class="row">';
							boxStr += '<div class="form-group col-md-12">';
								boxStr += '<h4>选择套餐</h4>';
							boxStr += '</div>';
						boxStr += '</div>';
						boxStr += '<div class="row btn-row">';
				 boxStr += '<div class="state2-row">';
								boxStr += '<div class="col-md-3">已选择组合：<span id="chooseNum">0</span><input type="hidden" name="suit_selected_number"></div>';
								boxStr += '<div class="col-md-3">套餐总计(元)：<span id="total">0</span><input type="hidden" name="suit_sum"></div>';
							boxStr += '</div>';
						boxStr += '</div>';
						boxStr += '<table class="table table-bordered col-md-12">';
							boxStr += '<thead>';
								boxStr += '<tr class="success">';
									boxStr += '<th>选择</th>';
									boxStr += '<th>项目编号</th>';
									boxStr += '<th>体检项目</th>';
									boxStr += '<th>体检单项价格</th>';
									boxStr += '<th>检查类型</th>';
									boxStr += '<th>适用性别</th>';
									boxStr += '<th>科室名称</th>';
								boxStr += '</tr>';
							boxStr += '</thead>';
							boxStr += '<tbody>';
								boxStr += '<tr>';
									boxStr += '<td>';
										boxStr += '<input type="checkbox" class="checkbox" name="number_item1" id="number_item1" value="1" data-choose="no" data-value="10">';
									boxStr += '</td>';
									boxStr += '<td>1</td>';
									boxStr += '<td>视力</td>';
									boxStr += '<td>10</td>';
									boxStr += '<td>眼科</td>';
									boxStr += '<td>男/女</td>';
									boxStr += '<td>眼科室</td>';
								boxStr += '</tr>';
								boxStr += '<tr>';
									boxStr += '<td>';
										boxStr += '<input type="checkbox" class="checkbox" name="number_item2" id="number_item2" value="1" data-choose="no" data-value="20">';
									boxStr += '</td>';
									boxStr += '<td>2</td>';
									boxStr += '<td>耳、鼻、喉、口咽、鼻咽</td>';
									boxStr += '<td>20</td>';
									boxStr += '<td>鼻喉科</td>';
									boxStr += '<td>男/女</td>';
									boxStr += '<td>鼻喉科科室</td>';
								boxStr += '</tr>';
								boxStr += '<tr>';
									boxStr += '<td>';
										boxStr += '<input type="checkbox" class="checkbox" name="number_item3" id="number_item3" value="1" data-choose="no" data-value="10">';
									boxStr += '</td>';
									boxStr += '<td>3</td>';
									boxStr += '<td>听力</td>';
									boxStr += '<td>10</td>';
									boxStr += '<td>耳科</td>';
									boxStr += '<td>男/女</td>';
									boxStr += '<td>耳科室</td>';
								boxStr += '</tr>';
								boxStr += '<tr>';
									boxStr += '<td>';
										boxStr += '<input type="checkbox" class="checkbox" name="number_item4" id="number_item4" value="1" data-choose="no" data-value="50">';
									boxStr += '</td>';
									boxStr += '<td>4</td>';
									boxStr += '<td>上腹（肝胆胰脾肾）+泌尿系</td>';
									boxStr += '<td>50</td>';
									boxStr += '<td>彩超检查</td>';
									boxStr += '<td>男</td>';
									boxStr += '<td>彩超科室</td>';
								boxStr += '</tr>';
								boxStr += '<tr>';
									boxStr += '<td>';
										boxStr += '<input type="checkbox" class="checkbox" name="number_item5" id="number_item5" value="1" data-choose="no" data-value="50">';
									boxStr += '</td>';
									boxStr += '<td>5</td>';
									boxStr += '<td>上腹（肝胆胰脾肾）+盆腔</td>';
									boxStr += '<td>50</td>';
									boxStr += '<td>彩超检查</td>';
									boxStr += '<td>女</td>';
									boxStr += '<td>彩超科室</td>';
								boxStr += '</tr>';
								boxStr += '<tr>';
									boxStr += '<td>';
										boxStr += '<input type="checkbox" class="checkbox" name="number_item6" id="number_item6" value="1" data-choose="no" data-value="30">';
									boxStr += '</td>';
									boxStr += '<td>6</td>';
									boxStr += '<td>白带常规检查</td>';
									boxStr += '<td>30</td>';
									boxStr += '<td>妇科</td>';
									boxStr += '<td>女</td>';
									boxStr += '<td>妇科室</td>';
								boxStr += '</tr>';
								boxStr += '<tr>';
									boxStr += '<td>';
										boxStr += '<input type="checkbox" class="checkbox" name="number_item7" id="number_item7" value="1" data-choose="no" data-value="10">';
									boxStr += '</td>';
									boxStr += '<td>7</td>';
									boxStr += '<td>肺活量、一秒用力吐气量、血氧饱和度等</td>';
									boxStr += '<td>10</td>';
									boxStr += '<td>肺功能</td>';
									boxStr += '<td>男/女</td>';
									boxStr += '<td>五脏科室</td>';
								boxStr += '</tr>';
								boxStr += '<tr>';
									boxStr += '<td>';
										boxStr += '<input type="checkbox" class="checkbox" name="number_item8" id="number_item8" value="1" data-choose="no" data-value="200">';
									boxStr += '</td>';
									boxStr += '<td>8</td>';
									boxStr += '<td>癌症筛查——卵巢肿瘤标记物</td>';
									boxStr += '<td>200</td>';
									boxStr += '<td>生化/免疫类</td>';
									boxStr += '<td>女</td>';
									boxStr += '<td>实验科室</td>';
								boxStr += '</tr>';
								boxStr += '<tr>';
									boxStr += '<td>';
										boxStr += '<input type="checkbox" class="checkbox" name="number_item9" id="number_item9" value="1" data-choose="no" data-value="200">';
									boxStr += '</td>';
									boxStr += '<td>9</td>';
									boxStr += '<td>癌症筛查——前列腺肿瘤标记物</td>';
									boxStr += '<td>200</td>';
									boxStr += '<td>生化/免疫类</td>';
									boxStr += '<td>男</td>';
									boxStr += '<td>实验科室</td>';
								boxStr += '</tr>';
								boxStr += '<tr>';
									boxStr += '<td>';
										boxStr += '<input type="checkbox" class="checkbox" name="number_item10" id="number_item10" value="1" data-choose="no" data-value="200">';
									boxStr += '</td>';
									boxStr += '<td>10</td>';
									boxStr += '<td>血液常规检查</td>';
									boxStr += '<td>200</td>';
									boxStr += '<td>生化/免疫类</td>';
									boxStr += '<td>男/女</td>';
									boxStr += '<td>实验科室</td>';
								boxStr += '</tr>';
								boxStr += '<tr>';
									boxStr += '<td>';
										boxStr += '<input type="checkbox" class="checkbox" name="number_item11" id="number_item11" value="1" data-choose="no" data-value="300">';
									boxStr += '</td>';
									boxStr += '<td>11</td>';
									boxStr += '<td>头部CT检查</td>';
									boxStr += '<td>300</td>';
									boxStr += '<td>CT检查</td>';
									boxStr += '<td>男/女</td>';
									boxStr += '<td>放射科室</td>';
								boxStr += '</tr>';
								boxStr += '<tr>';
									boxStr += '<td>';
										boxStr += '<input type="checkbox" class="checkbox" name="number_item12" id="number_item12" value="1" data-choose="no" data-value="100">';
									boxStr += '</td>';
									boxStr += '<td>12</td>';
									boxStr += '<td>X光检查</td>';
									boxStr += '<td>100</td>';
									boxStr += '<td>骨科</td>';
									boxStr += '<td>男/女</td>';
									boxStr += '<td>放射科室</td>';
								boxStr += '</tr>';
							boxStr += '</tbody>';
						boxStr += '</table>';
					boxStr += '</div>';
				boxStr += '</div>';
				$boxLast.append(boxStr);
				$(this).hide();
				$("#submit").html("不可提交");
			});

			//统计价钱
			var sum = 0;
			var num = 0;		
			$(document).on("click", '.checkbox', function() {
				var price = parseInt($(this).attr("data-value"));
				//var applePrice = parseInt($("#applePrice").html());
				//var bananaPrice = parseInt($("#bananaPrice").html());
				if($(this).attr("data-choose") == "no"){
					sum += price;
					num += 1;
					$(this).attr("data-choose","yes");	
				} else {
					$(this).attr("data-choose","no");
					sum -= price;
					num -= 1;
				}
				console.log("sum:"+sum);
				console.log("num:"+num);
				$("#total").html(sum);
				$("input[name='suit_sum']").val(sum);
				$("#chooseNum").html(num);
				$("input[name='suit_selected_number']").val(num);
				if(sum>0) {
					$("#submit").attr("disabled",false);
					$("#submit").html("提交");
				} else {
					$("#submit").attr("disabled",true);
					$("#submit").html("不可提交");
				}
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
			<div class="col-xs-12 col-sm-10 col-md-10 col-lg-10" id="showBox" data-box="sa_newProject">
				<div class="row col-md-12">
					<div class="row col-md-12">
						<h4>新建项目</h4>
					</div>
					<div class="row btn-row">
						<div class="col-md-6">
							<a class="link-btn" href="<%=path%>/view/sa_newProject" data-url="sa_newProject"><button type="button" class="btn btn-default">基本信息</button></a>
							<a class="link-btn" href="<%=path%>/view/sa_testSuit" data-url="sa_testSuit"><button type="button" class="btn btn-primary">体检套餐</button></a>
							<%-- <a class="link-btn" href="javascript:void(0);" data-url=""><button type="button" class="btn btn-default">项目合同</button></a>--%>
						</div>
						<div class="col-md-6 state-row">
							项目状态：<span>项目登记</span>
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
											<label for="">套餐编号：</label>
											<span>${suit.suit_number}</span>
										</div>
										<div class="form-group col-md-6">
											<label for="">体检单位：</label>
											<span>${suit.suit_client_name}</span>
										</div>
									</div>
									<div class="row bottom-line">
										<div class="form-group col-md-5">
											<label for="">套餐名：</label>
											<span>${suit.suit_name}</span>
										</div>
										<div class="form-group col-md-2">
											<label for="">适用性别：</label>
											<span>${suit.suit_sex}</span>
										</div>
										<div class="form-group col-md-2">
											<label for="">年龄上限：</label>
											<span>${suit.suit_age_upper}</span>
										</div>
										<div class="form-group col-md-3">
											<label for="">年龄下限：</label>
											<span>${suit.suit_age_lower}</span>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-12">
											<h4>选择套餐</h4>
										</div>
									</div>
									<div class="row btn-row">
										<div class="state2-row">
											<div class="col-md-3">已选择组合：<span>${suit.suit_selected_number}</span></div>
											<div class="col-md-3">套餐总计（元）：<span>${suit.suit_sum}</span></div>
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
												<td>
													<c:if test='${suit.number_item1 ne 0}'>
														<input type="checkbox" value="1" disabled checked="checked">
													</c:if>
													<c:if test='${suit.number_item1 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if>
												</td>
												<td>1</td>
												<td>视力</td>
												<td>10</td>
												<td>眼科</td>
												<td>男/女</td>
												<td>眼科室</td>
											</tr>
											<tr>
												<td>
													<c:if test='${suit.number_item2 ne 0}'>
														<input type="checkbox" value="1" disabled checked="checked">
													</c:if>
													<c:if test='${suit.number_item2 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if>
												</td>
												<td>2</td>
												<td>耳、鼻、喉、口咽、鼻咽</td>
												<td>20</td>
												<td>鼻喉科</td>
												<td>男/女</td>
												<td>鼻喉科科室</td>
											</tr>
											<tr>
												<td>
													<c:if test='${suit.number_item3 ne 0}'>
														<input type="checkbox" value="1" disabled checked="checked">
													</c:if>
													<c:if test='${suit.number_item3 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if>
												</td>
												<td>3</td>
												<td>听力</td>
												<td>10</td>
												<td>耳科</td>
												<td>男/女</td>
												<td>耳科室</td>
											</tr>
											<tr>
												<td>
													<c:if test='${suit.number_item4 ne 0}'>
														<input type="checkbox" value="1" disabled checked="checked">
													</c:if>
													<c:if test='${suit.number_item4 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if>
												</td>
												<td>4</td>
												<td>上腹（肝胆胰脾肾）+泌尿系</td>
												<td>50</td>
												<td>彩超检查</td>
												<td>男</td>
												<td>彩超科室</td>
											</tr>
											<tr>
												<td>
													<c:if test='${suit.number_item5 ne 0}'>
														<input type="checkbox" value="1" disabled checked="checked">
													</c:if>
													<c:if test='${suit.number_item5 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if>
												</td>
												<td>5</td>
												<td>上腹（肝胆胰脾肾）+盆腔</td>
												<td>50</td>
												<td>彩超检查</td>
												<td>女</td>
												<td>彩超科室</td>
											</tr>
											<tr>
												<td>
													<c:if test='${suit.number_item6 ne 0}'>
														<input type="checkbox" value="1" disabled checked="checked">
													</c:if>
													<c:if test='${suit.number_item6 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if>
												</td>
												<td>6</td>
												<td>白带常规检查</td>
												<td>30</td>
												<td>妇科</td>
												<td>女</td>
												<td>妇科室</td>
											</tr>
											<tr>
												<td>
													<c:if test='${suit.number_item7 ne 0}'>
														<input type="checkbox" value="1" disabled checked="checked">
													</c:if>
													<c:if test='${suit.number_item7 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if>
												</td>
												<td>7</td>
												<td>肺活量、一秒用力吐气量、血氧饱和度等</td>
												<td>10</td>
												<td>肺功能</td>
												<td>男/女</td>
												<td>五脏科室</td>
											</tr>
											<tr>
												<td>
													<c:if test='${suit.number_item8 ne 0}'>
														<input type="checkbox" value="1" disabled checked="checked">
													</c:if>
													<c:if test='${suit.number_item8 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if>
												</td>
												<td>8</td>
												<td>癌症筛查——卵巢肿瘤标记物</td>
												<td>200</td>
												<td>生化/免疫类</td>
												<td>女</td>
												<td>实验科室</td>
											</tr>
											<tr>
												<td>
													<c:if test='${suit.number_item9 ne 0}'>
														<input type="checkbox" value="1" disabled checked="checked">
													</c:if>
													<c:if test='${suit.number_item9 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if>
												</td>
												<td>9</td>
												<td>癌症筛查——前列腺肿瘤标记物</td>
												<td>200</td>
												<td>生化/免疫类</td>
												<td>男</td>
												<td>实验科室</td>
											</tr>
											<tr>
												<td>
													<c:if test='${suit.number_item10 ne 0}'>
														<input type="checkbox" value="1" disabled checked="checked">
													</c:if>
													<c:if test='${suit.number_item10 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if>
												</td>
												<td>10</td>
												<td>血液常规检查</td>
												<td>200</td>
												<td>生化/免疫类</td>
												<td>男/女</td>
												<td>实验科室</td>
											</tr>
											<tr>
												<td>
													<c:if test='${suit.number_item10 ne 0}'>
														<input type="checkbox" value="1" disabled checked="checked">
													</c:if>
													<c:if test='${suit.number_item10 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if>
												</td>
												<td>11</td>
												<td>头部CT检查</td>
												<td>300</td>
												<td>CT检查</td>
												<td>男/女</td>
												<td>放射科室</td>
											</tr>
											<tr>
												<td>
													<c:if test='${suit.number_item12 ne 0}'>
														<input type="checkbox" value="1" disabled checked="checked">
													</c:if>
													<c:if test='${suit.number_item12 eq 0}'>
														<input type="checkbox" value="1" disabled>
													</c:if>
												</td>
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
					<form:form action="../project/getSuit" class="form col-md-12">
						<div class="row box-area">
						</div>
						<div class="row panel panel-default">
							 <div class="panel-body">
							 	<c:if test="${empty full}">
							 	<div class="row submit-row col-md-12 tr fr">
									<button type="button" class="btn btn-info" id="newBtn">新增</button>
									<button type="submit" class="btn btn-primary" id="submit" disabled>提交</button>
								</div>
								</c:if> 	
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