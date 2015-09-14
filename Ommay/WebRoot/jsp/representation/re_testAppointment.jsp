<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">
	$beginYear = $("#beginyear");
	$beginMonth = $("#beginMonth");
	$beginDay = $("#beginDay");
	$endYear = $("#endyear");
	$endMonth = $("#endMonth");
	$endDay = $("#endDay");
	
	$beginYear.change(function() {
		calendar($beginYear, $beginMonth, $beginDay);
	});
	$beginMonth.change(function() {
		calendar($beginYear, $beginMonth, $beginDay);
	});
	$endYear.change(function() {
		calendar($endYear, $endMonth, $endDay);
	});
	$endMonth.change(function() {
		calendar($endYear, $endMonth, $endDay);
	});
</script>

<div class="row col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4>体检预约</h4>
		</div>
		<div class="panel-body">
			<form action="" class="form col-md-12">
				<div class="row tc">
					<div class="form-group col-md-12">
						<span>中粮集团</span><b>&nbsp;&nbsp;&nbsp;</b><span>第2次体检预约</span>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-6">
						<label for="">预约体检时间：</label>
						<select name="beginYear" id="beginYear">
							<% for (int i=2015; i<=2020; i++) { %>
								<option value="<%=i%>"><%=i%>年</option>
							<% } %>
						</select>
						<select name="begintMonth" id="beginMonth">
							<% for (int i=1; i<=12; i++) { %>
								<option value="<%=i%>"><%=i%>月</option>
							<% } %>
						</select>
						<select name="beginDay" id="beginDay">
							<% for (int i=1; i<=31; i++) { %>
								<option value="<%=i%>"><%=i%>日</option>
							<% } %>
						</select>
						<select name="beginTime" id="beginTime">
							<option value="morning">上午</option>
							<option value="evening">晚上</option>
						</select>
					</div>
					<div class="form-group col-md-6">
						<span>至</span>
						<select name="endYear" id="endYear">
							<% for (int i=2015; i<=2020; i++) { %>
								<option value="<%=i%>"><%=i%>年</option>
							<% } %>
						</select>
						<select name="endMonth" id="endMonth">
							<% for (int i=1; i<=12; i++) { %>
								<option value="<%=i%>"><%=i%>月</option>
							<% } %>
						</select>
						<select name="endDay" id="endDay">
							<% for (int i=1; i<=31; i++) { %>
								<option value="<%=i%>"><%=i%>日</option>
							<% } %>
						</select>
						<select name="endTime" id="endMonth">
							<option value="morning">上午</option>
							<option value="evening">晚上</option>
						</select>
					</div>	
				</div>
				<fieldset>
					<legend class="legend-text">选择体检选项</legend>
				<div class="row btn-row">
					<div class="state2-row">
						<div class="col-md-3">已选择组合：<span>21</span></div>
						<div class="col-md-3">套餐总计：<span>964元</span></div>
					</div>
				</div>
				<table class="table table-bordered col-md-12">
					<thead>
						<tr class="success">
							<th>选择</th>
							<th>套餐编号</th>
							<th>套餐名称</th>
							<th>体检单价</th>
							<th>体检人数</th>
							<th>合计</th>
							<th>导入名单</th>
						</tr>
					</thead>
					<tbody>
						<% for (int i=0; i<10; i++) { %>
							<tr>
								<td><input type="checkbox"></td>
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
				<div class="row submit-row col-md-12">
					<button type="reset" class="btn btn-default">取消</button>
					<button type="submit" class="btn btn-primary">提交预约</button>
				</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>