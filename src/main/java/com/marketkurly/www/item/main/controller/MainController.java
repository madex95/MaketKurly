package com.marketkurly.www.item.main.controller;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.marketkurly.www.common.user.domain.UserVO;
import com.marketkurly.www.item.main.domain.Criteria;
import com.marketkurly.www.item.main.domain.ItemVO;
import com.marketkurly.www.item.main.domain.PageDTO;
import com.marketkurly.www.item.main.domain.ReviewPageDTO;
import com.marketkurly.www.item.main.domain.ReviewVO;
import com.marketkurly.www.item.main.mapper.ReviewMapper;
import com.marketkurly.www.item.main.service.CateService;
import com.marketkurly.www.item.main.service.ItemListService;
import com.marketkurly.www.item.main.service.ReviewService;
import com.marketkurly.www.item.main.service.WelcomeWebService;

@Controller

public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired
	private CateService cateservice;
	@Autowired
	private WelcomeWebService welcomewebservice;
	@Autowired
	private ItemListService itemlistservice;
	@Autowired
    private ReviewService reviewservice;

	@GetMapping("/header")
	public String header(Model model , Criteria cri) {
		//카테고리 출력
		model.addAttribute("cate1",cateservice.getCateCode1(cri));
		return "includes/admin2/header";
	}
	
	@GetMapping("/footer")
	public String footer() {
		return "includes/admin2/footer";
	}
	
	@GetMapping("/")
	public String mainPageGET(Model model) {
		String grant = welcomewebservice.grant();
		System.out.println(grant);
		if(grant == null || grant.equals("MEMBER")) {
			logger.info("메인페이지진입");
			//카테고리 출력
	//		model.addAttribute("cate1",cateservice.getCateCode1());
			//상품 DTO에서 메인페이지에 출력할 상품명, 가격 정보
			model.addAttribute("list",welcomewebservice.selectWelcomeWebServiceList());
	//		System.out.println(welcomewebservice.selectWelcomeWebServiceList().get(0).getItem_code());
			return "item/main";
		}
		else return "redirect:/admin/itemlist";
	}
	//이미지출력
	/*@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		File file = new File("C:\\Users\\UCSSYSTEM\\Desktop\\item\\2022-01-24\\" + fileName);
	ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		return result;
		
	}*/
	
	/*카테고리 누르면 상품 목록 페이지 이동*/
	@GetMapping("/itemlist/category")
	public String goodsListGET(@RequestParam("code")String code, Model model , Criteria cri ) throws Exception {
		System.out.println("============");
		System.out.println(cri.toString());
		model.addAttribute("list",welcomewebservice.selectWelcomeWebServiceList());
		//상품출력
		model.addAttribute("list2",welcomewebservice.cateitemlist(code, cri));
		System.out.println(welcomewebservice.cateitemlist(code, cri).size());
		System.out.println(code);
		/*페이징 */
		List<ItemVO> list2 = itemlistservice.GetitemList2(cri);
		PageDTO pageDTO = new PageDTO(cri, itemlistservice.itemGetTotal2(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, itemlistservice.itemGetTotal2(cri)));
	
		logger.info("goodsListGET()..........");
		return "item/itemlist";
		
	}

	/* 상품 상세 */
	@GetMapping("/itemdetail/{item_code}")
	public String goodsDetailGET(@PathVariable("item_code")String item_code,Model model, Criteria cri , ReviewVO review) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();
		String nowId = "";
		if (principal != null) {
			nowId = auth.getName();
		}
		review.setReview_id(nowId);
		model.addAttribute("id",nowId);
		logger.info("goodsDetailGET()..........");
		//상품출력
       model.addAttribute("list3",welcomewebservice.detailpage(item_code));
		//리뷰
//		List<ReviewVO> reviews =  reviewservice.replyList(cri);
//		System.out.println("================="+cri.toString());
//		model.addAttribute("reviews",reviews);
       System.out.println("=================");
       System.out.println("========"+nowId);
		return "item/itemdetail";
	}

/*상품검색*/
	@GetMapping("search")
	public String searchItemGET(Criteria cri, Model model, String code,String item_name) throws Exception {
		//상품출력
		model.addAttribute("list",welcomewebservice.search(item_name));
		logger.info("cri:"+cri);
		List<ItemVO> list = itemlistservice.GetitemList(cri);
		System.out.println(list.size());
	
		logger.info("pre list : " + list);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			logger.info("list : " + list);
		} else {
			model.addAttribute("listcheck", "empty");
			
			return "item/search";
		}
		System.out.println(list.size());
		PageDTO pageDTO = new PageDTO(cri, itemlistservice.itemGetTotal(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, itemlistservice.itemGetTotal(cri)));
		//model.addAttribute("filter_info", itemlistservice.getCateInfoList(cri));
		 System.out.println(pageDTO.toString());
		return "item/search";
		
	}

	/* 리뷰 쓰기 */
	
	@GetMapping("/review_enroll")
	public String replyEnrollWindowGET (@RequestParam("item_code")String item_code, Model model) {
		ItemVO item = itemlistservice.getItemCode(item_code);
		model.addAttribute("list3", item);
		//System.out.println(itemlistservice.getItemCode(item_code));
		return "item/review_enroll";
	}
	/* 리뷰 수정 팝업창 */
	@GetMapping("/replyUpdate")
	public String replyUpdateWindowGET(@RequestParam("item_code")String item_code,ReviewVO review, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();
		String nowId = "";
		if (principal != null) {
			nowId = auth.getName();
		}
		review.setReview_id(nowId);
		
		ItemVO item = itemlistservice.getItemCode(item_code);
	
		model.addAttribute("list3", item);
		model.addAttribute("replyInfo", reviewservice.getUpdateReply(review.getReview_id(), item_code));
	
//		model.addAttribute("memberId", review.getReview_id());
		
		return "item/replyUpdate";
	}

	
	
	/* 댓글 페이징 */
	@GetMapping(value="/list", produces = MediaType.APPLICATION_JSON_VALUE)
	public ReviewPageDTO replyListPOST(Criteria cri) {
		return reviewservice.replyList(cri);
	}



	
	@GetMapping("/order")
	public String order() {
		return "item/orderpage";
	}








}
