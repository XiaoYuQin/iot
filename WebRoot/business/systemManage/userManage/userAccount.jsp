<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%> 
<%@ page import="java.util.*" %> 
<%@ page import="java.util.ArrayList" %> 
<%@ page import="com.shuohe.userManage.*" %> 

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

	<!-- CUSTOM SCRIPT -->
	<!-- <script src="../../../js/script.js"></script> -->
	<!-- <script src="../../../js/inbox.js"></script> -->
	<script>
		jQuery(document).ready(function() {		
			// App.setPage("dynamic_table");  //Set current page
			userAccountApp.init(); //Initialise plugins and elements
		});
	</script>
	
	<!-- /JAVASCRIPTS -->


</head>
<body>
	<div class="row">
		<div class="col-md-12">	
			
			<table id="userdatatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th >账号名</th>
						<th >邮箱</th>
						<th >密码</th>
						<th >注册时间</th>
						<th >状态</th>
						<th >操作</th>
						<!-- <th class="hidden-xs">CSS grade</th> -->
					</tr>
				</thead>
				<tbody>
					<%  			
						ArrayList<User> users = new ArrayList<User>();
						users = UserManager.getAllUsers();
						for(int i=0;i<users.size();i++)
						{							
							out.println("<tr  class=\"gradeX\" onclick=showInfo(\""+users.get(i).getName()+"\"); href=\"#table-modal\" style=\"cursor:pointer;\">");
							out.println("	<td>"+users.get(i).getName()+"</td>");
							out.println("	<td>"+users.get(i).getMail()+"</td>");
							out.println("	<td>******</td>");
							out.println("	<td>"+users.get(i).getSignUpDate()+"</td>");
							
							if(users.get(i).getStatus()== 0)
							{
								out.println("	<td><span class=\"label label-success\">正常</span></td>");		
							}
							else
							{
								out.println("	<td><span class=\"label label-danger\">停用</span></td>");	
							}											
							out.println("	<td>");
							out.println("		<button class=\"btn btn-xs btn-inverse userInfoBootbox onclick=showInfo(\""+users.get(i).getName()+"\");\">修改</button>");
							out.println("		<button class=\"btn btn-xs btn-danger userInfoBootbox\">删除</button>");					
							out.println("	</td>");
							out.println("</tr>");
						}
					%>					
				</tbody>
<!-- 				<tfoot>
					<tr>
						<th>车型</th>
						<th>使用单位</th>
						<th>牌照号</th>
						<th class="hidden-xs">VIN</th>
						<th>设备状态</th>
					</tr>
				</tfoot>		 -->							
			</table>
			<!-- /BOX -->								
		</div>
	</div>
						<!-- /DATA TABLES -->
	<!--/PAGE -->

</body>
</html>
<script type="text/javascript">
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
	var messageString 
		= "<div class='well' style='margin-top:25px;'>	\
				<form class='form-horizontal' role='form'>	\
					<div class='form-group'>	\
						<label class='col-sm-3 control-label no-padding-right' for='txtOldPwd'>旧密码</label>	\
						<div class='col-sm-9'>	\
							<input type='text' id='txtOldPwd' placeholder='请输入旧密码' class='col-xs-10 col-sm-5' />	\
						</div>\
					</div>\
					<div class='space-4'></div>\
					<div class='form-group'>\
						<label class='col-sm-3 control-label no-padding-right' for='txtNewPwd1'>新密码</label>\
						<div class='col-sm-9'>\
							<input type='text' id='txtNewPwd1' placeholder='请输入新密码' class='col-xs-10 col-sm-5' />\
						</div>\
					</div>\
					<div class='space-4'></div>\
						<div class='form-group'>\
							<label class='col-sm-3 control-label no-padding-right' for='txtNewPwd2'>确认新密码</label>\
						<div class='col-sm-9'>\
							<input type='text' id='txtNewPwd2' placeholder='再次输入新密码' class='col-xs-10 col-sm-5' />\
						</div>\
					</div>\
				</form>\
			</div>";
	var message2 = 
	"\
			<form role=\"form\">\
			  <div class=\"form-group\">\
				<label for=\"exampleInputEmail1\">Email address</label>\
				<input type=\"email\" class=\"form-control\" id=\"exampleInputEmail1\" placeholder=\"Enter email\">\
			  </div>\
			  <div class=\"form-group\">\
				<label for=\"exampleInputPassword1\">Password</label>\
				<input type=\"password\" class=\"form-control\" id=\"exampleInputPassword1\" placeholder=\"Password\">\
			  </div>\
			  <div class=\"checkbox\">\
				<label>\
				  <input type=\"checkbox\"> Check me out\
				</label>\
			  </div>\
			  <button type=\"submit\" class=\"btn btn-success\">Submit</button>\
			</form>\
			<div class=\"separator\"></div>\
			<h3 class=\"form-title\">Inline form</h3>\
			<form class=\"form-inline\" role=\"form\">\
			  <div class=\"form-group\">\
				<label class=\"sr-only\" for=\"exampleInputEmail2\">Email address</label>\
				<input type=\"email\" class=\"form-control\" id=\"exampleInputEmail2\" placeholder=\"Enter email\">\
			  </div>\
			  <div class=\"form-group\">\
				<label class=\"sr-only\" for=\"exampleInputPassword2\">Password</label>\
				<input type=\"password\" class=\"form-control\" id=\"exampleInputPassword2\" placeholder=\"Password\">\
			  </div>\
			  <button type=\"submit\" class=\"btn btn-inverse\">Sign in</button>\
			</form>\
			<div class=\"separator\"></div>\
			<h3 class=\"form-title\">Horizontal form</h3>\
			<form class=\"form-horizontal\" role=\"form\">\
			  <div class=\"form-group\">\
				<label for=\"inputEmail3\" class=\"col-sm-2 control-label\">Email</label>\
				<div class=\"col-sm-10\">\
				  <input type=\"email\" class=\"form-control\" id=\"inputEmail3\" placeholder=\"Email\">\
				</div>\
			  </div>\
			  <div class=\"form-group\">\
				<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">Password</label>\
				<div class=\"col-sm-10\">\
				  <input type=\"password\" class=\"form-control\" id=\"inputPassword3\" placeholder=\"Password\">\
				</div>\
			  </div>\
			  <div class=\"form-group\">\
				<div class=\"col-sm-offset-2 col-sm-10\">\
				  <div class=\"checkbox\">\
					<label>\
					  <input type=\"checkbox\"> Remember me\
					</label>\
				  </div>\
				</div>\
			  </div>\
			  <div class=\"form-group\">\
				<div class=\"col-sm-offset-2 col-sm-10\">\
				  <button type=\"submit\" class=\"btn btn-pink\">Sign in</button>\
				</div>\
			  </div>\
			</form>\
		</div>\
	";

	var message3 = 
	"\
		<form role=\"form\">\
			<div class=\"form-group\">\
				<label for=\"userName\">用户名:</label>\
				<!-- <label id=\"userName\">用户名</label> -->\
				<input type=\"text\" disabled = \"true\" class=\"form-control\" id=\"userName\" value=\"王二蛋\">\
			</div>\
			<div class=\"form-group\">\
				<label for=\"password\">密码</label>\
				<input type=\"password\" class=\"form-control\" id=\"password\" placeholder=\"新密码\">\
			</div>\
			<div class=\"form-group\">\
				<label for=\"password2\">再次输入密码</label>\
				<input type=\"password\" class=\"form-control\" id=\"password2\" placeholder=\"再次输入密码\">\
			</div>\
			<div class=\"form-group\">\
				<label for=\"mail\">邮箱</label>\
				<input type=\"password\" class=\"form-control\" id=\"exampleInputPassword1\" placeholder=\"新邮箱地址\">\
			</div>	\
		</form>\
	";

	var handleBootbox = function () {
		$(".userInfoBootbox").click(function(){
			bootbox.dialog({
			message : message3,
			title: "修改用户",
			buttons: {
				success: {
					label: "保存",
					className: "btn-success",
					callback: function() {
					Example.show("great success");
					}
				}
				// danger: {
				// 	label: "Danger!",
				// 	className: "btn-danger",
				// 	callback: function() {
				// 	Example.show("uh oh, look out!");
				// 	}
				// },
				// main: {
				// 	label: "Click ME!",
				// 	className: "btn-primary",
				// 	callback: function() {
				// 	Example.show("Primary button");
				// 	}
				// }
			}
			});
		});		
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
			handleDataTables();	//Function to display data tables		
			handleBootbox();	
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
	function showInfo(item)
	{
		console.info("item = "+item);
		// window.open ('page.html','newwindow','height=100,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')
	}

</script>