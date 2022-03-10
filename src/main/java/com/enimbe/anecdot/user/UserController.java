package com.enimbe.anecdot.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/anecdot/user")
public class UserController {

	@GetMapping("/signup")
	public String signup() {
		return "user/signup";
	}
	
	@GetMapping("/login")
	public String signin() {
		return "user/signin";
	}
	
	@GetMapping("/signout")
	public String signout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("userUserID");
		session.removeAttribute("userName");
		
		return "redirect:/anecdot/user/login";
	}
}
