package com.marketkurly.www.admin.boardMenu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.admin.boardMenu.domain.BoardMenu;

@Mapper
public interface BoardMenuMapper {
	// 게시판 메뉴 추가
	void addBoardMenu(BoardMenu boardMenu);

	// 게시판 메뉴 조회
	List<BoardMenu> getBoardMenuList();

	// 코드 중복 검사
	String exitBoardCode(String menu_code);

	// 게시판 메뉴 사용 여부 변경
	void updateBoardMenuAbled(String menu_code);

	// 게시판 메뉴 조회
	BoardMenu getBoardMenuInfo(String menu_code);

	// 게시판 메뉴 수정
	void updateBoardMenu(BoardMenu boardMenu);

	// 게시판 메뉴 삭제
	void deleteBoardMenu(String menu_code);

	// 게시판 메뉴 댓글 가능 여부 변경
	void updateBoardMenuReplyAbled(String menu_code);

	// 게시판 메뉴 쓰기 가능 여부 변경
	void updateBoardMenuWriteAbled(String menu_code);
	
	// 안 읽은 글 알림 변경
	void updateBoardMenuImportant(String menu_code);
}
