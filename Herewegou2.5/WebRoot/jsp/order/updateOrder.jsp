<%@ page language="java" import="java.util.*,com.vo.Category,com.page.PageInfo,com.vo.OrderForm,com.vo.ClientUser"
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
				<li>订单编号</li>
				<li>收货人</li>
				<li>地址</li>
				<li>手机号</li>
			</ul>

			<%
				OrderForm orderForm = (OrderForm)request.getAttribute("orderForm");
				//String currentPage = (String)request.getAttribute("currentPage");
				//String conditon = (String)request.getAttribute("conditon");
				ClientUser user = (ClientUser)request.getAttribute("user");
			%>
			<form action="../user/OrderServlet" method="post">
				<input type="hidden" name="action" value="update"/>
				<input type="hidden" name="ofid" value="<%=orderForm.getOfid()%>"/>
				<input type="hidden" name="currentPage" value="<%=orderForm%>"/>
				<input type="hidden" name="condition" value="<%=request.getAttribute("condition")%>"/>
				<ul class="item">					
					<li><%=orderForm.getOrderNumber()%></li>
					<li><input class="input-text " type="text" name="realName" value="<%=user.getRealName()%>" autofocus="autofocus"/></li>
					<li><input class="input-text update1" type="text" name="address" value="<%=orderForm.getAddress()%>" /></li>
					<li><input class="input-text update2" type="text" name="phoneNumber" value="<%=user.getPhoneNumber()%>" /></li>
					<li>
						<input type="submit" class="btn submit-btn" value="提交" />
					</li>
				</ul>
			</form>
			
			
		</div>
	</div>
	

</body>
</html>
