<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from condorthemes.com/cleanzone/email-inbox.html by HTTrack Website Copier/3.x [XR&CO'2013], Mon, 31 Mar 2014 14:37:27 GMT -->
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="shortcut icon" href="images/favicon.png">

	<title>大型预制构件预应力管理系统</title>

	<!-- Bootstrap core CSS -->
	<link href="js/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="js/jquery.gritter/css/jquery.gritter.css" />

	<link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css">

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	  <script src="../../assets/js/html5shiv.js"></script>
	  <script src="../../assets/js/respond.min.js"></script>
	<![endif]-->
	<link rel="stylesheet" type="text/css" href="js/jquery.nanoscroller/nanoscroller.css" />
	<link rel="stylesheet" type="text/css" href="js/jquery.easypiechart/jquery.easy-pie-chart.css" />
	<link rel="stylesheet" type="text/css" href="js/bootstrap.switch/bootstrap-switch.css" />
	<link rel="stylesheet" type="text/css" href="js/bootstrap.datetimepicker/css/bootstrap-datetimepicker.min.css" />
	<link rel="stylesheet" type="text/css" href="js/jquery.select2/select2.css" />
	<link rel="stylesheet" type="text/css" href="js/bootstrap.slider/css/slider.css" />
  <link href="js/jquery.icheck/skins/square/blue.css" rel="stylesheet">
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
        <ul class="nav navbar-nav">
          <li class="active"><a href="#">Home</a></li>
          <li><a href="#about">About</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Contact <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="#">Action</a></li>
              <li><a href="#">Another action</a></li>
              <li><a href="#">Something else here</a></li>
      <li class="dropdown-submenu"><a href="#">Sub menu</a>
        <ul class="dropdown-menu">
          <li><a href="#">Action</a></li>
          <li><a href="#">Another action</a></li>
          <li><a href="#">Something else here</a></li>
          </ul>
      </li>              
      </ul>
          </li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Large menu <b class="caret"></b></a>
      <ul class="dropdown-menu col-menu-2">
        <li class="col-sm-6 no-padding">
          <ul>
          <li class="dropdown-header"><i class="fa fa-group"></i>Users</li>
          <li><a href="#">Action</a></li>
          <li><a href="#">Another action</a></li>
          <li><a href="#">Something else here</a></li>
          <li class="dropdown-header"><i class="fa fa-gear"></i>Config</li>
          <li><a href="#">Action</a></li>
          <li><a href="#">Another action</a></li>
          <li><a href="#">Something else here</a></li> 
          </ul>
        </li>
        <li  class="col-sm-6 no-padding">
          <ul>
          <li class="dropdown-header"><i class="fa fa-legal"></i>Sales</li>
          <li><a href="#">New sale</a></li>
          <li><a href="#">Register a product</a></li>
          <li><a href="#">Register a client</a></li> 
          <li><a href="#">Month sales</a></li>
          <li><a href="#">Delivered orders</a></li>
          </ul>
        </li>
      </ul>
          </li>
        </ul>
    <ul class="nav navbar-nav navbar-right user-nav">
      <li class="dropdown profile_menu">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img alt="Avatar" src="images/avatar2.jpg" />${userPo.employee_name}<b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="#">My Account</a></li>
          <li><a href="#">Profile</a></li>
          <li><a href="#">Messages</a></li>
          <li class="divider"></li>
          <li><a href="#">Sign Out</a></li>
        </ul>
      </li>
    </ul>			
    <ul class="nav navbar-nav navbar-right not-nav">
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
      </div><!--/.nav-collapse -->
    </div>
  </div>
	
<div class="fixed-menu sb-collapsed" id="cl-wrapper">
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
          <button id="sidebar-collapse" class="btn btn-default" style=""><i style="color:#fff;" class="fa fa-angle-right"></i></button>
        </div>
			</div>
		</div>

		
	<div class="page-aside email">
      <div class="fixed nano nscroller">
        <div class="content">
          <div class="header">
            <button class="navbar-toggle" data-target=".mail-nav" data-toggle="collapse" type="button">
              <span class="fa fa-chevron-down"></span>
            </button>          
            <h2 class="page-title">Mail Service</h2>
            <p class="description">邮件服务系统</p>
          </div>        
          <div class="mail-nav collapse">
            <ul class="nav nav-pills nav-stacked ">
              <li class="active"><a href="#"><span class="label label-primary pull-right">6</span><i class="fa fa-inbox"></i> 收件箱</a></li>
              <li><a href="#"><i class="fa fa-envelope-o"></i> 发件箱</a></li>
              <li><a href="#"><span class="label label-default pull-right">3</span><i class="fa fa-file-o"></i> 草稿箱</a></li>
              <li><a href="#"><i class="fa fa-star-o"></i> 重要邮件</a></li>
              <li><a href="#"><i class="fa fa-trash-o"></i> 垃圾箱</a></li>
              <li><a href="#"><span class="label label1 pull-right">2G/30G</span><i class="fa fa-folder-o"></i> 网盘</a></li>
            </ul>
            
            <!-- 
            <p class="title">Labels</p>
            <ul class="nav nav-pills nav-stacked ">
              <li><a href="#"><span class="label label1 pull-right">0</span> Inbox</a></li>
              <li><a href="#"><span class="label label2 pull-right">8</span>Sent Mail</a></li>
              <li><a href="#"><span class="label label3 pull-right">4</span>Important</a></li>
            </ul>
             -->
            <div class="compose">
              <a class="btn btn-flat btn-primary">写邮件</a>
            </div>
          </div>
        </div>
      </div>
		</div>		
	<div class="container-fluid" id="pcont">
    <div class="mail-inbox">
      <div class="head">
        <h3>收件箱 <span>(6封未读)</span></h3>
        <input type="text" class="form-control"  placeholder="搜索邮件..." />
      </div>
      <div class="filters">
        <input id="check-all" type="checkbox" name="checkall" />
        <span>全选</span>
        &nbsp&nbsp<i class="fa fa-trash-o"></i>
        <div class="btn-group pull-right">
          <button class="btn btn-sm btn-flat btn-default" type="button"><i class="fa fa-angle-left"></i></button> 
          <button class="btn btn-sm btn-flat btn-default" type="button"><i class="fa fa-angle-right"></i></button> 
        </div>        
        <div class="btn-group pull-right">
          <button data-toggle="dropdown" class="btn btn-sm btn-flat btn-default dropdown-toggle" type="button">
         	 排序 <span class="caret"></span>
          </button>
          <ul role="menu" class="dropdown-menu">
            <li><a href="#">日期</a></li>
            <li><a href="#">来源</a></li>
            <li><a href="#">主题</a></li>
            <li class="divider"></li>
            <li><a href="#">大小</a></li>
          </ul>
        </div>

      </div>
      <div class="mails">
        <div class="item">
          <div><input type="checkbox" name="c[]" /> </div>
          <div>
            <span class="date pull-right"><i class="fa fa-paperclip"></i> 20 Nov</span>
            <h4 class="from">Jeff Hanneman</h4>
            <p class="msg">Urgent - You forgot your keys in the class room, please come imediatly!</p>
          </div>
        </div>
        <div class="item">
          <div><input type="checkbox" name="c[]" /> </div>
          <div>
            <span class="date pull-right"><i class="fa fa-paperclip"></i> 20 Nov</span>
            <h4 class="from">John Doe</h4>
            <p class="msg">Urgent - You forgot your keys in the class room, please come imediatly!</p>
          </div>
        </div>
        <div class="item">
          <div><input type="checkbox" name="c[]" /> </div>
          <div>
            <span class="date pull-right"><i class="fa fa-paperclip"></i> 20 Nov</span>
            <h4 class="from">John Doe</h4>
            <p class="msg">Urgent - You forgot your keys in the class room, please come imediatly!</p>
          </div>
        </div>
        <div class="item">
          <div><input type="checkbox" name="c[]" /> </div>
          <div>
            <span class="date pull-right"><i class="fa fa-paperclip"></i> 20 Nov</span>
            <h4 class="from">John Doe</h4>
            <p class="msg">Urgent - You forgot your keys in the class room, please come imediatly!</p>
          </div>
        </div>
        <div class="item">
          <div><input type="checkbox" name="c[]" /> </div>
          <div>
            <span class="date pull-right"><i class="fa fa-paperclip"></i> 20 Nov</span>
            <h4 class="from">John Doe</h4>
            <p class="msg">Urgent - You forgot your keys in the class room, please come imediatly!</p>
          </div>
        </div>
        <div class="item">
          <div><input type="checkbox" name="c[]" /> </div>
          <div>
            <span class="date pull-right"><i class="fa fa-paperclip"></i> 20 Nov</span>
            <h4 class="from">John Doe</h4>
            <p class="msg">Urgent - You forgot your keys in the class room, please come imediatly!</p>
          </div>
        </div>

      </div>
    </div>
	</div> 
	
</div>

	<script src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.nanoscroller/jquery.nanoscroller.js"></script>
	<script type="text/javascript" src="js/jquery.sparkline/jquery.sparkline.min.js"></script>
	<script type="text/javascript" src="js/jquery.easypiechart/jquery.easy-pie-chart.js"></script>
	<script type="text/javascript" src="js/behaviour/general.js"></script>
  <script src="js/jquery.ui/jquery-ui.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.nestable/jquery.nestable.js"></script>
	<script type="text/javascript" src="js/bootstrap.switch/bootstrap-switch.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script src="js/jquery.select2/select2.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.slider/js/bootstrap-slider.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.gritter/js/jquery.gritter.js"></script>
	<script type="text/javascript" src="js/jquery.icheck/icheck.min.js"></script>
   
  <script type="text/javascript">
    $(document).ready(function(){
      //initialize the javascript
      App.init();
      $('input').iCheck({
        checkboxClass: 'icheckbox_square-blue checkbox',
        radioClass: 'icheckbox_square-blue'
      });
      
      $("#check-all").on('ifChanged',function(){
        var checkboxes = $(".mails").find(':checkbox');
        if($(this).is(':checked')) {
            checkboxes.iCheck('check');
        } else {
            checkboxes.iCheck('uncheck');
        }
      });
      
    });
  </script>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
  <script src="js/behaviour/voice-commands.js"></script>
  <script src="js/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.flot/jquery.flot.js"></script>
<script type="text/javascript" src="js/jquery.flot/jquery.flot.pie.js"></script>
<script type="text/javascript" src="js/jquery.flot/jquery.flot.resize.js"></script>
<script type="text/javascript" src="js/jquery.flot/jquery.flot.labels.js"></script>
</body>

<!-- Mirrored from condorthemes.com/cleanzone/email-inbox.html by HTTrack Website Copier/3.x [XR&CO'2013], Mon, 31 Mar 2014 14:37:27 GMT -->
</html>
