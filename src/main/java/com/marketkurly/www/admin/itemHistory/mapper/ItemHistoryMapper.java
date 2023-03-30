package com.marketkurly.www.admin.itemHistory.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.admin.itemHistory.domain.ItemHistory;

@Mapper
public interface ItemHistoryMapper {
	// 상품 이력 조회
	List<ItemHistory> getItemHistoryList();

	// 상품 이력 검색
	List<ItemHistory> searchItemHistory(ItemHistory itemHistory);
}
