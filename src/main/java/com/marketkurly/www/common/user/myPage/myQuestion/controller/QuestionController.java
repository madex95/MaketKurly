package com.marketkurly.www.common.user.myPage.myQuestion.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class QuestionController {

	// 카트 목록
	@RequestMapping(value = "/common/mypage/myquestion", method = RequestMethod.GET)
	public String getCartList(Model model) throws Exception {
	 

	 
		return "/common/myPage/myQuestion/questionPage";
	}
	
}
