package com.marketkurly.www.admin.menu.domain;

import lombok.Data;

@Data
public class SubMenu {
	private String menu_code;
	private String menu_name;
	private String menu_address;
	private String menu_parent;
	private String update_abled;
	private String abled;
}
