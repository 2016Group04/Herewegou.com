<%@ page language="java"
	import="java.util.*,com.vo.OrderForm,com.page.PageInfo,com.vo.OrderForm,com.vo.ClientUser,com.vo.Product"
	pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>My JSP 'orderMain.jsp' starting page</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css"
	href="../../js/jQuery-confirm/jquery-confirm.css">
<link rel="stylesheet" type="text/css" href="../../css/style.css">
<style type="text/css">
	.more-btn {
		border-radius: 50px;
		background-color: #E5E5E5;
	}
	
	 p.div1{
	 	position:absolute;
	 	z-index:10;
		width:500px;
		border-radius:13px;
		background-color:#E5E5E5;
		font-size:14px;
		
	} 
	
	p.div1 ul li{
		width:60px;
		height:10px;
		line-height:10px;
	}
	
	p.div1 ul li.item1{
		text-align: left;
	}
	
	p.div1 table{
		table-layout:fixed;
	}
	
	p.div1 table td{
	overflow:hidden;
	white-space:nowrap;
	text-overflow:ellipsis;
}



.name{

}
</style>
</head>

<body>


	<div class="productMain-panel categoryMain-panel">
		<%
			PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
			Map<OrderForm,Map<String,List<Product>>> map = (Map<OrderForm,Map<String,List<Product>>>)request.getAttribute("map");
			String condition = (String)request.getAttribute("condition");
			Map<OrderForm,ClientUser> user1 = (Map<OrderForm,ClientUser>)request.getAttribute("user");
			//ClientUser user4 = (ClientUser)request.getAttribute("user");
			if(condition.equals("_")){
				condition = "";
			}
		%>

		<div class="search-bar">
			<input class="input-text search-input" value="<%=condition%>">
			<button class="btn search-btn">搜索</button>
		</div>

		<div class="categoryMain-list">
			<ul class="title">
				<li style="width:210px">订单编号</li>
				<li style="width:210px">订单日期</li>				
				<li style="width:100px">金额</li>
				<li style="width:90px">收货人</li>
				<li style="width:90px">订单状态</li>
				<li style="width:80px">详情</li>
				<li style="width:100px">操作</li>
			</ul>

			<%
				Set<OrderForm> list = map.keySet();
				Iterator<OrderForm> it = list.iterator();
					while(it.hasNext()){
						OrderForm p = it.next();
						ClientUser user = user1.get(p);
			%>
			<ul class="item">
				<li style="width:210px" class="cid-li"><%=p.getOrderNumber()%></li>
				<li style="width:210px"><%=p.getOrderdate()%></li>
				<li style="width:100px"><%=p.getTotalPrice()%></li>
				<li style="width:90px"><%=user.getRealName()%></li>
				<li style="width:90px"><%=p.getState()%></li>
				
				<li style="width:80px" class="operation-li">
					<button data-pid="<%=p.getOfid()%>" value="<%=p.getOfid()%>" class="btn more-btn name">...</button>
					<p style="transform:translate(-230px,0)"  class="div1" style="dispaly:none" data-pidv="<%=p.getOfid()%>">
						<table>
							<ul class="title1">
								<li style="width:220px">商品名称</li>
								<li style="width:50px">单价</li>				
								<li style="width:50px">数量</li>
								<li style="width:100px">店铺</li>
								
							</ul>
					<%
						Map<String,List<Product>> map3 = map.get(p);
						
						Set<String> dianpu = map3.keySet();
						
						for(String s:dianpu){
						
							List<Product> list3 = map3.get(s);
						
						Iterator<Product> i1 = list3.iterator();
						
						while(i1.hasNext()){
						
							Product product = i1.next();
							
							%>
							
							
							<ul class="item1">
							<li style="width:220px"><%=product.getPname()%></li>
							<li style="width:50px"><%=product.getPrice()%></li>
							<li style="width:50px"><%=product.getCountInShoppingCart()%></li>
							<li style="width:100px"><%=s%></li>
							</ul>
						
							<%
							}
						}
						
					 %>
					</table>
					</p>
							
				</li>
				<li style="width:100px" class="operation-li">
					<button data-pid="<%=p.getOfid()%>" class="btn update-btn">修改</button>
					<button data-pid="<%=p.getOfid()%>" class="btn delete-btn">取消</button>
				</li>
			</ul>
			<%
				}
			%>



		</div>

		<div class="page-controller">
			<form action="OrderFormServlet?action=getAllOrderFormByPage"></form>

			<button class="btn page-contrl-btn first-page-btn"><<</button>
			<button class="btn page-contrl-btn previous-page-btn"><</button>




			第<select class="pageGoto">
				<%
					for(int i=1;i<=pageInfo.getAllPageCount();i++){
				%>
				<option value="<%=i%>"><%=i%></option>
				<%
					}
				%>

			</select>页 /<label><%=pageInfo.getAllPageCount()%></label>页
			<button class="btn page-contrl-btn next-page-btn">></button>

			<button class="btn page-contrl-btn last-page-btn">>></button>
			每页5条 共<label><%=pageInfo.getAllRecordCount()%></label>条记录
		</div>
	</div>
	<script src="../../js/jquery-1.7.2.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript" src="../../js/AJ_table.js"></script>
	<script type="text/javascript"
		src="../../js/jQuery-confirm/jquery-confirm.js"></script>
	<script type="text/javascript">
		$(function() {
			var c1 = "#5c5251";
			var c2 = "#fff";
			var c3 = "#fafafa";
			
			$("p.div1").hide();

			var $updateBtn = $(".update-btn");
			var $deleteBtn = $(".delete-btn");

			var $pageGoto = $(".pageGoto");

			//隔行换色
			$(".categoryMain-list").css("color", "white");
			$(".categoryMain-list").zebra({
				title : c1,
				oddLine : c2,
				evenLine : c3
			});
			
			$("button.name").mouseover(function(event){
				var value = $(this).val();
				var left = event.clientX;
				$(this).next(("p[data-pidv="+value+"]")).css("top",event.clentY+"px").css("left",(left-30)+"px").show();
			}).mouseout(function(event){
				var value = $(this).val();
				
				$(this).next(("p[data-pidv="+value+"]")).hide();
			});

			//点击修改按钮
			$updateBtn.click(function() {
				toUpdateJsp($(this).data("pid"));
			});

			//点击删除按钮
			$deleteBtn.click(function() {
				deleteOrderForm($(this).data("pid"));
			});

			//选择跳到第几页
			$pageGoto.change(function() {
				changePage($(this).val());
			});

			//select显示当前在第几页
			$pageGoto.val(
	<%=pageInfo.getCurrentPage()%>
		);

			//点击搜索
			$(".search-btn").click(function() {
				assignContent("getOrderFormPageByCondition", 1);
			});

			if (
	<%=pageInfo.getCurrentPage()%>
		== 1) {
				$(".first-page-btn").attr("disabled", true);//在第一页时不可点
				$(".previous-page-btn").attr("disabled", true);

				$(".first-page-btn").addClass("disabled");
				$(".previous-page-btn").addClass("disabled");
			} else {
				$(".first-page-btn").prop("disabled", false);
				$(".previous-page-btn").prop("disabled", false);

				//点击首页、前一、
				$(".first-page-btn").click(function() {
					assignContent("managerOrder", 1);
				});

				$(".previous-page-btn").click(
						function() {
							assignContent("managerOrder",
	<%=pageInfo.getPreviousPage()%>
		);
						});
			}

			if (
	<%=pageInfo.getCurrentPage()%>
		==
	<%=pageInfo.getAllPageCount()%>
		) {

				$(".last-page-btn").prop("disabled", true);//在最后一页时不可点
				$(".next-page-btn").prop("disabled", true);

				$(".last-page-btn").addClass("disabled");
				$(".next-page-btn").addClass("disabled");
			} else {
				$(".last-page-btn").prop("disabled", false);
				$(".next-page-btn").prop("disabled", false);

				//点击尾页、后页
				$(".last-page-btn").click(
						function() {
							assignContent("managerOrder",
	<%=pageInfo.getAllPageCount()%>
		);
						});
				$(".next-page-btn").click(
						function() {
							assignContent("managerOrder",
	<%=pageInfo.getNextPage()%>
		);
						});
			}

		});

		function changePage(currentPage) {
			assignContent("managerOrder", currentPage);
		}

		function deleteOrderForm(pid) {
			$.confirm({
				title : ' ',
				content : '确定删除吗？',
				confirm : function() {
					assignContent("deleteOrderForm",
	<%=pageInfo.getCurrentPage()%>
		, pid);
				},
				cancel : function() {

				}
			});
		};

		function toUpdateJsp(pid) {

			assignContent("toUpdateOrderFormJsp",
	<%=pageInfo.getCurrentPage()%>
		,
					pid);

		};

		function assignContent(action, currentPage, pid) {
			location.assign("../user/OrderServlet?action=" + action + "&pid=" + pid
					+ "&currentPage=" + currentPage + "&condition="
					+ $(".search-input").val());
		};
	</script>


</body>
</html>
