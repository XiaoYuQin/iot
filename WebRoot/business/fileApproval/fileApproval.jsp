<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%> 
<%@ page import="java.util.*" %> 
<%@ page import="java.util.ArrayList" %> 
<%@ page import="com.shuohe.userManage.*" %> 
<%@ page import="com.shuohe.fileApproval.*" %>
<%
    String name = request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>朔和云 | 文件审批</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- STYLESHEETS --><!--[if lt IE 9]><script src="js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
	<link rel="stylesheet" type="text/css" href="../../css/cloud-admin.css" >
	<link rel="stylesheet" type="text/css"  href="../../css/themes/default.css" id="skin-switcher" >
	<link rel="stylesheet" type="text/css"  href="../../css/responsive.css" >
	
	<link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../../js/jquery-ui-1.10.3.custom/css/custom-theme/jquery-ui-1.10.3.custom.min.css" />
	<!-- DATE RANGE PICKER -->
	<link rel="stylesheet" type="text/css" href="../../js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
	<!-- UNIFORM -->
	<link rel="stylesheet" type="text/css" href="../../js/uniform/css/uniform.default.min.css" />
	<link rel="stylesheet" type="text/css" href="../../js/datatables/media/css/jquery.dataTables.min.css" />
	<link rel="stylesheet" type="text/css" href="../../js/datatables/media/assets/css/datatables.min.css" />
	<link rel="stylesheet" type="text/css" href="../../js/datatables/extras/TableTools/media/css/TableTools.min.css" />
	<!-- INBOX CSS -->
	<link rel="stylesheet" href="../../css/inbox.css">
	<!-- time line -->
	<!-- <link rel="stylesheet" href="../../css/timeline.css"> -->

	<!-- TYPEAHEAD -->
	<link rel="stylesheet" type="text/css" href="../../js/typeahead/typeahead.css" />
	<!-- FILE UPLOAD -->
	<link rel="stylesheet" type="text/css" href="../../js/bootstrap-fileupload/bootstrap-fileupload.min.css" />
	<!-- SELECT2 -->
	<link rel="stylesheet" type="text/css" href="../../js/select2/select2.min.css" />
	<!-- UNIFORM -->
	<link rel="stylesheet" type="text/css" href="../../js/uniform/css/uniform.default.min.css" />
	<!-- JQUERY UPLOAD -->
	<!-- blueimp Gallery styles -->
	<link rel="stylesheet" href="../../js/blueimp/gallery/blueimp-gallery.min.css">
	<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
	<link rel="stylesheet" href="../../js/jquery-upload/css/jquery.fileupload.css">
	<link rel="stylesheet" href="../../js/jquery-upload/css/jquery.fileupload-ui.css">
	<!-- MAGIC SUGGEST -->
	<link rel="stylesheet" type="text/css" href="../../js/magic-suggest/magicsuggest-1.3.1-min.css" />

</head>
<body>
	<!-- HEADER -->
	<header class="navbar clearfix" id="header">
		<div class="container">
				<script type="text/javascript">
					var name = "<%=name %>";
					console.info("name = "+name);
				</script>
				<div class="navbar-brand">
					<!-- COMPANY LOGO -->
					<a href="../../index.jsp">
						<img src="../../img/logo/logo.png" alt="Cloud Admin Logo" class="img-responsive" height="100" width="300"/>
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
									<img src="../../img/avatars/avatar2.jpg" alt="" />
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
							<img alt="" src="../../img/avatars/avatar3.jpg" />
							<span class="username" id="userName"><% out.print(request.getSession().getAttribute("username")+"");%></span>
							<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#"><i class="fa fa-user"></i> 我的资料</a></li>
							<li><a href="#"><i class="fa fa-cog"></i> 账户设置</a></li>
							<li><a href="#"><i class="fa fa-eye"></i> 隐私设置</a></li>
							<li><a href="../../logout/logout.jsp"><i class="fa fa-power-off"></i> 退出系统</a></li>
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
				<!-- SIDEBAR MENU -->
				<ul>		
					<li>
						<a class="" href="../../business/index.jsp">
							<i class="fa fa-home fa-fw"></i>									
							<span class="menu-text">主页</span>
						</a>
					</li>		
					<li>
						<a class="" href="../../business/thingList.jsp">
							<i class="fa fa-desktop fa-fw"></i>									
							<span class="menu-text">设备列表</span>
						</a>
					</li>			
					<li>
						<a class="" href="../../business/thingMap.jsp">							
							<i class="fa fa-map-marker fa-fw"></i> 
							<span class="menu-text">设备地图</span>
						</a>
					</li>
					<li>
						<a class="" href="../../business/thingDevelopment.jsp">
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
							<li><a class="" href="../../business/senserTable.jsp"><span class="sub-menu-text">传感器数据</span></a></li>
						</ul>
					</li>
					<li class="active">
						<a class="" >
							<i class="fa fa-briefcase fa-fw"></i> 
							<span class="menu-text">文件审批</span>
							<span class="selected"></span>
						</a>
					</li>					
					<li>
						<a class="" href="../../business/accountSettings.jsp">
							<i class="fa fa-user fa-fw"></i>
							<span class="menu-text">用户设置</span>
						</a>
					</li>
					<li class="has-sub">
						<a href="javascript:;" class="">
							<i class="fa fa-gear fa-fw"></i> 
							<span class="menu-text">系统设置</span>
							<span class="arrow"></span>
						</a>
						<ul class="sub">
							<li><a class=""><span class="sub-menu-text">用户管理</span></a></li>
							<li><a class="" href="../../business/systemManage/dataTableManage/dataTableManager.jsp"><span class="sub-menu-text">数据表管理</span></a></li>
						</ul>
					</li>

<!-- 					<li class="active">
						<a class="" >
							<i class="fa fa-gear fa-fw"></i> 
							<span class="menu-text">系统设置</span>
							<span class="selected"></span>
						</a>
					</li> -->
				</ul>
				<!-- /SIDEBAR MENU -->
			</div>
		</div>
		<!-- /SIDEBAR -->
		<div id="main-content">
			<div class="container">
				<div class="row">
					

					<div id="content" class="col-lg-12">
						<!-- /PAGE HEADER -->
						<div class="divide-20"></div>

						<div class="col-md-12">
							<!-- BOX -->
							<div class="box border">
								<div class="box-title">
									<h4><i class="fa fa-columns"></i><span class="hidden-inline-mobile">文件审批</span></h4>
								</div>
								<div class="box-body">
									<div class="tabbable header-tabs">
										<ul class="nav nav-tabs">
											<li>
												<a href="#box_tab5" data-toggle="tab">
													<i class="fa fa-flask"></i> 
													<span class="hidden-inline-mobile">我的审批</span>
												</a>
											</li>
											<li class="active">
												<a href="#box_tab4" data-toggle="tab">
													<i class="fa fa-home"></i> 
													<span class="hidden-inline-mobile">我的申请</span> 
													<!-- <span class="badge badge-blue font-11">3</span> -->
												</a>
											</li>
										</ul>
									  	<div class="tab-content">
											<div class="tab-pane fade in active" id="box_tab4">
												<div class="row">
													<div class="col-md-12">									
														<table id="userdatatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
															<thead>
																<tr>
																	<th >审批编号</th>
																	<th >发起者</th>
																	<th >审批人</th>
																	<th >审批描述</th>
																	<th >文件名称</th>
																	<th >审批状态</th>
																	<th >发起日期</th>
																	<!-- <th class="hidden-xs">CSS grade</th> -->
																</tr>
															</thead>
															<tbody>
																<%  			
																	ArrayList<User> users = new ArrayList<User>();
																	users = UserManager.getAllUsers();
																	String userList="";
																	for(int i=0;i<users.size();i++)
																	{																
																		userList = userList+"<option>"+users.get(i).getName()+"</option>";
																	}		
									
																	ArrayList<FileApproval> fileApprovals = new ArrayList<FileApproval>();
																	fileApprovals = FileApprovalDatabase.getAllFileApprovalBySponsor(request.getSession().getAttribute("username")+"");
																	for(int i=0;i<fileApprovals.size();i++)
																	{							
																		out.println("<tr  class=\"gradeX \" onclick=getFileApprovalsInfo(\""+fileApprovals.get(i).getId()+"\"); href=\"#table-modal\" style=\"cursor:pointer;\">");
																		out.println("	<td>"+fileApprovals.get(i).getId()+"</td>");
																		out.println("	<td>"+fileApprovals.get(i).getSponsor()+"</td>");
																		out.println("	<td>"+fileApprovals.get(i).getleader()+"</td>");
																		if(fileApprovals.get(i).getDescribe().length()>10)
																			out.println("	<td>"+fileApprovals.get(i).getDescribe().substring(0, 9)+"...</td>");
																		else
																			out.println("	<td>"+fileApprovals.get(i).getDescribe()+"</td>");
																		out.println("	<td>"+fileApprovals.get(i).getFile()+"</td>");
																		out.println("	<td>");
																		//System.out.println("getStatus = "+fileApprovals.get(i).getStatus());
																		switch(fileApprovals.get(i).getStatus())
																		{
																			case 0:
																				out.println("		<button class=\"btn btn-xs btn-info\" disabled=\"true\">申请中</button>");		
																			break;
																			case 1:
																				out.println("		<button class=\"btn btn-xs btn-danger\" disabled=\"true\">已驳回</button>");		
																			break;
																			case 2:
																				out.println("		<button class=\"btn btn-xs btn-success\" disabled=\"true\">已通过</button>");		
																			break;
																		}			
																		out.println("	</td>");		
																		out.println("	<td>"+fileApprovals.get(i).getDate()+"</td>");								
																		out.println("</tr>");
																	}		

																%>					
															</tbody>				
														</table>
														<div class="btn-toolbar pull-righ">
															<button class="btn btn-success btn-right userInfoBootbox">新建审批</button>
															<button class="btn btn-success btn-right" onclick="location.reload();">刷新</button>
															<label id="userListLable" hidden="hidden"><%=userList%></label>
														</div>	
														<!-- /BOX -->								
													</div>
												</div>
											</div>
											<div class="tab-pane fade" id="box_tab5">
												<div class="row">
													<div class="col-md-12">															
														<table id="datatable" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
															<thead>
																<tr>
																	<th >审批编号</th>
																	<th >发起者</th>
																	<th >审批人</th>
																	<th >审批描述</th>
																	<th >文件名称</th>
																	<th >审批状态</th>
																	<th >操作</th>
																	<th >发起日期</th>
																	<!-- <th class="hidden-xs">CSS grade</th> -->
																</tr>
															</thead>
															<tbody>
																<%  													
																	ArrayList<FileApproval> fileApprovalsLeader = new ArrayList<FileApproval>();
																	fileApprovalsLeader = FileApprovalDatabase.getAllFileApprovalByLeader(request.getSession().getAttribute("username")+"");
																	for(int i=0;i<fileApprovalsLeader.size();i++)
																	{							
																		out.println("<tr  class=\"gradeX \">");
																		out.println("	<td onclick=getFileApprovalsInfo(\""+fileApprovalsLeader.get(i).getId()+"\"); href=\"#table-modal\" style=\"cursor:pointer;\">"+fileApprovalsLeader.get(i).getId()+"</td>");
																		out.println("	<td onclick=getFileApprovalsInfo(\""+fileApprovalsLeader.get(i).getId()+"\"); href=\"#table-modal\" style=\"cursor:pointer;\">"+fileApprovalsLeader.get(i).getSponsor()+"</td>");
																		out.println("	<td onclick=getFileApprovalsInfo(\""+fileApprovalsLeader.get(i).getId()+"\"); href=\"#table-modal\" style=\"cursor:pointer;\">"+fileApprovalsLeader.get(i).getleader()+"</td>");
																		if(fileApprovalsLeader.get(i).getDescribe().length()>10)
																			out.println("	<td onclick=getFileApprovalsInfo(\""+fileApprovalsLeader.get(i).getId()+"\"); href=\"#table-modal\" style=\"cursor:pointer;\">"+fileApprovalsLeader.get(i).getDescribe().substring(0, 9)+"...</td>");
																		else
																			out.println("	<td onclick=getFileApprovalsInfo(\""+fileApprovalsLeader.get(i).getId()+"\"); href=\"#table-modal\" style=\"cursor:pointer;\">"+fileApprovalsLeader.get(i).getDescribe()+"</td>");
																		out.println("	<td onclick=getFileApprovalsInfo(\""+fileApprovalsLeader.get(i).getId()+"\"); href=\"#table-modal\" style=\"cursor:pointer;\">"+fileApprovalsLeader.get(i).getFile()+"</td>");
																		out.println("	<td onclick=getFileApprovalsInfo(\""+fileApprovalsLeader.get(i).getId()+"\"); href=\"#table-modal\" style=\"cursor:pointer;\">");
																		//System.out.println("getStatus = "+fileApprovals.get(i).getStatus());
																		switch(fileApprovalsLeader.get(i).getStatus())
																		{
																			case 0:
																				out.println("		<button class=\"btn btn-xs btn-info\" disabled=\"true\">申请中</button>");		
																			break;
																			case 1:
																				out.println("		<button class=\"btn btn-xs btn-danger\" disabled=\"true\">已驳回</button>");		
																			break;
																			case 2:
																				out.println("		<button class=\"btn btn-xs btn-success\" disabled=\"true\">已通过</button>");		
																			break;
																		}		
																		out.println("	</td>");		
																		out.println("	<td>");
																			out.println("		<button class=\"btn btn-xs btn-success\" onclick=passFileApproval(\""+fileApprovalsLeader.get(i).getId()+"\")>通过</button>");
																			out.println("		<button class=\"btn btn-xs btn-danger\" onclick=rejectFileApproval(\""+fileApprovalsLeader.get(i).getId()+"\")>驳回</button>");					
																		out.println("	</td>");																		
																		out.println("	<td onclick=getFileApprovalsInfo(\""+fileApprovalsLeader.get(i).getId()+"\"); href=\"#table-modal\" style=\"cursor:pointer;\">"+fileApprovalsLeader.get(i).getDate()+"</td>");								
																		out.println("</tr>");
																	}		
																%>					
															</tbody>				
														</table>
														<!-- /BOX -->								
													</div>
												</div>
											</div>
									  	</div>
								   	</div>
								</div>
							</div>
							<!-- /BOX -->
						</div>
							
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
	<script src="../../js/jquery/jquery-2.0.3.min.js"></script>
	<!-- JQUERY UI-->
	<script src="../../js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="../../bootstrap-dist/js/bootstrap.min.js"></script>
	<!-- LESS CSS -->
	<script src="../../js/lesscss/less-1.4.1.min.js" type="text/javascript"></script>	
	<!-- DATE RANGE PICKER -->
	<script src="../../js/bootstrap-daterangepicker/moment.min.js"></script>
	<script src="../../js/bootstrap-daterangepicker/daterangepicker.min.js"></script>
	<!-- SLIMSCROLL -->
	<script type="text/javascript" src="../../js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="../../js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"></script>
	<!-- BLOCK UI -->
	<script type="text/javascript" src="../../js/jQuery-BlockUI/jquery.blockUI.min.js"></script>
	<!-- UNIFORM -->
	<script type="text/javascript" src="../../js/uniform/jquery.uniform.min.js"></script>
	<!-- BOOTSTRAP WYSIWYG -->
	<script type="text/javascript" src="../../js/bootstrap-wysiwyg/jquery.hotkeys.min.js"></script>
	<script type="text/javascript" src="../../js/bootstrap-wysiwyg/bootstrap-wysiwyg.min.js"></script>
	<!-- COOKIE -->
	<script type="text/javascript" src="../../js/jQuery-Cookie/jquery.cookie.min.js"></script>
	<script type="text/javascript" src="../../js/datatables/media/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="../../js/datatables/media/assets/js/datatables.min.js"></script>
	<script type="text/javascript" src="../../js/datatables/extras/TableTools/media/js/TableTools.min.js"></script>
	<script type="text/javascript" src="../../js/datatables/extras/TableTools/media/js/ZeroClipboard.min.js"></script>

<!-- BOOTBOX -->
	<script type="text/javascript" src="../../js/bootbox/bootbox.min.js"></script>

	<!-- MAGIC SUGGEST -->
	<script type="text/javascript" src="../../js/magic-suggest/magicsuggest-1.3.1-min.js"></script>
	<!-- FILE UPLOAD -->
	<!-- <script type="text/javascript" src="../../js/bootstrap-fileupload/bootstrap-fileupload.min.js"></script> -->
	<!-- SELECT2 -->
	<!-- <script type="text/javascript" src="../../js/select2/select2.min.js"></script> -->

	<!-- JQUERY UPLOAD -->
	<!-- The Templates plugin is included to render the upload/download listings -->
	<!-- <script src="../../js/blueimp/javascript-template/tmpl.min.js"></script> -->
	<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
	<!-- <script src="../../js/blueimp/javascript-loadimg/load-image.min.js"></script> -->
	<!-- The Canvas to Blob plugin is included for image resizing functionality -->
	<!-- <script src="../../js/blueimp/javascript-canvas-to-blob/canvas-to-blob.min.js"></script> -->
	<!-- blueimp Gallery script -->
	<!-- <script src="../../js/blueimp/gallery/jquery.blueimp-gallery.min.js"></script> -->
	<!-- The basic File Upload plugin -->
	<!-- <script src="../../js/jquery-upload/js/jquery.fileupload.min.js"></script> -->
	<!-- The File Upload processing plugin -->
	<!-- <script src="../../js/jquery-upload/js/jquery.fileupload-process.min.js"></script> -->
	<!-- The File Upload image preview & resize plugin -->
	<!-- <script src="../../js/jquery-upload/js/jquery.fileupload-image.min.js"></script> -->
	<!-- The File Upload audio preview plugin -->
	<!-- <script src="../../js/jquery-upload/js/jquery.fileupload-audio.min.js"></script> -->
	<!-- The File Upload video preview plugin -->
	<!-- <script src="../../js/jquery-upload/js/jquery.fileupload-video.min.js"></script> -->
	<!-- The File Upload validation plugin -->
	<!-- <script src="../../js/jquery-upload/js/jquery.fileupload-validate.min.js"></script> -->
	<!-- The File Upload user interface plugin -->
	<!-- <script src="../../js/jquery-upload/js/jquery.fileupload-ui.min.js"></script> -->
	<!-- The main application script -->
	<!-- <script src="../../js/jquery-upload/js/main.js"></script> -->

	<!-- CUSTOM SCRIPT -->
	<!-- <script src="../../js/script.js"></script> -->
	<!-- <script src="../../js/inbox.js"></script> -->



	<!-- CUSTOM SCRIPT -->
	<!-- <script src="../../js/script.js"></script> -->
	<!-- <script src="../../js/inbox.js"></script> -->
	<script>
		jQuery(document).ready(function() {		
			// App.setPage("dynamic_table");  //Set current page
			fileApproval.init(); //Initialise plugins and elements
		});

	</script>
		
	<!-- /JAVASCRIPTS -->
</body>
</html>
<script type="text/javascript">
	var fileApproval = function () {

	var currentPage = ''; // current page
	var collapsed = false; //sidebar collapsed
	var is_mobile = false; //is screen mobile?
	var is_mini_menu = false; //is mini-menu activated
	var is_fixed_header = false; //is fixed header activated
	var responsiveFunctions = []; //responsive function holder
	
	/*-----------------------------------------------------------------------------------*/
	/*	Runs callback functions set by App.addResponsiveFunction()
	/*-----------------------------------------------------------------------------------*/
    var runResponsiveFunctions = function () {
        // reinitialize other subscribed elements
        for (var i in responsiveFunctions) {
            var each = responsiveFunctions[i];
            each.call();
        }
    }
	/*-----------------------------------------------------------------------------------*/
	/*	To get the correct viewport width based on  http://andylangton.co.uk/articles/javascript/get-viewport-size-javascript/
	/*-----------------------------------------------------------------------------------*/
    var getViewPort = function () {
        var e = window, a = 'inner';
        if (!('innerWidth' in window)) {
            a = 'client';
            e = document.documentElement || document.body;
        }
        return {
            width: e[a + 'Width'],
            height: e[a + 'Height']
        }
    }
var checkLayout = function() {
		//Check if sidebar has mini-menu
		is_mini_menu = $('#sidebar').hasClass('mini-menu');
		//Check if fixed header is activated
		is_fixed_header = $('#header').hasClass('navbar-fixed-top');
	}
	/*-----------------------------------------------------------------------------------*/
	/*	Sidebar & Main Content size match
	/*-----------------------------------------------------------------------------------*/
	var handleSidebarAndContentHeight = function () {
        var content = $('#content');
        var sidebar = $('#sidebar');
        var body = $('body');
        var height;

        if (body.hasClass('sidebar-fixed')) {
            height = $(window).height() - $('#header').height() + 1;
        } else {
            height = sidebar.height() + 20;
        }
        if (height >= content.height()) {
            content.attr('style', 'min-height:' + height + 'px !important');
        }
    }
	/*-----------------------------------------------------------------------------------*/
	/*	Sidebar
	/*-----------------------------------------------------------------------------------*/
	var handleSidebar = function () {
	jQuery('.sidebar-menu .has-sub > a').click(function () {
            var last = jQuery('.has-sub.open', $('.sidebar-menu'));
            last.removeClass("open");
            jQuery('.arrow', last).removeClass("open");
            jQuery('.sub', last).slideUp(200);
            
			var thisElement = $(this);
			var slideOffeset = -200;
            var slideSpeed = 200;
			
            var sub = jQuery(this).next();
            if (sub.is(":visible")) {
                jQuery('.arrow', jQuery(this)).removeClass("open");
                jQuery(this).parent().removeClass("open");
				sub.slideUp(slideSpeed, function () {
					if ($('#sidebar').hasClass('sidebar-fixed') == false) {
						App.scrollTo(thisElement, slideOffeset);
					}
					handleSidebarAndContentHeight();
                });
            } else {
                jQuery('.arrow', jQuery(this)).addClass("open");
                jQuery(this).parent().addClass("open");
                sub.slideDown(slideSpeed, function () {
					if ($('#sidebar').hasClass('sidebar-fixed') == false) {
						App.scrollTo(thisElement, slideOffeset);
					}
					handleSidebarAndContentHeight();
                });
            }
        });
		
	// Handle sub-sub menus
	jQuery('.sidebar-menu .has-sub .sub .has-sub-sub > a').click(function () {
            var last = jQuery('.has-sub-sub.open', $('.sidebar-menu'));
            last.removeClass("open");
            jQuery('.arrow', last).removeClass("open");
            jQuery('.sub', last).slideUp(200);
                
            var sub = jQuery(this).next();
            if (sub.is(":visible")) {
                jQuery('.arrow', jQuery(this)).removeClass("open");
                jQuery(this).parent().removeClass("open");
                sub.slideUp(200);
            } else {
                jQuery('.arrow', jQuery(this)).addClass("open");
                jQuery(this).parent().addClass("open");
                sub.slideDown(200);
            }
        });
	}
	
	/*-----------------------------------------------------------------------------------*/
	/*	Collapse Sidebar Programatically
	/*-----------------------------------------------------------------------------------*/
	var collapseSidebar = function () {
		var iconElem = document.getElementById("sidebar-collapse").querySelector('[class*="fa-"]');
		var iconLeft = iconElem.getAttribute("data-icon1");
		var iconRight = iconElem.getAttribute("data-icon2");
		/* For Navbar */
		jQuery('.navbar-brand').addClass("mini-menu");
		/* For sidebar */
		jQuery('#sidebar').addClass("mini-menu");
		jQuery('#main-content').addClass("margin-left-50");
		jQuery('.sidebar-collapse i').removeClass(iconLeft);
		jQuery('.sidebar-collapse i').addClass(iconRight);
		/* Remove placeholder from Search Bar */
		jQuery('.search').attr('placeholder', '');
		collapsed = true;
		/* Set a cookie so that mini-sidebar persists */
		$.cookie('mini_sidebar', '1');
	}
	/*-----------------------------------------------------------------------------------*/
	/*	Responsive Sidebar Collapse
	/*-----------------------------------------------------------------------------------*/
	var responsiveSidebar = function () {
		//Handle sidebar collapse on screen width
		var width = $(window).width();
		if ( width < 768 ) {
			is_mobile = true;
			//Hide the sidebar completely
			jQuery('#main-content').addClass("margin-left-0");
		}
		else {
			is_mobile = false;
			//Show the sidebar completely
			jQuery('#main-content').removeClass("margin-left-0");
			var menu = $('.sidebar');
			if (menu.parent('.slimScrollDiv').size() === 1) { // destroy existing instance before resizing
				menu.slimScroll({
					destroy: true
				});
				menu.removeAttr('style');
				$('#sidebar').removeAttr('style');
			}
		}
	}
	/*-----------------------------------------------------------------------------------*/
	/*	Sidebar Collapse
	/*-----------------------------------------------------------------------------------*/
	var handleSidebarCollapse = function () {
		var viewport = getViewPort();
        if ($.cookie('mini_sidebar') === '1') {
			/* For Navbar */
			jQuery('.navbar-brand').addClass("mini-menu");
			/* For sidebar */
			jQuery('#sidebar').addClass("mini-menu");
			jQuery('#main-content').addClass("margin-left-50");
			collapsed = true;
        }
		//Handle sidebar collapse on user interaction
		jQuery('.sidebar-collapse').click(function () {
			//Handle mobile sidebar toggle
			if(is_mobile && !(is_mini_menu)){
				//If sidebar is collapsed
				if(collapsed){
					jQuery('body').removeClass("slidebar");
					jQuery('.sidebar').removeClass("sidebar-fixed");
					//Add fixed top nav if exists
					if(is_fixed_header) {
						jQuery('#header').addClass("navbar-fixed-top");
						jQuery('#main-content').addClass("margin-top-100");
					}
					collapsed = false;
					$.cookie('mini_sidebar', '0');
				}
				else {
					jQuery('body').addClass("slidebar");
					jQuery('.sidebar').addClass("sidebar-fixed");
					//Remove fixed top nav if exists
					if(is_fixed_header) {
						jQuery('#header').removeClass("navbar-fixed-top");
						jQuery('#main-content').removeClass("margin-top-100");
					}
					collapsed = true;
					$.cookie('mini_sidebar', '1');
					handleMobileSidebar();
				}
			}
			else { //Handle regular sidebar toggle
				var iconElem = document.getElementById("sidebar-collapse").querySelector('[class*="fa-"]');
				var iconLeft = iconElem.getAttribute("data-icon1");
				var iconRight = iconElem.getAttribute("data-icon2");
				//If sidebar is collapsed
				if(collapsed){
					/* For Navbar */
					jQuery('.navbar-brand').removeClass("mini-menu");
					/* For sidebar */
					jQuery('#sidebar').removeClass("mini-menu");
					jQuery('#main-content').removeClass("margin-left-50");
					jQuery('.sidebar-collapse i').removeClass(iconRight);
					jQuery('.sidebar-collapse i').addClass(iconLeft);
					/* Add placeholder from Search Bar */
					jQuery('.search').attr('placeholder', "Search");
					collapsed = false;
					$.cookie('mini_sidebar', '0');
				}
				else {
					/* For Navbar */
					jQuery('.navbar-brand').addClass("mini-menu");
					/* For sidebar */
					jQuery('#sidebar').addClass("mini-menu");
					jQuery('#main-content').addClass("margin-left-50");
					jQuery('.sidebar-collapse i').removeClass(iconLeft);
					jQuery('.sidebar-collapse i').addClass(iconRight);
					/* Remove placeholder from Search Bar */
					jQuery('.search').attr('placeholder', '');
					collapsed = true;
					$.cookie('mini_sidebar', '1');
				}
				$("#main-content").on('resize', function (e) {
					e.stopPropagation();
				});
			}
        });
	}
	/*-----------------------------------------------------------------------------------*/
	/*	Handle Fixed Sidebar on Mobile devices
	/*-----------------------------------------------------------------------------------*/
	var handleMobileSidebar = function () {
        var menu = $('.sidebar');
		if (menu.parent('.slimScrollDiv').size() === 1) { // destroy existing instance before updating the height
            menu.slimScroll({
                destroy: true
            });
            menu.removeAttr('style');
            $('#sidebar').removeAttr('style');
        }
        menu.slimScroll({
            size: '7px',
            color: '#a1b2bd',
            opacity: .3,
            height: "100%",
            allowPageScroll: false,
            disableFadeOut: false
        });
    }
	/*-----------------------------------------------------------------------------------*/
	/*	Handle Fixed Sidebar
	/*-----------------------------------------------------------------------------------*/
	var handleFixedSidebar = function () {
        var menu = $('.sidebar-menu');

        if (menu.parent('.slimScrollDiv').size() === 1) { // destroy existing instance before updating the height
            menu.slimScroll({
                destroy: true
            });
            menu.removeAttr('style');
            $('#sidebar').removeAttr('style');
        }

        if ($('.sidebar-fixed').size() === 0) {
            handleSidebarAndContentHeight();
            return;
        }

        var viewport = getViewPort();
        if (viewport.width >= 992) {
            var sidebarHeight = $(window).height() - $('#header').height() + 1;

            menu.slimScroll({
                size: '7px',
                color: '#a1b2bd',
                opacity: .3,
                height: sidebarHeight,
                allowPageScroll: false,
                disableFadeOut: false
            });
            handleSidebarAndContentHeight();
        }
    }
	/*-----------------------------------------------------------------------------------*/
	/*	Windows Resize function
	/*-----------------------------------------------------------------------------------*/
	jQuery(window).resize(function() {
		setTimeout(function () {
			checkLayout();
			handleSidebarAndContentHeight();
			responsiveSidebar();
			handleFixedSidebar();
			handleNavbarFixedTop();
			runResponsiveFunctions(); 
		}, 50); // wait 50ms until window resize finishes.
	});


	/*-----------------------------------------------------------------------------------*/
	/*	Bootbox alerts
	/*-----------------------------------------------------------------------------------*/
	// console.info("userList="+document.getElementById("userListLable").innerHTML);
	var message3 = 
	"<form role=\"form\">\
			<div class=\"form-group\">\
				<label for=\"userName\">发起人</label>\
				<input type=\"text\" disabled = \"true\" class=\"form-control\" id=\"sponsor\" value=\""+document.getElementById("userName").innerHTML+" \">\
			</div>\
			<div class=\"form-group\">\
				<label for=\"userName\">审批人</label>\
				<select id=\"leader\" class=\"form-control\">\
	";
	// var message2 = 
	// "				<option>模拟设备</option>\
	// 				<option>数字设备</option>\
	// ";
	var message2 = document.getElementById("userListLable").innerHTML;
	var message0 = 
	"	</select>\
			</div>\
			<div class=\"form-group\">\
				<label>审批描述</label>\
				<textarea id=\"describe\" class=\"form-control\" rows=\"3\" placeholder=\"请输入审批描述...\"></textarea>\
			</div>\
			<div class=\"form-group\">\
				<label for=\"password2\">待审文件</label>\
				<input type=\"text\" class=\"form-control\" id=\"file\" placeholder=\"请输入\">\
			</div>\
			<div class=\"form-group\">\
				<div class=\"row fileupload-buttonbar\">\
					<div class=\"col-lg-12\">\
						<!-- The fileinput-button span is used to style the file input field as button -->\
						<span class=\"btn btn-success fileinput-button\">\
							<i class=\"fa fa-plus\"></i>\
							<span>添加文件...</span>\
							<input type=\"file\" name=\"files[]\" multiple>\
						</span>\
						<button type=\"submit\" class=\"btn btn-primary start\">\
							<i class=\"fa fa-arrow-circle-o-up\"></i>\
							<span>开始上传</span>\
						</button>\
						<button type=\"reset\" class=\"btn btn-warning cancel\">\
							<i class=\"fa fa-ban\"></i>\
							<span>取消上传</span>\
						</button>\
						<button type=\"button\" class=\"btn btn-danger delete\">\
							<i class=\"fa fa-trash-o\"></i>\
							<span>删除</span>\
						</button>\
						<!-- The loading indicator is shown during file processing -->\
						<span class=\"fileupload-loading\"></span>\
					</div>\
					<!-- The global progress information -->\
					<div class=\"col-lg-5 fileupload-progress fade\">\
						<!-- The global progress bar -->\
						<div class=\"progress progress-striped active\" role=\"progressbar\" aria-valuemin=\"0\" aria-valuemax=\"100\">\
							<div class=\"progress-bar progress-bar-success\" style=\"width:0%;\"></div>\
						</div>\
						<!-- The extended global progress information -->\
						<div class=\"progress-extended\">&nbsp;</div>\
					</div>\
				</div>\
				<!-- The table listing the files available for upload/download -->\
				<table role=\"presentation\" class=\"table table-striped\"><tbody class=\"files\"></tbody></table>\
			</div>\
		</form>\
	";
	
	var message4 = message3+message2+message0;
	// console.info(message4);


	// var rejectFileApprovalMessage = 
	// "\
	// 	<form role=\"form\">\
	// 		<H3>确定要驳回审批申请么？</H3>\
	// 		<div class=\"form-group\">\
	// 			<label>驳回意见</label>\
	// 			<textarea id=\"describe\" class=\"form-control\" rows=\"3\" placeholder=\"请输入驳回意见...\"></textarea>\
	// 		</div>\
	// 	</form>\
	// ";
	// var passFileApprovalMessage = 
	// "\
	// 	<form role=\"form\">\
	// 		<H3>确定要通过审批申请么？</H3>\
	// 	</form>\
	// ";


	// var showFileApprovalInfoMessage = 
	// "\
	// 	<form role=\"form\">\
	// 		<article>\
	// 			<h3>2013</h3>\
	// 			<section>\
	// 				<span class=\"point-time point-yellow\"></span>\
	// 				<time datetime=\"2013-03\">\
	// 					<span>March</span>\
	// 					<span>2013</span>\
	// 				</time>\
	// 				<aside>\
	// 					<p class=\"things\">The FAW</p>\
	// 					<p class=\"brief\"><span class=\"text-yellow\">Award</span> (Miami. FL)</p>\
	// 				</aside>\
	// 			</section>\
	// 			<section>\
	// 				<span class=\"point-time point-red\"></span>\
	// 				<time datetime=\"2013-03\">\
	// 					<span>March</span>\
	// 					<span>2013</span>\
	// 				</time>\
	// 				<aside>\
	// 					<p class=\"things\">You reached 500 followers on Twitter</p>\
	// 					<p class=\"brief\"><span class=\"text-red\">Social Appearance</span></p>\
	// 				</aside>\
	// 			</section>\
	// 		</article>\
	// 	</form>\
	// ";

	// var showFileApprovalInfoMessage = 
	// "\
	// 	<form role=\"form\">\
	// 		<article>\
	// 			<h3>2013</h3>\
	// 			<section>\
	// 				<span class=\"point-time point-yellow\"></span>\
	// 				<time datetime=\"2013-03\">\
	// 					<span>March</span>\
	// 					<span>2013</span>\
	// 				</time>\
	// 				<aside>\
	// 					<p class=\"things\">The FAW</p>\
	// 					<p class=\"brief\"><span class=\"text-yellow\">Award</span> (Miami. FL)</p>\
	// 				</aside>\
	// 			</section>\
	// 			<section>\
	// 				<span class=\"point-time point-red\"></span>\
	// 				<time datetime=\"2013-03\">\
	// 					<span>March</span>\
	// 					<span>2013</span>\
	// 				</time>\
	// 				<aside>\
	// 					<p class=\"things\">You reached 500 followers on Twitter</p>\
	// 					<p class=\"brief\"><span class=\"text-red\">Social Appearance</span></p>\
	// 				</aside>\
	// 			</section>\
	// 		</article>\
	// 		<hr width=100% size=8 color=#bbbcbc style=\"FILTER: alpha(opacity=100,finishopacity=5)\"> \
	// 	</form>\
	// ";

	var handleBootbox = function () {
		$(".userInfoBootbox").click(function(){
			bootbox.dialog({
			message : message4,
			title: "发起审批",
			buttons: {
				success: {
					label: "保存",
					className: "btn-success",
					callback: function() {
						createNewFileApproval();
						
					}
				}
			}
			});
		});		
		// $(".rejectFileApproval").click(function(){
		// 	bootbox.dialog({
		// 	message : rejectFileApprovalMessage,
		// 	title: "驳回审批申请",
		// 	buttons: {
		// 		success: {
		// 			label: "确定",
		// 			className: "btn-success",
		// 			callback: function() {						
		// 				// Example.show("great success");
		// 			}
		// 		}
		// 	}
		// 	});
		// });	
		// $(".passFileApproval").click(function(){
		// 	bootbox.dialog({
		// 	message : passFileApprovalMessage,
		// 	title: "通过审批申请",
		// 	buttons: {
		// 		success: {
		// 			label: "确定",
		// 			className: "btn-success",
		// 			callback: function() {						
		// 				// Example.show("great success");
		// 			}
		// 		}
		// 	}
		// 	});
		// });		
		// $(".showFileApprovalInfo").click(function(){
		// 	bootbox.dialog({
		// 	message : showFileApprovalInfoMessage,
		// 	title: "审批详情",
		// 	buttons: {
		// 		success: {
		// 			label: "确定",
		// 			className: "btn-success",
		// 			callback: function() {						
		// 				// Example.show("great success");
		// 			}
		// 		}
		// 	}
		// 	});
		// });	
	}
	/*-----------------------------------------------------------------------------------*/
	/*	Magic Suggest
	/*-----------------------------------------------------------------------------------*/
	var handleMagicSuggest = function () {
		var jsonData = [];
            var cities = 'New York,Los Angeles,Chicago,Houston,Paris,Marseille,Toulouse,Lyon,Bordeaux,Philadelphia,Phoenix,San Antonio,San Diego,Dallas,San Jose,Jacksonville'.split(',');
            for(var i=0;i<cities.length;i++) 
                jsonData.push({id:i,name:cities[i],status:i%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});
            var ms1 = $('#ms1').magicSuggest({
                data: jsonData,
                sortOrder: 'name',
                value: [0],
                selectionPosition: 'right',
                groupBy: 'status',
                maxDropHeight: 200
            });
            var ms2 = $('#ms2').magicSuggest({
				width: '80%',
                data: jsonData
            });
            var ms3 = $('#ms3').magicSuggest({
                selectionPosition: 'bottom',
                renderer: function(city){
                    return '<div>' +
                            '<div style="font-family: Arial; font-weight: bold">' + city.name + '</div>' +
                            '<div><b>Cooooolness</b>: ' + city.coolness + '</div>' +
                           '</div>';
                },
                minChars: 1,
                selectionStacked: true,
                data: jsonData
            });
            var ms4 = $('#ms4').magicSuggest({
                data: [{id:1,label:'one'}, {id:2,label:'two'}, {id:3,label:'three'}],
                displayField: 'label',
                value: [1,3]
            });
            var ms5 = $('#ms5').magicSuggest({
                width: '80%',
                data: 'marilyn@monroe.com,mother@teresa.com,john@kennedy.com,martin@luther.com,nelson@mandela.com,winston@churchill.com,bill@gates.com,muhammad@ali.com,mahatma@gandhi.com,margaret@thatcher.com,charles@gaulle.com,christopher@colombus.com,george@orwell.com,charles@darwin.com,elvis@presley.com,albert@einstein.com,paul@mccartney.com,queen@elizabeth.com,queen@victoria.com,john@keynes.com,mikhail@gorbachev.com,jawaharlal@nehru.com,leonardo@vinci.com,louis@pasteur.com,leo@tolstoy.com,pablo@picasso.com,vincent@gogh.com,franklin@roosevelt.com,john@paul.com,neil@armstrong.com,thomas@edison.com,rosa@parks.com,aung@kyi.com,lyndon@johnson.com,ludwig@beethoven.com,oprah@winfrey.com,indira@gandhi.com,eva@peron.com,benazir@bhutto.com,desmond@tutu.com,dalai@lama.com,walt@disney.com,peter@sellers.com,barack@obama.com,malcolm@x.com,richard@branson.com,jesse@owens.com,ernest@hemingway.com,john@lennon.com,henry@ford.com,haile@selassie.com,joseph@stalin.com,lord@baden.com,michael@jordon.com,george@bush.com,osama@laden.com,fidel@castro.com,oscar@wilde.com,coco@chanel.com,amelia@earhart.com,adolf@hitler.com,mary@magdalene.com,alfred@hitchcock.com,michael@jackson.com,mata@hari.com,emmeline@pankhurst.com,ronald@reagan.com,lionel@messi.com,babe@ruth.com,bob@geldof.com,leon@trotsky.com,roger@federer.com,sigmund@freud.com,woodrow@wilson.com,mao@zedong.com,katherine@hepburn.com,audrey@hepburn.com,david@beckham.com,tiger@woods.com,usain@bolt.com,bill@cosby.com,carl@lewis.com,prince@charles.com,jacqueline@onassis.com,billie@holiday.com,virginia@woolf.com,billie@king.com,kylie@minogue.com,anne@frank.com,emile@zatopek.com,lech@walesa.com,christiano@ronaldo.com,yoko@ono.com,julie@andrews.com,florence@nightingale.com,marie@curie.com,stephen@hawking.com,tim@lee.com,lady@gaga.com,lance@armstrong.com,jon@stewart.com,scarlett@johansson.com,larry@page.com,sergey@brin.com,roman@abramovich.com,rupert@murdoch.com,al@gore.com,sacha@baron.com,george@clooney.com,paul@krugman.com,jimmy@wales.com'
            });
            var ms6 = $('#ms6').magicSuggest({
                // will fetch data from options
            });
            var ms7 = $('#ms7').magicSuggest({
                data: jsonData,
                resultAsString: true,
                maxSelection: 1,
                maxSelectionRenderer: function(){}
            })
	}
	/*-----------------------------------------------------------------------------------*/
	/*	Data Tables
	/*-----------------------------------------------------------------------------------*/
	var handleDataTables = function () {
		$('#datatable1').dataTable({
				"sPaginationType": "bs_full"
			});
        $('#userdatatable1').dataTable({
            "sPaginationType": "bs_full"
            });
		$('#datatable2').dataTable({
				"sPaginationType": "bs_full",
				sDom: "<'row'<'dataTables_header clearfix'<'col-md-4'l><'col-md-8'Tf>r>>t<'row'<'dataTables_footer clearfix'<'col-md-6'i><'col-md-6'p>>>",
                oTableTools: {
                    aButtons: ["copy", "print", "csv", "xls", "pdf"],
                    sSwfPath: "js/datatables/extras/TableTools/media/swf/copy_csv_xls_pdf.swf"
                }
			});
		$('.datatable').each(function(){
			var datatable = $(this);
			// SEARCH - Add the placeholder for Search and Turn this into in-line form control
			var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
			search_input.attr('placeholder', 'Search');
			search_input.addClass('form-control input-sm');
			// LENGTH - Inline-Form control
			var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
			length_sel.addClass('form-control input-sm');
		});
	}
	

	/*-----------------------------------------------------------------------------------*/
	/*	Handles Profile Edit
	/*-----------------------------------------------------------------------------------*/
	var handleProfileEdit = function () {
		$(".datepicker").datepicker();
	}
	return {

        //Initialise theme pages
        init: function () {
			handleSidebar(); //Function to display the sidebar
			handleSidebarCollapse(); //Function to hide or show sidebar
			handleSidebarAndContentHeight();  //Function to hide sidebar and main content height
			responsiveSidebar();		//Function to handle sidebar responsively

			handleDataTables();	//Function to display data tables		
			handleBootbox();	
			handleMagicSuggest();
        },

        //Set page
        setPage: function (name) {
            currentPage = name;
        },

        isPage: function (name) {
            return currentPage == name ? true : false;
        },
		//public function to add callback a function which will be called on window resize
        addResponsiveFunction: function (func) {
            responsiveFunctions.push(func);
        },
		// wrapper function to scroll(focus) to an element
        scrollTo: function (el, offeset) {
            pos = (el && el.size() > 0) ? el.offset().top : 0;
            jQuery('html,body').animate({
                scrollTop: pos + (offeset ? offeset : 0)
            }, 'slow');
        },

        // function to scroll to the top
        scrollTop: function () {
            userAccountApp.scrollTo();
        },
		// initializes uniform elements
        initUniform: function (els) {
            if (els) {
                jQuery(els).each(function () {
                    if ($(this).parents(".checker").size() == 0) {
                        $(this).show();
                        $(this).uniform();
                    }
                });
            } else {
                handleAllUniform();
            }
        },
		// wrapper function to  block element(indicate loading)
        blockUI: function (el, loaderOnTop) {
            lastBlockedUI = el;
            jQuery(el).block({
                message: '<img src="./img/loaders/12.gif" align="absmiddle">',
                css: {
                    border: 'none',
                    padding: '2px',
                    backgroundColor: 'none'
                },
                overlayCSS: {
                    backgroundColor: '#000',
                    opacity: 0.05,
                    cursor: 'wait'
                }
            });
        },

        // wrapper function to  un-block element(finish loading)
        unblockUI: function (el) {
            jQuery(el).unblock({
                onUnblock: function () {
                    jQuery(el).removeAttr("style");
                }
            });
        },
    };
}();
(function (a, b) {
    a.fn.admin_tree = function (d) {
        var c = {
            "open-icon": "fa fa-folder-open",
            "close-icon": "fa fa-folder",
            selectable: true,
            "selected-icon": "fa fa-check",
            "unselected-icon": "tree-dot"
        };

        c = a.extend({}, c, d);

        this.each(function () {
            console.log("c="+c);
            console.log("d="+d);
            var e = a(this);
            e.html('<div class = "tree-folder" style="display:none;"><div class="tree-folder-header"><i class="' + c["close-icon"] + '"></i><div class="tree-folder-name"></div></div><div class="tree-folder-content"></div><div class="tree-loader" style="display:none"></div></div><div class="tree-item" style="display:none;">' + (c["unselected-icon"] == null ? "" : '<i class="' + c["unselected-icon"] + '"></i>') + '<div class="tree-item-name" ></div></div>');
            e.addClass(c.selectable == true ? "tree-selectable" : "tree-unselectable");
            e.tree(c)
        });
        return this
    }
})(window.jQuery);


(function () {
    this.Theme = (function () {
        function Theme() {}
        Theme.colors = {
			white: "#FFFFFF",
			primary: "#5E87B0",
            red: "#D9534F",
            green: "#A8BC7B",
            blue: "#70AFC4",
            orange: "#F0AD4E",
			yellow: "#FCD76A",
            gray: "#6B787F",
            lightBlue: "#D4E5DE",
			purple: "#A696CE",
			pink: "#DB5E8C",
			dark_orange: "#F38630"
        };
        return Theme;
    })();
})(window.jQuery);

</script>
<script type="text/javascript">

	var ajax =
	{
		abort : function()
		{
		} //定义一个空的方法, 是为了下面ajax.abort()不报错
	};
	function createNewFileApproval()
	{
		// var sponsor=document.getElementById("sponsor").value;

		// if (!sponsor)
		// { 
		// 	sponsor="null";
		// }
		//var sponsor = "null";
		var sponsor = document.getElementById("userName").innerHTML;
		var leader=$("#leader").find("option:selected").text();
		var describe=document.getElementById("describe").value;
		var file=document.getElementById("file").value;
		console.info("sponsor = "+sponsor);
		console.info("leader = "+leader);
		console.info("describe = "+describe);
		console.info("file = "+file);

		console.info("createNewFileApproval() sponsor="+sponsor);
		ajax.abort();
		//每次提交前, 先放弃上一次ajax的提交, 这样就不会同时有多个ajax正在请求, 卡死浏览器
		ajax = $.ajax(
		{
			url : "http://localhost:8000/iot/business/interface/setNewFileApproval.jsp"//请求的url
			,async : false
			,dataType : "jsonp"			
			,jsonp : "callback"//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
			,jsonpCallback : "createNewFileApprovalCallback"
			,data:  { "sponsor": sponsor,"leader": leader,"describe": describe ,"file": file }
		});
	}
	function createNewFileApprovalCallback(data)//回调函数
	{
		console.log(data); //
	}
	function getFileApprovalsInfo(id)
	{
		console.info("getFileApprovalsInfo id= "+id);
		ajax.abort();
		ajax = $.ajax(
		{
			url : "http://localhost:8000/iot/business/interface/getFileApprovalInfo.jsp"//请求的url
			,async : false
			,dataType : "jsonp"			
			,jsonp : "callback"//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
			,jsonpCallback : "getFileApprovalsInfoByIdCallback"
			,data:  { "id": id}
		});
	}
	function getFileApprovalsInfoByIdCallback(data)//回调函数
	{
		console.log("getFileApprovalsInfoByIdCallback"); //
		var fileds = jQuery.parseJSON(JSON.stringify(data));
		// console.info("cars="+JSON.stringify(data));
		console.log(fileds.length); //
		if(fileds.length==0)
		{
			var showFileApprovalInfoMessage = 
				"<form role=\"form\">"
			+			"<h3>没有获得更多的数据</h3>"	
			+	"</form>";
		}
		else
		{
			var info = "";
			for (var i = 0; i < fileds.length; i++)
			{		
				console.info(fileds[i].approvalId);
				console.info(fileds[i].approvalSN);
				console.info(fileds[i].setStatus);
				console.info(fileds[i].describe);
				console.info(fileds[i].sponsor);
				console.info(fileds[i].leader);
				console.info(fileds[i].date);
				/*审批状态*/
				if(fileds[i].setStatus == 0)
				{
					info = info + "<span>审批状态：审批中</span><br>";
				}
				else if(fileds[i].setStatus == 1)
				{
					info = info + "<span>审批状态：驳回</span><br>";
				}
				else if(fileds[i].setStatus == 2)
				{
					info = info + "<span>审批状态：通过</span><br>";
				}
				/*发起时间*/
				info = info + "<span>发起时间："+ fileds[i].date +"</span><br>";
				/*状态描述*/
				info = info + "<span>审批描述："+ fileds[i].describe +"</span><br>";
				/*分割线*/
				info = info + "<hr width=100% size=8 color=#bbbcbc style=\"FILTER: alpha(opacity=100,finishopacity=5)\"> ";
			}

			var showFileApprovalInfoMessage = 
			"<form role=\"form\">"
			+	"<h5>申请人:"+fileds[0].sponsor+"</h3>"
			+	"<h5>审批人:"+fileds[0].leader+"</h3>"
			+	"<h5>审批文件:"+fileds[0].describe+"</h3>"
			+	"<hr width=100% size=8 color=#bbbcbc style=\"FILTER: alpha(opacity=100,finishopacity=5)\"> "
			+	info		
			+	"</form>";
		}

		bootbox.dialog({
			message: showFileApprovalInfoMessage,
			title: "审批详情",
			buttons: {
				success: {
					label: "确定",
					className: "btn-success",
					callback: function() {
						// Example.show("great success");
					}
				}
			}
		});
	}

	function passFileApproval(id)
	{

		var passFileApprovalMessage = 
		"\
			<form role=\"form\">\
				<H3>确定要通过审批申请么？</H3>\
			</form>\
		";


		bootbox.dialog({
			message: passFileApprovalMessage,
			title: "同意审批请求",
			buttons: {
				success: {
					label: "确定",
					className: "btn-success",
					callback: function() 
					{
						// Example.show("great success");
						console.info("passFileApproval("+id+")");
						var user = document.getElementById("userName").innerHTML;
						ajax.abort();
						//每次提交前, 先放弃上一次ajax的提交, 这样就不会同时有多个ajax正在请求, 卡死浏览器
						ajax = $.ajax(
						{
							url : "http://localhost:8000/iot/business/interface/setFileApprovalPass.jsp"//请求的url
							,async : false
							,dataType : "jsonp"			
							,jsonp : "callback"//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
							,jsonpCallback : "passFileApprovalCallback"
							,data:  { "id": id,"user":user}
						});
					}
				}
			}
		});

		
	}
	function passFileApprovalCallback()
	{
		console.info("passFileApprovalCallback");
	}
	
	function rejectFileApproval(id,describe)
	{
		var rejectFileApprovalMessage = 
		"\
			<form role=\"form\">\
				<H3>确定要驳回审批申请么？</H3>\
				<div class=\"form-group\">\
					<label>驳回意见</label>\
					<textarea id=\"describe\" class=\"form-control\" rows=\"3\" placeholder=\"请输入驳回意见...\"></textarea>\
				</div>\
			</form>\
		";
		bootbox.dialog({
			message: rejectFileApprovalMessage,
			title: "驳回审批请求",
			buttons: {
				success: {
					label: "确定",
					className: "btn-success",
					callback: function() 
					{
						console.info("rejectFileApproval("+id+")");
						var user = document.getElementById("userName").innerHTML;
						ajax.abort();
						//每次提交前, 先放弃上一次ajax的提交, 这样就不会同时有多个ajax正在请求, 卡死浏览器
						ajax = $.ajax(
						{
							url : "http://localhost:8000/iot/business/interface/setFileApprovalReject.jsp"//请求的url
							,async : false
							,dataType : "jsonp"			
							,jsonp : "callback"//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
							,jsonpCallback : "rejectFileApprovalCallback"
							,data:  { "id": id,"describe":describe}
						});
					}
				}
			}
		});
		
	}
	function rejectFileApprovalCallback()
	{
		console.info("rejectFileApprovalCallback");
	}

</script>
