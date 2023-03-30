package com.marketkurly.www.item.main.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.marketkurly.www.common.user.domain.UserVO;
import com.marketkurly.www.item.main.domain.Criteria;
import com.marketkurly.www.item.main.domain.ItemVO;

public interface WelcomeWebService {
	List <ItemVO> selectWelcomeWebServiceList();
	/*카테고리 별 상품출력*/
	List<ItemVO> cateitemlist(String item_cgcode, Criteria cri);
	/*메인페이지 상세페이지로 이동*/
	ItemVO detailpage(String item_code);
	/*검색*/
	List<ItemVO> search(String item_name);
	/*권한 검사*/
	String grant();

}
