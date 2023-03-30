package com.marketkurly.www.admin.item.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ItemHistory {
	private String item_code;
	private String item_name;
	private String item_price;
	private String item_cgcode;
	private String item_detail;
	private String item_image;
	private Date startDate;
	private Date endDate;
	private Date ori_date;
}
