<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.ommay.entity.PhysicalItem"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<Object> itemsList = (List<Object>)request.getAttribute("appointments_content");
Integer sum = (Integer)request.getAttribute("appointments_sum");
String com = (String)request.getAttribute("com");
String name = (String)request.getAttribute("name");
if(itemsList==null){
	response.sendRedirect(basePath+"representation/re_testAppointment");
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
    <script type="text/javascript" src="<%=path%>/resource/js/calendar.js"></script>
	<script type="text/javascript" src="<%=path %>/resource/js/showPage.js"></script>
	<script type="text/javascript" src="<%=path %>/resource/js/public.js"></script>
    <script type="text/javascript">
    $(function(){
		$beginYear = $("#beginyear");
		$beginMonth = $("#beginMonth");
		$beginDay = $("#beginDay");
		$endYear = $("#endyear");
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

<script type="text/javascript">
$(function(){
	//统计价钱
	var sum = 0;
	var num = 0;
	var ids = new Array();
	$(document).on("click", '.checkbox', function() {
		var price = parseInt($(this).attr("data-value"));
		var id = $(this).attr("id");
		if($(this).attr("data-choose") == "no"){
			sum += price;
			num += 1;
			ids[id] = true;
			$(this).attr("data-choose","yes");	
		} else {
			$(this).attr("data-choose","no");
			sum -= price;
			num -= 1;
			ids[id] = false;
		}
		console.log("sum:"+sum);
		console.log("num:"+num);
		console.log("ids:"+ids.length);
		console.log("ids["+id+"]:"+ids[id]);
		$("#total").html(sum);
		$("input[name='total']").val(sum);
		$("#chooseNum").html(num);
		$("input[name='chooseNum']").val(num);
		$("#chooseId").val(ids);
		$("input[name='chooseId']").val(ids);
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
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span><%=name %></span>客户代表<b class="caret"></b></a>
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
					<a href="<%=path%>/representation/re_testAppointment" data-url="re_testAppointment" class="list-group-item active">体检预约</a>
					<a href="<%=path%>/representation/re_checkResult" data-url="re_checkResult" class="list-group-item">查看体检结果</a>
				</ul>
			</div>
			<!-- 右侧主要内容 -->
			<div class="col-xs-12 col-sm-10 col-md-10 col-lg-10" id="showBox">			
				<div class="row col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4>体检预约</h4>
						</div>
						<div class="panel-body">
							<form action="<%=basePath+"representation/re_submitAppointment"%>" class="form col-md-12" method="post">
								<div class="row tc">
									<div class="form-group col-md-12">
										<span><%=com %></span><b>&nbsp;&nbsp;&nbsp;</b><span>第<%=sum+1%>次体检预约</span>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-6">
										<label for="">预约体检时间：</label>
										<select name="beginYear" id="beginYear">
											<% for (int i=2015; i<=2020; i++) { %>
												<option value="<%=i%>"><%=i%>年</option>
											<% } %>
										</select>
										<select name="beginMonth" id="beginMonth">

											<% for (int i=1; i<=12; i++) { %>
												<option value="<%=i%>"><%=i%>月</option>
											<% } %>
										</select>
										<select name="beginDay" id="beginDay">
											<% for (int i=1; i<=31; i++) { %>
												<option value="<%=i%>"><%=i%>日</option>
											<% } %>
										</select>
										<select name="beginTime" id="beginTime">
											<option value="morning">上午</option>
											<option value="evening">晚上</option>
										</select>
									</div>
									<div class="form-group col-md-6">
										<span>至</span>
										<select name="endYear" id="endYear">
											<% for (int i=2015; i<=2020; i++) { %>
												<option value="<%=i%>"><%=i%>年</option>
											<% } %>
										</select>
										<select name="endMonth" id="endMonth">
											<% for (int i=1; i<=12; i++) { %>
												<option value="<%=i%>"><%=i%>月</option>
											<% } %>
										</select>
										<select name="endDay" id="endDay">
											<% for (int i=1; i<=31; i++) { %>
												<option value="<%=i%>"><%=i%>日</option>
											<% } %>
										</select>
										<select name="endTime" id="endMonth">
											<option value="morning">上午</option>
											<option value="evening">晚上</option>
										</select>
									</div>	
								</div>
								<fieldset>
									<legend class="legend-text">选择体检选项</legend>
								<div class="row btn-row">
									<div class="state2-row">
										<div class="col-md-3">已选择组合：<span id="chooseNum">0</span><input type="hidden" name="chooseNum" value="0"></div>
										<div class="col-md-3">套餐总计：<span id="total">0元</span><input type="hidden" name="total" value="0"></div>
										<div class="col-md-3"><span id="chooseId" display="none"></span><input type="hidden" name="chooseId" value="0"></div>
									</div>
								</div>
								<table class="table table-bordered col-md-12">
									<thead>
										<tr class="success">
											<th>选择</th>
											<th>套餐编号</th>
											<th>套餐名称</th>
											<th>体检单价</th>
											<th>体检项目</th>
											<th>适合性别</th>
											<th>导入名单</th>
										</tr>
									</thead>
									<tbody>
										
										<% 
										if(itemsList!=null)
										for (int i=0; i<itemsList.size(); i++) {
											PhysicalItem physicalItem = (PhysicalItem)itemsList.get(i);
											if(Integer.parseInt(physicalItem.getIdItem()) != sum)
												continue;
										%>
										<tr>
											<td><input type="checkbox" class="checkbox" data-value="<%=physicalItem.getPriceItem()%>" data-choose="no" id="<%=physicalItem.getIdItem()%>"></td>
											<td><%=i%></td>
											<td><%=physicalItem.getNameItem()%></td>
											<td><%=physicalItem.getPriceItem()%></td>
											<td><%=physicalItem.getTypeItem()%></td>
											<td><%=physicalItem.getGenderItem()%></td>
											<td>"模拟导入"</td>
										</tr>
										<% }else{
										%>
										<script>
	AlertMes.MesSuccess("没有结果。");	
		$(function(){
		var $li_item = $(".list-group-item");
		var $showBox = $("#showBox");
	   	loadPage($(this),$showBox,"<%=basePath%>vip/vi_checkResult");	   			
	});	
    </script>
										
										<%
										}
										%>
									</tbody>
								</table>
								<div class="row submit-row col-md-12">
									<button type="reset" class="btn btn-default">取消</button>
									<button type="submit" class="btn btn-primary" id="submit" disabled>提交预约</button>
								</div>
								</fieldset>
							</form>
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