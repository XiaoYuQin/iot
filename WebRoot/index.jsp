<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>登录界面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
<link href="./Wopop_files/style_log.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="./Wopop_files/style.css">
<link rel="stylesheet" type="text/css" href="./Wopop_files/userpanel.css">
<link rel="stylesheet" type="text/css" href="./Wopop_files/jquery.ui.all.css">
	
</head>


<body>

	<%
		out.println("session id:" + request.getSession().getId() + "<br>");
		out.println("用户名：" + request.getSession().getAttribute("username") + "<br>");
		
	%>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=2)" width="100%" color=#987cb9 SIZE=10>
       登录界面<br>
	<form action="login/LoginAction.action">
		用户名：<input name="username"><br> 密 码：<input
			type="password" name="userpass"><br> <input
			type="submit" value="提 交"> <input type="reset" value="取 消">
	</form>
	<input type="button" value="注册" onClick="window.location.href='signUp/signUp.jsp'">

</body>

</html>
