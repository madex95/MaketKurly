package com.marketkurly.www.common.user.myPage.myReview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marketkurly.www.common.center.domain.Criteria;
import com.marketkurly.www.common.user.myPage.myReview.domain.MyReviewVO;
import com.marketkurly.www.common.user.myPage.myReview.mapper.MyReviewMapper;

@Service
public class MyReviewService {
	
	 @Autowired
	 private MyReviewMapper mapper;
	
	
	public List<MyReviewVO> reviewPage(Criteria cri) throws Exception {
		
		return mapper.reviewPage(cri);
	}
	
	
	public int reviewCount(String review_id) throws Exception{
		
		return mapper.reviewCount(review_id);
	}
}
