package com.marketkurly.www.admin.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.admin.grant.domain.ExGrantAbledList;
import com.marketkurly.www.admin.order.domain.OrderList;

@Mapper
public interface OrderMapper {

	// 권한 검사
	String isGrantGetSales(ExGrantAbledList grantAbled);
	
	// 주문내역 조회
	List<OrderList> getOrderList();
	
	// 판매자 주문내역 조회
	List<OrderList> getMyOrderList(String user_id);
	
	// 주문 취소
	void orderCancel(String order_code,String item_code);
}
