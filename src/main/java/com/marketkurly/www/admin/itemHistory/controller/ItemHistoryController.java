package com.marketkurly.www.admin.itemHistory.controller;

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

import com.marketkurly.www.admin.itemHistory.domain.ItemHistory;
import com.marketkurly.www.admin.itemHistory.service.ItemHistoryService;

@Controller
@RequestMapping("/admin")
public class ItemHistoryController {
	@Autowired
	ItemHistoryService historyService;

	// 상품 이력 관리
	@SuppressWarnings("unchecked")
	@GetMapping(value = "/itemHistory2")
	public String itemHistory(Model model, HttpServletRequest request) {
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if (flashMap == null)
			model.addAttribute("itemHistoryList", historyService.getItemHistoryList());
		else
			model.addAttribute("itemHistoryList", (List<ItemHistory>) flashMap.get("itemHistoryList"));
		model.addAttribute("address", request.getRequestURI());
		return "/admin/itemHistory/itemHistory";
	}

	// 이력 검색
	@PostMapping(value = "/searchItemHistory2")
	public String searchItemHistory(ItemHistory itemHistory, RedirectAttributes rttr) {
		rttr.addFlashAttribute("itemHistoryList", historyService.searchItemHistory(itemHistory));
		return "redirect:/admin/itemHistory";
	}
}
