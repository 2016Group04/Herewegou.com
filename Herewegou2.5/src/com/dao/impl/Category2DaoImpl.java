package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.inter.Category2Dao;
import com.util.ConnOracleDataSource;
import com.vo.Category2;

public class Category2DaoImpl implements Category2Dao {
	
	//组合一个Connection对象
	Connection conn = null;
	
	public Category2DaoImpl(){
		conn = ConnOracleDataSource.getConnection();
	}

	@Override
	public void addCategory(Category2 category2) {
		String sql = "insert into category2 values(seq_category2.nextval,?,?,?)";
		PreparedStatement pstmt = null;
		//建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category2.getCname());
			pstmt.setString(2, category2.getCdesc());
			pstmt.setInt(3, category2.getFid());
			
			//执行并返回结果集
			int count = pstmt.executeUpdate();
			if(count>=1){
				System.out.println("添加二级商品种类成功");
			}else{
				System.out.println("没有添加任何二级商品种类");
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
	public void deleteCategory(Category2 category2) {
		String sql = "delete from category2 where cid = ?";
		PreparedStatement pstmt = null;
		//建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, category2.getCid());
			
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
	public void updateCategory(Category2 category2) {
		String sql = "update category2 set cname=? , cdesc=? , fid=? where cid=?";
		PreparedStatement pstmt = null;
		//建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category2.getCname());
			pstmt.setString(2, category2.getCdesc());
			pstmt.setInt(3, category2.getFid());
			pstmt.setInt(4, category2.getCid());
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
	public Category2 getCategoryById(Integer cid) {
		
		String sql = "select * from category2 where cid="+cid;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Category2 category2 = new Category2();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while(rs.next()){
				category2.setCid(rs.getInt(1));
				category2.setCname(rs.getString(2));
				category2.setCdesc(rs.getString(3));
				category2.setFid(rs.getInt(4));
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
		
		
		return category2;
	}

	@Override
	public List<Category2> getCategoryByQuery(String sql) {
		
		Statement stmt = null;
		ResultSet rs = null;
		List<Category2> list = new ArrayList<Category2>();
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				Category2 category2 = new Category2();
				category2.setCid(rs.getInt(1));
				category2.setCname(rs.getString(2));
				category2.setCdesc(rs.getString(3));
				category2.setFname(rs.getString(4));
				list.add(category2);
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
