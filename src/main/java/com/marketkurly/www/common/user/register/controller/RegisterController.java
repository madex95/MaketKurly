package com.marketkurly.www.common.user.register.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.marketkurly.www.common.user.domain.UserVO;
import com.marketkurly.www.common.user.register.service.RegisterService;

@Controller
public class RegisterController {
	
	public Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired 
    private BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private RegisterService service;
	
	@RequestMapping(value = "/common/register", method = RequestMethod.GET)
	public String register() {
		return "/common/register/registerPage";
	}
	
	@PostMapping("/common/register")
	public String registerPost(UserVO vo, HttpServletRequest request) throws Exception {
		
		String inputPass = vo.getUser_pw();
		String pw = pwEncoder.encode(inputPass);
		vo.setUser_pw(pw);
		service.insertUser(vo);
		
	    return "redirect:/common/loginpage";
	}
	
	//아이디 중복 확인
	@GetMapping("/overlap")
	@ResponseBody
	public ResponseEntity<String> overlap(String id) {
		logger.info("아이디 중복 검사 실행");

		UserVO vo = service.readId(id);
		
		logger.info("받아온 id = "+id);
		logger.info("받아온 vo = "+vo);

		if (vo == null) {
			logger.info("사용가능");
			return new ResponseEntity<>("1", HttpStatus.OK);
		} else  {
			logger.info("사용중");
			return new ResponseEntity<> ("0", HttpStatus.OK);
		}
	}
	
	//이메일 중복 확인
	@GetMapping("/email")
	@ResponseBody
	public ResponseEntity<String> email(String email) {
		logger.info("이메일 중복 검사 실행");

		UserVO vo = service.readEmail(email);
		
		logger.info("받아온 email = "+email);
		logger.info("받아온 vo = "+vo);
		
		if (vo == null) {
			logger.info("사용가능");
			return new ResponseEntity<>("1", HttpStatus.OK);
		} else {
			logger.info("사용중");
			return new ResponseEntity<> ("0", HttpStatus.OK);
		}
	}
	
	//핸드폰 중복 확인
	@GetMapping("/phone")
	@ResponseBody
	public ResponseEntity<String> phone(String phone) {
		logger.info("핸드폰 중복 검사 실행");

		UserVO vo = service.readPhone(phone);
		
		logger.info("받아온 phone = "+phone);
		logger.info("받아온 vo = "+vo);

		if (vo == null) {
			logger.info("사용가능");
			return new ResponseEntity<>("1", HttpStatus.OK);
		} else {
			logger.info("사용중");
			return new ResponseEntity<> ("0", HttpStatus.OK);
		}
	}

}
