package com.marketkurly.www.common.center.notice.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.marketkurly.www.common.center.domain.CenterVO;
import com.marketkurly.www.common.center.domain.Criteria;
import com.marketkurly.www.common.center.domain.PageMarker;
import com.marketkurly.www.common.center.notice.service.NoticeService;
import com.marketkurly.www.common.center.question.domain.QuestionVO;
import com.marketkurly.www.common.center.question.service.QuestionService;
import com.marketkurly.www.common.security.UserDetail;


@Controller
public class NoticeController {

	public Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private NoticeService service;
	
	
	@Autowired
	private QuestionService qservice;
	
	
	//공지목록
	@RequestMapping(value = "/center/board", method = RequestMethod.GET)
	public String noticepage(Criteria cri
							 ,Model model 
							 ,HttpServletRequest request) throws Exception {

		String board_part = request.getParameter("board_part").toString();
		String question = "question";
		logger.info("게시판 페이지 목록 얻어오기");
		logger.info("보드파트는 "+board_part);
		
		if (board_part.equals(question)) {
			UserDetail  principal = (UserDetail)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String board_id = principal.getUsername(); 
			cri.setBoard_id(board_id);
			logger.info("아이디 테스트 "+board_id);
		}

		cri.setBoard_part(board_part);
		List<CenterVO> boardPage = service.boardPage(cri);
		model.addAttribute("boardPage", boardPage);
		model.addAttribute("board_part", board_part);
		
		int total = service.noticeCount(board_part);
		PageMarker pageMarker = new PageMarker();
		pageMarker.setCri(cri);
		pageMarker.setTotalCount(total);
		model.addAttribute("pageMarker", pageMarker);
		
		
		
		return "common/center/notice/noticePage";
		
	}

	
	//글쓰기 폼
	@RequestMapping(value = "/regiview", method = RequestMethod.GET)
	public String regiView(Locale locale
						  ,Model model
						  ,HttpServletRequest request) throws Exception {
		
		String board_part = request.getParameter("board_part");
		
		model.addAttribute("board_part", board_part);
		
		return "/regi";
	}
	
	
	//글쓰기
	@RequestMapping(value = "/regi", method = RequestMethod.POST)
	public  String regi(CenterVO cvo,  @RequestParam("file") MultipartFile[] file,
						Locale locale, Model model, 
						HttpServletRequest request) throws Exception {
		
		String board_part = request.getParameter("board_part");

		service.regi(request.getServletContext().getRealPath("/resources/image"), cvo, file) ;
		
		logger.info("나우 "+board_part);
		return "redirect:/center/board?board_part="+board_part;

	}
	
	
	//공지내용 폼
	@RequestMapping(value = "/center/noticecontent", method = RequestMethod.GET)
	public String noticeContent(@RequestParam("board_code") int board_code, Model model) throws Exception {

		CenterVO vo = service.noticeContent(board_code);
		int varReply = qservice.varReply(board_code);
		QuestionVO qvo = qservice.readReply(board_code);
		
		model.addAttribute("noticeContent", vo);
		model.addAttribute("varReply", varReply);
		model.addAttribute("readReply", qvo);
		
		logger.info(board_code+"번의 리플검사는 "+varReply);
		
		return "common/center/notice/noticeContent";
	}
	
	
	
	//수정 겟
	@RequestMapping(value = "/center/noticemodify", method = RequestMethod.GET)
	public String modifyNotice(@RequestParam("board_code") int board_code, Model model) throws Exception {

		CenterVO vo = service.noticeContent(board_code);
		
		model.addAttribute("noticeModify", vo);
		
		return "common/center/notice/noticeModify";
	}

	
	//수정 포스트
	 @RequestMapping(value = "/center/noticemodify", method = RequestMethod.POST)
	 public String postModify(CenterVO vo,
			 				  HttpServletRequest request,
			 				 @RequestParam("file") MultipartFile[] file,
			 				 @RequestParam("board_code") int board_code,
			 				 @RequestParam("up") int up) throws Exception {
		 
	  String board_part = request.getParameter("board_part");
	  service.noticeModify(request.getServletContext().getRealPath("/resources/image"), vo, file, board_code, up);
	  
	  return "redirect:/center/board?board_part="+board_part;
	  
	 }
	
	 
	 
	 // 글 삭제
	 @RequestMapping(value = "/center/noticedelete", method = RequestMethod.GET)
	 public String getDelete(@RequestParam("board_code") int board_code, HttpServletRequest request) throws Exception {
		String board_part = request.getParameter("board_part");
		 
	  service.noticeDelete(request.getServletContext().getRealPath("/resources/image"), board_code);
	  
	  return "redirect:/center/board?board_part="+board_part;
	  
	 }
	 
	 /*
	 // 글 삭제  POST
	 @RequestMapping(value = "/delete", method = RequestMethod.POST)
	 public String postDelete(@RequestParam("board_code") int board_code) throws Exception {
	  logger.info("post delete");
	    
	  service.noticeDelete(board_code);
	  
	  return "redirect:/board/list";
	 }
	*/
	
}
