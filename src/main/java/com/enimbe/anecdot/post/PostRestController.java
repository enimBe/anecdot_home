package com.enimbe.anecdot.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.enimbe.anecdot.post.bo.PostBO;
import com.enimbe.anecdot.post.model.Post;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	@Autowired
	private PostBO postBO;

	@PostMapping("/create")
	public Map<String, String> create(
			@RequestParam("title") String title,
			@RequestParam("content") String content,
			@RequestParam(value = "image", required = false) MultipartFile image,
			@ModelAttribute Post post,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		Post postResult = postBO.getPost(post.getId());
		int postId = postResult.getId();
		
		Map<String, String> result = new HashMap<>();
		
		int countPost = postBO.addPost(userId, title, content);
		if(image == null) {
			int countImage = postBO.addImage(userId, postId, image);
			
			if(countPost == 1 && countImage == 1) {
				result.put("result", "success");
			} else {
				result.put("result", "fail");
			}
			
		} else {
			
			if(countPost == 1) {
				result.put("result", "success");
			} else {
				result.put("result", "fail");
			}
		}

		return result;
		
	}
	
}