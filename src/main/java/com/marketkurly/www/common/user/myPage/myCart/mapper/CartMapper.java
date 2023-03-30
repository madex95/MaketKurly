package com.marketkurly.www.common.user.myPage.myCart.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.marketkurly.www.common.user.myPage.myCart.domain.CartListVO;
import com.marketkurly.www.common.user.myPage.myCart.domain.CartVO;

@Mapper
public interface CartMapper {
	public void addCart(CartVO vo) throws Exception;
	
	public int varCart(CartVO vo) throws Exception;
	
	//public int countCart(String cart_id) throws Exception;
	
	public int countPlus(CartVO vo) throws Exception;
	
	public List<CartListVO> readCart(String cart_id) throws Exception;
	
	public void deleteCart(CartVO vo) throws Exception;
	
	public int modifyCount(CartVO vo) throws Exception;
	
	public int cartCount(CartVO vo) throws Exception;
	
	public List<CartListVO> chkCart(@RequestParam("cart_id") String cart_id, @RequestParam("chkArray") ArrayList<String> chkArray) throws Exception;
	
	public int delivery() throws Exception;
}
