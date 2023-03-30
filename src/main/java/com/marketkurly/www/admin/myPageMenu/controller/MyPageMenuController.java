package com.marketkurly.www.admin.myPageMenu.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.marketkurly.www.admin.myPageMenu.domain.MyPageMenu;
import com.marketkurly.www.admin.myPageMenu.service.MyPageMenuService;

@Controller
@RequestMapping("/admin")
public class MyPageMenuController {

	@Autowired
	private MyPageMenuService myPageMenuService;

	// 마이페이지 메뉴 관리
	@GetMapping(value = "/mypage")
	public String category(Model model, HttpServletRequest request) {
		model.addAttribute("menuList", myPageMenuService.getMyPageMenuList());
		model.addAttribute("address", request.getRequestURI());
		return "/admin/myPageMenu/myPageMenu";
	}

	// 마이페이지 메뉴 추가 페이지
	@GetMapping(value = "/addMyPageMenu")
	public String addMyPageMenu(Model model) {
		return "/admin/myPageMenu/addMyPageMenu";
	}

	// 마이페이지 메뉴 추가 페이지
	@PostMapping(value = "/insertMyPageMenu")
	public String insertMyPageMenu(MyPageMenu myPageMenu, RedirectAttributes rttr) {
		if (myPageMenuService.exitMyPageCode(myPageMenu.getMenu_code()) != null) {
			rttr.addAttribute("msg", "이미 존재하는 메뉴 코드입니다.");
			rttr.addAttribute("url", "back");
			return "redirect:../redirect";
		}
		myPageMenuService.addMyPageMenu(myPageMenu);
		return "redirect:/admin/mypage";
	}

	// 마이페이지 메뉴 사용 여부 변경
	@GetMapping(value = "/updateMyPageMenuAbled")
	public String updateMyPageMenuAbled(@RequestParam("menu_code") String menu_code) {
		myPageMenuService.updateMyPageMenuAbled(menu_code);
		return "redirect:/admin/mypage";
	}

	// 마이페이지 메뉴 수정 페이지
	@GetMapping(value = "/modifyMyPage")
	public String modifyMyPage(@RequestParam("menu_code") String menu_code, Model model) {
		model.addAttribute("myPage", myPageMenuService.getMyPageMenuInfo(menu_code));
		return "/admin/myPageMenu/modifyMyPageMenu";
	}

	// 마이페이지 메뉴 수정
	@PostMapping(value = "/updateMyPageMenu")
	public String updateMyPageMenu(MyPageMenu myPage) {
		myPageMenuService.updateMyPageMenu(myPage);
		return "redirect:/admin/mypage";
	}

	// 마이페이지 메뉴 삭제
	@GetMapping(value = "/deleteMyPage")
	public String deleteMyPage(@RequestParam("menu_code") String menu_code) {
		myPageMenuService.deleteMyPageMenu(menu_code);
		return "redirect:/admin/mypage";
	}
}
