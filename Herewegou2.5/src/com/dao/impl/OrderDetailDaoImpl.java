package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.inter.OrderDetailDao;
import com.page.PageInfo;
import com.util.ConnOracleDataSource;
import com.vo.OrderDetail;
import com.vo.OrderForm;
import com.vo.Product;

public class OrderDetailDaoImpl implements OrderDetailDao {

	// 组合一个Connection对象
	Connection conn = null;

	public OrderDetailDaoImpl() {
		conn = ConnOracleDataSource.getConnection();
	}
	

	@Override
	public void addOrder(OrderDetail orderDetail){
		/*  odid NUMBER(20) primary key, 
  pid  number(10),
  psum number(10),  
  orderid   NUMBER(11),*/
		String sql = "insert into orderdetail(odid,pid,psum,orderid) values(seq_orderdetail.nextval,?,?,?)";
		PreparedStatement pstmt = null;
		// 建立通道
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, orderDetail.getPid());
			pstmt.setInt(2, orderDetail.getPsum());
			pstmt.setLong(3, orderDetail.getOrderid());
			
			
			// 执行并返回结果集
			int count = pstmt.executeUpdate();
			if (count >= 1) {
				System.out.println("添加订单详情成功");
			} else {
				System.out.println("没有添加任何订单详情");
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
	public void deleteOrder(OrderDetail orderDetail) {
		String sql = "delete from orderdetail where odid = ?";
		PreparedStatement pstmt = null;
		// 建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, orderDetail.getOdid());

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
	
	public void deleteOrderByPid(int pid,long ordernumber) {
		String sql = "delete from orderdetail where pid = "+pid+" and orderid="+ordernumber;
		PreparedStatement pstmt = null;
		// 建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			

			// 执行并返回结果集
			int count = pstmt.executeUpdate();
			if (count >= 1) {
				System.out.println("删除订单详情成功");
			} else {
				System.out.println("没有删除任何订单详情");
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
	public void updateOrder(OrderDetail orderDetail) {
		String sql = "update orderdetail set pid=?,psum=?,orderid=? where orderid=?";
		PreparedStatement pstmt = null;
		// 建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderDetail.getPid());
			pstmt.setInt(2,orderDetail.getPsum());
			pstmt.setLong(3, orderDetail.getOrderid());
			
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
	
	

	
	
	public OrderDetail getOrderByOdid(int orderNumber) {

		String sql = "select * from orderdetail where orderid=" + orderNumber;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrderDetail orderDetail = new OrderDetail();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while (rs.next()) {
				
				/* odid NUMBER(20) primary key, 
  pid  number(10),
  psum number(10),  
  orderid   NUMBER(20),*/
				orderDetail.setOdid(rs.getLong(1));
				orderDetail.setPid(rs.getInt(2));
				orderDetail.setPsum(rs.getInt(3));
				orderDetail.setOrderid(rs.getLong(4));
				
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

		return orderDetail;
	}

	@Override
	public List<OrderDetail> getProductByQuery(String sql) {

		Statement stmt = null;
		ResultSet rs = null;
		List<OrderDetail> list = new ArrayList<OrderDetail>();

		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setOdid(rs.getLong(1));
				orderDetail.setPid(rs.getInt(2));
				orderDetail.setPsum(rs.getInt(3));
				orderDetail.setOrderid(rs.getLong(4));
				
				list.add(orderDetail);
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
