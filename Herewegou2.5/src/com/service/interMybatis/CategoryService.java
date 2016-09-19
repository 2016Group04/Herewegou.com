package com.service.interMybatis;

import java.util.List;

import com.page.PageInfo;
import com.po.Category;

public interface CategoryService {
	
	public int addCategory(Category category);
	
	public List<Category> getAll(); 
	
	public int deleteCategoryById(Integer cid);
	
	public Category getCategoryById(Integer cid);
	
	
	public int updateCategory(Category category);
	
	//总共的记录数
	public int getAllRecordCount();
	
	//按分页显示商品
	public List<Category> getAllByPage(PageInfo pageInfo);
	
	//根据过滤条件查询
	public List<Category> getPageByQuery(Category category,PageInfo pageInfo);
	
	//得到过滤后的记录数
	public int getQueryRecordCount(Category category,PageInfo pageInfo);
	
}