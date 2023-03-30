package com.marketkurly.www.admin.delivery.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.admin.delivery.domain.Delivery;
import com.marketkurly.www.admin.delivery.domain.ValueHistory;

@Mapper
public interface DeliveryMapper {
	// 배송비 조회
	int getDeliveryPrice();

	// 배송비 수정
	void updateDeliveryPrice(int price);

	// 배송비 이력 추가
	void insertValueHistory(String name);

	// 주문내역 배송비 조회
	List<Delivery> getOrderListDelivery();

	// 이번 달 총 배송비
	int getNowDeliveryPrice();
	
	// 배송비 이력 조회
	List<ValueHistory> getDeliveryHistory();
	
	// 판매자 별 배송비 조회
	List<Delivery> getSellerDelivery();
}
