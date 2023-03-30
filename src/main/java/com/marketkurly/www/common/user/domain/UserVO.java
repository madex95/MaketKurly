package com.marketkurly.www.common.user.domain;

import lombok.Data;

@Data
public class UserVO {

	private String user_id;
	private String user_pw;
	private String user_auth;
	private String user_name;
	private String user_email;
	private String user_phone;
	private String user_address_code;
	private String user_address;
	private String user_sub_address;
	private String abled;
	
}
