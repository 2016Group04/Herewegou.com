package com.service.implMybatis;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.dao.impl.OrderFormDaoImpl;
import com.dao.inter.OrderFormDao;
import com.page.PageInfo;
import com.service.inter.OrderFormService;
import com.vo.ClientUser;
import com.vo.OrderForm;
import com.vo.Product;

public class OrderFormServiceImpl implements OrderFormService {

	private OrderFormDao dao = new OrderFormDaoImpl();

	@Override
	public void addOrder(OrderForm orderForm) {
		dao.addOrder(orderForm);
	}

	@Override
	public List<OrderForm> getAll() {

		String sql = "select * from orderform";

		List<OrderForm> list = dao.getOrderByQuery(sql);

		return list;
	}
	
	public List<OrderForm> getAll(PageInfo pageInfo) {

		String sql = "select * from (select c.*,rownum r from orderform c) where r>="+pageInfo.getBeginRownum()+" and r<="+pageInfo.getEndRownum();

		List<OrderForm> list = dao.getOrderByQuery(sql);

		return list;
	}
	
	public int getAllCount() {

		String sql = "select count(*) from orderform";

		int list = dao.getOrderCount(sql);

		return list;
	}
	
	
	public List<OrderForm> getAllByUserid(int userid) {

		String sql = "select * from orderform where userid="+userid+" order by orderdate desc";

		List<OrderForm> list = dao.getOrderByQuery(sql);

		return list;
	}
	
	public List<OrderForm> getAllPayByUserid(int userid) {

		String sql = "select * from orderform where userid="+userid+" and state='待付款' order by orderdate desc";

		List<OrderForm> list = dao.getOrderByQuery(sql);

		return list;
	}
	
	
	

	@Override
	public List<OrderForm> getAllByPage(PageInfo pageInfo) {

		String sql = "select * from "
				+ "(select c.*,rownum r  from orderform c) "
				+ "where r between " + pageInfo.getBeginRownum() + " and "
				+ pageInfo.getEndRownum();

		List<OrderForm> list = dao.getOrderByQuery(sql);

		return list;
	}



	public List<OrderForm> getOnorOffSaleByPge(PageInfo pageInfo, int flag) {
		String sql = "select * from "
				+ "(select p.pid, p.pname,p.price, p.productsum, p.dianpuname, c.cname, rownum r  from product p left outer join category2 c on (c.cid=p.cid) "
				+ "where p.onsale=" + flag + ") " + "where r between "
				+ pageInfo.getBeginRownum() + " and " + pageInfo.getEndRownum();

		List<OrderForm> list = dao.getOrderByQuery(sql);

		return list;
	}

	@Override
	public void deleteOrderById(int ofid) {

		OrderForm product = new OrderForm();
		product.setOfid(ofid);

		dao.deleteOrder(product);
	}
	
	
	
	
	

	@Override
	public OrderForm getOrderByPid(Integer pid) {
		OrderForm orderForm = dao.getOrderByOrderid(pid);
		return orderForm;
	}

	@Override
	public void updateOrder(OrderForm orderForm) {
		dao.updateOrder(orderForm);
	}
	
	public void updateOrderByOfid(String ofid,String address) {
		
		String sql = "update orderform set address='"+address+"' where ofid="+ofid;
		dao.updateOrderByOfid(sql);
	}
	
	

	

	
	
	

	
	
	
	
	public String sbAppend(Product product, PageInfo pageInfo) {

		// select * from (select p2.pid, p2.pname, p2.pdesc, c1.cname fname,
		// rownum r from product c2 left outer join category c1 on
		// (c2.fid=c1.cid))
		// where 1=1 and cname = '生活用品' or cdesc like '%生活用品%' or fname = '生活用品'
		// and r between 1 and 5

		StringBuilder sb = new StringBuilder(
				"select * from "
						+ "(select p.pid, p.pname,p.price, p.productsum, p.dianpuname, c.cname cname, rownum r  from product p left outer join category2 c on (c.cid=p.cid) "
						+ "where 1=1 ");
		// select * from (select p.pid, p.pname,p.price, p.productsum,
		// p.dianpuname, c.cname, rownum r from product p left outer join
		// category2 c on (c.cid=p.cid))
		// where 1=1 and pname like '%AJ%' or dianpuname like '%旗舰店%' or cname
		// like '%小说%' and r between 1 and 5
		String pname = product.getPname();
		String dianpuName = product.getDianpuName();

		String cname = product.getCname();

		if (pname != null && !pname.trim().equals("")) {
			sb.append(" and (pname like '%");
			sb.append(pname);
			sb.append("%'");
		}

		if (dianpuName != null && !dianpuName.trim().equals("")) {
			sb.append(" or dianpuname like '%");
			sb.append(dianpuName);
			sb.append("%'");
		}

		if (dianpuName != null && !dianpuName.trim().equals("")) {
			sb.append(" or cname like '%");
			sb.append(cname);
			sb.append("%'))");
		}

		sb.append(" where r between ");
		sb.append(pageInfo.getBeginRownum());
		sb.append(" and ");
		sb.append(pageInfo.getEndRownum());

		String sql = sb.toString();

		return sql;
	};
	
	public Map<OrderForm,Map<String,List<Product>>> getProductByOrderNumber(List<OrderForm> list){
		Map<OrderForm,Map<String,List<Product>>> map = new LinkedHashMap<OrderForm,Map<String,List<Product>>>();
		
		
		for(OrderForm orderForm:list){
			
			Map<String,List<Product>> map1 = new OrderDetailServiceImpl().getProductsByOrderNumber(orderForm.getOrderNumber());
			map.put(orderForm, map1);
		}
		return map;
	}
	
	

	public Map<Long,ClientUser> getUserByOrderNumber(List<OrderForm> list){
		Map<Long,ClientUser> map = new HashMap<Long,ClientUser>();
		
		for(OrderForm orderForm:list){
			
			ClientUser user = new ClientUserServiceImpl().getClientUserById(orderForm.getUserID());
			System.out.println(user.getRealName());
			map.put(orderForm.getOrderNumber(), user);
		}
		
		return map;
	}

	@Override
	public OrderForm getOrderByOrdernum(Long odernum) {
		
		String sql = "select * from orderform where ordernumber = " + odernum;
		
		List<OrderForm> list = dao.getOrderByQuery(sql);
		OrderForm of = list.get(0);
		return of;
	}

}
