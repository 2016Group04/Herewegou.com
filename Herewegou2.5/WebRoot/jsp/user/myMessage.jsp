<%@ page language="java"
	import="java.util.*,com.vo.Category,com.vo.Category2,com.vo.Product,com.page.PageInfo,com.vo.OrderForm,com.vo.ClientUser"
	pageEncoding="UTF-8"%>
	<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/JSP/user/";
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>我的个人信息</title>
		<style type="text/css">
			/*----------------------------------------*/
			
			body {
				font: 12px/150% Arial, Verdana, "\5b8b\4f53";
				color: #666;
				background: #fff;
				-webkit-font-smoothing: antialiased;
			}
			
			* {
				margin: 0;
				padding: 0;
			}
			
			a:hover {
				color: #C81623;
			}
			
			a {
				color: #666;
				text-decoration: none;
			}
			
			ul {
				list-style: none;
			}
			
			img {
				border: 0;
				vertical-align: middle;
			}
			
			.w {
				width: 1210px;
				margin: 0 auto;
			}
			
			.dorpdown {
				position: relative;
			}
			
			.dorpdown-layer {
				display: none;
				position: absolute;
			}
			
			.hide {
				display: none;
			}
			/*最上面一条的type 开始*/
			
			#shortcut {
				width: 100%;
				height: 30px;
				line-height: 30px;
				background: #F1F1F1;
			}
			
			.fl {
				float: left;
			}
			
			#shortcut .w {
				width: 1210px;
				height: 30px;
				margin: 0 auto;
				background: #F1F1F1;
			}
			
			#shortcut li {
				float: left;
				height: 30px;
				padding: 0 2px;
			}
			
			#shortcut li.dorpdown {
				z-index: 13;
			}
			
			#shortcut #ttbar-mycity {
				padding-left: 0;
			}
			
			#shortcut li.dorpdown:hover {
				padding: 0 1px;
			}
			
			#shortcut li.dropdown {
				position: relative;
				padding-left: 0px;
				z-index: 13;
			}
			
			#shortcut .dt {
				float: left;
				padding: 0 8px;
			}
			
			#shortcut #ttbar-mycity .dt {
				padding: 0 25px 0 10px;
			}
			
			.cw-icon {
				position: relative;
				cursor: default;
				zoom: 1;
			}
			
			#shortcut li.dorpdown:hover .dt {
				background: #fff;
				border: solid #ddd;
				border-width: 0 1px;
				cursor: default;
			}
			
			#ttbar-mycity:hover .dt {
				padding: 0 24px 0 9px;
			}
			
			#shortcut .ci-right {
				position: absolute;
				display: block;
				top: 12px;
				right: 8px;
				height: 7px;
				overflow: hidden;
				font: 400 15px/15px consolas;
				color: #6A6A6A;
				transition: transform .1s ease-in 0s;
				-webkit-transition: -webkit-transform .1s ease-in 0s;
			}
			
			#shortcut li.dorpdown:hover .ci-right {
				transform: rotate(180deg);
				-webkit-transform: rotate(180deg);
			}
			
			#shortcut .ci-right s {
				position: relative;
				top: -7px;
				text-decoration: none;
			}
			
			#shortcut .dorpdown-layer {
				display: none;
				position: absolute;
				line-height: 24px;
				width: 301px;
				padding: 10px 0 10px 10px;
				top: 30px;
				background: #fff;
				border: 1px solid #ddd;
			}
			
			#shortcut li.dorpdown:hover .dorpdown-layer {
				display: block;
			}
			
			#shortcut #ttbar-mycity .dd-spacer {
				left: 0;
				width: 98px;
			}
			
			#shortcut .dd-spacer {
				position: absolute;
				top: -7px;
				height: 10px;
				background: #fff;
				overflow: hidden;
			}
			
			#shortcut #ttbar-mycity .item {
				float: left;
				width: 60px;
				padding: 2px 0;
			}
			
			#shortcut #ttbar-mycity .item a {
				float: left;
				padding: 0 8px;
			}
			
			a.selected {
				background: #C81623;
				color: #fff;
			}
			
			#shortcut .item a:hover {
				background: #F4F4F4;
			}
			
			.fr {
				float: right;
			}
			
			.form .itxt-succ {
    			background: url(img/succ-ico.png) right center no-repeat;
			}
			
			#shortcut #ttbar-login {
				margin-right: 10px;
			}
			
			#shortcut #ttbar-login .link-login {
				font-family: "verdana,simsun";
			}
			
			#shortcut .style-red {
				color: #C81623;
			}
			
			#shortcut li.spacer {
				width: 1px;
				height: 12px;
				margin-top: 9px;
				padding: 0;
				background: #ddd;
				overflow: hidden;
			}
			
			#ttbar-myjd .dorpdown-layer {
				width: 280px;
			}
			
			#ttbar-myjd .userinfo {
				padding: 10px 0 10px 15px;
				overflow: hidden;
			}
			
			#ttbar-myjd .u-pic {
				float: left;
				margin-right: 10px;
			}
			
			#ttbar-myjd .u-pic img {
				border-radius: 50%;
				-moz-border-radius: 50%;
				-webkit-border-radius: 50%;
			}
			
			#ttbar-myjd .u-name {
				padding: 6px 0 0;
				font-weight: 700;
			}
			
			#ttbar-myjd .otherlist {
				width: 255px;
				padding: 0 0 0 15px;
				margin: 5px 0;
				overflow: hidden;
				margin-bottom: 10px;
			}
			
			#ttbar-myjd .otherlist .fore1,
			#ttbar-myjd .otherlist .fore2 {
				float: left;
				width: 126px;
			}
			
			#ttbar-myjd .dd-spacer {
				left: 0;
				width: 82px;
			}
			
			#shortcut #ttbar-apps .dt {
				padding-left: 25px;
				padding-right: 25px;
			}
			
			#shortcut #ttbar-myjd .dt,
			#shortcut #ttbar-atte .dt,
			#shortcut #ttbar-serv .dt,
			#shortcut #ttbar-navs .dt {
				width: 49px;
				padding-right: 25px;
			}
			
			.cw-icon .i,
			.cw-icon i {
				display: block;
				position: absolute;
				overflow: hidden;
			}
			
			#shortcut #ttbar-apps .dt .ci-left {
				top: 5px;
				left: 7px;
				width: 15px;
				height: 20px;
				background: url(img/jd2015img.png) 0 0 no-repeat;
			}
			
			#shortcut #ttbar-apps:hover .dt .ci-left {
				background: url(img/jd2015img.png) 0 -25px no-repeat;
			}
			
			#shortcut #ttbar-apps .dd-inner {
				position: relative;
				width: 250px;
				height: 195px;
				overflow: hidden;
				background: url(img/571497daNe857f9ed.png);
			}
			
			#ttbar-apps .dd-spacer {
				left: 0;
				height: 7px;
				width: 98px;
			}
			
			#shortcut #ttbar-atte .dd-spacer,
			#shortcut #ttbar-serv .dd-spacer {
				left: 0;
				height: 7px;
				width: 82px;
			}
			
			#shortcut #ttbar-apps .dd {
				width: 250px;
			}
			
			#shortcut #ttbar-apps .dd a {
				display: block;
				position: absolute;
				width: 56px;
				height: 44px;
				overflow: hidden;
				text-indent: -500px;
			}
			
			#shortcut #ttbar-apps .dd .link {
				width: 100px;
				height: 20px;
				overflow: hidden;
			}
			
			#shortcut #ttbar-apps .dd .link1,
			#shortcut #ttbar-apps .dd .link2,
			#shortcut #ttbar-apps .dd .link3 {
				left: 92px;
				top: 6px;
				background-position: 0 -44px;
			}
			
			#shortcut #ttbar-apps .dd .link3 {
				top: 104px;
				background-position: -1px -66px;
			}
			
			#shortcut #ttbar-apps .dd .link4,
			#shortcut #ttbar-apps .dd .link5 {
				left: 99px;
				top: 23px;
				width: 136px;
				color: #c21a21;
				text-indent: 0;
				cursor: default;
			}
			
			#shortcut #ttbar-apps .dd .link5 {
				top: 120px;
			}
			
			#shortcut #ttbar-apps .jdapp-ios,
			#shortcut #ttbar-apps .wyapp-ios {
				top: 46px;
				left: 92px;
			}
			
			#shortcut #ttbar-apps .jdapp-android,
			#shortcut #ttbar-apps .wyapp-android {
				top: 46px;
				left: 147px;
			}
			
			#shortcut #ttbar-apps .jdapp-ipad,
			#shortcut #ttbar-apps .wyapp-ipad {
				width: 45px;
				top: 46px;
				left: 202px;
			}
			
			#shortcut #ttbar-apps .wyapp-android,
			#shortcut #ttbar-apps .wyapp-ios {
				top: 143px;
			}
			
			#shortcut #ttbar-atte .dt,
			#shortcut #ttbar-serv .dt {
				width: 49px;
				padding-right: 25px;
			}
			
			#shortcut #ttbar-atte .dd,
			#shortcut #ttbar-serv .dd {
				width: 82px;
				padding-bottom: 8px;
			}
			
			#shortcut #ttbar-atte .dd {
				padding-left: 0;
			}
			
			#shortcut #ttbar-serv .dd {
				width: 170px;
			}
			
			#shortcut #ttbar-serv .item-business,
			#shortcut #ttbar-serv .item-client {
				font-weight: 700;
				padding-left: 10px;
			}
			
			#shortcut #ttbar-atte .item,
			#shortcut #ttbar-serv .item {
				display: inline-block;
				width: 70px;
				padding-left: 15px;
			}
			
			#shortcut #ttbar-serv .item {
				padding-left: 10px;
			}
			
			#shortcut #ttbar-serv .item-business {
				border-top: 1px dotted #ccc;
				padding-top: 5px;
				margin-top: 5px;
			}
			
			#shortcut #ttbar-navs .dd-spacer {
				right: 0px;
				height: 7px;
				width: 82px;
			}
			
			#shortcut #ttbar-navs dt {
				font-size: 14px;
				font-weight: 700;
				margin-bottom: 6px;
			}
			
			#shortcut #ttbar-navs .dt {
				width: 49px;
				padding-right: 25px;
			}
			
			#shortcut #ttbar-navs .dd {
				right: 1px;
				width: 1210px;
				padding: 20px 0 16px;
			}
			
			#shortcut #ttbar-navs dl {
				float: left;
				width: 201px;
				padding-left: 20px;
				border-left: 1px solid #ddd;
			}
			
			#shortcut #ttbar-navs dl {
				width: 259px;
			}
			
			#shortcut #ttbar-navs dl.fore1 {
				border-left: none;
				width: 347px;
			}
			
			#shortcut #ttbar-navs .fore2 {
				display: block;
			}
			
			#shortcut #ttbar-navs .item {
				float: left;
				width: 100px;
			}
			
			#shortcut #ttbar-navs .item {
				width: 86px;
			}
			/*......红色横幅..........*/
			
			#nav {
				position: relative;
				width: 100%;
				background-color: #e45050;
			}
			
			#nav .w {
				background-color: #e45050;
				width: 100%;
				height: 80px;
			}
			
			#nav .logo {
				position: relative;
				float: left;
				width: 272px;
				height: 80px;
				overflow: hidden;
			}
			
			#nav .logo a {
				text-decoration: none;
				color: #fff;
			}
			
			#nav .logo .fore1 {
				float: left;
				margin-right: 10px;
				width: 158px;
				height: 80px;
				background: url(img/logo.png) no-repeat;
			}
			
			#nav .logo .fore2 {
				float: left;
				font-size: 20px;
				font-family: "Microsoft YaHei";
				margin: 20px 0 0 6px;
				height: 22px;
			}
			
			#nav .logo .fore3 {
				float: left;
				margin: 5px 0 0;
				color: #ffb2b2;
				border: 1px solid #ffb2b2;
				height: 18px;
				line-height: 18px;
				padding: 0 10px;
				-webkit-border-radius: 10px;
				-moz-border-radius: 10px;
				border-radius: 10px;
			}
			
			#nav .navitems {
				float: left;
				height: 36px;
				width: 342px;
				line-height: 36px;
				padding: 22px 0;
				margin: 0 0 0 30px;
				font-size: 14px;
			}
			
			#nav .navitems ul {
				display: inline-block;
				display: block;
			}
			
			#nav .navitems li {
				float: left;
				margin: 0 20px 0 0;
			}
			
			#nav .navitems li .fore-1 {
				width: 28px;
				height: 36px;
			}
			
			#nav .navitems li.fore-3 {
				margin: 0;
				width: 106px;
				height: 36px;
			}
			
			div {
				display: block;
			}
			
			#nav .navitems a {
				color: #fff;
				position: relative;
			}
			
			#nav .navitems a {
				color: #fff;
				position: relative;
			}
			
			#nav .navitems .hover {
				z-index: 10;
				display: block;
			}
			
			#nav .navitems .dl {
				position: relative;
				width: 106px;
				height: 36px;
			}
			
			#nav .navitems .dl .hover {
				position: relative;
				width: 106px;
				height: 36px;
				z-index: 10;
			}
			
			#nav .navitems li.fore-4 {
				margin-right: 5px;
				width: 88px;
				height: 36px;
			}
			
			#nav .navitems .dl .dt {
				white-space: nowrap;
				height: 18px;
				line-height: 18px;
				padding: 9px 16px;
				width: 74px;
			}
			
			#nav .navitems .dl .dt span {
				color: #fff;
			}
			
			span .myjd-set {
				width: 56px;
				height: 16px;
			}
			
			#nav .navitems .dl .dd {
				position: absolute;
				top: 34px;
				left: 0;
				display: none;
				background-color: #fff;
				border: 1px solid #ddd;
				border-top: 0;
				font-size: 12px;
			}
			
			#nav .navitems .dl .dt b {
				display: inline-block;
				vertical-align: middle;
				width: 9px;
				height: 6px;
				overflow: hidden;
				margin-left: 5px;
				background: url(img/icon.png) 0 -120px no-repeat;
				-webkit-transition: transform .2s ease-in 0s;
				-moz-transition: transform .2s ease-in 0s;
				transition: transform .2s ease-in 0s;
			}
			
			#nav .navitems li.fore-4 {
				margin-right: 5px;
				width: 88px;
				height: 36px;
			}
			
			#nav .navitems li.fore-5 {
				width: 28px;
				height: 36px;
			}
			/*.....横幅搜索框.......*/
			
			#nav .nav-r {
				float: right;
				width: 340px;
				margin-right: 5px;
			}
			
			#nav .nav-r #search-2014 {
				position: relative;
				z-index: 11;
				float: left;
				width: 462px;
				margin-top: 25px;
			}
			
			#nav .nav-r #search-2014 {
				width: 186px;
			}
			
			#shelper {
				overflow: hidden;
				position: absolute;
				top: 36px;
				left: 0;
				width: 379px;
				border: 1px solid #CCC;
				background: #fff;
			}
			
			#search-2014 .form {
				width: 462px;
				height: 36px;
			}
			
			#nav .nav-r #search-2014 .form {
				width: auto;
			}
			
			#nav .nav-r #search-2014 #shelper {
				width: 338px;
				top: 32px;
			}
			
			#search-2014 .text {
				float: left;
				width: 370px;
				height: 24px;
				line-height: 24px;
				color: #666;
				padding: 4px;
				margin-bottom: 4px;
				border-width: 2px 0 2px 2px;
				border-color: #B61D1D;
				border-style: solid;
				outline: 0;
				font-size: 14px;
				font-family: "microsoft yahei";
			}
			
			#nav .nav-r #search-2014 .text {
				width: 120px;
				border: 0;
			}
			
			#search-2014 .button {
				float: left;
				width: 82px;
				height: 36px;
				background: #B61D1D;
				border: none;
				line-height: 1;
				color: #fff;
				font-family: "Microsoft YaHei";
				font-size: 16px;
				cursor: pointer;
			}
			
			icon i {
				display: block;
				position: absolute;
				overflow: hidden;
			}
			
			#search-2014 .cw-icon i {
				top: 0;
				left: 0;
				width: 82px;
				height: 36px;
			}
			
			#nav .nav-r #settleup-2014 {
				width: 141px;
				height: 36px;
				float: right;
				margin-right: 0;
			}
			
			.form .itxt-error {
    border-color: #e4393c;
    color: #e4393c;
    background: url(//misc.360buyimg.com/user/myjd-2015/css/i/error-ico.png) right center no-repeat;
}
			
			#settleup-2014 {
				float: right;
				z-index: 11;
				height: 36px;
				margin-top: 25px;
			}
			
			#settleup-2014 .cw-icon {
				width: 75px;
				height: 34px;
				border: 1px solid #DFDFDF;
				padding: 0 28px 0 36px;
				background: #F9F9F9;
				text-align: center;
				line-height: 34px;
			}
			
			#nav .nav-r #search-2014 .button {
				width: 56px;
				font-size: 12px;
				height: 32px;
				color: #333;
				background-color: #f7f7f7;
			}
			
			#nav .nav-r #search-2014 .dorpdown {
				position: relative;
				width: 141px;
				height: 36px;
			}
			
			#nav .nav-r #settleup-2014 .cw-icon {
				height: 30px;
				border: 1px solid #fff;
			}
			
			#nav .nav-r #settleup-2014 .ci-left {
				top: 9px;
				left: 18px;
				width: 18px;
				height: 16px;
				background: url(img/jd2015img.png) 0 -58px no-repeat;
			}
			
			#settleup-2014 .ci-right {
				top: 11px;
				right: 10px;
				width: 7px;
				height: 13px;
				overflow: hidden;
				font: 400 13px/13px simsun;
				color: #999;
			}
			
			#nav .nav-r #settleup-2014 .ci-right {
				top: 9px;
			}
			
			#settleup-2014 .ci-count {
				position: absolute;
				top: -4px;
				left: 104px;
				display: inline-block;
				padding: 1px 2px;
				font-size: 12px;
				line-height: 12px;
				color: #fff;
				background-color: #c81623;
				border-radius: 7px 7px 7px 0;
				min-width: 12px;
				text-align: center;
			}
			
			.clr {
				display: block;
				overflow: hidden;
				clear: both;
				height: 0;
				line-height: 0;
				font-size: 0;
			}
			/*.......主题内容开始..............*/
			#container, #container .w {
  background-color: #f5f5f5;
  height:816px;
}
.w {
  width: 990px;
  margin: 0 auto;
}
#content {
  padding-left: 120px;
  padding-top: 20px;
  display: inline-block;
  display: block;
  background-color: #f5f5f5;
}
#sub {
  float: left;
  width: 120px;
  position: relative;
  left: -120px;
  
}
#menu {
  width: 100px;
  padding-left: 10px;
}
#menu dl {
  padding-bottom: 15px;
}
#menu dl .fore-1{
  
  width:100px;
  height: 355px;
}
#menu dl dt {
  height: 28px;
  line-height: 28px;
  color: #333;
  font-weight: 700;
}
#menu dl dd {
  color: #666;
  line-height: 24px;
}
#menu dl dd a {
  color: #777;
}

.form .prompt-error {
    clear: both;
    margin-top: 5px;
    color: #e4393c;
    line-height: 18px;
}
#menu dl dd.curr a {
  color: #e4393c;
  font-weight: 700;
}
#main {
  float: left;
  width: 99.9%;
  margin-left: -120px;
  overflow: hidden;
}
.mod-main {
  padding: 10px;
  background-color: #fff;
  margin-bottom: 20px;
}
.mod-main .mt {
  display: inline-block;
  display: block;
  padding: 10px;
  height:40px;
  width:auto;
}
.mod-main .mt .extra-l {
  float:left;
}
.mod-main .mt .extra-l li {
  float: left;
  padding-left: 20px;
}
.mod-main .mt .extra-l li a.curr {
  padding-bottom: 0;
  color: #e4393c;
  border-bottom: 2px solid #e4393c;
  font-weight: 700;
  cursor: pointer;
  text-decoration: none;
}
.mod-main .mt .extra-l li a {
  display: inline-block;
  padding-bottom: 2px;
  color: #999;
}
.mod-main .mc {
  overflow: visible;
}
.user-set {
  background-color: #fff;
  padding: 20px 5px 0 15px;
}
.userset-lcol {
  float: left;
  width: 500px;
}
.form .item {
  display: inline-block;
  display: block;
  margin-bottom: 20px;
  line-height: 30px;
  height:30px;
}
.form .item span.label {
  float: left;
  height: 18px;
  line-height: 18px;
  padding: 6px 0;
  width: 100px;
  text-align: right;
}
.form em {
  color: #e4393c;
}
.ml10 {
  margin-left: 10px;
}
.ftx-05, .ftx05 {
  color: #005ea7;
}
 .ftx03 {
  color: #999;
}
.form .itxt {
  line-height: 18px;
  border: 1px solid #ccc;
  padding: 5px;
  float: none;
  font-family: "Microsoft YaHei";
  font-size: 12px;
}
.form .itxt{
  height: 18px;
  width: 127px;
  padding: 5px 23px 5px 5px;
}
.form .jdradio {
  float: none;
  vertical-align: -2px;
  
  margin: 0 3px 0 0;
  padding: 0;
}
.form .selt {
  line-height: 18px;
  border: 1px solid #ccc;
  padding: 5px;
  float: none;
  font-family: "Microsoft YaHei";
  font-size: 12px;
}
.form .selt1 {
  width: 70px;
}

.name1{
	
}

	  select, button {
  margin: 0em;
  font:normal normal normal 13.3333330154419px/normal Arial;
  text-rendering: auto;
  color: initial;
  letter-spacing: normal;
  word-spacing: normal;
  text-transform: none;
  text-indent: 0px;
  text-shadow: none;
  display: inline-block;
  text-align: start;
}
select {
  -webkit-appearance: menulist;
  box-sizing: border-box;
  align-items:center;
  border: 1px solid;
  border-image-source: initial;
  border-image-slice: initial;
  border-image-width: initial;
  border-image-outset: initial;
  border-image-repeat: initial;
  white-space:pre;
  -webkit-rtl-ordering: logical;
  color:black;
  background-color:white;
  cursor: default;
}

.mr10 {
  margin-right: 10px;
}
.btn-5{
	  border-radius: 2px;
  display: inline-block;
  height: 18px;
  line-height: 18px;
  border: 1px solid #bfd6af;
  padding: 2px 14px 3px;
	  background-color: #f5fbef;
	  color: #323333;
  text-decoration: none;
}
#user-info {
  overflow: hidden;
  width: 280px;
  float: left;
  padding: 10px;
  margin-bottom: 10px;
  height: 102px;
  background: #f9f9f9;
  border: 1px solid #ccc;
  color: #666;
  line-height: 20px;
}
#user-info .u-pic {
  position: relative;
  z-index: 0;
  float: left;
  width: 104px;
  height: 104px;
  overflow: hidden;
  text-align:center;
  margin-right: 6px;
}
img {
  border: 0;
  vertical-align: middle;
}
#user-info .u-pic img {
  width: 100px;
  height: 100px;
}
#user-info .u-pic .mask {
  background: url(img/myjd-bg2.png) 0 0;
  width: 104px;
  height: 104px;
  position: absolute;
  left: 0;
  top: 0;
  z-index: 2;
}
#user-info .u-pic .face-link-box {
  display: none;
  background: #000;
  z-index: 1;
  position: absolute;
  width: 100px;
  text-align: center;
  left: 0;
  bottom: 4px;
  height: 30px;
  opacity: .5;
 
}
#user-info .u-pic .face-link {
  display: none;
  position: absolute;
  width: 100px;
  text-align:center;
  left: 0;
  bottom: 4px;
  height: 30px;
  line-height: 30px;
  overflow: hidden;
  color: #fff;
  z-index: 3;
}
#user-info .info-m {
  float: left;
  width: 170px;
}
 b {
  font-weight: bold;
}
#user-info .info-m .u-level {
  margin-bottom: 5px;
  height: 18px;
}
#user-info .info-m .u-level .rank {
  margin-right: 10px;
}
#user-info .info-m .u-level .rank s {
  background: url(img/rank2014.gif) no-repeat 0 0;
  display: inline-block;
  height: 17px;
  margin-right: 5px;
  text-decoration: none;
  width: 17px;
  vertical-align: middle;
  overflow: hidden;
}
#user-info a {
  color: #005ea7;
}
#user-info .info-m .u-level .rank a {
  display: inline-block;
  vertical-align: middle;
}
.ftx05 {
  color: #005ea7;
}
.fr {
  float: right;
}
.ml5 {
  margin-left: 5px;
}

.n:hover{
	cursor:pointer;
}
		</style>
	</head>

	<body>
	 <%
                        
                        	ClientUser user1 = (ClientUser)session.getAttribute("user");
                         %>
		<!--最顶上的一条开始-->
		<div id="shortcut">
			<div class="w">
				<ul class="fl">
					<li class="dorpdown" id="ttbar-mycity">
						<div class="dt cw-icon area-text-wrap">
							<i class="ci-right"><s>◇</s></i> 送至：
							<span class="area-text" title="北京">北京</span>
						</div>

						<div class="dd dorpdown-layer">
							<div class="dd-spacer"></div>
							<div class="area-content-wrap">
								<div class="area-content">
									<div class="area-content-list">
										<div class="item">
											<a href="" class="selected">北京</a>
										</div>
										<div class="item">
											<a href="">上海</a>
										</div>
										<div class="item">
											<a href="">天津</a>
										</div>
										<div class="item">
											<a href="">重庆</a>
										</div>
										<div class="item">
											<a href="">河北</a>
										</div>
										<div class="item">
											<a href="">山西</a>
										</div>
										<div class="item">
											<a href="">河南</a>
										</div>
										<div class="item">
											<a href="">辽宁</a>
										</div>
										<div class="item">
											<a href="">吉林</a>
										</div>
										<div class="item">
											<a href="">黑龙江</a>
										</div>
										<div class="item">
											<a href="">内蒙古</a>
										</div>
										<div class="item">
											<a href="">江苏</a>
										</div>
										<div class="item">
											<a href="">山东</a>
										</div>
										<div class="item">
											<a href="">安徽</a>
										</div>
										<div class="item">
											<a href="">浙江</a>
										</div>
										<div class="item">
											<a href="">福建</a>
										</div>
										<div class="item">
											<a href="">湖北</a>
										</div>
										<div class="item">
											<a href="">湖南</a>
										</div>
										<div class="item">
											<a href="">广东</a>
										</div>
										<div class="item">
											<a href="">广西</a>
										</div>
										<div class="item">
											<a href="">江西</a>
										</div>
										<div class="item">
											<a href="">四川</a>
										</div>
										<div class="item">
											<a href="">海南</a>
										</div>
										<div class="item">
											<a href="">贵州</a>
										</div>
										<div class="item">
											<a href="">云南</a>
										</div>
										<div class="item">
											<a href="">西藏</a>
										</div>
										<div class="item">
											<a href="">陕西</a>
										</div>
										<div class="item">
											<a href="">甘肃</a>
										</div>
										<div class="item">
											<a href="">青海</a>
										</div>
										<div class="item">
											<a href="">宁夏</a>
										</div>
										<div class="item">
											<a href="">新疆</a>
										</div>
										<div class="item">
											<a href="">台湾</a>
										</div>
										<div class="item">
											<a href="">香港</a>
										</div>
										<div class="item">
											<a href="">澳门</a>
										</div>
										<div class="item">
											<a href="">钓鱼岛</a>
										</div>
										<div class="item">
											<a href="" target="_blank">海外</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
				<ul class="fr">
					<li class="fore1" id="ttbar-login">
						<a href="" class="link-login"><%=user1.getUserAccount() %></a>&nbsp;&nbsp;
						<a href="../JD/JD_register.html" class="link-regist style-red">退出</a>
					</li>
					<li class="spacer"></li>
					<li class="fore2">
						<div class="dt">
							<a target="_blank" href="">我的订单</a>
						</div>
					</li>
					<li class="spacer"></li>
					<li class="fore3 dorpdown" id="ttbar-myjd">
						<div class="dt cw-icon">
							<i class="ci-right"><s>◇</s></i>
							<a target="_blank" href="">我的京东</a>
						</div>
						<div class="dd dorpdown-layer">
							<div class="dd-spacer"></div>
							<div class="userinfo">
								<div class="u-pic">
									<a href=""><img src="img/no-img_mid_.jpg" width="60" height="60"></a>
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
										<a href="" clstag="" target="_blank">待处理订单<span id="num-unfinishedorder"></span></a>
									</div>
									<div class="item">
										<a href="" clstag="" target="_blank">咨询回复<span id="num-consultation"></span></a>
									</div>
									<div class="item">
										<a href="" clstag="" target="_blank">降价商品<span id="num-reduction"></span></a>
									</div>
									<div class="item">
										<a href="" clstag="" target="_blank">返修退换货</a>
									</div>
								</div>
								<div class="fore2">
									<div class="item">
										<a href="" clstag="" target="_blank">我的关注</a>
									</div>
									<div class="item">
										<a href="" clstag="" target="_blank">我的京豆</a>
									</div>
									<div class="item">
										<a href="" clstag="" target="_blank">我的理财</a>
									</div>
									<div class="item baitiao">
										<a href="" target="_blank">京东白条</a>
									</div>
								</div>
							</div>
							<div class="viewlist" style="display:none;">
								<div class="smt">
									<h4>我的足迹</h4>
									<span class="extra">
										<a target="_blank" href="">更多&nbsp;&gt;</a>
									</span>
								</div>
								<div class="smc"></div>
							</div>
						</div>
					</li>
					<li class="spacer"></li>
					<li class="fore4">
						<div class="dt">
							<a target="_blank" href="">京东会员</a>
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
							<i class="ci-left"></i>
							<i class="ci-right"><s>◇</s></i>
							<a target="_blank" href="">手机京东</a>
						</div>
						<div class="dd dorpdown-layer">
							<div class="dd-spacer"></div>
							<div class="dd-inner" id="ttbar-apps-main">
								<a href="" class="link link1" target="_blank">京东客户端</a>
								<a href="" class="link link3" target="_blank">京东钱包客户端</a>
								<a href="" class="link link4">新人专享188元大礼包</a>
								<a href="" class="link link5">扫一扫封顶立减999元</a>
								<a href="" class="applink jdapp-ios" target="_blank">京东客户端ios版</a>
								<a href="" class="applink jdapp-android" target="_blank">京东客户端android版</a>
								<a href="" class="applink jdapp-ipad" target="_blank">京东客户端ipad版</a>
								<a href="" class="applink wyapp-ios" target="_blank">京东钱包客户端ios版</a>
								<a href="" class="applink wyapp-android" target="_blank">京东钱包客户端android版</a>
							</div>
						</div>
					</li>
					<li class="spacer"></li>
					<li class="fore7 dorpdown" id="ttbar-atte">
						<div class="dt cw-icon">
							<i class="ci-right"><s>◇</s></i>关注京东
						</div>
						<div class="dd dorpdown-layer"></div>
						<div class="dd dorpdown-layer">
							<div class="dd-spacer"></div>
							<div class="dd-inner" id="ttbar-atte-main">
								<img src="img/top/54c84f72Ncc1a02a2.jpg" alt="关注京东">
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
							<div class="item">
								<a href="" target="_blank" true="">售后服务</a>
							</div>
							<div class="item">
								<a href="" target="_blank" true="">在线客服</a>
							</div>
							<div class="item">
								<a href="" target="_blank" true="">意见建议</a>
							</div>
							<div class="item">
								<a href="" target="_blank" true="">电话客服</a>
							</div>
							<div class="item">
								<a href="" target="_blank" true="">客服邮箱</a>
							</div>
							<div class="item-business">商户</div>
							<div class="item">
								<a href="" target="_blank" true="">京东商学院</a>
							</div>
							<div class="item">
								<a href="" target="_blank" true="">商家入驻</a>
							</div>
						</div>
					</li>
					<li class="spacer"></li>
					<li class="fore9 dorpdown" id="ttbar-navs" clstag="h|keycount|2015|01j" data-load="1">
						<div class="dt cw-icon">
							<i class="ci-right"><s>◇</s></i>网站导航
						</div>
						<div class="dd dorpdown-layer">
							<div class="dd-spacer"></div>
							<dl class="fore1"> <dt>特色主题</dt>
								<dd>
									<div class="item">
										<a href="//pinpaijie.jd.com/" target="_blank">品牌街</a>
									</div>
									<div class="item">
										<a href="//hao.jd.com/" target="_blank">好物100</a>
									</div>
									<div class="item">
										<a href="//xinpin.jd.com/presale.html " target="_blank">京东预售</a>
									</div>
									<div class="item">
										<a href="//zan.jd.com" target="_blank">尖er货</a>
									</div>
									<div class="item">
										<a href="//xinpin.jd.com/new.html" target="_blank">京东首发</a>
									</div>
									<div class="item">
										<a href="//tuan.jd.com/homevirtual-beijing.html" target="_blank">今日团购</a>
									</div>
									<div class="item">
										<a href="//youhuiquan.jd.com/" target="_blank">优惠券</a>
									</div>
									<div class="item">
										<a href="//red.jd.com/" target="_blank">闪购</a>
									</div>
									<div class="item">
										<a href="//vip.jd.com/" target="_blank">京东会员</a>
									</div>
									<div class="item">
										<a href="//miao.jd.com/" target="_blank">秒杀</a>
									</div>
									<div class="item">
										<a href="//ding.jd.com/" target="_blank">定期送</a>
									</div>
									<div class="item">
										<a href="//diy.jd.com/" target="_blank">装机大师</a>
									</div>
									<div class="item">
										<a href="//hao.jd.com/hwy.html" target="_blank">新奇特</a>
									</div>
									<div class="item">
										<a href="//try.jd.com/" target="_blank">京东试用</a>
									</div>
									<div class="item">
										<a href="//gift.jd.com/" target="_blank">礼品购</a>
									</div>
									<div class="item">
										<a href="//smarthome.jd.com/" target="_blank">智能馆</a>
									</div>
									<div class="item">
										<a href="//sale.jd.com/act/tp6KfYH7wb.html" target="_blank">玩bigger</a>
									</div>
									<div class="item">
										<a href="//sale.jd.com/act/rKhJit1fWVDR.html" target="_blank">大牌免息</a>
									</div>
									<div class="item">
										<a href="//sale.jd.com/act/3je8ZTCxNl6SusId.html " target="_blank">北京老字号</a>
									</div>
								</dd>
							</dl>
							<dl class="fore2"> <dt>行业频道</dt>
								<dd>
									<div class="item">
										<a href="//channel.jd.com/fashion.html" target="_blank">服装城</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/electronic.html" target="_blank">家用电器</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/computer.html" target="_blank">电脑办公</a>
									</div>
									<div class="item">
										<a href="//shouji.jd.com/" target="_blank">手机</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/beauty.html" target="_blank">美妆馆</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/chaoshi.html" target="_blank">食品</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/digital.html" target="_blank">数码</a>
									</div>
									<div class="item">
										<a href="//baby.jd.com/" target="_blank">母婴</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/jiazhuang.html" target="_blank">家装城</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/sports.html" target="_blank">运动户外</a>
									</div>
									<div class="item">
										<a href="http://car.jd.com" target="_blank">整车</a>
									</div>
									<div class="item">
										<a href="//book.jd.com/" target="_blank">图书</a>
									</div>
									<div class="item">
										<a href="//nong.jd.com/" target="_blank">农资频道</a>
									</div>
									<div class="item">
										<a href="//smart.jd.com/" target="_blank">京东智能</a>
									</div>
								</dd>
							</dl>
							<dl class="fore3"> <dt>生活服务</dt>
								<dd>
									<div class="item">
										<a href="//z.jd.com/" target="_blank">京东众筹</a>
									</div>
									<div class="item">
										<a href="//baitiao.jd.com/activity/third" target="_blank">白条</a>
									</div>
									<div class="item">
										<a href="https://www.jdpay.com/" target="_blank">京东钱包</a>
									</div>
									<div class="item">
										<a href="//trade.jr.jd.com/myxjk/jrbincome.action" target="_blank">京东小金库</a>
									</div>
									<div class="item">
										<a href="//licai.jd.com/" target="_blank">理财</a>
									</div>
									<div class="item">
										<a href="//chongzhi.jd.com/" target="_blank">话费</a>
									</div>
									<div class="item">
										<a href="//trip.jd.com/" target="_blank">旅行</a>
									</div>
									<div class="item">
										<a href="//caipiao.jd.com/" target="_blank">彩票</a>
									</div>
									<div class="item">
										<a href="//game.jd.com/" target="_blank">游戏</a>
									</div>
									<div class="item">
										<a href="//jipiao.jd.com/" target="_blank">机票酒店</a>
									</div>
									<div class="item">
										<a href="//movie.jd.com/" target="_blank">电影票</a>
									</div>
									<div class="item">
										<a href="//jiaofei.jd.com/" target="_blank">水电煤</a>
									</div>
									<div class="item">
										<a href="//daojia.jd.com/html/welcome.html" target="_blank">京东到家</a>
									</div>
									<div class="item">
										<a href="//smartcloud.jd.com/app" target="_blank">京东微联</a>
									</div>
									<div class="item">
										<a href="//try-smart.jd.com/" target="_blank">京东众测</a>
									</div>
								</dd>
							</dl>
							<dl class="fore4"> <dt>更多精选</dt>
								<dd>
									<div class="item">
										<a href="http://group.jd.com" target="_blank">京东社区</a>
									</div>
									<div class="item">
										<a href="//mobile.jd.com/index.do" target="_blank">京东通信</a>
									</div>
									<div class="item">
										<a href="//read.jd.com/" target="_blank">在线读书</a>
									</div>
									<div class="item">
										<a href="//o.jd.com/market/index.action" target="_blank">京东E卡</a>
									</div>
									<div class="item">
										<a href="http://group.jd.com/site/20000121/20000032.htm" target="_blank">智能社区</a>
									</div>
									<div class="item">
										<a href="http://group.jd.com/index/20000001.htm" target="_blank">游戏社区</a>
									</div>
									<div class="item">
										<a href="//you.jd.com/index.html?entrance=jd_home" target="_blank">京友邦</a>
									</div>
									<div class="item">
										<a href="//sale.jd.com/act/wQTpIm7GnXE.html" target="_blank">卖家入驻</a>
									</div>
									<div class="item">
										<a href="//b.jd.com/" target="_blank">企业采购</a>
									</div>
									<div class="item">
										<a href="//fw.jd.com/" target="_blank">服务市场</a>
									</div>
									<div class="item">
										<a href="//zhaomu.jd.com/XCDLzm.html" target="_blank">乡村招募</a>
									</div>
									<div class="item">
										<a href="//zhaomu.jd.com/intro.html" target="_blank">校园加盟</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/office.html" target="_blank">办公生活馆</a>
									</div>
									<div class="item">
										<a href="//ipr.jd.com/" target="_blank">知识产权维权</a>
									</div>
									<div class="item">
										<a href="//en.jd.com/" target="_blank">English Site</a>
									</div>
								</dd>
							</dl>
						</div>
					</li>
				</ul>

			</div>

		</div>
		<!--最顶上的一条结束-->

		<!--京东 我的京东 红色横幅-->
		<div id="nav">
			<div class="w">
				<div class="logo">
					<a href="" target="_blank" class="fore1"></a>
					<a href="" target="_self" class="fore2">我的京东</a>
					<a href="" target="_blank" class="fore3">返回京东首页</a>
				</div>
				<div class="navitems">
					<ul>
						<li class="fore-1">
							<a target="_self" href="">首页</a>
						</li>
						<li class="fore-3">
							<div class="dl">
								<div class="dt">
									<span class="myjd-set">账户设置</span>
									<b></b>
								</div>
								<div class="dd">

									<a><span>个人信息</span></a>

									<a><span>账户安全</span></a>

									<a><span>账号绑定</span></a>

									<a><span>我的级别</span></a>

									<a><span>收货地址</span></a>

									<a><span>分享绑定</span></a>

									<a><span>邮件订阅</span></a>

									<a><span>消费记录</span></a>

									<a><span>应用授权</span></a>

									<a><span>快捷支付</span></a>

									<a><span>增票资质</span></a>
									<a><span>企业发票</span></a>
									<a><span>采购需求单</span></a>
								</div>
							</div>
						</li>
						<li class="fore-4">
							<div class="dl myjd-info">
								<div class="dt ">
									<span>社区</span>
									<b></b>
								</div>
								<div class="dd">
									<a><span>个人主页</span></a>
									<a target="_self"><span>我的活动</span></a>

									<a target="_self"><span>我的圈子</span></a>

									<a target="_self"><span>我的帖子</span></a>
								</div>
							</div>
						</li>
						<li class="fore-5">
							<a>消息<i></i></a>
						</li>
					</ul>
				</div>
				<div class="nav-r">
					<div id="search-2014">
						<ul id="shelper" class="hide" style="display: none;"></ul>
						<div class="form">
							<input type="text" onkeydown="javascript:if(event.keyCode==13) search('key');" autocomplete="off" id="key" accesskey="s" class="text">
							<button onclick="search('key');return false;" class="button cw-icon" type="button"><i></i>搜索</button>
						</div>
					</div>
					<div id="settleup-2014" class="dorpdown">
						<div class="cw-icon">
							<i class="ci-left"></i>
							<i class="ci-right">&gt;</i><i class="ci-count" id="shopping-amount">1</i>
							<a target="_blank" href="">我的购物车</a>
						</div>

					</div>

				</div>
				<div class="clr"></div>
			</div>
		</div>
		<!--红色横幅结束-->
	<!--  主体内容开始    -->
	<div id="container">
    <div class="w">    
        <div id="content">
			<div id="sub">
<div id="menu">
	<dl class="fore1">
		<dt id="_MYJD_setting">设置</dt>
		<dd class="fore1_1 curr" id="_MYJD_info">
			<a  href="" target="_self">个人信息</a>
		</dd>
		<dd class="fore1_2" id="_MYJD_safe">
			<a  href="" target="_self">账户安全</a>
		</dd>
		<dd class="fore1_3" id="_MYJD_accbinde">
			<a  href="" target="_self">账号绑定</a>
		</dd>
		<dd class="fore1_4" id="_MYJD_grade">
			<a  href="" target="_self">我的级别</a>
		</dd>
		<!--<dd class="fore1_5" id="_MYJD_comments">
			<a  href="" target="_self">收货地址</a>
		</dd>-->
		<dd class="fore1_6" id="_MYJD_share">
			<a  href="" target="_self">分享绑定</a>
		</dd>
		<dd class="fore1_7" id="_MYJD_rss">
			<a  href="" target="_self">邮件订阅</a>
		</dd>
		<dd class="fore1_8" id="_MYJD_recor">
			<a href="" target="_self">消费记录</a>
		</dd>
		<dd class="fore1_9" id="_MYJD_app">
			<a  href="" target="_blank">应用授权</a>
		</dd>
		<dd class="fore1_10" id="_MYJD_pay">
			<a  href="" target="_blank">快捷支付</a>
		</dd>
		<dd class="fore1_11" id="_MYJD_zpzz">
			<a  href="" target="_self">增票资质</a>
		</dd>
		<dd class="fore1_12" id="_MYJD_qyfp">
			<a  href="" target="_self">企业发票</a>
		</dd>
		<dd class="fore1_13" id="_MYJD_cgxqd">
			<a  href="" target="_self">采购需求单</a>
		</dd>
	</dl>
</div>
			</div>
			
    		<div id="main">
                <div class="mod-main">
                    <div class="mt">
                        <ul class="extra-l">
                            <li class="fore-1"><a class="curr" href="">基本信息</a></li>
                            <li class="fore-2"><a href="">头像照片</a></li>
                            
                            
                        </ul>
                        
                       
                    </div>
                    <div class="mc">
                        <div class="user-set userset-lcol">
                            <div class="form">
                                <div class="item">
                                    <span class="label">用户名：</span>
                                    <div class="fl name1">
                                        <div><strong><%=user1.getUserAccount() %></strong></div>
                                    </div>
                                </div>
                                <div class="item" id="aliasArea">
                                        <span class="label"><em>*</em>登录名：</span>
                                        <div class="fl" id="aliasBefore">
                                                <strong><%=user1.getUserAccount() %></strong>
                                                <a href="javascript:void(0)" class="ftx-05 ml10" onclick="changeAliasName()" >修改</a>
                                                 <span class="ftx03">可用于登录，请牢记哦~</span>
                                            <div class="clr"></div><div class="prompt-06"><span id="aliasNameBefore_msg"></span></div>
                                        </div>
                                        <div class="fl" id="aliasAfter" style="display: none">
                                            <input  type="text" class="itxt" maxlength="20" id="aliasName" name="aliasName" value="<%=user1.getUserAccount() %>">
                                            <input type="hidden" id="hiddenAliasName" value="<%=user1.getUserAccount() %>">
                                            <span class="ftx03">可用于登录，请牢记哦~</span>
                                            <div class="clr"></div><div class="prompt-06"><span id="aliasName_msg"></span></div>
                                            <div class="prompt-error" style="display:none" ><span id="aliasName_msg"></span></div>
                                        </div>

                                </div>
                                <div class="item">
                                    <span class="label"><em>*</em>昵称：</span>
                                    <div class="fl">
                                        <input  type="text" class="itxt" maxlength="20" id="nickName" name="userVo.nickName" value="<%=user1.getNickname() %>">
                                        <div class="clr"></div><div class="prompt-06"><span id="nickName_msg"></span></div>
                                    </div>
                                </div>
                                <div class="item">
                                    <span class="label"><em>*</em>性别：</span>
                                    <div class="fl" >
                                    <%
                                    	if(user1.getSex()==0){
                                    		out.println("<input type='radio' name='sex' class='jdradio' value='0' checked='checked'><label class='mr10'>男</label>");
                                    	}else{
                                    		out.println("<input type='radio' name='sex' class='jdradio' value='0'><label class='mr10'>男</label>");
                                    	}
                                    	
                                    	if(user1.getSex()==1){
                                    		out.println("<input type='radio' name='sex' class='jdradio' value='1' checked='checked'><label class='mr10'>女</label>");
                                    	}else{
                                    		out.println("<input type='radio' name='sex' class='jdradio' value='1'><label class='mr10'>女</label>");
                                    	}
                                    	
                                    	if(user1.getSex()==2){
                                    		out.println("<input type='radio' name='sex' class='jdradio' value='2' checked='checked'><label class='mr10'>保密</label>");
                                    	}else{
                                    		out.println("<input type='radio' name='sex' class='jdradio' value='2'><label class='mr10'>保密</label>");
                                    	}
                                     %>
                                        
                                       
                                        
                                    </div>
                                </div>
                                <div class="item" >
                                    <span class="label">年龄：</span>
                                    <div class="fl birthday-info">
                                        <select name="" class="selt selt1" id="birthdayYear"><option value="0" disabled="" selected="selected">请选择：</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="80后">80后</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="70后">70后</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="60后">60后</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="50后">50后</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="40后">40后</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option><option value="30后">30后</option><option value="1939">1939</option><option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option></select>
                                        <label class="ml5 mr5">岁</label>
                                        
                                       
                                    </div>
                                </div>

                                
								
								
                                <div class="item" >
                                    <span class="label"><em>*</em>真实姓名：</span>
                                    <div class="fl">
                                        <input  type="text" class="itxt" maxlength="20" name="userVo.realName" id="realName" value="">
                                        <div class="clr"></div><div class="prompt-06"><span id="realName_msg"></span></div>
                                    </div>
                                </div>
                                
                                <div class="item">
                                    <span class="label">&nbsp;</span>
                                    <div class="fl">
                                        <input id="code" value="134912" style="display:none">
                                        <input id="rkey" value="736e6f5f315f67657455736572496e666fced7c2b7313334393132" style="display:none">
                                        <a class="btn-5 n" onclick="tijiao()">提交</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="user-info">
                            <div class="u-pic">
                                <img alt="用户头像" src="img/no-img_mid_.jpg" ks_mark="y">
                                <div class="mask"></div>
                                <div class="face-link-box"></div>
                                <a href="" class="face-link">修改头像</a>
                            </div>
                            <div class="info-m">
								<div><b>用户名：（<%=user1.getNickname() %>）</b></div>
                                <div class="u-level">
									<span class="rank r3">
										<s></s><a  href="" target="_blank">注册会员</a>
									</span>
                                </div>
                                <!--<div class="shop-level">购物行为评级：<span><a target="_blank" href="//vip.jd.com/help_behaviorRating.html">
									<s id="userCredit" class="rank-sh rank-sh01"></s></a></span></div> -->
                                                            <div clstag="pageclick|keycount|201602251|4">小白信用：<a href="//credit.jd.com" target="_blank">开通后可查看</a></div>
                                                            <div>会员类型：个人用户</div>
                            </div>
                        </div>
						<div class="fr ac" style="width:280px;">
							  注：修改手机和邮箱请到<a  class="ml5 ftx05" href="">账户安全</a>
						</div>
                        <div class="clr"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
	<script src="js/jquery-2.1.4.js"></script>
	<script type="text/javascript">
		$(function(){
			
			
			$("#nickName").blur(function(){
				var username = $("#nickName").val();
				if(username==""){
					alert("请输入新的昵称");
				}
			});
			
			$("#realsName").blur(function(){
				var username = $("#realName").val();
				if(username==""){
					alert("请输入真实姓名");
				}
			});
			
			$("#nickName").blur(function(){
			
				//发送ajax进行检查是不是重复登录名
				var username = $("#nickName").val();
				var userAfter = $(".name1").text().trim();
				
				if(username==""){
					alert("请输入新的登录名");
				}else if(userAfter==username){
					
					$("#aliasName").addClass("itxt-succ");
				}else{
					$.post("UserServlet",{
						"action":"checkUserAccount",
						"userAccount":(""+username),
					},function(data,status){
					
						if(data=="没有该用户名"){
							$("#aliasName").addClass("itxt-succ");
						}else{
						$("#aliasName").addClass("itxt-error");
							alert("该登录名已被使用，请您更换哦^_^");
							
						}
					},"text");
				}
				
			}).focus(function(){
				$("#aliasName").removeClass("itxt-succ");
				$("#aliasName").removeClass("itxt-error");
				$("#aliasName_msg").parent().hide();
			});
			
			$("#nickName").blur(function(){
			
				//发送ajax进行检查是不是重复登录名
				var username = $("#nickName").val();
				var userAfter = $(".name1").text().trim();
				
				if(username==""){
					alert("请输入新的昵称");
				}else if(userAfter==username){
					
					$("#nickName").addClass("itxt-succ");
				}else{
					$.post("UserServlet",{
						"action":"checkNickname",
						"nickName":(""+username),
					},function(data,status){
					
						if(data=="没有该用户名"){
							$("#nickName").addClass("itxt-succ");
						}else{
						$("#nickName").addClass("itxt-error");
							alert("该昵称已被使用，请您更换哦^_^");
							
						}
					},"text");
				}
				
			}).focus(function(){
				$("#aliasName").removeClass("itxt-succ");
				$("#aliasName").removeClass("itxt-error");
				$("#aliasName_msg").parent().hide();
			});
			
			$("#aliasName").blur(function(){
			
				//发送ajax进行检查是不是重复登录名
				var username = $("#aliasName").val();
				var userAfter = $(".name1").text().trim();
				
				if(username==""){
					alert("请输入新的登录名");
				}else if(userAfter==username){
					
					$("#aliasName").addClass("itxt-succ");
				}else{
					$.post("UserServlet",{
						"action":"checkUserAccount",
						"userAccount":(""+username),
					},function(data,status){
					
						if(data=="没有该用户名"){
							$("#aliasName").addClass("itxt-succ");
						}else{
						$("#aliasName").addClass("itxt-error");
							alert("该登录名已被使用，请您更换哦^_^");
							
						}
					},"text");
				}
				
			}).focus(function(){
				$("#aliasName").removeClass("itxt-succ");
				$("#aliasName").removeClass("itxt-error");
				$("#aliasName_msg").parent().hide();
			});
		});
		
		function changeAliasName(){
			var value = "<%=user1.getUserAccount()%>";
			$("#aliasBefore").hide();
			$("#aliasAfter").show();
			$("#aliasName").val(value);
			$("#hiddenAliasName").val(value);
			$("#aliasName").focus();
		}
		
		function tijiao(){
			var userAfter = $(".name1").text();
			var aliasName = $("#aliasName").val();
			var nickName = $("#nickName").val();
			var sex = $("input[name=sex]:checked").val();
			var birthdayYear = $("#birthdayYear").val();
			var realName = $("#realName").val();
			if(!birthdayYear){
				birthdayYear = "0";
			}
			if(aliasName!=""&&nickName!=""&&sex!=""&&realName!=""){
				location.assign("UserServlet?action=updateUser&userAfter="+userAfter+"&aliasName="+aliasName+"&nickName="+nickName+"&sex="+sex+"&birthdayYear="+birthdayYear+"&realName="+realName);
			}else{
				alert("请输入完整的修改信息");
			}
		}
	</script>
	</body>

</html>