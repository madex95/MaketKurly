package com.marketkurly.www.item.main.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.item.main.domain.CateVO;
import com.marketkurly.www.item.main.domain.Criteria;

@Mapper
public interface CateMapper {
	/*상품카테고리리스트*/
	public List <CateVO> getCateCode1(Criteria cri);
	
}
