<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

if(session.getAttribute("accountName")==null)
	response.sendRedirect(basePath);
HashMap map = (HashMap)request.getAttribute("com");
if(map==null){
	response.sendRedirect(basePath+"representation/re_userCenter");
	return;
}
/* 
map.put("id",ag.getAccountGroup());
map.put("namemaster",name);
map.put("comname", com);
map.put("emailmaster",ag.getNameMaster());
map.put("phonemaster", ag.getPhoneMaster());
map.put("workingphonemaster", ag.getWorkingPhoneMaster());
map.put("salesman", "宫鸣"); */

%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>客户代表首页</title>
    <script type="text/javascript" src="<%=path %>/resource/jquery/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=path %>/resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/resource/css/main1.css">
    <script type="text/javascript" src="<%=path%>/resource/js/calendar.js"></script>
<script type="text/javascript" src="<%=path %>/resource/js/showPage.js"></script>
    <link rel="stylesheet" href="<%=path%>/resource/css/user.css">
</head>
<body>
	<header class="header">
		<nav class="navbar navbar-default" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-navbar-collapse">
						<span class="sr-only">
							Toggle navigation
						</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">安生美</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-navbar-collapse">
					<ul class="nav navbar-nav">

					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span><%=map.get("namemaster")%></span>客户代表<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="<%=path%>">注销</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<section class="container">
		<div class="row">
			<!-- 左侧目录 -->
			<div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
				<ul class="list-group">
					<a href="<%=path%>/representation/re_userCenter" data-url="re_userCenter" class="list-group-item active">用户中心</a>
					<a href="<%=path%>/representation/re_testAppointment" data-url="re_testAppointment" class="list-group-item">体检预约</a>
					<a href="<%=path%>/representation/re_checkResult" data-url="re_checkResult" class="list-group-item">查看体检结果</a>

				</ul>
			</div>
			<!-- 右侧主要内容 -->
			<div class="col-xs-12 col-sm-10 col-md-10 col-lg-10" id="showBox">
				<div class="check-body">
			        <fieldset>
			            <legend>客户代表个人信息</legend>
			            <div class="ct">
			                <div class="ct-head">
			                    <span id="name"><%=map.get("namemaster")%></span>  |
			                    <a href="#" data-toggle="modal" data-target="#changeUserInfo">修改个人信息</a> | 
			                    <a href="#" data-toggle="modal" data-target="#myModal">修改密码</a> 
			                </div>
			                <div class="ct-middle">
			                    <div class="user-ID">
			                        <label>会员ID</label>
			                        <span id="user-ID"><%=map.get("id")%></span>
			                    </div>
			                    <div class="phone">
			                        <label >手机</label>
			                        <span id="phone"><%=map.get("phonemaster")%></span></span>
			                    </div>
			                    <div class="office-phone">
			                        <label >办公电话</label>
			                        <span id="office-phone"><%=map.get("workingphonemaster")%></span>
			                    </div>
			                    <div class="email">
			                        <label >邮箱</label>
			                        <span id="email"><%=map.get("emailmaster")%></span>
			                    </div>
			                    <div class="">
			                        <label >代表公司</label>
			                        <span id=""><%=map.get("comname")%></span>
			                    </div>
			                    <div class="">
			                        <label >项目ID</label>
			                        <span id="">TD0001</span>
			                    </div>
			                    <div class="">
			                        <label >业务员</label>

			                        <span id=""><%=map.get("salesman")%></span>
			                    </div>
			                    <div class="">
			                        <label >部门经理</label>
			                        <span id="">梁都城</span>
			                    </div>
			                </div>
			            </div>      
			        </fieldset>
			    </div>


			<!-- 修改密码模态框 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="changePwd">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="changePwd">修改密码</h4>
			      </div>
			    <form action="../account/changePassword">
			      <div class="modal-body">

			          <div class="form-group">
			            <label for="old-pwd" class="control-label">请输入旧密码:</label>
			            <input type="text" class="form-control" id="old-pwd" name="oldPassword">
			          </div>
			          <div class="form-group">
			            <label for="new-pwd" class="control-label">请输入新密码:</label>
			            <input type="text" class="form-control" id="new-pwd" name="newPassword">
			          </div>
			          <div class="form-group">
			            <label for="new-pwd2" class="control-label">请再次输入新密码:</label>
			            <input type="text" class="form-control" id="new-pwd2" name="newPassword2">
			          </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <button type="submit" class="btn btn-primary">保存</button>
			      </div>
			    </form>
			    </div>
			  </div>
			</div>

			<!-- 修改用户信息模态框 -->
			<div class="modal fade" id="changeUserInfo" tabindex="-1" role="dialog" aria-labelledby="changePwd">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="changePwd">修改用户信息</h4>
			      </div>
			    <form action="../check/UserMessage/updateUserMessage">
			      <div class="modal-body">
			        <div class="ct-middle" >
			            <div class="user-ID">
			                <label class="no-bg">姓名</label>
			                <span id="user-ID"><%=map.get("namemaster")%></span>
			            </div>
			            <div class="user-ID ">
			                <label>员工ID</label>
			                <span id="user-ID"><%=map.get("id")%></span>
			            </div>
			            <div class="position ">
			                <label >类别</label>
			                <span id="position">客户代表</span>
			            </div>
			            <div class="">
			                        <label >代表公司</label>
			                        <span id=""><%=map.get("comname")%>span>
			                    </div>
			                    <div class="">
			                        <label >部门经理</label>
			                        <span id="">梁都城</span>
			                    </div>    
			        </div>
			        <div class="clear"> </div>
			       
			          <div class="form-group md">
			            <label for="old-pwd" class="control-label">手机</label>
			            <input type="text" class="form-control" name="iphone">
			          </div>
			          <div class="form-group md">
			            <label for="new-pwd" class="control-label">办公电话</label>
			            <input type="text" class="form-control" name="officePhone">
			          </div>
			          <div class="form-group md">
			            <label for="new-pwd2" class="control-label">邮箱</label>
			            <input type="text" class="form-control" name="email">
			          </div>
			          <div class="form-group md">
			            <label for="" class="ct-ad">地址</label>
			            <textarea cols="57" rows="4" width="75%" ></textarea>
			          </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <button type="submit" class="btn btn-primary">保存</button>
			      </div>
			    </form>
			    </div>
			  </div>
			</div>
			</div>
		</div>
	</section>
	<footer>
		
	</footer>
</body>
</html>