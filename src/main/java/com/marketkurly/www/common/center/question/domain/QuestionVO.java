package com.marketkurly.www.common.center.question.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QuestionVO {
	
	private int reply_num;
	private Date reply_date;
	private String reply_content;
	private String reply_author;
	private int reply_boardnum;
	private String board_part;
	private String menu_name;
	private String menu_code;
	
}
