package com.po;

public class OrderDetail {

	/*odid NUMBER(20) primary key, 
	  pid  number(10),
	  psum number(10),  
	  orderid   NUMBER(11),*/
	
	private long odid;
	private int pid;
	private int psum;
	private long orderid;
	public long getOdid() {
		return odid;
	}
	public void setOdid(long odid) {
		this.odid = odid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getPsum() {
		return psum;
	}
	public void setPsum(int psum) {
		this.psum = psum;
	}
	public long getOrderid() {
		return orderid;
	}
	public void setOrderid(long orderid) {
		this.orderid = orderid;
	}
	@Override
	public String toString() {
		return "OrderDetail [odid=" + odid + ", pid=" + pid + ", psum=" + psum
				+ ", orderid=" + orderid + "]";
	} 
	
	
}
