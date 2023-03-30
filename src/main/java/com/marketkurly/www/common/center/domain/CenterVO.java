package com.marketkurly.www.common.center.domain;


import java.util.Date;

import lombok.Data;

@Data
public class CenterVO {
	private Integer board_code;
	private String board_id;
	private String board_title;
	private String board_content;
	private Date board_date;
	private String board_image;
	private String board_part;
	private String board_itemcode;
	private String board_ordercode;
	private Integer board_num;
	private String modify_date;
	private int reply_num;
	private int fake_num;
}
