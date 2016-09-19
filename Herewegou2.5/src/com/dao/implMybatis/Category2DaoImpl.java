package com.dao.implMybatis;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.dao.interMybatis.Category2Dao;
import com.po.Category2;
import com.util.SessionFactoryUtil;

public class Category2DaoImpl implements Category2Dao {
	
	private SqlSession session;
	
	public Category2DaoImpl(){
		session = SessionFactoryUtil.getSqlSession();
	}

	@Override
	public int addCategory(Category2 category2) {
		String statement = "com.po.category2Mapper.addCategory";
		int count = 0;
		try{
			count = session.insert(statement, category2);
		}finally{
			if(session!=null){
				session.close();
			}			
		}
			return count;
	}

	@Override
	public int deleteCategory(Category2 category2) {
		String statement = "com.po.category2Mapper.deleteCategory";
		int count = 0;
		try{
			count = session.delete(statement, category2);
		}catch(PersistenceException e){
			System.out.println("删除二级商品种类失败");
		}finally{
			if(session!=null){
				session.close();
			}			
		}
			return count;
	}

	@Override
	public int updateCategory(Category2 category2) {
		String statement = "com.po.category2Mapper.updateCategory";
		int count = 0;
		try{
			count = session.update(statement, category2);
		}finally{
			if(session!=null){
				session.close();
			}			
		}
			return count;
	}

	@Override
	public Category2 getCategoryById(Integer cid) {
		Category2 category2 = null;
		String statement = "com.po.category2Mapper.getCategoryById";
		try{
			category2 = session.selectOne(statement, cid);
		}finally{
			if(session!=null){
				session.close();
			}
		}
		return category2;
	}

	@Override
	public List<Category2> getCategoryByQuery(String sql) {
		List<Category2> list = null;
		String statement = "com.po.category2Mapper.getCategoryByQuery";
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
		String statement = "com.po.category2Mapper.getAllRecordCount";
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
