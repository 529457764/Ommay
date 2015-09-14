<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="row col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4>团队项目</h4>
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
						<tr>
							<td>1</td>
							<td>201508001</td>
							<td>中粮集团</td>
							<td>200~300人</td>
							<td>签约中</td>
							<td>上官清明</td>
							<td>司徒靖</td>
							<td>李世明</td>
						</tr>
						<tr>
							<td>2</td>
							<td>201509001</td>
							<td>华迪公司</td>
							<td>100人以下</td>
							<td>第2次体检结果查询</td>
							<td>元景宁</td>
							<td>梁旭</td>
							<td>李世明</td>
						</tr>
						<td>3</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>