package com.marketkurly.www.common.order.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderListVO {

	String item_code;
	String item_name;
	int item_price;
	String item_cgcode;
	int item_stock;
	String item_detail;
	String item_image;
	String abled;
	String user_id;
	Date startDate;
	Date ori_date;
	
	private String order_itemcode;
	private String order_id;
	private String order_count;
	private String order_state;
	private Date order_date;
	private String order_code;
	private String address;
	//상품개수
	//int cart_count;   //test_cart
	
}


