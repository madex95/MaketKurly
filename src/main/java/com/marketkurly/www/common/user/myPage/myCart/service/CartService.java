package com.marketkurly.www.common.user.myPage.myCart.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.marketkurly.www.common.user.myPage.myCart.domain.CartListVO;
import com.marketkurly.www.common.user.myPage.myCart.domain.CartVO;
import com.marketkurly.www.common.user.myPage.myCart.mapper.CartMapper;

@Service
public class CartService {
	
	public Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	CartMapper mapper;
	
	public void addCart(CartVO vo) throws Exception{
		
		int cnt = mapper.varCart(vo);
		
		if(cnt==0) {
			mapper.addCart(vo);
		} else {
			mapper.countPlus(vo);
		}
	}
	
	public List<CartListVO> readCart(String cart_id) throws Exception{
		return mapper.readCart(cart_id);
	}
	
	public void deleteCart(CartVO vo) throws Exception{
		mapper.deleteCart(vo);
	}
	
	public int varCart(CartVO vo) throws Exception {
		return mapper.varCart(vo);
	}
	
	public int cartCount(CartVO vo) throws Exception  {
		return mapper.cartCount(vo);
	}
	
	public void modifyCount(CartVO vo) throws Exception {
		mapper.modifyCount(vo);
	}
	
	public List<CartListVO> chkCart(@RequestParam("cart_id") String cart_id, @RequestParam("chkArray") ArrayList<String> chkArray) throws Exception{
		return mapper.chkCart(cart_id, chkArray);
	}
	
	public int delivery() throws Exception{
		return mapper.delivery();
	}

}
