package com.marketkurly.www.admin.delivery.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Value {
	private String name;
	private int price;
	private Date startDate;
}
