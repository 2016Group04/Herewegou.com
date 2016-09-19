package com.dao.implMybatis;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.inter.OrderFormDao;
import com.page.PageInfo;
import com.util.ConnOracleDataSource;
import com.vo.OrderForm;
import com.vo.Product;

public class OrderFormDaoImpl implements OrderFormDao {

	// 组合一个Connection对象
	Connection conn = null;

	public OrderFormDaoImpl() {
		conn = ConnOracleDataSource.getConnection();
	}

	@Override
	public void addOrder(OrderForm orderForm){
		/* orderid   NUMBER(11) primary key,
		  orderdate VARCHAR2(40),
		  userID   NUMBER(10),
		  totalprice number(10,2),
		  state varchar2(10),
		  address varchar2(200),
		  odid number(20)--订单号？*/
		System.out.println("*****************************************");
		System.out.println(orderForm);
		String sql = "insert into orderform(ofid,orderdate,userID,totalprice,state,address,ordernumber) values(seq_orderform.nextval,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		// 建立通道
		try {
			pstmt = conn.prepareStatement(sql);

			
			pstmt.setString(1, orderForm.getOrderdate());
			pstmt.setInt(2, orderForm.getUserID());
			pstmt.setDouble(3, orderForm.getTotalPrice());
			pstmt.setString(4,orderForm.getState());
			pstmt.setString(5, orderForm.getAddress());
			pstmt.setLong(6, orderForm.getOrderNumber());
			// 执行并返回结果集
			int count = pstmt.executeUpdate();
			if (count >= 1) {
				System.out.println("添加订单成功");
			} else {
				System.out.println("没有添加任何订单");
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("pstmt通道关闭失败");
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("数据库连接关闭失败");
					e.printStackTrace();
				}
			}
		}

	}
	
	public int getOrderCount(String sql){
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			
			
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery(sql);
			while (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("pstmt通道关闭失败");
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("数据库连接关闭失败");
					e.printStackTrace();
				}
			}
		}
		
		return count;
	}

	@Override
	public void deleteOrder(OrderForm orderForm) {
		String sql = "delete from orderform where ofid = ?";
		PreparedStatement pstmt = null;
		// 建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderForm.getOfid());

			// 执行并返回结果集
			int count = pstmt.executeUpdate();
			if (count >= 1) {
				System.out.println("删除订单成功");
			} else {
				System.out.println("没有删除任何订单");
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("pstmt通道关闭失败");
					e.printStackTrace();
				}
			}
			if (conn != null) {
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
	public void updateOrder(OrderForm orderForm) {
		String sql = "update orderform set totalprice=?,state=?,address=? where orderid=?";
		PreparedStatement pstmt = null;
		// 建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1, orderForm.getTotalPrice());
			pstmt.setString(2,orderForm.getState());
			pstmt.setString(3, orderForm.getAddress());
			
			// 执行并返回结果集
			int count = pstmt.executeUpdate();
			if (count >= 1) {
				System.out.println("修改商品成功");
			} else {
				System.out.println("没有修改任何商品");
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("pstmt通道关闭失败");
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("数据库连接关闭失败");
					e.printStackTrace();
				}
			}
		}
	}

	
	public void updateOrderByOfid(String sql) {
		
		PreparedStatement pstmt = null;
		// 建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			// 执行并返回结果集
			int count = pstmt.executeUpdate();
			if (count >= 1) {
				System.out.println("修改订单成功");
			} else {
				System.out.println("没有修改任何订单");
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("pstmt通道关闭失败");
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("数据库连接关闭失败");
					e.printStackTrace();
				}
			}
		}
	}

	public void putOnorPullOffShelves(List<String> pidList, int flag) {
		String pids = "";
		// "or pid=7 or pid=8 or pid=9"
		for(String s:pidList){
			pids = pids + "or pid=" + s;
		}
		
		String sql = "update product set onsale="
				+ flag
				+ " where 1=0 " + pids;
		PreparedStatement pstmt = null;
		// 建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 执行并返回结果集
			int count = pstmt.executeUpdate();
			if (count >= 1) {
				System.out.println("修改商品成功");
			} else {
				System.out.println("没有修改任何商品");
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("pstmt通道关闭失败");
					e.printStackTrace();
				}
			}
			if (conn != null) {
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
	public void putOnShelves(List<String> pidList) {
		putOnorPullOffShelves(pidList, 1);
	}
	
	@Override
	public void pullOffShelves(List<String> pidList) {
		putOnorPullOffShelves(pidList, 0);
	}

	
	@Override
	public OrderForm getOrderByOrderid(int orderid) {

		String sql = "select * from orderform where ofid=" + orderid;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrderForm orderForm = new OrderForm();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while (rs.next()) {
				
				/* orderid   NUMBER(11) primary key,
				  orderdate VARCHAR2(40),
				  userID   NUMBER(10),
				  totalprice number(10,2),
				  state varchar2(10),
				  address varchar2(200),
				  odid number(20)--订单号？
								*/
				orderForm.setOfid(rs.getInt(1));
				orderForm.setOrderdate(rs.getString(2));
				orderForm.setUserID(rs.getInt(3));
				orderForm.setTotalPrice(rs.getDouble(4));
				orderForm.setState(rs.getString(5));
				orderForm.setAddress(rs.getString(6));
				orderForm.setOrderNumber(rs.getLong(7));
				
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println("关闭结果集失败");
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("pstmt通道关闭失败");
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("数据库连接关闭失败");
					e.printStackTrace();
				}
			}
		}

		return orderForm;
	}

	@Override
	public List<OrderForm> getOrderByQuery(String sql) {

		Statement stmt = null;
		ResultSet rs = null;
		List<OrderForm> list = new ArrayList<OrderForm>();

		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				OrderForm orderForm = new OrderForm();
				orderForm.setOfid(rs.getInt(1));
				orderForm.setOrderdate(rs.getString(2));
				orderForm.setUserID(rs.getInt(3));
				orderForm.setTotalPrice(rs.getDouble(4));
				orderForm.setState(rs.getString(5));
				orderForm.setAddress(rs.getString(6));
				orderForm.setOrderNumber(rs.getLong(7));
				
				list.add(orderForm);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println("关闭结果集失败");
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					System.out.println("pstmt通道关闭失败");
					e.printStackTrace();
				}
			}
			if (conn != null) {
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

		String sql = "select count(*) as allRecordCount from " + table;

		int allRecordCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery(sql);
			while (rs.next()) {
				allRecordCount = rs.getInt(1);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println("关闭结果集失败");
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("pstmt通道关闭失败");
					e.printStackTrace();
				}
			}
			if (conn != null) {
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
	public int getAllOnSaleProductCount() {
		return getOnorOffSaleProductCount(1);
	}
	
	@Override
	public int getAllOnSaleProductByCid(Integer cid) {
		String sql = "select count(*) as allRecordCount from product where onsale=1 and cid = "+cid;

		int allRecordCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery(sql);
			while (rs.next()) {
				allRecordCount = rs.getInt(1);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println("关闭结果集失败");
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("pstmt通道关闭失败");
					e.printStackTrace();
				}
			}
			if (conn != null) {
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
	public int getAllOffSaleProductCount() {
		return getOnorOffSaleProductCount(0);
	}
	
	public int getOnorOffSaleProductCount(int flag){
		String sql = "select count(*) as allRecordCount from product where onsale = "+flag;

		int allRecordCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery(sql);
			while (rs.next()) {
				allRecordCount = rs.getInt(1);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println("关闭结果集失败");
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("pstmt通道关闭失败");
					e.printStackTrace();
				}
			}
			if (conn != null) {
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
	public void updateProductImageNames(Product product) {
		String sql = "update product set productListLargeImage=?, productListSmallImage1=? , productListSmallImage2=? , productListSmallImage3=?, detailLargeImg=?,detailSmallImg1=?,detailSmallImg2=?,detailSmallImg3=?,detailSmallImg4=?,detailSmallImg5=?,shoppingCartImg=? where pid=?";
		PreparedStatement pstmt = null;
		System.out.println("in updateProductImageNames pid:"+product.getPid());
		// 建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getProductListLargeImage());
			pstmt.setString(2, product.getProductListSmallImage1());
			pstmt.setString(3, product.getProductListSmallImage2());
			pstmt.setString(4, product.getProductListSmallImage3());
			pstmt.setString(5, product.getDetailLargeImg());
			pstmt.setString(6, product.getDetailSmallImg1());
			pstmt.setString(7, product.getDetailSmallImg2());
			pstmt.setString(8, product.getDetailSmallImg3());
			pstmt.setString(9, product.getDetailSmallImg4());
			pstmt.setString(10, product.getDetailSmallImg5());
			pstmt.setString(11, product.getShoppingCartImg());
			pstmt.setInt(12, product.getPid());
			// 执行并返回结果集
			int count = pstmt.executeUpdate();
			if (count >= 1) {
				System.out.println("修改商品图片成功");
			} else {
				System.out.println("没有修改任何商品图片");
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("pstmt通道关闭失败");
					e.printStackTrace();
				}
			}
			if (conn != null) {
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
	public List<Product> getProductsByCid(Integer cid) {
		
		String sql = "select * from product where onsale=1 and cid ="+cid;
		
		return this.getProduct(sql);
		

		
	
	}
	
	@Override
	public List<Product> getProductsByPageByCid(PageInfo pageInfo, Integer cid) {
		
	
		/*	
		select * from
		(select p.*, rownum r from product p where p.cid=62)
		where r between 1 and 15
		 */

		StringBuilder sb = new StringBuilder("select * from "
				+ "(select p.*, rownum r from product p where p.onsale=1 and p.cid= "+ cid +")");
				
		  
		sb.append(" where r between ");
		sb.append(pageInfo.getBeginRownum());
		sb.append(" and ");
		sb.append(pageInfo.getEndRownum());

		String sql = sb.toString();
		
		System.out.println(sql);
		
		return this.getProduct(sql);
	}
	

	
	public List<Product> getProduct(String sql){
		Statement stmt = null;
		ResultSet rs = null;
		List<Product> list = new ArrayList<Product>();

		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Product product = new Product();
				product.setPid(rs.getInt(1));
				product.setPname(rs.getString(2));
				product.setPrice(rs.getFloat(3));
				product.setPingjiaSum(rs.getInt(4));				
				product.setDianpuName(rs.getString(5));
				product.setProductListLargeImage(rs.getString(6));
				product.setProductListSmallImage1(rs.getString(7));
				product.setProductListSmallImage2(rs.getString(8));
				product.setProductListSmallImage3(rs.getString(9));
				product.setPdesc(rs.getString(10));
				product.setProductSum(rs.getInt(11));
				product.setDetailLargeImg(rs.getString(12));
				product.setDetailSmallImg1(rs.getString(13));
				product.setDetailSmallImg2(rs.getString(14));
				product.setDetailSmallImg3(rs.getString(15));
				product.setDetailSmallImg4(rs.getString(16));
				product.setDetailSmallImg5(rs.getString(17));
				product.setOnsale(rs.getBoolean(18));
				product.setCid(rs.getInt(19));
				product.setShoppingCartImg(rs.getString(20));			
				product.setColor(rs.getString(21));
				product.setVersion(rs.getString(22));
				list.add(product);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println("关闭结果集失败");
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					System.out.println("pstmt通道关闭失败");
					e.printStackTrace();
				}
			}
			if (conn != null) {
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

	}
