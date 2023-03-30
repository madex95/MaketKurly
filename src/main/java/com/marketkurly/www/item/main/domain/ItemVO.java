package com.marketkurly.www.item.main.domain;

import java.util.Date;

public class ItemVO {
	private String item_code;
	private String item_name;
	private int item_price;
	private String item_cgcode;
	private int item_stock;
	private String item_detail;
	private String item_image;
	private Date startdate;
	private String abled;
	private Date ori_date;
	public Date getOri_date() {
		return ori_date;
	}
	public void setOri_date(Date ori_date) {
		this.ori_date = ori_date;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public String getItem_cgcode() {
		return item_cgcode;
	}
	public void setItem_cgcode(String item_cgcode) {
		this.item_cgcode = item_cgcode;
	}
	public int getItem_stock() {
		return item_stock;
	}
	public void setItem_stock(int item_stock) {
		this.item_stock = item_stock;
	}
	public String getItem_detail() {
		return item_detail;
	}
	public void setItem_detail(String item_detail) {
		this.item_detail = item_detail;
	}
	public String getItem_image() {
		return item_image;
	}
	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public String getAbled() {
		return abled;
	}
	public void setAbled(String abled) {
		this.abled = abled;
	}
	@Override
	public String toString() {
		return "ItemVO [item_code=" + item_code + ", item_name=" + item_name + ", item_price=" + item_price
				+ ", item_cgcode=" + item_cgcode + ", item_stock=" + item_stock + ", item_detail=" + item_detail
				+ ", item_image=" + item_image + ", startdate=" + startdate + ", abled=" + abled + ", ori_date="
				+ ori_date + "]";
	}

}
