package com.marketkurly.www.common.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


import lombok.RequiredArgsConstructor;

@EnableWebSecurity
@EntityScan
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired
	 private final UserDetailService udService;
	
	  @Override
	  protected void configure(HttpSecurity http) throws Exception {
	    http.authorizeRequests()
	    .antMatchers("/common/mypage/mycart").hasAnyRole("MEMBER","SELLER")// 넓은 범위의 URL을 아래에 배치한다.
//	    .antMatchers("/login").anonymous()
//	    .antMatchers("/customlogout", "/resources/css/**").permitAll()
	    .antMatchers("/**").permitAll()
	    
	    .and()
	    .formLogin()
	    	.loginPage("/common/loginpage")
	    	.loginProcessingUrl("/login")
	    	.defaultSuccessUrl("/")  
            .usernameParameter("user_id")
            .passwordParameter("user_pw")
	     // formLogin: 다른 옵션 설정이 없는 경우 시큐리티가 제공하는 기본 로그인 form 페이지 사용
	    .and()
	    .logout()
	    .and()
	    .csrf().disable();
	    // 로그아웃 기본 url은 (/logout)
	    // 새로 설정하려면 .logoutUrl("url") 사용  
	    
	  }
	  
	    @Bean
	    @Override
	    public AuthenticationManager authenticationManagerBean() throws Exception {
	        return super.authenticationManagerBean();
	    }
	  
	  @Override
	  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//	    auth.inMemoryAuthentication()
//	    .withUser("admin").password(passwordEncoder().encode("admin")).roles("ADMIN")
//	    .and()
//	    .withUser("member").password(passwordEncoder().encode("1234")).roles("GUEST");

		  auth.userDetailsService(udService).passwordEncoder(passwordEncoder());
	  }
	  
	  // passwordEncoder() 추가
	  @Bean
	  public BCryptPasswordEncoder passwordEncoder() {
	    return new BCryptPasswordEncoder();
	  }

	
}
