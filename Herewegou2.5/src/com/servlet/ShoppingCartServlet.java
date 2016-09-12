package com.servlet;

//导包
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.impl.Category2ServiceImpl;
import com.service.impl.CategoryServiceImpl;
import com.service.impl.ProductServiceImpl;
import com.service.inter.Category2Service;
import com.service.inter.CategoryService;
import com.service.inter.ProductService;
import com.vo.Category;
import com.vo.Category2;
import com.vo.Product;

public class ShoppingCartServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		String action = request.getParameter("action");

		if (action.equals("addToShoppingCart")) {
			this.addToShoppingCart(request, response);
		} else if (action.equals("goToShoppingCart")) {
			this.goToShoppingCart(request, response);
		}
	}
	
	public void goToShoppingCart(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("in goToShoppingCart");
		String target = "";

		
		HttpSession session = request.getSession(true);
		
		
		List<Product> list1 = (List<Product>)session.getAttribute("shoppingCart");
		Map<String,List<Product>> shoppingCart = null;
		if(list1!=null){
			 shoppingCart = changeMap(list1);
		}
		session.setAttribute("shoppingCart", list1);
		target = "shoppingCart.jsp";
		request.setAttribute("shoppingCart", shoppingCart);
		request.getRequestDispatcher(target).forward(request, response);

	}
	
	
	
	public void addToShoppingCart(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("in addToShoppingCart");
		String target = "";

		Map<Category,List<Category2>> categoryMap = this.getCategoryMap();
		
		String color = (String)request.getParameter("color");
		int count = Integer.parseInt(request.getParameter("count"));
		Integer pid = Integer.parseInt(request.getParameter("pid"));
		
		ProductService service = new ProductServiceImpl();
		Product product = service.getProductByPid(pid);
		//product.setColor(color);
		product.setCountInShoppingCart(count);	
		
		String dianpu = product.getDianpuName();
		
		System.out.println("*********dianpu*******"+dianpu);
		System.out.println(color);
		
		HttpSession session = request.getSession(true);
		List<Product> list1 = (List<Product>)session.getAttribute("shoppingCart");
		Map<String,List<Product>> shoppingCart = null;
		if(list1!=null){
			shoppingCart = changeMap(list1);
		}
		System.out.println(shoppingCart);
		if(list1==null){//第一次放东西进购物车
			System.out.println("//第一次放东西进购物车");
			shoppingCart = new LinkedHashMap<String,List<Product>>();
			List<Product> list = new ArrayList<Product>();
			list.add(product);
			shoppingCart.put(dianpu, list);
			List<Product> list2 = new ArrayList<Product>();
			list1 = list2;
			list2.add(product);
			
		}else{//购物车里已经有商品
			System.out.println("//购物车里已经有商品");			
			
			Set<String> dianpus = shoppingCart.keySet();
			
			if(hasDianpu(dianpu,dianpus)){//购物车中有该店铺
				System.out.println("有该店铺");
				List<Product> list = shoppingCart.get(dianpu);
				
				if(hasProduct(product,list)){
					
					Iterator<Product> i1 = list.iterator();
					while(i1.hasNext()){
						Product product1 = i1.next();
						if(product.equals(product1)){
							System.out.println("有该商品，修改数量");
							product1.setCountInShoppingCart(product.getCountInShoppingCart()+product1.getCountInShoppingCart());
							addList(list1,product1);
						}
					}
				}else{
					System.out.println("没有该商品，添加");
					list.add(product);
					list1.add(product);
				}
			}else{//没有该店铺
				
				List<Product> list = new ArrayList<Product>();
				list.add(product);
				shoppingCart.put(dianpu, list);
				list1.add(product);
			}
			
		}
		
		session.setAttribute("shoppingCart",list1);
		target = "addSucceed.jsp";
		request.setAttribute("categoryMap", categoryMap);
		request.setAttribute("product", product);
		
		request.getRequestDispatcher(target).forward(request, response);

	}
	
	public Map<String,List<Product>> changeMap(List<Product> list){
		
		Map<String,List<Product>> map = new LinkedHashMap<String,List<Product>>();
		
		Iterator<Product> i = list.iterator();
		while(i.hasNext()){
			Product product = i.next();
			
			
			if(map==null){
				List<Product> l = new ArrayList<Product>();
				l.add(product);
				map.put(product.getDianpuName(), l);
			}else{
				
				Set<String> dianpu = map.keySet();
				
				if(hasDianpu(product.getDianpuName(),dianpu)){
					
					List<Product> li = map.get(product.getDianpuName());
					
					if(hasProduct(product,li)){
						Iterator<Product> ii = li.iterator();
						while(ii.hasNext()){
							Product product1 = ii.next();
							if(product.equals(product1)){
								System.out.println("有该商品，修改数量");
								product1.setCountInShoppingCart(product.getCountInShoppingCart()+product1.getCountInShoppingCart());
								
							}
						}
					}else{
						
						li.add(product);
					}
					
				}else{
					List<Product> l = new ArrayList<Product>();
					l.add(product);
					map.put(product.getDianpuName(), l);
				}
				
			}
		}
		
		return map;
	}
	
	public boolean hasDianpu(String dianpu,Set<String> dianpus){
		
		boolean flag = false;
		
		for(String s:dianpus){
			
			if(dianpu.equals(s)){
				flag = true;
				break;
			}
		}
		
		return flag;
		
	}
	
	public void addList(List<Product> list,Product product){
		Iterator<Product> i =list.iterator();
		while(i.hasNext()){
			Product product1 = i.next();
			if(product.equals(product1)){
				product.setCountInShoppingCart(product1.getCountInShoppingCart());
			}
			
		}
		
	}
	
	public boolean hasProduct(Product product,List<Product> list){
		
		
		boolean flag = false;
		
		Iterator<Product> i = list.iterator();
		while(i.hasNext()){
			Product product1 = i.next();
			System.out.println("ppppp"+product1);
			System.out.println("12222"+product);
			if(product1.equals(product)){
				flag = true;
				System.out.println("1");
				break;
			}
		}
		
		return flag;
	}
	
	public Map<Category,List<Category2>> getCategoryMap(){
		
		Map<Category,List<Category2>> categoryMap = new LinkedHashMap<Category, List<Category2>>();
		
		CategoryService service1 = new CategoryServiceImpl();
		List<Category> list1 = service1.getAll();
		
		for(Category category:list1){
			Category2Service service2 = new Category2ServiceImpl();
			List<Category2> list2 = service2.getCategoriesByFid(category.getCid());
			categoryMap.put(category, list2);
		}
		
		return categoryMap;
	}
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
