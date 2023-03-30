package com.marketkurly.www.admin.category.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.marketkurly.www.admin.category.domain.Category;
import com.marketkurly.www.admin.category.domain.CategoryHistory;
import com.marketkurly.www.admin.category.service.CategoryService;

@Controller
@RequestMapping("/admin")
public class CategoryController {
	@Autowired
	private CategoryService categoryService;

	// 카테고리 관리
	@GetMapping(value = "/category")
	public String category(Model model, HttpServletRequest request) {
		model.addAttribute("categoryList", categoryService.getCategoryList());
		model.addAttribute("address", request.getRequestURI());
		return "/admin/category/category";
	}

	// 카테고리 추가 페이지
	@GetMapping(value = "/addCategory")
	public String addCategory(Model model, Category categoty) {
		return "/admin/category/addCategory";
	}

	// 카테고리 추가
	@PostMapping(value = "/insertCategory")
	public String insertCategory(Category category, RedirectAttributes rttr) {
		if (categoryService.exitCategoryCode(category.getCode()) != null) {
			rttr.addAttribute("msg", "이미 존재하는 카테고리 코드입니다.");
			rttr.addAttribute("url", "back");
			return "redirect:../redirect";
		}
		if (!categoryService.addCategory(category)) {
			rttr.addAttribute("msg", "카테고리는 5개까지 추가할 수 있습니다.");
			rttr.addAttribute("url", "back");
			return "redirect:../redirect";
		}
		;
		return "redirect:/admin/category";
	}

	// 카테고리 사용여부 변경
	@GetMapping(value = "/updateCategoryAbled")
	public String updateCategoryAbled(@RequestParam("code") String code, @RequestParam("abled") String abled,
			RedirectAttributes rttr) {
		if (!categoryService.updateCategoryAbled(code, abled)) {
			rttr.addAttribute("msg", "카테고리는 5개까지 추가할 수 있습니다.");
			rttr.addAttribute("url", "back");
			return "redirect:../redirect";
		}
		;
		return "redirect:/admin/category";
	}

	// 카테고리 사용여부 변경
	@GetMapping(value = "/modifyCategory")
	public String modifyCategory(@RequestParam("code") String code, Model model) {
		model.addAttribute("category", categoryService.getCategoryInfo(code));
		return "/admin/category/modifyCategory";
	}

	// 카테고리 수정
	@PostMapping(value = "/updateCategory")
	public String updateCategory(Category category, RedirectAttributes rttr) {
		if (!categoryService.updateCategory(category)) {
			rttr.addAttribute("msg", "카테고리는 5개까지 추가할 수 있습니다.");
			rttr.addAttribute("url", "back");
			return "redirect:../redirect";
		}
		;
		return "redirect:/admin/category";
	}
	
	//카테고리 상세
	@SuppressWarnings("unchecked")
	@GetMapping(value = "/detailCategory")
	public String detailCategory(@RequestParam("code")String code, Model model, HttpServletRequest request) {
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if (flashMap == null)
			model.addAttribute("categoryHistoryList", categoryService.getCategoryHistoryList(code));
		else
			model.addAttribute("categoryHistoryList", (List<CategoryHistory>) flashMap.get("categoryHistory"));
		model.addAttribute("category", categoryService.getCategoryInfo(code));
		return "/admin/category/detailCategory";
	}

	// 이력 검색
	@PostMapping(value = "/searchCGHistory")
	public String searchCGHistory(CategoryHistory categoryHistory, RedirectAttributes rttr) {
		rttr.addFlashAttribute("categoryHistory", categoryService.searchCGHistory(categoryHistory));
		rttr.addAttribute("code",categoryHistory.getCode());
		return "redirect:/admin/detailCategory";
	}
}
