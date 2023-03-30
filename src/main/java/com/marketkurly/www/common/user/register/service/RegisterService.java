package com.marketkurly.www.common.user.register.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marketkurly.www.common.user.domain.UserVO;
import com.marketkurly.www.common.user.register.mapper.RegisterMapper;


@Service
public class RegisterService {

	@Autowired
    RegisterMapper mapper;
	
    //아이디 조회 (회원가입-아이디중복검사에 쓰임)
	public UserVO readId(String user_id) {
		return mapper.readId(user_id);
	}
	
    //아이디 조회 (회원가입-아이디중복검사에 쓰임)
	public UserVO readPw(String user_id) {
		return mapper.readPw(user_id);
	}
	
	//이메일 조회 (회원가입-이메일중복검사에 쓰임)
	public UserVO readEmail(String user_email) {
		return mapper.readEmail(user_email);
	}
	
	//헨드폰조회(회원가입-핸드폰인증번호 받기 시 중복검사)
	public UserVO readPhone(String user_phone) {
		return mapper.readPhone(user_phone);
	}
	
	//회원가입
	public void insertUser(UserVO vo) throws Exception {
		mapper.insertUser(vo);
	}
	
}
