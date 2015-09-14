<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">
	$(function () {
		var $linkBtn = $(".link-btn");
		$linkBtn.bind("click", function() {
			var linkUrl = $(this).attr("data-url");
			$("#showBox").empty();
			$("#showBox").load("<%=path %>/jsp/salesman/"+ linkUrl +".jsp");
		});
	});
</script>
<div class="row col-md-12">
	<div class="row col-md-12">
		<h4>新建项目</h4>
	</div>
	<div class="row btn-row">
		<div class="col-md-6">
			<a class="link-btn" href="javascript:void(0);" data-url="sa_newProject"><button type="button" class="btn btn-default">基本信息</button></a>
			<a class="link-btn" href="javascript:void(0);" data-url="sa_testSuit"><button type="button" class="btn btn-primary">体检套餐</button></a>
			<a class="link-btn" href="javascript:void(0);" data-url=""><button type="button" class="btn btn-default">项目合同</button></a>
		</div>
		<div class="col-md-6 state-row">
			项目状态：<span>项目登记</span>
		</div>
	</div>
	<form action="#" class="form col-md-12">
		<div class="row">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">套餐信息</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="form-group col-md-3">
							<label for="">套餐生产日期：</label>
							<span>2015年8月5日</span>
						</div>
						<div class="form-group col-md-3">
							<label for="">套餐编号：</label>
							<span>TD20150800101</span>
						</div>
						<div class="form-group col-md-6">
							<label for="">体检单位</label>
							<input type="text" value="中粮集团">
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-5">
							<label for="">套餐名</label>
							<input type="text" value="行政套餐">
						</div>
						<div class="form-group col-md-2">
							<label for="">适用性别：</label>
							<select>
								<option value="1">男</option>
								<option value="2">女</option>
							</select>
						</div>
						<div class="form-group col-md-2">
							<label for="">年龄上限：</label>
							<select>
								<option value="1">10</option>
								<option value="2">20</option>
							</select>
						</div>
						<div class="form-group col-md-3">
							<label for="">年龄下限：</label>
							<select>
								<option value="0">不限</option>
								<option value="1">10</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">选择套餐</h3>
				</div>
				<div class="panel-body">
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
									<th>项目编号</th>
									<th>体检项目</th>
									<th>体检单项价格</th>
									<th>检查类型</th>
									<th>适用性别</th>
									<th>科室名称</th>
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
						<button type="submit" class="btn btn-primary">保存</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row bottom-line">
						<div class="form-group col-md-3 state2-row">
							<label for="">业务员：</label>
							<span>司徒靖</span>
						</div>
						<div class="form-group col-md-3">
						<a href="#"><button type="button" class="btn btn-sm btn-default">请求审核</button></a>
						</div>
						<div class="form-group col-md-6 state2-row tr">
							<label for="">状态：</label>
							<span>保存</span>
							<b>&nbsp;&nbsp;&nbsp;</b><span>2015年8月2日</span>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label for="">部门经理：</label>
							<span>司徒靖</span>
						</div>
						<div class="form-group col-md-6 tr">
							<label for="">状态：</label>
							<span>等待审核</span>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label for="recomment">审核意见：</label>
							<textarea cols="" rows="5" name="recomment" class="form-control" readonly="readonly"></textarea>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</form>
</div>