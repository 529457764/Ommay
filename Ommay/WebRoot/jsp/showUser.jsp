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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatibale" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>安生美，优质健康服务</title>
   <link rel="stylesheet" type="text/css"  href="<%=path %>/resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/resource/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/resource/css/main.css">
    <link rel="shortcut icon" href="<%=path %>/resource/images/title.jpg" type="image/x-icron" />
    <script type="text/javascript" src="<%=path %>/resource/jquery/jquery-1.11.0.min.js"></script>
</head>
<body>
	<header id="header">
        <div class="header-right">
            <a href="javascript:void(0);">网站首页</a>&nbsp;&nbsp;|&nbsp;
            <a href="javascript:void(0);">在线调查</a>&nbsp;&nbsp;|&nbsp;
            <a href="javascript:void(0);">网站收藏</a>
        </div>
        <div class="header-top">
        	<img src="<%=path %>/resource/images/Logo.gif">
        </div>
        
        <!--        -->
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1" ></li>
                <li data-target="#carousel-example-generic" data-slide-to="2" ></li>
                <li data-target="#carousel-example-generic" data-slide-to="3" ></li>
            </ol>
               <div class="carousel-inner" role="listbox">
                <div class="item active"> <img  src="<%=path %>/resource/images/1.png" alt="0 slide" > </div>
                <div class="item"> <img src="<%=path %>/resource/images/2.png" alt="1 slide" >    </div>
                <div class="item"> <img src="<%=path %>/resource/images/3.png" alt="2 slide" >    </div>
                <div class="item"> <img src="<%=path %>/resource/images/4.png" alt="3 slide" ></div>
            </div>
            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">‹</a>
            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">›</a> 
        </div>
    </header>
    <!--  导航栏  -->
    <nav class="navbar navbar-inverse" role="navigation" id="menu-nav">
        <div class="container">
            <ul class="nav navbar-nav nav-left">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">关于安生美<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">公司介绍</a></li>
                        <li><a href="#">公司团队</a></li>
                        <li><a href="#">环境及设备</a></li>
                        <li><a href="#">认识健检</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">新闻动态<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">安生美动态</a></li>
                        <li><a href="#">行业动态</a></li>
                        <li><a href="#">活动讯息</a></li>
                        <li><a href="#">城市新闻</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">产品与服务<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">健康体检</a></li>
                        <li><a href="#">会员产品</a></li>
                        <li><a href="#">健康管理服务</a></li>
                        <li><a href="#">营养品</a></li>
                        <li><a href="#">在线预约</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">健康资讯<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">健康资讯</a></li>
                        <li><a href="#">健检回答</a></li>
                        <li><a href="#">专家博客</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">会员空间<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">体检报告</a></li>
                        <li><a href="#">健康促进书</a></li>
                        <li><a href="#">会员留言</a></li>
                        <li><a href="#">会员上传</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">员工专区<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">企业邮箱入口</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">联系我们<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">公司联系方式</a></li>
                        <li><a href="#">服务反馈</a></li>
                        <li><a href="#">招纳贤才</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right nav-right">
                <li><a href="#" data-toggle="modal" data-target="#login-modal">登录</a></li>
                <li><a href="#" data-toggle="modal" data-target="#register-modal">注册</a></li>
            </ul>   
        </div>
    </nav>
	<section class="main">
        <div class="container-fluid">
            <!-- 登录框 -->
            <div id="login-modal" class="modal fade" role="dialog" aria-labelledby="modal-label" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button class="close" type="button" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                            <h4 class="modal-title" id="modal-label">登录</h4>
                        </div>
                        <div class="modal-body">
                            <form action="#">
                                <div class="form-group">
                                    <label for="username">账号</label>
                                    <input type="text" id="username" name="username" class="form-control" placeholder="请输入用户名">
                                </div>
                                <div class="form-group">
                                    <label for="password">密码</label>
                                    <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码">
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-success btn-lg btn-block">登录</button>
                                </div>
                                <div class="form-group">
                                    
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 注册框 -->
            <div id="register-modal" class="modal fade" role="dialog" aria-labelledby="modal-label" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button class="close" type="button" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                            <h4 class="modal-title" id="modal-label">注册</h4>
                        </div>
                        <div class="modal-body">
                            <form action="#">
                                <div class="form-group">
                                    <label for="account">账号</label>
                                    <input type="text" id="account" name="account" class="form-control" placeholder="请填写账号">
                                </div>
                                <div class="form-group">
                                    <label for="password">密码</label>
                                    <input type="password" id="password" name="password" class="form-control" placeholder="请填写密码">
                                </div>
                                <div class="form-group">
                                    <label for="comfirmPassword">再次填写密码</label>
                                    <input type="password" id="comfirmPassword" name="comfirmPassword" class="form-control" placeholder="请再次填写密码">
                                </div>
                                <div class="form-group">
                                    <label for="">用户名</label>
                                    <input type="text" id="username" name="username" class="form-control" placeholder="请输入用户名">
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-success btn-lg btn-block">注册</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end -->
            <div class="main">
				<!-- json获取 -->
				<div class="row">
					<div class="panel">
						<div class="panel-heading">
							 <h3 class="panel-title health2-title">所有团体项目</h3>
						</div>
						<div class="panel-body">
							<table class="table table-bordered">
								<thead>
									<tr class="danger">
										<th>客户ID</th>
										<th>客户名</th>
										<th>客户密码</th>
										<th>用户类型</th>
									</tr>
								</thead>
								<tbody id="tbody">
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- json-end -->	
						
			</div>      
		</div>
    </section>  
</body>
<font >
    <div id="End" align="center"><a href="javascript:scrollTo(0,0);"><img src="<%=path %>/resource/images/top.gif" width="51" height="12" border="0"></a></div>
    <div align="right" style="margin:10px auto;width:920px;">© 2009-2011 成都安生美健康体检医院有限公司版权所有 Web Powered By A.U LabTM 2009
    <br>
      地址：成都市高新区高新国际广场D座三层<br>
      电话：028-82829292 82829393<br>
      传真：028-82828908
    </div>
</font>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/nav.js"></script>
<script type="text/javascript">
	//console.log(123);
	//var $showBox = $("#showBox");
	
	$.ajax({
		url:"http://localhost:8080/Ommay/accident/data/accident_get_data",
		type:"post",
		success:function(data){
			//console.log(data);
			console.log(data);
			var $tbody = $("#tbody");
			var str = '';
			if(data.code == 1){
			for(var i=0; i<data.array.length; i++) {
				//str += '我是'+data[i].username+' ';
				//str += '<tr><td>'+data[i].id+'</td><td>'+data[i].username+'</td><td>'+data[i].password+'</td><td>'+data[i].roleId+'</td></tr>';
				//console.log(data);
				str += '<tr><td>'+data.array[i].account+'</td><td>'+data.array[i].accountFlag+'</td></tr>';
			}
			}
			$tbody.append(str);
		}
	});
	
	/*
	function test(url) {
		$.ajax({
			//url:"http://localhost:8080/asmDemo/getDate",
			url: url,
			type:"post",
			success:demo
			
		});
		function demo(data) {
			console.log(data);
		}
	}
	test("http://localhost:8080/asmDemo/getDate");
	*/
</script>
</html>