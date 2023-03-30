package com.marketkurly.www.admin.order.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderList {
	private String order_code;
	private String item_code;
	private String user_id;
	private int order_count;
	private Date order_date;
	private String item_name;
	private int price;
	private String order_state;
	private String address;
}
