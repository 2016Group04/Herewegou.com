package com.servlet;

//导包
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.page.PageInfo;
import com.service.impl.Category2ServiceImpl;
import com.service.impl.CategoryServiceImpl;
import com.service.impl.ProductServiceImpl;
import com.service.inter.Category2Service;
import com.service.inter.CategoryService;
import com.service.inter.ProductService;
import com.vo.Category;
import com.vo.Category2;
import com.vo.Product;

public class ProductServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("action");

		if (action.equals("getCategory2ofCategory")) {
			this.getCategory2ofCategory(request, response);
		}else if (action.equals("getProductofCategory2")) {
			this.getProductofCategory2(request, response);
		}else if (action.equals("toAddProductjsp")) {
			this.toAddProductjsp(request, response);
		} else if (action.equals("add")) {
			this.add(request, response);
		} else if (action.equals("uploadImg")) {
			this.uploadImg(request, response);
		}  else if (action.equals("getAllProductByPage")) {
			this.getAllProductByPage(request, response);
		} else if (action.equals("getProductPageByCondition")) {
			this.getProductPageByCondition(request, response);
		} else if (action.equals("deleteProduct")) {
			this.deleteProduct(request, response);
		} else if (action.equals("toUpdateProductJsp")) {
			this.toUpdateProductJsp(request, response);
		} else if (action.equals("update")) {
			this.update(request, response);
		} else if (action.equals("putOnShelves")) {
			this.putOnShelves(request, response);
		} else if (action.equals("pullOffShelves")) {
			this.pullOffShelves(request, response);
		}else if (action.equals("toPutOnShelvesjsp")) {
			this.toPutOnShelvesjsp(request, response);
		}else if (action.equals("toPullOffShelvesjsp")) {
			this.toPullOffShelvesjsp(request, response);
		}else if (action.equals("getOffSaleProductPageWithCondition")) {
			this.getOffSaleProductPageWithCondition(request, response);
		} else if (action.equals("getOnSaleProductPageWithCondition")) {
			this.getOnSaleProductPageWithCondition(request, response);
		} else if (action.equals("toUploadProductImgjsp")) {
			this.toUploadProductImgjsp(request, response);
		} else if (action.equals("hasProduct")) {
			this.hasProduct(request, response);
		}
	}
	
	public void getProductofCategory2(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("in getProductofCategory2");
		
		response.setContentType("application/json;charset=utf-8");
		
		PrintWriter pw = response.getWriter();
		

		int cid = new Integer(request.getParameter("cid"));
		
		System.out.println(cid);

		ProductServiceImpl service = new ProductServiceImpl();

		 List<Product> productList = service.getProductsByCid(cid);
		 
		 Gson gson = new Gson();
		 
		 String productdata = gson.toJson(productList);
		 
		 pw.println(productdata);
		 pw.flush();
		 

	}
	
	public void toUploadProductImgjsp(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("in toUploadProductImgjsp");
		
		String target = "";


		CategoryServiceImpl service = new CategoryServiceImpl();

		List<Category> categoryList = service.getAll();
	 
		Integer fid = categoryList.get(0).getCid();
		 
		Category2ServiceImpl service2 = new Category2ServiceImpl();

		List<Category2> category2List = service2.getCategoriesByFid(fid);
		
		ProductServiceImpl service3 = new ProductServiceImpl();
		List<Product> productList = service3.getProductsByCid(category2List.get(0).getCid());
			
		
		
		target = "uploadProductImg.jsp";

		request.setAttribute("categoryList", categoryList);
		request.setAttribute("category2List", category2List);
		request.setAttribute("productList", productList);
		
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	private void putOnShelves(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("in putOnShelves");

		String condition = request.getParameter("condition");
		System.out.println(condition);		
		String pidStr = request.getParameter("pid");
		
		System.out.println(pidStr);
		
		String[] pidArray = pidStr.split(",");
		
		
		List<String> pidList = new ArrayList<String>();
		for(String s:pidArray){
			pidList.add(s);
			System.out.println(s);
		}
		
		ProductServiceImpl service = new ProductServiceImpl();

		service.putOnShelves(pidList);

		
		// 转发视图
		if (!(condition == null || condition.trim().equals("") || condition
				.equals("null"))) {
			this.getOffSaleProductPageWithCondition(request, response);
			System.out.println("上架后返回带有搜索条件的页面");
		} else {

			this.toPutOnShelvesjsp(request, response);
			System.out.println("上架后返回无搜索条件的页面");
		}

	}
	
	private void pullOffShelves(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("in pullOffShelves");

		String condition = request.getParameter("condition");
		System.out.println(condition);		
		String pidStr = request.getParameter("pid");
		
		System.out.println(pidStr);
		
		String[] pidArray = pidStr.split(",");
		
		
		List<String> pidList = new ArrayList<String>();
		for(String s:pidArray){
			pidList.add(s);
			System.out.println(s);
		}
		
		ProductServiceImpl service = new ProductServiceImpl();

		service.pullOffShelves(pidList);

		
		// 转发视图
		if (!(condition == null || condition.trim().equals("") || condition
				.equals("null"))) {
			this.getOnSaleProductPageWithCondition(request, response);
			System.out.println("下架后返回带有搜索条件的页面");
		} else {

			this.toPullOffShelvesjsp(request, response);
			System.out.println("下架后返回无搜索条件的页面");
		}

	}
	
	private void update(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("in update");

		String condition = request.getParameter("condition");
		System.out.println(condition);
		
		System.out.println("after condition");
		
		String pname = request.getParameter("pname");
		Float price = new Float(request.getParameter("price"));
		Integer productSum = new Integer(request.getParameter("productSum"));
		String dianpuName = request.getParameter("dianpuName");
		String pdesc = request.getParameter("pdesc");
		Integer cid = new Integer(request.getParameter("cid"));
		Integer pid = new Integer(request.getParameter("pid"));
		
		Product product = new Product();
		
		product.setPname(pname);
		product.setPrice(price);
		product.setProductSum(productSum);
		product.setDianpuName(dianpuName);
		product.setPdesc(pdesc);
		product.setCid(cid);
		product.setPid(pid);	
		
		System.out.println(product);
		
		System.out.println("before update");
		
		ProductServiceImpl service = new ProductServiceImpl();

		service.updateProduct(product);

		System.out.println("after update");
		
		// 转发视图
		if (!(condition == null || condition.trim().equals("") || condition
				.equals("null"))) {
			this.getProductPageByCondition(request, response);
		} else {

			this.getAllProductByPage(request, response);
		}

	}
	
	private void toUpdateProductJsp(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String target = "";
		System.out.println("in toUpdateProductJsp");

		// 接收数据
		String pid = request.getParameter("pid");

		String currentPage = request.getParameter("currentPage");

		String condition = request.getParameter("condition");

		System.out.println(condition);

		// 调用业务逻辑

		ProductService service1 = new ProductServiceImpl();
		Product product = service1.getProductByPid(new Integer(pid));	
		
		
		Category2Service service2 = new Category2ServiceImpl();
		Category2 category2 = service2.getCategoryById(product.getCid());
		Category2Service service3 = new Category2ServiceImpl();
		List<Category2> category2List = service3.getCategoriesByFid(category2.getFid()); 

		CategoryService service4 = new CategoryServiceImpl();
		List<Category> categoryList = service4.getAll();		
		
		target = "updateProduct.jsp";

		// 转发视图

		if (condition == null || condition.trim().equals("")
				|| condition.equals("null")) {
			request.setAttribute("condition", "");
		} else {
			request.setAttribute("condition", condition);
		}
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("category2List", category2List);
		request.setAttribute("category2", category2);
		request.setAttribute("product", product);
		request.setAttribute("currentPage", currentPage);
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void deleteProduct(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("in deleteProduct");

		ProductServiceImpl service = new ProductServiceImpl();

		Integer pid = Integer.parseInt(request.getParameter("pid"));

		String condition = request.getParameter("condition");

		service.deleteProductById(pid);

		// 转发视图
		if (!(condition == null || condition.trim().equals("") || condition
				.equals("null"))) {
			this.getProductPageByCondition(request, response);
		} else {

			this.getAllProductByPage(request, response);
		}

	}
	
	public void getAllProductByPage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("in getAllProductByPage");

		String condition = request.getParameter("condition");

		// 是否带有条件
		if (condition == null || condition.trim().equals("")
				|| condition.equals("null")) {

			int currentPage = new Integer(request.getParameter("currentPage"));

			System.out.println(currentPage);
			PageInfo pageInfo = new PageInfo(currentPage,5);

			System.out.println(pageInfo.getAllPageCount());
			System.out.println(pageInfo.getAllRecordCount());

			ProductService service1 = new ProductServiceImpl();
			pageInfo.setAllRecordCount(service1.getAllRecordCount());

			ProductService service2 = new ProductServiceImpl();
			List<Product> list = service2.getAllByPage(pageInfo);

			String target = "productMain.jsp";

			System.out.println(pageInfo.getAllPageCount());
			System.out.println(pageInfo.getAllRecordCount());

			request.setAttribute("condition", "");

			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			request.getRequestDispatcher(target).forward(request, response);

		} else {
			this.getProductPageByCondition(request, response);
		}

	}
	
	public void getOffSaleProductPageWithCondition(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String target = "";

		System.out.println("in getOffSaleProductPageByCondition");
		
		String condition = request.getParameter("condition");
		
		if(condition==null || condition.equals("")){
			condition="_";
		}
		
		int currentPage = new Integer(request.getParameter("currentPage"));

		System.out.println(currentPage);
		
		Product product = new Product();
		product.setPname(condition);
		product.setDianpuName(condition);
		product.setCname(condition);

		PageInfo pageInfo = new PageInfo(currentPage,5);

		ProductServiceImpl service1 = new ProductServiceImpl();
		ProductServiceImpl service2 = new ProductServiceImpl();

		pageInfo.setAllRecordCount(service1.getOffSaleCountWithCondition(product, pageInfo));

		List<Product> list = service2.getOffSalePageWithCondition(product, pageInfo);

		System.out.println(pageInfo);

		target = "putOnShelves.jsp";

		request.setAttribute("condition", condition);

		request.setAttribute("list", list);
		request.setAttribute("pageInfo", pageInfo);
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	
	
	public void getOnSaleProductPageWithCondition(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String target = "";

		System.out.println("in getOnSaleProductPageWithCondition");
		
		String condition = request.getParameter("condition");
		
		if(condition==null || condition.equals("")){
			condition="_";
		}
		
		int currentPage = new Integer(request.getParameter("currentPage"));

		System.out.println(currentPage);
		
		Product product = new Product();
		product.setPname(condition);
		product.setDianpuName(condition);
		product.setCname(condition);

		PageInfo pageInfo = new PageInfo(currentPage,5);

		ProductServiceImpl service1 = new ProductServiceImpl();
		ProductServiceImpl service2 = new ProductServiceImpl();

		pageInfo.setAllRecordCount(service1.getOnSaleCountWithCondition(product, pageInfo));

		List<Product> list = service2.getOnSalePageWithCondition(product, pageInfo);

		System.out.println(pageInfo);

		target = "pullOffShelves.jsp";

		request.setAttribute("condition", condition);

		request.setAttribute("list", list);
		request.setAttribute("pageInfo", pageInfo);
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	
	public void getProductPageByCondition(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String target = "";

		System.out.println("in getProductPageByCondition");
		
		String condition = request.getParameter("condition");
		int currentPage = new Integer(request.getParameter("currentPage"));

		System.out.println(currentPage);
		
		Product product = new Product();
		product.setPname(condition);
		product.setDianpuName(condition);
		product.setCname(condition);

		PageInfo pageInfo = new PageInfo(currentPage,5);

		ProductServiceImpl service1 = new ProductServiceImpl();
		ProductServiceImpl service2 = new ProductServiceImpl();

		pageInfo.setAllRecordCount(service1.getRecordCountWithCondition(product,
				pageInfo));

		List<Product> list = service2.getPageWithCondition(product, pageInfo);

		System.out.println(pageInfo);

		target = "productMain.jsp";

		request.setAttribute("condition", condition);

		request.setAttribute("list", list);
		request.setAttribute("pageInfo", pageInfo);
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	
	public void toPutOnShelvesjsp(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in toPutOnShelvesjsp");
		String condition = request.getParameter("condition");

		// 是否带有条件
		if (condition == null || condition.trim().equals("")
				|| condition.equals("null")) {

			int currentPage = new Integer(request.getParameter("currentPage"));

			System.out.println(currentPage);
			PageInfo pageInfo = new PageInfo(currentPage,5);

			System.out.println(pageInfo.getAllPageCount());
			System.out.println(pageInfo.getAllRecordCount());

			ProductService service1 = new ProductServiceImpl();
			pageInfo.setAllRecordCount(service1.getAllOffSaleProductCount());

			ProductService service2 = new ProductServiceImpl();
			List<Product> list = service2.getAllOffSaleByPage(pageInfo);

			String target = "putOnShelves.jsp";

			System.out.println(pageInfo.getAllPageCount());
			System.out.println(pageInfo.getAllRecordCount());

			request.setAttribute("condition", "");

			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			request.getRequestDispatcher(target).forward(request, response);

		} else {
			this.getOffSaleProductPageWithCondition(request, response);
		}
	}
	
	public void toPullOffShelvesjsp(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in toPullOffShelvesjsp");
		String condition = request.getParameter("condition");

		// 是否带有条件
		if (condition == null || condition.trim().equals("")
				|| condition.equals("null")) {

			int currentPage = new Integer(request.getParameter("currentPage"));

			System.out.println(currentPage);
			PageInfo pageInfo = new PageInfo(currentPage,5);

			System.out.println(pageInfo.getAllPageCount());
			System.out.println(pageInfo.getAllRecordCount());

			ProductService service1 = new ProductServiceImpl();
			pageInfo.setAllRecordCount(service1.getAllOnSaleProductCount());

			ProductService service2 = new ProductServiceImpl();
			List<Product> list = service2.getAllOnSaleByPage(pageInfo);

			String target = "pullOffShelves.jsp";

			System.out.println(pageInfo.getAllPageCount());
			System.out.println(pageInfo.getAllRecordCount());

			request.setAttribute("condition", "");

			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			request.getRequestDispatcher(target).forward(request, response);

		} else {
			this.getOnSaleProductPageWithCondition(request, response);
		}
	}
	
	public void uploadImg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in uploadImg");
		String target = "";
		ServletConfig servletConfig = this.getServletConfig();
		String productImagesUploadPath = servletConfig.getInitParameter("productImagesUploadPath");
		ProductServiceImpl service = new ProductServiceImpl();
		service.upload(request, productImagesUploadPath);		
		
		target = "msg.jsp";
		request.setAttribute("msg", "保存图片成功");
		request.getRequestDispatcher(target).forward(request, response);
	
	}
	
	public void add(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("in add");
		
		String target = "";

		String pname = request.getParameter("pname");		
		String dianpuName = request.getParameter("dianpuName");
		String pdesc = request.getParameter("pdesc");
		Integer cid = new Integer(request.getParameter("cid"));
		
		
		Float price = new Float(request.getParameter("price"));
		Integer productSum = new Integer(request.getParameter("productSum"));
		String color = request.getParameter("color");
		String version = request.getParameter("version");
		
		
		Product product = new Product();
		
		product.setPname(pname);
		
		product.setProductSum(productSum);
		product.setDianpuName(dianpuName);
		product.setPdesc(pdesc);
		product.setOnsale(false);
		product.setCid(cid);
		
		if("".equals(price)||price==null){
			product.setPrice(0f);
		}else{
			product.setPrice(price);
		}
		
		if("".equals(color)||color==null){
			product.setColor("无");
		}else{
			product.setColor(color);
		}
		
		if("".equals(version)||version==null){
			product.setVersion("无");
		}else{
			product.setVersion(version);
		}
		
		ProductServiceImpl service = new ProductServiceImpl();

		service.addProduct(product); 
		 
		

		target = "msg.jsp";

		request.setAttribute("msg", "保存商品成功");
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	
	public void toAddProductjsp(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("in toAddProductjsp");
		
		String target = "";


		CategoryServiceImpl service = new CategoryServiceImpl();

		List<Category> categoryList = service.getAll();
	 
		Integer fid = categoryList.get(0).getCid();
		 
		Category2ServiceImpl service2 = new Category2ServiceImpl();

		List<Category2> category2List = service2.getCategoriesByFid(fid);

		target = "addProduct.jsp";

		request.setAttribute("categoryList", categoryList);
		request.setAttribute("category2List", category2List);
		request.getRequestDispatcher(target).forward(request, response);
	}
	

	public void getCategory2ofCategory(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("in getCategory2ofCategory");
		
		response.setContentType("application/json;charset=utf-8");
		
		PrintWriter pw = response.getWriter();
		

		int fid = new Integer(request.getParameter("c1cid"));
		
		System.out.println(fid);

		Category2ServiceImpl service = new Category2ServiceImpl();

		 List<Category2> category2List = service.getCategoriesByFid(fid);
		 
		 Gson gson = new Gson();
		 
		 String category2data = gson.toJson(category2List);
		 
		 pw.println(category2data);
		 pw.flush();
		 

	}
	
	public void hasProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("this");
		PrintWriter out = response.getWriter();
		
		String pname = request.getParameter("pname");
		String price = request.getParameter("price");
		String dianpuName = request.getParameter("dianpuName");
		String color = request.getParameter("color");
		String version = request.getParameter("version");
		String fid = request.getParameter("fid");
		
		System.out.println(fid);
		Product product = new Product();
		product.setPname(pname);
		if("".equals(price)||price==null){
			product.setPrice(0f);
		}else{
			product.setPrice(Float.parseFloat(price));
		}
		
		if("".equals(color)||color==null){
			product.setColor("无");
		}else{
			product.setColor(color);
		}
		
		if("".equals(version)||version==null){
			product.setVersion("无");
		}else{
			product.setVersion(version);
		}
		product.setDianpuName(dianpuName);
		
		System.out.println(product);
		boolean hasProduct = false;
		List<Product> list = new ProductServiceImpl().getProductByCid(Integer.parseInt(fid));
		
		Iterator<Product> i = list.iterator();
		while(i.hasNext()){
			Product product2 = i.next();
			
			if(product.equals(product2)){
				hasProduct = true;
			}
		}
		
		
		if(hasProduct){
			out.print("已存在此商品");
		}else{
			out.print("不存在此商品");
		}
		out.flush();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
