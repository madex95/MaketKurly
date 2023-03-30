package com.marketkurly.www.common.user.myPage.myInfo.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.marketkurly.www.common.security.UserDetailService;
import com.marketkurly.www.common.user.domain.UserVO;
import com.marketkurly.www.common.user.myPage.myInfo.service.MyInfoService;
import com.marketkurly.www.item.main.service.CateService;



@Controller
public class MyInfoController {
	
	public Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MyInfoService service;
	
	@Autowired 
    private BCryptPasswordEncoder pwEncoder;
	
	@Autowired 
    private UserDetailService udService;
	
	@Autowired
	private CateService cateservice;
	
	
	
	

	@RequestMapping(value = "/common/mypage/myinfo", method = RequestMethod.GET)
	public String myinfo(Model model) {
		//카테고리 출력
		//model.addAttribute("cate1",cateservice.getCateCode1());

		
		return "common/myPage/myInfo/myInfo";
	}
	
	//회원수정 비번 확인
	@GetMapping("/pwchk")
	@ResponseBody
	public ResponseEntity<String> pwchk(String id,String pw) {
		logger.info("비번 검사 실행");

		UserVO vo = service.readPw(id);
		
		logger.info("받아온 id = "+id);
		logger.info("받아온 pw = "+pw);
		logger.info("받아온 vo = "+vo);
		
		if (pwEncoder.matches(pw, vo.getUser_pw())) {
			logger.info("비번맞음");
			return new ResponseEntity<>("1", HttpStatus.OK);
		} else {
			logger.info("비번틀림");
			return new ResponseEntity<> ("0", HttpStatus.OK);
		}
	}
	
	//회원수정 비번 확인 통과하면 나오는 수정폼
	@RequestMapping(value = "/ajaxinput", method = RequestMethod.GET)
	public String ajaxinput(Model model) {
		//카테고리 출력
		//model.addAttribute("cate1",cateservice.getCateCode1());
		return "common/myPage/myInfo/ajaxInput";
	}
	
	@PostMapping("/common/mypage/myinfo")
	public String myinfoPost(UserVO vo, 
							HttpSession session) throws Exception {

		
		String inputPass = vo.getUser_pw();
		String pw = pwEncoder.encode(inputPass);
		vo.setUser_pw(pw);
		service.modifyUser(vo);
		
		logger.info("user 데이터 user_id = "+vo.getUser_id());
		logger.info("받아온 pw = "+inputPass);
		logger.info("암호화된 pw = "+pw);
		logger.info("받아온 vo = "+vo);
		 
			
		UserDetails userDetail = udService.loadUserByUsername(vo.getUser_id());
		Authentication authentication = 
				new UsernamePasswordAuthenticationToken(userDetail, null, userDetail.getAuthorities());
		SecurityContext securityContext = SecurityContextHolder.getContext();
		securityContext.setAuthentication(authentication);
		
		session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
		
		return "common/myPage/myInfo/myInfo";
	}
	
	//회원탈퇴페이지
	@RequestMapping(value = "/common/mypage/delete", method = RequestMethod.GET)
	public String delete() {
		return "common/myPage/myInfo/delete";
	}
	
	@PostMapping("/common/mypage/delete")
	public String deletePost(UserVO vo) throws Exception {
		
		service.deleteUser(vo);
		
		SecurityContextHolder.clearContext();

		return "redirect:/";
	}
	

	
}
