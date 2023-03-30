package com.marketkurly.www.common.center.question.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.common.center.question.domain.QuestionVO;

@Mapper
public interface QuestionMapper {
	public int varReply(int board_code) throws Exception;
	
	public QuestionVO readReply(int board_code) throws Exception;
}
