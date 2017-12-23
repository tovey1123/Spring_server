<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="pkg_po.UserPO"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
  
<!-- Mirrored from condorthemes.com/cleanzone/charts.html by HTTrack Website Copier/3.x [XR&CO'2013], Mon, 31 Mar 2014 14:37:32 GMT -->
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
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->
  <link rel="stylesheet" type="text/css" href="js/jquery.nanoscroller/nanoscroller.css" />
  <link rel="stylesheet" type="text/css" href="js/jquery.easypiechart/jquery.easy-pie-chart.css" />
	<link rel="stylesheet" type="text/css" href="js/bootstrap.switch/bootstrap-switch.css" />
	<link rel="stylesheet" type="text/css" href="js/bootstrap.datetimepicker/css/bootstrap-datetimepicker.min.css" />
	<link rel="stylesheet" type="text/css" href="js/jquery.select2/select2.css" />
  <link rel="stylesheet" type="text/css" href="js/bootstrap.slider/css/slider.css" />
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
              <li><a href="#"><i class="fa fa-sitemap"></i></span>组织管理</span></a>
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
			<div class="page-head">
				<h2>预应力   / 传感器数据查询</h2>
<!-- 				<ol class="breadcrumb"> -->
<!-- 				  <li><a href="#">Home</a></li> -->
<!-- 				  <li><a href="#">Charts</a></li> -->
<!-- 				  <li class="active">General</li> -->
<!-- 				</ol> -->
			</div>		
		<div class="cl-mcont">
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="block-flat">
						<div class="header">
							<h3>预应力分布查询（按线路）</h3>
							线路名称：  &nbsp
							 <select id="line" >
     							 <option value="京九线">京九线</option>
    							  <option value="京广线">京广线</option>
    							  <option value="京沪线">京沪线</option>
     						      <option value="川藏年">川藏年</option>
     							  <option value="青藏线">青藏线</option>
     							  <option value="包兰线">包兰线</option>
                             </select>
                             <button id="btn" style=" float:right;display:block" type="button" class="btn btn-default btn-rad">确定</button>                           
                            
                             <div>
                             <span> 传感器序号：<input type="text" name="from" id="from" size="5"/> ~ <input type="text" name="to" id="to" size="5"/></span>
                             </div>
						</div>
						<div class="content">
							<div id="site_statistics" style="height: 180px; padding: 0px; position: relative;"></div>
						</div>
					</div>
				
					<div class="block-flat">
						<div class="header">
							<h3>预应力状态总体扇形图</h3>
						</div>
						<div class="content overflow-hidden">
							<div id="piec" style="height: 300px; padding: 0px; position: relative;">
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-sm-6 col-md-6">

					<div class="block-flat">
						<div class="header">							
							<h3>预应力数据查询</h3>
							传感器ID：<input type="text" id="sensor_id">
							 <button id="btn2" style=" float:right;display:block" type="button" class="btn btn-default btn-rad">确定</button>
							 <div>
							 日期：From <input type="date" id="date_from" name="from"  size="7">
 							 &nbsp;to <input type="date" id="date_to" name="to" size="7">
 							 </div>
						</div>
						
						<div class="content">
							<div id="site_statistics2" style="height: 180px; padding: 0px; position: relative;"></div>							
						</div>
					</div>

					<div class="block-flat">
						<div class="header">							
							<h3>铁路流量对比图</h3>
						</div>
						<div class="content full-width">
							<div id="chart3-legend" class="legend-container"></div>
							<div id="chart3" style="height: 260px;"></div>							
						</div>
					</div>
				</div>			
			</div>
	
	
				<div class="row">
				<div class="col-sm-4">
					<div class="block-flat">
						<div class="header">							
							<h3>传感器（正常）</h3>
						</div>
						<div class="content text-center">
							<div class="epie-chart" data-barcolor="#4D90FD" data-trackcolor="#F3F3F3" data-percent="82"><span>0%</span></div>
						</div>
					</div>					
				</div>
<!-- 				<div class="col-sm-4"> -->
<!-- 					<div class="block-flat"> -->
<!-- 						<div class="header">							 -->
<!-- 							<h3>Easy Pie Chart</h3> -->
<!-- 						</div> -->
<!-- 						<div class="content text-center"> -->
<!-- 							<div class="epie-chart" data-barcolor="#FD6A5E" data-trackcolor="#F3F3F3" data-percent="60"><span>0%</span></div> -->
<!-- 						</div> -->
<!-- 					</div>					 -->
<!-- 				</div> -->
				<div class="col-sm-4">
					<div class="block-flat">
						<div class="header">							
							<h3>传感器（失效）</h3>
						</div>
						<div class="content text-center">
							<div class="epie-chart" data-barcolor="#B450B2" data-trackcolor="#F3F3F3" data-percent="18"><span>0%</span></div>
						</div>
					</div>					
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div class="block-flat">
						<div class="header">							
							<h3>实时流量图</h3>
						</div>
						<div class="content">
							<div id="chart4" style="height: 230px; padding: 0px; position: relative;"></div>							
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
	<script type="text/javascript" src="js/behaviour/general.js"></script>
  <script src="js/jquery.ui/jquery-ui.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.nestable/jquery.nestable.js"></script>
	<script type="text/javascript" src="js/bootstrap.switch/bootstrap-switch.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
  <script src="js/jquery.select2/select2.min.js" type="text/javascript"></script>
  <script src="js/bootstrap.slider/js/bootstrap-slider.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.gritter/js/jquery.gritter.js"></script>

    <script type="text/javascript">
      $(document).ready(function(){
        //initialize the javascript
        App.init();
        App.charts();
      });
      $("#btn").click(function(){
    	  var line = $("#line").val();
    	  var from = $("#from").val();
    	  var to = $("#to").val();
    	  $.post("/spring_MyServer/line",{ "line": line, "from": from,  "to":to},
    			  function(rslt){ 		  				
    		  			 if(rslt.errCode=="0"){
    		  				//刷新图片
    		  				chart1(rslt.data);
    		  			}else{
    		  				alert(rslt.errInfo)
    		  			}
    	  			},'json');
    	});
      
      $("#btn2").click(function(){
    	  var sensor_id = $("#sensor_id").val();
    	  var from = $("#date_from").val();
    	  var to = $("#date_to").val();
    	  $.post("/spring_MyServer/prestress",{ "sensor_id": sensor_id, "from": from,  "to":to},
    			  function(rslt){ 		  				
    		  			 if(rslt.errCode=="0"){
    		  				//刷新图片
    		  				//chart2(rslt.data);
    		  				var arr= rslt.data;
    		  				//console.log(arr[0]);
    		  				//console.log(arr[1]);
    		  				chart2(arr[0],arr[1]);
    		  			}else{
    		  				alert(rslt.errInfo)
    		  			}
    	  			},'json');
    	});
      
      function chart1(data){
  	      $('#site_statistics_loading').hide();
  	      $('#site_statistics_content').show();
  	      
  	      var plot_statistics = $.plot($("#site_statistics"), [{
  	        data: data,
  	        label: "prestress"
  	      }
  	      ], {
  	        series: {
  	          lines: {
  	            show: true,
  	            lineWidth: 2, 
  	            fill: false,
  	            fillColor: {
  	              colors: [{
  	                opacity: 0.25
  	              }, {
  	                opacity: 0.25
  	              }
  	              ]
  	            } 
  	          },
  	          points: {
  	            show: true
  	          },
  	          shadowSize: 2
  	        },
  	        legend:{
  	          show: false
  	        },
  	        grid: {
  	        labelMargin: 10,
  	           axisMargin: 500,
  	          hoverable: true,
  	          clickable: true,
  	          tickColor: "rgba(0,0,0,0.15)",
  	          borderWidth: 0
  	        },
  	        colors: ["#50ACFE", "#4A8CF7", "#52e136"],
  	        xaxis: {
  	          ticks: 11,
  	          tickDecimals: 0
  	        },
  	        yaxis: {
  	          ticks: 5,
  	          tickDecimals: 0
  	        }
  	      });
      }
      
      function chart2(xaxis,yaxis){      
  	      var plot_statistics = $.plot($("#site_statistics2"), [{
  	        data: yaxis,
  	        label: "prestress"
  	      }
  	      ], {
  	        series: {
  	          lines: {
  	            show: true,
  	            lineWidth: 2, 
  	            fill: false,
  	            fillColor: {
  	              colors: [{
  	                opacity: 0.25
  	              }, {
  	                opacity: 0.25
  	              }
  	              ]
  	            } 
  	          },
  	          points: {
  	            show: true
  	          },
  	          shadowSize: 2
  	        },
  	        legend:{
  	          show: false
  	        },
  	        grid: {
  	        labelMargin: 10,
  	           axisMargin: 500,
  	          hoverable: true,
  	          clickable: true,
  	          tickColor: "rgba(1,0,0,0.15)",
  	          borderWidth: 0
  	        },
  	        colors: ["#52e136","#50ACFE", "#4A8CF7" ],
  	        xaxis: {
  	          ticks: xaxis,
  	          tickDecimals: 0
  	        },
  	        yaxis: {
  	          ticks: 5,
  	          tickDecimals: 0
  	        }
  	      });
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

<!-- Mirrored from condorthemes.com/cleanzone/charts.html by HTTrack Website Copier/3.x [XR&CO'2013], Mon, 31 Mar 2014 14:37:32 GMT -->
</html>
