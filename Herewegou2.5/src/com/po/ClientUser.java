package com.po;

public class ClientUser {
	/*userid    number(10)  primary key,
    userAccount  varchar2(50)  unique,--账号  可以是邮箱、手机号
    password  varchar2(50),
    isActive  number(1) default 0,--1 已激活   0  未激活 
    nickname  varchar2(50), ---昵称
    realname  varchar2(50),--真实姓名  在订单中显示
    address    varchar2(200)*/
	//frozen	number(1) default 1
	
	private Integer userId;
	private String userAccount;
	private String password;
	private int isActive;
	private String nickname;
	private String realName;
	private String address;
	private int frozen;
	private long phoneNumber;
	private int sex;
	private int age;
	
	private String mail;
	
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickName) {
		this.nickname = nickName;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	public int getFrozen() {
		return frozen;
	}
	public void setFrozen(int frozen) {
		this.frozen = frozen;
	}
	
	public long getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "ClientUser [userId=" + userId + ", userAccount=" + userAccount
				+ ", password=" + password + ", isActive=" + isActive
				+ ", nickName=" + nickname + ", realName=" + realName
				+ ", address=" + address + ", frozen=" + frozen + "]";
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	
	
}
