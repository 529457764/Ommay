<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.ommay.entity.PhysicalItem"%>
<%@page import="com.ommay.entity.ProjectDetail"%>
<%@page import="com.ommay.entity.Project"%>
<%@page import="java.util.logging.Logger" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="c.tld" prefix="c" %>
<%@ taglib uri="fmt.tld" prefix="fmt" %>
<%@ taglib uri="fn.tld" prefix="fn" %>
<%@ taglib uri="sql.tld" prefix="sql" %>
<%@ taglib uri="x.tld" prefix="x" %>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String resultItem = (String)request.getAttribute("resultItem");
HashMap<String, Object> groupAppointment = (HashMap<String, Object>)request.getAttribute("1");
HashMap<String, Object> vipAppointment = (HashMap<String, Object>)request.getAttribute("0");
HashMap<String,Object> groupResult = groupAppointment!=null?(HashMap<String, Object>)groupAppointment.get("phys_result"):null;
HashMap<String,Object> vipResult = vipAppointment!=null?(HashMap<String, Object>)vipAppointment.get("phys_result"):null;
Logger logger=Logger.getLogger(this.getClass().getName());
logger.info(groupAppointment==null?"1":groupAppointment.toString());
logger.info(vipAppointment==null?"0":vipAppointment.toString());
Boolean isLogin = (Boolean)request.getAttribute("unlogin");
Boolean update = (Boolean)request.getAttribute("update");
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
	<%
	//update
	if(isLogin!=null) response.sendRedirect(basePath+"account/login");%>

	<% if(update!=null){%>
		<% if(update){%>
			<script type="text/javascript">
			AlertMes.MesFail("修改成功！");
			</script>
		<% }else{
			%>
			<script type="text/javascript">
			AlertMes.MesFail("修改失败！");
			</script>
			<%
		   }%>
	<% }%>

	<% if(resultItem!=null){%>
		<% if(resultItem.equalsIgnoreCase("not found")){%>
			<script type="text/javascript">
			AlertMes.MesSuccess("没有该结果！");
			</script>
		<% }else{
			response.sendRedirect(basePath+resultItem);
		   }%>
	<% }%>

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
                    <a href="<%=path%>/adf/financeCharge" class="list-group-item active" data-target="#charge-model" >缴费</a>
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
<% if(vipAppointment ==null && groupAppointment == null){ %>
    <!-- 1.登陆首页模块 -->
    <div id="charge-model">
        <div class="charge-head">
            <div class="search-client">
                <a href="javascript:void(0)" data-target="#personal-booking" id="" style="display:none">个人预约缴费页面</a> 
                <a href="javascript:void(0)" data-target="#team-booking" id="" style="display:none">团体预约缴费页面</a> 
                <a href="javascript:void(0)" class="pull-right" data-target="#search-id" id="" style="display:none">返回</a> 
            </div>
        </div>
        <div class="charge-body" >
        <!-- 1.0输入预约订单号查找会员 -->
            <div class="charge-search" id="search-id" >
                <form class="form-horizontal" action="<%=basePath%>finance/OmmayPay" method="get">
                      <div class="form-group">
                        <label for="client-id" class="col-sm-3 control-label">请输入预约编号ID：</label>
                        <div class="col-sm-4">
                          <input type="text" class="form-control" id="client-id" placeholder="预约ID" name="id">
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-10">
                          <button type="submit" class="btn btn-default">查找</button>
                        </div>
                      </div>
                </form>
            </div>
        <!-- end -->

        <!-- 1.1个人预约缴费页面 -->
 <%}else if(vipAppointment!=null){ %>      
        
            <div class="charge-result" id="personal-booking">
                <div class="result-header">
                    <div class="header-title">
                        <h4><span><%=vipResult.get("phsy_name")%></span>第<span><%=vipResult.get("phsy_sum")%></span>次体检预约订单</h4>
                    </div>
                    <div class="header-content">
                        <span>会员编号 :<span class="client-number"><%=vipResult.get("phsy_account")%></span></span>
                        <span>会员姓名 :<span class="client-name"><%=vipResult.get("phsy_name")%></span></span>
                        <span>业务员 :<span class="client-sal">不详</span></span>
                        <span>体检时间 :<span class="check-time"><%=vipResult.get("phsy_time_end")%></span></span>
                        <br>
                        <span>预约号 :<span class=""><%=vipResult.get("phys_appointment_id")%></span></span>
                        <span>预约体检时间 :<span class=""><%=vipResult.get("phsy_time_start")%></span></span>
                        <span>已选项目 :<span class=""><%=vipResult.get("phsy_sum")%></span></span>
                    </div>
                </div>
                <div class="result-body">
                    <form action="<%=basePath%>finance/OmmayPaid" method="get">
                        <table class="table table-bordered" id="physical-package">
                            <thead>
                                <tr>
                                    <th width="5%">序号</th>
                                    <th width="10%">项目编号</th>
                                    <th width="20%">体检项目</th>
                                    <th width="10%">项目单价</th>
                                    <th width="10%">检查类型</th>
                                    <th width="10%">适用性别</th>
                                    <th width="10%">科室名称</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
	                            List physicalItemList = (List)vipResult.get("phys_items");
	                            System.out.println(vipResult);
	                            if(physicalItemList!=null){
	                            System.out.println(physicalItemList);
		                            for(int i = 0; i<physicalItemList.size() ; i++){
		                            	PhysicalItem phsical = (PhysicalItem)physicalItemList.get(i);
		                            %>
		                                <tr>
		                                    <td><%=i%></td>
		                                    <td><%=phsical.getIdItem()%></td>
		                                    <td><%=phsical.getNameItem()%></td>
		                                    <td><%=phsical.getPriceItem()%></td>
		                                    <td><%=phsical.getTypeItem()%></td>
		                                    <td><%=phsical.getGenderItem()%></td>
		                                    <td><%=phsical.getDepartmentItem()%></td>
		                                </tr>
		                            <% }
	                            }
                            %>
                            </tbody>
                        </table>
                        <p class="col-sm-offset-9 indent-money">体检总价：￥<span id="money"><%=vipResult.get("phys_total") %></span></p>
                        <div class="form-group">
                        <div class="col-sm-offset-10 col-sm-1" style="color:white;">
                        <%
   							Boolean status = (Boolean)vipResult.get("phys_ispaid");
                        	if(status!=null){ 
                        		if(!status){
                       %> 	
                       			<input name="indent_id" style="display:none;color:white;" value="<%=request.getAttribute("phys_indent")%>" >		
                        		<button type="submit" class="btn btn-default" disabled="disabled">没缴费</button>	
                       <%                      			
                        		}else{
                       %>
                       				<button type="submit" class="btn btn-default" disabled="disabled">已缴费</button> 	
                       <%	
                        		}
                        	}
                        %>
                          
                        </div>
                      </div>
                    </form>
                    <table class="table table-bordered opt-log">
                        <thead>
                                <tr>
                                    <th width="20%">时间</th>
                                    <th width="40%">状态</th>
                                    <th width="20%">操作人员</th>              
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><%=vipResult.get("phsy_time_start")%></td>
                                    <td>提交预约</td>
                                    <td>宫鸣</td>
                                </tr>
                            </tbody>
                    </table>
                </div>
            </div>
        <!--      end     -->

<%}else if(groupAppointment!=null){ %> 

		   <!-- result.put("phsy_account",indentGroup.getUidProject());
			    result.put("phsy_com",indentGroup.getIndentGroupName());
			    result.put("phsy_name",project.getClientName());
			    result.put("phsy_people_sum",project.getPeopleNumber());//sum of physical people
			    result.put("phsy_sum",IndentGroupList.size());
			    result.put("phsy_time_start",project.getTimeBegin()); //physical examination start
			    result.put("phsy_time_end",project.getTimeEnd()); //physical examination finished
			    result.put("phys_appointment_id", String.valueOf(indent.getUidIndent()));//physical appointment id
		    	result.put("phsy_status",status);//physical status
		    	result.put("phsy_update_date",updateDate);//physical status date
		    	result.put("phys_operator", "不详");//physical operator
		    	result.put("phys_total", indent.getMoneyIndent());//physical total
		    	result.put("phys_items", physicalItemList);//physical items -->
 
        <!-- 1.2团体预约缴费页面 -->
            <div class="charge-result" id="team-booking">
                <div class="result-header">
                    <div class="header-title">
                        <h4><span><%=groupAppointment.get("phsy_name")%></span>第<span><%=groupAppointment.get("phsy_sum")%></span>次体检预约订单</h4>
                    </div>
                    <div class="header-content">
                        <span>项目编号 :<span class="client-number"><%=groupAppointment.get("phsy_account")%></span></span>
                        <span>客户代表 :<span class="client-name"><%=groupAppointment.get("phsy_name")%></span></span>
                        <span>业务员 :<span class="client-sal">宫鸣</span></span>
                        <span>部门经理 :<span class="client-sal"><%=groupAppointment.get("phys_manager")%></span></span>
                        <span>预约时间 :<span class="check-time"><%=groupAppointment.get("phsy_time_start")%></span></span>
                        <br>
                        <span>预约号 :<span class=""><%=groupAppointment.get("phys_appointment_id")%></span></span>
                        <span>预约体检时间 :<span class=""><%=groupAppointment.get("phsy_time_end")%></span></span>
                        <span>体检人数 :<span class=""><%=groupAppointment.get("phsy_people_sum")%></span></span>
                        <span>已选项目 :<span class=""><%=groupAppointment.get("phsy_sum")%></span></span>
                    </div>
                </div>
                <div class="result-body">
                    <form action="<%=basePath%>finance/OmmayPaid" method="get">
                        <table class="table table-bordered" id="physical-package">
                            <thead>
                                <tr>
                                    <th width="5%">序号</th>
                                    <th width="10%">套餐名</th>
                                    <th width="20%">套餐单价</th>
                                    <th width="10%">体检人数</th>
                                    <th width="10%">合计</th>
                                    <th width="10%">体检名单</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
	                            List projectDetailList = (List)groupResult.get("phys_items");
	                            if(projectDetailList!=null){
		                            for(int i = 0; i<projectDetailList.size() ; i++){
		                            	ProjectDetail projectDetail = (ProjectDetail)projectDetailList.get(i);
		                            %>
		                                <tr>
		                                    <td><%=i%></td>
		                                    <td><%=projectDetail.getPackageName()%></td>
		                                    <td><%=projectDetail.getPackageNumber()%></td>
		                                    <td><%=projectDetail.getNumber()%></td>
		                                    <%int a = projectDetail.getNumber()*Integer.parseInt(projectDetail.getPackageNumber()); %>
		                                    <td><%=a%></td>
		                                    <td><%="模拟生成"%></td>
		                                </tr>
		                            <% }
	                            }
                            %>
                            </tbody>
                        </table>
                        <p class="col-sm-offset-9 indent-money">体检总价：￥<span id="money"><%=groupAppointment.get("phys_total")%></span></p>
                        <div class="form-group">
                        <div class="col-sm-offset-10 col-sm-1" style="color:white;">
                       <%
   							Boolean status = (Boolean)vipResult.get("phys_ispaid");
                        	if(status!=null){ 
                        		if(!status){
                       %> 	
                       				<input name="indent_id" style="display:none;color:white;" value="<%=request.getAttribute("phys_indent")%>" >		
                        			<button type="submit" class="btn btn-default">确认缴费</button>		
                       <%                      			
                        		}else{
                       %>
                       				<button type="submit" class="btn btn-default" disabled="disabled">已缴费</button> 	
                       <%	
                        		}
                        	}
                        %> 
                        </div>
                      </div>
                    </form>
                    <table class="table table-bordered opt-log">
                        <thead>
                                <tr>
                                    <th width="20%">时间</th>
                                    <th width="40%">状态</th>
                                    <th width="20%">操作人员</th>              
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><%=groupAppointment.get("phsy_time_start")%></td>
                                    <td>提交预约</td>
                                    <td>宫鸣</td>
                                </tr>
                            </tbody>
                    </table>
                </div>
            </div>
        <!--      end     -->
        </div>

    </div>
<%} %>
     <!--  end  -->

    
                            

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