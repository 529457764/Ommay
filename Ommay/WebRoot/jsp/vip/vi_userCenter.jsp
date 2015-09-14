<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
HashMap map = (HashMap)request.getAttribute("user");
if(map==null)
	response.sendRedirect(basePath + "account/login");	
%>
<link rel="stylesheet" href="<%=path%>/resource/css/user.css">

    <div class="check-body">
        <fieldset>
            <legend>会员个人信息</legend>
            <div class="ct">
                <div class="ct-head">
                    <span id="name"><%=map.get("name")%></span>  |
                    <a href="#" data-toggle="modal" data-target="#changeUserInfo">修改个人信息</a> | 
                    <a href="#" data-toggle="modal" data-target="#myModal">修改密码</a> 
                </div>
                <div class="ct-middle">
                    <div class="user-ID">
                        <label>会员ID</label>
                        <span id="user-ID"><%= map.get("id") %></span>
                    </div>
				<div class="IDcard">
                        <label >身份证号码</label>
                        <span id="IDcard"><%= map.get("identity") %></span>
                    </div>
                    <div class="phone">
                        <label >手机</label>
                        <span id="phone"><%= map.get("mobilephone") %></span>
                    </div>
                    <div class="office-phone">
                        <label >办公电话</label>
                        <span id="office-phone"><%= map.get("officephone") %></span>
                    </div>
                    <div class="email">
                        <label >邮箱</label>
                        <span id="email"><%= map.get("email") %></span>
                    </div>
                    <div class="address">
                        <label >联系地址</label>
                        <span id="address" title="sss"><%= map.get("address") %></span>
                    </div>
                    <div class="ill">
                        <label >病史</label>
                        <span id="ill"><%= map.get("sicknesshistory") %></span>
                    </div>
                    <div class="position">
                        <label >经手业务员</label>
                        <span id="position"><%= map.get("salesman") %></span>
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
    <form action="account/changePassword">
      <div class="modal-body">

          <div class="form-group">
            <label for="old-pwd" class="control-label">请输入旧密码:</label>
            <input type="text" class="form-control" id="old-pwd" name="oldPassword">
          </div>
          <div class="form-group">
            <label for="new-pwd" class="control-label">请输入新密码:</label>
            <input type="text" class="form-control" id="new-pwd" name="newPassword">
          </div>
          <div class="form-group">
            <label for="new-pwd2" class="control-label">请再次输入新密码:</label>
            <input type="text" class="form-control" id="new-pwd2" name="newPassword2">
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
    <form action="check/UserMessage/updateUserMessage">
      <div class="modal-body">
        <div class="ct-middle" >
            <div class="user-ID">
                <label class="no-bg">姓名</label>
                <span id="user-ID"><%=map.get("id") %></span>
            </div>
            <div class="sex ">
                <label >性别</label>
                <span id="sex"><%=map.get("gender") %></span>
            </div>
            <div class="user-ID ">
                <label>会员ID</label>
                <span id="user-ID"><%= map.get("id") %></span>
            </div>
            <div class="position ">
                <label >类别</label>
                <span id="position">会员</span>
            </div>
            <div class="IDcard ">
                <label >身份证号码</label>
                <span id="IDcard"><%= map.get("identity") %></span>
            </div>
            <div class="position">
               <label >经手业务员</label>
               <span id="position"><%= map.get("salesman") %></span>
          </div>    
        </div>
        <div class="clear"> </div>
       
          <div class="form-group md">
            <label for="old-pwd" class="control-label">手机</label>
            <input type="text" class="form-control" name="iphone">
          </div>
          <div class="form-group md">
            <label for="new-pwd" class="control-label">办公电话</label>
            <input type="text" class="form-control" name="officePhone">
          </div>
          <div class="form-group md">
            <label for="new-pwd2" class="control-label">邮箱</label>
            <input type="text" class="form-control" name="email">
          </div>
          <div class="form-group md">
            <label for="" class="control-label">地址</label>
            <textarea name="" id="" cols="57" rows="4"></textarea>
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