<%@ page language="java" import="java.util.*,com.vo.Category,com.vo.Category2" pageEncoding="UTF-8"%>

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
			
			.categoryClass input{
				line-height: 100%;
			}
			
			.categoryClass label {
				position: relative;
				top: 4px;
			}
			
			.null-input {
				color: #aaa;
			}
			
			.categoryClass-panel {
				margin: 0;
				margin-top: 50px;
			}
			
			.categoryClass-panel .categoryClass {
				width: 433px;
				padding: 15px 0;
			}
			
			.outer-div {
				position: relative;
			}
			
			.inner-div1 {
				position: absolute;
			}
			
			.inner-div2 {
				position: absolute;
				left: 420px;
			}
			
			.inner-div {
				position: absolute;
			}
			
			.inner-div3 {
				position: absolute;
				left: 840px;
			}
			
			.div-btn {
				padding: 0;
				padding-top: 37px;
			}
			
			.p1 {
				position: relative;
				border-top: 1px solid #ccc;
				width: 80px;
				margin-bottom: 10px;
			}
			
			
			
			.ptitle {
				padding: 0 5px;
				font-weight: bold;
				font-size: 14px;
				background-color: #eee;
			}
			
			#add-btn {
				font-size: 100px;
				line-height: 110px;
				position: relative;
				margin-top: 30px;
				width: 120px;
				height: 120px;
			    color: #e6e6e6;
			    border-radius: 10px;
			    font-family: "微软雅黑";
			    text-align: center;
			    cursor: pointer;
			    background-color: #ccc;
			}
			
			#add-btn:hover {
				box-shadow: 0px 0px 3px #666;
			}
			
		</style>
		
	</head>

	<body>
		<div class="categoryClass-panel">
			<form action="ProductServlet" method="post" id="add">
				<input type="hidden" name="action" value="add" />
				
				<div class="outer-div">
				
				<div class="inner-div1">	
				
				<label class="ptitle">基本描述</label>
				<div class="p1"></div>
				
				<div class="categoryClass">
				
					<em>*</em><label for="c1cid">商品种类</label>					
					<select name="c1cid" class="c1cid-select">
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
					</select>
					-
					<select name="cid" class="cid-select" id="cid">
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
					</select>
				</div>
				
				
				
				<div class="categoryClass">
					<em>*</em><label for="pname">商品名称</label> <input class="input-text" type="text" name="pname" id="pname" value=""/>
					

				</div>				
				<div class="categoryClass">
					<em>*</em><label for="dianpuName">店铺名称</label> <input class="input-text" type="text" name="dianpuName" id="dianpuName"  />
					
				</div>
				<div class="categoryClass">
					<em>*</em><label for="pdesc">商品描述</label> <input class="input-text" type="text" name="pdesc" id="pdesc"  />
					
				</div>
				</div>
				
				<div class="inner-div2">
				
				<label class="ptitle">规格1</label>
				<div class="p1"></div>
				
				<div class="categoryClass">
					<em> </em><label for="color">商品颜色</label> <input class="input-text null-input" type="text" name="color" id="color"  value="默认无颜色" />
					
				</div>
				
				
				<div class="categoryClass">
					<em> </em><label for="version">商品版本</label> <input class="input-text null-input" type="text" name="version" id="version" value="默认无版本" />
				</div>
				
				<div class="categoryClass">
					<em>*</em><label for="price">商品价格</label> <input class="input-text" type="text" name="price" id="price" />
					
				</div>
				<div class="categoryClass">
					<em>*</em><label for="productSum">商品数量</label> <input class="input-text" type="text" name="productSum" id="productSum"/>
					
				</div>
				
				
				
				</div>
				
				<div class="inner-div3">
					<label class="ptitle">规格+1</label>
					<div class="p1"></div>
					<div class="add-more">
					<div class="btn1 add-btn" id="add-btn" >+</div>
					</div>
					<div class="div-btn">
					<input type="button" class="btn1 submit-btn" id="tijiao" value="添加商品" />
					</div>
				</div>
				
				
				
				</div>
			</form>
			</div>
			<script src="../../js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
			<script src="../../js/jquery.validate.js" type="text/javascript" charset="utf-8"></script>
			<script src="../../js/showBo.js" type="text/javascript" charset="utf-8"></script>
			<script type="text/javascript">
				$(function() {
					
					var i = 2;
					
					$("#color").focus(function(){
						$(this).val("");
					});
					$("#color").blur(function(){
						$(this).val("默认无颜色");
					});
					$("#version").focus(function(){
						$(this).val("");
					});
					$("#version").blur(function(){
						$(this).val("默认无颜色");
					});
				
					$("#add-btn").click(function(){
						var $innerDiv2 = $(".inner-div2").clone(true);
						var leftValue = i*420+"px";
						var leftValue2 = (i+1)*420+"px";
						
						$(".inner-div3").css("left",leftValue2);
						
						$innerDiv2.css("left",leftValue);
						$innerDiv2.removeClass().addClass("inner-div");
						$innerDiv2.find(".ptitle").text("规格"+i);
						
						($innerDiv2).insertBefore(".inner-div3");
						
						$("html,body").animate({scrollLeft:$(".inner-div3").offset().left},1000);

						
						i = i + 1;
						
					});
					
				
					$.validator.addMethod("number", function (value, element,param) {
						var regEXP = /^\d+$/;
						return regEXP.test(value);
					}, "数量只能是整数");
					
					$.validator.addMethod("floatNumber", function (value, element) {
						var regEXP = /^\d+\.?\d*$/;
						return regEXP.test(value);
					}, "价格只能是浮点型");
						
					
					//点击选择一级商品
					$(".c1cid-select").change(function(){
						$.ajax({
			  			type: "POST",
			 			url: "ProductServlet?action=getCategory2ofCategory",
						data:{'c1cid':$(this).find("option:selected").val()},//用json对象保存提交的数据
			 			dateType: "json",//服务器输出的数据的类型,默认html			
			  			success:function(category2Data){
			  						var select = "<select name='cid' id='cid' class='cid-select'>";
			  						for(var i=0;i<category2Data.length;i++){
			  							select = select + "<option value='"+ category2Data[i].cid + "'>"+ category2Data[i].cname +"</option>";
			  						}
			  						select = select + "</select>";
			  						$(".cid-select").replaceWith(select);
			  						
			  		$("#tijiao").click(function(){
    					clickTijiao();
    					
		    		}); 
						
  								}
 						});	
					});
					
					$("form#add").validate({
    		
		    			rules:{
		    				pname:"required",
		    				
		    				pdesc:"required",
		    				
		    				price:{
		    					required:true,
		    					floatNumber:true
		    				},
		    				productSum:{
		    					required:true,
		    					number:true
		    				},
		    				dianpuName:"required"
		    				
		    				
		    			},
		    			
		    			messages:{
		    				pname:"请输入商品名称",
		    				pdesc:"请输入商品描述",
		    				
		    				price:{
		    					required:"请输入商品价格",
		    					
		    				},
		    				productSum:{
		    					required:"请输入商品数量",
		    					
		    				},
		    				dianpuName:"请输入商品所属店铺"
		    				
		    			},
		    			
		    			errorElement:"label",
		    			success:function(label){
		    				label.text("");
		    			}
		    		});
					
					
					$("#tijiao").click(function(){
    					clickTijiao();    					
		    		}); 
					
					 
				});
				
				function clickTijiao (){
	    			var pname = $("#pname").val();
	    			var price = $("#price").val();
	    			var dianpuName = $("#dianpuName").val();
	    			var color = $("#color").val();
	    			var version = $("#version").val();
	    			var fid = $("select#cid option:selected").val();
	    			
	    			$.post("ProductServlet",{
	    				"action":"hasProduct",
	    				"pname":(""+pname),
	    				"price":price,
	    				"dianpuName":(""+dianpuName),
	    				"color":(""+color),
	    				"version":(""+version),
	    				"fid":fid
	    			},function(data,status){
	    				
	    				
	    				 if(data=="已存在此商品"){
	    					
	    					Showbo.Msg.alert("该商品已存在，请添加其他一级商品种类");
	    				}else{
	    					$("form").submit();
	    				} 
	    			});
				}
			</script>
		
	</body>

</html>