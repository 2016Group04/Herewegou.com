package com.service.implMybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.dao.impl.OrderDetailDaoImpl;
import com.dao.inter.OrderDetailDao;
import com.service.inter.OrderDetailService;
import com.vo.OrderDetail;
import com.vo.Product;

public class OrderDetailServiceImpl implements OrderDetailService{

	OrderDetailDao dao = new OrderDetailDaoImpl();
	public void addOrderDetail(OrderDetail orderDetail){
		
		dao.addOrder(orderDetail);
	}
	
	public Map<String,List<Product>> getProductsByOrderNumber(Long orderNumber){
			
		Map<String,List<Product>> map = new HashMap<String,List<Product>>();
		
		String sql = "select * from orderdetail where orderid="+orderNumber;
		
		List<OrderDetail> list = dao.getProductByQuery(sql);
		
		Iterator<OrderDetail> i = list.iterator();
		
		while(i.hasNext()){
			OrderDetail orderDetail = i.next();
			
			Product product = new ProductServiceImpl().getProductByPid(orderDetail.getPid());
			product.setCountInShoppingCart(orderDetail.getPsum());
			//判断有没有这个商品，有则添加，没有就创建
			
			List<Product> list1 = map.get(product.getDianpuName());
			
			if(list1==null){
				
				//创建
				List<Product> list2 = new ArrayList<Product>();
				list2.add(product);
				map.put(product.getDianpuName(), list2);
			}else{
				
				//判断有没有该商品
				if(!hasProduct(list1,product)){
					product.setCountInShoppingCart(orderDetail.getPsum());
					list1.add(product);
					
				}else{
					
					for(Product product2:list1){
						if(product.equals(product2)){
							product2.setCountInShoppingCart(product2.getCountInShoppingCart()+product.getCountInShoppingCart());
						}
					}
				}
				
				map.put(product.getDianpuName(), list1);
			}
			
		}
		
		
		return map;
	}
	
	public boolean hasProduct(List<Product> list,Product product){
		 boolean flag = false;
		 
		 Iterator<Product> i = list.iterator();
		 while(i.hasNext()){
			 Product product1  = i.next();
			 
			 if(product.equals(product1)){
				 flag = true;
				 break;
			 }
		 }
		 
		 return flag;
	}
	
	public void deleteOrderDetail(int pid,long ordernumber){
		
		dao.deleteOrderByPid(pid,ordernumber);
	}
}
