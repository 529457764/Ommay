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
    <title>管理员首页</title>
    <script type="text/javascript" src="<%=path %>/resource/jquery/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/js/table.js"></script>
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
                    <a href="<%=path%>/adf/adminUserList" class="list-group-item  active">用户管理</a>
                    <a href="../account/register" class="list-group-item " ">注册用户</a>
                 	<!-- <a href="<%=path%>/adf/adminFillPersonalInfo" class="list-group-item " >完善个人信息</a> -->   
                </ul>
            </div>
            <!-- 右侧主要内容 -->
            <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
                <div class="row">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4>主要内容</h4>
                        </div>
     

<div id="userMag" >
                         <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active" ><a href="#doctor" data-target="#doctor" aria-controls="doctor" role="tab" data-toggle="tab" id="Epy">医生列表</a></li>
    <li role="presentation" ><a href="#finance" data-target="#finance" aria-controls="finance" role="tab" data-toggle="tab" id="Rpt">财务部列表</a></li>
    <li role="presentation" ><a href="#mag" data-target="#mag" aria-controls="mag" role="tab" data-toggle="tab" id="Rpt">经理列表</a></li>
    <li role="presentation" ><a href="#worker" data-target="#worker" aria-controls="worker" role="tab" data-toggle="tab" id="Rpt">业务员列表</a></li>
    <li role="presentation" ><a href="#account-Rpt" data-target="#account-Rpt" aria-controls="account-Rpt" role="tab" data-toggle="tab" id="Rpt">客户代表</a></li>
    <li role="presentation" id="Clt"><a href="#client" data-target="#client" aria-controls="client" role="tab" data-toggle="tab">会员列表</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content ">
    <div role="tabpanel" class="tab-pane active" id="doctor">
        <!--  医生列表   -->
        
        <table class="table table-hover emplyee">
            <thead>
              <tr>
                <th class="col-st">序号</th>
                <th class="col-lg">账户名</th>
                <th class="col-lg">手机</th>
                <th class="col-lg">邮箱</th>
                <!-- <th class="col-st">性别</th> -->
                <!-- <th class="col-lg">部门</th> -->
                <th class="col-lg">职位</th>
                <th class="col-md">用户状态</th>
                <!-- <th class="col-long">操作</th> -->
              </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <div class="pageChange">
        <input type=button id="product_home_page" class="mySubmit" value="首页">
        <input type=button id="product_up_page" class="mySubmit" value="上一页">
        <input type=button id="product_down_page" class="mySubmit" value="下一页">
        <input type=button id="product_end_page" class="mySubmit" value="尾页">
    </div>
    </div>
    <div role="tabpanel" class="tab-pane" id="finance">
        <!--  财务部列表   -->
        
        <table class="table table-hover emplyee">
            <thead>
              <tr>
                <th class="col-st">序号</th>
                <th class="col-lg">账户名</th>
                <th class="col-lg">手机</th>
                <th class="col-lg">邮箱</th>
                <!-- <th class="col-st">性别</th> -->
                <!-- <th class="col-lg">部门</th> -->
                <th class="col-lg">职位</th>
                <th class="col-md">用户状态</th>
                <!-- <th class="col-long">操作</th> -->
              </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <div class="pageChange">
        <input type=button id="product_home_page" class="mySubmit" value="首页">
        <input type=button id="product_up_page" class="mySubmit" value="上一页">
        <input type=button id="product_down_page" class="mySubmit" value="下一页">
        <input type=button id="product_end_page" class="mySubmit" value="尾页">
    </div>
    </div>
    <div role="tabpanel" class="tab-pane" id="mag">
        <!--  经理列表   -->
        
        <table class="table table-hover emplyee">
            <thead>
              <tr>
                <th class="col-st">序号</th>
                <th class="col-lg">账户名</th>
                <th class="col-lg">手机</th>
                <th class="col-lg">邮箱</th>
                <!-- <th class="col-st">性别</th> -->
                <!-- <th class="col-lg">部门</th> -->
                <th class="col-lg">职位</th>
                <th class="col-md">用户状态</th>
                <!-- <th class="col-long">操作</th> -->
              </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <div class="pageChange">
        <input type=button id="product_home_page" class="mySubmit" value="首页">
        <input type=button id="product_up_page" class="mySubmit" value="上一页">
        <input type=button id="product_down_page" class="mySubmit" value="下一页">
        <input type=button id="product_end_page" class="mySubmit" value="尾页">
    </div>
    </div>
    <div role="tabpanel" class="tab-pane" id="worker">
        <!--  业务员列表   -->
        
        <table class="table table-hover emplyee">
            <thead>
              <tr>
                <th class="col-st">序号</th>
                <th class="col-lg">账户名</th>
                <th class="col-lg">手机</th>
                <th class="col-lg">邮箱</th>
                <!-- <th class="col-st">性别</th> -->
                <!-- <th class="col-lg">部门</th> -->
                <th class="col-lg">职位</th>
                <th class="col-md">用户状态</th>
                <!-- <th class="col-long">操作</th> -->
              </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <div class="pageChange">
        <input type=button id="product_home_page" class="mySubmit" value="首页">
        <input type=button id="product_up_page" class="mySubmit" value="上一页">
        <input type=button id="product_down_page" class="mySubmit" value="下一页">
        <input type=button id="product_end_page" class="mySubmit" value="尾页">
    </div>
    </div>
    <div role="tabpanel" class="tab-pane" id="account-Rpt">
    <!--  客户代表   -->
      
        <table class="table table-hover  acc-Rpt">
            <thead>
              <tr>
                <th class="col-st">序号</th>
                <th class="col-lg">客户ID</th>
                <th class="col-lg">手机</th>
                <th class="col-lg">工作电话</th>
                <!-- <th class="col-st">性别</th> -->
                <th class="col-lg">邮箱</th>
                <th class="col-md">用户状态</th>
                <!-- <th class="col-long">操作</th> -->
              </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <div class="pageChange">
        <input type=button id="product_home_page" class="mySubmit" value="首页">
        <input type=button id="product_up_page" class="mySubmit" value="上一页">
        <input type=button id="product_down_page" class="mySubmit" value="下一页">
        <input type=button id="product_end_page" class="mySubmit" value="尾页">
    </div>
    </div>
    <div role="tabpanel" class="tab-pane" id="client">
      
        <table class="table table-hover client">
            <thead>
              <tr>
                <th class="col-st">序号</th>
                <th class="col-md">会员ID</th>
                <th class="col-st">姓名</th>
                <th class="col-st">性别</th>
                <th class="col-st">电话</th>
                <th class="col-lg">身份证号码</th>
                <th class="col-md">用户状态</th>
                <!-- <th class="col-long">操作</th> -->
              </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <div class="pageChange">
        <input type=button id="product_home_page" class="mySubmit" value="首页">
        <input type=button id="product_up_page" class="mySubmit" value="上一页">
        <input type=button id="product_down_page" class="mySubmit" value="下一页">
        <input type=button id="product_end_page" class="mySubmit" value="尾页">
    </div>
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