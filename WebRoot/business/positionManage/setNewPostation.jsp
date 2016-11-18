<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.shuohe.JobClassification.*"%> 
<%@page import="java.io.PrintWriter"%> 
<%@page import="java.util.*"%> 
<%

	//服务器端接到回调函数名字输出回调函数，客户端根据回调函数进行解析取得函数中json对象      
	response.setContentType("text/html; charset=utf-8");      
	String callback=request.getParameter("callback");
		      
	PrintWriter ss = response.getWriter(); 
	String department_name=request.getParameter("department_name");
	String position_name=request.getParameter("position_name");
	String info=request.getParameter("info"); 
	    
	ss.print(callback+"("+JobClassification.creatNewPostaion(department_name, position_name, "")+")");     
%>
