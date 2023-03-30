package com.marketkurly.www.admin.sales.domain;

import lombok.Data;

@Data
public class SalesList {
	private String item_code;
	private String item_name;
	private int price;
	private int total_count;
}
