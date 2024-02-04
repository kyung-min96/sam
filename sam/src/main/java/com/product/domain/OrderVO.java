package com.product.domain;

import java.util.Date;

public class OrderVO {

	private int onum;
	private String ouserid;
	private String oname;
	private String address;
	private String oproductid;
	private int oprice;
	private int ocount;
	private Date oregdate;
	
	public int getOnum() {
		return onum;
	}
	public void setOnum(int onum) {
		this.onum = onum;
	}
	public String getOuserid() {
		return ouserid;
	}
	public void setOuserid(String ouserid) {
		this.ouserid = ouserid;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getOproductid() {
		return oproductid;
	}
	public void setOproductid(String oproductid) {
		this.oproductid = oproductid;
	}
	public int getOprice() {
		return oprice;
	}
	public void setOprice(int oprice) {
		this.oprice = oprice;
	}
	public int getOcount() {
		return ocount;
	}
	public void setOcount(int ocount) {
		this.ocount = ocount;
	}
	public Date getOregdate() {
		return oregdate;
	}
	public void setOregdate(Date oregdate) {
		this.oregdate = oregdate;
	}
	
	
	
}
