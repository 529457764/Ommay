<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	LinkedList<Map<String, String>> resultList = (LinkedList<Map<String, String>>)request.getAttribute("phys_result");
	if(resultList==null){
		response.sendRedirect(basePath+"account/login");
	}
%>
<script type="text/javascript">
	$(function(){
		var $resultBtn = $(".result-btn");
		$resultBtn.bind("click", function(){
			showPage($(this), $("#showBox"), "<%=path%>/vip/", "");
		})
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
						<th>体检ID</th>
						<th>体检时间</th>
						<th>状态</th>
						<th>状态更新日期</th>
					</tr>
				</thead>
				<tbody>
					<% for(int i=0; i<resultList.size(); i++) {
						Map<String,String> resultMap = (HashMap<String,String>)resultList.get(i);
					 %>
					<tr>
						<td><%=i+1%></td>
						<td><%= resultMap.get("phsy_time") %></td>
						<% if(resultMap.get("phys_status_boolean").equalsIgnoreCase("true")) {%>
						<td><a class="result-btn" href="#" data-url="phys_result_detail?project_uid=<%=resultMap.get("phys_project_uid")%>"><%=resultMap.get("phsy_status")%></a></td>
						<% }else {%>
						<td><%=resultMap.get("phsy_status")%></td>
						<%} %>		
						<td><%= resultMap.get("phsy_update_date") %></td>
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