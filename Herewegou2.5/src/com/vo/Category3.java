package com.vo;

public class Category3 {
	
	//数据库      java
	//表                类
	//字段          属性
	private Integer cid; 
    private String cname;
    private String cdesc;
    
    private Integer gid; 
    private Integer fid; 
    
    
    private String fname;
    
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCdesc() {
		return cdesc;
	}
	public void setCdesc(String cdesc) {
		this.cdesc = cdesc;
	}
	
	public Integer getFid() {
		return fid;
	}
	public void setFid(Integer fid) {
		this.fid = fid;
	}
	
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public Integer getGid() {
		return gid;
	}
	public void setGid(Integer gid) {
		this.gid = gid;
	}
	@Override
	public String toString() {
		return "Category3 [cid=" + cid + ", cname=" + cname + ", cdesc="
				+ cdesc + ", gid=" + gid + ", fid=" + fid + ", fname=" + fname
				+ "]";
	}
	
	



    
    

}
