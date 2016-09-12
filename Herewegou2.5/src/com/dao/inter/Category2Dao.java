package com.dao.inter;

import java.util.List;

import com.vo.Category2;

public interface Category2Dao {
	
	public void addCategory(Category2 Category2);
	
	public void deleteCategory(Category2 Category2);
	
	public void updateCategory(Category2 Category2);
	
	public Category2 getCategoryById(Integer cid);
	
	public List<Category2> getCategoryByQuery(String sql);
	
	public int getAllRecordCount(String table);
	

}
