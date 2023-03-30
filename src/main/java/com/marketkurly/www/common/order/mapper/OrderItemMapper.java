package com.marketkurly.www.common.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marketkurly.www.common.order.domain.OrderListVO;
import com.marketkurly.www.common.order.domain.OrderVO;
import com.marketkurly.www.common.user.myPage.myCart.domain.CartListVO;

@Mapper
public interface OrderItemMapper {
	/* 카트개수 */
	public Integer getOrderInfo(String cart_id, String cart_itemcode);
	/* 주문 테이블 등록 */
	public Integer enrollOrder(OrderVO order);
	/*주문시간 , 코드 가져오기*/
	public OrderVO getInfo ();
}
