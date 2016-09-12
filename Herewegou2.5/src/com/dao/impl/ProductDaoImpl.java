package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.inter.ProductDao;
import com.page.PageInfo;
import com.util.ConnOracleDataSource;
import com.vo.Product;

public class ProductDaoImpl implements ProductDao {

	// 组合一个Connection对象
	Connection conn = null;

	public ProductDaoImpl() {
		conn = ConnOracleDataSource.getConnection();
	}

	@Override
	public void addProduct(Product product) {
		String sql = "insert into product(pid,pname,price,productSum,dianpuName,pdesc,onsale,cid,color,version) values(seq_product.nextval,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		// 建立通道
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, product.getPname());
			pstmt.setFloat(2, product.getPrice());
			pstmt.setInt(3, product.getProductSum());
			pstmt.setString(4, product.getDianpuName());
			pstmt.setString(5, product.getPdesc());
			pstmt.setBoolean(6, product.getOnsale());
			pstmt.setInt(7, product.getCid());
			pstmt.setString(8, product.getColor());
			pstmt.setString(9, product.getVersion());
			// 执行并返回结果集
			int count = pstmt.executeUpdate();
			if (count >= 1) {
				System.out.println("添加商品成功");
			} else {
				System.out.println("没有添加任何商品");
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
	public void deleteProduct(Product product) {
		String sql = "delete from product where pid = ?";
		PreparedStatement pstmt = null;
		// 建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product.getPid());

			// 执行并返回结果集
			int count = pstmt.executeUpdate();
			if (count >= 1) {
				System.out.println("删除商品成功");
			} else {
				System.out.println("没有删除任何商品");
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
	public void updateProduct(Product product) {
		String sql = "update product set pname=?,price=?,productSum=?,dianpuName=?,pdesc=?,cid=? where pid=?";
		PreparedStatement pstmt = null;
		// 建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getPname());
			pstmt.setFloat(2, product.getPrice());
			pstmt.setInt(3, product.getProductSum());
			pstmt.setString(4, product.getDianpuName());
			pstmt.setString(5, product.getPdesc());
			pstmt.setInt(6, product.getCid());
			pstmt.setInt(7, product.getPid());
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
	
	@Override
	public void putOnShelves(List<String> pidList) {
		putOnorPullOffShelves(pidList, 1);
	}
	
	@Override
	public void pullOffShelves(List<String> pidList) {
		putOnorPullOffShelves(pidList, 0);
	}

	@Override
	public Product getProductByPid(Integer pid) {

		String sql = "select * from product where pid=" + pid;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Product product = new Product();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while (rs.next()) {
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

		return product;
	}

	
	@Override
	public List<Product> getProductByQuery(String sql) {

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
				product.setProductSum(rs.getInt(4));
				product.setDianpuName(rs.getString(5));
				product.setCname(rs.getString(6));
				
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
