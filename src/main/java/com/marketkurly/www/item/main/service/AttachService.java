package com.marketkurly.www.item.main.service;

import java.util.List;

import com.marketkurly.www.item.main.domain.ItemVO;

public interface AttachService {

	public List <ItemVO> getAttachList(String item_code);
}
