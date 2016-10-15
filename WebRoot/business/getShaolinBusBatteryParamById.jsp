<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.shuohe.guoneng.*" %>
<%@page import="java.io.PrintWriter"%> 
<%@page import="java.util.*"%> 
<%

	//服务器端接到回调函数名字输出回调函数，客户端根据回调函数进行解析取得函数中json对象      
	response.setContentType("text/html; charset=utf-8");      
	String callback=request.getParameter("callback");
	/*Enumeration  e = request.getAttributeNames();
		while (e.hasMoreElements()) {
		String key = (String)e.nextElement();
		Object value = request.getAttribute(key);
		System.out.println(" " + key + " = " + value);
	}*/
		      
	PrintWriter ss = response.getWriter(); 
	String carId=request.getParameter("carId");
	//System.out.println("getShaolinBusBatteryHistoryForLast = "+callback);  
	//System.out.println("getParameter username = "+carId);  
	//System.out.println("getQueryString = "+request.getQueryString());  
	    
	ss.print(callback+"("+GuoNengDatabase.getShaolinBusBatteryHistoryForLast(carId,"100")+")");     
%>
