<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	/*
	
	modelmap.addAttribute("phys_doctor_id",doctorId);
    	modelmap.addAttribute("phys_doctor_name",doctorName);
    	modelmap.addAttribute("phys_date",doctorName);
    	modelmap.addAttribute("phys_report",reportList);
    	modelmap.addAttribute("phys_recommendation",recommendation);
	
	*/		
	ArrayList reportList = (ArrayList)request.getAttribute("phys_report");
	if(reportList==null){
		response.sendRedirect(basePath+"account/login");
	}
	String physClientName = (String)request.getAttribute("phys_client_name");
	String physDoctorId = (String)request.getAttribute("phys_doctor_id");// Havn't used yet !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	String physDoctorName = (String)request.getAttribute("phys_doctor_name");// Havn't used yet !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	String physDate = (String)request.getAttribute("phys_date");// Havn't used yet !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	String physRecommendation = (String)request.getAttribute("phys_recommendation");		
%>
<div class="row col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4>体检结果报告</h4>
		</div>
		<div class="panel-body">
			<div class="row col-md-12 tc">
				<h3><span><%=physClientName%></span><b>&nbsp;&nbsp;&nbsp;</b><span>第1次体检结果报告</span></h3>
			</div>
			<table class="table table-bordered col-md-12">
				<thead class="success">
					<tr>
						<th>项目编号</th>
						<th>体检项目</th>
						<th>体检结果</th>
						<th>备注</th>
					</tr>
				</thead>
				<tbody>
					<% for (int i=0; i<reportList.size(); i++) {
						Map reportItem = (HashMap)reportList.get(i);
					 %>
						<tr>
							<td><%=reportItem.get("phsy_report_id")%></td>
							<td><%=reportItem.get("phsy_report_project")%></td>
							<td><%=reportItem.get("phsy_report_result")%></td>
							<td><%=reportItem.get("phsy_report_backup")%></td>
						</tr>
					<% } %>
				</tbody>
			</table>
			
		</div>
	</div>
</div>
