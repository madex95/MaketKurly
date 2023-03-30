package com.marketkurly.www.admin.item.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.admin.category.domain.Category;
import com.marketkurly.www.admin.grant.domain.ExGrantAbledList;
import com.marketkurly.www.admin.item.domain.Item;
import com.marketkurly.www.admin.item.domain.ItemHistory;

@Mapper
public interface ItemMapper {
	// 상품
	// 상품 리스트
	List<Item> getItemList();

	// 판매자 상품 리스트
	List<Item> getMyItemList(String user_id);

	// 상품 코드 유무 검사
	String exitItemCode(String item_code);

	// 상품 추가
	void addItem(Item item);

	// 카테고리 리스트
	List<Category> getCategoryList();

	// 상품 사용여부 변경
	void updateItemAbled(String item_code);

	// 상품 정보 조회
	Item getItemInfo(String item_code);

	// 상품 정보 수정
	void updateItem(Item item);

	// 상품 이미지 조회
	String getItemImg(String item_code);

	// 상품 생성 날짜 조회
	String getItemOriDate(String item_code);

	// 상품 이미지 수정
	void updateItemImage(Item item);

	// 상품 이력 정보 추가
	void insertItemHistory(Item item);

	// 상품 수정 전 정보
	Item getItemInfoAll(String item_code);

	// 권한 검사
	String isGrantGetItem(ExGrantAbledList grantAbled);
	
	// 상품 조회
	Item getItemInfoCG(String item_code);

	// 상품 이력 조회
	List<ItemHistory> getItemHistoryList(String item_code);

	// 상품 이력 검색
	List<ItemHistory> searchItemHistory(ItemHistory itemHistory);
}
