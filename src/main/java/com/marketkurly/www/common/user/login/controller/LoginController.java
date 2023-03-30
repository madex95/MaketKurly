package com.marketkurly.www.common.user.login.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class LoginController {

	public Logger logger = LoggerFactory.getLogger(this.getClass());
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String mainPage() {
//		return "main";
//	}
	
	@RequestMapping(value = "/common/loginpage", method = RequestMethod.GET)
	public String login() {
		return "/common/login/loginPage";
	}
	
	@RequestMapping(value = "/common/customlogout", method = RequestMethod.GET)
	public String customlogout() {
		return "redirect:/";
	}
	
}
