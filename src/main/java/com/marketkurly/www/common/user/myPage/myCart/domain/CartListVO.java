package com.marketkurly.www.common.user.myPage.myCart.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartListVO {
	
	private String cart_itemcode;
	private String cart_id;
	private int cart_count;
	private int cart_num;
	
	private String item_name;
	private int item_price;
	private int ori_price;
	private Date ori_date;
	private String item_image;
	private String seller_id;
	
	private int user_address_code;
	private String user_address;
	private String user_sub_address;
	
	private String[] chkArray;

}
