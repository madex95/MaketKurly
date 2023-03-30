package com.marketkurly.www.admin.boardMenu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marketkurly.www.admin.boardMenu.domain.BoardMenu;
import com.marketkurly.www.admin.boardMenu.mapper.BoardMenuMapper;

@Service
public class BoardMenuService {

	@Autowired
	private BoardMenuMapper boardMenuMapper;

	// 게시판 메뉴 추가
	public void addBoardMenu(BoardMenu boardMenu) {
		if (boardMenu.getAbled() == null)
			boardMenu.setAbled("N");

		if (boardMenu.getReply_abled() == null)
			boardMenu.setReply_abled("N");

		if (boardMenu.getWrite_abled() == null)
			boardMenu.setWrite_abled("N");

		if (boardMenu.getImportant() == null)
			boardMenu.setImportant("N");
		boardMenuMapper.addBoardMenu(boardMenu);
	}

	// 게시판 메뉴 조회
	public List<BoardMenu> getBoardMenuList() {
		return boardMenuMapper.getBoardMenuList();
	}

	// 코드 중복 검사
	public String exitBoardCode(String menu_code) {
		return boardMenuMapper.exitBoardCode(menu_code);
	}

	// 게시판 메뉴 사용 여부 변경
	public void updateBoardMenuAbled(String menu_code) {
		boardMenuMapper.updateBoardMenuAbled(menu_code);
	}

	// 게시판 메뉴 조회
	public BoardMenu getBoardMenuInfo(String menu_code) {
		return boardMenuMapper.getBoardMenuInfo(menu_code);
	}

	// 게시판 메뉴 수정
	public void updateBoardMenu(BoardMenu boardMenu) {
		if (boardMenu.getAbled() == null)
			boardMenu.setAbled("N");

		if (boardMenu.getReply_abled() == null)
			boardMenu.setReply_abled("N");

		if (boardMenu.getWrite_abled() == null)
			boardMenu.setWrite_abled("N");

		if (boardMenu.getImportant() == null)
			boardMenu.setImportant("N");
		boardMenuMapper.updateBoardMenu(boardMenu);
	}

	// 게시판 메뉴 삭제
	public void deleteBoardMenu(String menu_code) {
		boardMenuMapper.deleteBoardMenu(menu_code);
	}

	// 게시판 메뉴 댓글 가능 여부 변경
	public void updateBoardMenuReplyAbled(String menu_code) {
		boardMenuMapper.updateBoardMenuReplyAbled(menu_code);
	}

	// 게시판 메뉴 쓰기 가능 여부 변경
	public void updateBoardMenuWriteAbled(String menu_code) {
		boardMenuMapper.updateBoardMenuWriteAbled(menu_code);
	}
	
	// 안 읽은 글 알림 변경
	public void updateBoardMenuImportant(String menu_code) {
		boardMenuMapper.updateBoardMenuImportant(menu_code);
	}
}
