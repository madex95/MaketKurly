package com.marketkurly.www.common.user.register.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.common.user.domain.UserVO;

@Mapper
public interface RegisterMapper {

	   //아이디 조회 (회원가입-아이디중복검사)
	   public UserVO readId(String user_id);
	   
	   //이메일 조회 (회원가입-이메일중복검사)
	   public UserVO readEmail(String user_email);
	   
	   //이메일 조회 (회원가입-이메일중복검사)
	   public UserVO readPw(String user_id);
	   
	   //핸드폰 조회 (회원가입-핸드폰인증번호받기 시 중복검사)
	   public UserVO readPhone(String user_phone);
	   
	//DB에 유저값 넣기(회원가입-가입성공)
	   public void insertUser(UserVO vo);
	
}
