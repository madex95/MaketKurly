package com.marketkurly.www.admin.sales.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marketkurly.www.admin.sales.service.SalesService;

@Controller
@RequestMapping("/admin")
public class SalesController {
	@Autowired
	private SalesService salesService;
	
	//매출 관리
	@GetMapping(value = "/sales")
	public String sales(Model model, HttpServletRequest request) {
		model.addAttribute("address",request.getRequestURI());
		model.addAttribute("salesList",salesService.getSalesItemCount());
		model.addAttribute("dateList",salesService.getDateSales());
		model.addAttribute("monthList",salesService.getMonthSales());
		return "/admin/sales/sales";
	}
	
	//일별 매출 관리
	@GetMapping("/daySales")
	public String daySales(Model model) {
		model.addAttribute("sales",salesService.getAllDaySales());
		return "/admin/sales/daySales";
	}

	//월별 매출 관리
	@GetMapping("/monthSales")
	public String monthSales(Model model) {
		model.addAttribute("sales", salesService.getAllMonthSales());
		return "/admin/sales/monthSales";
	}
}
