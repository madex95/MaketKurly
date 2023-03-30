package com.marketkurly.www.admin.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.marketkurly.www.admin.grant.domain.ExGrantAbledList;
import com.marketkurly.www.admin.order.domain.OrderList;
import com.marketkurly.www.admin.order.mapper.OrderMapper;

@Service
public class OrderService {
	@Autowired
	private OrderMapper orderMapper;
	
	// id
	public String getId() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String nowId = "";
		if (principal != null) {
			nowId = auth.getName();
		}
		return nowId;
	}

	// 주문 내역
	public List<OrderList> getOrderList() {
		ExGrantAbledList grantAbled = new ExGrantAbledList();
		grantAbled.setGrant_code(getId());
		grantAbled.setExGrant_code("getSales");
		if (orderMapper.isGrantGetSales(grantAbled) != null)
			return orderMapper.getOrderList();
		else
			return orderMapper.getMyOrderList(getId());
	}
	
	// 주문 취소
	public void orderCancel(String order_code, String item_code) {
		orderMapper.orderCancel(order_code, item_code);
	}
}
