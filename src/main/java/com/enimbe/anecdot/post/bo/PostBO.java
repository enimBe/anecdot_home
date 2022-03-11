package com.enimbe.anecdot.post.bo;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.enimbe.anecdot.common.FileManagerService;
import com.enimbe.anecdot.post.dao.PostDAO;
import com.enimbe.anecdot.post.model.Post;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String title, String content) {
		
		Post post = new Post();
		post.setId(userId);
		post.setTitle(title);
		post.setContent(content);
		
		return postDAO.insertPost(post);
	}
	
	public Post getPost(int id) {
		return postDAO.selectPost(id);
	}
	
	public int addImage(int userId, int postId, MultipartFile image) {
		 
		String imagePath = FileManagerService.saveFile(userId, postId, image);
		
		return postDAO.insertImage(userId, postId, imagePath);
	}
	
}