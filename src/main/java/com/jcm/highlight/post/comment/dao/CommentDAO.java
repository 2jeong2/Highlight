package com.jcm.highlight.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jcm.highlight.post.comment.model.Comment;

@Repository
public interface CommentDAO {

	public int insertComment(
			@Param("postId")int postId,
			@Param("userId")int userId,
			@Param("userName")String userName,
			@Param("content")String content);
	
	
	//DAO에서 @Param으로 comment를 select해와야함
	//근데 어떤 타입으로? List<Comment>로
	//어떤 것을 Param해야하지? comment를 가져오려면 postId를 알아야함
	public List<Comment> selectCommentList(@Param("postId")int postId);
}
