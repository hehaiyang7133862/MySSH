<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
  		<font size="4">这个一个 struts2,spring 和 hibernate 使用的例子。请用以下账号密码登录<br>
  			默认账号/密码: <font color="red">anan/123</font><br>
  			<br>请事先在数据库插入用户信息
  		</font>
  			<br>
  			<br>
    	<form action="userManagerAct.action" method="post">
    		<table>
    			<tr>
    				<td>username</td><td><input type="text" name="user.uname"/></td>
    				<td>password</td><td><input type="password" name="user.password"/></td><td>密     码</td><td></td>
    			</tr>
    			<tr>
    				<td colspan="2">
    					<input type="submit" value="submit">
    					<input type="reset" value="reset">
    				</td>
    			</tr>
    		</table>
    	</form>
  </body>
</html>
