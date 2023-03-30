package com.marketkurly.www.admin.sales.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.marketkurly.www.admin.grant.domain.ExGrantAbledList;
import com.marketkurly.www.admin.sales.domain.DateSales;
import com.marketkurly.www.admin.sales.domain.SalesList;
import com.marketkurly.www.admin.sales.mapper.SalesMapper;

@Service
public class SalesService {
	@Autowired
	private SalesMapper salesMapper;

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
	
	//grant
	public boolean isGrant() {
		ExGrantAbledList grantAbled = new ExGrantAbledList();
		grantAbled.setGrant_code(getId());
		grantAbled.setExGrant_code("getSales");
		if (salesMapper.isGrantGetSales(grantAbled) != null)
			return true;
		else
			return false;
	}

	// 금월 상품별 판매개수
	public List<SalesList> getSalesItemCount() {
		if (isGrant())
			return salesMapper.getSalesItemCount();
		else
			return salesMapper.getMySalesItemCount(getId());
	}
	
	// 일별 그래프 날짜 목록
	public List<DateSales> getDateSales() {
		if (isGrant())
			return salesMapper.getDateSales();
		else
			return salesMapper.getMyDateSales(getId());
	}
	
	// 월별 그래프 날짜 목록
	public List<DateSales> getMonthSales() {
		if (isGrant())
			return salesMapper.getMonthSales();
		else
			return salesMapper.getMyMonthSales(getId());
	}
	
	// 일별 매출액
	public List<DateSales> getAllDaySales(){
		if (isGrant())
			return salesMapper.getAllDaySales();
		else
			return salesMapper.getMyAllDaySales(getId());
	};
	
	// 월별 매출액
	public List<DateSales> getAllMonthSales(){
		if(isGrant())
			return salesMapper.getAllMonthSales();
		else
			return salesMapper.getMyAllMonthSales(getId());
	}
}
