package com.vo;

import java.io.Serializable;


public class Product implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//数据库      java
	//表                类
	//字段          属性
	private Integer pid; 
    
	private String pname;
    
    private Integer pingjiaSum;
    private String dianpuName;
    
	private String productListLargeImage;
    private String productListSmallImage1;
    private String productListSmallImage2;
    private String productListSmallImage3;
    private String pdesc;
    
    private String detailLargeImg;
    private String detailSmallImg1;
    private String detailSmallImg2;
    private String detailSmallImg3;
    private String detailSmallImg4;
    private String detailSmallImg5;

    private Boolean onsale; 
    private Integer cid;    
    private String shoppingCartImg;    
    private String cname;    
    
    private Float price;
    private Integer productSum;
    private String color;
    private String version;
    
    
    private int countInShoppingCart;
    
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	
	public Integer getPingjiaSum() {
		return pingjiaSum;
	}
	public void setPingjiaSum(Integer pingjiaSum) {
		this.pingjiaSum = pingjiaSum;
	}
	public String getDianpuName() {
		return dianpuName;
	}
	public void setDianpuName(String dianpuName) {
		this.dianpuName = dianpuName;
	}
	public String getProductListLargeImage() {
		return productListLargeImage;
	}
	public void setProductListLargeImage(String productListLargeImage) {
		this.productListLargeImage = productListLargeImage;
	}
	public String getProductListSmallImage1() {
		return productListSmallImage1;
	}
	public void setProductListSmallImage1(String productListSmallImage1) {
		this.productListSmallImage1 = productListSmallImage1;
	}
	public String getProductListSmallImage2() {
		return productListSmallImage2;
	}
	public void setProductListSmallImage2(String productListSmallImage2) {
		this.productListSmallImage2 = productListSmallImage2;
	}
	public String getProductListSmallImage3() {
		return productListSmallImage3;
	}
	public void setProductListSmallImage3(String productListSmallImage3) {
		this.productListSmallImage3 = productListSmallImage3;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	
	public String getDetailLargeImg() {
		return detailLargeImg;
	}
	public void setDetailLargeImg(String detailLargeImg) {
		this.detailLargeImg = detailLargeImg;
	}
	public String getDetailSmallImg1() {
		return detailSmallImg1;
	}
	public void setDetailSmallImg1(String detailSmallImg1) {
		this.detailSmallImg1 = detailSmallImg1;
	}
	public String getDetailSmallImg2() {
		return detailSmallImg2;
	}
	public void setDetailSmallImg2(String detailSmallImg2) {
		this.detailSmallImg2 = detailSmallImg2;
	}
	public String getDetailSmallImg3() {
		return detailSmallImg3;
	}
	public void setDetailSmallImg3(String detailSmallImg3) {
		this.detailSmallImg3 = detailSmallImg3;
	}
	public String getDetailSmallImg4() {
		return detailSmallImg4;
	}
	public void setDetailSmallImg4(String detailSmallImg4) {
		this.detailSmallImg4 = detailSmallImg4;
	}
	public String getDetailSmallImg5() {
		return detailSmallImg5;
	}
	public void setDetailSmallImg5(String detailSmallImg5) {
		this.detailSmallImg5 = detailSmallImg5;
	}
	public Boolean getOnsale() {
		return onsale;
	}
	public void setOnsale(Boolean onsale) {
		this.onsale = onsale;
	}
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
	public String getShoppingCartImg() {
		return shoppingCartImg;
	}
	public void setShoppingCartImg(String shoppingCartImg) {
		this.shoppingCartImg = shoppingCartImg;
	}
	

	public int getCountInShoppingCart() {
		return countInShoppingCart;
	}
	public void setCountInShoppingCart(int countInShoppingCart) {
		this.countInShoppingCart = countInShoppingCart;
	}
	
	
	
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public Integer getProductSum() {
		return productSum;
	}
	public void setProductSum(Integer productSum) {
		this.productSum = productSum;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pname=" + pname + ", price=" + price
				+ ", dianpuName=" + dianpuName + ", pdesc=" + pdesc
				+ ", onsale=" + onsale + ", cid=" + cid + ", cname=" + cname
				+ ", color=" + color + ", version=" + version + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((color == null) ? 0 : color.hashCode());
		result = prime * result
				+ ((dianpuName == null) ? 0 : dianpuName.hashCode());
		result = prime * result + ((pname == null) ? 0 : pname.hashCode());
		result = prime * result + ((price == null) ? 0 : price.hashCode());
		result = prime * result + ((version == null) ? 0 : version.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		boolean flag = false;
		if (this == obj){
			return flag;
			
		}else{
			
			if(obj.getClass()==Product.class){
				
				Product product = (Product)obj;
				if(product.getPname().equals(this.getPname())){
					System.out.println("pname");
					
					if(product.getPrice().equals(this.getPrice())){
						System.out.println("price");
						
						if(product.getDianpuName().equals(this.getDianpuName())){
							System.out.println("dianpuName");
							if(this.getColor().equals(product.getColor())){
								
								if(this.getVersion().equals(product.getVersion())){
									flag = true;
								}
								
							}
							
						}
					}
				}
			}
		}
		
			
			
		return flag;
		
	}

	
	
	
}