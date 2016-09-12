package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.inter.CategoryDao;
import com.util.ConnOracleDataSource;
import com.vo.Category;

public class CategoryDaoImpl implements CategoryDao {
	
	//组合一个Connection对象
	Connection conn = null;
	
	public CategoryDaoImpl(){
		conn = ConnOracleDataSource.getConnection();
	}

	@Override
	public void addCategory(Category category) {
		String sql = "insert into category values(seq_category.nextval,?,?)";
		PreparedStatement pstmt = null;
		//建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category.getCname());
			pstmt.setString(2, category.getCdesc());
			
			//执行并返回结果集
			int count = pstmt.executeUpdate();
			if(count>=1){
				System.out.println("添加商品种类成功");
			}else{
				System.out.println("没有添加任何商品种类");
			}
			
		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("pstmt通道关闭失败");
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("数据库连接关闭失败");
					e.printStackTrace();
				}
			}
		}
		
	}

	@Override
	public void deleteCategory(Category category) {
		String sql = "delete from category where cid = ?";
		PreparedStatement pstmt = null;
		//建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, category.getCid());
			
			//执行并返回结果集
			int count = pstmt.executeUpdate();
			if(count>=1){
				System.out.println("删除商品种类成功");
			}else{
				System.out.println("没有删除任何商品种类");
			}
			
		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("pstmt通道关闭失败");
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("数据库连接关闭失败");
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void updateCategory(Category category) {
		String sql = "update category set cname=? , cdesc=? where cid=?";
		PreparedStatement pstmt = null;
		//建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category.getCname());
			pstmt.setString(2, category.getCdesc());
			pstmt.setInt(3, category.getCid());
			//执行并返回结果集
			int count = pstmt.executeUpdate();
			if(count>=1){
				System.out.println("修改商品种类成功");
			}else{
				System.out.println("没有修改任何商品种类");
			}
			
		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("pstmt通道关闭失败");
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("数据库连接关闭失败");
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public Category getCategoryById(Integer cid) {
		
		String sql = "select * from category where cid="+cid;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Category category = new Category();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while(rs.next()){
				category.setCid(rs.getInt(1));
				category.setCname(rs.getString(2));
				category.setCdesc(rs.getString(3));
			}
			
		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		}finally{
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println("关闭结果集失败");
					e.printStackTrace();
				}
			}
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("pstmt通道关闭失败");
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("数据库连接关闭失败");
					e.printStackTrace();
				}
			}
		}	
		
		
		return category;
	}

	@Override
	public List<Category> getCategoryByQuery(String sql) {
		
		Statement stmt = null;
		ResultSet rs = null;
		List<Category> list = new ArrayList<Category>();
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				Category category = new Category();
				category.setCid(rs.getInt(1));
				category.setCname(rs.getString(2));
				category.setCdesc(rs.getString(3));
				list.add(category);
			}
			
		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		}finally{
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println("关闭结果集失败");
					e.printStackTrace();
				}
			}
			if(stmt!=null){
				try {
					stmt.close();
				} catch (SQLException e) {
					System.out.println("pstmt通道关闭失败");
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("数据库连接关闭失败");
					e.printStackTrace();
				}
			}
		}
		
		
		
		return list;
	}
	
	
	
	@Override
	public int getAllRecordCount(String table) {
		
		String sql = "select count(*) as allRecordCount from "+table;
		
		int allRecordCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
			while(rs.next()){
				allRecordCount = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		}finally{
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println("关闭结果集失败");
					e.printStackTrace();
				}
			}
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("pstmt通道关闭失败");
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("数据库连接关闭失败");
					e.printStackTrace();
				}
			}
		}
		
		
		
		return allRecordCount;
	}
	
	
	public static void main(String[] args) {
		
	}


}
