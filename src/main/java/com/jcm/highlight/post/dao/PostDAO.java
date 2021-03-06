package com.jcm.highlight.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jcm.highlight.post.model.Post;



@Repository
public interface PostDAO {

	public int insertPost(
			@Param("userId")int userId,
			@Param("content")String content,
			@Param("userName")String userName,
			@Param("imagePath")String imagePath);
			
	
	public List<Post> selectPostList();
	
	public int deletePost(@Param("postId")int postId);
	
	public Post selectPost(@Param("postId")int postId);
	
	
}
