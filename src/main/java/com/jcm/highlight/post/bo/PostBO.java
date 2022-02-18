package com.jcm.highlight.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jcm.highlight.common.FileManagerService;
import com.jcm.highlight.post.comment.bo.CommentBO;
import com.jcm.highlight.post.comment.model.Comment;
import com.jcm.highlight.post.dao.PostDAO;
import com.jcm.highlight.post.like.bo.LikeBO;
import com.jcm.highlight.post.model.Post;
import com.jcm.highlight.post.model.PostDetail;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	private CommentBO commentBO;
	private LikeBO likeBO;
	

	public int addPost(int userId, String content, String userName, MultipartFile file) {

		String filePath = FileManagerService.saveFile(userId, file);

		return postDAO.insertPost(userId, content, userName, filePath);
	}
	
	public List<PostDetail> getPostList(int userId){
		
		List<Post> postList = postDAO.selectPostList();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		
		
		  
		for(Post post:postList) {
			// 해당하는 post id로 댓글 가져오기 
			List<Comment> commentList = commentBO.getCommentList(post.getId());
			
			int likeCount = likeBO.getLikeCount(post.getId());
			boolean isLike = likeBO.isLike(post.getId(), userId);
			
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setCommentList(commentList);
			postDetail.setLikeCount(likeCount);
			postDetail.setLike(isLike);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	
		//return postDAO.selectPostList();
	}	
	
	public int deletePost(int postId,int userId) {
		
		Post post = postDAO.selectPost(postId);
		if(post.getUserId() != userId) {
			return 0;
		}
		
		//좋아요 삭제
		likeBO.deleteLikeByPostId(postId);
		//댓글 삭제
		commentBO.deleteComment(postId);
		
		//파일 삭제
		//Post post = postDAO.selectPost(postId);
		FileManagerService.removeFile(post.getImagePath());
		//포스트 삭제
		return postDAO.deletePost(postId);
	}

	
	
	
	
	
	
	
}
