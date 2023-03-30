package com.marketkurly.www.item.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marketkurly.www.item.main.mapper.AttachMapper;
import com.marketkurly.www.item.main.domain.ItemVO;

@Service
public class AttachServiceImpl implements AttachService {
	@Autowired
	private AttachMapper attachmapper;
	@Override
	public List<ItemVO> getAttachList(String item_code) {
		
		return attachmapper.getAttachList(item_code);
	}

}
