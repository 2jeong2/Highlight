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
import com.jcm.highlight.post.model.Post;
import com.jcm.highlight.post.model.PostDetail;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	private CommentBO commentBO;

	public int addPost(int userId, String content, String userName, MultipartFile file) {

		String filePath = FileManagerService.saveFile(userId, file);

		return postDAO.insertPost(userId, content, userName, filePath);
	}

	
	/*public List<Post> getPostList(int userId){
	 
	List<Post> postList = postDAO.selectPostList();
	List<PostDetail> postDetailList = new ArrayList<>();
	
	
	
	
	return postDetailList; 
	}*/
	 
}
