package com.dao.implMybatis;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.inter.ClientUserDao;
import com.util.ConnOracleDataSource;
import com.vo.ClientUser;

public class ClientUserDaoImpl implements ClientUserDao {
	
	//组合一个Connection对象
	Connection conn = null;
	
	public ClientUserDaoImpl(){
		conn = ConnOracleDataSource.getConnection();
	}

	@Override
	public boolean addClientUser(ClientUser clientUser) {
		boolean registerSuccess = false;
		String sql = "INSERT INTO clientUser(userid,userAccount,PASSWORD,isActive,mail,phoneNum,Nickname) VALUES(seq_clientUser.Nextval,?,?,0,?,?,'HWG_'||seq_clientUser.Nextval)"; 
		PreparedStatement pstmt = null;
		//建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, clientUser.getUserAccount());
			pstmt.setString(2, clientUser.getPassword());
            pstmt.setString(3, clientUser.getMail());
			pstmt.setLong(4, clientUser.getPhoneNumber());
			
			//执行并返回结果集
			int count = pstmt.executeUpdate();
			if(count>=1){
				System.out.println("用户注册成功");
				registerSuccess = true;
			}else{
				System.out.println("用户注册失败");
				registerSuccess = false;
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
		return registerSuccess;
	}

	@Override
	public void deleteClientUser(ClientUser clientUser) {
		String sql = "delete from clientUser where userId = ?";
		PreparedStatement pstmt = null;
		//建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, clientUser.getUserId());
			
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
	public void updateClientUser(ClientUser clientUser) {
		String sql = "update clientUser set userAccount=? , password=?,address=?,phonenum=? where userId=?";
		PreparedStatement pstmt = null;
		//建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, clientUser.getUserAccount());
			pstmt.setString(2, clientUser.getPassword());
			pstmt.setString(3, clientUser.getAddress());
			pstmt.setLong(4, clientUser.getPhoneNumber());
			pstmt.setInt(5, clientUser.getUserId());
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
	
	public void updateClientUserBySql(String sql) {
		
		PreparedStatement pstmt = null;
		//建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			
			//执行并返回结果集
			int count = pstmt.executeUpdate();
			if(count>=1){
				System.out.println("冻结商品种类成功");
			}else{
				System.out.println("没有冻结任何商品种类");
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
	public ClientUser getClientUserById(Integer userId) {
		
		String sql = "select * from clientUser where userId="+userId;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ClientUser clientUser = new ClientUser();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while(rs.next()){
				clientUser.setUserId(rs.getInt(1));
				clientUser.setUserAccount(rs.getString(2));
				clientUser.setPassword(rs.getString(3));
			clientUser.setNickname(rs.getString(5));
				clientUser.setRealName(rs.getString(6));
				clientUser.setAddress(rs.getString(7));
				clientUser.setPhoneNumber(rs.getLong(9));
				clientUser.setSex(rs.getInt(10));
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
		
		
		return clientUser;
	}
  
  	
public ClientUser getClientUserByUser(String user) {
		
		String sql = "select * from clientUser where useraccount='"+user+"'";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ClientUser clientUser = new ClientUser();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while(rs.next()){
				clientUser.setUserId(rs.getInt(1));
				clientUser.setUserAccount(rs.getString(2));
				clientUser.setPassword(rs.getString(3));
				clientUser.setNickname(rs.getString(5));
				clientUser.setRealName(rs.getString(6));
				clientUser.setSex(rs.getInt(10));
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
		
		
		return clientUser;
	}


	@Override
	public List<ClientUser> getClientUserByQuery(String sql) {
		
		Statement stmt = null;
		ResultSet rs = null;
		List<ClientUser> list = new ArrayList<ClientUser>();
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				ClientUser clientUser = new ClientUser();
				clientUser.setUserId(rs.getInt(1));
				clientUser.setUserAccount(rs.getString(2));
				clientUser.setPassword(rs.getString(3));
				clientUser.setIsActive(rs.getInt(4));
				clientUser.setNickname(rs.getString(5));
				clientUser.setRealName(rs.getString(6));
				clientUser.setAddress(rs.getString(7));
				clientUser.setFrozen(rs.getInt(8));
				clientUser.setPhoneNumber(rs.getLong(9));
				clientUser.setSex(rs.getInt(10));
				clientUser.setAge(rs.getInt(11));
				list.add(clientUser);
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
	public int getAllUserCount(String table) {
		
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
  
  @Override
	public ClientUser getClientUserByUserAccount(String userAccount) {
		String sql = "select * from clientUser where userAccount='"+userAccount+"'";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ClientUser clientUser = new ClientUser();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while(rs.next()){
				clientUser.setUserId(rs.getInt(1));
				clientUser.setUserAccount(rs.getString(2));
				clientUser.setPassword(rs.getString(3));
				clientUser.setNickname(rs.getString(5));
				clientUser.setPhoneNumber(rs.getLong(9));
				clientUser.setMail(rs.getString(11));
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
		return clientUser;
	}
	
		public int getFrozenUserCount(String sql) {
		
		
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

		@Override
		public void activationById(String userid) {
			ClientUser clientUser = new ClientUser();
			String sql = "update clientUser set isactive=1 where userId=?";
			PreparedStatement pstmt = null;
			//建立通道
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(userid));
				//执行并返回结果集
				int count = pstmt.executeUpdate();
				if(count>=1){
					System.out.println("用户激活成功");
				}else{
					System.out.println("用户激活失败");
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

	
	public static void main(String[] args) {
		
	}


}
