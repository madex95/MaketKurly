package com.marketkurly.www.admin.menu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.admin.grant.domain.GrantAbled;
import com.marketkurly.www.admin.menu.domain.Menu;
import com.marketkurly.www.admin.menu.domain.MenuName;
import com.marketkurly.www.admin.menu.domain.Nav;
import com.marketkurly.www.admin.menu.domain.SubMenu;

@Mapper
public interface MenuMapper {
	// 메뉴
	// 메뉴 코드 유무 검사
	String exitMenuCode(String menu_code);

	// 메뉴 추가
	void addMenu(Menu menu);

	// 메뉴 조회
	List<Menu> getMenuList();

	// 메뉴 코드, 이름 조회
	List<Menu> getMenuNameList();

	// 대메뉴 삭제
	void deleteMenu(String menu_code);

	// 대메뉴 정보 조회
	Menu getMenuInfo(String menu_code);

	// 대메뉴 수정
	void updateMenu(Menu menu);

	// 소메뉴
	// 메뉴 코드 유무 검사
	String exitSubMenuCode(String menu_code);

	// 소메뉴 추가
	void addSubMenu(SubMenu subMenu);

	// 소메뉴 조회
	List<SubMenu> getSubMenuList(String menu_code);

	// 소메뉴 이름 조회
	List<Nav> getSubMenuNameList(GrantAbled grantAbled);

	// 대메뉴 삭제 시 모든 소메뉴 삭제
	void deleteAllSubMenu(String menu_code);

	// 소메뉴 삭제
	void deleteSubMenu(String menu_code);

	// 소메뉴 정보 조회
	SubMenu getSubMenuInfo(String menu_code);

	// 소메뉴 수정
	void updateSubMenu(SubMenu subMenu);

	// 대메뉴, 소메뉴 이름 조회
	MenuName getSubMenuName(String menu_address);

	// 대메뉴 수정, 삭제 가능 여부 조회
	String getUpdateAbled(String menu_code);

	// 대메뉴 사용 여부 변경
	void updateMenuAbled(String menu_code);

	// 소메뉴 수정, 삭제 가능 여부 조회
	String getSubUpdateAbled(String menu_code);

	// 소메뉴 사용 여부 변경
	void updateSubMenuAbled(String menu_code);

	// 권한 검사
	String getGrant(String id);
}
