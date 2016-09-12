
package com.service.inter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.page.PageInfo;
import com.vo.OrderForm;
import com.vo.Product;

public interface OrderFormService {
	
	public void addOrder(OrderForm orderForm);
	
	public List<OrderForm> getAll(); 
	
	public void deleteOrderById(int ofid);
	
	public OrderForm getOrderByPid(Integer pid);
		
	public void updateOrder(OrderForm orderForm);
			
	//总共的记录数
	
	
	//按分页显示商品
	public List<OrderForm> getAllByPage(PageInfo pageInfo);	
	
	public OrderForm getOrderByOrdernum(Long odernum);


}

