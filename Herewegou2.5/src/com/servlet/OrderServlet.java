/**

 * 单位：山东师范大学
 * 姓名：王明新
 * 时间：2016年9月7日上午9:32:29
 * 功能：OrderServlet.java	
 */
package com.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.page.PageInfo;
import com.service.impl.ClientUserServiceImpl;
import com.service.impl.OrderDetailServiceImpl;
import com.service.impl.OrderFormServiceImpl;
import com.service.impl.ProductServiceImpl;
import com.vo.ClientUser;
import com.vo.OrderDetail;
import com.vo.OrderForm;
import com.vo.Product;


public class OrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
			
		String action = request.getParameter("action");
		if("checkOrder".equals(action)){
			this.checkOrder(request, response);
		}else if("tijiao".equals(action)){
			this.tijiao(request,response);
		}else if("queryOrder".equals(action)){
			this.queryOrder(request,response);
		}else if("daiPay".equals(action)){
			this.daiPay(request,response);
		}else if("managerOrder".equals(action)){
			this.managerOrder(request,response);
		}else if("deleteOrderForm".equals(action)){
			this.deleteOrderForm(request,response);
		}else if("toUpdateOrderFormJsp".equals(action)){
			this.toUpdateOrderFormJsp(request,response);
		}else if("update".equals(action)){
			this.update(request,response);
		}else if("toMyOrderJsp".equals(action)){
			this.toMyOrderJsp(request,response);
		}
		
		
	}
	
	public void toMyOrderJsp(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			System.out.println(" in Ordersevlet toMyOrderJsp");
			
		String target = "";
		//1.Receive data
		HttpSession session = request.getSession(true);
		ClientUser user =(ClientUser)session.getAttribute("user");
				
		//2.Calls to business logic
		if(user!=null){
			
			//已登录 显示myOrder
			target = "myOrder.jsp";
			
		
		}else{
			//未登录，去登录
			request.setAttribute("loginMsg", "您还未登录，请先登录");
			session.setAttribute("returnURL", "myOrder.jsp");
			target = "loginMsg.jsp";
		}
		
		//3.Forward view
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void checkOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			System.out.println(" in Ordersevlet checkOrder");
			
		String target = "";
		//1.Receive data
		HttpSession session = request.getSession(true);
		ClientUser user =(ClientUser)session.getAttribute("user");
		String username = request.getParameter("username");
		String address = request.getParameter("address");
		String phonenumber  =request.getParameter("phonenumber");		
		
		//2.Calls to business logic
		if(user!=null){
			
			//已登录去结算
			if("".equals(username)||username==null){
				target="jiesuan.jsp";
				System.out.println("已登录去结算");
			}else{
				user.setRealName(username);
				user.setAddress(address);
				user.setPhoneNumber(new Long(phonenumber));
			}
			
			new ClientUserServiceImpl().updateClientUser(user);
			session.setAttribute("user", user);
			
				List<Product> list = (List<Product>) session.getAttribute("shoppingCart");
				
				request.setAttribute("list", list);
				request.setAttribute("user", user);
				
				if(user.getAddress()==null){
					target="jiesuan2.jsp";
				}else{
					System.out.println("this");
					target="jiesuan.jsp";
				}
			
		
		}else{
			//未登录，去登录
			request.setAttribute("loginMsg", "您还未登录，请先登录");
			target = "loginMsg.jsp";
		}
		
		//3.Forward view
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void tijiao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		HttpSession session = request.getSession(true);
		List<Product> list = (List<Product>)session.getAttribute("shoppingCart");
		
		ClientUser user = (ClientUser)session.getAttribute("user");
		/*ClientUser user = new ClientUser();
		user.setUserAccount("zyy2");
		user.setPassword("123");
		user.setUserId(25);
		user.setNickName("jd123456");
		user.setAddress("111");
		user.setRealName("wangmingxin");*/
		
		//session.setAttribute("user",user);
		
		System.out.println("tijiao"+user.getRealName());
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String orderDate = sdf.format(date);
		
		OrderForm orderForm = new OrderForm();
		/*orderdate VARCHAR2(40),
		  userID   NUMBER(10),
		  totalprice number(10,2),
		  state varchar2(10),
		  address varchar2(200),
		  ordernumber number(20)*/
		
		//订单号的生成
		Long orderNumber = new Long(orderidDo(orderDate));
		
		System.out.println(orderNumber);
		orderForm.setOrderdate(orderDate);
		
		
		
		orderForm.setUserID(user.getUserId());
		orderForm.setUsername(user.getRealName());
		double totalPrice = 0.0;
		Iterator<Product> i = list.iterator();
		while(i.hasNext()){
			Product product = i.next();
			
			OrderDetail orderDetail = new OrderDetail();
			/*odid NUMBER(20) primary key, 
			  pid  number(10),
			  psum number(10),  
			  orderid   NUMBER(11),*/
			
			//缺少一个可以放购买的数量的字段
			orderDetail.setPid(product.getPid());
			orderDetail.setPsum(product.getCountInShoppingCart());
			Product product2 = new ProductServiceImpl().getProductByPid(product.getPid());
			//数量相应的减少
			product2.setProductSum(product2.getProductSum()-product.getCountInShoppingCart());
			new ProductServiceImpl().updateProduct(product2);
			orderDetail.setOrderid(orderNumber);
			
			new OrderDetailServiceImpl().addOrderDetail(orderDetail);
			totalPrice = totalPrice + product.getPrice()*product.getCountInShoppingCart();
		}
		
		orderForm.setTotalPrice(totalPrice);
		orderForm.setState("待付款");
		orderForm.setAddress(user.getAddress());
		orderForm.setOrderNumber(orderNumber);
		
		new OrderFormServiceImpl().addOrder(orderForm);
		
		session.removeAttribute("shoppingCart");
		request.setAttribute("orderForm", orderForm);
		String target = "../pay/pay.jsp";
		
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	
	
	public String orderidDo(String orderDate){
	
		
		
		String[] dateArr1 = orderDate.split(" ");
		String[] dateArr2 = new String[3];
		String[] dateArr3 = new String[3];
		for(int i=0;i<dateArr1.length;i++){
			
			if(i==0){
				dateArr2 = dateArr1[0].split("-");
			}else if(i==1){
				dateArr3 = dateArr1[1].split(":");
			}
			
		}
		
		String s = "";
		for(String a:dateArr2){
			s = s + a;
		}
		
		for(String b:dateArr3){
			s = s + b;
		}
		
		
		String ordernumber = s + (int)((Math.random()*8+1)*100);
		
		return ordernumber;
	}
	
	public void queryOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("in queryOrder");
		HttpSession session = request.getSession(true);
		ClientUser user  = (ClientUser)session.getAttribute("user");
		//ClientUser user1 = user;
		System.out.println(user);
		String target = "";
		if(user==null){
			
			target = "login.jsp";
		}else{

			
			List<OrderForm> list = new OrderFormServiceImpl().getAllByUserid(user.getUserId());
			
			Map<OrderForm,Map<String,List<Product>>> map = new OrderFormServiceImpl().getProductByOrderNumber(list);
			
			
			
			//Map<Long,ClientUser> map2 = new OrderFormServiceImpl().getUserByOrderNumber(list);
			//得到用户信息
			
			if(map.size() == 0){
				
				System.out.println("没有订单");
			}
			
			session.setAttribute("user",user);
			request.setAttribute("map", map);
			//request.setAttribute("userAccount", map2);
			
			
			target = "myOrder.jsp";
		}
		
		
		request.getRequestDispatcher(target).forward(request,response);
		
	}
	
	public void daiPay(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		ClientUser user  = (ClientUser)session.getAttribute("user");
		List<OrderForm> list = new OrderFormServiceImpl().getAllPayByUserid(user.getUserId());
		
		Map<OrderForm,Map<String,List<Product>>> map = new OrderFormServiceImpl().getProductByOrderNumber(list);
		session.setAttribute("user",user);
		request.setAttribute("map", map);
		
		String target = "myOrder.jsp";
		request.getRequestDispatcher(target).forward(request,response);
	
	}
	
	public void managerOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("in managerOrder");
		
		String condition = request.getParameter("condition");
		String pid = request.getParameter("pid");
		String currentPage = request.getParameter("currentPage");
		
		PageInfo pageInfo = null;
		System.out.println(currentPage);
		System.out.println(condition);
		System.out.println(currentPage==null);
		if(currentPage==null){
			System.out.println("1");
			pageInfo = new PageInfo(1,5);
		}else{
			
			pageInfo = new PageInfo(new Integer(currentPage),5);
		}
		
		List<OrderForm> list = null;
		Map<OrderForm,ClientUser> user = new LinkedHashMap<OrderForm,ClientUser>();
		if(condition==null||"".equals(condition)){
			
			
			int orderCount = new OrderFormServiceImpl().getAllCount();
			pageInfo.setAllRecordCount(orderCount);
			
			list = new OrderFormServiceImpl().getAll(pageInfo);
			
			System.out.println(list);
			request.setAttribute("condition", "_");
			
			
		}
		
		Map<OrderForm,Map<String,List<Product>>> map = new OrderFormServiceImpl().getProductByOrderNumber(list);
		
		//Map<OrderForm,ClientUser> user = new LinkedHashMap<OrderForm,ClientUser>();
		Iterator<OrderForm> i = list.iterator();
		while(i.hasNext()){
			OrderForm orderForm = i.next();
			
			ClientUser user1 = new ClientUserServiceImpl().getClientUserById(orderForm.getUserID());
			System.out.println("2");
			user.put(orderForm,user1);			
		}
		
		//ClientUser user1 = new ClientUserServiceImpl().getClientUserById();
		
		System.out.println(user);
		String target = "../order/orderMain.jsp";
		request.setAttribute("map", map);
		request.setAttribute("pageInfo",pageInfo);
		request.setAttribute("user",user);
		request.getRequestDispatcher(target).forward(request,response);
		
	}
	
	public void deleteOrderForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("in delete");
		
		
		String pid = request.getParameter("pid");
		OrderForm orderForm = new OrderFormServiceImpl().getOrderByPid(new Integer(pid));
		
		new OrderFormServiceImpl().deleteOrderById(new Integer(pid));
		//商品库存还原
		Map<String,List<Product>> map = new OrderDetailServiceImpl().getProductsByOrderNumber(orderForm.getOrderNumber());
		
		Set<String> key = map.keySet();
		
		for(String s:key){
			
			List<Product> list = map.get(s);
			Iterator<Product> i = list.iterator();
			
			while(i.hasNext()){
				Product product = i.next();
				Product product1 = new ProductServiceImpl().getProductByPid(product.getPid());
				new OrderDetailServiceImpl().deleteOrderDetail(product.getPid(),orderForm.getOrderNumber());
				product1.setProductSum(product.getProductSum()+product.getCountInShoppingCart());
				new ProductServiceImpl().updateProduct(product1);
			}
		}
		
		this.managerOrder(request, response);
	}
	
	public void toUpdateOrderFormJsp(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("in toUpdateOrderFormJsp");
		String pid = request.getParameter("pid");
		OrderForm orderForm = new OrderFormServiceImpl().getOrderByPid(new Integer(pid));
		String currentPage = request.getParameter("currentPage");
		String condition = request.getParameter("condition");
		ClientUser user = new ClientUserServiceImpl().getClientUserById(23);
		request.setAttribute("orderForm",orderForm );
		request.setAttribute("currentPage",currentPage);
		request.setAttribute("condition",condition);
		request.setAttribute("user",user);
		String target = "../order/updateOrder.jsp";
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("in update");
		
		String ofid = request.getParameter("ofid");
//		String condition = request.getParameter("condition");
//		String currentPage = request.getParameter("currentPage");
		String phoneNumber = request.getParameter("phoneNumber");
		String realName = request.getParameter("realName");
		String address = request.getParameter("address");
		OrderForm orderForm = new OrderFormServiceImpl().getOrderByPid(new Integer(ofid)); 
		new OrderFormServiceImpl().updateOrderByOfid(ofid,address);
		ClientUser user = new ClientUserServiceImpl().getClientUserById(23/*orderForm.getUserID()*/);
		user.setRealName(realName);
		user.setAddress(address);
		user.setPhoneNumber(new Long(phoneNumber));
		new ClientUserServiceImpl().updateClientUser(user);
		
		request.setAttribute("msg", "修改订单信息成功");
		String taget = "../order/msg.jsp";
		request.getRequestDispatcher(taget).forward(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
