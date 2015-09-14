<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
	$(function(){
		var $detailBtn = $(".detailBtn");
		$detailBtn.bind("click", function(){
			showPage($(this), $("#showBox"), "<%=path%>/jsp/manager/", ".jsp");
		});
	});
</script>

<div class="row col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4>团队体检预约</h4>
		</div>
		<div class="panel-body">
			<table class="table table-bordered col-md-12">
				<thead>
					<tr class="success">
						<th>序号</th>
						<th>预约号</th>
						<th>项目编号</th>
						<th>预约名称</th>
						<th>预约时间</th>
						<th>客户代表</th>
						<th>业务员</th>
						<th>预约状态</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>TD201508001</td>
						<td>TD0001</td>
						<td><a class="detailBtn" href="javascript:void(0);" data-url="ma_groupAppointmentDetail">中粮集团第2次体检预约</a></td>
						<td>2015年8月2日</td>
						<td>上官清明</td>
						<td>司徒靖</td>
						<td>已预约</td>
					</tr>
					<% for (int i=2; i<=10; i++) { %>
						<tr>
							<td><%=i%></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>		
					<%	} %>
				</tbody>
			</table>
		</div>
	</div>
</div>