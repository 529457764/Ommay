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
			<h4>体检结果报告</h4>
		</div>
		<div class="panel-body">
			<div class="row col-md-12 tc">
				<h3><span>中粮集团</span><b>&nbsp;&nbsp;&nbsp;</b><span>第1次体检结果报告</span></h3>
			</div>
			<table class="table table-bordered col-md-12">
				<thead class="success">
					<tr>
						<th>项目编号</th>
						<th>体检名称</th>
						<th>预约体检人数</th>
						<th>实际体检人数</th>
						<th>复检人数</th>
						<th>导出详细体检报告</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>TD00010201</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<% for (int i=0; i<8; i++) { %>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					<% } %>
				</tbody>
			</table>
			<div class="row col-md-12 tr fr">
				<button class="btn btn-sm btn-default">下载缺检名单</button>
				<button class="btn btn-sm btn-default">下载完整报告</button>
			</div>
		</div>
	</div>
</div>
