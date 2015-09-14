<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">
	$(function () {
		var $linkBtn = $(".link-btn");
		$linkBtn.bind("click", function() {
			var linkUrl = $(this).attr("data-url");
			$("#showBox").empty();
			$("#showBox").load("<%=path %>/jsp/salesman/"+ linkUrl +".jsp");
		});

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
<div class="row col-md-12">
	<div class="row col-md-12">
		<h4>新建项目</h4>
	</div>
	<div class="row btn-row">
		<div class="col-md-6">
			<a class="link-btn" href="javascript:void(0);" data-url="sa_newProject"><button type="button" class="btn btn-primary">基本信息</button></a>
			<a class="link-btn" href="javascript:void(0);" data-url="sa_testSuit"><button type="button" class="btn btn-default">体检套餐</button></a>
			<a class="link-btn" href="javascript:void(0);" data-url=""><button type="button" class="btn btn-default">项目合同</button></a>
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
							<span class="createDate">2015年8月3日</span>
						</div>
						<div class="form-group col-md-3 fl">
							<label for="projectId">项目编码：</label>
							<span class="projectId">TD201508001</span>
						</div>
						<div class="form-group col-md-6 fl">
							<label for="companyName">公司名称：</label> 
							<input type="text"
								value="中粮集团" name="companyName">
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="row">
						<div class="form-group col-md-8">
							<label for="companyAddress">公司地址：</label> 
							<input type="text"
								value="四川省成都市高新区尚锦路104号" name="companyAddress" style="width:80%">
						</div>
						<div class="form-group col-md-4">
							<label for="test_number">体检人数范围：</label> 
							<select
								name="test_number">
								<option value="1">100人以下</option>
								<option value="2">100-300人</option>
								<option value="3">300-500人</option>
								<option value="4">500人以上</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-5">
							<label for="beginDate">项目起始时间：</label> 
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
							<label for="endDate">项目结束时间：</label> 
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
						<div class="form-group col-md-2">
							<label for="testTimes">体检次数</label> <input type="text"
								name="testTimes" value="3" style="width: 15%"><label>次</label>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label for="projectIntroduce">项目简介：</label>
							<textarea cols="" rows="5" name="projectIntroduce"
								class="form-control"></textarea>
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
						<div class="form-group col-md-3">
							<label for="representName">姓名：</label> <input type="text"
								value="上官清明" name="representName">
						</div>
						<div class="form-group col-md-3">
							<label for="gender">性别：</label> <select name="gender">
								<option value="1">男</option>
								<option value="2">女</option>
							</select>
						</div>
						<div class="form-group col-md-3">
							<label for="telephone">手机：</label> <input type="text"
								value="13560403025" name="telephone">
						</div>
						<div class="form-group col-md-3">
							<label for="officePhone">办公电话：</label> <input type="text"
								value="028" name="area_code" style="width:15%">- <input
								type="text" value="8313599" name="phone" style="width:40%">
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-3">
							<label for="email">邮箱：</label> <input type="email"
								value="sgqingming@163.com" name="email">
						</div>
						<div class="form-group col-md-9">
							<label for="connectAddress">联系地址：</label> <input type="text"
								value="四川省成都市高新区尚锦路104号1221室（人资部）" name="connectAddress"
								style="width:86%">
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-3">
							<label for="workerName">业务员</label> <input type="text"
								value="司徒靖" name="workerName">
						</div>
						<div class="form-group col-md-3">
							<button type="submit" class="btn btn-sm btn-primary">保存</button>
							<button type="button" class="btn btn-sm btn-success">请求审核</button>
						</div>
						<div class="form-group col-md-6">
							<label for="status">状态：</label>
							<span>保存</span><b>&nbsp;&nbsp;&nbsp;</b>
							<span>2015年8月2日</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
