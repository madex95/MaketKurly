package com.marketkurly.www.item.main.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.item.main.domain.CateFilterDTO;
import com.marketkurly.www.item.main.domain.CateVO;
import com.marketkurly.www.item.main.domain.Criteria;
import com.marketkurly.www.item.main.domain.ItemVO;

@Mapper
public interface ItemListMapper {
	/*상품검색*/
	public List <ItemVO> GetitemList(Criteria cri);
	/*카테고리 페이징을 위한*/
	public List <ItemVO> GetitemList2(Criteria cri);
	
	/*item테이블의 총 행의 개수를 구하는 쿼리 호출 -> 상품 총 수*/
	public int itemGetTotal(Criteria cri);
	
	/*카테고리 페이징을 위한*/
	public int itemGetTotal2(Criteria cri);
	
	 /*상품카테고리리스트*/
	public List <CateVO> getCateCode1();
	
	/* 검색 대상 카테고리 리스트 */
	public String[] getCateList(Criteria cri);
		
	/* 카테고리 정보(+검색대상 갯수) */
	public CateFilterDTO getCateInfo(Criteria cri);
	 
	/*상품 코드 리스트 요청*/
	//public String[] getItmecodeList(String keyword);
	 
	 /* 상품 id 이름 */
	public ItemVO getItemCode(String item_code);
}
