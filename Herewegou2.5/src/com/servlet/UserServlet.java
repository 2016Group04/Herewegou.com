package com.servlet;

//导包
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.page.PageInfo;
import com.service.impl.Category2ServiceImpl;
import com.service.impl.CategoryServiceImpl;
import com.service.impl.ClientUserServiceImpl;
import com.service.impl.JavaMailServiceImpl;
import com.service.impl.ProductServiceImpl;
import com.service.impl.UserServiceImpl;
import com.service.inter.Category2Service;
import com.service.inter.CategoryService;
import com.service.inter.ProductService;
import com.vo.Category;
import com.vo.Category2;
import com.vo.ClientUser;
import com.vo.Product;

public class UserServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String action = request.getParameter("action");
		if (action.equals("initMenu")) {
			this.initMenu(request, response);
		} else if (action.equals("getProductList")) {
			this.getProductList(request, response);
		} else if (action.equals("getProductListByPage")) {
			this.getProductListByPage(request, response);
		} else if (action.equals("getProductDetailPage")) {
			this.getProductDetailPage(request, response);
		} else if (action.equals("toLoginJsp")) {
			this.toLoginJsp(request, response);
		} else if ("checkUsername".equals(action)) {
			this.checkUsername(request, response);
		} else if ("register".equals(action)) {
			this.register(request, response);
		} else if (action.equals("queryAllUser")) {
			this.queryAllUser(request, response);
		} else if (action.equals("queryDong")) {
			this.queryDong(request, response);
		} else if (action.equals("dongjie")) {
			this.dongjie(request, response);
		} else if (action.equals("jiedong")) {
			this.jiedong(request, response);
		} else if (action.equals("login")) {
			this.login(request, response);
		} else if ("logout".equals(action)) {
			this.logout(request, response);
		} else if ("checkOrder".equals(action)) {
			this.checkOrder(request, response);
		} else if ("activation".equals(action)) {
			this.activation(request, response);
		}

	}

	public void toLoginJsp(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in toLoginJsp");
		String target = "";	
		
		String returnURL = request.getParameter("returnURL");
		
		HttpSession session = request.getSession(true);
		session.setAttribute("returnURL",returnURL);
		
		
		System.out.println("**returnURL:"+returnURL);
		
		target = "login.jsp";
		request.getRequestDispatcher(target).forward(request, response);

	}

	public void getProductDetailPage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in getProductDetailPage");
		String target = "";

		Map<Category, List<Category2>> categoryMap = this.getCategoryMap();

		Integer cid = Integer.parseInt(request.getParameter("cid"));
		Integer pid = Integer.parseInt(request.getParameter("pid"));

		Category2Service service2 = new Category2ServiceImpl();
		Category2 category2 = service2.getCategoryById(cid);

		CategoryService service3 = new CategoryServiceImpl();
		Category category = service3.getCategoryById(category2.getFid());

		ProductService service4 = new ProductServiceImpl();
		Product product = service4.getProductByPid(pid);

		target = "detail.jsp";

		request.setAttribute("categoryMap", categoryMap);
		request.setAttribute("category", category);
		request.setAttribute("category2", category2);
		request.setAttribute("product", product);
		request.getRequestDispatcher(target).forward(request, response);

	}

	public void getProductListByPage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in getProductListByPage");
		String target = "";

		String condition = request.getParameter("condition");

		// 是否带有条件
		if (condition == null || condition.trim().equals("")
				|| condition.equals("null")) {

			Map<Category, List<Category2>> categoryMap = this.getCategoryMap();

			Integer cid = Integer.parseInt(request.getParameter("cid"));

			int currentPage = new Integer(request.getParameter("currentPage"));

			System.out.println(currentPage);
			PageInfo pageInfo = new PageInfo(currentPage, 15);

			System.out.println(pageInfo.getAllPageCount());
			System.out.println(pageInfo.getAllRecordCount());

			ProductService service1 = new ProductServiceImpl();
			List<Product> productList = service1.getProductsPageByCid(pageInfo,cid);

			Category2Service service2 = new Category2ServiceImpl();
			Category2 category2 = service2.getCategoryById(cid);

			CategoryService service3 = new CategoryServiceImpl();
			Category category = service3.getCategoryById(category2.getFid());

			ProductService service4 = new ProductServiceImpl();
			pageInfo.setAllRecordCount(service4.getAllOnSaleProductCount());

			System.out.println(pageInfo.getAllPageCount());
			System.out.println(pageInfo.getAllRecordCount());

			target = "list.jsp";

			request.setAttribute("condition", "");

			request.setAttribute("categoryMap", categoryMap);
			request.setAttribute("category", category);
			request.setAttribute("category2", category2);
			request.setAttribute("productList", productList);
			request.setAttribute("pageInfo", pageInfo);
			request.getRequestDispatcher(target).forward(request, response);

		} else {
			this.getProductPageByCondition(request, response);
		}

	}

	public void getProductPageByCondition(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		/*
		 * String target = "";
		 * 
		 * System.out.println("in getProductPageByCondition");
		 * 
		 * String condition = request.getParameter("condition"); int currentPage
		 * = new Integer(request.getParameter("currentPage"));
		 * 
		 * System.out.println(currentPage);
		 * 
		 * Product product = new Product(); product.setPname(condition);
		 * product.setDianpuName(condition); product.setCname(condition);
		 * 
		 * PageInfo pageInfo = new PageInfo(currentPage,5);
		 * 
		 * ProductServiceImpl service1 = new ProductServiceImpl();
		 * ProductServiceImpl service2 = new ProductServiceImpl();
		 * 
		 * pageInfo.setAllRecordCount(service1.getRecordCountWithCondition(product
		 * , pageInfo));
		 * 
		 * List<Product> list = service2.getPageWithCondition(product,
		 * pageInfo);
		 * 
		 * System.out.println(pageInfo);
		 * 
		 * target = "productMain.jsp";
		 * 
		 * request.setAttribute("condition", condition);
		 * 
		 * request.setAttribute("list", list); request.setAttribute("pageInfo",
		 * pageInfo); request.getRequestDispatcher(target).forward(request,
		 * response);
		 */
	}

	public void getProductList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in getProductList");
		String target = "";

		Map<Category, List<Category2>> categoryMap = this.getCategoryMap();

		Integer cid = Integer.parseInt(request.getParameter("cid"));

		ProductService service1 = new ProductServiceImpl();
		List<Product> productList = service1.getProductsByCid(cid);

		Category2Service service2 = new Category2ServiceImpl();
		Category2 category2 = service2.getCategoryById(cid);

		CategoryService service3 = new CategoryServiceImpl();
		Category category = service3.getCategoryById(category2.getFid());

		target = "list.jsp";
		request.setAttribute("category", category);
		request.setAttribute("category2", category2);
		request.setAttribute("categoryMap", categoryMap);
		request.setAttribute("productList", productList);
		request.getRequestDispatcher(target).forward(request, response);
	}

	public void initMenu(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("in initMenu");
		String target = "";

		Map<Category, List<Category2>> categoryMap = this.getCategoryMap();

		target = "../user/firstPage.jsp";
		request.setAttribute("categoryMap", categoryMap);
		request.getRequestDispatcher(target).forward(request, response);

	}

	public Map<Category, List<Category2>> getCategoryMap() {

		Map<Category, List<Category2>> categoryMap = new LinkedHashMap<Category, List<Category2>>();

		CategoryService service1 = new CategoryServiceImpl();
		List<Category> list1 = service1.getAll();

		for (Category category : list1) {
			Category2Service service2 = new Category2ServiceImpl();
			List<Category2> list2 = service2.getCategoriesByFid(category.getCid());
			categoryMap.put(category, list2);
		}

		return categoryMap;
	}

	public void checkUsername(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 一.填充数据
		String username = request.getParameter("userAccount");
		// 二.调用业务逻辑
		UserServiceImpl service = new UserServiceImpl();
		boolean flag = service.checkUsername(username);

		Gson gson = new Gson();
		String json = gson.toJson(flag);
		// 三.输出
		out.println(json);
		out.flush();
	}

	public void register(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String target = "";
		// 一.填充数据
		String userAccount = request.getParameter("username");
		String password = request.getParameter("password");
		String mail = request.getParameter("mail");
		if (mail == "") {
			mail = null;
		}
		long phoneNumber = new Long(request.getParameter("phoneNumber"));
		// 二.调用业务逻辑
		ClientUser user = new ClientUser();
		user.setUserAccount(userAccount);
		user.setPassword(password);
		user.setMail(mail);
		user.setPhoneNumber(phoneNumber);

		UserServiceImpl service = new UserServiceImpl();
		System.out.println(user);
		boolean registerSuccess = service.register(user);

		UserServiceImpl service2 = new UserServiceImpl();
		ClientUser clientUser = service2.getClientUserByUserAccount(userAccount);
		
		if(registerSuccess&&mail!=null){ //如果注册成功 发送激活邮件
			JavaMailServiceImpl mailService = new JavaMailServiceImpl();
			String from = "271429728qq@sina.com";
			String to = user.getMail();
			String subject = "请激活账户";

			String content = "<!DOCTYPE html><html><head><meta charset='utf-8' /><title>HWG(HWG.COM)-综合网购首选-正品低价、品质保障、配送及时、轻松购物</title><link rel='shortcut icon' href='jd-title.ico' type='image/x-icon' /><link rel='stylesheet' type='text/css' href='css/top.css' /></head><body><style>	.qmbox a {			color: #0095dd;			text-decoration: none !important;		}	</style>	<div itemscope='itemscope' itemtype='https://schema.org/EmailMessage'>		<div itemprop='potentialAction' itemscope='itemscope'			itemtype='https://schema.org/ViewAction'></div>	</div>	<center>		<table align='center' border='0' cellpadding='0' cellspacing='0'			height='100%' width='100%' id='bodyTable'			style='background-color:#F2F2F2;width:100% !important;padding:0;margin:0;height:100% !important;border-collapse:collapse !important;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;'>			<tbody>				<tr>					<td align='center' valign='top' id='bodyCell'						style='width:100% !important;padding:50px;margin:0;height:100% !important;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;'>						<table border='0' cellpadding='0' cellspacing='0'							id='templateContainer'							style='border:1px solid #DDDDDD;border-bottom-color:#CCCCCC;max-width:500px !important;border-collapse:collapse !important;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;'>							<tbody>								<tr>									<td align='center' valign='top'										style='mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;'>										<table border='0' cellpadding='0' cellspacing='0' width='100%'											id='templateBody'											style='border-bottom:1px solid #CCCCCC;border-top:1px solid #FFFFFF;background-color:#FFFFFF;border-collapse:collapse !important;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;'>											<tbody>												<tr>													<td valign='top' class='bodyContent' mc:edit='body_content'														style='text-align:center;padding-left:20px;padding-bottom:30px;padding-right:20px;padding-top:30px;line-height:150%;font-size:15px;font-family:Microsoft YaHei;color:#424F59;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;'>														<h1															style='text-align:center;margin-left:0;margin-bottom:10px;margin-right:0;margin-top:0;letter-spacing:normal;line-height:100%;font-weight:normal;font-style:normal;font-size:26px;font-family:Micorsoft jHeng Hei;display:block;color:#424F59 !important;'>激活账号</h1>														<br>"
					+ clientUser.getNickname()
					+ "，您好 "
					+ "</a>,<br>只需再花几秒钟就可以验证您的 HWG商城 账号了。													</td>												</tr>												<tr width='100%'>													<td align='center' valign='top'														style='mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;'>														<table border='0' cellpadding='0' cellspacing='0'															width='100%'															style='border-collapse:collapse !important;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;'>															<tbody>																<tr height='47'>																	<td align='center' valign='top'																		style='mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;'>																		<table border='0' cellpadding='0' cellspacing='0'																			width='65%' class='flexibleContainer'																			style='border-collapse:collapse !important;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;'>																			<tbody>																				<tr>																					<td align='center' valign='top'																						class='flexibleContainerCell bottomShim'																						style='mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;'>																						<table border='0' cellpadding='0' cellspacing='0'																							width='280' class='emailButton'																							style='border-radius:4px;background-color:#b61d1d;width:100% !important;border-collapse:separate;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;'>																							<tbody>																								<tr>																									<td align='center' valign='middle'																										class='buttonContent'																										style='text-align:center;line-height:100%;font-weight:normal;font-size:20px;font-family:Microsoft YaHei;color:#FFFFFF;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;'>																										<a href='http://localhost:8080/HereWeGou2.5/jsp/user/UserServlet?action=activation&userid="+clientUser.getUserId()+" ' style='text-decoration:none;font-size:20px;font-family:Microsoft YaHei;display:block;color:#FFFFFF;padding:15px !important;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;'target='_blank'>激&nbsp;&nbsp;&nbsp;&nbsp;活</a>																									</td>																								</tr>																							</tbody>																						</table>																					</td>																				</tr>																			</tbody>																		</table>																	</td>																</tr>															</tbody>														</table>													</td>												</tr>												<tr width='100%'>													<td align='center' valign='top'														style='mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;'>														<table border='0' cellpadding='0' cellspacing='0'															width='70%'															style='border-collapse:collapse !important;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;'>															<tbody>																<tr>																	<td valign='top' class='bodyContent'																		mc:edit='body_content'																		style='text-align:center;padding-left:20px;padding-bottom:30px;padding-right:20px;padding-top:30px;font-family:Microsoft YaHei;mso-table-rspace:0pt;mso-table-lspace:0pt;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;color:#8A9BA8;line-height:13px;font-size:11px;'>这是一封自动发送的邮件；如果您并未要求但收到这封信件，您不需要进行任何操作。要了解更多信息，请访问<a href='https://support.jd.com'																		target='_blank'>HWG 技术支持</a>																	</td>																</tr>															</tbody>														</table>													</td>												</tr>											</tbody>										</table>									</td>								</tr>							</tbody>						</table>					</td>				</tr>			</tbody>		</table>	</center>	<style type='text/css'>		.qmbox style,.qmbox script,.qmbox head,.qmbox link,.qmbox meta {			display: none !important;		}	</style></body></html>";

			boolean sendMailFlag = mailService.sendTextMail(from, to, subject,content);
			if (sendMailFlag) {
				System.out.println("发送邮件成功");
			} else {
				System.out.println("发送失败");
			}
			// 三.转发视图
			target = "registerSuccess.jsp";
			request.setAttribute("clientUser", clientUser);
			request.getRequestDispatcher(target).forward(request, response);
		}
		
	}

	public void queryAllUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		int allUserCount = new ClientUserServiceImpl().getAllUserCount();
		int frozenCount = new ClientUserServiceImpl().getFrozenUserCount();
		String currentPage = request.getParameter("currentPage");

		if ("".equals(currentPage) || currentPage == null) {

			currentPage = "1";
		}
		PageInfo pageInfo = new PageInfo(new Integer(currentPage), 5);

		pageInfo.setAllRecordCount(allUserCount);

		List<ClientUser> list = new ClientUserServiceImpl()
				.getAllByPage(pageInfo);

		String target = "../serverUser/allUser.jsp";

		request.setAttribute("list", list);
		request.setAttribute("allUserCount", ("" + allUserCount));
		request.setAttribute("frozenCount", ("" + frozenCount));
		request.setAttribute("pageInfo", pageInfo);

		request.getRequestDispatcher(target).forward(request, response);

	}

	public void queryDong(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String target = "";

		String actions = request.getParameter("actions");
		String currentPage = request.getParameter("currentPage");
		PageInfo pageInfo = new PageInfo(new Integer(currentPage), 5);
		String condition = request.getParameter("condition");
		List<ClientUser> list = null;
		if ("".equals(condition) || condition == null) {
			int allUserCount = new ClientUserServiceImpl().getAllUserCount();
			int frozencount = new ClientUserServiceImpl().getFrozenUserCount();
			int notFrozen = allUserCount - frozencount;
			if ("dong".equals(actions)) {

				pageInfo.setAllRecordCount(notFrozen);
				list = new ClientUserServiceImpl()
						.getNotDongUserBySql(pageInfo);
				target = "../serverUser/frozen.jsp";
			} else if ("jie".equals(actions)) {

				pageInfo.setAllRecordCount(frozencount);
				list = new ClientUserServiceImpl().getDongUserBySql(pageInfo);
				target = "../serverUser/jieFrozen.jsp";
			}
			request.setAttribute("condition", "_");

		} else {

			int frozenCount = new ClientUserServiceImpl()
					.getFrozenUserCountCondition(condition);
			int notFrozenCount = new ClientUserServiceImpl()
					.getNotFrozenUserCountCondition(condition);

			if ("dong".equals(actions)) {

				pageInfo.setAllRecordCount(notFrozenCount);
				list = new ClientUserServiceImpl()
						.getNotDongUserBySqlCondition(pageInfo, condition);
				target = "../serverUser/frozen.jsp";

			} else if ("jie".equals(actions)) {

				System.out.println("this");
				pageInfo.setAllRecordCount(frozenCount);
				list = new ClientUserServiceImpl().getDongUserBySqlCondition(
						pageInfo, condition);
				target = "../serverUser/jieFrozen.jsp";
			}
			request.setAttribute("condition", condition);

		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("list", list);

		request.getRequestDispatcher(target).forward(request, response);

	}

	public void dongjie(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pid = request.getParameter("pid");
		System.out.println(pid);
		String currentPage = request.getParameter("currentPage");

		String[] dongpid = pid.split(",");

		for (int i = 0; i < dongpid.length; i++) {

			new ClientUserServiceImpl().dong(dongpid[i]);
			System.out.println("pid" + dongpid[i]);

		}

		this.queryDong(request, response);

	}

	public void jiedong(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("jidong");
		String pid = request.getParameter("pid");
		String currentPage = request.getParameter("currentPage");

		String[] dongpid = pid.split(",");

		for (int i = 0; i < dongpid.length; i++) {

			new ClientUserServiceImpl().jie(dongpid[i]);

		}

		this.queryDong(request, response);

	}

	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		// 一.填充数据
		String username = request.getParameter("userAccount");
		String password = request.getParameter("password");
		// 二.调用业务逻辑
		UserServiceImpl service = new UserServiceImpl();
		ClientUser user = service.login(username, password);

		if (user != null) {// 根据用户名和密码找到了该用户

			Integer isActive = user.getIsActive();
			if (isActive == 1) {
				// 登录成功		

				HttpSession session = request.getSession(true);

				session.setAttribute("user", user);// 把user对象存到session中
				
				String returnURL = (String)session.getAttribute("returnURL");
				System.out.println("returnURL*********" +returnURL);
				
				if(returnURL!=null){
				String[] url = returnURL.split(",");
				
				if(url.length<=2){
					this.initMenu(request, response);
				}else if(url.length>2){
					String servlet = url[0];
					String action = url[1];					
					
					String args = "";
					for(int i=2;i<url.length;i++){
						args = args + "&" + url[i];
					}
					target = servlet + "?" + action + args;
				
				
				
					
				System.out.println("target*********" +target);
				
				
				// 三.转发视图
				request.getRequestDispatcher(target).forward(request, response);
				}		
				
				
				
				}else{
					this.initMenu(request, response);}
				
			} else {
				// 登录失败 跳回登录页面 显示 "用户尚未激活,请激活后再尝试登录"
				request.setAttribute("msg", "用户尚未激活,请激活后再尝试登录");
				
				target = "login.jsp";
				// 三.转发视图
				request.getRequestDispatcher(target).forward(request, response);
			}
		} else {
			// 登录失败 跳回登录页面 显示 "用户名或密码错误"
			request.setAttribute("msg", "用户名或密码错误,请重新输入");
			target = "login.jsp";
			// 三.转发视图
			request.getRequestDispatcher(target).forward(request, response);
		}

		
	}

	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		// 一.填充数据
		// 二.调用业务逻辑
		// 退出登录 注销session即可
		HttpSession session = request.getSession(true);
		session.invalidate();
		// 三.转发视图
		target = "login.jsp";
		request.getRequestDispatcher(target).forward(request, response);
	}

	public void checkOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in checkOrder");
		String target = "";
		// 一.填充数据
		// 二.调用业务逻辑
		// 判断是否登录
		HttpSession session = request.getSession(true);

		ClientUser user = (ClientUser) session.getAttribute("user");
		if (user != null) {
			// 跳到 结算页

			// 查询购物车里的东西 在结算页 再显示一遍 为了确认
			List<Product> list = (List<Product>) session.getAttribute("shoppingCart");
			// 三.转发视图
			request.setAttribute("list", list);

			target = "jiesuan.jsp";
		} else {
			// 跳回 购物车页面 登陆
			target = "login.jsp";
		}
		// 三.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}

	public void activation(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in activation");
		// 一.填充数据
		String userid = request.getParameter("userid");
		System.out.println(userid);
		// 二.调用业务逻辑
		UserServiceImpl service = new UserServiceImpl();
		service.activation(userid);
		// 三.转发视图
		String target = "activationSuccess.jsp";
		request.getRequestDispatcher(target).forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
