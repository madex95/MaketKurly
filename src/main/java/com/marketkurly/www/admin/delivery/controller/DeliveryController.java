package com.marketkurly.www.admin.delivery.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marketkurly.www.admin.delivery.service.DeliveryService;

@Controller
@RequestMapping("/admin")
public class DeliveryController {
	@Autowired
	DeliveryService deliveryService;

	@GetMapping(value = "/delivery")
	public String delivery(Model model, HttpServletRequest request) {
		model.addAttribute("address", request.getRequestURI());
		model.addAttribute("deliveryPrice", deliveryService.getDeliveryPrice());
		model.addAttribute("deliveryList", deliveryService.getOrderListDelivery());
		model.addAttribute("nowDelivery", deliveryService.getNowDeliveryPrice());
		return "/admin/delivery/delivery";
	}

	@PostMapping(value = "/changeDeliveryPrice")
	public String changeDeliveryPrice(int deliveryPrice) {
		deliveryService.updateDeliveryPrice(deliveryPrice);
		return "redirect:/admin/delivery";
	}
	
	@GetMapping(value = "/deliveryHistory")
	public String deliveryHistory(Model model) {
		model.addAttribute("deliveryPrice", deliveryService.getDeliveryPrice());
		model.addAttribute("history",deliveryService.getDeliveryHistory());
		return "/admin/delivery/deliveryHistory";
	}
	
	@GetMapping(value = "/sellerdelivery")
	public String sellerDelivery(Model model, HttpServletRequest request) {
		model.addAttribute("address", request.getRequestURI());
		model.addAttribute("deliveryPrice", deliveryService.getDeliveryPrice());
		model.addAttribute("deliveryList", deliveryService.getSellerDelivery());
		model.addAttribute("nowDelivery", deliveryService.getNowDeliveryPrice());
		
		return "/admin/delivery/sellerDelivery";
	}
}
