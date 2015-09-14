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
							<span class="companyName">中粮集团</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="row">
						<div class="form-group col-md-8">
							<label for="companyAddress">公司地址：</label> 
							<span class="companyAddress">四川省成都市高新区尚锦路104号</span>
						</div>
						<div class="form-group col-md-4">
							<label for="test_number">体检人数范围：</label>
							<span class="test_number">100人以下</span> 
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-5">
							<label for="beginDate">项目起始时间：</label>
							<span class="beginYear">2015年</span><b>&nbsp;&nbsp;&nbsp;</b>
							<span class="beginMonth">1月</span><b>&nbsp;&nbsp;&nbsp;</b>
							<span class="beginDay">1日</span>
						</div>
						<div class="form-group col-md-5">
							<label for="endDate">项目结束时间：</label> 
							<span class="endYear">2015年</span><b>&nbsp;&nbsp;&nbsp;</b>
							<span class="endMonth">1月</span><b>&nbsp;&nbsp;&nbsp;</b>
							<span class="endDay">1日</span>
						</div>
						<div class="form-group col-md-2">
							<label for="testTimes">体检次数</label><span class="testTimes">3</span><label>次</label>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label for="projectIntroduce">项目简介：</label>
							<textarea cols="" rows="5" name="projectIntroduce"
								class="form-control" readonly="readonly">123123123</textarea>
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
							<label for="representName">姓名：</label> 
							<span class="representName">上官清明</span>
						</div>
						<div class="form-group col-md-3">
							<label for="gender">性别：</label> 
							<span class="gender">男</span>
						</div>
						<div class="form-group col-md-3">
							<label for="telephone">手机：</label>
							<span class="telephone">13560403025</span> 
						</div>
						<div class="form-group col-md-3">
							<label for="officePhone">办公电话：</label>
							<span class="area_code">028</span>&nbsp;-&nbsp;<span class="phone">8313599</span> 
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-3">
							<label for="email">邮箱：</label> 
							<span class="email">sgqingming@163.com</span>
						</div>
						<div class="form-group col-md-9">
							<label for="connectAddress">联系地址：</label> 
							<span class="connectAddress">四川省成都市高新区尚锦路104号1221室（人资部）</span>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-3">
							<label for="workerName">业务员</label> 
							<span class="workerName">司徒靖</span>
						</div>
						<div class="form-group col-md-3">
							
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
	
	<form action="#" class="form col-md-12">
		<div class="row">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">审核状态</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="form-group col-md-4">
							<label for="">部门经理：</label> 
							<span>李世明</span>
						</div>
						<div class="form-group">
							<label for="">审核状态</label> 
							<span>等待审核</span>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label for="advice">审核意见：</label>
							<textarea cols="" rows="5" name="advice" class="form-control"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<button type="submit" class="btn btn-sm btn-success">通过审核</button>
							<button type="button" class="btn btn-sm btn-danger">拒绝审核</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	
</div>
