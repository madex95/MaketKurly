package com.marketkurly.www.common.user.login.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.common.user.domain.UserVO;

@Mapper
public interface LoginMapper {
	
	   //아이디 조회 (로그인)
	   public UserVO readLogin(String user_id);

}
