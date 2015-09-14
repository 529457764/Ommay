<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String success = (String)request.getAttribute("submitAppointmentsuccess");
HashMap map = (HashMap)request.getAttribute("user");
if(session.getAttribute("accountName")==null)
	response.sendRedirect(basePath);
if(success == null && map == null){
	response.sendRedirect(basePath+"vip");
	return;
}
	
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>会员首页</title>
    <script type="text/javascript" src="<%=path %>/resource/jquery/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=path %>/resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/resource/css/main1.css">
    <script type="text/javascript" src="<%=path %>/resource/js/showPage.js"></script>
    <script type="text/javascript" src="<%=path%>/resource/js/calendar.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/js/public.js"></script>
    <script>
	$(function(){
		var $li_item = $(".list-group-item");
		var $showBox = $("#showBox");
		var sum = 0;
		var num = 0;
	   	$li_item.bind("click", function() {
	   		sum = 0;
	   		num = 0;
	   		display($(this),$showBox);
	   	});	
	   	
	   	
	   			//统计价钱
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
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span><%=map.get("name")%></span>会员<b class="caret"></b></a>
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
					<a href="javascript:void(0);" data-url="<%=basePath%>vip/vi_userCenter" class="list-group-item">用户中心</a>
					<a href="javascript:void(0);" data-url="<%=basePath%>vip/vi_testAppointment" class="list-group-item">体检预约</a>
					<a id="check" href="javascript:void(0);" data-url="<%=basePath%>vip/vi_checkResult" class="list-group-item">查看体检结果</a>
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
		
%>
    <!-- no sigal -->
	<script>
		  			
    </script>
<%
	}
	String account = (String) session.getAttribute("accountName");
    Integer flag = (Integer) session.getAttribute("flag");
    if(account == null || flag == null )
		response.sendRedirect(basePath);	
%>
</body>
</html>