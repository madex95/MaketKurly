package com.marketkurly.www.admin.itemHistory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marketkurly.www.admin.itemHistory.domain.ItemHistory;
import com.marketkurly.www.admin.itemHistory.mapper.ItemHistoryMapper;

@Service
public class ItemHistoryService {
	@Autowired
	ItemHistoryMapper historyMapper;

	public List<ItemHistory> getItemHistoryList() {
		return historyMapper.getItemHistoryList();
	}

	public List<ItemHistory> searchItemHistory(ItemHistory itemHistory) {
		return historyMapper.searchItemHistory(itemHistory);
	}
}
