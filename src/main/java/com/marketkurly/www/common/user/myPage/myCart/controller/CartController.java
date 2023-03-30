package com.marketkurly.www.common.user.myPage.myCart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.marketkurly.www.common.security.UserDetail;
import com.marketkurly.www.common.user.domain.UserVO;
import com.marketkurly.www.common.user.myPage.myCart.domain.CartListVO;
import com.marketkurly.www.common.user.myPage.myCart.domain.CartVO;
import com.marketkurly.www.common.user.myPage.myCart.mapper.CartMapper;
import com.marketkurly.www.common.user.myPage.myCart.service.CartService;


@Controller
public class CartController {

	public Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CartService service;
	
	// 카트 담기
	@ResponseBody
	@RequestMapping(value = "/addCart", method = RequestMethod.POST)
	public ResponseEntity<String> addCart(CartVO vo,
						String cart_id,
						String cart_itemcode,
						int cart_count) throws Exception {
	 
	// UserVO uvo = (UserVO)session.getAttribute("uvo");
	 
	 //cvo.setCart_id(cart_id);
		int dbCount = service.varCart(vo);
		
		logger.info("테스트테스트 "+cart_id);
		logger.info("테스트테스트 "+dbCount);
		
		if(cart_id==null) {
			return new ResponseEntity<>("1", HttpStatus.OK);
		}else if (cart_count<=0) {
			return new ResponseEntity<>("2", HttpStatus.OK);
		} else if (dbCount == 0) {
			service.addCart(vo);
			return new ResponseEntity<>("3", HttpStatus.OK);
		} else {
			service.addCart(vo);
			return new ResponseEntity<>("4", HttpStatus.OK);
		}
	}
	
	//로그인 유무 확인 후 장바구니 진입
	@RequestMapping(value = "/enterCart")
	@ResponseBody
	public ResponseEntity<String> enterCart(String cart_id) {
		
		logger.info("(테스트) 받아온 id = "+cart_id);

		if (cart_id == null) {
			logger.info("(테스트) id는 null입니다");
			return new ResponseEntity<>("0", HttpStatus.OK);
		} else  {
			logger.info("(테스트) 받아온 id = "+cart_id);
			return new ResponseEntity<> ("1", HttpStatus.OK);
		}
	}
	
	
	// 카트 목록
	@RequestMapping(value = "/common/mypage/mycart", method = RequestMethod.GET)
	public String getCartList(Model model) throws Exception {
	 
		UserDetail  principal = (UserDetail)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String cart_id = principal.getUsername(); 
		
		int deli = service.delivery();
		
		 List<CartListVO> cartList = service.readCart(cart_id);
		 
		 model.addAttribute("cartList", cartList);
		 model.addAttribute("nowDeli", deli);
	 
		return "/common/myPage/myCart/myCart";
	}
	
	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(@RequestParam(value = "chkItem[]") List<String> chArr,
						  @RequestParam(value = "cart_id") String cart_id,
						  CartVO vo) throws Exception {
		
	 logger.info("delete cart");
	 
	 String cart_itemcode;
	 int i;
	 int result = 0;
	 logger.info("삭제 할 횟수 "+chArr.size());
	  
	  for(i=0; i<chArr.size(); i++) {  
		  cart_itemcode=chArr.get(i);
		  vo.setCart_itemcode(cart_itemcode);
		  logger.info(i+"번째 아이템코드는 "+cart_itemcode);
		  service.deleteCart(vo);
	  }   
	  result = 1;
	 
	 return result;  
	}
	
	
	//수량변경
	@ResponseBody
	@RequestMapping(value = "/modifycount", method = RequestMethod.POST)
	public void modifyCount(HttpSession session,
							@RequestParam(value = "cart_itemcode") String cart_itemcode,
							@RequestParam(value = "cart_id") String cart_id,
							@RequestParam(value = "cart_count") int cart_count,
							CartVO vo) throws Exception {
	 
	 
	 service.modifyCount(vo);
	 
	 
	}

	
	
	
}
