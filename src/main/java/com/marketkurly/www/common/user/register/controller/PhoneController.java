package com.marketkurly.www.common.user.register.controller;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.marketkurly.www.common.user.register.service.PhoneService;

import net.nurigo.java_sdk.Coolsms;

@Controller
public class PhoneController {
	
	@Autowired
    private  PhoneService service; // final 추가

	public Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam(value="phone") String phone)	 { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성

		service.certifiedPhoneNumber(phone,randomNumber);
		
		logger.info("폰인증 실시1 받아온 폰넘버 = " + phone);
		logger.info("폰인증 실시1 받아온 랜덤넘버 = " + randomNumber);
		
		return Integer.toString(randomNumber);
	}
	

}
