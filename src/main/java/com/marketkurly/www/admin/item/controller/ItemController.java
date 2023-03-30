package com.marketkurly.www.admin.item.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.marketkurly.www.admin.item.domain.Item;
import com.marketkurly.www.admin.item.domain.ItemHistory;
import com.marketkurly.www.admin.item.service.ItemService;

@Controller
@RequestMapping("/admin")
public class ItemController {
	@Autowired
	private ItemService itemService;

	// 상품 추가 페이지
	@GetMapping(value = "/addItem")
	public String addItem(Model model) {
		model.addAttribute("categoryNameList", itemService.getCategoryList());
		return "/admin/item/addItem";
	}

	// 상품 관리
	@GetMapping(value = "/itemlist")
	public String itemlist(Model model, HttpServletRequest request) {
		model.addAttribute("itemList", itemService.getItemList());
		model.addAttribute("address", request.getRequestURI());
		return "/admin/item/itemList";
	}

	// 상품 추가
	@PostMapping(value = "/insertItem")
	public String insertItem(@RequestParam("files") List<MultipartFile> files, Item item, RedirectAttributes rttr,
			HttpServletRequest request) {
		LocalDate now = LocalDate.now();
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMddHHmmss");
		// 이미지 검사
		String name = "";
		for (int i = 0; i < files.size(); i++)
			name += ":" + format1.format(date)+ i + files.get(i).getOriginalFilename();
		if (name.getBytes().length > 2000) {
			rttr.addAttribute("이미지가 너무 많습니다.");
			rttr.addAttribute("url", "back");
			return "redirect:../redirect";
		}
		item.setItem_image(name);

		// 상품 코드 고유성 검사
		// 이미 있는 코드이면
		if (itemService.exitItemCode(item.getItem_code()) != null) {
			rttr.addAttribute("msg", "이미 존재하는 상품 코드입니다.");
			rttr.addAttribute("url", "back");
			return "redirect:../redirect";
		}
		itemService.addItem(request.getServletContext().getRealPath("/resources/image"), files, item, now.toString(), format1.format(date));
		return "redirect:/admin/itemlist";
	}

	// 상품 사용여부 변경
	@GetMapping(value = "/updateItemAbled")
	public String updateItemAbled(@RequestParam("item_code") String item_code) {
		itemService.updateItemAbled(item_code);
		return "redirect:/admin/itemlist";
	}

	// 상품 수정 페이지 이동
	@GetMapping(value = "/modifyItem")
	public String modifyItem(@RequestParam("itemCode") String item_code, Model model) {
		model.addAttribute("categoryNameList", itemService.getCategoryList());
		model.addAttribute("item", itemService.getItemInfo(item_code));
		return "/admin/item/modifyItem";
	}

	// 상품 수정
	@PostMapping(value = "/updateItem")
	public String updateItem(@RequestParam("files") List<MultipartFile> files, Item item, HttpServletRequest request,
			RedirectAttributes rttr) {
		if (!itemService.updateItem(request.getServletContext().getRealPath("/resources/image"),files, item)) {
			rttr.addAttribute("이미지가 너무 많습니다.");
			rttr.addAttribute("url", "back");
			return "redirect:../redirect";
		}
		
		

		return "redirect:/admin/itemlist";
	}
	
	//상품 상세
	@SuppressWarnings("unchecked")
	@GetMapping(value="/detailItem")
	public String detailItem(@RequestParam("item_code")String item_code, Model model, HttpServletRequest request) {
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if (flashMap == null)
			model.addAttribute("itemHistoryList", itemService.getItemHistoryList(item_code));
		else
			model.addAttribute("itemHistoryList", (List<ItemHistory>) flashMap.get("itemHistoryList"));
		model.addAttribute("item", itemService.getItemInfoCG(item_code));
		
		return "/admin/item/detailItem";
	}

	// 이력 검색
	@PostMapping(value = "/searchItemHistory")
	public String searchItemHistory(ItemHistory itemHistory, RedirectAttributes rttr) {
		rttr.addFlashAttribute("itemHistoryList", itemService.searchItemHistory(itemHistory));
		rttr.addAttribute("item_code",itemHistory.getItem_code());
		return "redirect:/admin/detailItem#search";
	}
}
