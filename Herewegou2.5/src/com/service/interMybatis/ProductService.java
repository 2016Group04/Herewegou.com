
package com.service.interMybatis;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.page.PageInfo;
import com.vo.Product;

public interface ProductService {
	
	public void addProduct(Product product);
	
	public List<Product> getAll(); 
	
	public void deleteProductById(Integer pid);
	
	public Product getProductByPid(Integer pid);
	
	public List<Product> getProductsByCid(Integer cid);	
	
	
	public void updateProduct(Product product);
	
	public void putOnShelves(List<String> pidList);
	
	public void pullOffShelves(List<String> pidList);
	
	//总共的记录数
	public int getAllRecordCount();
	
	public int getAllRecordCountByCid(Integer cid);
	
	public int getAllOffSaleProductCount();
	
	public int getAllOnSaleProductCount();
	
	//按分页显示商品
	public List<Product> getAllByPage(PageInfo pageInfo);	
	
	//得到产品页分页列表
	public List<Product> getProductsPageByCid(PageInfo pageInfo, Integer cid);
	
	public List<Product> getAllOffSaleByPage(PageInfo pageInfo);
	
	public List<Product> getAllOnSaleByPage(PageInfo pageInfo);
	
	//根据过滤条件查询
	public List<Product> getPageWithCondition(Product product,PageInfo pageInfo);
	
	public List<Product> getOffSalePageWithCondition(Product product,PageInfo pageInfo);
	
	public List<Product> getOnSalePageWithCondition(Product product,PageInfo pageInfo);
	
	//得到过滤后的记录数
	public int getRecordCountWithCondition(Product product,PageInfo pageInfo);
	
	public int getOffSaleCountWithCondition(Product product,PageInfo pageInfo);
	
	public int getOnSaleCountWithCondition(Product product,PageInfo pageInfo);
	
	public void upload(HttpServletRequest request, String productListUploadPath);
	
	public void saveProductImgNamesForOneProduct(String pid,List<String>fileNameList);

	


	


}

