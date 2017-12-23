<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="pkg_po.UserPO"%>

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
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img alt="Avatar" src="images/avatar2.jpg" /><span>${userPo.employee_name}</span> <b class="caret"></b></a>
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
              <li><a href="sensor?ID=${userPo.employee_id}""><i class="fa fa-rss-square"></i><span>传感器管理</span></a>
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
    <div class="row">
      <div class="col-sm-12">
        <div class="block-flat profile-info">
          <div class="row">
            <div class="col-sm-2">
              <div class="avatar">
                <img src="images/av.jpg" class="profile-avatar" />
              </div>
            </div>
            <div class="col-sm-7">
              <div class="personal">
                <h1 class="name">${userPo.employee_name}</h1>
                <p class="description">a experienced coder<p>
               <!--  <button class="btn btn-primary btn-flat btn-rad" data-modal="reply-ticket"><i class="fa fa-check"></i> Following</button>-->
              </div>
            </div>
            <div class="col-sm-3">
              <table class="no-border no-strip skills">
                <tbody class="no-border-x no-border-y">
                  <tr>
                    <td style="width:45%;">Photoshop</td>
                    <td><div class="progress"><div style="width: 80%" class="progress-bar progress-bar-info"></div></div></td>
                  </tr>
                  <tr>
                    <td>JavaScript</td>
                    <td><div class="progress"><div style="width: 70%" class="progress-bar progress-bar-info"></div></div></td>
                  </tr>
                  <tr>
                    <td>HTML</td>
                    <td><div class="progress"><div style="width: 50%" class="progress-bar progress-bar-info"></div></div></td>
                  </tr>
                  <tr>
                    <td>CSS</td>
                    <td><div class="progress"><div style="width: 40%" class="progress-bar progress-bar-info"></div></div></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          
        </div>
      </div>
    </div>
    
    <div class="row">
      <div class="col-sm-8">
        <div class="tab-container">
          <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#home">信息</a></li>
            <li><a data-toggle="tab" href="#friends">Friends</a></li>
            <li><a data-toggle="tab" href="#settings">设置</a></li>
          </ul>
          <div class="tab-content">
            <div id="home" class="tab-pane active cont">
              <table class="no-border no-strip information">
                <tbody class="no-border-x no-border-y">
                  <tr>
                    <td style="width:20%;" class="category"><strong>基本信息</strong></td>
                    <td>
                      <table class="no-border no-strip skills">
                        <tbody class="no-border-x no-border-y">
                          <tr><td style="width:20%;"><b>姓名</b></td><td>${userPo.employee_name}</td></tr>
                          <tr><td style="width:20%;"><b>工号</b></td><td>${userPo.employee_id}</td></tr>
                          <tr><td style="width:20%;"><b>性别</b></td><td>${userPo.gender}</td></tr>
                          <tr><td style="width:20%;"><b>邮箱</b></td><td>${userPo.email}</td></tr>                        
                          <tr><td style="width:20%;"><b>电话</b></td><td>${userPo.phone}</td></tr>
                          <tr><td style="width:20%;"><b>部门</b></td><td>${userPo.department}</td></tr>
                          <tr><td style="width:20%;"><b>级别</b></td><td>${userPo.lever}</td></tr>
                          <tr><td style="width:20%;"><b>家庭住址</b></td><td>${userPo.address}</td></tr>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                  
                  <tr>
                    <td class="category"><strong>SOCIAL</strong></td>
                    <td> 
                      <button class="btn btn-default btn-flat btn-facebook bg" type="button"><i class="fa fa-facebook"></i> <span>Facebook</span></button>
                      <button class="btn btn-default btn-flat btn-twitter bg" type="button"><i class="fa fa-twitter"></i> <span>Twitter</span></button>
                      <button class="btn btn-default btn-flat btn-google-plus bg" type="button"><i class="fa fa-google-plus"></i> <span>Google+</span></button>
                    </td>
                  </tr>


                </tbody>
              </table>
            </div>
            <div id="friends" class="tab-pane cont">
            <div class="btn-group pull-right">
              <button type="button" class="btn btn-sm btn-flat btn-default"><i class="fa fa-angle-left"></i></button> 
              <button type="button" class="btn btn-sm btn-flat btn-default"><i class="fa fa-angle-right"></i></button> 
            </div>
            <div class="btn-group pull-right">
              <button type="button" class="btn btn-sm btn-flat btn-default dropdown-toggle" data-toggle="dropdown">
              Order by <span class="caret"></span>
              </button>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">Asc</a></li>
                <li><a href="#">Desc</a></li>
                <li><a href="#">Email</a></li>
                <li class="divider"></li>
                <li><a href="#">Birthday</a></li>
              </ul>
            </div>
              <h3 class="widget-title">My Friends</h3>
              <div class="row friends-list">
                <div class="col-sm-6 col-md-4">
                  <div class="friend-widget">
                    <img src="images/avatars/avatar1.jpg" />
                    <h4>Andrea Smith</h4>
                    <p>Work</p>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4">
                  <div class="friend-widget">
                    <img src="images/avatars/avatar2.jpg" />
                    <h4>Jeff Hanneman</h4>
                    <p>Family</p>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4">
                  <div class="friend-widget">
                    <img src="images/avatar1_50.jpg" />
                    <h4>Jeff Hanneman</h4>
                    <p>Friends</p>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4">
                  <div class="friend-widget">
                    <img src="images/avatar3_50.jpg" />
                    <h4>Andrea Smith</h4>
                    <p>Work</p>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4">
                  <div class="friend-widget">
                    <img src="images/avatar4_50.jpg" />
                    <h4>Jeff Hanneman</h4>
                    <p>Work</p>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4">
                  <div class="friend-widget">
                    <img src="images/avatars/avatar2.jpg" />
                    <h4>Jeff Hanneman</h4>
                    <p>Work</p>
                  </div>
                </div>
              </div>
            </p></div>
            <div id="settings" class="tab-pane">
              <form role="form" class="form-horizontal" id='info_form'>
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="nick">头像</label>
                    <div class="col-sm-9"> 
                      <div class="avatar-upload">
                        <img src="images/av.jpg" class="profile-avatar img-thumbnail" />
                       <!--   <input id="fileupload" type="file" name="files[]"> -->
                        <div id="progress" class="overlay"></div>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-3 control-label">姓名</label>
                    <div class="col-sm-9">
                      <input required="required"  placeholder="Name" name="name"  class="form-control" value=${userPo.employee_name}>
                    </div>
                  </div>
                  
                <div class="form-group">
                    <label class="col-sm-3 control-label">性别</label>
                    <div class="col-sm-9">
                      <input  placeholder="Male/Female" name="gender" class="form-control" value=${(userPo.gender)==null?null:userPo.gender}>
                    </div>
                  </div>  
                  
                  <div class="form-group">
                    <label class="col-sm-3 control-label">邮箱</label>
                    <div class="col-sm-9">
                      <input type="email" placeholder="Email" name="Email" class="form-control" value=${(userPo.email)==null?null:userPo.email}>
                    </div>
                  </div>                  
                  <div class="form-group">
                    <label class="col-sm-3 control-label">电话</label>
                    <div class="col-sm-9">
                      <input type="tel" placeholder="Phone" name="phone" class="form-control" value=${(userPo.phone)==null?null:userPo.phone}>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-3 control-label">生日</label>
                    <div class="col-sm-9">
                      <input type="text" placeholder="Birthday" name="birthday" class="form-control" value=${(userPo.birthday)==null?null:userPo.birthday}>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-3 control-label">地址</label>
                    <div class="col-sm-9">
                      <input type="text" placeholder="Address" name="address" class="form-control" value=${(userPo.address)==null?null:userPo.address}>
                    </div>
                  </div>
                  <div class="form-group spacer2">
                    <div class="col-sm-3"></div>
                    <label class="col-sm-9" for="inputPassword3">Change Password</label>

                  </div>
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="inputPassword3">旧密码</label>
                    <div class="col-sm-9">
                      <input type="password" placeholder="Old Password" id="oldPassword" name="oldPWD" class="form-control">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="inputPassword3">新密码</label>
                    <div class="col-sm-9">
                      <input type="password" placeholder="New Password" id="newPassword" name="newPWD1" class="form-control">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="inputPassword4">再次输入密码</label>
                    <div class="col-sm-9">
                      <input type="password" placeholder="New Password" id="newPassword2" name="newPWD2" class="form-control">
                    </div>
                  </div>
                  
                  </form>
                  
                   <div  class="mydiv" style="margin:0 auto;text-align:center">
                      <button class="btn btn-primary" id="btn_update">Update</button>
                      <button class="btn btn-default" type="reset">Reset</button>                 
                  </div>
 
                  
              
              
              
              
             <!--
              <div id="crop-image" class="md-modal colored-header md-effect-1">
                <div class="md-content">
                  <div class="modal-header">
                    <h3>Crop Image</h3>
                    <button aria-hidden="true" data-dismiss="modal" class="close md-close" type="button">×</button>
                  </div>
                  <div class="modal-body">
                    <div class="text-center crop-image">
                    </div>
                    <form action="http://condorthemes.com/cleanzone/crop.php" method="post" onSubmit="return checkCoords();">
                      <input type="hidden" id="x" name="x" />
                      <input type="hidden" id="y" name="y" />
                      <input type="hidden" id="w" name="w" />
                      <input type="hidden" id="h" name="h" />
                    </form>
                  </div>
                  <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default btn-flat md-close" type="button">Cancel</button>
                    <button id="save-image" class="btn btn-primary btn-flat" type="button">Save Image</button>
                  </div>
                </div>
              </div>
              <div class="md-overlay"></div>
              -->
            </div>
          </div>
        </div>    
        
        <div class="block-transparent">
          <div class="header">
            <h4>Timeline</h4>
          </div>
          <ul class="timeline">
            <li>
              <i class="fa fa-comment"></i>
              <span class="date">5 Jan</span>
              <div class="content">
                <p><strong>John</strong> has called Shenlong with <strong>You</strong>.</p>
                <small>A minute ago</small>
              </div>
            </li>
            <li>
              <i class="fa fa-envelope green"></i>
              <span class="date">5 Jan</span>
              <div class="content">
                <i class="fa fa-paperclip pull-right"></i>
                <p><strong>Bob</strong><br/>This is a message for you in your birthday.</p>
                <a class="image-zoom" href="images/gallery/img4.jpg"><img src="images/gallery/img4.jpg" class="img-thumbnail" style="height:64px;" /></a>
                <a class="image-zoom" href="images/gallery/img6.jpg"><img src="images/gallery/img6.jpg" class="img-thumbnail" style="height:64px;" /></a>
              </div>
            </li>
            <li>
              <i class="fa fa-file red"></i>
              <span class="date">5 Jan</span>
              <div class="content">
                <p><strong>Michael</strong> has wrote on your wall:</p>
                <blockquote>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                  <small>Some historic guy</small>
                </blockquote>
              </div>
            </li>
            <li><i class="fa fa-globe purple"></i><span class="date">5 Jan</span><div class="content"><p><strong>María</strong> This is a message for you in your birthday.</p></div></li>
          </ul>
        </div>
      </div>
      
   
      <div class="col-sm-4 side-right">
        <div class="block-flat bars-widget">
          <div class="spk4 pull-right spk-widget"></div>
          <h4>Total Sales</h4>
          <p>Monthly summary</p>
          <h3>545</h3>
        </div>
        
        <div class="block-flat bars-widget">
          <div class="spk5 pull-right spk-widget"></div>
          <h4>New Visitors</h4>
          <p>Stat Description</p>
          <h3>146</h3>
        </div>
        
        <div class="block-transparent">
          <div class="header">
            <h4>Events</h4>
          </div>
          <div class="list-group todo list-widget">
            <li href="#" class="list-group-item"><span class="date"><i class="fa fa-clock-o"></i> 20 Dec</span> Dinner with my family</li>
            <li href="#" class="list-group-item"><span class="date"><i class="fa fa-clock-o"></i> 13 Jan</span> Meeting with our partners</li>
            <li href="#" class="list-group-item"><span class="date"><i class="fa fa-clock-o"></i> 18 Feb</span> Work in new project</li>
            <li href="#" class="list-group-item"><span class="date"><i class="fa fa-clock-o"></i> 21 Feb</span> Go to the doctor</li>
          </div>
        </div>
        
        <div class="block widget-notes">
          <div class="header dark"><h4>Notes</h4></div>
          <div class="content">
            <div contenteditable="true" class="paper">
            Send e-mails.<br>
            <s>meeting at 4 pm.</s><br>
            <s>Buy some coffee.</s><br>
            Feed my dog.
            </div>
          </div>
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
  <script src="js/jquery.ui/jquery-ui.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.nestable/jquery.nestable.js"></script>
	<script type="text/javascript" src="js/bootstrap.switch/bootstrap-switch.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script src="js/jquery.select2/select2.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.slider/js/bootstrap-slider.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.gritter/js/jquery.gritter.js"></script>
  <script type="text/javascript" src="js/jquery.niftymodals/js/jquery.modalEffects.js"></script>   
  <script type="text/javascript" src="js/masonry.js"></script>
  <script type="text/javascript" src="js/jquery.crop/js/jquery.Jcrop.js"></script>

  <!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
  <script src="js/jquery.upload/js/jquery.iframe-transport.js"></script>
  <!-- The basic File Upload plugin -->
  <script src="js/jquery.upload/js/jquery.fileupload.js"></script>
	<script type="text/javascript" src="js/behaviour/general.js"></script>

    <script type="text/javascript">
      $(document).ready(function(){
        //initialize the javascript
        App.init();
        
        $(".spk4").sparkline([2,4,3,6,7,5,8,9,4,2,10,], { type: 'bar', width: '200px', barWidth: 6, height: '50px',barColor: '#19B698'});
        $(".spk5").sparkline([5,3,5,6,5,7,4,8,6,9,8,], { type: 'bar', width: '80px', barWidth: 6, height: '50px',barColor: '#E85647'});
        
        $("#btn_update").click(function () {
           update();
        });
        
        var url =  'www.baidu.com';
        //Profile Image Upload
          'use strict';
        // Change this to the location of your server-side upload handler:
        	/*
        var jcrop;
        var timg;
        
        
        $('#fileupload').fileupload({
            url: url,
            dataType: 'json',
            done: function (e, data) {
                $.each(data.result.files, function (index, file) {
                    timg = file.name;
                    $(".crop-image").html('<img src="js/jquery.upload/server/php/files/' + file.name + '" />');
                    $('#progress').fadeOut();
                    
                    //Crop Image
                    $(".crop-image img").Jcrop({
                      aspectRatio: 1
                    },function(){
                      jcrop = this;
                    });
                });
                
                $("#crop-image").niftyModal();
            },
            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress').fadeIn();
                $('#progress').css(
                    'width',
                    progress + '%'
                );
            }
        }).prop('disabled', !$.support.fileInput).parent().addClass($.support.fileInput ? undefined : 'disabled');
        
        $("#save-image").click(function(){
          var c = jcrop.tellSelect();
          //console.log(jcrop.tellSelect());
          if( c.w != 0 ){
            $(".profile-avatar").attr("src",'js/jquery.upload/server/php/files/cropb6ce.html?src=' + timg + '&x=' + c.x + '&y=' + c.y + '&w=' + c.w + '&h=' + c.h );
            $("#crop-image").niftyModal('hide');
          }else{
            alert("Please select a crop region then press save.");
          }
        });
          */
      });
      function update(){
    	  $.post("/spring_MyServer/userUpdate?ID=${userPo.employee_id}",$('#info_form').serializeArray(),
    			  function(rslt){
    				    console.log(rslt);
    		  			if(rslt.errCode!="0")
    		  			{
    		  				alert(rslt.errInfo);
    		  			}else{
    		  				window.location.reload(); 
    		  			}
    	  			},'json');
     	 }

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

<!-- Mirrored from condorthemes.com/cleanzone/pages-profile.html by HTTrack Website Copier/3.x [XR&CO'2013], Mon, 31 Mar 2014 14:37:45 GMT -->
</html>
