<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>朔和云 | 设备开发</title>
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
													
							<li class="active">
								<a class="">
									<!--<i class="fa fa-envelope-o fa-fw"></i>
									<img class="fa fa-desktop fa-fw" src="../img/icon/gater.png" height="15" width="15"/>
									<i></i>-->
									<i class="fa fa-th-large fa-fw"></i>
									<span class="menu-text">设备开发</span>
									<span class="selected"></span>
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
						<div class="divide-20"></div>
						<!-- 新增设备 -->
						<div class="row">
							<div class="col-md-12">
								<div class="box border inverse">
									<div class="box-title">
										<h4><i class="fa fa-bars"></i>创建新设备</h4>
										<div class="tools">
<!-- 											<a href="#box-config" data-toggle="modal" class="config">
												<i class="fa fa-cog"></i>
											</a>
											<a href="javascript:;" class="reload">
												<i class="fa fa-refresh"></i>
											</a>
											<a href="javascript:;" class="collapse">
												<i class="fa fa-chevron-up"></i>
											</a>
											<a href="javascript:;" class="remove">
												<i class="fa fa-times"></i>
											</a> -->
										</div>
									</div>
									<div class="box-body">
										<!-- <div class="box-body center"> -->
											<form class="form-horizontal" role="form">
												<div class="form-group">
													<label class="col-sm-3 control-label">设备名</label>
													<div class="col-sm-9">
														<div class="input-group" style="width: 60%;">
															<span class="input-group-addon"><i class="fa fa-puzzle-piece"></i></span>
															<input type="text" class="form-control" placeholder="设备的名称，限30个字符">
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">标签（tags）</label>
													<div class="col-sm-9">
														<div class="input-group" style="width: 60%;">
															<span class="input-group-addon"><i class="fa fa-tag"></i></span>
															<input type="text" class="form-control" placeholder="">
														</div>
													</div>
												</div>			
												<div class="form-group">
													<label class="col-sm-3 control-label">地理位置</label>
													<div class="col-sm-9">
														<div class="input-group" style="width: 60%;">
															<span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
															<input type="text" class="form-control">
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">设备类型</label>
													<div class="col-sm-9">
														<select class="form-control" style="width: 60%;">
															<option>模拟设备</option>
															<option>数字设备</option>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">单位</label>
													<div class="col-sm-9">
														<input type="text" name="autocomplete" class="form-control" id="autocomplete-example" placeholder="安、伏特、PPM、米、升等" style="width: 60%;" 
														<span class="help-block"></span> 
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">描述</label>
													<div class="col-sm-9">
														<textarea class="form-control" style="width: 60%;"></textarea>
														<span class="help-block">描述下你的设备</span> 
													</div>
												</div>
												<ul class="list-unstyled center">
													<span class="composeBtn " >
														 <a href="javascript:;" data-title="Compose" class="btn btn-success"> 确定修改</a>
													 </span>
													<span class="composeBtn " >
														 <a href="javascript:;" data-title="Compose" class="btn btn-light-grey"> 取消</a>
													 </span>													 
												</ul>								   							
											 </form>
										<!-- </div> -->
									</div>
								</div>
							</div>														
						</div>
						<!-- 新增设备 -->
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
	<script type="text/javascript" src="../js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script><script type="text/javascript" src="../js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"></script>
	<!-- BLOCK UI -->
	<script type="text/javascript" src="../js/jQuery-BlockUI/jquery.blockUI.min.js"></script>
	<!-- UNIFORM -->
	<script type="text/javascript" src="../js/uniform/jquery.uniform.min.js"></script>
	<!-- BOOTSTRAP WYSIWYG -->
	<script type="text/javascript" src="../js/bootstrap-wysiwyg/jquery.hotkeys.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-wysiwyg/bootstrap-wysiwyg.min.js"></script>
	<!-- COOKIE -->
	<script type="text/javascript" src="../js/jQuery-Cookie/jquery.cookie.min.js"></script>
	<!-- CUSTOM SCRIPT -->
	<script src="../js/script.js"></script>
	<script src="../js/inbox.js"></script>
	<script>
		jQuery(document).ready(function() {		
			App.setPage("inbox");  //Set current page
			App.init(); //Initialise plugins and elements
			Inbox.init();
		});
	</script>
	<!-- /JAVASCRIPTS -->
</body>
</html>