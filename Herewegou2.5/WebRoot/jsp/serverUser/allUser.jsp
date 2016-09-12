<%@ page language="java"
	import="java.util.*,com.vo.Product,com.page.PageInfo,com.vo.ClientUser"
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
			List<ClientUser> list = (List<ClientUser>)request.getAttribute("list");
			String allUserCount = (String)request.getAttribute("allUserCount");	
			String frozenCount = (String)request.getAttribute("frozenCount");
		%>

		<div class="messageUser">现有<%=allUserCount %>注册用户，     当前冻结用户<%=frozenCount %></div>

		<div class="categoryMain-list categoryMain-li">
			<ul class="title">
				<li>用户编号</li>
				<li>用户账号</li>
				<li>用户昵称</li>
				<li>真实姓名</li>
				<li>手机号码</li>
				<li>性别</li>
				<li>年龄</li>
			</ul>

			<%
				Iterator<ClientUser> it = list.iterator();
					while(it.hasNext()){
						ClientUser p = it.next();
			%>
			<ul class="item">
				<li class="cid-li"><%=p.getUserId()%></li>
				<li><%=p.getUserAccount()%></li>
				<li><%=p.getNickname()%></li>
				<li><%=p.getRealName()%></li>
				<li><%=p.getPhoneNumber()%></li>
				<li><%=p.getSex()%></li>
				<li><%=p.getAge()%></li>
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



			//选择跳到第几页
			$pageGoto.change(function() {
				changePage($(this).val());
			});

			//select显示当前在第几页
			$pageGoto.val(
	<%=pageInfo.getCurrentPage()%>
		);

			

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
					location.assign("../user/UserServlet?action=queryAllUser&currentPage=1");
				});

				$(".previous-page-btn").click(
						function() {
							location.assign("../user/UserServlet?action=queryAllUser&currentPage=<%=pageInfo.getPreviousPage()%>");
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
							location.assign("../user/UserServlet?action=queryAllUser&currentPage=<%=pageInfo.getNextPage()%>");
						});
				$(".next-page-btn").click(
						function() {
							location.assign("../user/UserServlet?action=queryAllUser&currentPage=<%=pageInfo.getSumPerPage()%>");
						});
			}

		});

		function changePage(currentPage) {
			location.assign("../user/UserServlet?action=queryAllUser&currentPage="+currentPage);
		}

		
		function toUpdateJsp(pid) {

			assignContent("toUpdateProductJsp",
	<%=pageInfo.getCurrentPage()%>
		,
					pid);

		};

		function assignContent(action, currentPage, pid) {
			location.assign("ProductServlet?action=" + action + "&pid=" + pid
					+ "&currentPage=" + currentPage + "&condition="
					+ $(".search-input").val());
		};
	</script>


</body>
</html>
