package com.marketkurly.www.admin.community.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.admin.boardMenu.domain.BoardMenu;
import com.marketkurly.www.admin.community.domain.Board;
import com.marketkurly.www.admin.community.domain.Reply;

@Mapper
public interface CommunityMapper {
	// 커뮤니티 목록 가져오기
	List<BoardMenu> getBoard(String user_id);

	// 게시판 목록 가져오기
	List<Board> getBoardList(Map<String, Object> boardMenu);

	// 특정 게시판 목록 가져오기
	List<Board> getBoardListCode(String code);

	// 커뮤니티 권한 검사
	String getCommunityGrant(String user_id, String grant);

	// 판매자 게시판 목록 가져오기
	List<Board> getMyBoardList(Map<String, Object> boardMenu);

	// 판매자 특정 게시판 목록 가져오기
	List<Board> getMyBoardListCode(String code, String user_id);

	// 게시판 상세
	Board getBoardDetail(String code);

	// 목록 댓글, 쓰기 가능 정보
	BoardMenu getBoardAbled(String code);

	// 답글 등록
	void insertReply(Reply reply);

	// 댓글 가능 정보
	BoardMenu getBoardReplyAbled(String code);

	// 댓글 조회
	List<Reply> getReply(String code);

	// 안 읽은 글 조회
	List<Board> getUnreadBoard(String code);

	// 판매자 안 읽은 글 조회
	List<Board> getMyUnreadBoard(String user_id, String code);

	// 판매자 조회
	String getSeller(String code);

	// 글쓴이 권한
	String getAuthorGrant(String code);

	// 아이디 권한
	String getMyGrant(String code);

	// 글 추가
	void insertBoard(Board board);

	// 글 삭제
	void deleteBoard(String code);

	// 글 삭제 시 댓글 삭제
	void deleteAllReply(String code);

	// 글 이미지 조회
	Board getImage(String code);

	// 댓글 삭제
	void deleteReply(String code);

	// 글 수정
	void updateBoard(Board board);

	// 이미지 제외 글 수정
	void updateBoardExcept(Board board);

	// 답글 수정
	void updateReply(String reply_content, String reply_code);
}
