package com.enimbe.anecdot.post.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PostDAO {

	public int insertPost(
			@Param("userID") int userID,
			@Param("title") String title,
			@Param("content") String content);
}
