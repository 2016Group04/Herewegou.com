<%@ page language="java" import="java.util.*,com.vo.ClientUser" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>HWG(HWG.COM)-综合网购首选-正品低价、品质保障、配送及时、轻松购物！</title>
<link rel="shortcut icon" href="jd-title.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/top.css" />
</head>
<body>

	<%
		ClientUser clientUser = (ClientUser)request.getAttribute("clientUser");
	%>
	
	<style>
		.qmbox a {
			color: #0095dd;
			text-decoration: none !important;
		}
	</style>


	<div itemscope="itemscope" itemtype="https://schema.org/EmailMessage">
		<div itemprop="potentialAction" itemscope="itemscope"
			itemtype="https://schema.org/ViewAction"></div>

	</div>
	<center>
		<table align="center" border="0" cellpadding="0" cellspacing="0"
			height="100%" width="100%" id="bodyTable"
			style="background-color:#F2F2F2;width:100% !important;padding:0;margin:0;height:100% !important;border-collapse:collapse !important;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">
			<tbody>
				<tr>
					<td align="center" valign="top" id="bodyCell"
						style="width:100% !important;padding:50px;margin:0;height:100% !important;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">

						<table border="0" cellpadding="0" cellspacing="0"
							id="templateContainer"
							style="border:1px solid #DDDDDD;border-bottom-color:#CCCCCC;max-width:500px !important;border-collapse:collapse !important;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">
							<tbody>
								<tr>
									<td align="center" valign="top"
										style="mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">

										<table border="0" cellpadding="0" cellspacing="0" width="100%"
											id="templateBody"
											style="border-bottom:1px solid #CCCCCC;border-top:1px solid #FFFFFF;background-color:#FFFFFF;border-collapse:collapse !important;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">
											<tbody>
												<tr>
													<td valign="top" class="bodyContent" mc:edit="body_content"
														style="text-align:center;padding-left:20px;padding-bottom:30px;padding-right:20px;padding-top:30px;line-height:150%;font-size:15px;font-family:Microsoft YaHei;color:#424F59;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">
														<h1
															style="text-align:center;margin-left:0;margin-bottom:10px;margin-right:0;margin-top:0;letter-spacing:normal;line-height:100%;font-weight:normal;font-style:normal;font-size:26px;font-family:Micorsoft jHeng Hei;display:block;color:#424F59 !important;">激活账号</h1>
														<br> <a 
														target="_blank"><div id="mail"><%=clientUser.getMail() %></div>
													</a>，<br>请前往您的邮箱激活您的 HWG商城 账号。
													</td>
												</tr>
												<tr width="100%">
													<td align="center" valign="top"
														style="mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">

														<table border="0" cellpadding="0" cellspacing="0"
															width="100%"
															style="border-collapse:collapse !important;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">
															<tbody>
																<tr height="47">
																	<td align="center" valign="top"
																		style="mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">

																		<table border="0" cellpadding="0" cellspacing="0"
																			width="65%" class="flexibleContainer"
																			style="border-collapse:collapse !important;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">
																			<tbody>
																				<tr>
																					<td align="center" valign="top"
																						class="flexibleContainerCell bottomShim"
																						style="mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">
																						<table border="0" cellpadding="0" cellspacing="0"
																							width="280" class="emailButton"
																							style="border-radius:4px;background-color:#b61d1d;width:100% !important;border-collapse:separate;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">
																							<tbody>
																								<tr>
																									<td align="center" valign="middle"
																										class="buttonContent"
																										style="text-align:center;line-height:100%;font-weight:normal;font-size:20px;font-family:Microsoft YaHei;color:#FFFFFF;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">

																										<a href="#" id="btn_actemail"
																										style="text-decoration:none;font-size:20px;font-family:Microsoft YaHei;display:block;color:#FFFFFF;padding:15px !important;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;"
																										target="_blank">前&nbsp;&nbsp;往&nbsp;&nbsp;激&nbsp;&nbsp;活</a>
																										
																									</td>
																								</tr>
																							</tbody>
																						</table>

																					</td>
																				</tr>
																			</tbody>
																		</table>

																	</td>
																</tr>
															</tbody>
														</table>

													</td>
												</tr>
												<tr>
													<td valign="top" class="bodyContent" mc:edit="body_content"
														style="text-align:center;padding-left:20px;padding-bottom:30px;padding-right:20px;padding-top:30px;line-height:150%;font-size:15px;font-family:Microsoft YaHei;color:#424F59;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">
														暂不激活，去首页逛逛。
													</td>
												</tr>
												<tr width="100%">
													<td align="center" valign="top"
														style="mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">

														<table border="0" cellpadding="0" cellspacing="0"
															width="100%"
															style="border-collapse:collapse !important;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">
															<tbody>
																<tr height="47">
																	<td align="center" valign="top"
																		style="mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">

																		<table border="0" cellpadding="0" cellspacing="0"
																			width="65%" class="flexibleContainer"
																			style="border-collapse:collapse !important;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">
																			<tbody>
																				<tr>
																					<td align="center" valign="top"
																						class="flexibleContainerCell bottomShim"
																						style="mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">
																						<table border="0" cellpadding="0" cellspacing="0"
																							width="280" class="emailButton"
																							style="border-radius:4px;background-color:#b61d1d;width:100% !important;border-collapse:separate;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">
																							<tbody>
																								<tr>
																									<td align="center" valign="middle"
																										class="buttonContent"
																										style="text-align:center;line-height:100%;font-weight:normal;font-size:20px;font-family:Microsoft YaHei;color:#FFFFFF;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">

																										<a href="index.jsp"
																										style="text-decoration:none;font-size:20px;font-family:Microsoft YaHei;display:block;color:#FFFFFF;padding:15px !important;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;"
																										target="_blank">去&nbsp;&nbsp;&nbsp;&nbsp;首&nbsp;&nbsp;&nbsp;&nbsp;页</a>
																										
																									</td>
																								</tr>
																							</tbody>
																						</table>

																					</td>
																				</tr>
																			</tbody>
																		</table>

																	</td>
																</tr>
															</tbody>
														</table>

													</td>
												</tr>
												<tr width="100%">
													<td align="center" valign="top"
														style="mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">

														<table border="0" cellpadding="0" cellspacing="0"
															width="70%"
															style="border-collapse:collapse !important;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">
															<tbody>
																<tr>
																	<td valign="top" class="bodyContent"
																		mc:edit="body_content"
																		style="text-align:center;padding-left:20px;padding-bottom:30px;padding-right:20px;padding-top:30px;font-family:Microsoft YaHei;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;color:#8A9BA8;line-height:13px;font-size:11px;">这是一封自动发送的邮件；如果您并未要求但收到这封信件，您不需要进行任何操作。
																		要了解更多信息，请访问 <a href="https://support.jd.com"
																		target="_blank">HWG 技术支持</a>
																	</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
											</tbody>
										</table>

									</td>
								</tr>
							</tbody>
						</table>

					</td>
				</tr>
			</tbody>
		</table>
	</center>

	
	<style type="text/css">

		.qmbox style,.qmbox script,.qmbox head,.qmbox link,.qmbox meta {

			display: none !important;

		}

	</style>
	
	<script src="js/jquery-3.1.0.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(function() {
			//跳转到指定的邮箱登录页面
            $("#btn_actemail").click(function () {
                var uurl = $("#mail").html();
                //alert(uurl);
                uurl = gotoEmail(uurl);
                
                if (uurl != "") {
                    $("#btn_actemail").attr("href", "http://"+uurl);
                    //$("#btn_actemail")[0].click();
                    //location.assign("http://"+uurl);
                } else {
                    alert("抱歉!未找到对应的邮箱登录地址，请自己登录邮箱查看邮件！");
                }
            });

            //功能：根据用户输入的Email跳转到相应的电子邮箱首页
            function gotoEmail($mail) {
                $t = $mail.split('@')[1];
                $t = $t.toLowerCase();
                if ($t == '163.com') {
                    return 'mail.163.com';
                } else if ($t == 'vip.163.com') {
                    return 'vip.163.com';
                } else if ($t == '126.com') {
                    return 'mail.126.com';
                } else if ($t == 'qq.com' || $t == 'vip.qq.com' || $t == 'foxmail.com') {
                    return 'mail.qq.com';
                } else if ($t == 'gmail.com') {
                    return 'mail.google.com';
                } else if ($t == 'sohu.com') {
                    return 'mail.sohu.com';
                } else if ($t == 'tom.com') {
                    return 'mail.tom.com';
                } else if ($t == 'vip.sina.com') {
                    return 'vip.sina.com';
                } else if ($t == 'sina.com.cn' || $t == 'sina.com') {
                    return 'mail.sina.com.cn';
                } else if ($t == 'tom.com') {
                    return 'mail.tom.com';
                } else if ($t == 'yahoo.com.cn' || $t == 'yahoo.cn') {
                    return 'mail.cn.yahoo.com';
                } else if ($t == 'tom.com') {
                    return 'mail.tom.com';
                } else if ($t == 'yeah.net') {
                    return 'www.yeah.net';
                } else if ($t == '21cn.com') {
                    return 'mail.21cn.com';
                } else if ($t == 'hotmail.com') {
                    return 'www.hotmail.com';
                } else if ($t == 'sogou.com') {
                    return 'mail.sogou.com';
                } else if ($t == '188.com') {
                    return 'www.188.com';
                } else if ($t == '139.com') {
                    return 'mail.10086.cn';
                } else if ($t == '189.cn') {
                    return 'webmail15.189.cn/webmail';
                } else if ($t == 'wo.com.cn') {
                    return 'mail.wo.com.cn/smsmail';
                } else if ($t == '139.com') {
                    return 'mail.10086.cn';
                } else {
                    return '';
                }
            };
           })
	</script>
</body>
</html>
