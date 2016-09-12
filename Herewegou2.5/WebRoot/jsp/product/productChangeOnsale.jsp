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


	<div class="categoryMain-panel">

		<div class="search-bar">
			<input class="input-text search-input"
				value="<%=request.getAttribute("condition")%>">
			<button class="btn search-btn">搜索</button>
		</div>

		<div class="categoryMain-list">
			<ul class="title">
				<li>商品编号</li>
				<li>商品名称</li>
				<li>商品描述</li>
				<li>父级种类</li>
				<li>操作</li>
			</ul>

			<%
				List<Product> list = (List<Product>)request.getAttribute("list");
															Iterator<Product> it = list.iterator();
															while(it.hasNext()){
																Product p = it.next();
			%>
			<ul class="item">
				<li class="cid-li"><%=p.getCid()%></li>
				<li><%=p.getPname()%></li>
				<li><%=p.getPdesc()%></li>
				<li><%=p.getDianpuName()%></li>
				<li class="operation-li">
					<button data-pid="<%=p.getPid()%>" class="btn update-btn">修改</button>
					<button data-pid="<%=p.getPid()%>" class="btn delete-btn">删除</button>
				</li>
			</ul>
			<%
				}
			%>



		</div>

		<div class="page-controller">
			<form action="ProductServlet?action=getAllProductByPage"></form>
			<%
				PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
			%>
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

			//点击修改按钮
			$updateBtn.click(function() {
				toUpdateJsp($(this).data("pid"));
			});

			//点击删除按钮
			$deleteBtn.click(function() {
				deleteProduct($(this).data("pid"));
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
				assignContent("getProductPageByCondition", 1);
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
					assignContent("getAllProductByPage", 1);
				});

				$(".previous-page-btn").click(
						function() {
							assignContent("getAllProductByPage",
	<%=pageInfo.getPreviousPage()%>
		);
						});
			}

			if (<%=pageInfo.getCurrentPage()%>==<%=pageInfo.getAllPageCount()%>) {

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
							assignContent("getAllProductByPage",
	<%=pageInfo.getAllPageCount()%>
		);
						});
				$(".next-page-btn").click(function() {
					assignContent("getAllProductByPage",
	<%=pageInfo.getNextPage()%>
		);
				});
			}

		});

		function changePage(currentPage) {
			assignContent("getAllProductByPage", currentPage);
		}

		function deleteProduct(cid) {
			$.confirm({
				title : ' ',
				content : '确定删除吗？',
				confirm : function() {
					assignContent("deleteProduct",
	<%=pageInfo.getCurrentPage()%>
		, cid);
				},
				cancel : function() {

				}
			});
		};

		function toUpdateJsp(cid) {

			assignContent("toUpdateProductJsp",
	<%=pageInfo.getCurrentPage()%>
		, cid);

		};

		function assignContent(action, currentPage, cid) {
			location.assign("ProductServlet?action=" + action + "&cid=" + cid
					+ "&currentPage=" + currentPage + "&condition="
					+ $(".search-input").val());
		};
	</script>


</body>
</html>
