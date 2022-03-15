package com.enimbe.anecdot.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/anecdot/post")
public class PostController {

	@GetMapping("/create")
	public String create() {
		return "post/create";
	}
	
	@GetMapping("/home")
	public String home(
			Model model,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		
		
		
		return "post/home";
	}
}
