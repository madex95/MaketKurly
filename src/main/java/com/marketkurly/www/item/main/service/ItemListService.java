package com.marketkurly.www.item.main.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marketkurly.www.item.main.domain.CateFilterDTO;
import com.marketkurly.www.item.main.domain.CateVO;
import com.marketkurly.www.item.main.domain.Criteria;
import com.marketkurly.www.item.main.domain.ItemVO;
import com.marketkurly.www.item.main.mapper.ItemListMapper;

@Service
public class ItemListService {

	 @Autowired
	 ItemListMapper itemlistmapper;
	 
	/* 상품 검색 */
 public List <ItemVO> GetitemList(Criteria cri) {
		return itemlistmapper.GetitemList(cri);
	}
	/* 카테고리 페이징을 위한 */
public List <ItemVO> GetitemList2(Criteria cri) {
		return itemlistmapper.GetitemList2(cri);
	}
	
	 /* 상품 총 개수 */
  public int itemGetTotal(Criteria cri) throws Exception {
    	return itemlistmapper.itemGetTotal(cri);
	} 
	 /* 상품 총 개수2(카테고리) */
public int itemGetTotal2(Criteria cri) throws Exception {
 	return itemlistmapper.itemGetTotal2(cri);
	} 

  
    /*상품카테고리리스트*/
  public List <CateVO> getCateCode1(){
		 return itemlistmapper.getCateCode1();
	 }
  /* 검색결과 카테고리 필터 정보 */
	public List<CateFilterDTO> getCateInfoList(Criteria cri) {
		
		List<CateFilterDTO> filterInfoList = new ArrayList<CateFilterDTO>();
		String[] cateList = itemlistmapper.getCateList(cri);
		
		String tempCateCode = cri.getCode();
		
		for(String code : cateList) {
			cri.setCode(code);
			CateFilterDTO filterInfo = itemlistmapper.getCateInfo(cri);
			filterInfoList.add(filterInfo);
		}
		cri.setCode(tempCateCode);
		return filterInfoList;
	}

  /* 상품 id 이름 */
public ItemVO getItemCode(String item_code) {
	return itemlistmapper.getItemCode(item_code);
}

}
