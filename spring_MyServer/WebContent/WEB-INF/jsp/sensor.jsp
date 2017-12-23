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
	<link rel="stylesheet" type="text/css" href="js/intro.js/introjs.css" />
    <link rel="stylesheet" href="js/jquery.icheck/skins/square/blue.css" >
	<link rel="stylesheet" type="text/css" href="js/jquery.datatables/bootstrap-adapter/css/datatables.css" />
	
	<!--<link href="http://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="http://cdn.datatables.net/buttons/1.2.4/css/buttons.bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.2.4/css/buttons.dataTables.min.css"/>-->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>     
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
		
			<div class="row">
				<div class="col-md-12">
					<div class="block-flat">
						<div class="header">							
							<h3>传感器管理</h3>
						</div>
						<div class="content">
							<div class="table-responsive">
								<table class="table table-bordered" id="datatable" >
									<thead>
										<tr>
											<th>传感器ID</th>
											<th>路线名</th>
											<th>预应力大小</th>
											<th>传感器状态</th>
											<th>预应力状态</th>
										</tr>
									</thead>
									
								</table>							
								<div class="spacer spacer-bottom" style="text-align:center">
									<button type="button" class="btn btn-primary" id="btn_query">查看详细信息</button>
									<button type="button" class="btn btn-success" id="btn_add">新增传感器</button>
									<button type="button" class="btn btn-warning" id="btn_update">更新传感器</</button>
									<button type="button" class="btn btn-danger"  id="btn_delete">删除传感器</button>
								</div>
							</div>
						</div>
					</div>				
				</div>
			</div>	

		  </div>
		</div> 
		
	</div>




  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:500px">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"
          aria-hidden="true">×
          </button>
          <h4 class="modal-title" id="myModalLabel" style="text-align:center">
            	传感器数据展示
          </h4>
        </div>
        <div class="modal-body" style=" font-size: 15px">  
           <div id="modal_content">
	       <table class="table table-bordered">
	 <tbody>
		 <tr>
			 <th>传感器ID：</th><td><span id="sensor_id"></span></td>
         </tr>
		 <tr>
		   	<th>转换系数：</th><td><span id="conver_radio"></span></td>
		 </tr>
		 <tr>
			 <th>线路名：</th><td><span id="railway_name"></span></td>
		 </tr>
         <tr>  
           <th>传感器序号：</th><td><span id="sensor_SN"></span></td>
          </tr>
		 <tr>
			 <th>传感器位置</th><td><span id="sensor_location"></span></td>
           </tr>
		 <tr>
			 <th>传感器状态：</th><td><span id="sensor_state"></span></td>
         </tr>
		 <tr>			
			 <th>预应力状态：</th><td><span id="stress_state"></span></td>
         </tr>
		 <tr>
			 <th>初始预应力：</th><td><span id="stress_init"></span></td>
         </tr>
		 <tr>
			 <th>预应力最新值：</th><td><span id="stress_recent"></span></td>  
   		 </tr>
	</tbody>
</table>	
</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default"
          data-dismiss="modal">关闭
          </button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->


  <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:500px">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"
          aria-hidden="true">×
          </button>
          <h4 id="modal_h4" class="modal-title"  style="text-align:center">
            	TODO
          </h4>
        </div>
        <div class="modal-body" style=" font-size: 15px">  
           <div id="modal_content">
           <form id= "sensor_info"  method="post" >
	       <table class="table table-bordered">
	<tbody>
		 <tr>
			<th>*传感器ID：</th><td><input required="required"  name="in_sensor_id" id="in_sensor_id"></td>
         </tr>
		 <tr>
		   <th>*转换系数：</th><td><input required="required"  name="in_conver_radio" id="in_conver_radio"></td>
		 </tr>
		 <tr>
			 <th>*线路名：</th><td><input required="required"  name="in_railway_name" id="in_railway_name"></td>
		 </tr>
         <tr>  
           <th>*传感器序号：</th><td><input required="required"  name="in_sensor_SN" id="in_sensor_SN"></td>
          </tr>
		 <tr>
			 <th>*传感器位置</th><td><input  required="required" name="in_sensor_location"id="in_sensor_location"></td>
           </tr>
		 <tr>
			 <th>传感器状态：</th><td><input name="in_sensor_state" id="in_sensor_state"></td>
         </tr>
		 <tr>			
			 <th>预应力状态:</th><td><input name="in_stress_state" id="in_stress_state"></td>
         </tr>
		 <tr>
			 <th>*初始预应力：</th><td><input required="required"  name="in_stress_init" id="in_stress_init"></td>
         </tr>
		 <tr>
			 <th>预应力最新值：</th><td><input name="in_stress_recent" id="in_stress_recent"></td>  
   		 </tr>
	</tbody>
</table>
带*的为必填	
</form>
</div>
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btn_submit"
          >提交
          </button>
          <button type="button" class="btn btn-default"
          data-dismiss="modal">关闭
          </button>         
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->


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
    <script type="text/javascript" src="js/jquery.niftymodals/js/jquery.modalEffects.js"></script>  
	<script type="text/javascript" src="js/jquery.datatables/jquery.datatables.min.js"></script> 
	<script type="text/javascript" src="js/jquery.datatables/bootstrap-adapter/js/datatables.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>

    <script src="js/intro.js/intro.js" type="text/javascript"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> 
<!--    <script type="text/javascript" src="http://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"> </script>
    <script type="text/javascript" src="http://cdn.datatables.net/buttons/1.2.4/js/dataTables.buttons.js"></script>
    <script type="text/javascript" src="http://cdn.datatables.net/buttons/1.2.4/js/buttons.bootstrap.js"></script>--> 

    <script type="text/javascript">
 
     //window.tr_hover_data = {};
     sensors =${sensorPo.data};
	 mtd=0;
      $(document).ready(function(){


    	  $('#confirm-delete').on('show.bs.modal', function(e) {
              $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
            });
        //initialize the javascript
       table = $('#datatable').DataTable({
    	    lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
            pageLength: 10,
            data: sensors,
            language: {
              "sProcessing": "处理中...",
              "sLengthMenu": "显示 _MENU_ 项结果",
              "sZeroRecords": "没有匹配结果",
              "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
              "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
              "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
              "sInfoPostFix": "",
              "sSearch": "在表格中搜索:",
              "sUrl": "",
              "sEmptyTable": "表中的数据为空",
              "sLoadingRecords": "载入中...",
              "sInfoThousands": ",",
              "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "上页",
                "sNext": "下页",
                "sLast": "末页"
              },
              "oAria": {
                "sSortAscending": ": 以升序排列此列",
                "sSortDescending": ": 以降序排列此列"
              }
            },
            lengthChange: false,
            columns: [
              {data: "sensor_id", defaultContent:""},
              {data: "railway_name", defaultContent:""},
              {data: "stress_recent", defaultContent:""},
              {data: "sensor_state", defaultContent:""},
              {data: "stress_state", defaultContent:""},
            ],
            select: true
          });
        
        
        lastSelectedItem= null;
        var lastSelectedIndex= null;
       $('#datatable tbody').on( 'click', 'tr', function () {
 
			if(lastSelectedIndex==$(this).context._DT_RowIndex){
				
			}else{
				console.log($(this));
				 $(this).toggleClass('selected');
				 if((lastSelectedItem!=null) && (lastSelectedIndex!=$(this).context._DT_RowIndex)){
						lastSelectedItem.removeClass('selected');				
				}
				 lastSelectedItem=$(this);
				lastSelectedIndex=$(this).context._DT_RowIndex;
			}
			
       } );
                
        
//         var nCloneTh = document.createElement( 'th' );
//         var nCloneTd = document.createElement( 'td' );
//         nCloneTd.innerHTML = '<img class="toggle-details" src="images/plus.png" />';
//         nCloneTd.className = "center";
       
        
//       $('.dataTables_filter input').addClass('form-control').attr('placeholder','Search');
//       $('.dataTables_length select').addClass('form-control');    

        //Horizontal Icons dataTable
        $('#datatable-icons').dataTable();
        
        $("#btn_query").click(function(){
        	  if(lastSelectedItem==null){
        		  alert("请先选择要查询的传感器");
        	  }else{
        		  refreshModal(lastSelectedItem.context.childNodes[0].textContent.toString());
				  $('#myModal').modal('show')
        	  }
        	});  
        
        
        $(function() {
            $('#myModal').on("hidden.bs.modal",
            function() {
            	$(this).removeData("bs.modal");
            })
        });
        function refreshModal(ID){
        	for(var index in sensors){
        		//console.log(sensors[index]);
        		if(sensors[index].sensor_id==ID){
        			var item = sensors[index];
        			$('#sensor_id').html( item.sensor_id);
      				$('#conver_radio').html (item.conver_radio);
      				$('#railway_name').html (item.railway_name);
      				$('#sensor_location').html (item.sensor_location);
      				$('#sensor_state').html ( item.sensor_state);
      				$('#stress_state').html (item.stress_state);
      				$('#stress_init').html (item.stress_init);
      				$('#stress_recent').html ( item.stress_recent);
      				$('#sensor_SN').html (item.sensor_SN);
      				console.log($('#modal_content'))
      			break;	
        		}        		
        	}
        }
        
        $("#btn_add").click(function(){
        	$('#modal_h4').html("添加传感器");
        	$('#myModal2').modal('show');
        	mtd=1;
        })
        
  
        
        
        $("#btn_update").click(function(){
        	 if(lastSelectedItem==null){
       		  alert("请先选择要更新的传感器");
       	  }else{
       		 refreshModal2(lastSelectedItem.context.childNodes[0].textContent.toString());
       		 $('#modal_h4').html("更新传感器");
			 $('#myModal2').modal('show')
			 mtd=2;
       	  }
        	
        })
        function refreshModal2(ID){
        	for(var index in sensors){
        		//console.log(sensors[index]);
        		if(sensors[index].sensor_id==ID){
        			var item = sensors[index];
        			$('#in_sensor_id').val( item.sensor_id);
      				$('#in_conver_radio').val (item.conver_radio);
      				$('#in_railway_name').val (item.railway_name);
      				$('#in_sensor_location').val (item.sensor_location);
      				$('#in_sensor_state').val ( item.sensor_state);
      				$('#in_stress_state').val (item.stress_state);
      				$('#in_stress_init').val (item.stress_init);
      				$('#in_stress_recent').val ( item.stress_recent);
      				$('#in_sensor_SN').val (item.sensor_SN);
      			break;	
        		}        		
        	}
        }
        
        
        $("#btn_submit").click(function(){
        	if(mtd==1){
        		 $.post("/spring_MyServer/sensorAdd",$('#sensor_info').serializeArray(),
             			  function(rslt){   		  				
             		  		if(rslt.errCode=="0"){
             		  		$('#myModal2').modal('hide');
             		  			alert("添加成功"); 	
             		  			location.reload();      		  				  				
             		  			}else{
             		  			alert(rslt.errInfo); 
             		  			}
             	  			},'json');
        	}      	 
       		if(mtd==2){
       	        $.post("/spring_MyServer/sensorUpdate?sensorID="+lastSelectedItem.context.childNodes[0].textContent.toString(),$('#sensor_info').serializeArray(),
     			  function(rslt){   		  				
     		  		if(rslt.errCode=="0"){
     		  		$('#myModal2').modal('hide');
     		  			alert("更新成功"); 	
     		  			location.reload();      		  				  				
     		  			}else{
     		  			alert(rslt.errInfo); 
     		  			}
     	  			},'json');
    	}
  	    
       })
       
         $(function() {
           $('#myModal2').on("hidden.bs.modal",
           function() {
           	$(this).removeData("bs.modal");
           })
       });
        
        
        $("#btn_delete").click(function(){
        	if(lastSelectedItem!=null){
        		var ID= lastSelectedItem.context.childNodes[0].textContent.toString();
        		var msg= "确定要删除ID="+ID+"的传感器吗？删除后不可恢复";
        	  var r=confirm(msg)
        	  if (r==true)
        	    {
            	  $.post("/spring_MyServer/sensorDelete",{sensor_id:ID},
            			  function(rslt){
          		  				
            		  			 if(rslt.errCode=="0"){
            		  				alert("删除成功");
            		  				location.reload();
            		  			}else{
            		  				alert(rslt.errInfo)
            		  			}
            	  			},'json');
        	    }

        	}
        })
        
  	  App.init();
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

<!-- Mirrored from condorthemes.com/cleanzone/tables-datatables.html by HTTrack Website Copier/3.x [XR&CO'2013], Mon, 31 Mar 2014 14:37:27 GMT -->
</html>

