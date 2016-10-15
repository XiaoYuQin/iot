<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.shuohe.guoneng.*" %>
<%@page import="java.io.PrintWriter"%> 


<%

	//服务器端接到回调函数名字输出回调函数，客户端根据回调函数进行解析取得函数中json对象      
	response.setContentType("text/html; charset=utf-8");      
	String callback=request.getParameter("callback");      
	

	
	PrintWriter ss = response.getWriter();      
	ss.print(callback+"("+GuoNengDatabase.getShaolinBusInfo()+")");     
%>
