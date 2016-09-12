<%@ page language="java" import="java.util.*,com.vo.Category,com.vo.Category2,com.vo.Product,com.page.PageInfo,com.vo.ClientUser"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%
	Map<Category,List<Category2>> categoryMap = (Map<Category,List<Category2>>)request.getAttribute("categoryMap");
	Product product = (Product)request.getAttribute("product");	
	Category category = (Category)request.getAttribute("category");
	Category2 category2 = (Category2)request.getAttribute("category2");
	
%>


	<head>
		<meta charset="UTF-8">
		<title>商品详情页</title>
		<link rel="shortcut icon" href="jd-title.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/top.css" />
		<link rel="stylesheet" type="text/css" href="css/detail.css" />
		<link rel="stylesheet" type="text/css" href="css/pinglu.css" />		
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
				<li class="fore1" id="ttbar-login">
                  <%
							ClientUser user = (ClientUser)session.getAttribute("user");
							if(user!=null){
						%>
								你好,<%=user.getNickname()%>
								<a href="UserServlet?action=logout">退出</a>
						<%
							}else{
					%>
						<a href="javascript:void(0)" onclick="toLoginJsp();return false;" class="link-login">你好，请登录</a>&nbsp;&nbsp; 
						<!-- <a href="login.jsp"  class="link-login">你好，请登录</a>&nbsp;&nbsp;  -->
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
				<input style="height:24px" type="text" autocomplete="off" id="key" class="text">
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


		<!--商品详情开始-->
		<div class="container">
			<!--店铺头部开始-->
			<div id="shop-head">

				<div class="fn-clear-word">

					<div class="menu">

						<ul class="menu-list">
							<li>
								<a href="#">首页</a>
							</li>
							<li>
								<a href="#">全部分类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
							</li>
							<li>
								<a href="#">vivo X7Plus大屏来袭</a>
							</li>
							<li>
								<a href="#">所有手机</a>
							</li>
							<li>
								<a href="#">配件专区</a>
							</li>
							<li>
								<a href="#">白条分期购</a>
							</li>
							<li>
								<a href="#">品牌故事</a>
							</li>
							<li>
								<a href="#">店铺服务</a>
							</li>
							<li>
								<a href="#">vivo圈子</a>
							</li>
						</ul>

					</div>

				</div>
			</div>

			<div id="crum-wrap">

				<div class="w">

					<div class="crum-fl">

						<div class="item-first">
							<a href="#"><%=category.getCname()%></a>
						</div>
						<div class="item-sep">〉</div>
						<div class="item">
							<a href="#"><%=category2.getCname()%></a>
						</div>
						<div class="item-sep">〉</div>						
						
						<div class="item-ellipsis"><%=product.getPname() %></div>

					</div>

					<div class="contact-fr">
						<div class="item">
							<a href="UserServlet?action=queryProductWithCondition&condition=<%=product.getDianpuName()%>"><%=product.getDianpuName()%></a>
						</div>
						<div class="item">
							<a href="#">
								<div class="heartred"></div>9.75 ∨</a>
						</div>
						<div class="item">
							<a href="#">
								<div class="pop-im"></div>联系卖家</a>
						</div>
						<div class="item">
							<a href="#">
								<div class="jimi"></div>JIMI</a>
						</div>
						<div class="item">
							<a href="#">
								<div class="follow-shop"></div>关注店铺</a>
						</div>
					</div>

				</div>

			</div>

			<!--店铺头部结束-->
			<!--选择购买开始-->

			<div id="w3">

				<div class="preview-wrap">

					<div class="main-img">
						<img width="452px" height="452px" src="img/productImg/<%=product.getDetailLargeImg()%>" />
					</div>

					<div class="spec-list">

						<a href="#" id="spec-forward"></a>

						<div class="spec-item">

							<ul>
								<%									
									if(product.getDetailSmallImg1()!=null){
										%>
										<li class="img-hover"><img src="img/productImg/<%=product.getDetailSmallImg1()%>" /></li>
										<%
									}
									
									if(product.getDetailSmallImg2()!=null){
										%>
										<li class="img-hover"><img src="img/productImg/<%=product.getDetailSmallImg2()%>" /></li>
										<%
									}
									if(product.getDetailSmallImg3()!=null){
										%>
										<li class="img-hover"><img src="img/productImg/<%=product.getDetailSmallImg3()%>" /></li>
										<%
									}
									if(product.getDetailSmallImg4()!=null){
										%>
										<li class="img-hover"><img src="img/productImg/<%=product.getDetailSmallImg4()%>" /></li>
										<%
									}
									if(product.getDetailSmallImg5()!=null){
										%>
										<li class="img-hover"><img src="img/productImg/<%=product.getDetailSmallImg5()%>" /></li>
										<%
									}
									
								%>
							</ul>

						</div>

						<a href="#" id="spec-backward"></a>

					</div>

					<div class="preview-Info">

						<div class="sku">
							商品编号
							<span id=""><%=product.getPid() %></span>
						</div>

						<div class="btns">
							<a href="#" class="follow"><i class="sprite-follow-sku"></i>关注</a>
							<a href="#"><i class="sprite-share"></i>分享</a>
							<a href="#"><i class="sprite-compare"></i>对比</a>
						</div>

					</div>

				</div>

				<div class="itemInfo-wrap">

					<div class="sku-name">
						<%=product.getPname() %>
					</div>

					<div class="news">
						<a href="#"><%=product.getPdesc() %></a>
					</div>

					<div class="summary">

						<div class="summary-wrap">

							<div class="summary-price">

								<div class="dt">京 东 价</div>

								<div class="dd">

									<span class="p-price">
                                	<span>￥</span>
									<span class="price J-p-10429992152"><%=product.getPrice() %></span>
									</span>

									<a class="notice J-notify-sale" href="#">降价通知</a>

									<div class="summary-Info">
										累计评价
										<a href="#"><%=product.getPingjiaSum()%></a>
									</div>

								</div>

							</div>

							<div class="summary-cuoxiao">

								<div class="cx">促 &nbsp; 销</div>

								<div class="gift">赠品</div>

								<div class="gift-1">
									<div>× 1</div>
								</div>

								<div class="gift-2">
									<div>× 1</div>
								</div>

								<div class="gift-limit">
									(赠完为止)
								</div>

							</div>

							<div class="summary-quan">

								<div class="dt">领　　券</div>

								<div class="quan-item">
									500-20
								</div>

							</div>

						</div>

					</div>

					<div class="chosse-wrap">

						<div class="summary-stock">

							<div class="dt">配 送 至</div>

							<div class="dd">

								<div class="clearfix">

									<div class="store-address">
										北京朝阳区三环以内 ∨
									</div>

									<div class="store-prompt">
										<strong>有货</strong>
									</div>

									<div class="support">
										支持
									</div>

									<div class="icon-list">
										<div>
											<a href="#">99元免运费</a>
										</div>
										<div>
											<a href="#">货到付款</a>
										</div>
										<div>
											<a href="#">夜间配 ∨</a>
										</div>
									</div>

								</div>

								<div class="service">
									由 HWG 发货，并提供售后服务。15:00前完成下单,可预约今晚送达
								</div>

							</div>

						</div>

						<div class="choose-color">

							<div class="dt">选择颜色</div>

							<div class="clearfix" >

								<div class="item1 select item">
									<img src="img/small577b554bN0f417f78.png" />
									<div>金色</div>
								</div>

								<div class="item2 item">
									<img src="img/small577b5523N9b7a646d.png" />
									<div>玫瑰金</div>
								</div>

							</div>

						</div>

						

						<div class="baitiao">

							<div class="dt">白条分期</div>

							<div class="dd">

								<div class="item-list select item">
									16G
								</div>

								<div class="item-list notselected item">
									32G
								</div>

								<div class="item-list  notselected item">
									64G
								</div>

								<div class="item-list  notselected item">
									128G
								</div>

							</div>

						</div>

						<div class="choose-btn">

							<div class="choose-amount">

								<input type="text" class="buy-number" id="buynumber" value="1" />
								<input type="button" class="btn-add" value="+" />
								<input type="button" class="btn-reduce" value="-" />

							</div>

							<div class="shoppingcar">加入购物车</div>

						</div>

						<div class="local-tips">

							<div class="dt">本地活动</div>

							<div class="dd">
								<ul>
									<li>
										<a href="#">10元抢10G流量</a>
									</li>
								</ul>
							</div>

						</div>

						<div class="summary-tips">

							<div class="dst">温馨提示</div>

							<div class="dtishi">
								<ul>
									<li>
										<a href="#">10元抢10G流量</a>
									</li>
								</ul>
							</div>

						</div>

					</div>

				</div>

			</div>

			<!--选择购买结束-->

			<!--商品参数 评论 开始-->

			<!--商品参数 评论 结束-->
		</div>
		<!--商品详情结束-->
		
				<div id="pinglun" class="w">
			<div class="aside">
				<!--左上角的店铺信息-->
				<div id="popbox" class="popbox">
					<div class="shopName">
						<h3><a href=""><%=product.getDianpuName() %></a></h3>
					</div>
					<div class="score">

						<div class="scoreForShop">
							<a href="">
								<div class="score-sum">
									<span class="number">9.75</span>
								</div>

								<div class="score-parts">
									<div class="score-part">
										<span class="score-desc">商品评价</span>
										<span class="score-detail"><em title="9.76分" class="number">9.76</em></span>
										<span class="score-trend"><i class="sprite-up"></i></span>
									</div>
									<div class="score-part">
										<span class="score-desc">服务态度</span>
										<span class="score-detail"><em title="9.68分" class="number">9.68</em></span>
									</div>
									<div class="score-part">
										<span class="score-desc">物流速度</span>
										<span class="score-detail"><em title="9.76分" class="number">9.76</em></span>
									</div>
								</div>
							</a>
						</div>
						<div class="btns">
							<a class="btn2" href=""><i class="sprite-enter"></i><span>进店逛逛</span></a>
							<a class="btn2" href=""><i class="sprite-follow"></i><span>关注店铺</span></a>
						</div>
					</div>
				</div>
				<div id="search" class="search">
					<div class="shopName">
						<h3>店内搜索</h3>
					</div>
					<div class="mc">
						<p class="item1"><label for="keyword">关键字：</label><span><input type="text" id="keyword" ></span></p>
						<p class="item2"><label for="price">价　格：</label><span><input type="text" id="price"> 到 <input type="text" id="price1""></span></p>
						<p class="item3"><label for="">　　　</label><span><input type="submit" value="搜索" id="btnShopSearch"></span></p>
					</div>
				</div>

				<div id="category" class="category">
					<div class="shopName">
						<h3>店内分类</h3>
					</div>
					<div class="no-padding">
						<dl class="divdl">
							<dt class=""><s class="picture1" id="s1"></s><a href="#" >手机专区</a></dt>
							<div class="hideDiv1">
								<dd>
									<a href="#">X系列</a>
								</dd>
								<dd>
									<a href="#">Y系列</a>
								</dd>
								<dd>
									<a href="#">V系列</a>
								</dd>
								<dd>
									<a href="#">Xplay系列</a>
								</dd>
								<dd>
									<a href="#">Xshot系列</a>
								</dd>
							</div>

						</dl>
						<dl class="divdl">
							<dt class=""><s class="picture1" id="s2"></s><a href="#">网络制式</a></dt>
							<div class="hideDiv2">
								<dd>
									<a href="#">移动4G</a>
								</dd>
								<dd>
									<a href="#">联通4G</a>
								</dd>
								<dd>
									<a href="#">电信4G</a>
								</dd>
								<dd>
									<a href="#">移动联通4G</a>
								</dd>
								<dd>
									<a href="#">移动联通电信4G</a>
								</dd>
							</div>

						</dl>
						<dl class=" sp-single">
							<dt class="open"><s class="picture1"></s><a href="#">配件专区</a></dt>
						</dl>
					</div>
				</div>

			</div>
			<div class="detail">
				<div id="detail" class="ETab">
					<div class="tabMain">
						<ul>
							<li class="selected">商品介绍</li>
							<li>规格与包装</li>
							<li>售后保障</li>
							<li>商品评价(<%=product.getPingjiaSum() %>)</li>
							<li>手机社区 <sup>new<b>◤</b></sup> </li>
						</ul>
						<div class="extra">
							<div class="buy">
								<div class="inner">
									<span class="icon-qr"></span>
									<span class="text">扫一扫下单</span>
									<span class="arr-close"></span>
								</div>
								
							</div>
							<div class="shopCar">
								<div class="inner">
									<div class="head">
										<a class="btn-primary" href="">加入购物车</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tabCon">
						<div class="parameter">
							<ul class="parameter1-list">
								<li class="fore0">
									<i class="i-phone"></i>
									<div class="fDetail">
										<p class="fenBianLv">分辨率：1920*1080(FHD)</p>
									</div>
								</li>
								<li class="fore0">
									<i class="i-camera"></i>
									<div class="fDetail">
										<p>后置摄像头：1300万像素</p>
										<p>前置摄像头：1600万像素</p>
									</div>
								</li>
								<li class="fore0">
									<i class="i-cpu"></i>
									<div class="fDetail">
										<p>核&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数：八核</p>
									</div>
								</li>

							</ul>
							<ul id="parameter-brand" class="parameter-list">
								<li title="vivo">品牌：
									<a href="#" target="_blank">vivo</a>
									<a href="#" class="btn-def"><b>♥</b>关注</a>
								</li>
							</ul>
							<ul class=" parameter2-list">
								<li>商品名称：vivo X7 全网通 4GB+64GB 移动联通电信4G手机 双卡双待 金色</li>
								<li>商品编号：10429992152</li>
								<li>店铺：
									<a href="#" target="_blank">vivo官方旗舰店</a>
								</li>
								<li>商品毛重：0.55kg</li>
								<li>系统：安卓（Android）</li>
								<li>运行内存：4GB</li>
								<li>购买方式：其他</li>
								<li>热点：骁龙芯片，双卡双待，指纹识别，金属机身，拍照神器</li>
								<li>像素：1000-1600万</li>
								<li>机身内存：64GB</li>
								<li>机身颜色：金色</li>
							</ul>
							<p class="more-par">
								<a href="#" class="J-more-param">更多参数</a>
							</p>
							<div id="img" class="img">
								<img src="img/1.jpg" width="990" height="665">
							</div>
						</div>
						<div class="hide" id="guiGe">规格与包装</div>
						<div class="hide" id="shouHou">售后</div>
						<div class="hide" id="pingJia">商品评价</div>
						<div class="hide" id="sheQu">手机社区</div>
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
			Copyright©2004-2016&nbsp;&nbsp;HWG Herewego.com&nbsp;版权所有</div>
	</div>

	<!--最底部 结束-->

		<script src="js/jquery-2.1.4.js"></script>
		<script src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/jd.js"></script>
		<script type="text/javascript">
			$(function(){
				
				<%-- if(<%=product.getProductSum()%><=0){
					$("div.clearfix").children().removeClass("item select").addClass("notselected").addClass("fail notselected");
					
					
					
					$("div.dd").children(".item").removeClass("select").addClass("notselected").addClass("fail notselected");
					
				} --%>
				
				$(".shoppingcar").click(function(){
					var count = $(".choose-amount input:text").val();
					var color = $(".choose-color .clearfix").find(".select").find("div").text();
					var pid = <%=product.getPid()%> ;
					if(count>0){
						location.assign("ShoppingCartServlet?action=addToShoppingCart&pid="+ pid +"&count="+count+"&color="+color);
					}else{
						$(".choose-amount input:text").val(1);
					}
					
				});
				
				$("div.clearfix").children().click(function(){
				
					$(this).removeClass("notselected").addClass("select");
					$(this).siblings().removeClass("select").addClass("notselected");
					
				});
				
				$("div.dd").children().click(function(){
			
					$(this).removeClass("notselected").addClass("select");
					$(this).siblings().removeClass("select").addClass("notselected");
			
					
				});
				
				$("input.btn-add").click(function(){
				
					var value = $("input#buynumber").val();
					if(value<<%=product.getProductSum()%>){
						$("input#buynumber").val(eval(value+"+1"));
					}
				});
				
				$("input.btn-reduce").click(function(){
					var value = $("input#buynumber").val();
					if(value>1){
						$("input#buynumber").val(eval(value-"1"));
					}
				});
			});
		</script>
		
				<script type="text/javascript">
			$(function() {
				//给所有的li绑定单击事件
				var $tabMain_li = $("div.tabMain li");
				$tabMain_li.click(function() {
					//将点击的li高亮
					$(this).addClass("selected");
					//去掉其他的高亮
					$(this).siblings().removeClass("selected");
					//让对应的div显示
					//首先获得点击的第几个li
					var checkedLiIndex = $tabMain_li.index($(this));
					$("div.tabCon>div").eq(checkedLiIndex).show();
					$("div.tabCon>div").eq(checkedLiIndex).siblings().hide();
				});
				///*左下角店内分类*/
				var $s1 = $("#s1");
				var $div1 = $("div.hideDiv1");
				$s1.toggle(

					function() {
						$(this).removeClass("picture1");
						$(this).addClass("picture2");

						$div1.show();
					},
					function() {
						$(this).removeClass("picture2");
						$(this).addClass("picture1");
						$div1.hide();

					}
				);
				var $s2 = $("#s2");
				var $div2 = $("div.hideDiv2");
				$s2.toggle(

					function() {
						$(this).removeClass("picture1");
						$(this).addClass("picture2");

						$div2.show();
					},
					function() {
						$(this).removeClass("picture2");
						$(this).addClass("picture1");
						$div2.hide();

					}
				);

			});
		</script>
				
	</body>

</html>