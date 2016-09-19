package com.dao.interMybatis;

import java.util.List;

import com.page.PageInfo;
import com.vo.OrderForm;
import com.vo.Product;

public interface OrderFormDao {
	
	public void addOrder(OrderForm orderForm);
	
	public void deleteOrder(OrderForm orderForm);
	
	public void updateOrder(OrderForm orderForm);
	
	public void updateOrderByOfid(String sql);
	
	public void putOnShelves(List<String> pidList);
	
	public void pullOffShelves(List<String> pidList);
	
	public OrderForm getOrderByOrderid(int orderid);	
	
	public List<OrderForm> getOrderByQuery(String sql);
	
	public int getAllRecordCount(String table);
	
	public int getAllOffSaleProductCount();
	
	public int getAllOnSaleProductCount();
	
	public int getAllOnSaleProductByCid(Integer cid);
	
	public void updateProductImageNames(Product product);

	public List<Product> getProductsByCid(Integer cid);

	public List<Product> getProductsByPageByCid(PageInfo pageInfo, Integer cid);
	public List<Product> getProduct(String sql);
	
	public int getOrderCount(String sql);

}
