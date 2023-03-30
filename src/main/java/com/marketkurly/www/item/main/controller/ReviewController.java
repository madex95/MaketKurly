package com.marketkurly.www.item.main.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.marketkurly.www.item.main.domain.ReviewVO;
import com.marketkurly.www.item.main.domain.Criteria;
import com.marketkurly.www.item.main.domain.ItemVO;
import com.marketkurly.www.item.main.domain.PageDTO;
import com.marketkurly.www.item.main.domain.ReviewPageDTO;
import com.marketkurly.www.item.main.mapper.AttachMapper;
import com.marketkurly.www.item.main.service.CateService;
import com.marketkurly.www.item.main.service.ItemListService;
import com.marketkurly.www.item.main.service.ItemService;
import com.marketkurly.www.item.main.service.ReviewService;
import com.marketkurly.www.item.main.service.WelcomeWebService;
@RestController	
@RequestMapping("/reply")
public class ReviewController {
	
@Autowired
private ReviewService reviewservice;

/*리뷰등록*/
@PostMapping("/enroll")
public void enrollreplyPost(ReviewVO review) {
	System.out.println("1======="+reviewservice.test());
	//System.out.println(review.toString());
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	String nowId = "";
	if (principal != null) {
		nowId = auth.getName();
	}
	System.out.println("2======="+reviewservice.test());
	review.setReview_id(nowId);
	reviewservice.enrollreply(review);
	System.out.println("3======="+reviewservice.test());
}

/* 댓글 체크 */
/* review_itemcode 파라미터 */
/* 존재 : 1 / 존재x : 0 */
@PostMapping("/check")
public String replyCheckPOST(ReviewVO review , Model model) {
	System.out.println(review.toString());
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	String nowId = "";
	if (principal != null) {
		nowId = auth.getName();
	}
	
	review.setReview_id(nowId);
	//model.addAttribute("reviewid",nowId);

	return reviewservice.checkReply(review);
}

/* 댓글 페이징 */
@GetMapping(value="/list", produces = MediaType.APPLICATION_JSON_VALUE)
public ReviewPageDTO replyListPOST(Criteria cri, Model model) {
	model.addAttribute("re",reviewservice.replyList(cri));
	return (ReviewPageDTO) reviewservice.replyList(cri);
	}
/* 댓글 수정 */
@PostMapping("/update")
public void replyModifyPOST(ReviewVO review , Model model) {
	
//	System.out.println(review.toString());
		reviewservice.updateReply(review);
}


/* 댓글 삭제 */

@PostMapping("/delete")
public void replyDeletePOST(ReviewVO review) {
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	String nowId = "";
	if (principal != null) {
		nowId = auth.getName();
	}
	review.setReview_id(nowId);

	reviewservice.deleteReply(review);
}









}
