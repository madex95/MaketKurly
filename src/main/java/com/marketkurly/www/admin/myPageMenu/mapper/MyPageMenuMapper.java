package com.marketkurly.www.admin.myPageMenu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.admin.myPageMenu.domain.MyPageMenu;

@Mapper
public interface MyPageMenuMapper {
	// 마이페이지 메뉴 추가
	void addMyPageMenu(MyPageMenu myPageMenu);

	// 마이페이지 메뉴 조회
	List<MyPageMenu> getMyPageMenuList();

	// 코드 중복 검사
	String exitMyPageCode(String menu_code);

	// 마이페이지 메뉴 사용 여부 변경
	void updateMyPageMenuAbled(String menu_code);

	// 마이페이지 메뉴 조회
	MyPageMenu getMyPageMenuInfo(String menu_code);

	// 마이페이지 메뉴 수정
	void updateMyPageMenu(MyPageMenu myPageMenu);

	// 마이페이지 메뉴 삭제
	void deleteMyPageMenu(String menu_code);
}
