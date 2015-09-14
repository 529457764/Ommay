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
<%String username = (String)session.getAttribute("accountName");
		String operateUserName = (String)session.getAttribute("operateUserName");%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>管理员-完善个人信息</title>
    <script type="text/javascript" src="<%=path %>/resource/jquery/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/js/admin.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/js/public.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=path %>/resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path %>/resource/css/admin.css">
    <link rel="stylesheet" href="<%=path %>/resource/css/public.css">
    
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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=username %><b class="caret"></b></a>
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
                    <a href="<%=path%>/adf/adminUserList" class="list-group-item">用户管理</a>
                    <a href="<%=path%>/adf/adminResgiter" class="list-group-item" >注册用户</a>
                    <a href="<%=path%>/adf/adminFillPersonalInfo" class="list-group-item  active" >完善个人信息</a>
                </ul>
            </div>
            <!-- 右侧主要内容 -->
            <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
                <div class="row">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4>完善个人信息</h4>
                        </div>
                        
                        <!--  完善个人信息  -->
    <div class="panel-body" id="fill-user-info" >
   <form:form cssClass="form-horizontal" commdName="accountMessage" action="../check/UserMessage/complete">
  <div class="form-group">
    <label for="name" class="col-sm-2 control-label">账号</label>
    <div class="col-sm-2"  style="margin-top: 6px;
  font-size: 16px;">
   		<span><%=operateUserName %></span>
      <input type="hidden" class="form-control" name="name" placeholder="账号" required="required" value="<%=operateUserName %>">
    </div>
  </div>
  <div class="form-group">
    <label for="sex" class="col-sm-2 control-label">性别</label>
    <select class="form-control" name="sex">
                              <option>男</option>
                              <option>女</option>
   </select>
  </div>
  <!-- <div class="form-group">
    <label for="idCard" class="col-sm-2 control-label">身份证号码</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="idCard" placeholder="身份证号码">
    </div>
  </div> -->
  <div class="form-group">
    <label for="iphone" class="col-sm-2 control-label">手机号码</label>
    <div class="col-sm-3">
      <input type="tel" class="form-control" name="iphone" placeholder="手机号码" required="required">
    </div>
  </div>
  <!-- <div class="form-group">
    <label for="office-phone" class="col-sm-2 control-label">办公电话</label>
    <div class="col-sm-1">
      <input type="text" class="form-control" id="office-phone1" placeholder="">
    </div>
    <label  class="control-label" id="pho-span">---</label>
    <div class="col-sm-2">
      <input type="text" class="form-control" id="office-phone2" placeholder="">
    </div>
  </div> -->
  <div class="form-group">
    <label for="email" class="col-sm-2 control-label">邮箱</label>
    <div class="col-sm-3">
      <input type="email" class="form-control" name="email" placeholder="邮箱" required="required">
    </div>
  </div>
  
<!--   <div class="form-group">
    <label for="address" class="col-sm-2 control-label">联系地址</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="address" placeholder="联系地址">
    </div>
  </div> -->
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="button" class="btn btn-default">取消</button>
       <button type="submit" class="btn btn-default">保存</button>
    </div>

  </div>
</form:form>
    </div>
  <!--  end -->
    <!-- end -->
              

            
           

<!--  end  -->
                    </div>
                </div>
            </div>
        </div>
    </section>

    

    <footer>
        
    </footer>
</body>
</html>