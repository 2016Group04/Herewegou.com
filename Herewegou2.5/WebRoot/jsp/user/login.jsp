<%@ page language="java" import="java.util.*,com.vo.ClientUser" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>


</script>
	<head>
		<title>HWG-欢迎登录</title>

		<meta http-equiv="content-type" content="text/html; charset=UTF-8">

		<style type="text/css">
			* {
				margin: 0px;
			}
			
			body {
				font: 12px/150% Arial, Verdana, "宋体";
				/*字体大小12px line-height 行高150%*/
				/*HWG \5b8b\4f53为宋体 可以在线找 unicode 转中文网站翻译一下*/
			}
			
			div.logo {
				height: 80px;
			}
			
			div.middle {
				height: 475px;
				background-color: #df993f;
				position: relative;
			}
			
			div.copyright {
				height: 120px;
				position: relative;
			}
			
			div.logoImage {
				width: 990px;
				height: 60px;
				padding: 10px 0px;
				margin: 0px auto;
			}
			
			img.welcomeLoginClass {
				position: relative;
				left: 17px;
				bottom: 10px;
			}
			
			div.loginMainArea {
				width: 990px;
				height: 475px;
				margin: 0px auto;
				background-image: url("img/imglogin/loginbackground6.jpg");
				background-repeat: no-repeat;
				position: relative;
			}
			
			div.loginDivClass {
				width: 306px;
				height: 317px;
				padding: 20px;
				background-color: #ffffff;
				position: absolute;
				right: 0px;
				top: 40px;
			}
			/*登录第一行开始 放HWG会员 立即注册*/
			
			div.loginDiv1 {
				height: 27px;
				/*background-color:yellow;*/
				position: relative;
			}
			
			div.jdHuiYuan {
				width: 80px;
				height: 27px;
				float: left;
			}
			
			div.registDiv {
				width: 77px;
				height: 18px;
				float: right;
			}
			
			.jdHuiYuan label {
				color: #666;
				height: 30px;
				font-size: 16px;
				font-family: "微软雅黑";
				position: relative;
			}
			
			.registDiv b {
				display: inline-block;
				width: 16px;
				height: 16px;
				overflow: hidden;
				vertical-align: middle;
				background: url(img/imglogin/jiantou.jpg) no-repeat;
				margin-right: 5px;
				position: relative;
				bottom: 1px;
			}
			
			.registDiv a {
				text-decoration: none;
				color: #b61d1d;
				font-size: 14px;
				font-family: "SimSun";
			}
			/*登录第一行结束*/
			/*登录第二行开始 放 公共场所不建议自动登录*/
			
			div.loginDiv2 {
				height: 18px;
				/*宽度可以不设置 默认和父容器一样宽 当然得去掉补白和边框*/
				padding-top: 3px;
				padding-left: 6px;
				padding-bottom: 3px;
				border: 1px solid #ffe57d;
				margin-top: 3px;
				/*和第一行的间距*/
				background-color: #fff6d2;
				color: #666;
				position: relative;
			}
			
			div.loginDiv2 b {
				display: inline-block;
				width: 16px;
				height: 17px;
				overflow: hidden;
				vertical-align: middle;
				background: url(img/imglogin/dengpao.png) no-repeat;
				position: relative;
				bottom: 1px;
				margin-right: 13px;
			}
			/*登录第二行结束*/
			/*登录第三行开始 放用户名和密码框、登录按钮的div*/
			
			div.loginDiv3 {
				height: 252px;
				/*宽度可以不设置 默认和父容器一样宽 当然得去掉补白和边框*/
				margin-top: 9px;
				/*和第二行的间距*/
				/*background-color:#fff6d2;*/
				position: relative;
			}
			
			div.form {
				height: 188px;
				/*background-color:yellow;*/
				margin-bottom: 20px;
			}
			
			div.loginDiv3Fisrt {
				height: 38px;
				/*宽度可以不设置 默认和父容器一样宽 当然得去掉补白和边框*/
				border: 1px solid #bdbdbd;
				margin-bottom: 20px;
				position: relative;
			}
			
			div.usernameTouXiangDiv {
				width: 38px;
				height: 38px;
				float: left;
			}
			
			label.login-label {
				width: 37px;
				height: 38px;
				background: url(img/imglogin/login.png) no-repeat;
				border-right: 1px solid #bdbdbd;
				display: inline-block;
			}
			
			div.usernameInputDiv {
				width: 246px;
				height: 18px;
				padding: 10px 10px;
				background-color: #ffffff;
				float: right;
			}
			
			input.usernameClass {
				line-height: 18px;
				height: 18px;
				border: 0;
				width: 244px;
				float: none;
				overflow: hidden;
				font-size: 14px;
				color: #666;
				font-family: '宋体';
			}
			
			input[name="password"] {
				font-family: Tahoma, Helvetica, Arial;
			}
			
			label.pwd-label {
				background-position: -48px 0;
				/*x轴左移动48px 实现分割图片的效果*/
			}
			/*放自动登录 忘记密码的大div*/
			
			div.loginDiv3Third {
				height: 18px;
				/*background-color:green;*/
				margin-bottom: 16px;
			}
			
			div.autoLoginDiv {
				width: 75px;
				height: 18px;
				float: left;
				position: relative;
			}
			
			div.forgetPwdDiv {
				width: 70px;
				height: 18px;
				float: right;
				position: relative;
			}
			
			input.autoLoginClass {
				position: absolute;
				bottom: 2px;
			}
			
			label.autoLogin {
				font-size: 12px;
				color: #ccc;
				position: absolute;
				left: 18px;
			}
			
			a.forgetPwdLink {
				position: absolute;
				right: 0px;
			}
			
			a:link {
				text-decoration: none;
			}
			
			a:hover {
				text-decoration: underline;
			}
			/*登录按钮的div*/
			
			div.loginButtonDiv {
				height: 33px;
				border: 1px solid #b23cef;
			}
			
			a.btn-img {
				height: 31px;
				width: 302px;
				border: 1px solid #7a45e5;
				line-height: 31px;
				background: #e4393c;
				 background: #7a45e5;
    background: -moz-linear-gradient(left,#7a45e5 20%,#b23cef 80%);
    background: -webkit-gradient(linear,left top,right top,color-stop(20%,#7a45e5),color-stop(80%,#b23cef));
    background: -webkit-linear-gradient(left,#7a45e5 20%,#b23cef 80%);
    background: -o-linear-gradient(left,#7a45e5 20%,#b23cef 80%);
    background: -ms-linear-gradient(left,#7a45e5 20%,#b23cef 80%);
    background: linear-gradient(to right,#7a45e5 20%,#b23cef 80%);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#7a45e5', endColorstr='#b23cef', GradientType=1);
	
				display: block;
				color: #fff;
				font-size: 20px;
				font-family: 'Microsoft YaHei';
				text-align: center;
			}
			
			a[class=btn-img]:hover {
				text-decoration: none;
			}
			/* 使用合作网站账号登录HWG 的div样式*/
			
			div.useHeZuo {
				line-height: 22px;
				height: 44px;
			}
			
			.useHeZuo h5 {
				font-weight: 400;
				color: #999;
				font-size: 12px;
			}
			
			.horizontal-ul {
				list-style: none;
				margin: 0px;
				padding: 0px;
			}
			
			.horizontal-ul li {
				float: left;
			}
			
			.clear {
				clear: both;
			}
			
			.line {
				color: #ccc;
				padding: 0px 10px;
			}
			
			.horizontal-ul li a {
				color: #666;
			}
			
			a.rightMargin {
				margin-right: 3px;
			}
			
			a.rightMargin {
				margin-right: 3px;
			}
			
			div.saoma {
				width: 60px;
				height: 60px;
				background: url(img/imglogin/saoma.png) no-repeat;
				background-position: -60px 0;
				position: absolute;
				right: 0px;
				bottom: 0px;
			}
			
			div.copyrightFirstLine {
				width: 836px;
				margin: 0px auto;
				text-align: center;
				position: relative;
				top: 38px;
			}
			
			label.copyright-label {
				position: relative;
				top: 15px;
				color: #666;
			}
			
			.copyrightFirstLine ul a {
				margin-right: 3px;
			}
			
			.copyrightFirstLine .horizontal-ul li span {
				color: #666;
			}
			/**获取焦点* */
			.form label.name-focus-label{
				background-position: 0 -48px;
				border-right: 1px solid #3aa2e4;
			}
			
			.form label.pass-focus-label{
				background-position: -48px -48px;
				border-right: 1px solid #3aa2e4;
			}
			
			.form label.name-error-label{
				background-position: 0 -96px;
				border-right: 1px solid #e4393c;
			}
			
			.form label.pass-error-label{
				background-position: -48px -96px;
				border-right: 1px solid #e4393c;
			}
			
			
			/**错误提示处理开始**/
			
			div.item-error {
				border: 1px solid #e4393c;
			}
			
			div.item-foucs {
				border: 1px solid #3aa2e4;
			}
			
			div.loginDivError {
				height: 18px;
				/*宽度可以不设置 默认和父容器一样宽 当然得去掉补白和边框*/
				padding-top: 3px;
				padding-left: 6px;
				padding-bottom: 3px;
				border: 1px solid #faccc6;
				margin-top: 3px;
				/*和第一行的间距*/
				background: #ffebeb none repeat scroll 0 0;
				color: #e4393c;
				position: relative;
				display: none;
			}
			
			div.loginDivError b {
				display: inline-block;
				width: 16px;
				height: 17px;
				overflow: hidden;
				vertical-align: middle;
				background: url(img/imglogin/err.png) no-repeat -3px -1px;
				position: relative;
				bottom: 1px;
				margin-right: 13px;
			}
			/**错误提示处理结束**/
		</style>
	</head>

	<body>
		
		<div class="logo">
			<a href="index.jsp">
			<div class="logoImage">
				
				<img src="img/imglogin/jdLogo.png" />
				<img src="img/imglogin/welcomeLogin.png" class="welcomeLoginClass" />
			</div>
			</a>
		</div>
		<div class="middle">
			<!-- 登录主区域 包含大背景 -->
			<div class="loginMainArea">
				<!-- 右边登录小div  -->
				<div class="loginDivClass">
					<!-- 放扫码图片的div-->
					<div class="saoma"></div>

					<!-- 第一行div-->
					<div class="loginDiv1">
						<div class="jdHuiYuan"><label>HWG会员</label></div>

						<div class="registDiv">

							<a href="registe.jsp"><b></b>立即注册</a>
						</div>
					</div>
					<!-- 第二行 放 公共场所不建议自动登录-->
					<div class="loginDiv2">
						<%
							String msg = (String)request.getAttribute("msg");
							if(msg!=null){
						%>
							<b></b> <a href="#" style="color:#666"><%=msg%></a>
							
						<%
														
							}
						%>
								<b></b> 公共场所不建议自动登录，以防账号丢失 
											
					
						
					</div>
					<div class="loginDivError">
						<b></b> 请输入账号和密码
					</div>
					<!-- 第三行 放用户名和密码框、登录按钮  合作账号 div 开始-->
					<div class="loginDiv3">
						<div class="form">						
							<form id="loginForm" action="UserServlet" method="post">
								<input type="hidden" name="action" value="login">
								<!-- 用户名-->
								<div class="loginDiv3Fisrt">
										<!--小人头图标-->
									<div class="usernameTouXiangDiv">
	
										<label for="loginname" class="login-label">
									</div>
								
									<div class="usernameInputDiv">
										<input type="text" name="userAccount" id="usernameId" class="usernameClass" placeholder="邮箱/用户名/已验证手机"/>
									</div>
								
								
								</div>
							
								<!-- 密码-->
								<div class="loginDiv3Fisrt">
									<!--锁头图标-->
									<div class="usernameTouXiangDiv">
										<label for="password" class="login-label pwd-label">
									</div>
									
									<div class="usernameInputDiv">
										<input type="password" name="password"  id="passwordId" class="usernameClass" placeholder="密码"/>
									</div>
									
									
								</div>

							<!-- 自动登录 忘记密码-->
							<div class="loginDiv3Third">
								<div class="autoLoginDiv">
									<input type="checkbox" checked="checked" class="autoLoginClass" name="autoLogin" /><label class="autoLogin">自动登录</label>
									</div>
									<div class="forgetPwdDiv">
										<a href="#" class="forgetPwdLink">忘记密码?</a>
									</div>
								</div>

								<!-- 登录按钮-->
								<div class="loginButtonDiv">
									<a href="#" onclick="checkUser();" class="btn-img">登&nbsp;&nbsp;&nbsp;&nbsp;录
										<a/>
								</div>

							</form>
						</div>

						<!-- 放 使用合作网站账号登录HWG 的 div-->
						<div class="useHeZuo">
							<h5>使用合作网站账号登录HWG：</h5>
							<ul class="horizontal-ul">
								<li>
									<a href="" class="rightMargin">HWG钱包</a><span class="line">|</span></li>
								<li>
									<a href="" class="rightMargin">QQ</a><span class="line">|</span></li>
								<li>
									<a href="" class="rightMargin">微信</a>
								</li>
							</ul>

							<br class="clear" />
						</div>

					</div>
					<!-- 第三行 放用户名和密码框、登录按钮 合作账号 div 结束-->

				</div>
			</div>
		</div>
		<div class="copyright">
			<div class="copyrightFirstLine">

				<ul class="horizontal-ul">
					<li>
						<a href="">关于我们</a><span class="line">|</span></li>
					<li>
						<a href="">联系我们</a><span class="line">|</span></li>
					<li>
						<a href="">人才招聘</a><span class="line">|</span></li>
					<li>
						<a href="">商家入驻</a><span class="line">|</span></li>
					<li>
						<a href="">广告服务</a><span class="line">|</span></li>
					<li>
						<a href="">手机HWG</a><span class="line">|</span></li>
					<li>
						<a href="">友情链接</a><span class="line">|</span></li>
					<li>
						<a href="">销售联盟</a><span class="line">|</span></li>
					<li>
						<a href="">HWG社区</a><span class="line">|</span></li>
					<li>
						<a href="">HWG公益</a><span class="line">|</span></li>
					<li>
						<a href="">English Site</a>
					</li>
				</ul>

				<label class="copyright-label">Copyright&copy;2004-2016  蓝桥.四组.com 版权所有</label>
				
			</div>
		</div>
		<script src="js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
		
			
		
			var errors = [
				"请输入账户名和密码",
				"请输入密码",
				"请输入账户名"
			];
			
			var $username;
			var $password;
			var $objArr;
			var $errorDiv=$("div.loginDivError");
			var $normalDiv=$("div.loginDiv2");
			/*
			 label.pwd-label {
				background-position: -48px 0;
			}*/
				/*x轴左移动48px 实现分割图片的效果*/
			
			
			$(function() {
				
				
				
				$username = $("#usernameId");
				$password = $("#passwordId");
				$objArr = $("div.loginDiv3Fisrt");

				console.info($objArr)
				
				$username.focus(function() {
					$($objArr[0]).addClass("item-foucs");
					$($objArr[0]).removeClass("item-error");
					$($objArr[0]).find("label").removeClass("name-error-label");
					$($objArr[0]).find("label").addClass("name-focus-label");
					
				});
				$username.blur(function() {
					$($objArr[0]).removeClass("item-foucs");
					$($objArr[0]).find("label").removeClass("name-focus-label");
				});
				$password.focus(function() {
					$($objArr[1]).removeClass("item-error");$($objArr[0]).removeClass("item-error");
					$($objArr[1]).find("label").removeClass("pass-error-label");
					$($objArr[1]).addClass("item-foucs");
					$($objArr[1]).find("label").addClass("pass-focus-label");
				});
				$password.blur(function() {
					$($objArr[1]).removeClass("item-foucs");
					$($objArr[1]).find("label").removeClass("pass-focus-label");
				});
				$password.focus(function() {
					$($objArr[2]).removeClass("item-error");$($objArr[0]).removeClass("item-error");
					$($objArr[2]).find("label").removeClass("pass-error-label");
					$($objArr[2]).addClass("item-foucs");
				
					$($objArr[2]).find("label").addClass("pass-focus-label");
				});
				$password.blur(function() {
					$($objArr[2]).removeClass("item-foucs");
					$($objArr[2]).find("label").removeClass("pass-focus-label");
				}); 

			});
			
			function checkUser() {
				
				var username=trim($username.val());
				var password=trim($password.val());
				var flag = true;
				if(username== ""&&password== "") {
						$errorDiv.text("");
						$errorDiv.append("<b><b/>");
						$errorDiv.append(errors[0]);
						$normalDiv.hide();
						$errorDiv.show();
						$($objArr[0]).addClass("item-error");
						$($objArr[0]).find("label").addClass("name-error-label");
						$($objArr[1]).addClass("item-error");
						$($objArr[1]).find("label").addClass("pass-error-label");
						flag = false;
				}
				
				if(password!= ""&&username== "") {
					$errorDiv.text("");
					$errorDiv.append("<b><b/>");
					$errorDiv.append(errors[2]);
					$normalDiv.hide();
					$errorDiv.show();
					$($objArr[2]).addClass("item-error");
					$($objArr[2]).find("label").addClass("pass-error-label");
					flag = false;
				}
				
				if(password== "" && username!="") {
						$errorDiv.text("");
						$errorDiv.append("<b><b/>");
						$errorDiv.append(errors[1]);
						$normalDiv.hide();
						$errorDiv.show();
						$($objArr[1]).addClass("item-error");
						$($objArr[1]).find("label").addClass("pass-error-label");
						flag = false;
				}
				
				if(flag){
					//提交表单
                  $("#loginForm").submit();
					/* $.ajax({
			  			type: "POST",
			 			url: "UserServlet?action=login",
						data:{'username':$("#usernameId").val(),
							'password':$("#passwordId").val()},//用json对象保存提交的数据
			 			dateType: "json",//服务器输出的数据的类型,默认html			
			  			success:function(loginscceed){
			  				if(loginscceed[0].loginscceed=="true"){
			  					window.history.back();
			  				}
			  						
  							}
 						});	 */
 						
					
				}
			}

			function trim(txt) {
				var afterTrimTxt = txt.replace(/^\s*/, "").replace(/\s*$/, "");
				return afterTrimTxt;
			}
		</script>
	</body>

</html>