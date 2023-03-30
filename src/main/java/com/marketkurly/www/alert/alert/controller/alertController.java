package com.marketkurly.www.alert.alert.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class alertController {
	@GetMapping("/redirect")
	public String redirect(@RequestParam("msg")String msg,@RequestParam("url")String url,Model model) {
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "redirect";
	}
	
}
