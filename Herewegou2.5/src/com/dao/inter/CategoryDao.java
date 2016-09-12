package com.dao.inter;

import java.util.List;

import com.vo.Category;
import com.vo.Category2;

public interface CategoryDao {
	
	public void addCategory(Category category);
	
	public void deleteCategory(Category category);
	
	public void updateCategory(Category category);
	
	public Category getCategoryById(Integer cid);
	
	public List<Category> getCategoryByQuery(String sql);
	
	public int getAllRecordCount(String table);

	
	

}
