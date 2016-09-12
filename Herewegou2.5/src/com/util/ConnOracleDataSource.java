package com.util;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbcp.BasicDataSource;

public class ConnOracleDataSource {
	private static BasicDataSource ds = new BasicDataSource();
	private static String className = "oracle.jdbc.OracleDriver";
	private static String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	private static String username = "scott";
	private static String password = "Andrew123";
	
	static{
		ds.setDriverClassName(className);
		ds.setUrl(url);
		ds.setUsername(username);
		ds.setPassword(password);
		
		ds.setInitialSize(5);
		ds.setMaxActive(10);
		ds.setMinIdle(2);
	}
	
	public static Connection getConnection(){
		Connection conn = null;
		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			System.out.println("连接数据库失败");
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void main(String[] args) {
		System.out.println(ConnOracleDataSource.getConnection());
	}
}
