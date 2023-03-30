package com.marketkurly.www.item.main.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.marketkurly.www.item.main.mapper.ItemMapper;
import com.marketkurly.www.item.main.domain.ItemVO;

public class ItemServiceImpl implements ItemService {
	@Autowired
	ItemMapper itemmapper;

	@Override
	public ItemVO getItemInfo(String item_code) {
		
//	ItemVO itemInfo = itemmapper.getGoodsList();
		return null;
	}

}
