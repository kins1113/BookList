package com.book.bookList.homeListDTO;

import java.util.Date;

public class HomeListDTO {
	
	private int hNo ;
	private String hName ;
	private int hPrice;
	private Date hGetDate;
	private String maker;
	private String delCk;
	private int kateNo ;
	
	public HomeListDTO() {
		super();
	}
	public int gethNo() {
		return hNo;
	}
	public void sethNo(int hNo) {
		this.hNo = hNo;
	}
	public String gethName() {
		return hName;
	}
	public void sethName(String hName) {
		this.hName = hName;
	}
	public int gethPrice() {
		return hPrice;
	}
	public void sethPrice(int hPrice) {
		this.hPrice = hPrice;
	}
	public Date gethGetDate() {
		return hGetDate;
	}
	public void sethGetDate(Date hGetDate) {
		this.hGetDate = hGetDate;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public String getDelCk() {
		return delCk;
	}
	public void setDelCk(String delCk) {
		this.delCk = delCk;
	}
	public int getKateNo() {
		return kateNo;
	}
	public void setKateNo(int kateNo) {
		this.kateNo = kateNo;
	}
	@Override
	public String toString() {
		return "HomeListDTO [hNo=" + hNo + ", hName=" + hName + ", hPrice=" + hPrice + ", hGetDate=" + hGetDate
				+ ", maker=" + maker + ", delCk=" + delCk + ", kateNo=" + kateNo + "]";
	}
	
	
}
