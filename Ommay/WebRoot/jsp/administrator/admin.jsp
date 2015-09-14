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

<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>model</title>
    <script type="text/javascript" src="<%=path %>/resource/jquery/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/js/admin.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=path %>/resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path %>/resource/css/admin.css">
    
</head>
<body>
    <div class="shadow"></div>
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
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">xxx<b class="caret"></b></a>
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
				<ul class="list-group">
					<a href="javascript:void(0)" class="list-group-item active">用户管理</a>
					<a href="javascript:void(0)" class="list-group-item" data-toggle="modal" data-target="#md-register">注册用户</a>
                    <a href="javascript:void(0)" class="list-group-item " >完善个人信息</a>
				</ul>
			</div>
			<!-- 右侧主要内容 -->
			<div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
				<div class="row">
					<div class="panel panel-default">
            			<div class="panel-heading">
            				<h4>主要内容</h4>
            			</div>
     

<div id="userMag" style="display:block">
                         <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active" ><a href="#employee" aria-controls="employee" role="tab" data-toggle="tab" id="Epy">员工列表</a></li>
    <li role="presentation" ><a href="#account-Rpt" aria-controls="account-Rpt" role="tab" data-toggle="tab" id="Rpt">客户代表</a></li>
    <li role="presentation" id="Clt"><a href="#client" aria-controls="client" role="tab" data-toggle="tab">会员列表</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content ">
    <div role="tabpanel" class="tab-pane active" id="employee">
        <!--  员工列表   -->
        <form class="navbar-form navbar-left pull-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
        <table class="table table-hover emplyee">
            <thead>
              <tr>
                <th class="col-st">序号</th>
                <th class="col-lg">员工ID</th>
                <th class="col-lg">姓名</th>
                <th class="col-st">性别</th>
                <th class="col-lg">部门</th>
                <th class="col-lg">职位</th>
                <th class="col-md">用户状态</th>
                <th class="col-long">操作</th>
              </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
    <div role="tabpanel" class="tab-pane" id="account-Rpt">
    <!--  客户代表   -->
      <form class="navbar-form navbar-left pull-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
        <table class="table table-hover  acc-Rpt">
            <thead>
              <tr>
                <th class="col-st">序号</th>
                <th class="col-lg">客户ID</th>
                <th class="col-lg">姓名</th>
                <th class="col-st">性别</th>
                <th class="col-lg">所属公司</th>
                <th class="col-md">用户状态</th>
                <th class="col-long">操作</th>
              </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
    <div role="tabpanel" class="tab-pane" id="client">
      <form class="navbar-form navbar-left pull-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
        <table class="table table-hover client">
            <thead>
              <tr>
                <th class="col-st">序号</th>
                <th class="col-lg">会员ID</th>
                <th class="col-lg">姓名</th>
                <th class="col-st">性别</th>
                <th class="col-md">用户状态</th>
                <th class="col-long">操作</th>
              </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
  </div>
  </div>
    <!-- end -->


            
            <!--  完善个人信息  -->
    <div class="panel-body" id="fill-user-info" style="display:none">
     
            </div>
  <!--  end -->

  <!-- <div class="panel-body" id="select-position" style="display:none">
        <div class="container">
            <div class="form-group">
                <label for="sex" class="col-sm-2 control-label">部门</label>
                <select class="form-control" id="sex">
                      <option>财务部</option>
                      <option>市场部</option>
                      <option>保健部</option>
                      <option>技术部</option>
                </select>
            </div>
            <div class="form-group">
                <label for="sex" class="col-sm-2 control-label">职位</label>
                <select class="form-control" id="sex">
                      <option>部门经理</option>
                      <option>医生</option>
                      <option>财务员</option>
                      <option>系统管理员</option>
                </select>
            </div>
            <div class="form-group">
    <div class="col-sm-offset-2 col-sm-2">
      <button type="button" class="btn btn-default" data-toggle="modal" data-target="#md-register">确定</button>
    </div>
        </div>
    </div>
    </div> -->

<!--  end  -->
            <iframe name="hidden-sub" style="display:none"></iframe>
            		</div>
				</div>
			</div>
		</div>
	</section>

    <!-- 注册框 -->
            <div id="md-register" class="modal fade" role="dialog" aria-labelledby="modal-label" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button class="close" type="button" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                            <h4 class="modal-title" id="modal-label">注册</h4>
                        </div>
                        <div class="modal-body">
                            
                            <form:form name="client-sign" action="checkRegister" method="post" commandName="account">
                                <div class="form-group">
                                    <label for="account">账号</label>
                                    <form:input path="account" id="account1" cssClass="form-control " placeholder="请输入用户名"  />
                                </div>
                                <div class="form-group">
                                    <label for="password">密码</label>
                                    <form:input path="password" id="password" type="password" cssClass="form-control" placeholder="请输入密码" />
                                </div>
                                <div class="form-group">
                                    <label for="password2">请再次输入密码</label>
                                    <input  id="password2" type="password" class="form-control" placeholder="请再次输入密码" />
                                </div>
                                <div class="form-group">
                                    <label for="accountFlag">角色选择</label>
                                    <form:select cssClass="form-control" path="accountFlag" >
                                          <option>请选择职位</option>
                                          <form:option value="5">经理</form:option>
                                          <form:option value="4">医生</form:option>
                                          <form:option value="3">财务</form:option>
                                          <form:option value="2">系统管理员</form:option>
                                    </form:select>
                                </div>
                                <div class="form-group">
                                    <button type="submit"  class="btn btn-success btn-lg btn-block" id="ad-submit">注册</button>
                                </div>
                            </form:form>
                            
        
                        </div>
                    </div>
                </div>
            </div>
            <!-- end -->

    <footer>
		
	</footer>
</body>
</html>