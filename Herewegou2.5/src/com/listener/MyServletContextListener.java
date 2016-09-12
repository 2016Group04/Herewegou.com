package com.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyServletContextListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("服务器启动了....");
		//获得application   (对应ServletContext对象)
		ServletContext servletContext = sce.getServletContext();
		String count = servletContext.getInitParameter("count");
		System.out.println("count="+count);
		servletContext.setAttribute("count", new Integer(count));
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		//DOM4J 或  SAX
		
	}

}
