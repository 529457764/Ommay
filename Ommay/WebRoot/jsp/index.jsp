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
    <link rel="stylesheet" type="text/css" href="<%=path %>/resource/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/resource/css/start.css">
    <link rel="shortcut icon" href="<%=path %>/resource/images/title.jpg" type="image/x-icron" />
    <script type="text/javascript" src="<%=path %>/resource/jquery/jquery-1.11.0.min.js"></script>
</head>
<body>
	<header id="header">
        <!-- <div class="header-right">
            <a href="javascript:void(0);">网站首页</a>&nbsp;&nbsp;|&nbsp;
            <a href="javascript:void(0);">在线调查</a>&nbsp;&nbsp;|&nbsp;
            <a href="javascript:void(0);">网站收藏</a>
        </div>
         -->
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
                <!-- <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">会员空间<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">体检报告</a></li>
                        <li><a href="#">健康促进书</a></li>
                        <li><a href="#">会员留言</a></li>
                        <li><a href="#">会员上传</a></li>
                    </ul>
                </li> -->
                <!-- <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">员工专区<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">企业邮箱入口</a></li>
                    </ul>
                </li> -->
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
                <li><a href="#" data-toggle="modal" data-target="#login-modal" id="login-btn">登录</a></li>
                <!-- <li><a href="#" data-toggle="modal" data-target="#register-modal" id="register-btn">注册</a></li> -->
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
                            <form:form commandName="account" action="checkLogin" method="post" cssClass="form">
                                <div class="form-group">
                                    <label for="account">账户名</label>
                                	<form:input path="account" id="account1" cssClass="form-control" placeholder="请输入账户名" value=""/>
                                	<script>
                                	$('#account1').val("");
                                	</script>
                                	<label for="password">密码</label>
                                	<form:password path="password" id="password" cssClass="form-control" placeholder="请输入密码" />
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-success btn-lg btn-block">登录</button>
                                </div>
                                <div class="form-group">
                            		<span style="color:red;">
                            			<c:if test="${warning == '1'}">你输入的用户名或密码错误</c:if>
                            		</span>
                            	</div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end -->

          <!--   <div class="row">
            	<div class="col-md-10 health-title">
            		<h4>Expert Blog / 专家博客</h4>
            	</div>
            	<div class="col-md-2 rservation-title">
            		<h4><a href="#">在线预约</a></h4>
            	</div>
            </div> --> 
		<section>
        <div class="container">
            <div class="body_div" style="margin-bottom:24px;">
            <div class="body_left">
                <div><a href="about.html"><img src="<%=path %>/resource/images/about_index.gif" width="171" height="19" border="0"></a></div>
                <div  class="body_left_pic" style="background: url(<%=path %>/resource/images/1.jpg) no-repeat 0 center;    background-size: cover;"></div>
                 <span class="cl_org">安生美Ommay</span>，这个词意味着优质的健康服务。 <br>
                成都安生美健康体检医院有限公司是一家为顾客提供全面的健康管理服务的专业性机构，致力于促进和提升顾客的健康生活品质。我们的服务包括健康体检、健康评估、健康促进、医疗顾问、慢病管理等各方面，旨在通过全方位全过程的预防保健来改善顾客的健康状况。 
                <div class="more_info"><a href="about.html"><img src="<%=path %>/resource/images/more_info.gif" width="48" height="11" border="0"></a></div>
            </div>
            <div class="body_right" style="height:314px;">
            <div class="more"><a href="News.asp"><img src="<%=path %>/resource/images/more.gif" width="47" height="11" border="0"></a></div>
            <a href="news.asp"><img src="<%=path %>/resource/images/news_index.gif" width="111" height="17" border="0"></a><br>
            <div id="Picture_news">
                <p><a href="news_01.html" title="安生美微信公众平台认证上线啦" class="cl_org">2014-12-11安生美微信公众平台认证上线啦</a></p>
                <img src="<%=path %>/resource/images/news_swf.jpg" width="156" height="101" align="left" style="margin-right:10px;">
                <div class="more_info">
                    <a href="" title="查看详细"><img src="<%=path %>/resource/images/more_info.gif" width="48" height="11" border="0"></a>
                </div>
            </div>
            <ul class="news_ul">
              <li>2014-9-1 【<a href="news4.html">城市新闻</a>】<a href="news_1.html" title="高露洁全效牙膏或致癌">高露洁全效牙膏或致癌</a></li>
              <li>2014-8-21 【<a href="news.html">安生美动态</a>】<a href="news_2.html" title="英国医疗代表团到访安生美 未来或展开合作">英国医疗代表团到访安生美 未来或展开合作</a></li>
              <li>2014-6-19 【<a href="news_1.html">城市新闻</a>】<a href="news_4.html" title="央视曝光眼药水、滴眼液中含有防腐剂">央视曝光眼药水、滴眼液中含有防腐剂</a></li>
              <li>2014-6-12 【<a href="news4.html">城市新闻</a>】<a href="news_3.html" title="少吃烧烤和油炸食物">少吃烧烤和油炸食物</a></li>
            </ul>
        </div>
    
        </div>

        <div class="body_div">
            <div class="body_left">
                <div style="margin-bottom:40px;">
                    <div style="width:350px;">
                      <div class="more"><a href="Contact.html"><img src="<%=path %>/resource/images/more.gif" width="47" height="11" border="0"></a></div>
                      <a href="Contact.html"><img src="<%=path %>/resource/images/contact_index.gif" width="133" height="17" border="0"></a><br>
                    <br>
                      地址：成都市高新区高新国际广场D座三层<br>
                    E-mail：<a href="mailto:ommay@ommay.com">ommay@ommay.com</a><br>
                  传真：028-82828908   业务洽谈：028-82828900<br>
                        <div class="about_swf"><img src="<%=path %>/resource/images/Tel_number.gif" width="351" height="20" style="margin-bottom:20px"></div>
                  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                          <tbody><tr>
                            <td><a href="Reservation.asp"><img src="<%=path %>/resource/images/online_survey.jpg" width="147" height="53" border="0"></a></td>
                            <td align="right"><a href="job.asp"><img src="<%=path %>/resource/images/online_consultation.jpg" width="133" height="52" border="0"></a></td>
                          </tr>
                        </tbody></table>
                    </div>
                </div> 
            </div>
            <div class="body_right">
                <div class="more"><a href="Product.html"><img src="<%=path %>/resource/images/more.gif" width="47" height="11" border="0"></a></div>
                <a href="Product.html"><img src="<%=path %>/resource/images/product_index.gif" width="202" height="17" border="0"></a>
                <p>安生美健康体检，按照年龄及性别设计产品，让健检更经济更准确！</p>
                <ul class="product_ul">
                  <li style="margin-right:17px"><a href="Product_1_2.html"><img src="<%=path %>/resource/images/Product_05.jpg" width="259" height="42" border="0"><span class="cl_org">基础健检套餐</span><br>以常规健康检查为目的，对身体进行一次基本的常规检查，可以早期筛查出一些常见病……</a> </li>
                  <li><a href="Product_1_2.html"><img src="<%=path %>/resource/images/Product_06.jpg" width="259" height="42" border="0"><span class="cl_org">普及健检套餐</span></a><br>以常规健康检查为目的，在常规检查的基础上专门针对部分常见肿瘤疾病<a href="#">……</a></li>
                  <li style="margin-right:17px"><a href="Product_1_2.html"><img src="<%=path %>/resource/images/Product_07.jpg" width="259" height="42" border="0"><span class="cl_org">综合健检套餐</span></a><br>以常规健康检查为目的，在常规检查的基础上专门针对部分常见肿瘤疾病<a href="#">……</a></li>
                  <li><a href="Product_1_2.html"><img src="<%=path %>/resource/images/Product_08.jpg" width="259" height="42" border="0"><span class="cl_org">精选健检套餐</span></a><br>常规检查的基础上，精选出乳腺钼靶、眼底摄影、心肌酶学及微量元素等……</li>
                  <li style="margin-right:17px"><a href="Product_1_2.html"><img src="<%=path %>/resource/images/Product_01.jpg" width="259" height="42" border="0"><span class="cl_org">儿童套餐（6-12岁）</span><br>健康管理从儿童开始。过胖、过瘦、易感冒、偏食、视力问题、运动不足等 ……</a></li>
                  <li><a href="Product_1_2.html"><img src="<%=path %>/resource/images/Product_02.jpg" width="259" height="42" border="0"><span class="cl_org">标准健检套餐</span><br>以国际主流健康检查项目为标准设置健检项目，在已精选过的检查项目上再增添了</a><a href="#">……</a></li>
                  <li style="margin-right:17px"><a href="Product_1_2.html"><img src="<%=path %>/resource/images/Product_03.jpg" width="259" height="42" border="0"><span class="cl_org">精英健检套餐</span><br>在标准健检讨残基础上针对都市精英族群添加甲状腺彩超、心脏彩超、头部CT等一系列深入……</a></li>
                  <li><a href="Product_1_2.html"><img src="<%=path %>/resource/images/Product_04.jpg" width="259" height="42" border="0"><span class="cl_org">贵宾健检套餐</span><br>在精英套餐基础上针对事业有成的中老年群体添加骨钙素、血流变、颈动脉彩超……</a></li>
                </ul>
            </div>

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
<script type="text/javascript" src="<%=path %>/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path %>/resource/js/index.js"></script>
<script type="text/javascript" src="<%=path %>/resource/js/nav.js"></script>
<c:if test="${!empty warning}">
<script type="text/javascript">
	var $loginBtn = $("#login-btn");
    $loginBtn.click();
</script>                            	
</c:if>

<c:if test="${!empty rgwarning}">
<script type="text/javascript">
	var $loginBtn = $("#register-btn");
    $loginBtn.click();
</script>
                            	
</c:if>
</html>