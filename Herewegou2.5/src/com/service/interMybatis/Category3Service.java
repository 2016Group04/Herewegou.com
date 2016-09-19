
package com.service.interMybatis;

import java.util.List;

import com.page.PageInfo;
import com.vo.Category3;

public interface Category3Service {
	
	public void addCategory(Category3 category3);
	
	public List<Category3> getAll(); 
	
	public void deleteCategoryById(Integer cid);
	
	public Category3 getCategoryById(Integer cid);
	
	public void updateCategory(Category3 category3);
	
	//总共的记录数
	public int getAllRecordCount();
	
	//按分页显示商品
	public List<Category3> getAllByPage(PageInfo pageInfo);
	
	//根据过滤条件查询
	public List<Category3> getPageByQuery(Category3 category3,PageInfo pageInfo);
	
	//得到过滤后的记录数
	public int getQueryRecordCount(Category3 category3,PageInfo pageInfo);
	
}

