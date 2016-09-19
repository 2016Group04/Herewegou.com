package com.dao.implMybatis;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.inter.Category3Dao;
import com.util.ConnOracleDataSource;
import com.vo.Category3;

public class Category3DaoImpl implements Category3Dao {
	
	//组合一个Connection对象
	Connection conn = null;
	
	public Category3DaoImpl(){
		conn = ConnOracleDataSource.getConnection();
	}

	@Override
	public void addCategory(Category3 category3) {
		String sql = "insert into category3 values(seq_category3.nextval,?,?,?,?)";
		PreparedStatement pstmt = null;
		//建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category3.getCname());
			pstmt.setString(2, category3.getCdesc());
			pstmt.setInt(3, category3.getGid());
			pstmt.setInt(4, category3.getFid());
			
			//执行并返回结果集
			int count = pstmt.executeUpdate();
			if(count>=1){
				System.out.println("添加商品成功");
			}else{
				System.out.println("没有添加任何商品");
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
	public void deleteCategory(Category3 category3) {
		String sql = "delete from category3 where cid = ?";
		PreparedStatement pstmt = null;
		//建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, category3.getCid());
			
			//执行并返回结果集
			int count = pstmt.executeUpdate();
			if(count>=1){
				System.out.println("删除商品成功");
			}else{
				System.out.println("没有删除任何商品");
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
	public void updateCategory(Category3 category3) {
		String sql = "update category3 set cname=? , cdesc=? , gid=? , fid=? where cid=?";
		PreparedStatement pstmt = null;
		//建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category3.getCname());
			pstmt.setString(2, category3.getCdesc());
			pstmt.setInt(3, category3.getGid());
			pstmt.setInt(4, category3.getFid());
			pstmt.setInt(5, category3.getCid());
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
	public Category3 getCategoryById(Integer cid) {
		
		String sql = "select * from category3 where cid="+cid;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Category3 category3 = new Category3();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while(rs.next()){
				category3.setCid(rs.getInt(1));
				category3.setCname(rs.getString(2));
				category3.setCdesc(rs.getString(3));
				category3.setGid(rs.getInt(4));
				category3.setFid(rs.getInt(5));
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
		
		
		return category3;
	}

	@Override
	public List<Category3> getCategoryByQuery(String sql) {
		
		Statement stmt = null;
		ResultSet rs = null;
		List<Category3> list = new ArrayList<Category3>();
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				Category3 category3 = new Category3();
				category3.setCid(rs.getInt(1));
				category3.setCname(rs.getString(2));
				category3.setCdesc(rs.getString(3));
				category3.setFname(rs.getString(4));
				list.add(category3);
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
