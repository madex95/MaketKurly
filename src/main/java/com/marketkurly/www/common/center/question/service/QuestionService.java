package com.marketkurly.www.common.center.question.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marketkurly.www.common.center.domain.CenterVO;
import com.marketkurly.www.common.center.question.domain.QuestionVO;
import com.marketkurly.www.common.center.question.mapper.QuestionMapper;


@Service
public class QuestionService {
	

	public Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	QuestionMapper mapper;
	
	public int varReply(int board_code) throws Exception{
		return mapper.varReply(board_code);
		}
	
	public QuestionVO readReply(int board_code) throws Exception {

		 return mapper.readReply(board_code);
		}
	
}
