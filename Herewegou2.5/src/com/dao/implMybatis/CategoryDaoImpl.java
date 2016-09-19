package com.dao.implMybatis;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.dao.interMybatis.CategoryDao;
import com.po.Category;
import com.util.SessionFactoryUtil;

public class CategoryDaoImpl implements CategoryDao {
	
	private SqlSession session;
	
	public CategoryDaoImpl(){
		session = SessionFactoryUtil.getSqlSession();
	}

	@Override
	public int addCategory(Category category) {
		String statement = "com.po.categoryMapper.addCategory";
		int count = 0;
		try{
			count = session.insert(statement, category);
		}finally{
			if(session!=null){
				session.close();
			}			
		}
			return count;
	}

	@Override
	public int deleteCategory(Category category) {
		String statement = "com.po.categoryMapper.deleteCategory";
		int count = 0;
		try{
			count = session.delete(statement, category);
		}catch(PersistenceException e){
			count=-1;
			System.out.println("删除category失败");
			System.out.println(e);
		}finally{
			if(session!=null){
				session.close();
			}			
		}
			return count;
	}

	@Override
	public int updateCategory(Category category) {
		String statement = "com.po.categoryMapper.updateCategory";
		int count = 0;
		try{
			count = session.update(statement, category);
		}finally{
			if(session!=null){
				session.close();
			}			
		}
			return count;
	}

	@Override
	public Category getCategoryById(Integer cid) {
		Category category = null;
		String statement = "com.po.categoryMapper.getCategoryById";
		try{
			category = session.selectOne(statement, cid);
		}finally{
			if(session!=null){
				session.close();
			}
		}
		return category;
	}

	@Override
	public List<Category> getCategoryByQuery(String sql) {
		List<Category> list = null;
		String statement = "com.po.categoryMapper.getCategoryByQuery";
		try{
			list = session.selectList(statement, sql);
		}finally{
			if(session!=null){
				session.close();
			}			
		}
			return list;
	}
	
	
	
	@Override
	public int getAllRecordCount(String table) {
		String statement = "com.po.categoryMapper.getAllRecordCount";
		String sql = "select count(*) from "+ table;
		int count = 0;
		try{
			count = session.selectOne(statement, sql);
		}finally{
			if(session!=null){
				session.close();
			}			
		}
			return count;
	}
	

}
