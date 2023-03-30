package com.marketkurly.www.admin.myPageMenu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marketkurly.www.admin.myPageMenu.domain.MyPageMenu;
import com.marketkurly.www.admin.myPageMenu.mapper.MyPageMenuMapper;

@Service
public class MyPageMenuService {
	@Autowired
	private MyPageMenuMapper myPageMenuMapper;

	// 마이페이지 메뉴 추가
	public void addMyPageMenu(MyPageMenu myPageMenu) {
		if (myPageMenu.getAbled() == null)
			myPageMenu.setAbled("N");
		myPageMenuMapper.addMyPageMenu(myPageMenu);
	}

	// 마이페이지 메뉴 조회
	public List<MyPageMenu> getMyPageMenuList() {
		return myPageMenuMapper.getMyPageMenuList();
	}

	// 코드 중복 검사
	public String exitMyPageCode(String menu_code) {
		return myPageMenuMapper.exitMyPageCode(menu_code);
	}

	// 마이페이지 메뉴 사용 여부 변경
	public void updateMyPageMenuAbled(String menu_code) {
		myPageMenuMapper.updateMyPageMenuAbled(menu_code);
	}

	// 마이페이지 메뉴 조회
	public MyPageMenu getMyPageMenuInfo(String menu_code) {
		return myPageMenuMapper.getMyPageMenuInfo(menu_code);
	}

	// 마이페이지 메뉴 수정
	public void updateMyPageMenu(MyPageMenu myPageMenu) {
		if (myPageMenu.getAbled() == null)
			myPageMenu.setAbled("N");
		myPageMenuMapper.updateMyPageMenu(myPageMenu);
	}

	// 마이페이지 메뉴 삭제
	public void deleteMyPageMenu(String menu_code) {
		myPageMenuMapper.deleteMyPageMenu(menu_code);
	}
}
