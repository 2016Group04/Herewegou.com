<%@ page language="java" import="java.util.*,com.vo.Category,com.vo.Category2,com.vo.ClientUser" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

<title>HWG(HWG.COM)-综合网购首选-正品低价、品质保障、配送及时、轻松购物！</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css" href="css/top.css" />
<style type="text/css">
.w {
	height: 100px;
}

#categorys .dd {
	display: block;
}

/*幻灯片广告 开始*/
#focus {
	margin: 0 auto;
	width: 1210px;
	position: relative;
}

#focus .carousel {
	margin: 12px 250px 0 220px;
	width: 730px;
	height: 466px;
}

[role="button"] {
	cursor: pointer;
}

#focus .carousel-control {
	z-index: 4;
	position: absolute;
	bottom: 12px;
	left: 0;
	width: 15%;
	height: 454px;
	font-size: 20px;
	color: #fff;
	text-align: center;
	text-shadow: 0 1px 2px rgba(0, 0, 0, .6);
	background-color: rgba(0, 0, 0, 0);
	filter: alpha(opacity = 50);
	opacity: .5;
}

#focus .carousel-control.left {
	left: 220px;
	background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, .5) 0%,
		rgba(0, 0, 0, .0001) 100%);
	background-image: -o-linear-gradient(left, rgba(0, 0, 0, .5) 0%,
		rgba(0, 0, 0, .0001) 100%);
	background-image: -webkit-gradient(linear, left top, right top, from(rgba(0, 0, 0, .5)),
		to(rgba(0, 0, 0, .0001)));
	background-image: linear-gradient(to right, rgba(0, 0, 0, .5) 0%,
		rgba(0, 0, 0, .0001) 100%);
	filter: progid: DXImageTransform.Microsoft.gradient(startColorstr='#80000000',
		endColorstr='#00000000', GradientType=1);
	background-repeat: repeat-x;
}

#focus .carousel-control.right {
	right: 260px;
	left: auto;
	background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, .0001) 0%,
		rgba(0, 0, 0, .5) 100%);
	background-image: -o-linear-gradient(left, rgba(0, 0, 0, .0001) 0%,
		rgba(0, 0, 0, .5) 100%);
	background-image: -webkit-gradient(linear, left top, right top, from(rgba(0, 0, 0, .0001)),
		to(rgba(0, 0, 0, .5)));
	background-image: linear-gradient(to right, rgba(0, 0, 0, .0001) 0%,
		rgba(0, 0, 0, .5) 100%);
	filter: progid: DXImageTransform.Microsoft.gradient(startColorstr='#00000000',
		endColorstr='#80000000', GradientType=1);
	background-repeat: repeat-x;
}

#focus .carousel-control:hover,#focus .carousel-control:focus {
	color: #fff;
	text-decoration: none;
	filter: alpha(opacity = 90);
	outline: 0;
	opacity: .9;
}

#focus .carousel-control .glyphicon {
	position: absolute;
	width: 30px;
	height: 50px;
	line-height: 50px;
	font-size: 30px;
	top: 50%;
	transform: translateY(-50%);
	-webkit-transform: translateY(-50%);
	display: inline-block;
	background-color: #BBBBBB
}

#focus .carousel-control .glyphicon-chevron-left {
	left: 0;
}

#focus .carousel-control .glyphicon-chevron-right {
	right: 0;
}

#focus .carousel-indicators {
	position: absolute;
	bottom: 20px;
	left: 50%;
	z-index: 4;
	width: 60%;
	padding-left: 0;
	margin-left: -30%;
	text-align: center;
	list-style: none;
}

.carousel-indicators li {
	display: inline-block;
	width: 18px;
	height: 18px;
	margin: 0 2px;
	background: #3e3e3e;
	border-radius: 50%;
	text-align: center;
	color: #fff;
	overflow: hidden;
	cursor: pointer;
}

.carousel-indicators .active {
	background: #b23cef;
	color: #fff;
}

.carousel-inner {
	position: relative;
	width: 100%;
	overflow: hidden;
}

.carousel-inner>.item>img,.carousel-inner>.item>a>img {
	display: block;
	max-width: 100%;
	height: auto;
	line-height: 1;
}

.carousel-inner>.item {
	position: relative;
	display: none;
	-webkit-transition: .6s ease-in-out left;
	-o-transition: .6s ease-in-out left;
	transition: .6s ease-in-out left;
}

@media all and (transform-3d) , ( -webkit-transform-3d ) {
	.carousel-inner>.item {
		-webkit-transition: -webkit-transform .6s ease-in-out;
		-o-transition: -o-transform .6s ease-in-out;
		transition: transform .6s ease-in-out;
		-webkit-backface-visibility: hidden;
		backface-visibility: hidden;
		-webkit-perspective: 1000px;
		perspective: 1000px;
	}
	.carousel-inner>.item.next,.carousel-inner>.item.active.right {
		left: 0;
		-webkit-transform: translate3d(100%, 0, 0);
		transform: translate3d(100%, 0, 0);
	}
	.carousel-inner>.item.prev,.carousel-inner>.item.active.left {
		left: 0;
		-webkit-transform: translate3d(-100%, 0, 0);
		transform: translate3d(-100%, 0, 0);
	}
	.carousel-inner>.item.next.left,.carousel-inner>.item.prev.right,.carousel-inner>.item.active
		{
		left: 0;
		-webkit-transform: translate3d(0, 0, 0);
		transform: translate3d(0, 0, 0);
	}
}

.carousel-inner>.active,.carousel-inner>.next,.carousel-inner>.prev {
	display: block;
}

.carousel-inner>.active {
	left: 0;
}

.carousel-inner>.next,.carousel-inner>.prev {
	position: absolute;
	top: 0;
	width: 100%;
}

.carousel-inner>.next {
	left: 100%;
}

.carousel-inner>.prev {
	left: -100%;
}

.carousel-inner>.next.left,.carousel-inner>.prev.right {
	left: 0;
}

.carousel-inner>.active.left {
	left: -100%;
}

.carousel-inner>.active.right {
	left: 100%;
}
/*幻灯片广告 结束*/
/*幻灯片右侧部分 开始*/
#focus-extra {
	position: relative;
	height: 0;
	z-index: 8;
	top: -478px;
}

#lifeserv,#news {
	position: absolute;
	right: 0;
	padding: 0;
	background: rgba(255, 255, 255, .85);
	filter: progid: DXImageTransform.Microsoft.gradient(startColorstr=#BBFFFFFF,
		endColorstr=#BBFFFFFF)
}

#news .mt {
	padding: 0 15px;
	border-bottom: 1px dotted #E8E8E7;
	height: 43px;
	line-height: 43px
}

#lifeserv h2,#news h2 {
	font-size: 16px
}

#focus-extra .mt .extra {
	float: right;
	font-family: consolas;
}

#focus-extra h2 {
	float: left;
}

.carousel-inner .item img {
	width: 730px;
	height: 454px;
}

h2,h3 {
	font-family: "microsoft yahei";
	font-weight: 400;
}

#news {
	float: right;
	height: 200px;
	width: 248px;
	overflow: hidden;
	top: 12px;
	border: solid 1px #e4e4e4;
	border-bottom: 0
}

#news .mc {
	height: 140px;
	padding: 8px 0 0 15px
}

#news li {
	width: 210px;
	height: 27px;
	line-height: 27px;
	overflow: hidden
}

#news li span {
	font-weight: 700;
	margin-right: 5px
}

#lifeserv {
	top: 213px;
	border: solid 1px #e4e4e4;
	border-top: dashed 1px #e4e4e4;
	overflow: hidden;
	width: 248px
}

#lifeserv .mc {
	height: 208px;
	position: relative
}

#lifeserv ul {
	position: relative;
	width: 260px;
	height: 209px;
	overflow: hidden
}

#lifeserv li {
	_position: relative;
	float: left;
	display: inline;
	width: 62px;
	height: 70px;
	border-right: 1px solid #E8E8E7;
	border-bottom: 1px solid #E8E8E7;
	overflow: hidden;
	cursor: pointer
}

#lifeserv li a {
	display: block;
	width: 62px;
	height: 28px;
	padding-top: 41px;
	line-height: 28px;
	text-align: center;
	text-decoration: none;
	cursor: pointer
}

#lifeserv li a:hover span {
	color: #C81623
}

#lifeserv .ci-left {
	top: 13px;
	left: 18px;
	width: 25px;
	height: 25px;
	background: url(img/lifeserv/57620a6fN77b2b8af.png) no-repeat 0 0;
}

#lifeserv .fore2 .ci-left {
	background-position: 0 -25px;
}

#lifeserv .fore3 .ci-left {
	background-position: 0 -50px;
}

#lifeserv .fore4 .ci-left {
	background-position: 0 -75px;
}

#lifeserv .fore5 .ci-left {
	background-position: 0 -100px;
}

#lifeserv .fore6 .ci-left {
	background-position: 0 -125px;
}

#lifeserv .fore7 .ci-left {
	background-position: 0 -150px;
}

#lifeserv .fore8 .ci-left {
	background-position: 0 -175px;
}

#lifeserv .fore9 .ci-left {
	background-position: 0 -200px;
}

#lifeserv .fore10 .ci-left {
	background-position: 0 -225px;
}

#lifeserv .fore11 .ci-left {
	background-position: 0 -255px;
}

#lifeserv .fore12 .ci-left {
	background-position: 0 -275px;
}

#news .mc li {
	line-height: 24px;
	height: 24px
}

.w #news {
	height: 163px
}

.w #news .mc {
	height: 120px;
	padding-top: 5px
}

.w #news .mt {
	height: 32px;
	line-height: 32px
}

.w #lifeserv {
	top: 176px;
	border-top: solid 1px #e4e4e4
}

#right-pic {
	position: absolute;
	right: 0;
	padding: 0;
	background: rgba(255, 255, 255, .85);
	overflow: hidden;
	width: 250px;
	height: 75px;
	top: 391px;
	filter: progid: DXImageTransform.Microsoft.gradient(startColorstr=#BBFFFFFF,
		endColorstr=#BBFFFFFF)
}
/*幻灯片右侧部分 结束*/
/*今日推荐开始*/
#today {
	margin: 0 auto 20px auto;
	position: relative;
	height: 184px;
	width: 1210px;
}
/*时钟开始*/
#HWG-clock {
	float: left;
	width: 210px;
	height: 151px;
	background: url(img/todays/homebg.png) 0 -136px no-repeat;
}
/*时钟结束*/
/*slider开始*/
#today .slider {
	float: left;
	width: 1000px;
	height: 164px;
}

#today .slider .carousel-inner .item img {
	float: left;
	margin-right: 1px;
	width: 249px;
	height: 164px;
}

#today .slider .carousel-inner .item .noMargin {
	width: 250px;
	margin-right: 0;
}

#today .slider .carousel-inner .carousel-control {
	display: none;
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	-webkit-transform: translateY(-50%);
	height: 40px;
	width: 20px;
	background-color: white;
	opacity: 0.8;
}

#today .slider .carousel-inner:hover .carousel-control {
	display: block;
}

#today .slider .carousel-inner .carousel-control.left {
	left: 0;
}

#today .slider .carousel-inner .carousel-control.right {
	right: 0;
}

#today .slider .carousel-inner .carousel-control .glyphicon {
	width: inherit;
	height: inherit;
	font-size: 28px;
	text-align: center;
	line-height: 40px;
	color: gainsboro;
}
/*slider结束*/
/*今日推荐结束*/
/*最底部 开始*/
#footer {
	padding-bottom: 30px;
	text-align: center;
}

#footer .links a {
	margin: 0 10px;
}

#footer .copyright {
	margin: 10px 0;
}
/*最底部 结束*/
</style>

<style type="text/css">

	

</style>

</head>

<body>
	<!--最顶上的一条开始-->
	<div id="shortcut">
		<div class="w search-bar">
			<ul class="fl">
				<li class="dorpdown" id="ttbar-mycity">
					<div class="dt cw-icon area-text-wrap">
						<i class="ci-right"><s>◇</s></i> 送至： <span class="area-text"
							title="北京">北京</span>
					</div>

					<div class="dd dorpdown-layer">
						<div class="dd-spacer"></div>
						<div class="area-content-wrap">
							<div class="area-content">
								<div class="area-content-list">
									<div class="item">
										<a href="#" class="selected">北京</a>
									</div>
									<div class="item">
										<a href="#">上海</a>
									</div>
									<div class="item">
										<a href="#">天津</a>
									</div>
									<div class="item">
										<a href="#">重庆</a>
									</div>
									<div class="item">
										<a href="#">河北</a>
									</div>
									<div class="item">
										<a href="#">山西</a>
									</div>
									<div class="item">
										<a href="#">河南</a>
									</div>
									<div class="item">
										<a href="#">辽宁</a>
									</div>
									<div class="item">
										<a href="#">吉林</a>
									</div>
									<div class="item">
										<a href="#">黑龙江</a>
									</div>
									<div class="item">
										<a href="#">内蒙古</a>
									</div>
									<div class="item">
										<a href="#">江苏</a>
									</div>
									<div class="item">
										<a href="#">山东</a>
									</div>
									<div class="item">
										<a href="#">安徽</a>
									</div>
									<div class="item">
										<a href="#">浙江</a>
									</div>
									<div class="item">
										<a href="#">福建</a>
									</div>
									<div class="item">
										<a href="#">湖北</a>
									</div>
									<div class="item">
										<a href="#">湖南</a>
									</div>
									<div class="item">
										<a href="#">广东</a>
									</div>
									<div class="item">
										<a href="#">广西</a>
									</div>
									<div class="item">
										<a href="#">江西</a>
									</div>
									<div class="item">
										<a href="#">四川</a>
									</div>
									<div class="item">
										<a href="#">海南</a>
									</div>
									<div class="item">
										<a href="#">贵州</a>
									</div>
									<div class="item">
										<a href="#">云南</a>
									</div>
									<div class="item">
										<a href="#">西藏</a>
									</div>
									<div class="item">
										<a href="#">陕西</a>
									</div>
									<div class="item">
										<a href="#">甘肃</a>
									</div>
									<div class="item">
										<a href="#">青海</a>
									</div>
									<div class="item">
										<a href="#">宁夏</a>
									</div>
									<div class="item">
										<a href="#">新疆</a>
									</div>
									<div class="item">
										<a href="#">台湾</a>
									</div>
									<div class="item">
										<a href="#">香港</a>
									</div>
									<div class="item">
										<a href="#">澳门</a>
									</div>
									<div class="item">
										<a href="#">钓鱼岛</a>
									</div>
									<div class="item">
										<a href="#">海外</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
			<ul class="fr">
				<li class="fore1" id="ttbar-login"><%
							ClientUser user = (ClientUser)session.getAttribute("user");
							if(user!=null){
						%>
								你好,<%=user.getNickname()%>
								<a href="UserServlet?action=logout">退出</a>
						<%
							}else{
						%>
							<a href="javascript:void(0)" onclick="toLoginJsp();return false;" class="link-login">你好，请登录</a>&nbsp;&nbsp;
							<a href="registe.jsp" class="link-regist style-red">免费注册</a>
						<%
							}
						%>
				</li>
				<li class="spacer"></li>
				<li class="fore2">
					<div class="dt">
						<a target="_blank" href="OrderServlet?action=queryOrder">我的订单</a>
					</div>
				</li>
				<li class="spacer"></li>
				<li class="fore3 dorpdown" id="ttbar-myHWG">
					<div class="dt cw-icon">
						<i class="ci-right"><s>◇</s></i> <a target="_blank" href="">我的HWG</a>
					</div>
					<div class="dd dorpdown-layer">
						<div class="dd-spacer"></div>
						<div class="userinfo">
							<div class="u-pic">
								<a href=""><img src="img/top/no-img_mid_.jpg"
									width="60" height="60"></a>
							</div>
							<div class="u-name u-login">
								<a href="" class="link-login">你好，请登录</a>
							</div>
							<div class="u-extra">
								<a href="" target="_blank">优惠券<span id="num-ticket"></span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
								<a href="" target="_blank">消息<span id="num-tip"></span></a>
							</div>
						</div>
						<div class="otherlist">
							<div class="fore1">
								<div class="item">
									<a href="" target="_blank">待处理订单<span
										id="num-unfinishedorder"></span></a>
								</div>
								<div class="item">
									<a href=""  target="_blank">咨询回复<span
										id="num-consultation"></span></a>
								</div>
								<div class="item">
									<a href=""  target="_blank">降价商品<span
										id="num-reduction"></span></a>
								</div>
								<div class="item">
									<a href=""  target="_blank">返修退换货</a>
								</div>
							</div>
							<div class="fore2">
								<div class="item">
									<a href=""  target="_blank">我的关注</a>
								</div>
								<div class="item">
									<a href=""  target="_blank">我的京豆</a>
								</div>
								<div class="item">
									<a href=""  target="_blank">我的理财</a>
								</div>
								<div class="item baitiao">
									<a href="" target="_blank">HWG白条</a>
								</div>
							</div>
						</div>
						<div class="viewlist" style="display:none;">
							<div class="smt">
								<h4>我的足迹</h4>
								<span class="extra"> <a target="_blank" href="">更多&nbsp;&gt;</a>
								</span>
							</div>
							<div class="smc"></div>
						</div>
					</div>
				</li>
				<li class="spacer"></li>
				<li class="fore4">
					<div class="dt">
						<a target="_blank" href="">HWG会员</a>
					</div>
				</li>
				<li class="spacer"></li>
				<li class="fore5">
					<div class="dt">
						<a target="_blank" href="">企业采购</a>
					</div>
				</li>
				<li class="spacer"></li>
				<li class="fore6 dorpdown" id="ttbar-apps">
					<div class="dt cw-icon">
						<i class="ci-left"></i> <i class="ci-right"><s>◇</s></i> <a
							target="_blank" href="">手机HWG</a>
					</div>
					<div class="dd dorpdown-layer">
						<div class="dd-spacer"></div>
						<div class="dd-inner" id="ttbar-apps-main">
							<a href="" class="link link1" target="_blank">HWG客户端</a> <a
								href="" class="link link3" target="_blank">HWG钱包客户端</a> <a
								href="" class="link link4">新人专享188元大礼包</a> <a href=""
								class="link link5">扫一扫封顶立减999元</a> <a href=""
								class="applink HWGapp-ios" target="_blank">HWG客户端ios版</a> <a
								href="" class="applink HWGapp-android" target="_blank">HWG客户端android版</a>
							<a href="" class="applink HWGapp-ipad" target="_blank">HWG客户端ipad版</a>
							<a href="" class="applink wyapp-ios" target="_blank">HWG钱包客户端ios版</a>
							<a href="" class="applink wyapp-android" target="_blank">HWG钱包客户端android版</a>
						</div>
					</div>
				</li>
				<li class="spacer"></li>
				<li class="fore7 dorpdown" id="ttbar-atte">
					<div class="dt cw-icon">
						<i class="ci-right"><s>◇</s></i>关注HWG
					</div>
					<div class="dd dorpdown-layer"></div>
					<div class="dd dorpdown-layer">
						<div class="dd-spacer"></div>
						<div class="dd-inner" id="ttbar-atte-main">
							<img src="img/top/54c84f72Ncc1a02a2.jpg" alt="关注HWG">
						</div>
					</div>
				</li>
				<li class="spacer"></li>
				<li class="fore8 dorpdown" id="ttbar-serv">
					<div class="dt cw-icon">
						<i class="ci-right"><s>◇</s></i>客户服务
					</div>
					<div class="dd dorpdown-layer">
						<div class="dd-spacer"></div>
						<div class="item-client">客户</div>
						<div class="item">
							<a href="" target="_blank" true="">帮助中心</a>
						</div>
						
					</div>
				</li>
				<li class="spacer"></li>
				<li class="fore9 dorpdown" id="ttbar-navs" data-load="1">
					<div class="dt cw-icon">
						<i class="ci-right"><s>◇</s></i>网站导航
					</div>
					<div class="dd dorpdown-layer">
						<div class="dd-spacer"></div>
						<dl class="fore1">
							<dt>特色主题</dt>
							<dd>
								<div class="item">
									<a href="//pinpaijie.HWG.com/" target="_blank">品牌街</a>
								</div>
								
							</dd>
						</dl>
					</div>
				</li>
			</ul>

		</div>

	</div>
	<!--最顶上的一条结束-->

	<!--搜索框部分 开始-->
	<div class="w">
		<div id="logo">
			<a href="" class="logo">HWG</a>
		</div>
		<div id="search">
			<ul id="shelper" class="hide" style="display: none;"></ul>
			<div class="form">
				<input type="text" autocomplete="off" id="key" class="firstpagetext">
				<button onclick="" class="button cw-icon">
					<i></i>搜索
				</button>
			</div>
		</div>
		<div id="settleup" class="dorpdown">
			<div class="cw-icon">
				<i class="ci-left"></i> <i class="ci-right">&gt;</i><i
					class="ci-count" id="shopping-amount">0</i> <a target="_blank"
					href="ShoppingCartServlet?action=goToShoppingCart">我的购物车</a>
			</div>
			<div class="dorpdown-layer">
				<div class="spacer"></div>
				<div id="settleup-content" style="display: none;">
					<span class="loading"></span>
				</div>
				<div class="prompt">
					<div class="nogoods">
						<b></b>购物车中还没有商品，赶紧选购吧！
					</div>
				</div>
			</div>
		</div>
		<div id="hotwords">
			<a href="" target="_blank" class="style-red">9.9团购</a> <a href=""
				target="_blank">领免息券</a> <a href="" target="_blank">3件7折</a> <a
				href="" target="_blank">手机暑促</a> <a href="" target="_blank">100元红包</a>
			<a href="" target="_blank">运动裤</a> <a href="" target="_blank">七夕礼物</a>
			<a href="" target="_blank">0元试用</a> <a href="" target="_blank">卫裤男</a>
		</div>
		<span class="clr"></span>
	</div>
	<!--搜索框部分 结束-->

	<!--导航栏 所有商品分类 开始-->
	<div id="nav">
		<div class="w">
			<div class="w-spacer"></div>

			<div id="categorys" class="dorpdown">
				<div class="dt">
					<a style="cursor: default;">全部商品分类</a>
				</div>
				<div class="dd">
					<div class="dd-inner" id="categorys-dd-inner">
					<%
						Map<Category,List<Category2>> categoryMap = (Map<Category,List<Category2>>)request.getAttribute("categoryMap");
					 	for (Map.Entry<Category,List<Category2>> entry : categoryMap.entrySet()) {
					 		
					%>	
						<div class="item fore1" data-index="1">
							<h3>
								<a><%=entry.getKey().getCname() %></a>
							</h3>
						</div>
						<div class="subitems">
						<%
							for(Category2 category2:entry.getValue()){
								%>
									
										<dt>
											<a href="UserServlet?action=getProductListByPage&cid=<%=category2.getCid() %>&currentPage=1" target="_blank"><%=category2.getCname() %></a>
										</dt>
			
									
								<%
							}
						%>
						</div>
						
					<%
					 	}
					%>
						

					</div>

				</div>
			</div>
			<!--index_ok-->
			<div id="navitems">

				<ul id="navitems-group1">
					<li class="fore1"><a target="_blank" href="">服装城</a></li>
					<li class="fore2"><a target="_blank" href="">美妆馆</a></li>
					<li class="fore3"><a target="_blank" href="">HWG超市</a></li>
					<li class="fore4"><a target="_blank" href="">生鲜</a></li>
				</ul>
				<div class="spacer"></div>
				<ul id="navitems-group2">
					<li class="fore1"><a target="_blank" href="">全球购</a></li>
					<li class="fore2"><a target="_blank" href="">闪购</a></li>
					<li class="fore3"><a target="_blank" href="">团购</a></li>
					<li class="fore4"><a target="_blank" href="">拍卖</a></li>
					<li class="fore5"><a target="_blank" href="">金融</a></li>
				</ul>
			</div>
			<!--index_ok-->

			<div id="treasure"></div>
			<span class="clr"></span>
		</div>
	</div>

	<!--导航栏 所有商品分类 结束-->

	<!--幻灯片广告 开始-->
	<div id="focus">
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<!--标识符:告诉我们页码-->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active">1</li>
				<li data-target="#carousel-example-generic" data-slide-to="1">2</li>
				<li data-target="#carousel-example-generic" data-slide-to="2">3</li>
				<li data-target="#carousel-example-generic" data-slide-to="3">4</li>
				<li data-target="#carousel-example-generic" data-slide-to="4">5</li>
				<li data-target="#carousel-example-generic" data-slide-to="5">6</li>
			</ol>

			<!-- 幻灯片内容 -->
			<div class="carousel-inner" role="listbox">
				

				<div class="item active">
					<img src="img/slider-panel/577dcd6fN496de0fe.jpg">

				</div>

				<div class="item">
					<img src="img/slider-panel/577df78cN881c3185.jpg">

				</div>
				
				<div class="item">
					<img src="img/slider-panel/56444bdeNc7876085.jpg">

				</div>
				
				<div class="item">
					<img src="img/slider-panel/577f0c40N8b775482.jpg">

				</div>
				<div class="item">
					<img src="img/slider-panel/577f4041N1340519c.jpg">

				</div>
				<div class="item">
					<img src="img/slider-panel/577f674cNbb0cd782.jpg">

				</div>
			</div>

			<!-- 控制器: 负责上一页/下一页 -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"><</span>

			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true">></span>

			</a>

		</div>
	</div>

	<!--幻灯片广告 结束-->

	<!--幻灯片右侧部分 开始-->
	<div class="w" id="focus-extra">

		<div id="news" class="m">
			<div class="mt">
				<h2>HWG快报</h2>
				<div class="extra">
					<a target="_blank" href="//headline.HWG.com/"
						clstag="h|keycount|2015|09a">更多 &gt;</a>
				</div>
			</div>
			<div class="mc">
				<ul>

					<li><a target="_blank" href=""><span>[特惠]</span>全球好货清仓特卖，低至1折</a>
					</li>
					<li><a target="_blank" href=""><span>[公告]</span>水灾救援物资网友捐赠通道开启</a>
					</li>
					<li><a target="_blank" href=""><span>[特惠]</span>奢品清仓，低至99元</a>
					</li>
					<li><a target="_blank" href=""><span>[公告]</span>HWG美食地图·地方生鲜馆上线</a>
					</li>
					<li><a target="_blank" href=""><span>[特惠]</span>欧德堡新品上市</a></li>
				</ul>
			</div>
		</div>
		<!--index_ok-->
		<div id="lifeserv" class="m">

			<div class="mc">
				<ul>
					<li class="fore1"><a class="cw-icon" target="_blank" href="">
							<i class="ci-left"></i><span>话费</span>
					</a></li>
					<li class="fore2"><a class="cw-icon" target="_blank" href="">
							<i class="ci-left"></i><span>机票</span>
					</a></li>
					<li class="fore3"><a class="cw-icon" target="_blank" href="">
							<i class="ci-left"></i><span>电影票</span>
					</a></li>
					<li class="fore4"><a class="cw-icon" target="_blank" href="">
							<i class="ci-left"></i><span>游戏</span>
					</a></li>
					<li class="fore5"><a class="cw-icon" target="_blank" href="">
							<i class="ci-left"></i><span>彩票</span>
					</a></li>
					<li class="fore6"><a class="cw-icon" target="_blank" href="">
							<i class="ci-left"></i><span>加油卡</span>
					</a></li>
					<li class="fore7"><a class="cw-icon" target="_blank" href="">
							<i class="ci-left"></i><span>酒店</span>
					</a></li>
					<li class="fore8"><a class="cw-icon" target="_blank" href="">
							<i class="ci-left"></i><span>火车票</span>
					</a></li>
					<li class="fore11"><a class="cw-icon" target="_blank" href="">
							<i class="ci-left"></i><span>众筹</span>
					</a></li>
					<li class="fore9"><a class="cw-icon" target="_blank" href="">
							<i class="ci-left"></i><span>理财</span>
					</a></li>
					<li class="fore12"><a class="cw-icon" target="_blank" href="">
							<i class="ci-left"></i><span>礼品卡</span>
					</a></li>
					<li class="fore10"><a class="cw-icon" target="_blank" href="">
							<i class="ci-left"></i><span>白条</span>
					</a></li>
				</ul>

			</div>
		</div>

		<!--右下广告位 开始-->
		<div id="right-pic" class="m">
			<div class="mc">
				<a href="" target="_blank"><img
					src="img/right-ad-pic/577a25faN8fbae2e6.jpg" alt=""
					width="250" height="75"></a>
			</div>
		</div>
		<!--右下广告位 结束-->
	</div>
	<!--幻灯片右侧部分 结束-->

	<!--今日推荐开始-->

	<div id="today">
		<div id="HWG-clock">
			<div class="clock-s"></div>
			<div class="clock-m"></div>
			<div class="clock-h"></div>
		</div>
		<div class="slider">
			<div id="carousel-example-generic2" class="carousel slide"
				data-ride="carousel">

				<!-- sliser 内容 -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="img/todays/57760935Nf55313c6.jpg"> <img
							src="img/todays/577e1ae3N3afec857.jpg" /> <img
							src="img/todays/577f62c7Ncbde5828.jpg" /> <img
							src="img/todays/5782f337Nb3c40b2f.jpg" />
					</div>

					<div class="item">
						<img src="img/todays/578895a6N3b5219f5.jpg"> <img
							src="img/todays/57846834N9176cc8d.jpg" /> <img
							src="img/todays/57873443Nc0a537cf.jpg" /> <img
							src="img/todays/57884702Nf96c0eb6.jpg" />

					</div>

					<div class="item">
						<img src="img/todays/578895eeN00a8b473.jpg"> <img
							src="img/todays/5788a6d7N1421789a.jpg" /> <img
							src="img/todays/5789cc80N9397b0f9.png" /> <img
							src="img/todays/578d9a07Ne821362b.jpg" />

					</div>

					<!-- 控制器: 负责上一页/下一页 -->
					<a class="left carousel-control" href="#carousel-example-generic2"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"><</span>

					</a> <a class="right carousel-control"
						href="#carousel-example-generic2" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true">></span>

					</a>
				</div>
			</div>
		</div>
	</div>

	<!--今日推荐结束-->

	<!--最底部copyright 开始-->

	<div id="footer">
		<div class="links">
			<a rel="nofollow" ="_blank" href="http://www.HWG.com/intro/about.aspx">
				关于我们 </a> |target <a rel="nofollow" target="_blank"
				href="http://www.HWG.com/contact/"> 联系我们 </a> | <a rel="nofollow"
				target="_blank" href="http://zhaopin.HWG.com/"> 人才招聘 </a> | <a
				rel="nofollow" target="_blank"
				href="http://www.HWG.com/contact/joinin.aspx"> 商家入驻 </a> | <a
				rel="nofollow" target="_blank"
				href="http://www.HWG.com/intro/service.aspx"> 广告服务 </a> | <a
				rel="nofollow" target="_blank" href="http://app.HWG.com/"> 手机HWG </a>
			| <a target="_blank" href="http://club.HWG.com/links.aspx"> 友情链接 </a>
			| <a target="_blank" href="http://media.HWG.com/"> 销售联盟 </a> | <a
				href="//club.HWG.com/" target="_blank"> HWG社区 </a> | <a
				href="//gongyi.HWG.com" target="_blank"> HWG公益 </a> | <a
				target="_blank" href="http://en.HWG.com/"
				>English Site</a>
		</div>
		<div class="copyright">
			Copyright©2004-2016&nbsp;&nbsp;HWG hwg.com&nbsp;版权所有</div>
	</div>

	<!--最底部 结束-->
	<script src="js/jquery-2.1.4.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
			function toLoginJsp(){
				var returnURL = location.href;
				location.assign("UserServlet?action=toLoginJsp&returnURL="+returnURL);
			}
	</script>
</body>

</html>