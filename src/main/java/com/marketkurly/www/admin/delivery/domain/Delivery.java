package com.marketkurly.www.admin.delivery.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Delivery {
	private String order_code;
	private Date order_date;
	private int price;
	private int seller_count;
	private String seller;
}
