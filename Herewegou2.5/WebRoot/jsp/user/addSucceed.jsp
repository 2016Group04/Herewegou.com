<%@ page language="java"
	import="java.util.*,com.vo.Category,com.vo.Category2,com.vo.Product,com.vo.ClientUser"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%
	Map<Category,List<Category2>> categoryMap = (Map<Category,List<Category2>>)request.getAttribute("categoryMap");
	
	Product product = (Product)request.getAttribute("product");
%>

<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<tittle></tittle>
<link rel="stylesheet" type="text/css" href="css/top.css" />
<style type="text/css">
.success-wrap {
	background: #f5f5f5;
	height: 145px;
	margin-bottom: 20px;
}

.succeed-box .success-cont {
	display: inline-block;
	display: block;
	font-family: "Microsoft YaHei";
}

.succeed-box .success-lcol {
	float: left;
}

.succeed-box .success-top {
	position: relative;
	padding-left: 35px;
	margin: 20px 0;
}

.succeed-box .success-top .error-icon,.succeed-box .success-top .succ-icon
	{
	background: rgba(0, 0, 0, 0)
		url("//misc.360buyimg.com/user/cart/widget/addtocart-2016/i/addtocart-icons.png")
		no-repeat scroll 0 0;
	display: block;
	height: 25px;
	left: 0;
	overflow: hidden;
	position: absolute;
	top: 0;
	width: 25px;
}

.succeed-box .success-cont {
	font-family: "Microsoft YaHei";
}

.succeed-box .success-top h3 {
	font-size: 18px;
	font-weight: 400;
	line-height: 25px;
}

.ftx-02,.ftx02 {
	color: #71b247;
}

.succeed-box .p-name a {
	color: #333;
}

.succeed-box .p-name {
	font-size: 14px;
	line-height: 28px;
	white-space: nowrap;
}

.succeed-box .p-extra .txt {
	float: left;
	margin-right: 5px;
	max-width: 135px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.succeed-box .p-extra {
	color: #aaa;
}

.succeed-box .btn-tobback {
	background: #fff none repeat scroll 0 0;
	border: 1px solid #fff;
	color: #888;
	margin-right: 10px;
	padding: 0 30px;
}

.succeed-box .btn-addtocart,.succeed-box .btn-tobback,.succeed-box .btn-viewcart
	{
	display: inline-block;
	font-size: 16px;
	height: 34px;
	line-height: 36px;
	vertical-align: middle;
}

.succeed-box .p-img {
	float: left;
	width: 60px;
	margin-right: 10px;
	border: 1px solid #e8e8e8;
}

.succeed-box .success-ad {
	float: right;
	height: 70px;
	width: 106px;
	margin: 10px 0;
}

.clear,.clr {
	display: block;
	overflow: hidden;
	clear: both;
	height: 0;
	line-height: 0;
	font-size: 0;
}

.succeed-box .success-btns {
	font-size: 0;
}

.succeed-box .success-cont {
	font-family: "Microsoft YaHei";
}

.succeed-box .success-btns {
	float: right;
	font-size: 0;
	overflow: hidden;
}

.succeed-box .btn-addtocart {
	 background: #7a45e5;
    background: -moz-linear-gradient(left,#7a45e5 20%,#b23cef 80%);
    background: -webkit-gradient(linear,left top,right top,color-stop(20%,#7a45e5),color-stop(80%,#b23cef));
    background: -webkit-linear-gradient(left,#7a45e5 20%,#b23cef 80%);
    background: -o-linear-gradient(left,#7a45e5 20%,#b23cef 80%);
    background: -ms-linear-gradient(left,#7a45e5 20%,#b23cef 80%);
    background: linear-gradient(to right,#7a45e5 20%,#b23cef 80%);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#7a45e5', endColorstr='#b23cef', GradientType=1);
	
	color: #fff;
	padding-left: 30px;
	position: relative;
	width: 136px;
}

.succeed-box .btn-addtocart,.succeed-box .btn-tobback,.succeed-box .btn-viewcart
	{
	display: inline-block;
	font-size: 16px;
	height: 34px;
	line-height: 36px;
	vertical-align: middle;
}
</style>
</head>

<body>

	<!--最顶上的一条开始-->
	<div id="shortcut">
		<div class="w">
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
				<li class="fore3 dorpdown" id="ttbar-myjd">
					<div class="dt cw-icon">
						<i class="ci-right"><s>◇</s></i> <a target="_blank" href="">我的HWG</a>
					</div>
					<div class="dd dorpdown-layer">
						<div class="dd-spacer"></div>
						<div class="userinfo">
							<div class="u-pic">
								<a href=""><img src="img/top/no-img_mid_.jpg" width="60"
									height="60"></a>
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
									<a href="" target="_blank">咨询回复<span id="num-consultation"></span></a>
								</div>
								<div class="item">
									<a href="" target="_blank">降价商品<span id="num-reduction"></span></a>
								</div>
								<div class="item">
									<a href="" target="_blank">返修退换货</a>
								</div>
							</div>
							<div class="fore2">
								<div class="item">
									<a href="" target="_blank">我的关注</a>
								</div>
								<div class="item">
									<a href="" target="_blank">我的京豆</a>
								</div>
								<div class="item">
									<a href="" target="_blank">我的理财</a>
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
								class="applink jdapp-ios" target="_blank">HWG客户端ios版</a> <a
								href="" class="applink jdapp-android" target="_blank">HWG客户端android版</a>
							<a href="" class="applink jdapp-ipad" target="_blank">HWG客户端ipad版</a>
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
									<a href="//pinpaijie.jd.com/" target="_blank">品牌街</a>
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
	<div class="w search-bar">
		<div id="logo">
			<a href="" class="logo">HWG</a>
		</div>
		<div id="search">
			<ul id="shelper" class="hide" style="display: none;"></ul>
			<div class="form">
				<input type="text" autocomplete="off" id="key" class="text">
				<button onclick="" class="button cw-icon">
					<i></i>搜索
				</button>
			</div>
		</div>
		<div id="settleup" class="dorpdown">
			<div class="cw-icon">
				<i class="ci-left"></i> <i class="ci-right">&gt;</i><i
					class="ci-count" id="shopping-amount">0</i> <a target="_blank"
					href="//cart.jd.com/cart.action">我的购物车</a>
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
							for (Map.Entry<Category,List<Category2>> entry : categoryMap.entrySet()) {
						%>
						<div class="item fore1" data-index="1">
							<h3>
								<a><%=entry.getKey().getCname()%></a>
							</h3>
						</div>
						<div class="subitems">
							<%
								for(Category2 c2:entry.getValue()){
							%>

							<dt>
								<a
									href="UserServlet?action=getProductList&cid=<%=c2.getCid()%>"
									target="_blank"><%=c2.getCname()%></a>
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



	<div class="main">
		<div class="success-wrap">
			<div id="result" class="w">
				<div class="m succeed-box">
					<div class="mc success-cont">
						<div class="success-lcol">
							<div class="success-top">
								<b class="succ-icon"></b>
								<h3 class="ftx-02">商品已成功加入购物车！</h3>
							</div>
							<div class="p-item">
								<div class="p-img">
									<img width="60px" height="60px"
										src="img/productImg/<%=product.getShoppingCartImg()%>"/>
								</div>
								<div class="p-info">
									<div class="p-name">
										<a title="<%=product.getPname()%>"><%=product.getPname()%></a>
									</div>
									<div class="p-extra">
										<span class="txt" title="金色">颜色：<%=product.getColor()%></span> <span class="txt">/
											数量：<%=product.getCountInShoppingCart()%></span>
									</div>
								</div>
								<div class="clr"></div>
							</div>
						</div>
						<div class="success-btns">
							<div class="success-ad">
								<a href="#none"></a>
							</div>
							<div class="clr"></div>
							<div>
								<a class="btn-tobback"
									onclick="window.history.back();return false;" href="#">返回</a> <a
									id="GotoShoppingCart" class="btn-addtocart" href="#"> <b></b>
									去购物车结算
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!--最底部copyright 开始-->

	<div id="footer">
		<div class="links">
			<a rel="nofollow" ="_blank" href="http://www.jd.com/intro/about.aspx">
				关于我们 </a> |target <a rel="nofollow" target="_blank"
				href="http://www.jd.com/contact/"> 联系我们 </a> | <a rel="nofollow"
				target="_blank" href="http://zhaopin.jd.com/"> 人才招聘 </a> | <a
				rel="nofollow" target="_blank"
				href="http://www.jd.com/contact/joinin.aspx"> 商家入驻 </a> | <a
				rel="nofollow" target="_blank"
				href="http://www.jd.com/intro/service.aspx"> 广告服务 </a> | <a
				rel="nofollow" target="_blank" href="http://app.jd.com/"> 手机HWG </a>
			| <a target="_blank" href="http://club.jd.com/links.aspx"> 友情链接 </a>
			| <a target="_blank" href="http://media.jd.com/"> 销售联盟 </a> | <a
				href="//club.jd.com/" target="_blank"> HWG社区 </a> | <a
				href="//gongyi.jd.com" target="_blank"> HWG公益 </a> | <a
				target="_blank" href="http://en.jd.com/"
				>English Site</a>
		</div>
		<div class="copyright">
			Copyright©2004-2016&nbsp;&nbsp;HWG hwg.com&nbsp;版权所有</div>
	</div>

	<!--最底部 结束-->
<script src="js/jquery-2.1.4.js"></script>
		<script src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/jd.js"></script>
		
		

</body>

</html>