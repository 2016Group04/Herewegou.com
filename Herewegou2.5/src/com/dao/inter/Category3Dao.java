package com.dao.inter;

import java.util.List;

import com.vo.Category3;

public interface Category3Dao {
	
	public void addCategory(Category3 category3);
	
	public void deleteCategory(Category3 category3);
	
	public void updateCategory(Category3 category3);
	
	public Category3 getCategoryById(Integer cid);
	
	public List<Category3> getCategoryByQuery(String sql);
	
	public int getAllRecordCount(String table);
	

}
