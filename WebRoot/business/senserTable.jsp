<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>朔和云 | 传感器报表</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- STYLESHEETS --><!--[if lt IE 9]><script src="../js/flot/excanvas.min.js"></script><script src="../http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="../http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
	<link rel="stylesheet" type="text/css" href="../css/cloud-admin.css" >
	<link rel="stylesheet" type="text/css"  href="../css/themes/night.css" id="skin-switcher" >
	<link rel="stylesheet" type="text/css"  href="../css/responsive.css" >
	
	<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!-- FUELUX TREE -->
	<link rel="stylesheet" type="text/css" href="../js/fuelux-tree/fuelux.min.css" />

	<!-- UNIFORM -->
	<link rel="stylesheet" type="text/css" href="../js/uniform/css/uniform.default.min.css" >
	<!-- DATE RANGE PICKER -->
	<link rel="stylesheet" type="text/css" href="../js/bootstrap-daterangepicker/daterangepicker-bs3.css" >
	<!-- FONTS -->
<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY -->
	<script src="../js/flot/jquery.min.js"></script>
	<!-- JQUERY -->
	<!-- <script src="../js/jquery/jquery-2.0.3.min.js"></script>
	<script src="../js/jquery/jquery-2.2.3.min.js"></script> -->

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
	<!-- FLOT CHARTS -->
	<script src="../js/flot/jquery.flot.min.js"></script>
	<script src="../js/flot/jquery.flot.time.min.js"></script>
    <script src="../js/flot/jquery.flot.selection.min.js"></script>
	<script src="../js/flot/jquery.flot.resize.min.js"></script>
    <script src="../js/flot/jquery.flot.pie.min.js"></script>
    <script src="../js/flot/jquery.flot.stack.min.js"></script>
    <script src="../js/flot/jquery.flot.crosshair.min.js"></script>
	<!-- COOKIE -->
	<script type="text/javascript" src="../js/jQuery-Cookie/jquery.cookie.min.js"></script>
	<!-- UNIFORM -->
	<script type="text/javascript" src="../js/uniform/jquery.uniform.min.js"></script>
	<!-- BOOTSTRAP WYSIWYG -->
	<script type="text/javascript" src="../js/bootstrap-wysiwyg/jquery.hotkeys.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-wysiwyg/bootstrap-wysiwyg.min.js"></script>
	<!-- FUELUX TREE -->
	<script type="text/javascript" src="../js/fuelux-tree/fuelux.tree-sampledata.js?ver=1"></script>
	<script type="text/javascript" src="../js/fuelux-tree/fuelux.tree.min.js?ver=1"></script>
	<script type="text/javascript" src="../js/fuelux-tree/tree.min.js?ver=1"></script>
	
	<!-- SLIDENAV -->
	<script type="text/javascript" src="../js/slidernav/slidernav.js"></script>

	<!-- CUSTOM SCRIPT -->
	<script src="../js/script.js?ver=1"></script>
	<script src="../js/charts.js?ver=1"></script>
	<script>
		jQuery(document).ready(function() {		
			App.setPage("treeview");  //Set current page
			App.init(); //Initialise plugins and elements

			// App.setPage("flot_charts");  //Set current page
			// App.init(); //Initialise plugins and elements
			Charts.initCharts();
			Charts.initPieCharts();
		});
	</script>
	<!-- /JAVASCRIPTS -->


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
					<li>
						<a class="" href="../business/thingMap.jsp">
							<i class="fa fa-map-marker fa-fw"></i> 
							<span class="menu-text">设备地图</span>
						</a>
					</li>
											
					<li >
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
							<li><a class="" href="../business/senserTable.jsp"><span class="sub-menu-text">传感器报表</span></a></li>
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
			<!-- SAMPLE BOX CONFIGURATION MODAL FORM-->
			<div class="modal fade" id="box-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
				  <div class="modal-content">
					<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					  <h4 class="modal-title">Box Settings</h4>
					</div>
					<div class="modal-body">
					  Here goes box setting content.
					</div>
					<div class="modal-footer">
					  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					  <button type="button" class="btn btn-primary">Save changes</button>
					</div>
				  </div>
				</div>
			  </div>
			<!-- /SAMPLE BOX CONFIGURATION MODAL FORM-->
			<div class="container">
				<div class="row">
					<div class="divide-20"></div>
					<div id="content" class="col-lg-12">
						<!-- INTERACTIVE CHART -->
						<div class="row">
							<div class="col-md-2">
								<div class="box border red">
									<div class="box-title">
										<h4><i class="fa fa-sitemap"></i>设备列表</h4>
										<div class="tools">
											<a href="javascript:;" class="reload">
												<i class="fa fa-refresh"></i>
											</a>
										</div>
									</div>
									<div class="box-body">
										<script type="text/javascript">

										</script>
										<div id="carsTree" class="tree"></div>
									</div>
								</div>
							</div>
							<div class="col-md-4">
							<!-- RATINGS -->
								<div class="box border red">
									<div class="box-title">
										<h4><i class="fa fa-star"></i>设备属性</h4>
										<div class="tools">
											<a href="#box-config" data-toggle="modal" class="config">
												<i class="fa fa-cog"></i>
											</a>
											<a href="javascript:;" class="reload">
												<i class="fa fa-refresh"></i>
											</a>
										</div>
									</div>
									<div class="box-body big">
										<form class="form-horizontal " action="#">     
											<div class="form-group">										   
											   <label class="col-md-4">车牌号</label>										   
												 <span id="LicensePlate" style="font-weight:bold;"></span>										 
											 </div>            
											 <div class="form-group">										   
											   <label class="col-md-4">VIN码:</label>										   
												 <span id="VinNo" style="font-weight:bold;"></span>										 
											 </div>
											<div class="form-group">										   
												<label class="col-md-4">车辆编码:</label>										   
												<span id="CarId" style="font-weight:bold;"></span>										 
											</div>
											<div class="form-group">										   
												<label class="col-md-4">主机厂家:</label>										   
												<span id="CarTypeName" style="font-weight:bold;"></span>									 									 								 
											</div>
											<div class="form-group">										   
												<label class="col-md-4">出场批次:</label>										   
												<span id="CarBatchName"  style="font-weight:bold;"></span>
											</div>
											<div class="form-group">										   
												<label class="col-md-4">所属公司:</label>										   
												<span id="CompanyName" style="font-weight:bold;"></span>
											</div>
											<div class="form-group">										   
												<label class="col-md-4">运营地点:</label>										   
												<span id="UserRegionName" style="font-weight:bold;"></span>
											</div>										 										
										</form>
									</div>
								</div>
								<!-- /RATINGS -->
							</div>
							<div class="col-md-6">
								<!-- BOX -->
								<div class="box border blue">
									<div class="box-title">
										<h4><i class="fa fa-signal"></i>实时数据</h4>
										<div class="tools">
											<a href="javascript:;" class="reload">
												<i class="fa fa-refresh"></i>
											</a>
										</div>
									</div>
									<div class="box-body">
										<div id="carBattery" class="chart"></div>
									</div>
								</div>
								<!-- /BOX -->
							</div>
						</div>

						<!-- /INTERACTIVE CHART -->									
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
<script type="text/javascript">
	//获取车辆信息
	var carInfoArry = new Array();
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
			url : "http://localhost:8000/iot/business/getShaolinBusCarInfoById.jsp"//请求的url
			,async : false
			,dataType : "jsonp"
			//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
			,jsonp : "callback"
			//自定义的jsonp回调函数名称"jsonpCallback"，返回的json也必须有这个函数名称
			,jsonpCallback : "jsonpCallback"

		});
	}
	function jsonpCallback(data)//回调函数
	{
		// console.log(carIndex); //
		var cars = jQuery.parseJSON(JSON.stringify(data));
		// console.info("cars="+JSON.stringify(data));
		// console.info(cars.length);
		carInfoArry.splice(0,carInfoArry.length);//清空数组
		for (var i = 0; i < cars.length; i++)
		{		
			carInfo = new Object();
			carInfo.LicensePlate = cars[i].LicensePlate;
			carInfo.VinNo = cars[i].VinNo;
			carInfo.CarId = cars[i].CarId;
			carInfo.CarTypeName = cars[i].CarTypeName;
			carInfo.CarBatchName = cars[i].CarBatchName;
			carInfo.CompanyName = cars[i].CompanyName;
			carInfo.UserRegionName = cars[i].UserRegionName;
			carInfo.TerminalCode = cars[i].TerminalCode;
			carInfoArry.push(carInfo);
		}
	}
	get();


	//获取某辆车的100条最新参数
	var carBatterParams = new Array();
	function getCarBatteryParam(carId)
	{
		console.info("get()");
		ajax.abort();
		//每次提交前, 先放弃上一次ajax的提交, 这样就不会同时有多个ajax正在请求, 卡死浏览器
		ajax = $.ajax(
		{
			url : "http://localhost:8000/iot/business/getShaolinBusBatteryParamById.jsp"//请求的url
			,async : false
			,dataType : "jsonp"			
			,jsonp : "callback"//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
			,jsonpCallback : "CarBatteryParamJsonpCallback"
			,data:  { "carId": carId}
		});
	}
	function CarBatteryParamJsonpCallback(data)//回调函数
	{
		console.info("CarBatteryParamJsonpCallback");
		var cars = jQuery.parseJSON(JSON.stringify(data));
		carBatterParams.splice(0,carBatterParams.length);//清空数组
		for (var i = 0; i < cars.length; i++)
		{		
			carInfo = new Object();
			carInfo.gpsSignal = cars[i].gpsSignal;
			carInfo.soc = cars[i].soc;
			carInfo.batteryVoltage = cars[i].batteryVoltage;
			carInfo.batteryCurrent = cars[i].batteryCurrent;
			carInfo.date = cars[i].date;
			carBatterParams.push(carInfo);
		}
		// itemClicked(initCarId);
		refshCarInfoWindw(initCarId);
		carBatteryDataChart();

		console.info("x = "+carBatterParams[10].date);
	}
	

	var initCarId = "50007446";
	itemClicked(initCarId);
	var t1 = window.setInterval("getCarBatteryParam(initCarId)", 10000);
	//点击摘取车辆信息，并且刷新显示详情
	function itemClicked(e){
		initCarId = e;
		console.info("itemClicked = "+e);
		refshCarInfoWindw(e);
		getCarBatteryParam(e);
		carBatteryDataChart();
	}
	function refshCarInfoWindw(e)
	{
		for (var i = 0; i < carInfoArry.length; i ++)
		{		
			if((carInfoArry[i].TerminalCode) == e)
			{
				console.info("change car information");
				document.getElementById("LicensePlate").innerHTML = carInfoArry[i].LicensePlate;
				document.getElementById("VinNo").innerHTML = carInfoArry[i].VinNo;
				document.getElementById("CarId").innerHTML = carInfoArry[i].CarId;
				document.getElementById("CarTypeName").innerHTML = carInfoArry[i].CarTypeName;
				document.getElementById("CarBatchName").innerHTML = carInfoArry[i].CarBatchName;
				document.getElementById("CompanyName").innerHTML = carInfoArry[i].CompanyName;
				document.getElementById("UserRegionName").innerHTML = carInfoArry[i].UserRegionName;
				break;			
			}
		}
	}

	
    function carBatteryDataChart() {

		var socData = new Array();
		var voltageData = new Array();
		var currentData = new Array();
		for (var i = 0; i < carBatterParams.length; i ++)
		{
			socData[i]=new Array();
			socData[i][0] = i;
			socData[i][1] = carBatterParams[i].soc;

			voltageData[i]=new Array();
			voltageData[i][0] = i;
			voltageData[i][1] = carBatterParams[i].batteryVoltage;

			currentData[i]=new Array();
			currentData[i][0] = i;
			currentData[i][1] = carBatterParams[i].batteryCurrent;
		}
	 	
        
       
        console.info("var plot = $.plot($(#carBattery),");
        var plot = $.plot($("#carBattery"), [{
                    data: socData,
                    label: "soc"
                }
                , {
                    data: voltageData,
                    label: "voltage"
                }
                , {
                    data: currentData,
                    label: "current"
                }
            ], {
                series: {
                    lines: {
                        show: true,
                        lineWidth: 2,
                        fill: true,
                        fillColor: {
                            colors: [{
                                    opacity: 0.05
                                }, {
                                    opacity: 0.01
                                }, {
                                    opacity: 0.01
                                }
                            ]
                        }
                    },
                    points: {
                        show: false
                    },
                    shadowSize: 2
                },
                grid: {
                    hoverable: true,
                    clickable: true,
                    tickColor: "#eee",
                    borderWidth: 0
                },
                colors: ["#DB5E8C", "#F0AD4E", "#5E87B0"],
                xaxis: {
                    ticks: 11,
                    tickDecimals: 0
                },
                yaxis: {
                    ticks: 11,
                    tickDecimals: 0
                }
            });


        function showTooltip(x, y, contents) {
            $('<div id="tooltip">' + contents + '</div>').css({
                    position: 'absolute',
                    display: 'none',
                    top: y + 5,
                    left: x + 15,
                    border: '1px solid #333',
                    padding: '4px',
                    color: '#fff',
                    'border-radius': '3px',
                    'background-color': '#333',
                    opacity: 0.80
                }).appendTo("body").fadeIn(200);
        }

        var previousPoint = null;
        $("#carBattery").bind("plothover", function (event, pos, item) {
            $("#x").text(pos.x.toFixed(2));
            $("#y").text(pos.y.toFixed(2));

            if (item) {
                if (previousPoint != item.dataIndex) {
                    previousPoint = item.dataIndex;

                    $("#tooltip").remove();
                    var x = item.datapoint[0].toFixed(2),
                        y = item.datapoint[1].toFixed(2);

                    // console.info("pageX = "+item.pageX+"pageY = "+item.pageY);
                    // console.info("x = "+carBatterParams[parseInt(x)].date);
                    var dateTmp = carBatterParams[parseInt(x)].date;
                    // dateTmp=dateTmp.Substring(0,dateTmp.length-2);
                    console.info("dateTmp = "+dateTmp);
                    showTooltip(item.pageX, item.pageY, "时间:"+dateTmp+"  参数:"+y);
                }
            } else {
                $("#tooltip").remove();
                previousPoint = null;
            }
        });
    }
	// carBatteryDataChart();


</script>