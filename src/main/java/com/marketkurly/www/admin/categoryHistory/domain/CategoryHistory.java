package com.marketkurly.www.admin.categoryHistory.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class CategoryHistory {
	private String code;
	private String name;
	private Date startDate;
	private Date endDate;
}
