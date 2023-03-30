package com.marketkurly.www.admin.community.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marketkurly.www.admin.boardMenu.domain.BoardMenu;
import com.marketkurly.www.admin.community.domain.Board;
import com.marketkurly.www.admin.community.domain.Reply;
import com.marketkurly.www.admin.community.mapper.CommunityMapper;

@Service
public class CommunityService {
	@Autowired
	private CommunityMapper communityMapper;

	// id
	public String getId() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String nowId = "";
		if (principal != null) {
			nowId = auth.getName();
		}
		return nowId;
	}

	public List<BoardMenu> getBoard() {
		return communityMapper.getBoard(getId());
	}

	public List<Board> getBoardList(List<BoardMenu> board) {
		Map<String, Object> boardMenu = new HashedMap();
		boardMenu.put("board", board);
		if (communityMapper.getCommunityGrant(getId(), "community") != null)
			return communityMapper.getBoardList(boardMenu);
		else {
			boardMenu.put("user_id", getId());
			return communityMapper.getMyBoardList(boardMenu);
		}
	}

	public List<Board> getBoardListCode(String code) {
		if (communityMapper.getCommunityGrant(getId(), "community") != null)
			return communityMapper.getBoardListCode(code);
		else
			return communityMapper.getMyBoardListCode(code, getId());
	}

	public Board getBoardDetail(String code) {
		return communityMapper.getBoardDetail(code);
	}

	public BoardMenu getBoardAbled(String code) {
		return communityMapper.getBoardAbled(code);
	}

	public void insertReply(Reply reply) {
		reply.setReply_author(getId());
		communityMapper.insertReply(reply);
	}

	public BoardMenu getBoardReplyAbled(String code) {
		return communityMapper.getBoardReplyAbled(code);
	}

	public List<Reply> getReply(String code) {
		return communityMapper.getReply(code);
	}

	public void insertBoard(String rootPath, List<MultipartFile> files, Board board, String date, String sDate) {
		board.setBoard_id(getId());

		if (files != null) {
			String basePath = rootPath + "/center/" + board.getBoard_part() + "/" + date;
			File Folder = new File(basePath);
			if (!Folder.exists()) {
				Folder.mkdirs(); // 폴더 생성합니다.
				System.out.println("폴더가 생성되었습니다.");
			}
			try {
				for (int i = 0; i < files.size(); i++) {
					String filePath = basePath + "/" + sDate + "-" + i + files.get(i).getOriginalFilename();
					File dest = new File(filePath);
					files.get(i).transferTo(dest);
				}
				communityMapper.insertBoard(board);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		} else
			communityMapper.insertBoard(board);
	}

	public boolean getUnreadBoardAbled() {
		if (communityMapper.getCommunityGrant(getId(), "Unread") != null)
			return true;
		return false;
	}

	public List<Board> getMyUnreadBoard(String code) {
		String user_id = getId();
		if (communityMapper.getCommunityGrant(user_id, "community") != null)
			return communityMapper.getUnreadBoard(code);
		else
			return communityMapper.getMyUnreadBoard(user_id, code);
	}

	public boolean getGrant() {
		if (communityMapper.getCommunityGrant(getId(), "community") != null)
			return true;
		return false;
	}

	public boolean getAuthorGrant(String code) {
		if (communityMapper.getAuthorGrant(code).equals(communityMapper.getMyGrant(getId())))
			return true;
		return false;
	}

	public void deleteBoard(String code, String rootPath) {
		Board board = communityMapper.getImage(code);
		if (board.getBoard_image() != null) {
			String images[] = board.getBoard_image().split(":");
			String basePath = rootPath + "/center/" + board.getBoard_part() + "/" + board.getBoard_date() + "/";
			for (String img : images)
				new File(basePath + img).delete();
		}

		communityMapper.deleteAllReply(code);
		communityMapper.deleteBoard(code);
	}

	public void deleteReply(String code) {
		communityMapper.deleteReply(code);
	}

	public void deleteImage(String code, String rootPath) {
		Board board = communityMapper.getImage(code);
		if (board.getBoard_image() != null) {
			String images[] = board.getBoard_image().split(":");
			String basePath = rootPath + "/center/" + board.getBoard_part() + "/" + board.getBoard_date() + "/";
			for (String img : images)
				new File(basePath + img).delete();
		}
	}

	public void updateBoard(String rootPath, List<MultipartFile> files, Board board, String date, String sDate) {
		board.setBoard_id(getId());

		if (files != null) {
			Board ori_board = communityMapper.getImage(Integer.toString(board.getBoard_code()));
			if (ori_board.getBoard_image() != null) {
				String images[] = ori_board.getBoard_image().split(":");
				String basePath = rootPath + "/center/" + ori_board.getBoard_part() + "/" + ori_board.getBoard_date()
						+ "/";
				for (String img : images)
					new File(basePath + img).delete();
			}
			String basePath = rootPath + "/center/" + ori_board.getBoard_part() + "/" + ori_board.getBoard_date();
			File Folder = new File(basePath);
			if (!Folder.exists()) {
				Folder.mkdirs(); // 폴더 생성합니다.
				System.out.println("폴더가 생성되었습니다.");
			}
			try {
				for (int i = 0; i < files.size(); i++) {
					String filePath = basePath + "/" + sDate + "-" + i + files.get(i).getOriginalFilename();
					File dest = new File(filePath);
					files.get(i).transferTo(dest);
				}
				communityMapper.updateBoard(board);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		} else
			communityMapper.updateBoard(board);
	}

	public void updateBoardExcept(Board board) {
		communityMapper.updateBoardExcept(board);
	}

	public void updateReply(String reply_content, String reply_code) {
		communityMapper.updateReply(reply_content, reply_code);
	}
}
