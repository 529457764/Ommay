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
<%String username = (String)session.getAttribute("accountName");%>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>管理员-注册</title>
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
                    <a href="../account/register" class="list-group-item  active" data-toggle="modal" data-target="#md-register">注册用户</a>
                   	<!-- <a href="<%=path%>/adf/adminFillPersonalInfo" class="list-group-item " >完善个人信息</a> --> 
                </ul>
            </div>
             <!-- end -->

            <!-- 右侧主要内容 -->
            <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
                <div class="row">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="modal-title">注册用户</h4>
                        </div>
                        <!-- 注册框 -->
                <div class="modal-dialog">
                    <div class="modal-content">
                        
                        <div class="modal-body">    
                            <form:form name="client-sign" action="../account/checkRegister" method="post" commandName="accountForm">
                                <div class="form-group">
                                    <label for="account">账号</label>
                                    <form:input path="account" id="account1" cssClass="form-control " placeholder="请输入用户名"  required="required"/>
                                </div>
                                <div class="form-group">
                                    <label for="password">密码</label>
                                    <form:input path="password" id="password" type="password" cssClass="form-control" placeholder="请输入密码" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label for="password2">请再次输入密码</label>
                                    <input  id="password2" type="password" class="form-control" placeholder="请再次输入密码" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label for="accountFlag">角色选择</label>
                                    <form:select cssClass="form-control" path="accountFlag" >
                                          <option value="0">请选择职位</option>
                                          <form:option value="5">经理</form:option>
                                          <form:option value="2">医生</form:option>
                                          <form:option value="3">财务</form:option>
                                    </form:select>
                                </div>
                                <div class="form-group">
                                    <button type="submit"  class="btn btn-success btn-lg btn-block" id="ad-submit">注册</button>
                                </div>
                            </form:form>
                            
        
                        </div>
                    </div>
                </div>
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