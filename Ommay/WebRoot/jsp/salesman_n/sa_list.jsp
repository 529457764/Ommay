<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<ul class="list-group">
 
	<a href="<%=path%>/project/workerGetAllGroupProject" data-url="sa_groupProject" class="list-group-item">团体项目</a>
	<a href="<%=path%>/project/workerGetOwnerProject?id=<%=id%>" data-url="sa_myGroupProject" class="list-group-item">我的团体项目</a>
	<a href="<%=path%>/project/workerGetAllVipProject" data-url="sa_vipProject" class="list-group-item">会员项目</a>
	<%-- <a href="<%=path--/view/sa_myVipProject" data-url="sa_myVipProject" class="list-group-item">我的会员项目</a>--%>
	<a href="<%=path%>/view/sa_newProject" data-url="sa_newProject" class="list-group-item">新建项目</a>
	<a href="<%=path%>/view/sa_VipManage" data-url="sa_VipManage" class="list-group-item">管理用户</a>
	<a href="<%=path%>/salesman/sa_groupAppointment" data-url="sa_groupAppointment" class="list-group-item">团体体检预约</a>
	<a href="<%=path%>/salesman/sa_vipAppointment" data-url="sa_vipAppointment" class="list-group-item">个人体检预约</a>
	<a href="<%=path%>/view/sa_userCenter" data-url="sa_userCenter" class="list-group-item">用户中心</a>

</ul>