package com.marketkurly.www.admin.categoryHistory.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.marketkurly.www.admin.categoryHistory.domain.CategoryHistory;
import com.marketkurly.www.admin.categoryHistory.service.CategoryHistoryService;

@Controller
@RequestMapping("/admin")
public class CategoryHistoryController {
	@Autowired
	CategoryHistoryService historyService;

	// 카테고리 이력 관리
	@SuppressWarnings("unchecked")
	@GetMapping(value = "/categoryHistory2")
	public String categoryHistory(Model model, HttpServletRequest request) {
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if (flashMap == null)
			model.addAttribute("categoryHistoryList", historyService.getCategoryHistoryList());
		else
			model.addAttribute("categoryHistoryList", (List<CategoryHistory>) flashMap.get("categoryHistory"));
		model.addAttribute("address", request.getRequestURI());
		return "/admin/categoryHistory/categoryHistory";
	}

	// 이력 검색
	@PostMapping(value = "/searchCGHistory2")
	public String searchCGHistory(CategoryHistory categoryHistory, RedirectAttributes rttr) {
		rttr.addFlashAttribute("categoryHistory", historyService.searchCGHistory(categoryHistory));
		return "redirect:/admin/categoryHistory";
	}
}
