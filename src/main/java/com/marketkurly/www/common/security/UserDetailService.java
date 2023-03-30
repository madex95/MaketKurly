package com.marketkurly.www.common.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.marketkurly.www.common.user.domain.UserVO;
import com.marketkurly.www.common.user.login.mapper.LoginMapper;


@Service
public class UserDetailService implements UserDetailsService{

	public Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private LoginMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {
        //여기서 받은 유저 패스워드와 비교하여 로그인 인증
		
		logger.info("로그인 검사 시작");
		
        UserVO vo = mapper.readLogin(user_id);
        
        logger.info("받아온아이디 = "+user_id);
        logger.info("받아온브이오 = "+vo);
        
        if (vo == null){
            throw new UsernameNotFoundException("User not authorized.");
        }
        
        return new UserDetail(vo);
	}

}
