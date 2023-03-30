package com.marketkurly.www.common.center.notice.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.marketkurly.www.admin.community.domain.Board;
import com.marketkurly.www.common.center.domain.CenterVO;
import com.marketkurly.www.common.center.domain.Criteria;
import com.marketkurly.www.common.center.notice.mapper.NoticeMapper;

@Service
public class NoticeService {

	
	/*
	public static void main(String[] args) { 
	
	}
	*/
	
	
	 @Autowired
	 private NoticeMapper mapper;
	 
	 public Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public List<CenterVO> boardPage(Criteria cri) throws Exception {
		
		return mapper.boardPage(cri);
	}

	
	public int noticeCount(String board_part) throws Exception{
		
		return mapper.noticeCount(board_part);
	}
	
	
	
	//////////////////////////////////////////////////////
	//공지사항 글 등록
	public void regi(String fPath
					,CenterVO cvo
					,@RequestParam("file") MultipartFile[] file
					) throws Exception {
		
		DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String datestr = format.format(Calendar.getInstance().getTime());
		datestr = format.format(new Date());
		Date datee = format.parse(datestr);
		
		
		Date date = new Date(System.currentTimeMillis());
		//SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMddHHmmss"); 
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");

		cvo.setBoard_date(datee);
		
		logger.info("오늘 "+cvo.getBoard_code());
		
		int max = mapper.noticeMax();
		
		//String path = "/resources/image/";
		String path = fPath+"\\center\\notice\\";
		String folderPath = path+format2.format(date);
		File Folder = new File(folderPath);
		
		
		if (!Folder.exists()) {
		    Folder.mkdirs(); //폴더 생성합니다.
		    System.out.println("폴더가 생성되었습니다.");
		}
		
		String name = "";
        for(int i=0; i<file.length; i++) {
        	
        	if(file[i].getOriginalFilename() != "") {
        	name += ":" + i + file[i].getOriginalFilename();
        	cvo.setBoard_image(name);
        	
        	String filePath = folderPath + "/" + max + "-" + i + file[i].getOriginalFilename();
			File uploadFile = new File(filePath);
        	
            logger.debug("================== file start ==================");
            logger.debug("파일 이름: "+file[i].getName());
            logger.debug("파일 실제 이름: "+file[i].getOriginalFilename());
            logger.debug("파일 크기: "+file[i].getSize());
            logger.debug("content type: "+file[i].getContentType());
            logger.debug("================== file   END ==================");
            
            try {
            	file[i].transferTo(uploadFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
            
        	} else {logger.info("파일없음");}
        }
        mapper.regi(cvo);
		//return mapper.regi(cvo);
	}
	
	
	
	//////////////////////////////////////////////////////
	//공지사항 글 내용
	public CenterVO noticeContent(int board_code) throws Exception {

		 return mapper.noticeContent(board_code);
		}

	
	
	//////////////////////////////////////////////////////
	//공지사항 수정 
	public void noticeModify(String fPath, 
							 CenterVO cvo, 
							 @RequestParam("file") MultipartFile[] file,
							 @RequestParam("board_code") int board_code,
							 @RequestParam("up") int up) throws Exception {
		
		Date date = new Date(System.currentTimeMillis());
		//SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMddHHmmss"); 
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd"); 
		
		String path = fPath+"\\center\\notice\\";
		String folderPath = path+format2.format(date);
		File Folder = new File(folderPath);
		
		
		if (!Folder.exists()) {
		    Folder.mkdirs(); //폴더 생성합니다.
		}
		
		String name = "";
		
		//up이 1이면 첨부파일(image) 변경 없음
		//up이 2면 첨부파일(image) 변경 있음
		if(up==1) {
			mapper.noticeModify1(cvo);
		} else {
			
			//기존에 있던 파일들 삭제
			String image = mapper.image(board_code);
				if (mapper.image(board_code) != null) {
					String images[] = image.split(":");
					String basePath = folderPath + "/" + board_code + "-";
					for (int i=0; i<images.length; i++) {
						new File(basePath + images[i]).delete();
					}
				}
				
				//새 파일들 업로드하기
				for(int i=0; i<file.length; i++) {
	        	
	        	if(file[i].getOriginalFilename() != "") {
	        	name += ":" + i + file[i].getOriginalFilename();
	        	cvo.setBoard_image(name);
	        	
				String filePath = folderPath + "/" + board_code + "-" + i + file[i].getOriginalFilename();
				File uploadFile = new File(filePath);
	        	
	            logger.debug("================== file start ==================");
	            logger.debug("파일 이름: "+file[i].getName());
	            logger.debug("파일 실제 이름: "+file[i].getOriginalFilename());
	            logger.debug("파일 크기: "+file[i].getSize());
	            logger.debug("content type: "+file[i].getContentType());
	            logger.debug("================== file   END ==================");
	            
	            try {
	            	file[i].transferTo(uploadFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
	            
	        	} else {logger.info("파일없음");}
	        }
			
			mapper.noticeModify2(cvo);
			
		}
	}
	
	//삭제
	public void noticeDelete(String fPath, int board_code) throws Exception {
		
		//경로지정하기
		Date date = new Date(System.currentTimeMillis());
		//SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMddHHmmss"); 
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd"); 
		
		String path = fPath+"\\center\\notice\\";
		String folderPath = path+format2.format(date);
		
		String image = mapper.image(board_code);
		
		//기존 업로드 파일들 삭제
		if (mapper.image(board_code) != null) {
			String images[] = image.split(":");
			String basePath = folderPath + "/" + board_code + "-";
			for (int i=0; i<images.length; i++) {
				new File(basePath + images[i]).delete();
			}
		}
		
		
		mapper.noticeDelete(board_code);
	}
	
	

}
