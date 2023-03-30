package com.marketkurly.www.item.main.domain;

import lombok.Data;

@Data
public class CateFilterDTO {
	/* 카테고리 이름 */
	private String name;
	
	/* 카테고리 넘버 */
	private String code;;
	
	/* 카테고리 상품 수 */
	//private int cateCount;	
}
