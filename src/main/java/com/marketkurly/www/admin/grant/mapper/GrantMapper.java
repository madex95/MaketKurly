package com.marketkurly.www.admin.grant.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.admin.grant.domain.ExGrantAbled;
import com.marketkurly.www.admin.grant.domain.ExGrantAbledList;
import com.marketkurly.www.admin.grant.domain.Grant;
import com.marketkurly.www.admin.grant.domain.GrantAbled;
import com.marketkurly.www.admin.menu.domain.Menu;
import com.marketkurly.www.admin.menu.domain.SubMenu;

@Mapper
public interface GrantMapper {
	// 권한
	// 권한 추가
	void addGrant(Grant grant);

	// 권한 리스트 조회
	List<Grant> getGrantList();

	// 권한 조회
	Grant getGrantInfo(String code);

	// 권한 수정
	void updateGrant(Grant grant);

	// 권한 사용여부 변경
	void updategrantAbled(String code);

	// 메뉴 권한
	// 메뉴 조회
	List<Menu> getMenuList();

	// 소메뉴 조회
	List<SubMenu> getSubMenuList(String menu_code);

	// 소메뉴 코드 조회
	List<String> getSubMenuCodeList();

	// 권한 검사
	int getGrantAbled(GrantAbled grantAbled);

	// 권한 추가
	void insertGrant(GrantAbled grantAbled);

	// 권한 삭제
	void deleteGrant(GrantAbled grantAbled);

	// 기타 권한
	// 권한 목록 조회
	List<String> getGrantAbledAll(String code);

	// 기타 권한 코드 유무 조회
	String getExGrantAbledCount(String code);

	// 기타 권한 추가
	void addExGrantAbled(ExGrantAbled exGrantAbled);

	// 기타 권한 조회
	List<ExGrantAbled> getExGrantAbledList();

	// 기타 권한 코드
	List<String> getExGrantAbledNameList();

	// 권한 검사
	int getExGrantAbled(ExGrantAbledList grantAbled);

	// 권한 추가
	void insertExGrant(ExGrantAbledList grantAbled);

	// 권한 삭제
	void deleteExGrant(ExGrantAbledList grantAbled);

	// 권한 목록 조회
	List<String> getExGrantAbledAll(String code);

	// 기타 권한 조회
	ExGrantAbled getExGrantInfo(String code);

	// 기타 권한 수정
	void updateGrantAbled(ExGrantAbled exGrantAbled);

	// 기타 권한 삭제
	void deleteGrantAbled(String code);

	// 기타 권한 부여 삭제
	void deleteExgrantabledlist(String code);
}
