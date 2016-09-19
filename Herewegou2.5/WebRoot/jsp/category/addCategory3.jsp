<%@ page language="java" import="java.util.*,com.po.Category,com.po.Category2" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 
	<head>

		<title>My JSP 'addCategory.jsp' starting page</title>
		<meta http-equiv="content-type" content="text/html;charset=utf-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="../../css/style.css">

	</head>

	<body>
		<div class="categoryClass-panel">
			<form action="CategoryServlet" method="post">
				<input type="hidden" name="action" value="addCategory3" />
				
				<div class="categoryClass">
				
					<label for="gid">所属一级商品种类</label>					
					<select name="gid" class="gid-select">
					<%
						List<Category> list1 = (List<Category>)request.getAttribute("list1"); 
						Integer fid = (Integer)request.getAttribute("C2Fid");
						Iterator<Category> it1 = list1.iterator();
						while(it1.hasNext()){
							Category c1 = it1.next();
							if(fid!=null&&fid.equals(c1.getCid())){
								%>
								<option selected="selected" value="<%=c1.getCid()%>"><%=c1.getCname()%></option>
								<%
							}else{							
								%>						
								<option value="<%=c1.getCid()%>"><%=c1.getCname()%></option>
								<%
							}
						}
					%>
					</select>
				</div>
				
				<div class="categoryClass">
				
					<label for="fid">所属二级商品种类</label>					
					<select name="fid" class="fid-select">
					<%
						List<Category2> list2 = (List<Category2>)request.getAttribute("list2");
						if(list2!=null){
						 
							Iterator<Category2> it2 = list2.iterator();
							while(it2.hasNext()){
								Category2 c2 = it2.next();
					%>		
					
								<option value="<%=c2.getCid()%>"><%=c2.getCname()%></option>
					<%
							}
						}
					%>
					</select>
				</div>
				
				<div class="categoryClass">
					<label for="cname">商品种类名称</label> <input class="input-text" type="text" name="cname" id="cname" value=""/>
					<label class="form-validation">
						<div class="alert validation-info">
							<ico class="icon"></ico>限输入1~10个字符(汉字、字母或数字)
						</div>
						<div class="fail validation-info">
							<ico class="icon"></ico>输入有误
						</div>
						<div class="succeed validation-info">
							<ico class="icon"></ico>
						</div>
					</label>

				</div>
				<div class="categoryClass">
					<label for="cdesc">商品种类描述</label> <input class="input-text" type="text" name="cdesc" id="cdesc" value="" />
					<label class="form-validation">
						<div class="alert validation-info">
							<ico class="icon"></ico>限输入1~20个字符
						</div>
						<div class="fail validation-info">
							<ico class="icon"></ico>输入有误
						</div>
						<div class="succeed validation-info">
							<ico class="icon"></ico>
						</div>
					</label>
				</div>
				
				<div class="div-submit-btn">
					<input type="submit" class="btn submit-btn" value="添加商品" />
				</div>
			</form>
			</div>
			<script src="../../js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
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
					
					//点击选择一级商品
					$(".gid-select").change(function(){
						var C2Fid = $(this).find("option:selected").val();
						location.assign("CategoryServlet?action=getCategory2ByFid&C2Fid="+C2Fid);
					});					
					
					//二级商品不选不能提交
					if(!$(".fid-select").find("input").length>0){
						$(".submit-btn").prop("disabled","true");
						$(".submit-btn").addClass("disabled");
					}
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