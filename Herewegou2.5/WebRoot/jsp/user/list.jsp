<%@ page language="java"
	import="java.util.*,com.vo.Category,com.vo.Category2,com.vo.Product,com.page.PageInfo,com.vo.ClientUser"
	pageEncoding="UTF-8"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%
	Map<Category,List<Category2>> categoryMap = (Map<Category,List<Category2>>)request.getAttribute("categoryMap");
	List<Product> productList = (List<Product>)request.getAttribute("productList");
	
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	Category category = (Category)request.getAttribute("category");
	Category2 category2 = (Category2)request.getAttribute("category2");
%>

<head>

<meta http-equiv="content-type" content="text/html;charset=utf-8">
<title><%=category2.getCdesc()%></title>
<link rel="shortcut icon" href="jd-title.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/top.css" />
<link rel="stylesheet" type="text/css" href="css/list.css" />
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
							<!-- <a href="login.jsp"  class="link-login">你好，请登录</a>&nbsp;&nbsp;  -->
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
				<input  type="text" autocomplete="off" id="key" class="text">
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



	<div class="container">
		<!--品牌参数列表开始-->

		<div class="w">
			<div class="bar1">
				<div class="photobar">
					<a href="#" class="photo-link"><%=category2.getCname()%></a> <i
						class="crumbs-arrow">&gt;</i>
				</div>
				<div class="photobar">
					<div class="menu-drop">
						<div class="trigger">
							<span class="curr"><%=category.getCname()%></span> 
						</div>						
						<i class="crumbs-arrow">&gt;</i>
					</div>
				</div>
				<div class="photobar">
					<div class="menu-drop">
						<div class="trigger">
							<span class="curr"><%=category2.getCname()%></span> <i
								class="menu-drop-arrow"></i>
						</div>
						<div class="menu-drop-main">
							<ul class="menu-drop-list clearfix">
							<%
								List<Category2> c2List = categoryMap.get(category);
								if(c2List!=null){
									for(Category2 c2:c2List){
										%>
										<li><a href="UserServlet?action=getProductListByPage&cid=<%=c2.getCid() %>&currentPage=1" title="<%=c2.getCname()%>"><%=c2.getCname()%></a></li>
										<%
									}
								}
							%>
								
							</ul>
						</div>
						<i class="crumbs-arrow">&gt;</i>
					</div>
				</div>
			</div>
			<!--
        	手机 商品筛选 共4091个商品 然后下面是各个div
        -->
			<div class="bar2">
				<!--
            	手机 商品筛选 共4091个商品 
            -->
				<div class="selector" id="J_selector">
					<!-- 商品筛选 -->
					<div class="s-title">
						<h3>
							<b><%=category2.getCname()%></b><em>商品筛选</em>
						</h3>
						<div class="st-ext">
							共&nbsp;<span><%=pageInfo.getAllRecordCount()%></span>个商品
						</div>
					</div>
					<div class="J_selectorLine s-brand" data-id="100001">
						<div class="sl-wrap">
							<div class="sl-key">
								<span>品牌：</span>
							</div>
							<div class="sl-value">
								<div class="sl-v-logos">
									<ul class="ulone">
										<li><a href="#"><img src="img/5786128bN6232ac1b.jpg" />
												华为（HUAWEI） </a></li>
										<li><a href="#"><img src="img/56fe1ec7N0c3302e2.jpg">小米（MI）</a>
										</li>
										<li><a href="#"><img src="img/574d36dbN262ef26d.jpg" />Apple</a>
										</li>
										<li><a href="#"><img src="img/564d4328N6fb33fc8.png" />
												魅族（MEIZU）</a></li>
										<li><a href="#"><img src="img/5716e2c4Nc925baf3.jpg" />三星（SAMSUNG）</a>
										</li>
										<li><a href="#"><img src="img/56c04bc6Nb1e3b063.jpg" />乐视（Letv）</a>
										</li>
										<li><a href="#"><img src="img/56b2f385N8e4eb051.jpg" />OPPO</a>
										</li>
										<li><a href="#" title="vivo"><img
												src="img/563b3484N9ba68e13.jpg" ks_mark="y" ks_natural="y">vivo</a>
										</li>
									</ul>
									<ul class="ultwo">
										<li><a href="# " title="中兴（ZTE）"> <imgsrc ="img/56a855a3Ne38ee719.jpg" />中兴（ZTE）
										</a></li>
										<li><a href="#"><img src="img/57720f10N916a423d.jpg" />360</a>
										</li>
										<li><a href="#" title="酷派（Coolpad）"><i></i><img
												class="loading-style2" width="102" height="36"
												data-lazy-img="done" src="img/5670cf96Ncffa2ae6.jpg" />酷派（Coolpad）</a>
										</li>
										<li id="brand-27094" data-initial="n"><a href="# "
											title="努比亚（nubia）"><i></i><img class="loading-style2"
												width="102" height="36" src="img/5631cd12N7548352d.jpg" />努比亚（nubia）</a>
										</li>
										<li><a href="#" title="一加" rel="nofollow"><i></i><img
												class="loading-style2" width="102" height="36"
												src="img/563b33ffN9c288c6c.jpg" />一加</a></li>
										<li><a href="#" title="大显（DaXian）"><i></i><img
												class="loading-style2" width="102" height="36"
												data-lazy-img="done"
												src="img/rBEhVVK6pPcIAAAAAAALM6ogUCAAAHWJgCdScIAAAtL431.png" />大显（DaXian）</a>
										</li>
										<li id="brand-18362" data-initial="x"><a href="#"
											title="小辣椒"><i></i><img class="loading-style2"
												width="102" height="36"
												src="img/rBEhV1K6uOwIAAAAAAAGxx0kTvQAAHWYwPIloIAAAbf434.png" />小辣椒</a>
										</li>
										<li id="brand-11516" data-initial="l"><a href="# "
											title="联想（Lenovo）"><i></i><img class="loading-style2"
												width="102" height="36" src="img/5719dd01Nc6e67028.jpg" />联想（Lenovo）</a>
										</li>

									</ul>
								</div>

							</div>

						</div>
					</div>
					<div class="J_selectorLine s-line J_selectorFold"
						id="J_selectorPrice" style="display: block;" data-id="100002">
						<div class="sl-wrap">
							<div class="sl-key">
								<span>价格：</span>
							</div>
							<div class="sl-value">
								<div class="sl-v-list">
									<ul class="J_valueList">
										<li><a href="#"><i></i>0-499</a></li>
										<li><a href="#"><i></i>500-999</a></li>
										<li><a href="#"><i></i>1000-1699</a></li>
										<li><a href="#"><i></i>1700-2799</a></li>
										<li><a href="#"><i></i>2800-4499</a></li>
										<li><a href="#"><i></i>4500-11999</a></li>
										<li><a href="#"><i></i>12000以上</a></li>
									</ul>
									<div class="sl-price">
										<input class="input-txt" id="priceMin" title="最低价"
											maxlength="6"
											onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
										<em> - </em> <input class="input-txt" id="priceMax"
											title="最高价" maxlength="8"
											onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
										<a class="btn btn-default" id="priceBtn">确定</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="J_selectorLine s-line J_selectorFold">
						<div class="sl-wrap">
							<div class="sl-key">
								<span>网络：</span>
							</div>
							<div class="sl-value">
								<div class="sl-v-list">
									<ul class="J_valueList">
										<li><a href="#"><i></i>移动4G/联通4G/电信4G</a></li>
										<li><a href="#" rel="nofollow"><i></i>移动4G</a></li>
										<li><a href="#" rel="nofollow"><i></i>联通4G</a></li>
										<li><a href="#" rel="nofollow"><i></i>电信4G</a></li>
										<li><a href="#" rel="nofollow"><i></i>双卡单4G</a></li>
										<li><a href="#" rel="nofollow"><i></i>双卡双4G</a></li>
										<li><a href="#" rel="nofollow"><i></i>双卡</a></li>
										<li><a href="#" rel="nofollow"><i></i>其他</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="J_selectorLine s-line J_selectorFold">
						<div class="sl-wrap">
							<div class="sl-key">
								<span>热点：</span>
							</div>
							<div class="sl-value">
								<div class="sl-v-list">

									<ul class="J_valueList">
										<li><a href="#" rel="nofollow"><i></i>以旧换新</a></li>
										<li><a href="#" rel="nofollow"><i></i>骁龙芯片</a></li>
										<li><a href="#" rel="nofollow"><i></i>双卡双待</a></li>
										<li><a href="#" rel="nofollow"><i></i>老人手机</a></li>
										<li><a href="#" rel="nofollow"><i></i>指纹识别</a></li>
										<li><a href="#" rel="nofollow"><i></i>VoLTE</a></li>
										<li><a href="#" rel="nofollow"><i></i>Apple Pay</a></li>
										<li><a href="#" rel="nofollow"><i></i>金属机身</a></li>
										<li><a href="#" rel="nofollow"><i></i>2K屏</a></li>
										<li><a href="#" rel="nofollow"><i></i>快速充电</a></li>
										<li><a href="#" rel="nofollow"><i></i>拍照神器</a></li>
										<li><a href="#" rel="nofollow"><i></i>支持NFC</a></li>
										<li><a href="#" rel="nofollow"><i></i>女性手机</a></li>
										<li><a href="/#" rel="nofollow"><i></i>三防手机</a></li>
										<li><a href="#" rel="nofollow"><i></i>儿童手机</a></li>
										<li><a href="#" rel="nofollow"><i></i>合约机</a></li>
										<li><a href="#" rel="nofollow"><i></i>直板键盘</a></li>
										<li><a href="#" rel="nofollow"><i></i>非智能机</a></li>
										<li><a href="#" rel="nofollow"><i></i>翻盖</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="J_selectorLine s-line J_selectorFold">
						<div class="sl-wrap">
							<div class="sl-key">
								<span>屏幕尺寸：</span>
							</div>
							<div class="sl-value">
								<div class="sl-v-list">
									<ul class="J_valueList">
										<li><a href="#" rel="nofollow"><i></i>5.6英寸及以上</a></li>
										<li><a href="/#" rel="nofollow"><i></i>5.5-5.1英寸</a></li>
										<li><a href="#" rel="nofollow"><i></i>5.0-4.6英寸</a></li>
										<li><a href="#" rel="nofollow"><i></i>4.5-3.1英寸</a></li>
										<li><a href="#" rel="nofollow"><i></i>3.0英寸及以下</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="J_selectorLine s-line J_selectorFold">
						<div class="sl-wrap">
							<div class="sl-key">
								<span>系统：</span>
							</div>
							<div class="sl-value">
								<div class="sl-v-list">
									<ul class="J_valueList">
										<li><a href="#" rel="nofollow"><i></i>安卓（Android）</a></li>
										<li><a href="#" rel="nofollow"><i></i>苹果（IOS）</a></li>
										<li><a href="#" rel="nofollow"><i></i>微软（WindowsPhone）</a>
										</li>
										<li><a href="#"><i></i>无</a></li>
										<li><a href="#"><i></i>其他</a></li>
									</ul>
								</div>
							</div>
						</div>

					</div>
					<div class="J_selectorLine s-line J_selectorFold ">
						<div class="sl-wrap">
							<div class="sl-key">
								<span>机身内存：</span>
							</div>
							<div class="sl-value">
								<div class="sl-v-list">
									<ul class="J_valueList">
										<li><a href="#"><i></i>128GB</a></li>
										<li><a href="#"><i></i>64GB</a></li>
										<li><a href="#"><i></i>32GB</a></li>
										<li><a href="#"><i></i>16GB</a></li>
										<li><a href="#"><i></i>8GB</a></li>
										<li><a href="#"><i></i>8GB以下</a></li>
										<li><a href="#"><i></i>支持内存卡</a></li>
										<li><a href="#"><i></i>无</a></li>
									</ul>

								</div>
							</div>
						</div>
					</div>
					<div class="J_selectorLine s-line J_selectorFold ">
						<div class="sl-wrap">
							<div class="sl-key">
								<span>运行内存：</span>
							</div>
							<div class="sl-value">
								<div class="sl-v-list">
									<ul class="J_valueList">
										<li><a href="#"><i></i>6GB</a></li>
										<li><a href="#"><i></i>4GB</a></li>
										<li><a href="#"><i></i>3GB</a></li>
										<li><a href="#"><i></i>2GB</a></li>
										<li><a href="#"><i></i>无</a></li>
										<li><a href="#"><i></i>其他</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<div class="s-more" id="J_selectorMore">
						<span class="sm-wrap" data-more="系统、机身内存、运行内存 等"> 更多选项（
							系统、机身内存、运行内存 等）<i class="menu-drop-arrow"></i>
						</span>
					</div>
				</div>
			</div>
		</div>

		<!--品牌参数列表结束-->

		<!--选购列表开始-->
		<div class="all">
			<div id="list-main" class="w">
				<div class="table">
					<div class="filter">
						<div class="f-top">
							<div class="f-sort">
								<a href="" class="curr">综合排序</a> <a href="">销量</a> <a href="">价格</a>
								<a href="">评论数</a> <a href="">新品</a>
							</div>
							<div class="f-pager">
								<span class="fp-text"> <b><%=pageInfo.getCurrentPage()%></b>
									<em>/</em> <i><%=pageInfo.getAllPageCount()%></i>
								</span> <a href=""> <</a> <a href="">></a>
							</div>
						</div>
						<div class="f-line">
							<div class="f-store">
								<div class="fs-cell">配送至</div>
								<div class="">
									<div class="text">
										山东济南市长清区 <b></b>
									</div>

								</div>
							</div>
							<div class="f-feature">
								<ul>
									<li><a href=""><i></i>HWG配送</a></li>
									<li><a href=""><i></i>货到付款</a></li>
									<li><a href=""><i></i>仅显示有货</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="list">
						<ul class="tl-warp">

							<%
								if(productList!=null){
														Iterator<Product> it = productList.iterator();
														while(it.hasNext()){
															Product p = it.next();
							%>

							<li class="tl-item">
								<div class="tl-i-warp">
									<div class="p-img">
										<a href="UserServlet?action=getProductDetailPage&cid=<%=category2.getCid()%>&pid=<%=p.getPid() %>"><img src="img/productImg/productListLargeImage/<%=p.getProductListLargeImage()%>"
											height="220px" width="220px" /></a>
									</div>
									<div class="p-wrap">
										<ul>
										<% 
										
										if(p.getProductListSmallImage1()!=null){
											%>
											<li><a href=""><img
													src="img/productImg/<%=p.getProductListSmallImage1()%>" /></a>
											</li>
											
											<% 
										}
										
										if(p.getProductListSmallImage2()!=null){
											%>
											<li><a href=""><img
													src="img/productImg/<%=p.getProductListSmallImage2()%>" /></a>
											</li>
											
											<% 
										} 
										
										if(p.getProductListSmallImage3()!=null){
											%>
											<li><a href=""><img
													src="img/productImg/<%=p.getProductListSmallImage3()%>" /></a>
											</li>
											
											<% 
										}
										%>
											
											
										</ul>
									</div>
									<div class="p-price">
										<strong> <em>￥</em> <i><%=p.getPrice()%></i>
										</strong>
										<div class="p-icons">
											<i class="icons">赠品</i> <i class="goods-icons-s1">货到付款</i>
										</div>
									</div>
									<div class="p-name">
										<a href="UserServlet?action=getProductDetailPage&cid=<%=category2.getCid()%>&pid=<%=p.getPid() %>"> <em> <!-- <span class="coupon-tag">已领券</span> -->
												<%=p.getPname()%>

										</em>

										</a>
									</div>
									<div class="p-commit">
										<strong> 已有 <a href="#"><%=p.getPingjiaSum()%></a>
											人评价
										</strong>
									</div>
									<div class="p-shop">
										<span> <a href="#"><%=p.getDianpuName()%></a> <b
											class="im-01"></b>
										</span>
									</div>
								</div>
							</li>
							<%
								}
													}
							%>
						</ul>
					</div>
					<div class="page">
						<div class="pa-wrap">
							<span class="pa-num"> <%
 					int currentPage = pageInfo.getCurrentPage();
 						int pageSum = pageInfo.getAllPageCount();
 						String preDisabled = " ";
 						String nexDisabled = " ";
 						if(currentPage==1){
 							preDisabled = " pn-disabled";
 						}
 						
 						if (currentPage==pageSum){
 							nexDisabled = " pn-disabled";
 						}	
				 %> <a class="pn-prev<%=preDisabled%>" 
						onclick="turnToPage(<%=pageInfo.getPreviousPage()%>);"><i><</i><em>上一页</em></a>
				<%

						if(pageSum<=10){
							//全打印出来
							for(int i=1;i<=pageSum;i++){
								if(i==currentPage){
									%> <a class="curr" ><%=currentPage%></a> <%
								}else{
									%> <a onclick="turnToPage(<%=i%>);"><%=i%></a> <%
								}
							}
							
						}else{
						
							//打印一部分
						
							if(currentPage<=5){
								//从1开始打印 打印到 当前页数 + 2页
								for(int i=1;i<=currentPage+2;i++){
									if(i==currentPage){
										%> <a class="curr" ><%=currentPage%></a> <%
									}else{
										%> <a onclick="turnToPage(<%=i%>);"><%=i%></a> <%
									}
								}
								//打印..
								//打印最后一页(即总共的页数)
								 %> <b class="pn-break">…</b> 
								 	<a onclick="turnToPage(<%=pageSum%>);"><%=pageSum%></a> 
								<%
								
							}else if(currentPage<pageSum-3){//8
								//始终打印10个
								//先打印1  和 ..
								%> 
								 	<a onclick="turnToPage(1);">1</a>
								 	<b class="pn-break">…</b>  
								<%
								//从当前页-3 开始打印  打印到当前页+2
								for(int i=currentPage-3;i<=currentPage+2;i++){
									if(i==currentPage){
										%> <a class="curr" ><%=currentPage%></a> <%
									}else{
										%> <a onclick="turnToPage(<%=i%>);"><%=i%></a> <%
									}
								}
								//打印 ..  和最后一页
								%> <b class="pn-break">…</b> 
							 	<a onclick="turnToPage(<%=pageSum%>);"><%=pageSum%></a> 
								<%
							}else{
								//先 打印 1 和 ..
								%> 
								 	<a onclick="turnToPage(1);">1</a>
								 	<b class="pn-break">…</b>  
								<%
								//再打印 当前页-3 到剩下的
								for(int i=currentPage-3;i<=pageSum;i++){
									if(i==currentPage){
										%> <a class="curr" ><%=currentPage%></a> <%
									}else{
										%> <a onclick="turnToPage(<%=i%>);"><%=i%></a> <%
									}
								}
							}
						
						}						

							%>		
							<a class="pn-next<%=nexDisabled%>" onclick="turnToPage(<%=pageInfo.getNextPage()%>);"><em>下一页</em><i>></i></a>
							</span> <span class="pa-skip"> <em> 共 <b><%=pageSum%></b> 页
									到第
							</em> <input type="text" class="input-pageTo input-text" value="<%=currentPage%>" name="pageTo" />
								<em>页</em> <a class="btn btn-pageTo btn-default">确定</a>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--选购列表结束-->

	</div>

	<script src="js/jquery-2.1.4.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/jd.js"></script>
	<script type="text/javascript">
		$(function(){
			
			$(".pn-disabled").removeAttr("onclick");			
			//点到第几页的确定		
			$(".btn-pageTo").click(function(){
				var pageTo = $(".input-pageTo").val();
				if(pageTo>=1&&pageTo<=<%=pageSum%>&&pageTo!=<%=currentPage%>){
					turnToPage(pageTo);
				}
				
			});
		});
		
		function turnToPage(page){
			location.assign("UserServlet?action=getProductListByPage&cid="+<%=category2.getCid()%>+"&currentPage="+page+"#list-main");
	}
	</script>
	
</body>

</html>