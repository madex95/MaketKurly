package com.marketkurly.www.admin.category.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marketkurly.www.admin.category.domain.Category;
import com.marketkurly.www.admin.category.domain.CategoryHistory;
import com.marketkurly.www.admin.category.mapper.CategoryMapper;

@Service
public class CategoryService {
	@Autowired
	private CategoryMapper categoryMapper;

	public List<Category> getCategoryList() {
		return categoryMapper.getCategoryList();
	}

	public boolean addCategory(Category category) {
		if (category.getAbled() == null)
			category.setAbled("N");
		else {
			if (categoryMapper.countCategory() >= 5)
				return false;
		}
		System.out.println(categoryMapper.countCategory());
		categoryMapper.addCategory(category);
		return true;
	}

	public String exitCategoryCode(String code) {
		return categoryMapper.exitCategoryCode(code);
	}

	public boolean updateCategoryAbled(String code, String abled) {
		if (abled.equals("N")) {
			if (categoryMapper.countCategory() >= 5)
				return false;
		}
		categoryMapper.updateCategoryAbled(code);
		return true;
	}

	public Category getCategoryInfo(String code) {
		return categoryMapper.getCategoryInfo(code);
	}

	public boolean updateCategory(Category category) {
		Category oldCategory = categoryMapper.getCategoryInfoAll(category.getCode());
		categoryMapper.insertCategory_History(oldCategory);
		if (category.getAbled() == null)
			category.setAbled("N");
		else {
			if (categoryMapper.countCategory() >= 5)
				return false;
		}
		categoryMapper.updateCategory(category);
		return true;
	}
	
	public List<CategoryHistory> getCategoryHistoryList(String code) {
		return categoryMapper.getCategoryHistoryList(code);
	}

	public List<CategoryHistory> searchCGHistory(CategoryHistory categoryHistory) {
		return categoryMapper.searchCGHistory(categoryHistory);
	}
}
