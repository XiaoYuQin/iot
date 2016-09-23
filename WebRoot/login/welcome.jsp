<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="thing.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println("welcome page");	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>登录成功</title>

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
		out.println("session id:" + request.getSession().getId() + "<br>");
		out.println("用户名：" + request.getSession().getAttribute("username")+ "<br>");
		
	%>
	<script type="text/javascript">
		function logout() {
			window.location.href = 'logout/logout.jsp'
		}
	</script>
	<input type="button" value="注销" onClick="logout()">

	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=2)"
		width="100%" color=#987cb9 SIZE=10>
	<%
		//session.setMaxInactiveInterval(1*10);//以秒为单位      
		System.out.println("check is onLine");	
		if (session.getAttribute("username") == null) {
			System.out.println("session fail to index");
			response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
			String newLocn = "/iot/index.jsp";
			response.setHeader("Location", newLocn);
		}
		else
		{
			System.out.println("session ok to index");
			response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
			String newLocn = "../business/index.jsp";
			response.setHeader("Location", newLocn);			
		}
	%>
	登录成功
	<br>
	<!-- 
    <script type="text/javascript" src="http://counter.sina.com.cn/ip/" charset="gb2312"></script>  -->
	<!--获取接口数据，注意charset -->
	<!-- 
	<script type="text/javascript">   
		document.writeln("IP地址："+ILData[0]+"<br />");             //输出接口数据中的IP地址   
		document.writeln("地址类型："+ILData[1]+"<br />");         //输出接口数据中的IP地址的类型   
		document.writeln("地址类型："+ILData[2]+"<br />");         //输出接口数据中的IP地址的省市  
		document.writeln("地址类型："+ILData[3]+"<br />");         //输出接口数据中的IP地址的  
		document.writeln("地址类型："+ILData[4]+"<br />");         //输出接口数据中的IP地址的运营商  
	</script>
 	-->
	<%
		System.out.println("list all things");
		if (session.getAttribute("username") != null) {
			String userName = request.getSession().getAttribute("username").toString();
			ArrayList<Thing> things = new ArrayList<>();			
			things = Database.getThingsList(userName);
			for(Thing s: things)
			{
				out.println("ApiKey  ： "+s.getApiKey());
				out.println("设备名称 ： "+s.getName());
				out.println("设备类型 ： "+s.getType()+"<br>");
			}			
		}
	%>
	
</body>
</html>
