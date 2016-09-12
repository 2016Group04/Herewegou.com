<%@ page language="java" import="java.util.*,com.vo.Category,com.page.PageInfo"
	pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>My JSP 'updateCategory.jsp' starting page</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css" href="../../css/style.css">
</head>

<body>


	<div class="update-panel categoryMain-panel">
		<div class="categoryMain-list">
			<ul class="title">
				<li>商品编号</li>
				<li>商品名称</li>
				<li>商品描述</li>
				<li>操作</li>
			</ul>

			<%
				Category c = (Category)request.getAttribute("category");
				String currentPage = (String)request.getAttribute("currentPage");
				System.out.println("updatajsp"+request.getAttribute("condition"));
			%>
			<form action="CategoryServlet" method="post">
				<input type="hidden" name="action" value="update"/>
				<input type="hidden" name="cid" value="<%=c.getCid()%>"/>
				<input type="hidden" name="currentPage" value="<%=currentPage%>"/>
				<input type="hidden" name="condition" value="<%=request.getAttribute("condition")%>"/>
				<ul class="item">					
					<li><%=c.getCid()%></li>
					<li><input class="input-text" type="text" name="cname" value="<%=c.getCname()%>" autofocus="autofocus"/></li>
					<li><input class="input-text" type="text" name="cdesc" value="<%=c.getCdesc()%>" /></li>
					<li>
						<input type="submit" class="btn submit-btn" value="提交" />
					</li>
				</ul>
			</form>
			
			
		</div>
	</div>
	

</body>
</html>
