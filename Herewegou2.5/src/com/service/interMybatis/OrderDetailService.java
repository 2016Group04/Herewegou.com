package com.service.interMybatis;

import java.util.List;
import java.util.Map;

import com.vo.OrderDetail;
import com.vo.Product;

public interface OrderDetailService {

	public void addOrderDetail(OrderDetail orderDetail);
	public Map<String,List<Product>> getProductsByOrderNumber(Long orderNumber); 
}
