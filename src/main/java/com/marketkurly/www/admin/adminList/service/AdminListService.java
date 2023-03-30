package com.marketkurly.www.admin.adminList.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marketkurly.www.admin.adminList.mapper.AdminListMapper;


@Service
public class AdminListService {
	@Autowired
	private AdminListMapper adminListMapper;
}
