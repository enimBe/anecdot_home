package com.enimbe.anecdot.user;

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
	
}
