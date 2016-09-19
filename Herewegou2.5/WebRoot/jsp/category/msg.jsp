<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'msg.jsp' starting page</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">  
	<link rel="stylesheet" type="text/css" href="../../js/jQuery-confirm/jquery-confirm.css">  
  </head>
  
  <body> 	
  	<%	
  		String target = "";
  		String msg = (String)request.getAttribute("msg");
  		if(msg.equals("保存一级商品种类成功")){
  			target = "addCategory.jsp";
  		}else if (msg.equals("保存二级商品种类成功")){
  			target = "CategoryServlet?action=toAddCategory2jsp";
  		}
  	%>
  	<script type="text/javascript" src="../../js/jquery-1.7.2.js" charset="utf-8"></script>
  	<script type="text/javascript" src="../../js/jQuery-confirm/jquery-confirm.js" charset="utf-8"></script>
  	<script type="text/javascript">
  	$(function(){
	  	$.alert({
			    title: ' ',
			    content: '<%=msg%>',
			    confirm: function(){		    	
			    	location.assign("<%=target%>");
			    }
			});
	  	});
  		
  	</script>  	
  	
  </body>
</html>
