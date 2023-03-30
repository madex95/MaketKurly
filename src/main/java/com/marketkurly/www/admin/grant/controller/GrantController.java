package com.marketkurly.www.admin.grant.controller;

import java.util.HashMap;
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

import com.marketkurly.www.admin.grant.domain.ExGrantAbled;
import com.marketkurly.www.admin.grant.domain.Grant;
import com.marketkurly.www.admin.grant.service.GrantService;
import com.marketkurly.www.admin.menu.domain.Menu;
import com.marketkurly.www.admin.menu.domain.SubMenu;

@Controller
@RequestMapping("/admin")
public class GrantController {
	@Autowired
	GrantService grantService;

	// 권한 목록
	@GetMapping(value = "/grant")
	public String grant(Model model, HttpServletRequest request) {
		model.addAttribute("address", request.getRequestURI());
		model.addAttribute("grantList", grantService.getGrantList());
		return "/admin/grant/grantList";
	}

	// 권한 추가 페이지
	@GetMapping(value = "/addGrant")
	public String addGrant() {
		return "/admin/grant/addGrant";
	}

	// 권한 추가
	@PostMapping(value = "/insertGrant")
	public String insertGrant(Grant grant) {
		grantService.addGrant(grant);
		return "redirect:/admin/grant";
	}

	// 메뉴 권한 목록
	@GetMapping(value = "/menugrantabled")
	public String menugrantabled(@RequestParam("code") String code, Model model) {
		model.addAttribute("code", code);
		List<Menu> menuList = grantService.getMenuList();
		Map<String, List<SubMenu>> subMenuMap = new HashMap<>();
		for (Menu menu : menuList)
			subMenuMap.put(menu.getMenu_code(), grantService.getSubMenuList(menu.getMenu_code()));
		model.addAttribute("menuList", menuList);
		model.addAttribute("subMenuMap", subMenuMap);
		model.addAttribute("grantList", grantService.getGrantAbledAll(code));
		return "/admin/grant/menuGrantAbled";
	}

	// 메뉴 권한 저장
	@GetMapping(value = "/saveGrant")
	public String saveGrant(@RequestParam(value = "abled", required = false) List<String> abled,
			@RequestParam("code") String code, RedirectAttributes rttr) {
		grantService.insertGrant(code, abled);
		rttr.addAttribute("code", code);
		return "redirect:/admin/menugrantabled";
	}

	// 기타 권한 목록
	@GetMapping(value = "/grantabled")
	public String grantabled(@RequestParam("code") String code, Model model) {
		model.addAttribute("code", code);
		model.addAttribute("grantList", grantService.getExGrantAbledList());
		model.addAttribute("grantAbledList", grantService.getExGrantAbledAll(code));
		return "/admin/grant/grantAbled";
	}

	// 기타 권한 추가 페이지
	@GetMapping(value = "/addGrantAbled")
	public String addGrantAbled(@RequestParam("code") String code, Model model) {
		model.addAttribute("code", code);
		return "/admin/grant/addGrantAbled";
	}

	// 기타 권한 추가
	@PostMapping(value = "/insertGrantAbled")
	public String insertGrantAbled(@RequestParam("grant_code") String code, ExGrantAbled grantAbled,
			RedirectAttributes rttr) {
		if (grantService.getExGrantAbledCount(grantAbled.getCode()) != null) {
			rttr.addAttribute("msg", "이미 존재하는 권한 코드입니다.");
			rttr.addAttribute("url", "back");
			return "redirect:../redirect";
		}

		grantService.addExGrantAbled(grantAbled);
		System.out.println("=============" + code);
		rttr.addAttribute("code", code);
		return "redirect:/admin/grantabled";
	}

	// 기타권한 저장
	@GetMapping(value = "/saveExGrant")
	public String saveExGrant(@RequestParam(value = "abled", required = false) List<String> abled,
			@RequestParam("code") String code, RedirectAttributes rttr) {
		grantService.insertExGrant(code, abled);
		rttr.addAttribute("code", code);
		return "redirect:/admin/grantabled";
	}

	// 권한 수정 페이지
	@GetMapping(value = "modifygrant")
	public String modifygrant(@RequestParam("code") String code, Model model) {
		model.addAttribute("grant", grantService.getGrantInfo(code));
		return "/admin/grant/modifyGrant";
	}

	// 권한 수정
	@PostMapping(value = "updateGrant")
	public String updateGrant(Grant grant) {
		grantService.updateGrant(grant);
		return "redirect:/admin/grant";
	}

	// 권한 사용여부 변경
	@GetMapping(value = "/updategrantAbled")
	public String updategrantAbled(@RequestParam("code") String code) {
		grantService.updategrantAbled(code);
		return "redirect:/admin/grant";
	}

	// 기타 권한 수정 페이지
	@GetMapping(value = "/modifyGrantAbled")
	public String modifyGrantAbled(@RequestParam("code") String code, @RequestParam("grant_code") String grant_code,
			Model model) {
		model.addAttribute("grant", grantService.getExGrantInfo(code));
		model.addAttribute("grant_code", grant_code);
		return "/admin/grant/modifyGrantAbled";
	}

	// 기타 권한 수정
	@PostMapping(value = "updateGrantAbled")
	public String updateGrantAbled(@RequestParam("grant_code") String grant_code, ExGrantAbled exGrantAbled,
			RedirectAttributes rttr) {
		grantService.updateGrantAbled(exGrantAbled);
		rttr.addAttribute("code", grant_code);
		return "redirect:/admin/grantabled";
	}

	// 기타 권한 삭제
	@GetMapping(value = "/deleteGrantAbled")
	public String deleteGrantAbled(@RequestParam("code") String code, @RequestParam("grant_code") String grant_code,
			RedirectAttributes rttr) {
		grantService.deleteGrantAbled(code);
		rttr.addAttribute("code", grant_code);
		return "redirect:/admin/grantabled";
	}
}
