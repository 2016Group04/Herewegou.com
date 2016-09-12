package com.page;

public class PageInfo {
	
	private int beginRownum;	
	private int endReownum;
	private int currentPage;	
	private int previousPage;
	private int nextPage;
	private int sumPerPage;
	private int allpageCount;
		
	private int allRecordCount;
	
	public PageInfo(){
		
	}

	public PageInfo(int currentPage, int sumPerPage){
		this.currentPage = currentPage;
		this.sumPerPage = sumPerPage;
		this.beginRownum = (currentPage-1)*sumPerPage + 1;
		this.endReownum = currentPage*sumPerPage;
		this.previousPage = (currentPage==1)?1:(currentPage -1);
		this.nextPage = (currentPage==this.getAllPageCount())?this.getAllPageCount():(currentPage + 1);
	}
	
	
	public int getBeginRownum() {			
		return beginRownum;
	}

	public void setBeginRownum(int begin) {
		this.beginRownum = begin;
	}

	public int getEndRownum() {
		
		return endReownum;
	}

	public void setEndRownum(int end) {
		this.endReownum = end;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPreviousPage() {
		
		return previousPage;
	}

	public void setPreviousPage(int previousPage) {
		this.previousPage = previousPage;
	}

	public int getNextPage() {
		
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getAllRecordCount() {
		return allRecordCount;
	}

	public void setAllRecordCount(int allRecordCount) {
		this.allRecordCount = allRecordCount;
		this.getAllPageCount();
	}

	public int getAllPageCount() {
		this.allpageCount = (this.allRecordCount%this.sumPerPage==0)?(this.allRecordCount/this.sumPerPage):(this.allRecordCount/this.sumPerPage+1);
		return allpageCount;
	}

	public void setAllpageCount(int allpageCount) {
		
		this.allpageCount = allpageCount;
	}

	public int getSumPerPage() {
		return sumPerPage;
	}

	public void setSumPerPage(int sumPerPage) {
		this.sumPerPage = sumPerPage;
	}

	@Override
	public String toString() {
		return "PageInfo [beginRownum=" + beginRownum + ", endReownum="
				+ endReownum + ", currentPage=" + currentPage
				+ ", previousPage=" + previousPage + ", nextPage=" + nextPage
				+ ", sumPerPage=" + sumPerPage + ", allpageCount="
				+ allpageCount + ", allRecordCount=" + allRecordCount + "]";
	}
	
	

}
