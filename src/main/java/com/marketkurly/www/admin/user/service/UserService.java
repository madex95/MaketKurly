package com.marketkurly.www.admin.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marketkurly.www.admin.grant.domain.Grant;
import com.marketkurly.www.admin.user.domain.User;
import com.marketkurly.www.admin.user.mapper.UserMapper;

@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;

	public List<User> getUserList() {
		return userMapper.getUserList();
	}

	public void updateUserAbled(String user_id) {
		userMapper.updateUserAbled(user_id);
	}

	public List<Grant> getGrant() {
		return userMapper.getGrant();
	}

	public void addMember(User user) {
		if (user.getAbled() == null)
			user.setAbled("N");
		userMapper.addMember(user);
	}
}
