package com.marketkurly.www.common.center.notice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.common.center.domain.CenterVO;
import com.marketkurly.www.common.center.domain.Criteria;

@Mapper
public interface NoticeMapper {
	
	public List<CenterVO> boardPage(Criteria cri) throws Exception;
	
	public int noticeCount(String board_part) throws Exception;
	
	public  int noticeMax() throws Exception;
	
	public  int maxCode() throws Exception;
	
	//public int count() throws Exception;
	
	//public List listPage(int displayPost, int postNum) throws Exception ;
	
	public int regi(CenterVO cvo);
	
	public CenterVO noticeContent(int board_code) throws Exception;
	
	public int oldFileName() throws Exception;
	
	public void noticeModify1(CenterVO cvo) throws Exception;
	
	public void noticeModify2(CenterVO cvo) throws Exception;
	
	public void noticeDelete(int board_code) throws Exception;
	
	public String image(int board_code) throws Exception;
}
