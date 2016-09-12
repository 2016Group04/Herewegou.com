<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			* {
				margin: 0px;
			}
			body {
				font: 12px/150% Arial,Verdana,"\5b8b\4f53";
				color: #666;
			}
			.shortcut {
				width: 1366px;
				height: 30px;
				line-height: 30px;
				background-color: ;
			}
			ul {
    			list-style: none;
    		}
			 .shortcut .w {
				width: 990px;
				height: 30px;
				position: relative;
				left: 188px;
			}
			ul.fr {
				float: right;
				width: 400px;
				height: 30px;
				background-color: ;
			} 
			.fore1 {
				height: 30px;
				padding: 0 11px 0 12px;
				float: left;
			}
			.shortcut a {
    					color: #666;
			}
			
			a {
   				 text-decoration: none;
				}
			.s-div {
				width: 3px;
				height: 30px;
				float: left;
			}
			.fore2 {
				height: 30px;
				padding: 0 11px 0 12px;
				float: left;
			}
			.fore3 {
				height: 30px;
				padding: 0 11px 0 12px;
				float: left;
			}
			.fore4 {
				height: 30px;
				padding: 0 11px 0 12px;
				float: left;
			}
			
			.p-header {
				width: 990px;
				height: 58px;
				margin: 0 auto;
				position: absolute;
				top: -1px;
				left: 170px;
				padding-top: 4px;
			}
			.p-header .w {
			    padding-bottom: 15px;
			    width: 990px;
			    background-color: ;
			    position: relative;

			}
			
			
			.main {
				width: 1366px;
				height: 948px;
				//background-color: #ecedf2;
				padding-bottom: 50px;
			}
			.main .w {
				width: 990px;
				height: 369px;
				
				padding-top: 15px;
				position: relative;
				left: 188px;
			}
			.result-success {
				width: 990px;
				height: 365px;
				border-top: 4px solid #69cd8e;
				background: #f6f6f6;
				background-color: white;
			}
			.result-success-left {
				float: left;
				width: 600px;
				height: 365px;
				padding-left: 50px;
				padding-right: 50px;
			}
			.result-success-left-title {
				width: 600px;
				padding-left: 45px;
				padding-top: 30px;
				margin-bottom: 25px;
				position: relative;
			}
			.title-icon {
				position: absolute;
				display: block;
				left: 8px;
				top: 43px;
				width: 28px;
				height: 24px;
				overflow: hidden;
				background: url(img/pay-result.png) no-repeat;
			}
			.result-success-left-title h2 {
				font: 700 24px/48px "Microsoft Yahei";
				color: #69cd8e;
			}
			.result-success-left-detil {
				width: 555px;
				height: 48px;
				padding-left: 45px;
				margin-bottom: 15px;
			}
			.detil-line {
				width: 555px;
				height: 24px;
				line-height: 24px;
			}
			
			.result-success-left-operate {
				padding-left: 45px;
				border-bottom: 1px dashed #e2e2e2;
				padding-bottom: 20px;
				margin-bottom: 20px;
				line-height: 32px;
			}
			.operate-btn {
			    display: inline-block;
			    width: 120px;
			    height: 32px;
			    background-color: #2ea7e7;
			    margin-right: 10px;
			    text-align: center;
			    color: white;
			}
			.operate-link {
				color: #2ea7e7;
    			text-decoration: none;
    			line-height: 32px;
			}  
			.result-division {
				margin: 0 5px;
				color: #ddd;
				text-align: center; 
			}
			.result-success-left-tips {
				padding-left: 45px;
				padding-bottom: 30px;
				display: block;
			}
			.tips-title {
				float: left;
				font-weight: 700;
				line-height: 22px;
			}
			.tips-content {
				padding-left: 64px;
				line-height: 22px;
			}
			.font-red {
   				 color: #ff5d5b;
   				 margin: 0px;
   				 padding: 0px;
			}
			.font-1 {
				color: #2ea7e7;
			}
			
			
			.result-success-right {
				width: 290px;
				height: 365px;
				float: right;
				position: relative;
				height: 365px;
				overflow: hidden;
				background: url(img/jietu2.png) no-repeat;
				cursor: pointer;
			}
			
			
			.w-middle {
				width: 990px;
				height: 529px;
				position: relative;
				left: 188px;
				background-color: white;
			}	
			.result-recommend {
				
				padding: 10px 20px 20px;
				margin-top: 20px;
				background: #fff;
			}
			.result-recommend-title {
				height: 40px;
			}	
			.result-recommend .name {
				font: 400 20px/40px "microsoft yahei";
			}
			.result-recommend-2 {
				height: 459px;
				display: block;
			}	
			.o-sile {
				float: left;
				overflow: hidden;
				background: #fff;
				width: 352px;
				height: 459px;
			}
			.sile {
				height: 459px;
				cursor: pointer;
				background:url(img/57d0b6dfN1d62db05.jpg) no-repeat;
				z-index: 3;
			}
			.o-goods {
				float: left;
				overflow: hidden;
				width: 598px;
				height: 459px;
				border-top: 1px solid #ddd;
			}
			.o-goods div {
				width: 298px;
				height: 227px;
				float: left;
				border-bottom:1px solid #ddd ;
				border-right: 1px solid #ddd;
				cursor: pointer;
			}
			.o-goods .a1{
				overflow: hidden;
				background: url(img/57cd1135Nff6c0a33.jpg) no-repeat;
			}
			.o-goods .a2 {
				overflow: hidden;
				background: url(img/57ce7108N58f4bcc4.jpg) no-repeat;
				
			}
			.o-goods .a3 {
				overflow: hidden;
				background: url(img/57ce9972N441e8861.jpg) no-repeat;
			}
			.o-goods .a4 {
				overflow: hidden;
				background: url(img/57d0b840N0758e959.jpg) no-repeat;
			}
			
			
			.promotion {
				background-color: #F1F2F7;
				padding-bottom: 50px;
			}
			.promotion .w {
				width: 990px;
				position: relative;
				left: 188px;
			}
			.p-item {
				padding-bottom: 10px;
				cursor: pointer;
			}
			
			
			.p-footer {
				background-color: #ecedf2;
			}
			.p-footer .w {
				padding: 18px 0;
				border-top: 1px solid #ddd;
				width: 990px;
				position: relative;
				left: 188px;
			}
			.pf-line {
				line-height: 20px;
				text-align: center;
			}
			.pf-line-1 {
				margin-right: 40px;
			}
		</style>
	</head>
	<body>
		<div class="shortcut">
			<div class="w">
			
				<ul class="fr">					
						<li class="fore1" id="ttbar-login">												
									<a href="#" class="link-login style-red">jd_747e10435...</a>&nbsp;&nbsp;
									<a href="#" class="link-regist ">退出</a>
						</li>
						<li class="s-div">丨</li>
						<li class="fore2">
							<div class="dt">
								<a target="_blank" href="">我的订单</a>
							</div>
						</li>
						<li class="s-div">丨</li>
						<li class="fore3" id="ttbar-myjd">
							<div class="dt cw-icon">
								<a target="_blank" href="">支付帮助</a>
							</div>
						</li>
						<li class="s-div">丨</li>
						<li class="fore4" id="ttbar-myjd">
							<div class="dt cw-icon">
								<a target="_blank" href="">问题反馈</a>
							</div>
						</li>
				</ul>
				
			</div>
		</div>
		
		<div class="p-header">
			<div class="w">
				<img src="img/paysuccess.png" alt="转到收银台" height="35px" width="170px"></img>
			</div>
		</div>
		
		<div class="main">
			<div class="w">
				<div class="result-success">
					<!--左侧-->
					<div class="result-success-left">
						
						<div class="result-success-left-title">
							<i class="title-icon"></i>
							<h2>支付成功！我们会尽快为您发货！</h2>
						</div>
						
						
						<div class="result-success-left-detil">
							<div class="detil-line">
								<span class="">订单号: 23106921083</span>								
							</div>
							<div class="detil-msg">
								<p>
									在线支付：
									<span class=""><strong>138.00</strong>元</span>
								</p>
							</div>
						</div>
						
						<div class="result-success-left-operate">
							<a href="#" class="operate-btn">去办卡</a>
							<a href="" class="operate-link">继续逛逛</a>
							<b class="result-division">丨</b>
							<a href="" class="operate-link">查看订单详情</a>
							<b class="result-division">丨</b>
							<a href="" class="operate-link">支付体验调查</a>
							<b class="result-division">丨</b>
							<a href="" class="operate-link">实名认证</a>
						</div>
						
						<div class="result-success-left-tips">
							<div class="tips-title">重要提示:</div>
							<div class="tips-content">
								京东平台及销售商不会以
								<span class="font-red">订单异常、系统升级</span>
								为由，要求您点击任何链接进行退款。
								<br/>
								请关注京东
								<a href="#" class="font-1">谨防诈骗公告</a>
							</div>								
						</div>
					</div>
					
					<!--右侧-->
					<div class="result-success-right">
						
					</div>
				</div>
			</div>
			
			
			<div class="w-middle">
				<div class="result-recommend">
					<div class="result-recommend-title">
						<h2 class="name">爆款推荐</h2>
					</div>
					
					<div class="result-recommend-2">
						<div class="o-sile">
							<div class="sile"></div>
						</div>
						<div class="o-goods">
							<div class="a1"></div>
							<div class="a2"></div>	
							<div class="a3"></div>
							<div class="a4"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="promotion">
			<div class="w">
				<div class="p-item">
					<div class="">
						<img src="img/5742fc58N64a8d0cb.jpg"/>
					</div>
				</div>
				<div class="p-item">
					<div class="">
						<img src="img/57c919b9Nf07cb1e1.jpg"/>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="p-footer">
			<div class="w">
				<div class="pf-line">
					<span class="pf-line-1">Copyright © 2004-2016 京东JD.com 版权所有</span>
					<img src="img/footer-auth.png"/>
				</div>
			</div>
		</div>
	</body>
</html>
