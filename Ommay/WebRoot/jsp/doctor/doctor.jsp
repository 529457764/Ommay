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
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>doctor</title>
    <script type="text/javascript" src="<%=path %>/resource/jquery/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/js/doctor.js"></script>
    
    <link rel="stylesheet" href="<%=path %>/resource/css/doctor.css">
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
					<a href="#" class="list-group-item active">查找会员</a>
					<a href="#" class="list-group-item">会员体检信息</a>
					<a href="#" class="list-group-item">查看个人信息</a>
					
				</ul>
			</div>
			<!-- 右侧主要内容 -->
			<div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
				<div class="row">
					<div class="panel panel-default">
            			<div class="panel-heading">
            				<h4>查找会员</h4>
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
                <form class="form-horizontal">
                      <div class="form-group">
                        <label for="client-id" class="col-sm-2 control-label">请输入会员ID</label>
                        <div class="col-sm-4">
                          <input type="text" class="form-control" id="client-id" placeholder="会员ID">
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                          <button type="submit" class="btn btn-default" id="search-clientID">查找会员</button>
                        </div>
                      </div>
                </form>
            </div>
        <!-- end -->

        <!-- 体检结果录入 -->
            <!-- <div class="charge-result" style="display:none" >
                <div class="result-header">
                    <div class="header-title">
                        <h4><span>何小萌</span>第<span>几</span>次体检报告</h4>
                    </div>
                    <div class="header-content">
                        <span>会员编号 :<span class="client-number">HY000001</span></span>
                        <span>会员姓名 :<span class="client-name">何小萌</span></span>
                        <span>业务员 :<span class="client-sal">司徒靖</span></span>
                        <span>体检时间 :<span class="check-time">2015年8月7日</span></span>
                        <span>责任医生 :<span class="check-doctor">杨宏斌</span></span>
                    </div>
                </div>
                <div class="result-body">
                    <form action="#">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th width="10%">项目编号</th>
                                    <th width="20%">体检项目</th>
                                    <th width="30%">体检结果</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>11</td>
                                    <td>2222</td>
                                    <td><input type="text" placeholder="请输入体检结果"
                                    ></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="form-group">
                        <div class="col-sm-offset-9 col-sm-1">
                          <button type="submit" class="btn btn-default">重置</button>
                        </div>
                        <div class=" col-sm-1">
                          <button type="submit" class="btn btn-default">提交</button>
                        </div>
                      </div>
                    </form>
                </div>
            </div> -->
        <!--      end     -->
        </div>
    </div>

     <!--  end  -->


    <!-- 查看会员 -->

    <div class="show-client" id="show-client" style="display:none">
        
        <div class="search-client">
                <a href="#" data-target="#show-client-list">查找会员列表</a> | 
                <a href="#" data-target="#client-result-list">会员体检列表</a> |
                <a href="#" data-target="#client-result-before">查看体检结果</a> |
                <a href="#" data-target="#insert-result">体检结果录入</a>
        </div>
        <div class="tab-content">
        <!--  1.查看会员列表  -->
        <div class="show-client-list" id="show-client-list" style="display:block" >
            <form action="#">
                <table class="show-cl-list table table-bordered">
                    <thead>
                        <tr>
                            <th width="5%">序号</th>
                            <th width="10%">会员编号</th>
                            <th width="10%">会员姓名</th>
                            <th width="5%">性别</th>
                            <th width="15%">预约状态</th>
                            <th width="10%">所属公司</th>
                            <th width="10%">业务员</th>
                            <th width="10%">责任医生</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>YH201505001</td>
                            <td>XXXX</td>
                            <td>男</td>
                            <td>33333</td>
                            <td>33333</td>
                            <td>33333</td>
                            <td>33333</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>YH201505001</td>
                            <td>XXXX</td>
                            <td>男</td>
                            <td>结果查询</td>
                            <td>33333</td>
                            <td>33333</td>
                            <td>33333</td>
                        </tr>
                    </tbody>
                </table>
                </form>    
        </div>
        <!--       end      -->

        <!-- 2.某会员体检列表 -->
        <div class="charge-result"  id="client-result-list" >
                <div class="result-header">
                    <div class="header-title">
                        <h4><span>何小萌</span>体检列表</h4>
                    </div>
                    <div class="header-content">
                        <span>会员编号 :<span class="client-number">HY000001</span></span>
                        <span>会员姓名 :<span class="client-name">何小萌</span></span>
                        <span>所属公司 :<span class="client-sal">个体会员</span></span>
                        
                    </div>
                </div>
                <div class="result-body" id="chkUpList">
                    <form action="#">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th width="13%">预约名称</th>
                                    <th width="18%">预约编号</th>
                                    <th width="18%">预约体检日期</th>
                                    <th width="18%">体检状态</th>
                                    <th width="18%">状态更新日期</th>
                                    <th width="15%">操作人员</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>第一次体检</td>
                                    <td>YH201505001</td>
                                    <td>2014年8月7日</td>
                                    <td>缴费成功</td>
                                    <td>2015年8月5日</td>
                                    <td>司徒靖</td>
                                </tr>
                                <tr>
                                    <td>第二次体检</td>
                                    <td>YH201505001</td>
                                    <td>2014年8月7日</td>
                                    <td>结果查询</td>
                                    <td>2015年8月5日</td>
                                    <td>司徒靖</td>
                                </tr>
                                <tr>
                                    <td>第二次体检</td>
                                    <td>YH201505001</td>
                                    <td>2014年8月7日</td>
                                    <td>xxxxxxx</td>
                                    <td>2015年8月5日</td>
                                    <td>司徒靖</td>
                                </tr>
                            </tbody>
                        </table>
                        
                    </form>
                </div>
            </div>
        <!--      end       -->

        
        <!-- 3.查看某会员之前的体检结果-->
        <div class="charge-result"   id="client-result-before">
                <div class="result-header">
                    <div class="header-title">
                        <h4><span>何小萌</span>第<span>几</span>次体检报告</h4>
                    </div>
                    <div class="header-content">
                        <span>会员编号 :<span class="client-number">HY000001</span></span>
                        <span>会员姓名 :<span class="client-name">何小萌</span></span>
                        <span>业务员 :<span class="client-sal">司徒靖</span></span>
                        <span>体检时间 :<span class="check-time">2015年8月7日</span></span>
                        <span>责任医生 :<span class="check-doctor">杨宏斌</span></span>
                    </div>
                </div>
                <div class="result-body">
                    <form action="#">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th width="10%">项目编号</th>
                                    <th width="20%">体检项目</th>
                                    <th width="30%">体检结果</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>11</td>
                                    <td>2222</td>
                                    <td>33333</td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        <!--             end           -->


        <!-- 4.第几次体检结果录入 -->
            <div class="charge-result" id="insert-result"  >
                <div class="result-header">
                    <div class="header-title">
                        <h4><span>何小萌</span>第<span>几</span>次体检报告</h4>
                    </div>
                    <div class="header-content">
                        <span>会员编号 :<span class="client-number">HY000001</span></span>
                        <span>会员姓名 :<span class="client-name">何小萌</span></span>
                        <span>业务员 :<span class="client-sal">司徒靖</span></span>
                        <span>体检时间 :<span class="check-time">2015年8月7日</span></span>
                        <span>责任医生 :<span class="check-doctor">杨宏斌</span></span>
                    </div>
                </div>
                <div class="result-body">
                    <form action="#">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th width="10%">项目编号</th>
                                    <th width="20%">体检项目</th>
                                    <th width="30%">体检结果</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>11</td>
                                    <td>2222</td>
                                    <td><input type="text" placeholder="请输入体检结果"
                                    ></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="form-group">
                        <div class="col-sm-offset-9 col-sm-1">
                          <button type="submit" class="btn btn-default">重置</button>
                        </div>
                        <div class=" col-sm-1">
                          <button type="submit" class="btn btn-default">提交</button>
                        </div>
                      </div>
                    </form>
                </div>
            </div>
        <!--      end     -->
    </div>
    </div>
    <!--    end   -->
                            

    <!--  个人中心  -->
    <div class="check-body" style="display:none">
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
                        <span id="user-ID">YG02001</span>
                    </div>
                    <div class="sex">
                        <label >性别</label>
                        <span id="sex">男</span>
                    </div>
                    <div class="position">
                        <label >职位</label>
                        <span id="position">业务员</span>
                    </div>
                    <div class="IDcard">
                        <label >身份证号码</label>
                        <span id="IDcard">440014199105275634</span>
                    </div>
                    <div class="phone">
                        <label >手机</label>
                        <span id="phone">13828925271</span>
                    </div>
                    <div class="office-phone">
                        <label >办公电话</label>
                        <span id="office-phone">028-8375417</span>
                    </div>
                    <div class="email">
                        <label >邮箱</label>
                        <span id="email">stjing@163.com</span>
                    </div>
                    <div class="address">
                        <label >联系地址</label>
                        <span id="address" title="sss">四川省成都市西区大道1001号13楼市场部ssssssssssssssssssssssssssssssss</span>
                    </div>
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
            <input type="text" class="form-control" id="old-pwd">
          </div>
          <div class="form-group">
            <label for="new-pwd" class="control-label">请输入新密码:</label>
            <input type="text" class="form-control" id="new-pwd">
          </div>
          <div class="form-group">
            <label for="new-pwd2" class="control-label">请再次输入新密码:</label>
            <input type="text" class="form-control" id="new-pwd2">
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
    <form action="">
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
            <input type="text" class="form-control" id="">
          </div>
          <div class="form-group md">
            <label for="new-pwd" class="control-label">办公电话</label>
            <input type="text" class="form-control" id="">
          </div>
          <div class="form-group md">
            <label for="new-pwd2" class="control-label">邮箱</label>
            <input type="text" class="form-control" id="">
          </div>
          <div class="form-group md">
            <label for="" class="ct-ad">地址</label>
            <textarea cols="57" rows="4" width="75%" ></textarea>
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