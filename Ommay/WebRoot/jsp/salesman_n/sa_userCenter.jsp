<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="c.tld" prefix="c" %>
<%@ taglib uri="fmt.tld" prefix="fmt" %>
<%@ taglib uri="fn.tld" prefix="fn" %>
<%@ taglib uri="sql.tld" prefix="sql" %>
<%@ taglib uri="x.tld" prefix="x" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% String id = (String)session.getAttribute("accountName"); %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>业务员首页</title>
    <script type="text/javascript" src="<%=path %>/resource/jquery/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=path %>/resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/resource/css/main1.css">
    <script type="text/javascript" src="<%=path %>/resource/js/showPage.js"></script>
    <script type="text/javascript" src="<%=path%>/resource/js/calendar.js"></script>
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
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span>xxx</span>业务员<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="../account/logOff">注销</a></li>
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
<%--
				<ul class="list-group">
					<a href="<%=path%>/view/sa_groupProject" data-url="sa_groupProject" class="list-group-item">团体项目</a>
					<a href="<%=path%>/view/sa_myGroupProject" data-url="sa_myGroupProject" class="list-group-item">我的团体项目</a>
					<a href="<%=path%>/view/sa_vipProject" data-url="sa_vipProject" class="list-group-item">会员项目</a>
					<a href="<%=path%>/view/sa_myVipProject" data-url="sa_myVipProject" class="list-group-item">我的会员项目</a>
					<a href="<%=path%>/view/sa_newProject" data-url="sa_newProject" class="list-group-item">新建项目</a>
					<a href="<%=path%>/view/sa_VipManage" data-url="sa_VipManage" class="list-group-item">管理用户</a>
					<a href="<%=path%>/salesman/sa_groupAppointment" data-url="sa_groupAppointment" class="list-group-item">团体体检预约</a>
					<a href="<%=path%>/salesman/sa_vipAppointment" data-url="sa_vipAppointment" class="list-group-item">个人体检预约</a>
					<a href="<%=path%>/view/sa_userCenter" data-url="sa_userCenter" class="list-group-item active">用户中心</a>
				</ul>
				 --%>
				<%@ include file="sa_list.jsp" %>
			</div>
			<!-- 右侧主要内容 -->
			<div class="col-xs-12 col-sm-10 col-md-10 col-lg-10" id="showBox" data-box="sa_userCenter">
				<link rel="stylesheet" href="<%=path%>/resource/css/user.css">
					<div class="check-body">
						<fieldset>
					        <legend>工作人员个人信息</legend>
					        <div class="ct">
					            <div class="ct-head">
					                <span id="name">XXX</span>  |
					                <a href="#" data-toggle="modal" data-target="#changeUserInfo">修改个人信息</a> | 
					                <a href="#" data-toggle="modal" data-target="#myModal">修改密码</a> 
					            </div>
					            <div class="ct-middle">
                    <div class="user-ID">
                        <label>员工ID</label>
                        <span id="user-ID"></span>
                    </div>
                   <!--  <div class="sex">
                        <label >性别</label>
                        <span id="sex">男</span>
                    </div> -->
                    <div class="position">
                        <label >职位</label>
                        <span id="position">业务员</span>
                    </div>
                   <!--  <div class="IDcard">
                        <label >身份证号码</label>
                        <span id="IDcard">440014199105275634</span>
                    </div> -->
                    <div class="phone">
                        <label >手机</label>
                        <span id="phone"></span>
                    </div>
                    <!-- <div class="office-phone">
                        <label >办公电话</label>
                        <span id="office-phone">028-8375417</span>
                    </div> -->
                    <div class="email">
                        <label >邮箱</label>
                        <span id="email"></span>
                    </div>
                   <!--  <div class="address">
                        <label >联系地址</label>
                        <span id="address" title="sss">四川省成都市西区大道1001号13楼市场部ssssssssssssssssssssssssssssssss</span>
                    </div> -->
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
					            <input type="password" class="form-control" id="oldPassword" name="oldPassword" required="required">
					          </div>
					          <div class="form-group">
					            <label for="new-pwd" class="control-label">请输入新密码:</label>
					            <input type="password" class="form-control" id="newPassword" name="newPassword" required="required">
					          </div>
					          <div class="form-group">
					            <label for="new-pwd2" class="control-label">请再次输入新密码:</label>
					            <input type="password" class="form-control" id="newPassword2" name="newPassword2" required="required">
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
                <span id="user-ID"></span>
            </div>
            <!-- <div class="sex ">
                <label >性别</label>
                <span id="sex">男</span>
            </div> -->
            <div class="user-ID ">
                <label>员工ID</label>
                <span id="user-ID"></span>
            </div>
            <div class="position ">
                <label >职位</label>
                <span id="position">业务员</span>
            </div>
            <!-- <div class="IDcard ">
                <label >身份证号码</label>
                <span id="IDcard">440014199105275634</span>
            </div>  -->   
        </div>
         <div class="form-group md ">
            <label class="control-label">手机</label>
            <input type="tel" min="13" max="13" class="form-control" name="iphone" required="required">
          </div>
           <div class="form-group md">
            <label for="new-pwd" class="control-label">办公电话</label>
            <input type="tel" class="form-control" name="officePhone" required="required">
          </div> 
          <div class="form-group md email">
            <label for="new-pwd2" class="control-label">邮箱</label>
            <input type="email" class="form-control" name="email" required="required">
          </div>
          <!-- <div class="form-group md">
            <label for="" class="ct-ad">地址</label>
            <textarea cols="57" rows="4" width="75%" ></textarea>
          </div> -->
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