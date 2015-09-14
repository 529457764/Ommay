<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">
	$(function(){
		var $resultBtn = $(".result-btn");
		$resultBtn.bind("click", function() {
		   	showPage($(this), $("#showBox"), "<%=path%>/jsp/representation/", ".jsp");
		});	
	});
</script>
<div class="row col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4>查看体检结果</h4>
		</div>
		<div class="panel-body">
			<div class="row col-md-12 tc">
				<h4>体检预约列表</h4>
			</div>
			<table class="table table-bordered col-md-12">
				<thead>
					<tr class="success">
						<th>体检次数</th>
						<th>体检时间</th>
						<th>状态</th>
						<th>状态更新日期</th>
						<th>业务员</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>第1次体检</td>
						<td>2014年11月2日下午</td>
						<td><a class="result-btn" href="javascript:void(0);" data-url="re_resultDetail">结果查询</a></td>
						<td>2014年11月17日</td>
						<td>司徒靖</td>
					</tr>
					<tr>
						<td>第2次体检</td>
						<td>2015年11月4日上午</td>
						<td><a href="#">提交预约</a></td>
						<td>2015年11月4日</td>
						<td>司徒靖</td>
					</tr>
					<% for(int i=0; i<8; i++) { %>
						<tr>
							<td>1</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					<% } %>
				</tbody>
			</table>
			<div>
				<!-- 分页 -->
			</div>
		</div>
	</div>
</div>