<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style type="text/css">
	.label1, .label2, .label3, .label4, .label5 {
		width: 20%;
	}
	.label4 {
		width: 18%;
	}
	.label5 {
		width: 22%;
	}
	.label6 {
		width: 20%;
	}
	.label7 {
		width: 42%;
	}
	.total-money-row {
		margin-bottom: 20px;
	}
	.total-money {
		color: red;
		text-decoration: underline;
	}

</style>
<div class="row col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="tc"><span>中粮集团</span><b>&nbsp;&nbsp;&nbsp;</b><span>第2次体检预约</span></h4>
		</div>
		<div class="panel-body">
			<div class="row">
				<div class="col-md-2 label1">
					<label for="">项目编号：</label>
					<span>TD0001</span>
				</div>
				<div class="col-md-2 label2">
					<label for="">客户代表：</label>
					<span>上官清明</span>
				</div>
				<div class="col-md-2 label3">
					<label for="">业务员：</label>
					<span>司徒靖</span>
				</div>
				<div class="col-md-2 label4">
					<label for="">部门经理：</label>
					<span>李世明</span>
				</div>
				<div class="col-md-2 label5">
					<label for="">预约时间：</label>
					<span>2015年8月2日</span>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 label6">
					<label for="">预约号：</label>
					<span>TD201508001</span>
				</div>
				<div class="col-md-5 label7">
					<label for="">预约体检时间：</label>
					<span>2015年8月7日上午</span>--<span>2015年8月9日下午</span>
				</div>
				<div class="col-md-2 label8">
					<label for="">体检人数：</label>
					<span>xxx</span>
				</div>
				<div class="col-md-2 label9">
					<label for="">已选套餐：</label>
					<span>4个</span>
				</div>
			</div>
			<table class="table table-bordered col-md-12">
				<thead>
					<tr class="success">
						<th>套餐编号</th>
						<th>套餐名</th>
						<th>套餐单价</th>
						<th>体检人数</th>
						<th>合计</th>
						<th>体检名单</th>
					</tr>
				</thead>
				<tbody>
					<% for (int i=1; i<=5; i++) { %>
						<tr>
							<td><%=i%></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>		
					<%	} %>
				</tbody>
			</table>
			<div class="row col-md-12 tr fr total-money-row">
				<span class="total-money">体检总价：530000</span>
			</div>
			<table class="table table-bordered col-md-12">
				<thead>
					<tr class="success">
						<th>时间</th>
						<th>状态</th>
						<th>操作人员</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2015年8月2日</td>
						<td>提交预约</td>
						<td>上官清明</td>
					</tr>
					<tr>
						<td>2015年8月2日</td>
						<td>确定预约</td>
						<td>李世明</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>