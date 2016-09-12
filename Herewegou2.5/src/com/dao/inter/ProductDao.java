package com.dao.inter;

import java.util.List;

import com.page.PageInfo;
import com.vo.Product;

public interface ProductDao {
	
	public void addProduct(Product product);
	
	public void deleteProduct(Product product);
	
	public void updateProduct(Product product);
	
	public void putOnShelves(List<String> pidList);
	
	public void pullOffShelves(List<String> pidList);
	
	public Product getProductByPid(Integer pid);	
	
	public List<Product> getProductByQuery(String sql);
	
	public int getAllRecordCount(String table);
	
	public int getAllOffSaleProductCount();
	
	public int getAllOnSaleProductCount();
	
	public int getAllOnSaleProductByCid(Integer cid);
	
	public void updateProductImageNames(Product product);

	public List<Product> getProductsByCid(Integer cid);

	public List<Product> getProductsByPageByCid(PageInfo pageInfo, Integer cid);
	public List<Product> getProduct(String sql);

}
