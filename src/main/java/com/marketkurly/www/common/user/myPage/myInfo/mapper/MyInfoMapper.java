package com.marketkurly.www.common.user.myPage.myInfo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.common.user.domain.UserVO;


@Mapper
public interface MyInfoMapper {
	
   
   //이메일 조회 (회원가입-이메일중복검사)
   public UserVO readEmail(String user_email);
   
   //이메일 조회 (회원가입-이메일중복검사)
   public UserVO readPw(String user_id);
   
   //핸드폰 조회 (회원가입-핸드폰인증번호받기 시 중복검사)
   public UserVO readPhone(String user_phone);
   
	//회원정보 수정
	public void modifyUser(UserVO vo);
	
	//회원정보 삭제
	public void deleteUser(UserVO vo);
	
}
