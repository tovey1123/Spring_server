<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>  
  <body>
  <h1>Welcome to Pres_tress Manage System</h1>
   <form  action="login" method="post">
   <input id="search-input" class="input input-hook" type="text" autocomplete="off" maxlength="100" name="word" placeholder="搜你想搜的">
   	<input type="submit" value="ok">
   </form>
   <form action="getPublicKey" method="get">
   <input type="submit" value="ok">
   </form>
  </body>
</html>

