package com.marketkurly.www.admin.menu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.marketkurly.www.admin.menu.domain.Menu;
import com.marketkurly.www.admin.menu.domain.SubMenu;
import com.marketkurly.www.admin.menu.service.MenuService;

@Controller
@RequestMapping("/admin")
public class MenuController {
	@Autowired
	private MenuService menuService;

	// 헤드바 관리
	@GetMapping(value = "/headNav")
	public String headNav() {
		return "/admin/menu/headNav";
	}

	//사이드바 관리
	@GetMapping(value = "/sideNav")
	public String sideNav(Model model) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	 
	    String nowId = "";
	    if(principal != null) {
	        nowId = auth.getName();
	    }
		model.addAttribute("nav",menuService.nav(nowId));
		return "/admin/menu/sideNav";
	}

	// footer 관리
	@GetMapping(value = "/footer")
	public String footer() {
		return "/admin/menu/footer";
	}

	// footer 관리
	@GetMapping(value = "/menuName")
	public String menuName(Model model, @RequestParam String address) {
		model.addAttribute("menuName", menuService.getSubMenuName(address));
		return "/admin/menu/menuName";
	}

	// 메뉴 추가 페이지
	@GetMapping(value = "/addMenu")
	public String addMenu(Model model) {
		return "/admin/menu/addMenu";
	}

	// 소메뉴 추가 페이지
	@GetMapping(value = "/addSubMenu")
	public String addSubMenu(@RequestParam("menu_code") String menu_code, Model model) {
		model.addAttribute("menu_code", menu_code);
		return "/admin/menu/addSubMenu";
	}

	// 메뉴 관리
	@GetMapping(value = "/menu")
	public String menu(Model model, HttpServletRequest request) {
		List<Menu> menuList = menuService.getMenuList();
		Map<String, List<SubMenu>> subMenuMap = new HashMap<>();
		for (Menu menu : menuList)
			subMenuMap.put(menu.getMenu_code(), menuService.getSubMenuList(menu.getMenu_code()));
		model.addAttribute("menuList", menuList);
		model.addAttribute("subMenuMap", subMenuMap);
		model.addAttribute("address", request.getRequestURI());
		return "/admin/menu/menu";
	}

	// 메뉴 추가
	@PostMapping(value = "/insertMenu")
	public String insertMenu(Menu menu, RedirectAttributes rttr) {
		if (menuService.exitMenuCode(menu.getMenu_code()) != null) {
			rttr.addAttribute("msg", "이미 존재하는 메뉴 코드입니다.");
			rttr.addAttribute("url", "back");
			return "redirect:../redirect";
		}
		menuService.addMenu(menu);
		return "redirect:/admin/menu";
	}

	// 소메뉴 추가
	@PostMapping(value = "/insertSubMenu")
	public String insertSubMenu(SubMenu subMenu, RedirectAttributes rttr) {
		if (menuService.exitSubMenuCode(subMenu.getMenu_code()) != null) {
			rttr.addAttribute("msg", "이미 존재하는 메뉴 코드입니다.");
			rttr.addAttribute("url", "back");
			return "redirect:../redirect";
		}
		menuService.addSubMenu(subMenu);
		return "redirect:/admin/menu";
	}

	// 메뉴 사용여부 변경
	@GetMapping(value = "/updateMenuAbled")
	public String updateMenuAbled(@RequestParam("menu_code") String menu_code, RedirectAttributes rttr) {
		if (menuService.getUpdateAbled(menu_code).equals("N")) {
			rttr.addAttribute("msg", "이 항목은 수정 및 삭제를 할 수 없습니다.");
			rttr.addAttribute("url", "back");
			return "redirect:../redirect";
		}
		menuService.updateMenuAbled(menu_code);
		return "redirect:/admin/menu";
	}

	// 메뉴 사용여부 변경
	@GetMapping(value = "/updateSubMenuAbled")
	public String updateSubMenuAbled(@RequestParam("menu_code") String menu_code, RedirectAttributes rttr) {
		if (menuService.getSubUpdateAbled(menu_code).equals("N")) {
			rttr.addAttribute("msg", "이 항목은 수정 및 삭제를 할 수 없습니다.");
			rttr.addAttribute("url", "back");
			return "redirect:../redirect";
		}
		menuService.updateSubMenuAbled(menu_code);
		return "redirect:/admin/menu";
	}

	// 대메뉴 삭제
	@GetMapping(value = "/deleteMenu")
	public String deleteMenu(@RequestParam("menu_code") String menu_code, RedirectAttributes rttr) {
		if (menuService.getUpdateAbled(menu_code).equals("N")) {
			rttr.addAttribute("msg", "이 항목은 수정 및 삭제를 할 수 없습니다.");
			rttr.addAttribute("url", "back");
			return "redirect:../redirect";
		}
		menuService.deleteMenu(menu_code);
		return "redirect:/admin/menu";
	}

	// 소메뉴 삭제
	@GetMapping(value = "/deleteSubMenu")
	public String deleteSubMenu(@RequestParam("menu_code") String menu_code, RedirectAttributes rttr) {
		if (menuService.getSubUpdateAbled(menu_code).equals("N")) {
			rttr.addAttribute("msg", "이 항목은 수정 및 삭제를 할 수 없습니다.");
			rttr.addAttribute("url", "back");
			return "redirect:../redirect";
		}
		menuService.deleteSubMenu(menu_code);
		return "redirect:/admin/menu";
	}

	// 메뉴 수정 페이지
	@GetMapping(value = "/modifyMenu")
	public String modifyMenu(@RequestParam("menu_code") String menu_code, Model model, RedirectAttributes rttr) {
		if (menuService.getUpdateAbled(menu_code).equals("N")) {
			rttr.addAttribute("msg", "이 항목은 수정 및 삭제를 할 수 없습니다.");
			rttr.addAttribute("url", "back");
			return "redirect:../redirect";
		}
		model.addAttribute("menu", menuService.getMenuInfo(menu_code));
		return "/admin/menu/modifyMenu";
	}

	// 메뉴 수정
	@PostMapping(value = "/updateMenu")
	public String updateMenu(Menu menu) {
		menuService.updateMenu(menu);
		return "redirect:/admin/menu";
	}

	// 소메뉴 수정 페이지
	@GetMapping(value = "/modifySubMenu")
	public String modifySubMenu(@RequestParam("menu_code") String menu_code, Model model, RedirectAttributes rttr) {
		if (menuService.getSubUpdateAbled(menu_code).equals("N")) {
			rttr.addAttribute("msg", "이 항목은 수정 및 삭제를 할 수 없습니다.");
			rttr.addAttribute("url", "back");
			return "redirect:../redirect";
		}
		model.addAttribute("menu", menuService.getSubMenuInfo(menu_code));
		return "/admin/menu/modifySubMenu";
	}

	// 소메뉴 수정
	@PostMapping(value = "/updateSubMenu")
	public String updateSubMenu(SubMenu subMenu) {
		menuService.updateSubMenu(subMenu);
		return "redirect:/admin/menu";
	}
}
