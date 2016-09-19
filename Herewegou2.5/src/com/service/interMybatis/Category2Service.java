
package com.service.interMybatis;

import java.util.List;

import com.page.PageInfo;
import com.po.Category2;

public interface Category2Service {
	
	public int addCategory(Category2 category2);
	
	public List<Category2> getAll(); 
	
	public int deleteCategoryById(Integer cid);
	
	public Category2 getCategoryById(Integer cid);
	
	public List<Category2> getCategoriesByFid(Integer fid);
	
	public int updateCategory(Category2 category2);
	
	//总共的记录数
	public int getAllRecordCount();
	
	//按分页显示商品
	public List<Category2> getAllByPage(PageInfo pageInfo);
	
	//根据过滤条件查询
	public List<Category2> getPageByQuery(Category2 category2,PageInfo pageInfo);
	
	//得到过滤后的记录数
	public int getQueryRecordCount(Category2 category2,PageInfo pageInfo);
	
}

