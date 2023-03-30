package com.marketkurly.www.common.user.myPage.myInfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marketkurly.www.common.user.domain.UserVO;
import com.marketkurly.www.common.user.myPage.myInfo.mapper.MyInfoMapper;



@Service
public class MyInfoService {

    @Autowired
    MyInfoMapper mapper;
	
    //비번 검사 
	public UserVO readPw(String user_id) {
		return mapper.readPw(user_id);
	}
	
	//이메일 조회 
	public UserVO readEmail(String user_email) {
		return mapper.readEmail(user_email);
	}
	
	//헨드폰 조회
	public UserVO readPhone(String user_phone) {
		return mapper.readPhone(user_phone);
	}
	
	//마이페이지 - 회원정보수정
	public void modifyUser(UserVO vo) throws Exception {
		mapper.modifyUser(vo);

	}
	
	//마이페이지 - 회원정보수정 - 회원탈퇴
	public void deleteUser(UserVO vo) throws Exception {
		mapper.deleteUser(vo);

	}
	
}
