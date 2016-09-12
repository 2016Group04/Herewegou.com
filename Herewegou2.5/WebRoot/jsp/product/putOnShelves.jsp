<%@ page language="java"
	import="java.util.*,com.vo.Product,com.page.PageInfo"
	pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>My JSP 'categoryMain.jsp' starting page</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css"
	href="../../js/jQuery-confirm/jquery-confirm.css">
<link rel="stylesheet" type="text/css" href="../../css/style.css">

</head>

<body>


	<div class="productMain-panel categoryMain-panel">
	<%
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	List<Product> list = (List<Product>)request.getAttribute("list");
	String condition = (String)request.getAttribute("condition");	
	if(condition.equals("_")){condition="";}		
	%>

		<div class="search-bar">
			<input class="input-text search-input"
				value="<%=condition%>">
			<button class="btn search-btn">搜索</button>
		</div>

		<div class="categoryMain-list">
			<ul class="title">
				<li style="width:160px">商品编号</li>
				<li style="width:180px">商品名称</li>
				<li style="width:120px">商品价格(￥)</li>
				<li style="width:100px">商品数量</li>
				<li style="width:160px">店铺名称</li>
				<li style="width:100px">所属种类</li>
				<li style="width:90px" class="operation-title-li" >选 择</li>
			
			</ul>

			<%
				Iterator<Product> it = list.iterator();
				while(it.hasNext()){
					Product p = it.next();
			%>
			<ul class="item">
				<li style="width:160px" class="cid-li"><%=p.getPid()%></li>
				<li style="width:180px"><%=p.getPname()%></li>
				<li style="width:120px"><%=p.getPrice()%></li>
				<li style="width:100px"><%=p.getProductSum()%></li>
				<li style="width:160px"><%=p.getDianpuName()%></li>
				<li style="width:100px"><%=p.getCname()%></li>
				<li style="width:90px" class="operation-li">
					<input data-pid="<%=p.getPid()%>" class="checkbox-input" name="onsale" type="checkbox"></input>
				</li>
			</ul>
			<%
				}
			%>



		</div>

		<div class="page-controller">
			
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
			
			//每次点击checkbox时
			$(".checkbox-input").change(function(){
				if($(".checkbox-input:checked")[0]==undefined){
						$(".operation-title-li").text("选 择");	
					}else{
						$(".operation-title-li").text("");	
						$(".operation-title-li").append("<button id='shelves-btn' class='btn submit-btn' >上 架</button>");												
				}				
				//点击上架
				$("#shelves-btn").click(function(){
					confirmPutOnShelves();
				});
				
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
				assignContent("getOffSaleProductPageWithCondition", 1);
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
					assignContent("toPutOnShelvesjsp", 1);
				});

				$(".previous-page-btn").click(
						function() {
							assignContent("toPutOnShelvesjsp",
	<%=pageInfo.getPreviousPage()%>
		);
						});
			}

			if (<%=pageInfo.getCurrentPage()%>==<%=pageInfo.getAllPageCount()%> || <%=pageInfo.getAllRecordCount()%>==0) {

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
							assignContent("toPutOnShelvesjsp",
	<%=pageInfo.getAllPageCount()%>
		);
						});
				$(".next-page-btn").click(function() {
					assignContent("toPutOnShelvesjsp",
	<%=pageInfo.getNextPage()%>
		);
				});
			}

		});

		function changePage(currentPage) {
			assignContent("toPutOnShelvesjsp", currentPage);
		}

		function confirmPutOnShelves() {
			$.confirm({
				title : ' ',
				content : '确定将已选商品上架吗？',
				confirm : function() {
					var pidStr = "";
					$(".checkbox-input:checked").each(function(){
						pidStr = pidStr +$(this).data("pid") + ",";
					});
					putOnShelves(pidStr);
				},
				cancel : function() {

				}
			});
		};

		
		
		function putOnShelves(pidStr) {
			assignContent("putOnShelves",
				<%=pageInfo.getCurrentPage()%>
				, pidStr);
		}

		function assignContent(action, currentPage, pid) {
			location.assign("ProductServlet?action=" + action + "&pid=" + pid
					+ "&currentPage=" + currentPage + "&condition="
					+ $(".search-input").val());
		};
	</script>


</body>
</html>
