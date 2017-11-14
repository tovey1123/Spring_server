<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yjde.springmvc.UserPO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<UserPO> str= (List<UserPO>)request.getAttribute("list");
System.out.println("-------------------");
System.out.println(str);
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>SpringMVC</title>
    
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
  <table border="1" width="500" align="center">
  		<tr>
			<td >编号</td>
			<td >姓名</td>
			<td >年龄</td>
		</tr>
   <%
   		for(UserPO user:str){
   			%>
   				<tr>
   					<td><%=user.getUserId() %></td>
   					<td><%=user.getUserName() %></td>
   					<td><%=user.getUserAge() %></td>
   				</tr>
   			<%
   		}
    %>
    </table>
  </body>
</html>

