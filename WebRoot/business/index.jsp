<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page import="os.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>朔和云 | 主页</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- STYLESHEETS --><!--[if lt IE 9]><script src="js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
	<link rel="stylesheet" type="text/css" href="../css/cloud-admin.css" >
	<link rel="stylesheet" type="text/css"  href="../css/themes/default.css" id="skin-switcher" >
	<link rel="stylesheet" type="text/css"  href="../css/responsive.css" >
	
	<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!-- DATE RANGE PICKER -->
	<link rel="stylesheet" type="text/css" href="../js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
	<!-- UNIFORM -->
	<link rel="stylesheet" type="text/css" href="../js/uniform/css/uniform.default.min.css" />
	<!-- INBOX CSS -->
	<link rel="stylesheet" href="../css/inbox.css">
	<!-- FONTS -->

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
					<li class="active">
						<a class="" href="../business/index.jsp">
							<i class="fa fa-home fa-fw"></i>									
							<span class="menu-text">主页</span>
							<span class="selected"></span>
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
						<a class="" href="../business/accountSettings.jsp">
							<i class="fa fa-user fa-fw" ></i> 
							<span class="menu-text">账户设置</span>
						</a>
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
						<!-- PAGE HEADER-->
						<div class="row">
							<div class="col-sm-12">
								<div class="page-header">
									<!-- STYLER -->
									
									<!-- /STYLER -->
									<!-- BREADCRUMBS -->
									<ul class="breadcrumb">
										<li>
											<i class="fa fa-home"></i>
											<a href="index.html">主页</a>
										</li>		
									</ul>
									<!-- /BREADCRUMBS -->
									<div class="clearfix">
										<h3 class="content-title pull-left">欢迎登录</h3>
									</div>
									<div class="description">>概览云平台现状</div>
								</div>
							</div>
						</div>
						<!-- 页面主要内容 -->
						<!-- class="row" 终端数量和登录人数 -->
						<div class="row">
							<!-- COLUMN 1 -->
							<div class="col-md-6">
								<div class="row">
									<div class="col-lg-6">
										<div class="dashbox panel panel-default">
											<div class="panel-body">
												<div class="panel-left red">
													<i class="fa fa-instagram fa-3x"></i>
												</div>
												<div class="panel-right">
													<div class="number">203</div>
													<div class="title">终端总数</div>
													<!-- 
													<span class="label label-success">
													26% <i class="fa fa-arrow-up"></i>
													</span>
													-->
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="dashbox panel panel-default">
											<div class="panel-body">
												<div class="panel-left blue">
													<!-- <i class="fa fa-twitter fa-3x"></i> -->
													<div align="center">
													<img src="../img/icon/error.png" alt="Cloud Admin Logo" class="img-responsive" height="40" width="40"/>
													</div>
													</div>
													<div class="panel-right">
													<div class="number">5</div>
													<div class="title">故障终端数量</div>
													<!-- 
													<span class="label label-warning">
													5% <i class="fa fa-arrow-down"></i>
													</span>
													-->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>								
						</div>
						<!-- class="row" 终端数量和登录人数 -->
						<!-- 服务器负载-->
						<div class="row">
							<div class="col-md-6">
								<div class="quick-pie panel panel-default">
									<div class="panel-body">
										<!-- <div class="row"> -->
											<div class="col-md-3 text-center">
												<div id="pie_1" class="piechart padding-bottom-20" data-percent="51">
													<span class="percent"></span>
												</div>
												<a href="#" class="title"><font size="2">CPU 占用率</font></a>
												<!-- <div id="js_update_1" class="btn btn-default">Update chart</div> -->
												<!-- <div class="divide-12"></div> -->
											</div>
											<div class="col-md-3 text-center">
												<div id="pie_2" class="piechart padding-bottom-20" data-percent="32">
													<span class="percent"></span>
												</div>
												<a href="#" class="title"><font size="2">内存使用率</font></a>
												<!-- <div id="js_update_2" class="btn btn-default">Update chart</div> -->
												<!-- <div class="divide-12"></div> -->
											</div>
											<div class="col-md-3 text-center">
												<div id="pie_3" class="piechart padding-bottom-20" data-percent="15">
													<span class="percent"></span>
												</div>
												<a href="#" class="title"><font size="2">硬盘使用率</font></a>
												<!-- <div id="js_update_3" class="btn btn-default">Update chart</div> -->
												<!-- <div class="divide-12"></div> -->
											</div>
											<div class="col-md-3 text-center">
												<div id="pie_4" class="piechart padding-bottom-20" data-percent="17">
													<span class="percent"></span>
												</div>
												<a href="#" class="title"><font size="2">带宽使用率</font></a>
												<!-- <div id="js_update_4" class="btn btn-default">Update chart</div> -->
												<!-- <div class="divide-12"></div> -->
											</div>
										<!-- </div> -->
									</div>
								</div>
							</div>
						</div>
						<script type="text/javascript">
							function refreshServerHardwareParam()
							{
								console.info("refreshServerHardwareParam");
								document.getElementById('pie_4');	
								<%
									IMonitorService service = new MonitorServiceImpl();
									MonitorInfoBean monitorInfo = service.getMonitorInfoBean();
									System.out.println("cpu占有率=" + monitorInfo.getCpuRatio());
									
									System.out.println("可使用内存=" + monitorInfo.getTotalMemory());
									System.out.println("剩余内存=" + monitorInfo.getFreeMemory());
									System.out.println("最大可使用内存=" + monitorInfo.getMaxMemory());
									
									System.out.println("操作系统=" + monitorInfo.getOsName());
									System.out.println("总的物理内存=" + monitorInfo.getTotalMemorySize() + "kb");
									System.out.println("剩余的物理内存=" + monitorInfo.getFreeMemory() + "kb");
									System.out.println("已使用的物理内存=" + monitorInfo.getUsedMemory() + "kb");
									System.out.println("线程总数=" + monitorInfo.getTotalThread() + "kb");
								%>

								$('#pie_1').data('easyPieChart').update(Math.random()*11+50);
								$('#pie_2').data('easyPieChart').update(Math.random()*9+42);
								$('#pie_3').data('easyPieChart').update(Math.random()*6+8);
								$('#pie_4').data('easyPieChart').update(Math.random()*8+1);
							}
							var t2 = window.setInterval("refreshServerHardwareParam()", 3000);
						</script>
						<!-- 服务器负载-->
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
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY -->
	<script src="../js/jquery/jquery-2.0.3.min.js"></script>
	<!-- JQUERY UI-->
	<script src="../js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="../bootstrap-dist/js/bootstrap.min.js"></script>
		
	<!-- DATE RANGE PICKER -->
	<script src="../js/bootstrap-daterangepicker/moment.min.js"></script>
	
	<script src="../js/bootstrap-daterangepicker/daterangepicker.min.js"></script>
	<!-- SLIMSCROLL -->
	<script type="text/javascript" src="../js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="../js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"></script>
	<!-- BLOCK UI -->
	<script type="text/javascript" src=../"js/jQuery-BlockUI/jquery.blockUI.min.js"></script>
	<!-- FLOT CHARTS -->
	<script src="../js/flot/jquery.flot.min.js"></script>
	<script src="../js/flot/jquery.flot.time.min.js"></script>
    <script src="../js/flot/jquery.flot.selection.min.js"></script>
	<script src="../js/flot/jquery.flot.resize.min.js"></script>
    <script src="../js/flot/jquery.flot.pie.min.js"></script>
    <script src="../js/flot/jquery.flot.stack.min.js"></script>
    <script src="../js/flot/jquery.flot.crosshair.min.js"></script>
	<!-- FLOT GROWRAF -->
	<script src="../js/flot-growraf/jquery.flot.growraf.min.js"></script>
	<!-- GAGE -->
	<script src="../js/justgage/js/raphael.2.1.0.min.js"></script>
    <!-- <script src="../js/justgage/js/justgage.1.0.1.min.js"></script> -->
	<!-- EASY PIE CHART -->
	<script src="../js/jquery-easing/jquery.easing.min.js"></script>
	<script type="text/javascript" src="../js/easypiechart/jquery.easypiechart.min.js"></script>
	<!-- SPARKLINES -->
	<script type="text/javascript" src="../js/sparklines/jquery.sparkline.min.js"></script>
	<!-- COOKIE -->
	<script type="text/javascript" src="../js/jQuery-Cookie/jquery.cookie.min.js"></script>
	<!-- CUSTOM SCRIPT -->
	<script src="../js/script.js?ver=1"></script>
	<script src="../js/charts.js"></script>
	<script>
		jQuery(document).ready(function() {		
			App.setPage("others");  //Set current page
			App.init(); //Initialise plugins and elements
			Charts.initOtherCharts(); //Init other charts
		});
	</script>
	<!-- /JAVASCRIPTS -->
</body>
</html>