package com.marketkurly.www.admin.delivery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marketkurly.www.admin.delivery.domain.Delivery;
import com.marketkurly.www.admin.delivery.domain.ValueHistory;
import com.marketkurly.www.admin.delivery.mapper.DeliveryMapper;

@Service
public class DeliveryService {
	@Autowired
	private DeliveryMapper deliveryMapper;

	public int getDeliveryPrice() {
		return deliveryMapper.getDeliveryPrice();
	}

	public void updateDeliveryPrice(int price) {
		deliveryMapper.insertValueHistory("delivery");
		deliveryMapper.updateDeliveryPrice(price);
	}

	public List<Delivery> getOrderListDelivery() {
		return deliveryMapper.getOrderListDelivery();
	}

	public int getNowDeliveryPrice() {
		return deliveryMapper.getNowDeliveryPrice();
	}
	
	public List<ValueHistory> getDeliveryHistory() {
		return deliveryMapper.getDeliveryHistory();
	}
	
	public List<Delivery> getSellerDelivery(){
		return deliveryMapper.getSellerDelivery();
	}
}
