<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>后台登录系统</title>
	<link rel="stylesheet" href="css/style_login.css">

	<!--<link href='//fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
-->
	<!-- For-Mobile-Apps-and-Meta-Tags -->
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="Simple Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- //For-Mobile-Apps-and-Meta-Tags -->

<style>
button{
	background:#005377;
	color:#fff;
	padding:11px;
	outline: none;
	border:none;
	font-size: 17px;
	width:50%;
	cursor:pointer;
	margin-top:5px;
		transition: 0.5s all;
	-webkit-transition: 0.5s all;
	-moz-transition: 0.5s all;
	-o-transition: 0.5s all;
	-ms-transition: 0.5s all;
}
button:hover{
	background:#fed14e;
	color:#000;
}
</style>

</head>

<body>
  <!--    <h1>中国铁路总公司</h1>
    <h2>大型预制构件预应力检测系统</h2>-->
    <div id="imgdiv" align="center">
   		 <img name="title" src ="${pageContext.request.contextPath}/images/title.png" alt="中国铁路总公司"/>
    </div>
    <div class="container w3">
        <h2>现在登录</h2>
		<form action="index" method="post" id="info_form">
			<div class="username">
				<span class="username" style="height:19px">用户:</span>
				<input type="text" name="ID" class="name" placeholder="员工工号/手机" required="">
				<div class="clear"></div>
			</div>
			<div class="password-agileits">
				<span class="username"style="height:19px">密码:</span>
				<input type="password" name="PWD2" class="password" placeholder="密码" required="">
				<div class="clear"></div>
			</div>
			<div class="rem-for-agile">
				<input type="checkbox" name="remember" class="remember">记得我
　　
<br>
				<a href="#">忘记了密码</a><br>
			</div>
			<!--  <div class="login-w3">
					<input type="submit" class="login" value="Login">
			</div >
			-->
			
			<button type="button" id="lg">Login</button>
			
			<div class="clear"></div>
		</form>
	</div>
	<div class="footer-w3l">
		<p> 中国铁路总公司公司后台登录系统</p>
	</div>
	
<script src="js/jquery.js"></script>	
<script type="text/javascript">
	
		$("#lg").click(function () {
           login();
        });
      function login(){
    	  $.post("/spring_MyServer/index",$('#info_form').serializeArray(),
    			  function(rslt){
  		  				
    		  			 if(rslt.errCode=="1"){
    		  				alert("用户不存在");
    		  			}else if(rslt.errCode=="2"){
    		  				alert("密码错误");
    		  			}else{
    		  				window.location.href="/spring_MyServer/mainPage?ID="+rslt.data.employee_id;
    		  			}
    	  			},'json');
     	 }
     
    </script>
	
</body>
</html>