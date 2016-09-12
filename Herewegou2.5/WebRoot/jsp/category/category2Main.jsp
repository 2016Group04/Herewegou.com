<%@ page language="java"
	import="java.util.*,com.vo.Category2,com.page.PageInfo"
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
				<li>商品种类编号</li>
				<li>商品种类名称</li>
				<li style="width:220px">商品种类描述</li>
				<li>父级商品种类</li>
				<li>操作</li>
			</ul>

			<%
				List<Category2> list = (List<Category2>)request.getAttribute("list");
															Iterator<Category2> it = list.iterator();
															while(it.hasNext()){
																Category2 c = it.next();
			%>
			<ul class="item">
				<li class="cid-li"><%=c.getCid()%></li>
				<li><%=c.getCname()%></li>
				<li style="width:220px"><%=c.getCdesc()%></li>
				<li><%=c.getFname()%></li>
				<li class="operation-li">
					<button data-cid="<%=c.getCid()%>" class="btn update-btn">修改</button>
					<button data-cid="<%=c.getCid()%>" class="btn delete-btn">删除</button>
				</li>
			</ul>
			<%
				}
			%>



		</div>

		<div class="page-controller">
			<form action="CategoryServlet?action=getAllCategory2ByPage"></form>
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
				toUpdateJsp($(this).data("cid"));
			});

			//点击删除按钮
			$deleteBtn.click(function() {
				deleteCategory($(this).data("cid"));
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
				assignContent("getCategory2PageByCondition", 1);
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
					assignContent("getAllCategory2ByPage", 1);
				});

				$(".previous-page-btn").click(
						function() {
							assignContent("getAllCategory2ByPage",
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
							assignContent("getAllCategory2ByPage",
	<%=pageInfo.getAllPageCount()%>
		);
						});
				$(".next-page-btn").click(function() {
					assignContent("getAllCategory2ByPage",
	<%=pageInfo.getNextPage()%>
		);
				});
			}

		});

		function changePage(currentPage) {
			assignContent("getAllCategory2ByPage", currentPage);
		}

		function deleteCategory(cid) {
			$.confirm({
				title : ' ',
				content : '确定删除吗？',
				confirm : function() {
					assignContent("deleteCategory2",
	<%=pageInfo.getCurrentPage()%>
		, cid);
				},
				cancel : function() {

				}
			});
		};

		function toUpdateJsp(cid) {

			assignContent("toUpdateCategory2Jsp",
	<%=pageInfo.getCurrentPage()%>
		, cid);

		};

		function assignContent(action, currentPage, cid) {
			location.assign("CategoryServlet?action=" + action + "&cid=" + cid
					+ "&currentPage=" + currentPage + "&condition="
					+ $(".search-input").val());
		};
	</script>


</body>
</html>
