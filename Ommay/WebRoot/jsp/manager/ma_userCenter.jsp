<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" href="../resource/css/user.css">

<div class="check-body">
	<fieldset>
        <legend>工作人员个人信息</legend>
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