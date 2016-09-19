package com.servlet;

//导包
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.page.PageInfo;
import com.po.Category;
import com.po.Category2;
import com.service.implMybatis.Category2ServiceImpl;
import com.service.implMybatis.CategoryServiceImpl;
import com.service.interMybatis.Category2Service;
import com.service.interMybatis.CategoryService;

public class CategoryServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("action");

		if (action.equals("add")) {
			this.add(request, response);
		} else if (action.equals("getAll")) {
			System.out.println("getAll");
			this.getAll(request, response);
		} else if (action.equals("deleteCategory")) {
			this.delete(request, response);
		} else if (action.equals("toUpdateJsp")) {
			this.toUpdateJsp(request, response);
			System.out.println("toUpdate");
		} else if (action.equals("update")) {
			this.update(request, response);
		} else if (action.equals("getAllByPage")) {
			this.getAllByPage(request, response);
		} else if (action.equals("getPageByCondition")) {
			this.getPageByCondition(request, response);
		} else if (action.equals("toAddCategory2jsp")) {
			this.toAddCategory2jsp(request, response);
		} else if (action.equals("addCategory2")) {
			this.addCategory2(request, response);
		} else if (action.equals("getAllCategory2ByPage")) {
			this.getAllCategory2ByPage(request, response);
		} else if (action.equals("toUpdateCategory2Jsp")) {
			this.toUpdateCategory2Jsp(request, response);
		} else if (action.equals("updateCategory2")) {
			this.updateCategory2(request, response);
		} else if (action.equals("deleteCategory2")) {
			this.deleteCategory2(request, response);
		} else if (action.equals("getCategory2PageByCondition")) {
			this.getCategory2PageByCondition(request, response);
		} else if (action.equals("toAddCategory3jsp")) {
			this.toAddCategory3jsp(request, response);
		} /*else if (action.equals("addCategory3")) {
			this.addCategory3(request, response);
		}*/ else if (action.equals("getCategory2ByFid")) {
			this.getCategory2ByFid(request, response);
		}else if("hasCategory".equals(action)){
			hasCategory(request,response);
		} else if("hasCategory2".equals(action)){
			hasCategory2(request,response);
		} 
	}
	
	


	public void getAllCategory2ByPage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("in getAllCategory2ByPage");

		String condition = request.getParameter("condition");

		// 是否带有条件
		if (condition == null || condition.trim().equals("")
				|| condition.equals("null")) {

			int currentPage = new Integer(request.getParameter("currentPage"));

			System.out.println(currentPage);
			PageInfo pageInfo = new PageInfo(currentPage,5);

			System.out.println(pageInfo.getAllPageCount());
			System.out.println(pageInfo.getAllRecordCount());

			Category2Service service1 = new Category2ServiceImpl();
			pageInfo.setAllRecordCount(service1.getAllRecordCount());

			Category2Service service2 = new Category2ServiceImpl();
			List<Category2> list = service2.getAllByPage(pageInfo);

			String target = "category2Main.jsp";

			System.out.println(pageInfo.getAllPageCount());
			System.out.println(pageInfo.getAllRecordCount());

			request.setAttribute("condition", "");

			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			request.getRequestDispatcher(target).forward(request, response);

		} else {
			this.getPageByCondition(request, response);
		}

	}

	public void getCategory2ByFid(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("in getCategory2ByFid");
		
		String target = "";

		Integer C2Fid = new Integer(request.getParameter("C2Fid"));
		
		CategoryService service1 = new CategoryServiceImpl();
		List<Category> list1 = service1.getAll();
		
		Category2Service service2 = new Category2ServiceImpl();
		List<Category2> list2 = service2.getCategoriesByFid(C2Fid);
		
		target = "addCategory3.jsp";
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("C2Fid", C2Fid);
		request.getRequestDispatcher(target).forward(request, response);
	}

	private void addCategory2(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String target = "";

		// 接收数据
		String cname = request.getParameter("cname");
		String cdesc = request.getParameter("cdesc");
		Integer fid = new Integer(request.getParameter("fid"));
		// 调用业务逻辑
		Category2 category2 = new Category2();
		category2.setCname(cname);
		category2.setCdesc(cdesc);
		category2.setFid(fid);

		CategoryService service1 = new CategoryServiceImpl();

		category2.setFname(service1.getCategoryById(fid).getCname());

		Category2Service service2 = new Category2ServiceImpl();

		service2.addCategory(category2);

		target = "msg.jsp";

		// 转发试图
		request.setAttribute("msg", "保存二级商品种类成功");
		request.getRequestDispatcher(target).forward(request, response);
	}

	/*private void addCategory3(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String target = "";

		// 接收数据
		String cname = request.getParameter("cname");
		String cdesc = request.getParameter("cdesc");
		Integer gid = new Integer(request.getParameter("gid"));
		Integer fid = new Integer(request.getParameter("fid"));
		// 调用业务逻辑
		Category3 category3 = new Category3();
		category3.setCname(cname);
		category3.setCdesc(cdesc);
		category3.setGid(gid);
		category3.setFid(fid);

		Category3Service service = new Category3ServiceImpl();

		service.addCategory(category3);

		target = "msg.jsp";

		// 转发试图
		request.setAttribute("msg", "保存商品成功");
		request.getRequestDispatcher(target).forward(request, response);
	}
*/
	private void toAddCategory2jsp(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in toAddCategory2jsp");

		CategoryService service = new CategoryServiceImpl();

		List<Category> list = service.getAll();

		String target = "addCategory2.jsp";

		request.setAttribute("list", list);
		request.getRequestDispatcher(target).forward(request, response);
	}

	private void toAddCategory3jsp(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in toAddCategory3jsp");

		CategoryService service1 = new CategoryServiceImpl();

		List<Category> list1 = service1.getAll();

		Category2Service service2 = new Category2ServiceImpl();

		List<Category2> list2 = service2.getCategoriesByFid(list1.get(0)
				.getCid());

		String target = "addCategory3.jsp";

		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.getRequestDispatcher(target).forward(request, response);
	}

	private void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("in update");

		String condition = request.getParameter("condition");
		System.out.println(condition);

		CategoryServiceImpl service = new CategoryServiceImpl();

		Integer cid = new Integer(request.getParameter("cid"));

		String cname = request.getParameter("cname");
		String cdesc = request.getParameter("cdesc");

		System.out.println(cid);
		System.out.println(cdesc);
		System.out.println(cname);

		Category category = new Category();
		category.setCid(cid);
		category.setCname(cname);
		category.setCdesc(cdesc);

		service.updateCategory(category);

		// 转发视图
		if (!(condition == null || condition.trim().equals("") || condition
				.equals("null"))) {
			this.getPageByCondition(request, response);
		} else {

			this.getAllByPage(request, response);
		}

	}

	private void updateCategory2(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("in updateCategory2");

		String condition = request.getParameter("condition");
		System.out.println(condition);

		Integer cid = new Integer(request.getParameter("cid"));
		String cname = request.getParameter("cname");
		String cdesc = request.getParameter("cdesc");
		Integer fid = new Integer(request.getParameter("fid"));

		Category2 category2 = new Category2();
		category2.setCid(cid);
		category2.setCname(cname);
		category2.setCdesc(cdesc);
		category2.setFid(fid);

		Category2ServiceImpl service = new Category2ServiceImpl();
		service.updateCategory(category2);

		// 转发视图
		if (!(condition == null || condition.trim().equals("") || condition
				.equals("null"))) {
			this.getPageByCondition(request, response);
		} else {

			this.getAllCategory2ByPage(request, response);
		}

	}

	private void toUpdateJsp(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String target = "";
		System.out.println("in toUpdateJsp");

		// 接收数据
		String cid = request.getParameter("cid");

		String currentPage = request.getParameter("currentPage");

		String condition = request.getParameter("condition");

		System.out.println(condition);
		// 是否带有条件

		// 调用业务逻辑

		CategoryService service = new CategoryServiceImpl();

		Category category = service.getCategoryById(new Integer(cid));

		target = "updateCategory.jsp";

		// 转发视图

		if (condition == null || condition.trim().equals("")
				|| condition.equals("null")) {
			request.setAttribute("condition", "");
		} else {
			request.setAttribute("condition", condition);
		}

		request.setAttribute("category", category);
		request.setAttribute("currentPage", currentPage);
		request.getRequestDispatcher(target).forward(request, response);

	}

	private void toUpdateCategory2Jsp(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String target = "";
		System.out.println("in toUpdateCategory2Jsp");

		// 接收数据
		String cid = request.getParameter("cid");

		String currentPage = request.getParameter("currentPage");

		String condition = request.getParameter("condition");

		System.out.println(condition);
		// 是否带有条件

		// 调用业务逻辑

		CategoryService service1 = new CategoryServiceImpl();
		List<Category> list = service1.getAll();

		Category2Service service2 = new Category2ServiceImpl();

		Category2 category2 = service2.getCategoryById(new Integer(cid));

		target = "updateCategory2.jsp";

		// 转发视图

		if (condition == null || condition.trim().equals("")
				|| condition.equals("null")) {
			request.setAttribute("condition", "");
		} else {
			request.setAttribute("condition", condition);
		}
		request.setAttribute("list", list);
		request.setAttribute("category2", category2);
		request.setAttribute("currentPage", currentPage);
		request.getRequestDispatcher(target).forward(request, response);

	}

	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("1111");
		String target = "";

		// 接收数据
		String cname = request.getParameter("cname");
		String cdesc = request.getParameter("cdesc");
		// 调用业务逻辑
		Category category = new Category();
		category.setCname(cname);
		category.setCdesc(cdesc);

		CategoryService service = new CategoryServiceImpl();

		service.addCategory(category);

		target = "msg.jsp";

		// 转发试图
		request.setAttribute("msg", "保存一级商品种类成功");
		request.getRequestDispatcher(target).forward(request, response);
	}

	public void getAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("in getAll");

		CategoryService service = new CategoryServiceImpl();

		List<Category> list = service.getAll();

		String target = "categoryMain.jsp";

		request.setAttribute("list", list);
		request.getRequestDispatcher(target).forward(request, response);

	}

	public void getAllByPage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("in getAllBypage");

		String condition = request.getParameter("condition");

		// 是否带有条件
		if (condition == null || condition.trim().equals("")
				|| condition.equals("null")) {

			int currentPage = new Integer(request.getParameter("currentPage"));

			System.out.println(currentPage);
			PageInfo pageInfo = new PageInfo(currentPage,5);

			System.out.println(pageInfo.getAllPageCount());
			System.out.println(pageInfo.getAllRecordCount());

			CategoryService service1 = new CategoryServiceImpl();
			pageInfo.setAllRecordCount(service1.getAllRecordCount());

			CategoryService service2 = new CategoryServiceImpl();
			List<Category> list = service2.getAllByPage(pageInfo);

			String target = "categoryMain.jsp";

			System.out.println(pageInfo.getAllPageCount());
			System.out.println(pageInfo.getAllRecordCount());

			request.setAttribute("condition", "");

			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			request.getRequestDispatcher(target).forward(request, response);

		} else {
			this.getPageByCondition(request, response);
		}

	}

	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("in delete");

		CategoryServiceImpl service = new CategoryServiceImpl();

		Integer cid = new Integer(request.getParameter("cid"));

		String condition = request.getParameter("condition");

		int result = service.deleteCategoryById(cid);

		// 转发视图
		if (!(condition == null || condition.trim().equals("") || condition
				.equals("null"))) {
			this.getPageByCondition(request, response);
		} else {

			this.getAllByPage(request, response);
		}

	}

	public void deleteCategory2(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("in deleteCategory2");

		Category2ServiceImpl service = new Category2ServiceImpl();

		Integer cid = new Integer(request.getParameter("cid"));

		String condition = request.getParameter("condition");

		service.deleteCategoryById(cid);

		// 转发视图
		if (!(condition == null || condition.trim().equals("") || condition
				.equals("null"))) {
			this.getPageByCondition(request, response);
		} else {

			this.getAllCategory2ByPage(request, response);
		}

	}

	public void getPageByCondition(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String target = "";

		String condition = request.getParameter("condition");
		int currentPage = new Integer(request.getParameter("currentPage"));

		Category category = new Category();
		category.setCname(condition);
		category.setCdesc(condition);

		PageInfo pageInfo = new PageInfo(currentPage,5);

		CategoryServiceImpl service1 = new CategoryServiceImpl();
		CategoryServiceImpl service2 = new CategoryServiceImpl();

		pageInfo.setAllRecordCount(service1.getQueryRecordCount(category,
				pageInfo));

		List<Category> list = service2.getPageByQuery(category, pageInfo);

		System.out.println(pageInfo);

		target = "categoryMain.jsp";

		request.setAttribute("condition", condition);

		request.setAttribute("list", list);
		request.setAttribute("pageInfo", pageInfo);
		request.getRequestDispatcher(target).forward(request, response);
	}

	public void getCategory2PageByCondition(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String target = "";

		String condition = request.getParameter("condition");
		int currentPage = new Integer(request.getParameter("currentPage"));

		Category2 category2 = new Category2();
		category2.setCname(condition);
		category2.setCdesc(condition);
		category2.setFname(condition);

		PageInfo pageInfo = new PageInfo(currentPage,5);

		Category2ServiceImpl service1 = new Category2ServiceImpl();
		Category2ServiceImpl service2 = new Category2ServiceImpl();

		pageInfo.setAllRecordCount(service1.getQueryRecordCount(category2,
				pageInfo));

		List<Category2> list = service2.getPageByQuery(category2, pageInfo);

		System.out.println(pageInfo);

		target = "category2Main.jsp";

		request.setAttribute("condition", condition);

		request.setAttribute("list", list);
		request.setAttribute("pageInfo", pageInfo);
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void hasCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			PrintWriter out = response.getWriter();
			String cname = request.getParameter("cname");
			
			List<Category> list = new CategoryServiceImpl().getAll();
			
			Iterator<Category> i = list.iterator();
			
			boolean hasCategory = false;
			while(i.hasNext()){
				Category category = i.next();
				
				if(cname.equals(category.getCname())){
					hasCategory = true;
					break;
				}
				
			}
			
			if(hasCategory){
				
				out.print("已存在此商品种类");
			}else{
				out.print("未存在该商品种类");
			}
			
			out.flush();
			
	}
	
	public void hasCategory2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String cname = request.getParameter("cname");
		int fid = Integer.parseInt(request.getParameter("fid"));
		
		System.out.println(cname);
		System.out.println(fid);
		Category2 category = new Category2();
		category.setCname(cname);
		category.setFid(fid);
		List<Category2> list = new Category2ServiceImpl().getCategoriesByFid(fid);
		
		Iterator<Category2> i = list.iterator();
		
		boolean hasCategory2 = false;
		while(i.hasNext()){
			Category2 category2 = i.next();
			
			if(category.getCname().equals(category2.getCname())){
				hasCategory2 = true;
				break;
			}
			
		}
		
		
		if(hasCategory2){
			
			out.print("已存在此商品种类");
		}else{
			out.print("未存在该商品种类");
		}
		
		out.flush();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
