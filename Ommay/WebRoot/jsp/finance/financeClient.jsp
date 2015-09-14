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
List<HashMap> vipAppointmentsList = (List<HashMap>)request.getAttribute("vipAppointmentsList");
%>
<%String username = (String)session.getAttribute("accountName");%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>finance</title>
    <script type="text/javascript" src="<%=path %>/resource/jquery/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/js/finance.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/js/public.js"></script>
    
    <link rel="stylesheet" href="<%=path %>/resource/css/finance.css">
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
                                <li><a href="<%=path%>/account/logOff">注销</a></li>
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
                    <a href="<%=path%>/adf/financeCharge" class="list-group-item " data-target="#charge-model">缴费</a>
                    <a href="<%=path%>/finance/groupAppointment" class="list-group-item" data-target="#group-indent">团体体检订单</a>
                    <a href="<%=path%>/finance/vipAppointment" class="list-group-item" data-target="#personal-indent">个人体检订单</a>
                    <a href="<%=path%>/adf/f_userInfo" class="list-group-item" data-target="#persional-info" id="personalInfo">个人中心</a>     
                </ul>
            </div>
            <!-- 右侧主要内容 -->
            <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
                <div class="row">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4>缴费</h4>
                        </div>
                        <div class="panel-body">
                            
   

    


    <!-- 3.个人体检订单 -->
    <div class="show-client" id="personal-indent" >
        <table class="table table-bordered" id="physical-package">
            <thead>
                <tr>
                    <th width="5%">序号</th>
                    <th width="10%">预约号</th>
                    <th width="10%">会员编号</th>
                    <th width="20%">预约名称</th>
                    <th width="15%">预约时间</th>
                    <th width="10%">会员姓名</th>
                    <th width="5%">性别</th>
                    <th width="10%">业务员</th>
                    <th width="10%">预约状态</th>
                </tr>
            </thead>
            <tbody>
                <% if(vipAppointmentsList!=null)%>
									<% for (int i=0; i<vipAppointmentsList.size(); i++) {
										HashMap item = vipAppointmentsList.get(i);
									%>
										<tr>
											<td><%=i%></td>
											<td><%=item.get("appointmentId")%></td>
											<td><%=item.get("projectId") %></td>
											<td><%=item.get("projectName") %></td>
											<td><%=item.get("appointmentTime") %></td>
											<td><%=item.get("appointmentClinet") %></td>
											<td><%=item.get("appointmentGender") %></td>
											<td><%=item.get("appointmentSalsemen") %></td>
											<%if(((String)item.get("appointmentStatus")).equals("没付款")){										
											%>
											<td><a href="<%=path%>/finance/paid?uid_indent=<%=item.get("appointmentId")%>">确认缴费</a></td>
											
											<%}else{%>
											<td><%=item.get("appointmentStatus") %></td>
											<%}%>
										</tr>		
									<%	} %>
            </tbody>
        </table>
    </div>
    <!--    end   -->
                            

                            <!--     end    -->

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