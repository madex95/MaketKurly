package com.marketkurly.www.admin.sales.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.admin.grant.domain.ExGrantAbledList;
import com.marketkurly.www.admin.sales.domain.DateSales;
import com.marketkurly.www.admin.sales.domain.SalesList;

@Mapper
public interface SalesMapper {
	// 금월 상품별 판매 개수 조회
	List<SalesList> getSalesItemCount();
	
	// 금월 판매자 상품별 판매 개수 조회
	List<SalesList> getMySalesItemCount(String user_id);

	// 권한 검사
	String isGrantGetSales(ExGrantAbledList grantAbled);
	
	//관리자 일별 매출액 그래프
	List<DateSales> getDateSales();
	
	//판매자 일별 매출액 그래프
	List<DateSales> getMyDateSales(String user_id);
	
	//관리자 월별 매출액 그래프
	List<DateSales> getMonthSales();
	
	//판매자 월별 매출액 그래프
	List<DateSales> getMyMonthSales(String user_id);
	
	//관리자 일별 매출액
	List<DateSales> getAllDaySales();
	
	//판매자 일별 매출액
	List<DateSales> getMyAllDaySales(String user_id);
	
	//관리자 월별 매출액
	List<DateSales> getAllMonthSales();
	
	//판매자 월별 매출액
	List<DateSales> getMyAllMonthSales(String user_id);
}
