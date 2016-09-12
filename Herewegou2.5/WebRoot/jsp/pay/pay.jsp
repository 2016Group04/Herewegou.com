<%@ page language="java" import="java.util.*,com.vo.*,com.vo.OrderForm" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>京东支付-请选择支付方式</title>
<!--	<link rel="stylesheet" type="text/css" href="tijiaodingdan.css"/>-->
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}

body {
	font: 12px/150% Arial, Verdana, "\5b8b\4f53";
	color: #666;
	padding: 0px;
	width: 1349px;
}

ul {
	list-style: none;
}

a {
	color: #666;
	text-decoration: none;
}

a:hover {
	color: red;
}

.yhkList li:hover {
	border-color: red;
}

.top {
	height: 30px;
	background: #F7F7F7; //
	background-color: pink;
	border-bottom: 1px solid #eee;
	padding-left: 18px;
	padding-right: 36px;
}

.center {
	width: 990px;
	height: 100%;
	margin: 0px auto;
}

.top2 {
	height: 30px;
	line-height: 30px;
}

.top2 li {
	float: right;
}

.top2 li a {
	margin: 0px 2px 0px 3px;
}

.div_1 {
	width: 0px;
	border-left: 1px solid #ddd;
	height: 10px;
	display: inline-block;
	margin: 0px 10px;
}
/*收银台*/
.shouyintai {
	height: 58px;
	vertical-position: center;	
}

/*main部分*/
#main {
	width: 1349px;
	height: 350px;
	position: relative;
	background-color: #ecedf2;
	padding-bottom: 50px;
	height: 770px;
}

.main-top {
	height: 70px; //
	background-color: pink;
}

.main-top h3 {
	height: 26px;
	line-height: 26px;
	font: 14px;
	overflow: hidden;
}

.main-top1 {
	padding: 10px 0px 10px 30px;
	float: left;
	width: 640px;
}

.main-top1 p {
	height: 20px;
	line-height: 20px;
}

#top-right {
	width: 190px;
	padding: 10px 125px 10px 0px; //
	background-color: red;
	float: right;
}

.main-top-right1 {
	height: 26px;
	line-height: 26px;
	margin-bottom: 4px;
	text-align: right;
}

.main-top-right1 em {
	vertical-align: bottom;
}

.main-top-right1 strong {
	font-size: 18px;
	vertical-align: bottom;
	color: #ff5d5b;
	margin: 0 3px;
}

.main-top-right2 {
	text-align: right;
	line-height: 20px;
	color: #2ea7e7;
}

.main-top-right2 a {
	display: inline-block;
	padding-right: 15px;
	position: relative;
	*zoom: 1;
	color: #2ea7e7;
}

.main-top-right2 i {
	right: 0;
	top: 3px;
	position: absolute;
	display: block;
	width: 12px;
	height: 12px;
	background: url(../user/img/images2/many.png) -76px -75px no-repeat;
}

.clr {
	display: block;
	overflow: hidden;
	clear: both;
	height: 0;
	line-height: 0;
	font-size: 0;
}

#erweima {
	position: absolute;
	right: 203px;
	top: -30px;
	width: 92px;
	height: 92px;
}

.ewm-img {
	width: 90px;
	height: 90px;
	display: block;
	border: 1px solid #ddd;
	position: absolute;
	left: 0;
	top: 0;
	z-index: 16;
	cursor: default; //
	background: url() center center no-repeat #fff;
}

.ewm-img img {
	width: 90px;
	height: 90px;
}

/*京东支付*/
#payment {
	background-color: #fff;
	padding: 12px 30px 0px;
	height: 550px;
	box-shadow: 0 0 6px rgba(0, 0, 0, .2);
}

#payment {
	position: relative;
}

#jingdonglogo {
	display: block;
	width: 114px;
	height: 35px;
	position: absolute;
	left: -5px;
	top: 20;
	background-image: url(../user/img/images2/jingdong-payment.png);
	float: left;
}

.pay-way {
	margin-left: 100px;
	height: 32px;
	line-height: 32px;
	float: left;
	color: #999;
}

/*白条*/
.baitiao {
	width: 930px;
	margin-top: 45px;
	border-top: 1px solid #ddd;
	height: 54px; //
	background-color: red;
}

.baitiaospan {
	display: block;
	width: 926px;
	margin: 10px 0px;
	height: 32px; //
	background-color: blanchedalmond;
}

.baitiaobox {
	display: inline-block;
	width: 24px;
	height: 22px;
	margin-left: 10px;
	position: relative;
	top: 6px;
	left: 8px;
}

.baitiaobox em {
	display: block;
	width: 24px;
	height: 22px;
	background-image: url(../user/img/images2/many.png);
}

.baitiaobox strong {
	height: 23px;
	width: 70px;
	position: relative;
	vertical-align: middle;
	margin-left: 0;
	padding-left: 10px;
}

.baitiaoimg {
	position: absolute;
	display: block;
	width: 78px;
	height: 30px;
	left: 87px;
	top: 71px;
	background: url(../user/img/images2/baitiao.png) no-repeat;
	overflow: hidden;
	text-indent: -2000px;
}

.ui-icon {
	display: inline-block;
	width: 14px;
	height: 14px;
	background: url(../user/img/images2/many.png) -9999px -9999px no-repeat;
	vertical-align: middle;
	margin-left: 98px;
	background-position: -1px -62px;
}

.jihuo {
	height: 32px;
	line-height: 32px;
	margin-left: 29px;
}

#yinhangka {
	border: 0;
	border: 2px solid #b0c2e1;
	padding: 0;
	border-radius: 2px;
	background-color: #fff;
	height: 380px;
	position: relative;
}

.yhk-top {
	height: 32px;
	margin: 23px 0; //
	background-color: red;
}

.yhkbox {
	display: inline-block;
	width: 24px;
	height: 22px;
}

.yhkbox em {
	display: block;
	width: 24px;
	height: 22px;
	background-image: url(../user/img/images2/many.png);
	background-position: -2px -31px;
	margin-left: 18px;
	margin-top: 2px;
}

.yhk-top strong {
	display: inline-block;
	color: #333;
	margin-left: 28px;
	font-size: 18px;
	font-family: "Microsoft Yahei";
	font-weight: 400;
}

.p-count {
	text-align: right;
	line-height: 26px;
	position: absolute;
	top: 15px;
	right: 17px;
}

.p-count strong {
	font-size: 18px;
	vertical-align: bottom;
	color: #ff5d5b;
	margin: 0 1px;
}

.p-count em {
	vertical-align: bottom;
}

em {
	font-style: normal;
}

#yhk-in {
	border: 1px solid #c6c6c6;
	border-radius: 2px;
	box-shadow: 0 1px 1px 1px #ededed inset;
	vertical-align: middle;
	width: 310px;
	height: 20px;
	position: absolute;
	left: 59px;
	top: 86px;
	padding: 5px 0px;
	padding-left: 10px;
	line-height: 20px;
}

#yhk-in i {
	display: inline-block;
	width: 14px;
	height: 14px;
	background: url(../user/img/images2/many.png) -9999px -9999px no-repeat;
	background-position: -42px -62px;
}

#yhk-in input {
	display: inline-block;
	height: 20px;
	width: 280px;
	border: none;
	font: 12px;
	color: #666;
}

#payway {
	width: 810px;
	height: 34px;
	border-bottom: 1px solid #c6c6c6; //
	background-color: pink;
	position: absolute;
	top: 139px;
	left: 59px;
}

#payway .waydiv1 {
	width: 145px;
	height: 36px;
	border-radius: 3px 3px 0 0;
	background-color: #fff;
	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	border-bottom: none;
	position: relative;
	top: -1px;
}

.waydiv1 a {
	padding-left: 65px;
	padding-top: 8px;
	color: #4D4D4D;
	display: inline-block;
	font-size: 14px;
	height: 35px;
	font-weight: 700;
}

.waydiv1 a i {
	position: absolute;
	top: 12px;
	left: 24px;
	width: 35px;
	height: 14px;
	background: url(../user/img/images2/many.png) -30px -143px no-repeat;
}

.waydiv2 {
	position: relative;
	width: 148px;
	text-align: center;
	left: 157px;
	top: -40px;
	background: #f7f7f7;
	border-radius: 3px 3px 0 0;
}

.waydiv2 a {
	line-height: 34px;
	height: 34px;
	padding: 0 20px;
	border: 1px solid #f7f7f7;
	color: #4D4D4D;
	display: inline-block;
	font-size: 14px;
}

a:hover {
	color: #2ea7e7;
}

#remen {
	width: 970px;
	height: 18px;
	margin-bottom: 18px;
	margin-top: 144px;
	margin-left: 68px;
}

#remen a {
	margin-right: 15px;
	padding: 5px;
	color: #999;
	cursor: pointer;
	text-decoration: none;
}

.yhkList {
	width: 800px;
	height: 168px;
	margin-left: 68px; //
	background-color: pink;
}

.yhkList ul {
	list-style: none;
}

.yhkList li {
	margin-left: 0px;
	float: left;
	display: block;
	padding: 5px 0;
	height: 28px;
	width: 188px;
	margin-right: 10px;
	margin-bottom: 13px;
	cursor: pointer;
	border: 1px solid #b0c2e1;
	border-radius: 2px;
	text-align: center; //
	position: absolute;
	text-align: center;
}

em {
	font-style: normal;
}

#gongshang {
	background-position: 0 -140px;
}

.back-logo {
	background-image: url(../user/img/images2/banks.png);
	background-repeat: no-repeat;
	display: block;
	width: 125px;
	height: 28px;
	overflow: hidden;
	text-indent: -9999px;
	margin-left: 25px;
}

#jianshe {
	background-position: 0 -336px;
}

#zhaoshang {
	background-position: 0 -784px;
}

#nongye {
	background-position: 0 -532px;
}

#jiaotong {
	background-position: 0 -392px;
}

#guangfa {
	background-position: 0 -700px;
}

#zhongguo {
	background-position: 0 -840px;
}

#minsheng {
	background-position: 0 -448px;
}

#huaxia {
	background-position: 0 -308px;
}

#xingye {
	background-position: 0 -756px;
}

#guangda {
	background-position: 0 -168px;
}

#more {
background-position: 0 -896px;
}

#zhifu {
	margin: 0 auto;
	margin-top: 40px;
	width: 220px;
}

#sure {
	cursor: pointer;
	height: 50px;
	line-height: 48px;
	padding: 0;
	font-size: 18px;
	width: 220px;
	font-family: "Microsoft Yahei";
	font-weight: 700;
	background-color: #b61d1d;
	 background: #7a45e5;
    background: -moz-linear-gradient(left,#7a45e5 20%,#b23cef 80%);
    background: -webkit-gradient(linear,left top,right top,color-stop(20%,#7a45e5),color-stop(80%,#b23cef));
    background: -webkit-linear-gradient(left,#7a45e5 20%,#b23cef 80%);
    background: -o-linear-gradient(left,#7a45e5 20%,#b23cef 80%);
    background: -ms-linear-gradient(left,#7a45e5 20%,#b23cef 80%);
    background: linear-gradient(to right,#7a45e5 20%,#b23cef 80%);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#7a45e5', endColorstr='#b23cef', GradientType=1);
	
	text-align: center;
	color: #fff;
	border: 1px solid #B5B5B5;
	border-radius: 5px;
}

#sure.disabled {
	cursor: default;
	background-color: #B5B5B5;
	
}

#zhifu span {
	color: #ff5d5b;
	margin-left: 10px;
	position: relative;
	top: -3px;
}

#otherway {
	background-color: #fff;
	padding: 12px 30px 0;
	box-shadow: 0 0 6px rgba(0, 0, 0, .2);
	height: 110px; //
	background-color: pink;
	margin-top: 88px;
	width: 930px;
	position: relative;
	left: -30px;
}

#otherspan {
	display: block;
	float: left;
	width: 114px;
	height: 35px;
	background: url(../user/img/images2/payotherway.png) no-repeat;
	position: relative;
	left: -32px;
}

.otherspan2 {
	display: inline-block;
	margin-left: -10px;
	margin-top: 8px;
}

.otherway_div {
	height: 57.5px;
	margin-top: 20px;
	margin-left: 20px;
	padding-top: 20px;
}

.otherway_div a {
	display: inline-block;
	color: #5e5e5e;
	font-family: "Microsoft Yahei";
	font-size: 16px;
}

.otherway_div  span {
	display: inline-block;
	height: 13px;
	width: 1px;
	background-color: #666666;
	margin: 0px 10px;
	margin-top: 3px;
}

.item-icon {
	display: inline-block;
	width: 16px;
	height: 18px;
	background: url(../user/img/images2/erweima2.png) 0 -26px no-repeat;
	vertical-align: text-bottom;
	margin-left: 3px;
}

.item-tips {
	font-size: 12px;
	font-style: normal;
	background: #99aecf;
	color: #fff;
	padding: 1px 6px 1px 5px;
	border-radius: 3px;
	margin-left: 4px;
}

#line2 {
	width: 990px;
	height: 1px;
	background-color: #CCCCCC;
	margin: 0px auto;
}

#copys {
	height: 30px;
	margin-top: 25px;
	margin-left: 430px;
	background-color: #ecedf2;
}

#copys span {
	display: inline-block;
	margin: 0px auto;
}

#copys img {
	margin-left: 30px;
	vertical-align: middle;
}

#tucao {
	position: absolute;
	left: 1170px;
	top: 268px;
	width: 50px;
	height: 100px;
}

#tucao a {
	display: inline-block;
	width: 57px;
	height: 150px;
	background: url(../user/img/images2/tucao.png) no-repeat;
}

.pl-i-info {
	border-radius: 2px;
	display: inline-block; //
	width: 60px;
	width: 100%;
	border-right: 1px solid red;
	color: #fff;
	display: none;
	height: 20px;
	line-height: 20px;
	position: relative;
	left: -1px;
	text-align: center;
	background-color: red;
	padding: 0 56px;
	padding-bottom: 5px;
}

#yhkbtn {
	width: 58px;
	height: 34px;
	border: 1px solid lightgray;
	background-color: lightgray;
	border-radius: 3px;
	position: absolute;
	top: 85px;
	left: 390px;
	display: none;
}
</style>
</head>
<body>
	<!--最上面的导航条-->
	<div class="top">
		<div class="center top2">
			<ul>
				<li><a href="#">问题反馈</a></li>
				<li><a href="#">支付帮助</a>
				<div class="div_1"></div></li>
				<li><a href="OrderServlet?action=queryOrder">我的订单</a>
				<div class="div_1"></div></li>
				<li><a href="#">jd_747e10435...</a><a>退出</a>
				<div class="div_1"></div></li>
			</ul>
		</div>
	</div>
	<!--收银台-->
	<div class="shouyintai center">
		<img src="../user/img/images2/shouyintai.png" alt="收银台" />
	</div>

	<div id="main" class="center">
		<div class="center">
			<div class="main-top">
			<%
				OrderForm of = (OrderForm)request.getAttribute("orderForm");
				ClientUser user = (ClientUser)session.getAttribute("user"); 
				double littleprice = of.getTotalPrice()*0.00001;
			%>
				<div class="main-top1">
					<h3>订单提交成功，请您尽快付款！&nbsp;订单号：<%=of.getOrderNumber() %></h3>
					<p>请您在提交订单后24小时内完成支付，否则订单会自动取消。</p>
				</div>

				<div id="top-right">
					<div class="main-top-right1">
						<em style="font-style: normal;">应付金额</em><strong><%=of.getTotalPrice() %></strong><em>元</em>
					</div>
					<div class="main-top-right2">
						<a href="#">订单详情<i></i></a>
					</div>
				</div>
				<div class="o-list j_orderList" id="listPayOrderInfo" style="display: block;">
    <!-- 单笔订单 -->

    <div class="o-list-info">
        <span class="mr10" id="shdz">收货地址：<%=user.getAddress()%></span>
        <span class="mr10" id="shr">收货人：<%=user.getRealName()%></span>
        <span id="mobile"><%=user.getPhoneNumber()%></span>
    </div>
    <div class="o-list-info">
        <span id="spmc">商品名称：乐视（Le）乐2（X620）32GB 原力金 移动联通电信4G手机 双卡双待</span>
    </div>

    <!-- 单笔订单 end -->

</div>
				<div class="clr"></div>
				<div id="erweima">
					<a href="#" class="ewm-img"> <img
						src="../user/img/images2/erweima.png" alt="二维码" />
					</a>
				</div>
			</div>
			<!--京东支付-->
			<div id="payment">
				<div class="payment-logo">
					<span id="jingdonglogo"></span>
				</div>

				<div class="pay-way">以下支付方式由易宝支付提供</div>
				<!--白条-->
				<div class="baitiao"></div>

				<div id="yinhangka">
					<div class="yhk-top">
						<i class="yhkbox"><em></em></i> <strong>选择银行卡</strong>
					</div>

					<div class="p-count">
						<em>支付</em> <strong><%=of.getTotalPrice() %></strong> <em>元</em>
					</div>



					<div class="yhkList">
						<ul>
							<li><span id="gongshang" class="back-logo"
								pd_FrpId="ICBC-NET">工商银行</span></li>
							<li><span id="jianshe" class="back-logo"
								pd_FrpId="CCB-NET">建设银行</span></li>
							<li><span id="zhaoshang" class="back-logo"
								pd_FrpId="CMBCHINA-NET">招商银行</span></li>
							<li><span id="nongye" class="back-logo"
								pd_FrpId="ABC-NET">农业银行</span></li>
							<li><span id="jiaotong" class="back-logo"
								pd_FrpId="BOCO-NET">交通银行</span></li>
							<li><span id="guangfa" class="back-logo"
								pd_FrpId="SDB-NET">深发银行</span></li>
							<li><span id="zhongguo" class="back-logo"
								pd_FrpId="BOC-NET">中国银行</span></li>
							<li><span id="minsheng" class="back-logo"
								pd_FrpId="CMBC-NET">民生银行</span></li>
							<li><span id="huaxia" class="back-logo"
								pd_FrpId="HXB-NET">华夏银行</span></li>
							<li><span id="xingye" class="back-logo"
								pd_FrpId="CIB-NET">兴业银行</span></li>
							<li><span id="guangda" class="back-logo"
								pd_FrpId="CEB-NET">光大银行</span></li>
							<li><span id="more" class="back-logo" pd_FrpId="ECITIC-NET">中信银行</span></li>
						</ul>
					</div>

					<div id="zhifu">
						<input type="submit" id="sure" name="sure" value="立即支付"
							class="disabled" />

					</div>
				</div>
				<!--其他支付方式-->
				<div id="otherway">
					<span id="otherspan"></span> <span class="otherspan2">
						以下支付方式不支持合并支付 </span>
					<div class="otherway_div">
						<a href="#">微信支付</a><span></span> <a href="#">中国移动支付</a><span></span>
						<a href="#">中国银联</a><span></span> <a href="#">外籍内卡</a><span></span>
						<a href="#">预付卡支付</a><span></span> <a href="#">京东钱包扫一扫<i
							class="item-icon"></i></a><i class="item-tips">满减</i>
					</div>
				</div>
			</div>

		</div>
	</div>
	<div style="background-color: #ecedf2">

		<div id="line2"></div>

		<div id="copys">
			<span>Copyright © 2004-2016 京东JD.com 版权所有</span> <img
				src="../user/img/images2/footer.png" 20" width="185">
		</div>
	</div>

	<div id="tucao">
		<a target="_blank" href="#"></a>
	</div>


	<script src="../user/js/jquery-2.1.4.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript">
	$(function() {			
			
			var pd_FrpId;
			$(".yhkList li").click(function(){
				$(".yhkList li").css("border-color", "#b0c2e1");			
				$(this).css("border-color", "red");
				pd_FrpId = $(this).find(".back-logo").attr("pd_FrpId");
				$("#sure").removeClass("disabled");
				
			});
			
			$("#sure").click(function(){
				if(pd_FrpId!=undefined){
					location.assign("../pay/PayServlet?orderid=<%=of.getOrderNumber() %>&money=<%=littleprice%>&pd_FrpId="+pd_FrpId);
				}
			});
			

		});
	</script>
</body>
</html>
