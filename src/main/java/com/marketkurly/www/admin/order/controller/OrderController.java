package com.marketkurly.www.admin.order.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marketkurly.www.admin.order.service.OrderService;

@Controller
@RequestMapping("/admin")
public class OrderController {
	@Autowired
	private OrderService orderService;

	// 주문 내역 관리
	@GetMapping(value = "/orderlist")
	public String orderlist(Model model, HttpServletRequest request) {
		model.addAttribute("address", request.getRequestURI());
		model.addAttribute("orderList",orderService.getOrderList());
		return "/admin/order/orderList";
	}
	
	// 주문 취소
	@GetMapping(value = "/orderCancel")
	public String orderCancel(@RequestParam("") String order_code, @RequestParam("item_code") String item_code) {
		orderService.orderCancel(order_code, item_code);
		return "redirect:/admin/orderlist";
	}
}
