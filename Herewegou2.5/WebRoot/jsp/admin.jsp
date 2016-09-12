<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>HWG后台管理系统</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/foot.css">
</head>

<body>
	<div class="header large-div">
		<img alt="HWG" src="../img/logo.png">
		<div>HWG后台管理系统</div>
	</div>
	<div class="main-content large-div">

		<div class="main">
			<div class="menu">
				<ul class="nav">
					<li>
						<div class="title">
							<a href="#">商品种类管理</a>

						</div>

						<div class="list-group">
							<ul>
								<li class="item"><a href="category/addCategory.jsp"
									target="mainIFrame">添加一级商品种类</a></li>
								<li class="item"><a
									href="category/CategoryServlet?action=getAllByPage&currentPage=1"
									target="mainIFrame">管理一级商品种类</a></li>
								<li class="item"><a
									href="category/CategoryServlet?action=toAddCategory2jsp"
									target="mainIFrame">添加二级商品种类</a></li>
								<li class="item"><a href="category/CategoryServlet?action=getAllCategory2ByPage&currentPage=1"
									target="mainIFrame">管理二级商品种类</a></li>
							</ul>
						</div>
					</li>
					<li>
						<div class="title">
							<a href="#">商品管理</a>

						</div>

						<div class="list-group">
							<ul>
								<li class="item"><a href="product/ProductServlet?action=toAddProductjsp"
									target="mainIFrame">添加商品</a></li>
								<li class="item"><a href="product/ProductServlet?action=toUploadProductImgjsp"
									target="mainIFrame">上传图片</a></li>
								<li class="item"><a href="product/ProductServlet?action=toPutOnShelvesjsp&currentPage=1"
									target="mainIFrame">商品上架</a>
												</li>
								<li class="item">
									<a href="product/ProductServlet?action=toPullOffShelvesjsp&currentPage=1"
									target="mainIFrame">商品下架</a>
								</li>
								<li class="item"><a href="product/ProductServlet?action=getAllProductByPage&currentPage=1"
									target="mainIFrame">管理商品</a></li>
							</ul>
						</div>
					</li>
					<li>
						<div class="title">
							<a href="#">订单管理</a>

						</div>

						<div class="list-group">
							<ul>
								<li class="item"><a href="user/OrderServlet?action=managerOrder" target="mainIFrame">订单管理</a></li>
							</ul>
						</div>
					</li>
					<li>
						<div class="title">
							<a href="#">用户管理</a>

						</div>

						<div class="list-group">
							<ul>
								<li class="item"><a href="user/UserServlet?action=queryAllUser" target="mainIFrame">查询用户</a></li>
								<li class="item"><a href="user/UserServlet?action=queryDong&actions=dong&currentPage=1" target="mainIFrame">冻结用户</a></li>
								<li class="item"><a href="user/UserServlet?action=queryDong&actions=jie&currentPage=1" target="mainIFrame">解冻用户</a></li>
							</ul>
						</div>
					</li>

				</ul>
			</div>
			<iframe src="" name="mainIFrame" frameborder="0"></iframe>
		</div>
	</div>
	
	<!--最底部copyright 开始-->

	<div id="footer">
		<div class="links">
			<a rel="nofollow" ="_blank" href="http://www.HWG.com/intro/about.aspx">
				关于我们 </a> | <a rel="nofollow" target="_blank"
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
	
	<script src="../js/jquery-1.7.2.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript">
		$(function() {
			
			
				
			
			
			

			var $title = $(".title");
			var $item = $(".item");

			$item.click(function(){
				$item.removeClass("active");
				$(this).toggleClass("active");
			});

			//点击标题  展开或收起组
			$title.click(function() {
				$(this).next().toggleClass("show");
			});

		});
	</script>
</body>
</html>
