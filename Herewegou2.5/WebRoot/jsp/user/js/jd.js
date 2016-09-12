
$(function() {
		
		var $ddi = $("#categorys-dd-inner"), $ddid = $ddi.find("div"), $ddr = $("#category-dorpdown-layer"), index = 0, $ddrr = $ddr
					.find("#category-item-" + index);

			var $allProducts = $("#categorys .dt");
			var $dd = $("#categorys .dd");

			//鼠标放在“全部商品分类”处时
			$allProducts.hover(function() {
				$dd.css("display", "block"); //左侧栏显示
			}, function() {
				$dd.css("display", "none"); //左侧栏隐藏						
			});

			//左侧栏 hover合成事件
			$ddid.hover(function() {
				$dd.css("display", "block"); //左侧栏显示				
				$ddrr.css("display", "none");
				index = $(this).data("index");
				$ddrr = $ddr.find("#category-item-" + index);
				$ddrr.css("display", "block");
			}, function() {
				$dd.css("display", "none"); //左侧栏隐藏				

				index = $(this).data("index");
				$(this).removeClass("hover");
			});	
			
		
		
			var $areaText = $(".area-text"), 
				$areaContentList = $(".area-content-list"), 
				$area = $areaContentList.find("a");

			$area.mouseup(function() {
				$areaText.text($(this).text());
			});
			
			
			$(".menu-drop").hover(function(){
				$(this).find(".menu-drop-main").css("display","block");
			},
			function(){
				$(this).find(".menu-drop-main").css("display","none");
			});
			
			
			
			
			
			/*addSucceed.jsp*/
			$("#GotoShoppingCart").click(function(){
				
				location.assign("ShoppingCartServlet?action=goToShoppingCart");
			});
			
					
			
			
			//shoppingCart.jsp
			$(".jdcheckbox").click(function(){
				 if($(this).prop("checked")==true){
				 		$(this).parents(".item-list").addClass("buygoodsselected");
				 		var checked = $(".buygoods").find("jdcheckbox");
				 		if(checked.prop("checked") == false){
				 			$("#selectAll2").prop("checked",false);
				 			$("#selectAll1").prop("checked",false);
				 		}
				 }else{
				 	$(this).parents(".item-list").removeClass("buygoodsselected");
				 	if($("#selectAll2").prop("checked") == true){
				 		$("#selectAll2").prop("checked",false);
				 	}
				 	if($("#selectAll1").prop("checked") == true){
				 		$("#selectAll1").prop("checked",false);
				 	}
				 }
			});
			
			$("#selectAll2").click(function(){
				if($(this).prop("checked") == true){
					$(this).parents(".div3").next(".goods").find(".jdcheckbox").prop("checked",true);
					$(this).parents(".div3").next(".goods").find(".item-list").addClass("buygoodsselected");
					$("#selectAll1").prop("checked",true);
				}else{
					$(this).parents(".div3").next(".goods").find(".jdcheckbox").prop("checked",false);
					$(this).parents(".div3").next(".goods").find(".item-list").removeClass("buygoodsselected");
					$("#selectAll1").prop("checked",false);
				}
			});
			
			$("#selectAll1").click(function(){
				if($(this).prop("checked") == true){
					$(this).parents("#selectall_div").prev(".goods").find(".jdcheckbox").prop("checked",true);
					$(this).parents("#selectall_div").prev(".goods").find(".item-list").addClass("buygoodsselected");
					$("#selectAll2").prop("checked",true);
				}else{
					$(this).parents("#selectall_div").prev(".goods").find(".jdcheckbox").prop("checked",false);
					$(this).parents("#selectall_div").prev(".goods").find(".item-list").removeClass("buygoodsselected");
					$("#selectAll2").prop("checked",false);
					}
			});
		
		
			/*$(function(){
				$(".div4").each(function(){
					alert($(".div4").text());
			});*/
			
			var isnoLogin = 	$("#ttbar-login").hasClass("nologin");
						if(isnoLogin){//没有登陆
							//$("#ttbar-login").addClass("nologin");
							$(".nologin-tip").show();
							$(".div2").removeClass("div2login");
						}else{
							//$("#ttbar-login").removeClass("nologin");
							$(".nologin-tip").hide();
							$(".div2").addClass("div2login");
						}
				
				
			
			
		});

function toLoginJsp(){
	var href = location.href;
	 
	var returnURL = "";
	
	var urlArgs = href.split("&");
	var action = urlArgs[0].split("?")[1];
	var head = urlArgs[0].split("?")[0].split("/");
	var svl = head[head.length-1];
	
	returnURL = svl+","+action+",";
		
	
	for(var i=1;i<urlArgs.length;i++){
		returnURL = returnURL+urlArgs[i]+",";
	}
	
	location.assign("UserServlet?action=toLoginJsp&returnURL="+returnURL);
}


