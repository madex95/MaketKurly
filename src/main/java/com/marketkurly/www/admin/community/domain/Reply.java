package com.marketkurly.www.admin.community.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Reply {
	private Date reply_date;
	private String reply_content;
	private int reply_num;
	private String reply_author;
	private int reply_boardNum;
}
