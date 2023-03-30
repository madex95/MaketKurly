package com.marketkurly.www.item.main.domain;

import lombok.Data;

@Data
public class Criteria {
/*지정한 개수와 검색조건에 따라서 상품 데이터를 출력하는 쿼리를 실행하는데 필요한*/
	private String item_name;
	/*현재 페이지 번호*/
	private int pageNum;
	/*페이지 표시 개수*/
	private int amount;
	/* Criteria 생성자 */
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	/* Criteria 기본 생성자 */
    public  Criteria() {
        this(1,6);
    }

	/*검색키워드*/
	private String keyword;

	/*카테고리 코드*/
	private String code;
	
	/*상품 번호(댓글 기능에서 사용)?*/
	private String item_code;

}
