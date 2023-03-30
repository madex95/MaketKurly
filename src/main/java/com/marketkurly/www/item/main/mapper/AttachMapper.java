package com.marketkurly.www.item.main.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.item.main.domain.ItemVO;

@Mapper
public interface AttachMapper {
/*이미지데이터반환*/
	public List <ItemVO> getAttachList(String item_code);



}
