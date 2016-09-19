<%@ page language="java" import="java.util.*,com.po.Category" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 
	<head>

		<title>My JSP 'addCategory.jsp' starting page</title>
		<meta http-equiv="content-type" content="text/html;charset=utf-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="../../css/style.css">
		<link rel="stylesheet" type="text/css" href="../../css/showBo.css">
		<style type="text/css">
	
			label.error{
				color:red;
				font-size:14px;
				margin-left:10px;
			}
		</style>

	</head>

	<body>
		<div class="categoryClass-panel">
			<form action="CategoryServlet" method="post">
				<input type="hidden" name="action" value="addCategory2" />
				
				<div class="categoryClass">
					<label for="cname">商品种类名称</label> <input class="input-text" type="text" name="cname" id="cname" value="" autofocus="autofocus" />
					

				</div>
				<div class="categoryClass">
					<label for="cdesc">商品种类描述</label> <input class="input-text" type="text" name="cdesc" id="cdesc" value="" />
					
				</div>
				<div class="categoryClass">
				
					<label for="fid">所属一级商品种类</label>					
					<select name="fid" class="fid-select" id="fid">
					<%
						List<Category> list = (List<Category>)request.getAttribute("list"); 
						Iterator<Category> it = list.iterator();
						while(it.hasNext()){
							Category c = it.next();
					%>		
					
						<option value="<%=c.getCid()%>"><%=c.getCname()%></option>
					<%
						}
					%>
					</select>
				</div>
				<div class="div-submit-btn">
					<input type="button" class="btn1 submit-btn" id="tijiao" value="添加二级商品种类" />
				</div>
			</form>
			</div>
			<script src="../../js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
			<script src="../../js/jquery.validate.js" type="text/javascript" charset="utf-8"></script>
			<script src="../../js/showBo.js" type="text/javascript" charset="utf-8"></script>
			<script type="text/javascript">
				$(function() {
					$cnameInput = $("#cname");
					$cdescInput = $("#cdesc");

					$validation = $(".validation-info");

					$($validation[0]).show();
				
					$cnameInput.focus(function () {
						showAlert(0);
					});
					
					$cnameInput.blur(function () {
						hideAlert(0);
						showFail(1);
					});
					
					$cdescInput.focus(function () {
						showAlert(3);
					});
					
					$cdescInput.blur(function () {
						hideAlert(3);
					});
					
					$("form").validate({
    		
		    			rules:{
		    				cname:"required",
		    				
		    				cdesc:"required"
		    			},
		    			
		    			messages:{
		    				cname:"请输入商品种类名称",
		    				cdesc:"请输入商品种类描述"
		    			},
		    			
		    			errorElement:"label",
		    			success:function(label){
		    				label.text("");
		    			}
		    		});
		    		
		    		$("#tijiao").click(function(){
		    			var cname = $("#cname").val();
		    			var fid = $("select#fid option:selected").val();
		    			
		    			$.post("CategoryServlet",{
		    				"action":"hasCategory2",
		    				"cname":(""+cname),
		    				"fid":fid
		    			},function(data,status){
		    				
		    				
		    				 if(data=="已存在此商品种类"){
		    					Showbo.Msg.alert('该商品种类已存在，请添加其他二级商品种类!')
		    					
		    				}else{
		    					$("form").submit();
		    				} 
		    			});
    				});

				});

				function showAlert(index) {
					$($validation[index]).show();
				}
				
				function hideAlert(index) {
					$($validation[index]).hide();
				}
				
				function showFail(index) {
					$($validation[index]).show();
				}
				
				function hideAlert(index) {
					$($validation[index]).hide();
				}
				
				
				
			</script>
		
	</body>

</html>