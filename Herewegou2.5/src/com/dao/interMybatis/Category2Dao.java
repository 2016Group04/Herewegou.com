package com.dao.interMybatis;

import java.util.List;

import com.po.Category2;

public interface Category2Dao {
	
	public int addCategory(Category2 Category2);
	
	public int deleteCategory(Category2 Category2);
	
	public int updateCategory(Category2 Category2);
	
	public Category2 getCategoryById(Integer cid);
	
	public List<Category2> getCategoryByQuery(String sql);
	
	public int getAllRecordCount(String table);
	

}
