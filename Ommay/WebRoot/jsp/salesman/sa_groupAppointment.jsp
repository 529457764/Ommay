<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<HashMap> groupAppointmentsList = (List<HashMap>)request.getAttribute("groupAppointmentsList");
%>
<script type="text/javascript">
	$(function(){
		var $detailBtn = $(".detailBtn");
		$detailBtn.bind("click", function(){
			showPage($(this), $("#showBox"), "<%=path%>/salesman/", "");//由于团队预约和会员预约都要绕到我的Controller先，所以路径被改了
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
					<% for (int i=0; i<groupAppointmentsList.size(); i++) {
						HashMap item = groupAppointmentsList.get(i);
					 %>
						<tr>
							<td><%=i%></td>
							<td><%=item.get("appointmentId")%></td>
							<td><%=item.get("projectId") %></td>
							<td><%=item.get("projectName") %></td>
							<td><%=item.get("appointmentTime") %></td>
							<td><%=item.get("appointmentClinet") %></td>
							<td><%=item.get("appointmentSalsemen") %></td>
							<td><%=item.get("appointmentStatus") %></td>
						</tr>		
					<%	}; %>
				</tbody>
			</table>
		</div>
	</div>
</div>