<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'MyServletContextListener.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    

  </head>
  
  <body>
  <%
  	Integer count = (Integer)application.getAttribute("count");
  	count = count+1;
  	out.println("你是第"+count+"位访问者。");
  	application.setAttribute("count", count);
  %>
  
   
  </body>
</html>
