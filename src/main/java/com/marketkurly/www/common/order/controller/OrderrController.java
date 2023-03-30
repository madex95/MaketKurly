package com.marketkurly.www.common.order.controller;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.marketkurly.www.common.order.domain.OrderListVO;
import com.marketkurly.www.common.order.domain.OrderVO;
import com.marketkurly.www.common.order.service.OrderItemService;
import com.marketkurly.www.common.user.myPage.myCart.domain.CartListVO;
import com.marketkurly.www.common.user.myPage.myCart.domain.CartVO;
import com.marketkurly.www.common.user.myPage.myCart.service.CartService;

@Controller
public class OrderrController {

	public Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CartService cartservice;
	@Autowired 
	private OrderItemService orderservice;
	
	//주문페이지
	@RequestMapping(value = "/common/order", method = RequestMethod.POST)
	public String postOrder(@RequestParam(value = "chkParam") String chkParam,
							@RequestParam(value = "form_id") String cart_id,
							HttpServletRequest request,
							Model model) throws Exception {
		
		
        String[] code_array = null;
		 
        String code = chkParam.toString();
        code_array = code.split(",");		
        ArrayList<String> chkArray = new ArrayList<String>();
		
        for(int i=0; i <code_array.length; i++){
        	chkArray.add(code_array[i]);
        }
        
        List<CartListVO> cartList = cartservice.chkCart(cart_id, chkArray);
       
        String adrCode =  request.getParameter("address_code");
        String adr =  request.getParameter("address");
        String adrSub =  request.getParameter("address_sub");
        String payDeli =  request.getParameter("payDeli");
        
        logger.info("라스트 "+payDeli);
        
        model.addAttribute("cartList", cartList);
        model.addAttribute("adrCode", adrCode);
        model.addAttribute("adr", adr);
        model.addAttribute("adrSub", adrSub);
        model.addAttribute("payDeli", payDeli);
        
		return "/common/order/orderPage";
	}
	
	
	//결제하면 장바구니에서 삭제
	@RequestMapping(value = "/pay", method = RequestMethod.POST)
	public String payPost(Model model,@RequestParam(value = "codeArray") String codeArray,
						  @RequestParam(value = "form_id") String cart_id,	
						  CartVO vo, OrderVO order
			) throws Exception{
		logger.info("라스트 "+ codeArray);
        String[] new_array = null;
//		 System.out.println(codeArray);
		System.out.println(cart_id);
        System.out.println(vo.toString());
//        System.out.println(order.toString());
        
       //카트넝보 받아오기
//        List<CartListVO> cartList = cartservice.cartCount();
//        int cart_count = Integer.parseInt( request.getParameter("cart_count"));
        /*주소 받아오기*/
        model.addAttribute("order_address",order.getAddress());
//        model.addAttribute("ordate",order.getOrder_date());
//        model.addAttribute("orcode",order.getOrder_code());
        
        //주문날짜,시간,아이디,개수
        OrderVO order2 = orderservice.getInfo();
        order.setOrder_date(order2.getOrder_date());
        order.setOrder_code(order2.getOrder_code());
        order.setOrder_id(cart_id);
       
        
        String code = codeArray.toString();
        new_array = code.split(",");
        for(int i=0 ; i<new_array.length; i++) {
        	System.out.println("====================="+new_array[i]);
        	int order3=  orderservice.getOrderInfo(cart_id , new_array[i]);
        			order.setOrder_itemcode(new_array[i]);
        			order.setOrder_count(order3);
        			//insert
        			orderservice.enrollOrder(order);
        		}
        
        System.out.println(order.toString());
        

        String cart_itemcode;
		logger.info("라스트 "+ cart_id);
		
        for(int i=0; i <new_array.length; i++){
	    	 cart_itemcode=new_array[i];
	    	 vo.setCart_itemcode(cart_itemcode);
	    	 vo.setCart_id(cart_id);
	    	 logger.info(i+"번째 아이템코드는 "+cart_itemcode);
	    	 cartservice.deleteCart(vo);
        }
		
		
		return "redirect:/";
	}
	
	
	
	
	
}
