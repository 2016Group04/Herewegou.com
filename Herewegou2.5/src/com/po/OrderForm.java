package com.po;

public class OrderForm {

	 /*orderid   NUMBER(11) primary key,
	  orderdate VARCHAR2(40),
	  userID   NUMBER(10),
	  totalprice number(10,2),
	  state varchar2(10),
	  address varchar2(200),
	  odid number(20)--订单号？
	  
	  userName*/
	
	private int ofid;
	private String orderdate;
	private int userID;
	private double totalPrice;
	private String state;
	private String address;
	private long orderNumber;
	private String username;
	
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public int getOfid() {
		return ofid;
	}
	public void setOfid(int ofid) {
		this.ofid = ofid;
	}
	public long getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(long orderNumber) {
		this.orderNumber = orderNumber;
	}
	@Override
	public String toString() {
		return "OrderForm [ofid=" + ofid + ", orderdate=" + orderdate
				+ ", userID=" + userID + ", totalPrice=" + totalPrice
				+ ", state=" + state + ", address=" + address
				+ ", orderNumber=" + orderNumber + ", username=" + username
				+ "]";
	}
	
}
