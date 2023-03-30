package com.marketkurly.www.admin.category.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.admin.category.domain.Category;
import com.marketkurly.www.admin.category.domain.CategoryHistory;

@Mapper
public interface CategoryMapper {
	// 카테고리
	// 카테고리 리스트
	List<Category> getCategoryList();

	// 카테고리 추가
	void addCategory(Category category);

	// 카테고리 코드 유무 검사
	String exitCategoryCode(String code);

	// 카테고리 사용여부 변경
	void updateCategoryAbled(String code);

	// 카테고리 정보 조회
	Category getCategoryInfo(String code);

	// 카테고리 전체정보 조회
	Category getCategoryInfoAll(String code);

	// 카테고리 이력 정보 추가
	void insertCategory_History(Category category);

	// 카테고리 수정
	void updateCategory(Category category);

	// 카테고리 개수 조회
	int countCategory();

	// 카테고리 이력 조회
	List<CategoryHistory> getCategoryHistoryList(String code);

	// 카테고리 이력 검색
	List<CategoryHistory> searchCGHistory(CategoryHistory categoryHistory);
}
