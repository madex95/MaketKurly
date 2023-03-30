package com.marketkurly.www.admin.adminList.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marketkurly.www.admin.adminList.service.AdminListService;


@Controller
@RequestMapping("/admin")
public class AdminListController {
	@Autowired
	private AdminListService adminListService;
	
	//관리자 관리
	@GetMapping(value = "/adminlist")
	public String adminlist(Model model, HttpServletRequest request) {
		model.addAttribute("address",request.getRequestURI());
		return "/admin/adminList/adminList";
	}
}
