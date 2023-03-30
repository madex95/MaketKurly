package com.marketkurly.www.common.order.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marketkurly.www.common.order.domain.OrderListVO;
import com.marketkurly.www.common.order.domain.OrderVO;
import com.marketkurly.www.common.order.mapper.OrderItemMapper;
import com.marketkurly.www.common.user.myPage.myCart.mapper.CartMapper;

@Service
public class OrderItemService {
	@Autowired
	CartMapper cartmapepr;
	@Autowired
	OrderItemMapper ordermapper;
	
	
	/* 카트개수*/
	public Integer getOrderInfo(String cart_id, String cart_itemcode) {
		
		int result = ordermapper.getOrderInfo(cart_id , cart_itemcode);
		return result;
	}
	/*주문시간 , 코드 가져오기*/
	public OrderVO  getInfo () {
		return ordermapper.getInfo();
	}
	/*주문테이블 등록*/
	public Integer enrollOrder(OrderVO order) {
		Integer result = ordermapper.enrollOrder(order);
		return result;
		
	}
	
}
