package com.dao.inter;

import java.util.List;

import com.page.PageInfo;
import com.vo.OrderDetail;
import com.vo.OrderForm;
import com.vo.Product;

public interface OrderDetailDao {
	
	public void addOrder(OrderDetail orderDetail);
	
	public void deleteOrder(OrderDetail orderDetail);
	
	public void deleteOrderByPid(int pid,long ordernumber);
	
	public void updateOrder(OrderDetail orderDetail);
	
	
	public OrderDetail getOrderByOdid(int odid);	
	
	public List<OrderDetail> getProductByQuery(String sql);
	
	public int getAllRecordCount(String table);
	
	public int getAllOffSaleProductCount();
	
	public int getAllOnSaleProductCount();
	
	public int getAllOnSaleProductByCid(Integer cid);
	
	public void updateProductImageNames(Product product);

	public List<Product> getProductsByCid(Integer cid);

	public List<Product> getProductsByPageByCid(PageInfo pageInfo, Integer cid);
	public List<Product> getProduct(String sql);

}
