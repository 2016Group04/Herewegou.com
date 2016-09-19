package com.dao.interMybatis;

import java.util.List;

import com.po.Category;

public interface CategoryDao {
	
	public int addCategory(Category category);
	
	public int deleteCategory(Category category);
	
	public int updateCategory(Category category);
	
	public Category getCategoryById(Integer cid);
	
	public List<Category> getCategoryByQuery(String sql);
	
	public int getAllRecordCount(String table);

	
	

}
