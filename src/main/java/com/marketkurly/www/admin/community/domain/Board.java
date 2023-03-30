package com.marketkurly.www.admin.community.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Board {
	private int board_code;
	private String board_id;
	private String board_title;
	private String board_content;
	private Date board_date;
	private String board_image;
	private String board_part;
	private String item_code;
	private String board_ordercode;
	private String item_name;
	private String board_itemcode;
	private int order_count;
}
