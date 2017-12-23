<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="pkg_po.UserPO"%>
<%@page import="java.util.Date "%>
<%@page import="java.text.SimpleDateFormat" %>
<%
Date dt= new Date();
SimpleDateFormat f1 = new SimpleDateFormat("EEEE");
SimpleDateFormat f2 = new SimpleDateFormat("yyyy/MM/dd");//设置日期格式
String week=f1.format(dt);
String week2=null;
String date=f2.format(dt);
int day = Integer.valueOf(date.substring(8));
if(week.equals("星期一")){ week2 = "Monday";}
else if(week.equals("星期二")){ week2 = "Tuesday";}
else if(week.equals("星期三")){ week2 = "Wednesday";}
else if(week.equals("星期四")){ week2 = "Thursday";}
else if(week.equals("星期五")){  week2 = "Friday";}
else if(week.equals("星期六")){ week2 = "Saturday";}
else { week2 ="Sunday";}

request.setAttribute("week2", week2);
request.setAttribute("day", day);
request.setAttribute("date", date);
%>
<!DOCTYPE html>
<html lang="en">
  
<!-- Mirrored from condorthemes.com/cleanzone/ by HTTrack Website Copier/3.x [XR&CO'2013], Mon, 31 Mar 2014 14:31:31 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--  <link rel="shortcut icon" href="images/favicon.png">  -->

    <title>大型预制构件预应力管理系统</title>

    <!-- Bootstrap core CSS -->
    <link href="js/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->
	    <link rel="stylesheet" type="text/css" href="js/jquery.gritter/css/jquery.gritter.css" />

    <link rel="stylesheet" type="text/css" href="js/jquery.nanoscroller/nanoscroller.css" />
    <link rel="stylesheet" type="text/css" href="js/jquery.easypiechart/jquery.easy-pie-chart.css" />
	<link rel="stylesheet" type="text/css" href="js/bootstrap.switch/bootstrap-switch.css" />
	<link rel="stylesheet" type="text/css" href="js/bootstrap.datetimepicker/css/bootstrap-datetimepicker.min.css" />
	<link rel="stylesheet" type="text/css" href="js/jquery.select2/select2.css" />
	<link rel="stylesheet" type="text/css" href="js/bootstrap.slider/css/slider.css" />
	<link rel="stylesheet" type="text/css" href="js/intro.js/introjs.css" />
	
  <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet" />

</head>
<body>

  <!-- Fixed navbar -->
  <div id="head-nav" class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="fa fa-gear"></span>
        </button>
        <a class="navbar-brand" href="#"><span>预应力检测管理系统</span></a>
      </div>
      <div class="navbar-collapse collapse">
<!--         <ul class="nav navbar-nav"> -->
<!--           <li class="active"><a href="#">Home</a></li> -->
<!--           <li><a href="#about">About</a></li> -->
<!--           <li class="dropdown"> -->
<!--             <a href="#" class="dropdown-toggle" data-toggle="dropdown">Contact <b class="caret"></b></a> -->
<!--             <ul class="dropdown-menu"> -->
<!--               <li><a href="#">Action</a></li> -->
<!--               <li><a href="#">Another action</a></li> -->
<!--               <li><a href="#">Something else here</a></li> -->
<!--       <li class="dropdown-submenu"><a href="#">Sub menu</a> -->
<!--         <ul class="dropdown-menu"> -->
<!--           <li><a href="#">Action</a></li> -->
<!--           <li><a href="#">Another action</a></li> -->
<!--           <li><a href="#">Something else here</a></li> -->
<!--           </ul> -->
<!--       </li>               -->
<!--       </ul> -->
<!--           </li> -->
<!--           <li class="dropdown"> -->
<!--             <a href="#" class="dropdown-toggle" data-toggle="dropdown">Large menu <b class="caret"></b></a> -->
<!--       <ul class="dropdown-menu col-menu-2"> -->
<!--         <li class="col-sm-6 no-padding"> -->
<!--           <ul> -->
<!--           <li class="dropdown-header"><i class="fa fa-group"></i>Users</li> -->
<!--           <li><a href="#">Action</a></li> -->
<!--           <li><a href="#">Another action</a></li> -->
<!--           <li><a href="#">Something else here</a></li> -->
<!--           <li class="dropdown-header"><i class="fa fa-gear"></i>Config</li> -->
<!--           <li><a href="#">Action</a></li> -->
<!--           <li><a href="#">Another action</a></li> -->
<!--           <li><a href="#">Something else here</a></li>  -->
<!--           </ul> -->
<!--         </li> -->
<!--         <li  class="col-sm-6 no-padding"> -->
<!--           <ul> -->
<!--           <li class="dropdown-header"><i class="fa fa-legal"></i>传感器预应力走势图</li> -->
<!--           <li><a href="#">New sale</a></li> -->
<!--           <li><a href="#">Register a product</a></li> -->
<!--           <li><a href="#">Register a client</a></li>  -->
<!--           <li><a href="#">Month sales</a></li> -->
<!--           <li><a href="#">Delivered orders</a></li> -->
<!--           </ul> -->
<!--         </li> -->
<!--       </ul> -->
<!--           </li> -->
<!--         </ul> -->
    <ul class="nav navbar-nav navbar-right user-nav">
      <li class="dropdown profile_menu">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img alt="Avatar" src="images/avatar2_wzw.jpg" /><span>${userPo.employee_name}</span> <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="#">My Account</a></li>
          <li><a href="#">Profile</a></li>
          <li><a href="#">Messages</a></li>
          <li class="divider"></li>
          <li><a href="#">Sign Out</a></li>
        </ul>
      </li>
    </ul>			
    <ul class="nav navbar-nav navbar-right not-nav" >
      <li class="button dropdown">
        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"><i class=" fa fa-comments"></i></a>
        <ul class="dropdown-menu messages">
          <li>
            <div class="nano nscroller">
              <div class="content">
                <ul>
                  <li>
                    <a href="#">
                      <img src="images/avatar2.jpg" alt="avatar" /><span class="date pull-right">13 Sept.</span> <span class="name">Daniel</span> I'm following you, and I want your money! 
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <img src="images/avatar_50.jpg" alt="avatar" /><span class="date pull-right">20 Oct.</span><span class="name">Adam</span> is now following you 
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <img src="images/avatar4_50.jpg" alt="avatar" /><span class="date pull-right">2 Nov.</span><span class="name">Michael</span> is now following you 
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <img src="images/avatar3_50.jpg" alt="avatar" /><span class="date pull-right">2 Nov.</span><span class="name">Lucy</span> is now following you 
                    </a>
                  </li>
                </ul>
              </div>
            </div>
            <ul class="foot"><li><a href="#">View all messages </a></li></ul>           
          </li>
        </ul>
      </li>
      <li class="button dropdown">
        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-globe"></i><span class="bubble">2</span></a>
        <ul class="dropdown-menu">
          <li>
            <div class="nano nscroller">
              <div class="content">
                <ul>
                  <li><a href="#"><i class="fa fa-cloud-upload info"></i><b>Daniel</b> is now following you <span class="date">2 minutes ago.</span></a></li>
                  <li><a href="#"><i class="fa fa-male success"></i> <b>Michael</b> is now following you <span class="date">15 minutes ago.</span></a></li>
                  <li><a href="#"><i class="fa fa-bug warning"></i> <b>Mia</b> commented on post <span class="date">30 minutes ago.</span></a></li>
                  <li><a href="#"><i class="fa fa-credit-card danger"></i> <b>Andrew</b> killed someone <span class="date">1 hour ago.</span></a></li>
                </ul>
              </div>
            </div>
            <ul class="foot"><li><a href="#">View all activity </a></li></ul>           
          </li>
        </ul>
      </li>
      <li class="button"><a href="javascript:;" class="speech-button"><i class="fa fa-microphone"></i></a></li>				
    </ul>

      </div><!--/.nav-collapse animate-collapse -->
    </div>
  </div>

	<div id="cl-wrapper" class="fixed-menu">
		<div class="cl-sidebar" data-position="right" data-step="1" data-intro="<strong>Fixed Sidebar</strong> <br/> It adjust to your needs." >
			<div class="cl-toggle"><i class="fa fa-bars"></i></div>
			<div class="cl-navblock">
        <div class="menu-space">
          <div class="content">
            <div class="side-user">
              <div class="avatar"><img src="images/avatar1_50.jpg" alt="Avatar" /></div>
              <div class="info">
                <a href="#">${userPo.employee_name}</a>
                <img src="images/state_online.png" alt="Status" /> <span>Online</span>
              </div>
            </div>
            <ul class="cl-vnavigation">
              <li><a href="mainPage?ID=${userPo.employee_id}"><i class="fa fa-home"></i><span>首页</span></a>
               <!-- 
                <ul class="sub-menu">
                  <li class="active"><a href="index-2.html">Version 1</a></li>
                  <li><a href="dashboard2.html"><span class="label label-primary pull-right">New</span> Version 2</a></li>
                </ul>
               -->
              </li>
              <li><a href="email?ID=${userPo.employee_id}"><i class="fa fa-envelope nav-icon"></i><span>邮箱</span></a>
              </li>
              <li><a href="userProfile?ID=${userPo.employee_id}"><i class="fa fa-user"></i><span>个人管理</span></a>
              </li>
              <li><a href="#"><i class="fa fa-sitemap"></i><span>组织管理</span></a>
                <ul class="sub-menu">
                  <li><a href="form-elements.html">人事管理</a></li>
                  <li><a href="form-validation.html">组织管理</a></li>
                  <li><a href="form-wizard.html">活动管理</a></li>
                  <li><a href="form-masks.html">其他</a></li>
                </ul>
              </li>
              <li><a href="sensor?ID=${userPo.employee_id}"><i class="fa fa-rss-square"></i><span>传感器管理</span></a>
              </li>                              
              <li><a href="prestress?ID=${userPo.employee_id}"><i class="fa fa-bar-chart-o"></i><span>预应力查询</span></a></li>        

            </ul>
          </div>
        </div>
        <div class="text-right collapse-button" style="padding:7px 9px;">
          <input type="text" class="form-control search" placeholder="Search..." />
          <button id="sidebar-collapse" class="btn btn-default" style=""><i style="color:#fff;" class="fa fa-angle-left"></i></button>
        </div>
			</div>
		</div>
	

	
		<div class="container-fluid" id="pcont">
		  <div class="cl-mcont">
<!--  		  
			<div class="stats_bar">
				<div class="butpro butstyle" data-step="2" data-intro="<strong>Beautiful Elements</strong> <br/> If you are looking for a different UI, this is for you!.">
					<div class="sub"><h2>CLIENTS</h2><span id="total_clientes">170</span></div>
					<div class="stat"><span class="spk1"><canvas style="display: inline-block; width: 74px; height: 16px; vertical-align: top;" width="74" height="16"></canvas></span></div>
				</div>
				<div class="butpro butstyle">
					<div class="sub"><h2>Sales</h2><span>$951,611</span></div>
					<div class="stat"><span class="up"> 13,5%</span></div>
				</div>
				<div class="butpro butstyle">
					<div class="sub"><h2>VISITS</h2><span>125</span></div>
					<div class="stat"><span class="down"> 20,7%</span></div>
				</div>	
				<div class="butpro butstyle">
					<div class="sub"><h2>NEW USERS</h2><span>18</span></div>
					<div class="stat"><span class="equal"> 0%</span></div>
				</div>	
				<div class="butpro butstyle">
					<div class="sub"><h2>AVERAGE</h2><span>3%</span></div>
					<div class="stat"><span class="spk2"></span></div>
				</div>
				<div class="butpro butstyle">
					<div class="sub"><h2>Downloads</h2><span>184</span></div>
					<div class="stat"><span class="spk3"></span></div>
				</div>	

			</div>

-->
					
				
	      <div class="row dash-cols">
        <div class="col-sm-6 col-md-6">
          <div class="widget-block  white-box calendar-box">
            <div class="col-md-6 blue-box calendar no-padding">
              <div class="padding ui-datepicker"></div>
            </div>
            <div class="col-md-6">
              <div class="padding">
                <h2 class="text-center">${week2}</h2>
                <h1 class="day">${day}</h1>
              </div>
            </div>
          </div>
          
          <div class="widget-block photo white-box weather-box">
            <div class="col-md-6 padding photo">
              <h2 class="text-center">${week}</h2>
              <h1 class="day">${date}</h1>
            </div>
            <div class="col-md-6 red-box">
              <div class="padding text-center">
                <canvas id="sun-icon" width="130" height="215"></canvas>
              </div>
            </div>
          </div>
        </div>
        
		<div class="col-sm-6 col-md-6">
					<div class="block">
						<div class="header">
							<h2>通知公告 </h2>
						</div>
						<div class="content no-padding ">
							<ul class="items">
								<li>
									<i class="fa fa-file-text"></i>认真学习宣传贯彻党的十九大精神<span class="pull-right value">2017.12.08</span>
								</li>
								<li>
									<i class="fa fa-file-text"></i>中国铁总与中国邮政集团签署战略合作协议<span class="pull-right value">2017.12.06</span>
								</li>
								<li>
									<i class="fa fa-file-text"></i>上海站年发送旅客首次突破1亿人次<span class="pull-right value">2017.12.05</span>
								</li>
								<li>
									<i class="fa fa-file-text"></i>川藏铁路拉萨至林芝段路基主体工程完成<span class="pull-right value">2017.12.03</span>
								</li>
								<li>
									<i class="fa fa-file-text"></i>第十四届中国国际现代化铁路技术装备展落幕<span class="pull-right value">2017.11.03</span>									
								</li>
								<li>
									<i class="fa fa-file-text"></i>第十五届冬季趣味运动会圆满落幕<span class="pull-right value">2017.10.28</span>									
								</li>
							</ul>
						</div>
							<div class="total-data bg-blue" >
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<h2>更多 <b class="caret"></b> <span class="pull-right"></span></h2>
								</a>
<!-- 								<ul class="dropdown-menu"> -->
<!-- 									<li><a href="#">Print receipt</a></li> -->
<!-- 									<li><a href="#">Send invoice to...</a></li> -->
<!-- 									<li><a href="#">Payment</a></li> -->
<!-- 								</ul> -->
							</div>
					</div>
				</div>	
			
	</div>
				
				
			<div class="row dash-cols">
				<div class="col-sm-6 col-md-6">
					<div class="block">
						<div class="header no-border">
							<h2>预应力变化折线图</h2>
						</div>
						<div class="content blue-chart"  data-step="3" data-intro="<strong>Unique Styled Plugins</strong> <br/> We put love in every detail to give a great user experience!.">
							<div id="site_statistics" style="height:180px;"></div>
						</div>
						<div class="content">
							<div class="stat-data">
								<div class="stat-blue">
									<h2>140</h2>
									<span>传感器总数</span>
								</div>
							</div>
							<div class="stat-data">
								<div class="stat-number">
									<div><h2>83</h2></div>
									<div>预应力正常<br /></div>
								</div>
								<div class="stat-number">
									<div><h2>57</h2></div>
									<div>预应力不正常<br /><span>(偏大/偏小)</span></div>
								</div>
							</div>
							<div class="clear"></div>
						</div>
					</div>
				</div>	
				
				<div class="col-sm-6 col-md-6">
					<div class="block">
						<div class="header no-border">
							<h2>线路传感器总数统计图</h2>
						</div>
						<div class="content red-chart">
							<div id="site_statistics2" style="height:152px;"></div>
						</div>
<!-- 						<div class="content no-padding"> -->
<!-- 							<table class="red"> -->
<!-- 								<thead> -->
<!-- 									<tr> -->
<!-- 										<th>Name</th> -->
<!-- 										<th class="right"><span>25%</span>C.P.U</th> -->
<!-- 										<th class="right"><span>29%</span>Memory</th> -->
<!-- 										<th class="right"><span>16%</span>Disc</th> -->
<!-- 									</tr> -->
<!-- 								</thead> -->
<!-- 								<tbody class="no-border-x"> -->
<!-- 									<tr> -->
<!-- 										<td style="width:40%;"><i class="fa fa-sitemap"></i> Server load</td> -->
<!-- 										<td class="text-right">0,2%</td> -->
<!-- 										<td class="text-right">13,2 MB</td> -->
<!-- 										<td class="text-right">0,1 MB/s</td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td><i class="fa fa-tasks"></i> Apps</td> -->
<!-- 										<td class="text-right">0,2%</td> -->
<!-- 										<td class="text-right">13,2 MB</td> -->
<!-- 										<td class="text-right">0,1 MB/s</td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td><i class="fa fa-signal"></i> Process</td> -->
<!-- 										<td class="text-right">0,2%</td> -->
<!-- 										<td class="text-right">13,2 MB</td> -->
<!-- 										<td class="text-right">0,1 MB/s</td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td><i class="fa fa-bolt"></i> Wamp Server</td> -->
<!-- 										<td class="text-right">0,2%</td> -->
<!-- 										<td class="text-right">13,2 MB</td> -->
<!-- 										<td class="text-right">0,1 MB/s</td> -->
<!-- 									</tr> -->
<!-- 								</tbody> -->
<!-- 							</table> -->
<!-- 						</div> -->
					</div>
				</div>
			</div>
			
			<div class="row dash-cols">
					<div class="col-sm-6 col-md-6">
					<ul class="nav nav-tabs">
					  <li class="active"><a href="#chat-1" data-toggle="tab">Adam</a></li>
					  <li><a href="#chat-2" data-toggle="tab">Mike</a></li>
					  <li><a href="#chat-3" data-toggle="tab">Lucy</a></li>
					</ul>
					<div class="tab-content no-padding">
					  <div class="tab-pane active cont" id="chat-1">
						<div class="chat-wi">
							<div class="chat-space nano nscroller">
								<div class="chat-content content">
									<div class="chat-conv">
										<img alt="Avatar" class="c-avatar ttip" src="images/avatar1_50.jpg" data-toggle="tooltip" title="MiguelMich" />
										<div class="c-bubble">
											<div class="msg">Hello, what can i do for you?</div>
											<div><small>12:20 p.m.</small></div>
											<span></span>
										</div>
									</div>
									<div class="chat-conv sent">
										<img alt="Avatar" class="c-avatar ttip" src="images/avatar_50.jpg" data-toggle="tooltip" title="Adam" />
										<div class="c-bubble">
											<div class="msg">Hi, i need support with my iPhone?</div>
											<div><small>12:25 p.m.</small></div>
											<span></span>
										</div>
									</div>
									<div class="chat-conv">
										<img alt="Avatar" class="c-avatar ttip" src="images/avatar1_50.jpg" data-toggle="tooltip" title="MiguelMich" />
										<div class="c-bubble">
											<div class="msg">Hello, how are you? i just though you were here, i'll see you tomorrow.</div>
											<div><small>12:30 p.m.</small></div>
											<span></span>
										</div>
									</div>
									<div class="chat-conv sent">
										<img alt="Avatar" class="c-avatar ttip" src="images/avatar_50.jpg" data-toggle="tooltip" title="Adam" />
										<div class="c-bubble">
											<div class="msg">Hi, i need support with my iPhone?</div>
											<div><small>12:25 p.m.</small></div>
											<span></span>
										</div>
									</div>									
								</div>
							</div>
							<div class="chat-in">
								<form action="http://condorthemes.com/cleanzone/dfgdfg" method="post" name="sd">
									<input type="submit" value="SEND" class="btn btn-info pull-right" />
									<div class="input">
										<input type="text" placeholder="Send a message..." name="msg" />
									</div>
									<div class="chat-tools">
										<ul class="nav nav-pills">
										  <li class="active"><i class="fa fa-location-arrow"></i></li>
										  <li><i class="fa fa-camera"></i></li>
										  <li><i class="fa fa-microphone"></i></li>
										  <li><i class="fa fa-cloud"></i></li>
										</ul>
									</div>
								</form>
							</div>
						</div>						  
					  </div>
					  <div class="tab-pane cont" id="chat-2">
						<div class="chat-wi">
							<div class="chat-space nano nscroller">
								<div class="chat-content content">
									<div class="chat-conv sent">
										<img alt="Avatar" class="c-avatar ttip" src="images/avatar4_50.jpg" data-toggle="tooltip" title="Adam" />
										<div class="c-bubble">
											<div class="msg">Hey, are you there?</div>
											<div><small>12:25 p.m.</small></div>
											<span></span>
										</div>
									</div>
									<div class="chat-conv">
										<img alt="Avatar" class="c-avatar ttip" src="images/avatar1_50.jpg" data-toggle="tooltip" title="MiguelMich" />
										<div class="c-bubble">
											<div class="msg">I'm here, how was your day?</div>
											<div><small>12:20 p.m.</small></div>
											<span></span>
										</div>
									</div>										
									<div class="chat-conv sent">
										<img alt="Avatar" class="c-avatar ttip" src="images/avatar4_50.jpg" data-toggle="tooltip" title="Adam" />
										<div class="c-bubble">
											<div class="msg">It was fine, just making some designs...</div>
											<div><small>12:25 p.m.</small></div>
											<span></span>
										</div>
									</div>									
								</div>
							</div>
							<div class="chat-in">
								<form action="http://condorthemes.com/cleanzone/dfgdfg" method="post" name="sd">
									<input type="submit" value="SEND" class="btn btn-info pull-right" />
									<div class="input">
										<input type="text" placeholder="Send a message..." name="msg" />
									</div>
									<div class="chat-tools">
										<ul class="nav nav-pills">
										  <li class="active"><i class="fa fa-location-arrow"></i></li>
										  <li><i class="fa fa-camera"></i></li>
										  <li><i class="fa fa-microphone"></i></li>
										  <li><i class="fa fa-cloud"></i></li>
										</ul>
									</div>
								</form>
							</div>
						</div>						  
					  </div>
					  <div class="tab-pane" id="chat-3">
						<div class="chat-wi">
							<div class="chat-space nano nscroller">
								<div class="chat-content content">
									<div class="chat-conv">
										<img alt="Avatar" class="c-avatar ttip" src="images/avatar1_50.jpg" data-toggle="tooltip" title="MiguelMich" />
										<div class="c-bubble">
											<div class="msg">Hello, what can i do for you?</div>
											<div><small>12:20 p.m.</small></div>
											<span></span>
										</div>
									</div>
									<div class="chat-conv sent">
										<img alt="Avatar" class="c-avatar ttip" src="images/avatar3_50.jpg" data-toggle="tooltip" title="Lucy" />
										<div class="c-bubble">
											<div class="msg">Hi, i need support with my iPhone?</div>
											<div><small>12:25 p.m.</small></div>
											<span></span>
										</div>
									</div>
									<div class="chat-conv">
										<img alt="Avatar" class="c-avatar ttip" src="images/avatar1_50.jpg" data-toggle="tooltip" title="MiguelMich" />
										<div class="c-bubble">
											<div class="msg">Hello, how are you? i just though you were here, i'll see you tomorrow.</div>
											<div><small>12:30 p.m.</small></div>
											<span></span>
										</div>
									</div>
									<div class="chat-conv sent">
										<img alt="Avatar" class="c-avatar ttip" src="images/avatar3_50.jpg" data-toggle="tooltip" title="Lucy" />
										<div class="c-bubble">
											<div class="msg">Hi, i need support with my iPhone?</div>
											<div><small>12:25 p.m.</small></div>
											<span></span>
										</div>
									</div>									
								</div>
							</div>
							<div class="chat-in">
								<form action="http://condorthemes.com/cleanzone/dfgdfg" method="post" name="sd">
									<input type="submit" value="SEND" class="btn btn-info pull-right" />
									<div class="input">
										<input type="text" placeholder="Send a message..." name="msg" />
									</div>
									<div class="chat-tools">
										<ul class="nav nav-pills">
										  <li class="active"><i class="fa fa-location-arrow"></i></li>
										  <li><i class="fa fa-camera"></i></li>
										  <li><i class="fa fa-microphone"></i></li>
										  <li><i class="fa fa-cloud"></i></li>
										</ul>
									</div>
								</form>
							</div>
						</div>						  
					  </div>
					</div>
				</div>

				
				<div class="col-sm-6 col-md-6">
						<ul class="nav nav-tabs">
						  <li class="active"><a href="#home" data-toggle="tab">Home</a></li>
						  <li><a href="#profile" data-toggle="tab">Profile</a></li>
						  <li><a href="#messages" data-toggle="tab">Messages</a></li>
						</ul>
						<div class="tab-content">
						  <div class="tab-pane active cont" id="home">
								<h2 class="text-center">传感器状态饼状图</h2>
								<div id="piec" style="height:300px;margin-top:25px;"></div>
						  </div>
						  <div class="tab-pane cont" id="profile">
						  		<h2>Typography</h2>
								<p>Pellentesque ac quam hendrerit, viverra leo eu, <b>dapibus mi</b>. In at luctus massa. Morbi semper nulla eu velit facilisis pellentesque. Mauris adipiscing turpis in bibendum tempus. <i>Donec viverra</i>, lacus ac mollis rhoncus, libero risus placerat nisi, et viverra justo eros eget dui. Mauris convallis et tellus non <a href="#">placerat</a>.</p>
                <p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce gravida est eros, eget porta leo fringilla et. </p>
                <a href="#">Read more</a>
						  </div>
						  <div class="tab-pane" id="messages">
                <h2 class="hthin">A Lorem Ipsum Story</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent a metus pulvinar turpis porttitor imperdiet vel nec justo. Nam id orci purus. Mauris arcu velit, auctor et aliquam quis, rhoncus a velit. Sed laoreet ultrices dolor eget vehicula. Morbi adipiscing euismod nisi, eget tincidunt arcu laoreet at.</p>
                <p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam et tortor ultricies, mollis nunc eget, gravida sapien.</p>
              </div>
						</div>
				</div>		
			</div>

	   
			
			<div class="row dash-cols">
				<div class="col-sm-6 col-md-6 col-lg-4">
					<div class="widget-block">
						<div class="white-box padding">
							<div class="row info">
								<div>
									<h3>Your Goals</h3>
								</div>
								<div>
									<div id="com_stats" style="height:98px;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>	
				<div class="col-sm-6 col-md-6 col-lg-4">
					<div class="widget-block">
						<div class="white-box padding">
							<div class="row info text-shadow">
								<div class="col-xs-12">
									<h3>Comments</h3>
								</div>
								<div class="col-xs-12">
									<div id="com2_stats" style="height:98px;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>	
				<div class="col-sm-6 col-md-6 col-lg-4">
					<div class="widget-block">
						<div class="white-box">
							<div class="fact-data">
								<div class="epie-chart" data-percent="45"><span>0%</span></div>
							</div>
							<div class="fact-data no-padding text-shadow">
								<h3>Users sales</h3>
								<h2>4,522</h2>
								<p>Monthly sales from users.</p>
							</div>
						</div>
					</div>
				</div>	
			</div>

			<div class="row dash-cols">
				<div class="col-sm-6 col-md-6 col-lg-4">
					<div class="block">
						<div class="header">
							<h2><i class="fa fa-comment"></i>Comments</h2>
						</div>
						<div class="content no-padding">
							<div class="fact-data text-center">
								<h3>Positive</h3>
								<h2>60%</h2>
							</div>
							<div class="fact-data text-center">
								<h3>Negative</h3>							
								<h2>40%</h2>
							</div>
						</div>
					</div>
				</div>	
				<div class="col-sm-6 col-md-6 col-lg-4">
					<div class="block">
						<div class="header">
							<h2><i class="fa fa-bug"></i>Tickets</h2>
						</div>
						<div class="content no-padding">
							<div class="fact-data text-center">
								<h3>Frequency</h3>
								<h2>53%</h2>
							</div>
							<div class="fact-data text-center">
								<h3>Pending</h3>							
								<h2>13</h2>
							</div>
						</div>
					</div>
				</div>	
				<div class="col-sm-6 col-md-6 col-lg-4">
					<div class="block">
						<div class="header">
							<h2><i class="fa fa-comment"></i>Comments</h2>
						</div>
						<div class="content no-padding">
							<div class="fact-data text-center">
								<h3>Positive</h3>
								<h2>60%</h2>
							</div>
							<div class="fact-data text-center">
								<h3>Negative</h3>							
								<h2>40%</h2>
							</div>
						</div>
					</div>
				</div>					
			</div>
				
			

			</div>
		 
		</div> 
		
	</div>

  <script src="js/jquery.min.js"></script>
   <script src="js/gonggao.js"></script>
    <script type="text/javascript" src="js/jquery.gritter/js/jquery.gritter.js"></script>

  <script type="text/javascript" src="js/jquery.nanoscroller/jquery.nanoscroller.js"></script>
	<script type="text/javascript" src="js/behaviour/general.js"></script>
  <script src="js/jquery.ui/jquery-ui.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.sparkline/jquery.sparkline.min.js"></script>
	<script type="text/javascript" src="js/jquery.easypiechart/jquery.easy-pie-chart.js"></script>
	<script type="text/javascript" src="js/jquery.nestable/jquery.nestable.js"></script>
	<script type="text/javascript" src="js/bootstrap.switch/bootstrap-switch.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
  <script src="js/jquery.select2/select2.min.js" type="text/javascript"></script>
  <script src="js/skycons/skycons.js" type="text/javascript"></script>
  <script src="js/bootstrap.slider/js/bootstrap-slider.js" type="text/javascript"></script>
  <script src="js/intro.js/intro.js" type="text/javascript"></script>



  <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript">
      $(document).ready(function(){
        //initialize the javascript
        App.init();
        App.dashBoard();        
        

      });
    </script>
    <script src="js/behaviour/voice-commands.js"></script>
  <script src="js/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.flot/jquery.flot.js"></script>
	<script type="text/javascript" src="js/jquery.flot/jquery.flot.pie.js"></script>
	<script type="text/javascript" src="js/jquery.flot/jquery.flot.resize.js"></script>
	<script type="text/javascript" src="js/jquery.flot/jquery.flot.labels.js"></script>
  </body>

<!-- Mirrored from condorthemes.com/cleanzone/ by HTTrack Website Copier/3.x [XR&CO'2013], Mon, 31 Mar 2014 14:32:27 GMT -->
</html>
