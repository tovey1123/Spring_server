<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>jsp2</title>
</head>
<body>

<div id="global">
<h1>Employee List</h1>
<table>
<tr>
    <th>编号</th>
    <th>姓名</th>
    <th>生日</th>
</tr>
<c:forEach items="${mp.list}" var="list">
    <tr>
        <td>${list.getUserId()}</td>
        <td>${list.getUserName()}</td>
        <td>${list.getUserAge()}</td>
    </tr>
</c:forEach>
</table>
<br/>
<table>
    <tr style="background:#ababff">
	   <th>编号</th>
   	   <th>姓名</th>
       <th>生日</th>
    </tr>
    
    <c:forEach items="${mp.list}" var="list"
            varStatus="status">
    <tr>
        <c:if test="${status.count%2 == 0}">
            <tr style="background:#eeeeff">
        </c:if>
        <c:if test="${status.count%2 != 0}">
            <tr style="background:#dedeff">
        </c:if>
       <td>${list.getUserId()}</td>
        <td>${list.getUserName()}</td>
        <td>${list.getUserAge()}</td>
    </tr>
    </c:forEach>
</table>
</div>
</body>
</html>
