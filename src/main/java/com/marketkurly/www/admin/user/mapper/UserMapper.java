package com.marketkurly.www.admin.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.admin.grant.domain.Grant;
import com.marketkurly.www.admin.user.domain.User;

@Mapper
public interface UserMapper {
	// 회원
	// 회원 리스트
	List<User> getUserList();

	// 회원 사용여부 변경
	void updateUserAbled(String user_id);

	// 권한 조회
	List<Grant> getGrant();

	// 회원 추가
	void addMember(User user);
}
