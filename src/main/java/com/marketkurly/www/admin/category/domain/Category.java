package com.marketkurly.www.admin.category.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Category {
	private String code;
	private String name;
	private Date startDate;
	private String abled;
}
