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
HashMap<String,Object> groupItems = (HashMap<String,Object>)request.getAttribute("1");
HashMap<String,Object> vipItems = (HashMap<String,Object>)request.getAttribute("0");

%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>finance</title>
    <script type="text/javascript" src="<%=path %>/resource/jquery/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/js/finance.js"></script>
    
    <link rel="stylesheet" href="<%=path %>/resource/css/finance.css">
    <link rel="stylesheet" href="<%=path %>/resource/css/user.css">
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
                    <a href="" class="list-group-item active" data-target="#charge-model">缴费</a>
                    <a href="" class="list-group-item" data-target="#group-indent">团体体检订单</a>
                    <a href="javascript:void(0)" class="list-group-item" data-target="#personal-indent">个人体检订单</a>
                    <a href="javascript:void(0)" class="list-group-item" data-target="#persional-info">个人中心</a>     
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
 <% if(vipItems==null&&groupItems==null){ %>                         
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
                <form class="form-horizontal" action="<%=basePath%>/finance/OmmayPay" method="get">
                      <div class="form-group">
                        <label for="client-id" class="col-sm-3 control-label">请输入预约编号ID：</label>
                        <div class="col-sm-4">
                          <input type="text" name="id" class="form-control" id="client-id" placeholder="订单ID">
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-10">
                          <button class="btn btn-default" type="submit">查找订单</button>
                        </div>
                      </div>
                </form>
            </div>
        <!-- end -->
<% }else if(vipItems!=null){ %>

        <!-- 1.1个人预约缴费页面 -->
            <div class="charge-result" id="personal-booking">
                <div class="result-header">
                    <div class="header-title">
                        <h4><span>何小萌</span>第<span>几</span>次体检预约订单</h4>
                    </div>
                    <div class="header-content">
                        <span>会员编号 :<span class="client-number">HY000001</span></span>
                        <span>会员姓名 :<span class="client-name">何小萌</span></span>
                        <span>业务员 :<span class="client-sal">司徒靖</span></span>
                        <span>体检时间 :<span class="check-time">2015年8月7日</span></span>
                        <br>
                        <span>预约号 :<span class="">HY201508001</span></span>
                        <span>预约体检时间 :<span class="">2015年8月7日上午</span></span>
                        <span>已选项目 :<span class="">4</span></span>
                    </div>
                </div>
                <div class="result-body">
                    <form action="#">
                        <table class="table table-bordered" id="physical-package">
                            <thead>
                                <tr>
                                    <th width="5%">序号</th>
                                    <th width="10%">项目项目</th>
                                    <th width="20%">体检项目</th>
                                    <th width="10%">项目单价</th>
                                    <th width="10%">检查类型</th>
                                    <th width="10%">适用性别</th>
                                    <th width="10%">科室名称</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>11</td>
                                    <td>2222</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                        <p class="col-sm-offset-9 indent-money">体检总价：￥<span id="money">0</span></p>
                        <div class="form-group">
                        <div class="col-sm-offset-10 col-sm-1">
                          <button type="submit" class="btn btn-default">确认缴费</button>
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
                                    <td>2015年8月2日</td>
                                    <td>提交预约</td>
                                    <td>上官清明</td>
                                </tr>
                            </tbody>
                    </table>
                </div>
            </div>
        <!--      end     -->
<% }else if(groupItems!=null){ %>


        <!-- 1.2团体预约缴费页面 -->
            <div class="charge-result" id="team-booking">
                <div class="result-header">
                    <div class="header-title">
                        <h4><span>中粮公司</span>第<span>几</span>次体检预约订单</h4>
                    </div>
                    <div class="header-content">
                        <span>项目编号 :<span class="client-number">HY000001</span></span>
                        <span>客户代表 :<span class="client-name">何小萌</span></span>
                        <span>业务员 :<span class="client-sal">司徒靖</span></span>
                        <span>部门经理 :<span class="client-sal">李文祥</span></span>
                        <span>预约时间 :<span class="check-time">2015年8月7日</span></span>
                        <br>
                        <span>预约号 :<span class="">HY201508001</span></span>
                        <span>预约体检时间 :<span class="">2015年8月7日上午 -- 2015年8月9日下午</span></span>
                        <span>体检人数 :<span class="">xxxxx</span></span>
                        <span>已选项目 :<span class="">4</span></span>
                    </div>
                </div>
                <div class="result-body">
                    <form action="#">
                        <table class="table table-bordered" id="physical-package">
                            <thead>
                                <tr>
                                    <th width="5%">套餐编号</th>
                                    <th width="10%">套餐名</th>
                                    <th width="20%">套餐单价</th>
                                    <th width="10%">体检人数</th>
                                    <th width="10%">合计</th>
                                    <th width="10%">体检名单</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>11</td>
                                    <td>2222</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                        <p class="col-sm-offset-9 indent-money">体检总价：￥<span id="money">888</span></p>
                        <div class="form-group">
                        <div class="col-sm-offset-10 col-sm-1">
                          <button type="submit" class="btn btn-default">确认缴费</button>
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
                                    <td>2015年8月2日</td>
                                    <td>提交预约</td>
                                    <td>上官清明</td>
                                </tr>
                            </tbody>
                    </table>
                </div>
            </div>
        <!--      end     -->
        
 <% } %>
 
        </div>

    </div>

     <!--  end  -->
    
    <!--  2.团体体检订单 -->
    <div id="group-indent">
        <table class="table table-bordered" id="physical-package">
            <thead>
                <tr>
                    <th width="5%">序号</th>
                    <th width="10%">预约号</th>
                    <th width="10%">项目编号</th>
                    <th width="20%">预约名称</th>
                    <th width="15%">预约时间</th>
                    <th width="10%">客户代表</th>
                    <th width="10%">业务员</th>
                    <th width="10%">预约状态</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>11</td>
                    <td>2222</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!--      end      -->


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
                <tr>
                    <td>11</td>
                    <td>2222</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!--    end   -->
                            

    <!--  个人中心  -->
    <div class="check-body" id="persional-info">
        <fieldset>
            <div class="ct">
                <div class="ct-head">
                    <span id="name">XXX</span>  |
                    <a href="#" data-toggle="modal" data-target="#changeUserInfo">修改个人信息</a> | 
                    <a href="#" data-toggle="modal" data-target="#myModal">修改密码</a> 
                </div>
                <div class="ct-middle">
                    <div class="user-ID">
                        <label>员工ID</label>
                        <span id="user-ID"> </span>
                    </div>
                    <!-- <div class="sex">
                        <label >性别</label>
                        <span id="sex">男</span>
                    </div> -->
                    <div class="position">
                        <label >职位</label>
                        <span id="position"> </span>
                    </div>
                    <!-- <div class="IDcard">
                        <label >身份证号码</label>
                        <span id="IDcard">440014199105275634</span>
                    </div> -->
                    <div class="phone">
                        <label >手机</label>
                        <span id="phone"> </span>
                    </div>
                    <!-- <div class="office-phone">
                        <label >办公电话</label>
                        <span id="office-phone">028-8375417</span>
                    </div> -->
                    <div class="email">
                        <label >邮箱</label>
                        <span id="email"> </span>
                    </div>
                    <!-- <div class="address">
                        <label >联系地址</label>
                        <span id="address" title="sss">四川省成都市西区大道1001号13楼市场部ssssssssssssssssssssssssssssssss</span>
                    </div> -->
                </div>
            </div>      
        </fieldset>
    </div>


<!-- 修改密码模态框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="changePwd">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="changePwd">修改密码</h4>
      </div>
    <form action="">
      <div class="modal-body">

          <div class="form-group">
            <label for="old-pwd" class="control-label">请输入旧密码:</label>
            <input type="text" class="form-control" id="old-pwd" required="required">
          </div>
          <div class="form-group">
            <label for="new-pwd" class="control-label">请输入新密码:</label>
            <input type="text" class="form-control" id="new-pwd" required="required">
          </div>
          <div class="form-group">
            <label for="new-pwd2" class="control-label">请再次输入新密码:</label>
            <input type="text" class="form-control" id="new-pwd2" required="required">
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="submit" class="btn btn-primary">保存</button>
      </div>
    </form>
    </div>
  </div>
</div>

<!-- 修改用户信息模态框 -->
<div class="modal fade" id="changeUserInfo" tabindex="-1" role="dialog" aria-labelledby="changePwd">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="changePwd">修改用户信息</h4>
      </div>
    <form action="updateUserMessage" method="post">
      <div class="modal-body">
        <div class="ct-middle" >
            <div class="user-ID">
                <label class="no-bg">姓名</label>
                <span id="user-ID">XXX</span>
            </div>
            <div class="sex ">
                <label >性别</label>
                <span id="sex">男</span>
            </div>
            <div class="user-ID ">
                <label>员工ID</label>
                <span id="user-ID">YG02001</span>
            </div>
            <div class="position ">
                <label >职位</label>
                <span id="position">业务员</span>
            </div>
            <div class="IDcard ">
                <label >身份证号码</label>
                <span id="IDcard">440014199105275634</span>
            </div>    
        </div>
        <div class="clear"> </div>    
          <div class="form-group md">
            <label for="old-pwd" class="control-label">手机</label>
            <input type="text" class="form-control" name="iphone" required="required">
          </div>
          <div class="form-group md">
            <label for="new-pwd" class="control-label">办公电话</label>
            <input type="text" class="form-control" name="office-phone" required="required">
          </div>
          <div class="form-group md">
            <label for="new-pwd2" class="control-label">邮箱</label>
            <input type="text" class="form-control" name="email" required="required">
          </div>
          <div class="form-group md">
            <label for="" class="ct-ad">地址</label>
            <textarea cols="57" rows="4" width="75%" name="address"></textarea>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="submit" class="btn btn-primary">保存</button>
      </div>
    </form>
    </div>
  </div>
</div>
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