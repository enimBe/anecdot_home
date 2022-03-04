package com.enimbe.anecdot.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.enimbe.anecdot.post.dao.PostDAO;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userID, String title, String content) {
		
		return postDAO.insertPost(userID, title, content);
	}
}
