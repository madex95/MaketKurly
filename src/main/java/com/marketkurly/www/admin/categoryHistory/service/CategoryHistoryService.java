package com.marketkurly.www.admin.categoryHistory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marketkurly.www.admin.categoryHistory.domain.CategoryHistory;
import com.marketkurly.www.admin.categoryHistory.mapper.CategoryHistoryMapper;

@Service
public class CategoryHistoryService {
	@Autowired
	CategoryHistoryMapper historyMapper;

	public List<CategoryHistory> getCategoryHistoryList() {
		return historyMapper.getCategoryHistoryList();
	}

	public List<CategoryHistory> searchCGHistory(CategoryHistory categoryHistory) {
		return historyMapper.searchCGHistory(categoryHistory);
	}
}
