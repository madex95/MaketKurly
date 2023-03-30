package com.marketkurly.www.admin.categoryHistory.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.admin.categoryHistory.domain.CategoryHistory;

@Mapper
public interface CategoryHistoryMapper {
	// 카테고리 이력 조회
	List<CategoryHistory> getCategoryHistoryList();

	// 카테고리 이력 검색
	List<CategoryHistory> searchCGHistory(CategoryHistory categoryHistory);
}
