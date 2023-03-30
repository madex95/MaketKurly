package com.marketkurly.www.common.user.myPage.myReview.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.common.center.domain.Criteria;
import com.marketkurly.www.common.user.myPage.myReview.domain.MyReviewVO;

@Mapper
public interface MyReviewMapper {
	
	public List<MyReviewVO> reviewPage(Criteria cri) throws Exception;
	
	public int reviewCount(String review_id) throws Exception;

}
