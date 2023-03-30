package com.marketkurly.www.admin.community.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

import com.marketkurly.www.admin.boardMenu.domain.BoardMenu;
import com.marketkurly.www.admin.community.domain.Board;
import com.marketkurly.www.admin.community.domain.Reply;
import com.marketkurly.www.admin.community.service.CommunityService;

@Controller
@RequestMapping("/admin")
public class CommunityController {
	@Autowired
	CommunityService communityService;

	@GetMapping("/community")
	public String community(Model model, HttpServletRequest request,
			@RequestParam(value = "code", required = false) String code) {
		List<BoardMenu> board = communityService.getBoard();
		model.addAttribute("address", request.getRequestURI());
		model.addAttribute("board", board);
		if (code == null)
			model.addAttribute("boardList", communityService.getBoardList(board));
		else {
			BoardMenu boardMenu = communityService.getBoardAbled(code);
			model.addAttribute("boardAbled", boardMenu);
			model.addAttribute("boardList", communityService.getBoardListCode(code));
			if (boardMenu.getImportant().equals("Y") && communityService.getUnreadBoardAbled())
				model.addAttribute("important", "true");
		}
		return "/admin/community/communityList";
	}

	@GetMapping("/detailboard")
	public String detailBoard(@RequestParam("code") String code, Model model) {
		model.addAttribute("boardAbled", communityService.getBoardReplyAbled(code));
		model.addAttribute("board", communityService.getBoardDetail(code));
		model.addAttribute("replyList", communityService.getReply(code));
		if (communityService.getGrant()) {
			model.addAttribute("delete", "true");
			if (communityService.getAuthorGrant(code))
				model.addAttribute("modify", "true");
		}
		model.addAttribute("id", communityService.getId());
		System.out.println(communityService.getBoardDetail(code).toString());
		return "/admin/community/detailBoard";
	}

	@PostMapping("/insertReply")
	public String insertReply(Reply reply) {
		communityService.insertReply(reply);
		return "redirect:/admin/detailboard?code=" + reply.getReply_boardNum();
	}

	@GetMapping("/writeboard")
	public String writeBoard(@RequestParam("code") String code, Model model) {
		model.addAttribute("code", code);
		return "/admin/community/addBoard";
	}

	@PostMapping("/insertBoard")
	public String insertBoard(@RequestParam("files") List<MultipartFile> files, Board board, HttpServletRequest request,
			RedirectAttributes rttr) {
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMddHHmmss");
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
		String sDate = format1.format(date);
		if (!files.get(0).getOriginalFilename().equals("")) {
			// 이미지 검사
			String name = "";
			for (int i = 0; i < files.size(); i++)
				name += ":" + sDate + "-" + i + files.get(i).getOriginalFilename();
			if (name.getBytes().length > 2000) {
				rttr.addAttribute("이미지가 너무 많습니다.");
				rttr.addAttribute("url", "back");
				return "redirect:../redirect";
			}
			board.setBoard_image(name);
			communityService.insertBoard(request.getServletContext().getRealPath("/resources/image"), files, board,
					format2.format(date).toString(), sDate);
		} else
			communityService.insertBoard(request.getServletContext().getRealPath("/resources/image"), null, board,
					format2.format(date).toString(), sDate);
		return "redirect:/admin/community";
	}

	@GetMapping("/unreadboard")
	public String unreadBoard(@RequestParam("code") String code, Model model) {
		model.addAttribute("boardList", communityService.getMyUnreadBoard(code));
		return "/admin/community/unReadCommunity";
	}

	@GetMapping("/deletecommunity")
	public String deleteCommunity(@RequestParam("code") String code, HttpServletRequest request) {
		communityService.deleteBoard(code, request.getServletContext().getRealPath("/resources/image"));
		return "redirect:/admin/community";
	}

	@GetMapping("/deleteReply")
	public String deleteReplyy(@RequestParam("code") String code, @RequestParam("board_code") String board_code) {
		communityService.deleteReply(code);
		return "redirect:/admin/detailboard?code=" + board_code;
	}

	@GetMapping("/modifycommunity")
	public String modifyCommunity(@RequestParam("code") String code, Model model) {
		model.addAttribute("code", code);
		model.addAttribute("board", communityService.getBoardDetail(code));
		return "/admin/community/modifyBoard";
	}

	@PostMapping("/updateBoard")
	public String updateCommunity(@RequestParam("files") List<MultipartFile> files, Board board,
			RedirectAttributes rttr, HttpServletRequest request, String board_images) {
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMddHHmmss");
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
		String sDate = format1.format(date);
		if (board_images.equals("")) {
			communityService.deleteImage(Integer.toString(board.getBoard_code()),
					request.getServletContext().getRealPath("/resources/image"));
			communityService.updateBoard(request.getServletContext().getRealPath("/resources/image"), null, board,
					format2.format(date).toString(), sDate);
		} else {
			if (!files.get(0).getOriginalFilename().equals("")) {
				// 이미지 검사
				String name = "";
				for (int i = 0; i < files.size(); i++)
					name += ":" + sDate + "-" + i + files.get(i).getOriginalFilename();
				if (name.getBytes().length > 2000) {
					rttr.addAttribute("이미지가 너무 많습니다.");
					rttr.addAttribute("url", "back");
					return "redirect:../redirect";
				}
				board.setBoard_image(name);
				communityService.updateBoard(request.getServletContext().getRealPath("/resources/image"), files, board,
						format2.format(date).toString(), sDate);
			} else
				communityService.updateBoardExcept(board);
		}
		return "redirect:/admin/detailboard?code=" + board.getBoard_code();
	}

	@PostMapping("/updateReply")
	public String updateReply(String code, String reply_code, String reply_content) {
		communityService.updateReply(reply_content, reply_code);
		return "redirect:/admin/detailboard?code=" + code;
	}
}
