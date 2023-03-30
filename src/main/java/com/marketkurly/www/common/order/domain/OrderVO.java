package com.marketkurly.www.common.order.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
@Data
public class OrderVO {
		
	private String order_itemcode;
	private String order_id;
	private int order_count;
	private String order_state;
	private Date order_date;
	private String order_code;
	private String address;
	/* 여러개의 주문 상품 */
	//private List<OrderListVO> orders;	

	
	
}
