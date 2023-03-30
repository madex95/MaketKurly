package com.marketkurly.www.item.main.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.marketkurly.www.common.user.domain.UserVO;
import com.marketkurly.www.item.main.domain.Criteria;
import com.marketkurly.www.item.main.domain.ItemVO;

@Mapper
public interface WelcomeWebMapper {
	/*상품리스트*/
	List <ItemVO> selectWelcomeWebServiceList ();
	/*카테고리별 상품 출력*/
	List<ItemVO> cateitemlist(String item_cgcode, @Param("cri")Criteria cri);
	/*메인페이지 상품상세페이지 이동*/
	ItemVO detailpage(String item_code);
	/*검색*/
	List<ItemVO> search(String item_name);
	/*권한 검사*/
	String grant(String user_id);

}
