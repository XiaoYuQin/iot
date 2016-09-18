<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>登出！！！</title>

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
	<%
		System.out.println("logout");
		session.removeAttribute("username"); //注销session中的username对象
		session.removeAttribute("id"); //注销session中的id对象
		session.invalidate();
	%>
	<%
		out.println("session id:" + request.getSession().getId() + "<br>");
		out.println("用户名：" + request.getSession().getAttribute("username") + "<br>");
	%>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=2)" width="100%" color=#987cb9 SIZE=10>
	登出！！！
	<div id="timer">
		5
	</div>
	 <script type="text/javascript">
	 	var index = 5;
	 	window.setInterval("jumpToIndex()", 1000);
     	function jumpToIndex()
     	{
     		index--;
     		document.getElementById('timer').innerHTML = index+'';
     		if(index<2)
				window.location.href='index.jsp';
     	}     
     </script>
	<br>
</body>
</html>
