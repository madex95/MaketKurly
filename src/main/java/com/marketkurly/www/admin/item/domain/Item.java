package com.marketkurly.www.admin.item.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Item {
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
}