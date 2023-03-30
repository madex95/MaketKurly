package com.marketkurly.www.admin.boardMenu.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.marketkurly.www.admin.boardMenu.domain.BoardMenu;
import com.marketkurly.www.admin.boardMenu.service.BoardMenuService;

@Controller
@RequestMapping("/admin")
public class BoardMenuController {
	@Autowired
	private BoardMenuService boardMenuService;

	// 게시판 메뉴 관리
	@GetMapping(value = "/board")
	public String board(Model model, HttpServletRequest request) {
		model.addAttribute("address", request.getRequestURI());
		model.addAttribute("menuList", boardMenuService.getBoardMenuList());
		return "/admin/boardMenu/boardMenu";
	}

	// 게시판 메뉴 추가 페이지
	@GetMapping(value = "/addBoardMenu")
	public String addBoardMenu(Model model) {
		return "/admin/boardMenu/addBoardMenu";
	}

	// 게시판 메뉴 추가 페이지
	@PostMapping(value = "/insertBoardMenu")
	public String insertBoardMenu(BoardMenu boardMenu, RedirectAttributes rttr) {
		if (boardMenuService.exitBoardCode(boardMenu.getMenu_code()) != null) {
			rttr.addAttribute("msg", "이미 존재하는 메뉴 코드입니다.");
			rttr.addAttribute("url", "back");
			return "redirect:../redirect";
		}
		boardMenuService.addBoardMenu(boardMenu);
		return "redirect:/admin/board";
	}

	// 게시판 메뉴 사용 여부 변경
	@GetMapping(value = "/updateBoardMenuAbled")
	public String updateBoardMenuAbled(@RequestParam("menu_code") String menu_code) {
		boardMenuService.updateBoardMenuAbled(menu_code);
		return "redirect:/admin/board";
	}

	// 게시판 메뉴 수정 페이지
	@GetMapping(value = "/modifyBoardMenu")
	public String modifyBoardMenu(@RequestParam("menu_code") String menu_code, Model model) {
		model.addAttribute("board", boardMenuService.getBoardMenuInfo(menu_code));
		return "/admin/boardMenu/modifyBoardMenu";
	}

	// 게시판 메뉴 수정
	@PostMapping(value = "updateBoardMenu")
	public String updateBoardMenu(BoardMenu boardMenu) {
		boardMenuService.updateBoardMenu(boardMenu);
		return "redirect:/admin/board";
	}

	// 게시판 메뉴 삭제
	@GetMapping(value = "deleteBoardMenu")
	public String deleteBoardMenu(String menu_code) {
		boardMenuService.deleteBoardMenu(menu_code);
		return "redirect:/admin/board";
	}

	// 게시판 메뉴 댓글 가능 여부 변경
	@GetMapping(value = "/updateBoardMenuReplyAbled")
	public String updateBoardMenuReplyAbled(@RequestParam("menu_code") String menu_code) {
		boardMenuService.updateBoardMenuReplyAbled(menu_code);
		return "redirect:/admin/board";
	}

	// 게시판 메뉴 쓰기 가능 여부 변경
	@GetMapping(value = "/updateBoardMenuWriteAbled")
	public String updateBoardMenuWriteAbled(@RequestParam("menu_code") String menu_code) {
		boardMenuService.updateBoardMenuWriteAbled(menu_code);
		return "redirect:/admin/board";
	}
	
	// 게시판 메뉴 안 읽은 글 알림 변경
	@GetMapping(value = "/updateBoardMenuImportant")
	public String updateBoardMenuImportant(@RequestParam("menu_code") String menu_code) {
		boardMenuService.updateBoardMenuImportant(menu_code);
		return "redirect:/admin/board";
	}
}
