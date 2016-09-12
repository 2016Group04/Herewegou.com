<%@ page language="java"
	import="java.util.*,com.vo.Category,com.vo.Category2,com.vo.Product"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>

<title>My JSP 'addCategory.jsp' starting page</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css" href="../../css/style.css">
<link rel="stylesheet" type="text/css"
	href="../../js/jQuery-confirm/jquery-confirm.css">
</head>

<body>
	<div class="categoryClass-panel product-img-upload-panel">
		<form enctype="multipart/form-data"
			action="ProductServlet?action=uploadImg" method="post">

			<div class="categoryClass">

				<label for="c1cid">选择商品</label> <select name="c1cid"
					class="c1cid-select">
					<%
						List<Category> categoryList = (List<Category>)request.getAttribute("categoryList"); 
									Iterator<Category> it1 = categoryList.iterator();
									while(it1.hasNext()){
										Category c1 = it1.next();
					%>
					<option value="<%=c1.getCid()%>"><%=c1.getCname()%></option>
					<%
						}
					%>
				</select> - <select name="cid" class="cid-select">
					<%
						List<Category2> category2List = (List<Category2>)request.getAttribute("category2List");
									if(category2List!=null){
									 
										Iterator<Category2> it2 = category2List.iterator();
										while(it2.hasNext()){
											Category2 c2 = it2.next();
					%>

					<option value="<%=c2.getCid()%>"><%=c2.getCname()%></option>
					<%
						}
									}
					%>
				</select> - <select name="pid" class="pid-select">
					<%
						List<Product> productList = (List<Product>)request.getAttribute("productList");
						
									if(productList!=null){
									 
										Iterator<Product> it3 = productList.iterator();
										while(it3.hasNext()){
										
											Product p = it3.next();
											System.out.println(p);
					%>

					<option value="<%=p.getPid()%>"><%=p.getPname()%></option>
					<%
						}
									}
					%>
				</select>

			</div>


			<div class="img-upload-panel list-img-panel">

				<div>
					<h3>
						<label>列表页</label>
					</h3>

				</div>


				<div class="categoryClass">
					<label for="productListLargeImage">大图</label> <input
						class="input-text input-file" type="file"
						name="productListLargeImage" value="" />

				</div>
				<div class="categoryClass">
					<label for="productSmallImage1">小图1</label> <input
						class="input-text input-file" type="file"
						name="productSmallImage1" value="" />

				</div>
				<div class="categoryClass">
					<label for="productSmallImage2">小图2</label> <input
						class="input-text input-file" type="file"
						name="productSmallImage2" value="" />

				</div>
				<div class="categoryClass">
					<label for="productSmallImage3">小图3</label> <input
						class="input-text input-file" type="file"
						name="productSmallImage3" value="" />

				</div>
			</div>

			<div class="img-upload-panel detail-img-panel">

				<div>
					<h3>
						<label>详情页</label>
					</h3>

				</div>

				<div class="categoryClass">
					<label for="detailLargeImage">大图</label> <input
						class="input-text input-file" type="file" name="detailLargeImage"
						value="" />

				</div>
				<div class="categoryClass">
					<label for="detailSmallImage1">小图1</label> <input
						class="input-text input-file" type="file" name="detailSmallImage1"
						value="" />

				</div>
				<div class="categoryClass">
					<label for="detailSmallImage2">小图2</label> <input
						class="input-text input-file" type="file" name="detailSmallImage2"
						value="" />

				</div>
				<div class="categoryClass">
					<label for="detailSmallImage3">小图3</label> <input
						class="input-text input-file" type="file" name="detailSmallImage3"
						value="" />

				</div>
				<div class="categoryClass">
					<label for="detailSmallImage4">小图4</label> <input
						class="input-text input-file" type="file" name="detailSmallImage4"
						value="" />

				</div>
				<div class="categoryClass">
					<label for="detailSmallImage5">小图5</label> <input
						class="input-text input-file" type="file" name="detailSmallImage5"
						value="" />

				</div>
			</div>

			<div class="productCartImage-panel  img-upload-panel list-img-panel">

				<div>
					<h3>
						<label>购物车页</label>
					</h3>

				</div>


				<div class="categoryClass">
					<label for="productCartImage">图片</label> <input
						class="input-text input-file" type="file" name="productCartImage"
						value="" />

				</div>

			</div>


			<div class="div-submit-btn">
				<input type="button" class="btn upload-btn submit-btn" id="uploadImagea" value="上传图片" />
			</div>
		</form>
	</div>
	<script src="../../js/jquery-1.7.2.js" type="text/javascript"
		charset="utf-8"></script>
		<script type="text/javascript" src="../../js/AJ_table.js"></script>
	<script type="text/javascript"
		src="../../js/jQuery-confirm/jquery-confirm.js"></script>
	<script type="text/javascript">
		$(function() {

			$("#uploadImagea").click(function(){
				
				var file = $("input[type=file]");
				var flag = false;
				
				
				for(var i=0;i<file.length;i++){
				
					
					if(file[i].value!=""&&file[i].value!=null){
						alert("/"+file[i].value.trim()+"/");
						flag = true;
						break;
					}
				}
				alert(flag);
				  if(flag==true){
					$("form").submit();
				}else{
					$.alert({
					    title: ' ',
					    content: '请至少上传一张图片',
					   
					});
				}   
			});
			
			//点击选择一级商品
			$(".c1cid-select")
					.change(
							function() {
								$
										.ajax({
											type : "POST",
											url : "ProductServlet?action=getCategory2ofCategory",
											data : {
												'c1cid' : $(this).find(
														"option:selected")
														.val()
											},//用json对象保存提交的数据
											dateType : "json",//服务器输出的数据的类型,默认html			
											success : function(category2Data) {
												var select = "<select name='cid' class='cid-select'>";
												for (var i = 0; i < category2Data.length; i++) {
													select = select
															+ "<option value='"+ category2Data[i].cid + "'>"
															+ category2Data[i].cname
															+ "</option>";
												}
												select = select + "</select>";
												$(".cid-select").replaceWith(
														select);
												cidSelectChange();
												//二级商品选择改变
												$(".cid-select").change(
														function() {
															cidSelectChange();
														});
											}
										});

							});
							
							//二级商品选择改变
							$(".cid-select").change(
								function() {
									cidSelectChange();
							});

		});

		function cidSelectChange() {
			$.ajax({
				type : "POST",
				url : "ProductServlet?action=getProductofCategory2",
				data : {
					'cid' : $(".cid-select").find("option:selected").val()
				},//用json对象保存提交的数据
				dateType : "json",//服务器输出的数据的类型,默认html			
				success : function(productData) {
					var select = "<select name='pid' class='pid-select'>";
					for (var i = 0; i < productData.length; i++) {
						select = select
								+ "<option value='"+ productData[i].pid + "'>"
								+ productData[i].pname + "</option>";
					}
					select = select + "</select>";
					$(".pid-select").replaceWith(select);
				}
			});
		};
	</script>

</body>

</html>