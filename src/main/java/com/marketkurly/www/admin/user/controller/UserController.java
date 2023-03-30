package com.marketkurly.www.admin.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marketkurly.www.admin.user.domain.User;
import com.marketkurly.www.admin.user.service.UserService;

@Controller
@RequestMapping("/admin")
public class UserController {
	@Autowired
	UserService userService;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	// 회원 관리
	@GetMapping(value = "/userlist")
	public String userlist(Model model, HttpServletRequest request) {
		List<User> userList = userService.getUserList();
		model.addAttribute("userList", userList);
		model.addAttribute("address", request.getRequestURI());
		return "/admin/user/userList";
	}

	// 회원 사용여부 변경
	@GetMapping(value = "/updateUserAbled")
	public String updateUserAbled(@RequestParam("user_id") String user_id) {
		userService.updateUserAbled(user_id);
		return "redirect:/admin/userlist";
	}

	// 회원 추가 페이지
	@GetMapping(value = "/register")
	public String register(Model model) {
		model.addAttribute("grant", userService.getGrant());
		return "/admin/user/register";
	}

	// 회원 추가
	@PostMapping(value = "/addMember")
	public String addMember(User user) {
		System.out.println(user.toString());
		user.setUser_pw(pwEncoder.encode(user.getUser_pw()));
		userService.addMember(user);
		return "redirect:/admin/userlist";
	}
}
