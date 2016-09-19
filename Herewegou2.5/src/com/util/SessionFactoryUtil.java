package com.util;

import java.io.InputStream;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SessionFactoryUtil {

	private static SqlSessionFactory factory;
	static{
		String resource = "conf.xml";
		InputStream is = SessionFactoryUtil.class.getClassLoader().getResourceAsStream(resource);
		factory = new SqlSessionFactoryBuilder().build(is);
		
	}
	public static SqlSessionFactory getFactory(){
		return factory;
	}
	
	public static SqlSession getSqlSession(){
		SqlSession session = null;
		session = factory.openSession(true);
		return session;
	}
	
	public static void main(String[] args) {
		System.out.println(SessionFactoryUtil.getSqlSession());
	}
}
