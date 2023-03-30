package com.marketkurly.www.item.main.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marketkurly.www.item.main.domain.Criteria;
import com.marketkurly.www.item.main.domain.PageDTO;
import com.marketkurly.www.item.main.domain.ReviewPageDTO;
import com.marketkurly.www.item.main.domain.ReviewVO;
import com.marketkurly.www.item.main.mapper.ReviewMapper;

@Service
public class ReviewService {
	@Autowired
	ReviewMapper reviewmapper;
	
	public int test() {
		return reviewmapper.test();
	}
/*리뷰등록*/
	public int enrollreply(ReviewVO review) {
		int result = reviewmapper.enrollreply(review);
		return result;
	}
	/* 댓글 존재 체크 */
	public String checkReply(ReviewVO review) {
Integer result = reviewmapper.checkReply(review);
		
		if(result == 0) {
			return "0";
		} else {
			return "1";
		}
	}
	/* 댓글 페이징 */
	/*
	public List <ReviewVO>  replyList(Criteria cri) {
		 ReviewPageDTO dto = new  ReviewPageDTO();
		dto.setList(reviewmapper.getReplyList(cri));
		dto.setPageinfo(new PageDTO(cri, reviewmapper.getReplyTotal(cri.getItem_code())));
		
		return replyList(cri);
		
		
	} */
	/* 댓글 페이징 */
	public ReviewPageDTO replyList(Criteria cri) {
		ReviewPageDTO dto = new ReviewPageDTO();
		
		dto.setList(reviewmapper.getReplyList(cri));
		dto.setPageinfo(new PageDTO(cri, reviewmapper.getReplyTotal(cri.getItem_code())));
		
		return dto;
	}
		
	/* 댓글 수정 */
	public int updateReply(ReviewVO review) {

		int result = reviewmapper.updateReply(review); 
		
		return result;
	
	}
	
	/* 댓글 한개 정보(수정페이지) */
	public ReviewVO getUpdateReply(String review_id , String review_itemcode) {
		return reviewmapper.getUpdateReply(review_id ,  review_itemcode);
	}

	/* 댓글 삭제 */
	public int deleteReply(ReviewVO review) {

		int result = reviewmapper.deleteReply(review.getReview_id()); 
		
		return result;
		
	}



}



	
