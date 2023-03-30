package com.marketkurly.www.item.main.domain;

import java.util.Date;

public class CateVO {
	
	private String code;
	private String name;
	private Date startdate;
	private String abled;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
		return "CategoryVO [code=" + code + ", name=" + name + ", startdate=" + startdate + ", abled=" + abled + "]";
	}

}
