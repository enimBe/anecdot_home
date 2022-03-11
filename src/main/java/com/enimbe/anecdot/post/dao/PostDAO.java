package com.enimbe.anecdot.post.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.enimbe.anecdot.post.model.Post;

@Repository
public interface PostDAO {

	public int insertPost(Post post);
	
	public Post selectPost(@Param("id") int id);
	
	public int insertImage(
			@Param("userId") int userId,
			@Param("postId") int postId,
			@Param("imagePath") String imagePath
			);
	
}