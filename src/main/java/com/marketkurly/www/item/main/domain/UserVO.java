package com.marketkurly.www.item.main.domain;

public class UserVO {

	private String user_id;
	private String user_pw;
	private String user_email;
	private String user_auth;
	private String user_name;
	private String user_phone;
	private String user_address;
	private String abled;
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_pw=" + user_pw + ", user_email=" + user_email + ", user_auth="
				+ user_auth + ", user_name=" + user_name + ", user_phone=" + user_phone + ", user_address="
				+ user_address + ", abled=" + abled + "]";
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_auth() {
		return user_auth;
	}
	public void setUser_auth(String user_auth) {
		this.user_auth = user_auth;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getAbled() {
		return abled;
	}
	public void setAbled(String abled) {
		this.abled = abled;
	}
}
