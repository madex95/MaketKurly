package com.marketkurly.www.item.main.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.item.main.domain.Criteria;
import com.marketkurly.www.item.main.domain.ReviewVO;

@Mapper
public interface ReviewMapper {
	/*리뷰등록*/
	public int enrollreply(ReviewVO review);
	
	/* 댓글 존재 체크 */
	public Integer checkReply(ReviewVO review);
	
	/* 댓글 페이징 */
	public List<ReviewVO> getReplyList(Criteria cri);
	
	/* 댓글 총 갯수(페이징) */
	public int getReplyTotal(String item_code);
	
	/* 댓글 수정 */
	public int updateReply(ReviewVO review);
	
	/* 댓글 한개 정보(수정페이지) */
	public ReviewVO getUpdateReply(String review_id , String review_itemcode);
	
	/* 댓글 삭제 */
	public int deleteReply(String review_id);
	
	public int test();
}
