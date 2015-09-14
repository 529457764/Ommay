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
        	<h4>我的会员项目</h4>
        </div>
    	<div class="panel-body">
   	        <div class="row col-md-12">
                <form class="form" action="#">
                    <div class="form-group fl">
                        <button type="button" class="btn btn-sm btn-primary">注册会员</button>
                    </div>
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
                            <th>会员ID</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>状态</th>
                            <th>业务员</th>
                            <th>部门经理</th>           
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>HY00001</td>
                            <td>何小萌</td>
                            <td>男</td>
                            <td>预约成功</td>
                            <td>司徒靖</td>
                            <td>李世明</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>HY00002</td>
                            <td>黄小蕾</td>
                            <td>女</td>
                            <td>查看体检结果</td>
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
                        </tr>
                    </tbody>
                </table>
            </div>
    	</div>
    </div>
</div>