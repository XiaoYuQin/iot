<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>朔和云 | 设备列表</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- STYLESHEETS --><!--[if lt IE 9]><script src="js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
	<link rel="stylesheet" type="text/css" href="../css/cloud-admin.css" >
	<link rel="stylesheet" type="text/css"  href="../css/themes/default.css" id="skin-switcher" >
	<link rel="stylesheet" type="text/css"  href="../css/responsive.css" >
	
	<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../js/jquery-ui-1.10.3.custom/css/custom-theme/jquery-ui-1.10.3.custom.min.css" />
	<!-- DATE RANGE PICKER -->
	<link rel="stylesheet" type="text/css" href="../js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
	<!-- UNIFORM -->
	<link rel="stylesheet" type="text/css" href="../js/uniform/css/uniform.default.min.css" />
	<link rel="stylesheet" type="text/css" href="../js/datatables/media/css/jquery.dataTables.min.css" />
	<link rel="stylesheet" type="text/css" href="../js/datatables/media/assets/css/datatables.min.css" />
	<link rel="stylesheet" type="text/css" href="../js/datatables/extras/TableTools/media/css/TableTools.min.css" />
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
							<li>
								<a class="" href="../business/index.jsp">
									<i class="fa fa-home fa-fw"></i>									
									<span class="menu-text">主页</span>
								</a>
							</li>	
							<li class="active">
								<a class="" >
									<i class="fa fa-desktop fa-fw"></i>									
									<span class="menu-text">设备列表</span>
									<span class="selected"></span>
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
											<a href="../business/index.jsp">主页</a>
										</li>		
										<li>
											<a href="#">设备列表</a>
										</li>
										
									</ul>
									<!-- /BREADCRUMBS -->
									<div class="clearfix">
										<h3 class="content-title pull-left">设备列表</h3>
									</div>
									<div class="description">您的所有终端设备</div>
								</div>
							</div>
						</div>
						<!-- /PAGE HEADER -->
						<!-- DATA TABLES -->
						<div class="row">
							<div class="col-md-12">
								<!-- BOX -->
								<div class="box border green">
									<div class="box-title">
										<h4><i class="fa fa-table"></i>终端列表</h4>
										<div class="tools hidden-xs">
											<!--  
											<a href="#box-config" data-toggle="modal" class="config">
												<i class="fa fa-cog"></i>
											</a>
											-->
											<a href="javascript:;" class="reload">
												<i class="fa fa-refresh"></i>
											</a>
											<!--  
											<a href="javascript:;" class="collapse">
												<i class="fa fa-chevron-up"></i>
											</a>
											
											<a href="javascript:;" class="remove">
												<i class="fa fa-times"></i>
											</a>
											-->
										</div>
									</div>
									<div class="box-body">
										<table id="datatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>设备名称</th>
													<th>设备类型</th>
													<th class="hidden-xs">设备ID</th>
													<th>设备状态</th>
													<!-- <th class="hidden-xs">CSS grade</th> -->
												</tr>
											</thead>
											<tbody>
												<tr class="gradeX">
													<td>烟雾传感器</td>
													<td>
														模拟量
														</td>
													<td class="hidden-xs">10001</td>
													<td class="center"><font color="green">正常</font></td>
						
												</tr>
												<tr class="gradeC">
													<td>烟雾传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">10002</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>甲醛传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">20003</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>烟雾传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">10003</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>甲醛传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">20004</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>烟雾传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">10004</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>电压传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">30001</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>电压传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">30002</td>
													<td class="center"><font color="red">异常</font></td>
													
												</tr>
												<tr class="gradeA">
													<td>甲醛传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">20005</td>
													<td class="center"><font color="green">正常</font></td>
													
												</tr>
												<tr class="gradeA">
													<td>烟雾传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">10005</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>温度传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">40007</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>温度传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">40001</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>烟雾传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">10006</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>水位传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">50001</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>压力传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">60001</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>甲醛传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">20006</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>烟雾传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">10007</td>
													<td class="center"><font color="red">异常</font></td>
												</tr>
												<tr class="gradeA">
													<td>温度传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">40002</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>烟雾传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">10008</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>电流传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">70001</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>温度传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">40003</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>烟雾传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">10009</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>甲醛传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">20007</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>温度传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">40004</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>烟雾传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">10010</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>压力传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">60002</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>甲醛传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">20008</td>
													<td class="center"><font color="red">异常</font></td>
												</tr>
												<tr class="gradeA">
													<td>水位传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">50002</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>压力传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">60003</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>压力传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">60004</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>甲醛传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">20009</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>水位传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">50003</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>烟雾传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">10011</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>烟雾传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">10012</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>电流传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">70009</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>水位传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">50004</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>水位传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">50005</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>电流传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">70001</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>烟雾传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">10013</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>水位传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">50006</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>甲醛传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">20010</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>电流传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">70003</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>烟雾传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">10014</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeC">
													<td>电流传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">70004</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>压力传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">60005</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>压力传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">60006</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeX">
													<td>甲醛传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">20011</td>
													<td class="center"><font color="red">异常</font></td>
												</tr>
												<tr class="gradeC">
													<td>水位传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">50006</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeC">
													<td>烟雾传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">10015</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>压力传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">60007</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeA">
													<td>电压传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">30003</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeX">
													<td>烟雾传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">10016</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeX">
													<td>甲醛传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">20012</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeX">
													<td>温度传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">40005</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeC">
													<td>温度传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">40006</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeC">
													<td>烟雾传感器</td>
													<td>模拟量</td>
													<td class="hidden-xs">10017</td>
													<td class="center"><font color="green">正常</font></td>
												</tr>
												<tr class="gradeU">
													<td>烟雾传感器</td>
													<td class="hidden-xs">模拟量</td>
													<td>10018</td>
													<td class="center"><font color="red">异常</font></td>
												</tr>
											</tbody>
											<tfoot>
												<tr>
													<th>设备名称</th>
													<th>设备类型</th>
													<th class="hidden-xs">设备ID</th>
													<th>设备状态</th>
													<!-- <th class="hidden-xs">CSS grade</th> -->
												</tr>
											</tfoot>
										</table>
									</div>
								</div>
								<!-- /BOX -->
							</div>
						</div>
						<!-- /DATA TABLES -->
								
						
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
	<script type="text/javascript" src="../js/datatables/media/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="../js/datatables/media/assets/js/datatables.min.js"></script>
	<script type="text/javascript" src="../js/datatables/extras/TableTools/media/js/TableTools.min.js"></script>
	<script type="text/javascript" src="../js/datatables/extras/TableTools/media/js/ZeroClipboard.min.js"></script>
	<!-- CUSTOM SCRIPT -->
	<script src="../js/script.js"></script>
	<script src="../js/inbox.js"></script>
	<script>
			jQuery(document).ready(function() {		
			App.setPage("dynamic_table");  //Set current page
			App.init(); //Initialise plugins and elements
		});
	</script>
	<!-- /JAVASCRIPTS -->
</body>
</html>