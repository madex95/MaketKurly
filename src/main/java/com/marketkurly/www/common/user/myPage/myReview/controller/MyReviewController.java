package com.marketkurly.www.common.user.myPage.myReview.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.marketkurly.www.common.center.domain.CenterVO;
import com.marketkurly.www.common.center.domain.Criteria;
import com.marketkurly.www.common.center.domain.PageMarker;
import com.marketkurly.www.common.security.UserDetail;
import com.marketkurly.www.common.user.myPage.myReview.domain.MyReviewVO;
import com.marketkurly.www.common.user.myPage.myReview.service.MyReviewService;


@Controller
public class MyReviewController {
	
	public Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MyReviewService service;
	
	@GetMapping("common/mypage/myreview")
	public String GetMyReviw(Criteria cri
							 ,Model model 
							 ,HttpServletRequest request) throws Exception {
		
		UserDetail  principal = (UserDetail)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String review_id = principal.getUsername(); 
		cri.setReview_id(review_id);
		
		
		cri.setReview_id(review_id);
		List<MyReviewVO> reviewPage = service.reviewPage(cri);
		model.addAttribute("reviewPage", reviewPage);
		
		
		
		int total = service.reviewCount(review_id);
		PageMarker pageMarker = new PageMarker();
		pageMarker.setCri(cri);
		pageMarker.setTotalCount(total);
		model.addAttribute("pageMarker", pageMarker);
		
	    return "common/myPage/myReview/myReview";
	}
}
