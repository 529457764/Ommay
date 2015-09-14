<%@page import="com.ommay.entity.PhysicalItem"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	List<Object> itemsList = (List<Object>)request.getAttribute("appointments_content");
	int sum = (Integer)request.getAttribute("appointments_sum");
	String name = (String)request.getAttribute("name");
	if(itemsList==null){
		response.sendRedirect(basePath+"account/login");
	}
%>

<script type="text/javascript">
	$(function(){
		$year = $("#year");
		$month = $("#month");
		$day = $("#day");
		$year.change(function() {
			calendar($year, $month, $day);
		});
		$month.change(function() {
			calendar($year, $month, $day);
		});
		
		/*
		//统计价钱
		var sum = 0;
		var num = 0;
		var ids = new Array();
		$(document).on("click", '.checkbox', function() {
			var price = parseInt($(this).attr("data-value"));
			var id = $(this).attr("id");
			if($(this).attr("data-choose") == "no"){
				sum += price;
				num += 1;
				ids[id] = true;
				$(this).attr("data-choose","yes");	
			} else {
				$(this).attr("data-choose","no");
				sum -= price;
				num -= 1;
				ids[id] = false;
			}
			console.log("sum:"+sum);
			console.log("num:"+num);
			console.log("ids:"+ids.length);
			console.log("ids["+id+"]:"+ids[id]);
			$("#total").html(sum);
			$("input[name='total']").val(sum);
			$("#chooseNum").html(num);
			$("input[name='chooseNum']").val(num);
			$("#chooseId").val(ids);
			$("input[name='chooseId']").val(ids);
			if(sum>0) {
				$("#submit").attr("disabled",false);
				$("#submit").html("提交");
			} else {
				$("#submit").attr("disabled",true);
				$("#submit").html("不可提交");
			}
		});
	*/
	});
	
	
</script>
<div class="row col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4>体检预约</h4>
		</div>
		<div class="panel-body">
			<form action="<%=basePath+"vip/vi_submitAppointment"%>" class="form col-md-12" method="post">
				<div class="row tc">
					<div class="form-group col-md-4">
						<span><%=name %></span><b>&nbsp;&nbsp;&nbsp;</b><span>第<%=sum+1%>次体检预约</span>
					</div>
					<div class="form-group col-md-8">
						<label for="">预约体检时间：</label>
						<select name="year" id="year">
							<% for (int i=2015; i<=2020; i++) { %>
								<option value="<%=i%>"><%=i%>年</option>
							<% } %>
						</select>
						<select name="month" id="month">
							<% for (int i=1; i<=12; i++) { %>
								<option value="<%=i%>"><%=i%>月</option>
							<% } %>
						</select>
						<select name="day" id="day">
							<% for (int i=1; i<=31; i++) { %>
								<option value="<%=i%>"><%=i%>日</option>
							<% } %>
						</select>
						<select name="time">
							<option value="morning">上午</option>
							<option value="evening">晚上</option>
						</select>
					</div>	
				</div>
				<fieldset>
					<legend class="legend-text">选择体检选项</legend>
				<div class="row btn-row">
					<div class="state2-row">
						<div class="col-md-3">已选择组合：<span id="chooseNum">0</span><input type="hidden" name="chooseNum" value="0"></div>
						<div class="col-md-3">套餐总计(元)：<span id="total">0</span><input type="hidden" name="total" value="0"></div>
						<div class="col-md-3">选择列表：<span id="chooseId">0</span><input type="hidden" name="chooseId" value="0"></div>
					</div>
				</div>
				<table class="table table-bordered col-md-12">
					<thead>
						<tr class="success">
							<th>选择</th>
							<th>项目编号</th>
							<th>体检项目</th>
							<th>体检单项价格</th>
							<th>检查类型</th>
							<th>适用性别</th>
							<th>科室名称</th>
						</tr>
					</thead>
					<tbody>
						<% for (int i=0; i<itemsList.size(); i++) {
							PhysicalItem physicalItem = (PhysicalItem)itemsList.get(i);
							if(Integer.parseInt(physicalItem.getIdItem()) > 12)
								continue;
						%>
							<tr>
								<td><input type="checkbox" class="checkbox" data-value="<%=physicalItem.getPriceItem()%>" data-choose="no" id="<%=physicalItem.getIdItem()%>"></td>
								<td><%=i%></td>
								<td><%=physicalItem.getNameItem()%></td>
								<td><%=physicalItem.getPriceItem()%></td>
								<td><%=physicalItem.getTypeItem()%></td>
								<td><%=physicalItem.getGenderItem()%></td>
								<td><%=physicalItem.getDepartmentItem()%></td>
							</tr>
						<% } %>
					</tbody>
				</table>
				<div class="row col-md-12 tr fr">
					<button type="reset" class="btn btn-default">取消</button>
					<button type="submit" class="btn btn-primary" id="submit" disabled>提交预约</button>
				</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>