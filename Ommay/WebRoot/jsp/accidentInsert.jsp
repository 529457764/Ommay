<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'accidentInsert.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <form:form commandName="account"  action="accident_save_service" method="post">
  	<fieldset>
  		<legend>增加account</legend>
  		<label for="account">account->name:</label>
  		<input type="text" id="name" name="namte" value="" tabindex="1"></br></br>
  		 <label for="account_flag">acount_flag->age:</label>
  		<input type="text" id="age" name="age" value="" tabindex="2">
  		<div id="buttons">
  			<input for="submit" type="submit" tabindex="3" value="Add Accident"/>
  		</div>
  	</fieldset>
  </form:form>
  </body>
</html>