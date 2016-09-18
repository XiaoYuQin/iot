<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>登录界面</title>
<link href="./Wopop_files/style_log.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="./Wopop_files/style.css">
<link rel="stylesheet" type="text/css" href="./Wopop_files/userpanel.css">
<link rel="stylesheet" type="text/css" href="./Wopop_files/jquery.ui.all.css">

</head>



<body class="login" mycollectionplug="bind">
	<div class="login_m">
		<div class="login_logo">
			<img src="./Wopop_files/dlogo.png" width="250" height="100">
		</div>
		<div class="login_boder">
			<form action="login/LoginAction.action">
				<div class="login_padding" id="login_model">

					<h2>用户名</h2>
					<label> <input type="text" name="username" id="username" class="txt_input txt_input2" onfocus="if(value =='Your name'){value =''}" onblur="if (value ==''){value='Your name'}" value="Your name">
					</label>
					<h2>密码</h2>
					<label> <input type="password" name="userpass" id="userpwd" class="txt_input" onfocus="if (value =='******'){value =''}" onblur="if (value ==''){value='******'}" value="******">
					</label>

					<p class="forgot">
						<a id="iforget" href="javascript:void(0);">忘记密码？</a>
					</p>
					<div class="rem_sub">
						<div class="rem_sub_l">
							<input type="checkbox" name="checkbox" id="save_me"> <label for="checkbox">记住我</label>
						</div>
						<label> <input type="submit" class="sub_button" name="button" id="button" value="登录" style="opacity: 0.7;">
						</label> 
						<label> <input class="sub_button" name="button" id="button" value="注册" style="opacity: 0.7;text-align:center;" onClick="signIn()"></label>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div id="forget_model" class="login_padding" style="display:none">
		<br>

		<h1>Forgot password</h1>
		<br>
		<div class="forget_model_h2">(Please enter your registered email below and the system will automatically reset users’ password and send it to user’s registered email address.)</div>
		<label> <input type="text" id="usrmail" class="txt_input txt_input2"></label>


		<div class="rem_sub">
			<div class="rem_sub_l"></div>
			<label> <input type="submit" class="sub_buttons" name="button" id="Retrievenow" value="Retrieve now" style="opacity: 0.7;"> <input type="submit" class="sub_button" name="button" id="denglou" value="Return" style="opacity: 0.7;">

			</label>
		</div>
	</div>




	<script type="text/javascript">
		function signIn() {
			console.log("signIn");
			window.self.location="signUp/signUp.jsp"; 
		}
	</script>

	<!--login_padding  Sign up end-->
	</div>
	<!--login_boder end-->
	</div>
	<!--login_m end-->
	<br>
	<br>
	<!-- 
<p align="center"> More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
 -->

</body>
</html>