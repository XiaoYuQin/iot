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
			<div class="btn-toolbar pull-righ">
				<button class="btn btn-success btn-right userInfoBootbox">新建审批</button>
				<button class="btn btn-success btn-right" onclick="location.reload();">刷新</button>
				<input id="ms7" type="text"/>
			</div>	
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
	var message3 = 
	"\
		<form role=\"form\">\
			<div class=\"form-group\">\
				<label for=\"userName\">发起人</label>\
				<input type=\"text\" disabled = \"true\" class=\"form-control\" id=\"sponsor\" value=\" \">\
			</div>\
			<div class=\"form-group\">\
				<label for=\"userName\">审批人</label>\
			</div>\
			<div class=\"form-group\">\
				<label>事项</label>\
				<textarea class=\"form-control\" rows=\"3\" placeholder=\"请输入待审事项\"></textarea>\
			</div>\
			<div class=\"form-group\">\
				<label for=\"password2\">待审文件</label>\
				<input type=\"text\" class=\"form-control\" id=\"password2\" placeholder=\"请输入\">\
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


	var handleBootbox = function () {
		$(".userInfoBootbox").click(function(){
			bootbox.dialog({
			message : message3,
			title: "文件审批",
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
	function showInfo(item)
	{
		console.info("item = "+item);
		// window.open ('page.html','newwindow','height=100,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')
	}

</script>