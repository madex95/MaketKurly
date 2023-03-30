package com.marketkurly.www.admin.boardMenu.domain;

import lombok.Data;

@Data
public class BoardMenu {
	private String menu_code;
	private String menu_name;
	private String menu_part;
	private String abled;
	private String reply_abled;
	private String write_abled;
	private String important;
}
