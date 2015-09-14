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
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>doctor</title>
    <script type="text/javascript" src="<%=path %>/resource/jquery/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/js/doctor.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/js/public.js"></script>
    <link rel="stylesheet" href="<%=path %>/resource/css/doctor.css">
    <link rel="stylesheet" href="<%=path %>/resource/css/user.css">
    <link rel="stylesheet" href="<%=path %>/resource/css/public.css">
    <link rel="stylesheet" href="<%=path %>/resource/bootstrap/css/bootstrap.min.css">
    <script>
    
    </script>
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
                    <a href="<%=path%>/adf/doctorSearch" class="list-group-item active">查找会员</a>
                  <!--   <a href="<%=path%>/adf/doctorOperation" class="list-group-item  ">会员体检信息</a>  -->
                    <a href="<%=path%>/adf/d_userInfo" class="list-group-item" id="personalInfo">个人中心</a> 
                </ul>
            </div>
            <!-- 右侧主要内容 -->
            <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
                <div class="row">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4>查找订单</h4>
                        </div>
                        <div class="panel-body">
                            
    <!-- 医生登陆首页模块 -->

    <div id="charge-model">
        <!-- <div class="charge-head">
            <div class="search-client">
                <a href="#" data-toggle="modal" id="rearch-client">查找会员</a> | 
                <a href="#" data-toggle="modal" id="rearch-reslut">体检结果录入</a> 
            </div>
        </div> -->
        <div class="charge-body" >
        <!-- 查找会员 -->
            <div class="charge-search"  >
                <form action="../doctor/doctorSearch" class="form-horizontal">
                      <div class="form-group">
                        <label for="client-id" class="col-sm-2 control-label">请输入订单ID</label>
                        <div class="col-sm-4">
                          <input type="text" required name="account" class="form-control" id="client-id" placeholder="订单ID">
                        </div>
                      </div>
                      <div class="radio col-sm-offset-2" style="margin-left: 129px;">
						  <label>
						    <input type="radio" name="optionsRadios" id="client" value="0" checked>个人订单
						  </label>
						  <label>
						    <input type="radio" name="optionsRadios" id="group" value="1" >团体订单
						  </label>
					  </div>
					  <div id="margin"></div>
                      <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10" style="margin-top:18px">
                          <button type="submit" class="btn btn-default" id="search-clientID">查找订单</button>
                          
                        </div>
                      </div>
                </form>
            </div>
        <!-- end -->
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