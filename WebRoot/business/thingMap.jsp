<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>朔和云 | 设备地图</title>
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
	<!-- <meta name="viewport" content="initial-scale=1.0, user-scalable=no" /> -->
	<!-- STYLESHEETS --><!--[if lt IE 9]><script src="js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
	<link rel="stylesheet" type="text/css" href="../css/cloud-admin.css" >
	<link rel="stylesheet" type="text/css"  href="../css/themes/night.css" id="skin-switcher" >
	<link rel="stylesheet" type="text/css"  href="../css/responsive.css" >
	
	<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!-- JQUERY UI-->
	<link rel="stylesheet" type="text/css" href="js/jquery-ui-1.10.3.custom/css/custom-theme/jquery-ui-1.10.3.custom.min.css" >
	<!-- DATE RANGE PICKER -->
	<link rel="stylesheet" type="text/css" href="../js/bootstrap-daterangepicker/daterangepicker-bs3.css" >
	<!-- UNIFORM -->
	<link rel="stylesheet" type="text/css" href="../js/uniform/css/uniform.default.min.css" >
	<!-- INBOX CSS -->
	<link rel="stylesheet" href="../css/inbox.css">	

	<!-- FUELUX TREE -->
	<link rel="stylesheet" type="text/css" href="../js/fuelux-tree/fuelux.min.css" />
	
	<!-- 奥森图标 http://www.thinkcmf.com/font/icons/icons/icons/bus-->
	<link rel="stylesheet" type="text/css" href="../css/fontawesome/font-awesome.css" />
	
	<!-- SLIDENAV -->
	<link rel="stylesheet" type="text/css" href="../js/slidernav/slidernav.css" />

	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY -->
	<script src="../js/jquery/jquery-2.0.3.min.js"></script>
	<script src="../js/jquery/jquery-2.2.3.min.js"></script>
	<!-- JQUERY UI-->
	<script src="../js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="../bootstrap-dist/js/bootstrap.min.js"></script>
	<!-- LESS CSS -->
	<script src="../js/lesscss/less-1.4.1.min.js" type="text/javascript"></script>	
	<!-- DATE RANGE PICKER -->
	<script src="../js/bootstrap-daterangepicker/moment.min.js"></script>
	<script src="../js/bootstrap-daterangepicker/daterangepicker.min.js"></script>
	<!-- SLIMSCROLL -->
	<script type="text/javascript" src="../js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="../js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"></script>
	<!-- BLOCK UI -->
	<script type="text/javascript" src="../js/jQuery-BlockUI/jquery.blockUI.min.js"></script>
	<!-- UNIFORM -->
	<script type="text/javascript" src="../js/uniform/jquery.uniform.min.js"></script>
	<!-- BOOTSTRAP WYSIWYG -->
	<script type="text/javascript" src="../js/bootstrap-wysiwyg/jquery.hotkeys.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-wysiwyg/bootstrap-wysiwyg.min.js"></script>
	<!-- COOKIE -->
	<script type="text/javascript" src="../js/jQuery-Cookie/jquery.cookie.min.js"></script>

	<!-- FUELUX TREE -->
	<script type="text/javascript" src="../js/fuelux-tree/fuelux.tree-sampledata.js?ver=2"></script>
	<script type="text/javascript" src="../js/fuelux-tree/fuelux.tree.min.js?ver=1"></script>

	<!-- SLIDENAV -->
	<script type="text/javascript" src="../js/slidernav/slidernav.js"></script>

	<!-- CUSTOM SCRIPT -->
	<script src="../js/script.js"></script>
	<script src="../js/inbox.js"></script>

	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=SP7yzbUEjZyftws3bxA2eBuhlT03b0cn"></script>

	<script>
		jQuery(document).ready(function() {		
			App.setPage("address_book");  //Set current page
			App.init(); //Initialise plugins and elements
		});
	</script>
	<!-- /JAVASCRIPTS -->
	
	<style>
      a.skiplink {
        position: absolute;
        clip: rect(1px, 1px, 1px, 1px);
        padding: 0;
        border: 0;
        height: 1px;
        width: 1px;
        overflow: hidden;
      }
      a.skiplink:focus {
        clip: auto;
        height: auto;
        width: auto;
        background-color: #fff;
        padding: 0.3em;
      }
      #map:focus {
        outline: #4A74A8 solid 0.15em;
      }
    </style>


    <style type="text/css">
		#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>


</head>
<body>
	<!-- HEADER -->	

	<header class="navbar clearfix" id="header">
		<div class="container">
				
				<div class="navbar-brand">
					<!-- COMPANY LOGO -->
					<a href="index.html">
						<img src="../img/logo/logo.png" alt="Cloud Admin Logo" class="img-responsive" height="100" width="300"/>
					</a>
				</div>	
				<!-- BEGIN TOP NAVIGATION MENU -->					
				<ul class="nav navbar-nav pull-right">
					<!-- BEGIN NOTIFICATION DROPDOWN -->	
					<li class="dropdown" id="header-notification">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-bell"></i>
							<span class="badge">1</span>						
						</a>
						<ul class="dropdown-menu notification">
							<li class="dropdown-title">
								<span><i class="fa fa-bell"></i> 1个提醒</span>
							</li>
							<li>
								<a href="#">
									<span class="label label-success"><i class="fa fa-user"></i></span>
									<span class="body">
										<span class="message">5 用户在线. </span>
										<span class="time">
											<i class="fa fa-clock-o"></i>
											<span>刚刚</span>
										</span>
									</span>
								</a>
							</li>							
						</ul>
					</li>
					<!-- END NOTIFICATION DROPDOWN -->
					<!-- BEGIN INBOX DROPDOWN -->
					<li class="dropdown" id="header-message">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-envelope"></i>
						<span class="badge">1</span>
						</a>
						<ul class="dropdown-menu inbox">
							<li class="dropdown-title">
								<span><i class="fa fa-envelope-o"></i> 1条消息</span>
								<span class="compose pull-right tip-right" title="Compose message"><i class="fa fa-pencil-square-o"></i></span>
							</li>
							<li>
								<a href="#">
									<img src="../img/avatars/avatar2.jpg" alt="" />
									<span class="body">
										<span class="from">小明</span>
										<span class="message">
											请通知分部尽快处理故障设备
										</span> 
										<span class="time">
											<i class="fa fa-clock-o"></i>
											<span>刚刚</span>
										</span>
									</span>
									 
								</a>
							</li>						
						</ul>
					</li>
					<!-- END INBOX DROPDOWN -->
					<!-- BEGIN TODO DROPDOWN -->
					<li class="dropdown" id="header-tasks">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-tasks"></i>
						<span class="badge"></span>
						</a>						
					</li>
					<!-- END TODO DROPDOWN -->
					<!-- BEGIN USER LOGIN DROPDOWN -->
					<li class="dropdown user" id="header-user">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img alt="" src="../img/avatars/avatar3.jpg" />
							<span class="username">
								<!-- John Doe -->
								<% 
									out.println(request.getSession().getAttribute("username")+"");
								%>
							</span>
							<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#"><i class="fa fa-user"></i> 我的资料</a></li>
							<li><a href="#"><i class="fa fa-cog"></i> 账户设置</a></li>
							<li><a href="#"><i class="fa fa-eye"></i> 隐私设置</a></li>
							<li><a href="../logout/logout.jsp"><i class="fa fa-power-off"></i> 退出系统</a></li>
						</ul>
					</li>
					<!-- END USER LOGIN DROPDOWN -->
				</ul>
				<!-- END TOP NAVIGATION MENU -->
		</div>		
	</header>
	<!--/HEADER -->
	
	<!-- PAGE -->
	<section id="page">
				<!-- SIDEBAR -->
				<div id="sidebar" class="sidebar">
					<div class="sidebar-menu nav-collapse">
						<div class="divide-20"></div>
						<!-- SEARCH BAR -->
						<div id="search-bar">
							<input class="search" type="text" placeholder="Search"><i class="fa fa-search search-icon"></i>
						</div>
						<!-- /SEARCH BAR -->
						
						<!-- SIDEBAR QUICK-LAUNCH -->
						<!-- <div id="quicklaunch">
						<!-- /SIDEBAR QUICK-LAUNCH -->
						
						<!-- SIDEBAR MENU -->
						<ul>		
							<li>
								<a class="" href="../business/index.jsp">
									<i class="fa fa-home fa-fw"></i>									
									<span class="menu-text">主页</span>
								</a>
							</li>		
							<li>
								<a class="" href="../business/thingList.jsp">
									<i class="fa fa-desktop fa-fw"></i>									
									<span class="menu-text">设备列表</span>
								</a>
							</li>			
							<li class="active">
								<a class="" >
									<i class="fa fa-map-marker fa-fw"></i> 
									<span class="menu-text">设备地图</span>
									<span class="selected"></span>
								</a>
							</li>
							<li>
								<a class="" href="../business/thingDevelopment.jsp">
									<!--<i class="fa fa-envelope-o fa-fw"></i>
									<img class="fa fa-desktop fa-fw" src="../img/icon/gater.png" height="15" width="15"/>
									<i></i>-->
									<i class="fa fa-th-large fa-fw"></i>
									<span class="menu-text">设备开发</span>
								</a>
							</li>
							<li class="has-sub">
								<a href="javascript:;" class="">
								<i class="fa fa-table fa-fw"></i> <span class="menu-text">报表</span>
								<span class="arrow"></span>
								</a>
								<ul class="sub">
									<li><a class="" href="../business/senserTable.jsp"><span class="sub-menu-text">传感器数据</span></a></li>
								</ul>
							</li>
							<li>
								<a class="" href="../business/fileApproval/fileApproval.jsp">
									<i class="fa  fa-briefcase fa-fw"></i>
									<span class="menu-text">文件审批</span>
								</a>
							</li>
							<li>
								<a class="" href="../business/accountSettings.jsp">
									<i class="fa fa-user fa-fw" ></i> 
									<span class="menu-text">账户设置</span>
								</a>
							</li>	
							<li class="has-sub">
								<a href="javascript:;" class="">
									<i class="fa fa-gear fa-fw"></i> 
									<span class="menu-text">系统设置</span>
									<span class="arrow"></span>
								</a>
								<ul class="sub">
									<li><a class="" href="../business/systemManage/userManage/userManager.jsp"><span class="sub-menu-text">用户管理</span></a></li>
									<li><a class="" href="../business/positionManage/positionManager.jsp"><span class="sub-menu-text">职位管理</span></a></li>
									<li><a class="" href="../business/systemManage/dataTableManage/dataTableManager.jsp"><span class="sub-menu-text">数据表管理</span></a></li>
								</ul>
							</li>						
						</ul>
						<!-- /SIDEBAR MENU -->
					</div>
				</div>
				<!-- /SIDEBAR -->
		<div id="main-content">
			<div class="container">
				<div class="row">
					<div id="content" class="col-lg-12">
						<div class="divide-20"></div>
						<div id="location"></div>

						<div class="box border green">
							<div class="box-title">
								<h4><i class="fa fa-signal"></i>设备地图</h4>
								<div class="tools">
									<a href="javascript:;" class="reload">
										<i class="fa fa-refresh"></i>
									</a>
								</div>
							</div>
							<div class="box-body" >
								<!-- extra -->
								<div class="row">
									<div class="col-md-2" >
										<div class="panel panel-default">														
											<div class="panel-body orders">
												<div class="scroller" data-height="650px" data-always-visible="1" data-rail-visible="1">
													<div class="divide-20"></div>
													<div id="search-bar">
														<input class="search" type="text" placeholder="Search"><i class="fa fa-search search-icon"></i>
													</div>
													<div class="divide-20"></div>
													<div class="list-group">
														<a href="javascript:itemClicked(50007445);" class="list-group-item">豫EGJ983</a>
														<a href="javascript:itemClicked(50007556);" class="list-group-item">豫EGJ971</a>
														<a href="javascript:itemClicked(50007555);" class="list-group-item">豫EGJ976</a>
														<a href="javascript:itemClicked(50007550);" class="list-group-item">豫EGJ978</a>
														<a href="javascript:itemClicked(50007450);" class="list-group-item">豫EGJ957</a>
														<a href="javascript:itemClicked(50007444);" class="list-group-item">豫EGJ993</a>
														<a href="javascript:itemClicked(50007449);" class="list-group-item">豫EGJ980</a>
														<a href="javascript:itemClicked(50007447);" class="list-group-item">豫EGJ997</a>
														<a href="javascript:itemClicked(50007446);" class="list-group-item">豫EGJ990</a>
														<a href="javascript:itemClicked(50007443);" class="list-group-item">豫EGJ992</a>
														<a href="javascript:itemClicked(50007438);" class="list-group-item">豫EGJ917</a>
													</div>	
												</div>
											</div>
										</div>
				<!-- 						<i class="fa fa-info-circle"></i> <font size="3">通过车牌号选择车辆</font>
										<div class="divide-20"></div>
										<div id="carsTree" class="tree"></div>			 -->	
							
									</div>

									<div class="col-md-10">
											<div class="box-body" id="allmap" style="width: 100%;height:650px">
									</div>
								</div>
							</div>										
						</div>
						<!-- 填充车辆列表 -->
						<script type="text/javascript">

							var car_tree_data = {
								'50007445' : {name: '<font size="3">豫EGJ983</font>  <i class="fa fa-map-marker fa-2x" onclick="itemClicked(50007445);"></i> ', type: 'item'},
								'50007556' : {name: '<font size="3">豫EGJ971</font>  <i class="fa fa-map-marker fa-2x" onclick="itemClicked(50007556);"></i> ', type: 'item'},
								'50007555' : {name: '<font size="3">豫EGJ976</font>  <i class="fa fa-map-marker fa-2x" onclick="itemClicked(50007555);"></i> ', type: 'item'},
								'50007550' : {name: '<font size="3">豫EGJ978</font>  <i class="fa fa-map-marker fa-2x" onclick="itemClicked(50007550);"></i> ', type: 'item'},
								'50007450' : {name: '<font size="3">豫EGJ957</font>  <i class="fa fa-map-marker fa-2x" onclick="itemClicked(50007450);"></i> ', type: 'item'},
								'50007444' : {name: '<font size="3">豫EGJ993</font>  <i class="fa fa-map-marker fa-2x" onclick="itemClicked(50007444);"></i> ', type: 'item'},
								'50007449' : {name: '<font size="3">豫EGJ980</font>  <i class="fa fa-map-marker fa-2x" onclick="itemClicked(50007449);"></i> ', type: 'item'},
								'50007447' : {name: '<font size="3">豫EGJ997</font>  <i class="fa fa-map-marker fa-2x" onclick="itemClicked(50007447);"></i> ', type: 'item'},
								'50007446' : {name: '<font size="3">豫EGJ990</font>  <i class="fa fa-map-marker fa-2x" onclick="itemClicked(50007446);"></i> ', type: 'item'},
								'50007443' : {name: '<font size="3">豫EGJ992</font>  <i class="fa fa-map-marker fa-2x" onclick="itemClicked(50007443);"></i> ', type: 'item'},
								'50007438' : {name: '<font size="3">豫EGJ917</font>  <i class="fa fa-map-marker fa-2x" onclick="itemClicked(50007438);"></i> ', type: 'item'}
							}
							var carsTreeDataSource = new DataSourceTree({data: car_tree_data});
							$('#carsTree').admin_tree({
								// dataSource: treeDataSource2 ,
								dataSource: carsTreeDataSource ,
								loadingHTML:'<div class="tree-loading"><i class="fa fa-spinner fa-2x fa-spin"></i></div>',
								'open-icon' : 'fa-folder-open',
								'close-icon' : 'fa-folder',
								'selectable' : false,
								'selected-icon' : null,
								'unselected-icon' : null
							});

							// document.onclick = function(e) {
							//     var e = e || window.event;
							//     // var target = e.target || e.srcElement;
							//     console.info("e = "+e);
							//     console.info("e.selectable = "+e.selectable);

							//     // if(target.tagName.toLowerCase() === "td") {
							//     //     var rowIdx = target.parentNode.rowIndex + 1;
							//     //     alert("第 " + rowIdx + " 行");
							//     // }
							// };
							// $(".carsTree").each(function(){
							//     $(this).click(function(){
							//          var imgid = $(this).attr("id");
							//          alert(imgid );
							//     })
							// });
						</script>
						<script type="text/javascript">
							var carArry = new Array();
							//选中气泡指示的值
							var selectCar;

							var ajax =
							{
								abort : function()
								{
								} //定义一个空的方法, 是为了下面ajax.abort()不报错
							};
							function get()
							{
								console.info("get()");
								ajax.abort();
								//每次提交前, 先放弃上一次ajax的提交, 这样就不会同时有多个ajax正在请求, 卡死浏览器
								ajax = $.ajax(
								{
									url : "http://localhost:8000/iot/business/getShaolinBuses.jsp"//请求的url
									,
									async : false,
									dataType : "jsonp"
									//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
									,
									jsonp : "callback"
									//自定义的jsonp回调函数名称"jsonpCallback"，返回的json也必须有这个函数名称
									,
									jsonpCallback : "jsonpCallback"

								});
							}
							var isInit = false;
							function jsonpCallback(data)//回调函数
							{
								// console.log(carIndex); //
								var cars = jQuery.parseJSON(JSON.stringify(data));
								// console.info("cars="+JSON.stringify(data));
								// console.info(cars.length);
								carArry.splice(0,carArry.length);//清空数组
								for (var i = 0; i < cars.length; i++)
								{		
									car = new Object();
									car.carid = cars[i].carid;
									car.gpsSignal = cars[i].gpsSignal;
									car.soc = cars[i].soc;
									car.batteryVoltage = cars[i].batteryVoltage;
									car.batteryCurrent = cars[i].batteryCurrent;
									car.gpsLongitude = cars[i].gpsLongitude;
									car.gpsLatitude = cars[i].gpsLatitude;
									carArry.push(car);
								}
								// for (var i = 0; i < carArry.length; i++)
								// {		
								// 	console.info(i);
								// 	console.info("carid"+carArry[i].carid);
								// 	console.info("gpsSignal"+carArry[i].gpsSignal);
								// 	console.info("soc"+carArry[i].soc);
								// 	console.info("batteryVoltage"+carArry[i].batteryVoltage);
								// 	console.info("batteryCurrent"+carArry[i].batteryCurrent);
								// 	console.info("batteryCurrent"+carArry[i].gpsLongitude);
								// 	console.info("batteryCurrent"+carArry[i].gpsLatitude);
								// }
								// if(isInit == false)
								// {
								// 	isInit = true;
								// 	initMarkers();
								// 	setMarkers();									
								// }
							}
							get();
							function getx()
							{
								get();
								setMarkers();
								changeInfowindowsContent();
							}
							var t1 = window.setInterval("getx()", 10000);

							// 百度地图API功能
							var map = new BMap.Map("allmap");
							var point = new BMap.Point(113.820265,36.0604873333333);
							map.centerAndZoom(point, 12);
							map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放


							var markerInfoWindow;
							initMarkers();
							var opts = {
									width : 80,     // 信息窗口宽度
									height: 100,     // 信息窗口高度
									// title : "信息窗口" , // 信息窗口标题
									enableMessage:true//设置允许信息窗发送短息
								};
							function initMarkers()
							{
								console.info("initMarkers()");

								// 将获取到的点赋予地图的marker
								for (var i = 0; i < carArry.length; i++)
								{
									var pointTmp = new BMap.Point(carArry[i].gpsLongitude,carArry[i].gpsLatitude);
									var marker = new BMap.Marker(pointTmp);  // 创建标注

									marker.setTitle("车辆编号: "+getCarPaizhaoById(carArry[i].carid));
									var content = "车辆编号: "+getCarPaizhaoById(carArry[i].carid) + "<br>"
												+ "GPS信号强度: " + carArry[i].gpsSignal + "<br>"
												+ "SOC: " + carArry[i].soc + "<br>"
												+ "电池电压: " + carArry[i].batteryVoltage + "<br>"
												+ "电池电流: " + carArry[i].batteryCurrent + "<br>";

									map.addOverlay(marker);              // 将标注添加到地图中
									addClickHandler(content,marker);	
								}
								function addClickHandler(content,marker){
									marker.addEventListener("click",function(e){
										openInfo(content,e)}
									);
								}								
							}
							function openInfo(content,e){
								p = e.target;
								markerInfoWindow = e.target;
								// selectCar = p.getTitle()；
								console.info("title = "+p.getTitle());
								var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
								var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
								map.openInfoWindow(infoWindow,point); //开启信息窗口
							}
							function getCarPaizhaoById(id)
							{
								if(id == "50007445")		return "豫EGJ983";
								else if(id == "50007556")	return "豫EGJ971";
								else if(id == "50007555")	return "豫EGJ976";
								else if(id == "50007550")	return "豫EGJ978";
								else if(id == "50007450")	return "豫EGJ957";
								else if(id == "50007444")	return "豫EGJ993";
								else if(id == "50007449")	return "豫EGJ980";
								else if(id == "50007447")	return "豫EGJ997";
								else if(id == "50007446")	return "豫EGJ990";
								else if(id == "50007443")	return "豫EGJ992";
								else if(id == "50007438")	return "豫EGJ917";
							}
							function getPaizhaoByid(id)
							{
								if(id == "车辆编号: 豫EGJ983")		return "50007445";
								else if(id == "车辆编号: 豫EGJ971")	return "50007556";
								else if(id == "车辆编号: 豫EGJ976")	return "50007555";
								else if(id == "车辆编号: 豫EGJ978")	return "50007550";
								else if(id == "车辆编号: 豫EGJ957")	return "50007450";
								else if(id == "车辆编号: 豫EGJ993")	return "50007444";
								else if(id == "车辆编号: 豫EGJ980")	return "50007449";
								else if(id == "车辆编号: 豫EGJ997")	return "50007447";
								else if(id == "车辆编号: 豫EGJ990")	return "50007446";
								else if(id == "车辆编号: 豫EGJ992")	return "50007443";
								else if(id == "车辆编号: 豫EGJ917")	return "50007438";								
							}

							function setMarkers()
							{
								var makers = map.getOverlays();
								console.info("makers length = "+makers.length);
								for (var i = 0; i < makers.length; i++)
								{
									var id = getPaizhaoByid(makers[i].getTitle());
									console.info("makers id = "+id);
									for (var x = 0; x < carArry.length; x++)
									{		
										if((carArry[x].carid) == id)
										{
											makers[i].setPosition(new BMap.Point(carArry[i].gpsLongitude,carArry[i].gpsLatitude));
											console.info("makers "+i+" setPosition("+carArry[i].gpsLongitude+","+carArry[i].gpsLongitude+");");	

											break;			
										}
									}
								}
							}
							
							function changeInfowindowsContent()
							{
								console.info("changeInfowindowsContent");
								console.info("markerInfoWindow = "+markerInfoWindow.getTitle());
								// console.info("selectCar = "+selectCar.getTitle());
								
								for (var x = 0; x < carArry.length; x++)
								{		
									console.info("selectCar = "+selectCar);
									console.info("carArry[x].carid = "+carArry[x].carid);
									if((carArry[x].carid) == getPaizhaoByid(markerInfoWindow.getTitle()))
									{										
							
										var content = "车辆编号: "+getCarPaizhaoById(carArry[x].carid) + "<br>"
												+ "GPS信号强度: " + carArry[x].gpsSignal + "<br>"
												+ "SOC: " + carArry[x].soc + "<br>"
												+ "电池电压: " + carArry[x].batteryVoltage + "<br>"
												+ "电池电流: " + carArry[x].batteryCurrent + "<br>";
										console.info(content);
										map.getInfoWindow().setContent(content);
										break;			
									}
								}
							}
							function itemClicked(e){
								console.info("itemClicked = "+e);

								for (var i = 0; i < carArry.length; i++)
								{		
									if((carArry[i].carid) == e)
									{
										var point = new BMap.Point(carArry[i].gpsLongitude,carArry[i].gpsLatitude);
										var content = "车辆编号: "+getCarPaizhaoById(carArry[i].carid) + "<br>"
												+ "GPS信号强度: " + carArry[i].gpsSignal + "<br>"
												+ "SOC: " + carArry[i].soc + "<br>"
												+ "电池电压: " + carArry[i].batteryVoltage + "<br>"
												+ "电池电流: " + carArry[i].batteryCurrent + "<br>";

										var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
										map.openInfoWindow(infoWindow,point); //开启信息窗口
										break;			
									}
								}

							}
						</script>
						
			
											
						
						<div class="footer-tools">
							<span class="go-top">
								<i class="fa fa-chevron-up"></i> Top
							</span>
						</div>
					</div><!-- /CONTENT-->
				</div>
			</div>
		</div>
	</section>
	<!--/PAGE -->
</body>
</html>