<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.shuohe.datatable.*"%> 
<%@ page import="java.util.ArrayList" %> 
<%
    String name = request.getContextPath()+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>朔和云 | 系统设置</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- STYLESHEETS --><!--[if lt IE 9]><script src="js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
	<link rel="stylesheet" type="text/css" href="../../../css/cloud-admin.css" >
	<link rel="stylesheet" type="text/css"  href="../../../css/themes/default.css" id="skin-switcher" >
	<link rel="stylesheet" type="text/css"  href="../../../css/responsive.css" >
	
	<link href="../../../font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../../../js/jquery-ui-1.10.3.custom/css/custom-theme/jquery-ui-1.10.3.custom.min.css" />
	<!-- DATE RANGE PICKER -->
	<link rel="stylesheet" type="text/css" href="../../../js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
	<!-- UNIFORM -->
	<link rel="stylesheet" type="text/css" href="../../../js/uniform/css/uniform.default.min.css" />
	<link rel="stylesheet" type="text/css" href="../../../js/datatables/media/css/jquery.dataTables.min.css" />
	<link rel="stylesheet" type="text/css" href="../../../js/datatables/media/assets/css/datatables.min.css" />
	<link rel="stylesheet" type="text/css" href="../../../js/datatables/extras/TableTools/media/css/TableTools.min.css" />
	<!-- INBOX CSS -->
	<link rel="stylesheet" href="../../../css/inbox.css">

	<link rel="stylesheet" type="text/css" href="../../../js/fuelux-tree/fuelux.min.css" />


	<style>		
		#creatDatatable,
		#modifyDatatable,
		#datatableFiled,
		#datatablePermissions,
		#datatableAbout {
		  display: none;
		}

	</style>

	<style> 
		html,body{ height:100%; margin:0; padding:0; font-size:14px;} 
		p{ line-height:18px;} 
		.mask{height:100%; width:100%; position:fixed; _position:absolute; top:0; z-index:1000; } 
		.opacity{ opacity:0.3; filter: alpha(opacity=30); background-color:#000; } 
		.content{height:600px; width:800px; overflow:auto; border:2px solid #ccc; background-color:#fff; position:absolute; top:50%; left:50%; margin:-300px auto auto -400px; z-index:1001; word-wrap: break-word; padding:3px;} 
		.ph{ height:1000px;} 
	</style> 

</head>
<body>
	<!-- HEADER -->
	<!-- <div id="my-timeline"></div> -->

	<header class="navbar clearfix" id="header">
		<!-- <div class="mask opacity"><img src="../../../img/loaders/4.gif"></div>  -->
		<div class="container">
				<script type="text/javascript">
					var name = "<%=name %>";
					console.info("name = "+name);
				</script>
				<div class="navbar-brand">
					<!-- COMPANY LOGO -->
					<a href="index.html">
						<img src="../../../img/logo/logo.png" alt="Cloud Admin Logo" class="img-responsive" height="100" width="300"/>
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
									<img src="../../../img/avatars/avatar2.jpg" alt="" />
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
							<img alt="" src="../../../img/avatars/avatar3.jpg" />
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
							<li><a href="../../../logout/logout.jsp"><i class="fa fa-power-off"></i> 退出系统</a></li>
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
						<a class="" href="../../../business/index.jsp">
							<i class="fa fa-home fa-fw"></i>									
							<span class="menu-text">主页</span>
						</a>
					</li>		
					<li>
						<a class="" href="../../../business/thingList.jsp">
							<i class="fa fa-desktop fa-fw"></i>									
							<span class="menu-text">设备列表</span>
						</a>
					</li>			
					<li>
						<a class="" href="../../../business/thingMap.jsp">							
							<i class="fa fa-map-marker fa-fw"></i> 
							<span class="menu-text">设备地图</span>
						</a>
					</li>
					<li>
						<a class="" href="../../../business/thingDevelopment.jsp">
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
							<li><a class="" href="../../../business/senserTable.jsp"><span class="sub-menu-text">传感器数据</span></a></li>
						</ul>
					</li>
					<li>
						<a class="" href="../../../business/accountSettings.jsp">
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
							<li><a class="" href="../../../business/systemManage/userManage/userManager.jsp"><span class="sub-menu-text">用户管理</span></a></li>
							<li><a class=""><span class="sub-menu-text">数据表管理</span></a></li>
							<li><a class=""><span class="sub-menu-text">操作日志</span></a></li>
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
						<!-- /PAGE HEADER -->
						<div class="divide-20"></div>

						<!-- <div class="tab-pane fade in active" id="box_tab4"> -->
						<div class="col-md-3">
							<div class="panel panel-default">														
								<div class="panel-body orders">
									<div class="scroller" data-height="650px" data-always-visible="1" data-rail-visible="1">
										<div id="tree3" class="tree"></div>
										<ul class="list-unstyled">
											<li class="clearfix">
												<div class="box-body center">
													<p class="btn-toolbar">
														<button class="btn btn-xs btn-success" onclick="swapScreen('modifyDatatable');return false;">创建新表单</button>
													</p>
												</div>								
											</li>																																																																		
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- </div> -->
						<div  class="col-md-9">
							<section id="creatDatatable" class="visible">
								
							</section>

							<section id="modifyDatatable">
								<div class="box border blue">
									<div class="box-title">
										<h4><i></i>新建数据表</h4>
										<div class="tools">
											<a href="javascript:;" class="reload">
												<i class="fa fa-refresh"></i>
											</a>
										</div>
									</div>
									<div class="box-body">
									<!-- <form role="form"> -->
										<div class="form-group">
											<label>名称</label><br>
											<input type="text" class="form-control" id="creatDatatableName" placeholder="请输入名称">
										</div>
										<div class="form-group">
											<label>状态</label>
											<select class="form-control" id="createDataTableStatus">
												<option>使用</option>
												<option>停用</option>
											</select>
										</div>
										<div class="form-group">
											<label>说明:</label> 
											<textarea id="createDataTableInfo" rows="3" cols="5" name="textarea" class="form-control"></textarea>
										</div>

										<button class="btn btn-success" onclick="createNewTable();">提交</button><img id="createDatatableWaitImag" style="display:none;" src="../../../img/loaders/4.gif">
									<!-- </form>	
																 -->
									</div>
								</div>																 
							</section>
							<section id="datatableFiled">
								<div class="box border blue">
									<div class="box-title">
										<h4><i></i>字段设置</h4>
										<div class="tools">
											<a href="javascript:;" class="reload">
												<i class="fa fa-refresh"></i>
											</a>
										</div>
									</div>
									<div class="box-body">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th>#</th>
													<th>字段号</th>
													<th>名称</th>
													<th>数据类型</th>
													<th>选项字典</th>
													<th>应用字段</th>
													<th>不得重复</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>Mark</td>
													<td>Otto</td>
													<td>@mdo</td>
													<td>@mdo</td>
													<td>@mdo</td>
													<td>@mdo</td>
													<td>
														<button class="btn btn-xs btn-inverse">修改</button>
														<button class="btn btn-xs btn-danger">修改</button>
													</td>
												</tr>
												<tr>
													<td>1</td>
													<td>Mark</td>
													<td>Otto</td>
													<td>@mdo</td>
													<td>@mdo</td>
													<td>@mdo</td>
													<td>@mdo</td>
													<td>
														<button class="btn btn-xs btn-inverse">修改</button>
														<button class="btn btn-xs btn-danger">修改</button>
													</td>
												</tr>
												<tr>
													<td>1</td>
													<td>Mark</td>
													<td>Otto</td>
													<td>@mdo</td>
													<td>@mdo</td>
													<td>@mdo</td>
													<td>@mdo</td>
													<td>
													<!-- 	<button class="btn btn-xs btn-inverse">修改</button>
														<button class="btn btn-xs btn-danger">修改</button> -->
															<button type="button" class="btn btn-xs btn-inverse" data-dismiss="modal">修改</button>
															<button type="button" class="btn btn-xs btn-danger" data-dismiss="modal">删除</button>
													</td>
												</tr>
											</tbody>
										</table>
										<div class="btn-toolbar pull-righ">
											<button class="btn btn-success btn-right" onclick="createNewTable();">新增字段</button>
											<img id="createDatatableWaitImag" style="display:none;" src="../../../img/loaders/4.gif">
										</div>
									</div>
								</div>
							</section>
							<section id="datatablePermissions">
								<div class="box border blue">
									<div class="box-title">
										<h4><i></i>权限设置</h4>
										<div class="tools">
											<a href="javascript:;" class="reload">
												<i class="fa fa-refresh"></i>
											</a>
										</div>
									</div>
									<div class="box-body">
										<div class="form-group">
											<label>名称</label><br>
											<input type="text" class="form-control" id="creatDatatableName" placeholder="请输入名称">
										</div>
										<div class="form-group">
											<label>状态</label>
											<select class="form-control" id="createDataTableStatus">
												<option>使用</option>
												<option>停用</option>
											</select>
										</div>
										<div class="form-group">
											<label>说明:</label> 
											<textarea id="createDataTableInfo" rows="3" cols="5" name="textarea" class="form-control"></textarea>
										</div>

										<button class="btn btn-success" onclick="createNewTable();">提交</button><img id="createDatatableWaitImag" style="display:none;" src="../../../img/loaders/4.gif">
									</div>
								</div>
							</section>
							<section id="datatableAbout">
								<div class="box border blue">
									<div class="box-title">
										<h4><i></i>相关</h4>
										<div class="tools">
											<a href="javascript:;" class="reload">
												<i class="fa fa-refresh"></i>
											</a>
										</div>
									</div>
									<div class="box-body">
										<div class="form-group">
											<label>名称</label><br>
											<input type="text" class="form-control" id="creatDatatableName" placeholder="请输入名称">
										</div>
										<div class="form-group">
											<label>状态</label>
											<select class="form-control" id="createDataTableStatus">
												<option>使用</option>
												<option>停用</option>
											</select>
										</div>
										<div class="form-group">
											<label>说明:</label> 
											<textarea id="createDataTableInfo" rows="3" cols="5" name="textarea" class="form-control"></textarea>
										</div>

										<button class="btn btn-success" onclick="createNewTable();">提交</button><img id="createDatatableWaitImag" style="display:none;" src="../../../img/loaders/4.gif">
									</div>	
								</div>
							</section>
						</div>
					</div>	
				</div>				
			</div>
		</div>
	</section>
	

	<!--/PAGE -->
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY -->
	<script src="../../../js/jquery/jquery-2.0.3.min.js"></script>
	<!-- JQUERY UI-->
	<script src="../../../js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="../../../bootstrap-dist/js/bootstrap.min.js"></script>
	<!-- LESS CSS -->
	<script src="../../../js/lesscss/less-1.4.1.min.js" type="text/javascript"></script>	
	<!-- DATE RANGE PICKER -->
	<script src="../../../js/bootstrap-daterangepicker/moment.min.js"></script>
	<script src="../../../js/bootstrap-daterangepicker/daterangepicker.min.js"></script>
	<!-- SLIMSCROLL -->
	<script type="text/javascript" src="../../../js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="../../../js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"></script>
	<!-- BLOCK UI -->
	<script type="text/javascript" src="../../../js/jQuery-BlockUI/jquery.blockUI.min.js"></script>
	<!-- UNIFORM -->
	<script type="text/javascript" src="../../../js/uniform/jquery.uniform.min.js"></script>
	<!-- BOOTSTRAP WYSIWYG -->
	<script type="text/javascript" src="../../../js/bootstrap-wysiwyg/jquery.hotkeys.min.js"></script>
	<script type="text/javascript" src="../../../js/bootstrap-wysiwyg/bootstrap-wysiwyg.min.js"></script>
	<!-- COOKIE -->
	<script type="text/javascript" src="../../../js/jQuery-Cookie/jquery.cookie.min.js"></script>
	<script type="text/javascript" src="../../../js/datatables/media/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="../../../js/datatables/media/assets/js/datatables.min.js"></script>
	<script type="text/javascript" src="../../../js/datatables/extras/TableTools/media/js/TableTools.min.js"></script>
	<script type="text/javascript" src="../../../js/datatables/extras/TableTools/media/js/ZeroClipboard.min.js"></script>

	<!-- BOOTBOX -->
	<script type="text/javascript" src="../../../js/bootbox/bootbox.min.js"></script>

	<!-- FUELUX TREE -->
	<!-- <script type="text/javascript" src="../../../js/fuelux-tree/fuelux.tree-sampledata.js"></script> -->
	<script type="text/javascript" src="../../../js/fuelux-tree/fuelux.tree.min.js"></script>
	
	<script>
		jQuery(document).ready(function() {		
			// App.setPage("dynamic_table");  //Set current page
			userAccountApp.init(); //Initialise plugins and elements
		});
	</script>

	<!-- /JAVASCRIPTS -->
</body>
</html>
<script type="text/javascript">
	var DataSourceTree = function(options) {
		this._data 	= options.data;
		this._delay = options.delay;
	}

	DataSourceTree.prototype.data = function(options, callback) {
		var self = this;
		var $data = null;

		if(!("name" in options) && !("type" in options)){
			$data = this._data;//the root tree
			callback({ data: $data });
			return;
		}
		else if("type" in options && options.type == "folder") {
			if("additionalParameters" in options && "children" in options.additionalParameters)
				$data = options.additionalParameters.children;
			else $data = {}//no data
		}
		
		if($data != null)//this setTimeout is only for mimicking some random delay
			setTimeout(function(){callback({ data: $data });} , 0);

		//we have used static data here
		//but you can retrieve your data dynamically from a server using ajax call
		//checkout examples/treeview.html and examples/treeview.js for more info
	};



	// var tree_data_3 = {
	// 	'test' : {name: 'test', type: 'folder'},
	// 	'测试' : {name: '测试', type: 'folder'}
	// }
	// tree_data_3['test']['additionalParameters'] = {
	// 	'children' : {
	// 		'field' : {name: '字段设置', type: 'item'},
	// 		'permissions' : {name: '权限设置', type: 'item'},
	// 		'about' : {name: '相关数据', type: 'item'}
	// 	}
	// }
	// tree_data_3['测试']['additionalParameters'] = {
	// 	'children' : {
	// 		'field' : {name: '字段设置', type: 'item'},
	// 		'permissions' : {name: '权限设置', type: 'item'},
	// 		'about' : {name: '<span onclick=\"itemClicked(\'50007445\');\">相关数据</span>', type: 'item'}
	// 	}
	// }



	<%  			
		ArrayList<DatatableStruct> datatables = new ArrayList<DatatableStruct>();
		datatables = Datatable.getAllDatatables();
		out.println("var tree_data_3 = {");
		for(int i=0;i<datatables.size();i++)
		{			
			out.println("\'"+datatables.get(i).getName()+"\' : {name: \'"+datatables.get(i).getName() +"\', type: \'folder\'},");
		}
		out.println("}");
		for(int i=0;i<datatables.size();i++)
		{			
			out.println("tree_data_3[\'"+datatables.get(i).getName()+"\'][\'additionalParameters\'] = {");
			out.println("\'children\' : {");
			out.println("\'field\' : {name: \'<span onclick=\\\"showFieldSection(\\\'"+datatables.get(i).getName()+"\\\');\\\">字段设置</span>\', type: \'item\'},");
			out.println("\'permissions\' : {name: \'<span onclick=\\\"showPermissionsSection(\\\'"+datatables.get(i).getName()+"\\\');\\\">权限设置</span>\', type: \'item\'},");
			out.println("\'about\' : {name: \'<span onclick=\\\"showAboutSection(\\\'"+datatables.get(i).getName()+"\\\');\\\">相关数据</span>\', type: \'item\'}");
			out.println("}}");
		}
	%>			

	var treeDataSource3 = new DataSourceTree({data: tree_data_3});



	function showFieldSection(name)
	{
		console.info("showFieldSection = "+name);
		swapScreen('datatableFiled');
		sendDatatableFieldReq(name);
	}
	function showPermissionsSection(name)
	{
		console.info("showPermissionsSection = "+name);
		swapScreen('datatablePermissions');
	}
	function showAboutSection(name)
	{
		console.info("showAboutSection = "+name);
		swapScreen('datatableAbout');
	}







	var userAccountApp = function () {

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
	/*-----------------------------------------------------------------------------------*/
	/*	Bootbox alerts
	/*-----------------------------------------------------------------------------------*/	
	var message = "<h4>数据表名不能为空!</h4>";
	var handleBootbox = function () {
		$(".userInfoBootbox").click(function(){
			bootbox.dialog({
			message : message,
			title: "错误",
			buttons: {
				success: {
					label: "确定",
					className: "btn-success",
					callback: function() {
					Example.show("great success");
					}
				}
			}
			});
		});		
	}
	var handleTree = function () {
		$('#tree3').admin_tree({
			dataSource: treeDataSource3 ,
			multiSelect:true,
			loadingHTML:'<div class="tree-loading"><i class="fa fa-spinner fa-2x fa-spin"></i></div>',
			'open-icon' : 'fa-minus-square',
			'close-icon' : 'fa-plus-square',
			'selectable' : false,
			'selected-icon' : null,
			'unselected-icon' : null
		});
		//To add font awesome support
		$('.tree').find('[class*="fa-"]').addClass("fa");
	}

	/*-----------------------------------------------------------------------------------*/
	/*	SlimScroll
	/*-----------------------------------------------------------------------------------*/
	var handleSlimScrolls = function () {
        if (!jQuery().slimScroll) {
            return;
        }

        $('.scroller').each(function () {
            $(this).slimScroll({
                size: '7px',
                color: '#a1b2bd',
				height: $(this).attr("data-height"),
                alwaysVisible: ($(this).attr("data-always-visible") == "1" ? true : false),
                railVisible: ($(this).attr("data-rail-visible") == "1" ? true : false),
				railOpacity: 0.1,
                disableFadeOut: true
            });
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
			// handleDataTables();	//Function to display data tables		
			handleBootbox();	
			handleSlimScrolls();
			// handleTimeline();
			handleTree();
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
	function swapScreen(id) {
		console.info("swapScreen = "+id);
		jQuery('.visible').removeClass('visible animated fadeInUp');
		jQuery('#'+id).addClass('visible animated fadeInUp');
	}
</script>

<!-- 提交创建数据表 -->


<script type="text/javascript">
	function checkResultDialog()
	{
		var message = "<h4>数据表名不能为空!</h4>";
		bootbox.dialog({
			message : message,
			title: "错误",
			buttons: {
				success: {
					label: "确定",
					className: "btn-success",
					callback: function() {}
				}
			}
		});
	}

	function createNewTable()
	{
		console.info("creatNewTable");

		var name=document.getElementById("creatDatatableName").value;
		var status=document.getElementById("createDataTableStatus").value;
		var info=document.getElementById("createDataTableInfo").value;

		console.info("name = "+name);
		console.info("status = "+status);
		console.info("info = "+info);
		
		if(!name)
		{
			checkResultDialog();
		}
		else
		{
			sendCreatDatatableRequest(name,status,info);			
			document.getElementById("createDatatableWaitImag").style.display = "";
		}

	}
	var ajax =
	{
		abort : function()
		{
		} //定义一个空的方法, 是为了下面ajax.abort()不报错
	};
	function sendCreatDatatableRequest(name,status,info)
	{
		console.info("get()");
		ajax.abort();
		//每次提交前, 先放弃上一次ajax的提交, 这样就不会同时有多个ajax正在请求, 卡死浏览器
		ajax = $.ajax(
		{
			url : "http://shuohe-tech.imwork.net:8080/iot/business/setCreateNewDataTable.jsp"//请求的url
			,async : false
			,dataType : "jsonp"			
			,jsonp : "callback"//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
			,jsonpCallback : "creatDatatableCallback"
			,data:  { "name": name,"status":status,"info":info}
		});
	}
	function creatDatatableCallback(data)//回调函数
	{
		// console.log(carIndex); //
		var res = jQuery.parseJSON(JSON.stringify(data));
		// console.info("cars="+JSON.stringify(data));
		// console.info(cars.length);
		console.info(res.result);
		console.info(res.info);		

		bootbox.dialog({
			message : "<h4>"+res.info+"</h4>",
			buttons: {
				success: {
					label: "确定",
					className: "btn-success",
					callback: function() {}
				}
			}
		});		
		document.getElementById("createDatatableWaitImag").style.display = "none";
	}
	function sendDatatableFieldReq(table)
	{
		console.info("sendDatatableFieldReq("+table+")");
		ajax.abort();
		//每次提交前, 先放弃上一次ajax的提交, 这样就不会同时有多个ajax正在请求, 卡死浏览器
		ajax = $.ajax(
		{
			url : "http://shuohe-tech.imwork.net:8080/iot/business/getDatatableFiledsByTableName.jsp"//请求的url
			,async : false
			,dataType : "jsonp"			
			,jsonp : "callback"//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
			,jsonpCallback : "datatableFieldCallback"
			,data:  { "tableName": table }
		});
	}
	function datatableFieldCallback(data)
	{
		var fileds = jQuery.parseJSON(JSON.stringify(data));
		// console.info("cars="+JSON.stringify(data));
		// console.info(cars.length);		
		for (var i = 0; i < fileds.length; i++)
		{		
			// carInfo = new Object();
			// carInfo.LicensePlate = cars[i].LicensePlate;
			// carInfo.VinNo = cars[i].VinNo;
			// carInfo.CarId = cars[i].CarId;
			// carInfo.CarTypeName = cars[i].CarTypeName;
			// carInfo.CarBatchName = cars[i].CarBatchName;
			// carInfo.CompanyName = cars[i].CompanyName;
			// carInfo.UserRegionName = cars[i].UserRegionName;
			// carInfo.TerminalCode = cars[i].TerminalCode;
			// carInfoArry.push(carInfo);

			console.info(fileds[i].Field);
			console.info(fileds[i].Type);
			console.info(fileds[i].Collation);
			console.info(fileds[i].Null);
			console.info(fileds[i].Key);
			console.info(fileds[i].Default);
			console.info(fileds[i].Extra);
			console.info(fileds[i].Privileges);
			console.info(fileds[i].Comment);
		}
	}


</script>